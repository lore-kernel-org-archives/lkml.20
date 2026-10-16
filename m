Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEF94CB8A3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157810; cv=none; b=C51U7HiFI+CR47zF6NiTFeRtM2P1Ngmsj37/mivEXeAwHYOpxqCNhkNYLZRBJtxiCiMYItprx41o1RRBGe2ZjM8J5JQWtvScBB5qbuplH3zLZtCE7esq+IbRDsKeGPKOg5e9dbAzwKHqo1XCdVFB0IEuk4nGfn92aFuh8COFUTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157810; c=relaxed/simple;
	bh=TvyLAp5j5ZJtU/tryXXq9VFBidMn1M13LshHEZD4lk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1aMK3I5Beujat9P4mXeojLAjbtSipd4WLLdJ05g/iVbG5cmpq+D3O/JRijmRpR0bH8ZN/d2F85tF8FMisAMDaKITU2zyCGaclPIP/NZU8XzWwHwbnWcRRcDfJAH8amHDvXepBMUCX2RRVLCe+FFkeE1bJXVhBXDYckMqBRWMZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GrRCnR5t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GrRCnR5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792157807;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=yXojaIRBd4o821UVZwK/gBp/Ergu5mqdiVdo3KzhSic=;
	b=GrRCnR5tTazOs0qfzf+j5UHlXGrW8aN7fz0Sowvrswq1xXcUmZfgk0bYeCKm/h9qpIH9eO
	OV5MD5AnNo+9MxH3Mxj+7afZiR49p51YIh6AUdA1AAvnFzGJlfmneZ7lLzPtxt+C5Bpwet
	i4jT772HyVCJfgUXODoGDWy+wzmSosQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-7eFS-fJgMqSu0VO4sI8ZsA-1; Fri,
 16 Oct 2026 13:36:44 +0000
X-MC-Unique: 7eFS-fJgMqSu0VO4sI8ZsA-1
X-Mimecast-MFC-AGG-ID: 7eFS-fJgMqSu0VO4sI8ZsA_1792157803
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9C031955F0F;
	Fri, 16 Oct 2026 13:36:42 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 382787DB;
	Fri, 16 Oct 2026 13:36:42 +0000 (UTC)
Date: Fri, 16 Oct 2026 09:36:41 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH printk v2] printk: Postpone kthread startup
Message-ID: <atIndeV-NzO0eIz2@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20261016085441.857695-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016085441.857695-1-john.ogness@linutronix.de>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On Fri, Oct 16, 2026 at 11:00:34AM +0206, John Ogness wrote:
> There have been various bug reports related to SMP systems hanging
> on boot. The reports vary but seem to have some overlap with regard
> to missed IPI's during SMP setup. The reports also show that
> reverting NBCON console usage allows the bugs to disappear.
> 
> The NBCON kthreads for console printing are started very early
> during boot using early_initcall(). Since these kthreads are
> asynchronously enabling/disabling interrupts during early boot, they
> may be interfering with early SMP setup on some hardware platforms.
> 
> Starting the console printing kthreads later has shown to avoid the
> hanging on systems that could previously reproduce the issue.
> 
> Postpone kthread starting until after all arch initcalls have
> completed.
> 
> Reported-by: Derek Barbosa <debarbos@redhat.com>
> Closes: https://lore.kernel.org/linux-rt-users/arPmYPbFLf2EldIl@debarbos-thinkpadt14gen5.rmtusma.csb
> Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  v1: https://lore.kernel.org/lkml/87ecdrqfhw.fsf@jogness.linutronix.de
> 
>  changes since v1:
>  - Reword commit message.
>  - Rebase from 6.6-rt to 7.3-rc.
> 
>  kernel/printk/printk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 0ed86b5e8b160..9a205f94bfac7 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3864,7 +3864,7 @@ static int __init printk_set_kthreads_ready(void)
>  
>  	return 0;
>  }
> -early_initcall(printk_set_kthreads_ready);
> +subsys_initcall(printk_set_kthreads_ready);
>  #endif /* CONFIG_PRINTK */
>  
>  static int __read_mostly keep_bootcon;
> 
> base-commit: 38dfd607b58b63b5488d5756786ee4ee499eebb8
> -- 
> 2.47.3
> 

In the v1 thread, I mentioned that I would leave the reproducer spinning in the
test environment for a few more hours. It has been well over 9 hours. No signs
of the existing issue popping up.

Tested-by: Derek Barbosa <debarbos@redhat.com>

-- 
Derek <debarbos@redhat.com>

