Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719E4E5333
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731612; cv=none; b=aDvL9MnJJsS1foAStIF4xQBEApIfJbcsGMt9NP9uzQeNOdHSSWvA/w+J/U5JwAG9m5MfyMPYmEXyOHbcGwod52TrSKjZxXfyKYv2Rsj4aD5XY9w2C/Gvia0Jkb1ra87C9EbsNIUeiXK5BUjT88wwqPOYXV9Iy7mOmzkTSArZ6V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731612; c=relaxed/simple;
	bh=NFq/ORDv0EsGWsVuD2BnI4fsR3j3kcvEbwoQhpYcIRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EomAl8AAFUhYjAXu7p1wnD8oGhAlLncKYFbCLzR/B6INMaRNZg1dA3IVCLxvBcSaoWYB1InVCMLrQl9BGlQt04bC3VaN/YCM2YaKVXRo0fKOJVCdEul6JUp2FbBgZ+itactq8da03dJUfr8lckPojKshDv04hk42cAmYJeeAw9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnK1pZL7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnK1pZL7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so3580495e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731607; x=1790336407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiDFw1S2S74vveLQbv9MRD/hk0Vu5zo9M6Dha/2hXjM=;
        b=fnK1pZL7b6D7nx2nD/ani5UZ5cwQ1RmD9Bn3N0DdHsLJVbIPn+NTvjQEeU573b++WG
         igWvh3WQQkFQ4Sxft2JkQr7XZtEGjg3slwU9ZxZP0kdp+KW2jhUiV9jTMU7pCGaeYgIO
         Lth49sDgSH27Q1oBnwesmCAdmIuMfnGJDQydSxizyMlIiL3LRTJxQkB6sHMCI60NAucd
         E3G41NM43+A2FOYCrrxfOQxw9cJuHL+QyocZiyt1ZmvXfXTRcWV1U64490X0wvtu+0Bt
         30GixoJJHL8G3r4Whert4yKBV71n3aab3ZgokpViACXPlcKqsqZegPxEsfSiDDLhjJK9
         WR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731607; x=1790336407;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UiDFw1S2S74vveLQbv9MRD/hk0Vu5zo9M6Dha/2hXjM=;
        b=KOOEl+fxOXYmdLjNavvqzurxcRQOt2DZS1PLMq5YcGgnlT8ucvewZSY3PNjN5jL/vQ
         0/2fkS/rT+cdxPLmDNB7925kpNNa2frLpy+yLaMaCtUYj1DYFW/Cdn2fhvye4Ftdco9M
         +AgwrP0JBxJDhagncQRmQZCFtdla01nIPJt5oloihPtsKhddd8UiyucL5u55OO9CGEsZ
         b4GO6uQ4id8l+C8cL+YFjjvh3LmCX9OvWumd8ka4kjEbe1E8ep7/GPBBEszLwfHp1G77
         Dfq0T1+Ut7lfOcwO13fPpCLJHThsS+07o7rg42SSnBUA+Cm4ef2rrslKq6kSZdi2Aggw
         9nxA==
X-Forwarded-Encrypted: i=1; AKwUvBxBgxMd5Q44nRX2csfQbllg6q92mJmRFSPDTsOXNYOEw759qjyQjgwYfXhxZLBPhmxhgc+6RL8k/lkDzcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kcMPF0ItDninddjrLYP/qfbnnYEp73qBneg3oN9ue2+eDLwAQY
	M4X6hbZkCizNjeiPfcurLBNMsLxs54sRsDsWaPVbDuMMporktOEICwU/
X-Gm-Gg: AYBFou0mZn24u44oIuvBxUbGYvkqHgNo6n88Vebm0sia0viJ94ixqCMH4wfLuI/zvfy
	oxvdCLJOEdy06Hn/JXbI99AcTwiGL+GmQ5r6+P8Uy/cM2iRwjvcZ/AO3CZ5JFJw+H1tLQK926o9
	yr3nb7+KZxXYm9H7+ISW0PTABKURrKyCT66PHLADh4oJJuRLhETApDCS6MpO4e7UjMnT+CeblaF
	k5yLgvxurjouwmIJAnvkmE69rCOvumajEQEVF77bMKaWXeClzcvKhDYnNqp1RyvDzjeajiqaCu9
	1Fs4hmefYr0fsZVmGpYLoToqlllRe9xzdaPAlNbW4S+MViZ5rjj3FCO5Buqr92kevrKpZ0qP5Ov
	3n+I1tNwfmnzOYb82tgFp6sVIkP9LoWmm0G94yOLztVzhRrLVEL8c5eHOC6nPXfMFx9ztGKjCYQ
	4523trAy/EqRXUdvhK9LfQdAAGzyHbTTG2lfQkLlRIN1G9Z1bQau1L+pMB6oe4WY+NaIev5KYgK
	hkG092l454Hb9UtthiSVDccbZk=
X-Received: by 2002:a05:600c:674f:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49fc56dbcb5mr27111915e9.3.1789731606450;
        Fri, 18 Sep 2026 04:40:06 -0700 (PDT)
Received: from cachyos ([41.143.99.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5636sm3734893f8f.5.2026.09.18.04.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:40:05 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [RFC PATCH v5 0/8] ALSA: usb: add RME Babyface Pro driver (proprietary mode)
Date: Fri, 18 Sep 2026 12:39:36 +0100
Message-ID: <20260918113944.76871-1-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

This is v5, re-split per your v4 review: still too coarse, start with
a minimalistic core (probe/disconnect/PCM only), add mixers
piece-by-piece, suspend/resume near the end, and add proper "big
picture" documentation for human reviewers.

Beyond the restructuring, this revision also folds in three
hardware-verified fixes found by a contributor (David Fredman,
credited per-patch via Co-developed-by/Signed-off-by) since v4 went
out:

 - The sample rate is now set through the family register the
   firmware actually keys off, rather than the previous approach,
   which could leave the device on the wrong rate after certain
   family transitions. A running stream also now locks the rate: a
   second client asking for a conflicting rate is refused at
   hw_params rather than silently retuning a live stream out from
   under it (patches 1, 2, 4).

 - The front-panel OUT selector's base-mode decode (Ch 1/2 vs Phones
   vs Opt) was wrong on selector values 0/1/2, corrected against the
   physical LEDs on both a non-FS unit and the Pro FS (patch 6).

 - Turning the front-panel wheel with OUT selected produced audible
   zipper noise: the firmware moves the analog output level itself on
   each click with its own ~12 ms smoothing, and the driver was also
   writing the analog (8-bit) master on every poll from a flat
   1 dB/click count, fighting the firmware's own move each time. The
   driver now writes only the digital (16-bit) master during the
   gesture, follows the firmware's actual level- and speed-dependent
   step size, and reconciles the real master once the wheel is at
   rest, the way TotalMix does (patch 6).

Every patch was built in-tree on its own against next-20260911 and is
checkpatch --strict clean of errors; five WARNING-level notices remain
across the series when checkpatch is run against the patch files
themselves (the same two `ang` "misspellings" in the EQ patch noted in
v4, plus one new `retuned` "misspelling" from the rate fix above -
all three are correctly spelled, BIT() is separately declined as a
CHECK in the EQ patch because it returns unsigned long, wrong for that
file's signed Q27 fixed-point math - and two routine "does MAINTAINERS
need updating?" reminders on the patches that add files, answered
once in patch 1's
MAINTAINERS entry for the whole series).

How this v5 is split, and why:

 1. Core: probe, disconnect, PCM stream only. No mixer, no front
    panel, no DSP EQ, no suspend/resume. This alone is a working
    (if silent, no routing yet) capture/playback driver.

 2. Output masters + the crosspoint routing matrix, together: a
    driver with masters but no routing would still be silent, since
    the factory-default routing this patch also adds is what actually
    connects a source to an output. This is the first patch that
    produces controllable, audible output.

 3. Mic preamp: phantom power, pad, instrument ref level, the four
    gains, plus phase/stereo-split/trim (input-strip controls layered
    on the crosspoint registers the previous patch introduced).

 4. Routing flags and varispeed pitch, together: loopback, AN 1>2,
    sample clock source, AN1/2 link, MS processor, DIM, width, FX
    send, and pitch. These started life as one function registering
    all of them in a single pass; splitting pitch out on its own would
    have meant an artificial function split with no real benefit.

 5. S3 suspend/resume.

 6. The front-panel poll and controls (buttons, wheel, IN/OUT/SELECT,
    MIX, DIM) plus the host-side emulation of TotalMix's own role for
    the wheel/button behaviour.

 7. The hardware 3-band + low-cut DSP EQ.

 8. A new documentation patch (Documentation/sound/cards/
    babyface-pro.rst): why the proprietary mode needs a standalone
    driver, the vendor protocol's write-only/no-readback shape, the
    asynchronous stream model, why mixer state has to be cached and
    replayed, and why the driver emulates TotalMix for the front
    panel. This is meant to give a reviewer the big picture before
    reading patches 1-7, not to restate what their own commit messages
    and code comments already cover.

Two places needed real judgement calls rather than a mechanical split
along control names, both explained above and in the affected patches'
own commit messages: masters+crosspoint (patch 2) and flags+pitch
(patch 4) are each one patch instead of further split, because the
underlying code was never separable along those lines without
inventing an artificial seam - the same reasoning v4's own cover
letter gave for not re-splitting the core+mixer patch further at the
time.

Known limitations, unchanged from v4:

 - USB autosuspend is not supported, explicitly disabled at probe.
   S3 suspend/resume works and is tested.

 - A few protocol details remain open (documented, not blocking): the
   preamp readback index semantics, a width strip-ownership edge case,
   whether DIM's scope is reassignable with TotalMix's Main Out
   setting, and the exact high-frequency warping of the EQ
   coefficients against the vendor curve.

 - The latency profile (frames_per_urb, nurbs) is a module parameter,
   not runtime-reconfigurable.

Validation: the same full-duplex rate x period sweep, start/stop
stress, mixer-restore-across-unbind/rebind and mid-stream-disconnect
regression suite as v4, run against the final tree - 40 of 40. Each of
the 8 patches was additionally checked out on its own and built
in-tree, to confirm the split itself introduces no broken intermediate
state. The three fixes above were separately hardware-verified: all
nine rate/family combinations plus varispeed and the rate-lock
refusal (patches 1/2/4); LED-correlated captures of the OUT selector
across both a non-FS unit and the Pro FS (patch 6); and zipper-noise-
free wheel turns against a looped-back level measurement (patch 6) -
each detailed in the affected patch's own commit message.

Disclosure: as with previous versions, the reverse-engineering and
substantial portions of the kernel implementation were written with
heavy assistance from AI coding assistants. All of it was verified by
hand on real hardware; the human authors remain responsible for the
result via Signed-off-by.

Thanks for reading,
Ismaïl

Ismaïl Bahloul (8):
  ALSA: usb: add RME Babyface Pro driver core (probe, PCM stream)
  ALSA: usb: babyfacepro: add output masters and crosspoint routing
  ALSA: usb: babyfacepro: add mic preamp, phantom/pad and input trim
  ALSA: usb: babyfacepro: add routing flags and varispeed pitch
  ALSA: usb: babyfacepro: add S3 suspend/resume
  ALSA: usb: babyfacepro: add the front-panel poll and controls
  ALSA: usb: babyfacepro: add the hardware DSP EQ
  Documentation: sound: add the Babyface Pro proprietary-mode design doc

 Documentation/sound/cards/babyface-pro.rst |  163 +
 Documentation/sound/cards/index.rst        |    1 +
 MAINTAINERS                                |    6 +
 sound/usb/Kconfig                          |   20 +
 sound/usb/Makefile                         |    2 +-
 sound/usb/babyfacepro/Makefile             |    4 +
 sound/usb/babyfacepro/babyfacepro-ctl.c    | 3775 ++++++++++++++++++++
 sound/usb/babyfacepro/babyfacepro.c        | 1700 +++++++++
 sound/usb/babyfacepro/babyfacepro.h        |  522 +++
 9 files changed, 6192 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/sound/cards/babyface-pro.rst
 create mode 100644 sound/usb/babyfacepro/Makefile
 create mode 100644 sound/usb/babyfacepro/babyfacepro-ctl.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.h

--
2.55.0

