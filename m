Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8B3B9DAD
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791112321; cv=none; b=pwtzxryfRNb0lx2ZWCh0nrNXZs3Wnl+cpQY2IHoS47Pwwsqr1HGAAOhuVz/UZ4lzJmBKjDokirun6DOFlcONY5aiXL1kJygndHI11s0Z2lBUTAaTCYt7+WgBzqrS6oWCR77IX8wjnNK/DChVhGL7D3jIk2+hr8XkGbr1IrK/KWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791112321; c=relaxed/simple;
	bh=rSsb7KPz6crJaY7ribgEsdyMbDiXOxo+9JqFSFFdGKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Trc7xSDwu3uXHmnbMfyJIEcUG7eJqddKKKUXPe1XWRP+ECNZ5mUNS9L6ffp5/u5kkaOBaWd2xrmW/aOAhxcF9szzlOwvF0m2W7rqKcJGAmUn6FsvfVgZ66SEJXH78fEB3yuOUC159PUiNOMAc8hMKTfqBRn75RI9p2BsthcxU6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZ2iOFun; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZ2iOFun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791112313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KcJ9fxI4hcDqeO5QcpopVFh0h8Sk7iTHJhwuj7Tm3iA=;
	b=IZ2iOFuneEDaiU9V/t58iOi3qC9cVDKqArNtjOA4N/JhF/cXAKo1BDy7h1pK1w9XOmVA/X
	WONOH2xMsiubQExCI4ZkTPiwtIF+YvEPIFbvJwYAKcKzVONN2GernHQ8g7a4KPHWNrt7sf
	6qyKxZWs/+pMuZ5NFncgW9+qT1qqFwY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-363-9PvedJizOoqrwHFHksWAdA-1; Sun,
 04 Oct 2026 07:11:49 -0400
X-MC-Unique: 9PvedJizOoqrwHFHksWAdA-1
X-Mimecast-MFC-AGG-ID: 9PvedJizOoqrwHFHksWAdA_1791112307
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF74C190FF91;
	Sun,  4 Oct 2026 11:11:46 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2C4E9180049F;
	Sun,  4 Oct 2026 11:11:43 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun,  4 Oct 2026 13:11:46 +0200 (CEST)
Date: Sun, 4 Oct 2026 13:11:43 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: David Laight <david.laight.linux@gmail.com>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>
Cc: Babanpreet Singh <bbnpreetsingh@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
Message-ID: <asI0b1_kZ7lei1kx@redhat.com>
References: <20261002012141.7-1-bbnpreetsingh@gmail.com>
 <20261003182224.2171b574@pumpkin>
 <asIwpkNr9bF6gk6Q@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asIwpkNr9bF6gk6Q@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hmm. grep finds send_sigio() and send_sigurg() which use do_each_pid_task()
without tasklist.

00633c4683828acd ("fs/fcntl: fix SOFTIRQ-unsafe lock order in fasync signaling")
is wrong.

I'll send email in reply to that patch, I wasn't CC'ed...

Oleg.

On 10/04, Oleg Nesterov wrote:
>
> On 10/03, David Laight wrote:
> >
> > On Fri,  2 Oct 2026 01:21:41 +0000
> > Babanpreet Singh <bbnpreetsingh@gmail.com> wrote:
> >
> > > KCSAN reports pid_alive() reading task->thread_pid while it gets cleared
> > > under tasklist_lock. The check only cares about NULL, so READ_ONCE() and
> > > WRITE_ONCE() are enough.
> >
> > I just looked at change_pid() - isn't it completely broken?
>
> No, but...
>
> > __change_pid() uses hlist_del_rcu() to remove the item from a list.
> > IIUC this leaves the 'next' pointer valid to allow for concurrent readers.
> > I thought that had to stay valid until the end of the rcu period.
> > But the following attach_pid() adds the item to another list.
>
> Yep. That is why do_each_pid_task() needs tasklist_lock.
>
> This is the known fact, let me quote the part of my old email
> https://lore.kernel.org/all/20200512150936.GA28621@redhat.com/
>
> 	> Currently the tasklist_lock is shared mainly in order to observe
> 	> the list atomically for the PRIO_PGRP and PRIO_USER cases, as
> 	> the actual lookups are already rcu-safe,
>
> 	not really...
>
> 	do_each_pid_task(PIDTYPE_PGID) can race with change_pid(PIDTYPE_PGID)
> 	which moves the task from one hlist to another. Yes, it is safe in
> 	that task_struct can't go away. But still this is not right because
> 	do_each_pid_task() can scan the wrong (2nd) hlist.
>
> Somehow I thought this was documented, but it isn't. And this is not obvious.
> I think this deserves a comment above do_each_pid_task(), will send the patch.
>
> Oleg.

