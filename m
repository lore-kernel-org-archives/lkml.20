Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61693AE6FD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942253; cv=none; b=WsuoUwVz5Vmw7VzPFNaEX/BjG1bk50rNn1TZ+2TINrJMyXOcOtLA5OuVYXVz3CK8JsYhgdiN8aX0dYYZBymtDIeaV0VmSIwtsNsGoJFvaYSCrupqd3FUYrueH3sBQloOA6tgyS+YZYeThxL4PEBz16D7IjEyXdvJVRW9xRXyi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942253; c=relaxed/simple;
	bh=aNdGxo5FUbZ/b3hdJ54tgwnPkKj2RIxatu8EIqBxmec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uHVM18Avf+m0MB+bUSMdqmJZXmgxL3dJgMfvkeq9SdpXNwjAU6locc43mBwqdDUg1Rm5AllwskshZbguBFXjlx177+4LXMtysn5dJ2FFi7Ondxg36gXh9Q7hr/pkAeCPP8eboEsivomaok6J/cS6pf0UM8dlhB7xoKF713XzUIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUMW65Hb; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUMW65Hb"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-85339ed040aso1257315b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942251; x=1788547051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYGUS2yq4w52aMYmHXMMhpQA8K1oYL7onWQGdlT1JgM=;
        b=JUMW65HbDG1vrqIJpaw2S8tkCbz5qkubgXnW2Ct9qdo7e9JYFVTba4E+sWzXFQFHYz
         jNbZd5pCcU89JCAEv+5WZZgQ1HSG5M2Sl+gTvnIKVjRqwxjUjiXTpid8IqYUpeT9GYEt
         jI8xYuFuBaC3GSmMQ5pfTf2dsWlytKyzbEv0B9PAPCRWrfU/s4n0uI/Zp+ykokNyZgRZ
         2IKwObTnRHgY8YR34odt/SLumY+xpQ+Nslp06WsaeFafAqERUJeosqerRxpp3UuOA8VB
         n0+eNTRnbK5NiCQDtAgtqztetuHm4qpM3PUJJ1XwLT/hUGfaqNiEFWzX7GPEqLabDTWK
         Bq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942251; x=1788547051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYGUS2yq4w52aMYmHXMMhpQA8K1oYL7onWQGdlT1JgM=;
        b=L4TEmnFwhw78yatbyUedd0SlE0SqQgsQvt2BbqAZJE3ALe/m7I9QQWjUCSce+uymrX
         bbv5TOuFYVCahelak0lQLgC2sXpixl2r9g4W8mj5GjT2Pygmf6SjmvA9xDc4Ue6rUKdu
         P4TLrZAl7nW9MBTLiCoNYj/Qpj4CTpl1JvzF9LPvo2dZfYUh871/WiQyrGVfTHRn2NEg
         wjvQAPbWan/PeolnDufwuuwhfz24HUJrai0yY5IvYgB53axu8bFSxH9J774ljwwUZlgL
         oUpS2W6Uxg83DyE3QeUtC9phIu9fcnuJkAtGT2DQDlmWYhdW580Il9uUuNPJLxXh5ijH
         SHIg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/j9MLWgABON2d0aMyya/GrZgOSN9E/9ksz5pB2K+8mEq6H9a5CrngatrdG8q6fgYh3ZkPm2tQo5g0Pa4=@vger.kernel.org
X-Gm-Message-State: AFuF++lpPbnkYnGWrIE+vftRyxyafMA2uwu89KHRr+7A4LinpLwrR/qt
	ahHI5/wl/7Vk7AlCgWwM0jRpP4meQvCqDn1pHxxZAYMlhUkLKM9tdZXI
X-Gm-Gg: AR+sD11tlsrEtasfjWOBpjcbO53IhU9DPESjFAhE70sjQr7zFO0/8PunKz1taF8Na8z
	hxap1n/TU3fCnzRtbjj7K0OyTZUB7csgYW8l+0A/z4coHCqzhn3BeJgK4gpxmylj3HHgK4PbnPI
	TDPOGI362wmxuPDiLVecmAIjsarteftIumoBN7X+6XVzDhMRteso3Tl6Mfbl9MdzraS8QtLcLK1
	0m88sv0mnnL05wwgTeXShPa9aoRaVa7PZdXoBbiRDplOmU2FUVaaE3uCV4Q5TaChYTvibrvvwbr
	V0fu5zu/B1EHT7uvQJv5p34EJ+35miG5+B3UiAcw0dnrGYJbOVFzoDe+G3hfVVxozyX9xbn96Uk
	e8288eutOGGXbPj8OTtKguybowokEH7P9MpflgRzD+aGI8zcAXwB7d2mUnP/WRTxoo6WIJLYTEL
	dtPXENeFQ6WXemb/OAfuRdZAEMWS+BFmhDuvT3pkmrUSZCXG2muDDB+Ccbv6VE3XPdxeOLIOQ61
	DDQ+SX3bTZju1X5Uw==
X-Received: by 2002:a05:6a00:368b:b0:851:8baf:5b29 with SMTP id d2e1a72fcca58-8562a6deb93mr17519619b3a.10.1787942250996;
        Fri, 28 Aug 2026 11:37:30 -0700 (PDT)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fa3sm844230b3a.37.2026.08.28.11.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:37:30 -0700 (PDT)
From: Yin Tirui <yintirui@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	linux-kernel@vger.kernel.org,
	Yin Tirui <yintirui@gmail.com>
Subject: [PATCH RFC 4/9] mm/huge_memory: use normal_or_softleaf_folio_pmd() in the PMD split path
Date: Sat, 29 Aug 2026 02:33:14 +0800
Message-Id: <efae5222ad43f749c40aaca9b759b41844fdded8.1787941780.git.yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787941780.git.yintirui@gmail.com>
References: <cover.1787941780.git.yintirui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get the folio once with normal_or_softleaf_folio_pmd() and decide the
deposit once with has_deposited_pgtable(), as zap_huge_pmd() does. That
makes split and zap classify an entry the same way, and drops
vma_is_special_huge() from this path.

Behaviour changes only where the entry and the VMA flags disagree, which no
in-tree path produces.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index aefd62827139..b2ede9a6ae5d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3172,7 +3172,7 @@ static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
 	 * We are going to unmap this huge page. So
 	 * just go ahead and zap it
 	 */
-	if (arch_needs_pgtable_deposit())
+	if (has_deposited_pgtable(vma, old_pmd, folio))
 		zap_deposited_table(mm, pmd);
 
 	if (!folio)
@@ -3199,6 +3199,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t old_pmd = *pmd;
+	const bool is_present = pmd_present(old_pmd);
 	struct folio *folio;
 	struct page *page;
 	pgtable_t pgtable;
@@ -3232,16 +3233,18 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return;
 	}
 
-	if (!vma_is_anonymous(vma)) {
-		const bool is_present = pmd_present(old_pmd);
+	folio = normal_or_softleaf_folio_pmd(vma, haddr, old_pmd, is_present);
 
-		if (vma_is_special_huge(vma) || is_huge_zero_pmd(old_pmd))
-			folio = NULL;
-		else if (is_present)
-			folio = page_folio(pmd_page(old_pmd));
-		else
-			folio = softleaf_to_folio(softleaf_from_pmd(old_pmd));
+	/*
+	 * A non-present entry which is neither a migration nor a device
+	 * private entry is corrupt, and pmd_to_softleaf_folio() has already
+	 * warned about it. Leave it alone rather than act on a PFN which
+	 * means nothing.
+	 */
+	if (unlikely(!is_present && !folio))
+		return;
 
+	if (!vma_is_anonymous(vma)) {
 		unmap_huge_pmd_entry(vma, haddr, pmd, folio, is_present);
 		return;
 	}
-- 
2.34.1

