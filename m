Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333612;
	b=0j3rj3yIWFGD/uNEF8GV5hKguRzSBzxNQ1A+0KQQqKIKHaBtkS79O1O5VfK9ze7qBD0z
	 1S4YnD/y8KD5qa1ihJm6vm82x9vow/zzSduDGzfHbsMBKnc2ruFtOiSIbSUACUnpQhAG9
	 az1geOPdatVpPxJ9hrC/N+XUOMeATMkG7ctlgKokjtU+neHGR1qKA6kHzoBvhrJxQ0r8n
	 n2RQhrOxCBPWvsbRMG9xZLSXzI5TS5OSpw5rUOtnF0jGCPxUmGZ9w14HHMH+tv+1erizH
	 lX/LvNPCkaP6YFN9FrkBfNT30akwIRMvDFpGOnjVP55cwsMHHLYFmnoBwyKtLxDKoRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P2zYAQk7dfh7Cuvi7cfy4zLs0bcYM3xIu51I8ewPRuE=;
	b=gb8fEnMrAlK0FaocO5FRi9R3okPJwKcvYnSJCiUCZ5rxZetunGV5DRlmHBNkuoPgx5Dj
	 BkLfw/Yawdw5heCmOYuz9ntCsoAQI+wUPiuWOrCtHb27jP9pHuV709q7gK7Nrne42Y9AI
	 7P9TMd2mxGqKsqAZi7GbXUVZuiCTIWPuu9imi2kxN6QANg+UiyFg/kT0owthQgLIfotBH
	 olSiC5FcZfxWJ7mYhhA4sXly/8z2lY/3VfQuh1XzGL3Npiz8U4Y2pjv5Lvowrk3ogxwQG
	 ZBeqGNjbG+J2gGOXTKufZ9xHmtb6+gmKxmgpjxRrvQtCo0cWdUkxPf9g4mQoilbYs7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKGYDCVY;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A50606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A50606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKGYDCVY
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so2021982c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333611; x=1794938411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2zYAQk7dfh7Cuvi7cfy4zLs0bcYM3xIu51I8ewPRuE=;
        b=iKGYDCVYfMI67Phkr3UJUEGB7XeK0oayatNbHq0cz+3B12Mh31bIDv8vijEjscC8iu
         YrhP7hIEf/n3Sn2x3+6IUpo/o6i+yWyHnpuxSMI4WC/MmQYp0BIlrNSpHF2lRbcJeMUn
         ZW0+jqEJLmqDrm1OL0mIbcxKcOHWOqVQIuV9EtGZ8qhA1qlRk5wLzGmJcDz2Wx+wCxD9
         sCM45p0ktCPgAz/GkqffEGLb1j2t7NyQ4nvgZrVLDIvR9Qhww+l1Kuld1iQ0dccHVr4a
         KZjtFT8yriQTL3irEo+jOwktQUhm0dVnGUsITk8DbzkZEOGnn0U2kNvJkx5hQ4COt0JK
         qjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333611; x=1794938411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2zYAQk7dfh7Cuvi7cfy4zLs0bcYM3xIu51I8ewPRuE=;
        b=t/sK5uPCdPDuvl1URWTcJXkcDgm/loggatDTkvABcQ44sUleLg+0YQVg7N5KWu1aA0
         Y1rWmMeNhNweVnU9ZVRU4r1Pc29KGy2EcRwYUCU6s3fPIPPCcwxECSch8rkgjnuJATFw
         LKDhG3+MqJpozd9xts0eV9V8KdWTfTPWEMOgBflajAvyy1eR04P8nfsElwX743wSGTom
         wCFnFu5L/ogn6GdnAt9QgGZwKDcR5wlpFpkd27x56KuT9LGzcHWPzsHB5UFdKZUo94v8
         APxqVxLZLyk8aoxjSTqiSFRIbp+kSa5Q6Lz0+H8TAecFkY3o/EHsJ0wWlpI0QR/TclbQ
         aigg==
X-Forwarded-Encrypted: i=1; AL+hErExSYbjPFHnFcQh6oU0Cu+j8LDAuT8GdIOUNTAql8ytJxcQLgO/9ohCppqTfP80thmIazLtnSDL9Xbp8MA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5KBoaQvkM5bUnP76yAFrEkQZ0l/acgBT2Vg3Y8ecfLCUpB065
	6vmUW8L1xLF9YP1OsbNKadLNj7VZdxl8Y0SlKRT9X/r6lggrJ0nWXd18
X-Gm-Gg: AYBFou1UCQwki2l0g0pUzHQj++tx9BshSgHc3jpgD2kgnGaTkTSTd6jgxbYWWfp1h9h
	sigkaXj/UP2ny5evBcDKUl/3HXnnN0o6KSgbdnqaflVZ/Mvy0rMt8IFi61/b0dgmo8Kct7bvtRJ
	D2KmuawMv8E8QhHaOhMxeCvsxpK/0UJ4MXgJYxfGw5fRN4apAbecamRA8Hw2aXpuKryCGG5Og0C
	btOfJv7IK1pjA0dxeVzqE2VP2hL85YscBmZV/RIIQt/1zsJskl6aiB8pm6xFkKUQHFsxyrql0vc
	DamoDFFK4j21bQyOsSjiKf5CdpHksSMDaJ/Wl+jdhePaC6ZInVLivXXam2fbY3kt10CTkvgXUQN
	Zmt8/gX6PJewqiy7euccOviRqhW66Yerunh3D/zacoIG6qx9ZmN3S8ii1FsKeCJNfUl0jdEtH6g
	xMQy4nlaPkmw9eyWc5mTQB0YngBIwY5Kw6saPKp3s9ClZUq67ysHgquQBorBL+yLbHPomEL0fX5
	7kfyeH39Gu6jP0S9CZ1/hOjE6D1d+DYlxyGxreAcY4y51A+fK/+nunrZfUhOafFJ1zXHOlnyfYU
	B0oKDM4zexrAN5AVXwvyWuToJELpNftFA/u3X9b5sM3seqznVi2zxSa8k1M=
X-Received: by 2002:a05:7022:f519:b0:1b3:ac23:611f with SMTP id a92af1059eb24-1b3b6017fa0mr3776188c88.28.1794333610087;
        Tue, 10 Nov 2026 10:00:10 -0800 (PST)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm7624260c88.14.2026.11.10.09.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:00:09 -0800 (PST)
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
Subject: [PATCH RFC v2 2/9] mm/huge_memory: add and use huge_zero_pmd_can_split()
Date: Wed, 11 Nov 2026 01:59:17 +0800
Message-Id: <20261110175924.2945538-3-yintirui@gmail.com>
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

Only a huge zero PMD in an anonymous VMA is split, into a page table of
shared zero page mappings. Any other huge zero PMD is simply unmapped.

vm_normal_folio_pmd() returns NULL for a huge zero PMD, and the split path
unmaps any entry which has no folio. So make the decision before the folio
is looked up, in huge_zero_pmd_can_split().

No functional change intended.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index b643e264ca23..dbcacc7b1374 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3184,6 +3184,15 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
 	pmd_populate(mm, pmd, pgtable);
 }
 
+/*
+ * Only a huge zero PMD in an anonymous VMA is split, into a page table of
+ * shared zero page mappings. Any other huge zero PMD is simply unmapped.
+ */
+static bool huge_zero_pmd_can_split(struct vm_area_struct *vma, pmd_t pmdval)
+{
+	return is_huge_zero_pmd(pmdval) && vma_is_anonymous(vma);
+}
+
 static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long haddr, bool freeze)
 {
@@ -3208,6 +3217,20 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 	count_vm_event(THP_SPLIT_PMD);
 
+	/*
+	 * FIXME: Do we want to invalidate secondary mmu by calling
+	 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
+	 * inside __split_huge_pmd() ?
+	 *
+	 * We are going from a zero huge page write protected to zero small
+	 * page also write protected so it does not seems useful to invalidate
+	 * secondary mmu at this time.
+	 */
+	if (huge_zero_pmd_can_split(vma, old_pmd)) {
+		__split_huge_zero_page_pmd(vma, haddr, pmd);
+		return;
+	}
+
 	if (!vma_is_anonymous(vma)) {
 		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
 		/*
@@ -3240,19 +3263,6 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return;
 	}
 
-	if (is_huge_zero_pmd(old_pmd)) {
-		/*
-		 * FIXME: Do we want to invalidate secondary mmu by calling
-		 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
-		 * inside __split_huge_pmd() ?
-		 *
-		 * We are going from a zero huge page write protected to zero
-		 * small page also write protected so it does not seems useful
-		 * to invalidate secondary mmu at this time.
-		 */
-		return __split_huge_zero_page_pmd(vma, haddr, pmd);
-	}
-
 	if (pmd_is_migration_entry(old_pmd)) {
 		softleaf_t entry;
 
-- 
2.34.1

