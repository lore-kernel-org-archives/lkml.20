Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EA23CE0A0
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791083340; cv=none; b=GahAE/yLFIFlz2Llix4uZ3QnUS35/sF9dJdvHwe13Cj1+P87/cdvc8wKjNLRBm05YZ3zfXa6KWwndc/lEGekG4EeOiKgzOx1zHnRGi+Av4qfdKXSjMXPTy3o3VfM5sPgd/TSidMmZG3jngiBG1rRXMFFTH/Tw/F1QafiMv1xXE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791083340; c=relaxed/simple;
	bh=Zp+qhYqMQRqCv6BwNrcY760zp89XnNnv158s2z7q+38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FIu0Wi55AkfQQq6zmxJXL9l7P8JW8s3eO1XifqHJ/dq/qlK/fHKjuBTp/PETScsl9vqDZfqVmq9Q3MQV4kGhsTmHuDQMCbZVSGPSHIh7KISUVPHQ1edAd9h9aurBmsh/9X2pvsrMeGlsMPRQ+GvRdp8acGwRdNtxF8Un9VJAFKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tE8PCqW3; arc=none smtp.client-ip=91.218.175.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tE8PCqW3"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Zp+qhYqMQRqCv6BwNrcY760zp89XnNnv158s2z7q+38=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791083336; v=1; x=1791688136;
 b=tE8PCqW39VFf9eNWbocwa/um4Qf9yGxhM6PKF4E+5H50qOTkOHvDGBO9BC1Z2tSHmCpIBaAV
 b8vUmp/pUcZ2nvj4a+giBDlnFopW6tClAxLbWO+GZk3jtv/xGHdWFaveU25kcK2GI+ancW3v/be
 vFeIGkE6zAX9A+fELraecCyw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5eb3b10a722064f6;
	Sun, 04 Oct 2026 03:08:55 +0000
X-Mizu-Trace-ID: 5eb3b10a722064f6
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: usama.arif@linux.dev
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	ying.huang@linux.alibaba.com,
	baoquan.he@linux.dev,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	liam@infradead.org,
	ryan.roberts@arm.com,
	vbabka@kernel.org,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com
Subject: Re: [PATCH v8 00/30] mm: PMD-level swap entries for anonymous THPs
Date: Sun,  4 Oct 2026 11:08:44 +0800
Message-ID: <20261004030844.90483-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261002095503.3585565-1-usama.arif@linux.dev>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey Usama,

Staring at the swap-entry bits across architectures, and RISC-V looks a
bit off in that regard ...

With Svrsw60t59b and CONFIG_MEM_SOFT_DIRTY=y, setting swap soft-dirty also
sets _PAGE_EXEC. A migration PMD then looks present ... so the fault
handler skips the migration wait :(

And yeah, this is a pre-existing bug. I've sent a separate fix for it.

https://lore.kernel.org/linux-mm/20261004030312.90163-1-lance.yang@linux.dev/

BTW, could we also add more checks to pmd_leaf_soft_dirty_tests() so we
catch this kind of issue early? Setting a swap flag shouldn't make a
non-present PMD present, IIUC.

---8<---
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 863111c6d4eb..80686e2baaa1 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -762,7 +762,9 @@ static void __init pmd_leaf_soft_dirty_tests(struct pgtable_debug_args *args)
 	WARN_ON(!pmd_is_huge(pmd));
 	WARN_ON(!pmd_is_valid_softleaf(pmd));

-	WARN_ON(!pmd_swp_soft_dirty(pmd_swp_mksoft_dirty(pmd)));
+	pmd = pmd_swp_mksoft_dirty(pmd);
+	WARN_ON(!pmd_swp_soft_dirty(pmd));
+	WARN_ON(pmd_present(pmd));
 	WARN_ON(pmd_swp_soft_dirty(pmd_swp_clear_soft_dirty(pmd)));
 }
 #else  /* !CONFIG_TRANSPARENT_HUGEPAGE */
--

[...]

Cheers, Lance
