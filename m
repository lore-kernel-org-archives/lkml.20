Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D22D343897
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922993; cv=pass; b=QsoE3GJ4m7U7H9hDIMT2PlE3pAacnW6ZD2ctuJK/wrNMoNlLQnkOxDtP4lEgGLI7PHc8KvR+GU23bv4DMXUUYNk2T7ArObMvdIpEQK07Wi1rfeOU52dMwjvwtmElB0ORULM2d4YoZkXjXVvYiCB5JfK6JakJkuw+Sox5tE1WBtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922993; c=relaxed/simple;
	bh=9YZmPBYy1SKXzdHu1slkhLm9qPYGjqzmlrCIOJQSO1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXZQph8PCWyZCveP3x4OdVsOUnqud3+A76Pk7yNmXg6QmrREPZP9aDt+PWYA9jQpwd84mV9A6FxoYkXNmmHcrLWHETHxLRjF/HCFOnUdP+92U3YPtXI6oDT6h+otTzHODPLKPFLBV0IQaFcXEXjuIQTQ4nkzK0TNf0BNcgNuJ2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNeWEMmn; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNeWEMmn"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so1552488f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790922990; cv=none;
        d=google.com; s=arc-20260327;
        b=HmpLokpFbasmt74rH344QQ94SJ2SRowm1LTNcLQtD6bqYYcwNgVNYFnWoKaAReqaSw
         Tqh0g+AwcViDazJn8FXG5gVQS0Bqw+BcxpcyL6ceCeNKxSqkqBZJW9ZUQm/OKYoY331h
         UKSVkSLS5LzNG+Rofe3tEXVGc3OfvPvRYzs71IcRDq34N8MouCrwoR6urjtyARubsESA
         0IWFWnfI12brx9+Znb851fE4yi3pApCh8MO50iEJRAUfaFZFcorWsNfaoqytKt0TZx41
         T+it+c8/GuzR4cG1NylTY7XYNNSta1qB/6/fTmR1+biBn51BJp/ZloV1O9RrGg14z6zW
         7dKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=soPsbDvUWN0SPXlaYNOhQMJeReVB4dKwMaExJU9cL80=;
        fh=iAGO8pPQdO+BwYxNHUSv6BEDRqKCbKvMaqSyIoJXz+g=;
        b=loz46HssdB0HrnbQ+c705XWTJi7yBtnB/IJNuPuFKqHayZtzxgdCLUpcnTHTJ0G9yS
         vad/y4+zxYJFVGHEKWx27VqVlJVGGM0Uzm27PfwD5gftFNNz9UlP5t1zdhrBqD1qOgfq
         B6Hm/LTnoWR+EBhIlhBdHKdreGjzcZnUpKSuAYuNMjCLKvF0H+3o7GPWR+JkcwBCNSPG
         3a3/xfauyY/fEyHt09AB2n//M9OSMBvkzG1s8R/XAEb/7pynO8ljVRH6DMds0RJ2zDm8
         V8cwWCL1XKLTZ1TOxS960W0+k/4NBLJ++lIDlQWzK0Gr61XdopAj4uojXmdG5QgD2wvw
         e8cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922990; x=1791527790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=soPsbDvUWN0SPXlaYNOhQMJeReVB4dKwMaExJU9cL80=;
        b=pNeWEMmnSARCxWseuUsu39yTxf0wEHNDyV/bTRXr9vR7cpjkQIw9bQ3xrtuMW3Ons0
         4HB89SdYiEsHHVzIaNLiTo1YPdQtQJKFGZcadzaOCxTdHIoHZ02fbL/16Ro9Kw8mhMM3
         6+GWJY7kHDNRjXvt/pbSSY5WAzNX+wEfTgmPxN0/aLRonbQk7sCLEziEfqGS6EnBIcHs
         K8DDHtitDS8xSUfoPSpRurxHFaJF8BPj4udohyaKY33SaJvIIUrt53mZkxeiovhXMwbF
         oKzACeEngk345xR9+MAiQaKXQFI879r4Km9K0Fv3vjQryM/4ocxbxAi8b/vo0Q72x6fn
         8yyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922990; x=1791527790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=soPsbDvUWN0SPXlaYNOhQMJeReVB4dKwMaExJU9cL80=;
        b=uDv50UwguAl/wDbrvVR2pQVZjfwNKJTn/kldRPsRxy6hmyFyUPD+ZzD/2OQUrTIbes
         ZMKOlqqAvBdj0JvR6DoN/C06C/YH/KEQsw3dwRn0y3dfpuyQiKC7CkNWEKdFVrcAcDzZ
         9pWFFtNqrCpLIIOXbMgvG4uP7nWkx1GuOeetEKBNStMuXUpydJKHhQvwHT6d2f0mMtIn
         WfSCDLAWg1uZZok23YoFCAYaKpnQqg9c9Ws6efo/kafknUhxJsJbGbK4XXPLLFt3FApu
         4izctpktTfddWQRVpTUY8zUzb3BQSOI/wUjTz37G6Kg6DhvUo+aGhgNt3MT2Ni/C6yOo
         +F4A==
X-Forwarded-Encrypted: i=1; AKwUvBz4feqUTte2QFT8L5XMsJ/jbYYEImUc41vWVzcCYikYKKhdf/cIlw+yd66yTXRQ0k2BR1ZSgGHVQZfhdOc=@vger.kernel.org
X-Gm-Message-State: AFuF++mPPCesMQWTrA7GWA7OsjR2HLJmgPjOLWIA43O61D8vKesBa3nV
	PFWfE0puVB5UvOk/3K+u9eoF0z2lJbztqfI4E3vD+q8296Arpist9D02sfRRu73SumwT9V6d9V6
	qhEts2yJ9KgJF6ZJ8/WV69xYbuVa0vvM=
X-Gm-Gg: AYBFou2PcuRJkRR6Op4VUgZU2qNJqDNagQY6lsj/z+3tHLOdb2TfF2bocJ+FsZV9JqQ
	vkExNQh+SINkgZaG/Ymys3AJ0GqnBTPxvgqMAnKdI2mBVkb1jJ/TNYNLHnnsizcKooli9i1FFyc
	uXQ+Lgsg0EFobZiLu1M4vrXGKhDnsE/AN0RnbTGYcHSzWLEbQ1BWsqsApTSxyXVQ5UpZPx9VF+x
	oT/iXpuFhQrk5RFyPMuAgnepX55DDnFThAgvdA5HrF2DonYeKf8W93a+dSNUMC3Q6mAhyk7pUcO
	vLtvvVyFHaS/zEqp/sHtkEB0SozDkxBm7tVeerMQNwnW0wAawkzUtvtsyrN1D4Ia6U9LR+925Dt
	TxKMyZwORHI+HBKyL0JAwXNKG
X-Received: by 2002:a05:600c:138b:b0:49f:ce78:3562 with SMTP id
 5b1f17b1804b1-4a02759b46fmr32317815e9.19.1790922989794; Thu, 01 Oct 2026
 23:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925133922.1356404-1-arnd@kernel.org> <CAN_Opa8F+vKAAckVi0+qi_yXrav7Dop5brpS=zr7Hw-XaAUL2w@mail.gmail.com>
 <0fbaa5c5-3f75-4fd2-8537-0576eb11abbe@paulmck-laptop>
In-Reply-To: <0fbaa5c5-3f75-4fd2-8537-0576eb11abbe@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 2 Oct 2026 14:36:18 +0800
X-Gm-Features: AclHuK9Dz0MHNSTovGlbFnDS08y0Lg6jFdNOchKzstmaAxNqyn8Ihv_sSnlWWsQ
Message-ID: <CAN_Opa9XhfVcvjCOa_Ay+zw+HpQMKEqsnBcTpNS6p5MVa5u5Jw@mail.gmail.com>
Subject: Re: [PATCH] rcu: include rtmutex_common.h in tree_stall.h
To: paulmck@kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Thomas Gleixner <tglx@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Andrea Righi <arighi@nvidia.com>, Cheng-Yang Chou <yphbchou0911@gmail.com>, 
	Gustavo Luiz Duarte <gustavold@gmail.com>, rcu@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:08=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Mon, Sep 28, 2026 at 10:54:13AM +0800, KunWu Chan wrote:
> > Thanks, Arnd.
> >
> > Tested on top of 1eccf02fb8d5 with CONFIG_PREEMPT_RCU=3Dy:
> >
> > CONFIG_RT_MUTEXES=3Dy: build passes
> > CONFIG_RT_MUTEXES=3Dn: fails without this patch, passes with it
> >
> > The failure is in tree_stall.h, where rt_mutex_owner() is used
> > before tree_plugin.h includes rtmutex_common.h. This matches the
> > reported failure, and the added include fixes it.
> >
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> > Tested-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> Bradley and Kunwu, are you OK with my applying your tags to the commit
> that I am merging this into?
>
> 1eccf02fb8d5 ("rcu: Add running and boosted indications to RCU task stall=
 dump")
>
>                                                         Thanx, Paul
>

Sure. Thanks, Paul.

Kunwu

> > Thanks,
> > Kunwu
> >
> > On Fri, Sep 25, 2026 at 9:39=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> > >
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > The added call to rt_mutex_owner() makes this fail to build in
> > > some configurations:
> > >
> > > In file included from kernel/rcu/tree.c:5121:
> > > kernel/rcu/tree_stall.h:333:8: error: call to undeclared function 'rt=
_mutex_owner'; ISO C99 and later do not support implicit function declarati=
ons [-Wimplicit-function-declaration]
> > >   333 |                         if (rt_mutex_owner(&rnp->boost_mtx.rt=
mutex) =3D=3D t)
> > >       |                             ^
> > > kernel/rcu/tree_stall.h:333:48: error: comparison between pointer and=
 integer ('int' and 'struct task_struct *') [-Werror,-Wpointer-integer-comp=
are]
> > >   333 |                         if (rt_mutex_owner(&rnp->boost_mtx.rt=
mutex) =3D=3D t)
> > >       |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~ ^  ~
> > > In file included from kernel/rcu/tree.c:5124:
> > > In file included from kernel/rcu/tree_plugin.h:14:
> > > kernel/rcu/../locking/rtmutex_common.h:231:35: error: conflicting typ=
es for 'rt_mutex_owner'
> > >   231 | static inline struct task_struct *rt_mutex_owner(struct rt_mu=
tex_base *lock)
> > >       |                                   ^
> > > kernel/rcu/tree_stall.h:333:8: note: previous implicit declaration is=
 here
> > >   333 |                         if (rt_mutex_owner(&rnp->boost_mtx.rt=
mutex) =3D=3D t)
> > >       |                             ^
> > >
> > > There are already a couple of inclusions of "../locking/rtmutex_commo=
n.h",
> > > so assume this is safe to do here.
> > >
> > > Fixes: 1eccf02fb8d5 ("rcu: Add running and boosted indications to RCU=
 task stall dump")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > > I wonder if it would be better to either move the rt_mutex_owner()
> > > definition into a global header like include/linux/rtmutex.h, or to
> > > move the code out of tree_stall.h into a .c file, as this feels like =
a
> > > layering violation.
> > > ---
> > >  kernel/rcu/tree_stall.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
> > > index 5dded1e89197..803a56af3259 100644
> > > --- a/kernel/rcu/tree_stall.h
> > > +++ b/kernel/rcu/tree_stall.h
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/rcu_notifier.h>
> > >  #include <linux/smp.h>
> > >  #include <linux/rtmutex.h>
> > > +#include "../locking/rtmutex_common.h"
> > >
> > >  ////////////////////////////////////////////////////////////////////=
//////////
> > >  //
> > > --
> > > 2.53.0
> > >
> >
