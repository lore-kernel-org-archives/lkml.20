Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792929926;
	b=RKillTg+OY19n442E0G2QyAFPrA17u1Tfs4fH1i2/E8HbuqtVGr7AImdD8+5K7n5NwAN
	 6nFA0McAQwnq+ZUjb0NzLhVmK+Pjjdktq1zGbLeJAofTX59MItoAp5VgmdVR7aDir8MaQ
	 CKYVYvZRITppYSDu4uDnhiVWaCtzwCXKVaY2gFkxoTi7x1DMaGKMl4u2eWBY1PeagiKeO
	 bl0buxqGq2O+OI1LBCdmp31FZrpibtuDZAb/zdWlbKs6sGxAKShEK9mpbv9uh24ENTut2
	 zkvBs/fbGWrsU9P+UPkLi4C2IqOq5UzTPQpvFVwFDqF/1hpCaPxVhcFbE9xzLlsOQfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792929926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZLCOnd82Q2AmvSjk1g9482NEnoKPBW6l7CpBPhWPtsU=;
	b=suy9SlVDVk07Vg0SbclyHOo3s1OQ05maYWagiU1Hh/Mqles70VhPTIEfYzgWPNwyrS4J
	 FnDxgZ116hzWOEjbbyTn3pGEbBWQj8HmnH/mTlklhHybCv1k765ER2HbUDyWbUYha9Agb
	 uDO6AOmKg84K5IRhdzsTgJln1YCKYnFbEl5G1ZiObfDlsNYZ9COFygVG/peRP0y/IwXiK
	 YNo231Z4W98EsgFCByhlZu+e7/yfeKuRk9IiEUHImJ/D7lnmgo4WNwfWrrifBMrHOIToV
	 sncy/3OWwPDqwjA51wjJywTqQzo4Y6Ccz0dDL4bCp9n4eEObXYqlhhxDmkObJJ2/psg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GBihmkTC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA27606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA27606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GBihmkTC
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1289308f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792929924; cv=none;
        d=google.com; s=arc-20260327;
        b=ObTJQpKnsKYoZMgDUGAl1PpHxs0mCGizGQS1PPgyB+INWB+IACT7j/AW2NmWQ8xlRp
         GRCHHrdn4ZDRhuo36vqpf7pyoFsCa+/Ui48uoBzIxHKDP1nLylbaSfmsLVwEt1lCqORA
         VWK+gBwdcmyWGD6EmPgfJJ3fVhiqNLynSGRFKNm1oWQWpHnAu3NRrOayjJVvQIBwg0xx
         4TD6GoP20HdAl/gwLExeu1CJTXp9MAKqVPcuK1FaiRzV7VCxa70H1MIxKpOA0PJfcO0v
         NpuRBOtvwSI+6nZgb3pfiqJQewd6cG+7ndeguN2+N8R2dAx5/ZvhkEK30WvWFU+5AG/3
         dGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLCOnd82Q2AmvSjk1g9482NEnoKPBW6l7CpBPhWPtsU=;
        fh=J0QKfFGqE/NqMtxVzH6moYO52GjTutzP8Djwl7O9ET8=;
        b=YlqT9Xc5G0SItSCQnIsn83YuKqHpuxz2jRAIkG6TQqntK7OrbdfgTPswf8SaO4V+do
         H60axXNIc6PiHkXKlp/q9B0rND7QK4xk+ZbnUYUv6qZN/kbzhURgpbpuTGkdyOAPOzPJ
         Lz/aO3X20WgCDcQEf8+KUCH5cEbFbylorXREpHjgayyxCNIJhs6yBE2CZC2262c+y+06
         MCNifrWMiUCXldbdeqdt8LRYqH8yfIM+h15ThEuZvp+kxmuzKrI8A78d6bNdsrDP7u00
         1v/ROHCJZ0T1/OJtfddMuX+EfwK6diHfmpnpTdQ3x2FYHBPgUX3AEqnoFJiYnQC+IOpu
         +wqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792929924; x=1793534724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLCOnd82Q2AmvSjk1g9482NEnoKPBW6l7CpBPhWPtsU=;
        b=GBihmkTCfHn+bfUYbg5tWYX7ugUcM7fxxWrF/zRRCSXag4BycNDkC0a+lcBBsqSshz
         XvzxWVb5fK0a4IEInLXlS7Stu2IcUSWQtANo8BM/0NEjnkci4hNcju59hcIiBVg3Y6uE
         a0N2YIkj5LXDjERGxAo/qPrz8wW1jU0sd8/2SgkPyXtaVz1895anA0Zfne+0FUp9OlOD
         qyZFWBoiDPWbWEk/Lawl/2zUyQOPJckcrhz7vidhpaAxXRKrRPka43Xtnc5gUxDxlBR8
         0cHdW22MDXuh224/lV8nrSsx7FF6N9IXp3/7PfZSjv70r8rxP3nZQbl3UhAi4rlkacPI
         Q4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792929924; x=1793534724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLCOnd82Q2AmvSjk1g9482NEnoKPBW6l7CpBPhWPtsU=;
        b=EQRMdplE/u17iuWDc0vlgONkQ2VMcVgu4lluQCEXTdYb1oaSPT5K4e5iVsPVR2mw3H
         0nyj8yJkXsGwbCgZz1iS4S3aaQfGvpyLo19xzO2aMBCrk/7mKuo7hd9alyif9kAm7SCR
         N5x2BhEsilu6aUzfof/zRcUTbMHuJKdUODeHr05oEPuVIq3HzimijE79k0La6TauW1ie
         tiya3V7RIq3WmgNpjiNqD1Rj5lBfKeBjg3H5t/WqxaAcRcld+Q+Q8Tcoj4XAhHl+oSR2
         wP+FbMFkvU23C098bUKYs6nu0jFpvS+WF/Os+9imS9dFO4r/GlXRRHbC3Mizy14I97ur
         KCyA==
X-Gm-Message-State: AFq9FYJbj6zxGit1BS844aqEHlEwVNct7E/LBElqDxFtrD30Qr6jTVHD
	BQKrCyTIeVAIm7XA2g4NfE1WniMdfOThQs0CHnTPtW4L777NQYPJvpEgpe6Rq48SWnr+lguXBQf
	KeDUpmrqGcTGb0d7qSiB+GQZtFbdXoJHtSjjPKAJq
X-Gm-Gg: AYBFou2MNJO8G7fT8dmVirOvV04/A9W9vfVsIrmjrRl8oq4mjVkbORSbyCPjWftLKM5
	hKax4hr300aE8JBQA9/t6DVVtSS7xmuEdpeL1w9q2qY3FxZQ5ks7sMiI5QQjR7wAMQKKIOlzDXI
	pDkUbutBsaSJhIFdm9fYnQqK/YJ+aLKygFpDfaIFC+7G3JrKHD5cPvFk8pwn4KjiCnMw/tSsmON
	ArEUArUuWlU0eHrpPmSebq5OiT5Y4gGo1pThvzTh9qW7PCyeXnfgJRmI6VipPkbSxk59zNQktVX
	i1p8drCaPAzyWHp/vjFqlJez4rLUyJg5xb2uaRr4S8WNt36CYwKKK8xhmf1zBYOJ/D4C+v1qgnk
	hdbe2+9V8erzTGK06aOyYVCVQ5+b3afsBhHfXwDj8KlnB48INhLdsbjixFr2DTmdgfn6HoxOKEn
	DyG8MJN6+GIzGwrQ==
X-Received: by 2002:a5d:5f44:0:b0:48b:10af:f85c with SMTP id
 ffacd0b85a97d-48e3eb9da68mr6693615f8f.37.1792929923496; Sun, 25 Oct 2026
 05:05:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260823-tyr-gpu-unplug-b4-v1-0-e99c07d4c785@onurozkan.dev>
 <20260823-tyr-gpu-unplug-b4-v1-2-e99c07d4c785@onurozkan.dev>
 <20261021093808.1128449-1-aliceryhl@google.com> <20261025112341.60054-1-work@onurozkan.dev>
In-Reply-To: <20261025112341.60054-1-work@onurozkan.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 25 Oct 2026 13:05:09 +0100
X-Gm-Features: AclHuK_vlq1pG_e9KogyCUhHCbMVS-gy1nu0YhyrawGdRf1hO7SrcpUQY2i8IzE
Message-ID: <CAH5fLghQAGskFzEOAQwjO9eDoKU51nG4L0C8EHNOtugWov4hHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/tyr: unplug the GPU when reset fails
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:23=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.de=
v> wrote:
>
> On Wed, 21 Oct 2026 09:38:07 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Sun, Aug 23, 2026 at 01:50:08PM +0300, Onur =C3=96zkan wrote:
> > > @@ -56,7 +57,7 @@ pub(crate) struct TyrPlatformDriverData<'bound> {
> > >      // ensure the correct drop order.
> > >      #[pin]
> > >      _reset: reset::ResetHandle<'bound>,
> > > -    _reg: drm::Registration<'bound, TyrDrmDriver>,
> > > +    _reg: Arc<Revocable<drm::Registration<'bound, TyrDrmDriver>>>,
> > >      _device: ARef<TyrDrmDevice>,
> > >  }
> > >
> > > @@ -161,17 +162,18 @@ fn probe<'bound>(
> > >                      gpu_info,
> > >              });
> > >
> > > -            // SAFETY: `reg` is stored in the platform driver data a=
nd is not leaked or
> > > -            // forgotten, so it is dropped before the `'bound` regis=
tration data can become
> > > -            // invalid.
> > > +            // SAFETY: `reg` is wrapped in a `Revocable` owned by th=
e platform driver
> > > +            // data and its reset handle. Neither is leaked or forgo=
tten, so `reg` is
> > > +            // dropped before the `'bound` registration data can bec=
ome invalid.
> > >              let reg =3D
> > >                  unsafe { drm::Registration::new_with_lt(pdev.as_ref(=
), unreg_dev, reg_data, 0)? };
> > >              let device =3D reg.device().into();
> > > +            let reg =3D Arc::pin_init(Revocable::new(reg), GFP_KERNE=
L)?;
> >
> > `drm::Registration::new` requires that the `Registration` is dropped
> > before `'bound` expires so that `drm_dev_unplug()` runs and
> > `TyrDrmRegistrationData<'bound>` is dropped while `'bound` is still
> > valid. Wrapping it in an `Arc` makes this invariant fragile: if any
> > `Arc` clone outlives `TyrPlatformDriverData` or is leaked,
> > `drm::Registration` will not be dropped on platform unbind and
> > `TyrDrmRegistrationData<'bound>` will outlive `'bound`.
> >
> > With `pin-init`'s new safe self-referential struct support in `rust-nex=
t`
> > (see e.g. [1]), you can avoid both `Arc` and raw pointers altogether by
> > storing `_reg: Revocable<drm::Registration<'bound, TyrDrmDriver>>`
> > directly as a `#[pin]` field of `TyrPlatformDriverData<'bound>` and
> > having `_reset` borrow it via field + existential lifetimes:
> >
> >     #[pin_data]
> >     pub(crate) struct TyrPlatformDriverData<'bound> {
> >         #[pin]
> >         #[uses('_reg: invariant)]
> >         _reset: reset::ResetHandle<'_reg>,
> >         #[pin]
> >         _reg: Revocable<drm::Registration<'bound, TyrDrmDriver>>,
> >     }
> >
> > and in `reset.rs`:
> >
> >     #[pin_data]
> >     struct Controller<'ctrl>
> >     where
> >         exists<'bound>: 'ctrl,
> >     {
> >         pdev: &'ctrl platform::Device<Bound>,
> >         state: Atomic<ResetState>,
> >         hw: Arc<HwGate<'ctrl>>,
> >         #[uses('bound: invariant)]
> >         registration:
> >             Pin<&'ctrl Revocable<drm::Registration<'bound, TyrDrmDriver=
>>>,
> >     }
> >
> > Then `probe()` simply initializes `_reg` first and passes `_reg` to
> > `ResetHandle::new(pdev, hw, _reg)?`, `reset_work()` calls
> > `self.with_registration(|reg| reg.revoke())`, and `#[pin_data]`
> > statically checks that `_reset` drops before `_reg`.
> >
> > Also, as a heads-up for rebasing onto `drm-rust-next`:
> > `_device: ARef<TyrDrmDevice>` has been removed from
> > `TyrPlatformDriverData` (along with the empty `PinnedDrop` impl), and
> > `drm::Registration::new()` now returns `impl PinInit<Self, Error>`
> > directly without the `flags` argument, so `_reg` can be initialized in
> > place via `Revocable::new(unsafe { drm::Registration::new(...) })`.
> >
> > [1] https://lore.kernel.org/r/20261019133647.1279779-1-gary@kernel.org
> >
> > Alice
>
> Any idea when will we push drm-rust-next changes into rust-next?

We are currently in the merge window, so drm-rust-next and rust-next
are both being pushed into Linus's tree. Once the merge window is
over, drm-rust-next will have everything that was pushed to Linus's
tree available.

Alice
