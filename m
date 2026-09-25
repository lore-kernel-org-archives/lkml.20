Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B81B34EEF3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302799; cv=none; b=LB4U92z4K7ElrNlXVA+CLo0rb6LItMP0rSPALhWlmNSj0zg2rs8tad+3CmmpitslhjjUyBseejsGNsKzm6s4PIJ0GZVYh1+Vp3PPWBoSzAy87TAd5jcuUKJLxOYVkXa6NKAUuuO/Md6VIuOE2WKYRsDOkvvJnVWNAswuWWPDomg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302799; c=relaxed/simple;
	bh=B6vl7op9zbKHYfM2leDh1P/fD9N4D1W/EuItS7PCVVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOlUsdKH7UAl+fhxohTzY+uJPBHsaK/+LRufCdTsTr6VROyorpEcVQrlaeLfGDfaBSvKdP3Rt5cT7vF8bS/zxZv6As7JY8R63FoJE0MbNNlg1xVjCtH6+zbDdugiO/kNPyEXVhPOmhJpr39wm6aG0Jx2eLQznHrzWnOj5SeEkmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o62ma6Qw; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o62ma6Qw"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-7856441f7dcso206319137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790302785; x=1790907585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2ewYppMvLxXs2j8O0F9T4myWUXwS+FWH9pKGXFmyPM=;
        b=o62ma6Qw7l96GAm4dMrCDiLEbgA4A5h+spJ/NhrBWBitkgONQ1uZqk8H2b2BDMkBag
         y6Vr1UtzmpG8pCyqKE1E3Y7fcRQTeUlme6r0cI7UDxKrCAV6AnPVOwwzD9nhE1sIqPx3
         nQuRmEE+APiD/uacxNjl9NOJm7OJIMH7StXZJz1mQehciuB39b7/MXCh0P8mluTobeY+
         IVH2UYNcYs1CiM1YyjgPOSw7lM0NBYCagK8OfFgRcYsaGddAOFiWePoerVd4svhWlpdg
         5vg5PP1GbvK5d5X83HKaMWiSnnZBYtxwUXrcwYv4V2GW3hM3jdoask5AespnU3Q5fQ8O
         vrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790302785; x=1790907585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2ewYppMvLxXs2j8O0F9T4myWUXwS+FWH9pKGXFmyPM=;
        b=eiSwaTRHdl4Aj7y39Pr6nF6jvOXz0AD1asrKMzRBNXpQqJzoEFqfl6nSFgwslqtqj9
         zFFElRokeDDj1FF035oJaG9qzQSp8TZMTCgKL8kJV56W/ECgq9e/ciPYFNFskpMcSBwr
         12FCKQQO11MKZSS+l6myjlBhxp0HVOvMAfwB0KeYK3Il2ah0Z5+OH2gXKeMBcoaGsZo2
         8bdUct6hPDgp5EYocZNhOsf2hci0Ylc2I5H4y+S5YkTSvRNnUxCkd0Ql2cHE+zMLqZVI
         GAuvcQoEi+KT1CpncL4JxcFW+NTjtQFzL8NfBCAWaYYxbaXegAAxtQmK6FLJ1yBfL1dG
         s0xw==
X-Forwarded-Encrypted: i=1; AKwUvBzkyyUfsZefqjs0Ydx8C6/laRcL6Ii6E/JKqbgOoHN7W/5o3oM/HyjO5lpdPSMn4jpMykdf4xT9akToyiI=@vger.kernel.org
X-Gm-Message-State: AFuF++kJAR0HTNsMCtC4jiyprsHbZZm4YoVAVXempiwvIFe2F5XcW8bK
	lJKl9ajKyM0MKEuqtcJdqCoD7q12WCwUHTbmrvhUZnwt7XUXoop2sze8
X-Gm-Gg: AYBFou1mKPD1vn1EcamsUHFiI6SEohntm25FL1FmmUHKBv2JfsgyJjoRCEjn0qK09c2
	OTurR8eWQisbx21fQqz0lBQ6TlVJZKkP5zLaVu44F3zatGkE+/LRuZ8NczEoGfpkvU9Y8C2nsed
	c5YilB1wj6R7p79I46Tgu7f7uDedmGCeJDzvwieLSATzw/ofteGTFBA0v5F4UgPh8BeqxUJG1xo
	SS0zEWn7ivgdTSZQwBM6jR4Tv6mI/FendaFs3Z0SjCIRpnMW1gRGvmla9o/3NIpvlFUPBoF64zC
	jxWSfKm16teo6dJ/IfYo6BJHTnLnDX8dA2P/1wvblzNQwaoVW/QHFT5DWcNqjJq7WAAb5KFluVT
	M3/t0WwAZuEmGAIA9q8/JleMnCjmYrkBLeQW6BMKmr0CeWX7xo9vLP7SDDjaWhl6Q16kA+62FaK
	ogmEOh1OOcQc1jWfh9t+uyBKg7yHeceW7jpbXQ8c4onqZQxRAwYmOXo9eqmttSL7vVTGj/+Dg0R
	3dKJ2RaJRAYkHONRiqPm+vl5+Ro+9Il66QlHSzt62p6R/ARmV5pFkvIQ8d+yNHuSCDIMMYgmQ==
X-Received: by 2002:a05:6102:14a3:b0:7a7:7d3c:248c with SMTP id ada2fe7eead31-7af1ce9a854mr2190159137.11.1790302781361;
        Thu, 24 Sep 2026 19:19:41 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b0d01e6f6fsm1427497137.2.2026.09.24.19.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:19:40 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] ALSA: usb: Add support for Reloop Jockey 3 DJ controllers
Date: Thu, 24 Sep 2026 22:19:14 -0400
Message-ID: <20260925021915.78909-2-fvdpol@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925021915.78909-1-fvdpol@gmail.com>
References: <20260925021915.78909-1-fvdpol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for the Reloop Jockey 3 Master Edition and Reloop Jockey 3
Remix USB DJ controllers.

These devices are not USB Audio Class compliant. They use a proprietary
Ploytec framing protocol, which needs handling beyond what the existing
quirk mechanisms can express, so the driver lives in its own directory
rather than extending usb-audio.

The driver provides:
 - 6-channel capture and 4-channel playback at 24 bits.
 - Sample rates of 44.1, 48, 88.2 and 96 kHz.
 - ALSA RawMIDI input and output for the integrated control surface.

The Ploytec encapsulation and bit-plane streaming format were
reverse-engineered from USB protocol analysis. They are isolated in a
hardware-independent codec layer with 32-bit and 64-bit optimized
variants alongside a portable reference implementation, all three
validated against KUnit tests.

Tested on real hardware on x86_64, i386, arm64 and armhf.

Assisted-by: Claude:claude-sonnet-5
Assisted-by: Claude:claude-opus-5
Assisted-by: Gemini:gemini-3.5-flash
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 Documentation/sound/cards/index.rst           |    1 +
 Documentation/sound/cards/jockey3.rst         |  249 +
 MAINTAINERS                                   |    8 +
 sound/usb/Kconfig                             |    1 +
 sound/usb/Makefile                            |    1 +
 sound/usb/jockey3/.kunitconfig                |   13 +
 sound/usb/jockey3/Kconfig                     |   60 +
 sound/usb/jockey3/Makefile                    |    7 +
 sound/usb/jockey3/jockey3.c                   | 4060 +++++++++++++++++
 sound/usb/jockey3/ploytec_codec.c             |  656 +++
 sound/usb/jockey3/ploytec_codec.h             |   44 +
 sound/usb/jockey3/ploytec_codec_kunit.c       |  871 ++++
 .../usb/jockey3/ploytec_codec_test_vectors.h  |  793 ++++
 sound/usb/jockey3/ploytec_midi.c              |   83 +
 sound/usb/jockey3/ploytec_midi.h              |   36 +
 sound/usb/jockey3/ploytec_proto.c             |  365 ++
 sound/usb/jockey3/ploytec_proto.h             |   78 +
 17 files changed, 7326 insertions(+)
 create mode 100644 Documentation/sound/cards/jockey3.rst
 create mode 100644 sound/usb/jockey3/.kunitconfig
 create mode 100644 sound/usb/jockey3/Kconfig
 create mode 100644 sound/usb/jockey3/Makefile
 create mode 100644 sound/usb/jockey3/jockey3.c
 create mode 100644 sound/usb/jockey3/ploytec_codec.c
 create mode 100644 sound/usb/jockey3/ploytec_codec.h
 create mode 100644 sound/usb/jockey3/ploytec_codec_kunit.c
 create mode 100644 sound/usb/jockey3/ploytec_codec_test_vectors.h
 create mode 100644 sound/usb/jockey3/ploytec_midi.c
 create mode 100644 sound/usb/jockey3/ploytec_midi.h
 create mode 100644 sound/usb/jockey3/ploytec_proto.c
 create mode 100644 sound/usb/jockey3/ploytec_proto.h

diff --git a/Documentation/sound/cards/index.rst b/Documentation/sound/cards/index.rst
index e68bbb13c384b..7afea6fa88bff 100644
--- a/Documentation/sound/cards/index.rst
+++ b/Documentation/sound/cards/index.rst
@@ -18,4 +18,5 @@ Card-Specific Information
    hdspm
    serial-u16550
    img-spdif-in
+   jockey3
    pcmtest
diff --git a/Documentation/sound/cards/jockey3.rst b/Documentation/sound/cards/jockey3.rst
new file mode 100644
index 0000000000000..8fd65db9316cf
--- /dev/null
+++ b/Documentation/sound/cards/jockey3.rst
@@ -0,0 +1,249 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+Reloop Jockey 3 DJ Controller Driver
+=========================================
+
+The ``snd-reloop-jockey3`` driver supports the Reloop Jockey 3 family of USB DJ
+controllers. These devices do not implement USB Audio Class; they use a
+proprietary protocol from Ploytec GmbH, which this driver implements from
+reverse engineering.
+
+Supported devices
+=================
+
+=================================  ===========  =========
+Device                             VID:PID      Status
+=================================  ===========  =========
+Reloop Jockey 3 Remix              200c:1037    Tested
+Reloop Jockey 3 Master Edition     200c:1019    Tested
+=================================  ===========  =========
+
+The Master Edition is confirmed to be protocol-compatible. The driver author
+does not own one, but user feedback on the Master Edition has been received
+confirming the device is fully functional with this driver.
+
+Audio
+=====
+
+The device provides 4 playback and 6 capture channels, all S24_3LE, at 44.1,
+48, 88.2 or 96 kHz. The sample rate is a device-wide property: if one stream is
+already running, a second stream opening is constrained to the rate in use.
+
+Channel layout
+--------------
+
+Playback:
+
+=======  ==========================
+Channel  Signal
+=======  ==========================
+1-2      Master Out L/R
+3-4      Headphone (cue) L/R
+=======  ==========================
+
+Capture:
+
+=======  ==========================
+Channel  Signal
+=======  ==========================
+1-2      Input 1 L/R
+3-4      Input 2 L/R
+5-6      Microphone
+=======  ==========================
+
+The line inputs are only routed to the ADC when the input selector on the unit
+is in the ``SW`` (software) position.
+
+The microphone is **mono**. Its balanced input stage feeds the same analog
+signal to both converters, so channels 5 and 6 carry identical content -- though
+not bit-identical, since each has its own ADC and picks up independent
+converter noise. Applications may treat the pair as a stereo stream with mono
+content, or simply use one of the two channels.
+
+The channel map advertised to userspace marks only the playback Master pair as
+``FL``/``FR``, so that audio servers can identify the primary output. The
+remaining pairs are reported as ``UNKNOWN``: they are discrete inputs and
+outputs rather than a speaker arrangement, and giving them surround positions
+would invite applications to route, for example, the headphone cue output to
+rear speakers.
+
+Microphone level
+----------------
+
+The microphone level appears to be quieter than when using the vendor
+software. The ADC is a PCM1803A with fixed gain, and the only gain control in
+the signal path is analog, so any additional gain must be applied digitally
+somewhere in the vendor stack; whether that happens in the driver or in the
+application has not been established. This driver applies no digital gain of
+its own, so apply it in userspace if required.
+
+MIDI
+====
+
+The control surface is exposed as a standard ALSA rawmidi device, with input
+and output ports.
+
+MIDI output is multiplexed into the audio playback stream: every outgoing
+packet reserves one byte for MIDI. As a result the playback URBs run
+continuously whether or not any PCM stream is open, and MIDI output throughput
+is bounded by the packet rate. The driver rate-limits MIDI output to roughly
+2500 bytes/sec, as the device otherwise overruns its internal buffers,
+truncates messages, and/or the control surface becomes unresponsive.
+
+The device does not accept MIDI Running Status, so the driver expands the
+outgoing stream to give every message an explicit status byte.
+
+Stream liveness and recovery
+============================
+
+Changing the sample rate requires stopping the URBs, reprogramming the device
+over the control endpoint, and restarting them. During testing and
+validation, cases have been observed where one of the USB streams failed to
+start or stalled afterwards -- the control transfers reported success, but
+the endpoint delivered no data, which surfaces to applications as ``EIO`` on
+the affected direction. The driver guards against this:
+
+* After every rate change, and whenever a stream is prepared, each direction
+  is checked for liveness by watching for URB completion activity.
+
+* A stalled direction is first recovered with a lightweight URB stop/restart.
+  If that does not bring it back, recovery escalates to a full USB device
+  reset, subject to a bounded retry budget: a chip-wide limit on how many
+  resets may be attempted within a rolling time window, so a persistently
+  misbehaving device is reported instead of being reset in a tight loop.
+
+* Playback also carries MIDI output, so a playback stall is always recovered
+  immediately through this path.
+
+* A capture stall is recovered immediately the same way only if a capture
+  stream is currently open. Otherwise it is left alone at that moment, to
+  avoid an audible reset glitch on working playback audio for the sake of a
+  direction nobody is using; the same liveness check and recovery catch it
+  the next time a capture stream is opened instead.
+
+A stall that triggers immediate recovery is logged with ``dev_warn()``; a
+stall on an idle, unused capture endpoint whose recovery is deferred is
+logged at ``dev_dbg()`` instead, since it is an expected, tolerated state
+rather than something acted on right away. Recovery outcomes -- a successful
+URB restart, an escalated reset, an exhausted retry budget, or a stream still
+dead after a reset -- are always logged with ``dev_warn()`` or ``dev_err()``,
+so real-world frequency and severity can be tracked via ``dmesg``.
+
+URB liveness watchdog
+=====================
+
+The checks above run at specific moments: after a rate change, and when a stream
+is prepared. A device that stops completing URBs at any other time is invisible
+to them, and to every other error path in the driver, because all of those hang
+off a URB completion. When completions stop, nothing runs and nothing is logged.
+A playback stream in that state does not even report an underrun, since the
+hardware pointer never advances far enough to overtake the application.
+
+A periodic work item therefore checks both directions for liveness for as long
+as the device is bound. It runs over the device's whole lifetime rather than
+only while a PCM stream is open, because the URBs do too: MIDI output is carried
+in every playback packet, so there is no idle state in which a total absence of
+completions is legitimate.
+
+The watchdog acts as well as reports. A new stall onset enters the same
+recovery ladder described above -- a lightweight URB stop/start, escalating to
+a full device reset if that does not take. This is the only place recovery can
+begin without a PCM ioctl re-entering the driver first, which matters because a
+long-running, uninterrupted stream never re-enters otherwise. Escalation to a
+reset is drawn from a chip-wide bounded budget, so a device that keeps stalling
+is not reset in a tight loop, and only one recovery ladder runs at a time.
+
+Logging is edge-triggered: one line when a direction stops completing URBs, one
+when it starts again, with nothing repeated in between. The message carries the
+measured age of the stall rather than a fixed threshold, since the threshold
+alone would only bound it to the width of one poll interval.
+
+An idle, unused capture endpoint stalling is the one case the driver
+deliberately tolerates without treating it as a fault: recovery for it is
+deferred to the next capture open, as described above, so it can persist
+indefinitely with nothing wrong. Every other persistent stall means recovery
+did not succeed, and the ``dev_err()`` logged for an exhausted retry budget
+or a stream still dead after a reset should already explain why.
+
+Module parameters
+=================
+
+The driver takes the standard ALSA ``index``, ``id`` and ``enable`` parameters.
+
+Kconfig
+=======
+
+``CONFIG_SND_USB_JOCKEY3``
+    Build the driver.
+
+``CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC``
+    Use the portable reference implementation of the sample codec instead of
+    the architecture-optimized one. The optimized codec is the default and is
+    what should normally be used; the reference implementation is much slower,
+    and exists as a readable definition of the wire format and as a fallback.
+    This option depends on ``CONFIG_EXPERT``.
+
+``CONFIG_SND_USB_JOCKEY3_CODEC_KUNIT_TEST``
+    Build the KUnit tests for the sample codec. Because the codec functions
+    are internal to the driver, the tests are linked into the driver module
+    rather than built as a separate one. See `Testing`_ below.
+
+Testing
+=======
+
+The sample codec has KUnit coverage. It is worth running after any change to
+``ploytec_codec.c``, and on any architecture the optimized codec has not been
+exercised on before::
+
+    tools/testing/kunit/kunit.py run --kunitconfig=sound/usb/jockey3 \
+        --arch=x86_64
+
+Running under UML needs three extra options::
+
+    tools/testing/kunit/kunit.py run --kunitconfig=sound/usb/jockey3 \
+        --kconfig_add CONFIG_VIRTIO=y \
+        --kconfig_add CONFIG_VIRTIO_UML=y \
+        --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
+
+UML disables IOMEM by default, which puts ``CONFIG_USB`` - and with it the
+whole of ``sound/usb`` - out of reach. ``UML_PCI_OVER_VIRTIO`` selects
+``UML_PCI``, which brings in the IOMEM emulation that makes it selectable
+again. These are passed on the command line rather than placed in
+``.kunitconfig`` because they only exist under ``arch/um``, and kunit.py
+treats a requested option it cannot satisfy as an error - so putting them in
+the shared fragment would break configuration on every other architecture.
+
+Other architectures run under QEMU, which is the point of the exercise: the
+codec assumes a little-endian sample format and reaches for 32- and 64-bit
+words through the unaligned accessors, so word size, alignment strictness and
+byte order all matter::
+
+    tools/testing/kunit/kunit.py run --kunitconfig=sound/usb/jockey3 \
+        --arch=arm --cross_compile=arm-linux-gnueabihf-
+
+s390 is worth a run as the only readily available big-endian target, and needs
+``--kconfig_add CONFIG_PCI=y``: on s390 ``HAS_IOMEM`` is ``def_bool PCI``, so
+without it there is no sound subsystem to build against.
+
+The suite has been run on um, i386, arm, arm64, riscv and s390.
+
+Only one of the three codec variants is compiled into any given build, so the
+portable reference deserves a run of its own::
+
+    tools/testing/kunit/kunit.py run --kunitconfig=sound/usb/jockey3 \
+        --kconfig_add CONFIG_EXPERT=y \
+        --kconfig_add CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC=y
+
+The tests check the compiled-in variant against a declarative description of
+the wire format rather than against a second copy of the same loops. They also
+exploit the fact that the codec is a bit permutation, and therefore linear over
+GF(2): one case enumerates the mapping's action on every input bit, another
+establishes linearity, and a linear map is fully determined by its action on
+the basis vectors.
+
+Further information
+===================
+
+Protocol notes, USB captures and ongoing reverse-engineering work are kept at
+https://github.com/fvdpol/alsa-jockey3.
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9..075c128bbd95c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23058,6 +23058,14 @@ F:	Documentation/filesystems/relay.rst
 F:	include/linux/relay.h
 F:	kernel/relay.c
 
+RELOOP JOCKEY 3 DJ CONTROLLER DRIVER
+M:	Frank van de Pol <fvdpol@gmail.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+W:	https://github.com/fvdpol/alsa-jockey3
+F:	Documentation/sound/cards/jockey3.rst
+F:	sound/usb/jockey3/
+
 REGISTER MAP ABSTRACTION
 M:	Mark Brown <broonie@kernel.org>
 L:	linux-kernel@vger.kernel.org
diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index b4588915efa11..d7edfbaf099be 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -205,6 +205,7 @@ config SND_USB_AUDIO_QMI
 	  will be called snd-usb-audio-qmi.
 
 source "sound/usb/line6/Kconfig"
+source "sound/usb/jockey3/Kconfig"
 
 endif	# SND_USB
 
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index e62794a87e73a..1f045c00dbc98 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
 
 obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
 obj-$(CONFIG_SND_USB_LINE6)	+= line6/
+obj-$(CONFIG_SND_USB_JOCKEY3) += jockey3/
diff --git a/sound/usb/jockey3/.kunitconfig b/sound/usb/jockey3/.kunitconfig
new file mode 100644
index 0000000000000..a9681c891f096
--- /dev/null
+++ b/sound/usb/jockey3/.kunitconfig
@@ -0,0 +1,13 @@
+CONFIG_KUNIT=y
+
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_PCM=y
+CONFIG_SND_RAWMIDI=y
+
+CONFIG_USB_SUPPORT=y
+CONFIG_USB=y
+CONFIG_SND_USB=y
+
+CONFIG_SND_USB_JOCKEY3=y
+CONFIG_SND_USB_JOCKEY3_CODEC_KUNIT_TEST=y
diff --git a/sound/usb/jockey3/Kconfig b/sound/usb/jockey3/Kconfig
new file mode 100644
index 0000000000000..4b40a962417dd
--- /dev/null
+++ b/sound/usb/jockey3/Kconfig
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config SND_USB_JOCKEY3
+	tristate "Reloop Jockey 3 support"
+	select SND_PCM
+	select SND_RAWMIDI
+	help
+	  Say Y here to include support for the Reloop Jockey 3 DJ controllers.
+	  These devices utilize a non-standard, proprietary Ploytec USB
+	  protocol.
+
+	  Supported devices:
+
+	    * Reloop Jockey 3 Master Edition
+	    * Reloop Jockey 3 Remix
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-reloop-jockey3.
+
+config SND_USB_JOCKEY3_REFERENCE_CODEC
+	bool "Use portable reference codec implementation"
+	depends on SND_USB_JOCKEY3
+	depends on EXPERT
+	help
+	  The Jockey 3 driver normally uses an architecture-optimized
+	  bit-packing codec (separate 32-bit and 64-bit variants) to convert
+	  between ALSA's S24_3LE sample format and the Ploytec wire format.
+	  This is the default on all architectures.
+
+	  Say Y to build the driver with the portable reference
+	  implementation instead. It is much slower, and is intended as a
+	  readable definition of the wire format and as a fallback on
+	  architectures where the optimized codec has not been exercised.
+
+	  If unsure, say N.
+
+config SND_USB_JOCKEY3_CODEC_KUNIT_TEST
+	bool "KUnit tests for the Ploytec codec" if !KUNIT_ALL_TESTS
+	depends on SND_USB_JOCKEY3
+	depends on KUNIT
+	depends on KUNIT=y || SND_USB_JOCKEY3=m
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit tests for the Ploytec bit-plane encoder and decoder.
+	  The tests validate whichever codec variant the build selected
+	  against a declarative description of the wire format, and prove
+	  the mapping is a complete bit permutation.
+
+	  Because the codec functions are internal to the driver, the tests
+	  are linked into the snd-reloop-jockey3 module itself rather than
+	  built separately.
+
+	  KUnit tests run during boot and output the results to the debug
+	  log in TAP format (https://testanything.org/). Only useful for
+	  kernel devs running KUnit test harness and are not for inclusion
+	  into a production build.
+
+	  For more information on KUnit and unit tests in general, refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
diff --git a/sound/usb/jockey3/Makefile b/sound/usb/jockey3/Makefile
new file mode 100644
index 0000000000000..3f339608f4d23
--- /dev/null
+++ b/sound/usb/jockey3/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_SND_USB_JOCKEY3) += snd-reloop-jockey3.o
+snd-reloop-jockey3-y := jockey3.o ploytec_proto.o ploytec_codec.o ploytec_midi.o
+
+# The codec functions are not exported, so the KUnit tests are
+# linked into the driver module rather than built as a separate test module.
+snd-reloop-jockey3-$(CONFIG_SND_USB_JOCKEY3_CODEC_KUNIT_TEST) += ploytec_codec_kunit.o
\ No newline at end of file
diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
new file mode 100644
index 0000000000000..c7596428bb282
--- /dev/null
+++ b/sound/usb/jockey3/jockey3.c
@@ -0,0 +1,4060 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/types.h>
+#include <linux/atomic.h>
+#include <linux/module.h>
+#include <linux/usb.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/bitops.h>
+#include <linux/log2.h>
+#include <linux/timekeeping.h>
+#include <linux/completion.h>
+#include <linux/mutex.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <linux/cleanup.h>
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <sound/rawmidi.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include "ploytec_proto.h"
+#include "ploytec_codec.h"
+#include "ploytec_midi.h"
+
+#define RELOOP_VENDOR_ID         0x200c
+#define RELOOP_JOCKEY3_ME_PID    0x1019
+#define RELOOP_JOCKEY3_REMIX_PID 0x1037
+
+enum { JOCKEY3_ME, JOCKEY3_REMIX };
+#define CARD_NAME "Reloop Jockey 3"
+
+/* Human-readable edition name for a usb_device_id.driver_info value. */
+static const char *jockey3_model_name(int model)
+{
+	switch (model) {
+	case JOCKEY3_ME:
+		return "Master Edition";
+	case JOCKEY3_REMIX:
+		return "Remix";
+	default:
+		return "Unknown";
+	}
+}
+
+static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
+static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
+static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
+
+module_param_array(index, int, NULL, 0444);
+MODULE_PARM_DESC(index, "Index value for " CARD_NAME " soundcard.");
+module_param_array(id, charp, NULL, 0444);
+MODULE_PARM_DESC(id, "ID string for " CARD_NAME " soundcard.");
+module_param_array(enable, bool, NULL, 0444);
+MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
+
+/**
+ * DOC: Reverse-engineering references
+ *
+ * Comments below cite documents by paths beginning "re/". Those are the
+ * reverse-engineering notes this driver was derived from -- USB protocol
+ * analysis, vendor trace comparisons and the experiments behind several of the
+ * timing constants. They are not part of the kernel tree: they live in the
+ * driver's development repository, linked from its MAINTAINERS entry.
+ */
+
+/**
+ * DOC: Device model
+ *
+ * The Reloop Jockey 3 presents two USB interfaces and speaks a proprietary
+ * Ploytec protocol rather than USB Audio Class. Interface 0 is claimed by
+ * probe(); interface 1 is claimed explicitly, as it owns the capture endpoint.
+ * Three bulk endpoints carry everything:
+ *
+ * - EP 0x05 OUT: PCM playback, with the MIDI OUT byte stream multiplexed into
+ *   a reserved slot of every packet (see PLOYTEC_MIDI_OUT_OFFSET)
+ * - EP 0x86 IN:  PCM capture
+ * - EP 0x83 IN:  MIDI input
+ *
+ * Audio is not sample-interleaved but bit-plane interleaved; see
+ * ploytec_codec.c for the wire format and the encode/decode implementations.
+ *
+ * URBs run free for the lifetime of the device rather than being started and
+ * stopped around PCM use: the playback stream must keep flowing because it
+ * carries MIDI OUT, and the device expects a continuous packet stream. The PCM
+ * callbacks therefore only toggle whether a URB's payload is filled from (or
+ * copied to) an ALSA buffer.
+ *
+ * A sample-rate change requires tearing the URBs down, reprogramming the
+ * device over EP0, and starting them again. jockey3_pcm_hw_params() checks
+ * URB liveness on both directions afterward and recovers if either did not
+ * restart; see the comment there for what that covers and why.
+ *
+ * A stall can also be found and recovered mid-stream, with no rate change or
+ * PCM ioctl involved: jockey3_watchdog_work() polls URB liveness for the
+ * device's whole lifetime and calls the same recovery ladder directly on a
+ * new stall onset. See jockey3_watchdog_check() and jockey3_watchdog_arm().
+ */
+
+/**
+ * DOC: Resource lifetime
+ *
+ * The card is created with snd_card_new(), not snd_devm_card_new(), and
+ * released by jockey3_disconnect() with snd_card_free_when_closed(). A managed
+ * card would instead be freed from the devres unwind inside
+ * usb_unbind_interface(), where snd_card_free() blocks until userspace has
+ * closed every file descriptor on the card -- on an unplug that unwind runs on
+ * the USB hub work queue, so a single process sitting on a PCM fd would stall
+ * hotplug for the whole hub. Every other USB sound driver in the tree avoids
+ * that the same way.
+ *
+ * That splits teardown in two, and the split is the thing to keep straight:
+ *
+ * - jockey3_disconnect() does everything that must happen while the device is
+ *   still there: latch JOCKEY3_FLAG_DISCONNECTED (for either interface, since
+ *   the core takes them down one at a time), release anyone waiting on a
+ *   reset, stop the watchdog, kill the URBs, release interface 1, and hand the
+ *   card to snd_card_free_when_closed().
+ *
+ * - jockey3_card_free(), reached through card->private_free once the last file
+ *   descriptor is closed, frees the buffers and URBs, destroys rate_mutex and
+ *   gives the card slot back. It runs arbitrarily long after the disconnect
+ *   and must attempt no USB operation, though the objects themselves stay
+ *   referenced until it returns; see jockey3_free_resources().
+ *
+ * struct jockey3_chip lives in card->private_data, so it is freed with the
+ * card and outlives the USB binding -- which is what makes it safe for an ALSA
+ * callback that is still in flight during an unplug to keep dereferencing it.
+ * Such a callback finds JOCKEY3_FLAG_DISCONNECTED set and returns -ENODEV.
+ *
+ * probe's error path performs the disconnect half by hand and then calls
+ * snd_card_free(); the card is never registered on any path that reaches
+ * there, so the synchronous free cannot block.
+ */
+
+/**
+ * DOC: Locking
+ *
+ * The lock hierarchy is::
+ *
+ *     rate_mutex                     process context only, outermost
+ *       |- playback.lock             IRQ-safe leaf
+ *       |- capture.lock              IRQ-safe leaf
+ *       `- midi_lock                 IRQ-safe leaf
+ *
+ * The three leaf spinlocks are never nested inside one another; anything that
+ * needs more than one takes them in sequence, not nested. rate_mutex is never
+ * taken from atomic context.
+ *
+ * Against the ALSA core the order is::
+ *
+ *     snd_pcm_stream_lock  ->  playback.lock / capture.lock
+ *
+ * which is why the URB completion handlers drop their stream spinlock before
+ * calling snd_pcm_period_elapsed() or snd_pcm_stop_xrun(); both take the
+ * stream lock, and taking it while holding ours would invert the order.
+ *
+ * .trigger and .pointer are called by the core with the stream lock held and
+ * interrupts disabled, so neither may sleep.
+ *
+ * The watchdog work item adds one rule: rate_mutex must never be held across
+ * cancel_delayed_work_sync(&chip->watchdog_work). jockey3_stop_urbs() is called
+ * from inside rate_mutex at four sites, so it disarms with the non-sync
+ * cancel_delayed_work(), which is safe under any lock; a tick that is already
+ * running when the cancel lands re-reads 'stopping' and does nothing. The sync
+ * form appears only in jockey3_disconnect(), in probe's error path and in
+ * jockey3_free_resources(), none of which holds a mutex.
+ *
+ * Because that disarm does not wait, a tick can be parked on rate_mutex while
+ * jockey3_suspend() or jockey3_pre_reset() takes the device down, then wake to
+ * the timestamps they zeroed and read the stream as stalled. So
+ * jockey3_recover_urb_stream() re-tests DISCONNECTED, SUSPENDED and RESETTING
+ * under the mutex and leaves the restart to whichever path is bringing the
+ * device back.
+ *
+ * jockey3_watchdog_work() itself may call jockey3_recover_urb_stream(),
+ * which takes rate_mutex and calls jockey3_stop_urbs() -- i.e. the watchdog's
+ * own tick disarming itself via the non-sync cancel above, which is exactly
+ * the safe case: it never blocks and does not affect the tick already
+ * running. It may also queue a full USB reset; that reset runs on system_wq
+ * (usb_queue_reset_device(), drivers/usb/core/message.c), never
+ * system_long_wq where the watchdog runs, so the two cannot serialize behind
+ * one another, and rate_mutex is dropped before the wait for it, letting
+ * jockey3_pre_reset()/jockey3_post_reset() take the mutex themselves to
+ * complete.
+ *
+ * This also means jockey3_recover_urb_stream() can be entered from two
+ * independent contexts (the watchdog, and a PCM ioctl) for what turns out to
+ * be the same stall. rate_mutex alone does not prevent both from running
+ * their stop/start-or-reset sequence concurrently, since neither holds it for
+ * the whole ladder -- chip->recovery_in_progress (atomic_cmpxchg(), not a
+ * lock, since the second caller must decline rather than block) is what
+ * makes only one such ladder run at a time; see its doc comment.
+ */
+
+#define JOCKEY3_N_URBS 8
+
+/*
+ * Maximum Ploytec packets per URB ("N"), per direction. Several packets are
+ * coalesced into one USB bulk transfer to cut the completion-interrupt rate
+ * (rationale and measurements in re/streaming_overhead.md).
+ *
+ * The live N is not fixed: jockey3_pcm_hw_params() picks it per stream open,
+ * per direction, as the largest power of two that fits the requested period
+ * size, and stores it in struct jockey3_pcm_urb_stream's @n_shift/@n_pkts.
+ * These two values are only the *ceiling* on that choice, and the width the
+ * URB transfer buffers are allocated at (JOCKEY3_*_XFER_SIZE) -- which is why
+ * the ceiling has to be a compile-time constant. Two separate constants, not
+ * one, so the ceiling can be tuned per direction if the firmware ever turns
+ * out to accept coalescing on one direction but not the other.
+ *
+ * Changing the live N never reallocates or tears down the URB ring: only
+ * urb->transfer_buffer_length varies. PLOYTEC_PKT_SIZE (512) is exactly the
+ * USB high-speed bulk max-packet size, so an N x 512 B transfer is
+ * indistinguishable on the wire from N separate 512 B ones; the firmware
+ * cannot tell the two apart. The buffers stay allocated JOCKEY3_*_XFER_SIZE
+ * wide regardless of the N in use.
+ *
+ * A live N of 1 in both directions must be byte-for-byte identical to a
+ * driver without coalescing: every packet loop below is keyed off the live
+ * @n_pkts and degenerates to the original single-packet code path at N=1.
+ */
+#define JOCKEY3_PLAYBACK_N	8
+#define JOCKEY3_CAPTURE_N	8
+
+#define JOCKEY3_PLAYBACK_XFER_SIZE	(JOCKEY3_PLAYBACK_N * PLOYTEC_PKT_SIZE)
+#define JOCKEY3_CAPTURE_XFER_SIZE	(JOCKEY3_CAPTURE_N * PLOYTEC_PKT_SIZE)
+
+/*
+ * jockey3_check_urb_stream_alive()'s liveness window, per direction, scaled
+ * by that direction's own live N (struct jockey3_pcm_urb_stream's @n_shift):
+ * the worst-case URB span scales linearly with N (N packet intervals instead
+ * of one), so scaling the window the same way keeps the same margin against
+ * it at any N instead of eating into a fixed margin as N grows. N is always a
+ * power of two (jockey3_pcm_hw_params() only ever derives one), so this is a
+ * shift rather than a multiply.
+ */
+#define JOCKEY3_LIVENESS_WINDOW_NS(shift)	((u64)NSEC_PER_MSEC << (shift))
+
+/* Consecutive URB transport errors tolerated before a direction is given up on */
+#define JOCKEY3_MAX_URB_ERRORS 8
+
+/*
+ * URB liveness watchdog.
+ *
+ * A healthy stream completes one URB every @n_pkts packet intervals, and a
+ * packet is 226.8 us at 44100 Hz down to 83.3 us at 96000 Hz. So
+ * JOCKEY3_WATCHDOG_STALL_MS of silence is many consecutive missed URBs at any
+ * supported rate and N -- more than scheduling delay or bus contention
+ * produces on a device that is still streaming.
+ *
+ * The threshold is sized against ALSA core's own stall timeout
+ * (wait_for_avail() in sound/core/pcm_lib.c, roughly buffer_size * 1100 / rate
+ * ms), because jockey3_watchdog_check() recovers on this signal and needs
+ * headroom to succeed before the core returns -EIO to userspace itself.
+ * Contrast jockey3_check_urb_stream_alive()'s 1 ms window, which is sampled
+ * repeatedly inside a start grace and need only answer "anything just now?".
+ *
+ * jockey3_watchdog_arm() self-reschedules from the nearer of the two
+ * directions' deadlines, as dev_watchdog() does in net/sched/sch_generic.c.
+ * JOCKEY3_WATCHDOG_POLL_MS is the ceiling, used before either direction has
+ * started; JOCKEY3_WATCHDOG_MIN_POLL_MS the floor, so a confirmed stall is
+ * rechecked tightly rather than waiting out a stale window.
+ */
+#define JOCKEY3_WATCHDOG_POLL_MS	1000
+#define JOCKEY3_WATCHDOG_MIN_POLL_MS	10
+#define JOCKEY3_WATCHDOG_STALL_MS	20
+/*
+ * Bounds and evidence thresholds for the "has this direction reached steady
+ * streaming yet" checks that run over the window from jockey3_start_urbs()
+ * until the device is proven alive -- distinct from JOCKEY3_WATCHDOG_STALL_MS,
+ * which governs silence between two completions on an already-established
+ * stream. The grace duration itself is the runtime-tunable start_grace_ms
+ * (see its comment near the top of the file); these clamp a bad write and
+ * gate what counts as real streaming.
+ *
+ * JOCKEY3_GRACE_MS_MIN is deliberately well above JOCKEY3_WATCHDOG_STALL_MS: a
+ * grace at the stall threshold escalates on scheduling jitter by construction.
+ *
+ * JOCKEY3_HEALTHY_MIN_COMPLETIONS feeds jockey3_stream_streaming_healthy(), the
+ * stricter "did the warm restart actually take" test: a real stream lands
+ * hundreds of completions inside any plausible grace, so requiring a handful,
+ * spread over at least half the time that many URBs need and still arriving,
+ * rejects a trickle of implausibly fast FIFO-drain completions without
+ * rejecting a healthy resume. See that function.
+ */
+#define JOCKEY3_GRACE_MS_MIN		50
+#define JOCKEY3_GRACE_MS_MAX		5000
+#define JOCKEY3_HEALTHY_MIN_COMPLETIONS	4
+
+/*
+ * Bounded-retry budget for jockey3_recover_urb_stream(), chip-wide because the
+ * remedy it escalates to (a full usb_reset_device()) is shared by both
+ * directions -- a per-direction counter would double the effective rate for
+ * no reason. A window re-opens (and the counter resets) the first time the
+ * budget is consulted after JOCKEY3_RECOVERY_WINDOW_MS has passed since the
+ * current one started, so a chip that stops stalling is never left refusing
+ * to recover for the rest of its life.
+ *
+ * The watchdog calls jockey3_recover_urb_stream() directly (see its
+ * report_xrun parameter), and an early xrun report from that call can wake a
+ * concurrent jockey3_pcm_prepare() retry on the same direction before the
+ * watchdog's own call returns. chip->recovery_in_progress (see
+ * jockey3_recover_urb_stream()) makes that concurrent second call decline
+ * outright rather than draw from this budget, so one physical stall still
+ * draws against it at most once.
+ */
+#define JOCKEY3_RECOVERY_MAX_ATTEMPTS	3
+#define JOCKEY3_RECOVERY_WINDOW_MS	60000
+
+/*
+ * Grace period for a PCM direction to reach steady streaming after its URB
+ * ring is (re)started, in milliseconds. Sized well above the worst measured
+ * restart latency rather than tuned close to it: the error cost is
+ * asymmetric, since too long only delays an escalation that was coming
+ * anyway, while too short kills a stream that was merely late.
+ *
+ * Writable at runtime (0644) and read through jockey3_start_grace_ms(),
+ * which clamps to [JOCKEY3_GRACE_MS_MIN, JOCKEY3_GRACE_MS_MAX] so a bad write
+ * cannot drive the grace down to or below the stall threshold.
+ */
+static int start_grace_ms = 200;
+module_param(start_grace_ms, int, 0644);
+MODULE_PARM_DESC(start_grace_ms, "Grace (ms) for PCM to reach steady streaming after its URB ring is (re)started.");
+
+/*
+ * Current start-grace budget in ms, clamped so a runtime write cannot drive
+ * it to or below the stall threshold.
+ */
+static unsigned int jockey3_start_grace_ms(void)
+{
+	int ms = READ_ONCE(start_grace_ms);
+
+	return clamp(ms, JOCKEY3_GRACE_MS_MIN, JOCKEY3_GRACE_MS_MAX);
+}
+
+/**
+ * struct jockey3_pcm_urb_stream - per-direction PCM streaming state
+ * @substream: the open ALSA substream, or NULL; @lock
+ * @anchor: anchor holding the submitted URBs, for stop/kill
+ * @urbs: the URB ring
+ * @bufs: transfer buffer for each URB, allocated at the maximum N; @n_pkts,
+ *	not this width, governs how many bytes an URB actually transfers
+ * @urbs_in_flight: number of submitted URBs; diagnostic, must reach 0 after a stop
+ * @last_callback_time: ktime of the last completion, for stall detection. Zeroed
+ *	by jockey3_stop_urbs() so a stopped stream is not reported as alive.
+ * @first_callback_time: ktime of the first completion since the last
+ *	jockey3_start_urbs(); zeroed there and by jockey3_stop_urbs(). With
+ *	@completions_since_start it lets jockey3_stream_streaming_healthy()
+ *	judge cadence, not just recency: the device can retire a URB
+ *	microseconds after submit, which is a FIFO draining rather than audio.
+ *	Set lock-free from the completion handler.
+ * @completions_since_start: count of completions since the last
+ *	jockey3_start_urbs(); zeroed there and by jockey3_stop_urbs(). atomic_t,
+ *	incremented lock-free from the completion handler.
+ * @urbs_started_time: ktime at which jockey3_start_urbs() submitted this
+ *	direction's ring; zeroed by jockey3_stop_urbs(). The watchdog measures
+ *	from here until the first completion arrives. A separate timestamp is
+ *	needed because @last_callback_time is deliberately 0 between a start and
+ *	the first completion, which jockey3_check_urb_stream_alive() must keep
+ *	reading as "not alive" -- so the watchdog cannot reuse it without either
+ *	reporting a stall at every start or breaking the post-rate-change check.
+ *	It doubles as the watchdog's post-start grace baseline (the grace
+ *	duration is start_grace_ms).
+ * @lock: protects the fields marked "@lock" below; IRQ-safe leaf
+ * @dma_off: byte offset into runtime->dma_area, i.e. the hardware pointer; @lock
+ * @period_off: bytes accumulated towards the current period; @lock
+ * @running: stream is triggered and its payload should be filled; @lock
+ * @rate_committed: this direction has had a rate accepted by
+ *	jockey3_pcm_hw_params() and not yet released by jockey3_pcm_hw_free();
+ *	@lock. See jockey3_rate_committed_streams() for why the rate interlock
+ *	keys off this rather than off @running or off @substream.
+ * @callbacks_active: number of URB completions currently inside the "safe zone"
+ *	where they may still touch @substream or runtime->dma_area; @lock. The
+ *	last one out wakes @drain_wait. A count rather than a flag because there
+ *	are JOCKEY3_N_URBS URBs per direction and their completions can overlap
+ *	on SMP.
+ * @drain_wait: waited on by jockey3_pcm_sync_stop() until @callbacks_active is 0
+ * @stopping: set by jockey3_stop_urbs() before the anchor is killed, cleared by
+ *	jockey3_start_urbs(); @lock. Tested by the completion handler inside the
+ *	same critical section that anchors and resubmits, so a callback can never
+ *	re-anchor a URB after the kill has drained the anchor.
+ * @consec_errors: consecutive URB transport errors; @lock. Reset on any
+ *	successful completion and by jockey3_start_urbs().
+ * @stall_reported: the watchdog has logged the onset of the current stall;
+ *	@lock. Edge flag, so a wedge produces one onset line and one closing
+ *	line rather than one per tick. Cleared either by the stream completing a
+ *	URB again, or by jockey3_watchdog_clear_stall() when a restart ends the
+ *	outage first -- which is the common case, since every recovery path goes
+ *	through jockey3_stop_urbs()/jockey3_start_urbs().
+ * @stall_since: ktime the current stall was measured from; @lock. Only
+ *	meaningful while @stall_reported is set, and used to report how long the
+ *	outage lasted once the stream comes back.
+ * @n_shift: log2 of the Ploytec packets per URB ("N") the next resubmission
+ *	will carry, in [0, 3]; @lock. Set by jockey3_pcm_hw_params() from the
+ *	period size and reset to the default by jockey3_pcm_close(), so an idle
+ *	direction never re-arms at a stale N. Changing it does not tear the ring
+ *	down -- the wire cannot tell one N x 512 B transfer from N separate ones
+ *	-- so each URB picks up the value at its next resubmission.
+ * @n_pkts: 1 << @n_shift, mirrored for loop bounds; @lock
+ */
+struct jockey3_pcm_urb_stream {
+	struct snd_pcm_substream *substream;
+	struct usb_anchor anchor;
+	struct urb *urbs[JOCKEY3_N_URBS];
+	unsigned char *bufs[JOCKEY3_N_URBS];
+	atomic_t urbs_in_flight;
+	atomic64_t last_callback_time;
+	atomic64_t first_callback_time;
+	atomic_t completions_since_start;
+	atomic64_t urbs_started_time;
+	spinlock_t lock;	/* protects this stream's state; IRQ-safe leaf */
+	unsigned int dma_off;
+	unsigned int period_off;
+	bool running;
+	bool rate_committed;
+	unsigned int callbacks_active;
+	wait_queue_head_t drain_wait;
+	bool stopping;
+	unsigned int consec_errors;
+	bool stall_reported;
+	u64 stall_since;
+	u8 n_shift;
+	u8 n_pkts;
+};
+
+/**
+ * struct jockey3_chip - per-device driver state
+ * @card: the ALSA card; read-only after probe
+ * @dev: the USB device; read-only after probe. Referenced for the chip's
+ *	lifetime, as @intf0 and @intf1 are, because the card can outlive the
+ *	unbind and usb_disconnect() would otherwise free them underneath an ALSA
+ *	entry point. Released by jockey3_free_resources().
+ * @intf0: interface 0, which the driver is bound to; read-only after probe
+ * @intf1: interface 1, claimed explicitly because it owns EP 0x86
+ * @pcm: the PCM device; read-only after probe
+ * @rmidi: the rawmidi device; read-only after probe
+ * @xfer_buf: bounce buffer for EP0 control transfers, USB_XFER_BUF_SIZE bytes.
+ *	Serialized by @rate_mutex once the card is live. The one exception is
+ *	jockey3_initialize(), which runs from probe before the card is
+ *	registered or the watchdog armed, so it is the only user in existence.
+ * @rate_mutex: serializes sample-rate changes and the URB stop/start that goes
+ *	with them; process context only, outermost lock
+ * @flags: JOCKEY3_FLAG_* bits, atomic bitops. SUSPENDED is set before
+ *	jockey3_suspend() takes @rate_mutex and cleared by
+ *	jockey3_restore_device() under it, so a tick blocked on that mutex sees
+ *	it on the way out.
+ * @current_rate: sample rate the hardware is programmed to; @rate_mutex
+ * @dev_idx: card slot held in jockey3_devices_used
+ * @reset_done: completed by jockey3_post_reset(), and by jockey3_disconnect()
+ *	so a waiter is released when the USB core skips post_reset() entirely.
+ *	Re-armed by jockey3_queue_reset() for a reset this driver starts, and by
+ *	jockey3_pre_reset() for one started anywhere else.
+ * @watchdog_work: periodic URB liveness check; see jockey3_watchdog_work().
+ *	Armed by jockey3_start_urbs() and disarmed by jockey3_stop_urbs(), so it
+ *	runs exactly when the URBs are supposed to be flowing -- which, for this
+ *	device, is its whole lifetime rather than only while a PCM stream is open.
+ * @recovery_attempts: resets taken from the current window by
+ *	jockey3_recovery_budget_take(); not mutex-protected, since
+ *	jockey3_pcm_hw_params()'s post-rate-change liveness check runs outside
+ *	@rate_mutex by design. The two-atomic race with @recovery_window_start is
+ *	benign: the worst case is a handful of extra resets in one window, not a
+ *	stuck or negative budget.
+ * @recovery_window_start: ktime the current budget window opened; 0 before
+ *	the first attempt. See JOCKEY3_RECOVERY_WINDOW_MS.
+ * @recovery_in_progress: one jockey3_recover_urb_stream() ladder running at a
+ *	time, chip-wide rather than per-direction for the same reason
+ *	@recovery_attempts is chip-wide: jockey3_stop_urbs()/jockey3_start_urbs()
+ *	restart the shared ring for both directions together, so a Playback
+ *	recovery and a concurrent Capture recovery -- e.g. the watchdog and a
+ *	racing jockey3_pcm_prepare() retry -- would step on each other's
+ *	stop/start (or reset) sequence rather than being independent. A second
+ *	caller finding this already set declines immediately rather than racing
+ *	the first; the first caller's restart brings back whichever direction
+ *	the second one wanted too. Test-and-set via atomic_cmpxchg() rather than
+ *	a mutex held across the whole ladder, since jockey3_check_urb_stream_alive()
+ *	callers elsewhere poll rather than block on recovery finishing.
+ * @warm_start: true if the current URB ring was last started by the stall
+ *	watchdog's own lightweight restart, false for every other (re)start
+ *	(first open, rate change, USB reset, resume, probe). Both kinds share
+ *	one start_grace_ms; this only labels which one is in effect, for
+ *	dev_dbg(). Chip-wide, not per-direction: jockey3_start_urbs() restarts
+ *	the shared ring for both directions at once. Plain bool, written by
+ *	jockey3_start_urbs() and read unlocked by the watchdog via
+ *	WRITE_ONCE()/READ_ONCE().
+ * @midi_in_substream: open MIDI IN substream, or NULL; @midi_lock
+ * @midi_out_substream: open MIDI OUT substream, or NULL; @midi_lock
+ * @midi_in_urb: the single MIDI IN URB; not anchored, killed directly
+ * @midi_in_buf: transfer buffer for @midi_in_urb
+ * @midi_lock: protects the MIDI fields; IRQ-safe leaf
+ * @midi_out_acc: accumulator for the MIDI OUT rate limiter; @midi_lock
+ * @midi_rate_divisor: current_rate / PLOYTEC_PLAYBACK_FRAMES; @midi_lock.
+ *	Derived from @current_rate and published here because the rate limiter
+ *	runs in URB completion context and cannot take @rate_mutex.
+ * @midi_state: Running Status expander state; @midi_lock
+ * @midi_stopping: see jockey3_pcm_urb_stream.stopping; @midi_lock
+ * @midi_consec_errors: consecutive MIDI IN URB errors; @midi_lock
+ * @playback: playback streaming state
+ * @capture: capture streaming state
+ */
+struct jockey3_chip {
+	struct snd_card *card;
+	struct usb_device *dev;
+	struct usb_interface *intf0;
+	struct usb_interface *intf1;
+	struct snd_pcm *pcm;
+	struct snd_rawmidi *rmidi;
+	unsigned char *xfer_buf;
+	struct mutex rate_mutex;	/* serializes rate changes; outermost lock */
+	unsigned long flags;
+	unsigned int current_rate;
+	unsigned int dev_idx;
+	struct completion reset_done;
+	struct delayed_work watchdog_work;
+	atomic_t recovery_attempts;
+	atomic64_t recovery_window_start;
+	atomic_t recovery_in_progress;
+	bool warm_start;	/* set by jockey3_start_urbs(): warm vs cold, for dev_dbg() only */
+
+	/* MIDI Path */
+	struct snd_rawmidi_substream *midi_in_substream;
+	struct snd_rawmidi_substream *midi_out_substream;
+	struct urb *midi_in_urb;
+	unsigned char *midi_in_buf;
+	spinlock_t midi_lock;	/* protects the MIDI fields; IRQ-safe leaf */
+	unsigned int midi_out_acc;
+	unsigned int midi_rate_divisor;
+	struct ploytec_midi_running_status midi_state;
+	bool midi_stopping;
+	unsigned int midi_consec_errors;
+
+	/* PCM urb streams */
+	struct jockey3_pcm_urb_stream playback;
+	struct jockey3_pcm_urb_stream capture;
+};
+
+static struct usb_driver jockey3_driver;
+
+/*
+ * Card index allocation. A plain incrementing counter would both race between
+ * concurrent probes and never reuse a slot, so after SNDRV_CARDS successful
+ * probes no further device could attach even if all of them had been unplugged.
+ */
+static DEFINE_MUTEX(jockey3_devices_mutex);
+static DECLARE_BITMAP(jockey3_devices_used, SNDRV_CARDS);
+
+/* Chip flags */
+#define JOCKEY3_FLAG_DISCONNECTED	0
+#define JOCKEY3_FLAG_RESETTING		1
+#define JOCKEY3_FLAG_SUSPENDED		2
+
+static inline bool jockey3_is_disconnected(const struct jockey3_chip *chip)
+{
+	return test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+}
+
+static inline bool jockey3_is_resetting(const struct jockey3_chip *chip)
+{
+	return test_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
+}
+
+static inline bool jockey3_is_suspended(const struct jockey3_chip *chip)
+{
+	return test_bit(JOCKEY3_FLAG_SUSPENDED, &chip->flags);
+}
+
+/*
+ * Publish a new sample rate.
+ *
+ * chip->current_rate is protected by rate_mutex, but the MIDI OUT rate limiter
+ * runs in URB completion (atomic) context and cannot take it. Rather than have
+ * that path read current_rate unlocked, the value it actually needs is derived
+ * here and published under midi_lock -- which also gets the division off the
+ * per-URB hot path.
+ */
+static void jockey3_set_current_rate(struct jockey3_chip *chip, unsigned int rate)
+{
+	lockdep_assert_held(&chip->rate_mutex);
+
+	chip->current_rate = rate;
+	scoped_guard(spinlock_irqsave, &chip->midi_lock)
+		chip->midi_rate_divisor = rate / PLOYTEC_PLAYBACK_FRAMES;
+}
+
+/*
+ * Rate changes are serialized by chip->rate_mutex alone: jockey3_pcm_hw_params()
+ * performs the whole stop/set-rate/start sequence while holding it, so any other
+ * sleepable callback that takes the mutex is automatically excluded for the
+ * duration. There is deliberately no separate "rate changing" flag to poll --
+ * the only caller that could not take the mutex was .trigger, which runs in
+ * atomic context and must not block at all.
+ */
+
+/*
+ * Bounded, synchronous wait for a device reset queued via
+ * usb_queue_reset_device() to complete. chip->reset_done is completed by
+ * jockey3_post_reset(), and also by jockey3_disconnect() so that a waiter is
+ * released when the USB core skips post_reset() entirely (a failed reset marks
+ * the interface for rebinding and unbinds it instead).
+ *
+ * Deliberately does NOT call usb_reset_device() itself. A failed or aborted
+ * reset marks the interface for rebinding and unbinds it, so the call would
+ * run jockey3_disconnect() -- and the card teardown behind it -- in the very
+ * thread that is still executing an ioctl on one of that card's file
+ * descriptors. Queuing the reset instead lets the disconnect run on the USB
+ * core's own workqueue, where the ALSA core's own refcounting keeps the
+ * substream alive until this ioctl returns and userspace closes it.
+ *
+ * Until the card was switched from snd_devm_card_new() to
+ * snd_card_free_when_closed() this was worse still: the teardown blocked in
+ * snd_card_free() waiting for that same file descriptor to be closed, which
+ * could never happen. That specific self-deadlock is gone, but reaching a
+ * disconnect from inside an ioctl on the disconnecting card remains something
+ * to keep out of this driver's calling threads.
+ */
+static int jockey3_wait_for_reset_completion(struct jockey3_chip *chip)
+{
+	/*
+	 * Empirical testing shows that the reset cycle typically takes around
+	 * 334 ms; a 1000 ms timeout gives sufficient headroom.
+	 */
+	if (!jockey3_is_resetting(chip))
+		return 0;
+
+	dev_dbg(&chip->intf0->dev, "Waiting for reset completion\n");
+
+	if (!wait_for_completion_timeout(&chip->reset_done, msecs_to_jiffies(1000))) {
+		dev_warn(&chip->intf0->dev, "Timeout waiting for reset completion\n");
+		return -EAGAIN;
+	}
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	return 0;
+}
+
+/*
+ * Queue a full USB reset and arm chip->reset_done for a waiter. Does not
+ * wait; pair with jockey3_wait_for_reset_completion() for that.
+ */
+static void jockey3_queue_reset(struct jockey3_chip *chip)
+{
+	reinit_completion(&chip->reset_done);
+	set_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
+	usb_queue_reset_device(chip->intf0);
+}
+
+/*
+ * Chip-wide bounded-retry budget consulted by jockey3_recover_urb_stream()
+ * before it escalates to a full USB reset. Returns true if the caller may go
+ * ahead. A window older than JOCKEY3_RECOVERY_WINDOW_MS (or none opened yet)
+ * is replaced with a fresh one, so a chip that stops stalling is never left
+ * permanently refusing to recover; within a live window, up to
+ * JOCKEY3_RECOVERY_MAX_ATTEMPTS resets are allowed before further attempts
+ * are declined and reported instead.
+ */
+static bool jockey3_recovery_budget_take(struct jockey3_chip *chip)
+{
+	u64 now = ktime_get_mono_fast_ns();
+	u64 window_start = atomic64_read(&chip->recovery_window_start);
+
+	if (!window_start ||
+	    now - window_start > (u64)JOCKEY3_RECOVERY_WINDOW_MS * NSEC_PER_MSEC) {
+		atomic64_set(&chip->recovery_window_start, now);
+		atomic_set(&chip->recovery_attempts, 1);
+		return true;
+	}
+
+	return atomic_inc_return(&chip->recovery_attempts) <= JOCKEY3_RECOVERY_MAX_ATTEMPTS;
+}
+
+static inline struct jockey3_pcm_urb_stream *jockey3_get_pcm_urb_stream(struct jockey3_chip *chip,
+									const int direction)
+{
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		return &chip->playback;
+	else
+		return &chip->capture;
+}
+
+static void jockey3_set_rate_committed(struct jockey3_chip *chip, const int direction,
+				       bool committed)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+
+	guard(spinlock_irqsave)(&urb_stream->lock);
+	urb_stream->rate_committed = committed;
+}
+
+/*
+ * How many directions currently hold the hardware rate, i.e. have had a rate
+ * accepted by jockey3_pcm_hw_params() and not yet released by
+ * jockey3_pcm_hw_free(). The device has a single rate for both directions, so
+ * this is what the open-time constraint and the hw_params interlock key off.
+ *
+ * Deliberately not a count of *running* streams: .trigger is what sets
+ * @running, so a stream that is open, has its rate fixed and is merely waiting
+ * to be started would not be counted, and the other direction could reprogram
+ * the hardware underneath it -- it would then play or record at the wrong
+ * speed.
+ *
+ * Equally deliberately not a count of *open* streams: a full-duplex
+ * application opens both directions before calling hw_params on either, and
+ * counting opens would pin the second one to whatever rate the device happens
+ * to be sitting at, refusing an otherwise legal rate change.
+ *
+ * One consequence is worth knowing: the constraint jockey3_pcm_open() applies
+ * is permanent for that substream's runtime, while a commitment is not, so a
+ * stream that opened while the other direction held a rate stays pinned to it
+ * even after that direction closes. That is inherent to a device with a single
+ * rate for both directions, and is the safe side of the trade.
+ */
+static int jockey3_rate_committed_streams(struct jockey3_chip *chip)
+{
+	int committed = 0;
+
+	scoped_guard(spinlock_irqsave, &chip->capture.lock) {
+		if (chip->capture.rate_committed)
+			committed++;
+	}
+
+	scoped_guard(spinlock_irqsave, &chip->playback.lock) {
+		if (chip->playback.rate_committed)
+			committed++;
+	}
+
+	return committed;
+}
+
+static bool jockey3_process_out_packet(struct jockey3_chip *chip, u8 *urb_buf)
+{
+	struct snd_pcm_substream *substream = chip->playback.substream;
+	struct jockey3_pcm_urb_stream *urb_stream = &chip->playback;
+	struct snd_pcm_runtime *runtime;
+	unsigned int pcm_buffer_size;
+	unsigned int alsa_frame_size;
+	unsigned int frames_in_batch;
+	unsigned int bytes_avail;
+	int f = 0;
+
+	if (unlikely(!substream || !substream->runtime))
+		return false;
+
+	runtime = substream->runtime;
+	if (unlikely(!runtime->dma_area))
+		return false;
+
+	pcm_buffer_size = snd_pcm_lib_buffer_bytes(substream);
+	alsa_frame_size = runtime->channels * 3;  // 4 * 3 = 12 bytes
+
+	while (f < PLOYTEC_PLAYBACK_FRAMES) {
+		/* calculate how many samples we can process in one batch */
+		frames_in_batch = PLOYTEC_PLAYBACK_FRAMES - f;
+		bytes_avail = pcm_buffer_size - urb_stream->dma_off;
+
+		/* Respect circular buffer wrap-around */
+		if (bytes_avail < frames_in_batch * alsa_frame_size)
+			frames_in_batch = bytes_avail / alsa_frame_size;
+
+		if (frames_in_batch == 0)
+			break;
+
+		ploytec_encode_batch(urb_buf + f * PLOYTEC_PLAYBACK_FRAME_SIZE,
+				     runtime->dma_area + urb_stream->dma_off,
+				     frames_in_batch);
+
+		urb_stream->dma_off += frames_in_batch * alsa_frame_size;
+		if (urb_stream->dma_off >= pcm_buffer_size)
+			urb_stream->dma_off -= pcm_buffer_size;
+
+		urb_stream->period_off += frames_in_batch * alsa_frame_size;
+
+		f += frames_in_batch;
+	}
+
+	if (urb_stream->period_off >= runtime->period_size * alsa_frame_size) {
+		urb_stream->period_off %= runtime->period_size * alsa_frame_size;
+		return true;
+	}
+
+	return false;
+}
+
+static bool jockey3_process_in_packet(struct jockey3_chip *chip, const u8 *urb_buf)
+{
+	struct snd_pcm_substream *substream = chip->capture.substream;
+	struct jockey3_pcm_urb_stream *urb_stream = &chip->capture;
+	struct snd_pcm_runtime *runtime;
+	unsigned int pcm_buffer_size;
+	unsigned int alsa_frame_size;
+	unsigned int frames_in_batch;
+	unsigned int bytes_left;
+	int f = 0;
+
+	if (unlikely(!substream || !substream->runtime))
+		return false;
+
+	runtime = substream->runtime;
+	if (unlikely(!runtime->dma_area))
+		return false;
+
+	pcm_buffer_size = snd_pcm_lib_buffer_bytes(substream);
+	alsa_frame_size = runtime->channels * 3; // 6 * 3 = 18 bytes
+
+	while (f < PLOYTEC_CAPTURE_FRAMES) {
+		frames_in_batch = PLOYTEC_CAPTURE_FRAMES - f;
+		bytes_left = pcm_buffer_size - urb_stream->dma_off;
+
+		/* Respect circular buffer wrap-around */
+		if (bytes_left < frames_in_batch * alsa_frame_size)
+			frames_in_batch = bytes_left / alsa_frame_size;
+
+		if (frames_in_batch == 0)
+			break;
+
+		ploytec_decode_batch(runtime->dma_area + urb_stream->dma_off,
+				     urb_buf + f * PLOYTEC_CAPTURE_FRAME_SIZE,
+				     frames_in_batch);
+
+		/* Advance pointers */
+		urb_stream->dma_off += frames_in_batch * alsa_frame_size;
+		if (urb_stream->dma_off >= pcm_buffer_size)
+			urb_stream->dma_off -= pcm_buffer_size;
+
+		urb_stream->period_off += frames_in_batch * alsa_frame_size;
+
+		f += frames_in_batch;
+	}
+
+	if (urb_stream->period_off >= runtime->period_size * alsa_frame_size) {
+		urb_stream->period_off %= runtime->period_size * alsa_frame_size;
+		return true;
+	}
+
+	return false;
+}
+
+enum jockey3_urb_state {
+	JOCKEY3_URB_OK,		/* completed normally */
+	JOCKEY3_URB_STOPPED,	/* teardown in progress; return without resubmitting */
+	JOCKEY3_URB_ERROR,	/* transport error, potentially transient */
+};
+
+static inline enum jockey3_urb_state jockey3_urb_check(const struct urb *urb)
+{
+	if (likely(urb->status == 0))
+		return JOCKEY3_URB_OK;
+
+	if (urb->status == -ENOENT || urb->status == -ECONNRESET || urb->status == -ESHUTDOWN)
+		return JOCKEY3_URB_STOPPED;
+
+	return JOCKEY3_URB_ERROR;
+}
+
+/**
+ * jockey3_warn_unexpected_stop() - report a URB that someone else cancelled
+ * @chip: driver state
+ * @stopping: whether this direction's teardown fence was set
+ * @status: the urb->status that retired the URB
+ * @type: direction name, for the log message
+ *
+ * -ENOENT, -ECONNRESET and -ESHUTDOWN normally mean the driver killed the URB
+ * itself, and jockey3_urb_check() maps them to JOCKEY3_URB_STOPPED on that
+ * assumption. Nothing verifies it: the USB core flushes an endpoint's URBs from
+ * usb_disable_endpoint(), so an alt-setting change or an endpoint teardown
+ * started anywhere else retires the whole ring by the same route, and every URB
+ * of the direction would return here without a word.
+ *
+ * A physical unplug arrives here too and is not worth reporting.
+ * usb_disconnect() moves the device to USB_STATE_NOTATTACHED before unbinding
+ * the interfaces, so URBs that complete ahead of jockey3_disconnect() are
+ * recognized by that rather than mistaken for an unexplained teardown.
+ *
+ * This is defensive. No failure observed so far has been traced to this path.
+ */
+static void jockey3_warn_unexpected_stop(struct jockey3_chip *chip, bool stopping,
+					 int status, const char *type)
+{
+	if (stopping || jockey3_is_disconnected(chip) || jockey3_is_resetting(chip))
+		return;
+
+	if (chip->dev->state == USB_STATE_NOTATTACHED)
+		return;
+
+	/* Ratelimited: a whole ring of URBs retires together */
+	dev_warn_ratelimited(&chip->intf0->dev,
+			     "%s URB cancelled without a driver-initiated stop: %d\n",
+			     type, status);
+}
+
+/**
+ * jockey3_report_xrun() - tell userspace this direction lost its data
+ * @urb_stream: the affected direction
+ *
+ * Reports an xrun on the open substream, if there is one. Nothing else in the
+ * driver can do this safely by hand: snd_pcm_stop_xrun() takes the stream lock,
+ * and the documented order is snd_pcm_stream_lock -> urb_stream->lock, so the
+ * call has to be made with our spinlock dropped. Between dropping it and taking
+ * it again the substream could be freed underneath us, which is what the
+ * callbacks_active "safe zone" prevents -- jockey3_pcm_sync_stop() waits for
+ * that count to reach zero before the ALSA core releases the buffer.
+ *
+ * Callers must hold neither @urb_stream->lock nor any driver mutex.
+ */
+static void jockey3_report_xrun(struct jockey3_pcm_urb_stream *urb_stream)
+{
+	struct snd_pcm_substream *substream = NULL;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		if (urb_stream->running && urb_stream->substream) {
+			/* Join the safe zone so the substream cannot be freed below */
+			urb_stream->callbacks_active++;
+			substream = urb_stream->substream;
+		}
+	}
+
+	if (!substream)
+		return;
+
+	snd_pcm_stop_xrun(substream);
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		if (!--urb_stream->callbacks_active)
+			wake_up(&urb_stream->drain_wait);
+	}
+}
+
+/**
+ * jockey3_err_device_gone() - did the device simply leave?
+ * @err: a transfer's return value
+ *
+ * Keyed on the error code, not on jockey3_is_disconnected(): a failed reset
+ * also leaves the device %USB_STATE_NOTATTACHED and sets that flag on its way
+ * to unbinding, and that one is a fault worth logging.
+ *
+ * Return: true if @err means the device is gone rather than misbehaving.
+ */
+static bool jockey3_err_device_gone(int err)
+{
+	return err == -ENODEV || err == -ESHUTDOWN;
+}
+
+/*
+ * An unplug fails every in-flight URB's resubmit at once, so demote that case
+ * as the submit and rate paths do. Log level only: @consec_errors comes from
+ * jockey3_urb_error_give_up() and the completion status, not from here.
+ */
+static void jockey3_resubmit_failed(struct jockey3_chip *chip, int err, const char *what)
+{
+	if (jockey3_err_device_gone(err)) {
+		dev_dbg(&chip->intf0->dev,
+			"Not resubmitting the %s URB: device is gone (%d)\n", what, err);
+		return;
+	}
+
+	dev_err(&chip->intf0->dev, "Failed to resubmit %s URB: %d\n", what, err);
+}
+
+/**
+ * jockey3_urb_error_give_up() - account for a URB transport error
+ * @chip: driver state
+ * @urb_stream: the affected direction
+ * @status: the urb->status that was seen
+ * @type: direction name, for log messages
+ *
+ * Accounts for a transport error (-EPROTO, -EPIPE, -EOVERFLOW, -ETIME, ...).
+ *
+ * These are frequently transient -- marginal cabling and some host controllers
+ * produce them routinely -- so a single one must not disable the card. Keep
+ * resubmitting while the consecutive count stays below JOCKEY3_MAX_URB_ERRORS;
+ * beyond that, stop feeding this direction and leave recovery to the next
+ * .prepare, which already carries the stall detection and reset path.
+ *
+ * Return: true if the caller should give up and not resubmit.
+ */
+static bool jockey3_urb_error_give_up(struct jockey3_chip *chip,
+				      struct jockey3_pcm_urb_stream *urb_stream,
+				      int status, const char *type)
+{
+	unsigned int errors;
+	bool crossed_limit;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		errors = ++urb_stream->consec_errors;
+		/*
+		 * The increment and this test share one critical section, so
+		 * exactly one caller observes the transition even though up to
+		 * JOCKEY3_N_URBS completions arrive together.
+		 */
+		crossed_limit = errors == JOCKEY3_MAX_URB_ERRORS;
+	}
+
+	/*
+	 * Already given up. When the device goes away every one of the
+	 * JOCKEY3_N_URBS in-flight URBs completes with an error, so without this
+	 * the limit would be re-reported once per URB (and the stream stopped
+	 * repeatedly). Report the transition only.
+	 */
+	if (errors > JOCKEY3_MAX_URB_ERRORS)
+		return true;
+
+	dev_err_ratelimited(&chip->intf0->dev, "%s URB error: %d (%u consecutive)\n",
+			    type, status, errors);
+
+	if (!crossed_limit)
+		return false;
+
+	dev_err(&chip->intf0->dev,
+		"%s stopped after %u consecutive URB errors; deferring recovery\n",
+		type, errors);
+
+	jockey3_report_xrun(urb_stream);
+
+	return true;
+}
+
+/*
+ * Record one URB completion for the liveness and cadence checks. The device can
+ * retire a URB microseconds after submit -- a hardware-side FIFO draining rather
+ * than audio actually clocked onto or off the wire -- so
+ * jockey3_stream_streaming_healthy() needs the first completion's time and the
+ * running count, not just the last time, to tell real flow from that trickle.
+ * Lock-free; called at the top of each completion handler. If two completions
+ * race, exactly one sees the count go 1->1 and stamps @first_callback_time; a
+ * transient @last_callback_time < @first_callback_time is harmless, the health
+ * check rejects it and is re-polled.
+ */
+static void jockey3_note_completion(struct jockey3_pcm_urb_stream *urb_stream)
+{
+	u64 now = ktime_get_mono_fast_ns();
+
+	atomic64_set(&urb_stream->last_callback_time, now);
+	if (atomic_inc_return(&urb_stream->completions_since_start) == 1)
+		atomic64_set(&urb_stream->first_callback_time, now);
+}
+
+static void jockey3_capture_callback(struct urb *urb)
+{
+	struct jockey3_chip *chip = urb->context;
+	struct jockey3_pcm_urb_stream *urb_stream = &chip->capture;
+	struct snd_pcm_substream *substream = NULL;
+	int n_pkts = 0;
+	bool period_elapsed = false;
+	bool data_valid = true;
+	bool active = false;
+	bool stopping;
+	int sp, ret;
+
+	atomic_dec(&urb_stream->urbs_in_flight);
+	jockey3_note_completion(urb_stream);
+
+	switch (jockey3_urb_check(urb)) {
+	case JOCKEY3_URB_STOPPED:
+		scoped_guard(spinlock_irqsave, &urb_stream->lock)
+			stopping = urb_stream->stopping;
+		jockey3_warn_unexpected_stop(chip, stopping, urb->status, "Capture");
+		return;
+	case JOCKEY3_URB_ERROR:
+		if (jockey3_urb_error_give_up(chip, urb_stream, urb->status, "Capture"))
+			return;
+		/* Transient: resubmit, but this buffer holds no usable data */
+		data_valid = false;
+		break;
+	case JOCKEY3_URB_OK:
+		break;
+	}
+
+	if (unlikely(jockey3_is_disconnected(chip)))
+		return;
+
+	/*
+	 * The firmware fills a multi-packet capture URB completely rather than
+	 * terminating at one 512 B packet, so the expected case is
+	 * actual_length == JOCKEY3_CAPTURE_XFER_SIZE. Derive the count from
+	 * what actually came back rather than assuming N, in case that
+	 * changes under load or on other firmware revisions.
+	 */
+	if (data_valid) {
+		n_pkts = urb->actual_length / PLOYTEC_PKT_SIZE;
+		if (unlikely(n_pkts == 0)) {
+			dev_err(&chip->intf0->dev, "Capture URB too small: %d; required at least %d\n",
+				urb->actual_length, PLOYTEC_PKT_SIZE);
+			data_valid = false;
+		} else if (unlikely(urb->actual_length % PLOYTEC_PKT_SIZE)) {
+			/*
+			 * A short trailing partial packet: use the
+			 * complete ones and drop the rest, but this should
+			 * not happen on firmware behaving as described above
+			 * -- log it once so a change in device behavior is
+			 * visible instead of silently discarded audio.
+			 */
+			dev_warn_once(&chip->intf0->dev,
+				      "Capture URB length %d not a multiple of %d, using %d packet(s)\n",
+				      urb->actual_length, PLOYTEC_PKT_SIZE, n_pkts);
+		}
+	}
+
+	/* Step 1: Safely fetch the pointer and join the safe zone */
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		if (data_valid)
+			urb_stream->consec_errors = 0;
+
+		if (data_valid && !urb_stream->stopping &&
+		    urb_stream->running && urb_stream->substream) {
+			urb_stream->callbacks_active++;
+			active = true;
+			substream = urb_stream->substream;
+
+			for (sp = 0; sp < n_pkts; sp++)
+				period_elapsed |= jockey3_process_in_packet(chip,
+					urb->transfer_buffer + sp * PLOYTEC_PKT_SIZE);
+		}
+	}
+
+	/*
+	 * Step 2: Safe Zone. ALSA core can't free 'substream' because
+	 * jockey3_pcm_sync_stop() waits for 'callbacks_active' to drain before
+	 * the core releases the buffer. Our lock is released here to avoid an
+	 * ABBA deadlock with ALSA's internal locking: snd_pcm_period_elapsed()
+	 * takes the stream lock, and the order is stream lock -> urb_stream->lock.
+	 */
+	if (period_elapsed && substream)
+		snd_pcm_period_elapsed(substream);
+
+	ret = 0;
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		/* Leave the safe zone; last one out wakes any waiter */
+		if (active && !--urb_stream->callbacks_active)
+			wake_up(&urb_stream->drain_wait);
+
+		/*
+		 * Keep resubmitting the URB while the interface is alive. The
+		 * 'stopping' test and the anchor+submit below must stay in this
+		 * one critical section: that is what stops a URB being re-added
+		 * to an anchor jockey3_stop_urbs() has already drained.
+		 */
+		if (!urb_stream->stopping && !jockey3_is_disconnected(chip)) {
+			urb->transfer_buffer_length = urb_stream->n_pkts * PLOYTEC_PKT_SIZE;
+			atomic_inc(&urb_stream->urbs_in_flight);
+			usb_anchor_urb(urb, &urb_stream->anchor);
+			ret = usb_submit_urb(urb, GFP_ATOMIC);
+			if (ret < 0) {
+				atomic_dec(&urb_stream->urbs_in_flight);
+				usb_unanchor_urb(urb);
+			}
+		}
+	}
+	if (ret < 0)
+		jockey3_resubmit_failed(chip, ret, "capture");
+}
+
+/**
+ * jockey3_get_next_midi_out_byte() - pick the MIDI byte for one playback packet
+ * @chip: driver state
+ *
+ * Every outgoing playback packet reserves one slot for MIDI. This returns the
+ * byte for it, through a leaky-bucket limiter holding the stream to roughly
+ * 2500 bytes/sec. The hardware carries the full MIDI line rate of 3125
+ * bytes/sec, but sustained traffic at it makes the control surface stop
+ * responding to updates, so the limit sits below that. The idle byte is
+ * returned when there is nothing to send or no budget.
+ *
+ * midi_lock is held across snd_rawmidi_transmit() so
+ * chip->midi_out_substream cannot change under us. The order is safe because
+ * the rawmidi core calls snd_rawmidi_output_trigger() without substream->lock,
+ * and holding a driver lock there is the established idiom (sound/usb/midi.c
+ * does it under ep->buffer_lock).
+ *
+ * Called from the playback URB completion handler, so this runs in atomic
+ * context.
+ *
+ * Return: the byte to place in the packet's MIDI slot.
+ */
+static u8 jockey3_get_next_midi_out_byte(struct jockey3_chip *chip)
+{
+	u8 b;
+
+	guard(spinlock_irqsave)(&chip->midi_lock);
+
+	/*
+	 * Rate limit MIDI to ~2500 bytes/sec -- see the kernel-doc above for why
+	 * this sits below the device's 3125 bytes/sec MIDI line rate.
+	 */
+	chip->midi_out_acc += 2500;
+	if (chip->midi_out_acc < chip->midi_rate_divisor)
+		return PLOYTEC_MIDI_IDLE_BYTE;
+	chip->midi_out_acc -= chip->midi_rate_divisor;
+
+	/* Handle queued byte from Running Status expansion first before consuming from ALSA */
+	if (chip->midi_state.has_queued_byte) {
+		chip->midi_state.has_queued_byte = false;
+		return chip->midi_state.queued_byte;
+	}
+
+	if (!chip->midi_out_substream)
+		return PLOYTEC_MIDI_IDLE_BYTE;
+
+	if (snd_rawmidi_transmit(chip->midi_out_substream, &b, 1) != 1)
+		return PLOYTEC_MIDI_IDLE_BYTE;
+
+	return ploytec_midi_running_status_expand(&chip->midi_state, b, &chip->intf0->dev);
+}
+
+/*
+ * Fill the sample area of a playback packet with silence, for when there is
+ * no PCM data to send.
+ *
+ * Only the sample area is touched: everything from PLOYTEC_MIDI_OUT_OFFSET
+ * onwards -- the MIDI slot, the sync byte and the trailing gap -- is rewritten
+ * unconditionally by jockey3_playback_callback() immediately afterwards.
+ */
+static void jockey3_silence_out_packet(u8 *buf)
+{
+	memset(buf, 0, PLOYTEC_MIDI_OUT_OFFSET);
+}
+
+/*
+ * Prime a freshly allocated playback buffer so the first URB, which is
+ * submitted before any completion handler has run, carries a valid idle
+ * packet. The buffer comes from kzalloc(), so the sample area and the
+ * trailing gap are already silent.
+ */
+static void jockey3_init_out_packet(u8 *buf)
+{
+	int sp;
+
+	for (sp = 0; sp < JOCKEY3_PLAYBACK_N; sp++) {
+		u8 *sub = buf + sp * PLOYTEC_PKT_SIZE;
+
+		sub[PLOYTEC_MIDI_OUT_OFFSET] = PLOYTEC_MIDI_IDLE_BYTE;
+		sub[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
+	}
+}
+
+static void jockey3_playback_callback(struct urb *urb)
+{
+	struct jockey3_chip *chip = urb->context;
+	struct jockey3_pcm_urb_stream *urb_stream = &chip->playback;
+	unsigned char *buf = (unsigned char *)urb->transfer_buffer;
+	struct snd_pcm_substream *substream = NULL;
+	unsigned int submit_pkts;
+	bool period_elapsed = false;
+	bool data_valid = true;
+	bool active = false;
+	bool stopping;
+	int i, sp, ret;
+
+	atomic_dec(&urb_stream->urbs_in_flight);
+	jockey3_note_completion(urb_stream);
+
+	switch (jockey3_urb_check(urb)) {
+	case JOCKEY3_URB_STOPPED:
+		scoped_guard(spinlock_irqsave, &urb_stream->lock)
+			stopping = urb_stream->stopping;
+		jockey3_warn_unexpected_stop(chip, stopping, urb->status, "Playback");
+		return;
+	case JOCKEY3_URB_ERROR:
+		if (jockey3_urb_error_give_up(chip, urb_stream, urb->status, "Playback"))
+			return;
+		data_valid = false;
+		break;
+	case JOCKEY3_URB_OK:
+		break;
+	}
+
+	if (unlikely(jockey3_is_disconnected(chip)))
+		return;
+
+	/*
+	 * Step 1: Safely fetch the pointer and join the safe zone.
+	 *
+	 * @n_pkts is captured once here and reused below for the MIDI/sync
+	 * loop and the resubmit's transfer_buffer_length, rather than re-read
+	 * at each site: jockey3_pcm_hw_params() can change it concurrently
+	 * (under the same lock), and this URB's buffer must only ever claim
+	 * to carry as many freshly written packets as it actually filled
+	 * this callback. Reading a larger value at resubmit than was used to
+	 * fill would send stale packets left over from an earlier, larger N
+	 * instead of tearing the ring down.
+	 */
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		submit_pkts = urb_stream->n_pkts;
+
+		if (data_valid)
+			urb_stream->consec_errors = 0;
+
+		if (data_valid && !urb_stream->stopping &&
+		    urb_stream->running && urb_stream->substream) {
+			urb_stream->callbacks_active++;
+			active = true;
+			substream = urb_stream->substream;
+
+			for (sp = 0; sp < submit_pkts; sp++)
+				period_elapsed |= jockey3_process_out_packet(chip,
+					buf + sp * PLOYTEC_PKT_SIZE);
+		} else {
+			for (sp = 0; sp < submit_pkts; sp++)
+				jockey3_silence_out_packet(buf + sp * PLOYTEC_PKT_SIZE);
+		}
+	}
+
+	/*
+	 * The outgoing MIDI data is encapsulated in the playback stream, one
+	 * real (rate-limited) byte per packet: jockey3_get_next_midi_out_byte()'s
+	 * leaky-bucket limiter is calibrated on @midi_rate_divisor, which
+	 * assumes exactly one call per packet interval. Calling it once
+	 * per URB instead of once per packet would silently divide MIDI
+	 * OUT throughput by the chosen N.
+	 */
+	for (sp = 0; sp < submit_pkts; sp++) {
+		u8 *sub = buf + sp * PLOYTEC_PKT_SIZE;
+
+		sub[PLOYTEC_MIDI_OUT_OFFSET] = jockey3_get_next_midi_out_byte(chip);
+
+		/* Ploytec Sync byte and gap padding */
+		sub[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
+		for (i = PLOYTEC_SYNC_BYTE_OFFSET + 1; i < PLOYTEC_PKT_SIZE; i++)
+			sub[i] = 0x00;
+	}
+
+	/*
+	 * Step 2: Safe Zone. ALSA core can't free 'substream' because
+	 * jockey3_pcm_sync_stop() waits for 'callbacks_active' to drain before
+	 * the core releases the buffer. Our lock is released here to avoid an
+	 * ABBA deadlock with ALSA's internal locking: snd_pcm_period_elapsed()
+	 * takes the stream lock, and the order is stream lock -> urb_stream->lock.
+	 */
+	if (period_elapsed && substream)
+		snd_pcm_period_elapsed(substream);
+
+	ret = 0;
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		/* Leave the safe zone; last one out wakes any waiter */
+		if (active && !--urb_stream->callbacks_active)
+			wake_up(&urb_stream->drain_wait);
+
+		/*
+		 * Keep resubmitting the URB while the interface is alive. The
+		 * 'stopping' test and the anchor+submit below must stay in this
+		 * one critical section: that is what stops a URB being re-added
+		 * to an anchor jockey3_stop_urbs() has already drained.
+		 */
+		if (!urb_stream->stopping && !jockey3_is_disconnected(chip)) {
+			urb->transfer_buffer_length = submit_pkts * PLOYTEC_PKT_SIZE;
+			atomic_inc(&urb_stream->urbs_in_flight);
+			usb_anchor_urb(urb, &urb_stream->anchor);
+			ret = usb_submit_urb(urb, GFP_ATOMIC);
+			if (ret < 0) {
+				atomic_dec(&urb_stream->urbs_in_flight);
+				usb_unanchor_urb(urb);
+			}
+		}
+	}
+	if (ret < 0)
+		jockey3_resubmit_failed(chip, ret, "playback");
+}
+
+static void jockey3_midi_in_callback(struct urb *urb)
+{
+	struct jockey3_chip *chip = urb->context;
+	unsigned char *buf = (unsigned char *)urb->transfer_buffer;
+	unsigned int errors;
+	bool stopping;
+	int i, n = 0, ret;
+
+	switch (jockey3_urb_check(urb)) {
+	case JOCKEY3_URB_STOPPED:
+		scoped_guard(spinlock_irqsave, &chip->midi_lock)
+			stopping = chip->midi_stopping;
+		jockey3_warn_unexpected_stop(chip, stopping, urb->status, "MIDI IN");
+		return;
+	case JOCKEY3_URB_ERROR:
+		scoped_guard(spinlock_irqsave, &chip->midi_lock)
+			errors = ++chip->midi_consec_errors;
+
+		/* Already given up; see jockey3_urb_error_give_up() */
+		if (errors > JOCKEY3_MAX_URB_ERRORS)
+			return;
+
+		dev_err_ratelimited(&chip->intf0->dev,
+				    "MIDI IN URB error: %d (%u consecutive)\n",
+				    urb->status, errors);
+		if (errors == JOCKEY3_MAX_URB_ERRORS) {
+			dev_err(&chip->intf0->dev,
+				"MIDI IN stopped after %u consecutive URB errors\n", errors);
+			return;
+		}
+		/* Transient: resubmit, but there is no usable data in this buffer */
+		urb->actual_length = 0;
+		break;
+	case JOCKEY3_URB_OK:
+		scoped_guard(spinlock_irqsave, &chip->midi_lock)
+			chip->midi_consec_errors = 0;
+		break;
+	}
+
+	if (unlikely(jockey3_is_disconnected(chip)))
+		return;
+
+	/*
+	 * Compact the payload in place, dropping the padding the device emits
+	 * between real MIDI bytes. The transfer buffer is ours, so this needs no
+	 * lock; doing it up front turns the delivery below into a single locked
+	 * call instead of one per byte.
+	 *
+	 * For different devices (firmware revision) different padding bytes have
+	 * been observed: 0xF9, 0xFB, 0xFD, 0xFF. Since the device is not sending
+	 * any MIDI system or real-time messages, we can safely ignore any byte
+	 * 0xF0..0xFF received from the device.
+	 */
+	for (i = 0; i < urb->actual_length; i++)
+		if (buf[i] < 0xF0)
+			buf[n++] = buf[i];
+
+	ret = 0;
+	scoped_guard(spinlock_irqsave, &chip->midi_lock) {
+		/*
+		 * Deliver under midi_lock so the substream cannot be cleared by
+		 * jockey3_midi_in_close() while we are dereferencing it.
+		 */
+		if (n && !chip->midi_stopping && chip->midi_in_substream)
+			snd_rawmidi_receive(chip->midi_in_substream, buf, n);
+
+		if (!chip->midi_stopping && !jockey3_is_disconnected(chip))
+			ret = usb_submit_urb(urb, GFP_ATOMIC);
+	}
+	if (ret < 0)
+		jockey3_resubmit_failed(chip, ret, "MIDI IN");
+}
+
+/*
+ * How long until a direction's watchdog deadline (last activity plus
+ * JOCKEY3_WATCHDOG_STALL_MS, or the current start grace if no completion has
+ * arrived since the last start), in ms clamped to
+ * [JOCKEY3_WATCHDOG_MIN_POLL_MS, JOCKEY3_WATCHDOG_POLL_MS]. Returns
+ * JOCKEY3_WATCHDOG_POLL_MS if the direction has never started (no deadline to
+ * chase yet), and the floor if the deadline has already passed, so a
+ * confirmed stall gets rechecked tightly instead of waiting out a stale
+ * window. Only meaningful while a PCM stream is open somewhere -- see the
+ * caller, jockey3_watchdog_arm().
+ */
+static unsigned long jockey3_watchdog_next_delay_ms(struct jockey3_chip *chip,
+						    const struct jockey3_pcm_urb_stream *urb_stream)
+{
+	u64 last = atomic64_read(&urb_stream->last_callback_time);
+	u64 started = atomic64_read(&urb_stream->urbs_started_time);
+	u64 threshold_ms = JOCKEY3_WATCHDOG_STALL_MS;
+	unsigned int grace_ms = jockey3_start_grace_ms();
+	u64 now, remaining_ns;
+
+	if (!started)
+		return JOCKEY3_WATCHDOG_POLL_MS;
+
+	now = ktime_get_mono_fast_ns();
+
+	/*
+	 * Mirror jockey3_watchdog_check()'s own time-based grace window
+	 * (see its kernel-doc): while still inside it, the deadline to chase
+	 * is urbs_started_time + grace_ms regardless of whether an early
+	 * completion has already advanced last_callback_time, or this would
+	 * schedule a tight re-poll off a completion that does not end grace.
+	 */
+	if (now - started < (u64)grace_ms * NSEC_PER_MSEC) {
+		last = started;
+		threshold_ms = grace_ms;
+	} else if (!last) {
+		last = started;
+	}
+
+	remaining_ns = last + threshold_ms * NSEC_PER_MSEC - now;
+
+	if ((s64)remaining_ns <= 0)
+		return JOCKEY3_WATCHDOG_MIN_POLL_MS;
+
+	return clamp_t(unsigned long, div_u64(remaining_ns, NSEC_PER_MSEC),
+		       JOCKEY3_WATCHDOG_MIN_POLL_MS, JOCKEY3_WATCHDOG_POLL_MS);
+}
+
+/* Forward declaration: defined further down, alongside its other caller jockey3_pcm_hw_params() */
+static bool jockey3_stream_is_open(struct jockey3_chip *chip, const int direction);
+
+/*
+ * Schedule the next watchdog tick.
+ *
+ * State-dependent cadence. With no substream open nothing is waiting on ALSA
+ * core's wait_for_avail() timeout, so there is no reason to chase
+ * JOCKEY3_WATCHDOG_STALL_MS; poll at the JOCKEY3_WATCHDOG_POLL_MS ceiling.
+ * Once a substream is open, self-reschedule from the nearer of the two
+ * directions' deadlines, as dev_watchdog() does in net/sched/sch_generic.c.
+ *
+ * Unlike dev_watchdog() the delay is not passed through
+ * round_jiffies_relative(), which rounds to whole seconds -- right for a
+ * multi-second watchdog_timeo, two orders of magnitude too coarse here.
+ *
+ * system_long_wq rather than system_wq: the tick is cheap, but
+ * jockey3_watchdog_check() may call jockey3_recover_urb_stream(), which blocks
+ * for seconds, and system_wq items are expected to be short.
+ */
+static void jockey3_watchdog_arm(struct jockey3_chip *chip)
+{
+	unsigned long delay_ms;
+
+	if (jockey3_stream_is_open(chip, SNDRV_PCM_STREAM_PLAYBACK) ||
+	    jockey3_stream_is_open(chip, SNDRV_PCM_STREAM_CAPTURE))
+		delay_ms = min(jockey3_watchdog_next_delay_ms(chip, &chip->playback),
+			       jockey3_watchdog_next_delay_ms(chip, &chip->capture));
+	else
+		delay_ms = JOCKEY3_WATCHDOG_POLL_MS;
+
+	queue_delayed_work(system_long_wq, &chip->watchdog_work, msecs_to_jiffies(delay_ms));
+}
+
+/**
+ * jockey3_watchdog_clear_stall() - close out a stall that a restart ended
+ * @chip: driver state
+ * @urb_stream: the affected direction
+ * @type: direction name, for the log message
+ *
+ * Every recovery path in this driver goes through jockey3_stop_urbs() and
+ * jockey3_start_urbs(), so a stalled stream is essentially always brought back
+ * by a restart rather than by starting to complete URBs again on its own. If
+ * the restart simply cleared the flag, the watchdog's onset line would never
+ * be paired with anything and the outage would have no recorded end -- which
+ * makes "stalls that ended" indistinguishable from "stalls still open" for
+ * anything reading the log afterwards.
+ *
+ * So the restart closes the outage explicitly. Together with the recovery line
+ * in jockey3_watchdog_check(), every onset has exactly one counterpart.
+ */
+static void jockey3_watchdog_clear_stall(struct jockey3_chip *chip,
+					 struct jockey3_pcm_urb_stream *urb_stream,
+					 const char *type)
+{
+	u64 outage_ns = 0;
+	bool reported;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		reported = urb_stream->stall_reported;
+		if (reported)
+			outage_ns = ktime_get_mono_fast_ns() - urb_stream->stall_since;
+		urb_stream->stall_reported = false;
+	}
+
+	if (reported)
+		dev_warn(&chip->intf0->dev,
+			 "%s URB stream restarted after stalling for %llu ms\n",
+			 type, div_u64(outage_ns, NSEC_PER_MSEC));
+}
+
+/*
+ * Stop the watchdog from the URB teardown path.
+ *
+ * Deliberately the non-sync cancel: jockey3_stop_urbs() runs inside rate_mutex
+ * at several sites and the work item takes locks of its own, so waiting for a
+ * running tick here would be a deadlock waiting to happen. Not waiting is safe
+ * because a tick that is already running re-reads 'stopping' under the stream
+ * lock and does nothing. The sync cancel that teardown does need lives in
+ * jockey3_disconnect() and in probe's error path, where no mutex is held.
+ */
+static void jockey3_watchdog_disarm(struct jockey3_chip *chip)
+{
+	cancel_delayed_work(&chip->watchdog_work);
+}
+
+/**
+ * jockey3_stop_urbs() - stop all PCM and MIDI URBs
+ * @chip: driver state
+ *
+ * Fences the completion handlers, then kills every URB. Sleeps, so it must not
+ * be called from atomic context. On return no completion handler is running and
+ * none can resubmit.
+ */
+static void jockey3_stop_urbs(struct jockey3_chip *chip)
+{
+	dev_dbg(&chip->intf0->dev, "Stopping all URBs\n");
+
+	jockey3_watchdog_disarm(chip);
+
+	/*
+	 * Fence the completion handlers before killing anything. Each 'stopping'
+	 * store pairs with the test the matching handler makes while holding the
+	 * same lock it uses to anchor and resubmit, so once these guards are
+	 * released no handler can add a URB back to an anchor we are about to
+	 * drain. The spinlocks provide the required ordering; no explicit barrier
+	 * is needed.
+	 *
+	 * These stores must also stay above the timestamp zeroing below. The
+	 * watchdog is disarmed without waiting for a tick that is already
+	 * running, and such a tick samples the timestamps before it takes the
+	 * stream lock; 'stopping' being set by the time it gets there is the only
+	 * thing that stops it reporting a stall for a stream we stopped on purpose.
+	 */
+	scoped_guard(spinlock_irqsave, &chip->playback.lock)
+		chip->playback.stopping = true;
+	scoped_guard(spinlock_irqsave, &chip->capture.lock)
+		chip->capture.stopping = true;
+	scoped_guard(spinlock_irqsave, &chip->midi_lock)
+		chip->midi_stopping = true;
+
+	/*
+	 * usb_kill_urb()/usb_kill_anchored_urbs() do not return until the
+	 * completion handler of each URB has finished, so no callback can still
+	 * be in its safe zone once these return -- no separate drain is needed
+	 * here (jockey3_pcm_sync_stop() covers the ALSA buffer-teardown path).
+	 *
+	 * Worth spelling out for the anchored form, which keeps getting read as
+	 * a use-after-free: __usb_hcd_giveback_urb() does unanchor before
+	 * urb->complete(), so the kill loop cannot find a running handler on the
+	 * list. anchor->suspend_wakeups covers it -- raised before the unanchor
+	 * and dropped after complete() returns, and usb_kill_anchored_urbs()
+	 * drains until usb_anchor_check_wakeup() sees it zero.
+	 */
+	usb_kill_urb(chip->midi_in_urb);
+	usb_kill_anchored_urbs(&chip->playback.anchor);
+	usb_kill_anchored_urbs(&chip->capture.anchor);
+
+	/*
+	 * Drop the liveness timestamps: a stale value would otherwise make
+	 * jockey3_check_urb_stream_alive() report a stopped stream as alive for
+	 * up to its 1 ms window. The cadence counters go with them so the next
+	 * start's jockey3_stream_streaming_healthy() sees only its own completions.
+	 */
+	atomic64_set(&chip->playback.last_callback_time, 0);
+	atomic64_set(&chip->capture.last_callback_time, 0);
+	atomic64_set(&chip->playback.first_callback_time, 0);
+	atomic64_set(&chip->capture.first_callback_time, 0);
+	atomic_set(&chip->playback.completions_since_start, 0);
+	atomic_set(&chip->capture.completions_since_start, 0);
+	atomic64_set(&chip->playback.urbs_started_time, 0);
+	atomic64_set(&chip->capture.urbs_started_time, 0);
+
+	/* after killing the URBs there will be no in-flight requests anymore since the callback
+	 * function has been called as part of the shutdown. The number of in-flight URBs should
+	 * therefore be zero at this point. Log an inconsistency error if not.
+	 */
+	if (atomic_read(&chip->playback.urbs_in_flight) != 0)
+		dev_err(&chip->intf0->dev, "Inconsistent URB in-flight count: playback=%d != 0\n",
+			atomic_read(&chip->playback.urbs_in_flight));
+	if (atomic_read(&chip->capture.urbs_in_flight) != 0)
+		dev_err(&chip->intf0->dev, "Inconsistent URB in-flight count: capture=%d != 0\n",
+			atomic_read(&chip->capture.urbs_in_flight));
+}
+
+/*
+ * Demote an unplug, as jockey3_start_urbs_failed() already does for the
+ * aggregate result. -%ENOENT stays loud: the endpoints were disabled while the
+ * driver is still bound, which takes a device reset to undo.
+ *
+ * @slot is the ring slot, or -1 for the single MIDI IN URB.
+ */
+static void jockey3_submit_failed(struct jockey3_chip *chip, int err,
+				  const char *what, int slot)
+{
+	if (jockey3_err_device_gone(err)) {
+		if (slot < 0)
+			dev_dbg(&chip->intf0->dev,
+				"Not submitting the %s URB: device is gone (%d)\n", what, err);
+		else
+			dev_dbg(&chip->intf0->dev,
+				"Not submitting %s URB %d: device is gone (%d)\n",
+				what, slot, err);
+		return;
+	}
+
+	if (slot < 0)
+		dev_err(&chip->intf0->dev, "Failed to submit the %s URB: %d\n", what, err);
+	else
+		dev_err(&chip->intf0->dev, "Failed to submit %s URB %d: %d\n",
+			what, slot, err);
+}
+
+/**
+ * jockey3_start_urbs() - submit all PCM and MIDI URBs
+ * @chip: driver state
+ * @warm: true only for the stall watchdog's own lightweight restart of a ring
+ *	that was streaming a moment earlier; false for a cold start (first open,
+ *	rate change, USB reset, resume, probe). Both share start_grace_ms; this
+ *	only labels the restart for dev_dbg() and is recorded chip-wide in
+ *	@chip->warm_start.
+ *
+ * Clears the stop fences and error budgets, then submits the full URB ring for
+ * both directions plus the MIDI IN URB. Uses GFP_KERNEL, so process context
+ * only. A failure to submit one URB does not prevent the others being tried.
+ *
+ * The return value must be checked. Only a completion handler resubmits a URB,
+ * so a ring that comes up short stays short: nothing retries the URBs that
+ * failed here, and the direction runs at reduced depth for as long as the
+ * device stays bound, with no bookkeeping that would ever notice. Callers pass
+ * the result to jockey3_start_urbs_failed(), or return it to their own caller.
+ *
+ * Return: 0 on success, or the first submit error encountered.
+ */
+static int jockey3_start_urbs(struct jockey3_chip *chip, bool warm)
+{
+	int i, ret, first_err = 0;
+	int n_playback = 0, n_capture = 0;
+	u8 playback_n_pkts, capture_n_pkts;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	/*
+	 * Belt and braces; jockey3_recover_urb_stream() is what actually bails.
+	 * jockey3_restore_device() clears the flag before its own restart.
+	 */
+	if (jockey3_is_suspended(chip))
+		return -ESHUTDOWN;
+
+	dev_dbg(&chip->intf0->dev, "Starting all URBs (%s start, grace %u ms)\n",
+		warm ? "warm" : "cold", jockey3_start_grace_ms());
+
+	/*
+	 * Clear the error budget as well: a stream that was given up on must get
+	 * a fresh JOCKEY3_MAX_URB_ERRORS allowance, otherwise the first error
+	 * after a restart would immediately exceed the stale count and give up
+	 * again with no retries.
+	 */
+	scoped_guard(spinlock_irqsave, &chip->playback.lock) {
+		chip->playback.stopping = false;
+		chip->playback.consec_errors = 0;
+	}
+	scoped_guard(spinlock_irqsave, &chip->capture.lock) {
+		chip->capture.stopping = false;
+		chip->capture.consec_errors = 0;
+	}
+	scoped_guard(spinlock_irqsave, &chip->midi_lock) {
+		chip->midi_stopping = false;
+		chip->midi_consec_errors = 0;
+	}
+
+	/* Report and clear any stall this restart is about to end */
+	jockey3_watchdog_clear_stall(chip, &chip->playback, "Playback");
+	jockey3_watchdog_clear_stall(chip, &chip->capture, "Capture");
+
+	/*
+	 * Stamp the start before submitting, not after: this is what the
+	 * watchdog measures from until the first completion arrives, and a URB
+	 * can complete before the loop below has finished. Reset the cadence
+	 * counters in the same breath, and record which grace applies.
+	 */
+	WRITE_ONCE(chip->warm_start, warm);
+	atomic64_set(&chip->playback.first_callback_time, 0);
+	atomic64_set(&chip->capture.first_callback_time, 0);
+	atomic_set(&chip->playback.completions_since_start, 0);
+	atomic_set(&chip->capture.completions_since_start, 0);
+	atomic64_set(&chip->playback.urbs_started_time, ktime_get_mono_fast_ns());
+	atomic64_set(&chip->capture.urbs_started_time, ktime_get_mono_fast_ns());
+
+	/*
+	 * Each direction's ring is (re)armed at its own current N
+	 * (jockey3_pcm_hw_params()), which persists across a restart rather than
+	 * falling back to the JOCKEY3_PLAYBACK_N/JOCKEY3_CAPTURE_N default just
+	 * because the ring turned over. A direction with no open stream is held
+	 * at that default by jockey3_pcm_close(), so it always re-arms at a
+	 * safe N.
+	 *
+	 * Both are read once here rather than per iteration: they are written
+	 * under the stream lock, which is not held here, so a re-load could
+	 * leave URBs in the same ring armed at different lengths.
+	 */
+	playback_n_pkts = READ_ONCE(chip->playback.n_pkts);
+	capture_n_pkts = READ_ONCE(chip->capture.n_pkts);
+
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		chip->playback.urbs[i]->transfer_buffer_length =
+			playback_n_pkts * PLOYTEC_PKT_SIZE;
+		chip->capture.urbs[i]->transfer_buffer_length =
+			capture_n_pkts * PLOYTEC_PKT_SIZE;
+
+		atomic_inc(&chip->playback.urbs_in_flight);
+		usb_anchor_urb(chip->playback.urbs[i], &chip->playback.anchor);
+		ret = usb_submit_urb(chip->playback.urbs[i], GFP_KERNEL);
+		if (ret < 0) {
+			atomic_dec(&chip->playback.urbs_in_flight);
+			usb_unanchor_urb(chip->playback.urbs[i]);
+			jockey3_submit_failed(chip, ret, "playback", i);
+			if (!first_err)
+				first_err = ret;
+		} else {
+			n_playback++;
+		}
+
+		atomic_inc(&chip->capture.urbs_in_flight);
+		usb_anchor_urb(chip->capture.urbs[i], &chip->capture.anchor);
+		ret = usb_submit_urb(chip->capture.urbs[i], GFP_KERNEL);
+		if (ret < 0) {
+			atomic_dec(&chip->capture.urbs_in_flight);
+			usb_unanchor_urb(chip->capture.urbs[i]);
+			jockey3_submit_failed(chip, ret, "capture", i);
+			if (!first_err)
+				first_err = ret;
+		} else {
+			n_capture++;
+		}
+	}
+	ret = usb_submit_urb(chip->midi_in_urb, GFP_KERNEL);
+	if (ret < 0) {
+		jockey3_submit_failed(chip, ret, "MIDI IN", -1);
+		if (!first_err)
+			first_err = ret;
+	}
+
+	if (n_playback < JOCKEY3_N_URBS || n_capture < JOCKEY3_N_URBS) {
+		if (jockey3_err_device_gone(first_err))
+			dev_dbg(&chip->intf0->dev,
+				"Started only %d/%d playback and %d/%d capture URBs; device is gone\n",
+				n_playback, JOCKEY3_N_URBS, n_capture, JOCKEY3_N_URBS);
+		else
+			dev_err(&chip->intf0->dev,
+				"Started only %d/%d playback and %d/%d capture URBs; ring will not refill\n",
+				n_playback, JOCKEY3_N_URBS, n_capture, JOCKEY3_N_URBS);
+	}
+
+	/*
+	 * Arm regardless of first_err. A ring that came up short, or did not come
+	 * up at all, is precisely the state worth watching: when the endpoints
+	 * have been disabled underneath us every submit fails and nothing is left
+	 * to report the resulting silence.
+	 */
+	jockey3_watchdog_arm(chip);
+
+	return first_err;
+}
+
+/**
+ * jockey3_start_urbs_failed() - react to a failed jockey3_start_urbs()
+ * @chip: driver state
+ * @err: the value jockey3_start_urbs() returned; 0 is ignored
+ * @context: what was being attempted, for the log message
+ *
+ * Classifies a submit failure so that a condition needing a device reset is not
+ * mistaken for an ordinary unplug:
+ *
+ * - %-ENOENT means the endpoint is administratively gone while the driver is
+ *   still bound. usb_submit_urb() reports it when usb_pipe_endpoint() finds no
+ *   endpoint, and usb_hcd_link_urb_to_ep() when the endpoint is not enabled --
+ *   which is the state usb_set_interface() leaves interface 0 in when its
+ *   SET_INTERFACE request fails, since it disables the endpoints before sending
+ *   the request and does not re-enable them on that path. Nothing short of
+ *   re-enumerating the device restores it.
+ *
+ * - %-ENODEV means the device is already detached, so a reset would be
+ *   pointless and jockey3_disconnect() is on its way. This is the common case
+ *   on an ordinary unplug and must not be treated like the one above.
+ *
+ * - anything else is reported and left alone; the watchdog picks up whatever
+ *   silence results.
+ *
+ * Note that trying to undo the failure by selecting the working altsetting
+ * again does not work: if the control endpoint is unresponsive, that request
+ * times out as well and the endpoints stay disabled regardless.
+ */
+static void jockey3_start_urbs_failed(struct jockey3_chip *chip, int err, const char *context)
+{
+	if (!err)
+		return;
+
+	if (err == -ENODEV || jockey3_is_disconnected(chip)) {
+		dev_dbg(&chip->intf0->dev, "Could not start URBs after %s: device is gone\n",
+			context);
+		return;
+	}
+
+	if (err == -ESHUTDOWN || jockey3_is_suspended(chip)) {
+		dev_dbg(&chip->intf0->dev,
+			"Could not start URBs after %s: device is suspended; the resume path will start them\n",
+			context);
+		return;
+	}
+
+	if (err == -ENOENT) {
+		dev_err(&chip->intf0->dev,
+			"Endpoints are disabled after %s; the device needs a reset to restore them\n",
+			context);
+		return;
+	}
+
+	dev_err(&chip->intf0->dev, "Failed to start URBs after %s: %d\n", context, err);
+}
+
+/*
+ * Log a failed rate-change step at the severity it deserves, matching what
+ * jockey3_start_urbs_failed() applies on the URB path.
+ */
+static void jockey3_rate_step_failed(struct jockey3_chip *chip, int err, const char *what)
+{
+	if (jockey3_err_device_gone(err)) {
+		dev_dbg(&chip->intf0->dev, "%s: device is gone (%d)\n", what, err);
+		return;
+	}
+
+	dev_err(&chip->intf0->dev, "%s: %d\n", what, err);
+}
+
+static int jockey3_set_rate(struct jockey3_chip *chip, unsigned int rate, bool cold_init)
+{
+	int ret;
+	u32 current_hw_rate;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	dev_dbg(&chip->intf0->dev, "Setting rate to %u Hz\n", rate);
+
+	ret = ploytec_initialize_device(chip->intf0, chip->xfer_buf, !cold_init, NULL);
+	if (ret < 0) {
+		jockey3_rate_step_failed(chip, ret, "Failed to initialize device to change rate");
+		return ret;
+	}
+
+	ret = ploytec_get_rate(chip->intf0, chip->xfer_buf, PLOYTEC_RATE_IDX_DEVICE,
+			       &current_hw_rate);
+	if (ret < 0) {
+		jockey3_rate_step_failed(chip, ret, "Failed to read current hardware rate");
+		return ret;
+	}
+	dev_dbg(&chip->intf0->dev, "Current hardware rate: %u Hz\n", current_hw_rate);
+
+	/*
+	 * Program the rate even when the device already reports it. Skipping the
+	 * write on a match would silently elide it during probe every time,
+	 * since initialization always asks for 44100 Hz and that is also the
+	 * device's power-on default. The write evidently does more than set a
+	 * frequency; no vendor initialization omits it. See
+	 * re/usb/init_timing_comparison.md.
+	 *
+	 * Callers that want to avoid a redundant rate change already check
+	 * against chip->current_rate before getting here.
+	 */
+	dev_dbg(&chip->intf0->dev, "Setting hardware rate: %u Hz\n", rate);
+	ret = ploytec_set_rate(chip->intf0, chip->xfer_buf, rate, cold_init);
+	if (ret < 0) {
+		jockey3_rate_step_failed(chip, ret, "Failed to set rate");
+		return ret;
+	}
+	ret = ploytec_start_streaming(chip->intf0, chip->xfer_buf);
+	if (ret < 0) {
+		jockey3_rate_step_failed(chip, ret, "Failed to start streaming after rate change");
+		return ret;
+	}
+
+	dev_dbg(&chip->intf0->dev, "Rate set OK\n");
+	return 0;
+}
+
+static bool jockey3_stream_is_open(struct jockey3_chip *chip, const int direction)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+	bool open;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		open = urb_stream->substream;
+	}
+	return open;
+}
+
+/* Forward declaration: defined further down, alongside its other callers jockey3_pcm_hw_params()
+ * and jockey3_pcm_prepare()
+ */
+static int jockey3_recover_urb_stream(struct jockey3_chip *chip, const int direction,
+				      const char *context, bool report_xrun);
+
+static bool jockey3_check_urb_stream_alive(const struct jockey3_pcm_urb_stream *urb_stream)
+{
+	u64 last_time = atomic64_read(&urb_stream->last_callback_time);
+	u64 window_ns = JOCKEY3_LIVENESS_WINDOW_NS(READ_ONCE(urb_stream->n_shift));
+
+	if (!last_time)
+		return false;
+
+	/*
+	 * Alive if we had activity within the last window_ns. The window
+	 * must exceed one URB span (@n_pkts packet intervals) or a
+	 * perfectly healthy stream could sample as dead between completions
+	 * -- and scaling it with N (see JOCKEY3_LIVENESS_WINDOW_NS()) keeps
+	 * the same margin against that span at any N, rather than a fixed
+	 * window eating into a shrinking margin as N grows.
+	 */
+	return (ktime_get_mono_fast_ns() - last_time <= window_ns);
+}
+
+/*
+ * Shortest wall-clock time one URB's worth of audio can legitimately occupy:
+ * @n_pkts Ploytec packets, PLOYTEC_PLAYBACK_FRAMES (10) or
+ * PLOYTEC_CAPTURE_FRAMES (8) PCM frames each, at @rate. Returns 0 if @rate or
+ * N is not yet known. Completions arriving in a small fraction of this are a
+ * hardware-side FIFO draining or the host controller retiring transfer
+ * descriptors, not the device's audio pipeline running.
+ */
+static u64 jockey3_min_urb_interval_ns(const struct jockey3_pcm_urb_stream *urb_stream,
+				       unsigned int rate, bool is_playback)
+{
+	unsigned int fpp = is_playback ? PLOYTEC_PLAYBACK_FRAMES : PLOYTEC_CAPTURE_FRAMES;
+	unsigned int n = READ_ONCE(urb_stream->n_pkts);
+
+	if (!rate || !n)
+		return 0;
+
+	return div_u64((u64)n * fpp * NSEC_PER_SEC, rate);
+}
+
+/*
+ * jockey3_stream_streaming_healthy() - is this direction actually streaming,
+ * as opposed to having produced a trickle of implausibly fast completions?
+ *
+ * jockey3_check_urb_stream_alive() answers "did anything complete just now",
+ * which a single FIFO-drain completion satisfies. This is the stricter test,
+ * used at the one decision that must not be fooled by trickle: whether the
+ * stall watchdog's warm URB restart worked, or the ladder should escalate to a
+ * full USB reset (a stream-killing event, and on this hardware one that can
+ * leave the capture endpoint down). It requires
+ *
+ *   - at least JOCKEY3_HEALTHY_MIN_COMPLETIONS completions since the last
+ *     start -- more than a FIFO drain supplies, and a real stream lands
+ *     hundreds inside any plausible grace;
+ *   - those spread over at least half the time that many real URBs would take
+ *     (rejects a fast burst);
+ *   - the most recent one still within jockey3_check_urb_stream_alive()'s
+ *     N-scaled liveness window (rejects a burst that then stopped).
+ *
+ * With no programmed rate it cannot form the interval and reports not-healthy
+ * rather than fall back to a weaker test; @current_rate is always set while a
+ * stream is recovering.
+ */
+static bool jockey3_stream_streaming_healthy(struct jockey3_chip *chip,
+					     const struct jockey3_pcm_urb_stream *urb_stream)
+{
+	bool is_playback = urb_stream == &chip->playback;
+	const char *type = is_playback ? "Playback" : "Capture";
+	u64 first = atomic64_read(&urb_stream->first_callback_time);
+	u64 last = atomic64_read(&urb_stream->last_callback_time);
+	int n = atomic_read(&urb_stream->completions_since_start);
+	unsigned int rate = READ_ONCE(chip->current_rate);
+	u64 min_interval, span, floor;
+
+	/* Not enough completions yet to judge -- the common "still warming up"
+	 * state during the poll, kept silent so it does not flood the log.
+	 */
+	if (n < JOCKEY3_HEALTHY_MIN_COMPLETIONS || !first || last <= first)
+		return false;
+
+	min_interval = jockey3_min_urb_interval_ns(urb_stream, rate, is_playback);
+	if (!min_interval) {
+		dev_dbg_ratelimited(&chip->intf0->dev,
+				    "%s health: no programmed rate, cannot judge cadence\n", type);
+		return false;
+	}
+
+	span = last - first;
+	floor = (u64)(n - 1) * (min_interval >> 1);
+	if (span < floor) {
+		dev_dbg_ratelimited(&chip->intf0->dev,
+				    "%s health: %d completions in %llu us spans < %llu us floor -- still trickle\n",
+				    type, n, div_u64(span, NSEC_PER_USEC),
+				    div_u64(floor, NSEC_PER_USEC));
+		return false;
+	}
+
+	if (ktime_get_mono_fast_ns() - last >
+	    JOCKEY3_LIVENESS_WINDOW_NS(READ_ONCE(urb_stream->n_shift))) {
+		dev_dbg_ratelimited(&chip->intf0->dev,
+				    "%s health: cadence plausible but last completion is stale\n",
+				    type);
+		return false;
+	}
+
+	dev_dbg(&chip->intf0->dev,
+		"%s health: streaming -- %d completions, ~%llu us/URB (min %llu us)\n",
+		type, n, div_u64(span, (u64)(n - 1) * NSEC_PER_USEC),
+		div_u64(min_interval, NSEC_PER_USEC));
+	return true;
+}
+
+/**
+ * jockey3_watchdog_check() - one direction's share of a watchdog tick
+ * @chip: driver state
+ * @direction: SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE
+ *
+ * Reports a direction that has stopped completing URBs and, on the onset edge,
+ * recovers it -- the only path that catches a stall mid-stream, with no PCM
+ * ioctl to hand it to. Gated as jockey3_pcm_hw_params() gates its own capture
+ * recovery: Playback always recovers because it carries MIDI OUT; Capture only
+ * if a capture stream is open, since the ladder restarts the shared ring and
+ * an idle Capture stall would glitch working Playback for no visible gain. It
+ * is logged and left for the next capture open.
+ *
+ * Logging is edge-triggered, one line per stall start and end. The measured
+ * age is reported rather than the threshold, since the poll interval would
+ * only bound it to one tick.
+ *
+ * Deliberately does not gate on urbs_in_flight: endpoints disabled underneath
+ * the driver leave nothing in flight, which is the case that must not go
+ * unnoticed. The count is reported as evidence -- a full ring means
+ * "submitted, never returned", an empty one "nothing could be submitted".
+ *
+ * The onset tags itself "startup" or "steady-state" after which threshold
+ * caught it: the start grace, or JOCKEY3_WATCHDOG_STALL_MS once that window
+ * has passed. Only "steady-state" is a real mid-stream fault.
+ *
+ * Time-based rather than keyed off the first completion: at low N a restart
+ * can complete an URB within under a millisecond, a hardware FIFO draining
+ * rather than the pipeline catching up, so an early completion must not end
+ * the grace. jockey3_stream_streaming_healthy() applies the same reasoning in
+ * the recovery ladder.
+ */
+static void jockey3_watchdog_check(struct jockey3_chip *chip, const int direction)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+	const char *type = direction == SNDRV_PCM_STREAM_PLAYBACK ? "Playback" : "Capture";
+	bool log_onset = false, log_recovery = false;
+	u64 now, last, started, age_ns, outage_ns = 0;
+	u64 threshold_ms = JOCKEY3_WATCHDOG_STALL_MS;
+	unsigned int grace_ms = jockey3_start_grace_ms();
+	bool open = false, startup = false;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		/*
+		 * One flag covers every deliberate stop -- rate change, suspend,
+		 * pre_reset and teardown all reach jockey3_stop_urbs(). Checked
+		 * before now/last/age_ns are sampled, not after: this tick can
+		 * have been sitting on system_long_wq for a while before it got
+		 * to run, and a stop+restart cycle -- which routinely takes on
+		 * the order of 100 ms, far longer than this spinlock is ever
+		 * held -- can complete inside that wait. Sampling first and
+		 * checking stopping second, as this used to, let a tick whose
+		 * data predated the stop act on it once stopping had already
+		 * gone false again, misreporting a rate change's own deliberate
+		 * silence as a stall. See re/rate_change_stall.md for the
+		 * hardware traces this closed.
+		 */
+		if (urb_stream->stopping) {
+			urb_stream->stall_reported = false;
+			return;
+		}
+
+		/*
+		 * Read both candidate baselines before sampling @now, whichever
+		 * one ends up used below: a completion landing on another CPU
+		 * between reading a baseline and reading @now would otherwise let
+		 * "now - last" underflow to a u64 near its max instead of going
+		 * negative. Reading both first guarantees @now is taken no
+		 * earlier than either.
+		 */
+		started = atomic64_read(&urb_stream->urbs_started_time);
+		last = atomic64_read(&urb_stream->last_callback_time);
+		now = ktime_get_mono_fast_ns();
+
+		if (!started)
+			return;		/* never started; nothing to watch yet */
+
+		if (now - started < (u64)grace_ms * NSEC_PER_MSEC) {
+			/*
+			 * Still inside the fixed post-restart grace window --
+			 * measured from urbs_started_time regardless of whether
+			 * last_callback_time has already advanced. See this
+			 * function's kernel-doc for why an early completion is
+			 * not treated as proof the window is over.
+			 */
+			last = started;
+			threshold_ms = grace_ms;
+			startup = true;
+		} else if (!last) {
+			/* Past the grace window and still never completed once */
+			last = started;
+		}
+
+		age_ns = now - last;
+
+		open = urb_stream->substream;
+
+		if (age_ns > threshold_ms * NSEC_PER_MSEC) {
+			if (!urb_stream->stall_reported) {
+				urb_stream->stall_reported = true;
+				urb_stream->stall_since = last;
+				log_onset = true;
+			}
+		} else if (urb_stream->stall_reported) {
+			urb_stream->stall_reported = false;
+			/*
+			 * @last is the completion that ended the outage and
+			 * @stall_since the one before it started, so the
+			 * difference is the true gap rather than a rounding of
+			 * it to the poll interval.
+			 */
+			outage_ns = last - urb_stream->stall_since;
+			log_recovery = true;
+		}
+	}
+
+	if (log_onset) {
+		dev_warn(&chip->intf0->dev,
+			 "%s URB stream stalled: no completion for %llu ms (%d URBs in flight, substream %s, %s)\n",
+			 type, div_u64(age_ns, NSEC_PER_MSEC),
+			 atomic_read(&urb_stream->urbs_in_flight),
+			 open ? "open" : "idle",
+			 startup ? "startup" : "steady-state");
+		if (startup)
+			dev_dbg(&chip->intf0->dev,
+				"%s stall was inside the %s start grace (%u ms)\n", type,
+				READ_ONCE(chip->warm_start) ? "warm" : "cold", grace_ms);
+	} else if (log_recovery) {
+		dev_warn(&chip->intf0->dev, "%s URB stream recovered after %llu ms\n",
+			 type, div_u64(outage_ns, NSEC_PER_MSEC));
+	}
+
+	if (log_onset && (direction == SNDRV_PCM_STREAM_PLAYBACK || open))
+		jockey3_recover_urb_stream(chip, direction, "watchdog", true);
+}
+
+/**
+ * jockey3_watchdog_work() - periodic URB liveness check
+ * @work: the chip's watchdog_work
+ *
+ * Every error path in this driver hangs off a URB completion, so a device that
+ * simply stops completing URBs is invisible to all of them: nothing runs, so
+ * nothing is logged. A playback stream in that state does not even produce an
+ * xrun, because the hardware pointer never advances far enough to overtake the
+ * application. This is the only place that can notice such a silence, which is
+ * why it runs for the device's whole lifetime rather than only while a PCM
+ * stream is open -- the URBs do too, since MIDI OUT rides in every playback
+ * packet and there is no idle state in which "no completions" is legitimate.
+ *
+ * Acts as well as detects: jockey3_watchdog_check() calls
+ * jockey3_recover_urb_stream() directly on a new stall onset. This is the
+ * only place recovery can be triggered without some PCM ioctl (hw_params,
+ * prepare) re-entering the driver first -- necessary because a long-running,
+ * uninterrupted stream never re-enters otherwise, and ALSA core's own
+ * wait_for_avail() (sound/core/pcm_lib.c) times out the open substream with
+ * -EIO on its own schedule regardless of whether this driver ever notices.
+ * jockey3_watchdog_arm()'s cadence tightens while a PCM stream is open, for
+ * exactly this reason.
+ *
+ * Calling into jockey3_recover_urb_stream() from here is safe even though it
+ * calls jockey3_stop_urbs(), which disarms this same work item: the disarm is
+ * the non-sync cancel_delayed_work(), which never blocks and only prevents a
+ * future queueing -- it does not affect the tick that is already running
+ * (this one). The reset jockey3_recover_urb_stream() may queue runs on
+ * system_wq (drivers/usb/core/message.c's usb_queue_reset_device()), not
+ * system_long_wq where this tick runs, so the two cannot serialize behind
+ * each other; and rate_mutex is not held across the wait for that reset
+ * (jockey3_recover_urb_stream() drops it first), which is what lets
+ * jockey3_pre_reset()/jockey3_post_reset() take the mutex themselves and
+ * complete while this tick is blocked waiting.
+ */
+static void jockey3_watchdog_work(struct work_struct *work)
+{
+	struct jockey3_chip *chip = container_of(to_delayed_work(work),
+						 struct jockey3_chip, watchdog_work);
+
+	/*
+	 * Suspend as well as teardown: jockey3_stop_urbs() disarms with the
+	 * non-sync cancel_delayed_work(), which leaves a tick that is already
+	 * running to finish. Without this it would requeue itself and keep
+	 * ticking for the whole suspend, for no purpose -- every check below
+	 * bails out on the suspended flag anyway. Resume re-arms via
+	 * jockey3_start_urbs().
+	 */
+	if (jockey3_is_disconnected(chip) || jockey3_is_suspended(chip))
+		return;
+
+	/*
+	 * A reset stops and restarts the URBs from the USB core's own workqueue.
+	 * Sampling in the middle of that would report a stall that is both
+	 * expected and already being dealt with.
+	 */
+	if (!jockey3_is_resetting(chip)) {
+		jockey3_watchdog_check(chip, SNDRV_PCM_STREAM_PLAYBACK);
+		jockey3_watchdog_check(chip, SNDRV_PCM_STREAM_CAPTURE);
+	}
+
+	jockey3_watchdog_arm(chip);
+}
+
+/*
+ * Poll a stream for up to timeout_ms. With @require_healthy false the bar is
+ * jockey3_check_urb_stream_alive() -- "something completed just now", enough
+ * for the cold-start paths that only ask whether the ring came up. With it
+ * true the bar is jockey3_stream_streaming_healthy(), which a trickle of
+ * FIFO-drain completions cannot clear; used where a false pass would escalate
+ * to a needless USB reset. Always logs a dev_warn on timeout regardless of
+ * whether the caller acts on the result, so stall frequency (Playback and
+ * Capture alike) stays trackable in the field via dmesg.
+ */
+/*
+ * @fresh_start: this wait follows a jockey3_start_urbs() the caller just did, so
+ *	the confirmation latency is reported as the time from that restart to the
+ *	first completion (@urbs_started_time -> @first_callback_time), not from
+ *	when this poll loop happened to begin. The two directions are checked one
+ *	after the other, so measuring from loop entry would credit the whole of
+ *	the first direction's confirmation to the second direction's start time
+ *	and under-report it -- Capture routinely printed "after 0 ms" only
+ *	because Playback had already burned the first several ms. Pass false for a
+ *	bare .prepare() liveness check on an already-running ring, where
+ *	@urbs_started_time is stale and the meaningful number is how long this
+ *	call spent polling.
+ */
+static bool jockey3_wait_urb_stream_started(struct jockey3_chip *chip, const int direction,
+					    const unsigned int timeout_ms, bool require_healthy,
+					    bool fresh_start)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+	const char *type = direction == SNDRV_PCM_STREAM_PLAYBACK ? "Playback" : "Capture";
+	u64 since_ns = fresh_start ? atomic64_read(&urb_stream->urbs_started_time) : 0;
+	unsigned long start = jiffies;
+	unsigned long deadline = start + msecs_to_jiffies(timeout_ms);
+	u64 first, last;
+
+	dev_dbg(&chip->intf0->dev, "Waiting up to %u ms for %s to %s\n",
+		timeout_ms, type, require_healthy ? "stream steadily" : "show liveness");
+
+	while (time_before(jiffies, deadline)) {
+		/*
+		 * A device that went down mid-wait completes nothing until it is
+		 * restored; spinning out the grace only delays the caller's next
+		 * decision, which in the recovery path is whether to reset.
+		 */
+		if (jockey3_is_disconnected(chip) || jockey3_is_suspended(chip))
+			return false;
+
+		if (require_healthy ? jockey3_stream_streaming_healthy(chip, urb_stream)
+				    : jockey3_check_urb_stream_alive(urb_stream)) {
+			u64 mark;
+			unsigned int elapsed_ms;
+
+			first = atomic64_read(&urb_stream->first_callback_time);
+			if (since_ns && first >= since_ns)
+				mark = first;
+			else if (since_ns)
+				mark = ktime_get_mono_fast_ns();
+			else
+				mark = 0;
+			elapsed_ms = mark ? div_u64(mark - since_ns, NSEC_PER_MSEC)
+					  : jiffies_to_msecs(jiffies - start);
+
+			dev_dbg(&chip->intf0->dev, "%s confirmed %s after %u ms\n", type,
+				require_healthy ? "streaming" : "alive", elapsed_ms);
+			return true;
+		}
+
+		usleep_range(500, 2000);
+	}
+
+	dev_warn(&chip->intf0->dev, "%s URB has stalled.\n", type);
+
+	/* What the grace saw when it gave up: too few completions is silence or
+	 * trickle, many with a tight first->last span is a burst that stopped.
+	 */
+	first = atomic64_read(&urb_stream->first_callback_time);
+	last = atomic64_read(&urb_stream->last_callback_time);
+	dev_dbg(&chip->intf0->dev,
+		"%s stall detail: %d completions since start, first->last %llu us, %d URBs in flight\n",
+		type, atomic_read(&urb_stream->completions_since_start),
+		(first && last > first) ? div_u64(last - first, NSEC_PER_USEC) : 0,
+		atomic_read(&urb_stream->urbs_in_flight));
+	return false;
+}
+
+/**
+ * jockey3_recover_urb_stream() - bring a stalled direction back
+ * @chip: driver state
+ * @direction: SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE
+ * @context: short description of what found the stall, for the log
+ * @report_xrun: report an xrun on both directions' open substreams once
+ *	recovery is committed to -- both, since the ring is shared regardless of
+ *	which direction stalled. True only when a running stream just lost
+ *	continuity; false when the caller already expects the discontinuity (a
+ *	rate change) or nothing has flowed yet (.prepare).
+ *
+ * Shared by jockey3_pcm_hw_params()'s post-rate-change check,
+ * jockey3_pcm_prepare()'s liveness check and jockey3_watchdog_check()'s
+ * mid-stream detection. Every call site confirms the stall first, and a
+ * direction found alive at entry returns immediately, so two sequential calls
+ * for one stall are cheap.
+ *
+ * Concurrent calls need more: two can both pass the alive check before either
+ * restarts anything, then run competing stop/start sequences or resets.
+ * @chip->recovery_in_progress closes that -- one ladder at a time, chip-wide.
+ * Without it a watchdog tick and a racing jockey3_pcm_prepare() retry collide
+ * and produce -EPROTO on every endpoint, needing a re-enumeration to clear.
+ *
+ * Ladder: a lightweight URB stop/start, then a full USB reset if that did not
+ * take, queued with usb_queue_reset_device() and awaited by
+ * jockey3_wait_for_reset_completion() rather than calling usb_reset_device()
+ * from ioctl context -- see there for why. The reset step is gated on
+ * jockey3_recovery_budget_take(), so a chip that keeps stalling is not reset
+ * in a tight loop.
+ *
+ * The onset line is ratelimited: jockey3_pcm_prepare() runs on every xrun
+ * recovery, so a client looping on a wedged stream re-enters here several
+ * times a second, and the budget bounds resets, not log lines.
+ *
+ * Return: 0 if the direction is confirmed alive, recovery gave up and logged
+ * why (still non-fatal to the caller), or a concurrent call already had this
+ * in hand; -ENODEV if the device is gone; or -EAGAIN if a reset was queued
+ * but did not complete in time.
+ */
+static int jockey3_recover_urb_stream(struct jockey3_chip *chip, const int direction,
+				      const char *context, bool report_xrun)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+	const char *type = direction == SNDRV_PCM_STREAM_PLAYBACK ? "Playback" : "Capture";
+	unsigned int grace;
+	int ret = 0;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	if (jockey3_check_urb_stream_alive(urb_stream))
+		return 0;
+
+	if (atomic_cmpxchg(&chip->recovery_in_progress, 0, 1) != 0) {
+		dev_dbg(&chip->intf0->dev,
+			"%s stream stalled (%s); another recovery is already in progress, skipping\n",
+			type, context);
+		return 0;
+	}
+
+	dev_warn_ratelimited(&chip->intf0->dev,
+			     "%s stream stalled (%s); restarting URBs to recover\n",
+			     type, context);
+
+	/*
+	 * Even the light restart below discards in-flight buffer state, so
+	 * sample-accuracy is already broken the moment recovery is committed
+	 * to -- report it now rather than waiting to see how far the ladder
+	 * escalates. Both directions, not just @direction: jockey3_stop_urbs()/
+	 * jockey3_start_urbs() below tear down and resubmit the *shared* ring
+	 * unconditionally, so an open sibling substream loses continuity too,
+	 * even though it was never found stalled itself. Found on the bench: an
+	 * open Capture stream died with its own -EIO from ALSA core's
+	 * wait_for_avail() timeout while a Playback-triggered recovery was still
+	 * in flight, because only Playback had been told. jockey3_report_xrun()
+	 * itself is a no-op if a given substream is not open and running, so
+	 * calling it on both unconditionally is safe.
+	 */
+	if (report_xrun) {
+		jockey3_report_xrun(&chip->playback);
+		jockey3_report_xrun(&chip->capture);
+	}
+
+	scoped_guard(mutex, &chip->rate_mutex) {
+		/*
+		 * Something else may have already fixed this while the call above
+		 * was waiting for rate_mutex -- most plausibly
+		 * jockey3_pcm_hw_params()'s own rate-change restart, which holds
+		 * this same mutex across its whole stop/set-rate/start sequence.
+		 * The alive check above this function's entry is stale by the
+		 * time the lock is held; re-checking here is what makes a call
+		 * that raced a legitimate recovery a no-op instead of a second,
+		 * redundant full URB-ring teardown/rebuild landing right on top
+		 * of one that already succeeded. Without this re-check the
+		 * redundant restart can miss its own liveness budget and escalate
+		 * to a full USB reset that a change which had already recovered on
+		 * its own never needed. See re/rate_change_stall.md.
+		 */
+		if (jockey3_check_urb_stream_alive(urb_stream)) {
+			dev_dbg(&chip->intf0->dev,
+				"%s stream came back under rate_mutex (%s); no restart needed\n",
+				type, context);
+			goto out;
+		}
+
+		/*
+		 * Stale for the same reason the alive check above is repeated: a
+		 * tick that blocked here may have been waiting on
+		 * jockey3_suspend() or jockey3_pre_reset(), and wakes to a
+		 * stream that looks dead only because they zeroed the
+		 * timestamps. Restarting on that would submit URBs to a
+		 * suspended device, then escalate to resetting one.
+		 *
+		 * Bailing loses nothing: both paths restart the ring themselves
+		 * on the way back up.
+		 */
+		if (jockey3_is_disconnected(chip) || jockey3_is_suspended(chip) ||
+		    jockey3_is_resetting(chip)) {
+			dev_dbg(&chip->intf0->dev,
+				"%s stream stalled (%s), but the device is being taken down; leaving the restart to the resume path\n",
+				type, context);
+			goto out;
+		}
+
+		jockey3_stop_urbs(chip);
+		jockey3_start_urbs_failed(chip, jockey3_start_urbs(chip, true), context);
+	}
+
+	/*
+	 * Start grace, and the strict health gate: the light restart above was
+	 * of a ring that was streaming moments earlier, so a real resume shows
+	 * a proper completion cadence quickly, while a trickle of implausibly
+	 * fast FIFO-drain completions must NOT count -- passing on those
+	 * escalates a merely jittery restart to the USB reset below.
+	 */
+	grace = jockey3_start_grace_ms();
+	if (jockey3_wait_urb_stream_started(chip, direction, grace, true, true)) {
+		dev_dbg(&chip->intf0->dev,
+			"%s stream recovered via light URB restart (%s)\n", type, context);
+		goto out;
+	}
+
+	/*
+	 * Re-tested because the restart and grace above take long enough for the
+	 * device to go away underneath them, and escalating then goes badly.
+	 * jockey3_queue_reset() would reinit_completion() over the complete_all()
+	 * that jockey3_disconnect() issues to release waiters, and block the full
+	 * timeout on a reset that will never come. Ahead of the budget, so this
+	 * spends no attempt.
+	 *
+	 * Suspended as well as disconnected, and this is not the same check as
+	 * the one under rate_mutex above. That one covers a tick that arrives
+	 * after jockey3_suspend() has run. A tick which passed it earlier, while
+	 * the device was still live, is legitimately mid-recovery and reaches
+	 * here only after its grace has elapsed -- by which time suspend may have
+	 * happened. Resetting from there was observed to queue a reset the
+	 * suspended device could not complete, leaving the resume path waiting
+	 * out jockey3_wait_for_reset_completion() twice over.
+	 *
+	 * Racy by construction -- either state arriving just after the test still
+	 * hits it. The timeout bounds that; closing it properly would mean
+	 * serializing against jockey3_disconnect(), which must not block on
+	 * driver locks.
+	 */
+	if (jockey3_is_disconnected(chip) || jockey3_is_suspended(chip)) {
+		dev_dbg(&chip->intf0->dev,
+			"%s stream still stalled after URB restart, but the device is down; not resetting (%s)\n",
+			type, context);
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (!jockey3_recovery_budget_take(chip)) {
+		dev_err(&chip->intf0->dev,
+			"%s stream still stalled after URB restart; recovery budget exhausted, not resetting (%s)\n",
+			type, context);
+		goto out;
+	}
+
+	dev_warn(&chip->intf0->dev,
+		 "%s stream still stalled after URB restart; queuing full USB reset (%s), attempt %d/%d in window\n",
+		 type, context, atomic_read(&chip->recovery_attempts),
+		 JOCKEY3_RECOVERY_MAX_ATTEMPTS);
+	jockey3_queue_reset(chip);
+
+	ret = jockey3_wait_for_reset_completion(chip);
+	if (ret < 0)
+		goto out;
+
+	grace = jockey3_start_grace_ms();
+	if (!jockey3_wait_urb_stream_started(chip, direction, grace, false, true))
+		dev_err(&chip->intf0->dev,
+			"%s stream still stalled after full USB reset; hardware may need power-cycling (%s)\n",
+			type, context);
+	else
+		dev_dbg(&chip->intf0->dev,
+			"%s stream recovered after full USB reset (%s)\n", type, context);
+
+out:
+	atomic_set(&chip->recovery_in_progress, 0);
+	return ret;
+}
+
+/*
+ * SNDRV_PCM_INFO_BATCH: the hardware pointer only advances once per completed
+ * bulk URB (a whole Ploytec frame group), never per sample, so userspace must
+ * not assume a sample-accurate position.
+ *
+ * SNDRV_PCM_INFO_RESUME is deliberately absent: the device loses stream
+ * synchronization across a suspend, so the ALSA core should return -ESTRPIPE
+ * and have userspace re-prepare rather than issue TRIGGER_RESUME.
+ */
+#define JOCKEY3_PCM_INFO	(SNDRV_PCM_INFO_MMAP |		\
+				 SNDRV_PCM_INFO_INTERLEAVED |	\
+				 SNDRV_PCM_INFO_BLOCK_TRANSFER |\
+				 SNDRV_PCM_INFO_BATCH |		\
+				 SNDRV_PCM_INFO_MMAP_VALID)
+
+#define JOCKEY3_PCM_RATES	(SNDRV_PCM_RATE_44100 |	\
+				 SNDRV_PCM_RATE_48000 |	\
+				 SNDRV_PCM_RATE_88200 |	\
+				 SNDRV_PCM_RATE_96000)
+
+static const struct snd_pcm_hardware jockey3_pcm_hw_playback = {
+	.info			= JOCKEY3_PCM_INFO,
+	.formats		= SNDRV_PCM_FMTBIT_S24_3LE,
+	.rates			= JOCKEY3_PCM_RATES,
+	.rate_min		= 44100,
+	.rate_max		= 96000,
+	.channels_min		= 4,
+	.channels_max		= 4,
+	.buffer_bytes_max	= 1024 * 1024,
+	/*
+	 * One playback URB carries a packet count chosen per open by
+	 * jockey3_pcm_hw_params(), of 10 frames * 4 channels * 3 bytes = 120
+	 * bytes each. period_elapsed is OR'd across the packet loop in
+	 * jockey3_playback_callback(), so the minimum must cover at least one
+	 * packet, the smallest a URB can ever carry (N=1), or a period boundary
+	 * inside a URB could be missed entirely.
+	 */
+	.period_bytes_min	= PLOYTEC_PLAYBACK_FRAMES * 4 * 3,
+	.period_bytes_max	= 512 * 1024,
+	.periods_min		= 2,
+	.periods_max		= 1024,
+};
+
+static const struct snd_pcm_hardware jockey3_pcm_hw_capture = {
+	.info			= JOCKEY3_PCM_INFO,
+	.formats		= SNDRV_PCM_FMTBIT_S24_3LE,
+	.rates			= JOCKEY3_PCM_RATES,
+	.rate_min		= 44100,
+	.rate_max		= 96000,
+	.channels_min		= 6,
+	.channels_max		= 6,
+	.buffer_bytes_max	= 1024 * 1024,
+	/*
+	 * One capture URB carries a packet count chosen per open (see
+	 * jockey3_pcm_hw_params()) of up to 8 frames * 6 channels * 3 bytes =
+	 * 144 bytes each; see the playback .period_bytes_min comment above for
+	 * why the minimum must cover at least one packet.
+	 */
+	.period_bytes_min	= PLOYTEC_CAPTURE_FRAMES * 6 * 3,
+	.period_bytes_max	= 512 * 1024,
+	.periods_min		= 2,
+	.periods_max		= 1024,
+};
+
+static int jockey3_pcm_open(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	int ret;
+
+	dev_dbg(&chip->intf0->dev, "PCM open stream %d\n", substream->stream);
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	runtime->hw = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+		      jockey3_pcm_hw_playback : jockey3_pcm_hw_capture;
+
+	/* The period accounting assumes a whole number of periods per buffer */
+	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Rate constraints under rate_mutex, which also excludes a concurrent
+	 * rate change in jockey3_pcm_hw_params(). Re-check for disconnect here:
+	 * the check above raced with anything that happened while we were not
+	 * holding the mutex.
+	 */
+	scoped_guard(mutex, &chip->rate_mutex) {
+		if (jockey3_is_disconnected(chip))
+			return -ENODEV;
+
+		if (jockey3_rate_committed_streams(chip) > 0) {
+			/* Force the new stream to match the existing hardware rate */
+			ret = snd_pcm_hw_constraint_single(runtime,
+							   SNDRV_PCM_HW_PARAM_RATE,
+							   chip->current_rate);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	/* Substream registration under spinlock to ensure memory consistency to the ISR*/
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		urb_stream->substream = substream;
+	}
+
+	return 0;
+}
+
+static int jockey3_pcm_close(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	unsigned int default_n = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+				 JOCKEY3_PLAYBACK_N : JOCKEY3_CAPTURE_N;
+
+	dev_dbg(&chip->intf0->dev, "PCM close stream %d\n", substream->stream);
+
+	/*
+	 * No drain is needed here: the ALSA core has already run .sync_stop via
+	 * snd_pcm_release_substream() -> snd_pcm_drop() -> do_hw_free(), which is
+	 * also where runtime->dma_area is released.
+	 */
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		urb_stream->substream = NULL;
+		urb_stream->running = false;
+		urb_stream->rate_committed = false;
+
+		/*
+		 * A closed direction is not covered by jockey3_pcm_hw_params()
+		 * any more, so its N would otherwise sit at whatever the last
+		 * open left it at -- possibly a small, period-tuned value that
+		 * has nothing to do with the next stream to open it, or with
+		 * this direction's own idle ring being re-armed by a rate
+		 * change on the *other* direction (jockey3_start_urbs() re-arms
+		 * both unconditionally). Reset to the default here so an idle
+		 * direction always re-arms at a safe N.
+		 */
+		WRITE_ONCE(urb_stream->n_shift, ilog2(default_n));
+		WRITE_ONCE(urb_stream->n_pkts, default_n);
+	}
+
+	return 0;
+}
+
+/**
+ * jockey3_pcm_sync_stop() - wait for in-flight URB callbacks to drain
+ * @substream: the substream being stopped
+ *
+ * Waits for every URB completion that could still touch this stream's substream
+ * or runtime->dma_area to leave its safe zone.
+ *
+ * The ALSA core calls this from snd_pcm_do_prepare() and from do_hw_free()
+ * *before* snd_pcm_lib_free_pages() releases the buffer, and only when the
+ * stream actually ran (runtime->stop_operating). It runs in process context
+ * with no stream lock held, so sleeping here is safe: a callback in its safe
+ * zone has dropped urb_stream->lock and may freely take the stream lock, so the
+ * stream lock -> urb_stream->lock order is never inverted.
+ *
+ * Return: 0 always; a timeout is logged but cannot usefully be reported.
+ */
+static int jockey3_pcm_sync_stop(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	long remaining;
+
+	spin_lock_irq(&urb_stream->lock);
+	remaining = wait_event_lock_irq_timeout(urb_stream->drain_wait,
+						urb_stream->callbacks_active == 0,
+						urb_stream->lock,
+						msecs_to_jiffies(1000));
+	spin_unlock_irq(&urb_stream->lock);
+
+	if (!remaining)
+		dev_err(&chip->intf0->dev,
+			"Timeout draining %s URB callbacks\n",
+			substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
+
+	return 0;
+}
+
+static int jockey3_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	bool stalled = false;
+	int ret = 0;
+
+	dev_dbg(&chip->intf0->dev, "PCM prepare stream %d\n", substream->stream);
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	ret = jockey3_wait_for_reset_completion(chip);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Taking rate_mutex here serializes against an in-flight rate change in
+	 * jockey3_pcm_hw_params(), which holds it across the whole stop/set/start
+	 * sequence -- so the liveness below is sampled from a settled state
+	 * rather than from the middle of a URB restart.
+	 */
+	scoped_guard(mutex, &chip->rate_mutex) {
+		if (jockey3_is_disconnected(chip))
+			return -ENODEV;
+
+		/*
+		 * Either direction may have been left stalled by an earlier rate
+		 * change that happened while this stream was not open (see
+		 * jockey3_pcm_hw_params()). Catch it here, before the stream that
+		 * is being prepared starts relying on it.
+		 *
+		 * This single sample is only a hint. jockey3_check_urb_stream_alive()'s
+		 * window is scaled to always span a handful of packet intervals
+		 * regardless of N (JOCKEY3_LIVENESS_WINDOW_NS()), but a handful is
+		 * still not many -- one preemption is enough to make a healthy
+		 * stream read as dead -- and .prepare runs on every xrun recovery,
+		 * where acting on a false positive would disrupt a working stream.
+		 * What it flags is confirmed below before anything is done about it.
+		 */
+		stalled = !jockey3_check_urb_stream_alive(urb_stream);
+	}
+
+	/*
+	 * Confirm, and recover, outside rate_mutex on purpose: polling would
+	 * otherwise hold the mutex for a whole start grace, and recovery may
+	 * escalate to a queued USB reset, whose jockey3_pre_reset() and
+	 * jockey3_post_reset() need to acquire the mutex themselves to complete.
+	 * Start grace and the plain alive check: this is a stream being
+	 * (re)opened, not a warm restart of one that was just running.
+	 */
+	if (stalled)
+		stalled = !jockey3_wait_urb_stream_started(chip, substream->stream,
+							  jockey3_start_grace_ms(), false,
+							  false);
+
+	if (stalled) {
+		const char *context = substream->stream == SNDRV_PCM_STREAM_CAPTURE ?
+			"opening a capture stream" : "preparing a playback stream";
+
+		ret = jockey3_recover_urb_stream(chip, substream->stream, context, false);
+		if (ret < 0)
+			return ret;
+	}
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		urb_stream->dma_off = 0;
+		urb_stream->period_off = 0;
+	}
+	return 0;
+}
+
+/*
+ * Called by the ALSA core with the substream stream lock held and interrupts
+ * disabled, so this callback must never sleep. In particular it must not wait
+ * for a rate change or a device reset: a URB completion can re-enter here via
+ * snd_pcm_period_elapsed() -> snd_pcm_stop_xrun(), and blocking would then
+ * stall the very rate change it is waiting on.
+ *
+ * Serialization against a concurrent rate change is provided by rate_mutex in
+ * the sleepable callbacks instead; the ALSA state machine guarantees .prepare
+ * runs before TRIGGER_START and after every XRUN.
+ *
+ * Lock order here is snd_pcm_stream_lock -> urb_stream->lock, which is why the
+ * URB callbacks drop urb_stream->lock before calling snd_pcm_period_elapsed().
+ */
+static int jockey3_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+
+	dev_dbg(&chip->intf0->dev, "PCM trigger stream %d, cmd %d\n", substream->stream, cmd);
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		switch (cmd) {
+		case SNDRV_PCM_TRIGGER_START:
+			urb_stream->running = true;
+			break;
+		case SNDRV_PCM_TRIGGER_STOP:
+		case SNDRV_PCM_TRIGGER_SUSPEND:
+			urb_stream->running = false;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
+static snd_pcm_uframes_t jockey3_pcm_pointer(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	unsigned int dma_off;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		dma_off = urb_stream->dma_off;
+	}
+	return bytes_to_frames(substream->runtime, dma_off);
+}
+
+static int jockey3_initialize_ploytec(struct jockey3_chip *chip, u32 *fw_version)
+{
+	int ret;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	ret = ploytec_initialize_device(chip->intf0, chip->xfer_buf, false, fw_version);
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Ploytec failed to initialize: %d\n", ret);
+		return ret;
+	}
+
+	ret = ploytec_start_streaming(chip->intf0, chip->xfer_buf);
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Ploytec failed to start streaming: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(&chip->intf0->dev, "Ploytec initialized successfully\n");
+	return 0;
+}
+
+/**
+ * jockey3_pcm_set_n() - choose and arm this direction's packets per URB
+ * @chip: driver state
+ * @substream: the substream hw_params was just called for
+ * @hw_params: the negotiated parameters
+ *
+ * Chooses how many Ploytec packets each USB bulk URB on this direction
+ * carries, called "N" below for brevity: the largest power of two with
+ * N * pkt_bytes <= period_bytes. A big period gets the full coalescing
+ * saving, a tiny one falls back to N=1 automatically via .period_bytes_min.
+ * Takes effect without tearing the URB ring down -- the firmware cannot tell
+ * an N x 512 B bulk transfer apart from N separate 512 B ones, so each URB on
+ * this direction simply picks up the new N at its own next resubmission; the
+ * ring turns over onto it within at most JOCKEY3_N_URBS completions. See
+ * re/streaming_overhead.md for the rationale and measurements.
+ *
+ * Called unconditionally on every hw_params(), including when the rate is
+ * unchanged and the URB ring is never touched: N is a per-open, per-period
+ * property, independent of whether a rate change happens to be in progress.
+ */
+static void jockey3_pcm_set_n(struct jockey3_chip *chip, struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *hw_params)
+{
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	unsigned int period_bytes = params_period_bytes(hw_params);
+	bool is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	unsigned int pkt_bytes = is_playback ? PLOYTEC_PLAYBACK_FRAMES * 4 * 3 :
+						  PLOYTEC_CAPTURE_FRAMES * 6 * 3;
+	unsigned int max_n = is_playback ? JOCKEY3_PLAYBACK_N : JOCKEY3_CAPTURE_N;
+	unsigned int n = max(period_bytes / pkt_bytes, 1U);
+	u8 n_shift = clamp_t(u8, ilog2(n), 0, ilog2(max_n));
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		WRITE_ONCE(urb_stream->n_shift, n_shift);
+		WRITE_ONCE(urb_stream->n_pkts, 1 << n_shift);
+	}
+
+	dev_dbg(&chip->intf0->dev, "hw_params: %s using %u packet(s)/URB (period_bytes=%u)\n",
+		is_playback ? "playback" : "capture", 1U << n_shift, period_bytes);
+}
+
+/**
+ * jockey3_pcm_change_rate() - reprogram the hardware rate for hw_params()
+ * @chip: driver state
+ * @substream: the substream asking for the rate
+ * @rate: the requested rate in Hz
+ * @changed: set true if the hardware was actually reprogrammed
+ *
+ * Split out of jockey3_pcm_hw_params() because nesting two scoped_guard()
+ * blocks in one scope shadows the guard's own variable and trips -Wshadow.
+ * Call with the USB device lock held; see the call site for why.
+ *
+ * Return: 0 on success or if the rate already matched (@changed stays false),
+ * %-EBUSY if the other direction holds a different rate, %-ENODEV if the device
+ * is gone, or the error from programming the rate.
+ */
+static int jockey3_pcm_change_rate(struct jockey3_chip *chip,
+				   struct snd_pcm_substream *substream,
+				   unsigned int rate, bool *changed)
+{
+	int ret;
+
+	/*
+	 * rate_mutex is held across the whole stop/set-rate/start sequence, which
+	 * is what excludes a concurrent rate change from another substream: any
+	 * other sleepable path that needs a settled rate takes the same mutex.
+	 */
+	guard(mutex)(&chip->rate_mutex);
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	/*
+	 * Drop this direction's own claim on the rate before counting:
+	 * an application is free to hw_free and run hw_params again at
+	 * a different rate, and its previous commitment must not be
+	 * what blocks it. Cleared inside rate_mutex, so the other
+	 * direction cannot observe the gap and reprogram the hardware.
+	 */
+	jockey3_set_rate_committed(chip, substream->stream, false);
+
+	if (chip->current_rate == rate) {
+		dev_dbg(&chip->intf0->dev, "Rate already set to %u, skipping change\n",
+			rate);
+		jockey3_set_rate_committed(chip, substream->stream, true);
+		return 0;
+	}
+
+	*changed = true;
+
+	/*
+	 * The other direction already holds the rate. The ALSA core
+	 * should have enforced the constraint from jockey3_pcm_open(),
+	 * so this is a backstop -- but it is also the only check that
+	 * covers a stream which opened while the device was idle and
+	 * only now asks for a rate the other direction has since fixed.
+	 */
+	if (jockey3_rate_committed_streams(chip) > 0) {
+		dev_err(&chip->intf0->dev,
+			"Cannot change rate to %u while the other stream holds %u\n",
+			rate, chip->current_rate);
+		return -EBUSY;
+	}
+
+	jockey3_stop_urbs(chip);
+
+	ret = jockey3_set_rate(chip, rate, false);
+	if (ret != 0) {
+		if (jockey3_err_device_gone(ret))
+			dev_dbg(&chip->intf0->dev,
+				"Rate change to %u abandoned; device is gone (%d)\n",
+				rate, ret);
+		else
+			dev_err(&chip->intf0->dev,
+				"Rate change to %u failed: %d\n", rate, ret);
+		/*
+		 * The rate change is what left the endpoints disabled if
+		 * they are, so this restart is the one most likely to
+		 * come back -ENOENT. Report it before returning the rate
+		 * error, which would otherwise be the only thing seen.
+		 */
+		jockey3_start_urbs_failed(chip, jockey3_start_urbs(chip, false),
+					  "a failed rate change");
+		return ret;
+	}
+
+	jockey3_set_current_rate(chip, rate);
+	jockey3_set_rate_committed(chip, substream->stream, true);
+
+	jockey3_start_urbs_failed(chip, jockey3_start_urbs(chip, false), "a rate change");
+
+	return 0;
+}
+
+static int jockey3_pcm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *hw_params)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	unsigned int rate = params_rate(hw_params);
+	bool playback_alive, capture_alive, capture_open;
+	bool rate_changed = false;
+	unsigned int grace;
+	int ret = 0;
+
+	dev_dbg(&chip->intf0->dev, "PCM hw_params rate %u, rate_committed_streams %d\n",
+		rate, jockey3_rate_committed_streams(chip));
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	/*
+	 * A previous call may have left a stall-recovery reset in flight (see
+	 * jockey3_recover_urb_stream(), called below). Without this, a rate
+	 * change arriving before that reset completes runs jockey3_set_rate()
+	 * and the URB restart against a device that is mid-reset, which fails
+	 * outright instead of recovering. jockey3_pcm_prepare() waits for the
+	 * same reason.
+	 */
+	ret = jockey3_wait_for_reset_completion(chip);
+	if (ret < 0)
+		return ret;
+
+	/* Independent of rate and of whether it changes; see jockey3_pcm_set_n() */
+	jockey3_pcm_set_n(chip, substream, hw_params);
+
+	/*
+	 * Programming a rate calls usb_set_interface(), which the USB core
+	 * serializes against usb_disconnect() with the device lock and nothing
+	 * else; both reach remove_intf_ep_devs(), whose only guard is the
+	 * unlocked bitfield intf->ep_devs_created.
+	 *
+	 * Three constraints fix where it goes. It cannot move down into
+	 * ploytec_initialize_device(): probe, disconnect and the reset callbacks
+	 * already hold it and it is not recursive. It must be dropped before the
+	 * recovery below, which can queue a reset that needs this same lock. And
+	 * it goes outside rate_mutex, the order pre_reset()/post_reset() use.
+	 *
+	 * The watchdog must never take it: jockey3_disconnect() holds it while
+	 * waiting in cancel_delayed_work_sync().
+	 */
+	scoped_guard(device, &chip->dev->dev)
+		ret = jockey3_pcm_change_rate(chip, substream, rate, &rate_changed);
+	if (ret < 0)
+		return ret;
+	if (!rate_changed)
+		return 0;
+
+	/*
+	 * The firmware does not always resume streaming after a rate change, so
+	 * check liveness on both directions and let
+	 * jockey3_recover_urb_stream() force a re-synchronization.
+	 *
+	 * Playback recovers unconditionally -- it carries MIDI OUT, so a stall
+	 * breaks MIDI control. Capture only if a stream is open: an idle
+	 * Capture stall is logged and deferred to the next open, since
+	 * recovering it would glitch working Playback audio.
+	 *
+	 * Outside rate_mutex, because an escalated reset needs pre_reset() and
+	 * post_reset() to take it. Playback goes first: if both died, its
+	 * restart of the shared ring makes the capture call a no-op.
+	 *
+	 * Start grace -- a rate change reprograms the endpoints over EP0.
+	 */
+	grace = jockey3_start_grace_ms();
+	playback_alive = jockey3_wait_urb_stream_started(chip, SNDRV_PCM_STREAM_PLAYBACK,
+							 grace, false, true);
+	capture_alive = jockey3_wait_urb_stream_started(chip, SNDRV_PCM_STREAM_CAPTURE,
+							grace, false, true);
+	capture_open = jockey3_stream_is_open(chip, SNDRV_PCM_STREAM_CAPTURE);
+
+	if (!playback_alive || (!capture_alive && capture_open)) {
+		dev_warn(&chip->intf0->dev,
+			 "Rate change to %u Hz left a stream stalled (playback_alive=%d, capture_alive=%d, capture_open=%d); attempting recovery\n",
+			 rate, playback_alive, capture_alive, capture_open);
+
+		if (!playback_alive) {
+			ret = jockey3_recover_urb_stream(chip, SNDRV_PCM_STREAM_PLAYBACK,
+							 "rate change", false);
+			if (ret < 0)
+				return ret;
+		}
+
+		if (!capture_alive && capture_open) {
+			ret = jockey3_recover_urb_stream(chip, SNDRV_PCM_STREAM_CAPTURE,
+							 "rate change", false);
+			if (ret < 0)
+				return ret;
+		}
+	} else {
+		if (!capture_alive)
+			dev_dbg(&chip->intf0->dev,
+				"Capture URB stalled after rate change to %u Hz, but no capture stream is open; deferring recovery to next capture open\n",
+				rate);
+		dev_dbg(&chip->intf0->dev, "Rate changed to %u successfully\n", rate);
+	}
+
+	return 0;
+}
+
+/*
+ * Release this direction's claim on the hardware rate. The URB ring is
+ * deliberately left running (see the top-of-file DOC); all this hands back is
+ * the right of the other direction -- or of this one, on a re-run of
+ * hw_params -- to program a different rate.
+ */
+static int jockey3_pcm_hw_free(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+
+	jockey3_set_rate_committed(chip, substream->stream, false);
+	return 0;
+}
+
+static const struct snd_pcm_ops jockey3_pcm_ops = {
+	.open = jockey3_pcm_open,
+	.close = jockey3_pcm_close,
+	.hw_params = jockey3_pcm_hw_params,
+	.hw_free = jockey3_pcm_hw_free,
+	.prepare = jockey3_pcm_prepare,
+	.trigger = jockey3_pcm_trigger,
+	.sync_stop = jockey3_pcm_sync_stop,
+	.pointer = jockey3_pcm_pointer,
+};
+
+static int jockey3_midi_in_open(struct snd_rawmidi_substream *substream)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+	return 0;
+}
+
+/*
+ * Normally trigger(0) has already cleared the pointer, but the rawmidi core can
+ * reach close without it (an interrupted drain, or close_substream() with
+ * cleanup suppressed), so drop it here too rather than leave a dangling
+ * reference for the URB callback.
+ */
+static int jockey3_midi_in_close(struct snd_rawmidi_substream *substream)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	guard(spinlock_irqsave)(&chip->midi_lock);
+	if (chip->midi_in_substream == substream)
+		chip->midi_in_substream = NULL;
+
+	return 0;
+}
+
+static void jockey3_midi_in_trigger(struct snd_rawmidi_substream *substream, int up)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	guard(spinlock_irqsave)(&chip->midi_lock);
+	chip->midi_in_substream = up ? substream : NULL;
+}
+
+static int jockey3_midi_out_open(struct snd_rawmidi_substream *substream)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+	return 0;
+}
+
+/* See jockey3_midi_in_close() for why the pointer is cleared here as well. */
+static int jockey3_midi_out_close(struct snd_rawmidi_substream *substream)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	guard(spinlock_irqsave)(&chip->midi_lock);
+	if (chip->midi_out_substream == substream)
+		chip->midi_out_substream = NULL;
+
+	return 0;
+}
+
+static void jockey3_midi_out_trigger(struct snd_rawmidi_substream *substream, int up)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	guard(spinlock_irqsave)(&chip->midi_lock);
+	chip->midi_out_substream = up ? substream : NULL;
+}
+
+static const struct snd_rawmidi_ops jockey3_midi_in_ops = {
+	.open = jockey3_midi_in_open,
+	.close = jockey3_midi_in_close,
+	.trigger = jockey3_midi_in_trigger
+};
+
+static const struct snd_rawmidi_ops jockey3_midi_out_ops = {
+	.open = jockey3_midi_out_open,
+	.close = jockey3_midi_out_close,
+	.trigger = jockey3_midi_out_trigger
+};
+
+static int jockey3_initialize(struct jockey3_chip *chip, int model)
+{
+	int ret;
+	int rate;
+	u32 fw_version;
+
+	/*
+	 * Let the device finish booting before speaking to it.
+	 *
+	 * After a mains power cycle the Jockey 3 enumerates and answers control
+	 * transfers while its audio engine is still coming up. Initialize it in
+	 * that window and the engine never starts: every control transfer
+	 * succeeds, the rate reads back correctly, ALSA accepts playback, and the
+	 * device is silent -- capture returns bit-exact zero and nothing is
+	 * logged. A USB re-enumeration does not provoke it; only a real
+	 * power-off does, because the device is self-powered and a VBUS cut is
+	 * merely a cable unplug to it.
+	 *
+	 * The threshold is sharp: the device needs between 144 and 156 ms after
+	 * enumeration, below which the engine fails to start every time. 250 ms
+	 * rather than the smallest passing value, because the time this driver
+	 * otherwise takes to reach its first transfer is host-dependent, so a
+	 * value that only topped that up would erode on a faster machine.
+	 *
+	 * Placed here rather than in ploytec_initialize_device() because that
+	 * runs twice per probe -- once below, once via jockey3_set_rate() -- and
+	 * again on every rate change. This point runs once, and is the last
+	 * before the driver's first EP0 transfer; everything above it in probe()
+	 * is ALSA and USB core bookkeeping.
+	 *
+	 * See re/usb/init_timing_comparison.md for the measurements.
+	 */
+	msleep(250);
+
+	for (int retry = 10; retry > 0; retry--) {
+		ret = jockey3_initialize_ploytec(chip, &fw_version);
+		if (ret == 0)
+			break;
+		usleep_range(50000, 100000); /* Wait 50-100 ms before retrying */
+	}
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Failed to initialize Ploytec: %d\n", ret);
+		return ret;
+	}
+
+	// see ploytec_get_firmware() for the packing of buf[0..2] into fw_version
+	dev_info(&chip->intf0->dev, CARD_NAME " %s Firmware 0x%02x v%d.%d.%d\n",
+		 jockey3_model_name(model),
+		 (fw_version >> 16) & 0xFF, (fw_version >> 8) & 0xFF,
+		 (fw_version >> 4) & 0x0F, fw_version & 0x0F);
+
+	rate = 44100;	// default sample rate at power-on
+	scoped_guard(mutex, &chip->rate_mutex)
+		jockey3_set_current_rate(chip, rate);
+
+	ret = jockey3_set_rate(chip, rate, true);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Fail the probe rather than escalating: a device that cannot accept its
+	 * URBs has no working audio and no MIDI OUT, and queuing a reset against
+	 * one that never started is worse than reporting a clean failure here.
+	 */
+	ret = jockey3_start_urbs(chip, false);
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Failed to start URBs during initialization: %d\n",
+			ret);
+		return ret;
+	}
+
+	dev_dbg(&chip->intf0->dev, "Initialization complete.\n");
+
+	return 0;
+}
+
+/*
+ * Free everything jockey3_probe() allocated into @chip, and give the card slot
+ * back. NULL-safe throughout, so it is correct at any point of a half-built
+ * probe as well as at the end of the device's life.
+ *
+ * Two rules govern what may go in here, both stemming from where it runs:
+ * card->private_free, i.e. after the last file descriptor on the card is
+ * closed, which on an unplug is arbitrarily long after jockey3_disconnect().
+ *
+ *  - No USB *operation* may be attempted. The objects are still allocated,
+ *    since jockey3_probe() references each and this function drops them, but
+ *    they are unbound by now and the hardware may be gone. Reading is safe,
+ *    talking is not. The dev_dbg(&chip->intf0->dev, ...) idiom is avoided too:
+ *    the interface is no longer ours, so the attribution would be wrong.
+ *  - The URBs must already be dead. jockey3_disconnect() kills them, and so
+ *    does probe's error path, both before the card is released.
+ */
+static void jockey3_free_resources(struct jockey3_chip *chip)
+{
+	int i;
+
+	/*
+	 * The last fence on the watchdog. jockey3_disconnect()'s sync cancel is
+	 * not enough on its own: a jockey3_start_urbs() already past its
+	 * DISCONNECTED gate arms the watchdog at its tail, under no mutex that
+	 * would exclude the cancel. Here that cannot happen -- private_free runs
+	 * once the card is closed, so every such caller has returned.
+	 */
+	cancel_delayed_work_sync(&chip->watchdog_work);
+
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		usb_free_urb(chip->playback.urbs[i]);
+		kfree(chip->playback.bufs[i]);
+		usb_free_urb(chip->capture.urbs[i]);
+		kfree(chip->capture.bufs[i]);
+	}
+	usb_free_urb(chip->midi_in_urb);
+	kfree(chip->midi_in_buf);
+	kfree(chip->xfer_buf);
+
+	mutex_destroy(&chip->rate_mutex);
+
+	scoped_guard(mutex, &jockey3_devices_mutex)
+		__clear_bit(chip->dev_idx, jockey3_devices_used);
+
+	/* Last, reversing jockey3_probe(): everything above may read these. */
+	usb_put_intf(chip->intf1);
+	usb_put_intf(chip->intf0);
+	usb_put_dev(chip->dev);
+}
+
+static void jockey3_card_free(struct snd_card *card)
+{
+	jockey3_free_resources(card->private_data);
+}
+
+static int jockey3_init_midi_urb(struct jockey3_chip *chip)
+{
+	struct usb_device *dev = chip->dev;
+
+	memset(&chip->midi_state, 0, sizeof(chip->midi_state));
+	chip->midi_out_acc = 0;
+
+	chip->midi_in_buf = kmalloc(PLOYTEC_PKT_SIZE, GFP_KERNEL);
+	if (!chip->midi_in_buf)
+		return -ENOMEM;
+
+	chip->midi_in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!chip->midi_in_urb)
+		return -ENOMEM;
+
+	usb_fill_bulk_urb(chip->midi_in_urb, dev,
+			  usb_rcvbulkpipe(dev, PLOYTEC_EP_NUM_MIDI_IN),
+			  chip->midi_in_buf, PLOYTEC_PKT_SIZE,
+			  jockey3_midi_in_callback, chip);
+
+	return 0;
+}
+
+static int jockey3_init_playback_urbs(struct jockey3_chip *chip)
+{
+	struct usb_device *dev = chip->dev;
+	int i;
+
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		chip->playback.bufs[i] = kzalloc(JOCKEY3_PLAYBACK_XFER_SIZE, GFP_KERNEL);
+		if (!chip->playback.bufs[i])
+			return -ENOMEM;
+
+		chip->playback.urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
+		if (!chip->playback.urbs[i])
+			return -ENOMEM;
+
+		jockey3_init_out_packet(chip->playback.bufs[i]);
+
+		usb_fill_bulk_urb(chip->playback.urbs[i], dev,
+				  usb_sndbulkpipe(dev, PLOYTEC_EP_NUM_PCM_OUT),
+				  chip->playback.bufs[i], JOCKEY3_PLAYBACK_XFER_SIZE,
+				  jockey3_playback_callback, chip);
+	}
+
+	return 0;
+}
+
+static int jockey3_init_capture_urbs(struct jockey3_chip *chip)
+{
+	struct usb_device *dev = chip->dev;
+	int i;
+
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		chip->capture.bufs[i] = kzalloc(JOCKEY3_CAPTURE_XFER_SIZE, GFP_KERNEL);
+		if (!chip->capture.bufs[i])
+			return -ENOMEM;
+
+		chip->capture.urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
+		if (!chip->capture.urbs[i])
+			return -ENOMEM;
+
+		usb_fill_bulk_urb(chip->capture.urbs[i], dev,
+				  usb_rcvbulkpipe(dev, PLOYTEC_EP_NUM_PCM_IN),
+				  chip->capture.bufs[i], JOCKEY3_CAPTURE_XFER_SIZE,
+				  jockey3_capture_callback, chip);
+	}
+
+	return 0;
+}
+
+static bool jockey3_has_bulk_endpoint(struct usb_interface *intf, u8 ep_num, bool out)
+{
+	int i, j;
+
+	for (i = 0; i < intf->num_altsetting; i++) {
+		struct usb_host_interface *alts = &intf->altsetting[i];
+
+		for (j = 0; j < alts->desc.bNumEndpoints; j++) {
+			struct usb_endpoint_descriptor *epd = &alts->endpoint[j].desc;
+
+			if (out) {
+				if (usb_endpoint_is_bulk_out(epd) &&
+				    usb_endpoint_num(epd) == ep_num)
+					return true;
+			} else {
+				if (usb_endpoint_is_bulk_in(epd) &&
+				    usb_endpoint_num(epd) == ep_num)
+					return true;
+			}
+		}
+	}
+	return false;
+}
+
+static int jockey3_validate_endpoints(struct usb_interface *intf0, struct usb_interface *intf1)
+{
+	if (!jockey3_has_bulk_endpoint(intf0, PLOYTEC_EP_NUM_PCM_OUT, true) ||
+	    !jockey3_has_bulk_endpoint(intf0, PLOYTEC_EP_NUM_MIDI_IN, false)) {
+		dev_err(&intf0->dev, "Required bulk endpoints not found on Interface 0 (OUT: 0x%02x, IN: 0x%02x)\n",
+			PLOYTEC_EP_NUM_PCM_OUT, PLOYTEC_EP_NUM_MIDI_IN);
+		return -ENODEV;
+	}
+
+	if (!jockey3_has_bulk_endpoint(intf1, PLOYTEC_EP_NUM_PCM_IN, false)) {
+		dev_err(&intf0->dev, "Required bulk IN endpoint not found on Interface 1 (IN: 0x%02x)\n",
+			PLOYTEC_EP_NUM_PCM_IN);
+		return -ENODEV;
+	}
+	return 0;
+}
+
+/*
+ * Channel maps.
+ *
+ * This device exposes several independent stereo pairs, which is a different
+ * thing from a multichannel speaker arrangement -- and speaker positions are
+ * all the chmap enum can express. Claiming, say, RL/RR for the headphone pair
+ * would invite an audio server to treat a cue output as rear speakers, so the
+ * discrete pairs are reported as SNDRV_CHMAP_UNKNOWN.
+ *
+ * The one exception is the playback Master pair, which is marked FL/FR so that
+ * userspace (PipeWire and friends) can identify the device's primary output.
+ * There is no equivalent notion for the inputs, so capture is left entirely
+ * unpositioned.
+ *
+ * Physical layout (see Documentation/sound/cards/jockey3.rst):
+ *   Playback: 1-2 Master Out L/R, 3-4 Headphone L/R
+ *   Capture:  1-2 Input 1 L/R, 3-4 Input 2 L/R, 5-6 Microphone
+ *
+ * The microphone is mono: the balanced input stage feeds the same analog
+ * signal to both converters, so channels 5 and 6 carry identical content.
+ */
+static const struct snd_pcm_chmap_elem jockey3_playback_chmap[] = {
+	{ .channels = 4,
+	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+		   SNDRV_CHMAP_UNKNOWN, SNDRV_CHMAP_UNKNOWN } },
+	{ }
+};
+
+static const struct snd_pcm_chmap_elem jockey3_capture_chmap[] = {
+	{ .channels = 6,
+	  .map = { SNDRV_CHMAP_UNKNOWN, SNDRV_CHMAP_UNKNOWN,
+		   SNDRV_CHMAP_UNKNOWN, SNDRV_CHMAP_UNKNOWN,
+		   SNDRV_CHMAP_UNKNOWN, SNDRV_CHMAP_UNKNOWN } },
+	{ }
+};
+
+static int jockey3_init_pcm(struct jockey3_chip *chip)
+{
+	int ret = snd_pcm_new(chip->card, CARD_NAME " Audio", 0, 1, 1, &chip->pcm);
+
+	if (ret < 0)
+		return ret;
+
+	strscpy(chip->pcm->name, CARD_NAME " Audio", sizeof(chip->pcm->name));
+	chip->pcm->private_data = chip;
+	snd_pcm_set_ops(chip->pcm, SNDRV_PCM_STREAM_PLAYBACK, &jockey3_pcm_ops);
+	snd_pcm_set_ops(chip->pcm, SNDRV_PCM_STREAM_CAPTURE, &jockey3_pcm_ops);
+	snd_pcm_set_managed_buffer_all(chip->pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
+
+	ret = snd_pcm_add_chmap_ctls(chip->pcm, SNDRV_PCM_STREAM_PLAYBACK,
+				     jockey3_playback_chmap, 4, 0, NULL);
+	if (ret < 0)
+		return ret;
+
+	return snd_pcm_add_chmap_ctls(chip->pcm, SNDRV_PCM_STREAM_CAPTURE,
+				      jockey3_capture_chmap, 6, 0, NULL);
+}
+
+static int jockey3_init_midi(struct jockey3_chip *chip)
+{
+	int ret = snd_rawmidi_new(chip->card, CARD_NAME " MIDI", 0, 1, 1, &chip->rmidi);
+
+	if (ret < 0)
+		return ret;
+
+	chip->rmidi->private_data = chip;
+	strscpy(chip->rmidi->name, CARD_NAME " MIDI", sizeof(chip->rmidi->name));
+	snd_rawmidi_set_ops(chip->rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &jockey3_midi_in_ops);
+	snd_rawmidi_set_ops(chip->rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &jockey3_midi_out_ops);
+	chip->rmidi->info_flags = SNDRV_RAWMIDI_INFO_INPUT |
+				  SNDRV_RAWMIDI_INFO_OUTPUT |
+				  SNDRV_RAWMIDI_INFO_DUPLEX;
+	return 0;
+}
+
+static void jockey3_setup_card_names(struct jockey3_chip *chip, int driver_info)
+{
+	/*
+	 * card->driver is only char[16] and is what shows up as the card ID in
+	 * /proc/asound, so it holds a short model identifier rather than the
+	 * module name (which would be silently truncated).
+	 */
+	strscpy(chip->card->driver, "Jockey3", sizeof(chip->card->driver));
+	strscpy(chip->card->shortname, CARD_NAME, sizeof(chip->card->shortname));
+	strscpy(chip->card->mixername, CARD_NAME, sizeof(chip->card->mixername));
+
+	snprintf(chip->card->longname, sizeof(chip->card->longname),
+		 "%s %s at USB %s", CARD_NAME, jockey3_model_name(driver_info),
+		 dev_name(&chip->dev->dev));
+}
+
+static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id *usb_id)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	struct usb_interface *intf1;
+	struct snd_card *card;
+	struct jockey3_chip *chip;
+	unsigned int dev_idx;
+	int ret;
+
+	if (intf->cur_altsetting->desc.bInterfaceNumber != 0)
+		return -ENODEV;
+
+	intf1 = usb_ifnum_to_if(dev, 1);
+	if (!intf1)
+		return -ENODEV;
+
+	ret = jockey3_validate_endpoints(intf, intf1);
+	if (ret < 0)
+		return ret;
+
+	/* Claim the first enabled, unused card slot */
+	scoped_guard(mutex, &jockey3_devices_mutex) {
+		for (dev_idx = 0; dev_idx < SNDRV_CARDS; dev_idx++)
+			if (enable[dev_idx] && !test_bit(dev_idx, jockey3_devices_used))
+				break;
+
+		if (dev_idx >= SNDRV_CARDS)
+			return -ENODEV;
+
+		__set_bit(dev_idx, jockey3_devices_used);
+	}
+
+	/*
+	 * Deliberately not snd_devm_card_new(): a managed card is freed from the
+	 * devres unwind inside usb_unbind_interface(), where snd_card_free()
+	 * blocks until userspace closes every file descriptor on the card. On an
+	 * unplug that unwind runs on the USB hub work queue, so one process
+	 * sitting on a PCM fd would stall hotplug for the whole hub. The card is
+	 * released from jockey3_disconnect() with snd_card_free_when_closed()
+	 * instead, which is what every other USB sound driver does; the
+	 * resources that outlive it go in card->private_free below.
+	 */
+	ret = snd_card_new(&intf->dev, index[dev_idx], id[dev_idx], THIS_MODULE,
+			   sizeof(struct jockey3_chip), &card);
+	if (ret < 0)
+		goto err_free_idx;
+
+	chip = card->private_data;
+	chip->dev_idx = dev_idx;
+
+	chip->card = card;
+	/*
+	 * The card outlives the unbind, so these pointers must too:
+	 * snd_card_free_when_closed() defers the release until userspace closes
+	 * the card, while usb_disconnect() device_unregister()s the interfaces
+	 * as soon as the device leaves.
+	 *
+	 * This keeps the memory valid, not the device usable -- the interfaces
+	 * are still unbound and every transfer through them fails.
+	 * JOCKEY3_FLAG_DISCONNECTED remains the thing to test.
+	 */
+	chip->dev = usb_get_dev(dev);
+	chip->intf0 = usb_get_intf(intf);
+	chip->intf1 = usb_get_intf(intf1);
+	chip->flags = 0;
+
+	spin_lock_init(&chip->midi_lock);
+	spin_lock_init(&chip->playback.lock);
+	spin_lock_init(&chip->capture.lock);
+	mutex_init(&chip->rate_mutex);
+	init_completion(&chip->reset_done);
+
+	init_usb_anchor(&chip->playback.anchor);
+	init_usb_anchor(&chip->capture.anchor);
+	init_waitqueue_head(&chip->playback.drain_wait);
+	init_waitqueue_head(&chip->capture.drain_wait);
+
+	/*
+	 * Arm the release path only now that everything it touches exists --
+	 * jockey3_free_resources() calls mutex_destroy() on rate_mutex, so it
+	 * must not become reachable before mutex_init() above. From here on
+	 * every failure goes to err_free_card, and the card slot is given back
+	 * by jockey3_free_resources() rather than by err_free_idx. Keep this
+	 * assignment below the initialization block: nothing fallible may be
+	 * inserted between them.
+	 */
+	card->private_free = jockey3_card_free;
+	/*
+	 * card->private_data is zeroed by snd_card_new(), but be explicit:
+	 * these two are load-bearing for the stop/stall bookkeeping.
+	 */
+	atomic_set(&chip->playback.urbs_in_flight, 0);
+	atomic_set(&chip->capture.urbs_in_flight, 0);
+	atomic64_set(&chip->playback.last_callback_time, 0);
+	atomic64_set(&chip->capture.last_callback_time, 0);
+	atomic64_set(&chip->playback.urbs_started_time, 0);
+	atomic64_set(&chip->capture.urbs_started_time, 0);
+	/*
+	 * Default N until the first hw_params() picks a period-tuned value
+	 * (jockey3_pcm_set_n()); matches the width the URB buffers below are
+	 * actually allocated at, and jockey3_init_out_packet() primes.
+	 */
+	chip->playback.n_shift = ilog2(JOCKEY3_PLAYBACK_N);
+	chip->playback.n_pkts = JOCKEY3_PLAYBACK_N;
+	chip->capture.n_shift = ilog2(JOCKEY3_CAPTURE_N);
+	chip->capture.n_pkts = JOCKEY3_CAPTURE_N;
+	INIT_DELAYED_WORK(&chip->watchdog_work, jockey3_watchdog_work);
+
+	chip->xfer_buf = kmalloc(USB_XFER_BUF_SIZE, GFP_KERNEL);
+	if (!chip->xfer_buf) {
+		ret = -ENOMEM;
+		goto err_free_card;
+	}
+
+	ret = jockey3_init_midi_urb(chip);
+	if (ret < 0)
+		goto err_free_card;
+
+	ret = jockey3_init_playback_urbs(chip);
+	if (ret < 0)
+		goto err_free_card;
+
+	ret = jockey3_init_capture_urbs(chip);
+	if (ret < 0)
+		goto err_free_card;
+
+	/* Interface 1 owns the capture endpoint (0x86) */
+	ret = usb_driver_claim_interface(&jockey3_driver, intf1, chip);
+	if (ret < 0)
+		goto err_free_card;
+
+	ret = jockey3_init_pcm(chip);
+	if (ret < 0)
+		goto err_free_card;
+
+	ret = jockey3_init_midi(chip);
+	if (ret < 0)
+		goto err_free_card;
+
+	jockey3_setup_card_names(chip, usb_id->driver_info);
+
+	if (card->id[0] == '\0')
+		snd_card_set_id(card, "RJ3");
+
+	usb_set_intfdata(intf, chip);
+	ret = jockey3_initialize(chip, usb_id->driver_info);
+	if (ret < 0)
+		goto err_free_card;
+
+	ret = snd_card_register(card);
+	if (ret < 0)
+		goto err_free_card;
+
+	return 0;
+
+err_free_card:
+	/*
+	 * Same order as jockey3_disconnect(): latch DISCONNECTED so a watchdog
+	 * tick cannot re-arm itself, wait for any tick already running, kill the
+	 * URBs, and only then let go of interface 1 and the card. All of it is
+	 * safe on a half-built chip -- the locks, anchors and work item are
+	 * initialized above with no failure point between, and everything
+	 * jockey3_free_resources() touches is NULL until it is allocated.
+	 *
+	 * snd_card_free() rather than the disconnect path's
+	 * snd_card_free_when_closed(): the card is not registered yet on any
+	 * path that reaches here, so nothing can have it open and the
+	 * synchronous free cannot block.
+	 */
+	usb_set_intfdata(intf, NULL);
+	set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+	cancel_delayed_work_sync(&chip->watchdog_work);
+	jockey3_stop_urbs(chip);
+	usb_driver_release_interface(&jockey3_driver, intf1);
+	snd_card_free(card);
+	return ret;
+
+err_free_idx:
+	/* Only reached before the card exists */
+	scoped_guard(mutex, &jockey3_devices_mutex)
+		__clear_bit(dev_idx, jockey3_devices_used);
+	return ret;
+}
+
+static void jockey3_disconnect(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	/*
+	 * Latch DISCONNECTED first, and for EITHER interface. Every ALSA entry
+	 * point tests it on the way in, so setting it before anything else is
+	 * torn down closes the window where e.g. jockey3_pcm_hw_params() had
+	 * already passed its check and would go on to resubmit URBs we just
+	 * killed.
+	 *
+	 * Doing it for interface 1 as well is what covers the unbind order. The
+	 * driver is bound to both interfaces and the USB core takes them down
+	 * one at a time, calling disconnect() and then usb_disable_interface()
+	 * for each, so whichever goes first has its endpoints flushed while the
+	 * other is still bound. Those URBs come back -ESHUTDOWN through the
+	 * ordinary completion path, and without this they are indistinguishable
+	 * from an endpoint torn down behind the driver's back. Losing either
+	 * interface means the card is going away regardless -- interface 1 owns
+	 * the capture endpoint -- so there is nothing to keep running for.
+	 */
+	if (chip)
+		set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+
+	if (chip && intf == chip->intf0) {
+		clear_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
+		/*
+		 * Release anyone blocked in jockey3_wait_for_reset_completion():
+		 * a failed reset unbinds the interface instead of calling
+		 * jockey3_post_reset(), so this is the only wakeup they get.
+		 */
+		complete_all(&chip->reset_done);
+
+		/*
+		 * Sync here, unlike in jockey3_stop_urbs(): no mutex is held on
+		 * this path, and a tick that is mid-flight must be finished with
+		 * the chip before the card is torn down. DISCONNECTED is already
+		 * set above, so a tick that started just before this will not
+		 * requeue itself.
+		 */
+		cancel_delayed_work_sync(&chip->watchdog_work);
+
+		jockey3_stop_urbs(chip);
+
+		/*
+		 * Release interface 1 here, not from card->private_free: that
+		 * runs when the last file descriptor is closed, by which time
+		 * usb_disconnect() may already have freed the interface. This
+		 * recurses into jockey3_disconnect() for interface 1, which only
+		 * latches DISCONNECTED and clears its intfdata; if the core got
+		 * there first, usb_driver_release_interface() sees a condition
+		 * other than USB_INTERFACE_BOUND and returns.
+		 */
+		usb_driver_release_interface(&jockey3_driver, chip->intf1);
+
+		/*
+		 * snd_card_free_when_closed() disconnects the card now and frees
+		 * it once userspace has closed it -- it never blocks, which is
+		 * the whole point of not using a managed card (see the comment in
+		 * jockey3_probe()). It runs snd_pcm_stop(DISCONNECTED) under the
+		 * stream lock on the way, which drives our .trigger and clears
+		 * 'running' with the proper locking, so there is nothing to clear
+		 * here by hand. @chip lives in card->private_data and may be gone
+		 * the moment this returns, so nothing below may touch it.
+		 */
+		snd_card_free_when_closed(chip->card);
+	}
+	usb_set_intfdata(intf, NULL);
+}
+
+/*
+ * rate_mutex is taken and released within each of pre_reset()/post_reset()
+ * rather than being held across the reset. The USB core does not guarantee
+ * post_reset() runs at all: if the reset fails, the interface is marked for
+ * rebinding and unbound instead, so a lock handed off from pre_reset() would
+ * be leaked permanently and every later PCM ioctl would block on it forever.
+ *
+ * The window between the two callbacks is not left unguarded: the device is
+ * physically in reset, so every EP0 transfer fails and is error-checked, and
+ * JOCKEY3_FLAG_RESETTING gates the ALSA entry points.
+ */
+static int jockey3_pre_reset(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		/*
+		 * A reset started outside this driver -- usbfs USBDEVFS_RESET,
+		 * say -- does not pass through jockey3_queue_reset(), so
+		 * chip->reset_done still carries the complete_all() from the
+		 * previous reset and jockey3_wait_for_reset_completion() would
+		 * return immediately, letting an ALSA ioctl talk to a device
+		 * that is mid-reset. Re-arm it for that path. Testing the flag
+		 * unlocked is safe because the USB core serializes resets per
+		 * device, and re-arming before setting the flag leaves no
+		 * window in which a waiter sees "resetting" but a stale
+		 * completion.
+		 */
+		if (!jockey3_is_resetting(chip))
+			reinit_completion(&chip->reset_done);
+		set_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
+		scoped_guard(mutex, &chip->rate_mutex)
+			jockey3_stop_urbs(chip);
+	}
+	return 0;
+}
+
+static int jockey3_post_reset(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+	u32 hw_rate = 0;
+
+	if (chip && intf == chip->intf0) {
+		scoped_guard(mutex, &chip->rate_mutex) {
+			jockey3_initialize_ploytec(chip, NULL);
+
+			/*
+			 * Re-apply the rate unconditionally, as the vendor
+			 * sequence does. The read below is a diagnostic only.
+			 */
+			if (ploytec_get_rate(chip->intf0, chip->xfer_buf,
+					     PLOYTEC_RATE_IDX_DEVICE, &hw_rate) == 0 &&
+			    hw_rate != chip->current_rate)
+				dev_dbg(&chip->intf0->dev,
+					"Rate after reset: HW %u, expected %u\n",
+					hw_rate, chip->current_rate);
+
+			jockey3_set_rate(chip, chip->current_rate, true);
+
+			jockey3_start_urbs_failed(chip, jockey3_start_urbs(chip, false),
+						  "a device reset");
+		}
+
+		clear_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
+		complete_all(&chip->reset_done);
+	}
+	return 0;
+}
+
+static int jockey3_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		dev_dbg(&intf->dev, "USB suspend, stopping URBs\n");
+
+		/*
+		 * Before rate_mutex below: a tick blocked on that mutex resumes
+		 * the moment this drops it, and the flag is what stops it
+		 * restarting the ring. See jockey3_recover_urb_stream().
+		 */
+		set_bit(JOCKEY3_FLAG_SUSPENDED, &chip->flags);
+
+		/* Notify ALSA core to transition state and unblock userspace */
+		if (chip->pcm)
+			snd_pcm_suspend_all(chip->pcm);
+
+		/*
+		 * Stop the physical URBs under rate_mutex, matching
+		 * jockey3_restore_device() on the resume side -- otherwise a
+		 * suspend could land in the middle of a rate change.
+		 */
+		scoped_guard(mutex, &chip->rate_mutex)
+			jockey3_stop_urbs(chip);
+	}
+	return 0;
+}
+
+static int jockey3_restore_device(struct jockey3_chip *chip, bool reset)
+{
+	int ret;
+
+	guard(mutex)(&chip->rate_mutex);
+
+	/*
+	 * Cleared under the mutex, before the restart below that
+	 * jockey3_recover_urb_stream() defers to. A tick cannot slip in between:
+	 * it needs this same mutex to restart anything.
+	 */
+	clear_bit(JOCKEY3_FLAG_SUSPENDED, &chip->flags);
+
+	if (reset) {
+		ret = jockey3_initialize_ploytec(chip, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = jockey3_set_rate(chip, chip->current_rate, true);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Report the failure up: the PM core logs a failed resume, and unlike the
+	 * reset path there is no queued recovery on the way that would pick this
+	 * up on its own.
+	 */
+	ret = jockey3_start_urbs(chip, false);
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Failed to start URBs while restoring device: %d\n",
+			ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int jockey3_resume(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		dev_dbg(&intf->dev, "USB resume, restoring device\n");
+		return jockey3_restore_device(chip, false);
+	}
+	return 0;
+}
+
+static int jockey3_reset_resume(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		dev_dbg(&intf->dev, "USB reset resume, restoring device\n");
+		return jockey3_restore_device(chip, true);
+	}
+	return 0;
+}
+
+static const struct usb_device_id jockey3_ids[] = {
+	{ USB_DEVICE(RELOOP_VENDOR_ID, RELOOP_JOCKEY3_ME_PID), .driver_info = JOCKEY3_ME },
+	{ USB_DEVICE(RELOOP_VENDOR_ID, RELOOP_JOCKEY3_REMIX_PID), .driver_info = JOCKEY3_REMIX },
+	{}
+};
+MODULE_DEVICE_TABLE(usb, jockey3_ids);
+
+static struct usb_driver jockey3_driver = {
+	.name = "snd-reloop-jockey3",
+	/*
+	 * Tear our own URBs down rather than having the core do it first.
+	 *
+	 * Without this, usb_unbind_interface() calls usb_disable_interface()
+	 * before jockey3_disconnect(), so on an ordinary module unload the whole
+	 * ring retires with -ESHUTDOWN while the driver still believes it is
+	 * running -- indistinguishable, from inside the completion handler, from
+	 * an endpoint torn down behind our back. jockey3_disconnect() already
+	 * kills every URB, which is exactly the contract this flag asks for.
+	 *
+	 * It applies only while the device is still attached; on a physical
+	 * unplug the core kills the URBs first regardless, which is why the
+	 * completion path also tests USB_STATE_NOTATTACHED.
+	 */
+	.soft_unbind = 1,
+	.probe = jockey3_probe,
+	.disconnect = jockey3_disconnect,
+	.pre_reset = jockey3_pre_reset,
+	.post_reset = jockey3_post_reset,
+	.suspend = jockey3_suspend,
+	.resume = jockey3_resume,
+	.reset_resume = jockey3_reset_resume,
+	.id_table = jockey3_ids
+};
+
+/*
+ * The codec's bit-spread lookup tables are module-global and unlocked, so they
+ * are built once per module rather than per device.
+ */
+static int __init jockey3_module_init(void)
+{
+	enum ploytec_codec_variant codec_variant = ploytec_initialize_codec();
+
+	switch (codec_variant) {
+	case PLOYTEC_CODEC_PORTABLE:
+		pr_debug("using portable codec\n");
+		break;
+	case PLOYTEC_CODEC_OPTIMIZED_64BIT:
+		pr_debug("using 64-bit optimized codec\n");
+		break;
+	case PLOYTEC_CODEC_OPTIMIZED_32BIT:
+		pr_debug("using 32-bit optimized codec\n");
+		break;
+	}
+
+	return usb_register(&jockey3_driver);
+}
+module_init(jockey3_module_init);
+
+static void __exit jockey3_module_exit(void)
+{
+	usb_deregister(&jockey3_driver);
+}
+module_exit(jockey3_module_exit);
+
+MODULE_AUTHOR("Frank van de Pol <fvdpol@gmail.com>");
+MODULE_DESCRIPTION(CARD_NAME " ALSA Driver");
+MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: snd-pcm snd-rawmidi");
diff --git a/sound/usb/jockey3/ploytec_codec.c b/sound/usb/jockey3/ploytec_codec.c
new file mode 100644
index 0000000000000..8c660899a32a7
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_codec.c
@@ -0,0 +1,656 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   Ploytec PCM encoding/decoding functions for the S24_3LE format (3 bytes per sample)
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#include <linux/unaligned.h>
+#include <linux/string.h>
+#include "ploytec_codec.h"
+
+/**
+ * DOC: Why the wire format looks like this
+ *
+ * The "bit-plane" layout implemented below is not an arbitrary scramble; it is
+ * a direct image of how the hardware moves audio. On the Jockey 3 the USB
+ * device controller (NXP ISP1583) runs in split-bus mode, and the serial
+ * data lines of the capture ADCs are wired straight onto the low bits of its
+ * 16-bit DMA bus - one converter per bus bit. The controller samples the whole
+ * bus once per bit clock and streams the result to the host, so every byte on
+ * the wire is a snapshot of all the channel data lines at one instant.
+ *
+ * Decoding a frame is therefore a transpose:
+ *
+ * - The byte index is one bit-clock tick, most significant bit first: wire
+ *   byte 0 carries bit 23 of the current sample, wire byte 23 carries bit 0.
+ * - The bit position within each byte is one physical converter line, that is
+ *   one channel (bit 0, bit 1, bit 2, ... for successive converters).
+ * - The frame is two 24-byte halves, the left and right sub-frames of the
+ *   underlying I2S frame. On capture an 8-byte gap sits between and after the
+ *   halves: it is the unused tail of each 32-bit I2S slot (64-byte frame).
+ *   Playback is generated on the byte-wide microprocessor bus instead, so its
+ *   slots are packed to 24 bits with no gap (48-byte frame).
+ *
+ * Because the geometry follows from the I2S timing and the DMA bus width, it
+ * is fixed regardless of how many converters are populated. That is why the
+ * codec always works in 8-channel-wide slices and simply ignores the bit
+ * positions that carry no converter (the Jockey 3 populates three capture
+ * lines and two playback lines).
+ *
+ * This is a model inferred from the board schematic and the observed stream
+ * rather than from vendor documentation, but it accounts for every bit of the
+ * format the functions below implement.
+ */
+
+#if IS_ENABLED(CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC)
+
+/*
+ * The reference implementation of the Ploytec codec performs a bit
+ * gather/scatter operation with minimal optimization. It mainly serves as a
+ * readable definition of the wire format, and as the oracle the optimized
+ * variants below are validated against.
+ *
+ * Selected by CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC.
+ */
+
+/**
+ * ploytec_encode_s24_3le() - Encode 4-channel S24_3LE to 48-byte Ploytec frame
+ * @dest: 48-byte destination buffer
+ * @src: 12-byte source buffer (4 channels * 3 bytes)
+ *
+ * Ploytec Bit-Plane Interleaving (Playback):
+ * The firmware uses a non-standard "bit-plane" format where bits from different
+ * channels are interleaved into the same byte.
+ * - Each 48-byte frame carries one PCM frame: a single sample for each of
+ *   the 4 channels, spread one bit per wire byte.
+ * - Bytes 0-23: ALSA Channels 1 & 3
+ * - Bytes 24-47: ALSA Channels 2 & 4
+ * - Within each 24-byte block, bits are grouped by significance:
+ *   - [0-7]: Most significant bits
+ *   - [8-15]: Middle bits
+ *   - [16-23]: Least significant bits
+ * - bit 0 of each byte corresponds to the first channel in the pair.
+ * - bit 1 of each byte corresponds to the second channel in the pair.
+ */
+static inline void ploytec_encode_s24_3le(u8 *dest, const u8 *src)
+{
+	int i;
+
+	for (i = 0; i < 8; i++) {
+		/* First 24 bytes: odd channels (ALSA Ch 1 & 3) */
+		dest[i]      = (((src[2] >> (7 - i)) & 1) << 0) | (((src[8] >> (7 - i)) & 1) << 1);
+		dest[8 + i]  = (((src[1] >> (7 - i)) & 1) << 0) | (((src[7] >> (7 - i)) & 1) << 1);
+		dest[16 + i] = (((src[0] >> (7 - i)) & 1) << 0) | (((src[6] >> (7 - i)) & 1) << 1);
+
+		/* Second 24 bytes: even channels (ALSA Ch 2 & 4) */
+		dest[24 + i] = (((src[5] >> (7 - i)) & 1) << 0) | (((src[11] >> (7 - i)) & 1) << 1);
+		dest[32 + i] = (((src[4] >> (7 - i)) & 1) << 0) | (((src[10] >> (7 - i)) & 1) << 1);
+		dest[40 + i] = (((src[3] >> (7 - i)) & 1) << 0) | (((src[9]  >> (7 - i)) & 1) << 1);
+	}
+}
+
+/**
+ * ploytec_decode_s24_3le() - Decode 64-byte Ploytec frame to 6-channel S24_3LE
+ * @dest: 18-byte destination buffer (6 channels * 3 bytes)
+ * @src: 64-byte source buffer
+ *
+ * Ploytec Bit-Plane Interleaving (Capture):
+ * Similar to encoding, the capture path interleaves 3 pairs of channels
+ * into bit-planes (bit 0, 1, and 2 of each byte).
+ * - Bytes 0x00-0x17: Pair 1 (bits 0,1,2)
+ * - Bytes 0x20-0x37: Pair 2 (bits 0,1,2)
+ */
+static inline void ploytec_decode_s24_3le(u8 *dest, const u8 *src)
+{
+	int i;
+
+	memset(dest, 0, 18);
+	for (i = 0; i < 8; i++) {
+		/* Channel 1: odd channel 1 (bit 0 of bytes 0x00-0x17) */
+		dest[0x00] |= ((src[0x10 + i] & 0x01) << (7 - i));	// Ch1 LSB byte
+		dest[0x01] |= ((src[0x08 + i] & 0x01) << (7 - i));
+		dest[0x02] |= ((src[0x00 + i] & 0x01) << (7 - i));	// Ch1 MSB byte
+
+		/* Channel 2: even channel 2 (bit 0 of bytes 0x20-0x37) */
+		dest[0x03] |= ((src[0x30 + i] & 0x01) << (7 - i));
+		dest[0x04] |= ((src[0x28 + i] & 0x01) << (7 - i));
+		dest[0x05] |= ((src[0x20 + i] & 0x01) << (7 - i));
+
+		/* Channel 3: odd channel 3 (bit 1 of bytes 0x00-0x17) */
+		dest[0x06] |= (((src[0x10 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x07] |= (((src[0x08 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x08] |= (((src[0x00 + i] & 0x02) >> 1) << (7 - i));
+
+		/* Channel 4: even channel 4 (bit 1 of bytes 0x20-0x37) */
+		dest[0x09] |= (((src[0x30 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x0A] |= (((src[0x28 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x0B] |= (((src[0x20 + i] & 0x02) >> 1) << (7 - i));
+
+		/* Channel 5: odd channel 5 (bit 2 of bytes 0x00-0x17) */
+		dest[0x0C] |= (((src[0x10 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x0D] |= (((src[0x08 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x0E] |= (((src[0x00 + i] & 0x04) >> 2) << (7 - i));
+
+		/* Channel 6: even channel 6 (bit 2 of bytes 0x20-0x37) */
+		dest[0x0F] |= (((src[0x30 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x10] |= (((src[0x28 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x11] |= (((src[0x20 + i] & 0x04) >> 2) << (7 - i));
+	}
+}
+#elif defined(CONFIG_64BIT)
+/**
+ * DOC: Ploytec bit-plane interleaving optimization
+ *
+ * CORE PERFORMANCE PROBLEM:
+ * The Ploytec firmware uses a non-standard "bit-plane" format where bits
+ * from different channels are interleaved into the same byte. The naive
+ * implementation processes data bit-by-bit using heavily nested loops,
+ * causing massive CPU overhead due to serial bit-shifting operations,
+ * branch mispredictions, and an inability to utilize hardware pipelines.
+ *
+ * THE SOLUTION: SWAR (SIMD Within A Register) & INT-MULTIPLIERS
+ * Instead of bit-by-bit iteration, we treat entire 32-bit or 64-bit blocks
+ * of memory as parallel vector lanes inside standard CPU registers. This
+ * completely eliminates loops and branches, reducing operations to a small,
+ * deterministic chain of native processor instructions.
+ *
+ * -------------------------------------------------------------------------
+ * 1. ENCODING MATH: BIT-SPREAD LOOKUP TABLES (LUT)
+ * -------------------------------------------------------------------------
+ * To encode, we must take a single 8-bit channel byte (e.g., b7 b6 b5 ... b0)
+ * and "spread" its bits across an 8-byte destination block so that each bit
+ * lands on bit 0 of 8 separate bytes.
+ *
+ * 64-Bit Implementation:
+ * We use a precomputed 256-entry 64-bit LUT (ploytec_bit_spread). For any
+ * byte value, the table returns a u64 where the bits are perfectly spaced out:
+ * Input Byte:  0b11000000
+ * u64 Return:  0x0000000000000101 (Bit 7 and 6 mapped to byte 0 and 1)
+ *
+ * By loading the spread values of two channels simultaneously, we shift the
+ * second channel by 1 (<< 1) to align its bits to bit position 1, and bitwise
+ * OR them together. This encodes two full channels into an 8-byte frame using
+ * just one lookup and a single 64-bit store.
+ *
+ * 32-Bit Implementation:
+ * A 32-bit register cannot hold 8 spread bytes at once. Thus, the 32-bit
+ * variant splits the input byte into two 4-bit nibbles using two distinct
+ * 32-bit LUTs (high nibble and low nibble). Each lookup fills 4 bytes of
+ * destination memory natively using 32-bit registers, maintaining low
+ * register pressure and avoiding 64-bit arithmetic emulation penalties on
+ * 32-bit architectures (like ARM32/armhf).
+ *
+ * -------------------------------------------------------------------------
+ * 2. DECODING MATH: PARALLEL BIT GATHER VIA MAGIC MULTIPLIERS
+ * -------------------------------------------------------------------------
+ * To decode, we must perform the inverse: extract a specific bit position
+ * from 8 consecutive bytes in memory and pack them back into a single byte.
+ *
+ * 64-Bit Implementation (`pack_bit_plane64`):
+ * 1. Load 8 bytes into a u64 register.
+ * 2. Shift right by the desired bit index and mask with 0x0101010101010101ULL.
+ * This leaves the target bit isolated as bit 0 of every single byte.
+ * 3. Multiply the masked u64 by the magic constant: 0x8040201008040201ULL.
+ *
+ * This multiplication acts as a parallel shift-and-add engine:
+ * Byte 7 is multiplied by 0x01 (shifted << 0)
+ * Byte 6 is multiplied by 0x02 (shifted << 1)
+ * ...
+ * Byte 0 is multiplied by 0x80 (shifted << 7)
+ *
+ * The mathematical properties of this multiplication collapse all 8 isolated
+ * bits perfectly into the most significant byte (the highest 8 bits) of the
+ * u64 register. A final logical shift right (>> 56) extracts the completed
+ * audio byte in a single operation.
+ *
+ * 32-Bit Implementation (`pack_bit_plane32`):
+ * To avoid emulating 64-bit multiplication on a 32-bit CPU, we read two
+ * separate 4-byte halves into native u32 registers. We apply the 32-bit
+ * magic multiplier (0x08040201U) to both halves independently. This collapses
+ * each half into a 4-bit nibble at the top of each register. We then combine
+ * the two resulting nibbles `(high << 4) | low` to form the final byte.
+ *
+ * -------------------------------------------------------------------------
+ * 3. ENDIANNESS & ALIGNMENT MITIGATION
+ * -------------------------------------------------------------------------
+ * All bitwise shifting (`<<`, `>>`) and multiplier math inside CPU registers
+ * is inherently endian-agnostic. However, reading and writing these multi-byte
+ * integers (u32/u64) directly to physical RAM introduces two system hazards:
+ * - Byte Inversion on Big Endian architectures (e.g., MIPS, PowerPC).
+ * - Kernel Alignment Faults (SIGBUS) on alignment-strict processors.
+ *
+ * To ensure safe, architecture-independent execution, all memory interfaces
+ * utilize the kernel's `get_unaligned_le32/64` and `put_unaligned_le32/64`
+ * macros (or user-space memcpy/bswap equivalents).
+ *
+ * On little-endian architectures with unaligned support (x86_64, arm64, armhf),
+ * the compiler optimizes these macros completely out, compiling down to standard,
+ * zero-overhead native instruction loads and stores. On big-endian or strict-
+ * alignment architectures, the macros safely handle arbitrary memory addresses
+ * and emit hardware byte-swaps (`rev`) automatically.
+ *
+ * -------------------------------------------------------------------------
+ * 4. EMPIRICAL PERFORMANCE TESTING
+ * -------------------------------------------------------------------------
+ * Compared to the reference implementation, testing of these optimized
+ * versions showed a significant improvement, justifying the added complexity
+ * from these optimizations. Table shows the relative speed-up and the time
+ * for encoding (4ch) or decoding (6ch) a sample frame on the validation
+ * hardware, measured through the batch API at the batch sizes the driver
+ * actually uses (10 frames per encode call, 8 per decode):
+ *
+ * Architecture	Bit	Encode	Decode		Encode Time	Decode Time
+ *   i386	32	 6.2x	 5.4x		  8.3 ns	 20.7 ns
+ *   x86_64	64	11.0x	 7.8x		  3.7 ns	 11.9 ns
+ *   armhf	32	 3.3x	 4.8x		358.2 ns	762.7 ns
+ *   arm64	64	 6.9x	 6.1x		 13.6 ns	 35.5 ns
+ *
+ * i386 and x86_64 on a Core i5-6500, arm64 on a Raspberry Pi 4B, armhf on a
+ * Raspberry Pi 1B+ (ARMv6). Speed-up is against this same build's portable
+ * reference codec on the same machine, so it is comparable across rows; the
+ * absolute times are not.
+ *
+ * The 64-bit variants gain more than the 32-bit ones because the transpose
+ * works in register-width chunks: a 64-bit word carries twice the bit-plane
+ * of a 32-bit one, so the same frame needs half the operations.
+ */
+
+static u64 ploytec_bit_spread_64[256];
+
+/**
+ * init_ploytec_bit_spread_lut64() - Build the 64-bit bit-spread lookup table
+ *
+ * Precomputes ploytec_bit_spread_64[], mapping each possible input byte to
+ * the 8-byte bit-plane pattern used by ploytec_encode_s24_3le_lut64(). See
+ * the optimization note above for details of the algorithm.
+ */
+static void init_ploytec_bit_spread_lut64(void)
+{
+	for (int b = 0; b < 256; b++) {
+		u64 spread = 0;
+
+		// Extract bit (7 - i) and place it into bit 0 of byte i
+		for (int i = 0; i < 8; i++)
+			spread |= (u64)((b >> (7 - i)) & 1) << (i * 8);
+
+		ploytec_bit_spread_64[b] = spread;
+	}
+}
+
+/**
+ * ploytec_encode_s24_3le_lut64() - Encode 4-channel S24_3LE using the 64-bit LUT bit-spread method
+ * @dest: 48-byte destination buffer
+ * @src: 12-byte source buffer (4 channels * 3 bytes)
+ *
+ * Optimized, CONFIG_64BIT equivalent of ploytec_encode_s24_3le(); produces
+ * identical output. See the bit-plane layout on ploytec_encode_s24_3le()
+ * and the optimization note above for the LUT technique used here.
+ */
+static inline void ploytec_encode_s24_3le_lut64(u8 *dest, const u8 *src)
+{
+	/*
+	 * put_unaligned_le64 safely writes a 64-bit value in Little Endian
+	 * order, even if the target CPU is Big Endian or alignment-strict.
+	 */
+
+	// First 24 bytes: odd channels (ALSA Ch 1 & 3)
+	put_unaligned_le64(ploytec_bit_spread_64[src[2]] |
+			   (ploytec_bit_spread_64[src[8]] << 1), dest + 0);
+	put_unaligned_le64(ploytec_bit_spread_64[src[1]] |
+			   (ploytec_bit_spread_64[src[7]] << 1), dest + 8);
+	put_unaligned_le64(ploytec_bit_spread_64[src[0]] |
+			   (ploytec_bit_spread_64[src[6]] << 1), dest + 16);
+
+	// Second 24 bytes: even channels (ALSA Ch 2 & 4)
+	put_unaligned_le64(ploytec_bit_spread_64[src[5]] |
+			   (ploytec_bit_spread_64[src[11]] << 1), dest + 24);
+	put_unaligned_le64(ploytec_bit_spread_64[src[4]] |
+			   (ploytec_bit_spread_64[src[10]] << 1), dest + 32);
+	put_unaligned_le64(ploytec_bit_spread_64[src[3]] |
+			   (ploytec_bit_spread_64[src[9]] << 1), dest + 40);
+}
+
+/**
+ * pack_bit_plane64() - Gather bit @bit_index of 8 consecutive bytes into one byte
+ * @val: 8 source bytes loaded as a little-endian u64
+ * @bit_index: bit position (0-7) to extract from each source byte
+ *
+ * Return: the gathered byte, using the magic-multiplier technique described
+ * in the optimization note above.
+ */
+static inline u8 pack_bit_plane64(u64 val, int bit_index)
+{
+	// Shift target bit to bit 0 of each byte, then mask it
+	u64 masked = (val >> bit_index) & 0x0101010101010101ULL;
+
+	/*
+	 * Multiplier acts as a parallel shift-and-add, collecting the bits
+	 * into the highest byte of the u64.
+	 */
+	return (u8)((masked * 0x8040201008040201ULL) >> 56);
+}
+
+/**
+ * ploytec_decode_s24_3le_pack64() - Decode a Ploytec frame using the 64-bit magic-multiplier method
+ * @dest: 18-byte destination buffer (6 channels * 3 bytes)
+ * @src: 64-byte source buffer
+ *
+ * Optimized, CONFIG_64BIT equivalent of ploytec_decode_s24_3le(); produces
+ * identical output. See the bit-plane layout on ploytec_decode_s24_3le()
+ * and the optimization note above for the gather technique used here.
+ */
+static inline void ploytec_decode_s24_3le_pack64(u8 *dest, const u8 *src)
+{
+	u64 blocks_0_17_low  = get_unaligned_le64(src + 0x00);
+	u64 blocks_0_17_mid  = get_unaligned_le64(src + 0x08);
+	u64 blocks_0_17_high = get_unaligned_le64(src + 0x10);
+
+	u64 blocks_20_37_low  = get_unaligned_le64(src + 0x20);
+	u64 blocks_20_37_mid  = get_unaligned_le64(src + 0x28);
+	u64 blocks_20_37_high = get_unaligned_le64(src + 0x30);
+
+	// Channel 1 (Bit 0 of bytes 0x00-0x17)
+	dest[0x00] = pack_bit_plane64(blocks_0_17_high, 0);
+	dest[0x01] = pack_bit_plane64(blocks_0_17_mid,  0);
+	dest[0x02] = pack_bit_plane64(blocks_0_17_low,  0);
+
+	// Channel 2 (Bit 0 of bytes 0x20-0x37)
+	dest[0x03] = pack_bit_plane64(blocks_20_37_high, 0);
+	dest[0x04] = pack_bit_plane64(blocks_20_37_mid,  0);
+	dest[0x05] = pack_bit_plane64(blocks_20_37_low,  0);
+
+	// Channel 3 (Bit 1 of bytes 0x00-0x17)
+	dest[0x06] = pack_bit_plane64(blocks_0_17_high, 1);
+	dest[0x07] = pack_bit_plane64(blocks_0_17_mid,  1);
+	dest[0x08] = pack_bit_plane64(blocks_0_17_low,  1);
+
+	// Channel 4 (Bit 1 of bytes 0x20-0x37)
+	dest[0x09] = pack_bit_plane64(blocks_20_37_high, 1);
+	dest[0x0A] = pack_bit_plane64(blocks_20_37_mid,  1);
+	dest[0x0B] = pack_bit_plane64(blocks_20_37_low,  1);
+
+	// Channel 5 (Bit 2 of bytes 0x00-0x17)
+	dest[0x0C] = pack_bit_plane64(blocks_0_17_high, 2);
+	dest[0x0D] = pack_bit_plane64(blocks_0_17_mid,  2);
+	dest[0x0E] = pack_bit_plane64(blocks_0_17_low,  2);
+
+	// Channel 6 (Bit 2 of bytes 0x20-0x37)
+	dest[0x0F] = pack_bit_plane64(blocks_20_37_high, 2);
+	dest[0x10] = pack_bit_plane64(blocks_20_37_mid,  2);
+	dest[0x11] = pack_bit_plane64(blocks_20_37_low,  2);
+}
+
+#else /* optimized codec, 32-bit build */
+static u32 ploytec_bit_spread_32_high[256];
+static u32 ploytec_bit_spread_32_low[256];
+
+/**
+ * init_ploytec_bit_spread_lut32() - Build the 32-bit bit-spread lookup tables
+ *
+ * Precomputes ploytec_bit_spread_32_high[] and ploytec_bit_spread_32_low[],
+ * the 32-bit nibble-split equivalent of init_ploytec_bit_spread_lut64() for
+ * architectures without efficient native 64-bit arithmetic. See the
+ * optimization note above for details.
+ */
+static void init_ploytec_bit_spread_lut32(void)
+{
+	for (int b = 0; b < 256; b++) {
+		u32 high_spread = 0;
+		u32 low_spread  = 0;
+
+		// Process high nibble (bits 7 down to 4) -> maps to bytes 0 to 3
+		for (int i = 0; i < 4; i++)
+			high_spread |= (u32)((b >> (7 - i)) & 1) << (i * 8);
+
+		// Process low nibble (bits 3 down to 0) -> maps to bytes 0 to 3
+		for (int i = 0; i < 4; i++)
+			low_spread  |= (u32)((b >> (3 - i)) & 1) << (i * 8);
+
+		ploytec_bit_spread_32_high[b] = high_spread;
+		ploytec_bit_spread_32_low[b]  = low_spread;
+	}
+}
+
+/**
+ * ploytec_encode_s24_3le_lut32() - Encode 4-channel S24_3LE using the 32-bit LUT bit-spread method
+ * @dest: 48-byte destination buffer
+ * @src: 12-byte source buffer (4 channels * 3 bytes)
+ *
+ * 32-bit equivalent of ploytec_encode_s24_3le_lut64() for architectures
+ * without efficient native 64-bit arithmetic; produces identical output.
+ */
+static inline void ploytec_encode_s24_3le_lut32(u8 *dest, const u8 *src)
+{
+	/*
+	 * put_unaligned_le32 safely writes a 32-bit value in Little Endian
+	 * order, even if the target CPU is Big Endian or alignment-strict.
+	 */
+
+	// First 24 bytes: Odd channels (ALSA Ch 1 [src 0,1,2] & Ch 3 [src 6,7,8])
+	// Block 1: Most Significant Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[2]] |
+			   (ploytec_bit_spread_32_high[src[8]] << 1), dest + 0);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[2]]  |
+			   (ploytec_bit_spread_32_low[src[8]]  << 1), dest + 4);
+
+	// Block 2: Middle Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[1]] |
+			   (ploytec_bit_spread_32_high[src[7]] << 1), dest + 8);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[1]]  |
+			   (ploytec_bit_spread_32_low[src[7]]  << 1), dest + 12);
+
+	// Block 3: Least Significant Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[0]] |
+			   (ploytec_bit_spread_32_high[src[6]] << 1), dest + 16);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[0]]  |
+			   (ploytec_bit_spread_32_low[src[6]]  << 1), dest + 20);
+
+	// Second 24 bytes: Even channels (ALSA Ch 2 [src 3,4,5] & Ch 4 [src 9,10,11])
+	// Block 1: Most Significant Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[5]] |
+			   (ploytec_bit_spread_32_high[src[11]] << 1), dest + 24);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[5]]  |
+			   (ploytec_bit_spread_32_low[src[11]]  << 1), dest + 28);
+
+	// Block 2: Middle Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[4]] |
+			   (ploytec_bit_spread_32_high[src[10]] << 1), dest + 32);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[4]]  |
+			   (ploytec_bit_spread_32_low[src[10]]  << 1), dest + 36);
+
+	// Block 3: Least Significant Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[3]] |
+			   (ploytec_bit_spread_32_high[src[9]] << 1), dest + 40);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[3]]  |
+			   (ploytec_bit_spread_32_low[src[9]]  << 1), dest + 44);
+}
+
+/**
+ * pack_bit_plane32() - Gather bit @bit_index of 8 consecutive bytes into one byte
+ * @high_4_bytes: first 4 source bytes of the block, holding the high nibble (bits 7-4)
+ * @low_4_bytes: last 4 source bytes of the block, holding the low nibble (bits 3-0)
+ * @bit_index: bit position (0-7) to extract from each source byte
+ *
+ * Return: the gathered byte, using the magic-multiplier technique described
+ * in the optimization note above.
+ */
+static inline u8 pack_bit_plane32(u32 high_4_bytes, u32 low_4_bytes, int bit_index)
+{
+	// Isolate the targeted bit index across all 4 bytes simultaneously
+	u32 high_masked = (high_4_bytes >> bit_index) & 0x01010101U;
+	u32 low_masked  = (low_4_bytes  >> bit_index) & 0x01010101U;
+
+	// Use 32-bit multiplier to gather bits 0,1,2,3 into the highest byte
+	u8 high_bits = (u8)((high_masked * 0x08040201U) >> 24);
+	u8 low_bits  = (u8)((low_masked  * 0x08040201U) >> 24);
+
+	// Combine the upper 4 bits and lower 4 bits into the single output audio byte
+	return (high_bits << 4) | low_bits;
+}
+
+/**
+ * ploytec_decode_s24_3le_pack32() - Decode a Ploytec frame using the 32-bit magic-multiplier method
+ * @dest: 18-byte destination buffer (6 channels * 3 bytes)
+ * @src: 64-byte source buffer
+ *
+ * 32-bit equivalent of ploytec_decode_s24_3le_pack64() for architectures
+ * without efficient native 64-bit arithmetic; produces identical output.
+ */
+static inline void ploytec_decode_s24_3le_pack32(u8 *dest, const u8 *src)
+{
+	// Pre-load all required 4-byte chunks into native 32-bit registers
+	u32 src_00_high = get_unaligned_le32(src + 0x00);
+	u32 src_04_low  = get_unaligned_le32(src + 0x04);
+	u32 src_08_high = get_unaligned_le32(src + 0x08);
+	u32 src_0C_low  = get_unaligned_le32(src + 0x0C);
+	u32 src_10_high = get_unaligned_le32(src + 0x10);
+	u32 src_14_low  = get_unaligned_le32(src + 0x14);
+
+	u32 src_20_high = get_unaligned_le32(src + 0x20);
+	u32 src_24_low  = get_unaligned_le32(src + 0x24);
+	u32 src_28_high = get_unaligned_le32(src + 0x28);
+	u32 src_2C_low  = get_unaligned_le32(src + 0x2C);
+	u32 src_30_high = get_unaligned_le32(src + 0x30);
+	u32 src_34_low  = get_unaligned_le32(src + 0x34);
+
+	// --- Channel 1: Bit 0 of bytes 0x00-0x17 ---
+	dest[0x00] = pack_bit_plane32(src_10_high, src_14_low, 0);
+	dest[0x01] = pack_bit_plane32(src_08_high, src_0C_low, 0);
+	dest[0x02] = pack_bit_plane32(src_00_high, src_04_low, 0);
+
+	// --- Channel 2: Bit 0 of bytes 0x20-0x37 ---
+	dest[0x03] = pack_bit_plane32(src_30_high, src_34_low, 0);
+	dest[0x04] = pack_bit_plane32(src_28_high, src_2C_low, 0);
+	dest[0x05] = pack_bit_plane32(src_20_high, src_24_low, 0);
+
+	// --- Channel 3: Bit 1 of bytes 0x00-0x17 ---
+	dest[0x06] = pack_bit_plane32(src_10_high, src_14_low, 1);
+	dest[0x07] = pack_bit_plane32(src_08_high, src_0C_low, 1);
+	dest[0x08] = pack_bit_plane32(src_00_high, src_04_low, 1);
+
+	// --- Channel 4: Bit 1 of bytes 0x20-0x37 ---
+	dest[0x09] = pack_bit_plane32(src_30_high, src_34_low, 1);
+	dest[0x0A] = pack_bit_plane32(src_28_high, src_2C_low, 1);
+	dest[0x0B] = pack_bit_plane32(src_20_high, src_24_low, 1);
+
+	// --- Channel 5: Bit 2 of bytes 0x00-0x17 ---
+	dest[0x0C] = pack_bit_plane32(src_10_high, src_14_low, 2);
+	dest[0x0D] = pack_bit_plane32(src_08_high, src_0C_low, 2);
+	dest[0x0E] = pack_bit_plane32(src_00_high, src_04_low, 2);
+
+	// --- Channel 6: Bit 2 of bytes 0x20-0x37 ---
+	dest[0x0F] = pack_bit_plane32(src_30_high, src_34_low, 2);
+	dest[0x10] = pack_bit_plane32(src_28_high, src_2C_low, 2);
+	dest[0x11] = pack_bit_plane32(src_20_high, src_24_low, 2);
+}
+#endif
+
+/*
+ * Bind the build's chosen implementation to a single pair of names, so that
+ * everything below is free of conditional compilation.
+ */
+#if IS_ENABLED(CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC)
+
+static const enum ploytec_codec_variant ploytec_codec_selected =
+	PLOYTEC_CODEC_PORTABLE;
+
+static void ploytec_codec_init_tables(void) { }
+
+static inline void ploytec_encode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_encode_s24_3le(dest, src);
+}
+
+static inline void ploytec_decode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_decode_s24_3le(dest, src);
+}
+
+#elif defined(CONFIG_64BIT)
+
+static const enum ploytec_codec_variant ploytec_codec_selected =
+	PLOYTEC_CODEC_OPTIMIZED_64BIT;
+
+static void ploytec_codec_init_tables(void)
+{
+	init_ploytec_bit_spread_lut64();
+}
+
+static inline void ploytec_encode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_encode_s24_3le_lut64(dest, src);
+}
+
+static inline void ploytec_decode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_decode_s24_3le_pack64(dest, src);
+}
+
+#else
+
+static const enum ploytec_codec_variant ploytec_codec_selected =
+	PLOYTEC_CODEC_OPTIMIZED_32BIT;
+
+static void ploytec_codec_init_tables(void)
+{
+	init_ploytec_bit_spread_lut32();
+}
+
+static inline void ploytec_encode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_encode_s24_3le_lut32(dest, src);
+}
+
+static inline void ploytec_decode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_decode_s24_3le_pack32(dest, src);
+}
+
+#endif
+
+/**
+ * ploytec_initialize_codec() - Initialize the codec's pre-computed lookup tables
+ *
+ * Builds the bit-spread lookup table(s) used by the optimized encoder/decoder.
+ * Must be called once (e.g. at driver probe) before any call to
+ * ploytec_encode_batch() or ploytec_decode_batch().
+ *
+ * Return: which codec variant this build selected, for the caller to log.
+ */
+enum ploytec_codec_variant ploytec_initialize_codec(void)
+{
+	ploytec_codec_init_tables();
+	return ploytec_codec_selected;
+}
+
+/**
+ * ploytec_encode_batch() - Encode a number of 4-channel S24_3LE to 48-byte Ploytec frames
+ * @dest: n_frames * 48-byte destination buffer (Ploytec playback frame)
+ * @src: n_frames * 12-byte source buffer (4 channels * 3 bytes)
+ * @n_frames: number of frames to process in this batch
+ */
+void ploytec_encode_batch(u8 *dest, const u8 *src, const int n_frames)
+{
+	for (int f = 0; f < n_frames; f++) {
+		ploytec_encode_frame(dest, src);
+		dest += PLOYTEC_PLAYBACK_FRAME_SIZE;
+		src += PLOYTEC_PLAYBACK_PCM_FRAME_SIZE;
+	}
+}
+
+/**
+ * ploytec_decode_batch() - Decode a number of 64-byte Ploytec frames to 6-channel S24_3LE
+ * @dest: n_frames * 18-byte destination buffer (6 channels * 3 bytes)
+ * @src: n_frames * 64-byte source buffer
+ * @n_frames: number of frames to process in this batch
+ */
+void ploytec_decode_batch(u8 *dest, const u8 *src, const int n_frames)
+{
+	for (int f = 0; f < n_frames; f++) {
+		ploytec_decode_frame(dest, src);
+		dest += PLOYTEC_CAPTURE_PCM_FRAME_SIZE;
+		src += PLOYTEC_CAPTURE_FRAME_SIZE;
+	}
+}
diff --git a/sound/usb/jockey3/ploytec_codec.h b/sound/usb/jockey3/ploytec_codec.h
new file mode 100644
index 0000000000000..40917f49eae75
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_codec.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   Ploytec PCM encoding/decoding functions for the S24_3LE format (3 bytes per sample)
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#ifndef __SOUND_USB_JOCKEY3_PLOYTEC_CODEC_H
+#define __SOUND_USB_JOCKEY3_PLOYTEC_CODEC_H
+
+#include <linux/types.h>
+
+/*
+ * Playback: 4 channels, capture: 6 channels, both S24_3LE (3 bytes/sample).
+ * The *_FRAME_SIZE values are the Ploytec wire format; the *_PCM_FRAME_SIZE
+ * values are the corresponding ALSA-side frame.
+ */
+#define PLOYTEC_PLAYBACK_FRAMES		10	// number of samples per frame
+#define PLOYTEC_PLAYBACK_FRAME_SIZE	48
+#define PLOYTEC_PLAYBACK_PCM_FRAME_SIZE	12	// 4 channels * 3 bytes
+
+#define PLOYTEC_CAPTURE_FRAMES		8	// number of samples per frame
+#define PLOYTEC_CAPTURE_FRAME_SIZE	64
+#define PLOYTEC_CAPTURE_PCM_FRAME_SIZE	18	// 6 channels * 3 bytes
+
+/**
+ * enum ploytec_codec_variant - which encode/decode implementation got selected
+ * @PLOYTEC_CODEC_PORTABLE: portable reference implementation
+ * @PLOYTEC_CODEC_OPTIMIZED_64BIT: lookup-table/bit-packing codec, 64-bit build
+ * @PLOYTEC_CODEC_OPTIMIZED_32BIT: lookup-table/bit-packing codec, 32-bit build
+ */
+enum ploytec_codec_variant {
+	PLOYTEC_CODEC_PORTABLE,
+	PLOYTEC_CODEC_OPTIMIZED_64BIT,
+	PLOYTEC_CODEC_OPTIMIZED_32BIT,
+};
+
+/* batching of the sample processing */
+enum ploytec_codec_variant ploytec_initialize_codec(void);
+void ploytec_encode_batch(u8 *dest, const u8 *src, const int n_frames);
+void ploytec_decode_batch(u8 *dest, const u8 *src, const int n_frames);
+
+#endif /* __SOUND_USB_JOCKEY3_PLOYTEC_CODEC_H */
diff --git a/sound/usb/jockey3/ploytec_codec_kunit.c b/sound/usb/jockey3/ploytec_codec_kunit.c
new file mode 100644
index 0000000000000..28ca832cfec23
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_codec_kunit.c
@@ -0,0 +1,871 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   KUnit tests for the Ploytec bit-plane codec
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+/**
+ * DOC: Proving the Ploytec codec correct
+ *
+ * ploytec_codec.c carries three implementations of one bit-scatter/gather
+ * algorithm - a portable reference plus 32-bit and 64-bit SWAR variants that
+ * use magic-multiplier tricks and 256-entry lookup tables. Exactly one is
+ * compiled into any given build, chosen by CONFIG_64BIT and
+ * CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC. The optimized paths are 4-10x
+ * faster and are what every user actually runs, but they are not obviously
+ * correct by inspection.
+ *
+ * These tests validate whichever variant the build selected, through the
+ * public ploytec_encode_batch() / ploytec_decode_batch() entry points. No
+ * symbols are exported and the codec is not modified to be testable; the
+ * test object is simply linked into the same module.
+ *
+ * The strategy is stronger than sampling random inputs:
+ *
+ * 1. The oracle is a *declarative bit map* (ploytec_encode_map[] and
+ *    ploytec_decode_map[] below), not a second copy of the driver's loops.
+ *    Because it states the format as data rather than as control flow, a
+ *    transcription error cannot propagate symmetrically into both.
+ *
+ * 2. The codec is a pure bit permutation, so as a function over GF(2) it is
+ *    linear. ploytec_test_*_is_linear() establishes that linearity holds, and
+ *    ploytec_test_*_permutation_complete() measures the map's action on every
+ *    single basis vector. A linear map is *fully determined* by its action on
+ *    the basis, so together those two cases pin down the result for all 2^96
+ *    (encode) and 2^512 (decode) possible inputs.
+ *
+ *    The residual risk is a non-linearity that the sampled pairs happen to
+ *    miss; the tests are not a formal proof, but they are far more than spot
+ *    checks.
+ *
+ * 3. Golden vectors generated by an independent Python model of the format
+ *    (tests/codec/ploytec_model.py) guard against the whole family drifting
+ *    away from the wire format together.
+ *
+ * Randomized cases use a small seeded xorshift generator rather than the
+ * kernel RNG, so every architecture exercises identical data and any failure
+ * reproduces exactly.
+ */
+
+#include <kunit/test.h>
+#include <linux/string.h>
+#include "ploytec_codec.h"
+#include "ploytec_codec_test_vectors.h"
+
+/* Largest batch either direction is ever asked for, from jockey3.c */
+#define PLOYTEC_TEST_MAX_ENCODE_FRAMES	PLOYTEC_PLAYBACK_FRAMES
+#define PLOYTEC_TEST_MAX_DECODE_FRAMES	PLOYTEC_CAPTURE_FRAMES
+
+/* How many random frames the sampling-based cases run through */
+#define PLOYTEC_TEST_RANDOM_FRAMES	4096
+#define PLOYTEC_TEST_LINEARITY_PAIRS	2048
+
+/* Guard region used to catch writes outside the destination buffer */
+#define PLOYTEC_TEST_GUARD		64
+#define PLOYTEC_TEST_GUARD_BYTE		0xA5
+
+/* Wire bytes the capture decoder must never read */
+#define PLOYTEC_TEST_UNUSED0_START	0x18
+#define PLOYTEC_TEST_UNUSED0_END	0x20
+#define PLOYTEC_TEST_UNUSED1_START	0x38
+#define PLOYTEC_TEST_UNUSED1_END	0x40
+
+/*
+ * The format, stated as data.
+ *
+ * Playback packs 4 channels into 48 wire bytes as two pairs: (ch0, ch2) in
+ * bytes 0..23 and (ch1, ch3) in bytes 24..47. Each 24-byte block holds three
+ * 8-byte planes ordered most-significant sample byte first. Within a plane,
+ * wire byte i carries bit (7 - i) of the sample byte, and a channel's index
+ * within its pair picks the bit of the wire byte it lands in.
+ */
+struct ploytec_encode_map_entry {
+	u8 src_idx;	// byte of the 12-byte PCM frame
+	u8 dst_base;	// first wire byte of the plane it scatters into
+	u8 dst_bit;	// bit of each wire byte it occupies
+};
+
+static const struct ploytec_encode_map_entry ploytec_encode_map[] = {
+	{  2,  0, 0 }, {  8,  0, 1 },	/* ch0 / ch2, most significant byte */
+	{  1,  8, 0 }, {  7,  8, 1 },	/* ch0 / ch2, middle byte */
+	{  0, 16, 0 }, {  6, 16, 1 },	/* ch0 / ch2, least significant byte */
+	{  5, 24, 0 }, { 11, 24, 1 },	/* ch1 / ch3, most significant byte */
+	{  4, 32, 0 }, { 10, 32, 1 },	/* ch1 / ch3, middle byte */
+	{  3, 40, 0 }, {  9, 40, 1 },	/* ch1 / ch3, least significant byte */
+};
+
+/*
+ * Capture unpacks 6 channels from 48 of the 64 wire bytes, as two groups of
+ * three: group 0 at 0x00..0x17 holds ch0, ch2, ch4 and group 1 at
+ * 0x20..0x37 holds ch1, ch3, ch5. Plane ordering matches playback, and a
+ * channel's index within its group picks the bit of the wire byte it was
+ * packed into. Wire bytes 0x18..0x1f and 0x38..0x3f carry nothing.
+ */
+struct ploytec_decode_map_entry {
+	u8 dst_idx;	// byte of the 18-byte PCM frame
+	u8 src_base;	// first wire byte of the plane it gathers from
+	u8 src_bit;	// bit of each wire byte it was packed into
+};
+
+static const struct ploytec_decode_map_entry ploytec_decode_map[] = {
+	{ 0x00, 0x10, 0 }, { 0x01, 0x08, 0 }, { 0x02, 0x00, 0 },	/* ch0 */
+	{ 0x03, 0x30, 0 }, { 0x04, 0x28, 0 }, { 0x05, 0x20, 0 },	/* ch1 */
+	{ 0x06, 0x10, 1 }, { 0x07, 0x08, 1 }, { 0x08, 0x00, 1 },	/* ch2 */
+	{ 0x09, 0x30, 1 }, { 0x0A, 0x28, 1 }, { 0x0B, 0x20, 1 },	/* ch3 */
+	{ 0x0C, 0x10, 2 }, { 0x0D, 0x08, 2 }, { 0x0E, 0x00, 2 },	/* ch4 */
+	{ 0x0F, 0x30, 2 }, { 0x10, 0x28, 2 }, { 0x11, 0x20, 2 },	/* ch5 */
+};
+
+/**
+ * ploytec_oracle_encode() - Encode one frame straight from the bit map
+ * @dest: 48-byte destination buffer
+ * @src: 12-byte source buffer
+ */
+static void ploytec_oracle_encode(u8 *dest, const u8 *src)
+{
+	memset(dest, 0, PLOYTEC_PLAYBACK_FRAME_SIZE);
+
+	for (size_t e = 0; e < ARRAY_SIZE(ploytec_encode_map); e++) {
+		const struct ploytec_encode_map_entry *m = &ploytec_encode_map[e];
+
+		for (int i = 0; i < 8; i++)
+			dest[m->dst_base + i] |=
+				((src[m->src_idx] >> (7 - i)) & 1) << m->dst_bit;
+	}
+}
+
+/**
+ * ploytec_oracle_decode() - Decode one frame straight from the bit map
+ * @dest: 18-byte destination buffer
+ * @src: 64-byte source buffer
+ */
+static void ploytec_oracle_decode(u8 *dest, const u8 *src)
+{
+	memset(dest, 0, PLOYTEC_CAPTURE_PCM_FRAME_SIZE);
+
+	for (size_t e = 0; e < ARRAY_SIZE(ploytec_decode_map); e++) {
+		const struct ploytec_decode_map_entry *m = &ploytec_decode_map[e];
+
+		for (int i = 0; i < 8; i++)
+			dest[m->dst_idx] |=
+				((src[m->src_base + i] >> m->src_bit) & 1) << (7 - i);
+	}
+}
+
+/* xorshift64*, seeded per test; see the determinism note at the top of this file. */
+struct ploytec_test_rng {
+	u64 state;
+};
+
+static void ploytec_rng_init(struct ploytec_test_rng *rng, u64 seed)
+{
+	rng->state = seed ? seed : 1;
+}
+
+static u64 ploytec_rng_next(struct ploytec_test_rng *rng)
+{
+	u64 x = rng->state;
+
+	x ^= x >> 12;
+	x ^= x << 25;
+	x ^= x >> 27;
+	rng->state = x;
+
+	return x * 0x2545F4914F6CDD1DULL;
+}
+
+static void ploytec_rng_fill(struct ploytec_test_rng *rng, u8 *buf, size_t len)
+{
+	size_t off = 0;
+
+	while (off < len) {
+		u64 v = ploytec_rng_next(rng);
+
+		for (int i = 0; i < 8 && off < len; i++, off++)
+			buf[off] = (v >> (i * 8)) & 0xFF;
+	}
+}
+
+/* Is this wire byte one the capture decoder is allowed to read? */
+static bool ploytec_capture_byte_used(int idx)
+{
+	if (idx >= PLOYTEC_TEST_UNUSED0_START && idx < PLOYTEC_TEST_UNUSED0_END)
+		return false;
+	if (idx >= PLOYTEC_TEST_UNUSED1_START && idx < PLOYTEC_TEST_UNUSED1_END)
+		return false;
+
+	return true;
+}
+
+/* Count set bits in a buffer, recording the position of the last one seen. */
+static int ploytec_count_set_bits(const u8 *buf, size_t len, int *last_pos)
+{
+	int count = 0;
+
+	for (size_t i = 0; i < len; i++) {
+		for (int b = 0; b < 8; b++) {
+			if (buf[i] & (1 << b)) {
+				count++;
+				if (last_pos)
+					*last_pos = i * 8 + b;
+			}
+		}
+	}
+
+	return count;
+}
+
+/* --- Golden vectors from the independent Python model --------------------- */
+
+static void ploytec_encode_vector_desc(const struct ploytec_encode_vector *v,
+				       char *desc)
+{
+	strscpy(desc, v->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(ploytec_encode_vector, ploytec_encode_vectors,
+		  ploytec_encode_vector_desc);
+
+static void ploytec_decode_vector_desc(const struct ploytec_decode_vector *v,
+				       char *desc)
+{
+	strscpy(desc, v->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(ploytec_decode_vector, ploytec_decode_vectors,
+		  ploytec_decode_vector_desc);
+
+static void ploytec_test_encode_known_vectors(struct kunit *test)
+{
+	const struct ploytec_encode_vector *v = test->param_value;
+	u8 dest[PLOYTEC_PLAYBACK_FRAME_SIZE];
+
+	memset(dest, 0xFF, sizeof(dest));
+	ploytec_encode_batch(dest, v->src, 1);
+
+	KUNIT_EXPECT_MEMEQ_MSG(test, dest, v->expect, sizeof(dest),
+			       "encode of vector '%s' does not match the model",
+			       v->name);
+}
+
+static void ploytec_test_decode_known_vectors(struct kunit *test)
+{
+	const struct ploytec_decode_vector *v = test->param_value;
+	u8 dest[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+
+	memset(dest, 0xFF, sizeof(dest));
+	ploytec_decode_batch(dest, v->src, 1);
+
+	KUNIT_EXPECT_MEMEQ_MSG(test, dest, v->expect, sizeof(dest),
+			       "decode of vector '%s' does not match the model",
+			       v->name);
+}
+
+/* --- Agreement with the declarative bit map ------------------------------- */
+
+static void ploytec_test_encode_matches_oracle(struct kunit *test)
+{
+	u8 src[PLOYTEC_PLAYBACK_PCM_FRAME_SIZE];
+	u8 got[PLOYTEC_PLAYBACK_FRAME_SIZE];
+	u8 want[PLOYTEC_PLAYBACK_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+
+	ploytec_rng_init(&rng, 0x0123456789ABCDEFULL);
+
+	for (int t = 0; t < PLOYTEC_TEST_RANDOM_FRAMES; t++) {
+		ploytec_rng_fill(&rng, src, sizeof(src));
+
+		/* Prefill with noise so a short write is visible. */
+		memset(got, 0x5A, sizeof(got));
+		ploytec_encode_batch(got, src, 1);
+		ploytec_oracle_encode(want, src);
+
+		KUNIT_ASSERT_MEMEQ_MSG(test, got, want, sizeof(got),
+				       "encode disagrees with the bit map at iteration %d",
+				       t);
+	}
+}
+
+static void ploytec_test_decode_matches_oracle(struct kunit *test)
+{
+	u8 src[PLOYTEC_CAPTURE_FRAME_SIZE];
+	u8 got[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	u8 want[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+
+	ploytec_rng_init(&rng, 0x0123456789ABCDEFULL);
+
+	for (int t = 0; t < PLOYTEC_TEST_RANDOM_FRAMES; t++) {
+		ploytec_rng_fill(&rng, src, sizeof(src));
+
+		memset(got, 0x5A, sizeof(got));
+		ploytec_decode_batch(got, src, 1);
+		ploytec_oracle_decode(want, src);
+
+		KUNIT_ASSERT_MEMEQ_MSG(test, got, want, sizeof(got),
+				       "decode disagrees with the bit map at iteration %d",
+				       t);
+	}
+}
+
+/* --- The map is a complete, injective bit permutation --------------------- */
+
+/*
+ * Encode: feed a one-hot input for each of the 96 input bits. Each must land
+ * on exactly one output bit, at the position the map predicts, and no two
+ * inputs may collide. That determines the map's action on every basis vector.
+ */
+static void ploytec_test_encode_permutation_complete(struct kunit *test)
+{
+	u8 src[PLOYTEC_PLAYBACK_PCM_FRAME_SIZE];
+	u8 dest[PLOYTEC_PLAYBACK_FRAME_SIZE];
+	DECLARE_BITMAP(seen, PLOYTEC_PLAYBACK_FRAME_SIZE * 8);
+	int covered = 0;
+
+	bitmap_zero(seen, PLOYTEC_PLAYBACK_FRAME_SIZE * 8);
+
+	for (int byte = 0; byte < PLOYTEC_PLAYBACK_PCM_FRAME_SIZE; byte++) {
+		for (int bit = 0; bit < 8; bit++) {
+			int pos = -1, count, want_pos = -1;
+
+			memset(src, 0, sizeof(src));
+			src[byte] = 1 << bit;
+
+			memset(dest, 0, sizeof(dest));
+			ploytec_encode_batch(dest, src, 1);
+
+			count = ploytec_count_set_bits(dest, sizeof(dest), &pos);
+			KUNIT_ASSERT_EQ_MSG(test, count, 1,
+					    "src[%d] bit %d set %d output bits, expected 1",
+					    byte, bit, count);
+
+			/* Where the bit map says it should have landed. */
+			for (size_t e = 0; e < ARRAY_SIZE(ploytec_encode_map); e++) {
+				const struct ploytec_encode_map_entry *m =
+					&ploytec_encode_map[e];
+
+				if (m->src_idx == byte)
+					want_pos = (m->dst_base + (7 - bit)) * 8 +
+						   m->dst_bit;
+			}
+
+			KUNIT_ASSERT_EQ_MSG(test, pos, want_pos,
+					    "src[%d] bit %d landed at output bit %d, map says %d",
+					    byte, bit, pos, want_pos);
+			KUNIT_ASSERT_FALSE_MSG(test, test_bit(pos, seen),
+					       "output bit %d is written by two different input bits",
+					       pos);
+			__set_bit(pos, seen);
+			covered++;
+		}
+	}
+
+	KUNIT_EXPECT_EQ(test, covered, PLOYTEC_PLAYBACK_PCM_FRAME_SIZE * 8);
+}
+
+/*
+ * Decode: sweep all 512 input bits. The 144 meaningful ones must each land on
+ * a distinct output bit; every other input bit must be ignored entirely, which
+ * checks the unused byte ranges and unused bits in the same pass.
+ */
+static void ploytec_test_decode_permutation_complete(struct kunit *test)
+{
+	u8 src[PLOYTEC_CAPTURE_FRAME_SIZE];
+	u8 dest[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	DECLARE_BITMAP(seen, PLOYTEC_CAPTURE_PCM_FRAME_SIZE * 8);
+	int covered = 0;
+
+	bitmap_zero(seen, PLOYTEC_CAPTURE_PCM_FRAME_SIZE * 8);
+
+	for (int byte = 0; byte < PLOYTEC_CAPTURE_FRAME_SIZE; byte++) {
+		for (int bit = 0; bit < 8; bit++) {
+			bool meaningful = ploytec_capture_byte_used(byte) && bit < 3;
+			int pos = -1, count, want_pos = -1;
+
+			memset(src, 0, sizeof(src));
+			src[byte] = 1 << bit;
+
+			memset(dest, 0, sizeof(dest));
+			ploytec_decode_batch(dest, src, 1);
+
+			count = ploytec_count_set_bits(dest, sizeof(dest), &pos);
+
+			if (!meaningful) {
+				KUNIT_ASSERT_EQ_MSG(test, count, 0,
+						    "wire byte %#04x bit %d is unused but changed the output",
+						    byte, bit);
+				continue;
+			}
+
+			KUNIT_ASSERT_EQ_MSG(test, count, 1,
+					    "wire byte %#04x bit %d set %d output bits, expected 1",
+					    byte, bit, count);
+
+			for (size_t e = 0; e < ARRAY_SIZE(ploytec_decode_map); e++) {
+				const struct ploytec_decode_map_entry *m =
+					&ploytec_decode_map[e];
+
+				if (m->src_bit == bit && byte >= m->src_base &&
+				    byte < m->src_base + 8)
+					want_pos = m->dst_idx * 8 +
+						   (7 - (byte - m->src_base));
+			}
+
+			KUNIT_ASSERT_EQ_MSG(test, pos, want_pos,
+					    "wire byte %#04x bit %d landed at output bit %d, map says %d",
+					    byte, bit, pos, want_pos);
+			KUNIT_ASSERT_FALSE_MSG(test, test_bit(pos, seen),
+					       "output bit %d is written by two different wire bits",
+					       pos);
+			__set_bit(pos, seen);
+			covered++;
+		}
+	}
+
+	KUNIT_EXPECT_EQ(test, covered, PLOYTEC_CAPTURE_PCM_FRAME_SIZE * 8);
+}
+
+/* --- Linearity over GF(2) ------------------------------------------------- */
+
+static void ploytec_test_encode_is_linear(struct kunit *test)
+{
+	u8 a[PLOYTEC_PLAYBACK_PCM_FRAME_SIZE], b[PLOYTEC_PLAYBACK_PCM_FRAME_SIZE];
+	u8 ab[PLOYTEC_PLAYBACK_PCM_FRAME_SIZE];
+	u8 ea[PLOYTEC_PLAYBACK_FRAME_SIZE], eb[PLOYTEC_PLAYBACK_FRAME_SIZE];
+	u8 eab[PLOYTEC_PLAYBACK_FRAME_SIZE], want[PLOYTEC_PLAYBACK_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+
+	ploytec_rng_init(&rng, 0xFEEDFACECAFEBEEFULL);
+
+	for (int t = 0; t < PLOYTEC_TEST_LINEARITY_PAIRS; t++) {
+		ploytec_rng_fill(&rng, a, sizeof(a));
+		ploytec_rng_fill(&rng, b, sizeof(b));
+
+		for (size_t i = 0; i < sizeof(ab); i++)
+			ab[i] = a[i] ^ b[i];
+
+		ploytec_encode_batch(ea, a, 1);
+		ploytec_encode_batch(eb, b, 1);
+		ploytec_encode_batch(eab, ab, 1);
+
+		for (size_t i = 0; i < sizeof(want); i++)
+			want[i] = ea[i] ^ eb[i];
+
+		KUNIT_ASSERT_MEMEQ_MSG(test, eab, want, sizeof(want),
+				       "encode(a^b) != encode(a)^encode(b) at iteration %d",
+				       t);
+	}
+}
+
+static void ploytec_test_decode_is_linear(struct kunit *test)
+{
+	u8 a[PLOYTEC_CAPTURE_FRAME_SIZE], b[PLOYTEC_CAPTURE_FRAME_SIZE];
+	u8 ab[PLOYTEC_CAPTURE_FRAME_SIZE];
+	u8 da[PLOYTEC_CAPTURE_PCM_FRAME_SIZE], db[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	u8 dab[PLOYTEC_CAPTURE_PCM_FRAME_SIZE], want[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+
+	ploytec_rng_init(&rng, 0xFEEDFACECAFEBEEFULL);
+
+	for (int t = 0; t < PLOYTEC_TEST_LINEARITY_PAIRS; t++) {
+		ploytec_rng_fill(&rng, a, sizeof(a));
+		ploytec_rng_fill(&rng, b, sizeof(b));
+
+		for (size_t i = 0; i < sizeof(ab); i++)
+			ab[i] = a[i] ^ b[i];
+
+		ploytec_decode_batch(da, a, 1);
+		ploytec_decode_batch(db, b, 1);
+		ploytec_decode_batch(dab, ab, 1);
+
+		for (size_t i = 0; i < sizeof(want); i++)
+			want[i] = da[i] ^ db[i];
+
+		KUNIT_ASSERT_MEMEQ_MSG(test, dab, want, sizeof(want),
+				       "decode(a^b) != decode(a)^decode(b) at iteration %d",
+				       t);
+	}
+}
+
+/* --- Batching ------------------------------------------------------------- */
+
+static void ploytec_test_encode_batch_equals_single(struct kunit *test)
+{
+	u8 src[PLOYTEC_TEST_MAX_ENCODE_FRAMES * PLOYTEC_PLAYBACK_PCM_FRAME_SIZE];
+	u8 batched[PLOYTEC_TEST_MAX_ENCODE_FRAMES * PLOYTEC_PLAYBACK_FRAME_SIZE];
+	u8 single[PLOYTEC_TEST_MAX_ENCODE_FRAMES * PLOYTEC_PLAYBACK_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+
+	ploytec_rng_init(&rng, 0xD1CE0FF1CE0FF1CEULL);
+	ploytec_rng_fill(&rng, src, sizeof(src));
+
+	for (int n = 1; n <= PLOYTEC_TEST_MAX_ENCODE_FRAMES; n++) {
+		memset(batched, 0, sizeof(batched));
+		memset(single, 0, sizeof(single));
+
+		ploytec_encode_batch(batched, src, n);
+
+		for (int f = 0; f < n; f++)
+			ploytec_encode_batch(single + f * PLOYTEC_PLAYBACK_FRAME_SIZE,
+					     src + f * PLOYTEC_PLAYBACK_PCM_FRAME_SIZE,
+					     1);
+
+		KUNIT_EXPECT_MEMEQ_MSG(test, batched, single,
+				       n * PLOYTEC_PLAYBACK_FRAME_SIZE,
+				       "batch of %d differs from %d single-frame calls",
+				       n, n);
+	}
+}
+
+static void ploytec_test_decode_batch_equals_single(struct kunit *test)
+{
+	u8 src[PLOYTEC_TEST_MAX_DECODE_FRAMES * PLOYTEC_CAPTURE_FRAME_SIZE];
+	u8 batched[PLOYTEC_TEST_MAX_DECODE_FRAMES * PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	u8 single[PLOYTEC_TEST_MAX_DECODE_FRAMES * PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+
+	ploytec_rng_init(&rng, 0xD1CE0FF1CE0FF1CEULL);
+	ploytec_rng_fill(&rng, src, sizeof(src));
+
+	for (int n = 1; n <= PLOYTEC_TEST_MAX_DECODE_FRAMES; n++) {
+		memset(batched, 0, sizeof(batched));
+		memset(single, 0, sizeof(single));
+
+		ploytec_decode_batch(batched, src, n);
+
+		for (int f = 0; f < n; f++)
+			ploytec_decode_batch(single + f * PLOYTEC_CAPTURE_PCM_FRAME_SIZE,
+					     src + f * PLOYTEC_CAPTURE_FRAME_SIZE,
+					     1);
+
+		KUNIT_EXPECT_MEMEQ_MSG(test, batched, single,
+				       n * PLOYTEC_CAPTURE_PCM_FRAME_SIZE,
+				       "batch of %d differs from %d single-frame calls",
+				       n, n);
+	}
+}
+
+/*
+ * jockey3.c computes the batch size from the ALSA ring-buffer wrap and can in
+ * principle arrive at zero, so the codec must treat that as a no-op rather
+ * than walking off the buffer.
+ */
+static void ploytec_test_encode_batch_zero_frames(struct kunit *test)
+{
+	u8 src[PLOYTEC_PLAYBACK_PCM_FRAME_SIZE] = { 0 };
+	u8 dest[PLOYTEC_PLAYBACK_FRAME_SIZE];
+
+	memset(dest, PLOYTEC_TEST_GUARD_BYTE, sizeof(dest));
+	ploytec_encode_batch(dest, src, 0);
+
+	for (size_t i = 0; i < sizeof(dest); i++)
+		KUNIT_EXPECT_EQ_MSG(test, dest[i], PLOYTEC_TEST_GUARD_BYTE,
+				    "encode of 0 frames wrote to dest[%zu]", i);
+}
+
+static void ploytec_test_decode_batch_zero_frames(struct kunit *test)
+{
+	u8 src[PLOYTEC_CAPTURE_FRAME_SIZE] = { 0 };
+	u8 dest[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+
+	memset(dest, PLOYTEC_TEST_GUARD_BYTE, sizeof(dest));
+	ploytec_decode_batch(dest, src, 0);
+
+	for (size_t i = 0; i < sizeof(dest); i++)
+		KUNIT_EXPECT_EQ_MSG(test, dest[i], PLOYTEC_TEST_GUARD_BYTE,
+				    "decode of 0 frames wrote to dest[%zu]", i);
+}
+
+static void ploytec_test_encode_batch_no_overrun(struct kunit *test)
+{
+	const size_t payload = PLOYTEC_TEST_MAX_ENCODE_FRAMES *
+			       PLOYTEC_PLAYBACK_FRAME_SIZE;
+	u8 src[PLOYTEC_TEST_MAX_ENCODE_FRAMES * PLOYTEC_PLAYBACK_PCM_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+	u8 *buf;
+
+	buf = kunit_kzalloc(test, payload + 2 * PLOYTEC_TEST_GUARD, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	ploytec_rng_init(&rng, 0xBEEFCAFEBEEFCAFEULL);
+	ploytec_rng_fill(&rng, src, sizeof(src));
+
+	memset(buf, PLOYTEC_TEST_GUARD_BYTE, payload + 2 * PLOYTEC_TEST_GUARD);
+	ploytec_encode_batch(buf + PLOYTEC_TEST_GUARD, src,
+			     PLOYTEC_TEST_MAX_ENCODE_FRAMES);
+
+	for (int i = 0; i < PLOYTEC_TEST_GUARD; i++) {
+		KUNIT_EXPECT_EQ_MSG(test, buf[i], PLOYTEC_TEST_GUARD_BYTE,
+				    "encode wrote %d bytes before the destination",
+				    PLOYTEC_TEST_GUARD - i);
+		KUNIT_EXPECT_EQ_MSG(test, buf[PLOYTEC_TEST_GUARD + payload + i],
+				    PLOYTEC_TEST_GUARD_BYTE,
+				    "encode wrote %d bytes past the destination",
+				    i + 1);
+	}
+}
+
+static void ploytec_test_decode_batch_no_overrun(struct kunit *test)
+{
+	const size_t payload = PLOYTEC_TEST_MAX_DECODE_FRAMES *
+			       PLOYTEC_CAPTURE_PCM_FRAME_SIZE;
+	u8 src[PLOYTEC_TEST_MAX_DECODE_FRAMES * PLOYTEC_CAPTURE_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+	u8 *buf;
+
+	buf = kunit_kzalloc(test, payload + 2 * PLOYTEC_TEST_GUARD, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	ploytec_rng_init(&rng, 0xBEEFCAFEBEEFCAFEULL);
+	ploytec_rng_fill(&rng, src, sizeof(src));
+
+	memset(buf, PLOYTEC_TEST_GUARD_BYTE, payload + 2 * PLOYTEC_TEST_GUARD);
+	ploytec_decode_batch(buf + PLOYTEC_TEST_GUARD, src,
+			     PLOYTEC_TEST_MAX_DECODE_FRAMES);
+
+	for (int i = 0; i < PLOYTEC_TEST_GUARD; i++) {
+		KUNIT_EXPECT_EQ_MSG(test, buf[i], PLOYTEC_TEST_GUARD_BYTE,
+				    "decode wrote %d bytes before the destination",
+				    PLOYTEC_TEST_GUARD - i);
+		KUNIT_EXPECT_EQ_MSG(test, buf[PLOYTEC_TEST_GUARD + payload + i],
+				    PLOYTEC_TEST_GUARD_BYTE,
+				    "decode wrote %d bytes past the destination",
+				    i + 1);
+	}
+}
+
+/* --- Alignment ------------------------------------------------------------ */
+
+/*
+ * The optimized codecs reach for 32- and 64-bit words through the unaligned
+ * accessors. In the driver the wire buffer happens to be 8-byte aligned, so a
+ * misuse of those accessors would go unnoticed on x86 and only surface as a
+ * fault on a strict-alignment architecture. Run every byte offset explicitly.
+ */
+static void ploytec_test_encode_unaligned_buffers(struct kunit *test)
+{
+	u8 reference[PLOYTEC_PLAYBACK_FRAME_SIZE];
+	u8 src[PLOYTEC_PLAYBACK_PCM_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+	u8 *src_buf, *dst_buf;
+
+	src_buf = kunit_kzalloc(test, PLOYTEC_PLAYBACK_PCM_FRAME_SIZE + 8, GFP_KERNEL);
+	dst_buf = kunit_kzalloc(test, PLOYTEC_PLAYBACK_FRAME_SIZE + 8, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, src_buf);
+	KUNIT_ASSERT_NOT_NULL(test, dst_buf);
+
+	ploytec_rng_init(&rng, 0x1234ABCD5678EF90ULL);
+	ploytec_rng_fill(&rng, src, sizeof(src));
+	ploytec_oracle_encode(reference, src);
+
+	for (int src_off = 0; src_off < 8; src_off++) {
+		for (int dst_off = 0; dst_off < 8; dst_off++) {
+			memcpy(src_buf + src_off, src, sizeof(src));
+			memset(dst_buf, 0, PLOYTEC_PLAYBACK_FRAME_SIZE + 8);
+
+			ploytec_encode_batch(dst_buf + dst_off, src_buf + src_off, 1);
+
+			KUNIT_ASSERT_MEMEQ_MSG(test, dst_buf + dst_off, reference,
+					       PLOYTEC_PLAYBACK_FRAME_SIZE,
+					       "encode differs at src offset %d, dst offset %d",
+					       src_off, dst_off);
+		}
+	}
+}
+
+static void ploytec_test_decode_unaligned_buffers(struct kunit *test)
+{
+	u8 reference[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	u8 src[PLOYTEC_CAPTURE_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+	u8 *src_buf, *dst_buf;
+
+	src_buf = kunit_kzalloc(test, PLOYTEC_CAPTURE_FRAME_SIZE + 8, GFP_KERNEL);
+	dst_buf = kunit_kzalloc(test, PLOYTEC_CAPTURE_PCM_FRAME_SIZE + 8, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, src_buf);
+	KUNIT_ASSERT_NOT_NULL(test, dst_buf);
+
+	ploytec_rng_init(&rng, 0x1234ABCD5678EF90ULL);
+	ploytec_rng_fill(&rng, src, sizeof(src));
+	ploytec_oracle_decode(reference, src);
+
+	for (int src_off = 0; src_off < 8; src_off++) {
+		for (int dst_off = 0; dst_off < 8; dst_off++) {
+			memcpy(src_buf + src_off, src, sizeof(src));
+			memset(dst_buf, 0, PLOYTEC_CAPTURE_PCM_FRAME_SIZE + 8);
+
+			ploytec_decode_batch(dst_buf + dst_off, src_buf + src_off, 1);
+
+			KUNIT_ASSERT_MEMEQ_MSG(test, dst_buf + dst_off, reference,
+					       PLOYTEC_CAPTURE_PCM_FRAME_SIZE,
+					       "decode differs at src offset %d, dst offset %d",
+					       src_off, dst_off);
+		}
+	}
+}
+
+/* --- Format invariants ---------------------------------------------------- */
+
+static void ploytec_test_encode_zero_input(struct kunit *test)
+{
+	u8 src[PLOYTEC_PLAYBACK_PCM_FRAME_SIZE] = { 0 };
+	u8 dest[PLOYTEC_PLAYBACK_FRAME_SIZE];
+	u8 want[PLOYTEC_PLAYBACK_FRAME_SIZE] = { 0 };
+
+	memset(dest, 0xFF, sizeof(dest));
+	ploytec_encode_batch(dest, src, 1);
+
+	KUNIT_EXPECT_MEMEQ_MSG(test, dest, want, sizeof(dest),
+			       "silence did not encode to an all-zero wire frame");
+}
+
+/*
+ * Playback packs only two channels into each wire byte, so bits 2..7 carry
+ * nothing. jockey3.c relies on this: it writes the MIDI and sync bytes into
+ * the same 512-byte packet and would be corrupted by a codec that spilled
+ * into the upper bits.
+ */
+static void ploytec_test_encode_reserved_bits_clear(struct kunit *test)
+{
+	u8 src[PLOYTEC_PLAYBACK_PCM_FRAME_SIZE];
+	u8 dest[PLOYTEC_PLAYBACK_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+
+	ploytec_rng_init(&rng, 0x0F0F0F0FF0F0F0F0ULL);
+
+	/* All ones is the worst case, then sample the space. */
+	memset(src, 0xFF, sizeof(src));
+
+	for (int t = 0; t < 256; t++) {
+		memset(dest, 0, sizeof(dest));
+		ploytec_encode_batch(dest, src, 1);
+
+		for (size_t i = 0; i < sizeof(dest); i++)
+			KUNIT_ASSERT_EQ_MSG(test, dest[i] & 0xFC, 0,
+					    "wire byte %zu has reserved bits set (%#04x)",
+					    i, dest[i]);
+
+		ploytec_rng_fill(&rng, src, sizeof(src));
+	}
+}
+
+static void ploytec_test_decode_ignores_unused_bytes(struct kunit *test)
+{
+	u8 src[PLOYTEC_CAPTURE_FRAME_SIZE];
+	u8 probe[PLOYTEC_CAPTURE_FRAME_SIZE];
+	u8 want[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	u8 got[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+
+	ploytec_rng_init(&rng, 0xABCDEF0123456789ULL);
+	ploytec_rng_fill(&rng, src, sizeof(src));
+	ploytec_decode_batch(want, src, 1);
+
+	for (int t = 0; t < 256; t++) {
+		memcpy(probe, src, sizeof(probe));
+
+		/* Scribble over everything the decoder should not be reading. */
+		for (size_t i = 0; i < sizeof(probe); i++) {
+			if (!ploytec_capture_byte_used(i))
+				probe[i] = ploytec_rng_next(&rng) & 0xFF;
+		}
+
+		ploytec_decode_batch(got, probe, 1);
+		KUNIT_ASSERT_MEMEQ_MSG(test, got, want, sizeof(want),
+				       "decode result changed when unused wire bytes changed");
+	}
+}
+
+static void ploytec_test_decode_ignores_unused_bits(struct kunit *test)
+{
+	u8 src[PLOYTEC_CAPTURE_FRAME_SIZE];
+	u8 probe[PLOYTEC_CAPTURE_FRAME_SIZE];
+	u8 want[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	u8 got[PLOYTEC_CAPTURE_PCM_FRAME_SIZE];
+	struct ploytec_test_rng rng;
+
+	ploytec_rng_init(&rng, 0x9988776655443322ULL);
+	ploytec_rng_fill(&rng, src, sizeof(src));
+	ploytec_decode_batch(want, src, 1);
+
+	for (int t = 0; t < 256; t++) {
+		/* Only bits 0..2 of each wire byte carry channel data. */
+		for (size_t i = 0; i < sizeof(probe); i++)
+			probe[i] = (src[i] & 0x07) |
+				   (ploytec_rng_next(&rng) & 0xF8);
+
+		ploytec_decode_batch(got, probe, 1);
+		KUNIT_ASSERT_MEMEQ_MSG(test, got, want, sizeof(want),
+				       "decode result changed when unused wire bits changed");
+	}
+}
+
+/* --- Build wiring --------------------------------------------------------- */
+
+/*
+ * The three implementations are chosen by a preprocessor chain, and getting
+ * that chain wrong silently selects the wrong codec. That is not theoretical:
+ * the out-of-tree user-space harness built the 32-bit variant on x86_64 for
+ * months because CONFIG_64BIT was not defined in its build.
+ */
+static void ploytec_test_codec_variant_matches_build(struct kunit *test)
+{
+	enum ploytec_codec_variant variant = ploytec_initialize_codec();
+
+	if (IS_ENABLED(CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC))
+		KUNIT_EXPECT_EQ_MSG(test, variant, PLOYTEC_CODEC_PORTABLE,
+				    "REFERENCE_CODEC is set but the portable codec was not selected");
+	else if (IS_ENABLED(CONFIG_64BIT))
+		KUNIT_EXPECT_EQ_MSG(test, variant, PLOYTEC_CODEC_OPTIMIZED_64BIT,
+				    "64-bit build did not select the 64-bit codec");
+	else
+		KUNIT_EXPECT_EQ_MSG(test, variant, PLOYTEC_CODEC_OPTIMIZED_32BIT,
+				    "32-bit build did not select the 32-bit codec");
+}
+
+/* --- Suite ---------------------------------------------------------------- */
+
+static int ploytec_codec_suite_init(struct kunit_suite *suite)
+{
+	/* Builds the bit-spread lookup tables the optimized codecs need. */
+	ploytec_initialize_codec();
+
+	return 0;
+}
+
+static struct kunit_case ploytec_codec_test_cases[] = {
+	KUNIT_CASE_PARAM(ploytec_test_encode_known_vectors,
+			 ploytec_encode_vector_gen_params),
+	KUNIT_CASE_PARAM(ploytec_test_decode_known_vectors,
+			 ploytec_decode_vector_gen_params),
+	KUNIT_CASE(ploytec_test_encode_matches_oracle),
+	KUNIT_CASE(ploytec_test_decode_matches_oracle),
+	KUNIT_CASE(ploytec_test_encode_permutation_complete),
+	KUNIT_CASE(ploytec_test_decode_permutation_complete),
+	KUNIT_CASE(ploytec_test_encode_is_linear),
+	KUNIT_CASE(ploytec_test_decode_is_linear),
+	KUNIT_CASE(ploytec_test_encode_batch_equals_single),
+	KUNIT_CASE(ploytec_test_decode_batch_equals_single),
+	KUNIT_CASE(ploytec_test_encode_batch_zero_frames),
+	KUNIT_CASE(ploytec_test_decode_batch_zero_frames),
+	KUNIT_CASE(ploytec_test_encode_batch_no_overrun),
+	KUNIT_CASE(ploytec_test_decode_batch_no_overrun),
+	KUNIT_CASE(ploytec_test_encode_unaligned_buffers),
+	KUNIT_CASE(ploytec_test_decode_unaligned_buffers),
+	KUNIT_CASE(ploytec_test_encode_zero_input),
+	KUNIT_CASE(ploytec_test_encode_reserved_bits_clear),
+	KUNIT_CASE(ploytec_test_decode_ignores_unused_bytes),
+	KUNIT_CASE(ploytec_test_decode_ignores_unused_bits),
+	KUNIT_CASE(ploytec_test_codec_variant_matches_build),
+	{},
+};
+
+static struct kunit_suite ploytec_codec_suite = {
+	.name = "ploytec-codec",
+	.suite_init = ploytec_codec_suite_init,
+	.test_cases = ploytec_codec_test_cases,
+};
+
+kunit_test_suite(ploytec_codec_suite);
diff --git a/sound/usb/jockey3/ploytec_codec_test_vectors.h b/sound/usb/jockey3/ploytec_codec_test_vectors.h
new file mode 100644
index 0000000000000..894d5f830d7f2
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_codec_test_vectors.h
@@ -0,0 +1,793 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Golden test vectors for the Ploytec bit-plane codec.
+ *
+ * GENERATED FILE - DO NOT EDIT.
+ *
+ * Produced by genvectors.py from ploytec_model.py, an independent model
+ * that derives the wire format structurally rather than from this driver's
+ * code, so the two cannot agree on a wrong answer. The same vectors drive a
+ * user-space bench, which is why they live in a header of their own.
+ *
+ * Both generator and model belong to the driver's test tooling and are not
+ * part of the kernel tree. They live under tests/codec at
+ * https://github.com/fvdpol/alsa-jockey3, where ./genvectors.py regenerates
+ * this file.
+ *
+ * ploytec_model.py sha256: 09fdf2831f9de572ee3a0e06b20807ee6235fc67ac79481469d616e965e8f0f3
+ *
+ * Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#ifndef PLOYTEC_CODEC_TEST_VECTORS_H
+#define PLOYTEC_CODEC_TEST_VECTORS_H
+
+struct ploytec_encode_vector {
+	const char *name;
+	u8 src[12];
+	u8 expect[48];
+};
+
+struct ploytec_decode_vector {
+	const char *name;
+	u8 src[64];
+	u8 expect[18];
+};
+
+static const struct ploytec_encode_vector ploytec_encode_vectors[] = {
+	{
+		.name = "zeros",
+		.src = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "ones",
+		.src = {
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+		},
+		.expect = {
+			0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03,
+			0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03,
+			0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03,
+			0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03,
+		},
+	},
+	{
+		.name = "alternating_55",
+		.src = {
+			0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55,
+		},
+		.expect = {
+			0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03,
+			0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03,
+			0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03,
+			0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03,
+		},
+	},
+	{
+		.name = "alternating_aa",
+		.src = {
+			0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
+		},
+		.expect = {
+			0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00,
+			0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00,
+			0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00,
+			0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00,
+		},
+	},
+	{
+		.name = "ramp",
+		.src = {
+			0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x02, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00,
+			0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x03,
+		},
+	},
+	{
+		.name = "channel0_full",
+		.src = {
+			0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+		.expect = {
+			0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+			0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "channel1_full",
+		.src = {
+			0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+			0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+		},
+	},
+	{
+		.name = "channel2_full",
+		.src = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00,
+		},
+		.expect = {
+			0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
+			0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "channel3_full",
+		.src = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
+			0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
+		},
+	},
+	{
+		.name = "channel0_sign",
+		.src = {
+			0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+		.expect = {
+			0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "channel1_sign",
+		.src = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "channel2_sign",
+		.src = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00,
+		},
+		.expect = {
+			0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "channel3_sign",
+		.src = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "distinct",
+		.src = {
+			0x56, 0x34, 0x12, 0xbc, 0x9a, 0x78, 0x12, 0xf0, 0xde, 0x78, 0x56, 0x34,
+		},
+		.expect = {
+			0x02, 0x02, 0x00, 0x03, 0x02, 0x02, 0x03, 0x00, 0x02, 0x02, 0x03, 0x03,
+			0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x03, 0x00,
+			0x00, 0x01, 0x03, 0x03, 0x01, 0x02, 0x00, 0x00, 0x01, 0x02, 0x00, 0x03,
+			0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03, 0x03, 0x03, 0x01, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "random00",
+		.src = {
+			0xc5, 0x21, 0x5c, 0x0d, 0x13, 0xea, 0x2d, 0xa6, 0x6b, 0x90, 0x77, 0x77,
+		},
+		.expect = {
+			0x00, 0x03, 0x02, 0x01, 0x03, 0x01, 0x02, 0x02, 0x02, 0x00, 0x03, 0x00,
+			0x00, 0x02, 0x02, 0x01, 0x01, 0x01, 0x02, 0x00, 0x02, 0x03, 0x00, 0x03,
+			0x01, 0x03, 0x03, 0x02, 0x01, 0x02, 0x03, 0x02, 0x00, 0x02, 0x02, 0x03,
+			0x00, 0x02, 0x03, 0x03, 0x02, 0x00, 0x00, 0x02, 0x01, 0x01, 0x00, 0x01,
+		},
+	},
+	{
+		.name = "random01",
+		.src = {
+			0xd2, 0x2b, 0xc8, 0xf8, 0x5d, 0x0f, 0xc4, 0x8b, 0xf0, 0x91, 0xa2, 0x96,
+		},
+		.expect = {
+			0x03, 0x03, 0x02, 0x02, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00,
+			0x03, 0x00, 0x03, 0x03, 0x03, 0x03, 0x00, 0x01, 0x00, 0x02, 0x01, 0x00,
+			0x02, 0x00, 0x00, 0x02, 0x01, 0x03, 0x03, 0x01, 0x02, 0x01, 0x02, 0x01,
+			0x01, 0x01, 0x02, 0x01, 0x03, 0x01, 0x01, 0x03, 0x01, 0x00, 0x00, 0x02,
+		},
+	},
+	{
+		.name = "random02",
+		.src = {
+			0xc2, 0xc6, 0xd5, 0xf1, 0xf7, 0x91, 0xbb, 0xd9, 0xdb, 0x54, 0x93, 0x29,
+		},
+		.expect = {
+			0x03, 0x03, 0x00, 0x03, 0x02, 0x01, 0x02, 0x03, 0x03, 0x03, 0x00, 0x02,
+			0x02, 0x01, 0x01, 0x02, 0x03, 0x01, 0x02, 0x02, 0x02, 0x00, 0x03, 0x02,
+			0x01, 0x00, 0x02, 0x01, 0x02, 0x00, 0x00, 0x03, 0x03, 0x01, 0x01, 0x03,
+			0x00, 0x01, 0x03, 0x03, 0x01, 0x03, 0x01, 0x03, 0x00, 0x02, 0x00, 0x01,
+		},
+	},
+	{
+		.name = "random03",
+		.src = {
+			0x4f, 0xb4, 0xf2, 0x70, 0x17, 0x6f, 0xe3, 0x64, 0xc0, 0xcd, 0x51, 0xa4,
+		},
+		.expect = {
+			0x03, 0x03, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x02, 0x03, 0x01,
+			0x00, 0x03, 0x00, 0x00, 0x02, 0x03, 0x02, 0x00, 0x01, 0x01, 0x03, 0x03,
+			0x02, 0x01, 0x03, 0x00, 0x01, 0x03, 0x01, 0x01, 0x00, 0x02, 0x00, 0x03,
+			0x00, 0x01, 0x01, 0x03, 0x02, 0x03, 0x01, 0x01, 0x02, 0x02, 0x00, 0x02,
+		},
+	},
+	{
+		.name = "random04",
+		.src = {
+			0x5d, 0xf8, 0xb4, 0xe8, 0x5a, 0x5b, 0xe5, 0x10, 0x69, 0xd0, 0x02, 0xa9,
+		},
+		.expect = {
+			0x01, 0x02, 0x03, 0x01, 0x02, 0x01, 0x00, 0x02, 0x01, 0x01, 0x01, 0x03,
+			0x01, 0x00, 0x00, 0x00, 0x02, 0x03, 0x02, 0x01, 0x01, 0x03, 0x00, 0x03,
+			0x02, 0x01, 0x02, 0x01, 0x03, 0x00, 0x01, 0x03, 0x00, 0x01, 0x00, 0x01,
+			0x01, 0x00, 0x03, 0x00, 0x03, 0x03, 0x01, 0x02, 0x01, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "random05",
+		.src = {
+			0x67, 0x49, 0x0c, 0x85, 0xfd, 0x37, 0xc7, 0xf9, 0xd8, 0xcb, 0x7d, 0x90,
+		},
+		.expect = {
+			0x02, 0x02, 0x00, 0x02, 0x03, 0x01, 0x00, 0x00, 0x02, 0x03, 0x02, 0x02,
+			0x03, 0x00, 0x00, 0x03, 0x02, 0x03, 0x01, 0x00, 0x00, 0x03, 0x03, 0x03,
+			0x02, 0x00, 0x01, 0x03, 0x00, 0x01, 0x01, 0x01, 0x01, 0x03, 0x03, 0x03,
+			0x03, 0x03, 0x00, 0x03, 0x03, 0x02, 0x00, 0x00, 0x02, 0x01, 0x02, 0x03,
+		},
+	},
+	{
+		.name = "random06",
+		.src = {
+			0x49, 0x2c, 0x4f, 0x41, 0x86, 0x56, 0xf0, 0x2f, 0xa1, 0x33, 0x30, 0xb9,
+		},
+		.expect = {
+			0x02, 0x01, 0x02, 0x00, 0x01, 0x01, 0x01, 0x03, 0x00, 0x00, 0x03, 0x00,
+			0x03, 0x03, 0x02, 0x02, 0x02, 0x03, 0x02, 0x02, 0x01, 0x00, 0x00, 0x01,
+			0x02, 0x01, 0x02, 0x03, 0x02, 0x01, 0x01, 0x02, 0x01, 0x00, 0x02, 0x02,
+			0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x02, 0x00, 0x00, 0x02, 0x03,
+		},
+	},
+	{
+		.name = "random07",
+		.src = {
+			0x4e, 0x19, 0xe5, 0x1a, 0xcd, 0x69, 0xf2, 0x66, 0x4c, 0xe6, 0x5c, 0x61,
+		},
+		.expect = {
+			0x01, 0x03, 0x01, 0x00, 0x02, 0x03, 0x00, 0x01, 0x00, 0x02, 0x02, 0x01,
+			0x01, 0x02, 0x02, 0x01, 0x02, 0x03, 0x02, 0x02, 0x01, 0x01, 0x03, 0x00,
+			0x00, 0x03, 0x03, 0x00, 0x01, 0x00, 0x00, 0x03, 0x01, 0x03, 0x00, 0x02,
+			0x03, 0x03, 0x00, 0x01, 0x02, 0x02, 0x02, 0x01, 0x01, 0x02, 0x03, 0x00,
+		},
+	},
+	{
+		.name = "random08",
+		.src = {
+			0x22, 0x2a, 0xe7, 0xf8, 0xfb, 0x9c, 0x1e, 0xb4, 0x2a, 0x71, 0xcd, 0x54,
+		},
+		.expect = {
+			0x01, 0x01, 0x03, 0x00, 0x02, 0x01, 0x03, 0x01, 0x02, 0x00, 0x03, 0x02,
+			0x01, 0x02, 0x01, 0x00, 0x00, 0x00, 0x01, 0x02, 0x02, 0x02, 0x03, 0x00,
+			0x01, 0x02, 0x00, 0x03, 0x01, 0x03, 0x00, 0x00, 0x03, 0x03, 0x01, 0x01,
+			0x03, 0x02, 0x01, 0x03, 0x01, 0x03, 0x03, 0x03, 0x01, 0x00, 0x00, 0x02,
+		},
+	},
+	{
+		.name = "random09",
+		.src = {
+			0x1d, 0xf3, 0x3e, 0x4c, 0x48, 0x1a, 0xc5, 0x59, 0x5a, 0xfc, 0xf5, 0x5a,
+		},
+		.expect = {
+			0x00, 0x02, 0x01, 0x03, 0x03, 0x01, 0x03, 0x00, 0x01, 0x03, 0x01, 0x03,
+			0x02, 0x00, 0x01, 0x03, 0x02, 0x02, 0x00, 0x01, 0x01, 0x03, 0x00, 0x03,
+			0x00, 0x02, 0x00, 0x03, 0x03, 0x00, 0x03, 0x00, 0x02, 0x03, 0x02, 0x02,
+			0x01, 0x02, 0x00, 0x02, 0x02, 0x03, 0x02, 0x02, 0x03, 0x03, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "random10",
+		.src = {
+			0x92, 0x19, 0xf2, 0x2e, 0xb9, 0xb6, 0xf6, 0x71, 0xa3, 0x48, 0xd9, 0x10,
+		},
+		.expect = {
+			0x03, 0x01, 0x03, 0x01, 0x00, 0x00, 0x03, 0x02, 0x00, 0x02, 0x02, 0x03,
+			0x01, 0x00, 0x00, 0x03, 0x03, 0x02, 0x02, 0x03, 0x00, 0x02, 0x03, 0x00,
+			0x01, 0x00, 0x01, 0x03, 0x00, 0x01, 0x01, 0x00, 0x03, 0x02, 0x01, 0x03,
+			0x03, 0x00, 0x00, 0x03, 0x00, 0x02, 0x01, 0x00, 0x03, 0x01, 0x01, 0x00,
+		},
+	},
+	{
+		.name = "random11",
+		.src = {
+			0x84, 0xea, 0x64, 0x8c, 0xce, 0x29, 0xff, 0x18, 0xb5, 0xaa, 0xd9, 0xc2,
+		},
+		.expect = {
+			0x02, 0x01, 0x03, 0x02, 0x00, 0x03, 0x00, 0x02, 0x01, 0x01, 0x01, 0x02,
+			0x03, 0x00, 0x01, 0x00, 0x03, 0x02, 0x02, 0x02, 0x02, 0x03, 0x02, 0x02,
+			0x02, 0x02, 0x01, 0x00, 0x01, 0x00, 0x02, 0x01, 0x03, 0x03, 0x00, 0x02,
+			0x03, 0x01, 0x01, 0x02, 0x03, 0x00, 0x02, 0x00, 0x03, 0x01, 0x02, 0x00,
+		},
+	},
+	{
+		.name = "random12",
+		.src = {
+			0xcd, 0x3f, 0x4e, 0x27, 0xbb, 0x31, 0x06, 0x7a, 0xba, 0x97, 0xd3, 0xd4,
+		},
+		.expect = {
+			0x02, 0x01, 0x02, 0x02, 0x03, 0x01, 0x03, 0x00, 0x00, 0x02, 0x03, 0x03,
+			0x03, 0x01, 0x03, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x03, 0x02, 0x01,
+			0x02, 0x02, 0x01, 0x03, 0x00, 0x02, 0x00, 0x01, 0x03, 0x02, 0x01, 0x03,
+			0x01, 0x00, 0x03, 0x03, 0x02, 0x00, 0x01, 0x02, 0x00, 0x03, 0x03, 0x03,
+		},
+	},
+	{
+		.name = "random13",
+		.src = {
+			0x3b, 0x64, 0x49, 0xd4, 0x40, 0x3f, 0xab, 0xf0, 0x0f, 0x87, 0x9a, 0xde,
+		},
+		.expect = {
+			0x00, 0x01, 0x00, 0x00, 0x03, 0x02, 0x02, 0x03, 0x02, 0x03, 0x03, 0x02,
+			0x00, 0x01, 0x00, 0x00, 0x02, 0x00, 0x03, 0x01, 0x03, 0x00, 0x03, 0x03,
+			0x02, 0x02, 0x01, 0x03, 0x03, 0x03, 0x03, 0x01, 0x02, 0x01, 0x00, 0x02,
+			0x02, 0x00, 0x02, 0x00, 0x03, 0x01, 0x00, 0x01, 0x00, 0x03, 0x02, 0x02,
+		},
+	},
+	{
+		.name = "random14",
+		.src = {
+			0x03, 0x13, 0x49, 0x5c, 0x3b, 0xc2, 0x1f, 0xb2, 0x71, 0x9a, 0x11, 0x17,
+		},
+		.expect = {
+			0x00, 0x03, 0x02, 0x02, 0x01, 0x00, 0x00, 0x03, 0x02, 0x00, 0x02, 0x03,
+			0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x00, 0x02, 0x02, 0x02, 0x03, 0x03,
+			0x01, 0x01, 0x00, 0x02, 0x00, 0x02, 0x03, 0x02, 0x00, 0x00, 0x01, 0x03,
+			0x01, 0x00, 0x01, 0x03, 0x02, 0x01, 0x00, 0x03, 0x03, 0x01, 0x02, 0x00,
+		},
+	},
+	{
+		.name = "random15",
+		.src = {
+			0x53, 0x46, 0x16, 0xdb, 0xce, 0x68, 0x55, 0x35, 0x6d, 0x11, 0xe3, 0x4a,
+		},
+		.expect = {
+			0x00, 0x02, 0x02, 0x01, 0x02, 0x03, 0x01, 0x02, 0x00, 0x01, 0x02, 0x02,
+			0x00, 0x03, 0x01, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x02, 0x01, 0x03,
+			0x00, 0x03, 0x01, 0x00, 0x03, 0x00, 0x02, 0x00, 0x03, 0x03, 0x02, 0x00,
+			0x01, 0x01, 0x03, 0x02, 0x01, 0x01, 0x00, 0x03, 0x01, 0x00, 0x01, 0x03,
+		},
+	},
+};
+
+static const struct ploytec_decode_vector ploytec_decode_vectors[] = {
+	{
+		.name = "zeros",
+		.src = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "ones",
+		.src = {
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			0xff, 0xff, 0xff, 0xff,
+		},
+		.expect = {
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+		},
+	},
+	{
+		.name = "ramp",
+		.src = {
+			0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b,
+			0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
+			0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23,
+			0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
+			0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b,
+			0x3c, 0x3d, 0x3e, 0x3f,
+		},
+		.expect = {
+			0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33,
+			0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f,
+		},
+	},
+	{
+		.name = "bitplane0_only",
+		.src = {
+			0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+			0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+			0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+			0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+			0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+			0x01, 0x01, 0x01, 0x01,
+		},
+		.expect = {
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "bitplane1_only",
+		.src = {
+			0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
+			0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
+			0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
+			0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
+			0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
+			0x02, 0x02, 0x02, 0x02,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "bitplane2_only",
+		.src = {
+			0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
+			0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
+			0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
+			0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
+			0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
+			0x04, 0x04, 0x04, 0x04,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+		},
+	},
+	{
+		.name = "group0_only",
+		.src = {
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00,
+		},
+		.expect = {
+			0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00,
+			0xff, 0xff, 0xff, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "group1_only",
+		.src = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff,
+			0x00, 0x00, 0x00, 0xff, 0xff, 0xff,
+		},
+	},
+	{
+		.name = "unused_bytes_only",
+		.src = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
+			0xff, 0xff, 0xff, 0xff,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "unused_bits_only",
+		.src = {
+			0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8,
+			0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8,
+			0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8,
+			0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8,
+			0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8,
+			0xf8, 0xf8, 0xf8, 0xf8,
+		},
+		.expect = {
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		},
+	},
+	{
+		.name = "random00",
+		.src = {
+			0xc6, 0xd8, 0x5e, 0x8e, 0xac, 0x3a, 0xa9, 0x38, 0x25, 0x20, 0xcb, 0x47,
+			0x26, 0xd0, 0x86, 0xb5, 0xf4, 0xfd, 0x71, 0x3c, 0xb2, 0xed, 0x50, 0x06,
+			0xa5, 0x48, 0x62, 0xc1, 0xa5, 0x7f, 0xc7, 0xc5, 0xcd, 0x91, 0x98, 0xa8,
+			0x8b, 0x35, 0x5a, 0x0c, 0x3e, 0xdc, 0x33, 0xf7, 0x3d, 0x8a, 0x15, 0xf6,
+			0x5e, 0xac, 0x64, 0x96, 0x33, 0x8c, 0x4b, 0xf4, 0x83, 0xa5, 0x41, 0x86,
+			0xfd, 0x51, 0xe5, 0x15,
+		},
+		.expect = {
+			0x64, 0xb1, 0x02, 0x0a, 0x3a, 0xcc, 0x09, 0x3a, 0xb4, 0x9a, 0xb5, 0x0a,
+			0xd5, 0x9b, 0xb8, 0xf5, 0xdb, 0x85,
+		},
+	},
+	{
+		.name = "random01",
+		.src = {
+			0xcd, 0xae, 0xb2, 0x51, 0xf0, 0x30, 0xf7, 0xf1, 0xda, 0x22, 0x94, 0x5d,
+			0xd4, 0x48, 0x69, 0xa6, 0x37, 0x76, 0xd1, 0x4e, 0x58, 0xb0, 0xdf, 0x86,
+			0x19, 0xa5, 0x1d, 0x27, 0x62, 0x3a, 0x41, 0x4a, 0x1d, 0xa6, 0xe1, 0x9a,
+			0x44, 0xe0, 0x6a, 0x40, 0xf5, 0xc2, 0x2f, 0x9b, 0xf4, 0x8e, 0xcb, 0x7c,
+			0x9c, 0xfd, 0x51, 0x89, 0x40, 0x75, 0x99, 0x2d, 0x4b, 0xda, 0x29, 0x14,
+			0xfc, 0xd2, 0x9b, 0x13,
+		},
+		.expect = {
+			0xa2, 0x12, 0x93, 0x77, 0xb2, 0xa0, 0xd3, 0xc1, 0x62, 0x00, 0x76, 0x52,
+			0xd3, 0x39, 0xc2, 0xc5, 0xad, 0xc8,
+		},
+	},
+	{
+		.name = "random02",
+		.src = {
+			0x8e, 0xae, 0x5e, 0x59, 0x19, 0x93, 0xfd, 0x3b, 0x27, 0x0a, 0x8e, 0x06,
+			0xfe, 0x31, 0xb2, 0xab, 0x7e, 0xc0, 0xaa, 0xe8, 0x13, 0x52, 0x24, 0x71,
+			0x4b, 0x2f, 0x0d, 0x71, 0xf6, 0x9c, 0xc5, 0x3f, 0x12, 0x07, 0x45, 0xb1,
+			0xff, 0x89, 0xe3, 0x86, 0x60, 0x41, 0xd4, 0x82, 0xc2, 0xbe, 0x01, 0x48,
+			0x17, 0x7c, 0x8c, 0x42, 0x4f, 0xba, 0xc1, 0xed, 0xb9, 0xf3, 0xb4, 0xfc,
+			0xa8, 0xb9, 0x1e, 0xc0,
+		},
+		.expect = {
+			0x09, 0x85, 0x1f, 0x8b, 0x42, 0x7e, 0xac, 0xfb, 0xe5, 0x9c, 0x1c, 0xcb,
+			0x82, 0xb8, 0xe2, 0xe9, 0x24, 0x69,
+		},
+	},
+	{
+		.name = "random03",
+		.src = {
+			0xb4, 0xbd, 0x6e, 0x34, 0xa0, 0x24, 0x1f, 0x6f, 0x5d, 0x79, 0x0e, 0xa6,
+			0x86, 0x6e, 0xfd, 0x0d, 0x27, 0xa3, 0x08, 0x71, 0x06, 0xc2, 0xd9, 0x68,
+			0xc4, 0xbc, 0x4e, 0xd6, 0x36, 0x0c, 0x5a, 0xaa, 0x7c, 0xf0, 0xbb, 0x88,
+			0xc4, 0x96, 0xb2, 0x49, 0x76, 0x66, 0xee, 0xae, 0x3e, 0x2b, 0xaa, 0x14,
+			0x6d, 0x6f, 0xcd, 0x58, 0x3e, 0x59, 0x50, 0x2b, 0xf7, 0x92, 0x3b, 0xf0,
+			0x80, 0x8d, 0xd4, 0x16,
+		},
+		.expect = {
+			0xd2, 0xc3, 0x43, 0xe5, 0x04, 0x21, 0xcc, 0x3c, 0x23, 0x49, 0xfe, 0x26,
+			0x88, 0xbf, 0xf7, 0xe8, 0xf9, 0x8c,
+		},
+	},
+	{
+		.name = "random04",
+		.src = {
+			0xef, 0x44, 0xa5, 0x78, 0x0f, 0x7d, 0xfe, 0x17, 0xa4, 0xd2, 0x30, 0x98,
+			0xbf, 0xc5, 0xb6, 0xda, 0x4f, 0x6b, 0xde, 0x5f, 0x1d, 0x3c, 0xe7, 0xe6,
+			0x46, 0x7f, 0x70, 0x00, 0xa4, 0x5d, 0xa3, 0xef, 0x7b, 0x9f, 0x64, 0x0e,
+			0xc4, 0x09, 0x25, 0xfa, 0x85, 0x83, 0x13, 0x18, 0x06, 0x26, 0x87, 0x6b,
+			0x94, 0x56, 0x89, 0xc6, 0x12, 0x38, 0xd1, 0xd5, 0xd1, 0x76, 0xf4, 0x00,
+			0x1d, 0xe9, 0xa4, 0xd8,
+		},
+		.expect = {
+			0xda, 0x0c, 0xad, 0x23, 0xe3, 0xc6, 0xf3, 0x4b, 0x8b, 0x58, 0x6f, 0xd1,
+			0xbf, 0x8e, 0xef, 0xd1, 0x8e, 0x7a,
+		},
+	},
+	{
+		.name = "random05",
+		.src = {
+			0x3d, 0x21, 0xf0, 0x7d, 0x1b, 0xd9, 0xf9, 0x41, 0xad, 0x31, 0xe2, 0xea,
+			0x59, 0x26, 0x84, 0xbb, 0x9a, 0xf8, 0x6c, 0xaa, 0x7f, 0x9a, 0x5a, 0x9a,
+			0xb7, 0x58, 0x2d, 0x47, 0xc8, 0xd9, 0x26, 0x94, 0x16, 0xac, 0xc8, 0x30,
+			0x03, 0xd0, 0x65, 0x2b, 0x36, 0xba, 0x6f, 0xf8, 0xdb, 0x56, 0xbf, 0x58,
+			0x2d, 0xb9, 0x98, 0x21, 0xe8, 0x60, 0x2f, 0xe8, 0x08, 0xad, 0xb8, 0x29,
+			0xe0, 0xe1, 0x30, 0xb4,
+		},
+		.expect = {
+			0x08, 0xc9, 0xdf, 0xd2, 0x2a, 0x0b, 0x9f, 0x35, 0x08, 0x02, 0xee, 0x89,
+			0x28, 0x86, 0x90, 0x82, 0xa6, 0xc2,
+		},
+	},
+	{
+		.name = "random06",
+		.src = {
+			0xee, 0x50, 0x9e, 0xc6, 0x2f, 0x39, 0xbe, 0xdc, 0xdf, 0x36, 0x4a, 0xea,
+			0x87, 0x86, 0x56, 0x36, 0xe2, 0xd8, 0x5e, 0x9c, 0x30, 0xb7, 0x21, 0x54,
+			0x3d, 0x11, 0x84, 0x67, 0x00, 0xb9, 0x0c, 0x21, 0x7a, 0x27, 0x27, 0xd5,
+			0x78, 0xc0, 0xf2, 0x12, 0xcb, 0x75, 0xb6, 0x4a, 0x6e, 0x0e, 0xc6, 0x4f,
+			0x19, 0xe5, 0x27, 0xcb, 0xef, 0x20, 0xa9, 0x7e, 0x8f, 0x71, 0xcc, 0x67,
+			0x01, 0x24, 0x65, 0x42,
+		},
+		.expect = {
+			0x06, 0x88, 0x0c, 0xfa, 0xc1, 0x70, 0xa4, 0xff, 0xba, 0x39, 0xbf, 0xe3,
+			0x35, 0xcf, 0xbb, 0x69, 0x6f, 0x70,
+		},
+	},
+	{
+		.name = "random07",
+		.src = {
+			0xe5, 0xe6, 0xd4, 0x3d, 0x9c, 0x02, 0xbe, 0xd4, 0x8e, 0x97, 0x53, 0x62,
+			0x8c, 0xad, 0x44, 0x9f, 0x92, 0x01, 0xf2, 0x87, 0xcc, 0xd6, 0x89, 0xd6,
+			0x2a, 0xa3, 0xe1, 0xa8, 0xc6, 0xde, 0x45, 0x14, 0x35, 0x48, 0xec, 0x8e,
+			0xa3, 0x67, 0x56, 0x9b, 0x7e, 0x39, 0x88, 0xc5, 0x1a, 0x8e, 0xc9, 0x9f,
+			0x15, 0xbe, 0x04, 0x2a, 0xb4, 0xaa, 0x51, 0xa4, 0xe4, 0x64, 0x9c, 0x0f,
+			0x6d, 0xe9, 0x01, 0x87,
+		},
+		.expect = {
+			0x52, 0x65, 0x90, 0x82, 0x53, 0x8d, 0xb5, 0xf1, 0x46, 0x54, 0x8d, 0x1f,
+			0x1d, 0xcf, 0xfb, 0xe9, 0x95, 0xb6,
+		},
+	},
+	{
+		.name = "random08",
+		.src = {
+			0xe6, 0x2a, 0xbf, 0xe4, 0x65, 0x8e, 0xe8, 0x56, 0xcc, 0xf7, 0x9c, 0xce,
+			0xcc, 0x26, 0xbf, 0x43, 0xde, 0xac, 0x2f, 0x15, 0x21, 0xd6, 0x96, 0x2a,
+			0x41, 0xe3, 0x77, 0x00, 0x97, 0xe8, 0xde, 0x17, 0xcc, 0x3f, 0xe4, 0x68,
+			0x81, 0x04, 0xae, 0x8e, 0x5c, 0xec, 0x4b, 0x75, 0x91, 0x3f, 0xe6, 0x4c,
+			0xa4, 0xbb, 0xdd, 0xf0, 0x78, 0xee, 0xf1, 0x61, 0xee, 0x9b, 0xff, 0xed,
+			0xd4, 0x1d, 0x08, 0x4d,
+		},
+		.expect = {
+			0x38, 0x43, 0x28, 0x63, 0x3c, 0x48, 0xa7, 0x57, 0xe5, 0x44, 0x26, 0x43,
+			0xf6, 0xfe, 0xbd, 0xa4, 0xd7, 0xe7,
+		},
+	},
+	{
+		.name = "random09",
+		.src = {
+			0x79, 0xce, 0xe6, 0x42, 0xf3, 0xe2, 0x01, 0xc7, 0x00, 0x7c, 0x86, 0xab,
+			0x74, 0x1c, 0x27, 0x73, 0xe4, 0x11, 0x64, 0x17, 0xe3, 0x04, 0x8c, 0x6d,
+			0xac, 0xc7, 0xb4, 0x76, 0x0f, 0xda, 0x0e, 0x8e, 0x56, 0x3d, 0x2d, 0x21,
+			0x1b, 0xee, 0xf3, 0x57, 0x94, 0xf1, 0xed, 0x35, 0x3b, 0x68, 0x4d, 0x96,
+			0x62, 0x84, 0xaa, 0xe3, 0xb1, 0x68, 0xdf, 0x21, 0x0b, 0xc5, 0xe2, 0x36,
+			0x7d, 0x34, 0xb7, 0xab,
+		},
+		.expect = {
+			0x59, 0x13, 0x8b, 0x1b, 0x7a, 0x7b, 0x18, 0x33, 0x7d, 0xb2, 0x09, 0x8f,
+			0xb7, 0x6e, 0x61, 0x42, 0xb3, 0xe5,
+		},
+	},
+	{
+		.name = "random10",
+		.src = {
+			0x15, 0x04, 0xd5, 0x8f, 0x8a, 0xd6, 0x4a, 0x71, 0xed, 0x8e, 0xdc, 0xb1,
+			0x95, 0x6a, 0xec, 0x57, 0xf2, 0x4e, 0x55, 0xbc, 0x7e, 0x1b, 0xb4, 0x21,
+			0x7d, 0xbe, 0x5f, 0xf7, 0x04, 0x0f, 0x47, 0x7d, 0x02, 0xce, 0x92, 0x6c,
+			0xce, 0xd7, 0x1d, 0x7d, 0x93, 0xb6, 0x79, 0x7a, 0x75, 0x10, 0xb9, 0x96,
+			0x68, 0x14, 0xae, 0x41, 0xe1, 0x3b, 0x3a, 0x6e, 0xa3, 0x47, 0x26, 0x8f,
+			0x26, 0xe7, 0x7c, 0x79,
+		},
+		.expect = {
+			0x25, 0x99, 0xb1, 0x1c, 0xaa, 0x07, 0xcc, 0x45, 0x1e, 0x27, 0xd1, 0xec,
+			0x7a, 0xeb, 0xf4, 0x61, 0x49, 0x5f,
+		},
+	},
+	{
+		.name = "random11",
+		.src = {
+			0x6c, 0x13, 0x40, 0xe8, 0x4e, 0x10, 0x1c, 0x98, 0xee, 0x6d, 0xa3, 0x78,
+			0x32, 0x8b, 0x6a, 0x99, 0x70, 0x92, 0x40, 0xe3, 0x69, 0x54, 0x3b, 0x3b,
+			0x4e, 0xc1, 0x42, 0xdf, 0xb3, 0xe5, 0x65, 0x1b, 0x54, 0x27, 0xf5, 0x3f,
+			0xba, 0xb0, 0x6c, 0x27, 0x0a, 0x05, 0xde, 0x53, 0xb7, 0x7c, 0xf3, 0x50,
+			0xc3, 0xa5, 0xdf, 0xef, 0x83, 0xbf, 0x4f, 0x10, 0xfd, 0xd9, 0x75, 0xea,
+			0x57, 0x43, 0xf8, 0xf0,
+		},
+		.expect = {
+			0x1b, 0x65, 0x40, 0xfe, 0x5a, 0x71, 0x53, 0xae, 0x48, 0xbe, 0xba, 0x59,
+			0x04, 0xc0, 0x8a, 0x76, 0x6c, 0xf3,
+		},
+	},
+	{
+		.name = "random12",
+		.src = {
+			0xd8, 0x7b, 0xd5, 0x75, 0x28, 0xb5, 0x18, 0x63, 0x15, 0xbc, 0xf2, 0xac,
+			0xcd, 0x26, 0x4f, 0xbe, 0xdf, 0x80, 0x99, 0xa0, 0x33, 0x2e, 0x99, 0xe7,
+			0xd0, 0x8a, 0x60, 0x0b, 0x6a, 0xd6, 0x17, 0xed, 0x0e, 0xd3, 0x84, 0xa6,
+			0x12, 0xe5, 0x88, 0xaa, 0x66, 0xac, 0x45, 0x64, 0x7e, 0x9d, 0xf3, 0x9c,
+			0xae, 0xa3, 0x18, 0x10, 0x64, 0x0f, 0xdd, 0xd8, 0x8a, 0xaa, 0xd6, 0xde,
+			0x63, 0x16, 0xc0, 0x12,
+		},
+		.expect = {
+			0xab, 0x8a, 0x75, 0x46, 0x26, 0x44, 0x8d, 0x27, 0x41, 0xc4, 0x8a, 0xd9,
+			0x85, 0xdf, 0x34, 0x8e, 0xfd, 0xb4,
+		},
+	},
+	{
+		.name = "random13",
+		.src = {
+			0x9a, 0x97, 0x1c, 0x40, 0x5b, 0xdf, 0x25, 0xd2, 0xc3, 0x5b, 0xa8, 0xfe,
+			0xf0, 0x61, 0x70, 0x8a, 0xbe, 0x66, 0x51, 0x59, 0xc0, 0x69, 0x4c, 0xc3,
+			0xf7, 0x2f, 0xb5, 0x48, 0xd2, 0x7a, 0xff, 0x5a, 0x15, 0xd2, 0xa6, 0x5e,
+			0xa6, 0x0c, 0xad, 0xdf, 0xce, 0xf6, 0x19, 0x27, 0x28, 0x85, 0x13, 0xd5,
+			0xbd, 0x68, 0xd5, 0x5f, 0x39, 0x8b, 0x34, 0xd0, 0x95, 0x9c, 0x48, 0x29,
+			0xd7, 0x89, 0x14, 0xc0,
+		},
+		.expect = {
+			0x35, 0xc4, 0x4e, 0xbc, 0x37, 0x83, 0xc1, 0xd1, 0xcd, 0x14, 0xd2, 0x79,
+			0xc2, 0x10, 0x66, 0xb2, 0xd5, 0xbf,
+		},
+	},
+	{
+		.name = "random14",
+		.src = {
+			0xbf, 0x78, 0x65, 0x38, 0xf3, 0x58, 0x09, 0x9f, 0x34, 0x5c, 0x40, 0x2d,
+			0xb6, 0xd3, 0x47, 0x04, 0xdb, 0x5f, 0x69, 0x4b, 0x4f, 0xc3, 0xbd, 0xd9,
+			0x5f, 0xf5, 0xcd, 0x94, 0x3b, 0x0c, 0x59, 0xe3, 0x13, 0xc4, 0xd3, 0x34,
+			0x07, 0x47, 0xa5, 0x1a, 0xc3, 0xb8, 0xe3, 0x45, 0xc8, 0x0b, 0x11, 0x9d,
+			0xb3, 0x9a, 0x87, 0x4a, 0x61, 0xb2, 0x99, 0x65, 0xcb, 0xc8, 0x69, 0xb4,
+			0xa3, 0x98, 0x72, 0xd4,
+		},
+		.expect = {
+			0xff, 0x16, 0xab, 0xab, 0xb7, 0xae, 0xdc, 0x0e, 0x89, 0xf4, 0xa4, 0xad,
+			0x4a, 0xdb, 0xa1, 0x21, 0x11, 0x5e,
+		},
+	},
+	{
+		.name = "random15",
+		.src = {
+			0x55, 0xab, 0x93, 0x08, 0xcd, 0x6a, 0x50, 0x3b, 0x0e, 0xc6, 0x2b, 0x52,
+			0x3c, 0x10, 0xc8, 0x4f, 0x37, 0xfc, 0x1c, 0xde, 0x49, 0x6f, 0x08, 0x0a,
+			0x4a, 0x39, 0xa9, 0x99, 0x14, 0xb6, 0x91, 0xf2, 0x4d, 0x09, 0x00, 0x3f,
+			0xf2, 0x8c, 0x48, 0xdf, 0x3f, 0x05, 0xfb, 0xb1, 0xec, 0xb3, 0xee, 0x42,
+			0xb7, 0x8d, 0xce, 0xc9, 0x3e, 0x81, 0xcc, 0x94, 0x0b, 0x63, 0x8d, 0xbf,
+			0xa3, 0xc9, 0xa8, 0x24,
+		},
+		.expect = {
+			0x8c, 0x21, 0xe9, 0xd4, 0xf4, 0xd1, 0x95, 0xf1, 0x65, 0xa8, 0xa7, 0x19,
+			0xf4, 0xc9, 0x88, 0xeb, 0xca, 0x95,
+		},
+	},
+};
+
+#endif /* PLOYTEC_CODEC_TEST_VECTORS_H */
diff --git a/sound/usb/jockey3/ploytec_midi.c b/sound/usb/jockey3/ploytec_midi.c
new file mode 100644
index 0000000000000..3eebc706bb301
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_midi.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Generic MIDI 1.0 Running Status expander
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+/*
+ * The logic here is generic MIDI 1.0 Running Status handling: it operates
+ * purely on a byte stream, with no dependency on USB or on the rest of this
+ * driver. It carries the ploytec_ prefix and lives in the Ploytec layer
+ * because that firmware is what requires it -- the device does not accept a
+ * Running Status stream and needs every message fully status-prefixed.
+ *
+ * Should a second driver ever need the same behavior, this would be a
+ * reasonable candidate to migrate into a shared kernel library rather than
+ * duplicating it.
+ */
+
+#include "ploytec_midi.h"
+
+/**
+ * ploytec_midi_running_status_expand() - Expand MIDI 1.0 Running Status
+ * @state: expander state, zero-initialized by the caller before first use
+ * @b: the next raw MIDI byte from the source stream, in stream order
+ * @dev: struct device for diagnostic logging (currently unused)
+ *
+ * MIDI 1.0 allows the status byte of a Channel Voice Message to be omitted
+ * when it repeats the previous message's status ("Running Status"). Some
+ * MIDI receivers don't implement Running Status and require every message
+ * to carry its status byte explicitly; this function expands a Running
+ * Status stream back into fully status-prefixed messages.
+ *
+ * Call this once per raw input byte. Most calls simply return @b unchanged.
+ * When a data byte arrives while Running Status is active, the synthesised
+ * status byte is returned immediately for the caller to send first, and @b
+ * itself is queued in @state->queued_byte (with @state->has_queued_byte set)
+ * for the caller to retrieve and send on the next output opportunity, ahead
+ * of consuming any further input.
+ *
+ * Return: the next byte to send to the receiver.
+ */
+u8 ploytec_midi_running_status_expand(struct ploytec_midi_running_status *state,
+				      u8 b, struct device *dev)
+{
+	u8 byte;
+
+	if (b >= 0x80) { // Status byte
+		if (b < 0xf0) { // Channel Voice Message (0x80-0xEF)
+			state->running_status = b;
+			/* Determine expected data bytes based on MIDI opcode */
+			if ((b & 0xf0) == 0xc0 || (b & 0xf0) == 0xd0)
+				state->expected_data = 1; // PC, Channel Pressure
+			else
+				state->expected_data = 2; // Note On/Off, CC, etc.
+		} else if (b < 0xf8) { // System Common Message (0xf0-0xf7)
+			/* System Common messages clear Running Status */
+			state->running_status = 0;
+			state->expected_data = 0;
+		} else { // System Real-Time Message (0xf8-0xff), do not affect Running Status
+			return b;
+		}
+
+		state->data_count = state->expected_data; // initialize expected data byte count
+		return b;
+	}
+
+	/* Data byte */
+	if (state->data_count > 0) {
+		state->data_count--;
+		return b;
+	} else if (state->running_status >= 0x80) {
+		/* Message is complete but we got a data byte -> expand Running Status */
+		byte = state->running_status;
+		state->queued_byte = b;
+		state->has_queued_byte = true;
+		state->data_count = state->expected_data - 1; // already 1 byte queued
+		return byte;
+	}
+
+	/* No running status expansion active, just send the data byte */
+	return b;
+}
diff --git a/sound/usb/jockey3/ploytec_midi.h b/sound/usb/jockey3/ploytec_midi.h
new file mode 100644
index 0000000000000..079bce519e9d9
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_midi.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   Generic MIDI 1.0 Running Status expander
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#ifndef __SOUND_USB_JOCKEY3_PLOYTEC_MIDI_H
+#define __SOUND_USB_JOCKEY3_PLOYTEC_MIDI_H
+
+#include <linux/types.h>
+
+struct device;
+
+/**
+ * struct ploytec_midi_running_status - MIDI 1.0 Running Status expander state
+ * @expected_data: number of data bytes expected for the current @running_status message
+ * @data_count: number of data bytes still to be consumed for the in-progress message
+ * @running_status: the currently active Running Status (Channel Voice) opcode, or 0 if none
+ * @queued_byte: data byte held back when a Running Status byte had to be synthesised
+ * @has_queued_byte: true when @queued_byte holds a byte still to be delivered
+ *
+ * Zero-initialize before first use.
+ */
+struct ploytec_midi_running_status {
+	int expected_data;
+	int data_count;
+	u8 running_status;
+	u8 queued_byte;
+	bool has_queued_byte;
+};
+
+u8 ploytec_midi_running_status_expand(struct ploytec_midi_running_status *state,
+				      u8 b, struct device *dev);
+
+#endif /* __SOUND_USB_JOCKEY3_PLOYTEC_MIDI_H */
diff --git a/sound/usb/jockey3/ploytec_proto.c b/sound/usb/jockey3/ploytec_proto.c
new file mode 100644
index 0000000000000..a4d5795cbdf4d
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_proto.c
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   Ploytec USB Protocol Handling
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include "ploytec_proto.h"
+
+/*
+ * None of the helpers below validate @intf/@xfer_buf for NULL: callers own
+ * the chip's usb_interface and control-transfer buffer for the entire time
+ * the PCM/rawmidi devices can be open, so these arguments are always valid
+ * here.
+ */
+
+/**
+ * ploytec_ctrl_ep_unresponsive - Has the control endpoint stopped answering?
+ * @err: error returned by an EP0 control transfer
+ *
+ * Distinguishes a device that answered -- even to refuse -- from one whose
+ * control endpoint has gone silent. A STALL (-EPIPE) or a short reply
+ * (-EREMOTEIO) both mean live firmware: the transfer completed and the device
+ * drove the bus. A timeout or a transport-level error means EP0 itself is gone,
+ * and every further control transfer will only burn another
+ * PLOYTEC_CTRL_TIMEOUT_MS before failing the same way.
+ *
+ * The list is affirmative rather than an exclusion, so an unfamiliar error
+ * counts as "device still there" and a new class has to be added deliberately.
+ *
+ * Return: true if EP0 has stopped responding.
+ */
+static bool ploytec_ctrl_ep_unresponsive(int err)
+{
+	switch (err) {
+	case -ETIMEDOUT:
+	case -ENODEV:
+	case -ESHUTDOWN:
+	case -ECONNRESET:
+	case -EPROTO:
+	case -EILSEQ:
+	case -ETIME:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * ploytec_get_firmware - Read firmware version from the device
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer (at least 3 bytes)
+ * @fw_version: Optional, set to the packed firmware/hardware version on success
+ *
+ * Performs a request to the device to retrieve the firmware and/or hardware version.
+ * Required as part of the handshake sequence regardless of whether the caller
+ * wants the value; pass @fw_version as NULL to discard it.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ploytec_get_firmware(struct usb_interface *intf, void *xfer_buf, u32 *fw_version)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	u8 *buf = xfer_buf;
+	int ret;
+
+	ret = usb_control_msg_recv(dev, 0, PLOYTEC_REQ_FIRMWARE, PLOYTEC_REQ_FIRMWARE_TYPE, 0, 0,
+				   buf, 3, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Three-byte reply: a suspected hardware revision, then the firmware
+	 * major and minor. See re/protocol_analysis.md.
+	 */
+	if (fw_version)
+		*fw_version = (buf[0] << 16) | (buf[1] << 8) | buf[2];
+	return 0;
+}
+
+/**
+ * ploytec_get_status - Read device status byte
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer (at least 1 byte)
+ * @status: Pointer to store the status byte
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ploytec_get_status(struct usb_interface *intf, void *xfer_buf, u8 *status)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	u8 *buf = xfer_buf;
+	int ret;
+
+	// Read Status (Request 0x49)
+	ret = usb_control_msg_recv(dev, 0, PLOYTEC_REQ_STATUS, PLOYTEC_REQ_STATUS_TYPE, 0, 0,
+				   buf, 1, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	*status = buf[0];
+	return 0;
+}
+
+/**
+ * ploytec_initialize_device - Perform Ploytec handshake sequence as observed in USB traces.
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer
+ * @bounce_alt0: drive both interfaces to alt 0 before selecting alt 1, which
+ *	the vendors do only when changing the rate of a running device
+ * @fw_version: Optional, set to the packed firmware/hardware version on success
+ *
+ * Aborts early if EP0 stops responding, rather than continuing into the
+ * alt-setting sequence below; see the comment on the firmware read for why
+ * that distinction matters.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ploytec_initialize_device(struct usb_interface *intf, void *xfer_buf, bool bounce_alt0,
+			      u32 *fw_version)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	const unsigned int halt_pipes[] = {
+		usb_rcvbulkpipe(dev, PLOYTEC_EP_NUM_PCM_IN),
+		usb_sndbulkpipe(dev, PLOYTEC_EP_NUM_PCM_OUT),
+		usb_rcvbulkpipe(dev, PLOYTEC_EP_NUM_MIDI_IN),
+	};
+	u8 status;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * The vendors read the firmware version after power-up and the value
+	 * is unused here, but this is the sequence's first EP0 transfer and so
+	 * the last point at which the usb_set_interface() calls below can
+	 * still be avoided -- which is what makes its return load-bearing.
+	 * usb_set_interface() disables the interface's endpoints before it
+	 * sends SET_INTERFACE and does not re-enable them if that request
+	 * fails, so calling it on a device whose control endpoint has already
+	 * gone silent leaves every endpoint of interface 0 permanently
+	 * disabled and usb_submit_urb() returning -ENOENT until the device is
+	 * reset. A device that merely refuses the request is fine; one that
+	 * has stopped answering is not.
+	 */
+	ret = ploytec_get_firmware(intf, xfer_buf, fw_version);
+	if (ret < 0) {
+		dev_warn(&intf->dev, "Firmware version read failed: %d\n", ret);
+		if (ploytec_ctrl_ep_unresponsive(ret))
+			return ret;
+	}
+
+	/*
+	 * Deactivate the audio interfaces before reactivating them, but only
+	 * when the device is already running. On a device that has just been
+	 * enumerated the interfaces are at alt 0 anyway, and neither vendor
+	 * driver touches alt 0 there. macOS does bounce on a rate change, and
+	 * takes interface 1 down first, which is the order used here.
+	 */
+	if (bounce_alt0) {
+		ret = usb_set_interface(dev, 1, 0);
+		if (ret < 0)
+			return ret;
+		ret = usb_set_interface(dev, 0, 0);
+		if (ret < 0)
+			return ret;
+
+		/* Give the hardware some time to respond, otherwise it might not be ready */
+		usleep_range(3000, 5000);
+	}
+
+	// Select Alt Setting 1 to activate the audio interface
+	ret = usb_set_interface(dev, 0, 1);
+	if (ret < 0)
+		return ret;
+	ret = usb_set_interface(dev, 1, 1);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The bulk endpoints just activated are not immediately ready for the
+	 * usb_clear_halt() calls below: without this pause, EP0 stops
+	 * answering anything at all until a full USB re-enumeration clears
+	 * it. Only ever reproduced on a single-core host (Pi 1B, armv6),
+	 * never on a multi-core one; bisected down to this range with real
+	 * device power cycles. See github.com/fvdpol/alsa-jockey3/issues/48.
+	 */
+	usleep_range(25, 35);
+
+	/*
+	 * Clear Feature (ENDPOINT_HALT). A failure here has never been fatal on
+	 * a device that is still answering, so only a silent EP0 aborts -- which
+	 * also avoids burning two more PLOYTEC_CTRL_TIMEOUT_MS on the remaining
+	 * pipes once the first one has timed out.
+	 */
+	for (i = 0; i < ARRAY_SIZE(halt_pipes); i++) {
+		ret = usb_clear_halt(dev, halt_pipes[i]);
+		if (ret < 0) {
+			dev_warn(&intf->dev, "Failed to clear halt on EP 0x%02x: %d\n",
+				 usb_pipeendpoint(halt_pipes[i]) |
+					(usb_pipein(halt_pipes[i]) ? USB_DIR_IN : 0),
+				 ret);
+			if (ploytec_ctrl_ep_unresponsive(ret))
+				return ret;
+		}
+	}
+
+	return ploytec_get_status(intf, xfer_buf, &status);
+}
+
+/**
+ * ploytec_start_streaming - Trigger the device to start streaming
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer
+ *
+ * Reads the status byte and writes it back with the STREAMING bit set. The
+ * write is unconditional, which is the whole point: the device already
+ * reports STREAMING set after a rate change, so a conditional write would
+ * never be issued there at all. Ending a rate change with a second status
+ * read instead left the capture endpoint failing to restart after roughly one
+ * rate change in six, so the write evidently does more than set a bit -- see
+ * re/rate_change_stall.md.
+ *
+ * The vendors do not read the status back afterwards, so neither do we.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ploytec_start_streaming(struct usb_interface *intf, void *xfer_buf)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	u8 status;
+	int ret;
+
+	ret = ploytec_get_status(intf, xfer_buf, &status);
+	if (ret < 0)
+		return ret;
+	dev_dbg(&intf->dev, "Start Streaming: Status: 0x%02x\n", status);
+
+	return usb_control_msg_send(dev, 0, PLOYTEC_SET_STATUS, PLOYTEC_SET_STATUS_TYPE,
+				    status | PLOYTEC_STATUS_STREAMING,
+				    0, NULL, 0, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+}
+
+/**
+ * ploytec_get_rate - Read hardware sample rate
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer
+ * @index: wIndex to read from -- PLOYTEC_RATE_IDX_DEVICE before programming,
+ *	PLOYTEC_RATE_IDX_PCM_IN to verify afterwards
+ * @rate: Pointer to store the rate
+ *
+ * The wIndex is not cosmetic. The device answers both forms: the vendor
+ * drivers read the live rate device-wide and always verify against the
+ * capture endpoint.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ploytec_get_rate(struct usb_interface *intf, void *xfer_buf, u16 index, u32 *rate)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	u8 *buf = xfer_buf;
+	int ret;
+
+	ret = usb_control_msg_recv(dev, 0, PLOYTEC_REQ_GET_RATE, PLOYTEC_REQ_GET_RATE_TYPE,
+				   0x0100, index,
+				   buf, 3, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	*rate = (u32)buf[0] | ((u32)buf[1] << 8) | ((u32)buf[2] << 16);
+	return 0;
+}
+
+/**
+ * ploytec_set_rate - Set hardware sample rate
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer
+ * @rate: Sample rate in Hz
+ * @cold_init: true when this programs the rate as part of bringing the device
+ *	up, false when it changes the rate of a device already running
+ *
+ * The vendor drivers use two shapes here, and the difference is not cosmetic.
+ * A cold init starts programming the rate after a short gap; a rate change
+ * waits longer, writes once, pauses, then repeats the burst. Both end the
+ * burst on the capture endpoint and verify from it, which is the invariant
+ * that holds across every captured vendor sequence on both platforms; the
+ * write count itself is not load-bearing. The sleeps below stand in for
+ * windows in which the vendor host sends nothing at all -- it is waiting, not
+ * polling. See re/usb/init_timing_comparison.md.
+ *
+ * Return: 0 on success (including when the post-write rate verification
+ * detects a mismatch, which is only logged), negative errno if a control
+ * transfer fails.
+ */
+int ploytec_set_rate(struct usb_interface *intf, void *xfer_buf, u32 rate, bool cold_init)
+{
+	static const u16 burst_index[] = {
+		PLOYTEC_RATE_IDX_PCM_IN,
+		PLOYTEC_RATE_IDX_PCM_OUT,
+		PLOYTEC_RATE_IDX_PCM_IN,
+		PLOYTEC_RATE_IDX_PCM_OUT,
+		PLOYTEC_RATE_IDX_PCM_IN,
+	};
+	struct usb_device *dev = interface_to_usbdev(intf);
+	u8 *buf = xfer_buf;
+	u32 current_hw_rate = 0;
+	unsigned int i;
+	int ret;
+
+	dev_dbg(&intf->dev, "Setting rate %u Hz (%s)\n",
+		rate, cold_init ? "cold init" : "rate change");
+
+	buf[0] = rate & 0xFF;
+	buf[1] = (rate >> 8) & 0xFF;
+	buf[2] = (rate >> 16) & 0xFF;
+
+	if (cold_init) {
+		/* A fresh device gets a short gap and no separate first write. */
+		usleep_range(14000, 15000);
+	} else {
+		/* A rate change waits before touching the rate at all. */
+		usleep_range(50000, 51000);
+
+		ret = usb_control_msg_send(dev, 0, PLOYTEC_SET_RATE, PLOYTEC_SET_RATE_TYPE,
+					   0x0100, PLOYTEC_RATE_IDX_PCM_IN,
+					   buf, 3, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+		if (ret < 0) {
+			dev_err(&intf->dev, "Failed to set rate on EP 0x86: %d\n", ret);
+			return ret;
+		}
+
+		/* Write once, pause, then repeat the burst. */
+		usleep_range(10000, 11000);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(burst_index); i++) {
+		ret = usb_control_msg_send(dev, 0, PLOYTEC_SET_RATE, PLOYTEC_SET_RATE_TYPE,
+					   0x0100, burst_index[i],
+					   buf, 3, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+		if (ret < 0) {
+			dev_err(&intf->dev, "Failed to set rate on EP 0x%02x: %d\n",
+				burst_index[i], ret);
+			return ret;
+		}
+	}
+
+	if (ploytec_get_rate(intf, xfer_buf, PLOYTEC_RATE_IDX_PCM_IN, &current_hw_rate) == 0) {
+		if (current_hw_rate != rate)
+			dev_warn(&intf->dev, "Rate mismatch! Requested %u Hz, Hardware at %u Hz\n",
+				 rate, current_hw_rate);
+		else
+			dev_dbg(&intf->dev, "Rate verified as %u Hz\n", current_hw_rate);
+	}
+
+	/*
+	 * Every vendor sequence goes quiet between verifying the rate and
+	 * programming the status byte, which is the caller's next step in
+	 * ploytec_start_streaming(). The window does not vary with the rate,
+	 * so there is nothing to scale.
+	 */
+	usleep_range(50000, 51000);
+
+	return 0;
+}
diff --git a/sound/usb/jockey3/ploytec_proto.h b/sound/usb/jockey3/ploytec_proto.h
new file mode 100644
index 0000000000000..5609e4cfd4ec8
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_proto.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   Ploytec USB Protocol Handling
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ *
+ *   Comments here and in ploytec_proto.c cite documents by paths beginning
+ *   "re/". Those are the reverse-engineering notes this protocol layer was
+ *   derived from; they are not part of the kernel tree but live in the driver's
+ *   development repository, linked from its MAINTAINERS entry.
+ */
+
+#ifndef __SOUND_USB_JOCKEY3_PLOYTEC_PROTO_H
+#define __SOUND_USB_JOCKEY3_PLOYTEC_PROTO_H
+
+#include <linux/types.h>
+#include <linux/usb.h>
+
+#define USB_XFER_BUF_SIZE		64	// temporary buffer for USB control transfers
+
+/* Packet format/structure */
+#define PLOYTEC_PKT_SIZE		512
+#define PLOYTEC_MIDI_OUT_OFFSET		480	// location of MIDI data in the playback packet
+#define PLOYTEC_MIDI_IDLE_BYTE		0xFD	// send when no MIDI data is available
+#define PLOYTEC_SYNC_BYTE_OFFSET	481
+#define PLOYTEC_SYNC_BYTE_VALUE		0xFF
+
+/* USB Endpoint numbers*/
+#define PLOYTEC_EP_NUM_PCM_OUT		0x05	// Playback & MIDI Out (EP 0x05)
+#define PLOYTEC_EP_NUM_PCM_IN		0x06	// Capture (EP 0x86)
+#define PLOYTEC_EP_NUM_MIDI_IN		0x03	// MIDI In (EP 0x83)
+
+/* Protocol Commands */
+#define PLOYTEC_SET_RATE		0x01	// bRequest to set sample rate
+#define PLOYTEC_SET_RATE_TYPE		0x22	// bmRequestType to set sample rate
+#define PLOYTEC_SET_STATUS		0x49	// bRequest to set device status
+#define PLOYTEC_SET_STATUS_TYPE		0x40	// bmRequestType to set device status
+#define PLOYTEC_REQ_STATUS		0x49	// bRequest to get device status
+#define PLOYTEC_REQ_STATUS_TYPE		0xC0	// bmRequestType to get device status
+#define PLOYTEC_REQ_FIRMWARE		0x56	// bRequest to get firmware version
+#define PLOYTEC_REQ_FIRMWARE_TYPE	0xC0	// bmRequestType to get firmware version
+#define PLOYTEC_REQ_GET_RATE		0x81	// bRequest to get current sample rate
+#define PLOYTEC_REQ_GET_RATE_TYPE	0xA2	// bmRequestType to get current sample rate
+
+/*
+ * wIndex values for the rate requests: zero addresses the device as a whole,
+ * an endpoint address addresses one stream. Both forms are needed -- see
+ * re/protocol_analysis.md.
+ */
+#define PLOYTEC_RATE_IDX_DEVICE		0x0000	// device-wide, used before programming
+#define PLOYTEC_RATE_IDX_PCM_IN		(PLOYTEC_EP_NUM_PCM_IN | USB_DIR_IN)	// 0x86
+#define PLOYTEC_RATE_IDX_PCM_OUT	(PLOYTEC_EP_NUM_PCM_OUT)		// 0x05
+
+/* Status Bits (bits 0-4 are observed but not understood, and unused) */
+#define PLOYTEC_STATUS_STREAMING	0x20
+
+/* Timeout for the EP0 control transfers above, in milliseconds */
+#define PLOYTEC_CTRL_TIMEOUT_MS		2000
+
+/*
+ * Protocol Helpers
+ *
+ * All of these take the USB interface rather than the USB device so that
+ * dev_dbg()/dev_err()/dev_warn() attribute log messages to our driver
+ * (e.g. "snd-reloop-jockey3 1-13:1.0: ...") instead of to usbcore's generic
+ * per-device node (e.g. "usb 1-13: ..."), which is what struct usb_device's
+ * embedded struct device is bound to.
+ */
+int ploytec_initialize_device(struct usb_interface *intf, void *xfer_buf,
+			      bool bounce_alt0, u32 *fw_version);
+int ploytec_start_streaming(struct usb_interface *intf, void *xfer_buf);
+int ploytec_get_rate(struct usb_interface *intf, void *xfer_buf, u16 index, u32 *rate);
+int ploytec_set_rate(struct usb_interface *intf, void *xfer_buf, u32 rate, bool cold_init);
+int ploytec_get_firmware(struct usb_interface *intf, void *xfer_buf, u32 *fw_version);
+int ploytec_get_status(struct usb_interface *intf, void *xfer_buf, u8 *status);
+
+#endif /* __SOUND_USB_JOCKEY3_PLOYTEC_PROTO_H */
-- 
2.47.3

