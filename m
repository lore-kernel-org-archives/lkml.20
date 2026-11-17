Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899229;
	b=QmAoZl6EyaK4TL4kPcqw09cOYPxuUSlImtOGSu0gKsQ9hDavQn/22ygT1l+L/Ke9r9rY
	 plK4U/iHg9z46jgdaO/nvt8pydxzmpAKoeSD5+1v2A+BEJgaq3+X9lp+3/nz43nEX70Ls
	 1GqT7COMbsIQLBDQhVPt4T9sQe+Me0FGUeU6CmUr0T4HV0iNm365qKV6zZALkrkuRU9ae
	 JhzShVnZR4MX89e4z/c8NGE63E5N8AiFTB7fkkVi25z2OwUcF1gsPQUhHoiLzUuT4ybG/
	 JF5QQ9+IDoaqi8leAPxKLddaHO6PYgRJTllR64+3iPUmPc9qkRJM29qzxqSwPTtU0Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899229;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=In5XHn8tUjmrwGSxql+VVDMlJ1U6WaHJPkyrd9YfyY8=;
	b=r6EWMSzl+e4uwmrvxXZT6MNv6RM2Q+3koWFTpkZB3KYIB8uCzPNxJhkbphkqSaVXnE49
	 y5kLEd3fSLPUyu9pCN+mNqft3xULO5M8CTWr3dVYbj0rnlPSFaKWPt75CQ0VaiQsboShU
	 CZz2dtgmX0YidqQzD8lj7YDYHjjGVwIQUksYmvUzJJrqpxFjBRvmvkExiUiWHf1U+bO7Z
	 T1i/oniEv96PrCBwGMwJiQnD/1b8EJ/dtrovVa4EvMfMZDXt6z70O8DZbWwmP3m56K7/l
	 pCgp8++Wskhn1tFsJNhtWFcZwcob5ALDHVDlSB7mjUr6p8xJ6OjXzyE7UQZO9aEPNBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RpKDwRah;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDBB606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDDBB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RpKDwRah
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E27B1688;
	Mon, 16 Nov 2026 23:07:05 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D40553F882;
	Mon, 16 Nov 2026 23:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899228; bh=rSvlSIXr+wDtZe2exxPGHZkrukV+OXQGNowh+BkvXcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RpKDwRahiZsvs5NYiVXBle9NMAptxzASgBjrEsOtbv2j12uijayfCF8G5LzpedR6X
	 hwxBix7JkHGWE3238+qyf56bAhlEGeiko/kQ4tw6tnrP1PKUvJptKHjfjgWmc8S52H
	 2qj6Vz1wFEM15r2AnKiOZOlMBY5d5KgPcdly8+B8=
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
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	kasan-dev@googlegroups.com
Subject: [PATCH V3 12/14] arm64/mm: Relax KASAN shadow alignment for FEAT_D128
Date: Tue, 17 Nov 2026 12:36:11 +0530
Message-ID: <20261117070613.1183243-13-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
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

D128 reduces the number of descriptors in each translation table, causing
some VA size and page granule combinations that use two page table levels
with D64 to now require three levels.

For three-level page tables, the PUD level is folded while the PMD level
remains a real translation level. Hence, PUD_SIZE represents a root-level
span. With D128, some configurations have a KASAN shadow region smaller
than this span, making it impossible for both KASAN shadow boundaries to
satisfy the existing PUD_SIZE alignment requirement.

The KASAN initialization code on arm64 already supports shadow boundaries
which are not root-level aligned, by installing or cloning the next-level
table as required.

Similarly for three level D128 page tables, relax SHADOW_ALIGN to PMD_SIZE,
which corresponds to the first non-folded level below the root level. Keep
the existing alignment requirements unchanged for all other configurations.

Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/kasan_init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index f61f5bc09467c..e12abea6ad156 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -178,7 +178,9 @@ static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
 	} while (pgdp++, addr = next, addr != end);
 }
 
-#if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS > 4
+#if defined(CONFIG_ARM64_D128) && CONFIG_PGTABLE_LEVELS == 3
+#define SHADOW_ALIGN	PMD_SIZE
+#elif defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS > 4
 #define SHADOW_ALIGN	P4D_SIZE
 #else
 #define SHADOW_ALIGN	PUD_SIZE
-- 
2.43.0

