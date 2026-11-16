Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840522;
	b=pUSuHf+e7/1lKp1lO117h7rM4dUhPkY1k+uJJp5oMn6g8olQiIQvr5gGN61bqNhRrOuC
	 vVvkJjZXqrAjGFs3MQ33FnjUVFJ+AkRJB5HHMiN66v/QpBdW22hT633xe92iitSmo11KJ
	 mZH3DOzx2im4Kx7xv6z8LSF/wesK4kBqJWapnNMamfOuE/OVb1GIVcPH+/e7EXkIMp2YN
	 mrzOBJX0gnINr6I5KvGQHNBrinSIer8lI2Sjooq/pOLm3PlWuSuEHyFNWU8EiL7iHWpQc
	 ay/lK8GDZxjC7hfvVH83my9Jn/JkmKx0I9UPx48JkAsd7yKvkXwYEcgDZAhRETi8NKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840522;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=pA9V8D1wG0Eyw/8znW28sdVPMMRkVzuOllQ2VtP8AA4=;
	b=vsHhu17SIrTc1lsFPhv4LNGd5ByQhJCB8QQHm2g0iJZgIcuvI5whkjDLdiUxzY7PVCQi
	 Js7I8ebYIf0uC8LXwVY0vAxz3dR/JecML7w+ApHt/4mkAtyAKv21L352zdfk4sKXw4kMj
	 07zkpQSKqMWELBqrHTzgZvG/jiiMEsmFiz4Yb+qPbvCgIT5sq9ud5Krx9amUVgSBaBpT7
	 qqnvyDUVZSvBC4AgF0CyMnrhTJ8ANJE+g80Rkz/u+puUjw4cJaauVy2saXEJD1/yvsQ+m
	 2aLrDVqNX1vDlLlpSu9NVfCgInXP+BaRDybmb5h6cdi82/Ca1KyXGYSHjGzIB8RcHMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eo2srPRa;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70EA606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eo2srPRa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794840520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pA9V8D1wG0Eyw/8znW28sdVPMMRkVzuOllQ2VtP8AA4=;
	b=Eo2srPRaJ0EvTFe16x7lW19ezuBEM6+frDf4M8g9wFhqNX8tBYzG7xwIu8DDSjzQv+DvvT
	juU+R7jZgpU7rppz888qQkU21GS0qJ5dVpetnDwsJ8YZE49L+qyLZSx+NZ58VLy+sTVvnt
	U4p+IoKOaQPKDSnmKYL1ia8XAtiv8ZE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-1M6OWw6JPauSGN-kCBZULQ-1; Mon,
 16 Nov 2026 09:48:37 -0500
X-MC-Unique: 1M6OWw6JPauSGN-kCBZULQ-1
X-Mimecast-MFC-AGG-ID: 1M6OWw6JPauSGN-kCBZULQ_1794840516
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 05B7A18002CC;
	Mon, 16 Nov 2026 14:48:36 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 27D3141F;
	Mon, 16 Nov 2026 14:48:32 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon, 16 Nov 2026 15:48:35 +0100 (CET)
Date: Mon, 16 Nov 2026 15:48:31 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, andrii@kernel.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uprobes: avoid postponing return-probe SRCU lease
 expiration
Message-ID: <avsXv0CMBoilsB_1@redhat.com>
References: <20261115155921.260878-1-thnkslprpt@gmail.com>
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
In-Reply-To: <20261115155921.260878-1-thnkslprpt@gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/15, Avi Weiss wrote:
>
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -2052,6 +2052,9 @@ static void ri_timer(struct timer_list *timer)
>  	 */
>  	raw_write_seqcount_begin(&utask->ri_seqcount);
>
> +	/* Pair with prepare_uretprobe() to avoid a missed rearm. */
> +	smp_mb();
> +
>  	for_each_ret_instance_rcu(ri, utask->return_instances)
>  		hprobe_expire(&ri->hprobe, false);
>
> @@ -2304,7 +2307,9 @@ static void prepare_uretprobe(struct uprobe *uprobe, struct pt_regs *regs,
>  	ri->next = utask->return_instances;
>  	rcu_assign_pointer(utask->return_instances, ri);
>
> -	mod_timer(&utask->ri_timer, jiffies + RI_TIMER_PERIOD);
> +	/* Pair with ri_timer() after publishing the instance. */
> +	smp_mb();
> +	timer_reduce(&utask->ri_timer, jiffies + RI_TIMER_PERIOD);

Hmm... timer_reduce() looks a bit confusing to me, perhaps

	if (!timer_pending(...))
		add_timer(...);

make more sense?

Either way, I am not sure I fully understand the memory barriers... Looks
correct, but IMO the "Pair with ..." comments do not really help.

IIUC, prepare_uretprobe() needs mb() between STORE in rcu_assign_pointer()
and LOAD in timer_pending(); while ri_timer() needs mb() between STORE in
expire_timers()->detach_timer() and LOAD in for_each_ret_instance_rcu().

Right?

Oleg.

