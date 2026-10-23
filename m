Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792764161;
	b=Hvbw42xn8C4SLESSAIKbayk++8J+Wd4wXsIb0fRcgWY2MNnwpFnGEKa4H6MlGj4IuSKO
	 /xruYI8xQxT67ru7C02LBjnh3abXNno8nekS9ET0spPgEWvxbb4MaU4hMxDrvOa1mlYHH
	 52qnBzjIBVbK+gA0i9jne81lr/Egn0Y2mgoIEqzf3OIlsFQ5eHoqxpKKAgfgwCjstJlVX
	 0HGisHOPt2B3VDxmWK+1MioDwNHSbXj4DfCPQb1KjgUWHm8RSOrxYy7zt4ZtG4lVwZOqk
	 kfNm8atDuQHzWouD4+Lm9giUSwwNcurVeoJG8cWU4WSTjeqB68lT2COn0gwxADY6vdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KxLoDLWgJvMgs6wIWVpfV0QVpqCJ03FPiCeEYymXH0Q=;
	b=qM96c2ISqPPu8mw59dnoLGkwk7zmBwzlgn9NLghL3OE/BuiZ5pYBWSi2ofd2kZS49VNG
	 9tYiriX5bpxGSNWPkt3wP5vmdyajxmjBOUbYzQLa3OFbD18dBAMQYAeIRUwotGVOWf3lx
	 AGgNuy/vJgEWrhwzmmItRxM12NU1DGqtfhYCwQlbV2HWJ8/dQRokEc7s7Box7HacoU8LV
	 YQc0O/zDeRrFnMhHQTxF0LmIJ2si11muWDXlrQ/bfe7iREBWzu4o/KvxT5acvlwhBybBE
	 ZA5FAfbQRvEyT9t+rvPJOSZLt7Yz/kYVLPHKmihHK53NeS7Ul8bKYQnDba8VWneSmSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kRSd27EJ;
	arc=fail smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75245606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75245606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kRSd27EJ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-363cd582f45so89538eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792764160; cv=none;
        d=google.com; s=arc-20260327;
        b=UCkpViQ04vkI9J9N+w7T6JgtFqjyXhkpgKaUyMRcHPBj++rPOFTrvl7SSgYQmf607C
         fVpNBKTbe8iNHY0jiy41FR9x/LXPhmjPdCeXEIMK5JpSXJHiwlKilIY05v0+N5QiJfkO
         Zn9geSCEETT1O8yARknBBVdZ63MLXywTShUhDiHVaJ3mmzJyyIpY/8cV3enoRdYH6byH
         /+uH+4CZlJkVI4mL7cgwACbp7CguGFItRoOT8d9nplsiymrtynZa6oDZKjOZIUVvGLXu
         2vYFLjGlEltRwSmb2yGjjKQMfD8CU1noGWB5ZVEh6U6ipiayClgPeUc9Jw87SbwtNjn0
         p1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KxLoDLWgJvMgs6wIWVpfV0QVpqCJ03FPiCeEYymXH0Q=;
        fh=K+FIrfx62a6JlSAV9GDSTMlK+2Sy7mnK7Pgyr7u2rac=;
        b=s9viWSqG4fHVaie9Vw6pK5cy4Aid/0owQs4l4PBo9wZyWjD0nj14OBLOdk75aAJH8q
         a4gQPQ5C+sOrJuaS5AKWCH0D8tAKIcfY3oiPaN4X3Tc4w+ZOdq3jd1VJ4DNVA1NTsvUv
         hYlhCuIikgCWgSagEFgHds52SW/5BHBZFlYI57YCCQ/t/JzOG91EEP9UN5IGZ7EutA+N
         e6XrFzUWIdU6YcG00PLwyvGUPsayh/zMc1aRUVoECLYfvTL6f6+5Bv/cOYPzvjCp9kHt
         zM01spRV/iHYSAXeP0LJiWJz1T5mOt3oxO/j7+y5n9tIiD+vVhDjWBCeTJBrgxiHzGhQ
         C1kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764160; x=1793368960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KxLoDLWgJvMgs6wIWVpfV0QVpqCJ03FPiCeEYymXH0Q=;
        b=kRSd27EJYJUKVcWPuee5ETNgciKVK5zp3PTQ2bwJHBplRPWfvSHH7/gWDz9hKwSdeo
         1xa9qKXoRp6oMOlTsRUBh4jN2suT1mhMeRtQfK+lIbCXA0Bb2OcShUtu0JBFQSM7XsGw
         StncTsQn/FiAXK0dfzYd7NK8R/7tfKOvo+OoI9q0ZX7lcmqtZ9FJ7L6vX4yX4MIT3fan
         B0bMoSr1XUyZN1riQyYt8eVNd+NqvpIKUIGqGtRn42i7EKZznOoyRcPbVeCRa/Ezxr/T
         13Hx6o5ep6GuCVO8+RJBZwxnRZualgH0jyShKrtQqvd/vgNvIdtzPrnVBZEsRfBPMMRL
         lucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764160; x=1793368960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxLoDLWgJvMgs6wIWVpfV0QVpqCJ03FPiCeEYymXH0Q=;
        b=TDPQ69NnddYwcM0M//jfYYxfdmsrfKJcejXDHpum6r/ylrlIPJKvcmef8sNFMFMiuJ
         kOgC72ZD35fNYoerDSm7BJ+L4S9DJ8d7BLCdsfYTV90DZ50+cS7SaYnfHxs5G181ROM2
         53mN0pZqgXmIiudFLgwv5cQwvu5/7J7Y2ITW68Io8MEpBdG0aR1c93H+eJiPwOaBu0j7
         RX4BDfnUefRPjnoKiu6DS3q9wqJtfBnwAyMNWYZPvWgDD6Zz5fj6jQS3jiXeRA4Xo0OT
         qTpHVM9Vh8AJGyb8W40yPUDNI7SC7Xpiv9b6Wnt4m6SI34w0O5jH8myv+P9G/4CBzJUH
         Tseg==
X-Forwarded-Encrypted: i=1; AKwUvBy/i12bnvukUfEiAVrhfUiUcinx7NSPtQxxHewduBKQlvNyjTm2KRE1LltfQ4zCxwHr1vRAgesUTa3UsyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJegzSanAMoOs9SPnfxb3yrWk6tgjisBy0f0fAYc4KfE4V3hB7c
	I4lSGiS7cghwAC1QS4/KfY4z2Z8bCYnH2fpCynEKf1LKFVdgoYYgQ5zS8D3+EDdA83hUeYK9Pgi
	Or9KZWaF1ARl8k7Nc+I/ql5v+vUBm12w7bQ==
X-Gm-Gg: AYBFou3YkOxV0dHurdenl0y74aS07ufTUD7M6jQJd5HuT6yjXaLYWM2aHVZiunV5Ezq
	ZXeVYep6XIgwFmtuYeV/I1+5KUVBIacEjE6WAqsKrtHomY3TAjASS5Hl5Ek2eVeYNLPccg3LPbA
	j1H8VT9VATcmipFOsHCHMcPeRUkBshZgQo/JE3tVD8f1P7bIYTrEDPeiZ803jhyqL5ezmbqNM0r
	phgLgHGMD2Pg229uZoXIvd42v93iQp8VnU8l7IN6rhjMtbA1BNMy0Z8JzgZu/IHLMA1B+LPO8xu
	XB3aUg9hr51PxsYK+GsDh3dkw2qWpIi0L7iZu+igKAr5AjY5uG1ElVfhfIOwfbPasEswJi/7XHb
	xBTfWHR7ew1vRk5jzfumiktz535LY6C/h0ehpyIodApAMcsRHhwQlZZUOmuz6fds9MUGPqpPDjW
	M3A6ZpP9RwVoVGD4yySb4Vu4pOgZonWqOyoktR2aMXECF+dGo8WvNxnoCUhrgZgPcDhZeliPHIT
	lCgBqf8GHGRwKbM46WgYOn2K6TO46WVZQQl
X-Received: by 2002:a05:693c:83dc:20b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-369d9721136mr5533543eec.1.1792764160430; Fri, 23 Oct 2026
 07:02:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <attokmkItpQqg6Rb@sirena.co.uk>
In-Reply-To: <attokmkItpQqg6Rb@sirena.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Oct 2026 16:02:26 +0200
X-Gm-Features: AclHuK8zRsOU9MnBL8-KjVBrr97HHHuEvLkLhpW6pD8mxLOKF8S5sTMyWGzDLvc
Message-ID: <CANiq72mifaokm9QBeFgY9gSph3p3XPZzG5Gt5Oyb6OSZqOrrRw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-fixes tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 4:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Today's linux-next merge of the rust-fixes tree got a conflict in:
>
>   rust/bindgen_parameters
>
> between commit:
>
>   bc6f2a284c633 ("rust: fwctl: declare cfi_encoding for fwctl_rpc_scope")
>
> from the origin tree and commits:
>
>   01f3e6b4b1c8c ("rust: irq: declare cfi_encoding for irqreturn")
>   39fe6892fd52f ("rust: hrtimer: declare cfi_encoding for hrtimer_restart=
")
>   7d109178cd644 ("rust: dma: declare cfi_encoding for dma_data_direction"=
)
>
> from the rust-fixes tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks!

Cheers,
Miguel
