Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686634;
	b=XjPvw4xup9axJbPXk1sn7MAqQGG2BF+aqIY7ItEL+ZIQfDg1TkjKxBDgCOBnFWn+ixk0
	 gxo/Qk0XEZYyH0i3BRx5LXfhBEFHOGdeBz2r/AaFKimiRaaibQ2gOa1f/ze3duEE3rB+7
	 W1RcwfqEHJJoPHpTG+AVrGI2WOWEqqxDJ71qj3txOp9tTsER3P7IIE8qC2prlPuYBTncy
	 xfuGP2hB+IjJML7QwTgXJTrUnDNJfKZYeTwI5KKFR2Ax/qNJmzTDZgOFjAFizq5Ycrxor
	 5nqwUaPlzUwcK4SzLAvwyk2crYt4B51xyJkjKi6cJGGCgyc2/Tg/L+kVvu3L8kU6BNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686634;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gobpz7G2pF8eCW6Qy4GETlwPpa8+u249lV/gCTCXtkw=;
	b=oEfiC8iBtWofReysaifjTNN5ZT1tpKQMSR632Pvba9yctmKiGBvcRdZzcsf5jXfUQlFX
	 KzQ4kOl9YK16xqv0wux0yCHqG7Cl/JOFNYc/ZWpR1jLudbHY3Kt/Da9cV60nli0oU5/rd
	 BILUreUt6hkrKRYNbQK57oVgc/qXZWW+bRZ3b8Lfdh3sGzvmnhyZqwdbJfTvSucCIeJaE
	 GiHpq3oqmh64zCK8ywO+u3ed3TyAuIB9EDKp87qerXJWvH8/Hs33f313IeC41b3cXys7+
	 PupT1aZw9zFje86xEU6UFZ1aJDs+4EuDq/Dd5k072aNflfPvINmCTwwOwzBtzD34Hcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PAq6fX1Z;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dX0v4jof;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1F6606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD1F6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PAq6fX1Z;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dX0v4jof
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gobpz7G2pF8eCW6Qy4GETlwPpa8+u249lV/gCTCXtkw=;
	b=PAq6fX1ZT9P1QemYQ7f1P5H3YjOpYDdFzLSp/mESvdWAiX/whUt2PfLB/4ScC46ACtrjfH
	t45bqr1MrJz8RfY79S99sAi2rP9MrpwwHJy5RRyxWTp7LZcu6ivhQx20VHYV01cxUdB7uQ
	AP79uowFPq6PIxIrtKoudXmVLvU15/Y=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-eJDd3WBhNUG1D428r1l0qw-1; Tue, 03 Nov 2026 01:17:11 -0500
X-MC-Unique: eJDd3WBhNUG1D428r1l0qw-1
X-Mimecast-MFC-AGG-ID: eJDd3WBhNUG1D428r1l0qw_1793686630
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5bfe13ad5f4so1725129e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793686630; x=1794291430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gobpz7G2pF8eCW6Qy4GETlwPpa8+u249lV/gCTCXtkw=;
        b=dX0v4jofNliAHXUD1QhTyAp8FlVcmpj9dkHDrylQaKIArSD/6570sHP28/bJf6h0IA
         wrAgebrN+1pbszPJgf4wpv0DUbzKA2nROw/tb4nmZI+mFxB5Qy3uFIJBP5nLoiWUcogP
         j+E0tw940BkKdVEqe3d9MQbMDFNvO1g2lMRpGZAsg5TE1C0cPHJWg7W9jZ/n0ai2NM/9
         8LCXr1i0oAcNMx1OwUJhXjbw3xyQFqNVplakg3zJsK0L445X9ZarMzxl8ds3IXHT77sm
         G+H7X8fkrR4aaaBkykTQvqk4kGOWWMv/f2DacIWe8vlZ5NNbJigFMVtvF7+y6v7iAgET
         oBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686630; x=1794291430;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gobpz7G2pF8eCW6Qy4GETlwPpa8+u249lV/gCTCXtkw=;
        b=NWGCpHfrhA6e0aOQp//geqFL7psZybqpKWLuqUfH6tRbLAb3jD/jgx0ZicEGuulZnG
         yE8uML2ajuvgrTR4K5iZL+KGapUXIQ9EB6KDZJ8Z90Cx9rQO7P3bKH6b5/wSzydBVSMu
         1VT+I7exMptPud5GUdtock7YQITwVGYr0hay+AFCwBTeMnKq688jN37qZR9itZDjkwBE
         M2nrcQHMR5e3Gre0MA+teQ1h6dBAs8FUhF/ezz/PCfNPhSLvyV97HbHt3M78+j5KlZ0N
         qgGM5vGI+ce1y1aax/xonCpyAi81dMIeeYYQdIyaJSbvO1CXRULA9IkVa+GZF4rvQKuR
         4xxw==
X-Forwarded-Encrypted: i=1; AKwUvBz9FnNIudHBntBgUB+RIyDFgCTmHA4oeTajhzh9pQeFMNnz2L/bA46s+uSeKE1AJ+zEmMeU8i+WdoKBXAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F/wDaod8azOJ7a7kkon9pTisev5Q0E/OxA3GLK6Fs+s7hGCvj
	99c+4tW4bYaVMsQLVWRX9q0DjcE+JhwR7k4rV7hB5LcTdNr5DDFdSs1EUfPNv33x2NGF04AVuIa
	bdBF1BtomkPsEctj9+JKckwWU3x3DLjBsdsKtwfJsw4AMlaiOr6RE+lmeogW140NI
X-Gm-Gg: AYBFou3g4Rbk3Hy813YfgQv3itEH1yxM1VdGnyi3PWBaUplMyMJeUcetPyeWc8biZk+
	Zu/QlBORsMkTJ80opPbX+7hw2DftZAgZTf1IE08y53L3JLzKOofZGwjWyAemC9O1cNEu+yAj3L6
	4WrHTK1GcOLq2ORo2HXJPaBn1ubVjkhZ14cc00/DoZWRzXFUIsCsUofhGOScbpx/DTkTTmrvbOH
	Wzb1RQuoxWJk7RjgxFVlp46bSRJtLuUxZV11iPzqLSgg/WrHVbG0fhQlKziGS6PE4slqJk1f+yO
	B/cjIDM6JSbSiSKAwFtlqlvSu2cW8ELZSAntSLH6iM15JETZ9xE3my2Dq7RyRVN9asSHbqNupBF
	yRAjMwAMKnVMbo3dI34ZNQmXjs+HFFoSme8GGAUJ38AQQbKHrQS+FBAuTZv9TBcNjH9LuBQ==
X-Received: by 2002:a05:6512:3f13:b0:5be:5dfc:864f with SMTP id 2adb3069b0e04-5bfd9599012mr3965230e87.50.1793686629686;
        Mon, 02 Nov 2026 22:17:09 -0800 (PST)
X-Received: by 2002:a05:6512:3f13:b0:5be:5dfc:864f with SMTP id 2adb3069b0e04-5bfd9599012mr3965125e87.50.1793686621536;
        Mon, 02 Nov 2026 22:17:01 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:17:01 -0800 (PST)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v17 07/12] mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
Date: Tue,  3 Nov 2026 08:16:24 +0200
Message-ID: <20261103061629.972669-8-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103061629.972669-1-mpenttil@redhat.com>
References: <20261103061629.972669-1-mpenttil@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

Add calls to lazy_mmu_mode_enable() and lazy_mmu_mode_disable()
while doing migration.

Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 mm/hmm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index cbde004fd778..690b73908f34 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -377,6 +377,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		/* Report error for everything else */
 
 		if (hmm_vma_walk->ptelocked) {
+			lazy_mmu_mode_disable();
 			pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 			hmm_vma_walk->ptelocked = false;
 		} else {
@@ -400,6 +401,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	    !is_zero_pfn(pte_pfn(pte))) {
 		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
 			if (hmm_vma_walk->ptelocked) {
+				lazy_mmu_mode_disable();
 				pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 				hmm_vma_walk->ptelocked = false;
 			} else {
@@ -419,6 +421,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 fault:
 	if (hmm_vma_walk->ptelocked) {
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 		hmm_vma_walk->ptelocked = false;
 	} else {
@@ -548,6 +551,7 @@ static int migrate_vma_split_folio(struct folio *folio,
 	if (folio != fault_folio)
 		folio_get(folio);
 
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 	hmm_vma_walk->ptelocked = false;
 
@@ -1159,8 +1163,10 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 
 	if (minfo) {
 		ptep = pte_offset_map_lock(mm, pmdp, addr, &hmm_vma_walk->ptl);
-		if (ptep)
+		if (ptep) {
+			lazy_mmu_mode_enable();
 			hmm_vma_walk->ptelocked = true;
+		}
 	} else {
 		ptep = pte_offset_map(pmdp, addr);
 	}
@@ -1205,6 +1211,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		flush_tlb_range(walk->vma, start, addr);
 
 	if (hmm_vma_walk->ptelocked) {
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(ptep - 1, hmm_vma_walk->ptl);
 		hmm_vma_walk->ptelocked = false;
 	} else {
-- 
2.55.0

