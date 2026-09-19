Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDFB2D73B6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789838264; cv=none; b=gaholPSOPeAOZjw+a5W4a90MQLI7KQxTgcViAOaKPUmeHXFHC8fw5389aKn2ITJbU/MjNI0RoboCAqjxd9hpgJTq427yBEPK9TGRrC9aFvS2jDzf9IcoNDjm2MCSlSrjlGoEYWK0JvaqiSIXR4zmPfjnlXlWn9hHCevjA26NUGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789838264; c=relaxed/simple;
	bh=zZcEWKNvvhjYGtNKjvZ2y9HOEYVHDBGGsfcyr/qCUkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W9t1j9d7452xT81UzNFsNo9z6icqHH5g+C3unsaZ4+id54bQBQObpUVDypINVcjapfzDh5SoMj1SeuTjOk3uleALGO4nWK/b1IpEn1o7EEJvBnnvAKnLUKydQlQSRV+YCYEeJaBXfVyN5Tg6zC5pkXhzxdRK8h/Bj2/j3QKH334=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4ZLUR+A; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4ZLUR+A"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647184c73so2335088a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789838263; x=1790443063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H22gG3gfK534GA7eikUt6vOg1Uc/mcVXz/VN/miRKww=;
        b=k4ZLUR+AfcT81sKnPgJNSDNTxASwogEG5CPv3850zfrnLYdO2wAhpy15u3zbH3QQGg
         vlWeeRvsQNqaeD9PX4Gk2FdAB3hnNddh1yL8D2DVEFxZRzx8KI4h60LkhVeCjwt/eZ8y
         0cz1cuYhZo7IrR63z1gpX05vR+6YNyk1uupWw1pHLnSb+bxFMgQKf6KAGpWRBpEWrhTU
         u1nehxPTaorE7TJ0LCnId7+rwZ0QTfwBW/mod7AGsXfHUPabwNNZFBSAkTUK1fUpJG1I
         gYmDhaJvhHNJUOZqEGhYJ64ZNm/FnnywaIO71PzRO7koTyft+XlDDrVfwp5XuAxL13n1
         Qi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789838263; x=1790443063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H22gG3gfK534GA7eikUt6vOg1Uc/mcVXz/VN/miRKww=;
        b=Rcn+hMRTCQ8DlWNEVSE8YpT1VcXY3v16igCDQ9gF/4QMD8l3tfCyAVzj+Vh5i+zLFx
         mR0OAdH8gCaExui8nktfR8kl0TE9TF2UqrbU1/7tmSimrGedTIhJ6G085ngb+uQYFFyC
         y2oY8AO7cocNrFQBVzNCkLk2pFMuqI62sppSpwieo1PQWi6sW2tb4kYQduT5Ass2jaHW
         cwjINrvCXYCSLwJ/mNvsB9S4Oahbn1mYgZWyiHu8AErsVMdsbnTuWcT4DfK2FX3QSYtr
         XfP9ca4ft5kIqXQubv0bwyPDcQBAieOyW4jVqrzp32eNxqVDtKn1MxDOT0W2vuu9nhSr
         uxSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx+L27spEY8ZWpIfLGPDvt7x4HE3LraI/dAYZFG+oVYSURNOWekbLG2kuMrgsQlGALcS53wFPNXk8GUII=@vger.kernel.org
X-Gm-Message-State: AFuF++kQCAw+fC1RF1ffgjp3ThXplrIvdlqKjgxSCNtr+kt9DG6ed/x5
	NQQFmd1CNpv93XCwiJFiynYc753vGDyt94RdVOKkOnY9fe5wZhLZ6GWM
X-Gm-Gg: AYBFou06Ic3WKixJldmRrofG0Zcse10mkxgMpodz9HoxAPbntew0ihG6iIQy2mobg99
	8up2toaY0V7l04qyekv5s1HVIaCxmrnNDM5X9k30g/PzDd4lQPKJiHZKYYQ79zkobtHtWWv7JGB
	opPAsREixQjA25fAUEYiTJuNfHaE6Q2GR/8RZr8Qb5nYqicvQbxQunjHM9luRmSb5KyWfJZnhL7
	23sdfFMxrI8AyK4IKPVjJKOFFIh5YgJiZu0d7pfPtJMuE9mW4o5BOBVVKT5ideN/RpUYT8sNFFQ
	9xkcIss0uE022eTpxUn5TQL7tTnnYVUnaU29Xsr7jtYpA8grveuQZi2zVeaeaKIlgJ2/EVzkn0+
	V/m/VmXii9MjhJ4qDqZ4olHqJXybGDsm3nrfcHdvSXETaFMg9CVNOz63y4o5mcuufzgxlnCZUJi
	UQWMjgDWQhJNSY3xdMa3dyQ5Sngxwxv19tON7+0w9qPcK/g/HfPoHTGX3ubHjEha/a
X-Received: by 2002:a17:90a:e7c7:b0:3a0:25f0:d89b with SMTP id 98e67ed59e1d1-3a025f0de30mr1987486a91.50.1789838262634;
        Sat, 19 Sep 2026 10:17:42 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55e71a4sm6919949c88.13.2026.09.19.10.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:17:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] drm/i915: fix mock ring memory leak on context allocation failure
Date: Sun, 20 Sep 2026 01:17:10 +0800
Message-ID: <20260919171710.3699710-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mock_context_alloc() creates ce->ring before allocating and pinning the
context timeline. mock_ring() initializes the ring reference count and
returns the initial reference to the context.

If intel_timeline_create() fails, mock_context_alloc() returns without
dropping the ring reference. The same leak occurs when
mock_timeline_pin() fails after the timeline has been created. Since
context allocation did not complete, CONTEXT_ALLOC_BIT is not set and
the later context teardown does not release the ring.

Drop the initial ring reference with kref_put() on both failure paths.
When the reference count reaches zero, intel_ring_free() releases the
ring VMA and frees the ring allocation. Clear ce->ring after dropping
the reference to avoid retaining a stale pointer.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 75d0a7f31eec ("drm/i915: Lift timeline into intel_context")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/i915/gt/mock_engine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 79741f043f03..fa4368730d33 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -170,6 +170,8 @@ static int mock_context_alloc(struct intel_context *ce)
 
 	ce->timeline = intel_timeline_create(ce->engine->gt);
 	if (IS_ERR(ce->timeline)) {
+		kref_put(&ce->ring->ref, intel_ring_free);
+		ce->ring = NULL;
 		kfree(ce->engine);
 		return PTR_ERR(ce->timeline);
 	}
@@ -178,6 +180,8 @@ static int mock_context_alloc(struct intel_context *ce)
 	if (err) {
 		intel_timeline_put(ce->timeline);
 		ce->timeline = NULL;
+		kref_put(&ce->ring->ref, intel_ring_free);
+		ce->ring = NULL;
 		return err;
 	}
 
-- 
2.43.0

