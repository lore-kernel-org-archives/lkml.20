Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8601B4223
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753013; cv=none; b=MeRC+liNhYFZpPNt9ZoVt1RT6Wx0D+XBAGtyj9q2H4XJCwTI9ifkOWhjSCpG3u7+Dzz8iKGyk+ylbScCIA0W1xhY82+ebFrKf5mq4IAJfaIbnx2EmODPis8j6Vi8WX3SFs0KpLwWSCMsjqkOdiqJ+aupozWL/9LJ2Grn5qbsyVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753013; c=relaxed/simple;
	bh=eOWDtM993LvzR4PXJYtYIUI/SaXxP+ZtJGv2sQMHhaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1KsJlvGbMrPQXx4pWloEyvECcg52BFgGm8Hk/1gOpkDUErKid9lGs7869LNIg9Ovz/oO2UVTVN3ATjSqu/BO6IjuA+P5EYNvV4p+8ZUMUgRIpsi2p/OOLe6cqIL6lVIimJL1198xNxfvzrNsmOXhb5Ewuo6E3EANxk2TMr3WM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gUtgcq/j; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gUtgcq/j"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso12394795ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787753011; x=1788357811; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YQ1O3a7BEQ576b846tLfxlLaWsfr16E0PmQle8XoP8=;
        b=gUtgcq/jrvxSYefpMXYEnv5Ms1B2toGxHbPMmXTN3BQ3rDoyhfKCiUY7Rn+Ofa86Qj
         vQwCpoX7vbXHYadx7ImCgLliUiyd87XDFPgndptqiXJpqGYVN696Vt+zQGpmcwIpoRwd
         ofFzaBMS3oWtesNf4p7ZADif3653KN+hyIAhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787753011; x=1788357811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3YQ1O3a7BEQ576b846tLfxlLaWsfr16E0PmQle8XoP8=;
        b=qoUjO2jevHfkuyQfAG0wHV+EmEmYWTrkZobhUuQc57UaHzSibndcIuZiuRcHUlvs/7
         kY/3dqmknKLHm13ORGHC8C5e52h7+IxXLnMXmhvl3ihtSBw2CwPGdROwj2ekW46PeETp
         hkSB92aWJt6YSeRLtXPXP3bTVgkpREsQj7gnEfs8fkYGpp6udZwJVUMjV+cFMPE3fY6k
         tLm6zP7VUbSCP00Krnan8IQ6titN7NrJk2lHkYmjaYGytT7fNZTGbTRUcj69qwTM6+JP
         Jha89wnSqoNJkWl/VLcbunolQGKram94FrtawgOccq/Dn0TKsJpqzcPKq6AcQOC87Vn0
         XA+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqEtEMhK3jerC1IwckOVfUW9fOK/Oy5fYCpeXVAKhVtA12QQU/oKm/w6+XoazLzW3vHJMjtob1IQ+GVcKg=@vger.kernel.org
X-Gm-Message-State: AFuF++mS6cQEacxOzDmLhyHiFLlych32fKE7Dmrffiz2IcZIqSPOD4KE
	/Y00qZpRl/TKzKemFKKQkVzA/X5Ej9T3wvmC/BVG2bakKvY0toR7yqgAi7Gu4MR5Qxltn0C8l00
	v9m7fWJkw
X-Gm-Gg: AR+sD12vlQPrHJC/RI8WSVhGIayu2tSDcpi1Q+oMXoa/Tw5Qc855wFGPwZPxqM4XVtJ
	MSjwvhb9UvccwVxU9RtbTETsdrQn2hdyVU+2MlzYHRRRNlegVDx6d5N12A8D2z3aLooV+fdUBng
	MRGSCg/cc9U0nYMIprAjKIiz6ERCCSDfx5sPxJ2QOU8S+MaB31Rrxr5kv87GnhYuhFPtL1XMErH
	97o4U5CjAiOnn6yQ0yRkm0HCwIh00gf28p9TTYIGURclobji/1DwqHwKTQpoNxjlOeOJ8lsTWJG
	0uAAfbf51IfztCmRK1dw9UCHLwiSigQWw5mGkxFisvnZMjPQZ9Jpf2JT/XeS5gtL10Adcz09hYl
	eHla3bnYp66y57Bo5kYuczTT3TBaNpfpLlscsIX2BAhCmBZDg7ecZq3BSIQ7ZubRregZECmJ1UJ
	UC+uwPd6QxfiVWQCMy3p3DPjXAaKn0LJqF1/1YZwQGVIfI+oBkF/Yo0NTjhcTlPbQwF0o8riIuM
	+e9IfSrSLix+08MGq+jekJnIC8yHA==
X-Received: by 2002:a17:902:f64b:b0:2cf:7ea3:7cf1 with SMTP id d9443c01a7336-2d6dc98d8e5mr191538905ad.5.1787753009961;
        Wed, 26 Aug 2026 07:03:29 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704b9ed08sm8057065ad.42.2026.08.26.07.03.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 07:03:28 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1587527a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:03:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpA3tcjqnWBzpt6hpAijwycPquZyLIMmHKpdsHTpUVwqmAdKDtcrR9Nlyzj+xyWhQRrTTpurP1YsRPIGkw=@vger.kernel.org
X-Received: by 2002:a17:90b:2f06:b0:369:7491:7b24 with SMTP id
 98e67ed59e1d1-3964595a73dmr22431303a91.6.1787753007440; Wed, 26 Aug 2026
 07:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-unqual-v1-0-7024fb81b4f9@chromium.org>
 <20260825-unqual-v1-1-7024fb81b4f9@chromium.org> <20260826105527.7ebbb4b1@pumpkin>
 <CANiDSCtKVT9fnkx=-d2-aOd=uqODERFw-fAm6bg2eX=RXGMaXw@mail.gmail.com> <20260826142204.7269edf7@pumpkin>
In-Reply-To: <20260826142204.7269edf7@pumpkin>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 26 Aug 2026 16:03:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCuAWhEZerLE2Ki-agDgZ-WEZLr216siKRq+Zj2PnaRWMw@mail.gmail.com>
X-Gm-Features: AcwNN1UPC157xfljKv_JsxBT_y0zjaKHIht79TsT5My1H0BwGd5Ga-7oJMwjg3I
Message-ID: <CANiDSCuAWhEZerLE2Ki-agDgZ-WEZLr216siKRq+Zj2PnaRWMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rcu: Fix casting while dereferencing rcu pointers
To: David Laight <david.laight.linux@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Dan Carpenter <error27@gmail.com>, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David, Dan and Paul

On Wed, 26 Aug 2026 at 15:22, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Wed, 26 Aug 2026 13:28:42 +0200
> Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> > Hi David
> >
> > On Wed, 26 Aug 2026 at 11:55, David Laight <david.laight.linux@gmail.com> wrote:
> > >
> > > On Tue, 25 Aug 2026 20:02:10 +0000
> > > Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > >
> > > > diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> > > > index 44c07a66edff..80276cedda80 100644
> > > > --- a/include/linux/rcupdate.h
> > > > +++ b/include/linux/rcupdate.h
> > > > @@ -488,7 +488,7 @@ static __always_inline bool lockdep_assert_rcu_helper(bool c, const struct __ctx
> > > >  context_unsafe(                                                              \
> > > >       typeof(*p) *local = (typeof(*p) *__force)(p);                   \
> > > >       rcu_check_sparse(p, __rcu);                                     \
> > > > -     ((typeof(*p) __force __kernel *)(local))                        \
> > > > +     ((TYPEOF_UNQUAL(*p) __force __kernel *)(local))                 \
> > >
> > > Ugg... TYPEOF_UNQUAL() is absolutely horrid...
> > > When __CHECKER__ is undefined the whole thing is just (p).
> >
> > About using __CHECKER__: Are you suggesting using #ifdef __CHECKER__
> > to use TYPEOF_UNQUAL or the current code?
> >
> > I am open to doing that, but I would like to hear from Paul if he
> > favors adding the (also horrid) #ifdef to save some CPU cycles on
> > older compilers.
> >
> > >
> > > I suspect reducing all the definitions would measurably improve
> > > kernel compile time (even before these changes).
> >
> > When I checked earlier in the other patch in this patchset, with my
> > compiler I can hardly see any difference in compilation times [1].
> > This is probably because GCC15 direclty maps TYPEOF_UNQUAL to the
> > built-in __typeof_unqual__.
>
> I was thinking of the _Generic() version.
>
> But here you only want to remove the (I think) __user marker.
> I don't think you want to get rid of 'const'.
> So you don't really want gcc to remove any qualifiers.

Yeah, I see your point, removing `const` might hide other issues.

Dan, what would be the best "sparse-approved" way of removing the
address space qualifiers (__user __rcu)  but keeping the other ones
(const) ?

Paul, would you accept an #ifdef __CHECKER__  block to keep Sparse
happy without affecting GCC type checking?

Thanks!

>
> There is an similar(ish) issue when an __force cast is used to
> remove one of the extra qualifiers.
> You really want the compiler to ignore the cast - so it checks
> the actual types match.
>
> David
>
> >
> >
> > Thanks!
> >
> >
> > [1] https://lore.kernel.org/all/CANiDSCsMrULsrGQg76x28GRXLg+HSKFWhhA14Zcn8hdm4KyOVw@mail.gmail.com/
> >
> > >
> > > David
>


-- 
Ricardo Ribalda
