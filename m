Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42384C9E18
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352722; cv=none; b=B6j2mXa2Ce9yZPxtO1Hpjr/9FwaRYvWgHw68BQAlPl101LRtSNXZtqlxQEQ8H8oKFQV5ros8qQdDPc4gx/PMaYwOHhKDZwp/Z9vy/h1evwSOcils6ko1s7ESBKD6jB+osOVEdVqvBMqCXkwj8QUv6h+8iCWJggR/bwejL/vHhf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352722; c=relaxed/simple;
	bh=wz4bT1GonheGCmKoZsL/+QlgDflUo0GVx6Z0t97lEHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rg5WzIGkIOtoi4gZHeqr0mzwdouNFn6yNYkl18F4VLWsW7dPcsjP9YjEmG0JkkYRsmssjg2v5Z85qXlaMn+8UROOW2dvq3pZyIupKP551Wp12ZTTgUqe1MQQIxy5SBbi5SOKHa7CMEzjHhQ0mMFbBdQ+6PHIo2Oj8feW+3BG6A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNduvPy8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNduvPy8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so8022395e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352718; x=1790957518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sP0+/Epjm1Zv/XcAoYjyuNOC0ozQ/xub9MNxjeAUspA=;
        b=aNduvPy8qLjqis0X46QxscsX18R5ZcI44Iie82gth2ogkt4YYGOy+/+9k0gr56BspX
         EfJ04AvQpX3j0HvB7lQ4g0baz9887jPzVDwWKGduItMmbEwuoRWaExF341LV5OCEIXcv
         7uhfOdwVzpmzJq5djuXcAVEm0AKOSQIaTDjjOQhQRFpF61DjNr2i/2Tb+2bAyongWg89
         pibcWXqG9dNXPJoRTpxjMiVroeo6QSUD6z8fXSHPe84DdWDv7GLuaMK3oGBgKEhcYvLz
         RmpkmzrqCo/1RWGOkQwqxq7gsBye7+oZETEbtF5OauUuEaXT0JqcjcfxNg6LkAbCE8Va
         Qr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352718; x=1790957518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sP0+/Epjm1Zv/XcAoYjyuNOC0ozQ/xub9MNxjeAUspA=;
        b=m9wQHbex5Ywe8AjIujxVRBq/TXfNVU5hsX658zjC7v+p9EhV7b8AEMOZ1H4Ud9tV6x
         MjuRwMxHtiuTObwheDjjUd1QSCiKyvqO9nGpRqBA+C/Phh9aCzqrRC0AzYXJ3+w/owLH
         Si3g3UZ4y79JMfRmqXijoiHOH9/aaBQtw9pLi6V78dOhlbKhl7n51Fmd2XIUlY1Ijjiz
         C5jtxt2vh2nOjKsSpJLsQVPxeOsTE0+o457l2W9m0guw0b8Lp/64sm/Ru1+WywGicdbk
         Y64QfHO12BFDVYupAvqpeEsSxk5wCk9JZGRjbY85nCeMIKeNSznkPjDiZD+rqEkbFcn3
         cubA==
X-Forwarded-Encrypted: i=1; AKwUvBwDw2SUulCgoW9IIwGikMMz2Xqgufxp1frOTrZfIj0LmjDLnthOHEKN+LswC9Vgv/re2lLjNbg7FWuIXqY=@vger.kernel.org
X-Gm-Message-State: AFuF++n/4jQZ8Sr44rQJVwoH61D+elMoe5NwcsC+Wvym8lhWvKb61zrN
	eSeMjhQaJwpxrhRKuPremAEuE7Or1zqQYI49lQ/TNPNaTYWkOIJSrj1x
X-Gm-Gg: AYBFou3+e0e55QOV0hjaBB1FTtxJJAmgFOWOIlYabKAxakEjVIo1D/qktB2aDHgPSo9
	vQT2lOfFrFrRXz07yegmsMPzSuOdqMqNWguuxjZXFhJ/fgnNpbhcAxhehV/D5UUIuuBnKjRWGhK
	W238rRkG05IFQhWFWlSYBuo83nsJDAlji9kXqbFzWRolA8EnIfiYO5paMY+kXqxRWiYWnrO9rPm
	OvO4vOciA1SLh84IA/81CF9wF0HnV6zEfcRx016zY9mNPuP9IhdWbVFtdylCNX4YpPNEUUq+3vQ
	2KAf99wLhC8PqC41boaDr52gYXmfDXFSghLSOkNG7bDEdGmZRox0W0UzbdzWUB7TxjO9qMAoXA9
	/s4oX6fGtWSEMDOe+ClZp+fq/fySD/0Edd7ICX9IEgjF5geWCtE/yF/7thRvgWPeEBAkGawPY/L
	aqva7Q9caNk0bfeb7FNd3iP2cEMRUaNblPi/ebB9DSFnSeKxJkzAFZCGPwW4Z+11FeqktP0luGG
	96B+g/s+WdiSrKIRhQZE8rjxGLW6lMJuuZkaoEuJlEz
X-Received: by 2002:a05:600c:3b9c:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49fe66dfdf8mr136621715e9.23.1790352717800;
        Fri, 25 Sep 2026 09:11:57 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm81238665e9.1.2026.09.25.09.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:57 -0700 (PDT)
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
Subject: [PATCH 0/4] iommufd: Keep IOMMU_HWPT_GET_DIRTY_BITMAP within the user bitmap
Date: Fri, 25 Sep 2026 18:11:36 +0200
Message-ID: <20260925161142.189813-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IOMMU_HWPT_GET_DIRTY_BITMAP can set bits past the end of the bitmap the
caller passed in. Two cases, both fixed here.

iova_bitmap_set() does not clip the range it records to the bitmap. When
a query ends inside a dirty huge IOPTE, the generic page table code
records the whole entry and the bits past the end of the user bitmap are
set, up to the end of the last pinned page. The helper is shared with
VFIO DMA logging, so the clip covers both users. Patch 1 fixes it and
patch 2 tests it.

iommufd_check_iova_range() subtracts one from the length before checking
it, so iova = 0 with length = 0 is accepted and reaches
iova_bitmap_alloc() with length - 1 == SIZE_MAX, a range the clip in
patch 1 cannot bound. Patch 3 rejects a zero length and patch 4 tests
it.

Tested on x86-64 under virtme-ng with CONFIG_IOMMUFD_TEST=y and
hugepages=128. Without the fixes the new tests fail: the overrun test
finds 56 bytes set past an 8-byte bitmap, and the zero-length query
returns success. With the series the iommufd_dirty_tracking fixture
passes, the overrun test skipping on the variants without huge IOPTEs.

Andrea Parri (4):
  iommufd/iova_bitmap: Clip recorded ranges to the bitmap
  iommufd/selftest: Test dirty bitmap recording past the query
  iommufd: Reject a zero-length dirty bitmap request
  iommufd/selftest: Test a zero-length dirty bitmap request

 drivers/iommu/iommufd/io_pagetable.c    |  3 ++
 drivers/iommu/iommufd/iova_bitmap.c     | 27 ++++++++++
 tools/testing/selftests/iommu/iommufd.c | 68 +++++++++++++++++++++++++
 3 files changed, 98 insertions(+)


base-commit: 54dadb030c7e2350957855d3995de05ae02c2e66
-- 
2.53.0

