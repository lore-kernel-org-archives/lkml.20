Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021822;
	b=N66ge2ml9jVd0x9U7TfiAtlAv3eXoDZ/UjbASbH1l+SLHbE/qjSGnX6027BTCZKYvLUB
	 p3Gha/y1qzljH2L/SRZuw4T4jO9nOL741QufZJ/Ek8BUUxIfIWf6QEHG8sQZDybSt+CCH
	 StSbc7dY9e8xEJw0P7Ae1N2j+UFdjXBLicVVdyEdap6F9l5bcVCMgM2bxAklOboKhHrZ0
	 qyVA9LpgY0quBmX2jsnJRDBC6yIx7n3i8hZbKTCOfIdVhQwNdOuRyLrO4ZmadMzztFyBK
	 4V/jPVMDuAlyBeWOt/vPg9EDR7v5fBgxj8hpn2YttOsLmHYEUIJHrc3odFZcFHfRHzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=5tMMGpxtoQZxq0cbe4boMn3nqRQBhfDysNVoo7AMAY8=;
	b=zJKLsH4x7iMzZxvMDJVyCHN+ABPGOJMONMmM2ZM9w+YaR1Ynt/YLc1GUNnAUujP12w4g
	 GlzdJk+hni3fc+Ttn+572ft4o6bUXROJfNvXZUcbeCr9twEPjv4nzCf752q7RCBLXG+Ku
	 YhOUymTv0pBR5Lsvg71r8KeVnvzPHiYwNs/4pr9gozv++h0McM3d+8X7GC+Ta/l3dvnVQ
	 l2UHJThRkCx43Opf/yhd/Yu7zf4gZoJKMgcuJWPHIcMBc3uTCwYVIaU0KKaMEbi4dl1It
	 /VyIGS5DkyHdY2qS1/uxb08leNv2KAZWD5VR7pmFxGGEtbv75KozC3I0jIyujFr/oww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=snu.ac.kr;
	spf=pass smtp.mailfrom=snu.ac.kr;
	dkim=pass header.d=snu.ac.kr header.i=@snu.ac.kr header.a=rsa-sha256 header.s=google header.b=t8AUsbBG;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B837606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B837606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=snu.ac.kr header.i=@snu.ac.kr header.a=rsa-sha256 header.s=google header.b=t8AUsbBG
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so3001109c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1793021817; x=1793626617; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5tMMGpxtoQZxq0cbe4boMn3nqRQBhfDysNVoo7AMAY8=;
        b=t8AUsbBGZl7j5ze9xZyez+XpgRZcYy1xDR2p4TSbQ91kJl7PLRjRrNP3+ch/7+ihjV
         u4Hyou2L3OvUhS1sw89zli36GmqqR9cx7EkfZDd4L0YEF0k/XqcYY7U8qDzXlyMwoHmn
         1nfqzZscpfXOI1byWWTMrFKq5OuK7qEVFT+C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021817; x=1793626617;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5tMMGpxtoQZxq0cbe4boMn3nqRQBhfDysNVoo7AMAY8=;
        b=VlXKQ0NASKnIdxpJ/dOS6DFwyyJPFX+jheFGBDOCvkd5pp+JZEwTrhIKYmWclrlFbo
         212qeUMm8gzIlpVNjFwNF6ZL+E95czZJI79ooFaAB90qM937NlHakD9IQvs//ozw0Bil
         hg9Yvf5OqbeYatD/nOGrccRAOT0du3pqzlE3F4qFntvFZK1AVN+Ygfq9WWREX5XAU3S9
         7P+W7lrUr540SsBso0VmukIqLvyonWS2154MBcajehpnWibpu0c/JnNTHxHKlTdKEf7U
         3f1r4YBPcQPtk3+dIGNr6Ovj/sDLYyA38o43On1VKybGAswoRJQHrsYPBpcLGLNonRBC
         w62g==
X-Forwarded-Encrypted: i=1; AKwUvBx+TaCPtrM0B6GyArF5cx57qQ9jhpGlgAm7heIubNQGUYzsxxR4CHAdRBRI8hNDhLQE6Jr0Gh2Vw6gtm/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWpHl1oD0yIWZshD6yknBLve4Si5LFlaCbifuU7rV4dOv7O4Bj
	dmRm2B4tby2FNH/nSTsZN+7kL2c5+qUY7RNBSw97PMqYCxC66HyO4pGpJCIFAOlFZSc=
X-Gm-Gg: AYBFou1E36oTQYTRgOJ0C3SzC/o5hyml8r7r4N225dfpJF7XI38r4Ub5/p4orJREFlS
	91nihqefbu7wfenLaWS8vPhliOHrmwGQtbGVVMYOFdvDB1Btkz9gMNix4tYh9hMo8i/+xmt+OUo
	V/zIQfv9qStBtP9O3eeV99e9fSr089JEBJ2R5FnI17Nr3RdSO6Z2ge1Ax3TGOEEXYWeTKxzBy2f
	17tKm/iEwJLa3Q5PSanqhmrvdimGkstj+fvPtDJjnkETdTVU4P3fIlkQrlBIqPG3J+sjPgXYb8k
	J27ntXT4gU8cdpNO+0eFR8TkSOLriLkwloo70TbIomLoEl55yVhxl7HtCYhPtVP2uve67KA1vL9
	Pv5DvAXwIzRairZTgVbepudtpu3RW0P/d5rj+3dtLvK+uNOmW7Xdy8Vk0xk+z4/xujjN7XRmFQ/
	rpVKAuHK2wGjA/q2KhG9zBt1uROJJAmfmOQ07Dm6sK0UsYg8dWRU4WnDV7oqYckrMPJDC+vO+u8
	Ta5XkrdJ5eR2SsUSm0X+hO3PUQsX7iWS6DtXm2wSjoQY1+FrA==
X-Received: by 2002:a05:7022:48:b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-199375eb24amr13097855c88.19.1793021816370;
        Mon, 26 Oct 2026 06:36:56 -0700 (PDT)
Received: from [172.19.0.2] ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm22432520c88.8.2026.10.26.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:36:55 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
Subject: [PATCH 0/2] iommu/io-pgtable-arm: fix missed dirty pages in
 read_and_clear_dirty()
Date: Mon, 26 Oct 2026 13:36:42 +0000
Message-Id: <20261026-iommu-arm-fix-missing-dirty-pages-v1-0-115b6b1cc0f5@snu.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpX32oC/x2NQQ6CQBAEv0Lm7CQsCqhfMR4WGdY+7EJm0GgIf
 3fioQ6VVLo3MlGI0bXaSOUNw1xcwqGixzOWJIzRnZq66YLDmHN+cdTMEz6cYYaSeISuX15iEuN
 j355iP4TzEC7kO4uKp/+P233ff+UKJCBzAAAA
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Shameer Kolothum <skolothumtho@nvidia.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Tian <kevin.tian@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Seongjun Hong <hsj0512@snu.ac.kr>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Fix missed dirty pages report in read_and_clear_dirty(), which is
caused by 1) unaligned iova walk address, and 2) missing iotlb invalidation.

First, align down the iova walk address with page size, noticing that
small dirty pages following large page block (e.g., 2M) because requested
iova start address can be in the middle of the page block.

Second, use io_pgtable_tlb_add_page() on visiting dirty ptes instead of
iommu_iotlb_gather_add_range(), which is called in iommu_dirty_bitmap_record()
and does not update gather->pgsize, so that arm_smmu_iotlb_sync() does not
invalidate the cleared pte from the iotlb.

Thanks,
Seongjun

Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
Seongjun Hong (2):
      iommu/io-pgtable-arm: align next walk address to large page size
      iommu/io-pgtable-arm: invalidate iotlb on dirty pte read_and_clear

 drivers/iommu/io-pgtable-arm.c | 15 ++++++++++++---
 include/linux/iommu.h          | 17 -----------------
 2 files changed, 12 insertions(+), 20 deletions(-)
---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261026-iommu-arm-fix-missing-dirty-pages-3754a7b18b19

Best regards,
-- 
Seongjun Hong

