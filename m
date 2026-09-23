Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B22A533588
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177375; cv=none; b=YjkNnZVTyAP4jVbrNozfhd8B3Xt8pHODxZGVCyFYj/DiVT7Kn14KDhjWeCjh13mq4/syuj3dN4Nml5l43eQM8X8ZKFTUlBtmjTGJyUj5sKKqN7V0Sby6HEVwC20bJOTPheU3loIFTE4ktWvO6pq6HUCnGxcCPewUl6T/ihICDF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177375; c=relaxed/simple;
	bh=IUBOPU+ppdbziV3AIiuHiGemYVtMO7JQ5bk9OwEoA4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDOyjddih+VNzWLc9igTsNx37lDMmMHGaG7N09c4SSZQRzJZzPYpbLoVeMOO+qpSOLmmJQSO4syahOxj77dwpOp23DpgTnQvy6B+6K45pZ7klhWOD4NKp5kv6clh3kd/sagyDgBd+h/Uj+9qKp8Qvju703eRi/4S8YAn0fn9VRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT5XoQOl; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT5XoQOl"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-14373bcc010so1217509c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177364; x=1790782164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RwhN3nTYO2NwTsY9NysVRh+VFHI1OHGWLQy/WkOav4=;
        b=cT5XoQOl0monGm/5mXZnNDGzTH/yxZT7fbs/k3J/k+bKx+/rr8buDXS7vhTiQHDJob
         mTSvfzPokQx657fdILUBzo84ZvwyM5xYa+xp12piPsVuW9st4iGNVFkeP/h+8+XR6Yfj
         nC8NnPcv6AjPw8S7fqoOEJt8dK7TToXF/OMAB7vDDbKmibqzem8xl1qHkcJHm15fZqWz
         fmMcUl7Xgr6mRxHwiVJrqqJ0v9TfcNt567krzKvEGDfHOU8I2flOobYzUtlZPNBHZKim
         d+v9UJ3jT6m4bXbl7Nf0gPxEK/ph7TsmPv3rLmE8TZfK651kS21qTaVlDg7LNpreFYEI
         GJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177364; x=1790782164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RwhN3nTYO2NwTsY9NysVRh+VFHI1OHGWLQy/WkOav4=;
        b=t75SrC/AruLS87C+phjBucieK+pDpjzPlXabw9hbex4UmU3adjt5S2gm1kntnqjDfk
         2shygApmyqdVXyWgRJspDkOmIduxs4TSQs54c1smHBoXSO49IFjnMapasEoTL4GLrApc
         iTdgKVHUb2UEKSmvoPmwtJzR/t+4UkKIRnjibRmTJijvI/2bMMlx2Xj78fsV+p2p/xgZ
         jOx8x9Z5Tj42fLFcQHy52l1GZ3FJSKm2hD0/toeCAYL68WJ0PAYImRHKfHwNz0Hq3Ztx
         BxFxlF2f2E0LebLlqHlo/PkQm52H/jxZwPa2PhyCHXRKl76bDRjt6sNz6D0CoFlrHWX6
         gxlA==
X-Forwarded-Encrypted: i=1; AKwUvBzpofoZk+w3j0q8nNH3+UalYWrkAuaNJxzm0+9zLY8eWdZGQyQo1sJwXbUq6/Kkwnj110LjtMQubW38KgU=@vger.kernel.org
X-Gm-Message-State: AFuF++ne2AVNCsHp0skg0w7w+T6t84wRebqVf57gEeG24p0RxIkcmAHl
	Xh10uWNgpxLh4y+g4atMHgqrODiOK8WCTB8ozrb5p4hAaEZVhw2vb2/y
X-Gm-Gg: AYBFou1YmVM5cQ05A7obB+fX3xmckDjgkwgTzj5Jz3/+W6O8SGAeYuUZ2xTxbNOps3l
	+bE/yQz53MG+ifERAAFzvTuYYSB+GpC0s1BDWpQmJZAG8OyDrKZsDY+CoivCIYSb3ww+Hu57iQW
	ObAMcKIR0laYHfFzR3Dx/pngUt+ziN2CgtvFwnYSOO60xFkT73S6uO6ahgP0BSK3Y7O0mHAlWOI
	Esq8PUSn8XMQ4f3oZIeVw1qbk/Gv2OFZiBE1CdUg1Wqzas1A8X9ekXiKknwh10FYseV/6J0GBlj
	lvnORoW2LlKLHNculNhOseOO9MAebd4mnAjCV/GK/KhU19GKlI9WAqk+gMztf0oEQu0mAIGtIPp
	pYg840mqb40fzz3IFuETe81vCu5HWxw19AEwiLtmc3E6k/y7kxCfiqWpuBxfM5tx7FLUfXWmUwe
	VaUJPPkCLWL1Px1dcqaPNwxQk2ABtnzsSVW496zBknVq5ynLIm
X-Received: by 2002:a05:7022:ea4c:b0:145:15d:5313 with SMTP id a92af1059eb24-145015d5351mr741463c88.25.1790177363784;
        Wed, 23 Sep 2026 08:29:23 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98bf501sm7232627c88.14.2026.09.23.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:29:23 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] drm/amdgpu: prevent parameter-space underflow in nested ATOM table calls
Date: Wed, 23 Sep 2026 12:29:12 -0300
Message-ID: <20260923152912.1296884-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923145001.1244517-1-qwe.aldo@gmail.com>
References: <20260923145001.1244517-1-qwe.aldo@gmail.com>
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

ctx->ps_shift is in dwords (set to ps / 4 in
amdgpu_atom_execute_table_locked()), while ctx->ps_size is the
remaining capacity in bytes. The subtraction therefore mixes units:
a child table requesting 60 bytes (ps_shift = 15 dwords) with only
16 bytes remaining would compute 16 - 15 = 1 instead of the correct
16 - 60 = underflow.

Convert ps_shift to bytes (ps_shift * 4) in both the guard and the
subtraction so the units are consistent and oversized requests are
correctly rejected.

Fixes: d38ceaf99ed0 ("drm/amdgpu: add coordinate ATOMBIOS table support")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
v2: convert ps_shift to bytes (ps_shift * 4) before comparing with
    ps_size, fixing the unit mismatch found by Sashiko AI review.

 drivers/gpu/drm/amd/amdgpu/atom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index e0e585f..0940bfb 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -646,8 +646,8 @@ static void atom_op_calltable(atom_exec_context *ctx, int *ptr, int arg)
 		SDEBUG("   table: %d (%s)\n", idx, atom_table_names[idx]);
 	else
 		SDEBUG("   table: %d\n", idx);
-	if (U16(ctx->ctx->cmd_table + 4 + 2 * idx))
-		r = amdgpu_atom_execute_table_locked(ctx->ctx, idx, ctx->ps + ctx->ps_shift, ctx->ps_size - ctx->ps_shift);
+	if (U16(ctx->ctx->cmd_table + 4 + 2 * idx) && ctx->ps_shift * 4 <= ctx->ps_size)
+		r = amdgpu_atom_execute_table_locked(ctx->ctx, idx, ctx->ps + ctx->ps_shift, ctx->ps_size - ctx->ps_shift * 4);
 	if (r) {
 		ctx->abort = true;
 	}
-- 
2.43.0
