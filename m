Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100796;
	b=5nzTxIztbINNgiS5wiq/wsGLDrOdJtHMYdxOUSKrcLuHstzvlBJPTUVsInkP09bOtrki
	 iQ3hMPatrYtYWgBzhuM1lsXp2bOKvoZVVb7+f8S0XX3dyLkEaIcFaZFWesxsNLcJ+vYkK
	 jIMTvv4OJP1qX2nVvgcSBwjTnYKHLqLDqjQkff69a1ucfMYvF/9t8V2FQBpr94iJMRxIn
	 g/1N9EL67qxQF1GPhEdZHJTLHveOO3CVmVqpjEfwTNzALnZ68s+BMvLaAlinuhzsytTS8
	 bDF/9gWQz8S9h0uX9N06yso4yDHGA69HIND0fyRriCXDoxESx590ugLt96W/XBc3+lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hgHpO/GSAfi6i+M1tK7tkY4nBaIZNu/5SYPs94b2CqA=;
	b=G4b0JayIwNdpB3K4o8Y09YGt6vQsreJm/csjW2Qt0bvQIPRQyiy5m6cmxUa+LCqeHPiS
	 MerIjWEeUTZEtsnMWmGMxdxv1lTZnlRfJ9jBsAfWtneq2rYe3IJ4Z93JfRK+EbSbrEieD
	 mMFsDkiaDwSdMXa/zC6pJNymfHVqs+MqHDR12w+cxqVhrXdBjPSsWNAam8AcVC3iygBcX
	 QrPo7zHT95q9GFFjBxn7PgjFUncmtnvbqw6UpaYu7OFvyHXstCfPqddtFpx0Sa1Wxj/8l
	 4yM2K51kgFeccqtizaCbbG5aZZCdssIx8M0hG7ESEW0MgMjXVBU+BxXxip8+KEnuyyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AUtqdTko;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C642360A261F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C642360A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AUtqdTko
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so2971192a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100795; x=1793705595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hgHpO/GSAfi6i+M1tK7tkY4nBaIZNu/5SYPs94b2CqA=;
        b=AUtqdTkobi1npBiXtOCqfBIKPW5Rxh4ASGjdlkVqKqmA2aDnYAI+XjN+vfEPxkCtV0
         chRRLwjzxP72Z2PMGvWVo1cZfgd00fogv8DlnO9J/bf+epTNOmlVmsHd/HLfPvMT8G/9
         6hDLEMuifopPl1Ef21m/G2siLaJX6yQcaEtoPm4FciObVMrX8GuR/NlZuR6ZrgCmRGgg
         y1P2wilJJoTcWzZLVZz76mVl5m853IkuO1YiagYOd4BddnDB0cZkK99E/Nb3fNjPlu5C
         xkkFGqP1m1SKgNEeTGAgt7MxOquBd0HzswhBxb3nFX+WzEVh2+foXOTqmr3IWF2JPNa9
         uGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100795; x=1793705595;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgHpO/GSAfi6i+M1tK7tkY4nBaIZNu/5SYPs94b2CqA=;
        b=voXijHKNSib94uRkkPasbP4NI3uad/JJ5rU0QowqcS+BXLDqCsYAmNRsy6gFcKx1uS
         gbg0IFqKgRPNrK/IHeJFir13MwDQfF8YtwRU+knr4eB8ZCMzZs7YnWkStcvY+hl9+Cz6
         CiDRsEoSzA/fokcTLkgVQ1hFdg06cTcfB2J9kNmKIwWutEbPjYIXBxBdC0FzLqD02P18
         0HV6YlHWc8jeeOYY6Op3cM52RHEKnuoP5DOvKamEokwnZieAPkFLPYcnoC97h4zjtVN5
         Yvbnf+rb7biq2iFF8MogIAHPAUZZ4n0CeFc6Or23DhSZrtMvUVYpFFH/H7jShEXvLPsT
         ylyg==
X-Forwarded-Encrypted: i=1; AKwUvBzoz5lZTjkPM+JgtpxRfSAM3j7N0fICngygoUv4I0+hq6NvRzCLelOjKfl/Ej57IXf/CObeUBKJV1ollX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5JZWSsPIuX/tNGTKoQ60Z2B1SSnMsEX1JJh6x9E8/tbZR6Lk3
	EqTzLHGRdDAIS6c+mtcW5Ptn+2u0YlrVaU6jm/mO8X62pOh+tbDWEgi7
X-Gm-Gg: AYBFou2daroNfXM3aTd8M/sGqPT+5X6POhnNKO9u8XWs3sOtb+JLWsB9m+cB0GvNwZ2
	VEPA/PsHmUkoX7FF/kP15Svwt+vdQqjobAe06VO9tYvImNNJYKSeK42Hka/Jy4PrvvTUSNAh3Fv
	oecqJsO01WOxQxHrLCYggKxOkB9/ixvshPHhA6wtpaEAY1aQbA1FAyLHUXYV51q0JXkvVwk5NGD
	I8KzJiITvf1mi1/qReIgVVB4Oz9rnllunmovp5oLP6TNY+hWagYT88vtVK4m2SxNgqddTIDrEyi
	dDlRz/7LXlsjQPqtoSd47at98hon7Gzz0Azu9QMb83q8MLT/PCTxJao3AA5/u4hRohntOmXKR1+
	MTJAlF7BS4dimGTKZxNviPTnYWXDLnZWD3thcr/Stthf6lfpUXuudDa1ylbAyjNBVWhnpxDqQJQ
	f/HGdtv4/hPM3cO9YhlNwbQEpyc/TBDGGFFuUJG9syc+L2ZWOEUoal8Ky6gzL48g62NQ6y+CI08
	S+WL2MLTVH1zQXs5BDAVnUF44giOefmio6xp50/zbNzVCBKyYms5rbW/PLUsXDhyceEtJZ2bL/9
	pia6XifL3tKrwZE4talCJQlOrKArUJnT2XdmR00coVfG2c3bBmx93PDKJvKSPom3UbopiszPTMU
	=
X-Received: by 2002:a17:90b:3bcf:b0:3ac:7377:fd48 with SMTP id 98e67ed59e1d1-3adeafc81abmr7873662a91.56.1793100794868;
        Tue, 27 Oct 2026 04:33:14 -0700 (PDT)
Received: from cachyos (2a01cb0c82caf900a186612f304bfea5.ipv6.abo.wanadoo.fr. [2a01:cb0c:82ca:f900:a186:612f:304b:fea5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4041fafcsm4523962a91.0.2026.10.27.04.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:33:14 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [PATCH v7 8/8] Documentation: sound: add the Babyface Pro proprietary-mode design doc
Date: Tue, 27 Oct 2026 12:31:39 +0100
Message-ID: <20261027113140.134257-9-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027113140.134257-1-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A big-picture companion to the patch series, for human reviewers:
why the proprietary mode needs a standalone driver instead of a
snd-usb-audio quirk, the vendor protocol's write-only/no-readback
shape and what that forces onto the driver, the stream session
model, why the mixer state has to be cached and replayed, and why
the driver has to emulate TotalMix's own role for the front panel.

Requested by Takashi Iwai's v4 review: documentation for reviewers,
not restating what the code comments already say inline.

Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
---
 Documentation/sound/cards/babyface-pro.rst | 218 +++++++++++++++++++++
 Documentation/sound/cards/index.rst        |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 Documentation/sound/cards/babyface-pro.rst

diff --git a/Documentation/sound/cards/babyface-pro.rst b/Documentation/sound/cards/babyface-pro.rst
new file mode 100644
index 000000000..2b79a52d9
--- /dev/null
+++ b/Documentation/sound/cards/babyface-pro.rst
@@ -0,0 +1,218 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================================
+RME Babyface Pro / Pro FS (snd-usb-babyface-pro)
+=================================================
+
+This document describes the design of the ``snd-usb-babyface-pro``
+driver - what problem the driver solves, why it is a standalone
+driver instead of a snd-usb-audio quirk, and the four design
+decisions (protocol shape, stream model, mixer state across re-probes
+and resume, front-panel emulation) that shape most of the code.
+
+Two USB personalities, one device
+==================================
+
+The RME Babyface Pro and Babyface Pro FS present two different USB
+configurations depending on a physical/firmware switch: a
+class-compliant one, already handled by ``snd-usb-audio``, and a
+proprietary one (USB ID ``2a39:3fc0``) that this driver covers.  The
+two hardware models share the same USB ID, ``bcdDevice`` and
+``iProduct`` string shape; nothing in the descriptors tells them
+apart, and the driver runs unmodified on both.
+
+In proprietary mode, interface 5 carries the PCM stream on two
+INTERRUPT endpoints (``0x01`` OUT, ``0x82`` IN) instead of the
+isochronous endpoints the USB Audio Class specifies.  Isochronous
+transfers are rejected there with ``-EINVAL``.  ``snd-usb-audio`` has
+no interrupt-PCM transport, so this mode cannot be a quirk on top of
+it; the driver is standalone, modelled on ``snd-usb-caiaq`` (another
+interrupt-streaming RME/NI-style device).
+
+Why interrupt endpoints and not isochronous is a hardware/firmware
+choice on RME's side, not something this driver can change - the
+class-compliant mode already exists on the same device for users who
+want a fully standard, quirk-free path with a subset of the
+functionality (no mixer, no front panel).  This driver is for users
+who want the full mixer, routing matrix, and hardware DSP EQ that
+only the proprietary mode exposes.
+
+The vendor protocol: writes only, no readback
+==============================================
+
+Every mixer and clock function is one of a handful of USB vendor
+control requests (``bmRequestType 0x40``, i.e. host-to-device,
+vendor, device-recipient), each identified by its request number and
+a 16-bit value/index pair - there is no larger command structure.
+The commonly used ones are:
+
+======  ========================================
+0x10    settings word, rate family, stream trigger
+0x12    16-bit crosspoint and output-master writes
+0x14    stream session arm
+0x16    cold-init register clear
+0x17    front-panel + preamp state (read and write)
+0x1a    8-bit gain / output-master writes
+0x1b    varispeed (DDS quad)
+0x1d    stream session start
+======  ========================================
+
+The full register map, decoded from Windows USB captures and
+cross-checked against hardware, lives in the driver's own development
+repository (not shipped in-tree) - the constants and the comments
+next to each vendor write in the source are the authoritative
+in-tree reference.
+
+The one property that shapes the rest of the driver: **almost nothing
+here can be read back**.  The 0x17 request returns the front-panel
+and preamp state, but the crosspoint matrix, the output masters, the
+routing flags and the clock all have to be tracked host-side - the
+device will accept a write blindly and never confirm what it actually
+holds.  Two consequences follow directly from this:
+
+* The ``struct snd_usb_babyface`` device state (see
+  ``babyfacepro.h``) is not a cache in the usual sense of "avoid a
+  slow read" - it is the *only* record of what the hardware should
+  currently hold.  Every mixer control's ``.get`` callback reads this
+  state directly; none of them ever talks to the device.
+
+* A full reset of the device's registers - which the cold init at
+  probe and at resume does - has to be followed by replaying the
+  *entire* cached state back, in the right order, or the card comes
+  back silent or at the wrong levels.  This is what
+  ``babyface_restore_state()`` and ``bf_state_apply_flags()`` do (see
+  "Mixer-state persistence" below).
+
+The stream model
+================
+
+Playback and capture share one physical stream: the device only
+advances it while both interrupt endpoints have a pending URB, so the
+IN and OUT URBs are always submitted as a pair, and both directions run
+at one sample rate.  The driver runs one stream *session* for both
+substreams:
+
+* ``hw_params`` counts a substream as a user of the session;
+* ``prepare`` starts the session if it is not running - the rate write,
+  the session trigger pair, the IN/OUT URBs, then the arm - which is
+  what the RME Windows driver sends at a stream start;
+* trigger START/STOP only decides whether the URB handlers move that
+  substream's audio.  The URBs keep running either way, carrying
+  silence while nothing plays, so an xrun restart does not restart the
+  session;
+* ``hw_free`` drops the user, and the last one stops the session.
+
+The device keeps its mixer registers between sessions, so a session
+start writes no mixer state.  A session triggered within about 15 ms of
+the previous one stopping comes up with the outputs silent, so a
+session start waits until 50 ms have passed since the last stop.
+
+Both directions share one clock, so while another application has the
+other direction set up, the rate belongs to it: ``open()`` offers that
+rate alone, and the sound server resamples, rather than the device
+changing rate under a running stream - as with RME's own drivers, which
+grey the sample rate out while a stream runs.  The application that
+holds both directions may change the rate or the buffer size itself, as
+a DAW does from its settings; the direction it left running then stops
+with an xrun and is set up again.
+
+The size of the URBs follows the period the application asks for, so
+the latency follows the application's buffer instead of a fixed queue:
+``hw_params`` splits the period into the fewest URBs of at most
+``frames_per_urb`` frames, each a whole number of the device's IN
+packets, and keeps two periods' worth in flight (at most ``nurbs``).
+The URB handlers copy to and from the ring the core allocates and take
+the application's position from the shared control page, so the ring can
+also be mapped by the application, which JACK requires.
+``runtime->delay`` reports the audio queued in the URBs plus the fixed
+delay of the converters and of the device, per speed, so that an
+application that uses ALSA directly can line up what it records.
+
+The playback handler copies the ring as it is and moves the pointer on
+by the whole URB, so the pointer follows the device even for an
+application that runs the stream free, as dmix does on the hardware PCM
+it opens; an underrun is the PCM core's to detect and report.
+
+Capture exposes the device's twelve input words in the device's own
+order, one channel per word: AN1-4, AS1/2, then ADAT3-8.  AS1/2 is the
+first optical pair, so it carries ADAT 1/2 when the input receives ADAT
+and S/PDIF when it receives S/PDIF.  At 96/192 kHz the frame has fewer
+words and the channels past them read zero.
+
+URB completions run in interrupt context; the work that needs to sleep
+(stopping the session after repeated URB errors) runs from
+``stream_work``.
+
+Mixer state across re-probes and resume
+=======================================
+
+A userspace client can claim the proprietary interface directly via
+``usbfs`` (``USBDEVFS_DISCONNECT_CLAIM``) - both PipeWire grabbing the
+device for a sink and the project's own TuxMix userspace daemon do
+this via libusb.  That detaches the kernel driver and the ALSA card
+disappears for the duration; when the client releases the interface,
+the driver re-probes.  The cold init the probe runs clears the mixer
+registers, and the driver does not carry its cached state across the
+re-probe: alsactl restores the settings stored at the last shutdown
+once the card is registered again, as for any other card.  A resume
+that follows a device reset goes through ``reset_resume`` instead of a
+re-probe, so a reset does not lose the state that way.
+
+A system suspend does lose the registers.  On resume the driver re-runs
+the cold init and replays the in-memory state (masters, crosspoints,
+routing flags, EQ) through the same paths the controls use.  Since
+almost nothing can be read back (see above), that in-memory state is
+still the only record of what the hardware should hold.
+
+The front-panel SELECT selection is the exception: it is not in the
+0x17 readback, so the driver has to be told it once and cannot know
+whether it changed meanwhile.  The driver tracks whether a unit has
+been probed since the module was loaded.  After a boot it takes the
+values alsactl restores; a re-probe of an already-seen unit ignores
+them and leaves the pairs unknown, because SELECT may have been pressed
+since the last store.  The "Front Panel Selection" controls let
+software correct the selection (see below).
+
+Front-panel emulation: the driver plays TotalMix's role
+==========================================================
+
+The front panel (IN/OUT/SET/MIX/SELECT/DIM buttons, the rotary
+wheel) has no on-device intelligence of its own for turning a wheel
+click into a mixer change - on Windows/Mac, RME's TotalMix
+application polls the same 0x17 status register this driver polls,
+decodes button/wheel deltas, and performs the resulting mixer writes
+itself.  Standalone (no host software) mode exists on the hardware,
+but the proprietary USB mode this driver targets always has a host
+attached, so this driver has to do what TotalMix does: poll 0x17 on
+a delayed work item (``panel_poll_ms`` module parameter, default
+20 ms to match TotalMix's own ~50 Hz), decode the button flash and
+signed wheel delta, and apply the resulting change (an output level
+step, a preamp gain step, a monitoring level step, a phantom toggle)
+exactly like the corresponding ALSA control's ``.put`` would.  A DIM
+press is only counted, for a mixer application to act on.  The
+front-panel ALSA
+controls this driver exposes are the read side of this: a way for
+userspace (WirePlumber, TuxMix) to observe what the physical panel is
+doing, not a way to drive the hardware.
+
+Some panel state - which channel SELECT currently has chosen, for
+instance - is not part of the 0x17 readback at all and exists only on
+the device's own internal state machine, which the driver cannot
+read.  The unit keeps one such selection for each IN pair, across IN
+switches and even across a power cycle; its LEDs stay dark until the
+next SELECT press, which only shows the selection again, and later
+presses step it.  The driver follows the presses and exposes the
+selection of each pair as a "Front Panel Selection" control (index 0
+is Ch 1/2), so that alsactl keeps it across boots like any other
+mixer setting.  It cannot know what the unit holds before it has been
+told once, so a pair starts out unknown, and SET and the wheel then do
+nothing instead of acting on a channel that may not be the lit one;
+setting the control to what the LEDs show for the pair tells it.  The
+values alsactl restores right after a probe are the ones of its last
+store: after a boot that is the newest record there is, but a re-probe
+of a unit already seen may follow SELECT presses made since, so the
+driver ignores them then and leaves the pairs unknown.  The stored
+values can be wrong only if the selection was changed while the driver
+was not running (the unit used on its own, or with another host).  The relevant code
+comments (``babyface_panel_start()``, the ``panel_select_armed``
+handling in ``bf_panel_tick()``) explain the details.
diff --git a/Documentation/sound/cards/index.rst b/Documentation/sound/cards/index.rst
index e68bbb13c..31051b7a4 100644
--- a/Documentation/sound/cards/index.rst
+++ b/Documentation/sound/cards/index.rst
@@ -12,6 +12,7 @@ Card-Specific Information
    emu10k1-jack
    via82xx-mixer
    audiophile-usb
+   babyface-pro
    mixart
    bt87x
    maya44
-- 
2.56.0

