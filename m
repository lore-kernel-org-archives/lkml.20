Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACA15448A1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180936; cv=none; b=TKnppnqoD1gnYcAgZ+NmoDa+DZeskv+r+zJ2t+UrajYVb0MZKMMdRS0hkjNiH7M+/qiDo5XzO7BaixQBXJsJoYD1uLbzh3IKffGHzna33DGIwUJ+ahlKMwsCh0x/3/B8zEaBPc2wlSkm4JrG5aGzo80wLmAI5DtFIB0uMEgyYvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180936; c=relaxed/simple;
	bh=h+eU75xelQGswmBPjE6P4nA9394tMuqZ2wuaA3UwNrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FsHB3hpV9uVvq41DSHdzSQ7kJsDN5PIXs+MMUDsLSJjzam+ei26NraqzWFb8yn011nzc14cILmyJigX7gVv0ii3vbrwkqBH63t3I2nZgrmFVSHW4GJkrwwwanC+LREVnFfiWRfuSEyJxPH58GDXlKEGs7pmhnOup9L9k+p5FtWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=la3ctn2m; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="la3ctn2m"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04f7f2so1300365c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790180934; x=1790785734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iB3sCFIdT441Ve5Xr6bVNZSuT6o8nHC9HcOE4t6cLwY=;
        b=la3ctn2mKT3WxYa1IpE+RuRv6mPIWPMdMofQmLFHRO9foM4VUxCnBd2exZpmu4iHGR
         rwR/ygGBMVGCPwUelLPyqDq81uNqwc79X+lShabHbTzR0j9ewZVuFvFI4B3Zar6LdneZ
         OGwu6JVZ8LrCYLdrB/FoWNMj1M1//73r5EyhsQ2tJb7F7sopxjPAm2eagWGjcrSrbdhT
         jdKcf5dlHG4FBPZSGD3NbtcH16QhpkjlUuvK1mAYSRwYKUz4vkMzrcBYUv7Hy0YXNuQQ
         oNOCGYDZXn8T4zkr5mcbEkgGtWRSEzRpc+ApKxMbadL6n8CPvCcPbbm/r3zFYlJScYkQ
         8YBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180934; x=1790785734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iB3sCFIdT441Ve5Xr6bVNZSuT6o8nHC9HcOE4t6cLwY=;
        b=nRGTHa4PJgNaoa8ZfgafH9BCXSSA1JQANMNpgQ3k2QGt3Xo7ak60Y9E6NlqrqjvMpK
         whe7GL1zV4/eHnA2hqNHLqAWb3UwBduUexhryH2YIhBHyx06VzVH8OzrwzP0qOcYNceD
         Om00uLBSaUnCgds9W8OvRIqJCj5ARviNTF7dn+s41/dQljDjfxaE4k/ZWrwmwsoutV4O
         DtSSVKESYbDNUF4R2ENIZZybjc0cQAc3cFkvSHPa2x4bWd8YXJRiMICmAb05pqvLIZIU
         +fIRiuYUEPEoOmuJ+GaBGxNBjRkbArBkHGxCLzgPqQvtDd+dhCgNjHjtVq6ifcP4KXZa
         PBlA==
X-Forwarded-Encrypted: i=1; AKwUvBxHR+CLRmZSYlPvAUVjiUlWphUhOzu/Iihm8kv20BLK8Xgj0z8UFmmu6g2yEGWw3jtIoYjCzSB9kmIGPWg=@vger.kernel.org
X-Gm-Message-State: AFuF++n5jn0M+v6K5CkxIQTbMDuGAvHsSnusqK1ijGoysvm+IZd8Er9c
	3nEpxM9fIHEtKTXioRIQQ7/svUqs1uE4+uCBOVhV2mer8HchrA0h35e/2puYxRWE
X-Gm-Gg: AYBFou26QWKmZhTVxPblSS8yr7uYhUfu6gf/QJgCv5+Pm2jM7KRDUpre4dIB3L98FWI
	zSPmIuTBUv0oe3pXYn+ouZ3sHCHbnVBze9/ui8QdgsqDQD8Sa6mu+qq4bBil08v/u0zry3a12U8
	TuTkLfQ8LLsAig0AWsExKuzkyT3vVOM9HBvXIE62dTsOSNxWHsWtcD0kY7tEkgqfaaRAcS3pu4F
	+fBAni87u3utF0BVr9xAB9HfynJQEEhKJZjdDuz7QGcjfs7wklJhqRd9dnUACA+Y6I8+e3aeiHu
	7YrcLFCK1jYtVxhhY5GQKiPh4OpaEdg9/p/GcHgywlUuaQAT8VqdzJte5ec80pUMwxFdYAO2J/h
	RFWU2S9WcgzSPt61n6Y0pSPYshItvvhunwa06VilW6X27WeM8c2qQYmABBryQWwEldCnhFHucJ6
	zfdxeF+ZoeabD/nz11Ifq/usDr9VxNiNCgbkTAAcnAg1k+dV4N3sXwOU2HYwwmFubl
X-Received: by 2002:a05:693c:2518:b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-33e8d9c95bcmr3116205eec.21.1790180932368;
        Wed, 23 Sep 2026 09:28:52 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fd955sm7844052eec.1.2026.09.23.09.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:28:52 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] drm/amdgpu: fix ATOM parameter space index bounds check
Date: Wed, 23 Sep 2026 13:28:39 -0300
Message-ID: <20260923162839.1379927-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923163157.1354872-1-qwe.aldo@gmail.com>
References: <20260923163157.1354872-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atom_get_src_int() and atom_put_dst() use idx as a dword index into
the uint32_t *ps array (ctx->ps[idx]), but compare it against
ctx->ps_size which is in bytes. A malformed ATOM table operand with
idx between ps_size/4 and ps_size-1 passes the bounds check but
accesses up to 3 dwords (12 bytes) beyond the stack-allocated
parameter buffer.

For example with ps_size = 16 bytes (4 dwords), idx = 5 passes
the check (5 < 16) but ctx->ps[5] reads/writes the 6th dword at
byte offset 20, 4 bytes past the allocation.

Divide ps_size by 4 in both comparisons and in the diagnostic
messages to match the dword indexing.

Fixes: d38ceaf99ed0 ("drm/amdgpu: add coordinate ATOMBIOS table support")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
v2: also fix the pr_info() messages to print ps_size/4 (dwords)
    instead of ps_size (bytes), so the logged limit matches the
    actual check (found by Sashiko AI review).

 drivers/gpu/drm/amd/amdgpu/atom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index e0e585f..dd6c22a 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -232,10 +232,10 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		(*ptr)++;
 		/* get_unaligned_le32 avoids unaligned accesses from atombios
 		 * tables, noticed on a DEC Alpha. */
-		if (idx < ctx->ps_size)
+		if (idx < ctx->ps_size / 4)
 			val = get_unaligned_le32((u32 *)&ctx->ps[idx]);
 		else
-			pr_info("PS index out of range: %i > %i\n", idx, ctx->ps_size);
+			pr_info("PS index out of range: %i >= %i\n", idx, ctx->ps_size / 4);
 		if (print)
 			DEBUG("PS[0x%02X,0x%04X]", idx, val);
 		break;
@@ -510,8 +510,8 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 		idx = U8(*ptr);
 		(*ptr)++;
 		DEBUG("PS[0x%02X]", idx);
-		if (idx >= ctx->ps_size) {
-			pr_info("PS index out of range: %i > %i\n", idx, ctx->ps_size);
+		if (idx >= ctx->ps_size / 4) {
+			pr_info("PS index out of range: %i >= %i\n", idx, ctx->ps_size / 4);
 			return;
 		}
 		ctx->ps[idx] = cpu_to_le32(val);
-- 
2.43.0
