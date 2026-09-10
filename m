Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB5E4772AE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056020; cv=none; b=rzXPltM+cWSfJjjJTT+0HHPgwmIi0pIkjLredoJesXnsm7E2Y8dCOSjVdBtQ8QIe6e398QPGtS2cVUHYkuWV4LUnWqF84se6kbbJVj8Vj+Ag9iAIM3iR1OAakvZ5RbERDZSzekl1YtzLI8qRb8Cgcpp0XOhVA/GjbSPSzpG+3Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056020; c=relaxed/simple;
	bh=TnQXoS38wBDQ0fYg3BINxDkZah/N2z408lV7zZuFq2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lzPBjTGCsqfAfpzAUKk43NVruuC54finM+a4FZ6dWVaTMPAESKSuprWCJ50CdTCvA0My9A3StaO4iC1nnKrTeRYKe1Mc+ngUOltahw6TXbu9wwnw7aXa3zMovdrwSmeuCGkCViLmrmgmj5d5a19Nc8o57Uj1YrMWY+fwMsIUD4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPGkKkvq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPGkKkvq"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79fbso12275535ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789056018; x=1789660818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bXD/U7hlVPQRpHS1AI7lVEOW2y8sGkOWMG9ZHqUS/sc=;
        b=CPGkKkvqc38BMtexpds5Hm0gcZXw39LlHWlHMelZCiLyJbcud0iNSvf9C2q2qkVHl8
         uRAETjn3b0cTO3zApan2DaH9YdSABL7E0S7AKuPRojYgxgkiMjhUQl8CxwpB8J8KVsyP
         YNqt8uVG5yd3XdxgBH6b1stfzdJqNSvmmrD+lJM/HN34UBvocpHk7fO3rq166HcBfmRk
         i7offLWrznOo047vQa+U4ecbFQ39QAHu7GUJCFceTQVFfoILmOGQcXSxcBk038UXlsDV
         WrdIK5wwWQ3/trMtE6Fy9k9EDONnSNYaRt/KkprECrF0VwqFXm1GbMUbgmr2M0Ky3GAR
         Z+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056018; x=1789660818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXD/U7hlVPQRpHS1AI7lVEOW2y8sGkOWMG9ZHqUS/sc=;
        b=ND4kcAMeFq7xN+hhYNMOABx/EJE8iCE/hh5C+93fKNV2JP6aO+SdCwXILO1M41ZvK8
         seRIkTksrponRK0otuSECUmQjYB0Kv28VaApWTqfdNh4/p573ceetpk9ku/mDkfxQuhT
         2IG5QV1hual7Y/zdoe4+MfbyF5Dv42tUO30Tz+lOhGbjpRQpn7IEM1PYLfF011glQgf0
         P1gz0xTC3WTryZf26M5T7fQvMhU7zFBsyidF5GKRdVu0XI/gjTg3sRTA6YFotmrzQCvf
         lkiipN60dJbfdtzC0PFqErY4f5/o5k1lVLvQ2/6j9X7WkbyKWVaf73lOxnJtCwy/Zc+m
         S+Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwWIkpwRW8hPSh7mJKZuWgY+C4Oybnw84ypaU5Db1Pku6MXMKzo6NAHqgg9F0gk9RUNT/kCBKYQX604wKM=@vger.kernel.org
X-Gm-Message-State: AFuF++nU/SjVC43XNYlJ5pRLJmjzgwARoZK1fbq87i+m3hNGn4Sx8TEz
	FcavlTtvViAE2g6HN3O6KgpEJ6NwvWFE/gB7tjWIBBOoT7CRUTwojQ8W
X-Gm-Gg: AYBFou26qRlj3mcT93bn1Cpfl0QdM9WuQzii0ZfRjM843utOKTzyS69GODTWHlcnipC
	QuQ/OqQJkXvhTYxZbg0s234Ee+ulWEKo12qyjpi3dq+u4ValDCSeSNo5J6YiL93K92y5MsRdhHb
	i/wDqpQ5jDvWeaxR/AaI4Xo3nT6eQkfbpaujbWtr37DGbkgYL2ov8J7BAAKAhTWhJNp65vyYlQj
	01TXOTANkRoyAV8YQgsXOvpivdk3jqQpROvvtWPUcVpVWYfjHTTigRu7u52tYT1YolDc46c/qXk
	aFbiCDYkG1O8WuPt/Unly2RpnRCRlFAXT1nWAMu2uWsiv5+wGDNmE+jjxA7A48f8xiDVfnnNShH
	ILB6A2eR3UcCo65NogjKf8KEdNzq5u6TWR4dRUKdrSAGj8Es5b34/sQ8GMBvHtW8afd8ksmGDM2
	0l7gpTNHrmM7mSYlc/q+KQu3SxaySK8rSURYhCl+OwSEeWwbGX6A51xUG76QCmzrj6+Arn5CE=
X-Received: by 2002:a17:902:ea0b:b0:2d6:3c22:99bf with SMTP id d9443c01a7336-2dd2a1ef505mr1333475ad.9.1789056017830;
        Thu, 10 Sep 2026 09:00:17 -0700 (PDT)
Received: from G15-5520 ([103.206.144.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1becsm15350364eec.22.2026.09.10.09.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:00:17 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] drm/i915/fb: replace kmalloc_array with kmalloc_objs
Date: Thu, 10 Sep 2026 15:58:45 +0000
Message-ID: <20260910155846.79513-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining kmalloc_array instance with kmalloc_objs.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 1c0859d5f829..c3e4c3f6d8cf 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -596,7 +596,7 @@ u64 *intel_fb_plane_get_modifiers(struct intel_display *display,
 			count++;
 	}
 
-	list = kmalloc_array(count, sizeof(*list), GFP_KERNEL);
+	list = kmalloc_objs(*list, count);
 	if (drm_WARN_ON(display->drm, !list))
 		return NULL;
 
-- 
2.53.0

