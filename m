Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432003;
	b=py1TLGoxn+OgHZ0H/VA8YeLfILhhwJFSQeGUNm3K2nl9joW6wq/7I2IxWoKXDM4suWeD
	 /chRl3Hklh8HxylAbpofJD7tDQ3qpPKA7xUTwu82l4CZyi9SxRyWVlCrTaGi50P0ZUTR0
	 tVmzfQntuuS3WX+0LCwJrvTxsN8NZJ7wVEshDoY7mmi9UiyIvh23qeoPF86vUFGRoi5cn
	 Z0kfDJ0W0fwFXWxmKZbaSVv0RbYp9bzppHYW4uZD0PRa/0AurkW7Cjae/vmcZlW1z/DYc
	 V0NreQs92OSXUWRZv/MEWWlvbwTkDj6gcSfiZ21RP9KQWDsKtyBEno1Vj82keUp8duQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h0ATgNxnFHXA5Bzp5Sr8ZKdegv09gu1IG2YXohICA0Q=;
	b=X8MIoD/nCmD+BVPH1+VyUB24Zq1ZeZ/Cr13PRMF49zr2qzdXylHvsCtm74g5JvAnTFqI
	 ZSkVoeZjveK45J0TG84KgtmNM9yV2mVnk2OiW7Dp+f+CJSk6qhMd2o9cU93Q6L1OSWC9E
	 m+gdcMJ9b6fBNvQmYxBK+hCeebTzIFHptilNsu2S8Gq/LDxGzZh9foLWoI1bGiCP4fZC1
	 2F2aLOnrYYUBXNNg4Qr67078Tbtv/tWOcw8rr9OIpUukJCBWO84BYu/Br56hfDsg01OLZ
	 ooEYms4/wPwsShP0PF8VEJaCYz53muNDyCQnX1nT255H0avx8YQiSJ4b9hZeuvB6KdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PgqOr8kW;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E61606A331
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E61606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PgqOr8kW
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7c33cc572e6so2248501137.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792432002; x=1793036802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0ATgNxnFHXA5Bzp5Sr8ZKdegv09gu1IG2YXohICA0Q=;
        b=PgqOr8kWr7TFLgrtFLTrVOe4loI3PqOLoFh9zNTrKqV9hgdPPuvSKeOAZdQ6ZQrfOx
         EbOn0A3ryRERocTqOfKRbQU2XdpbuWPZFfQYd3PHLgwXYJwd8EOfrdVC97DaJODzvHhM
         W6NrBbpLkkf7IO+fa4g6QQ3hPgAFXdomDRri0JkC6haYTCJwD4L+VWzZP1cAW8H+N8aH
         prS6NWrrpFKuEPevOyL0JtG7iFeuZqQDY7fM0gc6m13FkS0tEnyrvg4tRp4zsw04FHn5
         J1wm4QRoXjiYKSHrG6rJM+LTv80kLkQEFhp67MW1jedD9k+Hv9fHuxK3Djo5cJVb5y6b
         16Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792432002; x=1793036802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0ATgNxnFHXA5Bzp5Sr8ZKdegv09gu1IG2YXohICA0Q=;
        b=eXrC8xzgo7bs0OUrTimNFQD12guykqS4hYxiOkQBeuCJuShdflByKTFxJW7mtRp51Q
         pg4I5YU3TRzrWUDyVKkXdL6qdg7scvSN60BBhL+mSaav+8HlrqfH5XWteDyNZezq8oWS
         BQMxuoO4xT0RA18u6PoVYDXpXtG8/oo7zZX55aigfDuwt/xG67JocZASO2qcNqHbambi
         ofa2JDojaP8q+bxhZzDfh9c4EHwd9BE0xXWgMS8zdILIIumAzcSC+tJV3aR4gViJoMr2
         cAr1lD8ELn3+HN/h6L1X80jyIWdInP3SKUP3AoKsyyi6W8P3bCRh+bkcjN3TqRIE21eu
         obBw==
X-Forwarded-Encrypted: i=1; AKwUvBybZ8IWgntna1eIaY38vciSPD/f26J7Zy8l1bXBC7Tu2l/3tRnpUfaATs5E2XVpvxhgHxQbHHtEeeGsHmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPPmeu2dl+aJB+0kzdMa0hxxLZR5iV/ub+SSuFEYV2LNTM8O+B
	Yad28Ki3lW7W7LNzwJSJFpLYn1iTd0hfCVqLSwyK9gC2yJLp75IaMErg
X-Gm-Gg: AYBFou0o/4nmF8ifRYQy60dmWSDj0WXOeYMxAHDAHTVmOA+1xKqs8kLnJhwpNuSgGxL
	AIB9WobVBoLwz6ewHYDLThKZbN8ZYTbnWieVWHicUMIZXMjhxR4LpdW/b3WNBR2eibiDgS+8ut2
	wKlWMFfUA39l9oC5g/bLgX7W/1TiN+pgtEK8LYaB4oZ1m7hFphsEyNj+cneMogvXVMXFARHDY6J
	QYBEEX8bwaFGTSwHS/2swVvbaT08pI4t7cB0YX2pmt3Sa+otWTM33t1LHPLlGHuLNo1rtZE7Rsw
	sB/xneq1E9bEhn5gooU2uPy/CIvNTGQoNDlr55tOcvwe9yuMtJHtNrrEd/E8WSpkyxKlnkC41wW
	U2vNAVHFxYR2ZsNO5fzwMSlXjN4ZgiFQZTEdBfv8goa9ufiNFZMDqwmdCgncLjTPDYvTGyXORJ+
	aKekJDg0XPi95peLg+MVhewowEw9YM+gBxH2BTygK82g/tGq3I6HcvmaXL0AWkfdfg68GEHKvfJ
	qziFX7LiUbjwxFSBovNyc9aLQ4jwyKrfYeNu+R10ZNsuZVYKl3FeFdss+/gJWBo2GYBhBo+QCT+
	5gfJ7oqeA4l0flXzD3ehYigrvccowIc=
X-Received: by 2002:a67:f34d:0:b0:7cc:ace:24ad with SMTP id ada2fe7eead31-7cc17c72bd9mr2203969137.0.1792432001912;
        Mon, 19 Oct 2026 10:46:41 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:39 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/13] ALSA: jockey3: Add driver documentation
Date: Mon, 19 Oct 2026 13:44:45 -0400
Message-ID: <20261019174445.1931263-14-fvdpol@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019174445.1931263-1-fvdpol@gmail.com>
References: <20261019174445.1931263-1-fvdpol@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Documentation/sound/cards/jockey3.rst and link it from the card
index and from the MAINTAINERS entry.

The document describes the supported devices, the audio channel layout,
the MIDI device, how the driver detects and recovers a stalled stream,
the module parameters and Kconfig options, and how the driver is
tested.

The channel map comment in jockey3.c now points at it.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 Documentation/sound/cards/index.rst   |   1 +
 Documentation/sound/cards/jockey3.rst | 249 ++++++++++++++++++++++++++
 MAINTAINERS                           |   1 +
 sound/usb/jockey3/jockey3.c           |   2 +-
 4 files changed, 252 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/sound/cards/jockey3.rst

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
index c1da7806b0dc1..e20b790887c09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23089,6 +23089,7 @@ M:	Frank van de Pol <fvdpol@gmail.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 W:	https://github.com/fvdpol/alsa-jockey3
+F:	Documentation/sound/cards/jockey3.rst
 F:	sound/usb/jockey3/
 
 REGISTER MAP ABSTRACTION
diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index db351c42d85c3..2cedcd33f7206 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -3597,7 +3597,7 @@ static int jockey3_validate_endpoints(struct usb_interface *intf0, struct usb_in
  * There is no equivalent notion for the inputs, so capture is left entirely
  * unpositioned.
  *
- * Physical layout:
+ * Physical layout (see Documentation/sound/cards/jockey3.rst):
  *   Playback: 1-2 Master Out L/R, 3-4 Headphone L/R
  *   Capture:  1-2 Input 1 L/R, 3-4 Input 2 L/R, 5-6 Microphone
  *
-- 
2.47.3

