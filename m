Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720947F780
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211069; cv=none; b=GB7n8pmAIY0Mqw43FpjtItFIrgLb2trt3ytxFvvrNB/PnNdTkq9tO6ml7G8YjqjZb3WQ2ncnOyWvRGn0L8DsWYHKaJhJzpTTilrZz2fzKZKg9FXUNsoJV4gQD5MOTo6VsI19hSAUnhED//fCxk+8FspKxQ8I84oWBiIjXqy6pO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211069; c=relaxed/simple;
	bh=XMLrGbedguO2MBiVSIISwnSja9N+qK6r3eVRTxmWl6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cx9jjIgAHe+XCmGC5iJHicSSv9ogJNj5v8oQyhkyJOC8E12+nstil2Qeys/jXr0DQQ0+pY7xTCkTxIRQV6amBLU84fUj/ZZEh9cWhs8f/EHiK5GaXH5/aU9t1Quo5F5tavPD7qSwfga8fVAcHK7gSsERbs5l5hnRBL1mZXv/Nzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLTLz8uq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLTLz8uq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so19583315e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791211062; x=1791815862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uiX4TTvsWBCxTAoZ5BYlS69N5ifB0LlN73jBhn7IiHk=;
        b=LLTLz8uqkaMPbd5XLEcKvuKC6VY/c4WLmE0VDO8sr+aOK5rJraTJa83bwR7iFi9zQh
         mA+4iZf7iVoCW8b+HCk73jAR+o+FYbWzdkQ3yJrMMucVkN0Hv0qC1uVMyqf3QmE3NfuH
         B8iSWOMIfqOeJJOPGm8AIp6bTrFOd+K//Tu5dQkqVSygDqJdAbiiJ0e4gTJgRhgwCZsJ
         92Cp58EyVp2tX9NoNppTKOz5O+A9gfe8lB4yPY8B3qech/hgO3M4KFbtfyBFxAijBz8R
         c+xs0AcY/kIUxy8rBqvwO3BGD4JOFMzuBYPuqUbdB/rlR4LqwVzFrp1RMNR/vXlA9Qxz
         Ajcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211062; x=1791815862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiX4TTvsWBCxTAoZ5BYlS69N5ifB0LlN73jBhn7IiHk=;
        b=TwBhMhL6kFNzWYR91q16hldsKRL6csnFxEP91f06CLkzDqw1IcIIbql2esNartdUBU
         EC1e+nmxwt9oiW9sG1OSqWAE4GaDm+VJ3ImXqXQemYlcYWXEAgrWJy8Vu7Spo8EPPlSm
         nrbvux9G/Q4ltLIwOarvGufQm5vUQRtRe1Hlo6/N849IqOhz3Y+OsDb9ojD2l11+cXs/
         BwfxDeJ1bWWiuAcCCrVZdTNqDZtk2RPKaam9hwbqx5qDSqroaz87jVlyN1YcQM6WlH2v
         OWlmlRw5PY9bmGdhDwStXhOlfXx6tkO33bXerVe3OYVwBDEO9+Dyz8pYVIpnuYXK+Jty
         HUMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8vAW2klgFjfD9GbW8GqK23nbILX9bqONc5enEvnowAvKK0MKpGU5X1zlhToI9qgvOKgaBV7D+W2Psnvo=@vger.kernel.org
X-Gm-Message-State: AFuF++l73r7/OSGjhc1uALikLHwBRFw1tah9mWiPPr2076mNNfWhIg3F
	lwTjf4Hcj6zJMU8FgcGVey2lDNCsbFDHMZ2YUVQCUMFGM7MVMplcvJUm
X-Gm-Gg: AYBFou26LO8mnnwvzLsQIo0PMpkotWcr4HtMyCJWILGJi1ZbAU8u+gqldkxOAMogdoE
	dH/79SOl2iXGAaubbJXS2X/WHe/uAI65QeOhPRETsHuTQi8cSgG8fRYBZtPNWoDRQhR5xsXKQtv
	+ayMYq3yHO6ON5WCnNh5wqCgpSCYknz7dfYNgt+zAMsXbHM7q96AMQxhYWOyoOWtpa4rwN66yz4
	gD8UwYrK9pg2X77DqgKDxDtDieWZo6OVayom4zWPwBEYsAaVfngEsrrhCv4kReYxp14yQBbfwDu
	Kxg/jJW0xm4VMG8ox55plhshz7axglC2tp72On1Kwl6OUX5a/P59P8UVLurdFJ3cfepZhFErQUx
	n9Wm2FimyIPkn9Mha4NqIG9jO1jPMszdPu1bbUSn/j+lHVQb8Kjr6QFy+j7eEpBpJGVFxIQWiZT
	mXbGrnkNsYpolIPH639bQtkerJ0mNKJFP/RlNFycMw9tkYfDve62J/r0RgUhmm8OMIh4ZZa9nNm
	imh+7p6BauVM1RcEBEkSh6PRAdJC/FE4YvOhdxhyuAnZKZF
X-Received: by 2002:a05:600c:37c9:b0:4a0:159b:d2a2 with SMTP id 5b1f17b1804b1-4a1680f4309mr117560825e9.29.1791211062322;
        Mon, 05 Oct 2026 07:37:42 -0700 (PDT)
Received: from andreayoga.localdomain ([80.188.242.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276fa954sm348555785e9.3.2026.10.05.07.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:37:41 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] iommufd: Keep dmabuf MMIO attributes in domains added later
Date: Mon,  5 Oct 2026 16:37:34 +0200
Message-ID: <20261005143737.2915-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A VFIO PCI dmabuf mapped into an IOAS gets IOMMU_MMIO only in the domains
that exist when it is mapped. A domain attached afterwards, or an
IOMMU_IOAS_COPY of the area, reads the PFNs back from the existing
domain and maps the BAR as cacheable CPU memory. Patch 1 always takes
dmabuf PFNs from the recorded phys range instead.

Sashiko first reported this on patch 6 of David Woodhouse's RFC "KVM:
Allow alternative providers of guest_memfd backed by PFNMAP memory",
which picks the batch kind in pfn_reader_fill_dmabuf() from the
exporter's memory type. This fix does not depend on that series and
combines with it: with both, a domain added later gets the kind the
exporter reports.

The mock page table has no memory type bits, so the existing selftests
cannot see the difference. Patch 2 makes the mock record, per domain,
the pages mapped with IOMMU_MMIO, adds IOMMU_TEST_OP_MD_CHECK_MMIO, and
checks the domain filled later in two new tests, dmabuf_mmio_new_domain
and dmabuf_mmio_copy.

Tested on x86-64 under virtme-ng with CONFIG_IOMMUFD_TEST=y. Without
patch 1 both new tests fail on the second domain in all three mock
domain variants; in dmabuf_mmio_new_domain, a temporary print in
batch_to_domain() showed that domain mapped with IOMMU_READ |
IOMMU_WRITE | IOMMU_CACHE, where the first got IOMMU_READ | IOMMU_WRITE |
IOMMU_MMIO. With patch 1 the dmabuf tests pass.

Not tested on hardware that uses the memory type bits (ARM SMMUv3, AMD
with SME, RISC-V).

Andrea Parri (2):
  iommufd: Keep dmabuf PFNs MMIO when filling another domain
  iommufd/selftest: Check dmabuf MMIO mappings filled from another domain

 drivers/iommu/iommufd/iommufd_test.h          |  5 ++
 drivers/iommu/iommufd/pages.c                 | 13 ++-
 drivers/iommu/iommufd/selftest.c              | 90 +++++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c       | 51 +++++++++++
 tools/testing/selftests/iommu/iommufd_utils.h | 13 +++
 5 files changed, 168 insertions(+), 4 deletions(-)

-- 
2.53.0

