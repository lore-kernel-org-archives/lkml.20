Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501749;
	b=Wf9xurbIbDy3yBeA0zosdA7FBOnzvsZX1TFYUgyIZxAB5HPFTgngspDMU2h8rwpUkQjx
	 n5+bUGrKo9uaqnSpaLZrX6zM/zJJvFdQPHwSCXaUNrJw14Jf2SwWzJfQhe/9exE0IBE/I
	 K7OH01PapZ3g+Zi1mzQu9ZjtUJytFtKJW//dt/ZwRNo24OHpyiSjhdxsHR5EJR/WOk5sO
	 th12gLL5gXDrRD0H9obPLaCdb3KLybE0uBOsQpJ4JdQF0rJpADv5oD/Jg58/TYQzwKCH+
	 67gMC8T3FmYc+ZAEG0Q6l8LhG0qyVWsrDG4WwFyWgncNa98RmD/mDqd++W0+40QhigQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
	b=ktamaDky0llh+rl/MCNl2JJxaGPbD9RxAmXUMa3lW3Il5bk/k8IbK6ZC4C3v88cQoRFb
	 l9P8q1oflGJBOk4eAOUKQIsCFNBtYp9EP8j3xkaYPpNZ/0xa8DOnA13WoUk5VnbEqpCRw
	 xFIZEanuhRo+M3CGjQfc+sTM/RI0GNIjCJVnLaSXtZMLRCsGQRVHGRkn2bmR1eR5fnYNY
	 SRhAa1luNalkY9uiJbXfBjmtp23tzaglK1ZNFeO7AyUCyW8veJxbGXHVA7IAqQFVNQyXk
	 QGAHh4WAxRWgFKz/1EbMOg7igvLUUsgu8IDiGXkosIi05RP8rUBQ1MxYcbOh1bWneQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etvsK4IG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB6D606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB6D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etvsK4IG
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so34135105e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:42:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501747; cv=none;
        d=google.com; s=arc-20260327;
        b=LZfGClwaroGNOP2Kle0zVNxwksvF4xSZklgdYWjDu4XGS0xhDohYjLET2jFOcWuX9o
         KeAbeiE9h0Nkd/r8PNuz3q2ZOPudYgpYnfdzSJhOgISZli5+4EfaM6QieNKaGmn5+397
         +rtAanw3xkrQ8K4UsbmNNaLiObjgQC5WFqPQ2wV2OiD8xP0glbWVCVOZ8d/+hr62gzlS
         l7zkAfuRcCqkxFfmtiW4yNVUtytFrmUPW2NYDRSJPY8PvcE6A0Zj3VbpTtSA3d/cOXnm
         EaSZtLsgs6WAxfevROvtmdDsIhqmKjvsNeYzV4hp/tJXKAET3yLGJwiXLtoCZKAaJksB
         mEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        fh=L3OedAYDwAZGi+OLSJi3marFuerloMU8rcKQcMhIHU0=;
        b=VjYarPVGWiOqFMk8AOddgTUb2HbAxicftTXoMyH13HSbRdH//+IDp7kOSxNpy2gGz/
         Y7qFhd9HIWWag2XYy/yhJabj+AOPXMeaYzjhlI1bUoatEUexfNgepqbs5HAhR0D+23wM
         BoclnPgVfLHKELhkOpdMlC/N5Qu8r55CwNFYQoGo3Vw0REzqVYiq9wCg7aWNzxIPMG2T
         nRyp6ERzOFVT79IKATrw/xYswCyBD42pf1pS6R00yn/MguHZaPHwUpmoZ/Q5fsG9Ynmp
         JIA3b0HjCVZ0wAipsu/8ncCFaSoqSaP0PToFaiEXWKTPNdBXsvFxpKUUZhsrhsEbFLke
         Q3mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501747; x=1795106547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        b=etvsK4IGKtC1tmmWAGvlMBJDCobivzoekXoqFKuVsVWyGu8lShV/ecQ/M5I17JaUlL
         GIgJYMp8UmzWyFSoNcGMefWzA368T6y84Dl1UkNYt0uoWQZgdBdZG/Aiwpc7CVTIhAF/
         0JQFaTCfa2V+RNlaKbkn7+i4NAyorYBX8ybqJH3XjzPN9VMak9jeuoTXVavcz/TXTb21
         FaF8VhxNqyxbBZju9qp2Ln/N+5T7gJZ/RicqGc8poLGUIGAlMT1edOhRdpffMJ38j6/6
         qtsYNESSzPCd2ar5kLu/sN0j0+3cPO20UPb5V2eBQ/lZWth2IIrqyP4VOjINWfuUb+5N
         qDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501747; x=1795106547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        b=vrTB8UMUPAV3Wx2b2a4iRX/PIFn9v5hMDWhhjCKIbVi65Kzqe4nMz5eKLPIeUtXM6u
         iWA0NU+QdtvmmiDL1DCTA+g11o3Z1n9ayJzUWYGpvGWzXkFmGKqamW0BWeHLLLHYWOtU
         e9WNzTlMtrdc06B58yuWKSLXgoYhgBIHKZC88p7myB6iZqu/2Rr9N4jcP2RR8iQn4uqz
         bSLf4y8iRQSnQODVPRgg5YDlV7Y3A5tjeP2MOOl7Vwm9KUNtc4OZxLKqup4kb0tCCjRs
         ct5ZZ3ltoDhAQMEkyp2FD4vW6MmLsJA/L4J8BWEuBMK0BG3cEoZ4ncwjSHgxuPBrECMg
         1lww==
X-Forwarded-Encrypted: i=1; AL+hErEJVOmZFSeyvZBLnf3H773NMd5za2Hte7CDOtgFtutOuZO7Fe4rwk/HECyDLfPFFG1/nuW7lkqkXNHjkWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ea1YRVfesm7d+H7yBnoIAwS+fhvuubIvN3jaFJ7r08To/yIPk
	CXU2apKh/GABs8hkMhXrrQIr50gCWE1Gc0YXy2+VQJjS4ZcHWeh+Xps2KJezFRVsaHJ7/y6t1xY
	pnM6XjvCYR0enx81Lhu1Y0gKVOVQTCSw=
X-Gm-Gg: AYBFou2dNdHSzC9MKDC4973PBGxQjRTqSjXrYR5hPmBOOEm6KCrXL1PTHTs19EWImM2
	zdM3XzGZ4KwEPejmG1T7TCRl14xxSZU0hi93Q6Btlsl5Grr8jIS9F2Um80skW5T4J+txHm8P4D6
	kJfrrBD8bCcqOh9nLDCp/cx5E5A8oJ9qFC8dI7LFJU8PFaj341smMnmugSJ5KIIZ9SQB923ooK5
	rNOGQ+/9N9oKJD51YLrmn3wufZcEoNqIsmiQXV5bF3cTwT8+bfwD1omUnvQX1BojE7r5QFDLfkr
	s0heiw46hik7sXrQW78SEPgqLkwm8gKyQjcKq35QyKBnwxhQdodbt+xP4RQx3pZpnV+hd05K/bp
	GZ7qiOjAdQgwP1f+o5JM+J0EFhjP8o4JomTXYwCi+s1jX5jHCQ+a3pv9kL6SC3zAgFK36QQ==
X-Received: by 2002:a05:600c:310e:b0:4a2:c9b:9b98 with SMTP id
 5b1f17b1804b1-4ba0936d857mr116824585e9.17.1794501746962; Thu, 12 Nov 2026
 08:42:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
 <20261104165504.2430480-26-kunwu.chan@gmail.com> <1c2eff9d-213b-4ea2-9905-a054c6d40d97@paulmck-laptop>
In-Reply-To: <1c2eff9d-213b-4ea2-9905-a054c6d40d97@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:42:13 +0800
X-Gm-Features: AclHuK_5dn6ii1XkN_5ubWft1GmD866Yv1veX15FudsEky0EOAdtZ7tnwYRl5R4
Message-ID: <CAN_Opa-RGS=5kTnMVsj6KE=xCLS8aB=dYSqee7DuFeQ=uvDHKA@mail.gmail.com>
Subject: Re: [PATCH 25/28] hazptr: Select TRACING for HAZPTR_TORTURE_TEST to
 enable tracepoint
To: paulmck@kernel.org
Cc: boqun@kernel.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, stern@rowland.harvard.edu, parri.andrea@gmail.com, 
	will@kernel.org, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:50=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:43AM +0800, Kunwu Chan wrote:
> > The hazptr torture test registers the hazptr_waiter_enqueue
> > tracepoint for its hot-address scenario; select TRACING so
> > that the register_trace_*() API is available.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> It is useful to run the torture tests without CONFIG_TRACING=3Dy in order
> to quickly isolate RCU bugs that tracing related.  Is there a way to do
> this so that people wanting to register tracing can do so, but so that
> it is still easy to run the tests without tracing?
>

Agreed. Only the HOTADDR and LONGHOLD scenarios need the enqueue
tracepoint; the other hazptrtorture scenarios should remain usable
without tracing.

I'll drop the select TRACING changes, make the tracepoint-dependent
scenarios conditional on CONFIG_TRACING, and enable tracing
explicitly in their scripted runs.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > ---
> >  kernel/rcu/Kconfig.debug | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
> > index b500e96ea1c1..8fc6434a05d1 100644
> > --- a/kernel/rcu/Kconfig.debug
> > +++ b/kernel/rcu/Kconfig.debug
> > @@ -27,6 +27,7 @@ config RCU_SCALE_TEST
> >       tristate "performance tests for RCU"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs performance
> > @@ -42,6 +43,7 @@ config RCU_TORTURE_TEST
> >       tristate "torture tests for RCU"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs torture tests
> > @@ -102,6 +104,7 @@ config RCU_REF_SCALE_TEST
> >       tristate "Scalability tests for read-side synchronization (RCU an=
d others)"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs performance test=
s
> > @@ -117,6 +120,7 @@ config HAZPTR_TORTURE_TEST
> >       tristate "Torture tests for hazard pointers"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides in-kernel hazard-pointer stress tests.
> > --
> > 2.43.0
> >
