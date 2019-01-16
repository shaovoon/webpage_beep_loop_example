<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SoundMgrBeepLoop._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- http://www.schillmania.com/projects/soundmanager2/doc/getstarted/ -->
    <script type="text/javascript" src="script/soundmanager2-nodebug-jsmin.js"></script>
    <script type="text/javascript">
        var alarm = null;
        var stop = false;
        soundManager.setup({
            url: '/swf/',
            flashVersion: 9, // optional: shiny features (default = 8)
            // optional: ignore Flash where possible, use 100% HTML5 mode
            preferFlash: false,
            onready: function () {
                // Ready to use; soundManager.createSound() etc. can now be called.
                alarm = soundManager.createSound(
                    {
                        id: 'mySound',
                        url: '/Beep.mp3',
                        autoLoad: true,
                        autoPlay: false,
                        onload: function () {
                            //alert('The sound ' + this.id + ' loaded!');
                            //loopSound(s);
                        },
                        volume: 50
                    });
            }
        });

        function loopSound(sound) {
            if (sound === null)
                return;
            sound.play({
                onfinish: function () {
                if(stop==false)
                    loopSound(sound);
                }
            });
        }

        function playSound() {
            stop = false;
            loopSound(alarm);
        }

        function stopSound() {
            stop = true; // stop looping
            if(alarm!==null)
				alarm.stop();
        }
        
    </script>
    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
            <button id="btnPlay" onclick="playSound(); return false;">Play Sound</button>
            <button id="btnStop" onclick="stopSound(); return false;">Stop Sound</button>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
