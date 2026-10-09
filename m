Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CC844E64E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552419; cv=none; b=kvICFzHixgPshkpgl0zvxo6iXQy/T5S0+Y+a55hCUncb9viZTM+/IduW6TWQu6cAimBk1sX/Te59JRYn8kN7Z9gu1YKXdtn19hn/gF04KwMllMhwHyOQdgNd8ntbLKkTdheaBWNv8PfCSJs96E5GFjZ1gc7gubnoFPfW7u5OzDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552419; c=relaxed/simple;
	bh=4jgnJfk3P18E7ZeuTy58NlzMsqjgWEj80ewtLz0wvuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vErxaegoTCm1l5++0ERsPKxvs/BafbgPAd69gwgOfGL4JE5Hn1AgmbD/qsPpUlu1aEQ1Lw42V1shqtDzQnxjgHJ055acqZAzS+JodhpjdzyqR3UW0hCRElJaCfegg4UPBbChACoVCeLP9TIdlCr1I9I2g4QaWBwJ7AsjUoHEN+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=L6+PFKcs; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="L6+PFKcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=y+
	ePeBrDalH4ot+RGsdcB0s9bmc/mBJjEtJvv7GUvmI=; b=L6+PFKcsbvh6J35Vbm
	977RGwxynajGUjvp6qLHitQPBAELWHktpXeJH66JQ/DOkgY92Gk3IoaVhTDvP7bP
	LhT0u3kTvYi3rCvocGMEJrsnpzbxI0Fg4dtCSIUx5uI4yfliRcau0MpqNjS8+cFI
	hjexNpfkZwt1IcWpK02nIqnhg=
Received: from colol4bi5.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD338uI68hqzoRZDQ--.36286S2;
	Fri, 09 Oct 2026 21:26:33 +0800 (CST)
From: Binbin Deng <18983559317@163.com>
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Binbin Deng <18983559317@163.com>
Subject: [PATCH v1] drm/amdkfd: Fix use-after-free in the process creation error path
Date: Fri,  9 Oct 2026 21:26:19 +0800
Message-ID: <20261009132619.40151-1-18983559317@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD338uI68hqzoRZDQ--.36286S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur47Wr1rXF15uryDKF45Wrg_yoW5Gw4rpa
	yrWF1jvr1kC3Z7K343Zay8ZryfJw4UAF47Grn7Kr9xWw15AFy5XrZxGryj9F95Cr1F9a43
	t3WDWr4UGr9Fvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U1uWXUUUUU=
X-CM-SenderInfo: jprymmytvvmjmrxbiqqrwthudrp/xtbC4AnpzWrI64kgAAAA3t

create_process() publishes the new process in the global hash table
before the steps that can still fail:

	/* alloc_notifier needs to find the process in the hash table */
	hash_add_rcu(kfd_processes_table, &process->kfd_processes,
			(uintptr_t)process->mm);

If a later step fails (mmu_notifier_get() with a pending signal, or
kfd_process_alloc_id()), the error path removes and frees it:

err_register_notifier:
	hash_del_rcu(&process->kfd_processes);
	svm_range_list_fini(process);
	...
	kfree(process);

hash_del_rcu() only unlinks the node; readers that entered an SRCU
read-side critical section before the deletion can still be walking
the hash bucket and using the node.  The unconditional kfree() that
follows is not covered by any SRCU grace period, so such a reader can
obtain and dereference freed memory.

The readers are the GPU interrupt and ioctl lookup helpers, which run
under srcu_read_lock(&kfd_processes_srcu) only:
kfd_lookup_process_by_pasid() iterates the whole table with
hash_for_each_rcu and dereferences p->pdds[] of every entry;
kfd_lookup_process_by_id() and kfd_lookup_process_by_mm() match and
return the process for further use.

The normal removal path (kfd_process_table_remove()) already executes
synchronize_srcu(&kfd_processes_srcu) after hash_del_rcu(); only the
error rollback path misses it.  The race is reachable by an unprivileged
GPU compute user: a thread whose process creation fails (e.g. ioctl
interrupted by SIGKILL at mmu_notifier_get) while another thread is
servicing a GPU interrupt that walks the process table.

Fix this by waiting for an SRCU grace period in the error path after
unlinking the process, before the object is freed.

Fixes: 0029cab3146a ("drm/amdkfd: fix a use after free race with mmu_notifer unregister")
Signed-off-by: Binbin Deng <18983559317@163.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 0a7c1900da95..8d0e70a256f7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1747,6 +1747,7 @@ struct kfd_process *create_process(const struct task_struct *thread, bool primar
 	kfd_process_free_id(process);
 err_register_notifier:
 	hash_del_rcu(&process->kfd_processes);
+	synchronize_srcu(&kfd_processes_srcu);
 	svm_range_list_fini(process);
 err_init_svm_range_list:
 	kfd_process_free_outstanding_kfd_bos(process);
-- 
2.43.0

