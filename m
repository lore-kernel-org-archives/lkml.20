Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899203;
	b=LW+3Cxcw802NQks2W+o1vW19t65rNX8STkzSeM+qXB0igqPadGjfKgAogoUyqSME3tRS
	 hP01dUD3r3u1nAb4RFYQZy8wrq1pdIwdO9ace1DjpQAoj6UbAWfLUC0weF9gg0AhXWM/i
	 zk9OHMgthIpv1z+MnNekUzJnsVPxwK1JkLYfiMnmIV5WKWAQZPJbLdDkwRlEB0w4u7FB1
	 yEPhZER8C9tN4US8YVcywwjmEqVhFk02dPJAyZilOtNDspVMGrqZIrvZ4vho4E4DY9MK4
	 SYCQ3KWEMBtTTLlSlsb5XxhVRSdO6AsKT0NxqaHiSg5sQf2FqGQEg1BOQ4kmoOnM+3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899203;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fwD0hDfcc92kFulqgZu2fazrryJJ+jqrlv2x46MWAcY=;
	b=VKVKGBOhjsHSRRO8yOSvjnUCSg7zRFbyvD6EF9S6o8KBvhUqPM+MR1t7rQO1FMJllpN3
	 ZTMlnTQLvlCfX17cbblNwEeqAmptkN2WFVXJFvu88LacLj403ontJ6qO6oouhKSOYWVdc
	 4GIOeulb+6u9lykHQHBdYeox8S8yat7RfruowMpvB7SGY9eu8Qvhd0I3rPYgH20lKuldn
	 2IpEXI4ZTre5r6O8Vfw7WxRagKyE6vs4L4AMqYxG/vpQ9MKWV6gkxJC1dS9taG6sJJ+pR
	 C1Gm/0ZcSZ0Jvg0cPApHbcg3t3gwvfRPNMY8YmuaumpZ1dHJoHtviAHUYW5KELDFXTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YJZbGCTi;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A5D606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A5D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YJZbGCTi
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0547A1476;
	Mon, 16 Nov 2026 23:06:39 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BC7B3F763;
	Mon, 16 Nov 2026 23:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899201; bh=yC9GXzENjJXOH1CTrLMyqmXybb56e7XRWoU2chaI4Ps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YJZbGCTiaza4+J6dPT6sY5RGknZNH3VGE6ywRMul+CMVUbZZ4eEq2GKeZa+UFBSbB
	 o/qcSOJeyt86zlE1xaHPJF+y1DvtwocqSnPsKBVFiFU8rO3EZmkAmOJsemMGEADWXi
	 xZLZDQoeueKVMlpUTcASr7kg9SSrSe6zPD3nFNOg=
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
	linux-mm@kvack.org
Subject: [PATCH V3 05/14] arm64/mm: Override read-write accessors for vm_page_prot
Date: Tue, 17 Nov 2026 12:36:04 +0530
Message-ID: <20261117070613.1183243-6-anshuman.khandual@arm.com>
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

Override pgprot_[read|write]() accessors using ptval_[get|set]() providing
required single copy atomic operation for vma->vm_page_prot.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V3:

- Add const pgprot_t * in pgprot_read()

 arch/arm64/include/asm/pgtable.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3a50d35fd017..737e1e42f1ec0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -122,6 +122,18 @@ static inline pgd_t pgdp_get(const pgd_t *pgdp)
 	return ptval_get(*pgdp);
 }
 
+#define pgprot_read pgprot_read
+static inline pgprot_t pgprot_read(const pgprot_t *prot)
+{
+	return ptval_get(*prot);
+}
+
+#define pgprot_write pgprot_write
+static inline void pgprot_write(pgprot_t *prot, pgprot_t val)
+{
+	ptval_set(*prot, val);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 
-- 
2.43.0

