Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004643A784A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427535; cv=none; b=XuScqV1XgCBmrWGeWNBK2U8J9at4ljYVnHg4cyMtGQxAy3XUX2kRj02/m/3p/1hScZoCQIzNKuXuc5Y5ghG5RFGlbjBUie9ssQBpGy7v8gVHihAInxJkAFsPpE2DFHyi4cP3T/ioOLU/suok/bVzvC1lVPksQykwuKkQvYfwMuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427535; c=relaxed/simple;
	bh=fVURs952Qxa+Ey6m7QLrY+2zX9hiMyr1lqWQc/XAV7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mbCsACz8oq316uzwwqt2VWf1Bvv5obwMS6l758FTSoZGmW18hnlRn1eq0ML3+9ztuXF8hcg2EDjxZowCW4mr4C5HcEfhNyEMDsHmQ3i8DRRb2YA41vMHH+pZyXcup8epDR8mRGE33pfmx6PlolqBrkQZ6MdK/77z9WazvH8XjrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7FFANDo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7FFANDo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so1155201f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788427531; x=1789032331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYwBU5ZHVueM1YfQFwjzrz4zbhTksf0+irRokmEvL88=;
        b=V7FFANDo+ajemdEu5jgHrIvrCunRl65c74Bq0Mian6mueLa+xtkoh+lmQbnf2phvMj
         js8gVd+8Xmw7eBKEb8xpz5cpogn/2T/iAS7DwlaAUWCakk8Migw+ABbwBQMJPpdMyqkJ
         75ZwxF0xDOQw5PUbC7XDFv+WQm7NrMPTxk5FXn7jH2c4OeGvzZQxudMeBX4Jr119oUAu
         eupci4v+ubhRaDyPmtY3kRjDGc5iZ1FoUBj2QWS9TOf/1BTpFiX7ArpEbHJgJJJa8cuu
         aIPKBGd+z0nHhKzTETI/aD2B5oODJ0wLPuj7oxajNaYmOFXkjE+rypieL1RreVMeJWgC
         4e0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427531; x=1789032331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYwBU5ZHVueM1YfQFwjzrz4zbhTksf0+irRokmEvL88=;
        b=EQvP9Qx8rg2q2HDX70mRXaSnz1DPNXPHuuuLmhHNaKeu8OhewDDa2kvGbJfcW7wHPK
         9/puHzghS5QAXJnhDxLT9w8pHxidhOpchsNeqP8c16uSaqbgDt3GwWdnRo9KfMh3GeQ4
         Tkd0JloPsD7alqH+asbHd1t9MyhwNqeiu8d0eKR3hW9UGxKSXRL3MM2hyYz7r5A/PHOI
         fl7fxFQbYLD7x5xro8qSnKZjckvy4bN1Gz2tdjWjRXGq0OGxIQo4704lMBc+EglHfpiH
         YoxnViOeVeKUTkoeO5bi68zU2OnXJlbNggSg6eh4k2LMzoNsBnNG+3D2g8ToUj6S5ksZ
         NTUw==
X-Forwarded-Encrypted: i=1; AKwUvBzxaaE1k0Uao2I7GmdjUNBmRuiEx4sl4t5pYjv1ehGC9IxI+c8EEj05MpUxyPFxO4lGEAIygP39nY0DmJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lGjkkdGa2xHc0EnqEAErO2WVNT2bybiEUvf0A2X9Td8EidQar1
	vwmy3dheQvhtyZ9tzAVmN3ZRWFbbMWnf/Gp66mcSasTLbV8oeWrytcaC
X-Gm-Gg: AYBFou1/oNCLyP0K3KEJMmzmyrKjevsR/uhOPn9qGxWrufw4Zt2WUgm710/d3aHV163
	yHE153+wwU6lGIKIHdQv8nM29blAGoH7ZHoR6k5hjrjoxtvoUjinaA3kfxxezhzIQCRrGTM2AEB
	zLGiHyKbD4Wq+CWEubRBn5krrfZPzdpYMKPzMCENaDbXFPFyvG9LiFmaCB46gQpyVM8VV1X2TxU
	+j5w20Q0A8+3al8mc8eIlB8wFbnOe5s1f1c84kR87jc5TjATQvd5GvdBIZcbKWrgtSRf0ryCpo2
	u0lF96hqdjIU7eR1k8Q5jcuFKI0UMPtrMIQrzSxzfjVAAZh9SdwvGPFh145H1c2DipddVsGK9Jr
	eIHvt6AMtId5p7lZwA8UZEeD3Ej8NbBVvAcsUOw58nZmH/W6dV7iw7DlnC5q4rnBH0esVU0X4Ct
	068lB8gZ3SXmsPtbBwZ9q2KPy/xpYJDGfk8mb1tSshHEovSn16Fkr0a/aRI4brQkGE6y5iwvgw4
	C41vOrpvMOudIHnLNuVoR1QiugAkdksgHvshTx1
X-Received: by 2002:a05:6000:25fb:b0:485:8354:d82d with SMTP id ffacd0b85a97d-4858354de3dmr4041188f8f.23.1788427530909;
        Thu, 03 Sep 2026 02:25:30 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:647f:bebe:643a:40cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed37c4sm10748511f8f.21.2026.09.03.02.25.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 02:25:30 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH] mm/huge_memory: fix various coding style warnings
Date: Thu,  3 Sep 2026 12:22:00 +0300
Message-ID: <20260903092200.88910-1-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve coding style issues flagged by checkpatch.pl Specifically:
- Add missing blank lines after variable declarations.
- Remove unnecessary braces {} for a single statement block.

No functional changes are introduced.

Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
---
 mm/huge_memory.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ced400f72d43..371ee8d38c45 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1104,6 +1104,7 @@ subsys_initcall(hugepage_init);
 static int __init setup_transparent_hugepage(char *str)
 {
 	int ret = 0;
+
 	if (!str)
 		goto out;
 	if (!strcmp(str, "always")) {
@@ -1510,6 +1511,7 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
 		struct folio *zero_folio)
 {
 	pmd_t entry;
+
 	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
 	entry = pmd_mkspecial(entry);
 	pgtable_trans_huge_deposit(mm, pmd, pgtable);
@@ -2613,6 +2615,7 @@ bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 
 		if (pmd_move_must_withdraw(new_ptl, old_ptl, vma)) {
 			pgtable_t pgtable;
+
 			pgtable = pgtable_trans_huge_withdraw(mm, old_pmd);
 			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
 		}
@@ -3901,9 +3904,8 @@ int folio_check_splittable(struct folio *folio, unsigned int new_order,
 	 * swapcache folio split. Only uniform split to order-0 can be used
 	 * here.
 	 */
-	if ((split_type == SPLIT_TYPE_NON_UNIFORM || new_order) && folio_test_swapcache(folio)) {
+	if ((split_type == SPLIT_TYPE_NON_UNIFORM || new_order) && folio_test_swapcache(folio))
 		return -EINVAL;
-	}
 
 	if (is_huge_zero_folio(folio))
 		return -EINVAL;
-- 
2.55.0

