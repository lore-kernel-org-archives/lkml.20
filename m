Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823801;
	b=kFZLqXoMkyiYp9rMr8TS7x+HmjC6aNOM1AVvTmbWGpABxv5+wygspRst80ZAveCeRtxN
	 /Dl8sU3SoGWag4fAg1k58WiMQD0Y6u88GNKCHoJS3Ab2lAMDkTXHXukuWyEbTL5FqOPTW
	 MY2d3q2Iuz/W1i0PYqSM8PBaDVNFKKx8THlfGwixASDgWpk9SjYFqqxw531E8ENLUQqWv
	 6r1NFjzCFBUFXtYIO834kogacs8Mkww9aPFmYaTcNPAyc9fMVwSYu6BmPvcOBzxqiv2Qr
	 XuLvM3xzBGxxPu7SfkJcPTHG57pKufFsHu5VdCdafSFeKksnT2hSQ5uRCMJeTm+8O3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0j93TeNA9tJq3iswKqqlnki/W9UfBZdAqtf2r5wDRjA=;
	b=z/Q6FX7LDvGXhIc4ACHBd4/C9e7MZNhZxTEy56zHwuKfrs5BHWp+2Y7ShJztFou8HQD2
	 M9eQppa1PmwwtKFzgpNC0g5zQGvA51XZ8D7Jr9YmSK/+q1rb9kpcufR5KMHzCY3VLnkaf
	 yhPMGFrwAggg025Aw1kjC87P5xYG7TOpgGeK7VMfzT01d/cREDLz9jR2hmkExXsTX0S7M
	 +ar0wKJ4Ia57O2n7FEEkjeB0dW16XuBgmvb7VflArYDADCkmumGQgIRY1oWzpVUq5NfV9
	 gj733IC3de8uo/UCWWnJju8ydzxgyH1cPuIx9fHtZbJ+gr+K1nUNpZ+gYkcKZvtkOIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j+TomhfB;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AFC6070307
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AFC6070307
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j+TomhfB
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0d63f60bcso16653767b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823800; x=1794428600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0j93TeNA9tJq3iswKqqlnki/W9UfBZdAqtf2r5wDRjA=;
        b=j+TomhfBAaKVUi75g2hFwXy80DA2hHOKpyyOCjlerB6w7qOvX0K82SYVW0B1OMQZQk
         4seWrqB4v/ga4ZVzEqiXjHqfcj3Tt8FT1j5OQpFmImIc7Jjd/Zx14xvGqsYLYWpHFmFR
         zF1go7sn4Y+Z2dk9BNECnIQhpT6792Q2s8qaSasJbUOL+r9wQ2vur6h9ODHcyEw7hBNR
         xeg3VA8opyCHP208kGs8krToRuYv/U7XZ3Ur681J/lhP3TPzszA87EbuaQSof/gvftqB
         I7CzXRiJi+zGOObGPW+zsQIBYKS4voMPgePcXQQdoqhwCO+tI78RqQfozDv+1qiTvyYd
         eddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823800; x=1794428600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0j93TeNA9tJq3iswKqqlnki/W9UfBZdAqtf2r5wDRjA=;
        b=GKf5tQFHvYjsB4hoWaZ0HcwG2Z0zNmWrpWSh7uVQgX51TVHN2nBRrjKAKY5zDcGgRh
         v1D9/EoKVlir0Q3Xw8G8HNPpYkGtwGkNMAtzLcE5GYoQhyThlm2wZXEOC/Xd0pcTzlgk
         KFfo4InlmwvRZcChE2e3WvHVjV8ZBcOIdZxVXVgUnsZuwZNjbdrN1Fpmw+hANQSDgiJm
         N/JZlBwtBW0jCPo1+E4O7p8q79yf0mqnNGbSDgtJcN6js6Q4cX9ecVMrZ8qpp/2rwBFK
         gD2gdKdGFH7Q+pFH3CeTwwVPAJd/Xk97vQhhSozHfc1nBcjiuffYJi1Tewzz4au85H/9
         1XUA==
X-Forwarded-Encrypted: i=1; AKwUvBz5BKVz8Xgwi9co1CsqmC0bRYj0UxHBfs9Lb45O8HvcHl2Q3QDBr66k4XFxZNAIpu0PnaqClW+6FNod6c4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+s/z/Upv/v8+d6+/77PuoCP34PsFv1B0qkqG4WdKrdF5kUTFv
	hu/nh0GdSWJQzAstrp2FJW/42pH7MxyyWW2B+VdJnHw+X44dG4wPXzaC4++fm9K1StE=
X-Gm-Gg: AYBFou2tnet/PDeFUGSfJBXXbiRsyoEHSdUDnA4dHgLTNCT1UoEDmYe/D7TCnwTMSAQ
	OUAWgoT62EeGmvBxg/tsiZNzqaV0g5PZaqzY0O+7jXObDe4s6VGMS54TgSVn/pOM9267/VdtPUz
	uSp028yLs8VwD1P/7gbBQZaqiAOgcfqqIzgcvBUrMec4o4QV/7BHiHwS5RrzgzHEebhCl5LhIgn
	tUgXjrJ62Wc5zWJ4bzyQHHX4Ag4aZZQtGXy2ke9Ms+F5d4UlFvpEyNf2keFJ7weB5b0/W3rkUCB
	h/FBvQbeK3bK/EoRK49V4skx+XjxR3NwlUcBNBqviWqLm8gCKJoNrkQaQCbxtnpcbwEq6CTEydx
	W++q8l26rP/rNuUE0xzD6JjVcVXBcYTGTFu3WWk0kIkt/Cgsz4h8sOfkXxRFYnbOQghAyBvXOBU
	A0cdOfgvCZWL831EQ6JJHWvv2GA+05VCfdAOeURAyXrVsOcG4nH8CN/CWE7MMAJ/6BwI5JLlt1+
	d8YIvnYp7IQl72HPjj02JitFBdNbWV049qTkDD9++aIuy8if3rC1KQGrmgZSItdX6Z5wfSVExZ3
	J0orAqu9p+wYUpepuTVd2kg4WVw6QHptqpBXZ+mT1m5EPDdYpBm2p9jp8MugETXWB8Cn2bllIOc
	PfaM=
X-Received: by 2002:a05:690e:1686:b0:67b:e1e4:6766 with SMTP id 956f58d0204a3-67be1e46985mr3226996d50.108.1793823799719;
        Wed, 04 Nov 2026 12:23:19 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:19 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: qcom: camss: fixes for SoCs without IOMMU, RDI and CSID1 streaming
Date: Wed,  4 Nov 2026 17:23:09 -0300
Message-Id: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

These fixes came out of bringing up the CAMSS on MSM8226 (Moto G 2013,
"falcon", MT9M114 front camera on RDI), where the CAMSS is not behind an
IOMMU. The MSM8226 support itself will be sent separately; the problems
fixed here are generic.

1. The write masters take one base address per plane, but the buffers
   come from vb2_dma_sg and only the first scatterlist entry is used.
   Without an IOMMU the buffer is physically scattered and the frame is
   written over unrelated memory: on a 1280x960 RAW10 capture only the
   first 656 lines (the first 1 MiB segment) land in the buffer, and the
   device reboots within a few frames. Use vb2_dma_contig when the device is not IOMMU mapped, and
   refuse non contiguous DMA mappings on the vb2_dma_sg path.

2. In frame based (RDI) mode the VFE 4.1 write master buffer size is
   never programmed. Program WR_BUFFER_CFG as the downstream driver does.

3. video_stop_streaming() bails out on -ENOIOCTLCMD from a subdev
   without .s_stream() (e.g. the MT9M114 pixel array), leaving the
   pipeline started and the buffers with the driver: vb2 WARNs and the
   next STREAMON / "media-ctl -r" fail with -EBUSY.

4. csid_set_power() powers up the VFE of the same index as the CSID,
   and fails with -EINVAL when there is none. On MSM8916/MSM8226 (two
   CSIDs, one VFE behind the ISPIF) streaming from CSID1 fails with
   "Failed to power up pipeline: -22". Skip the VFE power up there.

Build tested (W=1) on next-20261104 for ARM with COMPILE_TEST.

Runtime tested on the MSM8226 (Moto G 2013) with the same changes applied
to a 6.16 based kernel, not yet on linux-next: on the rear AR0543 (RAW10
1280x960, CSIPHY0) every buffer gets exactly sizeimage bytes and nothing
past it, and STREAMOFF/STREAMON and "media-ctl -r" work repeatedly. On the
front MT9M114 (UYVY) the first frame after STREAMON can still run 128
bytes past sizeimage (one burst); later frames are exact. Patch 1 alone
already stops the memory corruption.

Allan Siriani (4):
  media: qcom: camss: use contiguous buffers when there is no IOMMU
  media: qcom: camss: vfe-4-1: program the RDI write master buffer size
  media: qcom: camss: always stop the pipeline in stop_streaming
  media: qcom: camss: do not fail CSID power up without a matching VFE

 drivers/media/platform/qcom/camss/Kconfig     |  1 +
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 34 +++++++-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 +-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 +-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 +-
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 +-
 .../media/platform/qcom/camss/camss-video.c   | 78 ++++++++++++++++---
 drivers/media/platform/qcom/camss/camss.c     | 17 ++--
 8 files changed, 115 insertions(+), 29 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.43.0

