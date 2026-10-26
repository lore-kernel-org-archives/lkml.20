Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792982176;
	b=ZDQacYZix6NIeabeTeY85aDK6jZF2c6KbwNV0heOch1FsUUIjAaJZWD4F6amC10KxY1M
	 0uPPgLa/WTLj3o608NQqsXSW30sIM9jDeJ6DcetBf3g7sa8AoVgoape4Y/G4fFzA7pVSX
	 1/C4eSfUZHpnpFMqQObNDl1eM3McYtM31iB7mvBCJyMfJrcK3sM+T9zL5+NSs4nrXpPg6
	 H8jMWCelz8yQHnY1VzYiceCBax3vpQ30PwCvKHgdMhRFTFWVT9MsZBHzWlDlmQ1iatg68
	 g2tUSxiwhg4bFVsLeUxuD+DroNGatOEQJl2IWdmGW8BMCIY1mwUtbkBG62Yo+yxQ1kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792982176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iAk23gi97Bh3E2+QZ3E4niRePEWiOsVcJhq4RJVVZpc=;
	b=vowRnpG3u+SwlF8bUQKPjKpfGr4VXkw/SBGAqdhiuWWoe+gOnbi+FxtycTVnUweXSOKF
	 tb92ic2emYkAsyBoDu1Oa1pVicMDxE7piXgm57xs2nAsm1nAHHhvSmyEtUWyf7St5D+wE
	 vjfik3+Ux3aZXMXxvY+Yl4BFVxIFBn8R+n3yDBc3JPzXQTm9nG6uZ/hjbGC415DA8VXaQ
	 5EqaMjm0rrUdvbBb2L5V6/csi0eXYOCtX7Xj7BpwTCoCGAH0JyXt/UwTAvMBbNwh/ayzB
	 4bjLJOLJXpfufrPyydKhvgAZqQBeD/iG5xYAn3jl3o9fOxi5LfRPyfXMcBWS9tCTfIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ofwUcJCk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBFD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DBFD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ofwUcJCk
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso22020045e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792982174; cv=none;
        d=google.com; s=arc-20260327;
        b=G1djIu+9V4mvvewu6lDf9YcsjYhb4mfuR6JFxMzsokVqTRn3Q+SO/32gQN6aMDCqpF
         gsCvT944u1YFtWLUfqUM0dDdcvpDHysJZ+9TqJkeSGCp7iNo7Gt/PRYwnQAdaKTYqiQO
         Uzyf7H3CqNN2/AeIuGsv8HaL1DfTwzJSiC7WvLcl90jJLLmarjy0WyEjF1SQFEpa4SUO
         /9+/ZNCKZe6MU/z+UiD7daHG0lzq8YCIfPHDELkn6hrwau4GM1foAKCsd/+xKqH6INn0
         iHty8Qvhpn0EWBdX6aWab/42it09539OnpZKYXcDm3mqifYniwwBMeWkVYouBN5fMmzU
         8mYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iAk23gi97Bh3E2+QZ3E4niRePEWiOsVcJhq4RJVVZpc=;
        fh=TtginRXxUcSpR4fcsj+gg8paY8JCtsmBbUibaUSdarY=;
        b=Gnidq980MXwtD85Se0YSQGtySK3Ok5PAKzEBStDwmHY4RZjcCXlG4xiG4y3+fIVNnV
         1k3bK675sgoUiM2FdDER6DuPCm1MxQYnHzyCuEtr03GZl07F+eQ86SjiZ7zNImZSXY6D
         aVw8gf5PZ5iDRD7Dqf+Cqny503Lw5OFB80IH64Zrdt3jqzGBEof7LWG5eRJ7VQfL4O7L
         c+rDvQvVUUR46yXiH0jvGulp9nO7FTznGjQZUCw/e2mlI7wdUrBX2n1T7Ojuz3U13u6p
         pIHfwuaCTi9UyuvimrfMOgl7SYxEfQftKo9MyMROUzK1GjAurbAxoe8OOFhBr91sSBLQ
         /CDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792982174; x=1793586974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iAk23gi97Bh3E2+QZ3E4niRePEWiOsVcJhq4RJVVZpc=;
        b=ofwUcJCkVBq+dP5gJkQOnwrdg5TYbPF/qPRb0A8VwtIB5at85L1RSTwNh5W0mqDBzh
         J94jvIwEphAGegNFqLajeAgELfmfnL/u4rzpxl2pTpINfNXVGoPhuYQwwuO2w7/sgrP1
         OOFAoWhsonuX++lHhd4eE35U9sFcM4Pwj+1+4UcLMOGtTxmhwOM2cwOWF7ZQsyGLznPj
         hE6d9vGLJvsrL2ZKiA+fPYsaRqnypf7MCIxWkrwR+yN1m799tfxv8lE+VOI6UH1w/BuP
         E5pqNbTpdkCZXiiQ0PwI+o1ukeby31z5a3LOzc3OcwLMPasfHbtWc6F00stjh5oongXp
         rVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792982174; x=1793586974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAk23gi97Bh3E2+QZ3E4niRePEWiOsVcJhq4RJVVZpc=;
        b=DwoQNjFjH+5TS7oSUK4Ld3CL/i70CtCnEP4XhDEjxfyn6112AmgJA2ggf34bU4wFGo
         O2YFAuRBH/YsGi1QNWyTnDbx+GMLn1eUWo74D+D2YgAdG1aHb9XiWBCBfDWo/+F+uJh/
         GBfPyY18mA2XIFj2sT61GD7rnaZm59aqfZbEGouDsnHjwT2e25r5RHnrfqtRs2CjE1Iu
         XsV67yps4yBdLPASEnGarxVSYfbSsV7RlQVWNRUQRKvPbtsx6Jw+TnsSColxmBmr/6U9
         p2dpPx4FuqSaPm6NlYIKeS22Xc8qGY+B34+3mT4Ea+KYi12oLNQIkmzcpcIh4u/9tvDZ
         FbMA==
X-Forwarded-Encrypted: i=1; AKwUvBw3YFHZSXOL9e26SFRJUKPHtRHIpv+yIk+aXtMtdvTBhzd4qw5Bky9bDrBaTgLmnsF9itYF1ExfGyhc58w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfyAGOHCRyXbaqKDnnWJwyGmkeX88EjuV0bVmd8Xsju9688vav
	TXxhZUlnmQYD2Fmpc15pntBnGqGxiJ1Ois3coKSz0w/4egjmLVvCDk/B9f22nxNBZI60jiQQNv2
	oKO9lw3RcY+rIo/MOEMBjuQ4+TzPXLqs=
X-Gm-Gg: AYBFou3icezjP4cgxFVzbF/wN8KvnPiQhCL4hQF0AQNEP1zcZi0lVciyfCKbMzSi8c1
	E4F9sjWOTeJnNXZZNWTO10KXe315P4effIC4iVTVrG+/l6sKCmw4Lcf5JwY2qrCNb8kVH+WwXO7
	ns0/7EK2cF7KYI5HMuIWjWQcMAvjLTIVj1Uw3pG3Mfuzp5j2KrjzdwLjY/fMWE4gFgE+7wZww3q
	8/cgcCgjMmfx1McmUpbyBQ0fJwD5yrhha39ONktp3rI78s8Jv4f2nSJBr/bgOoHTaKlfUZ1pn6U
	dKbQsm8shfDbRw4Q9b+HSHG12TCkeKPigqPgv5kILjamU5xMIcAtBCSNeoQ0jeRgtbFjUeBpPba
	KxPdpqxA5t/wIEKr91XIa+DzvwTawpxsGPMX88bsEQHk/DuyXNCCKSR0TBTWP+oIV2Pm8MHEj
X-Received: by 2002:a05:600c:3e86:b0:4a2:cbe:bebc with SMTP id
 5b1f17b1804b1-4a35aca5f94mr95517015e9.23.1792982174353; Sun, 25 Oct 2026
 19:36:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023101841.2910719-1-kunwu.chan@gmail.com>
 <20261023101841.2910719-10-kunwu.chan@gmail.com> <cdd3f35d-9e9a-4b87-bea7-59ff3e1a7390@paulmck-laptop>
In-Reply-To: <cdd3f35d-9e9a-4b87-bea7-59ff3e1a7390@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 26 Oct 2026 10:36:02 +0800
X-Gm-Features: AclHuK-dNDX8dRPchF6C9mpMkMHM9t09-8qvMf53mQYiOJQpdnXUdDfEsPaIb0s
Message-ID: <CAN_Opa_eWF27jfz_HfXjUEw_raQb-j8Q1TMHLr9cx0P=N2-s6Q@mail.gmail.com>
Subject: Re: [PATCH 9/9] rcu-tasks: Detect duplicate callback enqueue
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, work@onurozkan.dev, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com, 
	boqun@kernel.org, urezki@gmail.com, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, qiang.zhang@linux.dev, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 3:31=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Fri, Oct 23, 2026 at 06:18:41PM +0800, Kunwu Chan wrote:
> > Detect duplicate callback enqueue attempts in the generic
> > RCU Tasks callback registration path.
> >
> > Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>
> And the same questions for this patch as well.  ;-)

Same changes applied: pr_err_ratelimited() and dump_stack.

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> > ---
> >  kernel/rcu/tasks.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
> > index 5d7f234795b4..49b716feb31d 100644
> > --- a/kernel/rcu/tasks.h
> > +++ b/kernel/rcu/tasks.h
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #ifdef CONFIG_TASKS_RCU_GENERIC
> > +#include <linux/mm.h>
> >  #include "rcu_segcblist.h"
> >
> >  //////////////////////////////////////////////////////////////////////=
//
> > @@ -339,9 +340,12 @@ static void call_rcu_tasks_iw_wakeup(struct irq_wo=
rk *iwp)
> >  }
> >
> >  // Enqueue a callback for the specified flavor of Tasks RCU.
> > +static void rcu_tasks_leak_callback(struct rcu_head *rhp) { }
> > +
> >  static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_=
t func,
> >                                  struct rcu_tasks *rtp)
> >  {
> > +     static atomic_t doublefrees;
> >       int chosen_cpu;
> >       unsigned long flags;
> >       bool havekthread =3D smp_load_acquire(&rtp->kthread_ptr);
> > @@ -358,6 +362,16 @@ static void call_rcu_tasks_generic(struct rcu_head=
 *rhp, rcu_callback_t func,
> >       if (WARN_ON_ONCE(!func))
> >               return;
> >
> > +     if (debug_rcu_head_queue(rhp)) {
> > +             if (atomic_inc_return(&doublefrees) < 4) {
> > +                     pr_err("%s(): Duplicate call_rcu_%s() CB %p->%pS(=
)\n",
> > +                            __func__, rtp->name, rhp, rhp->func);
> > +                     mem_dump_obj(rhp);
> > +             }
> > +             WRITE_ONCE(rhp->func, rcu_tasks_leak_callback);
> > +             return;
> > +     }
> > +
> >       rhp->next =3D NULL;
> >       rhp->func =3D func;
> >       local_irq_save(flags);
> > @@ -586,6 +600,7 @@ static void rcu_tasks_invoke_cbs(struct rcu_tasks *=
rtp, struct rcu_tasks_percpu
> >       raw_spin_unlock_irqrestore_rcu_node(rtpcp, flags);
> >       len =3D rcl.len;
> >       for (rhp =3D rcu_cblist_dequeue(&rcl); rhp; rhp =3D rcu_cblist_de=
queue(&rcl)) {
> > +             debug_rcu_head_unqueue(rhp);
> >               debug_rcu_head_callback(rhp);
> >               local_bh_disable();
> >               rhp->func(rhp);
> > --
> > 2.43.0
> >
