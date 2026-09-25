Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5940C4E50B7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352728; cv=none; b=ckPfSwRFAG1mBoURy1GbEXFMo0uT9mD2Tjwguy80QcLcwpVksKpj2O6HX+inWSEEFc0i/IyauEX/3SFajiDEQNAEYrrBfrt8KbTo/w3KjrCcLDjlJaRr+cuFQwKL4ygn7jybCJBDW9ZQWMyy9CpxAO397Ftt1O04uuaf1oQ+qNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352728; c=relaxed/simple;
	bh=WGq2HRYeziGGP8jxJ0+hdrLjQktzzJ7M9H08pWduDg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOD2geG8bodiLWLYxOTjO/tBVm5N9HF6yqbOiBHSUqYAwUDUxMBh+KqoWePZffGkDIjMEIKlhMz6taqQcCQhvmvez6h+Lck7ZroQgK6JXm9olHPyg30XMEdwqjO6+nQ34jJP2QRaBR0RAI2I7i/0vj/9100fX3LEEutYWNIJHOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eP9dmbOh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eP9dmbOh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso5310165e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352724; x=1790957524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zAdqXxvKpdaLjEa5r1LYZ4puNr9pTrnan0b9GFEiEg=;
        b=eP9dmbOhsBBiYIRpY0Hm1ya9DMSQ1gWuGeLizSoi4xfXcFNdzSavnMoJgxo5VRxeos
         kSLMgX5RNKwV8oCdxFyhlKy7pgWGdLFXkFKcPhFEYhJ1znLVpVg00pGySxogQiRPLWGA
         V6MSt1OVI2haq/PCFcVjVa1aJ1bM9YhYqNEC+TZzDftx9/HbjkOTdRWQ0/IxbTzE2ViF
         eESxiz7yzwEq/smAaOAnex4IDbSXeKXh1AiQ2dORx0ZCtJIViBDI4zxH4J3tqlUaQaTk
         94eiP5REKQRSHmenCitT1RF5pCOxR8JM+h8XU0OaikOFjXg83yB/8LTtk0HS8GJ/hGRj
         5/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352724; x=1790957524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5zAdqXxvKpdaLjEa5r1LYZ4puNr9pTrnan0b9GFEiEg=;
        b=jdkE4GM8Z6pyxuwq/JOwdmAwynMlCRCfu5qQ2fuKLTuJtrMQAMyxWv2COpdq28yi1G
         3xpRS69tHz3Wle98ww6ce1GO7uHmomb+p198G6xXE/DZtAJVzlLhOzguFXfcDXGssq69
         xEjFRcUPJgNmAXHOYvrJi8EmhqMFEuqCBpolv/UBP98ekPJDubZDPMvwACF/pVymAS6K
         gB/Cr2HcDS04l//5cw4hCzaqSIGHqR5BsJTQ780Ib9HSCZXiAOEtoacHSymGkmJ5VZUL
         S5oEdZJYNJLMFctOVr5mfPUAJdgit0vCmX+q/nA2oVlQVJLWDSLVNNCe+eKzeN8N39Kp
         EIBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVS1WQ0Fva5gfcu6sKLBjw8zqtLFdFpgTxy2duO0oVfm5wy27PjngApH0ft2BxGXo2TM63kHNA+fTfamk=@vger.kernel.org
X-Gm-Message-State: AFuF++nA26CGanznbVtb8HaFbU5mrCVC579haaTgdS59BKrsuOzNglXY
	O6aIZGFAidi00t5iIwyykpVoByUkQtP1VALR3uPoTwqUQKwLSEeIYKSC
X-Gm-Gg: AYBFou1wolXrgjY+QezR9CtsCELeamUOHahHozUaZjwsv1xf8dW9I6cCqEekTgedUD1
	Hsr4an5gR4n39SN9fEu+EHKbp3Ye+Xk/lg4DJN3P6duLSoaKpSIM+sXEo5mmLpo84CoO0x2xOio
	uOK+IbKrGgRF9x9DsAAtSwHufGAUI0s6SA6LympUoKASkx502ikdWujJtGA/ouRyQceGbx9vPok
	iZI0JILHJ/Sgn4Nbbz0hLuLO9PcQpACZQnv3O5LBiouthmCTxwbr4RW/yaEOR+7tcPhVU3UgTnp
	qruNK/FTPacvjxvfDpmcljac5K6MQmfhUWXLUVU6w3mUME7fTWt2zxVp5DmDIoC2rM5+XexQAIc
	52/vNeqq7OE3NAPcAIMUAInw8ONFJTj/nLEd4BSNAM+PdVOivjBxMqKSnA15mt9e+hhJL3D0AWB
	qKI5LkdvlhYI25hnGGQuIIAxUuqV8Ks0XNC3a81KldiuAqvnsO7kskEQoTRpXrQgVINpr7RHdCx
	PT14gpw5jAJ7I96AKhqU+wQOsi4b92MwjXSposcdTBB
X-Received: by 2002:a05:600c:6206:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49ff06e6be0mr45983515e9.22.1790352723909;
        Fri, 25 Sep 2026 09:12:03 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm81238665e9.1.2026.09.25.09.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:12:03 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/4] iommufd/selftest: Test dirty bitmap recording past the query
Date: Fri, 25 Sep 2026 18:11:38 +0200
Message-ID: <20260925161142.189813-3-parri.andrea@gmail.com>
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

Add a dirty-tracking test that dirties a huge IOPTE and queries only part
of it, with a guard placed after an exactly sized bitmap.

The test maps hugetlb-backed memory, allocates a MOCK_IOMMUPT_HUGE
dirty-tracking HWPT, and dirties the first 1M IOPTE.  It then queries a
128K window at the mock 2K page size, so the request covers 64 bits while
the tracker records 512.  A guard follows the one-u64 bitmap in the same
pinned page.

Without the clip in iova_bitmap_set(), the kernel sets 56 bytes past the
bitmap and the guard check fails:

  # iommufd.c:2470:get_dirty_bitmap_overrun:Expected 0xaaaaaaaaaaaaaaaaULL (12297829382473034410) == bitmap[bitmap_words + i] (18446744073709551615)
  #          FAIL  iommufd_dirty_tracking.domain_dirty64M_huge.get_dirty_bitmap_overrun

With the fix the guard stays intact.  The test runs only on the *_huge
variants and skips the rest.  Tested on x86-64 under virtme-ng with
CONFIG_IOMMUFD_TEST=y and hugepages=128 on the kernel command line; the
whole iommufd_dirty_tracking fixture reports PASSED: 63/63, the seven
skips being this test on the non-huge variants.

Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 tools/testing/selftests/iommu/iommufd.c | 49 +++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index 44193d171ba98..47d861b3bdd7b 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -2423,6 +2423,55 @@ TEST_F(iommufd_dirty_tracking, get_dirty_bitmap_no_clear)
 	test_ioctl_destroy(hwpt_id);
 }
 
+TEST_F(iommufd_dirty_tracking, get_dirty_bitmap_overrun)
+{
+	uint32_t ioas_id = self->ioas_id;
+	uint32_t hwpt_id;
+	size_t nbits = 64;
+	size_t query_len = nbits * self->page_size;
+	__u64 *bitmap = self->bitmap;
+	size_t bitmap_words =
+		DIV_ROUND_UP(nbits, BITS_PER_BYTE * sizeof(*bitmap));
+	__u64 set = 1;
+	__u64 nr_dirty;
+	size_t i;
+
+	if (!variant->hugepages)
+		SKIP(return, "test requires a huge IOPTE");
+
+	/* The canary sits in the same pinned page, right after the bitmap. */
+	memset(bitmap, 0, (bitmap_words + 8) * sizeof(*bitmap));
+	for (i = 0; i < 8; i++)
+		bitmap[bitmap_words + i] = 0xaaaaaaaaaaaaaaaaULL;
+
+	test_ioctl_ioas_map_fixed_id(ioas_id, self->buffer,
+				     variant->buffer_size, MOCK_APERTURE_START);
+	test_cmd_hwpt_alloc_iommupt(self->idev_id, ioas_id,
+				    IOMMU_HWPT_ALLOC_DIRTY_TRACKING,
+				    MOCK_IOMMUPT_HUGE, &hwpt_id);
+	test_cmd_set_dirty_tracking(hwpt_id, true);
+
+	/* Dirty the whole first huge IOPTE */
+	test_cmd_mock_domain_set_dirty(self->fd, hwpt_id, MOCK_HUGE_PAGE_SIZE,
+				       MOCK_APERTURE_START, MOCK_HUGE_PAGE_SIZE,
+				       &set, &nr_dirty);
+	ASSERT_EQ(1, nr_dirty);
+
+	/* Query only part of it */
+	test_cmd_get_dirty_bitmap(self->fd, hwpt_id, query_len,
+				  MOCK_APERTURE_START, self->page_size, bitmap,
+				  0);
+
+	/* The queried window is dirty */
+	ASSERT_EQ(~0ULL, bitmap[0]);
+
+	/* Bits past the queried bitmap must not be set */
+	for (i = 0; i < 8; i++)
+		ASSERT_EQ(0xaaaaaaaaaaaaaaaaULL, bitmap[bitmap_words + i]);
+
+	test_ioctl_destroy(hwpt_id);
+}
+
 /* VFIO compatibility IOCTLs */
 
 TEST_F(iommufd, simple_ioctls)
-- 
2.53.0

