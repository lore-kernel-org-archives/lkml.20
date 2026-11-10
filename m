Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333634;
	b=2MVzimAzbRTVYJ0NTSiq4sVa4SAre9NG8tPBdUAIAGEhCoIvCms1SH0bJQ92sHhEC92c
	 5Cndd2GQ9wyY3ZpRFFjtn2LNJZFkls34IGVWLV1u5UK9ozwR9Vr1md1KnKQLSzEwZwfam
	 VRcoB8e8hzddjNcQBspqqBlu8m10W2lcX9ysQCZL9Lw0QBkOYlqn/mGwgnsc7N9IntpJL
	 /fzuULdYeNUC5Cmz8AGr8xD04FrobBPOJSKyyQOL4ry1DtT3rEIDNeP8q467SG1mQuFG8
	 6XEagb5eYtOOjA2VfWz+NyqpSlw90oh/8YfYuKgDYs+ML8Y6iGXyrpWQFUhruWvwhIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C3do4ymgkQu9W4+TcuI1rL2WbfZAofbuASAnuxyg2Dw=;
	b=A1vgvpOIW3IVwLAHAt26KTx4ZcrKPAnfhkPb4PXgAR87h2EvB55jDaRUO3z1m9OYiH8C
	 gRWcBMmHrrAlkUrZUufasC+Dxi6WX8lJmyn35HkOyw+Q7vTn2SoAqWV18/EbvVNJihzI+
	 b6qqUiv6MQb/8utx50rG07n1TnRRXCWcY4UOrAcOOKmZWVPA8wBYMIKdxHYKKuh+bHcUa
	 6WC1cOzZ8F6I6tRpalfGDdl+rdFgYdTGx3VCtzl5h48toowCia0sOd/c/V+1v2pZfv4U7
	 QS/LzxhyERLBsbxvrtoRNdQj+CqSX1xdLBeHfS1dY5+cdMft3BeFLpUn7DWttMvTQVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+SH9VWR;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2B9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+SH9VWR
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4681437eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333633; x=1794938433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3do4ymgkQu9W4+TcuI1rL2WbfZAofbuASAnuxyg2Dw=;
        b=w+SH9VWRyXsPa5qul6qJRUpisDhjHkJLHqyXYBtLFotki2LnPuLjr1ij6Yxc2CV42z
         vnhjL9fX139akCQkqW2Dp5sn1Xg4NTENK4xL6vkHiersraC2Mw41nYyMDvMbdMOghHzQ
         E5UBe0G8FIF9ZNrwD/oMvxiPsJWHRj6UyJA1SocM91kwoeMe/Lns5gAYUkd/4zYLzsCc
         aCFelTEd21CASV6lWAh1EGPK0YjLjjxT7unMy3pLoJMTOOhhQJRnMrrndQQqqfQ08nub
         R2mWTX+abuLfzPQ0ZZE0HfdyqM58AdIdP3Qz6E1u9bxTJvE3evwvGRJOLO/Pf23WO5l1
         k6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333633; x=1794938433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3do4ymgkQu9W4+TcuI1rL2WbfZAofbuASAnuxyg2Dw=;
        b=XNxnvqDnWqsBR7peT2zutTtE1OnatG7QTsPs1SWJz+OHZQYjfQIlW0/aHAPr4Fvt5y
         6SZ8KHzzFplqeQLy0jqI4M8/6ETA+O9+ZlgOyr7UPQJI14Z6dxCjPXR6xjGytV0Ii592
         d/xHyewJBVv6Cv1RNc+eKxu4E5/RVLfNPCA/JU19/Rl1bxs0QIU629OrHqIpmxAFM6IP
         hOAJoQI6sRaGFggdSCK8d8rzZEEfEg7ANRXsViha6jZ/656lgfRHIBz2Hdky8KTKtMys
         XttsK7FqjtqAG7ywRyt4xogo/75VtozIG7mizkrsr3wcrYFAP766ON/7hAszArJflv18
         CLNg==
X-Forwarded-Encrypted: i=1; AL+hErGc7BPXe6A0wufvNh5wXj08656hQjujHoeVRdiNsghYgec5fdgzLFmHeLDrFVzSSUssY9AjC/ASgXROozw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YncGN0/qCs33exKu+oxyFwewAyqJbLW877hcFnDUp+2rbkBGI
	9ZuiLCrlwflbUIKpfMN3mNkX1kYcFB7Sx9XljWSZWnhVz35jqf15Q98fK8qEH1TnhO4=
X-Gm-Gg: AYBFou1BD65kb+BqVPeaiXi69cRe9OlvJPU9aJq6UdM3WgwrMrr71Pyayt44iSlJE1+
	tqyJEO0ARMueei1bwajt6phxV10AVcApXjBSNYY4x7iMKlHCQLEPaoZOjT8QK55ZdH3bzm1jjm7
	Z+jgmPRTM3JMC/TFnEIHJBiM9RsJy5whGPi6ryOqDS+yqJfMjhH4TqgGNRNIvF0pnNTLVlpt6d6
	gdOceqX6gjWvHJcC/N4WlL4ITmU58sENweE6/SQdEIN9Uzg+rbpGrlV9Ei29T1k4vvPJ10tnheB
	JD83725+H/rYRk7jKJw89K8usfxTxRzOoip3Gl+OIM2YGJbKl0lzSwqbfT8Mj/YZMMD3Dx37cGe
	S4buVRKIujxFHaf4qqdj41Wg/rKP1fNMTAX9pcq8EYKMuqzchha8d6+WyFliReN4dUboIqQUQsd
	KbtlZD1ED43EHGafCN4EZKLVpa75ga7NvUgc8zEjXFtDRr3Xzpwa4OXts8Wr7Kn0Rj5DFmfyzJc
	GTABZRWgdXKRcA93NREPbBRACLDB7Z9ap4tq++ko+Kqj/Oe3kFTIvBgvf9A6f6J8uhr5BxDcvNl
	dGztRgDYakz5/s/IvJxQQ64NF3E+INtd7dYmkgR6BoPa2FvtQliLF4ySw+4=
X-Received: by 2002:a05:701b:4585:20b0:1b2:cb38:5412 with SMTP id a92af1059eb24-1b3b61960f3mr4159856c88.42.1794333632388;
        Tue, 10 Nov 2026 10:00:32 -0800 (PST)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm7624260c88.14.2026.11.10.10.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:00:31 -0800 (PST)
From: Yin Tirui <yintirui@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com
Cc: ljs@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	ryan.roberts@arm.com,
	nico.pache@linux.dev,
	usama.arif@linux.dev,
	liam@infradead.org,
	kas@kernel.org,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	yintirui@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC v2 4/9] mm/huge_memory: use normal_or_softleaf_folio_pmd() in the PMD split path
Date: Wed, 11 Nov 2026 01:59:19 +0800
Message-Id: <20261110175924.2945538-5-yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110175924.2945538-1-yintirui@gmail.com>
References: <20261110175924.2945538-1-yintirui@gmail.com>
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

Get the folio once with normal_or_softleaf_folio_pmd() and decide the
deposit once with vma_has_deposited_pgtable(), as zap_huge_pmd() does. That
makes split and zap classify an entry the same way, and drops
vma_is_mm_managed() from this path.

Behaviour changes only where the entry and the VMA flags disagree, which no
in-tree path produces.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 85813114fde1..d0ff2957e47f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3217,7 +3217,7 @@ static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
 	 * We are going to unmap this huge page. So
 	 * just go ahead and zap it
 	 */
-	if (arch_needs_pgtable_deposit())
+	if (vma_has_deposited_pgtable(vma))
 		zap_deposited_table(mm, pmd);
 
 	if (!folio)
@@ -3244,6 +3244,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t old_pmd = *pmd;
+	const bool is_present = pmd_present(old_pmd);
 	struct folio *folio;
 	struct page *page;
 	pgtable_t pgtable;
@@ -3277,16 +3278,18 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return;
 	}
 
-	if (!vma_is_anonymous(vma)) {
-		const bool is_present = pmd_present(old_pmd);
+	folio = normal_or_softleaf_folio_pmd(vma, haddr, old_pmd, is_present);
 
-		if (!vma_is_mm_managed(vma) || is_huge_zero_pmd(old_pmd))
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

