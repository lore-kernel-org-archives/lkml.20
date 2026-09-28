Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6B49D5B1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592305; cv=none; b=KjVlophD7LrWiJ6dakP/Z2Qlv07316o2OHhpuxSJvXSjcXP/J1DU8rhfRAjhxTGqGcnHdEQT4JgF6y5+5OjXXqLUzck8e2CNBE8RpbFCjZBwJjbxEfQa4NNuLgaXFGV5VR/qKADkqP8/BbcQQvImVMZf3/hek+PQS5F3C880Mis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592305; c=relaxed/simple;
	bh=byj9TbjCacOvGMOT8chydp52I0ZD2U1fDpFchtDBlKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VR0KoGYy6JyZA8nrSHSs/vU1lBSBAR6Ub1FKymeTTHrIl/oVUHE8n6WcPiLT3LVEmgIksz+RIx5DkfGhQxlLiKsJFt7ZMPIyfy/R8Oi935QSGLI6d37A1urljV0IAF6hqFBeQ8em/PZ1C5L41mocth7TR3Ve1UemsjQSwDBJ+b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdldcLNi; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdldcLNi"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso2064614a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790592303; x=1791197103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nhZd7N235luHnJfPOH6Xak26dN5Lj4klTBss1fGrjg=;
        b=kdldcLNijxMPwki4Q0zsEHrmbaybdSUytU0Q+6nYkbO3R3wq2++HKwE1kUB0X9GfWB
         z7LZUkyhJebXIcN8GLIwJDyJyRloPjnNUelCkDVfNCZl7UY+cFKoaKf4gn7r8iW1xTxd
         ULze85NU0B2S1nI4lMXY2Je+14c34XEBJu9oHdvlBdmcBW0RKe1+0sB0iua2KaDFSXKh
         niS7CFWh41lElr/jOTk+KDdqtmBJ80Zyt9YxfUIcBH7kZwIPBsMXF/EG3ZbNXEuMlOt4
         9cidmGaSiCn2/LE5+tGym/jCatZXVBnbBGw+qggTpj0f3Q30ekKl6WBYjFUAhWLt280B
         FmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592303; x=1791197103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nhZd7N235luHnJfPOH6Xak26dN5Lj4klTBss1fGrjg=;
        b=ZBF9lHdbGaiJQVQblqnQBBQxPqRE8exG67Mc34UslmIXlrN+zoC+DbT3BxZBFjbQg7
         1CyAHPZjmb1/pD5cxJmRo3nyYNK+ApqeVrLHS24OG5kl+fA+lRrlnJ7qsq7q65HgCo3D
         9Mxy/uYBxmPX8Otr8L8+2fhxfJJZThuhLwuZ6MwIkYrWLsrK6vw8WQRBq/NlYFlYyPbr
         LlFSemSsbjAQRwps3e4reI5x32jjiDPzCm4iicuWgolcToIJjUnejUEFW2FqdBDCrt2l
         QVIPGh6dCXPwQ8PsQLzC9/5Bn1TWJQt+ZwdepY2wFIyaUBlcnsjJL2+D/NP5rHMeJZDF
         V6dg==
X-Forwarded-Encrypted: i=1; AKwUvBzidq2WT/UBXTHb4VID7EKp77XynUM+IH9y/33aJfxIMty9HV/V1dfvZ8Fl/dPiRbdUqDGx/CFUjCwdy24=@vger.kernel.org
X-Gm-Message-State: AFq9FYL81959t4uUElPTYL6+gvf8R4H8aJn24OzG1xzG8pq3gQWXZOH6
	gsAutysPfRtBDjtPKb+D5G37GN4jchK8AgXCiojVI42ZKqxqfaMpcjtz
X-Gm-Gg: AYBFou1bNlGt57pnHMPW5YreRr+We/oSnZ1eQzSPJ0t3wOppgRnms4FrkvLORljLzu7
	1NvL6C8fwVTWUKsFvsXxxjsUDZpBldxS5yQT7fFa1oYMDM5g9HEgA18eEweQ3zpF4gqMMQJRG1l
	rdVIGKeazAOBME+ID0p+ypqJduK0WBufLUyJ2FVbaSOJzjazn3C8m9M5MFmiwKcnpWq3lDP0wnd
	8VbdDByngW4Fw/4iZUrzrHmk2lFzzrLe0Wp6g/3n5Eabyssuf0UU334MEUSlIxO5nOadBLRXKUq
	8ZOITDbKgi7/CqYmkZucxVuRTmDGAWVGbPpv8uqZhIre8Oa+w5hCr8/IfU0URf7cgmM6+wZXhcl
	ijZfGOTZoJcmxZ1ATdcoWiGrzIc1CUIK3J6gmjj9mv127tFKo05ztqclGtWNduYHV805Nti0MD5
	uD1mnQNRKFDw2L8UbgT5tinqO4/IfmrkJE0QETVtd4IrHRutq7d5JkHmFpoVn+dYCeV6Wj6AUwe
	fFQlFuWDCPAWYtSBVJT4QfxBdZfbqUWXFQYOZVKo4957+jZiuipfxhpAn7X
X-Received: by 2002:a17:90a:e7c6:b0:39e:2f57:67c7 with SMTP id 98e67ed59e1d1-3a098d45c0dmr11577243a91.3.1790592303327;
        Mon, 28 Sep 2026 03:45:03 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm27071975a91.12.2026.09.28.03.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:45:02 -0700 (PDT)
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
Subject: [RFC 3/6] powerpc/mm/book3s64: Rework native_flush_hash_range() to remove conditional locking
Date: Mon, 28 Sep 2026 16:14:33 +0530
Message-Id: <6e1255f9927b2714a5f18c15971a70791b26b068.1790590014.git.ritesh.list@gmail.com>
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
 hash_native.c:851:2: error: raw_spinlock 'native_tlbie_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
 hash_native.c:868:3: error: releasing raw_spinlock 'native_tlbie_lock' that was not held [-Werror,-Wthread-safety-analysis]

This patch reworks the native_flush_hash_range() function to remove the
conditional locking. It fixes the clang context analysis reported
errors. However, this also simplifies the code in native_flush_hash_range()
due to various if conditions.

No functional change intended.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_native.c | 88 ++++++++++++++++----------
 1 file changed, 54 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 6bad0545b57a..9b4eea35b540 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -792,6 +792,54 @@ static notrace void native_hpte_clear(void)
 	asm volatile("eieio; tlbsync; ptesync":::"memory");
 }
 
+static void native_flush_hash_range_tlbiel(struct ppc64_tlb_batch *batch,
+					   unsigned long number)
+{
+	unsigned long vpn = 0, index, shift;
+	real_pte_t pte;
+	unsigned long psize = batch->psize;
+	int ssize = batch->ssize;
+	unsigned long i;
+
+	asm volatile("ptesync":::"memory");
+	for (i = 0; i < number; i++) {
+		vpn = batch->vpn[i];
+		pte = batch->pte[i];
+
+		pte_iterate_hashed_subpages(pte, psize,
+					    vpn, index, shift) {
+			__tlbiel(vpn, psize, psize, ssize);
+		} pte_iterate_hashed_end();
+	}
+	ppc_after_tlbiel_barrier();
+}
+
+static void native_flush_hash_range_tlbie(struct ppc64_tlb_batch *batch,
+					  unsigned long number)
+{
+	unsigned long vpn = 0, index, shift;
+	real_pte_t pte;
+	unsigned long psize = batch->psize;
+	int ssize = batch->ssize;
+	unsigned long i;
+
+	asm volatile("ptesync":::"memory");
+	for (i = 0; i < number; i++) {
+		vpn = batch->vpn[i];
+		pte = batch->pte[i];
+
+		pte_iterate_hashed_subpages(pte, psize,
+					    vpn, index, shift) {
+			__tlbie(vpn, psize, psize, ssize);
+		} pte_iterate_hashed_end();
+	}
+	/*
+	 * Just do one more with the last used values.
+	 */
+	fixup_tlbie_vpn(vpn, psize, psize, ssize);
+	asm volatile("eieio; tlbsync; ptesync":::"memory");
+}
+
 /*
  * Batched hash table flush, we batch the tlbie's to avoid taking/releasing
  * the lock all the time
@@ -845,41 +893,13 @@ static void native_flush_hash_range(unsigned long number, int local)
 
 	if (mmu_has_feature(MMU_FTR_TLBIEL) &&
 	    mmu_psize_defs[psize].tlbiel && local) {
-		asm volatile("ptesync":::"memory");
-		for (i = 0; i < number; i++) {
-			vpn = batch->vpn[i];
-			pte = batch->pte[i];
-
-			pte_iterate_hashed_subpages(pte, psize,
-						    vpn, index, shift) {
-				__tlbiel(vpn, psize, psize, ssize);
-			} pte_iterate_hashed_end();
-		}
-		ppc_after_tlbiel_barrier();
+		native_flush_hash_range_tlbiel(batch, number);
+	} else if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE)) {
+		raw_spin_lock(&native_tlbie_lock);
+		native_flush_hash_range_tlbie(batch, number);
+		raw_spin_unlock(&native_tlbie_lock);
 	} else {
-		int lock_tlbie = !mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE);
-
-		if (lock_tlbie)
-			raw_spin_lock(&native_tlbie_lock);
-
-		asm volatile("ptesync":::"memory");
-		for (i = 0; i < number; i++) {
-			vpn = batch->vpn[i];
-			pte = batch->pte[i];
-
-			pte_iterate_hashed_subpages(pte, psize,
-						    vpn, index, shift) {
-				__tlbie(vpn, psize, psize, ssize);
-			} pte_iterate_hashed_end();
-		}
-		/*
-		 * Just do one more with the last used values.
-		 */
-		fixup_tlbie_vpn(vpn, psize, psize, ssize);
-		asm volatile("eieio; tlbsync; ptesync":::"memory");
-
-		if (lock_tlbie)
-			raw_spin_unlock(&native_tlbie_lock);
+		native_flush_hash_range_tlbie(batch, number);
 	}
 
 	local_irq_restore(flags);
-- 
2.39.5

