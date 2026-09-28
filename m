Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A1B49DBBE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592313; cv=none; b=tQMd4zRvjMBEuX7ENpazipo0zRTQtwtSPKjfRUa8X4QeUD17VU1fWaw78gsmTymi88S8FDps+CpNFzj1y5IxjMpKStpTh/MoeEA+7Qm6A8gVUsth3DZjVA4vfEqkMhKMGhYPEavKxZ6vGdMjNYjKXx1TynsUitlqGHoyQDh95k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592313; c=relaxed/simple;
	bh=46KW7jlb6ZAP3VKw+KAEpnMDi8hj0qhLKIPWEXdIWc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fgiiqtxZiahf6oUI+sdS3Rfq2XUGJhPqCX5SfEGVNXUukvaPQFw6EZ7xEr5uf6G5hcyvcFkeFx8+F5n8uyzjGIr0wGQtWW2JgLdZqLmM+UoXwqpLqe7lJa5bTQ8FuNIpKz0OtXEJ+iIzrpZLTTQJRI+TnDTwjVyxtV/S9hGzO7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBKvhxGA; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBKvhxGA"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso2351489a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790592312; x=1791197112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRWWslO+/BIQXfzsm8/OFu4CVVZ4h6+o4ax7yTxGRKw=;
        b=FBKvhxGAKCNLuLkwXdYSB0Nk/PxhDGfkwOFNn6QTtGoPsyx64TTmwGS4/Lgul0r69Y
         /42o+IoT68d5M/ZlpjD8U5OljPhRLcjoqsakQwywYi8Gh0dxs8uJojjwj/HRPaV8u+8T
         kXwCwhNjVqPIeZviigv8gcz7kG2uclMUuTMcjhLcXSFcN0WkjWwh9O2xfONcFZiiOeYL
         bDAK4UX46KVPaEQzxCq2Q8Hx2eNHno7gpHcFKcHFfYMHJ6OngENx5utzwwNLNRtap9DB
         mn0hAN7gBw8HeIMpjlKAafjw7Xk0o7GNtu4u0TBXsKKRpKiFxbmY6Qp1CjqFbTQsgl4Y
         aekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592312; x=1791197112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FRWWslO+/BIQXfzsm8/OFu4CVVZ4h6+o4ax7yTxGRKw=;
        b=cD1aQmkOkBKXx+FZ5a/yNjn3lJW+l5Cpcz5fulR4bW5cqOZd/MaQ1lXMSH2xaSJN9o
         Ji/LSMTIDp/+FvAuknL52cqzVK5MIcrmghKNXCZtArEm1drETLGxRyiAis2UgGh3RY9g
         8F0aAZwoNBXpB4YnraOKXXmYQ33OS/GjY/xO3UKQaFBlevN+xPyxwSX5WE6AvYg0YWNS
         YAWgEAxM6YwG0Nm+9xAvDsX+kWkr4BwDBlS6IA4hY3XvT/S9BjBgYT3j0mJi5ib1nXor
         bCJWfOnqvUnq95uMigRMrFcxvjDwUmFfAjzIJMOIm27eG7gNBhaf6E7nsbsq5yQw6Dop
         o9Eg==
X-Forwarded-Encrypted: i=1; AKwUvBwc/LsZdo03tEwJ3h4IZ56KnIcuLlLz0c4a/z4kEtWlPR/h1Z1lazfVzM8xd1PthbAY3lBXBPps2AETZeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqbjgJ1tcD3sC6ISeZr++P6VHNuge1m+DlMR6J2D9ZWCpPVAF/
	PpN+pbOViZL2vP1tm/OU503+GARL4T0mqkFTaKmhiM/jZKVrRjQGIExx
X-Gm-Gg: AYBFou2wJKCxE57BDwlG1NfzNsDiKF/d66Jii2o2nL3Vx45MXBXQr0H5p8xaOUd0p9L
	5nxbnO1D+/kUy5QPyoISzlJiYPTW+s2uPFO4W0jRTwuZ5mei5mS+4mOKw8dvLa3umOsgZEJGuZ4
	ibDgEZszydsuG8AnOFMz7Pg0gau6Xmq1sOwHeNlEGlfuZQdslVKEALGws7dqa2RNZRRmfFN7wje
	svqJHkrfcjN0k73T5Vx6hghTU9NkGUiIfTrLZP/zCrD1W0FxnK6bPA2dFOl0dx/l3omrm+Kin8a
	BAbooU430VOPo2TAjz5fyeJ82AF023ipA5zRPv+tWtl3RWNe83UWyvJupZSdjkudoP7IcFDcB0J
	4AaA1Soy1Cl01+LTuMYEPOKR4u3Q4IbHqfVRS8w0I6nv7nkyxUHtF/JQGJ1OUwkMoLLdc6sV+AJ
	B1V2vTrDBmw8P5hpKHidv8O4/l1CTJoZYuXA3q2ehqw4HEe9i4R7ZrM1DXFmzDuqIBMpMXpbgcG
	dGuCBg4rLPo83KsL1/hjrPCWnfZE2tQHYURNB0PyFHoSNS5DASyzFzT6w6vJg==
X-Received: by 2002:a17:90a:164f:b0:3a0:a912:e775 with SMTP id 98e67ed59e1d1-3a0a912eb90mr5962250a91.54.1790592311558;
        Mon, 28 Sep 2026 03:45:11 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm27071975a91.12.2026.09.28.03.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:45:10 -0700 (PDT)
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
Subject: [RFC 5/6] powerpc/mm: Rework nohash TLB broadcast locking
Date: Mon, 28 Sep 2026 16:14:35 +0530
Message-Id: <d14bf0c33cac4a54601e0c2e4019a373ba342530.1790590014.git.ritesh.list@gmail.com>
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
  mmu_context.c:141:2: error: releasing raw_spinlock 'context_lock' that was not held [-Werror,-Wthread-safety-analysis]
  mmu_context.c:147:1: error: raw_spinlock 'context_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]

  tlb.c:257:4: error: raw_spinlock 'tlbivax_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
  tlb.c:259:5: error: releasing raw_spinlock 'tlbivax_lock' that was not held [-Werror,-Wthread-safety-analysis]

This reworks the locking in __flush_tlb_page() a bit to satisfy clang
context analyzer requirement.
Also steal_context_smp() drops the context_lock, so it needs to be
annotated with __must_hold to inform the clang analyzer that this
function holds the context_lock.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/nohash/mmu_context.c | 1 +
 arch/powerpc/mm/nohash/tlb.c         | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index 28a96a10c907..bdbe1f55f388 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -95,6 +95,7 @@ static DEFINE_RAW_SPINLOCK(context_lock);
  *  -- benh
  */
 static unsigned int steal_context_smp(unsigned int id)
+			__must_hold(&context_lock)
 {
 	struct mm_struct *mm;
 	unsigned int cpu, max, i;
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 07a2db16c2b1..9297549aef41 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -252,11 +252,13 @@ void __flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
 		/* If broadcast tlbivax is supported, use it */
 		if (mmu_has_feature(MMU_FTR_USE_TLBIVAX_BCAST)) {
 			int lock = mmu_has_feature(MMU_FTR_LOCK_BCAST_INVAL);
-			if (lock)
+			if (lock) {
 				raw_spin_lock(&tlbivax_lock);
-			_tlbivax_bcast(vmaddr, pid, tsize, ind);
-			if (lock)
+				_tlbivax_bcast(vmaddr, pid, tsize, ind);
 				raw_spin_unlock(&tlbivax_lock);
+			} else {
+				_tlbivax_bcast(vmaddr, pid, tsize, ind);
+			}
 			goto bail;
 		} else {
 			struct tlb_flush_param p = {
-- 
2.39.5

