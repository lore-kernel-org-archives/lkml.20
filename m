Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793853257;
	b=XtuCo2zcRku9lslfVpH5bibXu+jaV2SiJ602N9Wb2o91hxg7QpzX/NhpttYKTu92pxrm
	 N+TRCCo3EBqJLujipNOjlkfwkxCB004Sammocu6fGAFUeZZl5PGbYVZY/YFpbdfUKp21+
	 qSe87ggbClNejanEk1igsUhIoEk6yGGiVuVWvVP4arq8GotOMxWIhYX0x0nmVA9BSw+fB
	 ZhnIE5aK4XQoGxSJvBaPWvu32GeO1ruRK6Iue5B+S1ePbiPcMVOd7pFZKAjAHoAcqBCXx
	 Rp8oGaRDrN2WZ3VuJzAOJAM0B7wJtBeJ2ZN6Zb+uxgNS55T8Ef5XoBpi9MEWcAv4DvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793853257;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mlFkQzvpjx/x5yKaK7WI5PE0EjQPITGcI6vs8hOcC4I=;
	b=tejG4MzVnf/M3qarLkcjuevyzdWDOFmK9ySO8HIZ7ppgLw4QGjthQzCy6GWCtevALeAl
	 SpWvC4+RL1GhGZIVAdzGy/IhGn6yw0jDLJwyXow/uxQuXzum7pvnwsGFj1rGHmRUABbyc
	 jS08CqTTjYqTnpUAGihqnSdVrjW/3PSJ8XtmV3wBUrnA3u26RgVsuVW8pJrVm6c7U6/KO
	 8i8lCYFIFBC6/3Le4+6Pw9Gp9wR3WpqgemLn0PeR7q2Im4yM6IjYZzb2OMyYTk3vWnQTG
	 gDid9WsRb+wPZuRo+AwjFiNLrcakic88BIz/Nl9RactayDynFE7brStjYLpCe4LrpeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XPS377jC;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE31606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE31606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XPS377jC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B9D019F6;
	Wed,  4 Nov 2026 20:34:06 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DB5D3F673;
	Wed,  4 Nov 2026 20:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793853249; bh=IOlUh+PkfRf4TfbFSCgH4Rp3G8UWbreOgh8RH8GQHIM=;
	h=From:To:Cc:Subject:Date:From;
	b=XPS377jC3xLOwH01o3rlZo7Btd565/gec1lp9lxtjOyFBD8Y8uQ/5Z2EEZZz18kLy
	 qOCqZcLb7ayLGiCu/ZetSRNXVcBFlfp+kecgDgGLLYk8S7P+6Jns8Z27oeGGS8ojOM
	 X+t4JMtP1Op6eqRUy1MUVcJv1mnVbRCPY5j//MLQ=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V4 0/4] arm64/mm: Convert pgtable READ_ONCE() as pxdp_get()
Date: Thu,  5 Nov 2026 10:03:59 +0530
Message-ID: <20261105043403.3326445-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
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

Route READ_ONCE() accesses on pgtable entries via level specific generic MM
pxdp_get() helpers which platforms could then override when required. These
accessors on arm64, will help in ensuring page table accesses are performed
in an atomic manner while reading 128 bit page table entries later. But for
now they just default to READ_ONCE(), thus preserving existing behaviour on
current D64 translation a well.

This is similar to generic MM where all atomic accesses have already been
converted from READ_ONCE() into pgtable level specific accessors.

These are preparatory patches for D128 enablement, although standing their
own for D64 translation as well. These patches are split from earlier D128
V1 series. There are no functional changes here, and besides mm kselftests
do not show any regression.

https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/

This series applies on v7.4-rc1 and have been hosted below for reference.

git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_pxdp_get_v4)

Changes in V4:

- Dropped all pxdp_get() platform overrides per Catalin
- Moved pmdp_test_and_clear_young() and [pud|p4d]_offset[_phys]()
  helpers inside arch/arm64/mm/mmu.c to avoid build problems
- Updated all commit messages as required

Changes in V3:

https://lore.kernel.org/all/20260924062214.1635078-1-anshuman.khandual@arm.com/

- Added overrides for pxdp_get() and replaced remaining READ_ONCE()
- Updated all commit messages as required
- Dropped previous tags

Changes in V2:

https://lore.kernel.org/all/20260922061638.3967467-1-anshuman.khandual@arm.com/

- Rebased on v7.3-rc4 along with all latest dependencies
- Updated commit messages per Ryan
- Added tags from Ryan

Changes in V1:

https://lore.kernel.org/all/20260903060657.2717457-1-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Linu Cherian <linu.cherian@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (4):
  arm64/mm: Use pmdp_get() for PMD accesses
  arm64/mm: Use pudp_get() for PUD accesses
  arm64/mm: Use p4dp_get() for P4D accesses
  arm64/mm: Use pgdp_get() for PGD accesses

 arch/arm64/include/asm/pgtable.h | 38 +++----------
 arch/arm64/mm/fault.c            |  8 +--
 arch/arm64/mm/fixmap.c           |  6 +-
 arch/arm64/mm/hugetlbpage.c      | 10 ++--
 arch/arm64/mm/kasan_init.c       | 18 +++---
 arch/arm64/mm/mmu.c              | 97 ++++++++++++++++++++++----------
 arch/arm64/mm/pageattr.c         |  8 +--
 arch/arm64/mm/trans_pgd.c        | 14 ++---
 8 files changed, 108 insertions(+), 91 deletions(-)

-- 
2.43.0

