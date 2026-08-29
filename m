Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D273D332A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020337; cv=none; b=frVFCynpdrhnvkDvnbqvCh/LRDsfvDZsjtMbtPIwo9nqo9MuoxtG0DzWHkYEdLA+V4p+SSoB2b2ztMGWuCIaFn0Pp4HmFl8afXK8LZmVeQb9WmARbQ13IAKRVHmZN3DwbR4M5TcLKNtG1XFypo5HunvaWpjaFdsaeasNcb4RvAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020337; c=relaxed/simple;
	bh=yzDb+syqlRp1iiWqbQ32I4hvml+kDYNoe7IqTIqFl08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIj8wEgCfLiO93ZYL/lHQqTObZOatOkskYGe7Dj9Q3VJ/QJdGmgK/6QU3Ok5PxiRqvRE6to0wwNNo4jBdHp9LdzqikdFoRqUbGXSOWHFZUsQXHrqxG0fSdQT2kqO17nHNo47JaRjCgS5W9SMwaBeV1lKQ1OuOqp5iNrNKkOGII4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ecN2o4Sh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sOvFcWLh; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ecN2o4Sh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sOvFcWLh"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1788020327; bh=jyod2vdapIzVT0jrWX2kWlx
	Ck2r1I9RyX4lHKcfNBXo=; b=ecN2o4Shi6l2pDby7fwRu5qcnZQ8Ne0VMVU7qXw6VLLLamgkua
	a23zPE9fOys6BsxN9aujkU+6ZmK5WeWu7aE+PFEfIAVh7oRRR/P7D722+7WbXYoV4gtummVv1cA
	VCRZCaGy5U3ghaY0p8kvoeTa0DthMVTts1KN4jri5PnCk8zMnA41sfezyqbkToK/ABYI+XYGyUq
	gwT947rp1TVK1K8wLiOF+2ufSptGFsbx781HMSaNIodq06MhprEO8LtbYERCw3HdMM1rsv8cb1L
	gszeJh0B0r8uiybowCEa38QUd0eonmuV+jI8GnIW89z0SDMPwhQMrfEH4eKIIdc0zYQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1788020327; bh=jyod2vdapIzVT0jrWX2kWlx
	Ck2r1I9RyX4lHKcfNBXo=; b=sOvFcWLhN6pursK8MMjh2wJ2g2S/XQT7qMM3VohcCubJ0aSaiQ
	+8u6g4O05mVTLYR2MYCUvNDuiteBIOoka/AA==;
From: Bradley Morgan <include@grrlz.net>
To: Frederic Weisbecker <frederic@kernel.org>,
	Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH] kthread: remove worker->task self-assignment
Date: Sat, 29 Aug 2026 16:18:48 +0000
Message-ID: <20260829161848.20635-1-include@grrlz.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260829161150.16301-1-include@grrlz.net>
References: <20260829161150.16301-1-include@grrlz.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bradley Morgan <brads@mainlining.org>

All kthread worker users now create their workers with
kthread_create_worker*(), which sets worker->task before the worker
starts. The self-assignment in kthread_worker_fn() is dead code now.

Remove it.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/kthread.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 63beb59b7a3d..18bc702e8d2d 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
 	struct kthread_worker *worker = worker_ptr;
 	struct kthread_work *work;
 
-	/*
-	 * FIXME: Update the check and remove the assignment when all kthread
-	 * worker users are created using kthread_create_worker*() functions.
-	 */
-	WARN_ON(worker->task && worker->task != current);
-	worker->task = current;
-
 	if (worker->flags & KTW_FREEZABLE)
 		set_freezable();
 
-- 
2.47.3

