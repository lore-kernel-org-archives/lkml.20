Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499552;
	b=rEQq/+bJ2lU92/HIyFOoQQ1Qx5zP7lIFcjQMimwUzHPN9O+oEqJnPXlV0ql31MtLnDxg
	 Ag1Ztabo+gCazAYq3cF56fxIEIRKAIk8LGm/AyahkTABUiTtwAa1zEUzf1DMnacv2oTPt
	 bCKttkL0cGVgHcPKFpdemn6O0oZtx4rYBbwkZzRP4bZ+sV6wzAKTmlbN8GxczxzNhkWTK
	 BoF/mhf0+BaF3W7Znr4UsnsVw+22HLbFprIn9bLIQFHxy6q73y5p45cUnKWaHNCWTd4Y0
	 mU8oQkUA5nkQScRcT1zYjVJjjEH7hYqhhT+Sn0lVzdicEeLCjHA/LnYUC8bgLwnF4uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Ug3WNdeE3aymYiPguxRmykMUfkTG0zfl1DkHjSXneM=;
	b=QroWl+yWlc+e6inLAUeImdA4t+msQ6d7pzdyMGeltNYO10+e7cy0Tpd3Ro1hHHHYqarJ
	 pKonwxjjY9tbvHBWX1JbPX27RVXrE8l3DkTvU7xepxDYWDtSIIHsrxvyCiT+LbRdOqyP8
	 yNC3fFOHo6TiL3ZWsWPgJRC+8ddLmSuE7gqA+/wOHioNpbA8SkDbDRNN6MwMINwCqrFnX
	 lGH7Q/fv5RPlDFadOCw9jxtzECYkZOmS59+qBryEjw72S3kcMhmx271mCqWfRUbv9h9dj
	 YcQcwErkaJdXkFHs7smToe4LcXzlzBHoOejoVqszUYcrUJj6w3O5HAOy8keoZ18kxEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahDUl6ZB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F231606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F231606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahDUl6ZB
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b335eeb340so193817b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499551; cv=none;
        d=google.com; s=arc-20260327;
        b=Thn/VgGI1QD131IDCxovO2fqhKOArm2dVVIw51l9Tkc274FdfY7Nqypqdwl7+++wF5
         hjXAysxFwfrR68Yr2EgYIp6MH9TwLzl6augI7qVgp8SrwD72WLZwwNtEOoBF7+VfSTLS
         xVkIAVTZQJolil2TG+lzLT8QXN6s0lVvyqo4ChgiDlxnmWsbxdEakMJWx53FwP1JKZH4
         vJuDoV27RZQ2hi4AqTS/OA3LWrAgpNiRmybsvTgxDyrR1xbtQZwY0sRYnJOBYYp9cWb6
         O/CTcjCqYRzXKzr99mNbcw+kpPy4GftYEceL6oAV7nSDmOjVHD9XZzYo0roYHZ0m6tqj
         lfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Ug3WNdeE3aymYiPguxRmykMUfkTG0zfl1DkHjSXneM=;
        fh=0HS4kwDjY3qVA+xNznFGTrMqXvY+bMjvmXv+hgIBEFM=;
        b=oeUmlu4z/ilJ3wzFDqskzRownSnkGDRaeIc3jApL2Ib47Pi5tCyQRAWspkiMr7vN6n
         oUjtkqzJL9asuZ4kkmVDQj864cAZtBoy6hXgODWKJDz1NxtgM1cB8XxRUHEKKU8DRxKR
         oI/pWcDry8N9t6jWs/O9pIDvjZjz7zw6c6zGK8ijPlNrtva6ToYfRlxocK/ovX4fENWl
         evSBhkVJLPUnpJEg2ZbdmN7tuAK7oGPt9bBoTpA6sBxOhVohUpBOsDX4Qz9rxKq59L4n
         R4PBodth1nzF6sAyuQB67+KFpvIECkPcbJShtdCRVmBLAaf6+FqGkPIK6VrnhQ013RMu
         i8TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499551; x=1795104351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ug3WNdeE3aymYiPguxRmykMUfkTG0zfl1DkHjSXneM=;
        b=ahDUl6ZB8OrLPkbC4oIHTKqBVXniNTSYSVUFgEzEq9FFOZaSpuPYemYWLTrKQq9WDb
         84RZWp/04cdAi4UjSoeWvx6/wTM18xSHUD1elqsd90GBeXtfLXI0iYTbI8Z8ci7i01D1
         aMWC0v/8rRiGU0ORFuxfSBqKA4iJ2a+tpD7z+eMK7hOMMNgOE3UZxbVnHYXghPslSJ4m
         5/wYRmRDjrn6SlVGCeJQBwDp8A8uuyHkRJzoPUOVaqzsl2/K2Kh9vLM7dvcmIGgQq3D9
         7vUZH7PWG8JrdGZxAWLpzEmxnjn2dEQPGLeDOgcen9FXDNQtbSubMtimuOlwzidnXwGG
         4pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499551; x=1795104351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ug3WNdeE3aymYiPguxRmykMUfkTG0zfl1DkHjSXneM=;
        b=lcfZECAHGzzL8ppMk0kd8IPQYgDG6gyMD8iDXoqBFrobtKZZS0RCEuaAI5k4ItdEyw
         3JcIFmDcJFKeXFEgJPoIruNmabVZvuOAzHgVm6CrOqt395jo93qtc6IxMV1dAQkX+Ys4
         w/8hgCGZBnL4T2PTMFLkeaMm0l96Zwr2sxMl0+nXaMY+z2XcLTGV1ntjXVzFswNbxDyz
         XUqUVNMcavJP6BZFqxmyWCudrR7imSv3MGL3+CRkAx5ktVOdGxrvbO3K2tECDb8aeR5+
         Yk/aI8gHoXXhT2sR0KKpqK6M3K+WxkbnvYZT5bW6YFzq2rHgIxaA7qEt0STxvfc2ATpM
         C1Eg==
X-Forwarded-Encrypted: i=1; AL+hErH8qsIb1pvM6jIBe0n+w0zAr19yOrrsP+gg1TyKETKRk1KopXjo32p1zKV/rq6dn7AUKUADMkGVI/L+CT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z985KX0QH3v9tolmSp+k40FxwLvxyd0+y0lEOEY1rvG15/aZEVt
	M336UyDt5kYrvS8Nvm/zm4EczPrsPP1w4chW5CJKw50qRemdwJ75Iv+Rv9N+ELFa16ezeROOoa8
	wccS40Px3p4VCYoYsl4mIXIEspxoVbPQ=
X-Gm-Gg: AYBFou3rvFte/6zs+G54LxXZJp5rzYKMAbHDp/TF6onVd1d/3HCm+d+MBYLqEulwW6w
	Y0Wfy07uhPREayg/EOSLwxX+Y6QEsLC3ufObErwvdSE1vVKQuMV6mAuMwymihTRSoBBNlNFX15k
	91PShrev3lB0jiPGtQK9OqvAt9wRC39xklbatUGwTD3XrWTLcq8LHX+T/4tHXu+NjY4wr7fQD2m
	+Pz/8BSmo2JLsP74A9K/5TJ4U9SjAL0Aol1xOXeSQU6GhgboX/zO68qufqsi/3o65k4MWItz05K
	dP1w5EmFOrBrHemOy601B/k2870P1KUihPeBv7ZlZHgh0szAH82zKmWaC4HhRz92eh5UF1HRguU
	w32dZBqXJrQ3MAw/C4JTlsIvZj7NFJC/ix8E=
X-Received: by 2002:a05:690c:4988:b0:8b0:9eb3:dbd1 with SMTP id
 00721157ae682-8b4aa2396bdmr280387b3.37.1794499551396; Thu, 12 Nov 2026
 08:05:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111182330.77824-1-levinson.aviv@gmail.com> <2026111219-guacamole-quality-2ecf@gregkh>
In-Reply-To: <2026111219-guacamole-quality-2ecf@gregkh>
From: Aviv Levinson <levinson.aviv@gmail.com>
Date: Thu, 12 Nov 2026 18:05:40 +0200
X-Gm-Features: AclHuK-Xm2Vi3S7utQcqKGzEjiZ3mwFYsp-tds8eyrvh8TFkl-FsIp_ne2E9Xwo
Message-ID: <CAMAaV+gfcKLsr_kY=YWmD5qT=bV74_3MXGYvyiguoEWVxE1Wxw@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: uart: replace IDR with XArray
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,
Thank you for the review.

I am looking to start contributing to the kernel and thought
drivers/staging/ was a good place to start.
I used the checkpatch.pl tool that flagged the use of the deprecated IDR.

I wrote the patch manually and it was only compile tested.

I understand that the use of kref_get_unless_zero() is not a good
practice, so checked current drivers that implement the use of XArray
(drivers/gpu/drm/drm_drv.c) and tried using similar methods that I am
sending in the v2 patch.



=E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=99=D7=95=D7=9D =D7=94=D7=
=B3, 12 =D7=91=D7=A0=D7=95=D7=91=D7=B3 2026 =D7=91-14:37 =D7=9E=D7=90=D7=AA=
 =E2=80=AAGreg KH=E2=80=AC=E2=80=8F
<=E2=80=AAgregkh@linuxfoundation.org=E2=80=AC=E2=80=8F>:=E2=80=AC
>
> On Wed, Nov 11, 2026 at 08:23:30PM +0200, Aviv Levinson wrote:
> > Migrate the minor number allocation from the legacy IDR API to the
> > modern XArray API to take advantage of its built-in thread safety.
>
> But why?
>
> > As part of this migration, the global `table_lock` mutex has been
> > removed. Mutating operations now rely on XArray's internal spinlocks,
> > and the lookup logic in get_gb_by_minor() has been updated to use
> > rcu_read_lock() combined with kref_get_unless_zero() to safely
> > pin the device reference without blocking.
>
> How was this found and generated and tested?
>
> And kref_get_unless_zero() is almost always a call you never want to
> make.
>
> > Signed-off-by: Aviv Levinson <levinson.aviv@gmail.com>
> > ---
> >  drivers/staging/greybus/uart.c | 37 ++++++++++++++++++----------------
> >  1 file changed, 20 insertions(+), 17 deletions(-)
>
> So now there is more code?  That feels like a step backwards, don't you
> think?
>
> thanks,
>
> greg k-h
