Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423574;
	b=rWHGxACJsD6BLWlMeTaYXX5oKuYd6vJUPWSCeadcVtvClcw+N5kzEP3Et4BtajqXDff2
	 uS937lXHeHbzYOgGJDg/fwMYPnFKIR2mcVNkUeaVDi0l51sD2d5WSyiLY956f+qA8LIra
	 HuOnpXztwgdMMcOT1yeCO7oKhgIJEiJ51RXaymlaT4X/hQ0Plmai4NDAKy7HN9YXUOJR4
	 lpHFQE3VVX7JJJ2ki6kL1h3lUu63OeCxnSdMN+ZRLSagZJlfaL/UNPN2tdZdY5BhbaFD8
	 lkXNiGO/B1dLi6o447hhx2N5ZjL/l5424ECeYem4xgagy5XROPAxAO4RD0kPHD6Na1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vmcUu24AcgALNJbfUMDmq5oQkKkP7zlxfkHJgkON/XE=;
	b=rQ6JV03+zcv3F2PCVvjOksTQTbQAvrJczlTmg9HBTCteP0pa8RUGvl4n/SDLW5UbBV3K
	 QRGFZlHokS+iskPEmroCpcGYRnNq2XVnP24i12KPToqvGJ73aKiZPJDwO3gkcjRwOLUk0
	 8DsDf+Qd0Jkp665DOe8yBRcWxuimhjyvfvQID9lmAkHhsVutjcTCDlo7k4zKDzjNxXHO0
	 X9D9ZU78zoB1sUuXgAfWsJ0be69F9qR3VFNoaKw4JRuq4hIzNtHfJDi6tIgOCTqOyijnn
	 fBOEi7xHNPQ+JG5LpL5wQ9JfUPa+YhwXBqprTAxrC71UrwQMF2ombwJXcpwA+8mXJhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktuBQ7QU;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11C9606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F11C9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktuBQ7QU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so32503765e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423572; x=1795028372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmcUu24AcgALNJbfUMDmq5oQkKkP7zlxfkHJgkON/XE=;
        b=ktuBQ7QUWWahbDoFw7NOsY+5l4vBsnIvY5MwLmAcD2bGMzNwBzVEuFo11DL8T3nZXb
         Ae55H6AWLTlJdMUel0Xn0arfVmgrJ9UiWSwu51e0xm087vH7Y0oDmr03V1Kj+veKrmY6
         KEd8izWR80hPubWkTzL0/7XaJjcI55CORSpShBrixiX4OHgyd0LsUMT1uDJceIh63aZ5
         TRs2CfAtc6iGu7RZCx978vwPGLcxgVDUl049sNNR7rAy4K0hde8yrIQB7ts9FJFJ+USf
         XESk7LpJs/FwauPcUOYDMF2C20HXitFNZkIE/fFVPGyfWsVNIrfgYWkewZpClKnxh5Wi
         N0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423572; x=1795028372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmcUu24AcgALNJbfUMDmq5oQkKkP7zlxfkHJgkON/XE=;
        b=DiDqmCqZY4aL1qbdb3gLPWZPXSz4Er3mm4bX+HAzc6U8J3NgdJcE7ShKOdnDSlatTw
         9CukylRbPxwiMnID80DelcqzDKIAu2L2WgztpVNF4ZtrHXygUt2agyp5mm84ipnyGMZd
         KWq7E0Isr38+O4BEMd5WV6SnznJ7iQ4pax9SDb10wlKvZ/LbGGbJ6ujlo3bCNKcb6+gJ
         MSLHbPsPpyFwcoIJYSiRM+SXYVwaZFNI5kKmzf9Ut3wZ0+Vr2Qw/XiOuPlRqole577lp
         R+MNZK1UNWRGsmKWw+3pFv8Gj1cckx3CKW91gH6IZylYJtibRZwZDX9Q6dhmd70jQ/Jh
         V0sQ==
X-Forwarded-Encrypted: i=1; AL+hErG4B6WzBOegVMHbn2PkaJ9N0DQWS1E101Upt4SAbfFQImq950pGU97gikqZtIyViwXTSbflKZN3abwanMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aFhy08gAxzlT4rjZbaX/hYDvBlErCuEe1YT4+FOUNYhvrgYZF
	M3XluAtIPBECydMivGyGX3fT3kf1+ttV4GNWEjEPcZuDU7QZmgQbOKtU
X-Gm-Gg: AYBFou2JSol9j5S8u7podnbLv2cQZDVC0My7oXckhvKXigms9w18WOr9rnKJrWd+D7y
	ePomWQBdyBbqMMsNEPlrHJTx7LLKXyo55SyUv00/ZIexI4W0sifemIHUfZbIb+d45aW1qEVpjE+
	j+uB4hD/X5ygWD0KNeGDbODhcI+jQfW74vvg/3q9kgroJ88Vslu9zxfBKn4JHAFlDvi0lesOMVP
	hp7p3Gujx4b1YDS/BCxqCd2Q/mAuYfbu+6CcPR3KGvzZoZYtaNXPPN9HMqa+VW208u221+OqWph
	swhuwDnh/UecdHq/Sd7k+OFOsrGi9R+izTvEbABbXob9l362MDX0F94j2MtrZRafp8hpkx/zYO2
	ZNnHLLzsd8ty5zWwfr2cJ2DXl57n4b+ifyQ3UH8mLokA+UIESEargTt51T6Anla82Ou3ENXKGuq
	1C34QP/dCzhMT2TwwbpYahpJO8dIM5RJm1tQ6mvKpYVaZSu/VyCnAjOXRO+POG8BwXLzr19mPBy
	FXlNTtbgU7GFIxec74bzsjo2HO+k8ZVKJ3FuBNHDq7AZvyQ8quJsLSg48lVd5qHGT69P3jBYYso
	hsem069khQ2oskcQ/Ex/fQRxVZOPXLZ5B3I2hJQkagkSBq96P3ponhppDEqqemzGMc6zTmWMLzf
	vTUOvsoivOYP+CuC4I8/6jHq/G9YmVaKNZfMbPjiLWy54hFZOJ3phvKqCb3egMVfIDA==
X-Received: by 2002:a05:600c:c83:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ba0936f386mr62798215e9.24.1794423572202;
        Wed, 11 Nov 2026 10:59:32 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e265a0csm9161435e9.9.2026.11.11.10.59.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:59:31 -0800 (PST)
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
Subject: [PATCH 0/3] iommupt: Unmap and return the PFNs in one walk
Date: Wed, 11 Nov 2026 18:59:28 +0000
Message-ID: <20261111185931.94882-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
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

When iommufd unmaps an area, it must unpin the user pages, but it keeps
no list of their PFNs. It reads each one back from the IOMMU domain
with iommu_iova_to_phys(), one CPU page at a time, then walks the page
table again in iommu_unmap(). With 4 KiB pages, a 1 GiB IOPTE costs
262144 lookups before the unmap starts.

This series lets the iommupt unmap walk report the physical range of
each IOPTE as it removes it, so iommufd unmaps and collects the PFNs
in one walk. The walk also steps over holes, where iommu_unmap() stops
at the first one.

Patch 1 adds iommu_unmap_sparse(), patch 2 uses it in
iopt_area_unpin_domain(), and patch 3 adds a selftest for the areas
that keep the per-page read-back.

An earlier series [1] proposed iova_to_phys_length() so that iommufd
can read the PFNs back one IOPTE at a time instead of one page at a
time. The unmap is still a second walk there. This series collects
the PFNs in the unmap walk itself.

The series applies to iommu/next. I wrote parts of the code and the
changelogs with Kiro, an AI coding assistant using Claude models, and
used it to run the tests. I reviewed and tested all of it.

[1] https://lore.kernel.org/linux-iommu/20260603151804.1963871-1-guanghuifeng@linux.alibaba.com/

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>

Fred Griffoul (3):
  iommupt: Add iommu_unmap_sparse()
  iommufd: Use iommu_unmap_sparse() to unpin domain pages
  iommufd/selftest: Unmap areas that start inside a CPU page

 drivers/iommu/generic_pt/iommu_pt.h       |  61 ++++++++-
 drivers/iommu/generic_pt/kunit_iommu_pt.h | 144 ++++++++++++++++++++++
 drivers/iommu/iommu-debug-pagealloc.c     |  13 ++
 drivers/iommu/iommu-priv.h                |  24 ++++
 drivers/iommu/iommu.c                     |  76 ++++++++++++
 drivers/iommu/iommufd/pages.c             |  98 ++++++++++++++-
 include/linux/generic_pt/iommu.h          |  24 ++++
 include/linux/iommu.h                     |  22 ++++
 tools/testing/selftests/iommu/iommufd.c   |  30 +++++
 9 files changed, 486 insertions(+), 6 deletions(-)


base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
-- 
2.47.3

