Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED4C49D589
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592297; cv=none; b=GVOHfkGPSJRYzWHnPmj1rlKvmD/D0xefowcQeB26Uq4CttMw78s3dGRW679osyVYGVPMkyfFp7Z+xR2ENO7q35cw6ccKeLdBx0ZpzJIiQk5v8LWhARpmGX5+4NMJCd2+Qx9hYejVZkgWGuHxJyJ9DDIVwgfzDht5MVVSLHXXxSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592297; c=relaxed/simple;
	bh=aFpxPZsz14xQbIPUYq3Ja2bSvzi1kZGwF2KicDkmM+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PpaD+G/adsJKbSGmhPeYN/Gh7/BvQ6wXof5Hr87j/DLLN8ldQCDCx1OHA9wuKPs/fNjWJ0PbMBImBc360nm/iSa1b6SU3bRtmGMH889VyDqv/jFTexPVBXqA0LNctQitACS4x057jdwtbucL8M1DZ34nS5zRMDGk25VLfla1mA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T33PF7hm; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T33PF7hm"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1877818a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790592295; x=1791197095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXrsxqEkO2pMgqNAsSSYfKdxs+2sCp96RSLMIL+tOrE=;
        b=T33PF7hmHpnrjKohA4TKS9MrEogNuzsI2KqKqsQPMa82Hyk+jofn8fOkIWFqt37V5a
         Zx7IW+QBHdFzWdULDdt3K+4kcG4lsoRdOlLc0JAjtuYd4snpYmCjFQVaQtk6jvA9Ej1E
         Qpi3BAudyp/Vr7vzL+Gal3z/NU+yOtbkcleEkhAtnoj/2Un6BbOm+hIDyy0lKn9JwAG5
         BYxs7quyoZ5qzNqz6koaqX1FSfUlMx2nUxsmgXZk4dCfz+kT2BabOhJhnF1Po2VCBaTB
         To4+tBysTLXfCmbA21NDOWlMKdVB/fyo9qo1RQrWaKm/rx8s4WSaQdGM+xLDxbfiqVDe
         1uHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592295; x=1791197095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXrsxqEkO2pMgqNAsSSYfKdxs+2sCp96RSLMIL+tOrE=;
        b=jfk0oELefvKNCLywvWAJU3gT3o2IPai1fHx4/Sybx8BPhA2jdYSfDkz9m4YVKm7S92
         t+ePcaVA7BXxFlSqvyqhmKLCSRKIfwli7vuLQwR3cI5hOYZ6hkczgnIXb8Rgm6YWE8Ju
         N2w5bvxb1caZh79xNaYVNfF2aYJgcjaBOYBIsDwhIZ06H91tOvXBkshnr92v+WDbO7oJ
         xkJaR2pc/AwhL0m9oX2hojuZ5MQIIh6k1fXtRHx5IzyQ6fVxymp8rhH6ODnpfNIzrbYt
         yvFbdbeEMkOyxXvZK8R+6uAxNY+WQ+Le9psv1ptFHHGjGDaDRnW6hYx02lEQHoT4Q0hx
         OQKA==
X-Forwarded-Encrypted: i=1; AKwUvBxIP+AWfe/Wcj9nrDrFdGfauMf+cSHC39LRSqN/l0zzbAWJRuLQ8N+GsgaMJIW3G+F8Xz7cXLO4iSFtf7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRxgA/C87bZ+y/Mlirc8BTDv77g0XCEofNlykXAgRyntJpDPYJ
	zPRJI7CtrAtBRswExdZLV9gkdo8VnjLYUCwskjDewYgCL5EVD7nxsiN6
X-Gm-Gg: AYBFou3ryb0Zfd2EMMVxPW4Zq+Lh0RXlsFofoH5mAoe91MZZinO5H0onf5UJeQZWiHZ
	f3sBs3u9+LZSt2eR4gCUCp007PuJwRaGMNfJnAzSBdYUXPP3Ps+YWXQM12OTvXNKRJ+FGvF6bsX
	S/a79bQMbImmfckFcj0t8SF9hjoIBnv1JgN/lccJQ/LB6oXQAv7wsOrA9S3DLsw6B8MEanikcSL
	T/jLpC9DCpcjZca6YuopvXubSsS9qcy9x8vB+uiakjktma9DTamTgRkchv7dIailyrxqpJ802T4
	t5vAJdKKzXEmV7kCD6v/EVjYP96Fz7OlZuQyuUCzXCoYEMhOx7DACmEkYUwjA/rJ/LRhDLkEEei
	jpr22TWI07OPDn41SNMMysmxWiVMNjqnHfJUSLaKVnOGL3Ew97py1DsSQR3RcGWeZsGT/pDdIOM
	eXvJJZinsFUHTOrWZAV+x0IwCMkKfHchtE3ydlHyn+VE0yJjja3OX9IXVeIORMNF3oznxcv0qb2
	N4By7zZJXXIhdGZzocgDppBGCXzVsx+LAKsvbAckGEiQTY/CPwcNdaDbvgs
X-Received: by 2002:a17:90b:1845:b0:3a0:e8ac:9f7e with SMTP id 98e67ed59e1d1-3a0e8aca8d7mr4580986a91.35.1790592295405;
        Mon, 28 Sep 2026 03:44:55 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm27071975a91.12.2026.09.28.03.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:44:54 -0700 (PDT)
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
Subject: [RFC 1/6] powerpc/mm/book3s64: unlock RCU before returning from mm_iommu_is_devmem()
Date: Mon, 28 Sep 2026 16:14:31 +0530
Message-Id: <04e4dafde56fe4b055fbd763dc0e119862073c6d.1790590014.git.ritesh.list@gmail.com>
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
  iommu_api.c:380:1: error: __ctx_lock_RCU 'RCU' is not held on every path through here [-Werror,-Wthread-safety-analysis]

mm_iommu_is_devmem() takes the RCU read lock to walk the preregistered
device-memory list. On a match it returned true from inside the loop and
skipped rcu_read_unlock(). Hence fix it.

Fixes: b5952f8125ae ("powerpc/mm/book3s64/iommu: fix some RCU-list locks")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/iommu_api.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 60d00c9e7f19..56d9aa6cc8e2 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -356,6 +356,7 @@ bool mm_iommu_is_devmem(struct mm_struct *mm, unsigned long hpa,
 {
 	struct mm_iommu_table_group_mem_t *mem;
 	unsigned long end;
+	bool ret = false;
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(mem, &mm->context.iommu_group_mem_list, next) {
@@ -371,12 +372,13 @@ bool mm_iommu_is_devmem(struct mm_struct *mm, unsigned long hpa,
 			 * and the caller needs to distinguish this situation.
 			 */
 			*size = min(1UL << pageshift, end - hpa);
-			return true;
+			ret = true;
+			break;
 		}
 	}
 	rcu_read_unlock();
 
-	return false;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mm_iommu_is_devmem);
 
-- 
2.39.5

