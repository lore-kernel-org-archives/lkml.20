Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543221;
	b=BgCsfOsv4n2Oxwd1G93sU+4Bgdes8NFYalO46zV47X+9ZF48ln6uhzAEiJ08ioW6tVs9
	 6MSF+egiNE8y4oc+IhcX8rUYY7d4GgHg0DLnZs0vpp/Cn5zQUElF5WTGLD84oiVvHEaJu
	 SjgMIgzfTu50tnlCxgEcfYURAsT9t4pqMtVyCChET4ljWb2i9qPaV/hrkN4rdfVztjjYd
	 mhaqk4+9WHTPJLKSB9PruG1XF1boUMJPdVyn1nmDDEpYQhpU8+bzQrxQodbNFKCOsaRCj
	 WFIJR/MWyqn2g0WOyQHtk1yZ6nrcLUa0tf0M8jYN2vxoMKOUqTd7bVnnEE8pOxc4AEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543221;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=qRuoUlh/keWzcifWKSLDamYKZv/KlK5dFT6KD/H6ZMg=;
	b=YKlpLpkf4Vx6nCVo5eMsWK5vIUSZaFR8J1+/lQFESKyNEMD8spIeRLn7ahoHwAuKLKpN
	 w4uRGjL7uB0xj3e1aYYhuscMZMRLn/KxtUbHc/CXrIkO77hwymlX1FD6Xt6I9i7fD4Sxr
	 HQKYPLW26hy0Uvu4r9+UhoQMCU93nS6BTPJwcBu1aBbAId4BfyzCY6v1jEWDlctmxZSY3
	 sevD18AgKDny6q2FjfpcMnm+b1n+bVl8k+AguSTTQnR5McZytmU8kbjYZswRKFCCVcFPF
	 oVWg9tQ/S6tYiMT4RmFufV2Zh2/5ybmijhzs7DK1X2AqxWt2opItDmxZFCBKsQriogQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a048d5NP;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6514F606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6514F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a048d5NP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793543219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qRuoUlh/keWzcifWKSLDamYKZv/KlK5dFT6KD/H6ZMg=;
	b=a048d5NPRkUVcKLkmzDCbw3qL8qj55HdDpRe/IVHg1Xqfpzv0ojXxRlb0HnXu53+zUbgT9
	OsSkxcT380WgUrFy5GpNhpgKanelCj2Ybot7DoHTxy9RB2HMZhxYZJB+fyAj8ttvcTXnTt
	zDUH7B19yevYrtMEcICY/cUrO0EuJG4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-gYy8OK_1M2SJv45-1RyKFQ-1; Sun,
 01 Nov 2026 09:26:56 -0500
X-MC-Unique: gYy8OK_1M2SJv45-1RyKFQ-1
X-Mimecast-MFC-AGG-ID: gYy8OK_1M2SJv45-1RyKFQ_1793543215
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB5841955E72;
	Sun,  1 Nov 2026 14:26:54 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 4A4D51800495;
	Sun,  1 Nov 2026 14:26:53 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun,  1 Nov 2026 15:26:54 +0100 (CET)
Date: Sun, 1 Nov 2026 15:26:51 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Bradley Morgan <brads@mainlining.org>
Subject: Re: [PATCH] taskstats: Avoid counting an exiting thread twice in
 TGID queries
Message-ID: <audMK54OZfUMGdqe@redhat.com>
References: <20261031052451.78846-1-pocj8ur4in@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031052451.78846-1-pocj8ur4in@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 10/31, Baek Kyu, Kim wrote:
>
> fill_tgid_exit() adds a thread's contribution to signal->stats before
> exit_notify() sets exit_state. A TGID query in that interval copies the
> cached contribution, then scans the same thread because exit_state is
> still clear. The thread's contribution is counted twice.

I forgot everything about this code, quite possibly I am wrong but let
me add some comments anyway...

Yes, known problem. Plus afaics fill_stats_for_tgid() can also miss an
exiting task, see below.

Another problem is that taskstats_exit(group_exit => true) can miss other
threads which have not called taskstats_exit() yet and report TGID/AGROUP.
Afaics this patch doesn't try to fix this.

> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2202,6 +2202,9 @@ __latent_entropy struct task_struct *copy_process(
>  		goto bad_fork_cleanup_count;
>
>  	delayacct_tsk_init(p);	/* Must remain after dup_task_struct() */
> +#ifdef CONFIG_TASKSTATS
> +	p->taskstats_tgid_accounted = false;
> +#endif

I agree with Bradley, this looks unnecessary.

> @@ -261,7 +261,7 @@ static int fill_stats_for_tgid(pid_t tgid, struct taskstats *stats)
>
>  	now_ns = ktime_get_ns();
>  	for_each_thread(first, tsk) {
> -		if (tsk->exit_state)
> +		if (tsk->exit_state || tsk->taskstats_tgid_accounted)
>  			continue;

If we add taskstats_tgid_accounted, why do we need to check exit_state?

In the multithreaded case, if taskstats_tgid_accounted is true, then
exit_state should be true too (ignoring the kmem_cache_zalloc() failures).

In the single threaded case this looks simply wrong. The exiting single
threaded task will not call fill_tgid_exit(). If cmd_attr_tgid() is called
after exit_notify(), it will miss that zombie.


And... Perhaps it would be better to use ->atomic_flags rather than add
yet another member to task_struct?

Oleg.

