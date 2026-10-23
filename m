Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792719827;
	b=FkcdHQxiEvu1dc72NJM7ReVxibBraTuMHWgMV0kkoHNwG/vWCUPKKYm0VcC//pwiIacc
	 n3XDR7EqLSi5chwbhnLKrecGgBMfXhUItxeh34m9IKqHhH1mTme0982lDj8hlZbbLWiuk
	 ih2BikKGmGJ/oWBNf3xwCWVBbRcqllN5NnWnAbN5PVseylIEcRYS0RR5MlTgLGg3yXCZb
	 4j//7cCTcNMpMjM5GM+i0te6nNmHDKDFqIAeblsAAR9KbWR8u3QFJxqydYR1Gd4esmtRN
	 rCmGwtrY7HnHmLIrheduI7mTzGG+ssZJ3HOPj74IAvEO5+SKt43YdLdTiKkhPMhMhug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792719827;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nJahHq/dhLGzw4vDnB7WcwfgTcni9/PlIZuKySAi6zI=;
	b=er6XS6FR5E88gK1ymYe6CNqXH79bYm+D5OVy5grOEFrBedHM+gPIBRE2P+vptMQZr2Bf
	 yjf1JhxjHHC04YDUYE+yVjwIM6lRaU0oH2YyT++vRvnik0zKgNNYov8UJ6H6pSN+3tvS6
	 3CPmwgGlDmJHspkroJipv8G4P6ugJpByCzLHHY0OejME8PnIwCVOiwbUK51NxNYDottY/
	 U6p3J9dLfj3HRwKQ9bbeviTsA1Win+tjCfHxjPhLRdsU9gRTsn25IZQ5SQuRv9hlMLjtD
	 nVgKz12SORy/iopNkqgR6y5deAd5qvEWqJu/L9cyN+TK/vaomHp5bMnQfw7w0zaeMcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pd9s3mED;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007A1606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pd9s3mED
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824761F01825
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792719826;
	bh=nJahHq/dhLGzw4vDnB7WcwfgTcni9/PlIZuKySAi6zI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Pd9s3mEDLdz/jVlYMNdeg/clqF9G+mI+gDJq11DtNzJzfudPPA17LatNCvuJnqrk5
	 ndNN7H7MPskbJS6+8OUSkOgXgrQvQmOD5Lbsy1Qr0yIerMb213wFFQXhqn1aF5VuEk
	 /kPs5vc7OHSM6PwD05HwDGjZtppT2Ju53d4YL+nco9UBdfrUYOpkRVqRjo+RXD8XpV
	 jbjocFYzsVrgX5HXEkHQZyE0tNpczOHewmpplW+/Eo3St6mHDBjlwGQCghQ3LbIUko
	 QPTmoxA9yYVxwzd88+ZqfrNX6JUZR01drr+DxYETvNGjpnI5IGo7jfdZ6eS2Ythfcl
	 eX5vcIv1UcOHA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so390176a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:43:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByt3Dug3tGWXJ/NityJIW7KYFLORr4irBoTVyqmtDL2FsiNWL4GghktCs10iRDJJwkn1yQWHaAqiA/He7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZlJZa9yDaCsCa6DXhkGMIUhSIANyGg0KXM0ex/9fK5T0Bhs4t
	0LyenKgs3+K3X5W2148YFp5zBYxPsX+I5nJs39v2NQ41rpLbAK8aXsv3qRBPnZtDP+dV7WOOXgW
	AMUGcjLQ3rCHBaSY7jPYXhib40bw6LyI=
X-Received: by 2002:a17:907:94cc:b0:c26:1649:47a5 with SMTP id
 a640c23a62f3a-c46a940913cmr117168666b.27.1792719825165; Thu, 22 Oct 2026
 18:43:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023004045.98484-1-mike.michalo@gmail.com>
In-Reply-To: <20261023004045.98484-1-mike.michalo@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 23 Oct 2026 10:43:33 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-g779qGeZZ6_fBjwjxMtGmECirU4O1c2aEx91XAjhuLw@mail.gmail.com>
X-Gm-Features: AclHuK_BICgCSSlASk9GhD5kDurEaTe5s48oxtrbShSJzURVLsIRQ4yIHcc594o
Message-ID: <CAKYAXd-g779qGeZZ6_fBjwjxMtGmECirU4O1c2aEx91XAjhuLw@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: select CRYPTO_AES
To: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 9:40=E2=80=AFAM Michail Andreas Michalopoulos
<mike.michalo@gmail.com> wrote:
>
> ksmbd allocates "gcm(aes)" and "ccm(aes)" AEAD transforms for SMB3
> encryption, but SMB_SERVER only selects CRYPTO_GCM and CRYPTO_CCM, not
> an AES cipher. With a configuration in which nothing else enables
> CRYPTO_AES, ksmbd builds but cannot allocate the transforms, and every
> session that uses encryption fails:
>
>   ksmbd: Failed to alloc encrypt aead : -2
>   ksmbd: crypto alloc failed
>
> Select CRYPTO_AES, as the SMB client already does.
>
> Fixes: a848c4f15ab6 ("cifsd: add Kconfig and Makefile")
> Assisted-by: LLM
> Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Applied it to #ksmbd-for-next.
Thanks!
