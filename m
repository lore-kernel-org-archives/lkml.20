Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CB049B215
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932179; cv=none; b=CuFj5/H3271QxO9Wl9IUpDVVMW98YAMxrmgNgPaEGNnyfrmEalTC5fDnF4c9nTpz7R9ULSsIxjJMos98/QWrArPCJa4Un8PfjNELAJM8/Pn8j/PslG0PT2LadjXu2SW7Er2XTI4Ox5YYL9OycVhawCMoGGVspZ/G5+SmBzsV+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932179; c=relaxed/simple;
	bh=RsU+ZCZtZcs7B0IzQi38/te1fsHGikwxT7Hdf7V9Egk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I5fRhKakOiJutoUBSPnrX/3FT3Ss53oqBazD/pBek7US46/Pj04ONxryg5ZUxMHWt6GwAVSFW/aUQtX2fGuVCFjBZl+2Yl16TxP8hwinnmGDQRao91mll045XJBXH7ZJ1Shelr1uXPmxKPFxv2RXdAx7dIy3VfO6vrL/LNkvcVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjiGyi2/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjiGyi2/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04174C2BCF4;
	Tue, 13 Oct 2026 22:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791932179;
	bh=RsU+ZCZtZcs7B0IzQi38/te1fsHGikwxT7Hdf7V9Egk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=hjiGyi2/DvAkEmLZblH5iWWZy/b7eXxnYrVZVI08q+X/bXroz3lr9nOGMLhZ9uqqX
	 n8Jvla3YzTzONpFwO1PWSZFcNL/eVnElFp9CYw+M/J+lA1y2B1XFZYDFWmufH1AyCz
	 qbd3Mwz8WtzQWnqlZbWk41Z4HeslQPHbIswmSO4FfiJ5TRer7oMbsQLggNTItjlkHN
	 M+qZH93/lISOHXPJI5ggT4Ha9vUdTnAUbV5YwjfoMaeAGVXiqbdFvmk3THQBPNZA5L
	 ehsPabwbf4kMv9R6HTqhreusI1Ly0ECj5PD4ED6ioyJq0KBcTeZbMkPiXuJe+kWYdU
	 UoTMSJnK3ar1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C4FCC6B15;
	Tue, 13 Oct 2026 22:56:18 +0000 (UTC)
From: Alexis Bouzigues via B4 Relay <devnull+BouziguesAlexis.JohnDeere.com@kernel.org>
Date: Tue, 13 Oct 2026 17:56:19 -0500
Subject: [PATCH] mm: nommu: set MMF_OOM_SKIP in exit_mmap()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-fix-nommu-exit-mmap-oom-skip-v1-1-cb957cdbfcc3@JohnDeere.com>
X-B4-Tracking: v=1; b=H4sIABK3zmoC/x3M0QqDMAxA0V+RPC/M6iiyXxl7aDVqGGlL4oYg/
 vu6PR643AOMlMng3hyg9GHjnCrcpYFxDWkh5KkaurbzrnU9zrxjyiJvpJ03FAkFcxa0FxeMA/k
 hzv0t+gnqoijV/r9/PKtjMMKoIY3rb5qVF05XCbaRwnl+Ab86sxaOAAAA
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, 
 Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791932178; l=1299;
 i=BouziguesAlexis@JohnDeere.com; s=20260527; h=from:subject:message-id;
 bh=hVmRWa/BeiGIHAxsid1KBCGZvcLmOYCtQjDsyT49U1Q=;
 b=j/+/Nm1eIrvkAXqIYV10l74NOMUNM9pNumM9DwYrXfv8vOfeIwzsbiovirVM036T7KgOoK0N7
 afOWB8waOp/Bdr5mYF9JJc3//T0l4KQzImC2s6ilcNMo4yoYzbz2reU
X-Developer-Key: i=BouziguesAlexis@JohnDeere.com; a=ed25519;
 pk=5KJ7ArL00x5flpPhi9zRLC2p88V1rZXDQ5SXhpRvTDk=
X-Endpoint-Received: by B4 Relay for BouziguesAlexis@JohnDeere.com/20260527
 with auth_id=797
X-Original-From: Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>
Reply-To: BouziguesAlexis@JohnDeere.com

From: Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>

Commit 212925802454 ("mm: oom: let oom_reap_task and exit_mmap run
concurrently") moved setting MMF_OOM_SKIP from __mmput() into the MMU
exit_mmap(), so it is no longer set when a NOMMU mm is torn down.

As a result, a NOMMU OOM victim that has exited and freed its memory
keeps the OOM killer from selecting another victim until it is reaped.

Set MMF_OOM_SKIP in the NOMMU exit_mmap() once the VMAs are freed, as
the MMU version does.

Fixes: 212925802454 ("mm: oom: let oom_reap_task and exit_mmap run concurrently")
Assisted-by: LLM
Signed-off-by: Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>
---
Restore MMF_OOM_SKIP on NOMMU mm teardown, which was lost when it moved
into the MMU-only exit_mmap().
---
 mm/nommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/nommu.c b/mm/nommu.c
index 498e01ee40b0..913b2a1b5b3b 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1555,6 +1555,7 @@ void exit_mmap(struct mm_struct *mm)
 		delete_vma(mm, vma);
 		cond_resched();
 	}
+	mm_flags_set(MMF_OOM_SKIP, mm);
 	__mt_destroy(&mm->mm_mt);
 	mmap_write_unlock(mm);
 }

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261013-fix-nommu-exit-mmap-oom-skip-b8e68bf34b6d

Best regards,
-- 
Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>


