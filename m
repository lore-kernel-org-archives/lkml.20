Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9564B30CD95
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655643; cv=none; b=qIlcB0p4Lolr27Htddnz89wgQevh6I3dKw5GcPS+bZmkHu2ZK8DYn+H7we2yYKz0iVJGHraInooKLXiL00K+B/lM9oYmiv6x82RLejZ23nKd+5oQH24DnTNWOVMJ4qn8zexQNISXoMIrXvc1kr7/Fzwmj63ae0BCajOP1fySY9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655643; c=relaxed/simple;
	bh=guuZHgZIre0K9WaJ16eHsfAxkl9kf4eu16+X0nvMOxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umtLEwVY7phrfmU1tnpl+8rvJ9UtEAqzeaj5kNv3nDNlLRVODXZZrjP+Npou9H46167eVOJuo8RM31RNioxf26ieD0nR+oxHQvzTrPgtzUHsymt0iMJmZ8ZjCNn/MuO2/+3wnXbHR5/L5scFBwhoNwMFFdvhNQ6c1uHSmTdBs/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7IxqH9B; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7IxqH9B"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso5445615e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655641; x=1792260441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cQOSGMTi903DsbkZFEEk4+RD6TWLVh4oE9VBqnyk1A=;
        b=E7IxqH9BgblFykQqUVe/WNGNaJBKMfzq5PrnKmEcueKqcYCHFQH675yyiCTYZHxSSD
         8M4ixZCFiOEqJVQWNXo1Gk5Yly/fctYVIDDmM9yn6tHRwPkqmFSSTv+p2Krt58Ji+Mw/
         tIEicbQnYy+q54M8PuvkiXj38ViwmI/hxnuDPzhuVvUfuNYUdfu4Vm24ghHrKtp/Z6ax
         SVkjj/3RIuaB4n48LHlJ5vdI4xQ9ygfXhHdofjr3Pe7NhSAULzllMy0Bx6GsCwkb+ers
         pA2hxqBPrY6xRbqIQ6v2FLWp67s5EwBLeIefo1GwqyVkKGT0i2Ioyf2QtdaUUZ8vlsnF
         a1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655641; x=1792260441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cQOSGMTi903DsbkZFEEk4+RD6TWLVh4oE9VBqnyk1A=;
        b=Si8BG3EabRZfS7DqHv3wBe1/pjERJIx9bHxEvWX/Mt53w+cCpZklL6SfNZ2gyueYIk
         w+P+gsHfn0We4wQ0wCgwrf+naY8nFS0jjRsAvOOVZiG7EBRNhQDmrxCU+p2tQvAARRw/
         sQ5PRHIOzAoTr2jzgq6JhX4erIDEuJyMIEkUXumFZCc3jaM/6UbREBxFrp1SPxMEMVht
         iaTc159pdfKeZ4VOSQKdCwUCpx8iVSeEB9LVSlURtdqiOKO+wfKEwlw45N6iiaebvXKO
         jd+vx2SrFEPgxaWsKRnCtD/rPk4pycXhL6fYMdeRzyDWd0z5SfGZPyU8dRtDB4d7qOv8
         Ezbg==
X-Forwarded-Encrypted: i=1; AKwUvBz+N/Iob46NoFa/QBdqLeFBCKLwfKO9Fx8EhMgj+YHGkIasJ/rQDiszq9z1riu78CuWy9okAJ9j9EKLEzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/RxEtFmhUYqWxAhU8OvgOhaR8iS2F/2fSHGjLktMm3nMdyAqQ
	AE7VTDpAmCYzZd1oc9o4VTmxbdMkQGRtk9J2oz72jvdd+IL+oRnSE1Ln
X-Gm-Gg: AYBFou3c2cutG6oiPPsSJWgV7Qs0v4RhVw4Sk18Vgz0f8uWawkkiTaNDlFuFk6RpojA
	mbeBT1I2XKtQ8uLl8i6Wp9kYqQFQyh9De8r7tb8WKOPh88WwKnXRriNqRLTe7FnZhJCDqAkPO/0
	jY1Mpmqdh8iv8/8Ca9i3dm5Qp5J7C95N/yKLyRbz/IqE58vcqbv0x6blkEsNh+Y367TfErehXmi
	gqynULsgTmPbqlZgiihEGZCvntwoGlRpjbegbGwDSALBP3Ag1hFXocbfoVb2gweRIBe28cJUs6S
	5uv/b3NTrMav5XKlIOkdJB1pvIPwnrlzP314R2jl543KL1/Kh+wb7nS/edlPo4Zrk1T0zTjz+sP
	mcOj6bdZ0BXRA+dEx0BOTnQb/ZHBJnYmn193xvdVpgXSygjTg1ghFuzjOAT8yu0US/joV5sgmLi
	V7hCj/RYF6205UkmwdP9V0iQL3rTLoJ6tWmwQnAu6bb8mImVyp6Jqr+6opo2Pzw54Yc4Jf5v/iP
	+9O34lUlLNEudskkiGPVEFcTzSTBcNOK8TnnAWAjtpdqMKtgOY10Q==
X-Received: by 2002:a05:600c:4e8a:b0:4a1:78dd:dd28 with SMTP id 5b1f17b1804b1-4a18e4d2b31mr106881115e9.27.1791655640518;
        Sat, 10 Oct 2026 11:07:20 -0700 (PDT)
Received: from desk (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e530esm9617208f8f.13.2026.10.10.11.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:07:20 -0700 (PDT)
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
Subject: [PATCH 0/2] drm/syncobj: fix sync_file import into timeline points
Date: Sat, 10 Oct 2026 20:07:09 +0200
Message-ID: <20261010180711.1548333-1-ju.orth@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Importing a sync_file into a timeline point
(DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE |
DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE) has two bugs since
c2d3a7300695:

1. The fence and syncobj references leak if dma_fence_chain_alloc()
   fails.
2. A sync_file that contains a dma_fence_chain (e.g. one exported from a
   timeline point) is wrapped in another chain and triggers the
   WARN_ON in dma_fence_chain_init(). I reported this on 2026-05-20.

These patches were developed completely autonomously by AI. I have
reviewed them, but they have not been tested at runtime. They are only
compile-tested.

Julian Orth (2):
  drm/syncobj: fix fence and syncobj leak in
    drm_syncobj_import_sync_file_fence
  drm/syncobj: flatten chains when importing sync_file into timeline
    point

 drivers/gpu/drm/drm_syncobj.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)


base-commit: 6ccf996a0dec1852dab94ad865f27b4904750e12
-- 
2.56.0

