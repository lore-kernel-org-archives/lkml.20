Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7B43438A1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882470; cv=none; b=JvYdP6RXtlM1gJAx8bMpyov4vGCCKXeeYHSWZTtbwWjjBhDL+Pzj/YjjARWY+ZfFxWB3tnYgj8KyN6LYgswdk9e+mJcAPKnJRaResGtJb/tVwI8NiXLLZjNi0Sbnw1+iOZTo/8G1h6RRHBn+6i2C3MNlVINro2CbNEqPQbVNHjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882470; c=relaxed/simple;
	bh=ScMUaMd0TbrobyvI6139tHt8pPlNlKUDJn7Hfs6XxQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sgBm3v3g3Tx7s+dIFhi7RvX9ERjcVcBQiFWHhSxU5/zY7jrNa07gZxRgxlQIJUYAEgCrOfLSYrybvK3Tj3I1dnW7AJ1NESHhuM9+vc07ML1z2wP/j9TFLarVNzfaXlysY+p7GLTS0VQqWvbOWSk+NVvVsn6HT31QwsggpWkElf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lue4XX4U; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lue4XX4U"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fde295992so327920f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787882467; x=1788487267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KOcOnSph4R/SK6vbv+B+XNx7SuiY0RM+MECJyRf8erk=;
        b=lue4XX4Uwd9cOGuyIqgtgV8c591aLJ5u9me8I+ssjSxU6VyzJhtWAlKgGhPh1KBCWT
         zL2CKUo2aPVq5wzXaq+tJvM5d8pa9e/u2R3iCRmJLi7bjkRrWsSYXUA8f/op0fQ8njsM
         oWobanOGObEhSQ+rkq4TrZrOEFCHUDbxe1+WONb0z1/05e5kkdXMJ1DEkY/cdlVjsHom
         +DKs0xJlXSj54vd/LbFBJe+1vbPQHXitTUmhdn9gfLxaC2L+KanZJ767Fwt/2ra+yi+L
         hvjr69NmJEv+Ao9yECt6ceuiSaEkZFccPfI1jN6wWYcdrTRpxl9ZXPaB/TzSzV7WCebj
         bfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787882467; x=1788487267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOcOnSph4R/SK6vbv+B+XNx7SuiY0RM+MECJyRf8erk=;
        b=qR1RwqVnXxrdmg4IBU4Oh9xPCoC9qfDOrL8Bmq7Yc7MXG5D19AXWBeFPUqRJQffZ1B
         yA/+f+XX+Z2hJqRFP17wndllkALqer+B999l74+ykIYUB0fiXElmmEPIRA8Im+WO0W6f
         t71OAvh3+DaZ1PQXw4o0gRcyv/4nuI/QdOBmqp3yerx6JQp9Syg7fYkHn84dmve4uYVA
         H1DTSo1tUUoLU4VEFBknu/XqJMxX0udB0sJRH1X+vOa4ukud28G2+YSQYCwTZRXLB+59
         J4ruRD2KhTW+Z27M/jN/DGc7/gV6CItiC1OzFUBX5h3mj+xQi7Gtn/pbuzCjWrhaZQmM
         5+Bw==
X-Forwarded-Encrypted: i=1; AHgh+RoIP61K90hBcPhx+GWicn0Tjuxh3YZfJuG8y7ECBA8QgaB7e9s0aQxvXPr0kE38AnXSmhWRKcwdNcjIeaY=@vger.kernel.org
X-Gm-Message-State: AFuF++mUHhf4lqYxIepvKEcW8hNwJfwS6yoajUwG2GBU2fufRy6QaPkW
	KD1jU/3rpdS7PBxtDgtSHziinn4FZ1vigYruNrxliKXBLs0DJRG8Et/h
X-Gm-Gg: AR+sD10/SSzfHyx+dyKSFy3IAWaGfUQmBiS4NIjdhhAmubZNYx4HVlF9WPS6gpSsq4L
	DuVaHayy3yg6u+imT29ap8nU+LsMvRQS7yYeT76AJIPr5poYXroXWxXBclwPZZ39fxcM0bGuswC
	qNjkSkKrcUSfhaiXnVE6O+pGoCgYhTVAmuIwCt4VO5BOk6VujE1ihM8WZRF8cT6mAcph305MjxJ
	kNmjoK8ZhP4C+VnAwEWmGkDhZ0b7zqeIf2p4mbKUI0n19r+WomjRHuVoOd4HHHm7ROkt3fi4yu2
	X3kSAJG4VUgIuLyr4BNK3UUsuXcxzqjTZKUrW5RBIHjJ33z+BYUGtBHDJgItvwMN95uvuWwY7Z8
	6Q8/4dRtULXUtYr0HfDVjaE9DmUbSD4kyRhu/uUqo30UmB7nh9yVogZvCm+pzIwwuH14JF+3G3N
	GsAt0BNnMJdwHvyMVayyiGrAbuyxu35tuqY+qNgUhKceE3RcsF+kkn8yZqSQ==
X-Received: by 2002:a05:6000:2608:b0:482:b823:cc3a with SMTP id ffacd0b85a97d-482eaba7efamr16934016f8f.12.1787882466615;
        Thu, 27 Aug 2026 19:01:06 -0700 (PDT)
Received: from 192.168.10.52 ([39.41.155.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm362758f8f.20.2026.08.27.19.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 19:01:05 -0700 (PDT)
From: Saim Shujah <saimzst@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Paloma Arellano <quic_parellan@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Saim Shujah <saimzst@gmail.com>
Subject: [PATCH] drm/msm/dpu: clear pending peripheral flush state
Date: Fri, 28 Aug 2026 11:54:40 +0500
Message-ID: <20260828065440.140410-1-saimzst@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpu_hw_ctl_clear_pending_flush() resets the cached per-block state after a
flush transaction, but misses pending_periph_flush_mask.

The peripheral flush updater accumulates interface bits in this mask. A
later transaction which sets the top-level peripheral flush bit can write
stale interface bits to CTL_PERIPH_FLUSH together with the current state.

Peripheral flush support was added after the helper started clearing every
individual pending flush mask. Clear the peripheral mask together with the
other cached child masks.

Fixes: 64f7b81f0358 ("drm/msm/dpu: add support of new peripheral flush mechanism")
Cc: stable@vger.kernel.org
Signed-off-by: Saim Shujah <saimzst@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 36a497f1d6c1..e8729fe1cfef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -118,6 +118,7 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
 	ctx->pending_intf_flush_mask = 0;
 	ctx->pending_wb_flush_mask = 0;
 	ctx->pending_cwb_flush_mask = 0;
+	ctx->pending_periph_flush_mask = 0;
 	ctx->pending_merge_3d_flush_mask = 0;
 	ctx->pending_dsc_flush_mask = 0;
 	ctx->pending_cdm_flush_mask = 0;
-- 
2.55.0

