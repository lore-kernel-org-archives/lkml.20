Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E0B429038
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149174; cv=none; b=PBc+9vd0ZfLUSSY1n7m2G+xULZhynBY+ff2vW0iYbQT/TICbaCnlpwRIjzBIcVx89GDsdDXVu3kHmBq3uzLAxI0RbKC+Atn+1hbxt6tEn5FYf3lalLHC5DxE0UpJ7fvmFjTt6ZoI1cI3J9/+m2kxwoiml2O8gvfkmLQSSzOvSR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149174; c=relaxed/simple;
	bh=Lmqd+koWddn+ibQQDLmnYPRN5lrKZdaYwps4HHvieTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nHivwbcaHAKsJ33aCYFbNZ4JsKshwKKi98ZMMQ6cxJ+Uh5CiWUH45tDb4dDuZSJfH8tK5yLvWYdlO5Kxy6Sh7Ssv+Cbp0LEbSE2ITRNZqgdujt5Shwm5CYWnBeM2jHzem6Bpoe3ZoxL8WZUTf8w5inCSgpAEYgcjDOeUHqITeok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVpcvsgj; arc=none smtp.client-ip=74.125.230.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVpcvsgj"
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3a49e7d0b4eso3452981fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149170; x=1790753970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzZ+cNf2z4J5z3qvFn6/NJ8ACjL3I/i0NM3vzaSh4n4=;
        b=lVpcvsgjfGwqQDvCugOFWspvi+f/yzUhaaqli6iYdMAI9ZIqzexzt0XhOp2KX77kWR
         4WDd5FQpiiTXMwc67L5MBJ5Fe3f0Qni15rad9pSap6zSBRlYMn8h/OKA474fkD7eEuWs
         zYbznFqPZvEocfrxJMGW/4wyqvnkUoSQ6c3LVemanheDOc6d4Nv/Gb3Y7mWroDez87Oz
         T6oIehHzCcr47wSzArZdI9xenDLxb6ENV0VRmHNGcE+nLN5sOLdDWEoWjjb0D+dDUQ6Q
         3bdBWhqFA27u8j8/U7h2iJerDel/w668V1ukn0IJ9IhB5QEa3z1Ppvzc+DTCuYb0p4Bm
         0tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149170; x=1790753970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzZ+cNf2z4J5z3qvFn6/NJ8ACjL3I/i0NM3vzaSh4n4=;
        b=tHoKgzgXDVnGn3d+KwvCpjkWzQaZ8nxdxode2D1ykw9Lx9cHsjQYByXucD5i79UJAS
         kXBtUEV7I5+PtCrnGA1QMRbvl3qYnnTafXJ/H8Bsu/Se3E9veLESaeOeh8QRgjBAtESq
         7Eof3aQ30IuA3MM7JSqFx6E46WsXCNlZHjmV9bSXa1guVuXKnkqBw54jizzSJ5h2Ft56
         5LLgnPjFuuxJWQ24/UfuRn3/I/7v5qsxOpC2C4BW2+7ySuH6tUFKzXKNMi+PZ/aIHmfu
         JZoGejr68yaxp1G04QzF+iLyDqieOgCs3YISYiTLL2StBV59Y81fN9H+HLMy80im4VrA
         /V8g==
X-Forwarded-Encrypted: i=1; AKwUvBwnJQx7JPJSaw06HZEOz+aN+UdwELmqo70sq5zOIWgq20CEPrx81nPAraqNx6jesLmdGGNjvoYVEK1/OoI=@vger.kernel.org
X-Gm-Message-State: AFuF++mj4urvrQ5lqofIXhgtrKBRZ+IlsxtU+yPEPxzTmYA+xmoxsHVN
	JFQpTsrHvv7ZLnRknn31h98qirAKxSS9+O8Lb2GP381Izt8NUvjmYPFc
X-Gm-Gg: AYBFou0pk+7kd0ew1xoJsP8NUQ5npyohf3gAAzC+uS6F2+qzMK5GPlrCvYRWqj2Uno4
	gYI6XXbQKjpiJntQK/FTk4hsBSPzUT8OaIzTYs6i4Jj+HKCLPs4fs5mBnjIIitebz8KllQwQ25O
	cArEhiR46yuyVka2wYznWosX85T5ooKtCe5fku7N2j66rJM1qF/MWp6EnyokGrmPLkO6j785MfA
	R6R1RixqdjFHrpVr+G6SuwaG7Vokc8XsO1pp44Sw8OcX26hS3yB1qXcPe2cvB+4p3OTnrw6mFFx
	ATB4Rejg7VATwROTRP7hfbyKkv0w2eBuxD8sOGcVVYvmZQnJ9mwbXqVcN5ojZdDw5Fs2+FwouPD
	V/NsI1dluofFqaaW57NanwrkuVRw5cAlxifoQ3zU7nELfuhqPV5vWjImtZ94jZxY/V4KwyVprlb
	iCGhUDx9cxPbEClbymWuEcaTN1qQXw9sMTVeatRlZ5xUtpucoWKwS+QzQlFT3T4p7xebso1w2vx
	HjlXZGFqjF/AT1U
X-Received: by 2002:a05:6512:3996:b0:5b6:1a7c:59e8 with SMTP id 2adb3069b0e04-5b8d8ac9b9fmr472193e87.66.1790149170031;
        Wed, 23 Sep 2026 00:39:30 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8580568sm395754e87.34.2026.09.23.00.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:39:29 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH 5.10/5.15/6.1/6.6] drm/amdgpu/atom: Check kcalloc() for WS buffer in amdgpu_atom_execute_table_locked()
Date: Wed, 23 Sep 2026 10:39:12 +0300
Message-ID: <20260923073913.39211-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guangshuo Li <lgs201920130244@gmail.com>

commit cc9a8e238e42c1f43b98c097995137d644b69245 upstream.

kcalloc() may fail. When WS is non-zero and allocation fails, ectx.ws
remains NULL while ectx.ws_size is set, leading to a potential NULL
pointer dereference in atom_get_src_int() when accessing WS entries.

Return -ENOMEM on allocation failure to avoid the NULL dereference.

Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[ Roman: added parentheses to the 'if' statement, matching the upstream
commit. ]
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2025-68190

 drivers/gpu/drm/amd/amdgpu/atom.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index cb6eb47aab65..0a7666be1dea 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1228,10 +1228,15 @@ static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index,
 	ectx.ps = params;
 	ectx.abort = false;
 	ectx.last_jump = 0;
-	if (ws)
+	if (ws) {
 		ectx.ws = kcalloc(4, ws, GFP_KERNEL);
-	else
+		if (!ectx.ws) {
+			ret = -ENOMEM;
+			goto free;
+		}
+	} else {
 		ectx.ws = NULL;
+	}
 
 	debug_depth++;
 	while (1) {
-- 
2.53.0

