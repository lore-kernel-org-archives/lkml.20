Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233C377567
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405473; cv=none; b=nrUaa2gHPW10TxVRJe3aVXDPWF02wKalD8PMY0rd4kUDoNyKkM2t+CBVpmDOcD4Z+QFUGUi1yplZmcRVNR+SZJHEF2xWMnpzCWz85zC9pfCpM000OXlex8AJ0hQSbt/tXb+4SPiiQxqGPw7rSPbu0wEAx5ld7lAyiPnqN2wuX4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405473; c=relaxed/simple;
	bh=h9wZEIGzWJc3gJ/FtHDeXK/qfCPozzizzhCbTztCPdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYFUFBTtty1fbdB+zL+XIvJVer4O7SWLJyQgVCyYTaOAK6rqvOA6IEnFSSvPJdea9lv/2sJXeXuwPZpj25qlzcwxzG4/gtXYyTdjUbHg/Gb2HAKCiYpFic/XmWCWbIZ6MzfzKmKwoqVXGmCnFhIc7gDIgMnGwOGASzjJHIlPD+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ir9sNvs/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ir9sNvs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789405470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QI/8n5/ffXr1fZD+NqesC3Erw0EDtukPccSd2p6yRxU=;
	b=Ir9sNvs/lIHXvIL4lwrulAdiV6tZVjJKLuPakjatGzo5nDQgHl9fxa17HzNsf07GZ/VLVN
	dvuSU52b1G48TPKOM3kkGooCklKyZUVU8hFZeoSkIOa+OFluWjFz0NAnuQUE/s0BZp9fgd
	Ed8ttvAWE31Z7K4hVn2Nji/TcfFvU3Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-286-NuJCBf6cNBWySexYRttv2w-1; Mon,
 14 Sep 2026 13:04:27 -0400
X-MC-Unique: NuJCBf6cNBWySexYRttv2w-1
X-Mimecast-MFC-AGG-ID: NuJCBf6cNBWySexYRttv2w_1789405465
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 45666180AD5D;
	Mon, 14 Sep 2026 17:04:25 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 374A51956089;
	Mon, 14 Sep 2026 17:04:23 +0000 (UTC)
Message-ID: <deab3ef5-e63f-474f-9a1b-fb4f4b65be2a@redhat.com>
Date: Mon, 14 Sep 2026 13:04:22 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kthread: Drop warning on cpumask allocation failure
 in kthread_affine_node()
To: Quchaosheng <quchaosheng000406@163.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>
References: <20260914120941.63968-2-quchaosheng000406@163.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260914120941.63968-2-quchaosheng000406@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

cc: Frederic Weisbecker <frederic@kernel.org> for his input.

-Longman

On 9/14/26 8:09 AM, Quchaosheng wrote:
> kthread_affine_node() warns when zalloc_cpumask_var() fails:
>
>    if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
>            WARN_ON_ONCE(1);
>            return;
>    }
>
> The allocation uses GFP_KERNEL, so it can fail under memory pressure or
> fault injection.  A failed allocation is a recoverable condition and not a
> kernel bug, so the warning is noise.  syzbot reports it for a WireGuard
> NAPI thread:
>
>    WARNING: kernel/kthread.c:359 at kthread_affine_node+0x200/0x2e8
>    CPU: 0 PID: 5207 Comm: napi/wg2-0
>    Call Trace:
>     alloc_cpumask_var_node+0xfc/0x138
>     zalloc_cpumask_var
>     kthread_affine_node+0x148/0x2e8
>     kthread+0x29c/0x3d4
>     ret_from_fork+0x10/0x20
>
> The other two callers of zalloc_cpumask_var() in this file, in the kthread
> preferred affinity and kthreads_online_cpu() paths, return -ENOMEM without
> a warning.  kthread_affine_node() returns void, so it cannot report the
> error either, and it only skips the affinity setup for this thread.  Return
> early without warning, matching those callers.
>
> Reported-by: syzbot+37ca7ae3e98cb65c3209@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=37ca7ae3e98cb65c3209
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---
>   kernel/kthread.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index a3f95c904..f735a74b6 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -355,10 +355,8 @@ static void kthread_affine_node(void)
>   	if (WARN_ON_ONCE(kthread_is_per_cpu(current)))
>   		return;
>   
> -	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
> -		WARN_ON_ONCE(1);
> +	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
>   		return;
> -	}
>   
>   	mutex_lock(&kthread_affinity_lock);
>   	WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
>

