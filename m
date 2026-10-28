Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209577;
	b=YyUBiwGEjqB0sjXSMe/F7ZyM4tIiGWOONgoOMgHOrTR8v14CJzRLkwnRV+BiFhjNjTvj
	 ghantPgfEZXqyO2PPxPvjeFw5dL5/iy/xh/lvepuDc7aolZzn1epJmAlaEZGLMAoBZNvR
	 IYqtdNW35Ku7xEnTgMePMe3Bg6pMfQHZmyEvZjiROB92+G9bQDHF/fy29O5lmJs9uZI6b
	 /YNhPWnU+XfT4ZKjiyhH2Y77o+u4l6U7eRdEuNx1ZgCZZuKp+P942rFn9xuXzb3ZN8q5N
	 QiOrhwPBmjaX2lNr9OuIRjfp9tMy0mCfjNAq8d3ts/TzCAbjG5vVm7wcryrEGyDAJog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209577;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=un6PEbsCXrKJCD8T9XZ4ZY/mJef0LDqJ9J/ZAe775Z4=;
	b=GcKVJu4RJU2lrjagspx68rvy2MtT232L+nIPmJYQBmovTc0LMkOqVR/EWUF6VI94V+fL
	 sif7poH6ccRsjFi4DeUNETLNrFT7536UFACQCIIMWR6HhnA348TA2F+X6+efztr6AiYC0
	 FT+hqvYV2ypiAtUc9MdoH6jtz/oVsWQwfA0MY5bwx8qLqi8Fm2vYuYMXrQVuCwjZD7RDq
	 v5w1J8wcdSe2w2JjqBg+c8hfu6NAS+Fx5Nbw28BWamEUNW7qXhFFlHaa4sEdBClxPkSql
	 9OwiKYp/1n2A6sCEpbDXWfyf0zwR8QFPtitq0wxXq/tOk1LaJe7vdaWZ8gpXV0a2+5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=siv4XylN;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79DB606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=siv4XylN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=un6PEbsCXrKJCD8T9XZ4ZY/mJef0LDqJ9J/ZAe775Z4=; t=1793209576; x=1794073576; 
	b=siv4XylNS3QsGLcvU6hq+dka46eqdMPeStFBTMdphbUDKe06skGmliF1wVgt7kQTc2yGxiU0FJP
	qIwitdgFulRr7Cv2jN6Rlz8xAz333XiVezEPm7Np0ZkQPqqt5pcc3d9RPW1RuPv4kC/lkaDSeaS/s
	H602mCWIybMT3xm6BQmaz7lbtIDseWM1XEDcrU6d8B2XmupyHBQOWUFdgXq4svHjMiIJs+WykEBNN
	3Nm1ufmYNnUKIaQPsfTBx08UTbg/pYAHsxK8rFFs/RZCfC7gij12qHiDfS9Qh9BcXkHCysf6Y1Od2
	teUyH+Zw/p1WOzjFhnpDNVEXKzVlljJt18Tg==;
Received: from mail-dl1-f45.google.com ([74.125.82.45])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xM7j5-00HVMX-O6
	for linux-kernel@vger.kernel.org;
	Wed, 28 Oct 2026 13:46:15 -0400
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so144825c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:46:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwA4DsvxXjUmuPT05CSc/V+FhejF5FeBZCWP8A/MVrIa76UtCC7+MvwLYCQqHEZ8hneB/cIOigFilZwKr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD+Eg1xTLuo/+QGepMjT6IxaY5FbnD0xigiNaREarcRnYKH/G7
	bW1AFg0bMj0NvKAjefh7Nj+zIefCi/Aw2dGoikAuoynTZY8VNhWm7TRo+sYZKdRKKtvNy2UHnB1
	qef9d9B5+DxYOi954EjV9dHC34Ni6HA0=
X-Received: by 2002:a05:7022:ea8b:b0:1a2:a5b1:884f with SMTP id
 a92af1059eb24-1a6ce2fec4amr3945144c88.31.1793209574611; Wed, 28 Oct 2026
 10:46:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027025055.842038-1-nickolai@csail.mit.edu> <auIGv1WkQnEw6VRd@redhat.com>
In-Reply-To: <auIGv1WkQnEw6VRd@redhat.com>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Wed, 28 Oct 2026 13:46:03 -0400
X-Gmail-Original-Message-ID: <CADGQE7EusFrrSoBnhXhdE20tZJrp1EDe=2623mS8vEMY9hn53A@mail.gmail.com>
X-Gm-Features: AclHuK__dG-fto1aFKuDLQOh0r61gdgXIsPC-Alk15uTIRMSgbj-XH6A-kAkg8U
Message-ID: <CADGQE7EusFrrSoBnhXhdE20tZJrp1EDe=2623mS8vEMY9hn53A@mail.gmail.com>
Subject: Re: [PATCH v1] signal: fix endless loop in complete_signal() during a
 non-leader exec
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:29=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wr=
ote:
>
> On 10/26, Nickolai Zeldovich wrote:
> >
> > The curr_target walk uses next_thread(), which wraps from the last
> > thread to ->group_leader on the assumption that the leader is first on
> > signal->thread_head. de_thread() makes the exec'ing thread, the last
> > one, the leader before release_task() unlinks the old leader, so a walk
> > that starts at the old leader stays on the new one if that thread
> > blocks the signal, and never gets back to curr_target.
>
> ...
>
> > --- a/kernel/signal.c
> > +++ b/kernel/signal.c
> > @@ -990,7 +990,10 @@ static void complete_signal(int sig, struct task_s=
truct *p, enum pid_type type)
> >                */
> >               t =3D signal->curr_target;
> >               while (!wants_signal(sig, t)) {
> > -                     t =3D next_thread(t);
> > +                     /* during de_thread() the leader may not be first=
 */
> > +                     t =3D __next_thread(t) ?:
> > +                         list_first_entry(&signal->thread_head,
> > +                                          struct task_struct, thread_n=
ode);
>
> I think we should fix (and simplify) next_thread() instead. How about
>
>         --- a/include/linux/sched/signal.h
>         +++ b/include/linux/sched/signal.h
>         @@ -764,7 +764,7 @@ static inline struct task_struct *__next_thre=
ad(struct task_struct *p)
>
>          static inline struct task_struct *next_thread(struct task_struct=
 *p)
>          {
>         -       return __next_thread(p) ?: p->group_leader;
>         +       return list_next_entry_circular(p, &p->thread_node, threa=
d_node);
>          }
>
> ?

This seems plausible (presumably with &p->signal->thread_head as the
head), though I think it ends up being a more involved fix.

One thing that would break is cgroup_attach_task() and
cgroup_migrate(): they call while_each_thread() while holding
css_set_lock but not tasklist_lock or siglock.  If cgroup.procs is
written with the pid of a zombie leader that its parent meanwhile
reaps, the walk starts at a task that is already off thread_head,
which is now empty, and next_thread() returns the list head as a task.
(Confirmed as an oops in qemu.)

One option might be to have next_thread do:

  return __next_thread(p) ?:
    list_first_or_null_rcu(&p->signal->thread_head,
      struct task_struct, thread_node) ?:
      p->group_leader;

or convert the cgroup walks to for_each_thread().

Also, since check_unsafe_exec() walks under rcu_read_lock() alone,
should next_thread() keep a single READ_ONCE() of ->next, as
__next_thread() does, instead of list_next_entry_circular()'s two
plain loads?

Happy to send a revised patch along any of these lines, or also feel
free to take it over if that'd be easier for you.

Nickolai.
