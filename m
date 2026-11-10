Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333647;
	b=lpZbz6dd1EJD7kfoSyDiKteTDbCwF/FODJ98NYK2jCrofGdxKS2xEmbzLiMLAl4pY6e7
	 vJ2zBhYs5/ILZYUt+I6UF5im0Yk0FehuCDjjBFIxZhS7gEjuZLXRaB5nrWMUaQ/KHhh6j
	 khjGz5UrFv3XTKo1fksSRaHITNTYkTy2EauRxGK3JTCrXqk98CUH8BpGI4/PZRvfa/iYa
	 sL4UDLMcoRBJzBCcFMIBKxsB4IGRyxWFTGwWK2+v/kHUIbOa7OioFyJ7pgf75NjsNO4jd
	 wCl+LIcL60AC51nM7vbbYh+LZ6W5Y8gF0ROBfSd3dxeTVBUDYz80BEXISK8a7rSdzSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+9N5Sc1Y8ONMq1nw5Y8gb9n5wSCLwY8oTDzk3ovJiVU=;
	b=nautuD3okE2+lmCiCHfX5W3wY9t4pHp067i9Xvq0Rbd9kTr2QtIrMqJps1hMYqAE8e56
	 B/OOPQ+I8i8ZhX/up4NJsi5AY/qnq+8zCxqNrDYjNFJx2jOqFF5SgSGmYOCRqbqqG4Trf
	 qvxasJYjEW9EITLnYSM70oAXKc45lZN8UGJX7B4PfJqeEVYjF7hjlffewSaArZJbMJUva
	 fJlWZm4WBx59Mk52OfDcaxrCaG/inZ49UMZdNcWjn0jS4ZQedl53ntxgNMpwKahw3CThL
	 ac7qDYm14z0ghl//Ijr6pLYL+IM+nwz2nBnG/YuCHtVBj4craBx8i5JUo+SHmLiP20Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lPpAztYi;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E13B606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E13B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lPpAztYi
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1931ff67a29so2634573c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333647; x=1794938447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9N5Sc1Y8ONMq1nw5Y8gb9n5wSCLwY8oTDzk3ovJiVU=;
        b=lPpAztYi8aeJ6OBN3RP85MvzjoYDSOhz7iAhYyUIZRsC8DPug6tPHBt/nB+KDlNTB6
         +pzVynLqxFDI9e8ge35hXlobrdy/GjZuFhegfNK9bQ6sVszbr/iWI5zUNY6TQdC6Gua4
         soK1gUrcxITYiPfAWjUprq4PzOOy7EcuKu1imvqGZgBf1dOGYIbo0Ns/kZMP5apTPyZ4
         yCp44Gu/SIAeEMEgeeaDRpFu7fjKstGzrd1Et6syGgP0XhyjcRsX9N3/miR/oD/vvmxh
         bf/YEgEWIyLEGpdq7rvTWk9hbkDRFuw1+wHG2QKhxmTs968gGt9hvLfOitv/70qLpbhf
         UiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333647; x=1794938447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+9N5Sc1Y8ONMq1nw5Y8gb9n5wSCLwY8oTDzk3ovJiVU=;
        b=ZhPcAeMlKFkMCihQmqua5lu6vtU584v2OWWaxXqVo+9cLLL+LJ+vX3cz3TA4WuIm3J
         sexzb2nw/8X2hzo2vJ/F888qTtOGV851KiF4rWtFnp0+zEArwe0k+msVQrAesP9IwzEk
         fMNkHG2n/lYr+JTs/LX72BYSmwO9wGxBj4pj8jJzNpHoXL2HpwneEjG4EhXb2Bwd/Dhg
         WZr+iSbH9+z8450MQLKvsSl9R7almiQycnbPabMQoBurFWt76VRH5+f+QEW6mM6VV2SX
         /DZTtkukFMILXlMRe68zPOtOnst+rNO+BC83tru0H4Y3JwCJnUmeikrWk569vOHdgWMr
         hzcQ==
X-Forwarded-Encrypted: i=1; AL+hErHJRFXwtMjY1ba9pOj65KNmwt2tDJb18KPcBBTzWiwfMz6CFLd/N9e+J4lvOuFvLgSO+Ku/5m1tvmEK4Xo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1q+QDiRV8fLJHnY3YuQx2+jolKdY4SjA8PGaD9DOwZqA0ssYz
	3nFGj58bu8T/NaV1PVPwvHKb0BXf541BJp679uzbOXCN8Md4pqiXZJiW
X-Gm-Gg: AYBFou2ggbpr7EugHTpqboqwHbTzziqoteyAz+Pod1wDEQWkY/5AYL4orunRGxtbUnK
	y/ZaZVjiHKtjjjV3QfSEDAtKfHejABwcLKYtzk/h9P5zYLPvECIXIblZTHnDIpxqs8DzGI6DbPr
	IEYf9Y7YqEuxJXlvIBq4YjHV0b3NaJ/2o0NSlYycJ6KZhmi/twZ1BMmigyBs9nBGXkkXMr8HkFo
	v92cT5jWQFL9DswxltnXVAtPmChTT//ut5ohRiqQfmMlpBYnqCOiRBLujP2pjliPe71pAqNJFUF
	KjJI8+KlRQIuvIvwIPffwlQDjbRyvJ/PKf4edUHp3uPSROwH2K5DmeYBt1FKQCcVer9oS5aQdJI
	jFizaouLEw/iUKuwWfhb5Go49om329ZQ+LfzlF147LHasdbcnELKZqxrYeNpyi01sj7lVdDRQ7J
	hkUR30dHcbDmj7aqAqhzOZULhqF/gaoR/X0IYLnmjxYUTVQkaorlCtBJg89F/GoNXtOQY+MEOdJ
	fLzC5VyDj2L0BsdCl45YG9eByII017QLF0aCbtpqbB1L9tJjKtSZBnGCCz1nuZ2NOW9G/Esj/DL
	0k4djsYo8yppEvbiufhbqFOAgaaiADmL2M1BW+SyqY3b0OoLlryJpCJ6BAQ=
X-Received: by 2002:a05:7022:b052:20b0:1ab:fe29:5081 with SMTP id a92af1059eb24-1b3b6073e47mr5274788c88.20.1794333646393;
        Tue, 10 Nov 2026 10:00:46 -0800 (PST)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm7624260c88.14.2026.11.10.10.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:00:45 -0800 (PST)
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
Subject: [PATCH RFC v2 5/9] mm/huge_memory: dispatch on the folio when splitting a huge PMD
Date: Wed, 11 Nov 2026 01:59:20 +0800
Message-Id: <20261110175924.2945538-6-yintirui@gmail.com>
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

Only anonymous folios carry the anon rmap and PageAnonExclusive() state
needed when rebuilding PTEs, so decide the split path from
folio_test_anon() rather than vma_is_anonymous(). Treat a NULL folio as
nothing to rebuild.

This only changes behavior for folio/VMA mismatches, which are not produced
by any in-tree path.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d0ff2957e47f..dcc8cd380da2 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3289,7 +3289,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	if (unlikely(!is_present && !folio))
 		return;
 
-	if (!vma_is_anonymous(vma)) {
+	if (!folio || !folio_test_anon(folio)) {
 		unmap_huge_pmd_entry(vma, haddr, pmd, folio, is_present);
 		return;
 	}
@@ -3299,14 +3299,12 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		entry = softleaf_from_pmd(old_pmd);
 		page = softleaf_to_page(entry);
-		folio = page_folio(page);
 
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd(old_pmd);
 
 		write = softleaf_is_migration_write(entry);
-		if (PageAnon(page))
-			anon_exclusive = softleaf_is_migration_read_exclusive(entry);
+		anon_exclusive = softleaf_is_migration_read_exclusive(entry);
 		young = softleaf_is_migration_young(entry);
 		dirty = softleaf_is_migration_dirty(entry);
 	} else if (pmd_is_device_private_entry(old_pmd)) {
@@ -3314,7 +3312,6 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		entry = softleaf_from_pmd(old_pmd);
 		page = softleaf_to_page(entry);
-		folio = page_folio(page);
 
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd(old_pmd);
@@ -3366,7 +3363,6 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 */
 		old_pmd = pmdp_invalidate(vma, haddr, pmd);
 		page = pmd_page(old_pmd);
-		folio = page_folio(page);
 		if (pmd_dirty(old_pmd)) {
 			dirty = true;
 			folio_set_dirty(folio);
@@ -3377,7 +3373,6 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		uffd_wp = pmd_uffd(old_pmd);
 
 		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
-		VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
 
 		/*
 		 * Without "freeze", we'll simply split the PMD, propagating the
-- 
2.34.1

