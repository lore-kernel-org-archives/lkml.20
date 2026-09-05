Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8034E80D1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788633826; cv=pass; b=DUCPJOqZ4+GnS7z3BoAczE+KQ5w0Bu9up8q3I7fXTvoTkOoxKm8b8vFDUoMbyPnWWOxqlDVeqGu85IjbM/HOR+17LgPUFdMCXH56lC0jw685fBfUFT6t395fEf+MaxbSBfCsIWoyYpHsxcDCpQ54CCLnKa63wNNUot6WDZSkPI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788633826; c=relaxed/simple;
	bh=9Ip1MmxeUGWd0g47wSBTjabQGaYtNljWnxUSLDkQK1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfy97DMbqM20xwpDu/UURbBgBIBVdPXjOEGd7vQRudYm/lym555g3g1CsqA11SdSTaRYAlBA3k1wNYjI/+F7T0d7YR1V16F/q8bpgvJGllZrXRQCyd950qWjyJMODxyAj7fCK2pcx0mpW/3egAqK1pLYztiJZV3rWCAxUFy4WhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DG0uZ7te; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DG0uZ7te"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b1a806664so167891a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 11:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788633821; cv=none;
        d=google.com; s=arc-20260327;
        b=sgp2ujjMTyRMqIBtdRBsuajvqqmZXuFlWyY4TE+w/HQQPWeq5vQ/iQm1tgW8jn9aDI
         8eckEG2DLA+R+3/B+ZlsSDFBrEnRq+67IFQtF5ySbQKwcM7eOHPn6UbyGmBWYBOJuDOn
         hedVegBgIwUqf4CfuOSwgfQleE3AIx+CS+eh2K5Uq4XTFpkzLZn5FcHestPCcvfj0PJV
         8fvFMzLJ+wPYakOCbGfZAqhjgRcBrZEBeX7L+qjMf6rA2TtzjfPzdNWyVOOz0hx9+eoZ
         mnEM/PGyAD6OrJtwkZ+SAT+ZyCln8+1Hq1nUVmrjK+FTHT/MlzbVMdnXmSGv19uCiTYj
         z6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XekwQGEO2G0SV/gVTmMZu7YurR3mOY4ecKYwztJmR8M=;
        fh=sIfdlh2+G+iC04GpHxmySC6fLPoZ+KoV3lY47nJbgcc=;
        b=VX8gbQIIhGX9pFlBrb5S88k2Y71qC612bQAcWfHIyEOXYNlldzZFyoQ6elz/buyZ/o
         96oDg4QIL9E6nGav7Wy1yHYzKTaAIt2ON6lKkbZNhzm7iceRvSrtn384ScUkMwZ+CdIJ
         ATAHGZX7JMeN6ol48fNXjQjdhIl4T1++/Uga9HTesC+XVftgvv8kiavGV5XUajUr6m56
         2p9VMU4N98mvGx2e164O1VpijTr0dfu5q9Edm1ncpQrKMXRVNmbl2K0nbRPrUS68KyRu
         ug9cWgj68jLWEJa2zfkMr8CFv75XtnbBUH9NP6TQz/nO2WfAIa24ARN5qx+wuwRuuU4O
         OGxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788633821; x=1789238621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XekwQGEO2G0SV/gVTmMZu7YurR3mOY4ecKYwztJmR8M=;
        b=DG0uZ7tevCNBnZAHnuosaAZzgsHRRF5mmGFjNHK7mUDp+yWev1GRtAWDzYqg7es5AX
         5hy6wpN/bhoB5/ME/AJNtCE5dNy8a3Q7OTGqs9rlaoUEHXZyb0eRkylYhx+VsBfAfb56
         WNWl/pMm7XbiYeWpMNt2g8Z33H2gP1gIzkaW9rFkLImTkVnub4tWyf0mIvm6uVAji2Od
         XymjB4gFAyuCYdKa0++Hn9d4N8Z3rfNDLfm8B3m4eFaX6l55U2co5srn31ACVM7ldnHO
         ldc3gltHTSL48gvLI5Osw3DsFa2p593Q5UANgnYDHr9OpsQHq5WZzoHJfd8OrOA0GlCs
         sKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788633821; x=1789238621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XekwQGEO2G0SV/gVTmMZu7YurR3mOY4ecKYwztJmR8M=;
        b=ikWsPOQAWMaK/s0fDJCb0swic+LwMnFlPq6FFlrngCZZNxa+1SOsZEXgqgd1kCYfNP
         VqyUjlUbOCK8ZjkphPCt6Yt6nzTZmxGsc66G4GC8fr1T5DL31XPIo7ZYh3yPkYKDGF0I
         fzzP98mqTN/CpXsxNUxVMbcQx6EMnh6POjcOkYM3gVU3NG71khWbfj5+g89DcsiheWpA
         YyTGltzGVD5TB9hiP0DDyKVdZIflUSomD8vg96eowY+Y+J2UN1xanESbi4LJ0KH1Ftoy
         /GXTTm4dAC6RbnOESN1ZCbYe7m/OKeEAMWvS5KuuW0/g0uBpvTQfn3YfAag4ZRasMTaV
         IQ/w==
X-Forwarded-Encrypted: i=1; AKwUvBwEhhMakfQkzDyi8OArX2H/im9bwSjI5Y8b0/mdikGyjwHzsCvkKUda49HyfBMjoUuAUBi5frn4Xme00ss=@vger.kernel.org
X-Gm-Message-State: AFuF++lG/+Aq4SUTscwmUWYs4Sgih2kKWNRrd72ih179sh2aGjwZ1s1e
	ikesUUv+y4SDytKkOlfdUQXDqGqJqIv0ffjEzK1JbUT9iL4/t5GMDnYj0H2vtZD4Rx8P8JKA7jf
	C/8lL3PewzuuL7u+HvmH4GZ7CConwglE=
X-Gm-Gg: AYBFou3RuzI5MXf5t8OZASOwiNGUCo6+exUsiG57xdnBTbwu9YsBDPelzN2LjkxoPAv
	a2smcwRTRl/U5FjKGAvVjt0yNWxdEIu5YaxYCRgrx1gYFMuUSlokZbgKEHDnP10AqO2JQCxCR/A
	PqpKZXoxVS9DmynCQjL5ecKaAykoK2seLSBN02TApPukbKb7ZdadiKHJc2PGylhcE+BTwXeYy4E
	SAycw84fovhEr2AWv5HQjG9FcKqDkO2XcMxcbgSo57FrZ6uSj0DFhxTkAGP3DDYpLAZOxv3A92I
	zK6V7IfM3rRRDtXqd+n6OoQ7OFjugwJTTsurLYywLjVg+3GXfa73AcERYfmKmUfkxv9D7c/z1HD
	IifC6aVunAhSJ8y5ILywlwoK1dzw0PphKdm7h8Yl9qrpnwIQSqXs1iGgt8Ugn
X-Received: by 2002:a17:90b:4b41:b0:398:bad2:c0f with SMTP id
 98e67ed59e1d1-39b3d8310d0mr6299253a91.5.1788633820895; Sat, 05 Sep 2026
 11:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-rust_serdev_fix-v3-1-b86056c3f7a4@posteo.de>
In-Reply-To: <20260905-rust_serdev_fix-v3-1-b86056c3f7a4@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 20:43:28 +0200
X-Gm-Features: AcwNN1VE7R5Qpqg2xVKghrSvMCGolroPW6Kcwa9i6GRHIirw3YVUbccVS64BWkI
Message-ID: <CANiq72kWczjEZY1q9rF=zpMAqQ_yUhdb-n6FgXXuF7==zgOT5Q@mail.gmail.com>
Subject: Re: [PATCH v3] rust: serdev: Mitigate race conditions
To: Markus Probst <markus.probst@posteo.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 8:33=E2=80=AFPM Markus Probst <markus.probst@posteo.=
de> wrote:
>
> +        /* receive_buf: if T::HAS_RECEIVE {
>              Some(Self::receive_buf_callback)
>          } else {
>              None
> +        }, */

> +        // Bound,

> +    /*fn receive<'bound>(
>          sdev: &'bound serdev::Device<Bound>,
>          _this: Pin<&Self>,
>          data: &[u8],
>      ) -> usize {
>          sdev.write(data).unwrap_or_default() as usize
> -    }
> +    }*/

Please don't comment code out -- it is fine to just remove it even if
it is a temporary measure. The code will still be there in Git.

Thanks!

Cheers,
Miguel
