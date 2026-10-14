Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CA5325726
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792012580; cv=none; b=DKDiASPb+TtDcATxLD3OAjlE2Qpth2TMr+nib5k75ohUkgI+aNeLqF40wew+iVBAxLfrpmRmV3RXndDHqo3A1m8B9S5GWFqwpHRntp4uQrG95iwimhsJfctGWtctABBt2FhA0O/DKe+Ly6RHrHm3YhY0+CP/QsMfZ4WZD6bea7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792012580; c=relaxed/simple;
	bh=xFG6x/caOplP2tyXgSPYkFagvy3LI/93+6sftU7tLJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVb7M6G3syaUJ8hr6YMsFUeq8TKnDMsMrel+x/lI0/xtVhJfz57xM5fIJSGXnZSujFzzvQMVnw6mADAlc3/BS+6ShEa5P0V8BuWUriOr+RA/kEwYmqb3VH8btnHdK3PKHeRma8Ex0G8DRhZRPHzfHZUSj5G/q3oAjCHLouwRUNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSrG4gmV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSrG4gmV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4207ac26so4254903f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792012577; x=1792617377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbxQS/IGQfFShnzjZAFBRrockgDU/h/fKnsW13Xq4Es=;
        b=RSrG4gmVIuzlz8FJe/tb1fU9GWZkKBHSqeo64XKBG+hx0wutDgLbnN/5Oc2i3vNd8b
         oR8jd//2g9cPB7CkUKlxvcxE+ekigC1Ao6+tABHjoznjnahxzNJOE9ocIhduSvzOEvOu
         h5sJzw7UJN0L25oyLCK3ycdjmBmV+fhlB2gQooUOCEc/fkBiogNRjsQu1l18aOcADvbH
         LOjS5FDPFCweruHJ9MQs0kjtmMP1ag0/vqK9Hkabyvd9E/wz+u4AGM2TAnjdO3Ajn8wy
         tW4SJ4YchB8Jgjc9pwVV5ck3UC2dypWMwAmvAFujVOwi+FmWAPKxdQRUBSJozZKxrVJx
         Pg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792012577; x=1792617377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mbxQS/IGQfFShnzjZAFBRrockgDU/h/fKnsW13Xq4Es=;
        b=Lof4BprOkvfeqHf5WBCZ1NV/qjg6ho+lEbjcnZsxG5e+4wfNRkSH9xM2onbKVRv0at
         DgNxMkWZQ0flBmIp2v+rjCdjwuv0+H4z0l2Kff0PVfBbGXTETdQYFkEyBSqg7LnPVYvT
         S54lVzLbJdr3pLs7ru3DOuuMUweVCYYR8h6bKP3VL7+/sidUqqjj946lTZMkSu+wxJzh
         T/fEhyIJFQeiXoBN7TvmebPUSqU496IKr4ohlzWr3YFwwpa+kiJdL9Uw9qq+qNMuF82L
         Ud0yHHrq7UdccKxll3eU1fnIgkfEKToDdtluSlc7LhYCNFhz4f4afnxaKvqhwbeQmns4
         Bbsg==
X-Forwarded-Encrypted: i=1; AKwUvBx/l2+aAmxMZjiXWqiACd3JTdMpuy12VbumeEGJSXjl3Pk0nlW18bUjhuNLJcAWCwBwpFRK45jR8tiBziI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC5JK17u90HWsedwfxBmA+LmwHzuERzhjfI0UpV4DEbHfiqc7L
	O1EY+RTI18QMBrkWK1Gx+nB9k7mnPmkco2ruqoB4xqIOoaBh+TiaLuPz
X-Gm-Gg: AYBFou1aFyNfudG+mQwQElKvTMFpe3oTvtTgnHzzcx5oWDBQxQLeLUVteaRoqgxJ2w0
	Y79o63yLgPWra8Bs5YHSyUEkA+cpVD/GsJN7Czps70iMWQI8mftTstdh1huVfhdEi0eO8uRQIud
	wh5hUePchXw3mrlpzHw3taZYqgMR9asB2paEOft9ibWOZzuX/JaHjn+USzopCa6WG3gGS6XiLVl
	dJeIxRCdYfQFF+xwsKVWZrb7UyPZViGCxbi+KXNVV9TdeGG/lEP+U6zCQ5Qqy6sUj4OkrpT/ZdB
	oEPRbsiGcuPgAN8scJEcO8YQ+/IeHh0oRniWwm5CslTVPMu7a9aDq7uYAWb8w5qDupXSgYdnckZ
	rfWpSwqiT2BrXn1ZSzQ74IOEJOp9d04+ifbIrBRhqc/KRQY3DRIs92yIor7Pf0Ubv96z9EeBcVs
	vr4W6N0e+YHEieV09IxCnk0gw5zm930uADagYPUPeTNNmq065p//6DxRMdFhxOX0uhpOCxNRg28
	Sni3vSdH7lzN/scpOOsTC0DhRD56WGuhCLifIpMdsXNfg==
X-Received: by 2002:a05:6000:4683:b0:48d:df82:26ec with SMTP id ffacd0b85a97d-48ddf8227c2mr11468268f8f.11.1792012576642;
        Wed, 14 Oct 2026 14:16:16 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6ddcsm13832288f8f.52.2026.10.14.14.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:16:16 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iommufd/selftest: Check dmabuf MMIO mappings filled from another domain
Date: Wed, 14 Oct 2026 23:16:07 +0200
Message-ID: <20261014211608.291608-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179200036595.15213.9864724554843977359.b4-review@b4>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 02:52:45PM -0300, Jason Gunthorpe wrote:
> > The mock page table has no memory type bits, so a mapping made with
> > IOMMU_MMIO cannot be told apart from one made with IOMMU_CACHE. Wrap the
> > mock's generic_pt map_range and unmap_range ops to record, per domain,
> > the pages mapped with IOMMU_MMIO, and add IOMMU_TEST_OP_MD_CHECK_MMIO to
> > check that a range is recorded. The check rejects ranges that wrap or
> > do not fit in unsigned long.
>
> I'm not keen on this, the special mock amd domain is just for mock
> usage, we should probably just add a mmio bit if we want to do this
> test.

Makes sense, thanks.  For v3 I have:

- AMDV1PT_FMT_MOCK_MMIO (bit 52) in amdv1.h under AMDV1_IOMMUFD_SELFTEST,
  set by amdv1pt_iommu_set_prot() for IOMMU_MMIO and kept by
  amdv1pt_attr_from_entry();

- pt_iommu_amdv1_mock_iova_is_mmio() in fmt/iommu_mock.c, a walk like
  iova_to_phys() that returns the bit, exported in GENERIC_PT_IOMMU for
  IOMMU_TEST_OP_MD_CHECK_MMIO to use.

The op wrappers and the xarray in mock_iommu_domain are gone.  Is the
extra export from iommu_mock.c OK with you, or would you rather the
selftest read the PTE some other way?

Patch 1 is unchanged; if it looks right to you, it could go in ahead of
the test.

Thanks,
  Andrea
