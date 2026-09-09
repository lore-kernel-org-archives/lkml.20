Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92955335A8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950847; cv=pass; b=V+I+8qeosIBdrWgpZ7rv2W4RlnXfLVRrN6bFsWliD1YTmGoWYuW/T91bMKPzjlUMWudsSEtpfoJl/LeYMJV9oWHk110GqdOXHW9HWUO4OeS3nOmCbRlkSjEQ2+252LUaI/VWdxFynPsSxGAZzTwIowX9el+XAV5g4SQikLene7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950847; c=relaxed/simple;
	bh=c8u0G9DIKWY3wWy8HFtAWaGMEPB6ZGP6llC+ZRy104Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDGOtuYgwu+b2kH0mGTvOhDegneqSVRcCIA6KyYk+5d7uc3RDN8pFi31VJBo/J7o8IstGMYOsOQaEh4RT/v/OsacR22K0mvMqpXds4n7vZeywNhPBC3qBgJjg7xRTnZveSL87LvwrrV8v6bJYhFuvwvjmfxve23KTiqTPlYAFzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=K5vcrzUt; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="K5vcrzUt"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2938116fefso63845566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788950843; cv=none;
        d=google.com; s=arc-20260327;
        b=S/Q/1KDs0xeL/YEf/igI292mq5z0fVhge3p2e0I4ZC606qwFy3GjLo0jsBcxuFD7Ug
         695InhVBUEf5liYcHA23uXVOFNcwmhZILPBmToB9w+14SqNaAoB2/wgUsIniOfELZstv
         6Gj4Sydy2gbrPCb+7tafDjeuOraNRyTB+ehzmxe4ZE83msvniSNoPbgnJY76H7BP8iOR
         asPA2fmdy1AHyKERYlzTKXb7hW/uH6VlAwC41lwKHXoCW4uOPkOoysrsHfVvp03JdcAj
         +ZpTLJYgW0xDww0cXDzXqbc6yzUovbVa1VwOAjNsgsxWdMZG+44zdp8h232sufRMcdWV
         yHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KuPrUbZf/fUdetX99DjVi3Kowkh+3S7lPORa/Cu8+p8=;
        fh=KH4BpYjfQbHk0XbH2LK0opxJQkDIzIL1RIOV6Bw2f04=;
        b=h6BoFzodA0h3gQ9wtoVHh8vOBT2ePLzxl8ipsMNNWrHACtKnil15D1vGYNRjRFIugk
         W8RVqasEIfK4dhgOzn0U8IAjtfmS5DQP+/FQo/wyHLgM+wAfSllzs/swqZtDoBf0AX71
         0RybnAiWSMyuNS8oR8adqjddLwK3Ygr8M3nXQVhaHfXxbnRSxuX5mDLcYvwbvI7iu1Ha
         kGuiMggk77TXuKRxAH4ydYerq/SKXH5NzJX0xy7re4l1/1M/xtSfkQVMYlC743/9IPdw
         EdHuUdHwfKsH2NsSEaB8Pn52T8biRTYwANYA3cKsxvx5vR3pW2R8siZbOhTR1hs3A4Nw
         z44A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1788950843; x=1789555643; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuPrUbZf/fUdetX99DjVi3Kowkh+3S7lPORa/Cu8+p8=;
        b=K5vcrzUtilChwK/MPJX5CZQ3+nCjlXcsrIfvIDSQcvZ7DoCbsmViIAE+dwn7nHZPsQ
         BIHDcv2OJNiGyoNcyuxSprar+Z3meDAKbyod7dx0hMYt1VZU9WmLxWwfR43j0iXWPsCE
         v5sJB9AOS6P2iiv8ZiUYu05Vibq/kmOpg8QMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950843; x=1789555643;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KuPrUbZf/fUdetX99DjVi3Kowkh+3S7lPORa/Cu8+p8=;
        b=ousuAfzQQVogQ2wenednaMjGQqsBoDArvV7x5b7QMIpOnuadQ3EucXhhWZWBHBr4Mf
         U+uyP37LtFP1WjQ3Nl/g8HvcMN1qWZwz+ghL1Adk22hjNJ0CJCZ1z37HuBRWV2fYFzS8
         5Dt7eHquTdiHpqGVAnicnpXjw2edfuL6oPEPO6MeymGBMtLm+fOpbQutXfwDKh3C71nO
         cPxkuBGWwLbAYbVh6bBrdchrcZCoMGEpJzQPNuUf86B7OZwatCo3uY00ir1JI/vmAPwW
         shP7AykLZXR4r37Wn0kqi+dCCqSQzV7jMHtsiDOVCQzErJPJfjK/OM4M87Emu8WTR0X3
         u2yQ==
X-Forwarded-Encrypted: i=1; AKwUvBx31kmPGSWtByRntGtdG4BzS3AdzKMLUIpDwcnt6KpZxdlhnUV/uX31g+VldHBgOzpQQWH2VZAA8jY/UBE=@vger.kernel.org
X-Gm-Message-State: AFuF++nF0v/avdz2G9m0K3/xWJcaFbpUOxo7qOLsAweWmTOrLNTxU3HT
	Z7J4QfaJ1wK7A5ogcrOem7Gdn13b2ZT6Xk+eylWzgcqk+WTUWUx6iv4XnUC5qAuit78DZrXP2HV
	li8j5RV8QUo5T6z81naIrd0NNnJg7Bo8XkjCD+5RFRQ==
X-Gm-Gg: AYBFou0sKAQNwIsmdLy/Spu24uw9/mDD7JVIO/XLBasbRQZWoCmv9gV2dPsMVb+qQFU
	sTlFyy5r/hQxwGr/1RhEKNx3CRgC7cJLzzBUqhUxPX/1hXBpdGIQCwOdATCD4mxXsGZQIw9LVea
	qYoAV2lwBG7yiS/iU4REreSUauKkPHR6n9vXqDnV7wpukwkbcIYduuDfZe8JSgKfyiYF5XUu0dM
	t0qoG3NViAHp2OTYsfYyGUE3ZwkqPUYY+1MdhCbfDiy7O4ur+7tcCZkX/uqqWYSYGqMGUHx7o40
	Aegcmiutk2ClWx2GmFBen+FwW8lJK1Y+F7fHY9r+TnRMamxH++GzK8kjLgJW6UxfRYfTkGthgQC
	GEzwkcUQ8jg4=
X-Received: by 2002:a17:907:e1c6:10b0:c26:2c3d:67aa with SMTP id
 a640c23a62f3a-c262c3d7d38mr647675466b.47.1788950843137; Wed, 09 Sep 2026
 03:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-work-unix-passpidfd-v1-0-70cbfda0c7ba@kernel.org>
 <20260831-work-unix-passpidfd-v1-2-70cbfda0c7ba@kernel.org>
 <CAJqdLrooAYAcgzug=+idiPfqsZ0HGaqi29STuw7uzDh7eEB1xQ@mail.gmail.com> <20260909-kredenzen-stock-hyperaktiv-121c1eec9f98@brauner>
In-Reply-To: <20260909-kredenzen-stock-hyperaktiv-121c1eec9f98@brauner>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Wed, 9 Sep 2026 12:47:11 +0200
X-Gm-Features: AcwNN1XVh-ALE8Pd-F1vhWkAcwoJY8Oak9Or6CODFCYe9Lq9EEeN6slL8DKSSVc
Message-ID: <CAJqdLrrt_HhKmSmKr72rUip-_j_eOG-41SoBGcJJGZ=i2pUd6w@mail.gmail.com>
Subject: Re: [PATCH 02/10] af_unix: record the pid of the sending thread
To: Christian Brauner <brauner@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mi., 9. Sept. 2026 um 12:36 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> On Mon, Sep 07, 2026 at 11:55:23AM +0200, Alexander Mikhalitsyn wrote:
> > Am Mo., 31. Aug. 2026 um 13:21 Uhr schrieb Christian Brauner
> > <brauner@kernel.org>:
> > >
> > > Currently only the struct pid of the thread-group leader is recorded.
> > > The identity of the actual thread that sent the message or is connected
> > > to a given socket cannot be retrieved.
> > >
> > > Add the plumbing to make it possible to retrieve a pidfd for the sender.
> > > Nothing uses the thread-specific struct pid yet. No functional changes.
> > >
> > > Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> > > ---
> > >  include/net/scm.h  |  7 +++----
> > >  net/core/scm.c     | 21 +++++++++++++++++----
> > >  net/unix/af_unix.c | 23 +++++++++++++----------
> > >  net/unix/af_unix.h |  3 ++-
> > >  4 files changed, 35 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/include/net/scm.h b/include/net/scm.h
> > > index 86ae6bc109ec..aa7d15c5fc27 100644
> > > --- a/include/net/scm.h
> > > +++ b/include/net/scm.h
> > > @@ -42,7 +42,7 @@ struct scm_fp_list {
> > >  };
> > >
> > >  struct scm_cookie {
> > > -       struct pid              *pid;           /* Skb credentials */
> > > +       DECLARE_PIDS(pid, PIDTYPE_TGID);        /* Skb credentials by pid type */
> > >         struct scm_fp_list      *fp;            /* Passed files         */
> > >         struct scm_creds        creds;          /* Skb credentials      */
> > >  #ifdef CONFIG_SECURITY_NETWORK
> > > @@ -69,7 +69,7 @@ static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_co
> > >  static __inline__ void scm_set_cred(struct scm_cookie *scm,
> > >                                     struct pid *pid, kuid_t uid, kgid_t gid)
> > >  {
> > > -       scm->pid = get_pid(pid);
> > > +       scm->pid[PIDTYPE_TGID] = get_pid(pid);
> > >         scm->creds.pid = pid_vnr(pid);
> > >         scm->creds.uid = uid;
> > >         scm->creds.gid = gid;
> > > @@ -77,8 +77,7 @@ static __inline__ void scm_set_cred(struct scm_cookie *scm,
> > >
> > >  static __inline__ void scm_destroy_cred(struct scm_cookie *scm)
> > >  {
> > > -       put_pid(scm->pid);
> > > -       scm->pid = NULL;
> > > +       put_pids(scm->pid);
> > >  }
> > >
> > >  static __inline__ void scm_destroy(struct scm_cookie *scm)
> > > diff --git a/net/core/scm.c b/net/core/scm.c
> > > index f0d44ecdb11f..9b9e119c353a 100644
> > > --- a/net/core/scm.c
> > > +++ b/net/core/scm.c
> > > @@ -149,6 +149,7 @@ EXPORT_SYMBOL(__scm_destroy);
> > >
> > >  static inline int scm_replace_pid(struct scm_cookie *scm, struct pid *pid)
> > >  {
> > > +       struct pid *thread_pid;
> > >         int err;
> > >
> > >         /* drop all previous references */
> > > @@ -158,7 +159,18 @@ static inline int scm_replace_pid(struct scm_cookie *scm, struct pid *pid)
> > >         if (unlikely(err))
> > >                 return err;
> > >
> > > -       scm->pid = pid;
> > > +       /* A sender naming its own thread-group sends from the current thread. */
> > > +       if (pid == task_tgid(current))
> > > +               thread_pid = task_pid(current);
> > > +       else
> > > +               thread_pid = pid;
> >
> > Hi Christian,
> >
> > The patch looks good to me, but this spot raised some doubts for me.
> >
> > If scm_replace_pid() is called with pid == task_tgid(current) then all
> > good, because we
> > get scm->pid[PIDTYPE_TGID] == pid and  scm->pid[PIDTYPE_PID] ==
> > task_pid(current). All good.
> >
> > If scm_replace_pid() is supplied with pid that has a type PIDTYPE_TGID, then:
> > - scm->pid[PIDTYPE_TGID] == pid. Good.
> > - scm->pid[PIDTYPE_PID] = pid. Doesn't looks correct, shoudn't we do
>
> After chatting with you, I think I get the concern. You think that
> scm->pid[PIDTYPE_PID] always points to a thread-group leader if pid ==
> task_tgid(current). Yes, that's true but that's intended and fine. The
> thread-group leader is just a thread in the thread-group just with
> magical behavior (that we would really like to get rid of but can't
> easily...).

Yes, my concern was about another case when `pid != task_tgid(current)`, but the
chunk of code I've suggested makes no sense. When I looked at it with
a fresh head I realized this.
In scm_replace_pid, once we've got `pid` pointing to a leader's thread
we can't really do anything
other than taking leader thread's TID as a scm->pid[PIDTYPE_PID]...

>
> Thanks for looking closely at this though!

LGTM

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
