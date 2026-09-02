Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3C47207C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348171; cv=none; b=BDG8w3+rM3Km2aJKtK6EC2CiemDJMgOGwb9jeZnDnVbEY78wRy9lpzn+9QpnEU9q3jOCYxIc/FPiF8TLUHwGvhNPSbXc+HIZXjnlsKpQ8uLLZLgV8oBlkCiN/dmUcdlkieFd91Zy5JotF+RCznQ+3P3f8DH5krVsHTui9o8OBdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348171; c=relaxed/simple;
	bh=t4YvdNfFdDmGiz+1vB8xdWVLlz5kJXbgA2rAszgLxdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQOR9W4CxugMm1afXGsGi8F9zpgbUUG2c0tTgPOYL1Ziags0AQnFRAadBbE+NDGx7FQfEAO/X9IRCC3ItGOjSbUpyR6f+JVM+BY+zvqIBjH3gpxwdnThflIySXyc0eJ5mmBN08r2Q1eN/Eu196pJLMpdoecKE+UMGraRo0Teao4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT8l0BZz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT8l0BZz"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso963003b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788348166; x=1788952966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bG2pMm0qwXP8URwYF59N+uYdVu8xUiwyKW9MTQJcAuA=;
        b=dT8l0BZzGNRRUC3/3LtLN9Xir3zTw3FFuh7iT0BXVA9KC0FTjc70+5S6JvvUXRSi5C
         Be8bdplWV8282DZmoPlIcHT+MVVBW05PkeNyi1XIzgjaUsatD+B8qSKXBIUABQxcuOk3
         wNmE1h5PUpSfpB+haBSgUbyJtA7e4zR+6Ant5/FBE7dg/8YrmgvF4iB2Giej9x20fUQk
         HB+fimW4Zy5XIXQyFKydqUSJnZkZbSsGlqXYeTtJCt0yfkWxcSYYc8UDpxcKLcKlB/kJ
         wfPEM3TG3b6xcmkGPentjOXEjdNE/oCjWZGo2wLpYAj4/JfgtQzQ4k0LH/aywZhv64OA
         H33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348166; x=1788952966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bG2pMm0qwXP8URwYF59N+uYdVu8xUiwyKW9MTQJcAuA=;
        b=R5LgymtscCVo5wqYo7ZsB3Ybqnrph8KooZF+QCCJslsekR/2okO0Jg5Kpp3GR99fY+
         IqD5uzfMExNe3PP/3isMhHko/UrradvZem4c9pn5jLlGLEy3vWWUp1JWc1UjiPXjIluF
         OkIA/7T6b1v3YCvf4j0GJzBO+4zRPxlmVvKwT/KYSiWxV17J8eLNqojXy/7NKm8Th74O
         ilWPf2cK+nNuKz+47xNbGfj5fygvmd0vO/E8VfwuWrDzLUAxdXvm7a83iQWRLrnkmqfS
         8CwZEuAvCY7UPRx0io++k2vddyRat7xPapNwWQLmRI23Ypo8+MXUv28kLVCte5CIv35B
         xFSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX5IZgH1QQTT8BYpT+bxkiHbtY8c4wJTmof4EwmpJNHaRmAIOI6X+9GxSxwOhH61OzM78NA/KdDWkcvjw=@vger.kernel.org
X-Gm-Message-State: AFuF++nr0ypOt9jC8XZUKI+zdDWE6Dk1K6Upkv/EyOwxWAjK4XppfQmz
	yD+TxZ/BpfppxxThnsdkPxut+DolyCMj87V0sgEOpmqIGVWUKXeWKM5f
X-Gm-Gg: AYBFou2xIPVP7e9BTHRGVEdn2xPU35G0M24w1evnYJDmQGzdQYpnkbwh4tzI72quSE1
	ssTj92J4uADpC4t94RN67ZPJHOmCdEsQWy0t+i41j9FtUd2oNDIIQQxFk8q+XG8AfqvrgVQi+u2
	3Lx8ZJRZWytYsDfug8+pyEonld4dkEqAH5UhX8gGoStMzk3ItZZmhZ0mat46HYDE+3YdB52stbH
	v33vW24LBxJFIW43Q8iyTzK1AQZT9AVfHctquMAQFCJu9wFO5ZGB5q/vjp5kvIsqj1k3Eqi9rER
	1w5XgQP2RhWNtp0LKO73ciO9JkD6zVlBfE68DkZFYOnLTOCRK4BicbZiDQQbrTOpKdYtd07kwSd
	9gc09peA5bnC5z8hVC5b0aLPYpSGp0jxFtiPb77/HJZhx3KFygqM5voOTcWP/HejSE/Xz/wMiI2
	KAkNhTzdHDyPKZVTHi4i7Cr19g2l3cJHFQ5eJzXvCK8Zbnz+HPJhZ1ShthojHSij7ixJrscw==
X-Received: by 2002:a05:6a00:178e:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-85f42e35709mr1863167b3a.8.1788348165513;
        Wed, 02 Sep 2026 04:22:45 -0700 (PDT)
Received: from hnkz-ubuntu-server ([2404:7a80:860:3300:f22f:74ff:feda:3295])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11f8471sm1167571b3a.58.2026.09.02.04.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:22:45 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kazuki Hanai <hnkz.64@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Xia Jiang <xia.jiang@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: jpeg: Avoid context access after job finish
Date: Wed,  2 Sep 2026 20:22:28 +0900
Message-ID: <20260902112230.452176-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_m2m_job_finish() publishes job completion and wakes waiters
before it returns. A concurrent file release can therefore finish
v4l2_m2m_ctx_release() and free the context while the single-core IRQ
handler continues with its tail.

Both handlers only need the device for the matching runtime PM put.
Use the IRQ-owned jpeg pointer instead of dereferencing ctx after
completion has been published. This preserves the get/put pairing and
removes the post-completion context access.

Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
Fixes: 5827e4b14ee7 ("media: platform: Improve power on and power off flow")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec4830811..9010e7b1108fa 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1574,7 +1574,7 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
+	pm_runtime_put(jpeg->dev);
 	return IRQ_HANDLED;
 }
 
@@ -1855,7 +1855,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
+	pm_runtime_put(jpeg->dev);
 	return IRQ_HANDLED;
 }
 
-- 
2.53.0
