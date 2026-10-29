Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793276930;
	b=QUNksQIP2U4Z7ygn+Jc59GIoYGQ1c0vdBi1oNvgFHWfRyisZ4TzY/O/XshxsncvdnXie
	 HedB5R4HGkx+hTNQWFpzCSYkuvWuyf1uRyhaw99qiHdmGYW1fAxNE1mGfo8aSS3jDC+xq
	 g1QdgGLOsCD09kK10m305EpxnuaY1dJtauDr/f37XfHBGK00zNfLFZXMwj3r3yGblciI/
	 zEhxKpH/oWMc71QOepZDo30oS9yJzvk9wdTrE9DSJ6S7wEe3Zoj0THS9v+ovsKiiZpALZ
	 A98TU7Klb0BAxKGrUJ5RQOl1RIK2Wx9UsWG7yhEZWJiEbIsPlai2Es2RAdOyZPVPU7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276930;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Scanned-By;
	bh=WdTTHjY1eTGCGObSTq/vQMNmKdIkyWv7vWrju5mi8Ag=;
	b=FzDVZ6Gi/NMoAkQ6ApFgjjsJf9A1lkGzV27xsbx2wKQb3oGGkLniYnIiZnJzOI0Ri3ha
	 I2+W0HW2iJKsLBO9WaetQvxDQ75m3Zyj6+5/79VCdIJKdKBaZ/F4r7Hfl/Is3hgP2mhAy
	 BPmE5ai92X/Ab45BIdk0iJROZbhpEBtGJsFzIARxaUcRhjEf88CIqliCrsHjsvXk4hLon
	 iO8NWYcqpK0xvJVKBnR/w2tbX5MVONyGXVJ8ff31uRkNijdAPCSt/nWuTa33WuLA9HdeS
	 P+gD/cWDIOC4ebWVM/pOknA/IQzfmqSzX442wD7Ljg4dzF/oVYEEwmOFm0yYswyDvkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdXdzLvU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1BB606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E1BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdXdzLvU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793276929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdTTHjY1eTGCGObSTq/vQMNmKdIkyWv7vWrju5mi8Ag=;
	b=gdXdzLvUA2VQ/uCVpJPrCtYaGfkfSgdCSXuBdNZhZPlDEHlEzSJiaK6XOkWhx4Cim77eYu
	xrhQP46s9Hkbt0pppFgkgQ0cvAIV7CoNiywfl0Mm9iKQileiXXVgbY1JXl135edH1Kp6Uj
	hNqZ9vLs+RKQe3ohwALcxUF6EBY5Aag=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-1l29qW_6NymzTzvi8w3NbQ-1; Thu,
 29 Oct 2026 08:28:45 -0400
X-MC-Unique: 1l29qW_6NymzTzvi8w3NbQ-1
X-Mimecast-MFC-AGG-ID: 1l29qW_6NymzTzvi8w3NbQ_1793276924
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E5CC19540C3;
	Thu, 29 Oct 2026 12:28:44 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6031A1971E50;
	Thu, 29 Oct 2026 12:28:42 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Thu, 29 Oct 2026 13:28:43 +0100 (CET)
Date: Thu, 29 Oct 2026 13:28:41 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] signal: fix endless loop in complete_signal() during
 a non-leader exec
Message-ID: <auM7-dpXdaNZQFFc@redhat.com>
References: <20261027025055.842038-1-nickolai@csail.mit.edu>
 <auIGv1WkQnEw6VRd@redhat.com>
 <CADGQE7EusFrrSoBnhXhdE20tZJrp1EDe=2623mS8vEMY9hn53A@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADGQE7EusFrrSoBnhXhdE20tZJrp1EDe=2623mS8vEMY9hn53A@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/28, Nickolai Zeldovich wrote:
>
> On Wed, Oct 28, 2026 at 10:29 AM Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > I think we should fix (and simplify) next_thread() instead. How about
> >
> >         --- a/include/linux/sched/signal.h
> >         +++ b/include/linux/sched/signal.h
> >         @@ -764,7 +764,7 @@ static inline struct task_struct *__next_thread(struct task_struct *p)
> >
> >          static inline struct task_struct *next_thread(struct task_struct *p)
> >          {
> >         -       return __next_thread(p) ?: p->group_leader;
> >         +       return list_next_entry_circular(p, &p->thread_node, thread_node);
> >          }
> >
> > ?
>
> This seems plausible (presumably with &p->signal->thread_head as the
> head),

Yes sure, I obviously meant head == &p->signal->thread_head ;)

> One thing that would break is cgroup_attach_task() and
> cgroup_migrate(): they call while_each_thread() while holding
> css_set_lock but not tasklist_lock or siglock.  If cgroup.procs is
> written with the pid of a zombie leader that its parent meanwhile
> reaps, the walk starts at a task that is already off thread_head,
> which is now empty, and next_thread() returns the list head as a task.

Yes, thanks...

> or convert the cgroup walks to for_each_thread().

(perhaps this makes sense regardless, but we should not delay your fix)

> Also, since check_unsafe_exec() walks under rcu_read_lock() alone,
> should next_thread() keep a single READ_ONCE() of ->next, as
> __next_thread() does, instead of list_next_entry_circular()'s two
> plain loads?

IOW, we need list_next_entry_circular_rcu() we do not have yet.

Thanks Nickolai, I am starting to agree with your fix, we can do cleanups
later.


But, unless I missed something again, complete_signal() can safely use
list_next_entry_circular(). And to me

		while (!wants_signal(sig, t)) {
			t = list_next_entry_circular(t, ...);

certainly looks more simple/clean than __next_thread() + list_first_entry().

If you agree and see nothing wrong, can you send V2 please?

Oleg.

