Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A78B26AC3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302773; cv=none; b=r9xmhvyMY9eb34oXOZBUExudDitQWZ6xrObLh6VDfLwgmqvhgJ5dhpnNbx2KzW2aWZa6a7ftuD0y2+JzBy1N7gr1e5aV8lmQBqdvnxfUXJcsz4SuHzvmpPQyl/sWUTfvo7Wavipg46X5/1P2M+LEFDekh+fhGKNpMTZ05QdruhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302773; c=relaxed/simple;
	bh=BVsR/Le3p7XUjNMygmMfdzWGgyiUfG/up2i4TgQQr+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=COkUEm48RxzXABnxOK9cHzyPQFPrUhup36JWXs0T7+ACHRwXhBl5LSpwGk7ETOB9SpQquQQQv7pLuYYZ3++wC8EpjV9oOSfMRPH8R6Oj0nqbZGb/LZ9U0o4drVwGuvd3cPNdHe3QdLOwDsANf1TjarsGTxPPj898a37ttANHKdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzndHdM5; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzndHdM5"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78564319a92so156018137.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790302771; x=1790907571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XpC/TNEC6wqnmlf8h6VzeWNUpPK2sqaQuYRZKFpNrJk=;
        b=CzndHdM5lnVDTQyTyfgznkYwJvCOLOXkOAcw1vVq5nDHWzvgtnmR/2uWA6yxl2bOEl
         zD01oO8Ku51pHVYxPipeeRB5PE4HbL7j4tFy2aa7wXJe5jbMNz4s7jc4Lg7MO5Dc+2Yv
         lG0/4opN56aYYoXxsFPVtmirw7v/wBStwkxhT38/zBWhMWGG3ycjYfG8wmwxSUvLPgZ4
         alMpCI30fXn5ksuo1x9QJi5y3tjsGOsQwvmQFAvToF8X9gr7uAwbHpAHHMzvf4hAOcME
         JWEOTUhwIPivtSnbNLq1XSQTUKyGrnL16L17uhQkDvRvTPDu4Zj+Sc0vUBvso05+JoTH
         edhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790302771; x=1790907571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpC/TNEC6wqnmlf8h6VzeWNUpPK2sqaQuYRZKFpNrJk=;
        b=EIrP7SgvEUjx57FL8W6u/dCgC+eUD9ozEBb3qig56Jo/Im/i4SAOTWGS1cllYwaiGm
         mYGpBLX3ZDV1mXRnGN9wsbv/W2cpUX+rPLMInuzdzf2VvujkDXuowXscbxSsBdUceB+5
         OlfMoRAT+aFH4Nhb9odDcHeAQqeDKKI2DWe6LsnmZjYXx0dlR7atcXblVQdTBywD89yI
         q3l5ryCzrW5WXM51l3SUJaZDohFNXUEPFDK7CNDNXcV7rwE9qISZH1NDNonHp7SX0C70
         L72z4jGo0NrZhd+luBFMKCoHM+Eh1+jdO7B2KxR+AQCUoUB6ihStaYPz6/sDoUuadGe9
         22Xg==
X-Forwarded-Encrypted: i=1; AKwUvByN8P9gZRGTsRSY25xKvaimUaamV0Tgp/ZtrjnCNio7VMw/2KbGU6IB+LJ+tDJygK1IebdrFctI8Mf55bg=@vger.kernel.org
X-Gm-Message-State: AFuF++lgmTn7K0lTEeGINevvPhubjrmZ9PTzoCEhH0GGw/K4aDR0YZ8D
	sDuNA5mBktD69u0FUc6ko0KEhZTK8Ua4Kb+TyBMZSPcdg2S6jNLYDvE4RMzNlE8r
X-Gm-Gg: AYBFou0OfN6SyosfvglUVPiv9zKcu6Nw24wXSnwEy4DxRAY6QaJhClId/YmRB2YvGwb
	q7ZVChkzg++2algxVHZdtoSY2xqDjPkAPFmLRB/Z2b477ZERDFgpOHMud1KhFzf6VxYRtYn6Tyy
	AxA+1BdBjyrsUVOK/Q2gd4WVZymcF4aeD/KawlFRwc/dglhFqZwMge3lkUX+jFNztICsnEMmUAo
	hfLVPIH6QBSRD6WTmXGOhX1IErJ4VchKCGP1ZsGSYVgTxjvCREZIJoYpUN7iiy1mC+XKxsqwM5H
	WYR2zTjNzHBuKQ3vSUJU0ITketnS25nEzHW1XkNg7nKy/SvplLqSIA8dWc6yw6Wd0d+JvBThwfg
	G1lRQKiAt0Pw+SK1Xgv4+TlgcXM/JY6chRhbSt0O0DgV84Aj2q7qf9d6e0y2BAQobeXtEhXUlq/
	p57ultONC+5EdUFlnxZWV4PhvPVLTvFN4AEGM8KD2jJyBz9KLWad4TR8kAp7c0+2n3wxfNP7Fy0
	F/tMrSrdL4Xe/JKjtbSS3MasvmSWn1ILBbqdHSI8qRVs7cqGxyvMmT4COkjYqe6sF6+FsnqMg==
X-Received: by 2002:a05:6102:358d:b0:7a1:f7d2:e843 with SMTP id ada2fe7eead31-7af1e9f2334mr1643487137.19.1790302770980;
        Thu, 24 Sep 2026 19:19:30 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b0d01e6f6fsm1427497137.2.2026.09.24.19.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:19:30 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] ALSA: usb: Add support for Reloop Jockey 3 DJ controllers
Date: Thu, 24 Sep 2026 22:19:13 -0400
Message-ID: <20260925021915.78909-1-fvdpol@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi, Jaroslav, and the ALSA community,

Apologies for the long gap since v3. This is not simply v3 with the review
comments addressed -- I went back to the reverse engineering, and a fair
amount of what came out of it changed the driver structurally.

The patch has grown accordingly: v3 was 8 files and 1613 insertions, this is
17 and 7326.  Most of that is not new logic: of the roughly 5700 added
lines, about 2100 are comments, 1660 are KUnit tests and generated test
vectors for the codec, 249 are the new jockey3.rst documentation, and only
about 1300 are executable code.  The rest is blank lines and Kconfig
plumbing.

The relatively large number of comments comes from the deliberate decision
to include what I learned from the protocol analysis with the relevant
section of code.  The parts that most need explaining (the bit-plane wire
format, device initialization, why the URBs run for the device's whole
lifetime, the locking order etc.) cannot be verified by reading the code
alone.  ploytec_codec.c is over half comment for that reason: the DOC: block
deriving the format from the board's I2S and DMA geometry is effectively the
specification the optimized variants implement.

Previous version:
v3: https://lore.kernel.org/all/20260622011131.1748298-1-fvdpol@gmail.com/

Changes v3 -> v4:

 - Reworked the locking architecture around an explicit hierarchy: a
   process-context rate_mutex outermost, then IRQ-safe leaf spinlocks for
   playback, capture and MIDI that are never nested in one another.
   Documented in jockey3.c.

 - Fixed the capture stall after a sample-rate change, eliminating the USB
   device reset that recovery used to require.  The reset rate per rate
   change went from 19.3% to zero, with a 98k clean streak on arm64 and 61k
   on x86_64.

 - Rewrote the bit-plane codec: a portable reference implementation plus
   32-bit and 64-bit SWAR variants selected at compile time, called through a
   batch API at the driver's real batch sizes. Against the same machine's
   reference build, the optimized path measures 11.0x encode / 7.8x decode on
   x86_64 and 6.9x / 6.1x on arm64. KUnit tests validate all variants against
   an independently derived model of the wire format.

 - Added URB coalescing.  The driver used to submit one 512-byte packet per
   URB, fixing the completion rate at 9923/s at 44.1 kHz and 21600/s at 96
   kHz for as long as the device was plugged in, used or not.  N packets per
   URB (N a power of two, 1 to 8) are now chosen per PCM open from the
   requested period size.

 - Fixed a cold-boot initialization race. Straight after power-on the device
   accepts the entire init sequence, reports success on every transfer, takes
   playback samples, but its audio engine never starts. Bisected over 100
   cold boots to between 144 and 156 ms after enumeration; the driver now
   waits 250 ms before its first control transfer, close to the 297-308 ms
   the Windows driver waits.

 - Added a URB liveness watchdog. Every error path hangs off a URB
   completion, so a device that stops completing URBs produces no error, no
   xrun and no log line. A work item now reports either direction silent for
   20 ms and enters the recovery ladder on a stall onset.

 - Hardened handling of an unresponsive device: an EP0 error-class predicate
   aborts the handshake before usb_set_interface() is reached, since the USB
   core disables an interface's endpoints as its first action and does not
   re-enable them on the failure return.

 - Added Documentation/sound/cards/jockey3.rst

 - Addressed the v3 review comments.


Testing:

Validated with an automated hardware-in-the-loop framework written for the
purpose: probe and unbind endurance, PCM cycling, every rate in both
directions, period and buffer boundary matrices, duplex, xrun injection,
rate-change soaks, suspend/resume, USB disconnects via hub port power
switching, and cold-boot cycling through a network-controlled mains switch. 
Some of the figures above come from runs of tens of thousands of iterations.

Exercised on real hardware on x86_64, i386, arm64 (Raspberry Pi 4) and
armv6/armhf (Raspberry Pi 1B -- functional but tight at 88.2/96 kHz), with
x86_64 and arm64 also run under a KASAN + lockdep debug kernel.  The codec
KUnit suite additionally tested under UML and QEMU on i386, arm, arm64,
riscv and s390 (test big/little endianness).


Two things I would rather state than have found:

 - The mitigation stack around the rate-change stall is now practically
   dormant since the rate-change improvement.  I kept it as cheap insurance;
   happy to remove it.

 - The 250 ms settling delay in jockey3_initialize() runs on the
   USB hub thread.  I can move initialization off the probe path if you
   prefer, though that introduces complexity to avoid races.


I look forward to your review/feedback.

Best regards,
Frank

Frank van de Pol (1):
  ALSA: usb: Add support for Reloop Jockey 3 DJ controllers

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

-- 
2.47.3

