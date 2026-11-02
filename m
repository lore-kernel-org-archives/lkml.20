Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588318;
	b=a2ADhtTIMGoMBL0nH8p1xoouG7b0hCMC2LfY/Efx9PS9X2P54sFcnLXiyYTa0pRxWAAC
	 fx3pElNBVtLJhKnELP1X+MYTla/dPEQ4I4HnAS3VX0mhEnGTTDZbLOpHuBUG5hHMb0G7N
	 xQNWoZONSf4nYVq1/qWo6vhf1SynT74Lwd0F22abDHnUkNSCQnjnnRzuueY5TQIPnbRBH
	 77OQJjfw+4DwF3hdNFOEi/g71PnpbI3T/A9cxUWB7rJOaJN3JG3DpoRkXl6reSWE6jQ0R
	 uKLtdme1QCeGyTMzxXSKTTleWd8P6VvGlJ1cjUJPQBlyib+7JS32JOlEZ1d0apPPlsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588318;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yo1bE5Jn+d6HRkfvc/K55Bet7/oP53aLc2JOnHT9uEE=;
	b=VUyVWoY7agkSc/5/fHOvWxCJ3sxa4JXDjjU4uQ8VJ+6/u78YLwLC4i8W1K9PgNlS5hhV
	 kRCiq0Cm9SE8sRS4fpW1OWluAyyQ2PWqBR+TojNb6cRpKDsnOmCRtmjpbrutSYAXtO6Y0
	 1pxzptJDlUBlExn0d4QljKvYvrB3KmIdosf24l7gzRiI1soNces0w4JpQcTqWZwHi6v5V
	 9YdWzaHprMOONgY244mR0sdFVUx874iW4NrTOs6eou0cIOFCFUDyFWD8pD2zhqN7WQpS4
	 NlzG25M6NGDuWoRHhnTvL971aOlrklfc8Bi71wSYh9SEXlyjfeb7vOd8b/cobkugZqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=nfBTfKaB;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66B1606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66B1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=nfBTfKaB
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793588308; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=yo1bE5Jn+d6HRkfvc/K55Bet7/oP53aLc2JOnHT9uEE=;
	b=nfBTfKaBnIYUtHWkuRUw02SS7IdUjhhxmSkF64D7nssniNQiY+Uh9EBJngLBAVuAKvbmHgBSUxQGJoouV92xJ6uIAn/IEXRJcdPXCjB3rlFF2wg687yWkxVk0tJjjV+UDx0xjKVhDRbyY1zM1WHppW3/FkxfetIMivxKMMfEyxM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0XDsHgp._1793588304;
Received: from 30.221.129.143(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XDsHgp._1793588304 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 02 Nov 2026 10:58:25 +0800
Message-ID: <88281285-5b3e-4266-88d9-784dfea5ebe7@linux.alibaba.com>
Date: Mon, 2 Nov 2026 10:58:24 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: drain domain handlers before destroying the DLM
 worker
To: Cen Zhang <zzzccc427@gmail.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, akpm@linux-foundation.org,
 Heming Zhao <heming.zhao@suse.com>, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
References: <pm-ocfs2-objects-candidate-0056-v2-57239c657ac017b50fa1@gmail.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <pm-ocfs2-objects-candidate-0056-v2-57239c657ac017b50fa1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/9/26 4:11 PM, Cen Zhang wrote:
> The domain workqueue must remain usable until every network handler that
> can submit work has finished. dlm_unregister_domain_handlers() removes
> handlers from the o2net lookup tree, but an already referenced handler can
> still run. Its dlm_grab() reference pins the context, not dlm_worker.
> 
> On the final local domain disconnect, a migration receive callback can
> have passed dlm_joined() before shutdown changes the domain state, yet
> still be preparing its work item when teardown destroys the queue:
> 
>   o2net receive worker             Final domain teardown
>   --------------------             ---------------------
>   Get the handler reference
>   dlm_grab(); pass dlm_joined()
>                                    Unregister domain handlers
>                                    Stop the DLM threads
>                                    destroy_workqueue(dlm_worker)
>                                    dlm_worker = NULL
>   Publish the migration work item
>   queue_work(dlm_worker, ...)
> 
> The handler lookup reference lets the callback continue after unregister.
> The work-list lock does not protect the queue lifetime, and destroying the
> queue drains submitted work without waiting for this producer. The late
> queue_work() therefore passes NULL to __queue_work() and crashes.
> 
> Use o2net_unregister_and_flush_handler_list() at the existing domain
> handler unregister point. Removing the handlers prevents new lookups,
> and flushing o2net receive work waits for already referenced callbacks
> and their post handlers. They can finish submitting while dlm_worker is
> still live; the subsequent destroy_workqueue() drains those submissions.
> The same unregister helper covers failed registration and join cleanup,
> without changing the DLM thread or workqueue teardown order.
> 
> KASAN report as below:
> 
>     Oops: general protection fault, probably for non-canonical address 0xdffffc0000000038: 0000 [#1] SMP KASAN NOPTI
>     KASAN: null-ptr-deref in range [0x00000000000001c0-0x00000000000001c7]
>     CPU: 0 UID: 0 PID: 14 Comm: kworker/u8:1 Not tainted 7.3.0-rc4-next-20260921-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
> 
> [Hardware details omitted.]
> 
>     Workqueue: o2net o2net_rx_until_empty
>     RIP: 0010:__queue_work+0x9b/0x1600
> 
> [Instruction and register dump omitted.]
> 
>     Call Trace:
>      <TASK>
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx___queue_work+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? clear_pending_if_disabled+0x83/0x1c0
>      ? __pfx_clear_pending_if_disabled+0x10/0x10
>      ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
>      ? dlm_mig_lockres_handler+0x984/0x1500
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_release+0xc8/0x290
>      queue_work_on+0xda/0xf0
>      dlm_mig_lockres_handler+0x9d5/0x1500
>      ? percpu_rwsem_wake_function+0x10/0x480
>      ? __pfx_dlm_mig_lockres_handler+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? trace_hardirqs_on+0x18/0x160
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? kvm_clock_get_cycles+0x31/0x60
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      o2net_rx_until_empty+0x1a55/0x32f0
>      ? reacquire_held_locks+0xdd/0x200
>      ? __pfx_o2net_rx_until_empty+0x10/0x10
>      ? lock_acquire+0x190/0x300
>      ? process_one_work+0x935/0x1b40
>      ? process_one_work+0x834/0x1b40
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_release+0xc8/0x290
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      process_one_work+0x9a8/0x1b40
>      ? __pfx_process_one_work+0x10/0x10
>      ? lock_acquire+0x190/0x300
>      ? lock_is_held_type+0x8f/0x100
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      worker_thread+0x65c/0xe40
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __kthread_parkme+0x177/0x220
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_worker_thread+0x10/0x10
>      kthread+0x351/0x460
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork+0x659/0x940
>      ? __pfx_ret_from_fork+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __switch_to+0x74f/0xf70
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork_asm+0x1a/0x30
>      </TASK>
> 
> [Empty module list omitted.]
> 
>     ---[ end trace 0000000000000000 ]---
> 
> Fixes: 3156d2670166 ("ocfs2: move dlm work to a private work queue")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
> 
> diff --git a/fs/ocfs2/dlm/dlmdomain.c b/fs/ocfs2/dlm/dlmdomain.c
> index 97bb9400e24bbf6badea1339dd8de1623fe5bac5..b69baf99a4a6e4d5a5c51664625bafa905dc3bf5 100644
> --- a/fs/ocfs2/dlm/dlmdomain.c
> +++ b/fs/ocfs2/dlm/dlmdomain.c
> @@ -1708,7 +1708,7 @@ static void dlm_unregister_domain_handlers(struct dlm_ctxt *dlm)
>  {
>  	o2hb_unregister_callback(dlm->name, &dlm->dlm_hb_up);
>  	o2hb_unregister_callback(dlm->name, &dlm->dlm_hb_down);
> -	o2net_unregister_handler_list(&dlm->dlm_domain_handlers);
> +	o2net_unregister_and_flush_handler_list(&dlm->dlm_domain_handlers);
>  }
>  
>  static int dlm_register_domain_handlers(struct dlm_ctxt *dlm)

Seems we also have to guard the flush on a non-empty list, just like
28f366d84023 ("ocfs2/dlm: drain join handlers before releasing module text")

Thanks,
Joseph
