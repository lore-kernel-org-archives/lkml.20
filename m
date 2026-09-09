Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36063299959
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926414; cv=none; b=lO7kKkTvBj/gp1Q5rf/WHNts/VRmIUKqc+NjZsbEWABbiFcBge/lntDR/DuHHM3UCGSKRIBsy1cZ311yU03X9Sf5bmNBCMu/MyEPqzCMTAFRi4QKmeYbvyiChkztLr3lKWduXrQj+5GP9x/xzoP9zy3pcBjqe/JbrNVTcf/G28g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926414; c=relaxed/simple;
	bh=fvXoG85F5/DIeDwKRFU1PyImr4ixDymncFRNXJ2Iea0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ra+SUFlA9x//ZJqIAW2lcDPZKof2vClEBhRKHIM9ADBZWp3+9UPU+eaYnmcYynjGW2fX5Uoo46gBrAOTLhZheWZ1N890ZoWFRLW7x/J+uOTdqG/hYJM9ttCw5h1IlF2wyhaUSpvf1hgVTlb+cBG7bwmrEZIYJX2fU+63wXU0rjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WcoNR6XE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WcoNR6XE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60AB21477;
	Tue,  8 Sep 2026 21:00:06 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5062F3F528;
	Tue,  8 Sep 2026 21:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788926410; bh=fvXoG85F5/DIeDwKRFU1PyImr4ixDymncFRNXJ2Iea0=;
	h=From:To:Cc:Subject:Date:From;
	b=WcoNR6XE6XGo9IOR2K17IuWcYUDsN/fgpriNQjIfIRuqLomuIVODjrYxQDFVakUH5
	 oL8YbK6IqNKbk9Op7A+xaFaBkbUUJx0SrdTm9Oe5c8PweXTDzxFRWfqgKIOkdZh0s8
	 mXW28fwzlzshyNwhPV5godjgmNztrI7jFZgCFSEI=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V2 0/2] arm64/mm: Standardize printing for pgtable entries
Date: Wed,  9 Sep 2026 09:30:03 +0530
Message-ID: <20260909040005.4148136-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize printing for pgtable entries using recently introduced generic
helper ptval_bytes_to_hex_str() in core MM which automatically enables 128
bits entries when added later.

But first move __check_safe_pte_update() outside <asm/pgtable.h> to avoid
a cyclic dependency while accessing these afore mentioned core MM helpers
defined in <linux/pgtable.h>. This replaces the original page table entry
print standardisation proposal which was part of the D128 series.

https://lore.kernel.org/linux-mm/20260729122452.3797443-11-anshuman.khandual@arm.com/

This series applies on v7.3-rc2 but after the following.

https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

Changes in V2:

- Moved __check_safe_pte_update() inside #ifdef CONFIG_DEBUG_VM
- Added empty stub for __check_safe_pte_update() when !CONFIG_DEBUG_VM
- Dropped IS_ENABLED(CONFIG_DEBUG_VM) from __check_safe_pte_update()
- Replaced pgtable level specific strings with pxd_str[] in show_pte()

Changes in V1:

https://lore.kernel.org/all/20260901065454.1906343-1-anshuman.khandual@arm.com/

Cc: David Hildenbrand (Arm) <david@kernel.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (2):
  arm64/mm: Move __check_safe_pte_update()
  arm64/mm: Standardize printing for pgtable entries

 arch/arm64/include/asm/pgtable.h | 49 ++++----------------------------
 arch/arm64/mm/fault.c            | 16 +++++++----
 arch/arm64/mm/mmu.c              | 48 +++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 49 deletions(-)

-- 
2.43.0

