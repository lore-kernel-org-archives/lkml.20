Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FC44DBD9B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396757; cv=none; b=H8BG7Zmdbp0vyJKN81AXmsJVV/HL9oYl0PrLGtryg37IqGpWCdZShGZkxZmFqWuh9phZRTqH6wnto/iMd0YELXz9gpp3vpgTmSOnGL2Jg1lfCvm0Q+asg7sVbW9i4K1wCh6SUQQrf+y8C/76JIz6LqQS0pQGxTD3yMjRKx4WI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396757; c=relaxed/simple;
	bh=Eb8kM8V9UZqAw0KzgDYT0NopEv+l/SYxpht3rBesG7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUQGqV/F/KfePT/5b1SJwVo3tiV9xYI0SGk+qPCsODT5QR3PWDGhofV4w95ZhQqevgLk1MnQkOcG0vQILbMPYONsErjWmGkvwIC3E3QXsqnklum2+y/6Wa3YwF0Xsy4Rpnu4SqoFtbaEIUheQwtI+OGHkADNUfVkaKDoRj2zTbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEnAep3p; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEnAep3p"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so21678305e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791396754; x=1792001554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmdRitxTTgFdGJeHgGQ6RNQbSBJ7pC2HNIG3s7QSzuM=;
        b=WEnAep3pVUR29Nh487tCOHw5fic+P+PQuLzV5BpYTiy6ld+cugQWi0IyghwbkHyIWS
         9O/ken87ChJ0ZVuz1LgYcCTJdZab0fTGZXiFEWCTODhH50tvvw5shh4X3myCf2JZHtEG
         KQOCt28zRyXoIjOjV4DWljnHJmjxFzFPzkb+W8Fk9YBuHSt4brMyilWmp+Z8WVC462b4
         Ex6C7mBPsplj4Vvir1IdFh+naR2Xx1JWEawzhNFUi4YgdLoNOxwP9W6uAaeTllGdWI2w
         OR2VOVCidRcmJMIB1VNP3axHvbeohTsGRtLf6rE9M5vng++SuRahtT1voMxGEe7/o2pM
         Tltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396754; x=1792001554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmdRitxTTgFdGJeHgGQ6RNQbSBJ7pC2HNIG3s7QSzuM=;
        b=G7ttV9i+chQLkVkAPkoIrqfBSI8hcahRjJTbRvyJVUH1/Hy474TzuaMzbTTAAMrfI2
         JIywjYn4/0XCBljt8jMCx5Shb+/mZb8QkYhLmmRNvRYVyBeYYuqIzuztc+/Sda/2he5H
         /oyL7m8r37D2ux/8ASiFrljBkCLyfin8yeH4S4yxuoq+BtDxJx33TxmIzofPkAxgsfC9
         xDNmyrUs6aU03e4lg73WuloK1CBOq4Qdy2esWSPFHMFWXG2fUteZYRWAvd8YUvyhFUlZ
         vsiUkUYfYOGcbVr9v0csbpSWjOpYHPfL+ktsqkyg7Y9jGK3fcs7C4Wqm9VtMpj7FrqUC
         rx+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy4EkaZUS4wghm1jtNR2IueVB5sfeSHMJTBtTcR56U5r3586sFUvpQKnP5svlcZruvzEUG1TU6MfEPl400=@vger.kernel.org
X-Gm-Message-State: AFuF++miZj9z1i4RG22RQJpuoX8kPjUnZ1yK7Vb3XUvvntonTPuLhkg6
	xG5CufkECfYhI0A2JaY5Gkn371Q6mOndcDLYg7NrOsLc/AnOoHGEW/xH
X-Gm-Gg: AYBFou3/uEkjtxG9s74n2sUFQJzV7nZUM6p2Rcz91ir+vKpNDK6qjORnVjT3CZ99OgG
	mo8L7ku8s3KnPlrE0MxUGCfUgMc3PIhdxflHfTn8xjFBsFMztpOExklR//IcQarT0byYzrURVhv
	aJK6GVy3AcQgAY8uccEbiSQbVizDj7NSAVvX1qi4JlesZ0RIYa3FP3a+C6FOxM1lVxL4GAo8o7u
	UJDBpXbGh+I6sVFfJ8kVow6AS60Ttag5ipDMqtjOrzrBmAhJbtUN8HZhdQRxEmuCHTykpehsnvu
	lkZG8JcAZF3HEUpjd3tdyKjUHoI7sUu6rSLeYufliscffFGc42XQMRHvlJTeZ0YpWcidAhV5xsQ
	o8s5fKC1pRVXK9tMLunw3Zfpak+om1UeGnZtWs2Z4x5u3x8dK3lp44iZs9lbHdfnhBjHdRJ/ITZ
	PcQgVuT1qnis9l0A8sVxQI8ZhrmxBOW5sIM5agie1TDM2iwuvx68Uw8lH2WcIZX149lJkX9wA6/
	hZ+jydr5mBKXUPuv8XRVXVZvifM/LVZig==
X-Received: by 2002:a05:600c:6749:b0:4a0:251f:a726 with SMTP id 5b1f17b1804b1-4a180455d47mr54022405e9.24.1791396754013;
        Wed, 07 Oct 2026 11:12:34 -0700 (PDT)
Received: from osama ([2a02:908:182:d1a0:b456:28a3:bd59:abb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843e3356sm7115815e9.14.2026.10.07.11.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:12:33 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/panthor: Fix TOCTOU race between GROUP_REGISTERED check and erase
Date: Wed,  7 Oct 2026 20:12:19 +0200
Message-ID: <20261007181220.2418060-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

panthor_group_destroy() checks the GROUP_REGISTERED mark and then calls
xa_erase() without holding the xarray lock across both. If the handle is
destroyed by another thread in between, and a concurrent GROUP_CREATE
reuses the freed ID, the first destroy erases and releases the new,
still-initializing group, leading to a use-after-free in
panthor_group_create().

Do the mark check and erase atomically under xa_lock().

Fixes: eec7e23d848d ("drm/panthor: Prevent potential UAF in group creation")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 0493858e55d7..a343c5180e01 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3770,12 +3770,18 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 	struct panthor_group_pool *gpool = pfile->groups;
 	struct panthor_device *ptdev = pfile->ptdev;
 	struct panthor_scheduler *sched = ptdev->scheduler;
-	struct panthor_group *group;
+	struct panthor_group *group = NULL;
 
-	if (!xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
-		return -EINVAL;
+	/*
+	 * Check the mark and erase the entry atomically, so a concurrent
+	 * destroy + create can't make us erase a group that's still being
+	 * initialized and happens to reuse the same handle.
+	 */
+	xa_lock(&gpool->xa);
+	if (xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
+		group = __xa_erase(&gpool->xa, group_handle);
+	xa_unlock(&gpool->xa);
 
-	group = xa_erase(&gpool->xa, group_handle);
 	if (!group)
 		return -EINVAL;
 
-- 
2.53.0

