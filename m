Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229164EA39A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352732; cv=none; b=YH7k9hpqxK5QL4MGzjrOPuunHXjXXy9e8qvRBNn5mKZLwG5taQdisXyf1CKIX4GA8/qesPzI1qEsRGD+XFEpPN1vySFg7k41/YpI1XdD7R5w135qTufLP4OLwnX40MBy58x7gca4dSZFJYJpZnh3qozhFlJLqUy2NAzV0tC0Uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352732; c=relaxed/simple;
	bh=3zBndnPbmFeoFqTjACZnEMiREdKYWlO2VdcYcm001/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F10L5s7tkbHt1GZ0BMemuhGhJCgSZM/khMl+aKH3cNKt8HJ1nkuw04Aq/lzmbx7J82oByVX+EuDLCoHyvm9MyLTNPWVruffsfmmbgdaf+4XMg0sWzStBr2oh6uJr8r69St1egHms0WEae3/C82nMywGTeBJWHzdr3+vI8ey1gSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgbIt4f7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgbIt4f7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so8942065e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352728; x=1790957528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJjIAQ7/2x2XhBZs9VmF+j8AOgJ6YIg+9lR4a75uO7A=;
        b=bgbIt4f7m6bv8Gg47Q8smGyae6B5rlhc0iaYDmiuur8mVPi1GTVVUtkb7m11C7M01T
         1Ziuqb3dwTn7k7BAkxOa9O1YZwQS3tMaZL0+XKhadvUBzdgGfj2I+UjhldXot2C3RamX
         6ybQ7pSVGdt+/lhSeDNwvD/RryIA80modmJwYSsm5EeODmUKRpnPFkNwx2SPuLYjjZq1
         4BeNFoVZDhxVm6iFTdk9VblcxNXRh6UykZg3T58i8Y4eglDnylp32TLljietBfpHN/zA
         VfxjH1cmCnbIAxQYFti3IbAb9C1ftntH4YNC7o1JZ/GwXF/mEaLFBBvbyW/fF0Ti9C69
         oQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352728; x=1790957528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJjIAQ7/2x2XhBZs9VmF+j8AOgJ6YIg+9lR4a75uO7A=;
        b=Da3snvW/4fnk5bnjmk8/YFJeDt2SJM0suON/riKabhLv3JZ+r3DYzAMk5SAWdhQRBl
         AbHg6nLkDjM05xudaUsLTPR1rLr+0cH/7w6DxdsmJonhI5xQotPUxnRWnDFZ6PT3+e5u
         HvbS0qWmy5vwTcFnp3ccIWD+HH96yH8daCuaqMM1Dj2p8f0cRPpDAW/NsxZ3bu32kbxK
         KvQoYexTIqiAxdEDk0yjkoA/6jrQ2okCYHNpYfCUhkKRvMAzt1AzMX/OnJic5z68y1Jo
         B8Lzm9tQrxunAHdA2DHJFj9j+nBgwGOP9sSkr8g8ZWON0uaVKIl12QvS6ADsYFiUrOAk
         Ga3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwk9MT80f4m1rhdvoZNiFFAtd6SszvSo2OY/bOTIawROpAPJmina8miHNzEyLCK99IkE4Bhtg4Q6e2SZ5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lbKeHJmLpimFQrZrAgtiGLXxyPr8GEu4lV8Klxk57V1AT5Qsxu
	L2z4UVQ2VkHqU61ngMtnWxKcYaWj065FVoRX2nPCyQozMn7rZNlw/zvs
X-Gm-Gg: AYBFou0hlLxFtPm4rCcC56qE8Zvc44KB8pfJniKBgEgB2F3FwMxbPo9ZbusmpH3HS4a
	kAvZzZU2y6w/R4iDs0DDAXKGeZ8ettBoWKOxLJFvTwuFEcIaxTzNPu6ZNNMb7tGAvUxg22XcAXR
	KxKZyRBXvJp7iCun68+7bmIOgP/W0yIExHjGrjfl87dS8FoSQ+WByF2CxKE0XwA3xTwjhbdoCPk
	rutZBYLMNidE5jVJlM2Vahz2XW4J9JeQjV+W7U4AgsrbsBO877tClyvPJJ0qJ6TqXnLggZ2UOdj
	79qTkdhDmrxAh4wnaIUq2amaquGxk7AHubkHh3Y/3EPKz2GY0Sh0aaJzgd4AYD2hnaEvmtkwka4
	kEFLppCjLxWSeVF1hkU6DVkI+sNtVmNbrhG4qlvnlTcT88sKsHh55elpZ28b2NuB3RI5rvJgzyr
	aEnMoBP80BvD0zYZxEiAQBWj1XexX0Sk96nX1NeT/2t6XPJu8CWrVf7SIhl1nvUpV96RYm1xYCr
	6NdlgoQCIyy4k6OgBV7SzCk7sMWPBq/vsrLt0Gkb5Tc
X-Received: by 2002:a05:600d:d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-49fe7726ee3mr94636635e9.32.1790352727934;
        Fri, 25 Sep 2026 09:12:07 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm81238665e9.1.2026.09.25.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:12:07 -0700 (PDT)
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
Subject: [PATCH 4/4] iommufd/selftest: Test a zero-length dirty bitmap request
Date: Fri, 25 Sep 2026 18:11:40 +0200
Message-ID: <20260925161142.189813-5-parri.andrea@gmail.com>
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

Add a GET_DIRTY_BITMAP case that passes iova = 0 with a zero length and
expects -EINVAL. iova = 0 is the value that lets the zero length wrap
into an accepted range; without the previous patch the request is
accepted and returns success.

The case runs on every variant of the dirty-tracking fixture. Tested on
x86-64 under virtme-ng with CONFIG_IOMMUFD_TEST=y.

Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 tools/testing/selftests/iommu/iommufd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index 47d861b3bdd7b..2b3c9e9c69ca7 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -2472,6 +2472,25 @@ TEST_F(iommufd_dirty_tracking, get_dirty_bitmap_overrun)
 	test_ioctl_destroy(hwpt_id);
 }
 
+TEST_F(iommufd_dirty_tracking, get_dirty_bitmap_zero_length)
+{
+	uint32_t ioas_id = self->ioas_id;
+	uint32_t hwpt_id;
+
+	test_cmd_hwpt_alloc_iommupt(self->idev_id, ioas_id,
+				    IOMMU_HWPT_ALLOC_DIRTY_TRACKING,
+				    MOCK_IOMMUPT_DEFAULT, &hwpt_id);
+	test_cmd_set_dirty_tracking(hwpt_id, true);
+
+	/* Only iova 0 wraps the zero length into an accepted range. */
+	EXPECT_ERRNO(EINVAL,
+		     _test_cmd_get_dirty_bitmap(self->fd, hwpt_id, 0, 0,
+						self->page_size, self->bitmap,
+						0));
+
+	test_ioctl_destroy(hwpt_id);
+}
+
 /* VFIO compatibility IOCTLs */
 
 TEST_F(iommufd, simple_ioctls)
-- 
2.53.0

