Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F4137A826
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534182; cv=none; b=l9QlJzkuOhiclzpJGNtLhkC58TkmfsjZVOE6vYqj9gHA3ffin9PxBGPN2be03u81FyA9lSRoV1FP2EbY36LUjh81Jo/SmzBi7YUF2sHUIG1Ba/TI353eIWCSIDZWE0FgNl4ZMYM1tiXGg5mq8bSqJz/3s4mVrF6RzgfuscrbGwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534182; c=relaxed/simple;
	bh=jycAePJzGoWD7iuHXNX/pHzEJqNW9LDecK84UF0GsGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bqRtoc/X9Ro6G8Qm3n64o8WNYHnEXSxQc/haLspIl8y0wTbrSXTFR2yR1OaOE1DBw1toMKSPxWoeq77lPlf5ROauZNoGP1EBlyCCQ9ifElvIKS/F1cZ4y2bDH6sfOLxdXtOZrqV37Nu6YZh80sfGHxRgNGiCXjdzez9osriXYKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N7Tenfye; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N7Tenfye"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83D271516;
	Tue, 15 Sep 2026 21:49:34 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60B6F3F86F;
	Tue, 15 Sep 2026 21:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789534178; bh=jycAePJzGoWD7iuHXNX/pHzEJqNW9LDecK84UF0GsGc=;
	h=From:To:Cc:Subject:Date:From;
	b=N7Tenfyeb/B92byMKzxo1+YO/EFOWyugBUnMdXx1oEjuQ9cSSD5iIVZ474nePzmoX
	 CwMZwNXxrUMYvcukYA/lHLlG7CkOn+z+ffmh+TMx9ZYdbPhPCxyzmm5AWUl9od8SiA
	 sKMCxSgd0qLhr75AsY9BQ8BLyfVOHmbWuLoxwixk=
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
Subject: [PATCH V3 0/2] arm64/mm: Standardize printing for pgtable entries
Date: Wed, 16 Sep 2026 10:19:31 +0530
Message-ID: <20260916044933.2689426-1-anshuman.khandual@arm.com>
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

This series applies on v7.3-rc3 but after the following.

https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

Changes in V3:

- Added tags from David
- Added comments in section closure for CONFIG_DEBUG_VM block

Changes in V2:

https://lore.kernel.org/all/20260909040005.4148136-1-anshuman.khandual@arm.com/

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

