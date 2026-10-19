Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431938;
	b=YVgRON4JV9crfkp5beMr0F7m8Ii2mbY2Zaw6RVcYNunnlPqY0r7OqlCqCpjBQM5cYqPx
	 aYAhxAWKd1nQfntbl/NVQcJvd8RKwILnGBEqEkNyr5KfjZp//8rv4LXUqm04QgHfEc6Sx
	 vgyPaYOdVJVroE7i5RFP1eEuH/tHRRf6KADu428wHPdUw/AE3Sn6MrDjIklSZmReav5FE
	 EnDfgsWOamA5Tkt0iudv/+rBpM6FI+NhWRDq0nd2RUKha0HpmNTUFMHPB942ajbh0tmS5
	 t3S3S89cI8ATpzknSZxYl0hD7qyo1wWKVsT1qPmyz3aDAGNf6+5hpl83K4Pd9qe8ZYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hXqq/nZ0t60Ar6bc5ICVeiSDVkpmVqkjWBiJqS1EryU=;
	b=ReBkm1L+YxroIFWR86JFpa7mJPiYn7dAUTms+xkI/az+OV9iHSUCWtT5IrpCSgv89opg
	 FlF+sFMhpVkH1Ouj5xsdz5YMWWi8xG4RHbJF1OpFM7u95M8yCiEpAjYchhqrZLYXeyDXv
	 8ZjZm+W7dxu4D7Iyi2AuJUD5xAAAbIEIvpFCvyv/XiPu8fdU7eYkOp2hPQ1iUErV+9iUR
	 KLaVkiwXTwbyxEeKhL+9h41aZZHIMeb7fdtR7JAsERq9YS+fF28zdBJuMz0X867RQye6k
	 vppgD1AqUEAAVNdl8189CHI9lCIaDjeqMJ1QFfcxYyDy9R6AqRWmKIFP5gDLiRdOV4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K8YyKLK1;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C434606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C434606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K8YyKLK1
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9908c849564so585210241.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431936; x=1793036736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXqq/nZ0t60Ar6bc5ICVeiSDVkpmVqkjWBiJqS1EryU=;
        b=K8YyKLK1CLfPWgTjjhnOu6W5y8FplrxPCkp30dsYFEOJmMVetN9A6B/2hmfI4TYJVv
         gZYlLvziWD78mWu5h/YZae/eJjPPzIRmaOK5aEVdZ/O4/5e0cagXcaMocfczOdFkBjVe
         Nil6o0Ji5VqhO28dZyE9fYLDl9u+UyzmHPR4zQRM32ZFFXGOoNNcOttLBcd0WVdNeJav
         yslOn/f4QizPO58MZQZZrf12r47OkrKe8VGHpn4IXoNMAHIJO4ybYLqxbeVzN2+tpSTZ
         6ym9kNS8CI8BVs4JKskI3zePQL5/HtZGC/CKVdu08pZwL496YIm68ZGNaKbxnmd8Xnho
         92iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431936; x=1793036736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXqq/nZ0t60Ar6bc5ICVeiSDVkpmVqkjWBiJqS1EryU=;
        b=l7e5+3m38m+fc22VvNyQ10iVsUBuzpwETB9FJ14VW+ZvGUM6Kg/H1aZ+d4V/1NqhDP
         mwAmsAw/rHjvEAYmj6kaKpZ3yfBdSSQpDy3LauPVv+oJU2AGac7YvY/zPyDNDowxq818
         yTJt54kjHSYOnTbg2tAMbTWflOHy+UP3FrPRunC3J+5ftt3c3TPkaSUK+oNq6FRkP9H/
         IzbaBsHe5pJe5IDK1uDZcVN6xL3AWlWr+LfDR21MyQEjLN0F/FQpwXE7gE3MdK6lHWQ8
         byY8/K5Lg9H6kGuu55LSV4mij/Zq+Ezy5Zyvvr3PXmMMBkSRg1CJq+tmL/Glax+AEAAc
         SSHQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4xvfLfI3UQD6DbXTypfPzghqoQO8CTjiORBBmFx2cMCRBJht/LV3bPD4n6slKXkHKQqtEn99x7rvMyYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXOZsdMKuoxUAvp0y5SwvZHigxrJmmXjWkgVBv5+f67fx3U8Jo
	SYChF71f/DQQXjhe+0SkPJKQ3G1zjlZ7tpyggscFGJesjFtXtGhXHc20
X-Gm-Gg: AYBFou0xWUeAx7m3GH+lRwoNL+aInKJZM9PdkqsExkJZSqU396eCT10aJCX5Y9GLZf2
	YZptqFZN3wvJmei+DJqGP3pTo9XIhWNCnfd/1VUMDP7igMNcBqfYV4airW3DAfdiq0F5czmZmlL
	y7mV9TW3nARQAo+mqb/lX2O9QLdrkUnfbsS/K+Yf09KrpkWVqedjCtzMNYcoTAp4qOtvHw4etjF
	ecY31cYxCJbIOWRjKRLVVbCrEW5ZOsS3Sa9zOmtRV2nE4Kd52NoYRbZ5XulFrlRf2XivvSvlvoM
	onmAmEXEOrW5f1YzzmzCl7pCQ/0C1b9XdsXezHeLU+X2sQSUhC6++FEK3cS3MJ68uXtbcZ+BXXZ
	V10qlCFiptXaDDnlfjUKt/Sy0hA6JucBm+geEYqdxNKhRA297QcBSxxe2lPbA3xnHsAlhXsWvJK
	YGpPK/1xmTPDe2UNnJ4uo/LE7Kn9PoNlbwe1wujIUmOHCci70uu0/47Xl5Sxq1Xrj8kXnyAkQ2h
	Hts42IUw5XV8WBH5nNFeVQUzaiFXBlWvPPABr5RC/ZkbteJG155oA/hNo4V4Qj67zAhVFwzJTsx
	gJAi5DoOdPXRfmb+yo7wjw17XdmUi3Q=
X-Received: by 2002:a05:6102:3c92:b0:7c2:635a:4f4b with SMTP id ada2fe7eead31-7cc36ae8fc5mr2003635137.29.1792431936410;
        Mon, 19 Oct 2026 10:45:36 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:45:35 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/13] ALSA: jockey3: Add support for Reloop Jockey 3 DJ controllers
Date: Mon, 19 Oct 2026 13:44:32 -0400
Message-ID: <20261019174445.1931263-1-fvdpol@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Hi Takashi, Jaroslav, and the ALSA community,

v5 is v4 split into a series, as Takashi asked. While splitting it,
reviewing each patch on its own turned up a few small opportunities to
harden the driver further. They are listed below and folded into the
patch that introduces the code they touch. Apart from those and the
KUnit fix, the code at the end of the series is the code of v4.

Link: https://lore.kernel.org/all/20260925021915.78909-1-fvdpol@gmail.com/

Changes v4 -> v5:

 - Split the single patch into 13 patches (see below).
 - Move the KUnit batch-equals-single test buffers to the heap. On the
   stack they exceeded -Wframe-larger-than on 32-bit (1440 > 1280 bytes
   on arm-allyesconfig). Reported by the kernel test robot; the fix is in
   patch #5.
   Link: https://lore.kernel.org/all/202609260711.YnOvPZGc-lkp@intel.com/
 - Replace the per-model Assisted-by: lines with a single
   "Assisted-by: LLM" as suggested.
 - Probe (patch 1):
   - initialize fw_version before it is logged;
   - validate the endpoints on altsetting 1 only, the setting the driver
     selects;
   - move the card slot handling out of probe() into helpers;
   - stop the initialization retry loop as soon as EP0 stops answering,
     instead of retrying for ~20 s;
   - free the card with snd_card_free_when_closed() on the probe error
     path, because snd_card_register() can fail after it has created
     device nodes.
 - Ratelimit the short capture URB error (patch 4).
 - Build the codec lookup tables only once (patch 6).
 - Every stall recovery now reports an xrun on both directions,
   including a recovery started from .prepare while the sibling stream
   is running (patch 8).
 - .prepare waits for a recovery that is already in flight before it
   lets a stream start (patch 8).
 - An idle capture stall no longer sets the watchdog's tick rate
   (patch 9).

How the series is split:

   1  probe skeleton: device IDs, endpoint checks, the Ploytec
      initialization handshake, a card with no devices
   2  bulk streams: the three URB rings, running with idle payloads
   3  PCM playback, with the portable encoder
   4  PCM capture, with the portable decoder
   5  KUnit tests for the codec
   6  optimized 64-bit and 32-bit codec variants
   7  several packets per URB optimization
   8  recovery of a stalled stream, and USB reset handling
   9  watchdog for stalls in a running stream
  10  sample rate switching
  11  MIDI
  12  power management
  13  documentation

Takashi's list also named mixer support. The device has no hardware
mixer or volume controls that the driver could expose, so there is no
patch for it. The only control elements are the channel maps, which
arrive with PCM in patches 3 and 4.

Notes on the split:

 - Every patch builds on x86_64, i386, arm64 and armhf clean at W=1,
   and is checkpatch --strict and kernel-doc clean. At W=12 and under
   sparse the only warnings are shadowing reports caused by kernel
   macros: the index[] module parameter shadowing the index() builtin,
   and the __ret locals of the wait_event*() family. The KUnit suite passes at
   every step from patch 5 on, and from patch 6 on that holds for both
   the optimized and the portable codec.
 - From patch 2 on, the driver services all three bulk endpoints.
   Later patches only change what goes into the packets and what is
   taken out of them. I did this because the firmware is sensitive to
   deviations from the vendor sequence, and someone bisecting should be
   able to boot any patch with the device attached.
 - The rate is fixed at 44.1 kHz until patch 10.
 - Two function arguments exist before their second caller, to avoid
   changing signatures inside the series: bounce_alt0 in
   ploytec_initialize_device() (patch 1) and cold_init in the rate
   setting path (patch 2). Both get their other caller in patch 10, and
   the commit messages say so.
 - The comment blocks at the top of jockey3.c (device model, resource
   lifetime, locking) grow with the code they describe.

Testing:

 - The series was tested cumulatively, to check that it is bisectable.
   For each N from 1 to 12, I built the tree with patches 1..N applied,
   loaded the module on x86_64 with the device attached, and ran the
   checks that the functionality present at that point allows: a smoke
   run for patches 1-6, the functional suite for patches 7-12, with an
   operator for the MIDI cases. At every step the device is detected and
   bound without errors, and what a step adds works as described in its
   commit message. Patch 13 is documentation only.
 - These runs are on the final content of each patch, including the
   fixes listed above.

Best regards,
Frank


Frank van de Pol (13):
  ALSA: jockey3: Add probe skeleton for Reloop Jockey 3 DJ controllers
  ALSA: jockey3: Start the bulk streams
  ALSA: jockey3: Add PCM playback
  ALSA: jockey3: Add PCM capture
  ALSA: jockey3: Add KUnit tests for the Ploytec codec
  ALSA: jockey3: Add optimized codec variants
  ALSA: jockey3: Coalesce several packets into one URB
  ALSA: jockey3: Recover a stalled stream
  ALSA: jockey3: Add a watchdog for mid-stream stalls
  ALSA: jockey3: Add sample rate switching
  ALSA: jockey3: Add MIDI support
  ALSA: jockey3: Add power management
  ALSA: jockey3: Add driver documentation

 Documentation/sound/cards/index.rst           |    1 +
 Documentation/sound/cards/jockey3.rst         |  249 +
 MAINTAINERS                                   |    8 +
 sound/usb/Kconfig                             |    1 +
 sound/usb/Makefile                            |    1 +
 sound/usb/jockey3/.kunitconfig                |   13 +
 sound/usb/jockey3/Kconfig                     |   60 +
 sound/usb/jockey3/Makefile                    |    7 +
 sound/usb/jockey3/jockey3.c                   | 4159 +++++++++++++++++
 sound/usb/jockey3/ploytec_codec.c             |  663 +++
 sound/usb/jockey3/ploytec_codec.h             |   44 +
 sound/usb/jockey3/ploytec_codec_kunit.c       |  897 ++++
 .../usb/jockey3/ploytec_codec_test_vectors.h  |  793 ++++
 sound/usb/jockey3/ploytec_midi.c              |   83 +
 sound/usb/jockey3/ploytec_midi.h              |   36 +
 sound/usb/jockey3/ploytec_proto.c             |  365 ++
 sound/usb/jockey3/ploytec_proto.h             |   79 +
 17 files changed, 7459 insertions(+)
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


base-commit: e45d0fad00bacca06a55dee30197367916a85b41
-- 
2.47.3

