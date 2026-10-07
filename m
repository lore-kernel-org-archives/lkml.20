Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B31835838E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350618; cv=none; b=cOeWT0VzXL2mzZOdMNpqVSeeg4Su8SQgP+p89j6y9btPMlRdjrKjIgMf12ETpJRv7nuM3yPIj2U0x+sqfpu7tpdmMjjIOkdY0sST+iwaS50pAUU+JECjxIoZeFEAljNqstLZ4SUbagWyWow8aBCZY4pkDPJTuCyOSDGush8l5Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350618; c=relaxed/simple;
	bh=98Toql8uimBayK1E+NqY8v40sZgD/pBFYRUHJ7qfUNI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iX2B1Hd3gDyZ2+KdZFXTss6f+oBECd5RvF/7z/G+QSg4aO2xGKG3XHeKy39ynVFdb8XzF/owuoX3jtjJoBAu6nsTqtXRsKcuxsOecoYT3P4f1NW2M76BjrMQtFbcaatyJFbtqC0qHP6DyNSBG9OaVX0FmyzZ2Bx5Z60/3QVFcKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWPGF7xK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWPGF7xK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so14179295e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791350615; x=1791955415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/R+pCgI2rA8DLvVd3Hp39WUeD8ue9hp8M4OoGV9/5s=;
        b=XWPGF7xK5dCeh++EE8SdZ9VsioOl73IaVgNMM3sxJLhxW2M+i+8+N+qygzwgmdJief
         OCeJdnrTPibMVY4XV5HsZQyYjbAeyLkgGXTh4LHFexokGVw3uHnpTUaCbhttBwsKmoYZ
         Ax6kq5X6tpHIMEosYDSR/hBQk7go/XmNTPXtCQRKkUrWypP9WzkM8F5UgBoARMIyqJy8
         AKGo3NsXleKfuSbNP295dc240buc/9LFjqdT9+Lkh0pVDhRGNTbZeDrd22xzEpeSPp38
         2shyS+jjUjtIGikC+XTkcgVCUU9Ky17akbOXAJePd14gbdVmazv3A0n1q3CORz3L6OkH
         M0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791350615; x=1791955415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/R+pCgI2rA8DLvVd3Hp39WUeD8ue9hp8M4OoGV9/5s=;
        b=yqHHLcI9DXJCD8CjolU7vfoCCoefZf1/PF9sGFukmvQ63bW5eWE1DtPt1mt0uAsGL+
         YIVHq9sbZMhVZp05T8RUyoxYs3DQglpeiD6qTOfUz8EnN4fRVH1wnbG6JEr3Nl3XwZZO
         VyAw0oHB7Oo9WFw5UBW2TRouNcuTMPFYVdRLwVgKI6xkM4EaTBf95be+L75mUFihR58A
         pIaWx0lQfNyyXKiYGPUDDbpCCWkSotpN7UHdh6LxQhP84njyPRf9L6D4Ix99YLDTh+6P
         GW6g2qALXo41XIU4z804MEt9kUJjYKF84a71zcBHXdLqqL+cZ8tdFY7rRlNUUre38OGI
         s4qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN9ulMzqWUqXRgJb2pnH6d+nbyTrLuvGJ6SBOsYjduB/LGOy+g/DV5BJsJwp+fmAD97oCGd/v8+UbehZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++m46+wZm8Icqc0c9SbmNtWHkwpi5meknjpw898d4/KPtqHDKNgz
	D7RSoeZHOrbSJs3fROlDxOl2iY5PgqA6xjqQl9wPwY+CjWCRO8hHcE7M
X-Gm-Gg: AYBFou2Ehyfks27Pw6E18RhD6vzDCFvrOOyyboNYbD5NVZS1uJiBIzhZ0IrPZgeaj8U
	85Prsu+zK9Vnx/UuHQb6JxmGXTySegjFdJ1u6top/6fPBTQe6/fLQqEVnvUwXM92twQ+pSLPy0d
	dSOwaCfrhP36F/hP3bHSZ0S5En4o9Q8qRgHvUHc4NtfMLZbhI8RLThfNUfJ2bwPpZjPxd1uQ/0I
	syarDzpcmNktb9Arkc8T8XvFJRTQCS3h7H8IKF7t+5+tCH+KhHGkYADd1uN8trFB0GiWRys55UA
	F2u6ufEMz/vtqNdurvGlfcfoRwYbp8QXwSb0WJjqfMgGIn5NKKBFVgEfh/ZtNQVxJ+04EBukJAs
	Ft7F+xwk+dQrDb0F8r6TAXEgmwW7o9CGQyFxQwt0XdbAqoAnBOZK5MK/O0PVdQ26p4LD/4JAPrh
	7OVpMHTN1XtARuYGfeqk5a0rwLKho8upSEF6dW4yUZC9U3bZjPGlYKShCMAK/6H0FmLVHXm8e+3
	FhY/YjSmu4gHORSWsmKtHelBs3U7GACHFfKpdiq7F/yf2bhvjNEM8JQR6ORifHkj+ggAln9WYSi
	lXhT+Meby5sscx7E30929+M82SHTsx6uUNGGXHFB7OF22xZsEVxTQtk7dYKlpNJ7Hbg5ODd+HQ8
	Dzn5c4xA=
X-Received: by 2002:a05:600c:c16d:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a18067f68cmr11531475e9.34.1791350615217;
        Tue, 06 Oct 2026 22:23:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a1e1-2201-60f4-32e0-4d59-5772.310.pool.telefonica.de. [2a02:3100:a1e1:2201:60f4:32e0:4d59:5772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f54a55esm34907585e9.3.2026.10.06.22.23.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 22:23:34 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	sashiko-bot@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFT 4/5] drm/msm: Convert iommu map/unmap to helpers
Date: Wed,  7 Oct 2026 07:23:30 +0200
Message-Id: <20261007052330.39998-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261006132545.8BFD51F000FF@smtp.kernel.org>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com> <20261006131000.81501-5-robin.clark@oss.qualcomm.com> <20261006132545.8BFD51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> By passing NULL for iotlb_gather, does this bypass the IOMMU driver's TLB
> gathering and flushing mechanism?

Yes. On arm64 QEMU/SMMUv3, unmap_pages(..., NULL) returned 4096 after
device DMA populated the IOTLB, but the next DMA still reached the old
page. It faulted after an explicit IOTLB flush.

Using iommu_unmap() invalidated the translation:

	return iommu_unmap(domain, iova, pgsize * pgcount);

> It appears this replaces iommu_map_sgtable() with a call to __do_map(),
> but there is no declaration or definition of __do_map() available.
>
> [...]
>
> Similar to the mapping path, is __do_unmap() actually defined?

Patch 3 defines both helpers. msm_iommu.o builds with all five patches.

Karl
