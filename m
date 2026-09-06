Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD74B37C112
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788686676; cv=none; b=qztHWLbuLZjb6rAHXjS4rP8dH85wd2bqutiUszxg8hXhnRqNaz/mKXbyfLm8ragxwcliZ5VV2BDEAR1Mxa3dyeOA+6RbOhYukSW5va43tgFDI3xzuwxV86W/5cJvoVmJwhZuWAu2cs2oOtwh48Ui0M8I3Qld3EEgJX0hVI1uyKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788686676; c=relaxed/simple;
	bh=sDvMApKRKg+lqlm98orB5wnP1nojcFweyk45ZzecYfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2qjFqaEZ3+PY4TrOPBdwUPwFIRPrl5rHeAY8l5HSP9QeQQCNuWfcNMs+88HWYLpALcWKySk0sCJCoNJuFRe1x8GmPjkiSIz/PBvemC86aqAVIQaZfQsfDh/hbFGeK0ChcyiIttemAyh8giPa8Oh6KRN7Yc0K5NxGKNldUYNeUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtKX1uVG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtKX1uVG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484362f5c4aso3120306f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 02:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788686673; x=1789291473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMJobEqGp+VWt8ryxcGp2CAzSroh7TVYBuRu9vWc0Ss=;
        b=dtKX1uVGsHRT2VsExbcbku5nNrRuAEEfqpYTRT4WyVRvWboSWfEybamKuGcUCHFx9D
         IoSmfsms/4n7SQyvpWU7gnaePi6iWCZXUfSA9pgurxqfCh61A4rcButSxWAb9IY9paeU
         BFrlMunFcqJJo09Lb03vfylJWOelH6Byc3t3zbSPKMM/x6DdHYc4gdOtJxgPolr3HBRr
         LUnuzGvb5DIyK13sQfWtAz6uUN01p0BSmz1K4ytOJPpDaXohtvzb80BmpucFRw9Ln22L
         /0DLS7CNhvHKumy5IKr1Mq9BLNDi9WLE5pdPl2L2vK1W0pm6EOODZJDbq6x6xqWShTIe
         PJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788686673; x=1789291473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMJobEqGp+VWt8ryxcGp2CAzSroh7TVYBuRu9vWc0Ss=;
        b=e/4eMqrkg1v3sPHoOzf/AfrIUSCSvZwIclf+K13t5MCJ/cK6W+OF0lmTOABEOAYzTf
         bo+k746p2tHcp1k2Gaxu0lm1BHSK5XenA00D6pjxf+pKQ6ZnADQjsvicV8a2YHnBtTY2
         DKkoS/RWurfnjRPcM+Wr2NCLwuLP1m3zhyDdFXQY/9vio3YWxT8yp/FIAR7B8UdfV4q7
         jPuZzNuLuQaJzMKgUrJfz7PNGTxkZpQ3EtzGvPhNTFKAUUv2CMZNsjWPkVtAp6RzdPRt
         Dab76LS/Kayf1KpoHnQ0HJRN+/BnaKcneyFKwpIrbLb4Vs5zCGh4/hCoh+NkrnBnh5Z6
         1/8w==
X-Forwarded-Encrypted: i=1; AKwUvBx2ZNfB2iixzcZn+lzUbem9uqO3/YxL5mRWnHHSDmTjPpq/sGZ0MRMAGaTTHxIzfmy6HQmI8jVdQhgxe0s=@vger.kernel.org
X-Gm-Message-State: AFuF++mPk6jR38BDHLZvp1w3ARZmMPm3spz2GiiIKPnpJKjugdT0Xsjp
	gDJRLKZ6bg4Tx1bjWALsKmI3f1DkyCg1T59h6I6nzs9USKLKA6Y4wgHy
X-Gm-Gg: AYBFou3sUqsP17DqM1I+fmwQ5Gp9Eh+7vDw4Lx8VFvfPDidenysWb9E/8ro8x6ssDZj
	6pjrP1/nwPUvo49rp606wrdzOX+IQMIEtoAb2YXKkcxl2W3V6toklwD1PuaE5A74PTL6oDJ74pE
	dRAJhOC8yYDtJ95QXVy+IJ7LjZjT4Kiz8kIAaU1Ic4TPGhrV+/YBCWmKaYhGAR0lBgTZoM+YgeH
	04Tpt11ilEkn/Dfl2kEA6zY4Wiaso8Me1ZYjnyf/Ad/jh86hb7fZm+u2iAZ3+gmUNyUPwaoEIQS
	cF+/7FR+O5zrX9vs3wG7lip7UNWYdNvbptCZERxyOKDvdyRLGkYdSbbtOM0oXni6Dn/0W/azJM1
	xzGZ6tntNkRs6icFFHQ/jbwACpJUBFxMHH+ZEtHxWpf/0sLrF/77icGZmoO4B6ivYxh3XqO+IKv
	9UCUVYXuHVbMqFyR8x3hrOrhSPqQ2yajMp2+RtdzT789OYBFNESb7DScjBMRyeXlKFAzR2b9Ylz
	ylcC1+P26Y4oPFxUoZBbQo2BKJmnLJaSQywS2U9nBqYG0IP
X-Received: by 2002:a05:600c:6306:b0:49c:f5c0:aa76 with SMTP id 5b1f17b1804b1-49cf81e366amr389316715e9.5.1788686672750;
        Sun, 06 Sep 2026 02:24:32 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm216768265e9.0.2026.09.06.02.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 02:24:32 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	nayden.kanchev@arm.com,
	hverkuil+cisco@kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 1/2] media: mali-c55: Check the parameters buffer address before copying
Date: Sun,  6 Sep 2026 10:24:24 +0100
Message-ID: <20260906092429.50046-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mali_c55_params_buf_prepare() copies the parameters buffer supplied by
userspace into the driver's scratch buffer, using the result of
vb2_plane_vaddr() as the source without checking it. The queue accepts
VB2_DMABUF, and vb2_dc_vaddr() returns NULL for an exporter that cannot
be vmapped, so the memcpy() dereferences NULL.

Reject the buffer at prepare time instead.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 70106276b7e4..16e895e3488e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -710,6 +710,9 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
 	struct mali_c55 *mali_c55 = params->mali_c55;
 	int ret;
 
+	if (!config)
+		return -EFAULT;
+
 	ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
 			v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
 	if (ret)
-- 
2.55.0

