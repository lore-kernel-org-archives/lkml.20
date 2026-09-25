Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E9A42A168
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337682; cv=none; b=YLFPj10KGqqZXcmx9xFtqasSUq2V1kfbMCPcFGMupWRa481ckZY5z6UhQXFkarwHlGxiDAqiMiguMZ/QU8polI6ZemsxG/tX94OQVXaGEL5KMgJDuy5dU7uYYjhlwjSAS/yGBkoY9kqM08tF8dNVPAFeWDQlNlHkM1FF1HrrV0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337682; c=relaxed/simple;
	bh=/GPdzIiZUV8Gg+2X1ssv05A+/aoXwIUYutRODEYjpzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrsptOVLSRC7JdmCoo5yG4uJkWYTwvAYI039xkcVtUJPBEAvTGGD9RjcPB9Di2rhizhiittjzHXE6tD1TiZfCBbj3hDjh7kqro/ZB+KebBCJ9gRs0NNhVpmfsO/mFAdS0LBM9VKO2e+jCM4ElUt8xgAF4vcFun8jjYMMaiEAju8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DNh80SOk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DNh80SOk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so48585ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790337677; x=1790942477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4m2US2HuKSemkh5d3S/UGkBEXHh2b0iT9WTv773jfwE=;
        b=DNh80SOkXfA+ZZJbIsMpp1EhVlvZl/z9BXnzxXh347Xy3LM0+JNbH3/+hp7WJVwsNb
         v/xGrDBijvctS91N6gE40h2lxDmrD2lIBbl09ubgvpdD0hEmu+Wm3y7Ry5hMlM3RR1yc
         mDBVl1tGB5CP/HTYXilCOphu/MP/QpFq0pIwc3Beo9zMoRsJNqMZgGyNIXY6kjVXGR2q
         SC6H408ls4U3EBAxtuExQVZiZT9pt+mPX8IzGRSViG2hvv/0KOcruD0g7Cw5nyv+guye
         FSvR5YZYa3Htd1rjYP5LRx689XkLoCG4h0dM1RPj2TKGv1ssB4jJ3tt/tQ9b6nop7u0G
         Q5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790337677; x=1790942477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4m2US2HuKSemkh5d3S/UGkBEXHh2b0iT9WTv773jfwE=;
        b=cJkBBkmn1phvLY4aqA+09g/um6n8PCyPfUGGhEcc9W0Px6xJojnkc8MsRIQ7J9xu/j
         7/cQuuRZEMklvFjnm1U/421+J8hKd7bgpQCotEGxw7Vd4h4L/YNt+wxL0ockdYjkOTGP
         JBsyeukld+T1EZNhSFIU8hfozYP1VSFz1heYXLvdYqsr0cAc51gM//purEVomEKTvNBz
         gZ2GVkOiF/sPML2T2JIIEWnHzFcoQDWBF3hIpxSNCHcf4PN1T92lDVydGOG7Lky36ms8
         /omJUGXAeysbrRgZJKUKXcpssr5QKBBWLOhJ7tetIT7i/z+NN4tBcn/LaN1IHntTP4fC
         ObEQ==
X-Gm-Message-State: AFuF++nRri0+WcCyP3adiygkgIbIqXAcGnyF2Mbc7fGlVlG+jePRAKJx
	GWPLZtv8/01/BtAORXIn4wE+RYke7Sp9tavvASgNq9x83bl3e6u1oWJRek/d7mqO2Q==
X-Gm-Gg: AYBFou14+vqQrqEsfQ/v80Tg5TAxejkNJrIHjFR4gxMbPaML4TlzhsHIBWai/yuD/u0
	GuvG5bsjnMwbQejApGRa6NNi8l/ZYOYrGIj2W+nl2pRhu7O70NI5HuaGv0gm2WKrwffIigKt1xF
	zT2QZzm2j5Wvd6dNzpoHGPK08iaZCsqCdR0TpUCIZgP1IQlG1tDwRUE+Qg2OogWLhCNo0eLo/XQ
	aWcBewjEMCQV1w8hnssWZNcikNxwbl3EIWkv58ViD9yOG+p8CTdXD6psCWnNl1a7GRDv5BIyoif
	qnLd3WSEsb4787cOxVQEEsg8Ker3ggSF7G/kaOOyTcAmXuce+sLIK0jQ2GVti5DNp86FvlOGxUl
	yY0t1rko+UN8fiIjwLSmrO4PB+vOZU/yuFnfvQdczbL28k3KLKOWwy29G53nezUc9pspnmKTk0F
	+GUarwfDxhDOjPZAw6t5LdFI6Qt0iECsovfbBLqOjUIcojWffnw4H6M7txPtcIy66IVJMOv72vd
	8uS2M4Kk0NnxLcglsDmg3RunkU9DLU2OD+LHVUJVprMoiC3w2opwXq2WE/oULavYSQq24FLg2Ta
	SWlS1B0RKnxLPTkitWxZZons/guIX4exfUSLynZtgOCPx/c=
X-Received: by 2002:a17:903:b84:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2df9f25e4f3mr506125ad.5.1790337676068;
        Fri, 25 Sep 2026 05:01:16 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9feddd0sm1195785a91.2.2026.09.25.05.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:01:15 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:01:08 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Todd Kjos <tkjos@android.com>,
	"Tiffany Y. Yang" <ynaffit@google.com>
Subject: Re: [PATCH] binder: Use %p for pointer formatting
Message-ID: <arZihAm72SO3V7ig@google.com>
References: <20260918103008.IkhCxRgs@linutronix.de>
 <arWhYvDBYgLwaY9w@google.com>
 <20260925075901.OqQNDQhN@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925075901.OqQNDQhN@linutronix.de>

On Fri, Sep 25, 2026 at 09:59:01AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-09-24 22:17:06 [+0000], Carlos Llamas wrote:
> > On Fri, Sep 18, 2026 at 12:30:08PM +0200, Sebastian Andrzej Siewior wrote:
> > > Commit 8ca86f1639ec5 ("binder: replace "%p" with "%pK"") introduced the
> > > %pK modifier in order not to leak kernel pointer.
> > > Since commit ad67b74d2469d ("printk: hash addresses printed with %p")
> > > pointers are hashed by default and the behaviour can be controller by
> > > `hash_pointers' boot argument.
> > > Commit 57483a362741e ("binder: Create safe versions of binder log
> > > files") introduced a hashed version while preserving the other interface
> > > where pointers are returned. This interface is for debugging of memory
> > > leaks. Ideally it would provide just one interface without leaking
> > > pointers.
> > 
> > These binder_log files is a different thing. These are userspace
> > pointers.
> 
> It looks like the reveal points, I wasn't aware that those are userspace
> pointers.
> 
> > > The policy on %p is to not introduce new ones. Rather then removing the
> > > pointer output make it use %p.
> > 
> > IIUC, the policy is to use %pK for seq_printf() files exposed to users.
> > This is the relevant section from printk-formats.rst:
> > 
> >  | If (and only if) you are printing addresses as a content of a virtual file in
> >  | e.g. procfs or sysfs (using e.g. seq_printf(), not printk()) read by a
> >  | userspace process, use the %pK modifier described below instead of %p or %px.
> > 
> > Has this changed?
> 
> I am working on getting rid of %pK.

Oh, I see. That makes sense. Nice!

> 
> > > 
> > > Cc: Tiffany Y. Yang <ynaffit@google.com>
> > > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > ---
> > >  drivers/android/binder.c | 4 ++--
> > 
> > This file is now deleted anyway.
> 
> And with it the %pK usage?

Yeah, it's all gone now:
https://git.kernel.org/gregkh/char-misc/c/fd2bc059ed46

--
Carlos Llamas
