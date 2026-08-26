Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17F44607C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756190; cv=none; b=b2vK1gn9IWLC/ccmJrbUq/rEzm3XiaTjDGV7cP+Zhkeb+FGu80nNvCJllzbvNO8H3JcOwwoMWeoywQnLvO73lHxMV5kctLLRDWMR/8s9xntDvoZPpf3Sc5o123oSbTGyi3r0n2vOURJtWEu7+W1JWWciFRRD94DDnCarKmlAVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756190; c=relaxed/simple;
	bh=fO0m7ywxhj6aUDMKcRwERhzspxOkjxyxxPEAGdSDe0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zt8s1wBtmmfE5z4bMksQfobbcwuI6y6B4o5JzH7XtGepz1B0pmiJmTVM8F2pEy3hMJz0QYo/tIymoYLpPiFmBmaN/IER8EuMobUqrUgDPK7gUB3JmgUXaqQlu/3M0Oj19vL5DNafh7yzg65+NdXEszpdaF4nr4lEFgDHuxPhtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BF9yF3Ol; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BF9yF3Ol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787756187;
	bh=fO0m7ywxhj6aUDMKcRwERhzspxOkjxyxxPEAGdSDe0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BF9yF3OlVRn0IDps2MZ4UjLT364By/8TahNRr9YSkvJky7uDtxJNgzxpPUReSfnKU
	 PuktkJj6ZqJl6D0frGmENPN9oDeB/stw68AviiiEGix/Zzp/bkc+bEDVd39s5tXsX6
	 1/wN6P3JDz91j93z7iHG5fprgAixkcw4e+Mt/Tcg+O/9dq0bsJUeMP+9O9meWquDeM
	 eOJJ80HXRsncYc1xbtiqPjQMgGOWwbYYOIAAqgFHPFkLzvxiaEbxosW2JG/vNqTCSp
	 PA5kQ0H0e5U+BOVm52BaCY3B5MA6mg0ll2gtCuhZ+XQ3DH9YV1YcYSzp38cguKG53n
	 XT6+LzQzTR+TA==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE12017E10F1;
	Wed, 26 Aug 2026 16:56:26 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 26 Aug 2026 16:56:12 +0200
Subject: [PATCH v4 13/18] drm/panthor: Complain if the SOFT_RESET fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-panthor-unplug-fixes-v4-13-982cc8f4234b@collabora.com>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
In-Reply-To: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787756178; l=1765;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=fO0m7ywxhj6aUDMKcRwERhzspxOkjxyxxPEAGdSDe0c=;
 b=IvxdBPFO4yCr1e+4/FtiBl2rpBBa4Vre28Ql/Jz6o6lCZvvRlkaPeBtKdHUZXgnPIw3quHuHv
 S9mdxZwpR9PC1CgXBKlO8v3y0Hr70fN4MMWqSAtXCgxnWEtixcKOrNx
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

We rely on a functioning SOFT_RESET to avoid HW UAFs when the GPU was
in a state where AS commands were no longer accepted. If we silently
ignore RESET failures, we're just pretending to be safe while exposing
ourselves to the very UAFs we were trying to avoid. On the other hand,
there's basically nothing we can do if both the SOFT_RESET and the
AS_COMMAND(UNMAPPED) fail, so do what we do best: complain loudly and
taint the kernel with a WARN_ON().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_hw.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 4531c1239cb6..f13fd7b335c1 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -41,9 +41,17 @@ int panthor_hw_init(struct panthor_device *ptdev);
 int panthor_hw_power_status_register(void);
 void panthor_hw_power_status_unregister(void);
 
-static inline int panthor_hw_soft_reset(struct panthor_device *ptdev)
+static inline void
+panthor_hw_soft_reset(struct panthor_device *ptdev)
 {
-	return ptdev->hw->ops.soft_reset(ptdev);
+	/* We're relying on the SOFT_RESET to reset the MMU block if some AS
+	 * were stuck for some reason. Failing to reset the MMU/L2 means we're
+	 * exposing ourselves to HW UAFs. On the other hand, there's basically
+	 * nothing we can do if both the SOFT_RESET and
+	 * the AS_COMMAND(UNMAPPED) fail, so do what we do best: complain loudly
+	 * and taint the kernel.
+	 */
+	drm_WARN_ON(&ptdev->base, ptdev->hw->ops.soft_reset(ptdev));
 }
 
 static inline int panthor_hw_l2_power_on(struct panthor_device *ptdev)

-- 
2.55.0

