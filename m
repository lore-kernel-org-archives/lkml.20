Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793178282;
	b=GIioZip2LYJb4hvHmRlmZMSROhGi54QOKVoriOJ1EQxRhRvYEsexMfAxZJR5KoQbyHA9
	 0CeBuwPs3PvSeNPctwjYcQtrR34EUcMp6t4nAmD/O+qtobp5VD58vpGEjZ+aN2unqr/qq
	 4QJPBFeEWozg+4uFn/qm+7m6yTSSYW5fZ9SrtFWewOWO+i+2ClVKYmqIidZwLtTb6N6z+
	 DpBwF9Bo3d6ShNDYEwVIQ6rRfKcQIJ+itM/tf0wrGqEBpdjFen1C4GcpnA4Ls7aBJvsAX
	 UZ4SF4MH/MoNuyBHB16Ro0tMrXhmyAHyOaT9+vxr/emHTjh+E6sQv6PUbAp5G5Vs1wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7baAZch0AV2ZQpsltJrgKMT5HFebbDsF2TyQttQo+4Q=;
	b=ZIhJpgFPqSQYzjVSDYpeY+hqS6Nrng7ZXzJ6Syrp/M5PWPyFsLk+C0UGNqZwSknEZx0c
	 Df0T5hTIelFQ8O/00g3WYGUCxnAYaKPHraVuS6PgzvjRGS2iE/I/qlnU846cJ9pluHHYI
	 JXGWvN7ubWW2Vx9E/6+2yZUOmdJ3w/l/yVf9iCt5k7nLCVZUQywAFNRDfU1nbomp3DTJm
	 lfqjRQdO7fxWQdmJAcvwjdGbRVav2OHcwyReqfDiRpaf6mXIdgTGJLd0Mx0p21pTpX8EX
	 A830qimoa1e9qMci2hAn+muyXb0RDculE30FfOnOK/1K5QAAzHifJVyE7lQmcHW/FGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PeHJH9Hz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CCC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1CCC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PeHJH9Hz
Received: by mail-yx2-f10.google.com with SMTP id 956f58d0204a3-67a5448ee75so109555d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793178281; cv=none;
        d=google.com; s=arc-20260327;
        b=ISPquQvwzrIFSaPEVtg99uxCeUkWIaOR87vtuezxchaOeAT92eMc4De5XQsSk6jydO
         AjESp5whFi6QoT/2bmUfNVTndOaGwMOEOJvJx4UuFYzy1Har9tCIfkpg/nVNxYItJkp1
         RS5NgNGd57psuqmOglUXqKbskCcrvorOa466eBrzKvOJjhzR7SQCovByXx0vhgfZipUG
         mw//PvTfBwbu4wDxQqMUcwqxXg9LYCEk7x78gH/ZGvY5BOJwbcq9XuM4NQfuWnIKL7Z9
         7yJHA3vvIsTIoZEMKfUykggym9ic+Ytie1hhm8ZTwqGJ8RWma1xKMXi4NWzZjrt25t6Y
         Z+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7baAZch0AV2ZQpsltJrgKMT5HFebbDsF2TyQttQo+4Q=;
        fh=0kF7rFS1/CV/Hyfj4zaL6JALAzn26VcSb005VreqNJk=;
        b=NUqhGLVO4CG8CmKaHbDhYHWSt32deZY7IiDVHuiaOTSlUwB9jS7UPnDqXOuErD6I6t
         QUNXmiWzzyFuhiQ6mU61pgg0b9XqQymt5AzQcBltH9SBO+5h6QzrBesKu039kjAwP2QH
         SztqiPwEssBX/J96HAlRRH21lDtgEDkv6QxxUaP3nq2uAcZmqNETLGF6ou9XOZtOKU9X
         3M3ymSOYTn2ifOEVkbZClK8cmafU6wba/oCmcThjvG/rmj7LzlUW3dq29xp8RoD5w4M3
         4bbiOyy4z6ulEK4LwHFN2+lsSK2lq0AtYrkILpT6GnDSkHKa6Il5kIRyfU+5EezRrqT4
         kBmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178281; x=1793783081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7baAZch0AV2ZQpsltJrgKMT5HFebbDsF2TyQttQo+4Q=;
        b=PeHJH9HzitfqkHwUIHziH4oDgPV1ijSyhYS2wKuypkLLe+lOu9OQCg4T2KXrMxSJZj
         ykW+O7RylgBeVYNscJ5iqZJ48jlNNNhh5Rbuz9fAsvvS0TIV0EW0QjcgjuNyhmWVvJw4
         FjPxtpF0pBkjnucpcDHDuSPGnO+Hy27FrzDtYFdzJWI28spm2h6kWo9IHKSe3LsuX/uz
         tuRLgGxD1DQX32ulW41HqIyNhcxn4mGnXUXwccr2adZ0vUr5t1zF1mVyAX4A3Ak5NcZ8
         h8K8FiQqeJ7ujG2qQANX6pRLM2r8U8qFiPxlpeHb7eK0xlk0lqtC+O7j/RAjDQWTKkar
         qfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178281; x=1793783081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7baAZch0AV2ZQpsltJrgKMT5HFebbDsF2TyQttQo+4Q=;
        b=2xgUC9uXJEP5xrko1z3MWZd37Ynp5DHDMPT40nKpjPS04uGWfHPODQnCAq0cg0hu1K
         c1pOZ/hNYJu2JYSTj44DsoF8hA7mMG0ZTurK8BTZebmxsjoYhplICB4BmrLR/vx9pB7v
         hYMiq9L3mg5d7IqYvwGDSs0iZrWMyhjkO8NaY499A5kMXgzKHxnVWI39VGopPIRWHyZJ
         qMyNibRuMPJojld+UGCfcW/TkCceKH0k0wARrJl00Sy2ZBbUAQa+nCBwfsVEkADzxKgd
         tY/5HhDqwNpqsHzwr5V+K69ovtbKb7w6YTJnKF/YMBYnLNfzqsE4TPZuNEG6dcgSlpll
         j2mA==
X-Forwarded-Encrypted: i=1; AKwUvBwcbYxKbFGn3Y/BHakWcdx/+u4S+5xYCL0sYJdTG6fy40R26E4IjljIlwS5cBS1W2k3piCUSzlYSDYIn4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLytVnaNn/mdBKvmoCaTcjZR6Q6IFl979vuJkPHkh+aWbXxUbOk
	8arBfd4J7kHzPuN5SKG+xDy5u7h2Oof1ldjD8pQldIZuZSPkON1noHxQeHKDL37Jwvw5jENonfq
	wRE7bKZfdHt6jSxOBWXbvFpIH7pT4Ojc=
X-Gm-Gg: AYBFou3ZM7eHl+ZcCOm3Zr9w2OxpM/Q69JHIiMmsCxuyh1MVmiF44UT1Y0/tzkfcGcK
	1czSjxmvXJV4/gCtC1IBqgHpZvBlRnbp/K/MMKCVcsYYfsJnrw1CTMXyAVqPCSv6D5Pd/QJqIJC
	HyTX2ydfC7dufYMS7GxaBEjZj5SMgd3+1PVACqTHBaCbAZnWe1wskJjd+tL7rC2OyuQzGASrDYV
	bFlTIXjOR0sw+bf2VNxhmm9EPcpMd6wvYsl/1bcB1rUeRCDtp8rtQ+eLQPLwyshCI5l1y5VbGld
	aP0ltJ+J+x1igNA1VtndtgP0rLKrpo6iXXIaK0z4uzC2Z3Om6DayzJaEg2uX3xzJRV17jTkFRHk
	X8fZenMigp228kjvEVG5sXXTOryEwzxVmkQOJddywU4F90H/KDsk+KlPqLQ==
X-Received: by 2002:a05:690e:1699:b0:679:bd09:f46 with SMTP id
 956f58d0204a3-67a813f79cbmr815916d50.6.1793178280698; Wed, 28 Oct 2026
 02:04:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018081203.2431035-1-l1za0.sec@gmail.com> <20261018183707.23dba84df0a235e36de1620d@linux-foundation.org>
In-Reply-To: <20261018183707.23dba84df0a235e36de1620d@linux-foundation.org>
From: Li Zao <l1za0.sec@gmail.com>
Date: Wed, 28 Oct 2026 17:04:23 +0800
X-Gm-Features: AclHuK92W6eCjxLVFBVIgwy3cZtZtdZpLsiCnKY2XBI3u7Tc-5IEfkiWO_P6Glk
Message-ID: <CAAwbnpdgKj5hEky8ZRcPOzJurj6W_rf4X4nEkMsfCU2CfXJj0g@mail.gmail.com>
Subject: Re: [BUG] KASAN: slab-out-of-bounds Read in copy_folio_from_iter_atomic
To: Andrew Morton <akpm@linux-foundation.org>
Cc: viro@zeniv.linux.org.uk, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, Tal Zussman <tz2294@columbia.edu>, Daehyeon Ko <4ncienth@gmail.com>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 9:37=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:

> Thanks.  Boy I burned a lot of tokens on this.
>
> I was able to reproduce this.  I found that Daehyeon's "iov_iter:
> validate extracted segment for bvec alignment" makes the KASAN warnings
> go away.  https://lore.kernel.org/20261015061907.2713943-1-4ncienth@gmail=
.com
>
> Daehyeon's patch is presently in mm.git's mm-unstable branch, with
> cc:stable, targeted for upstreaming during the second week of the merge
> window.
>
> Daehyeon's patch prevents this reproducer from triggering the bug by
> rejecting the misaligned direct-I/O request before extraction advances
> the iterator.  Without that check, extraction skips the initial empty
> iovec and the following 10-byte segment, then encounters an alignment
> error.  The bio is discarded, but the iterator remains advanced.  iomap
> subsequently restores its byte count without restoring its position,
> leaving 1025 bytes recorded when only 1015 remain.  Buffered-I/O
> fallback then walks beyond the imported iovec array.  So Daehyeon's
> patch avoids the bad path, but doesn't address the underlying failure
> to restore the iterator when rejecting a bio.


Hi,

Thanks for investigating the issue and preparing a patch.

I was wondering whether a CVE ID would be assigned to this vulnerability.
The CVE ID is important for our research, and we'd appreciate any update.

Best regards,
Haocheng Yu
