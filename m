Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736E537DEB6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010317; cv=pass; b=aiuHx8WRrG6FiaA/s9psyUHOWKWKp3ey2jiMY7RYBdC9O6FZ4tYYgB6THbZ9/mbfJAV8L3H98D57wI6HQVhYIYzckHsxrS4ScgKN7wRwskpf/zbZiqRo20JjKAso6ec9i0wDaGfYfD95qonl3V9Cveh9K09aY+yOFRyOSk94+yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010317; c=relaxed/simple;
	bh=PK3V4pO0nQq8ImMS+8EDswh2WVF/9QziGBZ1wCEdZHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0yXrU504r0JqNpIQxa7B8ePBZj1XqUP1SHz3+9YispO+8/nXphxf33OuvXM5pKjcq2MXE7V15JR48YIWc/eFR+noIoyrzbRkqgjZLkd9LVtm0Bh8TEIktndUZxGfwGc4KsxBrz8m0DrrFi+TWS/BYe0zuqBsK8QoiYQUNfa1vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K44tEMOV; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K44tEMOV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so9647345e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:18:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789010314; cv=none;
        d=google.com; s=arc-20260327;
        b=jIi/JbV1QFLvjlQZSvVzHlMyjQRK5LHJCk7app4TGB9fKCoKdRSwkSzNohm8+A4umc
         3j7mMj7fwIsMXz41qG4s2m6f4sj0/jLl9sLUJns3yUYe7yolsDVaKlGnKYbX+Y9xdtXQ
         aa5OFWnDzEXFtknBtjoS48ZvqyxBQThHU6pN4+a4Oh9xPqnhQl7vc1GLBxnSNOnRFK0M
         sV9oQLQx6ENMYChCJGcgHlKF7g/uG25WHWm6Z9SPvIUOnsykndbP+wYmW0pVHCldPqJJ
         EfBotBgnakveqNTXiB6qHKwNpcA9afl4aamT3w42Hd9tXIUFrdJwKrmvU3maP7UAMUcy
         SI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bYCYo7thivgEtrRJGBtPc0MTPiaYgTaBPaROJxY94cY=;
        fh=cxR1zeTpG7ThkjgGD1nOl51DuJc1vfUbdt8oZHh4uZ4=;
        b=ZC/5P3e80HGWF7uxNuxIDTkCQaCKiIvoM+OgubsS7KIHVsinPXuG8n0wLrOJYAH4TF
         mVrRNHATa7pgyR0L17FyO95j3UVqUDnWJPN4DKNqZBnM90AGZ75hYBegh9K4cKY/olie
         LJHryW/p33GmsaUsikW0fMesFQjK3E5+u0MyMdC8aCXxNAhxlyTASB8oqwNf2Nrq+VMs
         ZelF/2KjSnsWEirznHtu+4jcoq+xlEoeIFda//5uOpyJqCSHcDClRWV7ggs6zKrB+RiX
         uWxMmeyu80BN3chc8aKwWHiv71O3gi4lpwqBsJz2vziEFOPBbdvWkuCpgR4CJzKy22KT
         Koig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010314; x=1789615114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYCYo7thivgEtrRJGBtPc0MTPiaYgTaBPaROJxY94cY=;
        b=K44tEMOVcGuXY0iIl64h6sIoJg3eR+EH4X8mwHOHdNBoQoVFGh4NFUst1h5AGBHX0i
         dc/ulj1Y5BmqP2BwmJlpa378N5QE8QAVmiTTih5EBuGuHmfiiXceF3HxMQXcgslN4/9C
         5a8O/arzwtOhSnFzDI0eD9jEI7ypMa3ySvvYg1lTMzfxApBykR48NgSYQzHuGfvFkZsJ
         Ws3+TGLKzwiUen8CWCATSmToo38chMjDRvM5o8rPxLFbUTiYXNYsToKUXe8AwLj4YqRL
         CujB9STTKaWPhvRaRLKAzQGPVdfPmjgY3J83wP5GLshxx2t3mQQMXaxL+rCIPisqIT2m
         wEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010314; x=1789615114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYCYo7thivgEtrRJGBtPc0MTPiaYgTaBPaROJxY94cY=;
        b=Yg6KiRNLIYFvQ8LDuTPzB+T0D97Xipy23aIXY/CIAhNUkvj69qBmKjzMplqbvNhTbP
         vvi610LLQUiG2XtBlMV0qVEXPvClqA/t52w4xxb+hFjSwT4Ma57pjQq+9z1P9UxgHQBH
         eRpYvYSRjxHkcku9OaYFEFdaAQHagQ+2ZZ7chssLKZmf02mTXsYQKxuvr5GtIDJpN5Cn
         0i3dQQd5uKwhrud39qZafRwMtcsAERM1/jCABTPp1C3pQy1qh5i+9jlf2Dbd0kJdcA4M
         ZW5B1j93t3FKuI62lwmuLuImg9qngFKeFc5fkqqhr0HVntEnnIMq3laTcI+TIcOygz0V
         T/7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7xFRRXAJn2UCwgJMjQiVFy1iZ4ce2qgeeYQeaU14QelnNu7hSDkdmuu5wS7Sk9SmNWfBdqVtv3n9+vXs=@vger.kernel.org
X-Gm-Message-State: AFuF++mX4+oy0MRJzD02rvgBadUkgA4qKfzm13HWmy3vE9UqnKtT5HLo
	6Prk4nwErHYeuxFASmL/3OUUpHWIlwOONMNlcopawj8XqsahCl/CgZbK6fH23dejTlhFrQMsNfc
	2f9knos+ki7qFwKU6BS8B4jTiRPHSCsfhMxH0Ov9kmpw+
X-Gm-Gg: AYBFou2b2+QEg3kFs9hvBOtC/AAvxGK3XgnR47JPfvcWNZoJ613YDs9i+Xycjw1kvew
	+40od9TK17o9aJH0DMyI/LJB1jb0CUDZq/3NBsNHBCWAL6ggyz2hww6waE/rPwyAO6ce5BQqT0I
	szBrgZYwTyWMmDypIfQK+ed3oPcCbkpNmbHMItI0Aylpjt0AqeLMNDFL6WTd4mLigWImSQ5iDe8
	tBMrpcvfBGF7VM94dTfjT38uXGuOWO/TYUHOkGg6zrUIJz91jsXtfnw4hl/TV9vlcLIs4vQ4R6i
	8DO1Ypyv++Oa7nf7B4FqzSVOzc0NqjV0ZGxnQ2ebaYdHuNAXvy9CcmHMxTX5KhHHO42KMCdw/qk
	o1Z16c3JLz2ikgnHZ98uPoUk=
X-Received: by 2002:a05:600c:83cd:b0:499:a5c8:c6f3 with SMTP id
 5b1f17b1804b1-49d1f21ae99mr119577005e9.3.1789010312835; Wed, 09 Sep 2026
 20:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cb71412b-a688-4c70-9365-3f6bd40c9244@paulmck-laptop>
 <20260909024515.2429893-1-kunwu.chan@gmail.com> <8d5c8d6f-6788-43bc-b5e3-c8bca8e984be@paulmck-laptop>
In-Reply-To: <8d5c8d6f-6788-43bc-b5e3-c8bca8e984be@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 10 Sep 2026 11:18:20 +0800
X-Gm-Features: AcwNN1VUdC9e2QkYyY4TGz91uSqz4ZMlQL4Cku5cqOiYtnuh8aPNtTInEfiXpM0
Message-ID: <CAN_Opa-FsrNsQM5WPCGBkQ43ECps36e_KyTzG9niEnm6KpdBEw@mail.gmail.com>
Subject: Re: [PATCH 07/13] srcutree: Don't transition atomic SRCU to big in srcu_gp_end()
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 8:13=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Wed, Sep 09, 2026 at 10:45:14AM +0800, Kunwu Chan wrote:
> > On Tue, 8 Sep 2026 16:38:19 -0700 "Paul E. McKenney" <paulmck@kernel.or=
g> wrote:
> >
> > > On Mon, Sep 07, 2026 at 03:58:23PM +0800, Kunwu Chan wrote:
> > > > From: Kunwu Chan <kunwu.chan@gmail.com>
> > > >
> > > > The transition-to-big code path in srcu_gp_end() calls
> > > > init_srcu_struct_nodes() with GFP_KERNEL, which is illegal in the
> > > > atomic context reachable from synchronize_srcu_atomic().  Atomic SR=
CU
> > > > has no use for the srcu_node combining tree: it has neither callbac=
ks
> > > > nor srcu_barrier() operations, and its grace periods are serialized
> > > > by ->srcu_atomic_gp_flag instead.
> > > >
> > > > Skip this transition entirely for atomic SRCU, which is also defens=
e
> > > > in depth against any path that might wrongly set ->srcu_size_state =
for
> > > > an atomic srcu_struct.
> > > >
> > > > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > >
> > > Again, given that we have this commit, is this patch needed?
> > >
> > > 4e01d5320a2f ("srcutree: Suppress to-big transition for atomic SRCU")
> > >
> > > And again, if so, please tell me what I am missing.
> >
> > Yes, this is a separate transition path. That commit suppresses the
> > initialization-time transition, while this patch prevents the transitio=
n
> > from srcu_gp_end(), which can otherwise call
> > init_srcu_struct_nodes(..., GFP_KERNEL) for an atomic SRCU.
> >
> > So this is defense in depth for the atomic path.
>
> Fair point.  But is there any additional pathway other than the
> SRCU_SIZING_IS_TORTURE() check at the end of srcu_torture_stats_print()?

I checked all transition-to-big pathways for atomic SRCU.
Atomic SRCU can reach srcu_gp_end(), but its srcu_size_state remains
SRCU_SIZE_SMALL,
so the transition condition there cannot be satisfied.

The contention path is also unreachable:
synchronize_srcu_atomic() calls srcu_gp_start() directly and never
goes through srcu_gp_start_if_needed().
The other callers of that path reject atomic SRCU.

The only remaining explicit transition is SRCU_SIZING_IS_TORTURE() in
srcu_torture_stats_print(),
which currently lacks an atomic exclusion. I'll send a follow-up patch
to add a srcu_reader_flavor check there.

So I agree the srcu_gp_end() patch can be dropped.

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> > Thanks,
> > KunWu
> >
> > >
> > >                                                     Thanx, Paul
> > >
> > > > ---
> > > >  kernel/rcu/srcutree.c | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > > > index 01f224a56b41..74acd5645d4c 100644
> > > > --- a/kernel/rcu/srcutree.c
> > > > +++ b/kernel/rcu/srcutree.c
> > > > @@ -1074,8 +1074,9 @@ static void srcu_gp_end(struct srcu_struct *s=
sp, bool is_atomic)
> > > >           raw_spin_unlock_irq_rcu_node(sup);
> > > >   }
> > > >
> > > > - /* Transition to big if needed. */
> > > > - if (ss_state !=3D SRCU_SIZE_SMALL && ss_state !=3D SRCU_SIZE_BIG)=
 {
> > > > + /* Transition to big if needed, but never for atomic SRCU. */
> > > > + if (!is_atomic && ss_state !=3D SRCU_SIZE_SMALL &&
> > > > +     ss_state !=3D SRCU_SIZE_BIG) {
> > > >           if (ss_state =3D=3D SRCU_SIZE_ALLOC)
> > > >                   init_srcu_struct_nodes(ssp, GFP_KERNEL);
> > > >           else
> > > > --
> > > > 2.43.0
> > > >
> > >
> >
> > Sent using hkml (https://github.com/sjp38/hackermail)
