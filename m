Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794277261;
	b=x7+AglTTTcXpkB0yLPOI3M3w+C6JCKLJWg3QZr2M6PrwNaTrr1uBrkHqiGBVwakOhupa
	 zmRta2qz7oOFmbOkmhxd7yB26F3cIsV8KyIaf1BMPPN4m+3X00T6jBzvUJC3qSLtbBWwy
	 6KyX10zNL9UK8xef8hLNaerZ/Xs39B2NB5q0UOOjlHc2E8rgtq0MrshJvvK1F70/osQa2
	 Yc8KXJUKJPUWa4doUBaLz8OzihSGBDt2tBQGjFJEjfm90p6aBf27AtDJxGLKeoH2leqHU
	 Wn+NKon2uxDqjq1n/UDM4jUCRjtHui3a3IBRxOmSQuzRBvRjUDDty8g4CQziw3LUaOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=i2TUUoLgA3e8WVIbMjVbQ79gxzJuaS9VusLU6Lxc8WM=;
	b=PlknRaWXcb7UjbvMFIZp8TKB3rz6Cw9eh65JiS1d5d/F0hrTG3IaUIw/XgyIpNak9zMQ
	 HseMNcCGsyonElV5dEoigihbqzAtMXtMKGvVHTRNOLXnmMiylrRis6i3EkSPcT8JQ24u9
	 8YoyOTu8zvYEs4GkWejlbO7I+qBZH5HFzF3G3ZegbXc5YiubmCWHnzwk4TjVany6yIjtr
	 mhlS2nBEIvpWDNvQ25+1eQLVFFB37yLfubqXlqDGfNMlolXisiCanojHbcvWQKMzc1Zti
	 FceOXTdHx2+u6mMRyDGb+p+vv7nJBNqnjGWrETHH7Z5W0zg2qCFRgbZmUyorR/zFhdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efz3coOY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524D9606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 524D9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efz3coOY
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so2440611a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794277260; cv=none;
        d=google.com; s=arc-20260327;
        b=I0Xr/Ygu+PV10kUNHAeGD3OHLT5Iyh3QRy95AuJ+fv24fFSTk3TDZGeISh1oNvyz7n
         g+AQJvGFqQRAGnFI/nE2Ruyv1bg3d07YJmDwXvqB+gw5yig4ZUfA3g6o6+rQ6vwHE9F4
         nuzLRfS7+eNB+++88FcxiIleHmJ0P6nybF3EsC4Ox54iQ+n3hScSx/Ybr12Q967HmAUc
         APqHBWe44l+1KAEoBI3MfeMWgfOvXoDmfwt69Ohbg2mNEoWLm4GrD7iniprv3K+oL0lx
         sFY2UJ+rbZC45GQCuASEC/gcBBxaFSqUzaRAiH8o/zCLMPqQnW5H1qQqD0oYF/lFxJ/W
         NIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i2TUUoLgA3e8WVIbMjVbQ79gxzJuaS9VusLU6Lxc8WM=;
        fh=nIfALGvt+Y5RWqnnj3vHYnEtjbERuF8xE5q6dDGYJvU=;
        b=A4TFXkzRrPBWSLvKPHrqR6Q2Rvd6kpXkBgVBTUNW5YzBM9OKmmUMijtMlJ2v9UqlFJ
         dmU6vzumReBmnv2J5Nh00zd02Ywi3ddjfuh2gBpS/hfyhyLZ1tXPcwHQWLh9xgUDLtxV
         A44gIt4aqzWPhKdqkYPUFeA8Z6MJ8/NOGW0tqX7msWoyydMjMzSTHPRUqkKjMXp/eIcT
         FrMJ69JQRfI+1v1mgtxoA/irhcJVYOftLKUt4Afq7g8yoIIikTJ+/vNig2nUtmGXV+2m
         T1JwSwU3Rsh2tzVwBVAHnXawFNqnljst58c46ZkQdwFpN0FDP4rRBhMfzuRdvIj40nip
         MosQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277260; x=1794882060; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2TUUoLgA3e8WVIbMjVbQ79gxzJuaS9VusLU6Lxc8WM=;
        b=efz3coOYSr2KjjBCeYtKdmztxPfUZXzmrZuhKN8iiDgBLAigWmRiYCMi8U0QbFK1G0
         cgzKVwIYUXlzJNoBP9wkRFTO/NMb5iqX8ff0GwpBcU9XLNZHjPPqPJ9UtZAzS7VRSNU1
         n5ltnJfdV+WaC+/GQjIHySvCuQ28At27/U10uV6UMYYNX6IaLFonSsffccyXk2BH4HXy
         vfcyxnTGPNSOB6v0f9db9LOG2hWN5Z8JWccLFuV4wctFy6yMgxwXjeuqczcPsJw3Ir5B
         Z1rb50JDKHOoz9Knj2obWH3I7N4IiObhZqVCf658cSxTZUX6KIZi1a74c0FLbTO/Rpqc
         ak5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277260; x=1794882060;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i2TUUoLgA3e8WVIbMjVbQ79gxzJuaS9VusLU6Lxc8WM=;
        b=ft3z6+OMjL5gj6r2LN2t1Xw9duq4qFtdN93uv8GlBrsQKOkh3lpWRQ/IqrvHyguDhl
         SY27O0ASuYI3gB+FR+WniYE5gSj45ordL00tjWz2Nu5VJMzhYeXATo3bpbJK2h91ivJv
         LXwn6rMffMKhIsHfCFUbWt6K684tmBDKnoP6z90duSCy7EGJP/PeAgy/7oMWlgq0T1WI
         4d2Rwk3ZFNYeODk7fiQqjqbLyt43qENNaawMv4x4V7Kn/sepYvGffEqSpnqz4fo076PB
         22kZPsg0zXayE3c50hmUT+QKUcTdzI645gg2gfRKR/zXJgXviJ8KIhJMFLVWd2jBcok2
         RKcQ==
X-Forwarded-Encrypted: i=1; AL+hErG7lece0/+klXLYthSrYELs7x+UWSTRyfDvylTWuAcTMZNYNK7LSAJIOm01jbFos6XxQiiVJHdO2PDCb6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BYZh8CKIhRbCqiF2Tgooq3R/9XxEQBxYHF8gcsUZVD5lsO8Gw
	CuljnB4F8RZVI/69cZDpHhB57VLIy9mVw9+81rmQzrBWmVhJY36KbWQ6NnpmmRCqvu1r60lJeac
	w+PL6J5nsG1k40dtJfb3fPZDZIKM0tx4=
X-Gm-Gg: AYBFou3d6iL5gien4g16BsJH9cbQH2Q3Zd9aBjWJJuYEkmSJTJijeHIXfI1Vv3CNWpx
	/Uemug+dC2MJWQy1B5A2lTV8q/K3qQGAx0Vu0TJFJENWIIMh9M120b3OWs4y9X13bOI2B3QkZ10
	PxFv5nb0zvKluhQUr8lxaFJWWzqdG1k8ppWGKe9dL7RagWW8yzxMPjhiDxSLfr5DJBx9UIDI4cl
	f2gvi1b0oMz8XzFhN+ypsnoxRkxU4ZTJ2lpglEYQrD3qwvbZnKCRy76TxraK2K/dkK+DV+ziA8G
	iiQe5WqiY/msO/fjxQC7eLdIXuQn2I2YLO8z+NZVi/3xPA1m+YqQX6mSVKecRHwTx3Y9mJhiZMR
	FliZdgfh2TWuesYOmPE9Dnclmcg0LUmeFzuPWtQw=
X-Received: by 2002:aa7:d492:0:b0:6b4:8d5c:f8b with SMTP id
 4fb4d7f45d1cf-6b75721866amr598705a12.15.1794277259463; Mon, 09 Nov 2026
 18:20:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110021622.122490-1-technoboy85@gmail.com>
In-Reply-To: <20261110021622.122490-1-technoboy85@gmail.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Tue, 10 Nov 2026 03:20:23 +0100
X-Gm-Features: AclHuK8bXRdvgJU8KghZLOhvBMXkdeeRv7iNqoGqP4IMZRNV45bXoFiMpjug-xE
Message-ID: <CAFnufp3CwHWxMj8pPPsgEMtCtjUxbwn1VbFd2OijqB8+NA0Ccw@mail.gmail.com>
Subject: Re: [PATCH v7] kunit: memcpy: Add benchmark
To: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

+Cc Kees and linux-hardening, as per get_maintainer.pl
