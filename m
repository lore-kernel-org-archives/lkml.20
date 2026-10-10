Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B62737BE78
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608372; cv=none; b=KQxsMIuySc+dnJZ78ULImFOI7bPne6d0vJYyfeN3dS3E6RWBZlxakGIfL6e5aPCevxbBRg5tWMLBEQz+GXHNwpyoqqezQp4v1HZkDjrZk1pUiNwBoBqU3CJMWGVcKVRWNE8zxZVrI+wXmzVbTQIsMKw6hfaoFD7hJJRWICnrqsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608372; c=relaxed/simple;
	bh=j1wmvJil2lJCCEi5mxhSqR7Ez4QAqAByUVbsg+6GTDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dE7CoiREEeGM3HQ+Q4cebSmZOdiR3Uog4/OVgSDUgeq66dMqHAewjlVqkrkgNPIrf8BNqDQS4O59mR+CXPvwZtjeI0dASZLDipcBSqWuK+C0x5eo4VJJ2C6xP3ZxIZ8jlvWX1+fW1t2lkCduzLMtrHhEVj2aNV7/7lLkAxCmSZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=pFZCTpWv; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="pFZCTpWv"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533861a59b8so4411031cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 21:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791608369; x=1792213169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kal90amSbaRMY1YFdpgEyggfZOCC11kFyumtrLhWcfo=;
        b=pFZCTpWvRMtopITeZQ7Io+V4zVnTmqJnsEVf3MtroJMRImZFtEX3LxHHmuFX+gah9o
         wo13nUFj+GRH1g69AxJ2S2GoCLwHGJfoVvLBCsnlT8fPBOG979dW61BZ3uO3NdEjz/cu
         sxJzsaNA3Ig39JeQyyySIrJSnow5hWdz3IbpfD+9HRD2Nzw6AWBiLkuJRaQ0nA8D/scw
         9vR0unSbxtvGwjZdv7RAvttERgNtK2lz7i6JmcB8DUS/pf7KlAgHAYkQ8bLk716yO3UE
         kRuclhRn1WHTHl/0OguV9QJz0Rkv9qU3hjm2XA7SGc2tGx0xcxvvuiTA0HoAO/+9znFE
         BcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791608369; x=1792213169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kal90amSbaRMY1YFdpgEyggfZOCC11kFyumtrLhWcfo=;
        b=Au37RM1nojhkovY6SnzVl8gTOp0Bhy+PVNQWnARdgqn494v3jzpbsOhAISS2jfE9o9
         EM5uK1Gx+HNf1qvqH+6qADuKO7XofUQggJdgpQoI7rd5gku7nCA+mqN4QmQGeoTAsYv+
         FPgjzaC4gDvZKprJP1g6ToYzajsL5jHfH5iXewYeUU6/HwZfx1BT51hzR8LLi7IuLhtQ
         cY+hxoKOO48Nw78Vv0cM2KEq/YdCztLm3YkRilZ99MA4mChm25Txm7OEOzyVPmR/zvqu
         7g9OW/WD2ofpWgNR4QKYDPW+W8umWvDzHJq7JwB1+FKkxu8ysblz7njWjUge3SbM829R
         rcGw==
X-Forwarded-Encrypted: i=1; AKwUvBx1kN+DFoOoogEPMj0uuiCtcGnrahbJPGZi5ET62ZsXybFJh+WPNo517uOxcFN2syrfygnOih3F6F1ssEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxqHe4mOUPs4hWoZiMihj9FLEnF/NBOaEMMujVugvpN/Yc8tre
	GI4jeRF5iTLwhBDgQcBkjXjI+hT5+n/fuSkBlAuLMlqPJVz55qTCLzEa1sUUhSfM4hU=
X-Gm-Gg: AYBFou1ifWkV0x1bVu8LJzDVCC2sdLV6z7rak5qCVQ2XSJ7V/5hWX9oXRxDhPWZppmX
	1y768rMXZunULuYnm0EVyRpXd2OYHUNekK71/fuKq0jWkRzOCntRED9r4VaV/bdrtt0U5pCrMtk
	f9I6q42enyZJtxkouG6mIRQkRlJOxj/IQBrFu7aTIQI4wCwp7ec5mkanOpBcCGE0FK7AH1WOw3h
	L9LPH+caLC8jgN3IlzUk3tJr+eKz4yN2EmQoKUI2E8tfR6TB40Qkvu4ghk4JXxy/cfSpYqOLnIt
	dvBvzz3PhrV2gczSQH63fo2M7k21bRP9ENTLwf93Xfb6BfBqx4NVGQl2I28vqXpo6Ke+iTBMRKw
	8YJI6B+s+gIHYZh1DzYP6BOAIFk8Zqux/MyMt0PWZF6h0FF9eYq0K8AwbtlU//TbCws+E23XCMi
	uSYeTYd9Dkq18hoc9627nLbfzFugEjpY8t6qGp/cpSERxicmmkxMNdvmUGlCO0MiT/ls05+OD0H
	HSOa4avA9bXsAbWQEzpb5Pjk3GeBDryNjc+iSZFLrM6XBKwL7rOIp7hvpLIVxvoPVNgmoDjQyEj
	QpsXAN1ozlaTzzOscSZ6b/FWefQi3POXFLJgs6+wvLe51FFccvjpCXTbeZbDjUj/z8cQ6Q==
X-Received: by 2002:a05:622a:1e12:b0:532:c057:9564 with SMTP id d75a77b69052e-5359fab3627mr63226981cf.23.1791608369574;
        Fri, 09 Oct 2026 21:59:29 -0700 (PDT)
Received: from jake-laptop ([153.67.39.44])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550887ebsm35827736d6.33.2026.10.09.21.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:59:29 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Ramshouriesh R <rshouriesh@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: staging/ipu7: Add 10-bit greyscale capture formats
Date: Sat, 10 Oct 2026 00:59:22 -0400
Message-ID: <5423f57000600f27626ff785f80f94d3e7ad1106.1791608336.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1791608336.git.j@metarealtyinc.ca>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com> <cover.1791608336.git.j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI-2 receiver sub-device accepts MEDIA_BUS_FMT_Y10_1X10, but the
capture nodes have no pixel format that maps to it. Link validation
between the receiver and the capture node therefore always fails for a
monochrome sensor and nothing can be captured from it.

Add V4L2_PIX_FMT_Y10 and V4L2_PIX_FMT_Y10P. They use the same firmware
frame formats as the unpacked and packed 10-bit Bayer formats, as the
ipu6 driver already does.

Tested on Panther Lake with a Himax HM1092: both formats capture
648x368 frames, with 1344 and 832 bytes per line.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/staging/media/ipu7/ipu7-isys-video.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8c67308..8a7c2af 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -54,6 +54,8 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RAW16},
 	{V4L2_PIX_FMT_SRGGB10, 16, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_Y10, 16, 10, MEDIA_BUS_FMT_Y10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
 	{V4L2_PIX_FMT_SBGGR8, 8, 8, MEDIA_BUS_FMT_SBGGR8_1X8,
 	 IPU_INSYS_FRAME_FORMAT_RAW8},
 	{V4L2_PIX_FMT_SGBRG8, 8, 8, MEDIA_BUS_FMT_SGBRG8_1X8,
@@ -78,6 +80,8 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RAW10},
 	{V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	 IPU_INSYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_Y10P, 10, 10, MEDIA_BUS_FMT_Y10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW10},
 	{V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
 	 IPU_INSYS_FRAME_FORMAT_UYVY},
 	{V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
-- 
2.56.0

