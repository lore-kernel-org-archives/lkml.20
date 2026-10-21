Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792576183;
	b=e7CKEgUh1xhQZcPvD7RS28LkpbnUqC3jNbiClYdSoanM0Mgdwvojn/Wp0Bqc6xiO3zBB
	 XyWh1q197zOg3hMFo8JZR7W7w4aW+L0ECPNatyQkMLMn5lvD04PmoQwYLfl3Cy/n7b3mg
	 fMqZpp6V5t5iswyQz9lUw0VhZ093+THfUQEJ2TQNNJUeGeZQHfMekW/L+1AnvsfJTkmUe
	 nQrFE9Z+jD/WgUWnKJI6B8bOYTSlxk7VFkjUMMu3TbtNvMg94kcTSUF4D70A81V2Tto8k
	 4BW8MwT/e5A877+0rFgeXG1e+CG74Et/d4L9nHRcDiKXwwAkpA+pAQmjDhRAAMaFAKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=faYNvyvtFmrvw+Wny57TNl3SC6WYxFrVMEzfADf5rF4=;
	b=jlQJZCV6YhQSLCIIshiknEbR7bcnIeGedEDD7rhiia13DLiwRMvsX8+UPECPyxGaU33E
	 xTwK2/P+lKlLw0ZiKDSLsxEutF2sQIP8NWF5+rh+beDD/wOh4o9snzM5J0M0WvswixbyL
	 g7E/YEc+4a0yI7yW7ZDpm0nuS0tNOlgUQRuBkpokuHFJM6hAqYGgre7AboRehVF+vEmO9
	 m7hdmpGTdnaM90VHL7fHkkmTLMW/ALj2VUbQiocvjrSu9sV6FOtIdDm318+BGIytTEPT4
	 rlS3TrG6SYAEnz0pJ2QDBr4JyLdwrOZr6IKL70sDPvKa2S6LhQfYvv1Of6wxNRsEvWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cUiJOXLs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE4E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE4E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cUiJOXLs
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-363cd582f45so40738eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792576182; cv=none;
        d=google.com; s=arc-20260327;
        b=HHS3rvXz4ls5xYONcbBHGBjwPV5cmvZhfIWAy4eQxiONwPZckMlYX5ymOPuBOSGaCf
         mMcwfJ9hSYRODxhBOGV/qjmKKQJlCSfHTe8dLeFfUL9sUtiJzy9PSi0jLcFLeyBcLMAD
         HOr3Pff9e5OHdhUENJftzMzsJBG/ErA86MUrwhInUB6dfYHY/SMX34iBArJYsdwSRMjq
         dmKHMKPdSLmpQ9eJ7sJJx6mex6H32ELM/UCJKOv7cb3hkVyIn2+2nvJE2JZ59On9mNJJ
         Juu5/MMvUmsj6neQPWICR5HqYL3hS3JH+q2Nwwy6YVnr9JgN8MvYudv5QOoIWUCJmAgk
         0Ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=faYNvyvtFmrvw+Wny57TNl3SC6WYxFrVMEzfADf5rF4=;
        fh=rdies3iGLRtJM9YIPgyKnDjzYZh3mt4wPJuHDiVxnjg=;
        b=kfvXw/UjfwHNoje/h+77qNqxz7NmYQhMIXIjhZaIfZb63nJaxMvJBcFfGkRGaXoiFY
         A0UnQRFOJ9zqT1m59uSLLEdcx3pGa+fN3Rs4f2JP+yplFYM+DpjZXIjTIoOwvjft3Kcp
         gxUuAvRj+R4PEAwwIBKlxjbkiv1aoEu0+buXuQAZlSsw7FbDV+qurrfRRb40eYl6ukfB
         GIfU0Xyu5RLbzJ3YphQLF19ro/dF8vdgqMb24IPVE38qkhObF8zVTtzpaLPrn2fXZmLL
         /IiPrH1+9rBr/5qUWIUKFzWSUvAZaXxRmNEYfRBriQfzNNtLt5cTMKcn0JCcp5lz3gEd
         We5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792576182; x=1793180982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faYNvyvtFmrvw+Wny57TNl3SC6WYxFrVMEzfADf5rF4=;
        b=cUiJOXLsbTK0DX4j6NiAMaxFUmyL+0QkNl4hv7SFUK+OC3YrLFf+ua1vE3CNPTp8xN
         9W25GKN+rN2j2/B0ZZDdpdvzx1IZlgnhUAUFfCp5ingm830euxbcV16crZyNCMuGMAZt
         LtxBpQSzhb4XcnFVlo9qkIbozDVxGg2pXvTwlZtgHIxozI9bS0TGiJbF5yXd7tbS6EnL
         Bt4xuGgI+MWillNTszF48L4IqVI1ulFRz9bChqUqtAqUCw08nTySg26pBCjrbQLdAnNg
         6u/1jVJzAhS5yrQ17BDE+TDrkOO9mlUoO1/4I+Lqnjq1fgSSkGkl9xvFlKKi5+zVcgrF
         UHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576182; x=1793180982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faYNvyvtFmrvw+Wny57TNl3SC6WYxFrVMEzfADf5rF4=;
        b=bTQ9lBhVKJ+OZhHwVXvIuqGoNJhurrdz65gKaFkx3s+30JdpFJMi6HscDMYAozcHEB
         ugmuKBoGTex7esD5suHA/cv+hnKlrpngMp8R1j0YZgbuefD+i4fwG95riNOu1AXaS9jl
         9aCWW53bmYjoj3zn2IiR0UBHRrE22gwJw6D7pXVucTxUvWtygBal1DyMlrTn0yB0l0wi
         12hTU/KHwkKr541ERCOeWJXjezWOOC1ZGDcFXDPwfWYVvoB9z4NuenetT2UKVEJuMW2d
         oCHw5XK81CY6fJYQcCkcO6T0Osv3cMs5slauVcen26Bj4cpx6mUnstvCI1KUo1UlNt7N
         VG8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwoTnaRo7iJHKWELPG6e0AZLZUXY2y7V4wDUfN6EdARTGbwHLOTqAN1pPxpqidgHfBmlCY0DEHACs0kEpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgGkmezjPbfvwiovoHEGqKBsWy8m43GkDchgg73p+9DT5Rtiby
	ERcDFjYmYj6nOFQSrGUdLY++ASwEK6pTeKsTbEjIIcdKMxP24AOlEC6TmeRgR01nIkQXM9iLPgB
	mLbvxzcoav0ZiHcLELNHt6hKflEpP194=
X-Gm-Gg: AYBFou1isSgoakpbg2Bfdfirnh8uEA4rDIUY6QYMFF7tk6KAAi7l2eEh5Miqjnk7F3n
	UpYDutAdvN/DiQ/TFhzao0MijhUBLg2ikOxMKyQTiX44gb6k2VHP4fZIo/ZVAdPiD64t4nVvZWf
	VW2oYtMWhGQY97o7+rTbwqADGVM4Ky+uoOwpLXHvYc7oNhBiaB5J2aUhCoyOTyJ2MSuWtkGQ5pt
	6GrqZtfD3/oHE2ouCRWUNX77eVzSzr0hRyBu3LBG9y1gNrATdDEX4nbJP5Erf8GqqLoHtvhlDUZ
	dApAY2+GL9ESU1Iu35Dk7gQZrlS8ZdyLX4AMexpKJVPM1ihZScgAW3iEh1bu68tIp7FnXuvOESo
	2FsVCJsBBkZ72my/u3Nyogq3cuNrpvsScsG6o6e3wjKJoV/7sGIuUb5VA2N1yoWxndRTMQCFT4w
	sVcQ9b/wxWtGet0LAuTCt7Xtp6f/quNarudbEN+umlu95j7ht0uv+Y55apVBWyhQqpy8tQgPfbQ
	P5QFag4kDi7Hb5emR39tCy+jPLoFebjYpS5
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-367473c9a92mr3626616eec.0.1792576182040; Wed, 21 Oct 2026
 02:49:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <2026101318-stingy-crescent-b47e@gregkh> <20261021033257.1359428-1-cmllamas@google.com>
 <CANiq72nHP4qiHE1=y2nhF5en2r9XAR40AnTUNWMK3uPmGuENWw@mail.gmail.com> <atiKAh5e4BjYgHSu@google.com>
In-Reply-To: <atiKAh5e4BjYgHSu@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 11:49:29 +0200
X-Gm-Features: AclHuK8jsDBYq8x6_V8-Veuo0XuKBo2CyxF0S-ifysZ_t9kkS9i4m5o8kgmTKmk
Message-ID: <CANiq72=rN04D4EEL=cR_BvZpeTh3SGEdQ4YpFQLF8+u3rvyzjw@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: add state_hashed and transactions_hashed files
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> The version that open codes it is probably what we will cherry-pick to
> Android's kernel branches for now, but we can definitely look into how
> to best support non-0x prefixes in a better way.

I meant later to clean this up, not here, i.e. no need to delay this of cou=
rse.

Cheers,
Miguel
