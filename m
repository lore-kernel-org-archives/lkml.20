Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997819;
	b=3o8bKC5c7VCX934A6QhkftaELgSfR5hrJKPqd+V2hQXeYH/HpaOxapk+3yVjORXWs6Pz
	 gdPJF8ObAmkuzIt4713C93b85Ncqgwy5Wus9P+bl4Ncwqp9ecUik47lYEvLwlhvKqUFzT
	 y76rAqTYfCGKDusTWWDS8hznUoIgx1T9cBNahWwIgql3KjqhoQ/mOMy+LApskkjVCutm5
	 zNRodS1wgL7aLenkmVyHhxRBmAADrdulrsyaDeVFBIDs7Shz3BXUUec711q2NYF3Xy0CY
	 lv4LTwmDVojiqghiPbGoIQJWDBu0cWbFlmYwANLRqJPK9gGEVuzvwSB60/z6U+g9YQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=la5JkBz59cnp3P5023ODaTDSESIkGfKkM4RUMthzLIM=;
	b=EHbovAF0q7Zg7qDL4LCvJza5c9fsPUcUtm+WkW3fP0ucG2hka4Sbl6fBTID/KNo5Kfrx
	 RcuNT0pQb0pn9I2OHiEu6McDzkBEJuWkulY+VqscM+oCczr9hufaUD5c2xeXTG7xsXAnm
	 jbTrHODarRAfiPhPogioXMEzphdIty5uKFOYLNYPufOWRBoaYsulxDaq3FyYLlSfJZDb4
	 A1Un8IlelJA51BSEoP+U2bk3I3U15ELtwqFQgaQOArjf4WUSlwwSIJZimx4HLG9X2zIAU
	 tAGqTO2LPIRJuUkHsCj8TfsNeakHJhuyPrqQv9SCTaszpSI8v/FPYkV04uwAC/D2O/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hDT0q6q8;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B4606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3B4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hDT0q6q8
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67be5d0e9cbso791129d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793997818; x=1794602618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=la5JkBz59cnp3P5023ODaTDSESIkGfKkM4RUMthzLIM=;
        b=hDT0q6q8FNoa6Yv+ZWt9h39CmBFXjMOOor713234LFMXve0tWXtZJvsc/HxGvEeKEJ
         OYPs0PBdSFXA/pVHmRPaYqcW6+UnYneDXKUzmX9eyvgYqMHaoo+vGwC8fPpjX7auqisi
         plR8PQh/kyl/izooZfUbtoJ52XH+am7fR3mHWILpRFz4xfpNttUyonnpXqcYT9hFX0j8
         BjOMKcW4er1d9fJwQ6uximYnwaXPqK0SqJ0NBE3KvBXaCbEAwP0J8u0yUY+F1PWu5a7M
         d5/XVoMbRegW032a4nDuL8fKXNYTufqEXjOKxnJEMdQ3UNHCDuySZtYKFqfBvi42LoAx
         dJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997818; x=1794602618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=la5JkBz59cnp3P5023ODaTDSESIkGfKkM4RUMthzLIM=;
        b=etvR9YRbIR97RBDK8PhmYZ4OpeAE3fXP3KU6HLX2pyW6+BthiEZE8s7E/edfTeyoDN
         nJDXhdrzrvfLdjbbLMGTb3cI+RUUzDG00Hb92tC31xnf4G40O/RIJRorAdHNFYq8zn7r
         jGUS35fmZ3CHzepJ0OqVNBZ6qqwY2LD/+2UOtXd4RhDGc2D9vyIeiwZ/N2vlxADeP7w+
         zwjYuj6vqXW3nwc4IM2pfqN1tTRp6ntJCbHHR25YNc+OmyGboGLoYoxQfKk0BsTsI6sM
         g7GNgTWSMgDegKPQJABF6kBgEeUdkb/24N8qtKSQ9mi/Pd4EzGInEEGKJr14HLCnCx/4
         iWiQ==
X-Forwarded-Encrypted: i=1; AL+hErGS3fAmAZuhyhnXHDkFTbJanSqUQ7JOA+jxG4JNzwIxYCkeF/RIMOkWpejlZCDWra1CDNirGKBgryjNNLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oyAO+RJn3e0nL2o1Uk1p8lkI9NdLdy2iYVGBIdIBS9FN4zxE4
	xxD54k56TcM9ENgW9xvyXAvRTgfbc+R/DsswRTXdKOE8E9DaQN5icJHx5VVlR/Hsg9Q=
X-Gm-Gg: AYBFou2hGOEkGOhsBFVJFu6ocwlmfgsyodficgoZSRb3XE3yYpVzQcA/HI9nCm0ULdX
	j583ZliAv3HWbbY61VtCI5OYy2wzIqptl3Y6VmcdkNtdqPiMuYTm2//B8IF2WRsNOH091MzBfBN
	3I9D61NDc0ybQVkrqWXfDsexnVxcbnapaAAGUBPhmuf45/xvnaaYqYw+wm23o4eEBMwJLWkPjOS
	YH7bVUYwjtabZmrARRpw36cWiyxNHmHzyRd4nAihyh3Z8nBjoecAX3xRPbkHKaYl65XZkbRM14m
	PRo0PZDOy5lDHkw7lWlK8eiynrxLrIw2WFfD+YP3JFosMscR2lTIigFPxxnq+T5ksw6TRLHWDP8
	tlx5o6nF+iFh4VrkUbNGA5B+Sosg/sNQJq38AvLbT4JRrzEIsU7tDBkVyjwHc/nzog0pMSFyGWg
	sao+xiPtG9hMqRFOzV/xEN0veG5ydqK58lvStSvCfQO9xEtddSRO+TsHJM4KqNFyGnI+I60o9tN
	kV62jwAyzl+tid5Bk0rvPZEfnPwZaQfYfzg7InbyhSgpOSS1z+i4aT8F9g0NDzLGFxoui9owrDA
	pKEQrO9QRigIWjvlmJKUvp4C4hHBuAn6Ioz0VqRmRNMliVDwsuyA2v1GgdG4ea8UnQ==
X-Received: by 2002:a53:c808:0:b0:679:af57:d199 with SMTP id 956f58d0204a3-67c143dfb9amr1130839d50.57.1793997817311;
        Fri, 06 Nov 2026 12:43:37 -0800 (PST)
Received: from carlos-MacBookPro11-2.home.arpa ([181.216.192.12])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c135ada39sm2731818d50.16.2026.11.06.12.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:43:36 -0800 (PST)
From: Carlos Alberto <carlosalberto4ti@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	patrik.r.jakobsson@gmail.com,
	linux-media@vger.kernel.org,
	devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	carlosalberto4ti@gmail.com
Subject: [PATCH 0/2] staging: media: facetimehd: add driver for Apple FaceTime HD camera
Date: Fri,  6 Nov 2026 17:43:27 -0300
Message-ID: <20261106204329.2176266-1-carlosalberto4ti@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This patch series introduces the facetimehd driver to drivers/staging/media/.
The driver supports the Broadcom BCM1570 (PCI ID 14e4:1570) PCIe Image Signal
Processor found in Apple MacBook Pro, MacBook Air, and iMac machines (spanning
generations from 2013 to 2019).

Historically, this driver remained out-of-tree primarily because it lacked a
redistributable firmware binary and relied on extracting proprietary blobs from
macOS recovery packages. We have addressed this blocker by developing OpenFTHD,
a 100% clean-room, open-source firmware (GPL-2.0-only) written in freestanding
C and bare-metal embedded Rust. A separate patch for linux-firmware adds
facetimehd/firmware.bin.

Key capabilities included in this submission:
- Modern V4L2 and videobuf2-dma-sg implementation compatible with Linux 6.12+
  through 7.0+ (removal of deprecated vb2 callbacks).
- Seamless PipeWire and Flatpak streaming via in-page USERPTR offset support
  (programming obj->byte_offset into ISP DMA descriptors) and chained scatterlist
  iteration with for_each_sg().
- Discrete framesize enumeration (1080p, 720p, VGA, QVGA) and matching
  discrete frameintervals for WebRTC, PipeWire, OBS, and browser capture.
- Native V4L2_PIX_FMT_YUYV pixel pipeline with power-of-two 8-pixel macroblock
  stride alignment and immediate Auto White Balance (AWB) on channel start.
- Hardware ePTZ digital zoom (VIDIOC_G_SELECTION / VIDIOC_S_SELECTION for
  V4L2_SEL_TGT_CROP), executing lossless sensor crop without host CPU overhead.
- Auto-Exposure Photometry Metering (V4L2_CID_EXPOSURE_METERING: Average,
  Center-Weighted, Spot, Matrix).
- Wide Dynamic Range / HDR (V4L2_CID_WIDE_DYNAMIC_RANGE) tone adaptation.
- Camera status / privacy indicator LED control (V4L2_CID_ILLUMINATORS_1).
- Runtime module parameters and power profiles (High Performance, Balanced,
  Aggressive Low Power sensor sleep) exposed under /sys/module/facetimehd/parameters/.

The driver has been validated on physical hardware (MacBook Pro Retina 15-inch
Mid 2014, MacBookPro11,2, PCI 03:00.0) running Linux 7.0.0-14-generic,
streaming cleanly at a steady 30.0 fps in both native V4L2 and PipeWire
(GNOME Cheese / Snapshot in Flatpak containers) with zero dropped frames.

Repository & Upstream Pull Request References:
- Out-of-tree repository: https://github.com/patjak/facetimehd
- Tracking Pull Request: https://github.com/patjak/facetimehd/pull/368
- Active branch with test suite: https://github.com/programandosolucoes/facetimehd/tree/linux-6.12-compat
- OpenFTHD clean-room firmware: https://github.com/programandosolucoes/open-fthd-firmware

A TODO file is provided detailing the roadmap for graduating from staging
into drivers/media/pci/facetimehd/.

Carlos Alberto (2):
  staging: media: facetimehd: add driver for Apple FaceTime HD (BCM1570)
    PCIe camera
  staging: media: wire up facetimehd in Kconfig and Makefile

 drivers/staging/media/Kconfig                 |    1 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/facetimehd/Kconfig      |   16 +
 drivers/staging/media/facetimehd/Makefile     |    5 +
 drivers/staging/media/facetimehd/TODO         |   18 +
 .../staging/media/facetimehd/fthd_buffer.c    |  125 ++
 .../staging/media/facetimehd/fthd_buffer.h    |   73 +
 drivers/staging/media/facetimehd/fthd_ddr.c   |  670 ++++++++
 drivers/staging/media/facetimehd/fthd_ddr.h   |   30 +
 .../staging/media/facetimehd/fthd_debugfs.c   |  198 +++
 .../staging/media/facetimehd/fthd_debugfs.h   |   17 +
 drivers/staging/media/facetimehd/fthd_drv.c   |  600 +++++++
 drivers/staging/media/facetimehd/fthd_drv.h   |  133 ++
 drivers/staging/media/facetimehd/fthd_hw.c    |  712 ++++++++
 drivers/staging/media/facetimehd/fthd_hw.h    |  128 ++
 drivers/staging/media/facetimehd/fthd_isp.c   | 1483 +++++++++++++++++
 drivers/staging/media/facetimehd/fthd_isp.h   |  768 +++++++++
 drivers/staging/media/facetimehd/fthd_reg.h   |  184 ++
 .../staging/media/facetimehd/fthd_ringbuf.c   |  135 ++
 .../staging/media/facetimehd/fthd_ringbuf.h   |   44 +
 drivers/staging/media/facetimehd/fthd_v4l2.c  |  881 ++++++++++
 drivers/staging/media/facetimehd/fthd_v4l2.h  |   34 +
 22 files changed, 6256 insertions(+)
 create mode 100644 drivers/staging/media/facetimehd/Kconfig
 create mode 100644 drivers/staging/media/facetimehd/Makefile
 create mode 100644 drivers/staging/media/facetimehd/TODO
 create mode 100644 drivers/staging/media/facetimehd/fthd_buffer.c
 create mode 100644 drivers/staging/media/facetimehd/fthd_buffer.h
 create mode 100644 drivers/staging/media/facetimehd/fthd_ddr.c
 create mode 100644 drivers/staging/media/facetimehd/fthd_ddr.h
 create mode 100644 drivers/staging/media/facetimehd/fthd_debugfs.c
 create mode 100644 drivers/staging/media/facetimehd/fthd_debugfs.h
 create mode 100644 drivers/staging/media/facetimehd/fthd_drv.c
 create mode 100644 drivers/staging/media/facetimehd/fthd_drv.h
 create mode 100644 drivers/staging/media/facetimehd/fthd_hw.c
 create mode 100644 drivers/staging/media/facetimehd/fthd_hw.h
 create mode 100644 drivers/staging/media/facetimehd/fthd_isp.c
 create mode 100644 drivers/staging/media/facetimehd/fthd_isp.h
 create mode 100644 drivers/staging/media/facetimehd/fthd_reg.h
 create mode 100644 drivers/staging/media/facetimehd/fthd_ringbuf.c
 create mode 100644 drivers/staging/media/facetimehd/fthd_ringbuf.h
 create mode 100644 drivers/staging/media/facetimehd/fthd_v4l2.c
 create mode 100644 drivers/staging/media/facetimehd/fthd_v4l2.h

-- 
2.53.0

