Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632DB448D11
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174617; cv=none; b=iVW26rzIYHpVrMIeNqchf5FcmPrAr/jw7n3A2aV2L6aqC3kbkQmivRECSZn/W5FA9f8cx7hyFJytUM2hhz9IEDGw8ZOf+BJkdspSeH3LJg0uuWkPNGp4CaKeryBKmCGunATu6Bja+19YxaqQXBrRMPlknpxDG+bdUY6WL+g7t78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174617; c=relaxed/simple;
	bh=k8wXZsiBZahd4YB/jFxIlwwwkrcy/Xge/EYWHanyKAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTmcIYtRmFifq7KtT7V8BFZgy9oKKk1qsuLwfy0f9mNeBo5BUN7kMD1lGRAah4IWDmQigvLII1cZbtdz+8CbO6KQIpIW31YcTQvyynvAhclqM0DGoRImjwoSAIKu+RUdD52Bss+K5Od4QwsGX337nKwFT00u+dBZowlsIlOVeZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3Z6t+Pu; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3Z6t+Pu"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d9197so636813e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174615; x=1790779415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKXoFYw7/SjH6xvEvMhY/oZycn/zJvALe61FS8iJ6eQ=;
        b=K3Z6t+PuhM1dMHoYt8wTecLOt00RqjJJNv4e0e2XdkjzRJl29lbAvj3k/qBXbAtzva
         KCB9t7L9Ty4leUri69Jd4+J7RIa3fdFv4xZiSAcdlc3e1DH1Irph7wUdq22FnBWhObTX
         /Kcm1bVaJu/2WpY2F3CVAenfI0d9unq2baKKdJlN79nj6kkq0gKQOmZL9+d+txMRa+SH
         UpkuVfoEZNbl7XsVu0VCSGmldpMW1asFlFNU4WHnxlecUu9Rmak6IbK/Cm0bXxXQDrw6
         XmYZ5rtVseUpFH95I97SCwE3z85SFME040Q6sDZmvnds7qLIQZ0xxHanggkElajY6bf1
         fwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174615; x=1790779415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mKXoFYw7/SjH6xvEvMhY/oZycn/zJvALe61FS8iJ6eQ=;
        b=ohVhy2bpf0vho70o/mCcaYcShFYXShdyHDb/i8ASp5zdjmIbmSuCQ2+bwNYg4I4lI1
         fRQWQO90bRTjScF4eGW7mSSLSbGirjYkAwehX971A/ICdhhicIn86Qo2TiXtMXrzPhLb
         K0MsUVfyYWGF5Kl8en4KmrJyX1+5DiqEq2XxacRaZbUcaUwsQEkeBYqFGYTtOihYAy7Y
         pMsOKTR95cZFFpJjkjJui9ttA+56V/+sA6oDrcdSckPL28RnXDlt/0/6ZdXPOKizesRU
         fAjM+ySGRTIEyllAG7zEUxBx5cSEv4HP5FqxvLuyTr15UGSb+BZyWTx7VsyRu7yZTvLI
         xZ5A==
X-Forwarded-Encrypted: i=1; AKwUvBwawpmw8ish3SdXDFbBg45Vw6/39WpFD1BWqxykbOGMsbd41KmZE63UZKFS40iDAVRbz/a/9kfR3T14BlU=@vger.kernel.org
X-Gm-Message-State: AFuF++lOizt2kYk9zuFuesl+0ZKUraC/Kl4SHTLP13glN26ViKncmZUi
	wLxWFc5qfApHlCXuQjrEVMhkErCKPEiF85UPyvXRTzYNp8VKxhfbIlwj
X-Gm-Gg: AYBFou3OJosXLYgrDvgqfOMMoCjP27pHUE7BckwELq/3LsJ1zmgLszxw2Hn9MBGkFBj
	TkZXJ3Vwn/Jp6fj1My5cLZbJ/VfER9hmYOdF8FRk2ABCYk9KVrpT4Vxb++zf6UKfT2SKvDnrqY7
	Em2AEf/C9RSGybTKZ7juvUxx8gSWCnS2in8rg9NLVMDSGFeUN0E6pGTnHS7enU2GfQ24z3CaQg5
	CsSyAaQ5Q3AoEIZyG6xQRZeZs7dU8RETvRqS+Jobw67tZl6ddeDJ/VFOjtxI5zH1Zy5EYvSsOpy
	y5+CDQY+WsdIw+WKs+RI4tRRVYGey45zOJYaO7LrRoGcn+t1PT2iPum7LYQtEiRDE7SYzlG8jEC
	4J9QUM6XHf4rggdzYVLyir52al0Blxv++Xig+UTG6lo4rVbNDB98T7YbAQydvkWLm59EoYFU2+f
	/BJf+zTBBYv9ptF/12+SjYS0h9eo41uOZ39y7xFni7yB8W0HuBrq9dQgZj/bI+WwBF69pBQmo=
X-Received: by 2002:a05:6122:1b10:b0:5c9:b5ba:135 with SMTP id 71dfb90a1353d-5c9f16b490amr3259073e0c.22.1790174615155;
        Wed, 23 Sep 2026 07:43:35 -0700 (PDT)
Received: from archsung ([139.82.178.10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm3566169e0c.9.2026.09.23.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:43:34 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v2 0/3] media: ov02c10: get_selection and 26 MHz clock support
Date: Wed, 23 Sep 2026 11:42:54 -0300
Message-ID: <20260923144257.119076-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905030732.39196-1-calliarifelipe@gmail.com>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Meteor Lake / Lunar Lake laptops (e.g. the Samsung Galaxy Book3/4
series) wire the OV02C10 to a 26 MHz external clock, which the driver
rejects at probe today. This series adds support for it, together with
two small changes found along the way.

Patch 1 drops a duplicated register write, patch 2 implements
.get_selection so libcamera can query the sensor geometry, and patch 3
accepts a 26 MHz clock and re-programs the OP and VT PLL multipliers so
that the MIPI link stays at the nominal 400 MHz.

Tested on a Samsung Galaxy Book3 (two CSI-2 lanes, 26 MHz clock):
capture runs at a steady 30.01 fps by buffer timestamp, against ~40 fps
with the unmodified register tables. v1 was also tested on a Galaxy
Book3 Pro; that Tested-by is carried on patches 1 and 2 only, since
patch 3 was rewritten.

Changes in v2:
- Rebased onto media next; patch 2 takes the new
  const struct v4l2_subdev_client_info * argument of .get_selection.
- Patch 3: re-program the PLL multipliers instead of advertising a
  scaled 541.667 MHz link frequency (Sakari), and drop the second
  V4L2_CID_LINK_FREQ entry. No ipu-bridge change is needed any more.

v1: https://lore.kernel.org/linux-media/20260905030732.39196-1-calliarifelipe@gmail.com/

Felipe Calliari (3):
  media: ov02c10: Drop duplicate register write
  media: ov02c10: Implement get_selection
  media: ov02c10: Accept a 26 MHz external clock

 drivers/media/i2c/ov02c10.c | 78 +++++++++++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 4 deletions(-)

base-commit: 0c795849fd70d6bdb99aea5dd08d9b43128612f6
-- 
2.55.0

