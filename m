Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81D4EA366
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352731; cv=none; b=OSJVeaHjD5uss4zqYyDwJyEhlDYxhrV8T+zdg5fVNCsUBYSlCqRMUO2zFQH2IiBtOvuC212WFnDpGNZaK1zMHSTQXezgpKJvBkUQZUGaakwZpBLWwM3m/fMOtqihlr9tzq2T1UgSY+mbn2QEW3RSA/M6XGpHuD8H3097Tn+QJCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352731; c=relaxed/simple;
	bh=HUOnEjhv9fKfLJ0A1Oqzk39EMDsr2o/axxVNv8d3j7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uIndaMNMqxKQLKQinMiCpXSFXsSTiLAB4M4RuYJNKPI+UI80ITVjVpqhGqE3x2V/dMj0ZaTsAm4Ok0Esoge5rkXSwAtounqN0IzcSWI4TNTsq2oIMk5wdSnND6QjNogydHTk5nVlfDaJHry+sfpK3Ihj/pHwk+PVymYP2odDeMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UViyKs86; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UViyKs86"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so8329145e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352726; x=1790957526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwRzATKx4Uz1l0MN7TD0eqrZoKpNRRbzLuIcmEq8eCI=;
        b=UViyKs86byAvX3X8cvTrCondGaaXUiI4M7tEgiAVTJxv60WiikuyjxRyhO2p9rc2i/
         6qprZ7GqPwTr3PuIJ6Wa4HyRQaMcHNWR5M4MHq3UiXE8rB0IXj6yUV7Kx09yNoVI0BRx
         tzOQE6fcWtlxgjdGqW17/5r6M4N3+izQslkCoiSdEZ1BjZUyj/LXfHfuIs3kxu77/lhY
         1jvu4v/34P7qoOyX/GkncXOKFBGi80NZ9R1zM8BUezgjvg86p+t6DIBKiHyEQUhs4qO4
         M1s/UGqzpCj+EZW+xajUKgkqTltCFdLSYqZjA76gmYNedicJ9z3RZZTIIaOiiE9mM7UP
         1TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352726; x=1790957526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwRzATKx4Uz1l0MN7TD0eqrZoKpNRRbzLuIcmEq8eCI=;
        b=PKjSCe/XLrdSmRt02EoXXTV1TKC4R787BNdqTmXshf44WY/2cIMSvAV37xsYpTVa0N
         uChIg/kzjWI30gkZ32u71Kzul7b9r80NLaYP73RvuR3d0JiBYMUJReuXu3ayysqDYzYa
         Nfm2p2URktlReBGYLGGpxVoUd+d7qqwPUSmid31Rhk5AHtCBZmfPiwXdDX9JlgMEdbHd
         hs47qv1ZAMYAJX1VJKcpwfkqOxKhFdOcQIRm/2c/D3HX6+nI87BiEuoYK+kVOKUAlNTb
         sjOiCKXHLJSthCHkvN9SRnWa/0KWB1BxvU4PKZNL9krq722SoTGsGByuUGHgmEsaHmL6
         0NsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAW1OYldmSXIcgwAhE5UmYMazdxm5IgbAtsINRDAtypaWYixJgHJ/CvkrY3zPgoJS7fjofVbc2P6OjWcY=@vger.kernel.org
X-Gm-Message-State: AFuF++m2qVyXTfB7FM1jdzOZIS5rfmII9SnWkm98NrvLb1S9DCAHJAnv
	2pvUZ9bX9CKEKYTuV1iG8yZc/3gGW5VZyQ1wpafZ6rkSij2s2Sxx8rAA
X-Gm-Gg: AYBFou1H6xxvcGg4CcS0ZujpFKfPKtPrZWXoIvqnCGW2ZqD1AYXhuyiouijkS3Q29yw
	Zn3+ZBkIMoqzNgC2yRQL7CNVJAMqptC+Qkima6TUlwDujqg2MmOgrudhzea3Z8PB4YPcU1KfrjO
	KUvzrau8NOUo0k6Mz0KRgm7zl1pcowjlqQcsx7fkohVlwkbeku7dkcRLp4kppYN0ekboHb6oyh9
	2ZWSsagAYZK+Ie8wR/1gX1qL7Nou+Vzb3x8abAkvyGmUYZZPlDFAVB+kawPwEVJT8woLzUWZDQ2
	YJshJjRboP+wZs1GVFm9/KslSI4cReawGAIvMNRf3lKln0BZ/fRYxNsVzSRpyrcFuldlK6vegX6
	5FIFGlBzDyFeIEBPXRi/fh0R6fzRxSBnybuwfITLXBzkYuV+CdP7UogX+melzopjYhekuHqnB7j
	N6lQPc0mMf6MvMJfIrqbEjsk6mIAJR+Jw5M/IwFNauA/rnpxoRCChi+gyRa3UPjiJHmzjxESqaE
	O8A3wTUvXTnc5nVCWsm1gFHEVdgfKs27oqXK5Hw8rKI
X-Received: by 2002:a05:600c:4f12:b0:49f:e194:a062 with SMTP id 5b1f17b1804b1-49fe66fc6b7mr130556485e9.32.1790352725963;
        Fri, 25 Sep 2026 09:12:05 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm81238665e9.1.2026.09.25.09.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:12:05 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Alex Williamson <alex@shazbot.org>,
	Yishai Hadas <yishaih@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/4] iommufd: Reject a zero-length dirty bitmap request
Date: Fri, 25 Sep 2026 18:11:39 +0200
Message-ID: <20260925161142.189813-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925161142.189813-1-parri.andrea@gmail.com>
References: <20260925161142.189813-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iommufd_check_iova_range() subtracts one from bitmap->length before it
checks the length, so a zero-length request wraps to SIZE_MAX.  With
iova = 0 the wrapped value passes the overflow and alignment checks, and
the request reaches iova_bitmap_alloc() with length 0.

iova_bitmap_alloc() then sizes the bitmap from a length - 1 of SIZE_MAX,
so mapped_total_index is effectively unbounded.  The scan uses
last_iova = ULONG_MAX, which spans the whole IOAS when an area is mapped
at IOVA 0.  Reject a zero length before the subtraction.

Fixes: b9a60d6f850e ("iommufd: Add IOMMU_HWPT_GET_DIRTY_BITMAP")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 drivers/iommu/iommufd/io_pagetable.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
index 4e447ce74cf6c..283ab372e8da8 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -605,6 +605,9 @@ int iommufd_check_iova_range(struct io_pagetable *iopt,
 	size_t iommu_pgsize = iopt->iova_alignment;
 	u64 last_iova;
 
+	if (!bitmap->length)
+		return -EINVAL;
+
 	if (check_add_overflow(bitmap->iova, bitmap->length - 1, &last_iova))
 		return -EOVERFLOW;
 
-- 
2.53.0

