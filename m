Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5F649B449
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463944; cv=none; b=jW/O3pVgAbyZN9To/S61xXR/ZbuEpoIoYcbHNrhrM3uLqnoIWr/Jc/TrV6tgGf5xsGRY8gUlcBI60nrxNMCtc1zQkDBqiqAceTIQcyWwJR3I/WNDP7fPlt2wZAlFbPupl5FigoCftMQIETpcUc5NIMwU0CBT3V4X/Izl7yCkb1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463944; c=relaxed/simple;
	bh=6dIlz9XXAXD7hMCFtpO+FQoMd6e7ys9QKDGE/4a3ZjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aIsg7U0H0s+Zra4WKEUILwhHahvzTQWEUja5aM/Lu9Q9rK7JEvhXJYtnxovQn9urzgfKEdx4KscfoWafHK/m/wAFAbL2wzKffzzuqdPfhf30xBWhUSV4r6+0OYdhKFS2DmcyAZIex9ksfQ1ryV8vaSY/2N0AqBB3YgLLkXsWsv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TF0EHQyA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TF0EHQyA"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso506436f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791463940; x=1792068740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f8QWxVZoZeLawAHvciNRJOIulLw+ldBkjXIfdbSrmQ4=;
        b=TF0EHQyAG9PNAh4TfZGhVe5jmkKdbYRZ9BADEOSPz50nWw4hSzjBSwuuGsqkGxZQH0
         X61Mc24QbUEDLFJSd4EXqhE1Sy++eKJtItSBCGTiy08UA2xWrchqEfE0HQ0SHW5aRpqD
         H7GJF984MWbUbl6lvLNmh0GhwElU111R6+Cu2TFa7VJlSQkssVSkO13CyxG1yFTk+AdK
         xSowB7SV5vswI9YO2Lw7A0VUQLshlHUIT26gU12CrJZusKUTS+Gzgp3tA/t0ppmYLAuX
         gj/U90RJva80R/eNz4ZJF/sfRGEYWBTnN+us4gNa8TIMPSVEnif8Y5Eusk4/7L8W2JIL
         fGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791463940; x=1792068740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8QWxVZoZeLawAHvciNRJOIulLw+ldBkjXIfdbSrmQ4=;
        b=w9mTUOrLkU/gwJC9tj1XIzLz6mDzz0AEgXqmQQp06IYy+QHziCE53KfM3pSdyMAl8y
         kz4zWiBQZEBsLrw+b18ct+2jnCTQryPe0AkUFE6ElppgBfY0pJfrJVDDETX808qnoHFu
         lci9xpC1V1/GMKUXl6reunYotK85sqB4zjKEEtk9f4ey57HFYi8VAxQCw8zhkoud7ypy
         VurycgnAvi59PtEYqGFtDGdjrhizlxn7ovc7Vh5JSGkwsYbxhqbSviSom9w+MmuPC4Hg
         8BUzPH+DsiyFc2jzGFiNhc2KVuibfFyzsB0QiH+Qu5ZredDkFpBvcGNtkbcymUHWPpJW
         S3Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzyk21luHuO7boAWWGrd3QJDr6QJHuMTvVxuiHTrOy7o50AQEH3qwHtQ1SaAHlXM6QNIkUNgrB7xBUXl8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuGA4inxt2IT7cBoi25fP2UmeO+HmXsYu0o/vrNVOk8FeXHpsK
	yvgZGm/owYclzdyKFS+Gp2PAp8mY8OyRVgPuswWzASHS3az9yZAhxVLK
X-Gm-Gg: AYBFou21OvNKS26n+Ck3AXr6ln4j8f01RliRQuNcB0QeT5WRGJ+9y1Z9vR/svqPmjsH
	rWf7FfcCltYAxyIjKUvd/s/8R8xqyG+v+PAYIYkX8m0hlV+kSfSZlpWv+MqS+paEgV6dqfOGorh
	MbLdA9tHpYDcnes/sVENzt0rJMEHGOJGLESAwp04qYpvfvVFNXJiryFWs4uKhVZ+7gjUp/cGmxW
	uWN7i6sZBklbA++juGeaLuynq9Qkn5riIyk40x14u1v4Ge1JilJViVTSo2H4+X01prSaDt8mxeR
	VodCdbrEp/8ZM5MBq2ueR34tfU++N3yEXYlNyBuTCukI1VNIUzHfCFieH+eedvHSMNjRENJBR2p
	o3SxdRhO3d3S2d6cksl/9OlE3io0DOPkCegh5sQ/apEjascipiPi6lh2/0JALYCFW3978v0Sh2H
	M7xWKMgq6OHwiJsbQc0NhCY205qxLFGHyq4tiKBA3t8FrHnvi4D9iRKnmX6B0+RGle/i0oiFzlF
	4kJJgfQQyi8IcmxKEid6XuCT1tEo477/BDJDd9/SXr+TKytZT9k7RY=
X-Received: by 2002:a5d:56ca:0:b0:48c:4f4d:4d6a with SMTP id ffacd0b85a97d-48c7f12dee4mr3518058f8f.28.1791463940003;
        Thu, 08 Oct 2026 05:52:20 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.41.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm10584338f8f.45.2026.10.08.05.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 05:52:18 -0700 (PDT)
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
Subject: [PATCH v2 0/2] iommufd: Keep dmabuf MMIO attributes in domains added later
Date: Thu,  8 Oct 2026 14:52:02 +0200
Message-ID: <20261008125206.11990-1-parri.andrea@gmail.com>
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
IOMMU_MMIO. With patch 1 the dmabuf tests pass, and the other iommufd
selftests give the same results as on the base tree. Patch 2 also
builds for i386 with W=1.

Not tested on hardware that uses the memory type bits (ARM SMMUv3, AMD
with SME, RISC-V).

Changes in v2:
- Validate the MMIO check range before converting 64-bit ioctl inputs
  to native-width page indices. Reject range overflow and values that
  cannot be represented on 32-bit kernels. (Sashiko)
- Patch 1 is unchanged.

V1: https://lore.kernel.org/all/20261005143737.2915-1-parri.andrea@gmail.com/

Andrea Parri (2):
  iommufd: Keep dmabuf PFNs MMIO when filling another domain
  iommufd/selftest: Check dmabuf MMIO mappings filled from another
    domain

 drivers/iommu/iommufd/iommufd_test.h          |  5 +
 drivers/iommu/iommufd/pages.c                 | 13 ++-
 drivers/iommu/iommufd/selftest.c              | 92 +++++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c       | 51 ++++++++++
 tools/testing/selftests/iommu/iommufd_utils.h | 13 +++
 5 files changed, 170 insertions(+), 4 deletions(-)

-- 
2.53.0

