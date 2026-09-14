Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C208036F8F2;
	Mon, 14 Sep 2026 05:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789362546; cv=none; b=aSOLA7TdMfNzDaSP2Dh/p4aPa0d+iHYLSjKngpWmVRGScNfnSBlJL0XjEetmRACH8YmmOb9s1psNgkpHz5dizJfqcZbFVpq8fWTbxmbGJGVqTLiu8MuiwQqRKi1zvn7r2Z3X8621F0imDTmmv6RkqAc6UmemLw2MPazVbIX4Zjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789362546; c=relaxed/simple;
	bh=70YD57mbirpyHwYQf7ha1K1W9GCri+HWZyovgesFQg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dq/KKv3kYNCc7UrEy4XTe+2fUF26kFO0AQsNNhRNsiq+WSAK3kxkJf0qMBdFEl7Kk/c9XQyaDt/9YNOfpjuxOCJBVqffV1HcWSWWxpBP1/pDwKpfH1WVNT2EvmOTrcg/x8UEKDHzj1zMGZXWOD9QomOgEWDME9WJdNpuMA2fgDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CuKDGhNY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CuKDGhNY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Lgpe3+Dctt1tXSKRidpe9Ch4sSV5QnWgNYvyQOPFvOc=; b=CuKDGhNY5kju0scDqWYmYht9xm
	y4t1Yui1hE6pYXBU9YL2PE+V/HFGia5yR6HW5OuODLPwt1Vlu25YsVbD4tZcSSEL3j/sLKpkyw1Ye
	3XRymPK2sZJnW2vsVdudQz7K6KotAzP+JRedSugFXdqrdFhlyjspW/uHGRfwGywD+ke3E7iPTw2ax
	kJ9G2KwsbjTFGcyVjM2cY9sNDZU2y2lof+CQuzyeTwKllyH46PGmE8Xppdl0iytmMrh27TA3lBkWz
	CZmECJrxcHVg5JCQsSx76fD17HhoAqGwAo8tqDj/fGc+Cwi1F2WKXlAMZAPv4XMmEOwvTkioQSMGb
	W0hAghPQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yw9-00000002M5t-0wHM;
	Mon, 14 Sep 2026 05:09:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] docs: sound: hdspm: clean up driver doc.
Date: Sun, 13 Sep 2026 22:09:00 -0700
Message-ID: <20260914050900.1312415-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do some overall document cleanups:

- add driver name for clarification
- fix some punctuation issues
- correct some capitalization
- correct some grammar
- convert a few words from German to English
- eliminate double use of "note:"
- unindent Precise Pointer bullets so that they are not part of the Hint

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Question: Is the precise_ptr documentation applicable to this driver?
	Is preceise_ptr used in this driver? Not that I can see.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org

 Documentation/sound/cards/hdspm.rst |   94 +++++++++++++-------------
 1 file changed, 48 insertions(+), 46 deletions(-)

--- linux-next-20260911.orig/Documentation/sound/cards/hdspm.rst
+++ linux-next-20260911/Documentation/sound/cards/hdspm.rst
@@ -6,9 +6,11 @@ Software Interface ALSA-DSP MADI Driver
 
 2004 - winfried ritsch
 
+driver name - snd-hdspm
+
 
 Full functionality has been added to the driver. Since some of
-the Controls and startup-options  are ALSA-Standard and only the
+the Controls and startup options are ALSA-Standard, only the
 special Controls are described and discussed below.
 
 
@@ -18,7 +20,7 @@ Hardware functionality
 Audio transmission
 ------------------
 
-* number of channels --  depends on transmission mode
+* number of channels -- depends on transmission mode
 
 		The number of channels chosen is from 1..Nmax. The reason to
 		use for a lower number of channels is only resource allocation,
@@ -29,29 +31,29 @@ Audio transmission
 * Single Speed -- 1..64 channels 
 
 .. note::
-		 (Note: Choosing the 56channel mode for transmission or as
+		 Choosing the 56-channel mode for transmission or as
 		 receiver, only 56 are transmitted/received over the MADI, but
 		 all 64 channels are available for the mixer, so channel count
-		 for the driver)
+		 for the driver.
 
 * Double Speed -- 1..32 channels
 
 .. note::
-		 Note: Choosing the 56-channel mode for
-		 transmission/receive-mode , only 28 are transmitted/received
+		 Choosing the 56-channel mode for
+		 transmission/receive-mode, only 28 are transmitted/received
 		 over the MADI, but all 32 channels are available for the mixer,
-		 so channel count for the driver
+		 so channel count for the driver.
 
 
 * Quad Speed -- 1..16 channels 
 
 .. note::
 		 Choosing the 56-channel mode for
-		 transmission/receive-mode , only 14 are transmitted/received
+		 transmission/receive-mode, only 14 are transmitted/received
 		 over the MADI, but all 16 channels are available for the mixer,
-		 so channel count for the driver
+		 so channel count for the driver.
 
-* Format -- signed 32 Bit Little Endian (SNDRV_PCM_FMTBIT_S32_LE)
+* Format -- signed 32-bit Little Endian (SNDRV_PCM_FMTBIT_S32_LE)
 
 * Sample Rates --
 
@@ -67,12 +69,12 @@ Audio transmission
 
 * fragments -- 2
 
-* Hardware-pointer -- 2 Modi
+* Hardware-pointer -- 2 modes
 
 
 		 The Card supports the readout of the actual Buffer-pointer,
-		 where DMA reads/writes. Since of the bulk mode of PCI it is only
-		 64 Byte accurate. SO it is not really usable for the
+		 where DMA reads/writes. In the bulk mode of PCI it is only
+		 64-byte accurate, so it is not really usable for the
 		 ALSA-mid-level functions (here the buffer-ID gives a better
 		 result), but if MMAP is used by the application. Therefore it
 		 can be configured at load-time with the parameter
@@ -80,16 +82,16 @@ Audio transmission
 
 
 .. hint::
-		 (Hint: Experimenting I found that the pointer is maximum 64 to
+		 (Experimenting I found that the pointer is maximum 64 to
 		 large never to small. So if you subtract 64 you always have a
 		 safe pointer for writing, which is used on this mode inside
-		 ALSA. In theory now you can get now a latency as low as 16
+		 ALSA. In theory now you can get a latency as low as 16
 		 Samples, which is a quarter of the interrupt possibilities.)
 
-   * Precise Pointer -- off
+* Precise Pointer -- off
 					interrupt used for pointer-calculation
 				
-   * Precise Pointer -- on
+* Precise Pointer -- on
 					hardware pointer used.
 
 Controller
@@ -104,7 +106,7 @@ hwdep-interface.
 Also all 128+256 Peak and RMS-Meter can be accessed via the
 hwdep-interface. Since it could be a performance problem always
 copying and converting Peak and RMS-Levels even if you just need
-one, I decided to export the hardware structure, so that of
+one, I decided to export the hardware structure, so that if
 needed some driver-guru can implement a memory-mapping of mixer
 or peak-meters over ioctl, or also to do only copying and no
 conversion. A test-application shows the usage of the controller.
@@ -112,9 +114,9 @@ conversion. A test-application shows the
 * Latency Controls --- not implemented !!!
 
 .. note::
-	   Note: Within the windows-driver the latency is accessible of a
-	   control-panel, but buffer-sizes are controlled with ALSA from
-	   hwparams-calls and should not be changed in run-state, I did not
+	   Within the Windows driver the latency is accessible via
+	   Control Panel, but buffer sizes are controlled with ALSA from
+	   hwparams calls and should not be changed in run-state. I did not
 	   implement it here.
 
 
@@ -127,12 +129,12 @@ conversion. A test-application shows the
   * Values -- "Master" "Slave"
 
 .. note::
-		  !!!! This is a hardware-function but is in conflict with the
-		  Clock-source controller, which is a kind of ALSA-standard. I
+		  !!!! This is a hardware function but is in conflict with the
+		  Clock-source controller, which is a kind of ALSA-standard. It
 		  makes sense to set the card to a special mode (master at some
-		  frequency or slave), since even not using an Audio-application
+		  frequency or slave), since even not using an Audio application
 		  a studio should have working synchronisations setup. So use
-		  Clock-source-controller instead !!!!
+		  Clock-source controller instead !!!!
 
 * Clock Source  
 
@@ -145,11 +147,11 @@ conversion. A test-application shows the
     "Internal 96.0 kHz"
 
 		 Choose between Master at a specific Frequency and so also the
-		 Speed-mode or Slave (Autosync). Also see  "Preferred Sync Ref"
+		 Speed-mode or Slave (Autosync). Also see "Preferred Sync Ref".
 
 .. warning::
-       !!!! This is no pure hardware function but was implemented by
-       ALSA by some ALSA-drivers before, so I use it also. !!!
+       !!!! This is not a pure hardware function but was implemented by
+       ALSA by some ALSA drivers before, so I use it also. !!!
 
 
 * Preferred Sync Ref
@@ -165,7 +167,7 @@ conversion. A test-application shows the
 		 chosen. If it is not available another is used if possible.
 
 .. note::
-		 Note: Since MADI has a much higher bit-rate than word-clock, the
+		 Since MADI has a much higher bit-rate than word-clock, the
 		 card should synchronise better in MADI Mode. But since the
 		 RME-PLL is very good, there are almost no problems with
 		 word-clock too. I never found a difference.
@@ -179,12 +181,12 @@ conversion. A test-application shows the
 
   * Values -- 0 1
 
-		 Using 64-channel-modus (1) or 56-channel-modus for
+		 Using 64-channel mode (1) or 56-channel mode for
 		 MADI-transmission (0).
 
 
 .. note::
-		 Note: This control is for output only. Input-mode is detected
+		 This control is for output only. Input mode is detected
 		 automatically from hardware sending MADI.
 
 
@@ -200,7 +202,7 @@ conversion. A test-application shows the
 		 Don't use to lower 5 Audio-bits on AES as additional Bits.
         
 
-* Safe Mode oder Auto Input
+* Safe Mode or Auto Input
 
   * Name -- "Safe Mode"
 
@@ -222,7 +224,7 @@ conversion. A test-application shows the
   * Values -- optical coaxial
 
 
-		 Choosing the Input, optical or coaxial. If Safe-mode is active,
+		 Choosing the Input, optical or coaxial. If Safe mode is active,
 		 this is the preferred Input.
 
 Mixer
@@ -240,7 +242,7 @@ Mixer
 		 Here as a first value the channel-index is taken to get/set the
 		 corresponding mixer channel, where 0-63 are the input to output
 		 fader and 64-127 the playback to outputs fader. Value 0
-		 is channel muted 0 and 32768 an amplification of  1.
+		 is channel muted 0 and 32768 an amplification of 1.
 
 * Chn 1-64
 
@@ -250,14 +252,14 @@ Mixer
 
 * Line Out
 
-  * Name  -- "Line Out"
+  * Name -- "Line Out"
 
   * Access -- Read Write
 
   * Values -- 0 1
 
 		 Switching on and off the analog out, which has nothing to do
-		 with mixing or routing. the analog outs reflects channel 63,64.
+		 with mixing or routing. The analog outs reflects channel 63,64.
 
 
 Information (only read access)
@@ -280,7 +282,7 @@ Information (only read access)
 
 
 		 Should be "Autosync Rate", but Name used is
-		 ALSA-Scheme. External Sample frequency liked used on Autosync is
+		 ALSA-Scheme. External Sample frequency like used on Autosync is
 		 reported.
 
 
@@ -315,19 +317,19 @@ Information (only read access)
 
 		 Sync-Reference is either "WordClock", "MADI" or none.
 
-* RX 64ch --- noch nicht implementiert
+* RX 64ch --- not yet implemented
 
-       MADI-Receiver is in 64 channel mode oder 56 channel mode.
+       MADI-Receiver is in 64-channel mode or 56-channel mode.
 
 
-* AB_inp   --- not tested 
+* AB_inp --- not tested
 
 		 Used input for Auto-Input.
 
 
 * actual Buffer Position --- not implemented
 
-	   !!! this is a ALSA internal function, so no control is used !!!
+	   !!! This is an ALSA internal function, so no control is used !!!
 
 
 
@@ -357,17 +359,17 @@ Calling Parameter
      Enable precise pointer, or disable.
 
 .. note::
-     note: Use only when the application supports this (which is a special case).
+     Use only when the application supports this (which is a special case).
 
 * line_outs_monitor int array (min = 1, max = 8)
 
      Send playback streams to analog outs by default.
 
 .. note::
-	  note: each playback channel is mixed to the same numbered output
+	  Each playback channel is mixed to the same numbered output
 	  channel (routed). This is against the ALSA-convention, where all
 	  channels have to be muted on after loading the driver, but was
-	  used before on other cards, so i historically use it again)
+	  used before on other cards, so I historically use it again.
 
 
 
@@ -375,5 +377,5 @@ Calling Parameter
 
      Enable Analog Out on Channel 63/64 by default.
 
-.. note ::
-      note: here the analog output is enabled (but not routed).
+.. note::
+      Here the analog output is enabled (but not routed).
