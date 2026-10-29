Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309496;
	b=bkjboa1gyp+Mx2FuGKc465aocnd+7jpk9MJDTrhOa4rNGXErdBgoyY1yIiz4xtYOc0Ha
	 Uvn42xzl89+rTjHTAlid8GDNtG6xaaZOBqCmDqq2rRDvBMFnC3A3Gjh506E7ylrTAOJRR
	 QjVvR6aDwrEF8A18iy5utHNE8QvGi75RIQpA/M52iiehSinoMavrPdAvOHWb+QBZ0/QoI
	 tv9eI8kTc3+YW0+piBR3VeK2gnzwb6dd5XUqQaXmEOlFcyl4exYAvBXc9s/qr8dUj6PdL
	 fWnnlWoZ9sQS4bT2WADXPOsT5wkfGvzOFxwvbwv0BLLy77wqNm13KiJGYQyjOu8gIPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309496;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=BshqI0ODPfwBdtv44RiABJDFcgwOhUywLdyEsT1OJp8=;
	b=yWyyHV43Mzst07jlPQrSWjIWvpm4q0BPwt/7k9RYlrDaAYEvZAooc+nPDnZ5N4iR0cbz
	 fYkXJagvu16ksMLxJ63VMwkJgCsV/mQUoZLRx6lkQC2d8p7349qbDeoDLewR0fIIJ1chC
	 ZPsD1z0NW8+ZXsYVZTVRMTqfcyGdsL9DaTpxzusWzdUqM0IzmMvKwDEi0C2/TOUsZWdz+
	 l1DZd2dV+RVDFFhM7T6ZUivwmyiNCSxo8ZLR+h+QqgtAuMnL+aXnWrd0AuHWPDtuf8VXG
	 X84uhGizCrx7Y6PZdfIjzFN7dMy1sbyu0GSJBUbhZh8r8gyiGvQklDD9P5HjHqMmNKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V4kWCEfA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3B2606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V4kWCEfA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793309494;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=BshqI0ODPfwBdtv44RiABJDFcgwOhUywLdyEsT1OJp8=;
	b=V4kWCEfAFJK1+X2RH2AmzBpgyzMp08HInAvGZYboD21NXRzIUcXJrAarFcmLaVMy2Hhp2A
	QT8Ul7tQnoSf8wv4LBhmyCfbTnxiZmXMNj0iYaNwDHmzGdemDABy2e2Nt7EM4b+d6zk8Ii
	JWM/XCW+KD8dzYJdFaWZjNnNLpqnHjk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-342-9A7_8gxnMlulxo_ly1CiVw-1; Thu,
 29 Oct 2026 17:31:31 -0400
X-MC-Unique: 9A7_8gxnMlulxo_ly1CiVw-1
X-Mimecast-MFC-AGG-ID: 9A7_8gxnMlulxo_ly1CiVw_1793309490
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AACA019560B4;
	Thu, 29 Oct 2026 21:31:29 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E5BED1956088;
	Thu, 29 Oct 2026 21:31:28 +0000 (UTC)
Date: Thu, 29 Oct 2026 17:31:28 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, printk@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH printk] printk: Avoid multiple unregistration in
 unregister_console_locked()
Message-ID: <auOyyCup1fTYvM_z@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20261029152454.638952-1-john.ogness@linutronix.de>
 <87y0bgwm0y.fsf@jogness.linutronix.de>
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
In-Reply-To: <87y0bgwm0y.fsf@jogness.linutronix.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Thu, Oct 29, 2026 at 04:48:53PM +0106, John Ogness wrote:
> On 2026-10-29, Sashiko wrote:
> >> @@ -4471,6 +4493,9 @@ static int __init printk_late_init(void)
> >>  		}
> >>  
> >>  		unregister_console_locked(con);
> >> +
> >> +		/* Changed console list, may require printer threads to start/stop. */
> >> +		printk_kthreads_check_locked();
> >>  	}
> >
> > Should printk_kthreads_check_locked() be called after the
> > hlist_for_each_entry_safe(con, tmp, &console_list, node) loop in
> > printk_late_init() rather than inside the loop body?
> >
> > In kernel/printk/printk.c:printk_late_init():
> >
> >	hlist_for_each_entry_safe(con, tmp, &console_list, node) {
> >		if (!(con->flags & CON_BOOT))
> >			continue;
> >		...
> >		unregister_console_locked(con);
> >
> >		/* Changed console list, may require printer threads to start/stop. */
> >		printk_kthreads_check_locked();
> >	}
> >	console_list_unlock();
> >
> > Because printk_kthreads_check_locked() is placed inside the loop,
> > unregistering the last boot console sets have_boot_console to false and
> > immediately attempts to start printer kthreads while the loop is still
> > iterating over console_list.
> >
> > If kthread creation in legacy_kthread_create() or nbcon_kthread_create()
> > fails for the console stored in tmp, printk_kthreads_check_locked() calls
> > unregister_console_locked() on that console, removing it with
> > hlist_del_init_rcu(), freeing nbcon resources, and invoking console->exit().
> > On the next iteration of printk_late_init(), con is set to tmp, accessing the
> > already-unregistered console and terminating the walk early because
> > hlist_del_init_rcu() cleared tmp->next.
> 
> Geez, sorry. Obviously printk_kthreads_check_locked() needs to be
> outside of the hlist_for_each_entry_safe(console_list) loop. That was
> the whole point of the series!
> 
> I will wait a day for v2 in case there is any feedback regarding my
> comments (or lack thereof).

Thank you for adding in the comments above check_locked and
unregister_console_lock :)

In fact, It looks like it even helped Sashiko catch this.

Once v2 is live I will pull it down and spin some tests.

> 
> John
> 

-- 
Derek <debarbos@redhat.com>

