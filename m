Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A2D47ACF5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044861; cv=none; b=Xzn7TWDDK8wKOTbTI1fZCDdijJQZnPo7MTnQwFT/Nz4mB+F5KsF+xcaGBkWxH4csHC9DQGQWbLhpe/SItX9vKwPG5Ll0mj5nKT4W2eQVAuHJwJe41s+dufLS3KTZrN6E7DxpfqI4K4oH2/PnTE2EXFHINpEL6PP3NAjemj8EvUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044861; c=relaxed/simple;
	bh=KBMeHgr9QcDyNTqKIAJIHeMWuUuONF6+1Z4Y3XF9ZKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QERsIBoCvrBnKep9toLpiVgkQIjLSHswr1VE5uqWnyHGKq9spT9VbTkF2u7ZEvGNdVBmPN+TlbcPXD0Q5aUlkCT6PFOZegnz+TRvoQRrFS+pOTlv5GaeSoG8twm0xIebE1jcFLdFd8TmB8ZotiuJ3Fh0Q/jp7ubEMYi1ztQIIqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CMECppvU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CMECppvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789044857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BkCSnQSbLXk0j6IvyY9doaUVt+n6c21mn6M//vl+/xo=;
	b=CMECppvU7u34aNoNMsyBYRy9HCKTVoczeYhgwyCLYeHQqJska/+tInPHXhKFpDGY1ln0Ye
	m1AiobeNh2xbI+n4RYDI2xdjRBhNt3ho4b8bPO8kcsJj3SOher86r0TMJAlwEuHrlulx2p
	7r9sOv9kWSG4h7eSuiYycEHSzCvQ9GU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-597-67zvAh4ZOHWmJBHNOXxrZQ-1; Thu,
 10 Sep 2026 08:54:11 -0400
X-MC-Unique: 67zvAh4ZOHWmJBHNOXxrZQ-1
X-Mimecast-MFC-AGG-ID: 67zvAh4ZOHWmJBHNOXxrZQ_1789044850
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2C0119541BF;
	Thu, 10 Sep 2026 12:54:09 +0000 (UTC)
Received: from fedora (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1729B1956040;
	Thu, 10 Sep 2026 12:54:05 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu, 10 Sep 2026 14:54:09 +0200 (CEST)
Date: Thu, 10 Sep 2026 14:54:04 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ziran Zhang <zhangcoder@yeah.net>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched: clarify ptrace's effect on task_struct->parent
Message-ID: <aqKobFZ_a_Nvj_Wi@redhat.com>
References: <20260910041721.8135-1-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910041721.8135-1-zhangcoder@yeah.net>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 09/10, Ziran Zhang wrote:
> The current comment for the parent field does not explain that it can be
> temporarily replaced by the tracer when the task is being ptraced.
> 
> This can lead to confusion, so clarify the comment to document this
> important behavior.
> 
> No functional change.
> 
> Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
> ---
>  include/linux/sched.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 705970d07..977859a63 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1093,7 +1093,11 @@ struct task_struct {
>  	/* Real parent process: */
>  	struct task_struct __rcu	*real_parent;
>  
> -	/* Recipient of SIGCHLD, wait4() reports: */
> +	/*
> +	 * Recipient of SIGCHLD, wait4() reports. Normally the same as
> +	 * real_parent, but temporarily replaced by the tracer while the
> +	 * task is ptraced.
> +	 */
>  	struct task_struct __rcu	*parent;

Well. Not sure this comment needs to be updated...

Anyway, this looks like overdocumentation to me. Perhaps just

	/* Recipient of SIGCHLD, wait4() reports: ->real_parent or ptracer */

?

Oleg.

