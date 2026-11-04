Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793774561;
	b=eSugwcaSwuQ8l0Paqvo8kh/NOQtwUWlYIUIVAE3aIuwF8j3Z5TEHvB/CwseufdrK08Rt
	 D1sg3iZJL+G0qZm/QNNbsh8HQUJ3vXQ/NkK8sLlyYmhPtmxHjAg/bmuisuXoXRQw4/6iJ
	 PphcaRTELq6sSMgkIWm1vda2rbd2O8o/r6P/zDLrD9aeIPiOpXqnr5Hk9yI0heViZ2MFB
	 tIBXU471OvYkQHERkrIOkT4X1hXNXYHidlWPDp7Hbgu84Uq7zs/qjTpm+8vNSVoxDvbOy
	 8eYfoqD6KtbCmjgS2/9Jvqug5++m57Csq4rgC2fzO0ouhVqAOsiItl5IsF9HIU6+Fqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793774561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5n+r4UyGB7Tdo+MNozKBddmm1+/g2UOW7XY9LCACxjk=;
	b=wB/jc8dqMCUuK4VkFcyDW+5ir3oJINV6G06u2LKNeNtnQOz/oWHfYfUXmh5gCTIOZWhb
	 +diafiYq/TEeXuTDJux9PMVPQC7y07Q6lMtuZg46zRIGy/slsB6PsHceBm62VeLwtfWr+
	 ghdPkbW9c81x47Tznz1jxANO5sZ12FCCYJxSL9v/p3c7bYxZJb4afGX80Eiy1vSGWJK03
	 lAJEpmGZqsnqyF3PcD32GP7z17xDUAYerJcOOZhTgly0qSBROXYDgzSJ40xx6304/pbiT
	 oFyNY7pUzh2a2E7wHqXFWBlBJ4Wq5ZDFmyGn7UAkl9mVcEGgOFK6q3c+UHDA75oByBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jkXFLKeO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08953606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08953606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jkXFLKeO
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a208d93758so2743295e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:42:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793774558; cv=none;
        d=google.com; s=arc-20260327;
        b=dIE1EfDEX5OpuUqNhKv20tqZ1XLkcTPlfRPbI7YLIslE1OvXOhQL5VOeaj0wk2PUhk
         85YetkVzedlqVxPChxROp7ogeS0Q8VDpgF8U/eMWT7d1kORLLuuq6Q92QN2lc4Gcp7v3
         t0Lp737Bjq3tsM4C+8Ncv5WZpUZCMkg+FBhyX1rjKKd1q6C7elBCx5R36QS9qlVYQ9bS
         4WFKSu1nZTvx4hgPbmA5uLse221atPsrQvibvMAAihyebhEYam3tMh/bVIC0SvZI5H03
         S5Zb9o3jZ4KEwKq+SzYtIYmZZchvXgzD74Hr/PXvPM+cpCmJWT53Hs1Om4n/FqH3ZbzI
         zFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5n+r4UyGB7Tdo+MNozKBddmm1+/g2UOW7XY9LCACxjk=;
        fh=OnGrGDbsP2ZD9DoDiLbY+x8gq675KK5HuZQDXa6Wp8U=;
        b=WDQI0FHBljej9qFEvh+5w/wOy8cWD8MY2lfebwkW72wW8GGkclvBm/KAvNdp+JcnM+
         /FsbvIpxU68BAiilZ05iNrINI9ZTZ7qqn2lhR1GZzmDDvx1Ju/IZS+qaL5EwjI7cev9A
         OpRxIEjmVHsjSax3YuIava9kDjolSsj+ppDmHtb8Dk+2FDXqmZp4/KESjjutqMLaRF3h
         kEw5YzJULUijEsBDQjqwLLcSefzbQ2owWL/QhX+56LDbVBuIrRl51Rjpsbu/M3KoIuWo
         eMwREVlsG4QP3ZE68oJFeD9BI4TNTHGHEu5TF+l0sDDE2Df4nG69VOMlKSHw8MAjJxSg
         LJQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793774558; x=1794379358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5n+r4UyGB7Tdo+MNozKBddmm1+/g2UOW7XY9LCACxjk=;
        b=jkXFLKeO77pdT/qIDmF5qrqpgic1gJvQhZyDAOggS5EQfHgcq5J+Q5wp55YAM5s0LK
         szRd1fTYtttwpxTO49OJA7RCugyJTkz0dcTBuqITu4P+k1yjECjT6B6bMM3R3BYNsP6n
         i3VciX3WO/J13wfistWWjEaU5LvDW4GxwlS7U+BFiL/mJ+KI4bkqu7xviq8yUehnL3Ap
         1gZFFhUVyncpJXFzR6GenXbVrQBEqOeklwF3nhxRKDgNio0v61c5OJH4fRQ3EUbdUrQ9
         HTvDYEbMX7ftTIJpZ5IDcGnJisUavB5Ek5IyNtIi+4ajDr/Jh71r95+MujeFKgPpyR08
         q3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793774558; x=1794379358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5n+r4UyGB7Tdo+MNozKBddmm1+/g2UOW7XY9LCACxjk=;
        b=IIDLUTkTNg+tkMGEzcmoOF+BiXX/J4Dv6KSsVQUjdXH/7O7NpQpAK2kMVueL4xghON
         vwRKY5KKpivTjYqVs978GM4uHzeqTBP3R34Yz2q2rlY2AV9P6QVhIDtVtuIoHUrip4Bc
         GevIO443jFvWm1rusA6tJ9iEuiAU9bdpLzagL7w7SbjtVJ/hxDWTJjORZaoyoFyIKTDQ
         TgNOEcMw+0IKgOnWfUvDrYCE7x1U7YsZ/048x1LreGUcndbpFgLJ0ewxzcljYRN5GyLR
         bpEili5bQTN7g76MgNjJ2+XUSWEMsjNxOR8Hqwu1cqlDkj02APgbi1kue49RDBmyEloc
         LPsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbZMDsdZ9MhubN4726anlQ40gLjEIML2NNr8tQDEhcxVSzZR1lF2+Krw1jeATqyhAFFLeSWhhKDfqvPQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ld2UKq6W4RT6b+yLAegzCPGoww3fD3pM4V7qPt/PQUAXbv2Ur
	59MbMvt/HaN9jTt2/xKg7mvrN6l4rAmp3jNxLsVD8mfa7IxTyWH+zkHWAmOPHOX/61TbL8zYMTS
	3XcXGunN9OIIGDYqL0KXpdc5io6q9yCI=
X-Gm-Gg: AYBFou0YRvNxi8rnIFxbGWvHApZ4kdTTi0eM5PYmW3yKSzeoYlH1sCv4QEI+G6j++iJ
	trtJ5qGfd1/UgUwJy2oiZpH3UR52jk7kvJceqt8s5MjPEfQ+8H8kTWmqkmleMbtFcPOxfew1hEO
	qxofS92Jcs0QLnN1v8d9ZPSWmq20dmd020cX9t5Kdc25NphSo5bRYes22XND6i6P08HHdMbn8oc
	vN9IuAAtWT5JRtL0S0yxzMquq2SoS9cEgSX8+VM3/mcu3PqrZ63fm5mmgiHqrKpL3bi0SKIopCS
	tfKcge261TVjRpn75cFYgCxJwLTQZE9xd9CJf5FMbmdU3KImPrM6HeDRRDQK0AJI8J3kAF0+M9g
	+CFgnCoz8YlJ8wUTQL8YO98m4kHGL2EP8+c47GKg03U0ClN9ZKck32BpKNx8=
X-Received: by 2002:a05:600c:34d4:b0:4a2:d7e:5ccb with SMTP id
 5b1f17b1804b1-4ac182dca99mr384459045e9.15.1793774557911; Tue, 03 Nov 2026
 22:42:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027070923.3054462-1-kunwu.chan@gmail.com>
 <20261027231315.GA3580680@joelbox> <CAN_Opa9n-iqRgQczQ5_ZpTMHFbjmW-6+ZYsCgCYdNfuprXLyFw@mail.gmail.com>
 <20261103235643.GA4146834@joelbox>
In-Reply-To: <20261103235643.GA4146834@joelbox>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 4 Nov 2026 14:42:16 +0800
X-Gm-Features: AclHuK-H1NWCP-gLadIbH3Oi-1sHQtn9NQ7r1_MFVefSoDpVfPMBRLFZY4vEJG0
Message-ID: <CAN_Opa_5Q6R584rS6TWuvbmaVBodUteUG=iEMEOTjm-_AO57Pw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] rcu: Improve callback diagnostics and validation
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: jiangshanlai@gmail.com, paulmck@kernel.org, josh@joshtriplett.org, 
	work@onurozkan.dev, frederic@kernel.org, neeraj.upadhyay@kernel.org, 
	boqun@kernel.org, urezki@gmail.com, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, qiang.zhang@linux.dev, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 7:56=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> On Wed, Oct 28, 2026 at 10:17:25AM +0800, KunWu Chan wrote:
> > On Wed, Oct 28, 2026 at 7:13=E2=80=AFAM Joel Fernandes <joelagnelf@nvid=
ia.com> wrote:
> > >
> > > On Tue, Oct 27, 2026 at 03:09:13PM +0800, Kunwu Chan wrote:
> > > > Hi,
> > > >
> > > > This series improves callback diagnostics and validation across RCU=
,
> > > > SRCU, and RCU Tasks.
> > > >
> > > > Patches 1-3 record callback registration stacks for KASAN in Tree
> > > > SRCU, Tiny SRCU, and Tiny RCU.  KASAN prints the recorded auxiliary
> > > > stack when reporting a use-after-free.
> > > >
> > > > Patches 4-6 add rcu_head alignment and NULL callback-function check=
s.
> > > >
> > > > Patches 7-10 detect duplicate callback enqueue attempts before
> > > > queueing, using the RCU head debug-object mechanism.  A duplicate
> > > > registration is rejected at entry and __ratelimit() controls the
> > > > diagnostic output group (pr_err, mem_dump_obj, dump_stack).
> > > > Detection requires CONFIG_DEBUG_OBJECTS_RCU_HEAD.
> > > >
> > > > Changes since v1:
> > > > - Patches 7-9: __ratelimit() + dump_stack() instead of hard-coded l=
imit
> > > > - Patch 10 (new): same change for Tree RCU's rcu_do_enqueue()
> > > > - Patch 9: fixed log format to avoid pseudo-function names
> > > > - Tags: Reviewed-by (4-6), Suggested-by (7-10)
> > > > - v1: https://lore.kernel.org/all/20261023101841.2910719-1-kunwu.ch=
an@gmail.com/
> > > >
> > > >
> > > > Testing:
> > > >   rcutorture with KASAN (SRCU-N, SRCU-P, SRCU-T, SRCU-U, TINY01,
> > > >   TINY02, TREE03, 3min each): all exitcode 0.
> > > >
> > > >   KASAN aux stack (QEMU, CONFIG_KASAN_GENERIC=3Dy):
> > > >     Last potentially related work creation:
> > > >      kasan_save_stack+0x33/0x60
> > > >      kasan_record_aux_stack+0x8c/0xa0
> > > >      call_srcu+0xb2/0x390
> > > >
> > > >   Duplicate enqueue (QEMU, CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy):
> > > >     call_srcu(): Duplicate call_srcu() CB ... ->cb
> > > >     dump_stack_lvl+0x47/0x60
> > > >     call_rcu_tasks_generic(): Duplicate CB for RCU Tasks, ... ->cb
> > > >     dump_stack_lvl+0x47/0x60
> > > >     rcu_do_enqueue(): Double-freed CB ... ->cb  slab kmalloc-16 ...
> > > >
> > > >
> > > > Kunwu Chan (10):
> > > >   srcu: Record callback registration stack for KASAN
> > > >   srcutiny: Record callback registration stack for KASAN
> > > >   rcu: Record callback registration stack for Tiny RCU
> > > >   srcu: Validate callback arguments
> > > >   rcu: Validate callback arguments in Tiny RCU
> > > >   rcu-tasks: Validate callback arguments
> > > >   srcu: Detect duplicate callback enqueue at registration
> > > >   srcutiny: Detect duplicate callback enqueue
> > > >   rcu-tasks: Detect duplicate callback enqueue
> > > >   rcu: Improve duplicate callback diagnostics
> > >
> > >
> > > Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> >
> > Thanks, Joel.
> >
> > >
> > > All look good to me, applying for further testing and review for 7.5.=
 Did you
> > > also test double-call-srcu and confirm intended behavior? Thanks!
> > >
> >
> > Yes, I tested double call_srcu() under QEMU with
> > CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy.
> > Both Tree SRCU (direct and deferred paths) and Tiny SRCU triggered the =
expected
> > duplicate-enqueue diagnostic with the callback symbol and dump_stack() =
output.
>
> Great!
>
> >
> > BTW, I'm working on follow-up rcutorture support for
> > duplicate-callback testing and
> > KASAN aux-stack verification.
>
> Nice! How is that coming along?
>

It's currently in testing. I expect to send it out later this week!

Thanks,
Kunwu

> thanks,
>
> Joel Fernandes
>
>
> >
> > Thanks for review.
> > Kunwu
> >
> > > thanks,
> > >
> > > Joel Fernandes
> > >
> > >
> > > >
> > > >  kernel/rcu/srcutiny.c | 34 ++++++++++++++++++++++++++++++++++
> > > >  kernel/rcu/srcutree.c | 36 ++++++++++++++++++++++++++++++------
> > > >  kernel/rcu/tasks.h    | 27 +++++++++++++++++++++++++++
> > > >  kernel/rcu/tiny.c     | 11 +++++++++++
> > > >  kernel/rcu/tree.c     |  9 +++++++--
> > > >  5 files changed, 109 insertions(+), 8 deletions(-)
> > > >
> > > >
> > > > base-commit: 940793b926aa94bf65ec404043050888e3053188
> > > > --
> > > > 2.43.0
> > > >
