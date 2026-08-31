Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C8830568F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146098; cv=none; b=JzRzd/UjokROjj4cOvz9n3P23eUwEqyUgUERoZQOyfjOSLIZYCfCSacMzxJkezPSEPZZ7696Jb49zzrzMUs9UBKJvBMCUyBH2RaFBdoEob5/kateh1Y0U4S3nqM/FNdWAFZ5iBPMRQDg6tJi6AKYiXPf9QRyJS7F+EKz1iltaDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146098; c=relaxed/simple;
	bh=p+eSU2TR2ZX7NGcG1Vn2s2HKCQ4s36nX/20FF8CUXuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gQCOOgTc8aLkJRIXgo2kqc5SG+PkufP3MRBR8utNNpKnxDKJzvvu2J5udvdBD7yT2+MJ1p+lMm68tD4NORddReFqozcVcVfe672wafXFf2KanAXdM0Huueog7TrnWbqCgj+ChuQQh2oagDtattIRt8WOoBrxAuOAF5n5nnSCpl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yr/kjK3Z; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yr/kjK3Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=r3ivgzgQ3H3Cv28ue3PZBn1qMGJDA9aPlpOpK/M16fI=; b=yr/kjK3ZM9uKYRDOvWbX2PlFPN
	D6rcfSiGsvmyznCKHGzBbtQxOw1gwJaJLrwt09LDcPD485sFZj3A1sEemg5ZT4bvHScDXWnzsiKgJ
	oPJOxlRkL1ewllhKJCXh8uPiexoJWE1RThQh/QUz8ZU64byXIcFhOv3Z/7KRhJxVHaWvJDCQU6/eI
	lO5E34tZZG7ThsZyVEB5kIdGzCadJ8oF3k7JModCj8IF25Sul1WI8e7ad0D81QGF38bW+OX3m2gxa
	R2TT2v7kEn5PfgoVn3eafCsf4EMxnGT3nKT3kfuWOtaZk+L7ri4OSpNe+cf1xgnS8w+vicD6/v76v
	iBuss8fw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0sU2-00000008ON0-3Zk5;
	Mon, 31 Aug 2026 03:14:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/exec: drm_exec.h: eliminate kernel-doc warnings
Date: Sun, 30 Aug 2026 20:14:52 -0700
Message-ID: <20260831031454.3406855-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Repair kernel-doc comments to avoid kernel-doc warnings:

Warning: include/drm/drm_exec.h:146 No description found for return value of 'drm_exec_is_contended'
WARNING: include/drm/drm_exec.h:157 function parameter '_exec' not described in 'drm_exec_retry'
WARNING: include/drm/drm_exec.h:157 Excess function parameter 'exec' description in 'drm_exec_retry'

Fixes: bba175a2d4be ("drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: rebase & resend
v3: rebase & resend

Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org

 include/drm/drm_exec.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20260828.orig/include/drm/drm_exec.h
+++ linux-next-20260828/include/drm/drm_exec.h
@@ -140,7 +140,7 @@ drm_exec_retry: __maybe_unused;						\
  * drm_exec_is_contended - check for contention
  * @exec: drm_exec object
  *
- * Returns true if the drm_exec object has run into some contention while
+ * Returns: true if the drm_exec object has run into some contention while
  * locking a GEM object and needs to clean up.
  */
 static inline bool drm_exec_is_contended(struct drm_exec *exec)
@@ -150,7 +150,7 @@ static inline bool drm_exec_is_contended
 
 /**
  * drm_exec_retry() - Unconditionally restart the loop to grab all locks.
- * @exec: drm_exec object
+ * @_exec: drm_exec object
  *
  * Unconditionally retry the loop to lock all objects. For consistency,
  * the exec object needs to be newly initialized.
