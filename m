Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA2E20D4F0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245703; cv=none; b=RTgwwMAtg1k2hTXd5OYHFtPxEO/lNcO0ic1AI+O6cuHEUVSrfsNhsorUe0PRY1RQnDRgtnAoFyGq1iRSHuXndhm7rfjQYXY/vk3NkdK3f7LGayPa+EyxvPiia/IbO3qbYmvo96rsHraY0c8JmxL6E1j1X1h+8tXJUo+TydxMSpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245703; c=relaxed/simple;
	bh=ce/DLlpHBRa0sOyR5fJVD2nnBUjY9hH50UmSGmi9zDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q2Qu4hJq7zrkUcxI1A146wN5nN7Zu7DyltbeL/O9qkn0qDH5EtyLUaMhXHY+CVfnYgqKTggh0yf+Llq7uCQio/+ZHxzyI5Uq46Qe/AFOOFDLy1fbVaRHyYzt1KgK+n3HObGf6QHcuCNUoJWUwRm8c9Lsd/OjR5UIpzBsczRjc6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iVCF8hbH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iVCF8hbH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE94D1AED;
	Mon, 31 Aug 2026 23:54:55 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0D243F85F;
	Mon, 31 Aug 2026 23:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788245699; bh=ce/DLlpHBRa0sOyR5fJVD2nnBUjY9hH50UmSGmi9zDo=;
	h=From:To:Cc:Subject:Date:From;
	b=iVCF8hbH09QwEoLLCy5nDqwnQnUTRnYnxct0R9KGT2fNm28OZNlKPL5y/ZVYyLarR
	 G97VWOjRF0iMyiyBQyL+rUoh+K5lW9l0oQHRuBhT9ntBgfqe+6OndnwbdmNSBBFsWo
	 ltBmtg/ObqlFYO+SYLvq4upKKiNCWbiCa+XhNDso=
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
Subject: [PATCH 0/2] arm64/mm: Standardize printing for pgtable entries
Date: Tue,  1 Sep 2026 12:24:52 +0530
Message-ID: <20260901065454.1906343-1-anshuman.khandual@arm.com>
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
print standardisation proposal which was earlier part of the D128 series.

https://lore.kernel.org/linux-mm/20260729122452.3797443-11-anshuman.khandual@arm.com/

This series applies on v7.3-rc1 but after the following.

https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

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

 arch/arm64/include/asm/pgtable.h | 47 +-----------------------------
 arch/arm64/mm/fault.c            | 20 +++++++++----
 arch/arm64/mm/mmu.c              | 49 ++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 51 deletions(-)

-- 
2.43.0

