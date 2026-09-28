Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C976F49C4B2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592310; cv=none; b=qNP4mrLj1iF4o3uWqXFv5Fql3xEcUW0DMIlwM/nnXycuwRGH8fUE/kRbGJ9HJrtI82pVUgK8xsiYJdtSV67UFzjze49yxmBx7+aoPvRCY6Y6zJ0+jkKQ+GkW3/U2k5pfrQL76649fKzsc0pdToWWXT6Sz3KR8w0ExxeV+v5fQsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592310; c=relaxed/simple;
	bh=oGs26CgdnC5eP818EtEEmIe1mVDSML2FZor9RaqUhCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EtcCs/ga8kkT6UeEgY+bm3T3phsW7LzMW6YTUJ5OdDt4Z/+adSNS27du4ul3lqFqQkpJMGuQ7udTh4nFag9R5gzARPf/coe1k9PncT9gOpZioWOvUirCuM2pl1IiNQZEVkCbSQyayDPNwsjWt7slaJNQymB/g+cXOdXc3dt1Ms0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enWVDE9L; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enWVDE9L"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1467501a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790592308; x=1791197108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zePSK3NYQ9Uq2qwAbmJwQ8LjQR2v+Q7ZVPo8eNiOxkM=;
        b=enWVDE9LNKM6td/bhrkR7U5sudEp/o1AhJ0t1cOiMvtvXpVlLBLbXDz0WSsUxEbeav
         bxWWPTqT4qMc9zL6qWrDOxMnj3YJVEsxNZb6o92m0849rkEUksA0XG/b0P7ERXapntMF
         MG5vJbpmNNpVmmBN5tt6nlBrzt7bT5VXyhGK6Y0Q2SVF7BRrqY8afFiWuwNrktueA8i3
         LkJNbmrLjhAW6OOYvwuBgQgvTf21Ly8p2CVTHtEXxSxZtFGJ96AF4GlxCySYhLWcCeQa
         0H5PZhzfbFONV0lpEAKGC8vRSA8fJMRa+e9XwMYv6r4NTxRwy0WQWtfyWiFWmZXOWxAV
         BtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592308; x=1791197108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zePSK3NYQ9Uq2qwAbmJwQ8LjQR2v+Q7ZVPo8eNiOxkM=;
        b=r+Pnzyyhnb0nVa5r9BgXwB5mSu2pdSsDIiSLQ8XO0d6O7dq5irEdcC0Gzbrmo9Iyxv
         DBI3NtF+V6nlTmMp85VWbWxaRnYWFIhfq6V+Jsu9x/EMZcGFznfLW2xTKHmNeaRbZW54
         bGoCp7X6QtBcJkbHABhGDJe4eoGA5UUrXChrlbhiqMCfhDpq3iR7ZbBlX+Sus8hBXfW0
         ZpKnXnKrSSaI/rcgekMDfRibuEnixN/5k0TWyCVuPxYWr8oINaJo74eQDfiNF1S0GbwH
         jnCJ8Et1QGtxTvuvCs1guOKgpXJU1OdZ/smv2WZ/8sap7Kw1OkWnShJRbOe2k6WK8iQb
         SebA==
X-Forwarded-Encrypted: i=1; AKwUvByuMefQzAeCqEF/0cEJaD4cHOxAG/1LR+lnNjX5H0DM8tfwNU/7SIe6XTDZidSRXP5YYNXdWzco57yIJmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ05II1Pkg2D4q6/CR16nd15DcC8QIKWtH0dUl4hp8gopwALKAJ
	EsssNfQz9lq8xMjMBUt0wDBXuHo1wkrtcQwtFUDKUnax+WmarLFq7lSX
X-Gm-Gg: AYBFou2zggbUtM/wsZRq+ggcBb0erDV6Z0WS6dWv3Z6bI1l2eCHsJFz+LKiJ3NNQkrp
	sqnKlKdo6ylIUVaCkg9v0xgJhzwwCSYMCrXmNR9IXMuSVot8c7sUG58QjATJbDdgWYbRfI/oOMa
	zm1UqUTBLADTuiuRwCofV8o4iyD5pxT5fYJrM7wBQxIe8/gkiluRnOBTkR7GEVm6ooMCtCjABHC
	cDTnT0iiJQBXlkoSJBVf9yS9Y06bE8fL/eKoQCjzHid4ZQ+ftXmzCqyfo2Ap89gq6uhxsjSapF8
	fkHHrGGms+3jERfiEPUxxnA4+uxdftxzq6S7Z4Zn6mTekeUsNFmqRz1yit6odtWBa9am8ixeWxe
	ANyVU1oR9Ghd5b0A2MMuntejR6zZ2EFiihh6XdfGC5OG4rg1HZgo8yBnuZwNDqkuu/J/v4LWjRo
	67vAYYizDFztCv/m+LSubMm5LY9sxYnvtx2YV70PUdqv0GIn3EI1fhwhNj1FVBC7DLqEnr5YyFo
	baPaTyUFuiBJ7tGcGFtceDS08sFLHQt6O1GTLXg+sjGASwmL7JxbiXfkp/V
X-Received: by 2002:a17:90b:2f8f:b0:3a4:6ff5:777 with SMTP id 98e67ed59e1d1-3a46ff510d8mr792278a91.43.1790592307645;
        Mon, 28 Sep 2026 03:45:07 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm27071975a91.12.2026.09.28.03.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:45:06 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 4/6] powerpc/mm/book3s64: Annotate the subpage-protection PTE lock
Date: Mon, 28 Sep 2026 16:14:34 +0530
Message-Id: <fb81802909fc0e5e17506f900239f97616d2dd2c.1790590014.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790590014.git.ritesh.list@gmail.com>
References: <cover.1790590014.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang's context analysis reports:
  subpage_prot.c:83:2: error: releasing spinlock 'ptl' that was not held [-Werror,-Wthread-safety-analysis]

pte_offset_map_lock() holds ptl when it returns a PTE and
pte_unmap_unlock() drops it. However since the lock is taken inside the
helper, which is not annotated, so the unlock in hpte_flush_range()
looks unheld.

This patch fixes it in hpte_flush_range() by adding the needed
annotation here. IMO, should ideally be added to pte_offset_map_lock(),
once that happens (since it might need larger enablement), we can remove
it from here.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/subpage_prot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
index 37d47282c368..d641c35c408d 100644
--- a/arch/powerpc/mm/book3s64/subpage_prot.c
+++ b/arch/powerpc/mm/book3s64/subpage_prot.c
@@ -73,6 +73,8 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
 	pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
 	if (!pte)
 		return;
+	/* pte_offset_map_lock on success returns with ptl lock held */
+	__acquire(ptl);
 	lazy_mmu_mode_enable();
 	for (; npages > 0; --npages) {
 		pte_update(mm, addr, pte, 0, 0, 0);
--
2.39.5

