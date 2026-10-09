Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8554078CA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541135; cv=none; b=sjc+AiyH8IvB1i/bbD91EGDN/ATcm9YNfw3k1IRLgsZxHqw9yY0h8VxEpenVlADAGNahGGl6eYR+/cjzNqfW68pGgFDVOttt8w7HFfFhypXYHqP9V5gNqxovqLBYA9PdZ6q7JvvbfwmugVtASsRe2bXs5bn76WyCdtqI+68x0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541135; c=relaxed/simple;
	bh=TzA22JsUl7PsgceYExREAGWt530oEVw8E3Welb20PdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZrezCmpn8NEvzTUTHubqbA3jvga/NaOjpW5Xx6t5dAdBuFrgy1u1aos7JVtb/lDqi3WAtaV7jwwhfk4nI1m3iIyo/deztp1VD5Wu1T8DzPW+nCuzHFpYJmbybhhIqLzpT34oudq+IIlIFgUpcxlgr8Uv1Rf9COqLUoHGdUruOqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzAMPM4I; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzAMPM4I"
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-824040a3379so2484791a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791541132; x=1792145932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQYsTFrWke5vcZofnQE3TNuLqYunAq0Wa80G2xcz6E8=;
        b=VzAMPM4I3WAX5vZu+o3hWqZqvJIGkkoRrabAnBgJ0mwQx+Q3ou4WyLJjqeZw8zOs55
         0TBGTpaoGUscO++4oZb1XWn+5lPC1qKzjsYUL1CsdpDbL5Wr8BGb4Wbe7FfYaA+FwDz6
         /UVvcKOVWNduxuRRYycF+mqvpIZULG/wYQn1WNGvuBiF9+vgr761IWoztNYL2guqQN2b
         90WmGhoBUvhpZIHW+AgLA9tgdzRnNI6pEvJQEdnQPvpiL0At9pxRvIaGgRcI08HTc1C/
         mMxaZS/3jD5vUv5uCxDRKGZTv9PLALtp8GTcYyY2C/QUtnDcPZxBQ0D5l+89yNgCNsnh
         u7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541132; x=1792145932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQYsTFrWke5vcZofnQE3TNuLqYunAq0Wa80G2xcz6E8=;
        b=h21oH0fSZk2SpAVhvU5hKnLZJ8WkOIWxl6/JykpnZnUgWDsrn957n5WVmBJ5EhtCWB
         lG6VI0tf95ZnDf9AwuWn/fWvcwIOrkejRtp0YPV9xO9Ik0rSkdi7iKsemjgFsV1lPrwB
         djPk7OR4VIC/IRZ++IixicFLX7nUbv/OelE06uiJrvtCY+UwAsnKQ5aVCarBWu5PcFVA
         QKNwWBWi81aoSDz6UY0ecZA+/gUKsbcfUAhKKuetV9SBbSYpiaIWXdT4CmcKwZtvVx9N
         ItHNOBt3NEj713HwTTuhBlUfnEpj4+mTjOMWHEcFbj43QaoJ7ih5iXSirK2c9yUr1nHc
         KM7g==
X-Forwarded-Encrypted: i=1; AKwUvBzLnEK1zykXHP6Xkd7W6a+2K6+kZRQmsy/G/bi9f2DaK/pqKt6tZQ9cAY80O5G4L54tVwvhoBKRS0UiQbs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHeoNuc43Gkuh6hJDN5RF2s9ziZK09nycE6ORFBUOzMg0q8pvo
	H+jZ3IxccOjkyqSy/x7C3w7LzsnvJ263QB8hl8Em59tdHCgeXqZX7WOX
X-Gm-Gg: AYBFou1pfbq4/fmJ01xGTYf1FvuBYHs+ca2pwjbQRmCnrMTicpUymgw428MBQ4tomFd
	mU9VeXO0UUGZt6BDZslavETzBhlmYxw2oCB2BhB2WycB20QAWZAL98S2THPuKfiuxtK9jPdfe3t
	4ALWUZrPJEMPbg429a195Yl5mnjBdXs/wxaj/0KSQG6mm86xC/+p/zjxJIZTqXDilzutrF97nBX
	W4DMIq2/CJM84VRurVsYthFMz6dDFdGW3TcScyhB2CfpzJaT7tbhbKD66YzB4ocqE2brsiCcdcK
	oWpIV8bR+/vbbNQbccICkQfUx8nB8kY10MPn8RkLV/E4/LdpJXlJSlVdpdnC3L5c+XbS+qX/HAn
	BEdm7jkISc2rJTCo6ZBqrz8tNbNn21u9ew49NOLNUp2VbG+kQ2Y7whPOXQKMJUKRl7BeyauOY5p
	l8I+Nt/KFXnp5aNCUhGUf9rYA/c760gy/E4NAfRFIDjLLGsNfHZPRlwrzAmzFGCwnKfkY1f8ABz
	qmgMlg0clnTXRl24C49m+FQbJ1dPd4TyusHgA==
X-Received: by 2002:a05:6871:5214:b0:49e:6fbc:cd5b with SMTP id 586e51a60fabf-4a2a898e729mr1145751fac.55.1791541132396;
        Fri, 09 Oct 2026 03:18:52 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.41])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a858aa3esm1401367fac.12.2026.10.09.03.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:18:50 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Alex Hung <alex.hung@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] amdkfd: fix doorbell allocation race creating duplicate allocations
Date: Fri,  9 Oct 2026 18:18:42 +0800
Message-ID: <20261009101842.3294707-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check-and-allocate sequence on pdd->qpd.proc_doorbells is
lockless at every call site of kfd_alloc_process_doorbells():
kfd_get_process_doorbells() (mmap of /dev/kfd), kfd_ioctl_create_queue()
and the CRIU restore path each test the pointer under different
locking (or none), so two racing threads can both observe NULL and
each allocate a doorbell BO and bitmap, orphaning one allocation and
handing the two mappings different backing pages.

Move the serialization into kfd_alloc_process_doorbells() itself:
take kfd->doorbell_mutex and re-check under it, so all three call
sites are covered regardless of their own locking.  The existing
doorbell_mutex users (kfd_get_kernel_doorbell() /
kfd_release_kernel_doorbell()) only guard the device-global
kfd->doorbell_bitmap in short non-sleeping sections and never call
into this path, so there is no nesting.

This vulnerability was discovered by Tencent CodeBuddy Security.

Fixes: 428542d91772 ("drm/amd/display: Setup for mmhubbub3_warmup_mcif with big buffer")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
index fdcf7f2d1b5b4..07f881573837e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
@@ -257,12 +257,21 @@ int kfd_alloc_process_doorbells(struct kfd_dev *kfd, struct kfd_process_device *
 	int r;
 	struct qcm_process_device *qpd = &pdd->qpd;

+	mutex_lock(&kfd->doorbell_mutex);
+
+	/* Another thread may have won the check-and-allocate race */
+	if (qpd->proc_doorbells) {
+		mutex_unlock(&kfd->doorbell_mutex);
+		return 0;
+	}
+
 	/* Allocate bitmap for dynamic doorbell allocation */
 	qpd->doorbell_bitmap = bitmap_zalloc(KFD_MAX_NUM_OF_QUEUES_PER_PROCESS,
 					     GFP_KERNEL);
 	if (!qpd->doorbell_bitmap) {
 		DRM_ERROR("Failed to allocate process doorbell bitmap\n");
-		return -ENOMEM;
+		r = -ENOMEM;
+		goto unlock;
 	}

 	r = init_doorbell_bitmap(&pdd->qpd, kfd);
@@ -284,11 +293,15 @@ int kfd_alloc_process_doorbells(struct kfd_dev *kfd, struct kfd_process_device *
 		DRM_ERROR("Failed to allocate process doorbells\n");
 		goto err;
 	}
+
+	mutex_unlock(&kfd->doorbell_mutex);
 	return 0;

 err:
 	bitmap_free(qpd->doorbell_bitmap);
 	qpd->doorbell_bitmap = NULL;
+unlock:
+	mutex_unlock(&kfd->doorbell_mutex);
 	return r;
 }

--
2.43.7
