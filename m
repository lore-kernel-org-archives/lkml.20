Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910003;
	b=lBjNQG8cdNj1JxRxyZfRedMjuVffpjaWM7NkjenRnPE1r8ODcIvb6eGC7KsT0NM0UUUA
	 U1+IUZBqW2cTUIfC59I6/xiAEe4tY9VyLwaI391aot5mG4A7kPfZo4wVkb08XZ5h4WGLY
	 Pg/QU7nMxUjmfvwmUS2aOBZwNPSAeoHft7l+EeNJz5WF2OOOTzFGovE8ZkaINbgG3DWV9
	 6DU3F4dKbpqPyVRHIl05hBb6K17x3Aq4bsj3zFQB3Am8Q3p2FX6t5hQ1BAdloNEIUKZp4
	 zTupdk371bO3Vqi8wAYencK5/OVPqkUX3opM5TTAjFxCWIxslAMhC/SF6LmXOwTNO7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3ahOovwjDlDqMNZ2Yyn08XyrzZ+sm+Yb+nsv1sSKI48=;
	b=XZUCoGZYf3Ly+oFLTZntKEwUE9yGLZ2pBiLFNNv+oMBz1jsta5V9UJ9GK4QSZZNmtEP9
	 KHNkX97DE4UgBUe86Ch58G4EXuuaKEWq1sLD6QhSBjJprgXQheV+4cRkAbwZA4hyoJGSm
	 uVUhTCoL9m3nfEfCBgNv3EKdFurkFV/1c4c9XWSYq43xsfq22Cctm8KK+uVmvtuCcEISS
	 bqfwLlw1r7ABwCkINEJBFsjIDPn+z2ssKxeATxo8SMaNSZC4xnWapbPCJ3V8mkOCYd2Gj
	 xWFXTBR2Oja/ddvKzAKQGqIeaWQZdqA5S4WKjtU8lbfC9i4ithEaOzrw2rfIp58EZ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A/oX0UGA";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056CF606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 056CF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A/oX0UGA
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b2382bf051so2508661b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794910002; x=1795514802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ahOovwjDlDqMNZ2Yyn08XyrzZ+sm+Yb+nsv1sSKI48=;
        b=A/oX0UGAjiQUMW/uHe4FAKYp/rapBHq8Tyxdw6UZ+gBxrxtAI3PfS7VDGLBkS6lAYQ
         D5CPvf+FkTgRQAS8ykBj0Vugq0WHVlvkPSN9mf2Sezh0Sspcf9Ci8IagyeqRVo3qgCqg
         oRKUia+PhUgTH6cetMzY1GGYcAkmx7cFvobW6z35XjmGohNhnwHG3XEvuOW8klc33110
         BbAVizGupRMtP99zsyUFXFIs8XGHjIXClm2axID+4jREMsJPtGSqbGB2BR7bi4C8akrD
         UMxk3NBU/XHMloUaiehf6ru3kkPjBppTOpjNpflrvgZpY1usm9St8qgEYhHNNQ/cirdf
         1Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910002; x=1795514802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ahOovwjDlDqMNZ2Yyn08XyrzZ+sm+Yb+nsv1sSKI48=;
        b=dXI7WPem9rFY7ejq75XWOV/dFFDyKf2PaJQd1QzI/vM/UyFFM4aawAhzRvNM7KKTuA
         gAm1b3mCnyvoSDUxdQDA+MFLTnFGQulBOpiCcMmqHbPWomeYv+BNWM6e9J7a77kR4awV
         552yAOS4jDgUqUKKy0rOZGhDfav0CvPqIcY38zieyWpeejt4dkJCQLfVsCqjzbz650dm
         /9gFVz/a6obOSTN3JiJrpshMZySe553VyRHgXcRPHdeNC2V9QzJDgbYwvATE0p18lNfW
         M+iwz0xdWFAPN75aSH2d/F2eFyVRv6dc487WD+LUHY0i+biUFxEujZTqcblm2MCRSmqH
         4AmQ==
X-Forwarded-Encrypted: i=1; AL+hErGU26/H2pT25yuMWgvFnoF+TrICVKuJwwSn1QKe7tmM+Kz9VSupxS148C1sAkgI6GGUh5SsIjcyTvt16Io=@vger.kernel.org
X-Gm-Message-State: APuU4Z95RjpeG+rMWdNivhFmMWRES3qTwCuCeUksRYB4Z7EeLWUDkQpG
	hLRr4TxdT4MC6ZKQya9XEGjzDyAzwoGj5cDW+F1XSr172kQGc9BsiyXD
X-Gm-Gg: AYBFou2NgySbYt5+xUrAfgw0SI40PXt3M69j8EWuO8LZrqhZra5+w8ngCWmZg+7FnxK
	ZoJTsCOAmwhmuaBxyrNudRsftKSrH5ub9u/odbBq9uPqc1WxsNzjQT1/qv9mvPFcoStReOnGxE8
	zk/tw4ZS6RtkwL4h5rwmFhDt36JKSE0ACODlG7kv2Neo1I+4UKJQJAVEoweyl9ifWzFQla4orcD
	4GWCC4aROK4qUcQ2C9dXRoBPeg3JvnVbTHOUfA+BcnOMI7wKKQqzfsFyRrHRzrdSdMOSxQcmFqr
	OmWU+SpoTPxTzVg5I3+fCAGhzpieiLWE9InRvGfwC4KT+03Hg1GcJdEahSKnuXQJjUhO+KUHUzt
	51awe7RW7rlYcq863vt6jP/Pz58GMWVgThJdEYF6RWvvxydBHCx06Nfb/lf5i2AAFbPpO5VvsLy
	ZpdfkHfDAxG+7PNK9UPtUUTju8ZRV1xjvntqU5+6j/62xR2lTj3r11JX4QCKBOy8B3tu0xgIZ+l
	BZv5amT9nqeqUEM++9jz1AcHu2netIcpcGFGC/qllKDZuaLU5bq9WtFnhBSr/e48BWTa+Wq51e9
	L0ly71dLRzCITAiqsB94yD5yl5p2UjvzTUn1yiLbq1v37TeGxqHIgJl0fVgoo//n/xuKM6W2PBc
	5uRr377erfAtuo2EjQJDZnwjcwYh7XSfKc7cVEsuHgGiHwCr9v7UZVwHovC/ZVsJ3eWQWSf9grP
	2/4klIGqygPW4xPId+UYwUYxP3voF1364DEjkRY8HtihAbp4Seh12BVUCBqWZqJTgJovLXpXyD2
	B7X7gezjPXCIpoKMxkbfXtSstJ6z0o3Xm5EMP/59pAa5p+/DvA/gyxeKOp08o8r
X-Received: by 2002:a05:6a00:13aa:b0:897:d037:f3ef with SMTP id d2e1a72fcca58-8beb7d1cd51mr11380228b3a.30.1794910002249;
        Tue, 17 Nov 2026 02:06:42 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1d6207fsm5213337b3a.32.2026.11.17.02.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:06:41 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	stable@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm/memory: mark unshare copies dirty to fix MADV_FREE data loss
Date: Tue, 17 Nov 2026 20:36:22 +1030
Message-Id: <20261117100622.807-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

wp_page_copy() only calls pte_mkdirty() for write faults, so the copy it
makes for FAULT_FLAG_UNSHARE comes out clean. Nothing marks the folio
dirty either and there is no swap entry.

Unshare faults come from R/O GUP pins, like process_vm_readv() on a page
shared with a child. If the process forks after the pin is gone,
MADV_FREE in one of them marks the folio lazyfree and reclaim frees it.
The other process then reads zeroes.

Mark the copy's PTE dirty. pte_mkdirty() also sets soft-dirty on x86, so
take soft-dirty from the old PTE in both directions.

Side effect: smaps and numa_maps count an unshare copy as Private_Dirty
or Shared_Dirty rather than _Clean.

Fixes: c89357e27f20 ("mm: support GUP-triggered unsharing of anonymous pages")
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
v2: set the PTE dirty instead of the folio, as David suggested. No atomic,
and the dirty bit then also survives in the other mappings.
v1: https://lore.kernel.org/all/20261116111245.28871-1-danjwade95@gmail.com/

Tested on mainline b3dfbde62cf1, x86-64 with KASAN and PROVE_LOCKING, as
uid 65534. The test gives an unshare copy to a child, has the parent
MADV_FREE it and a control page it alone maps, then waits for reclaim.
Without the patch all 4096 bytes come back wrong in the child; with it the
child's page is intact and the control page is still discarded. Same on
v6.12.117.

 mm/memory.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index ec3d9d99ccee..113b305854d5 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4130,8 +4130,11 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		entry = folio_mk_pte(new_folio, vma->vm_page_prot);
 		entry = pte_sw_mkyoung(entry);
 		if (unlikely(unshare)) {
+			entry = pte_mkdirty(entry);
 			if (pte_soft_dirty(vmf->orig_pte))
 				entry = pte_mksoft_dirty(entry);
+			else
+				entry = pte_clear_soft_dirty(entry);
 			if (pte_uffd(vmf->orig_pte)) {
 				entry = pte_mkuffd(entry);
 				if (userfaultfd_rwp(vma))
