Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C01748097C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523363; cv=none; b=Fgz/sA3EU1gP3c6WJlX5rEx4eIe7A3MIhwzia/0a0AbZk0jPXEPwf4mlU+6yg1A9biJAGnVUaeXTIXupRmn+mtZD4Acd4vKpRNTN6EjWEcTI5GuKXDzXYWBkhd9kccNhoovyJzP8E5LNlNmor5+jvecZqVATV6+x8PbRzgJQAqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523363; c=relaxed/simple;
	bh=lKy8rNMFKwKnprTupgzIaQKqpLuMe4GtjMhbHvYVF44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4L9mrR33yQvikb/dQlkRHj2hlMifM1pyIkyYrB7+2kOwBhjDZwPtDH32iiWGBxtqi7IUGjmORYmnzkvcr2OS7Jcg5uMm2lELXpDqWwCi0m3uWIx1/KGKMAeh/dkb04XB5r2wnsoaT2W7wtn7GpN313EIx8LYg/VQMGHZZ4Gx8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3W8GL/C; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3W8GL/C"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f4e729368fso852341a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523361; x=1789128161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyOGs2boUFikBi3LHkvK5aXbsrwegofPuEOMZO3Ochk=;
        b=F3W8GL/CZe9IzfIIX7O5GeEiVq7M4hj0A06rqHNJsvxe2FrTXWWii7kTCxfnZDIesi
         YkwlQ5DbpY0b2Z1GJEgJM98qJkaLdMP4aBnkHihH2H6rkg8nVTnLsSJn49ZAfLzZnKOG
         7DD/6dMYDDl2Qno5pt7KU0rc95GJvKLZwzRrc1GgthFAM3o7OCRooykzgCVaMIWHU8qH
         WLliGHbGY6Pi/pS9oUxwbko/U5/R39u59nPnmnVdhQqQVyCLlTu/lWevFXBBc253qVXy
         YCQUCr22wDg1AyXcem64QJE1sxC7R21W2weRl26VIfF/K7/JRVY3XWF+wQh5kFKWl60r
         gT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523361; x=1789128161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyOGs2boUFikBi3LHkvK5aXbsrwegofPuEOMZO3Ochk=;
        b=eSCiZawntJGwgsAUnMYqDPCqGA4kdCl6rdc9uiMhmXqfKJqebYWtp4/ycDgELTi2B/
         v6dZ0zlNJdcv0HQfn5tms1BpfXDZWJNZoPBU88c398vAGyVRFb7STBKGeY2em7xPby23
         7MyHuWsOcJHUhNZKte4pxSbeeP7qdtFNylrxsEjwrv/WJUtWOJHGkYFHe2cB/pwJ9yxB
         IYFJRFMzIOXr1J/UbzcHQBamDVwWaoAGby6o/OTA+KnYJXIqY4D6Huen+HURiVwEEJ/b
         vP2bdkxFlCzFH7Bovms0MIi/JkQj2O5oGjmSd7BtXnO+YX6QXU9OwRGZyClXSUiWIwjx
         SZ5w==
X-Gm-Message-State: AFuF++le9p2MYN+y5Qb4LXnUp+I6xSCYef7lrHi4xLCasbYvyzT5qZMv
	K4H1enFTC+xBM5lmiscZmuyY3WMFJTEPNHJ8FkrjHnyCmFnYFOmRNqb8
X-Gm-Gg: AYBFou0ZnjF7w4fzw6jABfLE1NyhxfQgYmj5FSslRXHjhnw8sJR+FWeFw0LTp3f6Svr
	vwiYfj1lyUg2B6glbv6cGPfXTXIuFP7qF/XObmiqLXq+xA8jw4okODh54HhidYYwiVlmpGktUSl
	H5sjXHjRmZjxhmRMJXUS4dNsiSdwz5v1CHNi47uW8RxrNeLXzYk6q5d3ovPCGdWO/uhch+uEQWC
	03eLNVG//m+VK3lfO07mtkxZ/PYQXks7WDX6czOMaGxZVOWjoaYXaeR+IoUcq58R+y3CjvAyYNT
	Jnvc2kEfeLZbLX6OrUMiVz6VSxyzpW6jpXT3mPapUSyjQlJ1rgWmOilHoihAmftmGLOgJaj4TFW
	V31hSiGqg6lVHQu5tYh1KqcKQlkRwRb//0MPzUudOdKtOwD9T0V9txAWYsy9MAEvkXMUvrvqo2d
	XdbN5t5N7z09P3OkboaBLetHtCG7YsGz7+Ds0VVR5kGd1ZENt+LElSm2Q68oQp7mY/a/dMEyrET
	tNjlYG81ojDr6k=
X-Received: by 2002:a05:6820:a284:10b0:6b7:2cab:be9a with SMTP id 006d021491bc7-6b72cabc77amr2109673eaf.28.1788523360181;
        Fri, 04 Sep 2026 05:02:40 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm7713194c88.5.2026.09.04.05.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:02:39 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Zhenyu Wang <zhenyuw.linux@gmail.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:32:21 +0530
Message-ID: <20260904120225.15868-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120225.15868-1-hemanth.selam@gmail.com>
References: <20260904120225.15868-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c            | 2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c              | 2 +-
 drivers/gpu/drm/i915/i915_gem_evict.c             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 0267c924634b..2c1f81d9c0d7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -208,7 +208,7 @@ struct i915_gem_proto_context {
 	/** @legacy_rcs_sseu: Client-set SSEU parameters for the legacy RCS */
 	struct intel_sseu legacy_rcs_sseu;
 
-	/** @single_timeline: See See &i915_gem_context.syncobj */
+	/** @single_timeline: See &i915_gem_context.syncobj */
 	bool single_timeline;
 
 	/** @uses_protected_content: See &i915_gem_context.uses_protected_content */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 1c2764440323..c007faa54f2d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -769,7 +769,7 @@ int intel_guc_resume(struct intel_guc *guc)
  * This is a wrapper to create an object for use with the GuC. In order to
  * use it inside the GuC, an object needs to be pinned lifetime, so we allocate
  * both some backing storage and a range inside the Global GTT. We must pin
- * it in the GGTT somewhere other than than [0, GUC ggtt_pin_bias) because that
+ * it in the GGTT somewhere other than [0, GUC ggtt_pin_bias) because that
  * range is reserved inside GuC.
  *
  * Return:	A i915_vma if successful, otherwise an ERR_PTR.
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 15fdd514ca83..3c3c9b695487 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -201,7 +201,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 			workload->ring_context_gpa);
 
 	/* only need to ensure this context is not pinned/unpinned during the
-	 * period from last submission to this this submission.
+	 * period from last submission to this submission.
 	 * Upon reaching this function, the currently submitted context is not
 	 * supposed to get unpinned. If a misbehaving guest driver ever does
 	 * this, it would corrupt itself.
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index c02ebd6900ae..11855d9a1210 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -273,7 +273,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 	goto search_again;
 
 found:
-	/* drm_mm doesn't allow any other other operations while
+	/* drm_mm doesn't allow any other operations while
 	 * scanning, therefore store to-be-evicted objects on a
 	 * temporary list and take a reference for all before
 	 * calling unbind (which may remove the active reference
-- 
2.48.1

