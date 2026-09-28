Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA00470EA5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583313; cv=none; b=gQdiVs1ki7DRqWnJSbTqeKVtgxzWikFm3zrCOC/Vom/floGCEa6IApf/6B3VTUItnzeh+Nfg4unwpcRmXOUXM2dSg51qErQjf1gBqy2RX4eJg7RhowAt7p7GP9sh5umu68b8OjcjnE22S86W3sD2sdgLrmLazE9ajupU8Aj3cJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583313; c=relaxed/simple;
	bh=eJiO/FYrLlV7xeZ+gg/DbqurbXD2F3ZS67N63yr/0pk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e4UJYlEf/brzNK0tB/BytexONnWZtcQPO/pwkYOrS62XpVap8QXqwzJOJyd7sEeFuPlzwTijXPJAN3Te7DiZDwLpBMzlkicQjCgrtLt5Vac7r0LyaTliI2C1PjkbFNkdUdvO4oWwJ26aWM9+Qnb5ZCszpxMYfP/oLLjdSUHZ1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=od4VucFb; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="od4VucFb"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df90e859e8so8468865ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790583310; x=1791188110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PGFMLkqPdnEjr3rj+p66S6V4/orGCF5/967SLXqniU=;
        b=od4VucFbma5nokHnVBuNU+YariaerHkpUckMjYGz3FGaUjGPuDM6SN9Vh93Trskr7V
         FPYQp2Yh1oBNZe6F11qBHK7In40aEIKwDZHhOI+rbDBt8q/5NE/v2r1i3ZcQkofGFvw2
         JGJuXr3dwf0wDst0kWdU4rDXFTcXp3Nq3BrcF3D5iIWCQk5c3TBjuzgakmRwjtXe9QbH
         9LwLdo7zCe0rRasWfNxPlrLBt0A8gcTelkRHUJ/uykjuV4w7iL+pq1QgcAphUSZieIst
         GMfYvLEyVkJhSDN14FIuZjBNG8QheNLma9921DtsurD6+HuCVyk+pY5C7+5NYR09T9EL
         vrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583310; x=1791188110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PGFMLkqPdnEjr3rj+p66S6V4/orGCF5/967SLXqniU=;
        b=FHN4KLXrX7AS6WHJgX31EMi0+SSnlnyhRefyc8ByNjclLRHIlxPt0QcbCPbu/PdJfH
         R5d9IEpdu9tmx9+5QJlLZFjZB8++3Uo0kwIorUqhIWpNSwxV253SSo+PAvf3Bf8TOCaX
         Ea1QaXKlqHRPX2XX1EdOzTx/BDtXXO9/b7H6EIqMXfcmdxFflvPn1p7yN5ICUDEZLiDj
         CAQCUs6M6Nx0uaUwK2uem8gsUAvkutZAVOIt62S1NW8TzLAuotSdGLvnlFiCO16SJ+Aw
         VBd1CXIT2GoOpLRjxrXsvf+YMNEEEv2kAhJtXdXl+vUg8wUNHXvXs5yGIB8MfCa2oRSl
         TCww==
X-Forwarded-Encrypted: i=1; AKwUvBznq6mdDbXuS+cnze3pHTzBW4t7O5J5y98M9g7DMWm1qJPAC5WdNpTfgyMgrsf5YCUR9hJEmP1fabM3aBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4XLBK69TVZHqYj5g6SZfR9cKv8h3t9e7H4hxW00Tk16pxX4RY
	+6bEDB4a2GHzWOrnejzNjsghVux9rqM9TPbrWnkRzEIk+i7al0hTXlvu
X-Gm-Gg: AYBFou1O+deiwOSlo9Ry01SrcIfepaOVdqsqe9MuSVpa6j1G+vSHnAAR/zWGgedSIo9
	FbkG4G8/mZvmeh3gDjg4J5BPwHlLnE3GKuoTEAzlKeDZ+xpLnBhHtJhEbAHbMB8rt+qFlNMLZFW
	+Eh+AsLoe0LDtIX2GxyRbl8sxFy5v/8+cuwBjXs5M/mq3tnhKSBFyLA1ZBNCDmQlmYcHAqWPsWi
	kyEYmqmjlSXetEQbVO8KcRMyfzKgGFKmXsWFd4IiSLmdUyGgXcBMWuUbf8Nb8uJS4kk0UPgrQbr
	y5SH6E9hlzujy/xUdHHl8OHjUhaK6DymbyrzkYYaQJ+vY9No619F+C48jj0HiRPbrzLYf1bxAFq
	AiUtHnAFGUWReDc5uzHbev1qg9Hr9kbuWbN3x70MOUfirSeoem6yM4MiCC2f6R5NnJo+4+znBGK
	lGblekIePILIoFhF6Wpq3KfSw5hgIFKH+24JF/Wxxz+aDfYDhbe6NSUoYR6zLm8euRIxz54cjgH
	YB0sCBC3Qx3UuCAIXL+xV5VLUtkbn5Iv57gX1k=
X-Received: by 2002:a17:902:fdae:b0:2df:67e8:4a39 with SMTP id d9443c01a7336-2df7dfef6ffmr74050975ad.10.1790583310497;
        Mon, 28 Sep 2026 01:15:10 -0700 (PDT)
Received: from DESKTOP-HOME ([2406:5900:111f:dc2a:3071:69c7:a4c4:6259])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fb675bsm37833275ad.10.2026.09.28.01.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:15:10 -0700 (PDT)
From: Beomseok Kim <dilddream31@gmail.com>
To: nouveau@lists.freedesktop.org
Cc: lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Beomseok Kim <dilddream31@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/nouveau: Clear fence channel in no-signaling path
Date: Mon, 28 Sep 2026 17:14:50 +0900
Message-ID: <20260928081450.19340-1-dilddream31@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nouveau_fence_signal() clears fence->channel before dropping its
reference.  nouveau_fence_no_signaling(), however, removes an already
signaled fence from fctx->pending without clearing the pointer.

The fence can remain attached to a BO reservation object and be used
later in nouveau_fence_sync() after channel teardown has freed the
channel.  This leaves a stale channel pointer that the sync path can
dereference.

A diagnostic build with concurrent short-lived Wayland GL clients
observed nouveau_fence_no_signaling() with a fence pointing to channel
C, nouveau_channel_del(C) returning, and then nouveau_fence_sync()
attempting to read C->cli.  A no-fault read failed after teardown.

Clear the pointer in nouveau_fence_no_signaling() to match
nouveau_fence_signal(), so the sync path uses the fence wait fallback.

Fixes: 29ba89b2371d ("drm/nouveau: rework to new fence interface")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Beomseok Kim <dilddream31@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index edbe9e08b..5b09cf134 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -488,6 +488,7 @@ static bool nouveau_fence_no_signaling(struct dma_fence *f)
 	 */
 	if (nouveau_fence_is_signaled(f)) {
 		list_del(&fence->head);
+		rcu_assign_pointer(fence->channel, NULL);
 
 		dma_fence_put(&fence->base);
 		return false;
-- 
2.55.0

