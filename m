Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BCA50E5A4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662216; cv=pass; b=nO57v05LopY2nwewt2sLXa6Gmb6HI4t23YFz7MHsbdxTx4l2lmg2aKQE16MaWEh5+UCA4IJZb/zGfoWxDKCuEC+IT8DGDWBOq7QZZp2AfnQ4JOHuPsT/5aVnpZtcq3qOioc29LbzL3gvR++fEeE6unKSeTcAdNveCzt39VTF1bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662216; c=relaxed/simple;
	bh=xzO8BptV7OQfhikq9rpWbO1fMzxV7YYzvbJNnZ0564o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sb79yFdyYcc0voBDoHnWozcb3TAjOBEDH+qR955auVNp2QB3cnZkoATdyAi6NatQ49DNbWuay1nRI/IgKgbzH4a9F5Xlbv2SywYiXqX16UkPIZ6CgSB/5Db94mGJ59eZrE1J+gXROCchyNaDts0U4Sy1Z0MCVlG7lWtRvz+IfOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+rhBbfi; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+rhBbfi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495437bb891so6716965e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789662212; cv=none;
        d=google.com; s=arc-20260327;
        b=H8kF6x9LrOGh6yoFaaxXmvc06I3VBmZqOtRZ19ceDnPLp500KLn/v7vTwzMScHPnAI
         n7ahJjhJkpSHqbrRzHWYg2mAbq5Ma2BU9qw0iVmNACD+OBIrBX+I+e+nGnnEOTtOYxWa
         pSq3jT9QeIRBp+ARAh9Va3Ji/1GGCbdJHGhjKy7FsW0Aq9vHkgTNGFYfo9k0Rds6Tlmp
         7/eyeFdUcd+ydc2Y5wM7yrx3Me6952v6tSNeRmAn6/BIyLDCL1cu81J28snnBKsezTt5
         oxidXroyR3/5270nkGyzYIczidOepm6BZOFKqhqpuasLTS74bclKkVi47/7SKJeAW7uA
         E2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xzO8BptV7OQfhikq9rpWbO1fMzxV7YYzvbJNnZ0564o=;
        fh=QXyFIvKzIFv03QnKYs7bU3tEgrdZBEgfGV4pgp85wD8=;
        b=jXgVkg4/mNYlfS+AFoOXUkA8gm8U1h9htCLLWBLN1BpRtMGNg1Itpje9N0rC03TbXq
         wH1RCrH+B4KtPtOAi52xt7mXM5ne6IWQf6dNGAKuAA2YEI8VUJ1XOnIAboWPHUHzGP5p
         Ve65c65MuuKkVL+bpUtUYsknBnUQ/h5+ouYQ/t+PRjaQDYt4wQQrwT6KT5iq8hUhhnr5
         waG48fSSpzMrdXWYsqidabYdPbT+04C5V+idLoSz/KM+lrxHNIIMEjYgwD4dKP0/Cm77
         vYtWU8QWYASZNDxh/GycDqHmcSOPOjtIk5zNoddtTy8IduKApNXeSIeB765aikDkxjjy
         cqyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789662212; x=1790267012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xzO8BptV7OQfhikq9rpWbO1fMzxV7YYzvbJNnZ0564o=;
        b=p+rhBbfi96UhErZI6rxsFeqivT0oXAiCfsfKhfm0zP50VoDXHgBT94+q9XTL1FFJXv
         6DI613GT3uNm5VZ0KtUBOw4IOUoFsja+U0orSrSIgPbXRbTKmnSDje77v5MRDx8r/HkV
         D2ZQZsErLCnQlPhrH+h2yUIxsIfrIjrhJO5HfQxj9MNQWEE+XK65/sjVd5ej51s6p1+Q
         RruVvW6RltNy0jvj/6CC7UAafc6GgoeskMqTjbdwdwH/i2Kt8LwNmElLyIphlPqrxVWy
         fIDAQNWsJmGGQvCE/AsAsN5G+KGdX23xHhcHtTc6Sa6p8oUD94cKbjzQs1Q5HqMhdEe+
         m9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662212; x=1790267012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzO8BptV7OQfhikq9rpWbO1fMzxV7YYzvbJNnZ0564o=;
        b=ddxweOc9j8kt5gXf9rPpIUI4nlPD2JfqLvKcAhSszmwCDfhzrSabNZu2pi6JaPJ3Tz
         ECNX5sk9OqX/HWPhUHTNN/xFiarZM1E3NlNKT52YyjVm7PefIf02K/UAabNQIfnNu5Gu
         uDAAyRjdm3sJ33f79R4QtLaQc2FnDv465AUsAbftYFJsBE90hGHeQ879k7CEDf5BCRIm
         ML4/Phv8e6BpND+eBoU4NUy4nkW+Q+7il5Z3gYb8zpvFT9K2DPVOsVzfnKrt4r+HfxvO
         AjHxc7FQRC6am7Ch/ndhoKR4otBz/eI7BI/OGRyu0tVERswDMv6RGJGkbLLPreYE69iw
         Bspw==
X-Forwarded-Encrypted: i=1; AKwUvBydyA/rNKF7kXQvY6Ockl1kLOVYlXKIOa/wfVqNViN929SxXhOQmLUO9k/3iqKLnr8K9S0YHQRieAk2HYc=@vger.kernel.org
X-Gm-Message-State: AFuF++nEZSrYzEUQ6l6u98M7y81SUUD7uf3iC1DIjBY7TT7g3YWzBsIz
	oEDn3D6Q6X0Sg/oXItOpCMPrdfGGsYWC38qlUst/OqesZIgjNwWBHdcg+463KFN359FZgWFUTt6
	VDGeYS3X+h6YujR+3oPNjyuOiOMP9/MyHNMO4/6m6
X-Gm-Gg: AYBFou0GnvFvG/kLd4kh28DQ20kZ+CVOVhjbOs40zTlmF98iAnpSS7wpyTNGUw6fiiS
	0/fF25oikHXGIgt6V1/EARyUxD5w7JXCBmdkhDBC3FVb6gz4dp9ZSGpAs8rCYjaF779gm2o0Tq6
	ZCKf0eRePppxCkMyX5UxUAhoBspK55jnzkzpuxaqk1mve0Jr/u0LzMiDoYneI9/Sk7MCi+cVvWx
	fPdnz7bzNOsCar2yLgWYw/l9Zki+/bjBF06YZ1rmvVYSt+y0TDnQAdfhyuV6hsF9E6LY+AU8FPT
	SFHsCsdtunj56pZgjQGOtiiNiaON4Yzz270B9GequjC6FoXD9hTtwEqrFGb4DYDqImTPwmjy5w3
	uHviYHzDvNuslyEDx3OSdRO0=
X-Received: by 2002:a05:600c:c0d5:b0:49f:bd43:5a1c with SMTP id
 5b1f17b1804b1-49fbd435a63mr53248585e9.15.1789662211802; Thu, 17 Sep 2026
 09:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915164000.124340-1-sagartaunk@proton.me> <aqu0bzgMAUQe_LZ6@google.com>
 <OFpa5lCrCbU3qGep0CtUhaT89qRwVqHY_LWoHC27noLYmjqgp8kAvHrnng6MEzqlqF3zvapYJrpFBpfjf9XiNfxtR-GwhnFMeIj94mKfKCE=@proton.me>
In-Reply-To: <OFpa5lCrCbU3qGep0CtUhaT89qRwVqHY_LWoHC27noLYmjqgp8kAvHrnng6MEzqlqF3zvapYJrpFBpfjf9XiNfxtR-GwhnFMeIj94mKfKCE=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 17 Sep 2026 17:23:19 +0100
X-Gm-Features: AcwNN1VD1F2eURP__bw4VJs5iXLEi2YyIyAvyAh6K9UFqZkXxZxEIhBqNTgRpjA
Message-ID: <CAH5fLgjrQO7Yo1PkBU3r5Tw36pRBRU37iCp_ai6LOj1XH8mBsg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: net: netlink: validate attribute length before
 casting to `c_int`
To: Sagar Taunk <sagartaunk@proton.me>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:45=E2=80=AFPM Sagar Taunk <sagartaunk@proton.me> =
wrote:
>
> Thanks for the review. Also,I wanted to ask what do I put in the `Fixes` =
tag?
> Like the commit which introduces it or explain the problem there?

You need to put the commit you are fixing. Please see
Documentation/process/submitting-patches.rst file for details on how
to write a Fixes: tag correctly.

Alice
