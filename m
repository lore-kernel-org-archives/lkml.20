Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB69329C40
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598099; cv=pass; b=BH8Pi5fu/1bihaS0Yl19FjAcYE97CXOc4t9cUKmJeWG3S5kJjhEMNJyVsi9kcloDDE5VlISqviWch4iquBfdKy3gou4g0UI2w3Wv3m7tPWbgLyfZXwFFpdNTMfyiBR+korKzlSQbvzMfLzMhly3puNj+pQsUDJ6jpgwZsS7h8/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598099; c=relaxed/simple;
	bh=oiOJzAh5GCDekkxzmiAyZpk6ok4wyCpJnQb5vZtuPkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJ/nnau/eic1f/M939BueJ268hEVMtHGCBh8oALWhM1pkcTpyxm2I4GKUkq6dO3E622VEF7VmEGI/d4ivzUgr3rJlo+HOubBKTtscB5V6qlgVzabpxy+yTPC5G6WveCjVTYLMrIMNcdg4tocrJ0mzvgcyTfwmVAYqSoF26xj6aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcPL6Cu9; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcPL6Cu9"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-347746b3664so73146eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790598097; cv=none;
        d=google.com; s=arc-20260327;
        b=h8R6ayJt7f2KsPtWwjaBHY9EzMFTFj9gvyU/uCAiq9uYMw1hgEXKtCGI9lSuz0Vrd3
         CnFC8/nLIijw4CkIMj75VZXTiJfNoPvQ3eKZa3F2k6LPU0KraPRQL/gY6N+OJlEITvLx
         BCJoCPFTJeOXokizLJN+3G51155jsTezql4DKvbWXFM53U63vzpAccJ6UV5GpNeHj+ew
         be6yJl05giO14NamAgIKtlrdU6llXgZQIGIdCIuCwsrgV6C5CJoa7rc+kdfh3Gjr+awG
         iNlzj1TTgQzkk4HNnwbXxeHuVCzn9YnNi51NC7PMAxktn69iFWOvgrZQOcVxhZ4inmy8
         873Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wW+kBA+Cpt1SUepJVoW2nRQFXA7jpL9oUIIw6VJqh7A=;
        fh=8MWmFnC9WWm3FtC6K/oEKD87kFqBcy9nr3zyF/x1P0U=;
        b=npg2dQBiSJ1bgnw+/e7uw1ATuWC/txzNLCjl4Ol72mhUh6NTVmrf6+Ez93fY5ztKtx
         SccnTymk6i93WTcq6ZECSdWv7xNcafkYnjGYt3nspV3TL+Cb5sOHnZVfK3WoXNy71VzS
         uBAvUmlVZYc65yLiDHrWguzndNoetJzJ/XYO1FyXHb1RTM++XYT6wNmpSin9DA47FeTM
         0qRp+FPr9IA8IgtNe+iizSP6Vhw7B+cXHADv5gceFVEN5u8oSdkyc3wWyQBcKxvGS1mL
         xB4T9ejdF8WPzT0k21rF4P+OzRq1g1/lI6/UmMiv0XRbouWvvxWGvz6YNDkLOip8CWz9
         dpNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790598097; x=1791202897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wW+kBA+Cpt1SUepJVoW2nRQFXA7jpL9oUIIw6VJqh7A=;
        b=WcPL6Cu9bX/LnWKrsZLXNf8mPSu108d3o/GU3x3DkUJZFg18ImlqT5L4oxTmKUgx3a
         lEGTJVITxQZSYRdEsz9PjFbdPPrsliiFp3ega2TCsZ17mwp/b9et+gu0AlEL60hoFNjW
         POtgGDpBxkQRnd4+6A5ISpcE15VQMQSyJVfT+vw8GPp5IL0jE63z+7YybFjvdnhPNozs
         Tc5ygh8tvfQt7u2A17e+A/2um5x3ISgeW23PXznrCYiU9oMuA03QXmfU1xW2X3cKtIOG
         fA/wYIght0Abp93x+7tT9DX/Ews35D1SewsQL+I4ZhRu/f/dyyRdatWo2BVC4vEDg18W
         31bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598097; x=1791202897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW+kBA+Cpt1SUepJVoW2nRQFXA7jpL9oUIIw6VJqh7A=;
        b=As6EQy70czMTfPk/7Ok/TNEeFNiWD8b7Z80vVUBaM4r38gV/jVgwnP91GwkmFS1r37
         4Gb8Dz1bj/ccmIby88oJc7B683a+FRqmN+cykA8EnWrwwBKq/F9JDNOqxlQSmdxwiBEo
         9qnvA7v1Mwex/KeReHAzfcmf4Ug7sIFHex0wIiPpb4Kgz+tQYIAumWMDPL0oBkbRgwDv
         f63+8FrL2CF+6v1NkOWTYyLWKv4RQGdmLrL7zjZqllMSMW9T/OEbdD1FV0EQValGKPoV
         aBkE9Og/YtumTANulM7cFY91k5b08Z9VHA89uHGZ+n/imff6tj2YEXy4EI4DOmpg7U6F
         6UmA==
X-Forwarded-Encrypted: i=1; AKwUvBwiXZcneQEUu6NKW9DkrS2Svuypqi3flmUtfIJwcVwRwrybeiv+MJwc1WsO8WiNAFOOp3YvEUPWM8N6Xmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7za2VLSRNt7nVzAAQdgUORA68Cj8RPtbF+A0kD81IvPa3huRI
	LNfn8wrsN4zExhEr6b/4JIMOcfdF/SaralxmhQTlH5+0lOPpI7MjsrCOyD7bzM4CXTl2XY/BTdA
	vtp8QndgsmRS56VOZK90rwpoCrXyedf4=
X-Gm-Gg: AYBFou07pKEB93MacU94V+1kpOGtVunmVw7dg3XJe6IZ/RK1o4c7g7QLz2ezMNyspsl
	kI/OHbD0nBlaIoynwWFAogNAQKL8IXnsFeqTjvv4RkSlpUzItp9t3PWJhsczjtYPbqwBm2ncawM
	X2Mj5XJHdEW/yXy38L55B7puj4OghZ63TX4sNv4A+TLnUhP2Lkc9vbOAeL0ypgHo7o7pqi5Lt3c
	wAeHKo/zZbxMjtfdbFU9kEfQ2x/B94u7m18PB3raU1TczCUV0S/YEoiY/B4eVFW0uqU6toAeBjq
	3/Njl8NYivmSknfg0m/5fLgkMtN5bmE0sY2+gpm4Gf3sTS78gR5olt4ClxPbd3orr2VuJu0AGz0
	H+HuLrLk0rndOvZBQRq8prL2uF6xw89XHW7sDALz+ZzhSkLYAXq36ddEoFjbJclWe9j5UHtpVhU
	gTTKzdrWTu1prsLxoSr22s5jsjp/UJ5fsKQoGTIaVKc27YPdQts7Y=
X-Received: by 2002:a05:7300:de0b:b0:341:f4d6:d9a5 with SMTP id
 5a478bee46e88-3427169be76mr15164074eec.1.1790598095923; Mon, 28 Sep 2026
 05:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921115708.4009754-1-gary@kernel.org> <CANiq72nR-QzR3zOiV=RL4je4U8m_hCsPhOD3SxAcjc+4VCrMsw@mail.gmail.com>
 <DLQWWUKZ61KN.1X8VCC2YLPD53@garyguo.net>
In-Reply-To: <DLQWWUKZ61KN.1X8VCC2YLPD53@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Sep 2026 14:21:22 +0200
X-Gm-Features: AclHuK8ncUNTbZ31O7I8Q9x8vu3w0Yp2ed77b6bv8_kyDXsORDHq3MTG00hhWhM
Message-ID: <CANiq72mOC_-6hzd=dG3YJoaLi=fYCZ620CaSXZv1Oo4ja2v5gQ@mail.gmail.com>
Subject: Re: [PATCH] rust: proc-macro2: enable `proc_macro_span` feature
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Another thing is that pin-init's diagnostics test suite is built with Car=
go,
> and the build script of proc-macro2 will probe if the nightly feature is
> available and enable proc_macro_span automatically. So if this is not ena=
bled on
> RfL side, the diagnostics can diverge from what we expect.

Doesn't sound fun...

> I think the self-ref one is the main motivating factor, because the diagn=
ostics
> with that can be confusing in general. That said, I have improved it much=
 over
> the last week, it seems that it is not *that* needed anymore.

Yeah, that one looks more important to have indeed.

> So, none of these are really big deals and that can be said to diagnostic=
s in
> general. But I think the change needed here is small enough that any impr=
ovement
> can be used to justify that. I also submitted the proc-macro2 change upst=
ream
> too: https://github.com/dtolnay/proc-macro2/pull/542; if that is merged a=
nd we
> later update proc-macro2, we should get down to just a single Makefile li=
ne
> change.

Ok, in that case (plus what you mention above and the examples --
thanks for those, by the way), I think it is fine either way.

I added it preemptively to the "nice to have" section in #2:

  https://github.com/Rust-for-Linux/linux/issues/2

Cheers,
Miguel
