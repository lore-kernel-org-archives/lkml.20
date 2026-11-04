Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804802;
	b=k/T+ccKuhdIW8I/52JuEfjD/0LtVRZgzXeoxjfypfbRT2o0bP+g86F3kIti8dA/a5HRb
	 wGwckMGL9DN/wb6BkQtQECbZvNrkv2P+SxWE1969r8WMTm9dPA89Bk/Glksz2AUAqSHZf
	 elrPPNxovFuRFJNTYJI6mFS4wUwY92Bv3middpYE/A0NRm2J5QWWc+Lmfmb0Ykhu/LkyL
	 KHsuF6heOB9dqYAPuWp0SEgjjJMxL1r4X/lntmrKZLp/iERlhKN3b9+HGCdIeOHBOJdrw
	 wtu9dtvhEJPPX/Kpf8gX0iknppf1/B5w1nyCZO6fGn3Pqg7Jg81+IFOZxCma9OVWvcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XWmzhsNQRB07nNAqARUA25IM06jzZZBNn2XShTl+N+4=;
	b=rRSFzrZl5tm5h7vVcFlidwdN9eVX/6MnE4fQrGEkrkcB4UzRRl3YHrHSzWLvORcXiaJe
	 xt7cT2SVizbe5Ibyy7W9JOeFhy1MLuNiVtlpS6TjwLIuBgAa6TkN8H9bEx57GC/vTs0sD
	 oPJi4CEp+WOaOBLqrZuA0WbcLrd9FV1ldwUbwbP9O/dMFpua/EVjyp59EVBAjXgHB2Mzw
	 GRFMk9yt5RqL9CFQtM2GO9QEPo3NEEd+0OIYGkuWHiHk5KDPhglTkQIWhUPUwCFvrxcvA
	 dCO2+CA3TT3QYHTjwyN9HHwocQRMu1xL7g7Xhm65CfndLUyccKh5hlb6IcalAmft7rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vR32a8jp;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F0A606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F0A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vR32a8jp
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so1506787eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804801; x=1794409601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWmzhsNQRB07nNAqARUA25IM06jzZZBNn2XShTl+N+4=;
        b=vR32a8jphko+yyZHUjg/kud6h0iiFJzxvhA4qixz2iO6jGtHJhACUXddwUjgoY3j/L
         UUKF5usDES2+9NJ7/v1PyZAyt6NfWvVMuFPVg+GW+PiM92OIQDyi4v+tEjnfQ8xgasj9
         m7CKGI5ws/wrF5TFX+iLEyYI6P6wJP8//M3IrAEAHABL+Fth+Vhu328bYHdlTBMY+NnM
         zTHOkYhT9298ZhXbbdbDRBO2dTxM9qJK4qU6rAUKoobTUYDkmaHDv8IY2Zl3IYJJT2Br
         0nW6x7YCI3IGD98Nptxgs84lVioKB/gtBqm2rJKbhGU6jPQbMKpx7/lwYGGeZK6iSZpD
         7c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804801; x=1794409601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWmzhsNQRB07nNAqARUA25IM06jzZZBNn2XShTl+N+4=;
        b=KD9pM3KXn7QH6UyfAicNOKp/5JUulSWtxZ625b4sRCyfr3fkU8l9IkZpd5rJ88+SVe
         0/z9aTEa9KIeb3Ab9fJlwZhCOwej9c5otUAis1KxS0pgw7mSCCxWukwf9NqdD52bNICm
         iwer2uePTRkVbDHhpNJPgpBXG6TAMuMWwiTm1Om06DynyO0E5BzlyPbiJ4C5ePeN8k8K
         Gy/d83fdZOXr2mKll6JEFhkJ+bUF33/8lVX6OaX/r4oqNrKtGHSnRBo4/Fs1DmP1NreD
         nzlFROrW6fL4rw0ObXiW5jGve8ZoBSur0fdWF594KTp1tkmc79MsoBBV9x21JqCN8lg4
         fMBg==
X-Forwarded-Encrypted: i=1; AKwUvBwYR90p+q7vL4NjbDx/is5faiK0YoiZo+I3ny37lpSEwbSP7urMGnTFplpMwrlITh0ZG+CtMOSpgXwc8P8=@vger.kernel.org
X-Gm-Message-State: APuU4Z80nQGoPG1L+UlCJ5ZSq3C1jyyhHHHrPBala9EwzTz7bOIjRQZq
	4WOgnsTpOnvbh46MS0LXpUSliDGF9gYdl0NMEB8PoVZxyPX8veF2Z6uC
X-Gm-Gg: AYBFou0rpR66t6ZoNs3wkCQHwDrA5/Tokz6zB8flJKZ+LouCX60ipfk4tuthIRjszNy
	buCq57+W13Bu+xygPEqcJIWuhHo6b6QwTjMykRYAGOBYMwQkosC2UtGNSGYO//Xn8tKmyEEMPul
	Bb+wS5mVH8E6TAnTcaKEJ0gIWHxqAV3yn/KZZqEwMqTY0GpH5uCZP5GbFGlcqXtRE8Nd39wOtoQ
	CxCMKxOBi69P/MRd+yWkvMtHuza5EZBsWajPqRYIb9/SwImRRGosWKtiKyoY8EjFFwA2mmP3aJA
	A6MEqExZy+rqsVJuGEfXbJvQiWHFVBJu6WBbjbaMsnY2vSpLbc9/zyjfxcQyO8obzDXuHCnoR3i
	y+b4M7aDyEe6hWZO60BXchXgEJzyo+QlYZjLvwxbcBp7iLynZtJBwEvrEKG3WQTQMjI//sFomMC
	kwooU/TYjrUuUIUZ7v29aANtTXb7+PH97YW0N2vBJIruISrNoDBTd506+O0WIgXqvCPj391/2HF
	/XxN2khOFmHgZBKpXewWXR98ppPstdpM25qWVADv3txzMhSnw0f3/G1JyjAl0DzRyD0MxMYq6zh
	WOWkJue7TqZUC6wgUiC1UhFhv858v0obP6kdU2goZLVySY8Apt9dQ5gfm0yziiQuaKgO123Dal9
	R/em3AtRDknOCJFEZdBdBdQsmeSIJ
X-Received: by 2002:a05:693c:42cd:b0:34d:755b:d60b with SMTP id 5a478bee46e88-36a42435386mr23523976eec.34.1793804800593;
        Wed, 04 Nov 2026 07:06:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36db94376b1sm527287eec.10.2026.11.04.07.06.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 07:06:39 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] drm/amdgpu: fix kernel-doc in amdgpu_ualink.c
Date: Wed,  4 Nov 2026 20:36:22 +0530
Message-ID: <20261104150632.33843-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two comments do not describe what follows them. The one above
amdgpu_ualink_npa_vm_unmap_range() is missing the ualink prefix, and the other one for amdgpu_ualink_gart_npa_addr() sits above two defines instead of the function, so kernel-doc attaches it to the first defined one.

hence, Move the defines up and fix the name.
The description also had a stray blank line splitting it in two and said dst_accid_id where it meant dst_accel_id, so join & fix it back up.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202609241952.zFr1FYRB-lkp@intel.com/
Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
index 6cd3927a7..f875209e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
@@ -4631,7 +4631,7 @@ static int amdgpu_ualink_npa_vm_map_range(struct amdgpu_device *adev, struct amd
 }
 
 /**
- * amdgpu_npa_vm_unmap_range - Unmap a range from the NPA VM
+ * amdgpu_ualink_npa_vm_unmap_range - Unmap a range from the NPA VM
  * @adev: amdgpu device pointer
  * @bo: buffer object backing the mapping
  * @pte_flags: page table entry flags
@@ -4727,6 +4727,9 @@ static u64 amdgpu_ualink_npa_addr(struct amdgpu_device *adev, u32 type,
 	return npa;
 }
 
+#define AMDGPU_UALINK_GART_NPA_ADDR_GPUID_SHIFT		41
+#define AMDGPU_UALINK_GART_NPA_ADDR_GPUID_MASK		GENMASK_ULL(50, 41)
+
 /**
  * amdgpu_ualink_gart_npa_addr - Get GART-mapped NPA address for ring buffer
  * @adev: amdgpu device pointer
@@ -4734,18 +4737,12 @@ static u64 amdgpu_ualink_npa_addr(struct amdgpu_device *adev, u32 type,
  * @src_accel_id: Source accelerator ID
  * @dst_accel_id: Destination accelerator ID
  *
- * Computes the NPA address suitable for GART mapping by adding dst_accid_id to
- * NPA address to access remote by SDMA.
-
- * clears the source GPU ID bits from the NPA address which is set for
- * address-identification mode.
+ * Computes the NPA address suitable for GART mapping by adding dst_accel_id to
+ * NPA address to access remote by SDMA. It also clears the source GPU ID bits
+ * from the NPA address which is set for address-identification mode.
  *
  * Return: NPA address adjusted for GART mapping
  */
-
-#define AMDGPU_UALINK_GART_NPA_ADDR_GPUID_SHIFT		41
-#define AMDGPU_UALINK_GART_NPA_ADDR_GPUID_MASK		GENMASK_ULL(50, 41)
-
 static u64 amdgpu_ualink_gart_npa_addr(struct amdgpu_device *adev, u32 type,
 					u32 src_accel_id, u32 dst_accel_id)
 {
-- 
2.46.0

