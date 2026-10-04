Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E06424D41
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791119678; cv=none; b=UPljSIIpQ66CY8YkstXCQXAMhfjlG9nPMy73QuTe3EZq8vBb1AQy3cu+0c1miECPvJzdHm4pzYqVS6R7ZAMB+54yyBqumnh5h4Rps5+BZvxnOJJEzTRGKsxhYCZ9RC//TZRiDb20cXcwp42irJI6vuw+ZwnmbN/glbsDSEPOpZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791119678; c=relaxed/simple;
	bh=5k6EYyLB7paad5xAmFDa3Q/EgnBn0KBSGDyDjS4Ad4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZ9yvmN8SOTcDDSx1KjOksuJ1UBmf130N94xlAoZC0HvrYJQwqzTaizADBMpas8F3sVK+qFFl0v0jXEy+Icf2/1RHW7M57Vm0bwqN7yu1MKzT8BqB9kksOo1vdA1rE9YwbFZ4MZnhYSRcr7imOCu59MpcMnG7GfDQjwLLdRG994=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dzN0QWLo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dzN0QWLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791119674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0WKrw2HyjZgoshiiErJGu6bjG9C7Yko6UdCF8cUeD+Q=;
	b=dzN0QWLoAmNhqKzGs80SGo9u3uPNVESAFW7Z8ZKAnslhMkwbpHh4PvHskImjw+QTmyAjpt
	9W7QBkOL89yowhMbJPb3Tsnnh0FganuQqXN5Pg36UvQScfaRtVTyDlj4ExFyCTXibA1s3i
	NoVMJzt8C/NHwJdBRk9NlBLb0x+gT/Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-493-yrteLjd8NympnJjAQTXmnw-1; Sun,
 04 Oct 2026 09:14:31 -0400
X-MC-Unique: yrteLjd8NympnJjAQTXmnw-1
X-Mimecast-MFC-AGG-ID: yrteLjd8NympnJjAQTXmnw_1791119670
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC60C1955D7B;
	Sun,  4 Oct 2026 13:14:29 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id AB9281800446;
	Sun,  4 Oct 2026 13:14:27 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun,  4 Oct 2026 15:14:29 +0200 (CEST)
Date: Sun, 4 Oct 2026 15:14:26 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Babanpreet Singh <bbnpreetsingh@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
Message-ID: <asJRMhSXz5XhljNi@redhat.com>
References: <20261002012141.7-1-bbnpreetsingh@gmail.com>
 <20261003182224.2171b574@pumpkin>
 <asIwpkNr9bF6gk6Q@redhat.com>
 <20261004125118.7de53b47@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004125118.7de53b47@pumpkin>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 10/04, David Laight wrote:
>
> On Sun, 4 Oct 2026 12:55:34 +0200
> Oleg Nesterov <oleg@redhat.com> wrote:
>
> > Yep. That is why do_each_pid_task() needs tasklist_lock.
> >
> > This is the known fact, let me quote the part of my old email
> > https://lore.kernel.org/all/20200512150936.GA28621@redhat.com/
> >
> > 	> Currently the tasklist_lock is shared mainly in order to observe
> > 	> the list atomically for the PRIO_PGRP and PRIO_USER cases, as
> > 	> the actual lookups are already rcu-safe,
> >
> > 	not really...
> >
> > 	do_each_pid_task(PIDTYPE_PGID) can race with change_pid(PIDTYPE_PGID)
> > 	which moves the task from one hlist to another. Yes, it is safe in
> > 	that task_struct can't go away. But still this is not right because
> > 	do_each_pid_task() can scan the wrong (2nd) hlist.
> >
> > Somehow I thought this was documented, but it isn't. And this is not obvious.
> > I think this deserves a comment above do_each_pid_task(), will send the patch.
>
> I guess the rcu protection lets the task exit without holding the lock?
> Is that really significant given the other things that happen during task exit.

Sorry, I don't understand your question...

> Could do_each_pid_task() use hlist_nulls_for_each_entry_rcu() and rescan
> if it got the wrong terminator.
> Or does scanning twice cause grief as well.

I don't think it can. Say, __kill_pgrp_info() is a "typical" user of
do_each_pid_task(). What can it do if it detects that get_nulls_value()
doesn't match after the main loop? The signal was already sent.

Oleg.

