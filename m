Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD62AE76
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791111343; cv=none; b=USj0Pb8umsXphXQ2lyralttkE7wi51Gc2wQtMVb/P2T48rgje0memyFQAnZMmFEm+2pRpo4A8+QJG5d07nFmDUUt0BQINRwsLi61IB3oEfYLviClaow4l3HUGOpdwy+wDX5I0uRyEUQbN1HSDPFg0XLkreIY2JwZiMLbF41E4p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791111343; c=relaxed/simple;
	bh=kNuuBbyxYN3E8NBSQSTa12j9Xbd/aUt5iR6VHVS/HG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTZMWEkEJk+HKWBjUg1ioZwNMLIu8pXkYlptOWNjNk/h/OCoW2cs1lNQ2DtzkR1ud701r2Eh8RBgUHGAerOo3/4JN1SMnViSml/H/BF+Gv0eNIIlYcEbPsLYTerzILzOAXVXWZr+EXTVM8pmZ2tmNgFzQeTOFjIIXi9X3JjmpnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cQOCOn7P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cQOCOn7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791111341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7+owvvkHEXqqx1fYEUwRKN6qErhX0u22H9ies2dMo8=;
	b=cQOCOn7PMlcelKdjE995gOtQ0qDO+HNuSjVKL0Ntl+KTPw2Uql4IDtNPIPK1fO4Gav2/bC
	Q+SmtUTDSyITxfinMdKK/1Dmg0rb29JGtO3uHJtnXeQaXKFhELecHolFAhrDhXyXyobif1
	22i9wOPe2f4Euoa3Cjuhx5lpQZ4k/I4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-680-9XyyRRYKPa-Bqu11BoR5fw-1; Sun,
 04 Oct 2026 06:55:39 -0400
X-MC-Unique: 9XyyRRYKPa-Bqu11BoR5fw-1
X-Mimecast-MFC-AGG-ID: 9XyyRRYKPa-Bqu11BoR5fw_1791111338
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 240E21809C8D;
	Sun,  4 Oct 2026 10:55:38 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id CC3CD1956041;
	Sun,  4 Oct 2026 10:55:35 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun,  4 Oct 2026 12:55:37 +0200 (CEST)
Date: Sun, 4 Oct 2026 12:55:34 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Babanpreet Singh <bbnpreetsingh@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
Message-ID: <asIwpkNr9bF6gk6Q@redhat.com>
References: <20261002012141.7-1-bbnpreetsingh@gmail.com>
 <20261003182224.2171b574@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003182224.2171b574@pumpkin>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 10/03, David Laight wrote:
>
> On Fri,  2 Oct 2026 01:21:41 +0000
> Babanpreet Singh <bbnpreetsingh@gmail.com> wrote:
>
> > KCSAN reports pid_alive() reading task->thread_pid while it gets cleared
> > under tasklist_lock. The check only cares about NULL, so READ_ONCE() and
> > WRITE_ONCE() are enough.
>
> I just looked at change_pid() - isn't it completely broken?

No, but...

> __change_pid() uses hlist_del_rcu() to remove the item from a list.
> IIUC this leaves the 'next' pointer valid to allow for concurrent readers.
> I thought that had to stay valid until the end of the rcu period.
> But the following attach_pid() adds the item to another list.

Yep. That is why do_each_pid_task() needs tasklist_lock.

This is the known fact, let me quote the part of my old email
https://lore.kernel.org/all/20200512150936.GA28621@redhat.com/

	> Currently the tasklist_lock is shared mainly in order to observe
	> the list atomically for the PRIO_PGRP and PRIO_USER cases, as
	> the actual lookups are already rcu-safe,

	not really...

	do_each_pid_task(PIDTYPE_PGID) can race with change_pid(PIDTYPE_PGID)
	which moves the task from one hlist to another. Yes, it is safe in
	that task_struct can't go away. But still this is not right because
	do_each_pid_task() can scan the wrong (2nd) hlist.

Somehow I thought this was documented, but it isn't. And this is not obvious.
I think this deserves a comment above do_each_pid_task(), will send the patch.

Oleg.

