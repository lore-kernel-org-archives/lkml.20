Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25907539790
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175020; cv=none; b=o07vfaDtwHVtMvGz4nNH2y/WM5F0JM0wkM9KqenrR1h+4dI7Equk7TPiRmGRGmRaeEzhgkerkTbbW5o0Ty9mIE4902grHj0jtdobBNX5JwDDt1UXNckC/ppWpiXVnvcrHMFvlAv6gnTInwsDIAgK39uVicIHRBsWAvMhgZZITIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175020; c=relaxed/simple;
	bh=K/ca8YDk45vJ2nA9Pprcsmn9g0Kr7ufoYwj1R1Cy3VE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwNA+Ol/CsIDG+6r2i3MyHVofZ/Fpi7m+ILmklet4K46qs0yQQhrEFDcngYz+hiiizGgZmVgsiSjGUMQT3e1yEgWvU7wDBIOpQSJMn5bQO35hHNzp7wmYKQ+pjunrBOYNbO7aE9IO6dEBjwvaUbtMgay15tqsdIY8Goy0gPrrgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVVkd/d9; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVVkd/d9"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a34907so899251b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175018; x=1790779818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+9dAfw6j+gd4CFGZQW7IESgJBRKBFJ7eBXdntcdN5b4=;
        b=jVVkd/d9HLMjGjzNOqDDVm86eHxordQSx3nPx51PLG8lSmPqkDN4Py5qkxaKICrR1t
         jKZRTLIh/fu1U5rEpYfrKmiYWOJcfQZXy4U+AMfk1ZGSTQq6xlWZ5ifITUzB2eHbRQaB
         t4/aLfcpYO5Qa6HTq7DiS+Ak+T8iDSHRIzw7cXgA/rB+/AHanYTyOxtoo9TD+ygIoHWs
         6vL/zP+XBNPSpMHmO14li+C/JXF0I92GOA2YT5ow3QUx0B0NvyaCAwY15QeYlU2+lz/9
         2UtCAnv2YijYiRhVS31l3HYCiC8w5HUtqTn5pQngLZP3yBRIYFyamrTLUxLmiQnpObQU
         j9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175018; x=1790779818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9dAfw6j+gd4CFGZQW7IESgJBRKBFJ7eBXdntcdN5b4=;
        b=K3KNwD7+ImqVyMW4uJW0Pb7OnuEWWDjJva1yecvt0pqOXUhr9N3tYX76P8TwZob6pB
         QIeKB/8MFFSme53GtsvYOc3yxZ1fzp3tOANAmFNMfCXDcWfuUkVfBksRHeyOa+yQuzJ+
         JrZmdfPU/vPpowLtzmzHL1AaR95H9L92dJj4SrsuoxkvPuiAX/xlA/H/XBgDFwevvjII
         Ou5IiWxo0ZkHeqhPeJSIEni8lQDEj10frJP+4Ddy+k3gxZOg0Hh59krVw2atJPxn8ubK
         UctoIEDv4U3ZtH2qymXE/j3nsZn5VDW+LpBeaKQ7Gr7HHXfXFhp7uIrXUM/QlS1CHkPm
         XvSA==
X-Forwarded-Encrypted: i=1; AKwUvBxHA5HxZQEZ/GYVPuwHddaS63NFztmvYV0RTkSLGGL+z42oPe2LbBozVhgLIPc99Mm0d2qTlk0fdots1Mg=@vger.kernel.org
X-Gm-Message-State: AFuF++lDcG099/944dgxnAvg24WHaNN039FWCjVS6tHeTwwwrjBd2WWQ
	ys4KiDL9uXe4phVpSNxpI2uoff4zi64IIQVuBfP7gEdRy68JaFlYNxX3
X-Gm-Gg: AYBFou3mOZdZ6DPlytRMSeAWvZKYiYea8OzQju85alWi+FkVUibPZKfkto6A2CDeUOA
	p9iVOIWTdBARWsCNGYYfJzyJLvN3/bkGImRucCrdSZ5+mhl8n7mG2p+t3h3imWWx4QwxtM0Z4Jp
	ReU0qBEKUI8PScmLcepiFrfIYw1QLmDoAeEaKdKsIE1hTJIKAlS+0WMTjonwn/K2QbBXgI0knMI
	+SBttV1SFOrZQ1THHDnrc2U6b+2XtWPEpIPsgcx2dzGr2ZKraS6NW61L88w3VpSk2EmH1vVtW5F
	B5B0qY9bWB45iWl8vdgYW8/fkkG+d+D01tWONT5fob22LyAyf1i4rGVxAiXJpL1y0dyWwpe7EJ8
	AeNpRFUEIIBuOOMfATu8LWz612m6S5oHNhnjHxE73p0/HWQNFIJTsn836mlnj5oI1ncH4Dd7fEh
	xzcWW6fYXuOjjNqdI6oYqNwun8hecWCu2YNfxXJKVKCrIIRMT8jvwZW6GZj/FAl1Cm
X-Received: by 2002:a05:6a00:13a6:b0:878:34d7:6987 with SMTP id d2e1a72fcca58-87d1c9c6e01mr2838923b3a.53.1790175018176;
        Wed, 23 Sep 2026 07:50:18 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d4c483asm1453655b3a.21.2026.09.23.07.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:50:17 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] drm/amdgpu: prevent parameter-space underflow in nested ATOM table calls
Date: Wed, 23 Sep 2026 11:50:01 -0300
Message-ID: <20260923145001.1244517-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atom_op_calltable() invokes a child ATOM table, forwarding the
parent's parameter space with an offset:

    amdgpu_atom_execute_table_locked(ctx->ctx, idx,
        ctx->ps + ctx->ps_shift,
        ctx->ps_size - ctx->ps_shift);

ctx->ps_shift is derived from the child table's PS byte count
(ps / 4) in amdgpu_atom_execute_table_locked(), while ctx->ps_size
carries the remaining capacity from the parent. A malformed ATOM
table chain in the VBIOS (or a GPU that reports corrupted table
headers) can produce ps_shift > ps_size, underflowing the
subtraction to a huge positive value passed as params_size to the
recursive call. The child table then reads and writes far beyond
the stack-allocated parameter buffer.

Reject the call when the shift exceeds the available size.

Fixes: d38ceaf99ed0 ("drm/amdgpu: add coordinate ATOMBIOS table support")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index e0e585f..638bd18 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -646,8 +646,13 @@ static void atom_op_calltable(atom_exec_context *ctx, int *ptr, int arg)
 		SDEBUG("   table: %d (%s)\n", idx, atom_table_names[idx]);
 	else
 		SDEBUG("   table: %d\n", idx);
-	if (U16(ctx->ctx->cmd_table + 4 + 2 * idx))
+	if (U16(ctx->ctx->cmd_table + 4 + 2 * idx)) {
+		if (ctx->ps_shift > ctx->ps_size) {
+			ctx->abort = true;
+			return;
+		}
 		r = amdgpu_atom_execute_table_locked(ctx->ctx, idx, ctx->ps + ctx->ps_shift, ctx->ps_size - ctx->ps_shift);
+	}
 	if (r) {
 		ctx->abort = true;
 	}
-- 
2.43.0
