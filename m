Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423577;
	b=WeLSr81C4DWkUWL297YGllyV65gOVo0G0BzY4uRdxD8rV/Py1X4NSVfqKy/KYUk4I/oq
	 fmvFDkmrJZw5NshI0FaD55O3w1Rqoyhi63B6vC+AxI21XQthfBd1FF0OvcYIli86ctsOd
	 /QmoFTHnyOq+EH2AEyYd/iBS49xAdQt+c1GK1YjyICMGcZcwk66Cc3fAylDVeaiHZimex
	 3s8v7G39d+nsLNK0IkXL+5cksFfjDT6ZGGYSpGzR8Dit6sdV6PkXrbJiweAD39NaFk2p8
	 9tMdYFyHxo9nHVXGhsL3hJ1gmOV6pl/mNliXMO7ZH3krYvhpDx+Uhw/Cx1OPG7SO1gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0+phg1j19BXrf86wyrJWSlSmJGcdhYdq8codoDOSGqo=;
	b=15Pbbv7ymZePfsdpWKxhuYwjemDseyPVu4vNOc4EaLARyukOzi9yV1KlurfmLCo7tbU9
	 pDqaoPiOnVgLUidu7khmfc7y3nxA2YNdKWj4dlypISpX/zjJXMWdI5WN9Z1rDbjWdYWyg
	 tCKIK2KEeZLUYGZ4NkLBJm6PmpJjtYqE8rNkwnVrGB3iQeNgBqf+qll/nHQ2OqxILZDe4
	 5olMDnimUPUyEc6R9RfvD3uFHWBvGCa4EruGp+VIfAO98pPKEEtpegyCFdJMc4BKyOpmV
	 kYM+dAUbgiWM2yt5xvbHRvy9GKTJo8O3HFBQvWNWh3JIRe1bFbTyzJVuv65zqDWPb/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umFx6mtW;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76052606A885
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76052606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umFx6mtW
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so26113015e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423575; x=1795028375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+phg1j19BXrf86wyrJWSlSmJGcdhYdq8codoDOSGqo=;
        b=umFx6mtWCeu3Eq/3p1zwDrv3ADRQERI+0lmurPLVwGrE9tim6pHiYPWGuu89DBqAxi
         /4ANd+yp5P7b1VItJ7jKuPC6mLLkg72KvFbJFA9/mMzyHROQ5AbVS/zb8gEUuoCWoHfA
         wuYNN+xtOKbbL0Czv/7VZfGAURMgFD7OnLo2zL/yaZKnclpHMehAgY9J5wsmS03kRI4a
         L5jVUtvsajj4/rE5B+NEX04y4bV95lzj90vDW3RuwWRIxn07nNJGjF9CaQtbtdD621mL
         dS6WLaC5mru9eERHNHXMkJ0l0gnA+z7UYRX/mFukeFbRlEAA0/2yHf2rOw/pwMhjZi5C
         utDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423575; x=1795028375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+phg1j19BXrf86wyrJWSlSmJGcdhYdq8codoDOSGqo=;
        b=cQROsz59YCYxfOGkR4RqrLhfTXW8GBgCi7Qfcx3gzMWi8dByUf3hpGUXiAzIeN4+XK
         FwnAncK1COpOTmZgdY6yYzzM4pFWcNQZ8S0J7jL/bujC7q9JevEjxi+1JSa3r1zpJlfb
         Q8fuPL9RzZ2Shq3OAi0j8f+kf754X2MRxWoMKsIcdQV5ngDRhrGOQ8LDd+U+q9u27CNW
         D8No54b4F1xFn73Ry81eDClMm5XBFRUXv2nzfn6EtzvS/A0/bSIu84cHbe08ztMVkKiB
         Qq2tGLydahKIhwSN4vBCTkOmKii1MYKW1gBU4dXgvguwd5xsp5r76wev7gtg6ufNJMGC
         cYmg==
X-Forwarded-Encrypted: i=1; AL+hErGaf+etgy7JWvy3Tk2eEpkeU3vRRZHs1vSo+S+ELfgYO4gjQzJxnohSFk2OI7Kz9xnd9cZv8u+9/lPIRoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QX74ExPXTwGyDJ0t5e+/igOpA7yWry8EMdJO+0uNy3zxD2AaH
	VnOePoHIOdLFMyPgrCNaK+HxJGM4rNKUTOZ/O1unZ/KZrXJAHU57Ad2X
X-Gm-Gg: AYBFou32RKXzHJSwKOiP/fssfbXxyEyStorSP7QWatFPLNByS429GpvMihLdwSqXqrz
	TRS/Tj4/lUbjbgBVnaEbviEZaa7vLom6Rxc4qKyUnDnw/CbXDHTzVaMyqZXOYcCe1NJ9miNF0U3
	MoQwnBIMYOoMq3fkrb4wFSg0YsN78/ititoarFAthSg2L3ianqK1bs7uXVFWfjzWib/rXvM7krR
	v46Cosd2NoE59z7PRciIFfFjorvrHpo8dH82siQc53enyzvZEPMx8kYSh6a3kWmIVP038jONiiF
	hgafmvAdknJa8i0CJabgnCHzmGfoHXk+ZTJ/S9Olu0kBVVx+k47MujE3fZ8HEhQwBCDim77M96y
	cI9a8wTtdKfXAZUFHJa5lCCvh35PqHw3Y93Yp+vQUCKFkOqPNbGam+AC/wQQl/Bzay1nw4Drcei
	T8j6MNVyFJ9lOz65GHT4uQaX1KJ8GJSWJyjRvdZIr1V4uUgieDWxD5vsvX6fwi/4pqPhdrGsHeM
	Nr66/kcmo5HVO0I02VPAVJFcH7bs8ybX7Uehz+6ZZrecIfS7DFMC95i0JziHYau9HaCqXEeMsqP
	ZtKn+xlZsNIqgtlf4e22kZ8NZLqD0S8+5XWs1Wt8mRNokha1O6S71u55QQxJblAc8tij5mUlW34
	siCQUHDt1SI96GkPlr1MDIbZ2s7E3Wt+qLI+pn09cXJbW7VmTGfblyOBMoAFOxsKjeA==
X-Received: by 2002:a05:600c:1986:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4ba0935d295mr60270305e9.6.1794423574703;
        Wed, 11 Nov 2026 10:59:34 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e265a0csm9161435e9.9.2026.11.11.10.59.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:59:34 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Guanghui Feng <guanghuifeng@linux.alibaba.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	nh-open-source@amazon.com
Subject: [PATCH 3/3] iommufd/selftest: Unmap areas that start inside a CPU page
Date: Wed, 11 Nov 2026 18:59:31 +0000
Message-ID: <20261111185931.94882-4-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111185931.94882-1-griffoul@gmail.com>
References: <20261111185931.94882-1-griffoul@gmail.com>
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

On iommupt domains, iopt_area_unpin_domain() unmaps and collects PFNs
in one walk, which needs IOPTEs that line up with CPU pages. The mock
domain maps 2 KiB per IOPTE, so IOMMU_IOAS_MAP_FIXED_IOVA can place a
user address with a 2 KiB offset at a CPU page aligned IOVA. Such an
area must take the per-page read-back instead, or one of its pages
stays pinned.

Map a buffer at each MOCK_PAGE_SIZE offset in its first CPU page,
unmap it, and check that no page is left pinned.

Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 tools/testing/selftests/iommu/iommufd.c | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index ca2b35e9d443a..14c8a12a3bc17 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -1890,6 +1890,36 @@ TEST_F(iommufd_mock_domain, all_aligns)
 		close(mfd);
 }
 
+/*
+ * Map memory that starts inside a CPU page at a CPU page aligned IOVA, which
+ * the mock domain's MOCK_PAGE_SIZE IOPTEs allow, then unmap it and check that
+ * every page is unpinned.
+ */
+TEST_F(iommufd_mock_domain, fixed_iova_offsets)
+{
+	size_t buf_size = self->mmap_buf_size;
+	size_t length = buf_size - PAGE_SIZE;
+	unsigned int start;
+	uint8_t *buf;
+
+	if (variant->file)
+		SKIP(return, "Skipping file variant, the test maps anonymous memory");
+
+	buf = mmap(0, buf_size, PROT_READ | PROT_WRITE, self->mmap_flags, -1,
+		   0);
+	ASSERT_NE(MAP_FAILED, buf);
+	check_refs(buf, buf_size, 0);
+
+	for (start = 0; start < PAGE_SIZE; start += MOCK_PAGE_SIZE) {
+		test_ioctl_ioas_map_fixed(buf + start, length,
+					  MOCK_APERTURE_START);
+		check_mock_iova(buf + start, MOCK_APERTURE_START, length);
+		test_ioctl_ioas_unmap(MOCK_APERTURE_START, length);
+		check_refs(buf, buf_size, 0);
+	}
+	ASSERT_EQ(0, munmap(buf, buf_size));
+}
+
 TEST_F(iommufd_mock_domain, all_aligns_copy)
 {
 	size_t test_step = variant->hugepages ? self->mmap_buf_size / 16 :
-- 
2.47.3

