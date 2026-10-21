Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563764;
	b=qZWbPdEuEJeqWRqivFq4OcQf2+wfpylag6P7VQHGWT6qt7oWowaEUEDW9TVhdfSCALXP
	 cGzt0yRKnhpb3KjcMuRKmxzk1SslzpQVIoNmJNGnjn41mnZjKCV6it5am21otF/a5gqmV
	 40XJ1kgQ9L1VWOpuoOnE+1vbdtCPcTFhlwoPHhsmNueYU+wZm/mMuIgXERCpZFY755FTd
	 xd9lILy+YR0UofG61DgmS6upVian5O/3+wg/nCz4eZoApKwt5Ba1FMtVF7fkkkLlyXcCt
	 JOaFCy7Wpc4Y7A/c9Li4xC3/PfgVJy/4gmTx+x9K4wGiwsOYNY5V3ba2Gz6Q7dpivlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563764;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=AsQZnRDvC0D3gP3oQhOuDZhnSM3XMIz82czrPE7tuD4=;
	b=HyGRzgd40HNnQrhP6fzHATHaBi1rVAYzyC089kipiO892RDmeC0og7R70uNfTPBWbBdk
	 QTkGlbO2f5+HJK5ERcyR2kxMdot7XlwlUMLk/vuPWZA4VMKcPfX2yga2eq7fo0iiOmKu0
	 NlLOpaOhznFJBzQwm8vwUUBXweS91hcAT0lRtqIl8pH/Pdj+Kh2gTlO6Z+LRiUmaflgC1
	 GIalpXj1D4+o7/jN96TfTAAVNxbhRsmkmQ0Nq0RV/bAKIn1fUJnMjo3tZKFnODYwwZxuu
	 C4VIlSKEZpQ+oDZHuVQ0VC/MqiRxxjz0gE9g0OYPqCRyRv2gAd+5c0k6e524Qotvotw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=B4Gt3o48;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE6A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE6A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=B4Gt3o48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1792563701;
	bh=AsQZnRDvC0D3gP3oQhOuDZhnSM3XMIz82czrPE7tuD4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=B4Gt3o48CKZcdUJM7kKyfvejkS7Od6tMdMud4VBGnIpcWwLkFFYnZwMkKuCHQDNe9
	 EoASmRmAbdE2jN6D4rzQz9ByZH/09MdrHmLifYDPOIPAG2t8VFvq07aIgUXpU0EL9u
	 5Mnb2ojhNhjDuba61y7Fl3A/VVQowsG26fW8x9Ag=
X-QQ-mid: zesmtpip2t1792563681t96cc3f72
X-QQ-Originating-IP: SGYOyl1bUWSgKy+cMFiCAF5bJZnqzi5KC2bcPI92i/4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Oct 2026 14:21:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6018804124745603915
EX-QQ-RecipientCnt: 10
From: Wentao Guan <guanwentao@uniontech.com>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	david@kernel.org,
	muchun.song@linux.dev,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [RFC PATCH] LoongArch: mm: avoid backing vmemmap beyond max_pfn
Date: Wed, 21 Oct 2026 14:21:15 +0800
Message-Id: <20261021062115.116922-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.39.5
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MjZkc9TfnG+XR3/U2Vek5hNImTnjycVoFb0OssoGpvRmDpaVdTaHlEYh
	I8xIb1fcBjURPhyXLJ/lUNrVI+jmJ/0Pm03Ye28Fl+h1WUkLZYSWUjdHQETqqmfDhs67h+b
	uH7ORoE9K0YBoMxSGEAxRbZoeKyDz98WE3PmkrJRukX53rRZPGxMZg9rvWIZheRd3Iu6DiG
	YN7pfIWW/BAaUPHjvK+JzmbKhCKEmGVyXoOn0GIJnz2QkhXMmqjcjg1AicDBDPAXv61ZYI5
	8rq6SjP9+28IoOX2EuGY/lihMXP+scGGU0gFIRKf8uQEBEu2EvzJCaLCmheOf15n6c6qy+/
	rDjitIYzvXBCVgMH5T25bJSXlY0l2O4ad4kL+yeOsWZZLqxbCUT3xXMuWXCB9qclPiGNwgC
	+UXBLlU2ziFZX2r5K1c52P7rE02GGahzcMqLSAtG7iKTvo1ApqodvtLy1zTN8XWOx5j5V2H
	5b8mSgNHZk9yeFUOCHLLHz048p7kvsJkndddaOmiNt3pvnnqM7+fRVoR5GzrXOGvSNM3/4w
	klkcAp1jlXYSmbEX2y7yaTPUoPxQKwrdyXFdWtHSyQ6PAP0Ml6vhTS6IZQ2R2CfrgumkQJc
	5OfXTdvbQnLUTVxdi2Db42yn3QodxwLzt+4YyZHwU5TJTdavc8ieHbJbhBfmZmHgy5W6Zdy
	hDtHPkSI5GoZ6Yxtpu3QqERonqdRyrn+bIebizcmGvRZ+s8/WwYmcqkSIoXVbwje2L7gdn+
	+ZHA/f0OmJLGyYEcgR8m36vlX0T76CTRZ0TxH4QS/xSvFNtdvLds4ua1Z8wiss5c7MpqnaZ
	2RfxsS16AVPd6VgLUihsAj87+TPX8F1Cdqfk1EP6tvEFEVjOGoxGAueXHiKiC5ZfrmrEURH
	ttk9bPWnB657lkYplt83LLrKh1A+2C76etEFvK4zzLV3F7iFOl69vx3ldruBi3TCrw1jo28
	IsRD6mpjJ76SqUOy4H/eYzNeax/QsWr+PKPyLzeMnlEJqYcM5zqGk85dFAYB+Vtev+BfIjx
	fSvL2RTT0Pz+E8e3MMkowRY+A0NHSBP+7I6aq9scrU8tPYZxUL
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

A PMD maps 32MiB of vmemmap on LoongArch with 16KiB base pages, while a
512MiB section only needs 2MiB.  vmemmap_populate() is called for each
section and vmemmap_populate_hugepages() installs a PMD mapping for the
whole PMD, so the last PMD also backs struct pages for PFNs beyond
max_pfn.

On a 34GiB system 160MiB of vmemmap is mapped although 136MiB is
needed.  The extra 24MiB describes PFNs that do not exist.

Other architectures handle this differently.  On x86, arm64 with 4KiB
pages, and riscv, the PMD covers exactly one section's vmemmap, so the
huge page path never maps beyond the populated range; x86 tracks
partially used PMDs with PAGE_UNUSED for memory hotremove.  arm64 uses
base pages for 16KiB and 64KiB kernels.  s390 deliberately keeps using
1MiB frames even for partially used PMDs because vmemmap_populate() is
called per section and falling back would add page tables.  powerpc
radix falls back to base pages only when the altmap cannot back a full
PMD or the allocation fails, and powerpc hash maps the vmemmap with the
linear mapping page size, which can exceed a section as well.

With 16KiB pages the LoongArch PMD is 16 times the vmemmap of one
section.  Moving the whole vmemmap to base pages, as arm64 does for
16KiB and 64KiB, would also remove the tail, but it would give up PMD
mappings for the 128MiB that is fully populated.  Use base pages only
for the PMD that extends beyond pfn_to_page(max_pfn) and keep huge
mappings for the rest.

The altmap case is left alone because max_pfn does not describe it.

Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 arch/loongarch/mm/init.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 4b46c5d30708d..bb7a17bdb0e51 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -146,6 +146,11 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 #if CONFIG_PGTABLE_LEVELS == 2
 	return vmemmap_populate_basepages(start, end, node, NULL);
 #else
+	unsigned long vmemmap_end = (unsigned long)pfn_to_page(max_pfn);
+
+	if (!altmap && (start & PMD_MASK) + PMD_SIZE > vmemmap_end)
+		return vmemmap_populate_basepages(start, end, node, NULL);
+
 	return vmemmap_populate_hugepages(start, end, node, NULL);
 #endif
 }
-- 
2.39.5

