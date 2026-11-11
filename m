Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405227;
	b=FUpn8SGlkSmnFkm2TH4XnUhD+n05ZcH3qeXM95+PA+MpmSa/wjdmnCPjUlfL6iRI98/n
	 xAASldl7kQBQxN9WaHWZHqHaraPKe9+q3hxE9FxQjqryeGoeSPBtmlseEU3Sxhdupop9C
	 pLdIjQ3H7crVzDhTot8oI4AmJRNHchkDaur6MWK3YM5Z3y8Pfmyf/3NSJtB0n8Umrs6DO
	 Um/ZD2cNo1lIZ8xDRbhRg5nzo5lsl7UF4e59h9Br9czAePClK2AWUHMllyeBT9L5YZOAL
	 xHe/zHMsKYw3LPA+MH3wJ4KFExAO46K5zOlDCP6CyVyxfBb+YKHpRtKKSO/FvLNZfgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iotswADUSSGHEiRZkFhuYUuQsdnE4S9RnJjUi0KsUEY=;
	b=VKjBORX8cs+7JDrTcyawKm2+e0zCztATvevk0B0tmjun/Cg2ZHQLn4K9XZDdI0hreRXE
	 PcWiWuiSbIXlMEZgf/KtUaP74erPj18HfzL/q6dFffzvfcW/0ZhlJAJej6AarI9Ww1VGm
	 8wjxxDMSSs5dEXYHUwt2csFGYyUSxY7g5XV8d4WXihDmBvRcrdsuIzg7R+eD7vBzXKXNG
	 tFp/M/nguCEZOm7DDG2HBKA9oOlvKeAUwTdHxt6Au/HfAnP7O+f0zkN2tIi1WTESXtZqE
	 goeBrqhkN44WKYCkdoLU0hd+GTerDK7/ap9BGkC1AEIvdttVjxmB8/83vyrTZiZhX8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dQc6Dc1c;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D010606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D010606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dQc6Dc1c
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d2c8141dc6so1738724137.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405225; x=1795010025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iotswADUSSGHEiRZkFhuYUuQsdnE4S9RnJjUi0KsUEY=;
        b=dQc6Dc1cFeh3lUkUO2AOXY93vRxDH1gCO1sr2nYNEGrmlq42lk9DvEjZTgunacCbN9
         R9OBXeINCBjqj6PzOxF455p1WhcfMxvU7UcCKP0xVe6L1F5CbEHd1M6nXWvALtYkacTR
         udtl+zMqaMaTqi6JZXjCqRAViAshVdEZnvj+0vXj8FaxN6Fxjq/DY9vrU/0hx9oxG+KP
         mhz8b/xqit94XezaLxvZuhwx2BmtZbdoJr4c+bPoXpfkBIFJklN82HSNUzDx0sBy7lvS
         ES1sMAms0s/oy+n5HwSttmYDwDkTxplIum2uG7S7tlH9RiQe2CpugSPN09uGmP1cYI7l
         W/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405225; x=1795010025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iotswADUSSGHEiRZkFhuYUuQsdnE4S9RnJjUi0KsUEY=;
        b=QN5YONago9Tfy3zWWTTLtH0a3AWFsp7hSFeeJbAB2W9MTeG4BKvV8kwu6XiZ2mZ5NL
         TRexgCzvMk2v0U56Z4/MFKpu9A6DzTqgdhZdLI0AcmxHDhDKX4FSWajzA9jWKhLmtWqq
         1/vchLgtt1EGQLhG4jSSztcNlyPixhak1cxH5RkYZkR39qFtVoIs8MsIHhUXD9WIydXG
         QFVGIUtsUVZVYBN54axMyY+TShszcnJAGkkrd0lLduNWs5fPONLxferHlrMAKaEM7Lxy
         VQTtk4ud2OH1Je8d1uIzl0YU47g93hlbnS9ia1FG1P4nXuvdVoIOjdKG6tfEyhl/ChDh
         /WBw==
X-Forwarded-Encrypted: i=1; AL+hErH9ZfWd7p3xMlF5yTDPjlK6HkciKI7wYXs2QmIS5jwtfsEjzwKb/h/trDHSiM9GXu3x2CHHGKJuelogkW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yg4ypEHqfjeTGNXvpxevHXrRapjEXirqP4KA2+QWRKXtJFE0W
	Mu8VjKwUtvtgbXd1dTb71ZbpuExVdG8kojOW70x/LyuWn4y9/SePP5jQWprv7mS6lZc=
X-Gm-Gg: AYBFou1/QsbQxj1b9U3SgF7AgMnbKKHsBRYFSOAbTmZh5WCE1xLLKTleQFHZ0+4gKb+
	qiCcn4cuyzWLnoioaq/JOf0DEZVOgEdHNU/hyXUNyJh/ePPXK+nwOdBELTtu8JTOUoXr9kMPy4k
	+m7nkbCjntXn6Oik3oYffRkoFkPLFxoZUVbrnYUd04tO4FUfetsTXuxSv/iFIv+o5xyXBppek84
	+liONc7Uf5NfzOk8ImKZGCvbtJ2AKSN8gxUvOwMgwTFYlOpEneJZI1HViWlV5zkHbq3XYk8PGW5
	Xt9oKbuxvoew18TbczNIsYZpr1lpXGTRUz5k6hGL566QNy1DqqinFJ/bZm6SV+ayoAIqQ9Y9Ggf
	fevdZcue540IJ4kj7rfUI1idI4BLlCiIUoywCFPpTIPB9pRBzAn4oV5tnMshpRmAubcQnWtqJya
	MRSM50c2uCxj/CLdd+K9ZhcE43qFOc3sFZkuJUgkaABwGwttxpGxvCH2KybfJz9HIo+m+VXyvfK
	Nob/PN9T60gsP4CUHsKuDp9c4e4iATrX+rqP4ga88dq+Ap05Oojn+MVonMg0B3rrGpPpgGU3MD4
	Vbfh2HE5WJpLcjtMGrH5c1HTAT8LJk683AyRyg+wBEB018Xb/1amiydELR9UjI+dNtCuPWk6/Jz
	Wj4rh
X-Received: by 2002:a67:e106:0:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d5061cf3a5mr665976137.27.1794405225039;
        Wed, 11 Nov 2026 05:53:45 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:53:44 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] media: qcom: camss: contiguous buffers, RDI and CSID1 streaming fixes
Date: Wed, 11 Nov 2026 10:53:34 -0300
Message-Id: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
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

Fixes found while bringing up the CAMSS on MSM8226 (Moto G 2013). The
SoC has an IOMMU in front of the CAMSS, but it is not described in the
upstream DT, so the CAMSS runs without one there today.

1. Loic's patch: use vb2_dma_contig, the write masters take a single
   address per plane.
2. Program the VFE 4.1 write master buffer size in frame based (RDI)
   mode.
3. Do not abort stop_streaming on -ENOIOCTLCMD from a subdev without
   .s_stream().
4. Do not fail CSID power up when there is no VFE with the same index
   (CSID1 on MSM8916/MSM8226).

Build tested (W=1, LLVM, ARM) on next-20261105, each patch on its own.
Runtime tested on MSM8226 with the same patches on a 6.16 based kernel.
Known issue: on the MT9M114 the first frame after STREAMON can still run
128 bytes past sizeimage; later frames are exact.

Changes in v3:
- Patch 2: added Fixes: tag, removed the comments, no clamp on the
  height (Bryan).
- Patch 3: removed the comment (Bryan), added Loic's Reviewed-by.

Changes in v2:
- Patch 1 replaced by Loic's "media: qcom: camss: Use contiguous DMA
  buffers", with his Signed-off-by fixed and Bryan's Reviewed-by.
- Reworded the IOMMU statements (Konrad).
- Patch 3: added Fixes: tag and Bryan's Reviewed-by.

v2: https://lore.kernel.org/all/20261109112611.94010-1-allan@fatecpompeia.edu.br/
v1: https://lore.kernel.org/all/20261104202313.72494-1-allan@fatecpompeia.edu.br/

Allan Siriani (3):
  media: qcom: camss: vfe-4-1: program the RDI write master buffer size
  media: qcom: camss: always stop the pipeline in stop_streaming
  media: qcom: camss: do not fail CSID power up without a matching VFE

Loic Poulain (1):
  media: qcom: camss: Use contiguous DMA buffers

 drivers/media/platform/qcom/camss/Kconfig     |  2 +-
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 23 +++++++++++++++----
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 ++-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 ++-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 ++--
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 ++-
 .../media/platform/qcom/camss/camss-video.c   | 22 ++++++------------
 drivers/media/platform/qcom/camss/camss.c     | 17 +++++++-------
 8 files changed, 45 insertions(+), 33 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

