Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664467;
	b=JcvHm+cmhwjyiEWgZ9sCGbap4zqFIZVTeEtjx692WMKYH3atWjbG0kfZZfb/57lQHqkN
	 Kp3ijl+DF0FenL8xdaf4bKVwMnBNdBA69nDnT7FbplfBm/LTwBEqHzLmPPBHmAiL0RICE
	 8l1e0X3tZiDlrvix/+FnUNlGYzjtO8b1ZCU5KkkA5ePimUXW9IWCHu9/fUbkD7UNboJDx
	 6xeqMY1SfLPiTjj+NGX3vXS6MYWpbMbRN1Cc3nE0ZuCv1C+JJpnH8z2XaKanlPpsexozV
	 d8k058261Y1o7EquYT5wuQzd+ls1wui3FC/UsocCEOVvYd+2eKUuntb3IzVzOLMLR1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=TvykTUk4R7T/uqrKjXDjIuLrA+PfKRZ6+JNOrXkof4M=;
	b=NNDfZv7eSOjDbhAv3orFJ/j/X65HrTNqnOfrrj/CuN0x3wqEs005vwPNFqKfWzqR3ipp
	 e/uLxq6WDX9VMeVH6yXL2mzPY77aqnhfv4s1QcSTCA4f9+z+MWqR/Hj32ON1bgpEhbc+a
	 oCel4doycw5MGDQUXfS+x5yl8ijtW7v23I50ZKEcQvKtCBUKbbCAEiM4s5Krsx/SIpHq6
	 LEwAgFzmY2PRDEqM6G3wfFFBQ5grRn2/wayt/kTNu9wk+sXO4Ggul4E2Bj86yIm+5Envs
	 MuKL5pPUhhrrzJ05G7Mv1G803NsqZu7fojVrjeu3J9a8H2wDfFmWH7tDr/XTIr2dmPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxHFrEFl;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C6606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A8C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxHFrEFl
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1adbf62dd31so3857580c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664467; x=1794269267; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TvykTUk4R7T/uqrKjXDjIuLrA+PfKRZ6+JNOrXkof4M=;
        b=VxHFrEFlEfJUyOT2QkXnqh3iBZKJ2SPDhFPadClLKn9a6UJhK5ZieO69lEY56iCdlN
         VFM30bA6H+i1ZYpssXbYPut8JwB2YhrFcBxezN4tXBJgUoJTLyKO5XsICgeQ2CGgQNlq
         Q0VkUSWsWY6HNx+KAkbiOqGhksA4EK5ZjJxQhYm8H9QAESH3SCqCG0vLj+gE+a8Y/jT2
         5rGx9q/Ii00jbRGt2CeQeuMN0r4WGZZpAiQj7CnVFswtXWgD148CJYMrNMgiVIRKoMl5
         fhsgwNsBuvUqPxxlpibUNnhMzvsuoefwX5z0YusL4qnY3Z8iC/Isxs4Gi1scxE+bQ1i4
         k+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664467; x=1794269267;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvykTUk4R7T/uqrKjXDjIuLrA+PfKRZ6+JNOrXkof4M=;
        b=s3zqBydvSubkJuZU6KX1dkEH1OUkAQh2smwYzSbwgcTbmXeSTiSKvm17+DP6ZTS4uY
         EPhiS6yHaBm4iE4q4dtkY7fngEN1CVCo9Ob5IDErYFlCi7oChavro+y9fJRF9js2Cw6q
         Xi2Dzl5MkLJruQenSgvUxF7ZNxZ4YYAkoJCyvuk61Juexz4BP+VN7qH4kIKPE2B2XDtW
         pY+0qOruzZDPRRXdLukiw8s5pCkczdthYstp0XXdK22z7mEfXFuWei776VO73ICwWiRm
         fuSOdtrnAF7X4blUfikcIE/gV+XCX82kufof2eyWzjfVIeubjqMw6/lyVMSh6nWO4vU3
         Epag==
X-Forwarded-Encrypted: i=1; AKwUvByIxs811rAF66gA0adUujfzDDE0fv64E4TEunObmkN4YN2oECdO1mC0LOfh/MNwNQ/fZP8kOgBtbEnJ4sI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAHKgYmCx6B1NRw98rAlTXWrT5ennCBMi8kdfdLSSvjpxnNDK6
	5ixobqBsNFanmlOiQ80WUISgTlj53Vo3f6oHCiEg1YPXWOi+VX5BkytgS0JlCCT3rjThnA==
X-Gm-Gg: AYBFou32xmbxI1fkuZv7Ks9+FmJsdrBwA8SctH/wVBobt9XfU48YM2tFDoW3n7cW0xC
	tbVtexQ8SZJCe1jj+BJY4nMVLj+ijGrXNqrZ4kFscmVXfcMT5ZjX0LC5/HePwJnvSYXAqXO42OO
	E9WH3fWG+Hfgx0XaYMj0C9cowRs1WgEtabwCJlvSV4XasZXyrNVbd1Z/AR7tyC+ZWCeZOhEIyNt
	5EuIXjWTvE1sBu3mdDOTJFT20CeC5fVV9NYsFddolWRFzRFADC5Z0EaXv8h96lmoQ5PY6KGdWG+
	DQ0U40S1SnOZqflpJnKvIvruTub4gAmqM0fl6y3mksGY22GRl7bk86UUzJX+CCjinOtcEB2//Pw
	md+GFZuPJdtZovpetS3FtpyR/a70kzbAxm21K2VyoB9VszUNfkKxfVgprwkyZ/q5mwhhmDwgAnB
	XbraO1kxd9/YqB/xKAW59WHu0ltgtNfX6JWXALi5IdH4B+Mix5EPixFjRR4NfBcfHHh8jWUEC97
	p+vCBiS4eAKppbzzmjgBZ+g/oaDTCwgv2kovM+nS7aIy0AGm6vCN53uusvpcg9pnlnmMjWjQOgo
	/mJdZFvEvvHH0WEZJTOYPB8piG0yLiVmdTM=
X-Received: by 2002:a05:7022:92b:b0:19a:8e3e:530e with SMTP id a92af1059eb24-1ac5bda7dd8mr22231405c88.8.1793664466566;
        Mon, 02 Nov 2026 16:07:46 -0800 (PST)
Received: from smtpclient.apple ([5.34.220.141])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm63335030c88.10.2026.11.02.16.07.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 16:07:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] staging: fbtft: fix space prohibited before that close
 parenthesis
From: Eric Lee <eric.lee0305@gmail.com>
In-Reply-To: <CAHp75VcvKkOmFTtJDHuKCNVUMXgjZLiNqmGcHFKT__dtTt_QJg@mail.gmail.com>
Date: Tue, 3 Nov 2026 08:07:31 +0800
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D7B3C1FA-32F4-4771-BC2D-F97D07CBFFE5@gmail.com>
References: <20261031042315.1122699-1-eric.lee0305@gmail.com>
 <CAHp75VcvKkOmFTtJDHuKCNVUMXgjZLiNqmGcHFKT__dtTt_QJg@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

On Nov 3, 2026, at 04:44, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
>=20
> It's not a fix, it does not fix anything.
> Also study the mailing list archive (lore.kernel.org) to see what
> happened to the similar patches in the past.

Thanks for your feedback. I did check the mailing list archive for the =
same
Checkpatch error in staging/fbtft.

They either removed the extra space between =E2=80=98,=E2=80=99 and =
=E2=80=98)=E2=80=99 that caused another
checkpatch error =E2=80=9Cspace required after that =E2=80=98,=E2=80=99=E2=
=80=9D,
or removed both =E2=80=98,=E2=80=99 and extra space before =E2=80=98)=E2=80=
=99 that caused build error.

The key difference in my change here is to make that argument =
=E2=80=9Cmodifier=E2=80=9D as
variable argument, not a positional argument anymore. After that, I =
could
safely remove both =E2=80=98,=E2=80=99 and extra space before  =E2=80=98)=E2=
=80=99, without further checkpatch
error.

It passed my build and verificaton based on the file "fbtft-bus.i=E2=80=9D=
.

It is fine for me if you think that it is not worth removing that =
checkpatch error.

--
Best Regard,
Eric LI=
