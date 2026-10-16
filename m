Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458F2384CDD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122201; cv=none; b=X3rkGu/Vuumi/AzZ0OdOGAUCrfpg9kI4ln6HUwLm/Aam7v7iGWAnJFNqA2sT7N8SRTUPCmlVNd7lSpKQVo63I4CIm1WfBDSooy/N02BU0lfoCjyxGcLs1B5dQ+qfaF2Tdfm/n7kf1PrysvNHFx97dnlrLxBy2sKTud3ldM2kRoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122201; c=relaxed/simple;
	bh=+J6k6lNd/PIoukPx3c+tVaJBZKkU2E7+0YqujmHjB4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4v9eOmMal3WLjv805Bl4deChPiKPe+bShmXfu/cF/hEqD1v1iywddsHv5AXKyOyNrRzMrk5nMMVn7od/JUCCLJM8Lva4zvg0/isT4rKIuC7MKPXQKRWm8UAQ/+RQTmER3S28oUin7bpsP/IhfIjszZxTubhRBqDqaQWmYtnDZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Axq09307; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Axq09307"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792122199;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=35iZ9CbUW+9nJvaNt42378bng4HFqfIKeK///WDblWw=;
	b=Axq093076XBED3KD2SCrF5SvsqlapzPhiz6STOXmZbGoY9BJqdoURWCMSLi56j9jF0rjJv
	25hPaI6PLvrr1z9Qklj6UD5X035SaTZUV3G+xwLL2K64HfkXPhwSjhy1hYrmWiViCZFAqQ
	QDf7YQfyLA0lBEvQ5H7nQw5NHOC4Pqs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-519-BfR3iql9POGjJ4b9FNNAmQ-1; Fri,
 16 Oct 2026 03:43:17 +0000
X-MC-Unique: BfR3iql9POGjJ4b9FNNAmQ-1
X-Mimecast-MFC-AGG-ID: BfR3iql9POGjJ4b9FNNAmQ_1792122196
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6BFD8195604B;
	Fri, 16 Oct 2026 03:43:16 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D227B195607F;
	Fri, 16 Oct 2026 03:43:15 +0000 (UTC)
Date: Thu, 15 Oct 2026 23:43:14 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC printk] printk: Postpone kthread startup
Message-ID: <atGbnylGSui25f9E@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <87ecdrqfhw.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecdrqfhw.fsf@jogness.linutronix.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi all,

On Thu, Oct 15, 2026 at 03:13:23PM +0206, John Ogness wrote:
> There have been various bug reports related to SMP systems hanging
> on boot. The reports vary wildly but seem to have some overlap with
> regard to missed IPI's during SMP setup. The reports also show that
> reverting NBCON console usage allows the bugs to disappear.

FWIW, in some of those cases, the issue tends to be exacerbated by problematic
hardware. Some of the reports were coming from platforms running older microcode
that have had known issues on "complex workloads" with SMT enabled.

> 
> The NBCON kthreads for console printing are started very early
> during boot using early_initcall(). Since these kthreads are
> actively enabling/disabling interrupts during early boot, they may
> be interfering with SMP setup.
> 
> Postpone kthread starting until after all arch initcalls have
> completed.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
> @pmladek: This patch came about from the RedHat reports we were talking
> about at LPC. Derek is still doing final testing, but this patch most
> likely fixes the issue. We probably will want this for the 7.3-hotfix in
> order to preempt any other surprise bug reports.

I am wrapping up my last set of trial runs here, but I haven't been able to
reproduce the issue using the "conventional" methods we've discussed. I would
just like to confirm "once and for all" some of the noise I am seeing is caused
by some network instability or whatever. I should be done with it soon.

> 
> It would be nice to start the kthreads sooner, but it is not worth
> possibly hanging some sensitive (buggy?) hardware.
> 

buggy is an appropriate word too :)

>  kernel/printk/nbcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index f05cc90123bd4..04fdd71b37e55 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1475,7 +1475,7 @@ static int __init printk_setup_threads(void)
>  	console_list_unlock();
>  	return 0;
>  }
> -early_initcall(printk_setup_threads);
> +subsys_initcall(printk_setup_threads);
>  
>  /**
>   * nbcon_alloc - Allocate buffers needed by the nbcon console
> 

Cheers,

-- 
Derek <debarbos@redhat.com>

