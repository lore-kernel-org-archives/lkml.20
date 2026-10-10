Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA129368D45
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655646; cv=none; b=HANiSIM03YtBbqrJra2fpFvg5nwBs5/dHkK8aKsgeUXfonrYS8mqpd3LJhyrhshkMEzUBAjRPTfSjM6yYu9iRHtpI3wiWp4fuVn+jKTzv4lrKvcoakCrVi+4RQkIcI13AVWdjkky6CExonBs2TOZj8ePD1aB608xJlwl7OZ11a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655646; c=relaxed/simple;
	bh=VulEJg958PnrIdvSzRGkmW4RC39GwVAPz9DpA6gnsqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ih1hUIS1enTjC50n+0Cphp81tSkYHx8gixgjRt0INImympebKqRSri8N3A0jF2XRrjd8TM8XyVF2s+eVJw8aUbArOkcRCtaxgB+7juuMluyH9CWyyuJ3D99WM4C5eWRG7M5OnBTOS085Jgxk9wQPUPhUtrxResitrQu4JmyLOps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMJRc0YN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMJRc0YN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so5804295e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655643; x=1792260443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRdRSHL4zHnCw7Uu5TIKezwFTjyQd4oKLN7dpP508Sk=;
        b=YMJRc0YNG+uTr7klNVk/y6zhdXMa/k/GdRljL0QGLQJJLUSMBq5lVbOyj7Ekd++erA
         FQxtBLgy7vl9l3oGkG8K4AEtQqUOh7/5ONyeplgEMi7nYqNOVT2ZCZ4vx933iWLZ/HFm
         EwsIYDKpAE1BarLl+ep3BqlA5XOWaSV9Hhkcq5fxPc6QYJmbykAFu3DPWvRhaQFJ/JPH
         qqgYU+xgqTysRJ6AXTVM7LOZW6zpGDItjA+RZjJYHqUlw+0Ps05bP170066JBRgYNWHx
         rHZAbWPkco3bCl2ubw8rmJYOVHOYfSSd8Zf/HvqigOx4C5x2w8EUVQ67jQSNBaepSidX
         FZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655643; x=1792260443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRdRSHL4zHnCw7Uu5TIKezwFTjyQd4oKLN7dpP508Sk=;
        b=dPkQw1IHWZXp6GnsMkEcGpToBZJu3Pn2uurrG4MF5r5E0hAXErdPtjYUzXWPD9yWRg
         FzhhfogwNZH6XzVvibtE16f3H9LTCADbSeL4K1OVH7IE+3h8pMDhHW64YnAuIR+cZ3AU
         uAl+7xDUTqZoF3CprFAJxdyNQ601u+q1471DclciSTFRIqdiDEWhT0B+S2o2dd2QOaBi
         RSr5bczId9fV4nZjuIXgRozgjqXLDQbHe8AFNaygV1/f+M0Nz5q3Hl8X12JjN83bvnBQ
         R42lGnAN55aIUsLGSD0K0qgueThxCuzTXTUMLuQV95/YpCA/VlA9osC3/Zk4te8YJ2ZA
         m5Bw==
X-Forwarded-Encrypted: i=1; AKwUvBygK0GxeiD5lLXtBkcQGlgrCOn3tayNt7My3Q/O2FSLPjmZSr1Z9fyCoohld3Gh0iOLItYXdoM/4JHSDp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbqk7kpVvLuCwLeZLh6TxnNmERrNNq2h3DPZHXQzBudCY29bmf
	WY7bqA7IrRd2i7HtS3cQ1CLaIDXEdKTJ7PQfbcRElm2JKNdbRtFQLXrT
X-Gm-Gg: AYBFou3cWHCXLZYQkde+x0YQX8PtMbdZtJLcdWcW44IAuISyX1YGa50L2jcsR2veYfL
	hodx8AA8md/cb9auF/hmgdJ0tuPOBHrg7PrROUuQxKijwklVSa4NnZYXhivG3BQS/WQEbPMGcqJ
	AT21cNrsh3KuiTe7BzWUqpfGiyrpMdArH+54/BOCf5KRJhMM15MoCPsBxKUK7YaDpTvrfiQ78JC
	H6+VTxhpcE4zipG4M5GCjedpu5QHhZr0rZHxTAzHmGnPkQjbNeNi5jpplGMHShKS57k+co3ck4r
	cXiU9h5mInvOV9Fr1ii0YQfqIfwx/mWFl/JnBv59nRonM0+ehXufAD80JqQ/x3gYtLUgG4dDvQz
	ju0BQyBUIE3nKAXRGRKEDWIbKots0OR9ejtdlVf8URkzNX2nAIzpM0DwGjChUbHQAmog3JTZXTp
	WtqiYmEazdzTynojiF+7NKczkfEkOg23a5/owDJnOgX8DpZP955Rg9+X/AP0RsRa3YhfZ03MJ4D
	ENev7Cjjpomyr2YcDV3u7OfzBvwTHCmUfX1r/RnccA=
X-Received: by 2002:a05:600c:3b0a:b0:4a1:779c:dc8e with SMTP id 5b1f17b1804b1-4a18e4a01b7mr103655525e9.10.1791655642961;
        Sat, 10 Oct 2026 11:07:22 -0700 (PDT)
Received: from desk (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e530esm9617208f8f.13.2026.10.10.11.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:07:22 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Julian Orth <ju.orth@gmail.com>
Subject: [PATCH 2/2] drm/syncobj: flatten chains when importing sync_file into timeline point
Date: Sat, 10 Oct 2026 20:07:11 +0200
Message-ID: <20261010180711.1548333-3-ju.orth@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010180711.1548333-1-ju.orth@gmail.com>
References: <20261010180711.1548333-1-ju.orth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A sync_file exported from a timeline point can contain a dma_fence_chain.
Importing such a sync_file into a timeline point with
DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE |
DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE passes the chain directly to
dma_fence_chain_init() and triggers

  WARNING: drivers/dma-buf/dma-fence-chain.c:286 at dma_fence_chain_init

because chain fences must not be wrapped in other chain fences.

Flatten the fence with dma_fence_unwrap_merge() before adding it to the
timeline, as drm_syncobj_transfer_to_timeline() already does.

Reproducer:

1. Export a sync_file from a point > 0 of a timeline syncobj with
   DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD.
2. Import it into a point > 0 of another timeline syncobj with
   DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE.

Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 5ca5163d0..c545af77e 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -742,8 +742,18 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 	}
 
 	if (point) {
-		struct dma_fence_chain *chain = dma_fence_chain_alloc();
+		struct dma_fence_chain *chain;
+		struct dma_fence *tmp;
+
+		tmp = dma_fence_unwrap_merge(fence);
+		dma_fence_put(fence);
+		fence = tmp;
+		if (!fence) {
+			drm_syncobj_put(syncobj);
+			return -ENOMEM;
+		}
 
+		chain = dma_fence_chain_alloc();
 		if (!chain) {
 			ret = -ENOMEM;
 			goto out;
-- 
2.56.0

