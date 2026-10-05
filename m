Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F17248423B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207974; cv=none; b=AgDGO+dS8w0lUlpxS3PDNmy7E7mjFrd9YXrukl1o+7JVKko/ctHmWHK5gZt1cF09j5DJXHCA2XWAeOr1j2r2TJGnZmBpBUn+cFFggpCkTcvrbA32Z+fJwLYVpH/2CtO+aM82L4sbps/sGeMmO14FOJMLEA0VcJe85xaczmzUHGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207974; c=relaxed/simple;
	bh=IVW/6ecOFWGfuMqheFlZx9C3H1D3xo0jPbhWRv9GWjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PObfsDQHeOcdt95FcatCkOwLY7QLhMKlDsSE0xhMBUH1AAfxniW3l9O8PX0z4vvPbEeUWCbX8UuEl0AjqQH8dHHNVlhQcjJsQL3BKgtiBrYkASD/x+sBF7mAMFqqYObibwofOy9eSwHmZT+iCpBQ9w1XVUHxwCPP2DeWVKtsle4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RGHWjtM5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RGHWjtM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791207972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GrffBHNPUjhlOR40jzr6bm8eCCj3GOhwfQCP89Mw0U=;
	b=RGHWjtM5a8mqgctJ88jNy/HLsNvqp1E2qAmorZoONL4O4cr9FR11aDjVqk/QE0OCtgBG+P
	mM2ztKOnyytWKdZYMIDodyOZn51fE2hU8E/IQCX5jYPuwT/E+BNt8WgggyGWuz5nyriEyA
	iEWJfa3CJKKyGM3/D/CfbNVRyaobglI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-3PfVqK_0MKeuM-0JVdmWEg-1; Mon,
 05 Oct 2026 09:46:08 -0400
X-MC-Unique: 3PfVqK_0MKeuM-0JVdmWEg-1
X-Mimecast-MFC-AGG-ID: 3PfVqK_0MKeuM-0JVdmWEg_1791207968
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D5CDC18089A1;
	Mon,  5 Oct 2026 13:46:07 +0000 (UTC)
Received: from pauld.westford.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 579851800579;
	Mon,  5 Oct 2026 13:46:05 +0000 (UTC)
Date: Mon, 5 Oct 2026 15:46:02 +0200
From: Phil Auld <pauld@redhat.com>
To: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/core: fix coding style issues
Message-ID: <20261005134602.GA83650@pauld.westford.csb>
References: <20261002133626.20443-1-jahanzaibashraf1318@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002133626.20443-1-jahanzaibashraf1318@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi Jahan,

On Fri, Oct 02, 2026 at 07:06:26PM +0530 Jahan Zaib Ashraf Mir wrote:
> Fix three checkpatch warnings in sched/core.c:
> - Use 'unsigned int' instead of bare 'unsigned' for mode parameter
>   in default_wake_function()

Probably not worth making this change. And even if it was worth it
it would be good to make it all match (see wait.h). 

> - Add missing blank line after variable declaration in
>   __sched_setscheduler()
> - Add missing blank line after variable declaration in
>   sched_dynamic_update()

No need for a patch to justc change whitespace.


Cheers,
Phil

> 
> Signed-off-by: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
> ---
>  kernel/sched/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index e8c46f849f6e..9bd1bf3d7729 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4723,6 +4723,7 @@ void force_schedstat_enabled(void)
>  static int __init setup_schedstats(char *str)
>  {
>  	int ret = 0;
> +
>  	if (!str)
>  		goto out;
>  
> @@ -7611,7 +7612,7 @@ asmlinkage __visible void __sched preempt_schedule_irq(void)
>  	exception_exit(prev_state);
>  }
>  
> -int default_wake_function(wait_queue_entry_t *curr, unsigned mode, int wake_flags,
> +int default_wake_function(wait_queue_entry_t *curr, unsigned int mode, int wake_flags,
>  			  void *key)
>  {
>  	WARN_ON_ONCE(wake_flags & ~(WF_SYNC|WF_CURRENT_CPU));
> @@ -8087,6 +8088,7 @@ static int __init setup_preempt_mode(char *str)
>  {
>  	int mode = sched_dynamic_mode(str);
>  	if (mode < 0) {
> +
>  		pr_warn("Dynamic Preempt: unsupported mode: %s\n", str);
>  		return 0;
>  	}
> -- 
> 2.56.0
> 
> 

-- 

