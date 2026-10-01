Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856E35208D3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866084; cv=none; b=aiMTo1G+ChRJMuUYCaxUEkqW8UqIexmdaChqZgebtXKcpg7aqaYD9n1Ef2uuAfHn/ICOgW/HdEpOJef0tWC0I1R0s3/F77IytYFjKnhio6UIgBxQGOgGcqXkhk0BgG1SU7ZB0t5bfephAtGoJn91IWRj8a36/Vkb3Vg24YFE7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866084; c=relaxed/simple;
	bh=rK0uz/KSkFjE1x+MXlOe6fim8a3tw/1d0l+5isYZhlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmD0dcvqb4Wvo42jTDQIkgiRNzvKkhesM8HZa7pux6gvWySCJWA5Q2Uu/OF+rf35ANVj1ApAvQofoK643CL2SfSNHCdMHzePXbTKTAiOo7GagUaMl5rT+ji7iZjtFgbh0qc1fv/glZuzT9xFrwu7uz/KFDR5tNBgWRF05QZzprY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfoPka6L; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfoPka6L"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso59395721fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866078; x=1791470878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FOj1RGK/mRk1UhJU2+5CuBy3GqPCpS4tTpMqltPtOA=;
        b=CfoPka6LNgH6fX3A9a5+O26ytPhKIxp4IxTWSsjpnkAKmmvQ4CSyTtp2PJ7uo5dQHo
         hzZ0ABXnIy0A2UmgbrA02FXAEgTBktGheQ3LYD0CI/VualuSksb2ZBKLVqYRo1MpcsBa
         ZshPZIs+gkemwLZUqVcnxeX2FUliHszyD2jmAIEmQDt4mOAbfDwh/nLmmKUETFTXATRd
         LZnQfLF7BWLYiBshtHx8CfRz7tgY48/T6hzqGqEDP+entcr2ZSDRiGgCV7bTDkTS9HxQ
         Z1MY1deL2KOUEg8CNHllPcsS2ig6ZyufCsqAGPDgcwdvjWlK3kHairqD/NXsWAsNqedj
         MORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866078; x=1791470878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FOj1RGK/mRk1UhJU2+5CuBy3GqPCpS4tTpMqltPtOA=;
        b=2akMN5VTy+hVfio3xIQDfqxaTxevTR1aMiYSbliVEoRLOOO1hlP5Ki1ZpSlJbuRoRZ
         U+GlmuJ2UfAhiKIWbVIpnudVkZLYJ9ACLBEhUJ6HDMOLu88gY/oTCnJUk/hBkwcZ3PZ9
         HTSM0M5Etop+rCvuAMJg80P6m8xuaC66OfQttrRuOshMZnD5fkPN5d1Zrf/opJa/BqfU
         uXPUhL1nlMH/P5A4Ib0uEjo1fst9+kh1f8hePt5aAsP75Y+9XZsmPBNP1VKOZUfrkEHS
         47TqQFZHVYJsuvVVoRaddgzGvdG4jhX/KM6ecElsulxDfJ6e4hcahI9nqICCJMHE5UQ7
         4F+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwfQINaMpSC2wZaFsCBCGzK6y4rfr04aB55NGAwPmL+StcGpQowKkCxrlns2BLWYK71ANR7pxYGAbT/kc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5YOMYP6I46nx5flB5/n5SqzoXoyvC/ob8RxWBEWgbVDuTkZiG
	quHuXFa4rvTArNsVj8pLyV0+iL0AS/tY2KfLwh+hmCQngA9TMF0Td4ex
X-Gm-Gg: AYBFou1eNmshjABZ+QjuvNs1fwqfvd0/UtK3wL1f+Iri2IQIuMNvNvKK+4ELXwGPNZ5
	EpEUKHXaVDmltltudQDGt9+KXW1UoVrSe7JNXzRLFu1PzdG09qTX2pTJevyUtKHclIwE7kqd9rZ
	z+oViKLlN4+TbpnlUpYYBVgC3A+aoHE29sYRYbFNVlOGBLrOK0SqlYf5+L5CISKJZ4bhhTdOgsH
	8OK2Nlpg8m7qkkHeU1m7IkqLSX2DI3kqHFALN+KP498PRStNhRl245xLvXJLZEU1sM8HbvItlkm
	22PRtf6lFIjmn3FHUJu3dtmLpEtBAUTTRU5NGcX6YhhwIHxRb+t/ExMASGCTDuYuPqXsVsW7I4F
	s/mLLVWBO8w9MYN/KfgJfOz2T0tCIGcuh5A6Xe+U3nTM8jdMXWrP8GoPIDWSGF4uw9OEE0xpCXS
	/kKnutiwOCo6ncvxNBBtusjZErKOTd+YwcXvs15z/Pq16NmttXEk/pA6GhDIBuCOBJ4lJwhtZnA
	d56HBBRWoA=
X-Received: by 2002:a05:651c:41d5:b0:3a7:72ec:81aa with SMTP id 38308e7fff4ca-3a779207c3dmr16366201fa.28.1790866077663;
        Thu, 01 Oct 2026 07:47:57 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87cfec0efsm918191fa.17.2026.10.01.07.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:47:57 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Qiling Zhu <kmatzkaczor244@gmail.com>
Cc: Ruslan Koreev <koreev.r@gmail.com>,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pm@petermarshall.ca
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Date: Thu,  1 Oct 2026 17:47:47 +0300
Message-ID: <20261001144747.1167917-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aru5-aq_sPUDy8dq@ThinkPad>
References: <20260924171820.1179823-1-koreev.r@gmail.com> <20260924171820.1179823-5-koreev.r@gmail.com> <arY2CULvwXGyVvH_@kekkonen.localdomain> <20260929092238.1765758-1-koreev.r@gmail.com> <aru5-aq_sPUDy8dq@ThinkPad>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Qiling,

On Tue, Sep 29, 2026 at 09:25:39PM +0800, Qiling Zhu wrote:
> Since you reported successful plain-V4L2 Y10/Y10P streaming on
> next-20260924, could you share the exact media-ctl/v4l2-ctl commands
> and any setup performed before STREAMON?

I tested on next-20260924 with intel-ipu6 bound to 8086:b05d and v1
patches 1-3, with the vd55g1 changes reworked for v2. Before the plain
V4L2 test, I ran the following with libcamera 0.7.2:

  cam -l
  timeout 30 cam -c '\_SB_.LNK1' -C5 -s width=804,height=704

That captured five frames at 804x704 R8. Afterwards, media-ctl -p
showed Y8_1X8/804x704 on sensor pad 0 and CSI2 pads 0 and 1. The sensor
link was enabled and immutable, and this capture link was enabled:

  "Intel IPU6 CSI2 2":1 -> "Intel IPU6 ISYS Capture 16":0

I did not enable any links manually. I have not repeated this sequence
from a fresh boot using only media-ctl and v4l2-ctl, so the prior
libcamera setup is relevant to reproducing my test.

For each format, I ran these commands first:

  sudo media-ctl -V '"vd55g1 1-0010":0 [fmt:Y10_1X10/804x704]'
  sudo media-ctl -V '"Intel IPU6 CSI2 2":0 [fmt:Y10_1X10/804x704]'
  sudo media-ctl -V '"Intel IPU6 CSI2 2":1 [fmt:Y10_1X10/804x704]'

Then, for Y10 (with the trailing space in the FourCC):

  sudo v4l2-ctl -d /dev/video16 --set-fmt-video \
    'width=804,height=704,pixelformat=Y10 '
  sudo v4l2-ctl -d /dev/video16 --get-fmt-video
  sudo timeout 20 v4l2-ctl -d /dev/video16 --stream-mmap=4 \
    --stream-count=5 --stream-to=/tmp/ir-Y10.raw

I repeated the three media-ctl commands, then used:

  sudo v4l2-ctl -d /dev/video16 --set-fmt-video \
    'width=804,height=704,pixelformat=Y10P'
  sudo v4l2-ctl -d /dev/video16 --get-fmt-video
  sudo timeout 20 v4l2-ctl -d /dev/video16 --stream-mmap=4 \
    --stream-count=5 --stream-to=/tmp/ir-Y10P.raw

Both Y10 and Y10P captured five frames successfully and the images
looked correct.

I have not tested next-20260928, so I cannot yet explain the EPIPE.
Could you capture media-ctl -p immediately before STREAMON and any
IPU or vd55g1 messages from dmesg after it fails?

Ruslan
