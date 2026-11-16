Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794838945;
	b=ISX9ViLnOwTz4pd28w9sQ6PZTcGKRiKZ4B7uk0tL5jApeXtFp4iRYuiVI8H3OTUtR3ys
	 N+62pSdnJDOPU775Slj264PS9HQ2mhxXpHme7wBvaRQFNNClEpaW7igSulwa7W7ee4G2B
	 ANVY0oxqCjSO3o6Qehvj/Wj6vcArZoFnNykkTRNVDsAqbmSPL3GL4x/q3j+3gBCz5fzVp
	 14ldYpd7ZqkR6JGEiy8MqKu98RLNuWfJawa3WSva4m6F3mcGT4FqCUMw6Ka/qt9om8RA1
	 MzRm0LtUno9w/We+X/Idk1G5UMV+vw6Y7NS5jCk0LHjKFOW3ja+4z55Fp2OUgjcfgLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=whWJsRn/1UObkhQ6vFbtYGotnDXUyjncCuIw3+hU87g=;
	b=1bC0BTToSfMbuKIaXh9od2n8e2XpctIssJIJ2ObCdy+frBKw7grY5O8w0+RQA5Yo16oV
	 7NHDlNtaR1cel4vJi4PPsy3gmwRbf9qqBpwjy72CVDupiBGy37y26vG9C4+ZDtkcrPbtY
	 3HjBMtuCSB6tSi3b5IraEgogWAVmFA42veX7QP7/MvHet9duqwXcJHWvhZvMJDj2jVr+5
	 W0q10OhlQ3K8UKxDCW6JmrPPo0LYSD0YJW5ipW7EHRI+bfevNrTGoFhvnJkp6L0PuGkX8
	 EjY730u6HQ6Kn/nB7U6fwFem/fMPAU37RSOOLLZctOkXbyzheJJaq7XpXrzBIvzEX2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbKEu8PE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7A8606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D7A8606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbKEu8PE
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-94961d90b79so233244585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:22:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794838943; cv=none;
        d=google.com; s=arc-20260327;
        b=eAp4P36fac0v4r5o2RR7B+wmcBvACoH0kAUdf63DycYZK1R0DO3+Ksfhb9fHlm54LZ
         ZH2XP22uRVbStx7GL83cFP6aSCWvE/+t0XRrSO/WyVO5FcDmEy4yQrYrkkBMMOeNfiZc
         5ZYWxpbyyIdqKcM+LmhoHJbYs5bHGT/aN0AvHoV2bYvoBQnhdHS4yBKmXHpxVN4SJcAk
         5VCb6JWkWAzVUZGNNL+so4C4eW9zc7d3HvVYHHLHt4DOGd3g+IpEq93zSL1Yg5+rkcRR
         b6fEE0ied7CKzOzuq+Db4DYG5S+qJvdbtTnG+Xjc08kL9UvjR/qA3O6YsVGLRpQ34tpE
         wpbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=whWJsRn/1UObkhQ6vFbtYGotnDXUyjncCuIw3+hU87g=;
        fh=M5L6qTpF1VNIplBXOfFOX5ZYBP/M8hSNMqnxDe55hnU=;
        b=GbyA6yGVkAAKT31MJu0juqdGjDdfHh8hXz58ZwskS8zOPp/qiBicG3m/r3YkThFwyA
         qX8nAUV1xGzmzqdmABQ8YkdjRXm/5BIA5jqsmJkgLayIMYvmNSSiZlCEbIV7EwAh8zrf
         ltk9dac7UTdOx8UcuFjeTgezugbXUZPDZc7YiRTGXPIr52fnxepBPl8xvtsQjsOcNYuq
         WmtO13zVfZTwA/SsvynNkQDtiIdI89ty4Oy81FtZtKeGa1cGFSitakyel87tHA3bu+/O
         gZHAdQDsAgz8W369sgtIW4qlN//kmTGyk4tYabmYfePYlzeBu+R1KuZt5akNE1mJSJTN
         K9qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794838943; x=1795443743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whWJsRn/1UObkhQ6vFbtYGotnDXUyjncCuIw3+hU87g=;
        b=EbKEu8PEVyxZpvcV8E8o8s9RtLWPNC55zu7a8fDADbC9Qtok+mA5D2Hmu3/yKIPklP
         N5xe1Gr6y/kmZM9MlRy+0wk+5TKAgA/e/XOfEj89PP42HU4Cy41ngVQWRpWacjsHvLkg
         TSpsYAcI2DIss4ePq6B8twl2HIq/V7b6yzsIwPMkPIoi3gh/lKpDsl5OpKaalWCooAnE
         o7gKkHDDG16mb5yt6jLIFQ8ImWdnBYGaOrYF+Vtx/6CEABrzEEClVmwTMZJToFfYc7dM
         pFwlAiLfKTPgM2nX72hL1QwhvkEyiHr+7SiVvkSMfhxjTmz0v9pe5QW6DooX2f4yr2s/
         00ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838943; x=1795443743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whWJsRn/1UObkhQ6vFbtYGotnDXUyjncCuIw3+hU87g=;
        b=DrB4EjA+fS3wre+dVVjfZtMIq8wdeLC0N5CnAvTSd9jh4+tk03IgKNYmdy9c44MLMC
         LF0O57vySH2fevIxtd8JLvP0GQ3a7opcPjP/eXv4W+FJFuuNndc5/GiYOQyn0M7plloZ
         u6ZYCm6oJIW/Dc9DHCTCoffkai9l9SpvmzG0EGxGiFwT3Tp67OwBJLKliKIxF/ca2f2a
         zIgPHdDcDUZkMXrxswAR5uoWhMSFU0ck7rqK/BDCC3PnPxivhQFWdiqmCdaho5/qOckP
         Z99omCOVmw8/dIfIdxQnObZbn8LkJV28rbx0EzZZZrFk05A5BcMbwSlKHXr8Cvj4El6m
         Il0w==
X-Forwarded-Encrypted: i=1; AL+hErFW525/m+FzJio8EgriUwex1dfTpPpOwMTklDBxFZEsMwX5JjRO8NAzRPfCwkG7NAyZ7FMWL4Ebc+UyDqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PGJKg191/0JAlawUx99I4qumHT9Cla5siPhiWRAMM4sh/RhEM
	AJLpqUooYI80pbA9sl8CEH4l/pJUBNyW3+sZhtBBOJ3YyX22DtH+S5nh7DO3C4J737jmfk5oiNY
	yhKmVskmbcQPrMQXtOHb2nFZkuveW6Z0=
X-Gm-Gg: AYBFou3gRVRZhEALxZM60yvkhvdhPIEwTjT7H3xNhZVg+nRpQaHH7bV3Xh/hXC3s/lL
	Li9/kcKE9gHL+vj1kDmVZ5dLYpVv4T4bGc/b+AO6dersH/bNz7YWCXTtIfE2qMxwnOPzzJohkTE
	+B1VGa+sJa590B8R0Bya+y31OQ8Qawy+ABQIeC6nblrMVC6YdfbofkuPtjq5mmzCTaaDVjUnm8G
	1lL46EhWTebflauv4DwkKLAYGwTStYsoMEo0/7as7bfnD4hvEeswNimsvDhimF1mTGrhmShwqIW
	NLFnwfZFWnQpxW/Z8lnqoXogNaAKJ8qI0Xkgi0oyy8wG0yKCcQlO2CGGJ8WIPvHAPf/vG4S8k4v
	FDxhVbFxlgd1RRMmVOMcsXkdNXev7ow+uGvpU
X-Received: by 2002:a05:620a:6497:b0:93f:2aa8:c550 with SMTP id
 af79cd13be357-9494ba7e95fmr1498779385a.26.1794838943170; Mon, 16 Nov 2026
 06:22:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114200703.33229-1-mbkchelofficialdev@gmail.com>
 <20261114200703.33229-2-mbkchelofficialdev@gmail.com> <DMWMG16XGPYB.W659Q8DBV6F4@garyguo.net>
In-Reply-To: <DMWMG16XGPYB.W659Q8DBV6F4@garyguo.net>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Mon, 16 Nov 2026 16:22:12 +0200
X-Gm-Features: AclHuK8fns1-r926XfwgL2WRc_EEssCxZIC_o5cjkaSCMh-o-Y6f2l6EEQJ4o9U
Message-ID: <CA+YDrKAM1-Jx+WH+ewzFuU9SzF=Ef=QYs-stgDNHC=7t84cCFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sync: lock: allow fallible initializers in Lock::new
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Matthew Auld <matthew.auld@intel.com>, 
	Arun Pravin <arunpravin.paneerselvam@amd.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

Thanks for the pointer, I missed Philipp's series. Please disregard
patch 1/2.

Patch 2/2 (rust: gpu: buddy: store the allocator inside the Mutex)
depends on the Lock::new change. Which tree would you like me to base
it on? I can rebase it and resend it as a standalone patch.

Best,
Ivan

=D0=BF=D0=BD, 16 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 14:0=
8, Gary Guo <gary@garyguo.net>:
>
> On Sat Nov 14, 2026 at 8:07 PM GMT, Ivan Tverdokhleb wrote:
> > Currently Lock::new() only accepts an infallible initializer for the
> > protected data, because impl PinInit<T> defaults the error type to
> > Infallible. This prevents wrapping a fallible initializer, such as
> > Opaque::try_ffi_init(), in a Mutex or SpinLock.
> >
> > Make Lock::new() generic over the error type E, so that it accepts any
> > impl PinInit<T, E> and returns impl PinInit<Self, E>. E must implement
> > From<Infallible>, since initializing the lock state itself cannot fail.
> >
> > This is needed, for example, by the GPU buddy allocator, which has a
> > TODO to move its gpu_buddy structure inside the mutex.
> >
> > Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
>
> See https://lore.kernel.org/rust-for-linux/20261022160725.2215244-2-phast=
a@kernel.org/
> which is already in linux-next.
>
> Best,
> Gary
>
> > ---
> >  rust/kernel/sync/lock.rs | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > index 10b6b5e9b024..26c071088b02 100644
> > --- a/rust/kernel/sync/lock.rs
> > +++ b/rust/kernel/sync/lock.rs
> > @@ -128,11 +128,11 @@ unsafe impl<T: ?Sized + Send, B: Backend> Sync fo=
r Lock<T, B> {}
> >
> >  impl<T, B: Backend> Lock<T, B> {
> >      /// Constructs a new lock initialiser.
> > -    pub fn new(
> > -        t: impl PinInit<T>,
> > +    pub fn new<E: core::convert::From<core::convert::Infallible>>(
> > +        t: impl PinInit<T, E>,
> >          name: &'static CStr,
> >          key: Pin<&'static LockClassKey>,
> > -    ) -> impl PinInit<Self> {
> > +    ) -> impl PinInit<Self, E> {
> >          pin_init!(Self {
> >              data <- UnsafeCell::pin_init(t),
> >              _pin: PhantomPinned,
> > @@ -141,7 +141,7 @@ pub fn new(
> >              state <- Opaque::ffi_init(|slot| unsafe {
> >                  B::init(slot, name.as_char_ptr(), key.as_ptr())
> >              }),
> > -        })
> > +        }? E)
> >      }
> >  }
> >
>
>
