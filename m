Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB03839E9BF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857319; cv=none; b=EIjUkhgz45788m3mSJ4Phdt46LPLDRQ4jW/eM1VT5hS8XlmUaDlGJhq1CO+Z6UNuuPFn5hz+XTdHojHL9F2GdwHLzNi10LgzZIZr1fVALKj8PLuOVwy38G1IpcLuC8H1THALy8flipK3fsRvkw8rOeU3iN7GtUW3Dzt1xwlQN+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857319; c=relaxed/simple;
	bh=NNcvquNZeteRFC+x1bptk99f2y9uQ1gnzV0ubJNxqIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jo9APPqh2VhIYQRlblQgzDaFzyXJWdSxN0vkmxsiM1+a3AyC/+bqhKXcWan1O7qqbXab5uhX0W25wjyfKJ+ykD3co0uN4i+i14Mf3svb5QtDTJIwIVLv+8pioMyMYFAObQMptqn23zJ0vtcwWA6EN4oRUjjSmakl1sYVa83XcgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JD2bzCU8; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JD2bzCU8"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef4so2091306a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857317; x=1790462117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sWVtXHvtsUvayjaRC+3RJzYPnLIstthkOPPeTp9RMJw=;
        b=JD2bzCU8iOni8CZ04nsG+mewREkdpDf+W6O7SsUa8sffrRqUXhf44vlv/4Ons9vfA9
         H0labByiuXd42RHEhohGH4Q1qjVpa0/82B05x+E5MkJ10DDWZM9WQx/ClELpT1hRip5Z
         vTaOSCsJaCi5pId8Kyx5EttYGb7tHYVMyu09tCyhKnLMsQnt8v8N041M5yJhnE9Nk6mm
         Y+kCnC7qvepR9/CrQ8I6R7NNIkKnEvVGd1oNJFUjPxIC2yIOXf9d3AoYHXiKLqM04u2n
         K8hn8TM0v6naHgZ3iojTuzTccWR7YBNJWj5XUeOxIS2jp3mxPNb6V2xw6BQbAYMI4Zd+
         IEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857317; x=1790462117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWVtXHvtsUvayjaRC+3RJzYPnLIstthkOPPeTp9RMJw=;
        b=OhNHXZycHEOYQqRT73JYTkMTpdDQybmat4+U28KRvI2bICfpzsNDBnDPJc6wIHK1xn
         GcMq2tLB44BSm/MOTeeH4FLBn1bl1N4npPPYwYqXeo+DkvRRj7c9ATAInTrKcxYDfFsf
         ckX/9cqvc/oRkzJ3gtC9U0Wew8d8Nv//P2xnb5npN84YKS4ytI+OQmZjPIFp2l8IQrCb
         aeJhqQM/TixweyKQur4xhm5Jign5fM46UKIbypWdDTKLN4NyfLkPUkUrkPMYxAZ0f/xu
         VyzrzyIotu6HZddjMJcoe9wruzIX5XmiGUewLIviGoOPMf8AElLPWNn/jxcXFzSygK74
         E07Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+LgwRPNY3Mjrg2ff3nbdGSFQxqQiFnGdRt4mDW+4xtVcfuDJnm5wGttlbEPPb2YJnICk6augRR/aMiY0=@vger.kernel.org
X-Gm-Message-State: AFuF++mWo+PlkH1swoOMsdytBn1O9B4eFRcVK27f+V+x42ptCLGMpwIz
	Xc/2aL1aN6Ucx/leohJ+wLMVUKrwl1T+5NTf6G1teqji/Xf3dQYE7aJ5
X-Gm-Gg: AYBFou2MeeLIOYISLkVgDO1JgcGgxT4k/eule4o2IIh+9wdTMspZU+85Eq57t7iOdgy
	B40AIrXWcMyLCT3NCf2Gz0ZqvZGk+nCiP38RyunYvA/vRVVpRqdwQX8ieWU8pX9ydEDRN/pa+9F
	73OO/BddZmkjiiM41bAlYzNqWgPEt97csMfqaRgPxt/481RM6FOs1RfJpV0XSHBchwzrbgx1DP2
	09gZsq1CEWfvbVqmvStZoQSn6zr6x0YRG1bI9bwx+eoLu3vO9QGBeZ0b3FpsYNS1AZ1b4EjZrdP
	9ODF91K97NuCNVvkZvDj2B2R+tDV8wwm+2QJN8CvA5/lmX6y+SkMtP1+PfLsZyhWRmqYAvPgdhJ
	1BSXmmfIxMLWL85HKN22ORBs/phu1+Lu7+4jfsXY3L1mbpF+rmlUTpxyW+2y4t3PPHdlI/g244d
	tZsYgPoONNki3ZEttUo6/RVt8Q+SLoHHYNNig5kAOwaa9Oc+HrigSQ6DQrMKb9+3L7HH0RGFB/W
	DNGwTt8ZPSGz5xOre6gLnZLkh5/xXNO49VmL9UkuxzDy/NOyNXMP+D/xEKiE2NfDGJU6gPYuQG6
	dDePY6Oixg==
X-Received: by 2002:a17:90a:c88d:b0:39e:4c81:6c94 with SMTP id 98e67ed59e1d1-39e54f24890mr11527341a91.26.1789857317078;
        Sat, 19 Sep 2026 15:35:17 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm6307621a91.17.2026.09.19.15.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:16 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: tzimmermann@suse.de,
	jfalempe@redhat.com,
	simona@ffwll.ch,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ast: validate framebuffer VRAM size in ast_mode.c and DP501 firmware bounds
Date: Sat, 19 Sep 2026 22:35:16 +0000
Message-ID: <20260919223516.3889946-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/gpu/drm/ast/ (ast_mode.c, ast_dp501.c), verify that the
primary plane framebuffer fits within ast->vram_size and bounds-check
DP501 firmware headers.

Fixes: 312fec1405dd ("drm: Initial KMS driver for AST (ASpeed Technologies) 2000 series (v2)")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 6d6ccfad1415..d9ca8760e5b5 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -250,7 +250,8 @@ static bool ast_launch_m68k(struct ast_device *ast)
 
 		/* copy image to buffer */
 		for (i = 0; i < len; i += 4) {
-			data = *(u32 *)(fw_addr + i);
+			data = 0;
+			memcpy(&data, fw_addr + i, min_t(u32, len - i, 4));
 			ast_moutdwm(ast, boot_address + i, data);
 		}
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index d5ed8c5c7925..bde9dcbbc32b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -510,6 +510,7 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						 struct drm_atomic_commit *state)
 {
 	struct drm_device *dev = plane->dev;
+	struct ast_plane *ast_plane = to_ast_plane(plane);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc_state *new_crtc_state = NULL;
 	struct ast_crtc_state *new_ast_crtc_state;
@@ -531,6 +532,11 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 			return 0;
 	}
 
+	if (new_plane_state->fb->pitches[0] > AST_PRIMARY_PLANE_MAX_OFFSET)
+		return -EINVAL;
+	if ((u64)new_plane_state->fb->pitches[0] * new_plane_state->fb->height > ast_plane->size)
+		return -ENOSPC;
+
 	new_ast_crtc_state = to_ast_crtc_state(new_crtc_state);
 
 	new_ast_crtc_state->format = new_plane_state->fb->format;
