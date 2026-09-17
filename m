Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6F43F4116
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632737; cv=none; b=oOiCAu+l62IBz+UXcuJUuzo10WJ9QcMEGwsz5RLrOVwwZlblG45W51U61f+O97b7I9k2+deXBKfntc+WJIuwKlvdTdZjFC8WkVCIF+nPls31f6XmT+O1kraGu6SBArjeyotRNQMattYS2wguKrqHWKrMBHCoxG69JFlL5S2QO7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632737; c=relaxed/simple;
	bh=p0RMUrESzFkLYjFZ5AXFYVI9X31i3O955EvKOPGEKHk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oiGdSEF2gfXNWLMxT94gkk7EfHjOdCFZD1fCJ0zEQF+eLl3vck/5PhXSLoOxh+nCDd1uoVgcipIG1urun3qKS+fozYCU3Nr1WdA5k5plUbX/K22TZsQcvmlyNqW8inN/jxkiwXpl9B7ztYdorOciYdWAuotWKSx2azda7Unwg0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=wzmonVsr; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="wzmonVsr"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea34ef4so555652a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1789632731; x=1790237531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=INycUrmvpGrxYHCE44iGg+M6064+jK2e/qtdtHH4BSQ=;
        b=wzmonVsrddZNeB7Ro4nlJE8aELb8HxDLwg3Rs5/n40zgbXW6633XrjDl7LssWuow68
         8f9GW1EnVg0rCwsZ6oJCzy29hMjd6BwfJK7YMYp9y0qsDsgKpLSzOI8N7Uf2ZIMf6Rdf
         5s4HMeGz6qtt8OCOEk44riC/ux7DzgTfZwQwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632731; x=1790237531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=INycUrmvpGrxYHCE44iGg+M6064+jK2e/qtdtHH4BSQ=;
        b=eTSKe8Bw4FxS946FYguoGWCpaG0ARpBeTR1KpHNQd+56NW8N9UteE4U+EKc963ikP+
         mQvqqlHVANWo2JxbMZKeZoIH3AUhX4c10LzAlRF2X2A1ZzZec4RO7xHy13lQUeMl4K2u
         AJN5x+1xjCy4eEt0du+JBFlzfgBi6KEPS/IqRHAP8ek+4PNLWg9ilfzccLIyt0GXlzPH
         5f8m4OkUgj8eUqoI2MTqxyQ/Pwvwi/oM8VJ93Wgsds6KnYDdatNOLalanTefohwi/z49
         RHCrmj/DILIxLZaX1aRqXF7Goj+Z3Di9Tps/hEP/0GjWzQ6T3xp0QooZCgjRGijAtST8
         h/rA==
X-Forwarded-Encrypted: i=1; AKwUvBzA0yRf38ttJXM3C2wNBVIANF6zsqgEQF9JPxi51mcAECcqUZNzcKAat5GGj31TW18TQHD1ZJz2KIROybI=@vger.kernel.org
X-Gm-Message-State: AFuF++nYtoSePsIer9tYkmQf+65eOpvkaYV/Wy0InNVWHPNcBvOjIbXF
	kq0VBkk/p8Td7/84Y05ozYcxT22khl8au72oeK70Wk1ojDugta/EECxrLYveybm/7nU=
X-Gm-Gg: AYBFou0mtgz3ry/4aEaD3diMEJ/bKfVNDCC9/lr1Q2bVAypk04V+t6XlJ6MoqnGFjaf
	TnNsvas6/355uF4a4npl98YwL+udCXrh9j4o00p/b3fb87a7a0/9RX7NCgH246iHZiXYIMfTNv7
	73XEkvAMjxckzMfV8/oJIdg0ESZgSPJ7lvkQHozQsjl0kWb9tAGiyLfCASv+z84lIjCWE//CtCy
	1EpobxWT/X+3bZLROryv6uUISG2Vg6CQ+xNv72VnG/2siKC3xtVtLFrcwWgA6PR8Ozd89w0rJoC
	C1Bccz/T3vZBMkzxlW+0C5GAZO3uOR5AKaTsdszjjNUOV25t/F483rFDXijutVC6tc78p/CaNBo
	RtQ2JGYdf86kDYMyXo5QPdsb7CtsoNyywHvvYAsy3uUjazyof53IjCw2SV9Rlby3c/sQ0y0TIjj
	WRHievTPHiiBpJGdWXKUkceiyB1ZeGsKr+CduVNzUnKQE7TglA+8YbhTeFXkJin4x3idEcblxfv
	VqRqQ==
X-Received: by 2002:a17:90b:254a:b0:39b:ac66:bbc with SMTP id 98e67ed59e1d1-39e1e2ee271mr13586772a91.7.1789632730722;
        Thu, 17 Sep 2026 01:12:10 -0700 (PDT)
Received: from nina.. ([147.46.174.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35e732d6sm3822361a91.11.2026.09.17.01.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:12:09 -0700 (PDT)
From: Junghyun Park <mastpark2001@snu.ac.kr>
To: l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk,
	christian.gmeiner@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jjy600901@snu.ac.kr,
	Junghyun Park <mastpark2001@snu.ac.kr>
Subject: [PATCH] drm/etnaviv: reject read-only userptr BOs as perfmon targets
Date: Thu, 17 Sep 2026 17:09:42 +0900
Message-Id: <20260917080942.1258716-1-mastpark2001@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

submit_perfmon_validate() lets a submission name any buffer object (BO)
as the target for perfmon results, but the kernel writes those results
back into the BO on job completion: "*pmr->bo_vma = pmr->sequence" in
sync_point_perfmon_sample_post() and the counter store in
etnaviv_perfmon_process(). It never checks that the BO was submitted
writable.

An unprivileged user can register a read-only userptr BO backed by the
page-cache page of a file it can only read, via
DRM_IOCTL_ETNAVIV_GEM_USERPTR (userptr.ro = true, pinned without
FOLL_WRITE), then name it as a perfmon target in
DRM_IOCTL_ETNAVIV_GEM_SUBMIT. etnaviv_gem_vmap_impl() maps the CACHED
BO PAGE_KERNEL (writable) regardless of userptr.ro, so pmr->bo_vma
becomes a writable kernel alias of the read-only page. On completion
the kernel stores a caller-controlled 32-bit value into it, overwriting
the in-memory page-cache contents of a file the caller can only read.
All etnaviv ioctls are DRM_RENDER_ALLOW, so no elevated privilege is
required.

Reject a read-only userptr BO named as a perfmon result target. The
submit-time BO_WRITE flag is not usable for this: it is caller-supplied
and describes GPU access, so it neither reflects nor constrains how the
userptr pages were pinned.

Fixes: 249300c740e5 ("drm/etnaviv: add performance monitor request processing")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Junghyun Park <mastpark2001@snu.ac.kr>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 1a77a09b3..e44fa40fd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -322,6 +322,13 @@ static int submit_perfmon_validate(struct etnaviv_gem_submit *submit,
 		if (ret)
 			return ret;

+		/* perfmon writes the result back; refuse a read-only userptr */
+		if (bo->obj->userptr.ro) {
+			DRM_ERROR("perfmon request: BO %u is a read-only userptr\n",
+				  r->read_idx);
+			return -EINVAL;
+		}
+
 		/* at offset 0 a sequence number gets stored used for userspace sync */
 		if (r->read_offset == 0) {
 			DRM_ERROR("perfmon request: offset is 0");
