Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6C374735
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523300; cv=none; b=oTuO+IsORbhkSCKS6KN9ZJXZpguyTFprNRR8nMQ5Wz/kNcNbBUvVAvxQg+wd1wRq5ubVPQW0+VEC5/jDJlYsRj1OwV/sY5qkPoG+0us5SWGXtZ+lxPbJGs4hM8XbxI5lvEFrGqdVHJyEWYD5nWw/XuoOCJpuR7IIDrg6cRst0G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523300; c=relaxed/simple;
	bh=v1ULYGMMTJ3vViZueix+oqcnqaIkW97826fV8W+wNpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stb8n9iE3ZMHyyI2ys8M9R4B45DoM5FicCRweTdncR6+/Yf/9IVDfOn4Bhsxvo5aqEH4mMgqOevofxRtxxnvxloH0vdJevZmvSrLum/VQqw2ZD7Jl+1kgRz01NLsLDVl0PbwVLCN9o0GtIlnVt0GwHBAKLW1DkSEI/EDN4nZeqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KU7nWHwi; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KU7nWHwi"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b1b3d7f10eso625831eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523297; x=1789128097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1XyZzGqo8qtOw6QCVse2xuLQ0fYOXbEWeooM5I1+Fw=;
        b=KU7nWHwisI1yp6y0y94E6hbIlsP8chVGdkiAMxz5du/F938Ko3OsvwiOR1h9KBnjQw
         ltI1hNPQQa33sZFJuqARtCvsOrKSX6rPZfqbgJNNZQ7i32NJy99pi4O5BaABoXs+B6W+
         uJqXgB9tVRbNkT33fZvJJLJZkMhp6Aq173szzpctwG2bpx3/CCQx6WS90CneJZqBt3h+
         MMw3vOA+Pggt0IdUK3yOdavldSUvP0Mu9CZ7HU1vD5xYbgonMdLxwjyHVFKAT1hk60mH
         k1K82OVCQ/PIxaGcKy2FekXZMembhRGyF9D7E8DNJQt/C17h19K+U1hlSEIKkofOu6zz
         r9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523297; x=1789128097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1XyZzGqo8qtOw6QCVse2xuLQ0fYOXbEWeooM5I1+Fw=;
        b=pK8YcKt3yGtP/fMsuMPxqYZ+b1gNAzq4448sPfokOdXj+yrBqgJ6XFKXLWmsCm8KsX
         iNjaam8xEj6gBrkDCzS4WsoeKtR9NIQLSmdni2oTRKRf39WTyY8t3DtOciRv7Sa/W+Ib
         1VXQnXW3xM8K/Nf5B1+pJrUBIs1vZKL4rfXilR94HxfoAZ8sj1D2NcyoHgC2D7K6XVm6
         gxVTsGkdFEFkBLfGdF40SKifHW6YXnc7PFPD5URYIF0iy8hRC1rgmXfOTnufsQdaIqlD
         Duz1BjV1Hzi6LPElmYQ+KFzjuRp7nWgF8MYTrLDKuCHDGVcm89+4V2JkLa5PeEgcwYf5
         Jhkw==
X-Gm-Message-State: AFuF++liAqQrTyMtPFgl+v/1ebfO65NFcB2iuI1x6/JvAAsuPPR9Mo4M
	7lzX9ZZLW9/cak+HVveKyexaoU+yzzHcU4jGGBO9o8HdGkgQjAuHYLd2
X-Gm-Gg: AYBFou3IfN5XzGGveveoWFGhpA7TYXRcS8LfhsqJvvrQVl22+sFp2/Mo6LwJl3UOT6y
	7u2++azijI2vzYYa0b7D6TK24g8pG8GS9czmgJKrEvBQ2AeC4nzn4ks9eJSeeeEl9k8M4FX3k8l
	Qg02RbRb+5enmW18VnVsVPeZCFlGaFOam4TCQEBWkToj6B01tbHeHgICQh09anLN9DJHrMCboIn
	CSrhHrQHiWG22v60/x8utLrtvygUOmM41cVA7e1NHkeeAQ/WnZkCVRkMlzbs36yFLs+FkxxBt0j
	9f7zFhXloHdYMuWd6hsUm2kUTO9T0FP1qZPlIeh4zXYMMlGfwUkjwfdURUSPBFNyLFTewGsUQP3
	+k6QAjWncr5w9DJpf3zUANxtyIBV9OagNS4AUDvWi1mmpr81PIz3VtDeVdNk8PiZAJwLLM0Z6+H
	oRXg3FCgK6XhpuflsZ/p83RE7/mfr9XIPd+MDz1alOVbl6DsRU3txUlAxMbszEpm7NcWKdpZOE1
	WryP+QYd1L28eY=
X-Received: by 2002:a05:6820:1c87:b0:6b3:6920:4ca0 with SMTP id 006d021491bc7-6b6fabe1ff3mr3531638eaf.9.1788523295847;
        Fri, 04 Sep 2026 05:01:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm10164241c88.4.2026.09.04.05.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:01:35 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: fix typo in log message
Date: Fri,  4 Sep 2026 17:30:09 +0530
Message-ID: <20260904120044.14303-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120044.14303-1-hemanth.selam@gmail.com>
References: <20260904120044.14303-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the misspelling in a message the user sees, reported by
scripts/checkpatch.pl using the list in scripts/spelling.txt.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
index 33c23532e29c..c0507d9193e2 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
@@ -1759,7 +1759,7 @@ static int tonga_populate_vr_config(struct pp_hwmgr *hwmgr,
 			table->VRConfig |= config;
 		} else {
 			pr_err("VDDC and VDDGFX should "
-				"be both on SVI2 control in splitted mode !\n");
+				"be both on SVI2 control in split mode !\n");
 		}
 	} else {
 		/* Merged mode  */
-- 
2.48.1

