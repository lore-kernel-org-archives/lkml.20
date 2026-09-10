Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49353488DB6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044274; cv=none; b=akomhrPxHplb4gYLbiFy2ddKPF0/4ISOc7N4H3EG6dg4zBRYrP+r4eir/n50b2Bsaky8VhYqnlS/1mg9tFjxpnfBC0M5WDsVybTahi8D9OmeUY50vrYQX+5TJPUUcPRFXNQmqpn8WBLWTCxRotspuz2CIsyBY5UVZjDQX4tqmQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044274; c=relaxed/simple;
	bh=R17Gb+XWftjBcYxyj0I2DLQIm3K0udyH9vg/SmozghE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=crXHJDs8ga5tiHIm2SWyWVOHyb+GFs8ALC0dBZSZuHs8BTp8JutMS61mkzYzMh8q7CHTjMV6bOTI23Krm9k5T4bvyJSCA0DiWSgc8tuez9EdVplx5s0BTMLXWj9YH23/yMg00NvraCe8mw3UJDhwmfpiTl4USllPipuDxGhNUoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlGhayaU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlGhayaU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0e19300cso7027815e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789044267; x=1789649067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1abMDSHbrc6CBNfufK1oYgsczusTwH0/aL3eMH7YTa4=;
        b=XlGhayaUgGn/S/37XEPTbZc3q67gGnG2tPP5sOJCZrlOD79iKllkukIi6ClF95Bb5F
         VJ1Uk11xEB3sIBD3tzCLccrG/XCtd+YDtciA1nSOT1iaxHdc842OP+6GXBctUysupx+Y
         ol49Nz3oAy/Qc9t88/5lf/1XlU/aMnr3Tlh4hD9FIShAD9nw0RtaL4LL1gXUqnkBBI54
         3jT/Du8fuaYAizrWaTzzfwRzJKKXfdCgJnYo4xP14yakeRSSPs29PxH9zqOS4M/LODbr
         fTuEd+8w7NmXCFd4aY6ltQNSBGi7rTs30m1GaTYcvfh/hNryRTR30BXkILmcy/NHusyv
         YmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044267; x=1789649067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1abMDSHbrc6CBNfufK1oYgsczusTwH0/aL3eMH7YTa4=;
        b=Ry/8u8K1s9gWyQO//XNlDgPBQ+Obhv0Tuz29iR5IsUbju+jPEjaSafpYFg0aNOh7z4
         TPhfVwX/hNKjBkqEPZbnrpUc4dos0Ih3jIXh/jodikWd8Z2n89cEESwDalXwbjr/6hog
         RmY7enncdHkFs1SaEIUrgVnaHKd/42a5TFeOBskqmsdaXDSU+qMCqD4aVLAFqpBZB89h
         XnCVPLnKupbrZYXt4+4JAReP/EEhauFOxY4XGK4v0HpsCT9M/ZrHuJA21jMAf2eZSkb2
         a7QMwz6Dr/KgAgH5RQ3Vnr2ztMsBHCSj6Rct6XTVwb8SVyEg03TKKFgWFXgAoqDueH0e
         TigQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ7RNUB9DjOj9s/Xd+wMrBQB1+vt0i7/EQ/Hfk98LHz51dIiIDgBHPFurvKS4EbhG6eOyJSrBX1cG7JLU=@vger.kernel.org
X-Gm-Message-State: AFuF++mNTON/uEsBpNYOvtT11egL2SE2SyvIwPdgSvmyS2ND2R5epV49
	SbQ4fOQM2qsvV1eY9nPsp+4lWDqV0lOIhfwFbjyOrMrLux+b8I6nscyl
X-Gm-Gg: AYBFou2JGfNGYuDZ6Vnr+mmWOvql0i65oeDnCcs0Xhn9gryJmDbyH+JYWGhRy+jwEpk
	SxApFCKVfTzgHD5HfQMEx/KMpGabaMV49m4YXInxJpcodn8IbJnoqo29XobV5aKo+WAH82rRfx2
	TsqYoX5wAJICfG7y3RpkDVjKCakL6gtXF3u4pjCyLKQZ9qxExdxthCz3Fawp8nPDVmkEQv+SlH/
	1xIkxNbREM4ySGWix0Nm86TyY8x+chII+C9Q6G0Mugi4W63NvrqWSBN8AAMis2GZqz1DJPOUsbo
	KuVTiQW9XLbMjyA+9+ECB+G8aKZF09PbdB3IPqCC57D9SlcgVqgT8z0+0kvP7m4czb9pd03Gr59
	QGB0uDt8+cX5MDVYQZV2n/PjuKQGFxII0Xm/7/s+/WG0Q6G2mUkeUA2MJwrW01eCW7+EZ7KBpzw
	/d/GSPP0wwOeFlLN8sqmt4ombdW/IR0Y3k9h1PTsYb7oAmakjQjPi59F+id7Jvo4ofsfw=
X-Received: by 2002:a05:600c:4695:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49d258e3ce3mr65429385e9.15.1789044266950;
        Thu, 10 Sep 2026 05:44:26 -0700 (PDT)
Received: from zephyr ([2407:d000:508:1732:c5ca:107f:bc81:7575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm69354095e9.6.2026.09.10.05.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:44:26 -0700 (PDT)
From: Muhammad Israr <7israr.work@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Israr <7israr.work@gmail.com>
Subject: [PATCH] staging: most: video: add comments to mutex and spinlock definitions
Date: Thu, 10 Sep 2026 17:44:03 +0500
Message-ID: <20260910124403.95741-1-7israr.work@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comments describing what the list_lock spinlock and lock mutex
in struct most_video_dev protect, per checkpatch.pl's
"definition without comment" check.

list_lock protects the pending_mbos list. The mutex is registered
as vdev->lock and is used by the V4L2 core to serialize
video_device ioctl calls; it is not locked directly in this file.

Signed-off-by: Muhammad Israr <7israr.work@gmail.com>
---
 drivers/staging/most/video/video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff62f4..41b617b553aa 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,7 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/* protects pending_mbos */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +41,7 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/* registered as vdev->lock; serializes video_device ioctls */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.55.0

