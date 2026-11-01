Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547037;
	b=dnu0KuTfCiuP8xwxgjm6Qm5KreeKdz73W8Jj4TPBcNyeSCD91pkhaWOKc3qQKPy9Xfw5
	 lc7cC6JsiPEYfJRng0oP1f+oIxH0qyjyyKwQ6CVf6XJOQ2eQaGWnYKYaUFp3FiRS9cXzZ
	 7NKSPfTAB/A4YzdI72qCloiaAiKucVqAafKXzHmG1Hgul6wfOp+5wsFLzGY8c9eykor05
	 5zX2HnIsFmYGaJb65P4dm5bSiP2IFOHFrwuhycc89F64lxfYscp6GVXKeV8KkBIfsF5Fx
	 8KmvhWjdFXuLaiwD7uofyLIfWHf4EN2+lMifQtkCKbLJExOw/TXWKtkKdDgsWM8qCVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SVBYUGKBfy5VgyJYxRQsxXI/PNaZpWYW53mlcMJpkq8=;
	b=g6aM5vZa699MXPkIaHwyGTUmVu2hfGhTOsH7NHWOeRoz+Wu51fwgHT4NlTjpAWZ9VY4G
	 78QeFI2GIeqywH4cY6i4ILY2WCB+HhVgAoTWiuUXPoCgDM8pDoNDN6g+BPYvzF7C/SfFu
	 QtugqurHancW8OStBEDkIea15wFNg4KMSjQ92P5rsSoF6CIgcchO4khaRzd1sjZoD+3Q7
	 pmW/oYbmDjNwY+imV8vutAoDPpGXfpxWejhHmC+MTS0xfVIRh2byOgnm+fQBkJcRGZNFs
	 CtAkB32gXzX2JhMTCFRYUyEaKcX/gWSO+mJye+NFmYw3vLem93QMGS/WgBGhoouMCNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRaQcYE9;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89BB606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRaQcYE9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a1947498bso1119350eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547036; x=1794151836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVBYUGKBfy5VgyJYxRQsxXI/PNaZpWYW53mlcMJpkq8=;
        b=DRaQcYE9KJb+LQeTHcZ9NvObuGgL1JcpRh4/oVR7xkG2xXl+PNxq4dyjNaPiKqzw5/
         j6DlnIsHkl7QRoyr7wsh2UV8wxWkLQlgNuP3suylVb395IIdFJGUCSJLwGuumxRnpkAu
         6yVJOL1Cn2ottLGn7tviEiY2P/jCzKaz/UWNVCYM5dCQGGQWMTXul5gHMghTtvhKhZz7
         bVAdeWJk4mWESz/iL64waay7NxQeK6TU83V5NQseV/wawP7rDqKDIcyAd4Vege8P/mNL
         pm3a50yMQA9ZLxdxfkbX/J1hTpnyPqE0p2yhgBrbyQH2QVst7hztyvtcyht+W/Hp+SnY
         UHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547036; x=1794151836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVBYUGKBfy5VgyJYxRQsxXI/PNaZpWYW53mlcMJpkq8=;
        b=a80dgbjJcGda8x/Ln98jDxqpVK7tPprc8dn2h1Qh4Zklz9nmVGLBCABJT4Vsw+UmYU
         E/LazEl/0g+vi0CnNx84CqXur+pbo4HEY2/mxbbZ7nIsLQV2hqL3Ukh8yTxsmQpqRe0G
         1OC7Q0irZI0GvcK3cK2gam9VciLuvrdfCWM4l16P506no8UAogiYDuTtwSACESD1Umfl
         AJ58SrPhdiZ83CyguWerr0CBQtwMntLOl6jQRe6z7cawo9DuyO7QxfGsGXuTxebyxFHs
         3toB4EQumXFuQ1bbBKAtpYJrjajmfiVrnsDfB7J7tR65+rgb+x9nwhYHb1dYWSi1GIiV
         IjbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsflhLXAqvciSsQnRfk4kgAUnLhcW9NRdn83+5FJDr0DJPBWaQgaYncLVZ4DcC/YifL6UPGPQJZNXO9mQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eetf+JFIz5KEFnQJW4o+gOf3DEaSd3bFip3arybiMRHP5IdH6
	5MEE1zT/4kmrFQwEPZSngZkXwmEfcAHQLm85m/idcbh+IhWrvGBVn4HK
X-Gm-Gg: AYBFou0rlPq4VEPD2+A/q4ZT0vwkSGhGtjjpfd1u/vDIrCYGQqMajYrCEh2FV+lj3b4
	gkbETX7uh2m5M8Zg6KYfjT/51NHULU10VMpjBfgCGn1CTw6PPZpikd8EU6jzqwjVB7MTnU2D+ar
	Cv25JFHQ9LNYGNK4W2Q04wXbJcQLtkC8vBrm9/mltn36IVA767sxjNibkvz3oMY7giviiIjiroP
	zVGvu/TMvL8/luLvEPfh+2axiLuMaf39POi7jI0k2uHJGv0/PXcV2iuirKdw/MvbAeA5LrhCYkP
	ME/E4gi765DpMH2buf/76b6kSLHTmFwl9zfJIXyNFSQ6ZCfrMFcLYJRyHLo2ji0U5y7Arq9jJ0M
	LBAPS+JxxLOkbthWwoyh/VLrn9FIbhXZjDJJn56crcOH4chwtYbykWXSAZbL2w/kVM/80kUbCEU
	RDUbLYSTz3e/h8xR4LV2F5nN5xDJAQQXI/0l7SKWGaysmU+zNiBhLrt5c4T41LxJPyAxYgXL2/s
	RB33eePPL6/aDimvzQBSzdLF5m30Qlq2jLySDzDdAumTte7kwlLCGOdZLVXLEFNunb4KhdBpIM1
	AcRtNYLmGx5JqGDzgRjHaa91c34olvw=
X-Received: by 2002:a05:693c:2514:b0:368:fdf9:6e64 with SMTP id 5a478bee46e88-36a423b4363mr11283926eec.23.1793547035458;
        Sun, 01 Nov 2026 07:30:35 -0800 (PST)
Received: from fedora ([2401:4900:8fef:d435:87b8:cb2f:c85c:2d3d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm30374017eec.3.2026.11.01.07.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:30:34 -0800 (PST)
From: Ravin Chokshi <ravin.chokshi@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	acourbot@nvidia.com,
	lyude@redhat.com,
	linux-kernel@vger.kernel.org,
	Ravin Chokshi <ravin.chokshi@gmail.com>
Subject: [PATCH] drm/shmem_helper: Fix kernel-doc name of __drm_gem_shmem_free_sgt_locked
Date: Sun,  1 Nov 2026 21:00:00 +0530
Message-ID: <20261101153000.20839-1-ravin.chokshi@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The kernel-doc comment names __drm_gem_shmem_release_sgt_locked(),
but the function it describes is __drm_gem_shmem_free_sgt_locked().
Update the comment to use the real name, which also fixes the
kernel-doc warning about the prototype not matching.

Fixes: b78dab829760 ("drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()")
Signed-off-by: Ravin Chokshi <ravin.chokshi@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d654a22a30de..6ec273f0849e 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -159,7 +159,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
 /**
- * __drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages, and release the
+ * __drm_gem_shmem_free_sgt_locked - Unpin and DMA unmap pages, and release the
  * cached scatter/gather table for an shmem GEM object.
  * @shmem: shmem GEM object
  *
-- 
2.55.0

