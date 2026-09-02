Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9E3484231
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352157; cv=none; b=nIdujYIgabQcFtQCC+PkcJK8QDdYB+9ZjKj+SjP5nfbuq3+NevQkQXOI7axjxuKCdbYCZEQBHAkYQ0VUIeo+djFgET1FbIf46RNVPdOtD3G5LeRvVIhV1TW+rUJuSDjsfP0EmvnJ9OvVaOuLxawI4TfjYQN/0f7Xe1k6EvPZ9d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352157; c=relaxed/simple;
	bh=p/V1AbwpqTcbOr6E67iKq4k/gI8GHbt2e0Eoz+/coFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2LbYfaW5Kuuum/b3CBf9UupF8nexdg2UB23vR7/OkDgC7u/VozLjvDANCc04O5J6D28L9erVtTV1VaIoXdfUDQc5tMk+bobT+9+nl7ZPYDZRriVxxLj+h7tNFJAtWqTsXsZl++/jV+Y/agOxAolFW7dH2R2rFvoUWEnrsE9eZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHjdmXSX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHjdmXSX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848643382fcso1086826b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352155; x=1788956955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjSLQKBgLLYQIi/C+rXjtu2+hrtewX0LNh0mFPYrFIw=;
        b=NHjdmXSXm9Oke57TvNwppsKNWtju5s1A87NlZl8W9XxVGiIKjo/sHu0K7kKQEXvrkT
         XpGI78RTQ2keK0gfJtQMitBOVijOvkBiMSwCeMXFoSRIVuMdTQg0Qfde7XkDqBnxQLdb
         Ojnsp+jlAyLZlySf25iCm7055ME5oI+ZUhg6qXTy27sm3RDDg0XPrx/UPRjNYLnEj0oD
         tGFFzxN+OfqIFOt2oVLlgtKMg1oe2SDC4E0IYq1XkK5SxmbJzB17jcUJRFUOYEC9EVim
         8HIFkhFNEc3HJpsUiyLi1BitT5vLnsnfGALdW+xF1HUdrPyENkoYHvmMAog/Mr0OsjmX
         QA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352155; x=1788956955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjSLQKBgLLYQIi/C+rXjtu2+hrtewX0LNh0mFPYrFIw=;
        b=G/ceLxdbZS85RbY0nGDoqRQydRtZ5NiOKppXpqp6CGDTxms4w5uLTy30f7/La1mtiP
         SgyS22XRslgt4ems+xKsTuLo5gOyNLFR1EkrXtq5AqWS9fG36FNOll+hncHVFP8Od9Jo
         LaQqwutp0CiNua3jjnwaA+WEsUBmaIb9rkhO4hBDF8NUN68l3sJoZY7fJrj2JyWclvO+
         ab07buwAl+QYrb4IZHeHevmWmJasvN4ONYqs0ceJCU3vZtFSYm2DAtnDYTDcOfHWwoqS
         wwFaoxQKwTTaRLRmxnk7KHKkso8LfV2iAc1kG2OIupoW/zTJBRfkK78zcTXggpLzPxwE
         3TTA==
X-Forwarded-Encrypted: i=1; AHgh+RrWJDg/oyRawBLIvPkkRAu2SsFgps3TZghsNw6no+gj5un4/G0mrYvgouW8fAXVfFykWNKUIDniAztrCoc=@vger.kernel.org
X-Gm-Message-State: AFuF++nwxcfAqY0uvRvdU6+OypXBglRi/6CCubb28VvLpeXWtHLnWDMD
	bZ+ddwF90nfSjodFTXAYb6ySXKQBCZJixWt12o2Nq1tXfhZ+NCuaQx8l
X-Gm-Gg: AR+sD13O+Czs0d25AEs8rQ2pRu6OX80QtK1idkbn8I5D4b0FIVhVTehIRmBCOY/ZeI9
	6jnaHLbianOBJ+QQe/hzTFzyxWI1jFjA6YbOwSwKGR0j6Ac6YZaoxSl/71nNHNXKANqkemzaLiH
	ApQ9uD9BERhuvKbKIyjzhhInuBzb/v8ORrlp7oz70xH1Qz/DzUFXMt6lt5zPKIPr7it56mqfZLE
	dxkWyev1Bi5YflFVkZNDxoxvGpqXAunu5TCPFGCMU8kIptb4YLm0FAa1rwVNEDPMnRVW5Mdlp+R
	6dEF7HOMPYRpuo950BUJkk5RN70Ch3AlJ46Y62Rzy/2Y9RuhZ0d2VppoY4cTDA9HLEHscbm0Xii
	7sha2lIc9NL4jBY41RKENC6tSj27z/MV/S+g0wORQ404ksCvHFZQLj4Sv912p1NH7qFICaHMjl6
	Kpv7OZVGyjkfpBDZ+d0ANIoscmp1/nom4QgiYJsc7lQs0F3DaEwIHCg8WgYWI=
X-Received: by 2002:a05:6a20:431a:b0:3d3:adad:f172 with SMTP id adf61e73a8af0-3d9af0f8f96mr6795606637.20.1788352155062;
        Wed, 02 Sep 2026 05:29:15 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d03b5a8sm944767a12.26.2026.09.02.05.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:29:14 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Wed, 02 Sep 2026 20:28:43 +0800
Subject: [PATCH v2 2/2] drm/gpuvm: reject zero-length range in
 drm_gpuvm_range_valid()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-drm-gpuvm-zerorange-v2-v2-2-da63269c6ec4@gmail.com>
References: <20260902-drm-gpuvm-zerorange-v2-v2-0-da63269c6ec4@gmail.com>
In-Reply-To: <20260902-drm-gpuvm-zerorange-v2-v2-0-da63269c6ec4@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org, 
 Dave Airlie <airlied@redhat.com>, Zhenhao Wan <whi4ed0g@gmail.com>, 
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788352136; l=2951;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=p/V1AbwpqTcbOr6E67iKq4k/gI8GHbt2e0Eoz+/coFc=;
 b=vi/JETsoNsWUA5ztPyQT1Va9wqQSTg+1zn+8ro4xEvkjuHiIGNbMmkkJEMzOsbmzvS0Z+Teb0
 HFMW+KuWNOCDhgCUIsdE5zmQkvsguAOi6mEepd4sNaEPzysYjOdu4At
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=

drm_gpuvm_range_valid() is the common gate every GPUVM map/unmap path
funnels through: drm_gpuva_insert(), __drm_gpuvm_sm_map() and
__drm_gpuvm_sm_unmap() all reject a request unless it passes. It checks
for overflow, the managed-range bounds and kernel-node overlap, but it
never rejects a zero-length range. A range of 0 is page-aligned and
addr + 0 does not overflow, so a zero-length VM_BIND request from
userspace passes validation.

The GPUVA interval tree derives a node's last key as addr + range - 1
(GPUVA_LAST()). With range == 0 this underflows to addr - 1, producing
an interval whose end lies below its start (and, for addr == 0, wraps to
U64_MAX). __drm_gpuva_insert() then issues its overlap query with that
inverted interval, so the -EEXIST guard matches nothing and a malformed
zero-length node is inserted, corrupting the augmented interval tree's
subtree-last invariant and misleading the overlap checks of later
map/unmap operations on the same VM.

Because the shared helper's own kerneldoc promises to validate "the
range" yet silently accepts range == 0, drivers have papered over this
individually and inconsistently: imagination and xe reject a zero range
at/near the ioctl boundary, while nouveau and msm do not. Fix it once at
the common gate so every current and future caller is covered.

The only in-tree user that legitimately accepts a zero range,
xe's DRM_XE_VM_BIND_OP_UNMAP_ALL, interprets it at its ioctl layer and
never passes range == 0 into the GPUVM core, so it is unaffected. The
in-core lookups drm_gpuva_find_prev()/drm_gpuva_find_next() pass
range == 1 and are likewise unaffected.

Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index c422c5af1f4b..b73ad6988171 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1021,7 +1021,8 @@ drm_gpuvm_in_kernel_node(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
  * @addr: the base address
  * @range: the range starting from the base address
  *
- * Checks whether the range is within the GPUVM's managed boundaries.
+ * Checks whether the range is non-zero and within the GPUVM's managed
+ * boundaries.
  *
  * Returns: true for a valid range, false otherwise
  */
@@ -1029,7 +1030,8 @@ bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
-	return !drm_gpuvm_check_overflow(addr, range) &&
+	return range != 0 &&
+	       !drm_gpuvm_check_overflow(addr, range) &&
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }

-- 
2.34.1

