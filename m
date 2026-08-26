Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E73546ED
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750530; cv=none; b=BwAezQyu4qDjBcY2aZRzatwcxlNLMtykZ/Ir5Z88BPtk2MpoWLE3lK4nx5cp+ZVWUu4Vtv1MPO5KjrEMbPqq3kib2sZZBcl66Zsvvhz3pw8PDFzwdGOCTQs8fsQCgRFZq977XCosHCBdTBJLRcksvTH5ftK9nmJYGVwbl6AcrtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750530; c=relaxed/simple;
	bh=jM/haCiOpfA9FknTZ1fDNwWJnszfe2QUJZzOmWp2QEk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pfRXJ0JjffUjaAgPDEC3A/Y9U8U45Z4lyAJXhXlJYwm6CB9v5NwZCWfzM8J7uva9R6CQ0YBXmdLofTxSIkSItNGCAWjozwHkYZO5wMYj7GVesh8uAubK4iU8zEhTS4bnWSnXuFfkRMJcu35GeAgJ7k6ot/dCpe3hk8u4/Kh+nxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuOTTuJ7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuOTTuJ7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso4913185e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750527; x=1788355327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yCybwoH2BHkmxPF2zNCOC0wwFEJW00Hw7Im1uIu4w4Q=;
        b=TuOTTuJ73ZUX6EF1di5nFZjMO07ZUeNnYf2Ll1xUI7r+nP8OSFWRY3Rc5eyBRSZLAj
         f9BdGtrRL5lzjTUHNGNlk3J1tWrlsGZtUrgH6Z/Kk65oU1C1jEBShyJy+y3DbPV4I5in
         hXHz5lhD65bJ0Fj6BqYCbf0kS5XqeRjl2JaVObFQeQK4pTHR6eyT/h1RrgDB8DXNrke7
         j6S4cHP4rrMceE13ZzOLa+FKxSClXwRFuvHsljAp/BUkHni3yD+aupIzcaoxp3cS+84J
         Izu4qMaiEyhfyzUxI4bMB31xAhdOY+HlqORpTIr7GvqeVAZ6Vm1If+EC3Ci1cZ1L4o8y
         DqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750527; x=1788355327;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCybwoH2BHkmxPF2zNCOC0wwFEJW00Hw7Im1uIu4w4Q=;
        b=izLppmwahGs2TIT4Qyupsbe0nLjMr8yW/gD9qKJv8cZqLsYIQVoOVEM6RRrYo2AMfM
         ruSvr7nLgCoCz3Oo2+nzCIY6wvreTlUCg8AXHf5D97mDQ1xofXG0op/w61iqQSHptcIY
         cePapOhwZq29drBhtgLGnsvomIcTCLL5d47ykExI7rzewS3dnJwFG64MDTyu/ShgNdAG
         FnrT2A+IQTD27tbHCF+KtH4NCzZY5vHJNxW2WrL62AGDudzWrw3g9tGK9rrvJG97ohzX
         Pj2VrtNvIR0JcB7Wwwtd3uUyKngjBt/sDHKZy3SkPPFTUHiNmkkpz0tH6UqWwBcQOerk
         072Q==
X-Forwarded-Encrypted: i=1; AHgh+Rouq9wmdkiybDfI+VzsFwH2LfxzEZ8yUrIlhWXM8NCbSTJ0FU6arBLUnFkH8F9BF997Ici3j8SBO3JATLI=@vger.kernel.org
X-Gm-Message-State: AFuF++n0uPH842v+C86/ese4np27xheNIBiYTqZnwO0Nj9un07RSamjV
	GvMx0qYbRjNXj+XdJvK765uZ30L+/0KoZywffCE77sZnuqDPRqTfKsja
X-Gm-Gg: AR+sD12070JMAr3emRxNJ3XbClWVagQes/+OEgJ2nkOZ9XJvXUMKy9pnFOHCjHhaPPg
	xsLNHRanqslicT3yQLfV4I2xRP8MRfDQw/S2xqX0m89erMV+SOPBE68LS0+Fye4uORmp9TCh02o
	oDpQowwYSL95MM3wLgMHs2udWAl4BLb8+GEtMQ8Hx5aVVigNKZW5f2xWmlYaxY1QWzYeB7BGwdL
	Xvyqq68k86mggQeT9060IBT8oLxPH4/D1N+3tiSPIzmM9ThW9IwbLcz1ukqxA4dzvsf4Gjb0t/w
	vh8mouoHyD8iUzsOg8shIvWqJOSM2eoP85WNIIF6mIKTUDigTNgXfgDbEwBatjXNWSyv3yidQ/c
	72I+rqtePs+qtiq1jo4ENIGVQ2geqMfwfiJ0JZa1gkUf59FPdaJH7o35mgjL3zfR4xO+5O2/+Cd
	GqXJ+YprPCsXPO363FBP8iDggQ8JHXZdITwteha/ylz3uMzBHuYG8ust8xGm4gINHpv7gmJlQsi
	srXuV/7sonX6o0vlBY/WaQJCA==
X-Received: by 2002:a05:600c:4585:b0:498:952:e276 with SMTP id 5b1f17b1804b1-499dc6f7ec9mr54471045e9.8.1787750527096;
        Wed, 26 Aug 2026 06:22:07 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca9fc48sm25667895e9.8.2026.08.26.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:22:06 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:22:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>,
 Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Dan Carpenter <error27@gmail.com>, rcu@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rcu: Fix casting while dereferencing rcu pointers
Message-ID: <20260826142204.7269edf7@pumpkin>
In-Reply-To: <CANiDSCtKVT9fnkx=-d2-aOd=uqODERFw-fAm6bg2eX=RXGMaXw@mail.gmail.com>
References: <20260825-unqual-v1-0-7024fb81b4f9@chromium.org>
	<20260825-unqual-v1-1-7024fb81b4f9@chromium.org>
	<20260826105527.7ebbb4b1@pumpkin>
	<CANiDSCtKVT9fnkx=-d2-aOd=uqODERFw-fAm6bg2eX=RXGMaXw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 13:28:42 +0200
Ricardo Ribalda <ribalda@chromium.org> wrote:

> Hi David
> 
> On Wed, 26 Aug 2026 at 11:55, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > On Tue, 25 Aug 2026 20:02:10 +0000
> > Ricardo Ribalda <ribalda@chromium.org> wrote:  
> > >
> > > diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> > > index 44c07a66edff..80276cedda80 100644
> > > --- a/include/linux/rcupdate.h
> > > +++ b/include/linux/rcupdate.h
> > > @@ -488,7 +488,7 @@ static __always_inline bool lockdep_assert_rcu_helper(bool c, const struct __ctx
> > >  context_unsafe(                                                              \
> > >       typeof(*p) *local = (typeof(*p) *__force)(p);                   \
> > >       rcu_check_sparse(p, __rcu);                                     \
> > > -     ((typeof(*p) __force __kernel *)(local))                        \
> > > +     ((TYPEOF_UNQUAL(*p) __force __kernel *)(local))                 \  
> >
> > Ugg... TYPEOF_UNQUAL() is absolutely horrid...
> > When __CHECKER__ is undefined the whole thing is just (p).  
> 
> About using __CHECKER__: Are you suggesting using #ifdef __CHECKER__
> to use TYPEOF_UNQUAL or the current code?
> 
> I am open to doing that, but I would like to hear from Paul if he
> favors adding the (also horrid) #ifdef to save some CPU cycles on
> older compilers.
> 
> >
> > I suspect reducing all the definitions would measurably improve
> > kernel compile time (even before these changes).  
> 
> When I checked earlier in the other patch in this patchset, with my
> compiler I can hardly see any difference in compilation times [1].
> This is probably because GCC15 direclty maps TYPEOF_UNQUAL to the
> built-in __typeof_unqual__.

I was thinking of the _Generic() version.

But here you only want to remove the (I think) __user marker.
I don't think you want to get rid of 'const'.
So you don't really want gcc to remove any qualifiers.

There is an similar(ish) issue when an __force cast is used to
remove one of the extra qualifiers.
You really want the compiler to ignore the cast - so it checks
the actual types match.

David

> 
> 
> Thanks!
> 
> 
> [1] https://lore.kernel.org/all/CANiDSCsMrULsrGQg76x28GRXLg+HSKFWhhA14Zcn8hdm4KyOVw@mail.gmail.com/
> 
> >
> > David  

