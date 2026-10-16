Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C7E52D2BC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169526; cv=none; b=KkuVcjhe/Ix6d2e1bc1cEZhkCltQjnDrG2Kg6B/WSGTkx7X9ll6UK3yvzTGQ1p8rlFDsGOjIMJVW4G8B6gj0VqGijrtzrRDqn+v+TQZ2xdnm9lyXUr8IemJG4iDQRjax8OcLVXepua6GUgNYkN0wwH6GsGKKMOOzjgyAFu29JwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169526; c=relaxed/simple;
	bh=W5A5RR0SuYkUxR2wxua/CkYjZk4Cl2M9yT2itezgmRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KplmUoprvyky7Pjv1OaXm3dCHodk+FEBI6ijNvemLSpSmCObGrLe5ZvMTfAf6JAvZKYFZ42nlYat+db5D1+bgh7LpE4BZUx1d2yZPxYNQWwYQMiamJrz3p3uHxYF0QykLzZHX5DrD5zbwWxuNMVEJSyPMvxvOvQwKersHL+DpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RWu+iHWq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RWu+iHWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792169521;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=9h659B2RptcGt42FBHhwLceGi5uTr95VBygMYb+FdvI=;
	b=RWu+iHWqqKq9k0tTOdentLcZ7/Sx2R8n28TxZthoW7M+Dt746D5s7BYWvAQrktVpjVmBzQ
	ViKM/8PfNVjSUSEKROCfV4JyzU9gZ15vCri/yqY0Xcoaw2GdZBkhAJMjInZhm5YlWFKVPo
	kIIso/hOsiUHNzcGtAmPbz+aNlqDZjU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209-kqL7C2OrPAWEclzwXyBbdg-1; Fri,
 16 Oct 2026 16:51:55 +0000
X-MC-Unique: kqL7C2OrPAWEclzwXyBbdg-1
X-Mimecast-MFC-AGG-ID: kqL7C2OrPAWEclzwXyBbdg_1792169514
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A6B619560BD;
	Fri, 16 Oct 2026 16:51:54 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B4E857D9;
	Fri, 16 Oct 2026 16:51:53 +0000 (UTC)
Date: Fri, 16 Oct 2026 12:51:52 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH printk v2] printk: Postpone kthread startup
Message-ID: <atJMSFPnU4cjoE7a@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20261016085441.857695-1-john.ogness@linutronix.de>
 <atIndeV-NzO0eIz2@debarbos-thinkpadt14gen5.rmtusma.csb>
 <atI9c_kFhntodl68@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atI9c_kFhntodl68@pathway.suse.cz>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On Fri, Oct 16, 2026 at 05:06:27PM +0200, Petr Mladek wrote:
> On Fri 2026-10-16 09:36:41, Derek Barbosa wrote:
> > On Fri, Oct 16, 2026 at 11:00:34AM +0206, John Ogness wrote:
> > > There have been various bug reports related to SMP systems hanging
> > > on boot. The reports vary but seem to have some overlap with regard
> > > to missed IPI's during SMP setup. The reports also show that
> > > reverting NBCON console usage allows the bugs to disappear.
> > > 
> > > The NBCON kthreads for console printing are started very early
> > > during boot using early_initcall(). Since these kthreads are
> > > asynchronously enabling/disabling interrupts during early boot, they
> > > may be interfering with early SMP setup on some hardware platforms.
> > > 
> > > Starting the console printing kthreads later has shown to avoid the
> > > hanging on systems that could previously reproduce the issue.
> > > 
> > > Postpone kthread starting until after all arch initcalls have
> > > completed.
> > 
> > In the v1 thread, I mentioned that I would leave the reproducer spinning in the
> > test environment for a few more hours. It has been well over 9 hours. No signs
> > of the existing issue popping up.
> > 
> > Tested-by: Derek Barbosa <debarbos@redhat.com>
> 
> Thanks a lot for testing this. It is good to know that it helped.
> 
> I am a bit nervous that we do not know what is the culprit.
> For example, I wonder if the same problem might happen during
> CPU hot-plug at runtime.

FWIW, this fixes a corner-case that seems to affect older platforms that had
been noted to have "issues" with some workloads on older firmware/microcode.

For the cpu hot-plug example, I am unsure of how to properly stress/test that
condition to quell these concerns. I could run a modified version of John's old
console_blast script and take some CPUs on/off-line in a loop with:

    $ echo 1 > /sys/devices/system/cpu/cpu$N/online
    # do some delay here
    $ echo 0 > /sys/devices/system/cpu/cpu$N/online

but I don't think that does a good job of emulating the original bug, where
kicking on the console-printing-kthreads very early in the init process (prior
to smp's secondary cpu bringup) could interfere with SMP setup. I could always
give it a shot.

> 
> Anyway, I had a brain storming session with John and we were not able
> to find any hole in the nbcon API design. We did not find any location
> where it could cause deadlock. All busy loops are under
> con->device_lock(), aka port->lock. And the port lock is taken with
> IRQs disabled. And neither the con->device_lock() nor the busy loop
> is done in NMI.
> 
> So, this rather looks like an existing problem. And the parallel
> handling of the serial console just made it more likely to happen.

I also hold this to be true. Considering I haven't seen anything quite like this
(up until this point) even with older versions of the code, I am chalking it up
to some sort perfect-storm of bad interactions.

> 
> The converted uart 8250 is being used on many production systems
> which are running the RT kernel and got this change from the external
> RT patchset. And I have heard about this problem for the first time just
> a few weeks ago. This makes me believe that it affects only small
> amount of HW.
> 
> This change clearly helped. Which makes me even more confident
> that we could keep the uart 8250 driver converted in 7.3.
> I am going to commit this patch and create a pull request...
> 
> Best Regards,
> Petr
> 

Cheers,

-- 
Derek <debarbos@redhat.com>

