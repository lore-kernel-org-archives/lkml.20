Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562751;
	b=xYEUHTLridECf5AwedTCBp2OpHws0EdJTtVgS9NKXaYR7BhHO4AQGwI1IZYnkM4NKotf
	 cs7Z/c6yWDN/wzlCpCd9VXPDDBfzQ1gC/Ezk2kKHu+CgkfgrKWZHulNsSRRQpUk1elFlw
	 B6G3MKUiRQPZSMD/IknKHxFo3FZqA0LvqSV6DNEEReILD8O1+xbKJENhkk8aKCbUx+7yE
	 wtytsi8AV4A3+J4p+4T1iKfUl2HMo5+W8yJRbsC15ifbsj3q/KPWWyADOkcXag34yDCfn
	 sbNwShgY1yyKt+Z/C9JsiShe+Ef+AjWaO521PF2sGBexxXoYfUjNbU6pU3WlA2VrxAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562751;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cRp11JQAq7GQu9HIl0KlaLyGmrFE0h6wJDEFiX0LaJY=;
	b=HaFngPOBdK3p6L1siSriwiEa1kJUwdOoaz23pVUbdyLOI/1tfoTfeHeC0kPPP8T1YLYI
	 5pbCcefjwYxdv1D9X8jrYma4urSwcsVrOSCGN2KnYfMujjqbImxV1WMzXELokgjQuLDeU
	 gc5xZ/ikRzg5e2ykW1TmGdr+PVnee1NTqiplWIOLCIm1YIsuI0ieBU4ZaE3PW5D84ZRnO
	 eC6tlfnRwfno+pcnPdExll9aB3hR2yfq3x9iGtnZzw9YN1nRJzFrtliv1WcqrXL+V/M7t
	 haac5vlaIUJAdD2NzG99P+M51zI4qWQybNuEyRbPhLRo3yrrEFdsrVLHfihF2y+C2pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QhSkQ60e;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VZzTP6PD;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CE9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QhSkQ60e;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VZzTP6PD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRp11JQAq7GQu9HIl0KlaLyGmrFE0h6wJDEFiX0LaJY=;
	b=QhSkQ60e09K23fS8Gd+uR4Sdzp1l/YTe/B5DY7VgsMd22GWoTPJlT8AdD2jwSuQWRZIBRw
	3WLrtXjn0lF1JYd/LdHXukiE4Iv0L39kkxznaLxlTg39zbWO7aYVDk78nk3MvaJqN6nw6c
	1XWKs3ld+Ct73s/7D7kUPx+1AGL4CnE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-egjHNJt_M1CN8vBYeEEhxw-1; Wed, 21 Oct 2026 06:05:44 +0000
X-MC-Unique: egjHNJt_M1CN8vBYeEEhxw-1
X-Mimecast-MFC-AGG-ID: egjHNJt_M1CN8vBYeEEhxw_1792562743
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e17d30a79so185134f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792562743; x=1793167543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cRp11JQAq7GQu9HIl0KlaLyGmrFE0h6wJDEFiX0LaJY=;
        b=VZzTP6PDfFyflUhitWU8oBkRMgEeCGKp45selqFvK+YPN2WTaRI2qDsFxRRhVrPDfn
         Klc7XU/hu2aqdMQKZM5W/cOv7J64XeYQajqeKTlo8EQWUTQ85u19gs+/4heQaEj4rPIy
         lV5g02TjQoN52dNw34qScZqzm7vkrWW5gwC+A/YMSJ+29yYVV7G5dZkG+nKOr++BNIdF
         keh3luxTMqlxPJ2eimreUdiiEbowvzwd76Bqz9GHFBkleJq2ZrDR5UQ6g5W3UDFYjk59
         qTQY08KMdFd78SBEoNU/nOkx7ivsbyUAW2As/Co5k6EZYKjjTl+w/sjK5wKZKSKoXjVb
         YaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562743; x=1793167543;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRp11JQAq7GQu9HIl0KlaLyGmrFE0h6wJDEFiX0LaJY=;
        b=bRWzbIMaZHowUnu0880rLmLpCAyinql93V0kKeVq2tDUwAu5T5EGh7MBYbodOhvD+M
         51qdQSdja9dAPpq2dPso3RTW6Te5Yi3WUUB0ouvHhvWto0m80BrKtTGscH1eckMUVAZQ
         Ws3mRXOm+5RuqHuyx2fn4MgjDqzvP+Gtb9hqgzHa9rCCoBXDWmA+i38NDaW1w4s2+wep
         qBoY0TEIxSpOPUHfnToD9kUkswk/G38PM3nHmzY3dp4+8O3suq23/fHD31FUbofWZzDE
         CkYbtDdtA7hQH/XbkN/n/aDvouiTCBw0GvLql3sktH6l8rPzrSvtrGmYjwydCs3caPeV
         KKog==
X-Forwarded-Encrypted: i=1; AKwUvByrJECLyg6UzB9KUsH+cOnJFsmZLHyHu+au8YOXx2IVDudEOzyxR/8jpIBoerIogfpgwzJ0WJhGGN1RnPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLylfLjySYdEaANIjKX7Ry91CABAMtoKmSQsyt9puGKazIQ2eur
	zMhxDf8Aa79BXJ8dmsuc5jsn7/Qo16ptQjtELmHurdP2FaQkJHQ+9vY9bnY18jpxhXSgNXq3X90
	j8c2eNd0CivmE351GFA+HPWBOYQr8DGrQsX7ZyqsZOVRinIg9yVALV7h3KUDlQZRE
X-Gm-Gg: AYBFou24YhnLUVMbu4qvRoTogaoI2mFS7EM4sm3tCb+HuZNuc55faj902Kz8aQ/b+/G
	RUdNLbiNkSScTsPXJ8MgBRd3g9GkPSArFj8nvHoPoHsVB66uisBA7vhwsxYBrJEVptFXIxxQm58
	ZbwBWc6UlFEZ2TqI+LX5/DhqgscFgGPyo30fGP/jGOWvFMnegWcuAOimQACke115vbtuEXzUGGK
	N6kEQrtYK002sU2csIGquog8VUXIwLDKvueNcjqlBVjmatwu64TYnnbv6mQ21Wzz21/uxskQFPL
	EE6wK2sZoL5+zNh1LKO7LIcqAQJ5dIwVJsVE61K15Z7k4WRnu72xbJmHMB2vxWCs45TDfS9qt3b
	3a9k4PAZPSjl13UYMhalhELL0F8rpY3ktdcIu
X-Received: by 2002:a05:6000:2612:b0:48d:f9a4:bd68 with SMTP id ffacd0b85a97d-48e264e3068mr1528348f8f.27.1792562743444;
        Tue, 20 Oct 2026 23:05:43 -0700 (PDT)
X-Received: by 2002:a05:6000:2612:b0:48d:f9a4:bd68 with SMTP id ffacd0b85a97d-48e264e3068mr1528301f8f.27.1792562743063;
        Tue, 20 Oct 2026 23:05:43 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:05:42 -0700 (PDT)
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
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v16 07/12] mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
Date: Wed, 21 Oct 2026 09:05:01 +0300
Message-ID: <20261021060506.2377545-8-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021060506.2377545-1-mpenttil@redhat.com>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
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
index 5891efee3e18..36a4edde9823 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -373,6 +373,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		/* Report error for everything else */
 
 		if (hmm_vma_walk->ptelocked) {
+			lazy_mmu_mode_disable();
 			pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 			hmm_vma_walk->ptelocked = false;
 		} else {
@@ -396,6 +397,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	    !is_zero_pfn(pte_pfn(pte))) {
 		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
 			if (hmm_vma_walk->ptelocked) {
+				lazy_mmu_mode_disable();
 				pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 				hmm_vma_walk->ptelocked = false;
 			} else {
@@ -415,6 +417,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 fault:
 	if (hmm_vma_walk->ptelocked) {
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 		hmm_vma_walk->ptelocked = false;
 	} else {
@@ -555,6 +558,7 @@ static int migrate_vma_split_folio(struct folio *folio,
 	if (folio != fault_folio)
 		folio_get(folio);
 
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 	hmm_vma_walk->ptelocked = false;
 
@@ -1110,8 +1114,10 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 
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
@@ -1155,6 +1161,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		flush_tlb_range(walk->vma, start, addr);
 
 	if (hmm_vma_walk->ptelocked) {
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(ptep - 1, hmm_vma_walk->ptl);
 		hmm_vma_walk->ptelocked = false;
 	} else {
-- 
2.55.0

