Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801FD48F84F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404772; cv=none; b=s3Rs52yIXrP1e+A/5eq8bgYRVfxzzgTAlAIA0xURgAv9YyZ+EFlF4yRnEWCAY8E8KnWvOGllG7bnRqhvnxk+P7+UfvkM2VcxsxLKaJxQWFlqE800EV+JrCqh5k8ttgTS5Hvi3B0Tr29yTRYHg9y/Uz/OBIUYDB7XOsFdW9gNj5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404772; c=relaxed/simple;
	bh=LjY2pugXv0VvnYTBhHz3R3Kqv8+J9w5hr+tCcPxYiko=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=RWCWZbDGGHPNefTkzPv5o1868j4W2eK2sdKc/ifHOEAEvmkedD5QQ5JaMt9Y9f+M2atvem3TjglFS7RR/3Rt0bAU3XbSvbGQUupZAT97zVI/p17TGturbw9fqbLzlUiqeRIcGIAsB1oqUa7sgoB7lkLdzCfcZZCDBHtyOobdpkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=F4NcsKV7; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=EP6YuJN5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="F4NcsKV7";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="EP6YuJN5"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789404754; bh=DDxUil0+DLRNxboR78Praab
	7itZ17vPbWKzSqhobczo=; b=F4NcsKV7MLywogzL3QSTKhECGjLQy0+cOC/r76WiHq86Ld9uJC
	rlu9bGjYWmxm7cqs1UC8sZIrwbK+VRIhwLyH76nRj+tmS7h+No8busv+vtrSsJn/3xNomW3H9DC
	4d2b4bAOYocf8ABU5XheNRo3bV5qb35Ua7NRzyuB1UiVW6WVq6O0LFSfxRaMMSgq/suGgGHumuY
	p+LRX2LGAoon8wBaa3zf58aF8D4XXKpx9qnG9cFAQ58qi64vu7r+NT/Q0eomYvgjZRtt+BOsiql
	D4QZWPdiStMd2uXyZoJ8G5txCyiCp5KJnJYyU66A2EhGilCHR53Ljn7DtOS+/kOtQbw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789404754; bh=DDxUil0+DLRNxboR78Praab
	7itZ17vPbWKzSqhobczo=; b=EP6YuJN5/CO5C+bLmHVqkMqiP5eTMhZkK9irY8riXNbR+0lXQO
	TjaEBkt5YPJsdyoTDwnhFVDhumFpYxZgNAAg==;
Date: Mon, 14 Sep 2026 17:52:35 +0100
From: Bradley Morgan <brads@mainlining.org>
To: quchaosheng000406@163.com
CC: boqun@kernel.org, linux-kernel@vger.kernel.org, longman@redhat.com,
 mingo@redhat.com, peterz@infradead.org, will@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_kthread=3A_Drop_warning_on_cpuma?=
 =?US-ASCII?Q?sk_allocation_failure_in_kthread=5Faffine=5Fnode=28=29?=
In-Reply-To: <20260914120941.63968-2-quchaosheng000406@163.com>
Message-ID: <F1E3C43A-E5F5-4D85-A59D-FECC35AE0C87@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 14 September 2026 13:09:41 BST, Quchaosheng <quchaosheng000406@163.com>
wrote:
>kthread_affine_node() warns when zalloc_cpumask_var() fails:
>
>  if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
>          WARN_ON_ONCE(1);
>          return;
>  }
>
>The allocation uses GFP_KERNEL, so it can fail under memory pressure or
>fault injection.  A failed allocation is a recoverable condition and not a
>kernel bug, so the warning is noise.  syzbot reports it for a WireGuard
>NAPI thread:
>
>  WARNING: kernel/kthread.c:359 at kthread_affine_node+0x200/0x2e8
>  CPU: 0 PID: 5207 Comm: napi/wg2-0
>  Call Trace:
>   alloc_cpumask_var_node+0xfc/0x138
>   zalloc_cpumask_var
>   kthread_affine_node+0x148/0x2e8
>   kthread+0x29c/0x3d4
>   ret_from_fork+0x10/0x20

Interesting.

>
>The other two callers of zalloc_cpumask_var() in this file, in the kthread
>preferred affinity and kthreads_online_cpu() paths, return -ENOMEM without
>a warning.  kthread_affine_node() returns void, so it cannot report the
>error either, and it only skips the affinity setup for this thread. 
>Return
>early without warning, matching those callers.

Makes sense.

>
>Reported-by: syzbot+37ca7ae3e98cb65c3209@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=37ca7ae3e98cb65c3209
>Signed-off-by: Quchaosheng <quchaosheng000406@163.com>



>---
> kernel/kthread.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/kernel/kthread.c b/kernel/kthread.c
>index a3f95c904..f735a74b6 100644
>--- a/kernel/kthread.c
>+++ b/kernel/kthread.c
>@@ -355,10 +355,8 @@ static void kthread_affine_node(void)
> 	if (WARN_ON_ONCE(kthread_is_per_cpu(current)))
> 		return;
> 
>-	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
>-		WARN_ON_ONCE(1);
>+	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
> 		return;
>-	}

Uhh, I'm unsure about this. 

The warn may be intended?

Perhaps you could warn -> info? 

Because people may prefer to know if it's broken.

I'm not comfortable adding a tag until the maintainers have a input



> 
> 	mutex_lock(&kthread_affinity_lock);
> 	WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
>
>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
