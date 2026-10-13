Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544193DC4D3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883094; cv=none; b=l2cVQe/uDbFlxfKBwnJxJ+Kt4dAIZiQ9caxhN+xcic7obig/Gh68a89HALZwLlZQC6Nb37LMfuU0iVouXEkisx0lGk33oB8xG6MBSXXugtyUP0ENldeYikrVo252kntxtsaYP4gjSPcjTIaC5BTpzsRnGUtrq9ASD56jjIVbS4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883094; c=relaxed/simple;
	bh=8uTNUtu28B5J6c+ZwkBAZTaVGXj8tYXv0tu7RLhDXrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gD+ZzmAmCmR73j/LbZMi3yk9xHmJB+3Y0aAGbIMIBYKO+3FndZlEY2am7VJJYlkbXHMdveZZrxBCa616ljTxPcj3AkP4eHZ5a9sr1yWYH1PFscHhMcgJWPew+GyYppUn4joLK4G+QZW7k6gtZZ4/kQgzDj+SPyaw91jwSFkmBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpW7UNCV; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpW7UNCV"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3599178221dso52015eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883092; x=1792487892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDJmtduMW0JWcfPXEKPCIBePRwLMY/68LUtj+f6lthY=;
        b=fpW7UNCV1q8Rb5OwHZdQCHzHcHUpk3N+CKaXgkMw1E9KaSQWXAdcic5t2bBjS01OfW
         Ns+4gpC7woBsTkTmWQDpnhUjozuPsW6CROQ1iOvPoEsedUkUo/cVIxiKC3Nor/PwL1bU
         GNGgdfby8kCaaAaojLVw4DZjZmiMNM7SfIeXO5mSg9w1p/Qll2BHCZhSu7xust8zAi3h
         dcIcr+IK6oz1nct9k0douEkMkcBjH4/dxZ+PmIZDOZ0EvL0wqNPeeJpmC17t99HiJ2Pd
         pANYpEjdKppNtQbccjx86PgrtonZAcnLoNYEYFevLfQntcBQNBe7omQqncO/VLvWQ+gz
         zvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883092; x=1792487892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDJmtduMW0JWcfPXEKPCIBePRwLMY/68LUtj+f6lthY=;
        b=1lVVO1GLUXLa79FX2f4ymKvwLkXsYU8e/JWse+gLJb7+DnwmaDfmVHd/E5phzhUHyA
         92YAJc65y2E4TQv8ItPpFZ1j2GDOxOENLE4jD9Pn/1SzNtkE3l9BWFEpLDTIwbUneasz
         3FRgXKcW2wQFAhpC6xc0/2BRSE0phs68vC/w3MVDK/XhgQ+EJxQGFHjT5pKELdcOoeo5
         J4o6d8T12BBuE8shyOit+taghiiVo1xm66iIf9QTyBEq5+Yi4SSeprq0QYOx5W/3OIc6
         dlWIHQp6XPherQc67AZTM+1944ySN7GpXdiLN/pORiYfyDo0AI+QpsvL2nRsdBVo3LNw
         0GbA==
X-Forwarded-Encrypted: i=1; AKwUvBzXY4RC8jylaWJxmUQqho6WML9YgIjes85sndpBWD+4hYwNnuB8vTWZOC9MkmEf+eLnlREX+EAYBLLGX1U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJnfwM+UWpxDFS5imwBZizq1TDRHXJ+mshJNM3rXkLtxrhmA4A
	cRX2eDzsy/mL6P7dyEahKOe/ukq9wqdcgAIxwqUg7iPs/8RRdVrS4INZ
X-Gm-Gg: AYBFou3jez+gSxWKf1jHUEGyiwREhCPRzBFASCumP7NKJJNrLjIBlhODkr/4QE7mUWh
	CyavzumpbDUhM8GUfzBMHhSPfCRZXwB5Y6E0uPixzXu9xHxgjuzOvU0QgmUClUgWrqigrsrwEov
	k0IP7DcuO8MjiYGz8fAjWRQfAotmWmhu8XbWq1lQiZvsTqtg7RTlistxadG3AXKE9pJ9LJA+hTK
	1m2kmlLvCDfChdXEB4I7ZKdeSfK+IhhgnEKS6u0+d7jF3dhf1dFqtoknEcPptKsLO6PNwTGvclJ
	K1BiWRHIwgtS6iFr2HLU8W9pNBsft+kc8qeN7RVmbTVBdRfzdqBzImKaWBWr6K56CNhZtxkSy7H
	bvBMvx9RB9GnlnZpsG/ixzb66+GplGRUCG4XYn4G2TuELDj4siFGgQJL/tecWI12z++hHG4Y8YC
	rfh6u5MCQIPDJ+i+te8wdTJFqnHCUmyAUJgCE2YB3Bkbg0iA+kZDAK3+uejtdBPRqrupEi9KL9n
	tT0ySNU4iJV16zYwp0MiV68dSs74UTZCVbY2geOV775hWnQUIQ3HSdoT5MuRXk+
X-Received: by 2002:a05:7300:d40a:b0:359:8492:20f8 with SMTP id 5a478bee46e88-35984922315mr16398311eec.2.1791883092196;
        Tue, 13 Oct 2026 02:18:12 -0700 (PDT)
Received: from localhost.localdomain (45.78.65.84.16clouds.com. [45.78.65.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm41437975eec.30.2026.10.13.02.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:18:11 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	mjambigi@linux.ibm.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com,
	horms@kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v3 1/3] net/smc: serialize link group free work scheduling
Date: Tue, 13 Oct 2026 17:17:14 +0800
Message-ID: <20261013091716.1210420-2-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013091716.1210420-1-nicoyip.dev@gmail.com>
References: <20261013091716.1210420-1-nicoyip.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smc_lgr_schedule_free_work() checks lgr->freeing without the link group
list lock held by the teardown paths. A concurrent smc_lgr_free_work()
can set freeing and cancel the delayed work between that check and
mod_delayed_work(), leaving a timer pending on a freed link group:

  CPU 0 (smc_conn_free)            CPU 1 (smc_lgr_free_work)
  observe lgr->freeing == 0
                                  set lgr->freeing under lgr_lock
                                  cancel_delayed_work()
                                  smc_lgr_free(): drop lgr reference
  mod_delayed_work()
  smc_lgr_put(): drop last reference and free lgr

When the timer expires, the timer core accesses the freed memory.

  BUG: KASAN: use-after-free in __run_timers+0x86d/0x8d0
  Write of size 8 at addr ffff8881186902a8 by task swapper/2/0
  Call Trace:
   <IRQ>
   __run_timers+0x86d/0x8d0
   timer_expire_remote+0xd3/0x120
   tmigr_handle_remote_up+0x4f4/0xab0
   __walk_groups_from+0x40/0x150
   tmigr_handle_remote+0x229/0x2c0
   run_timer_softirq+0x1f5/0x250
   handle_softirqs+0x18d/0x5b0
   </IRQ>

Hold the existing link group list lock across the freeing check and
mod_delayed_work(). Set freeing under that lock in early cleanup as well,
before __smc_lgr_terminate() cancels the work. An SMC-D server releases
smc_server_lgr_pending before receiving CONFIRM, so another connection can
reuse the group and race its removal with early cleanup.

Give freeing its own storage. The neighbouring sync_err and terminating
bitfields are written without the list lock; their read-modify-write
updates must not overwrite the freeing transition.

Rearming then either precedes the freeing transition and is caught by the
subsequent cancellation, or sees freeing set and is skipped.
smc_conn_free() retains its link group reference until after scheduling,
keeping the group alive while acquiring the lock.

Fixes: 8e316b9e7260 ("net/smc: improve link group freeing")
Cc: stable@vger.kernel.org
Assisted-by: GPT-6.1-Sol
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
Changes in v3:
- Rebase onto current net/main.
- Correct the cancellation comment without implying that checking freeing
  protects an already-running callback. Patch 3 supplies that protection.

Changes in v2:
- Give freeing its own storage so adjacent bitfield updates cannot
  overwrite the list-lock-protected transition.
- Set freeing under the list lock during early cleanup to prevent a
  concurrent SMC-D connection from rearming after cancellation.
- Keep asynchronous cancellation without adding work-owned references.
- Send with the early-cleanup ownership fix as an ordered two-patch series.

v1: https://lore.kernel.org/r/20260927074520.3694663-1-nicoyip.dev@gmail.com/

v2: https://lore.kernel.org/r/20261003183237.2284245-2-nicoyip.dev@gmail.com/

 net/smc/smc_core.c | 8 +++++++-
 net/smc/smc_core.h | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
index 9974149659c2..660cd41ec720 100644
--- a/net/smc/smc_core.c
+++ b/net/smc/smc_core.c
@@ -80,6 +80,10 @@ static void smc_ibdev_cnt_dec(struct smc_link *lnk)
 
 static void smc_lgr_schedule_free_work(struct smc_link_group *lgr)
 {
+	spinlock_t *lgr_lock; /* protects lgr->freeing */
+
+	smc_lgr_list_head(lgr, &lgr_lock);
+	spin_lock_bh(lgr_lock);
 	/* client link group creation always follows the server link group
 	 * creation. For client use a somewhat higher removal delay time,
 	 * otherwise there is a risk of out-of-sync link groups.
@@ -90,6 +94,7 @@ static void smc_lgr_schedule_free_work(struct smc_link_group *lgr)
 						SMC_LGR_FREE_DELAY_CLNT :
 						SMC_LGR_FREE_DELAY_SERV);
 	}
+	spin_unlock_bh(lgr_lock);
 }
 
 /* Register connection's alert token in our lookup structure.
@@ -691,6 +696,7 @@ void smc_lgr_cleanup_early(struct smc_link_group *lgr)
 	/* do not use this link group for new connections */
 	if (!list_empty(&lgr->list))
 		list_del_init(&lgr->list);
+	lgr->freeing = 1;
 	spin_unlock_bh(lgr_lock);
 	__smc_lgr_terminate(lgr, true);
 }
@@ -1565,7 +1571,7 @@ static void __smc_lgr_terminate(struct smc_link_group *lgr, bool soft)
 
 	if (lgr->terminating)
 		return;	/* lgr already terminating */
-	/* cancel free_work sync, will terminate when lgr->freeing is set */
+	/* cancel pending free_work */
 	cancel_delayed_work(&lgr->free_work);
 	lgr->terminating = 1;
 
diff --git a/net/smc/smc_core.h b/net/smc/smc_core.h
index 5c18f08a4c8a..b8c67f277337 100644
--- a/net/smc/smc_core.h
+++ b/net/smc/smc_core.h
@@ -303,7 +303,7 @@ struct smc_link_group {
 	struct workqueue_struct	*tx_wq;		/* wq for conn. tx workers */
 	u8			sync_err : 1;	/* lgr no longer fits to peer */
 	u8			terminating : 1;/* lgr is terminating */
-	u8			freeing : 1;	/* lgr is being freed */
+	bool			freeing;	/* lgr is being freed */
 
 	refcount_t		refcnt;		/* lgr reference count */
 	bool			is_smcd;	/* SMC-R or SMC-D */
-- 
2.43.0

