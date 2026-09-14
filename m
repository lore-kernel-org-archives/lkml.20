Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3A14963D1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415467; cv=pass; b=qfp3/n27e9FuaLrkTU2xPzwQysOz+e6sK6g33Uxg4x2jtQnScoAv85GXFGuTiHGC9LSGnT75MSdFe0Lz9XQFHq3lJONA8WVgibF6zm02VSC4Rfqy2pAT0Ne1KGK7jzAI6NtMsZWg+iHKSh7JKAOOz2AIt2GgEK2wDi79yv1Fbkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415467; c=relaxed/simple;
	bh=QOnOeRnGa37ViBIa35zC5ovLVAbfRbTmEs8QCinKoCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TAM8j+vQ8eLVK5cBwrJQHp8kczBmMYRoMy73lchjJ5/BAtCDhz9Y7/nWpqJOXSjg6OyLWza/x6a98kAQEAqB9ocBwK0lUT5PBUhTXDYIZvX37wy8sSlbJ6oLVlgohujckOfm7aBxUKAN2paBZRWPAkuznIASORzXDwFf4yd7rls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BtpezNoo; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BtpezNoo"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso2406917a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789415465; cv=none;
        d=google.com; s=arc-20260327;
        b=Xt0blsQvwWFIgRZQbqU3n0LEjlPXDxmRI4Q9gr4l7NwXZHCnglf4lDMK2KsWZm0JyA
         Jt4AfV+EqSgtCBr+RktPjBI+tKyLj04JEbRlNs7AUrclbtepnuMbe0w92okNcIwoJLuD
         RY4h+T6fJxVANgpg0ZcUAVpzlKIcGfN2cZkTf9ZqCM/F+chRNJW7CfpCTHraAkcSJvrO
         QOK9VTrYdg3EsM348AZMtZ+vMyTeIMaaN6SZY12/Zr1mMaJyggih2f2zbW943kLakbTq
         h6mqBsEjLPvocOfEF0nlxBsmMCtEKnmmxN+BOZF9X/mEFu41CAQRphJsATD3eYlKip5S
         8zFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kO+COyVynF86QFCnzCKJO2bXl/nmlPUY5lN3yUs1r+w=;
        fh=YHtV8/z5zoxi5zNhPjgESh6IN5TU/iAmHSfmr9v7wlw=;
        b=puSTatEyMcQuK5FyyAT1XTXB2TSgDMRnfBEBYhRIMSxfP7BbSSol0TCYx4veVPzUA5
         G9/Is9De41azWQZaN/NRiqY6MC9433rYmfjR9LaYS7l3/SaXhKGw6nDj64s3h8cEnUs8
         N2hROoPDzErSvdcVc2Dslxs4Cjb6ZSI+lhBd4CuUpzvnXc4He89E4FFu6kidwkoyc5b1
         4nUsUcNIBUtnu6zwPrKXzAXk/cjEhD3YbgXFuLTBKI6+Gqo4pLtqqit9L2ssNISnP9KX
         01LxFsU7ooORPRDE15JdUUi6dHvlK1ONk85iDkNxNEHcFWnWujcXGcHkfKU93DP06ekv
         2PSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789415465; x=1790020265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kO+COyVynF86QFCnzCKJO2bXl/nmlPUY5lN3yUs1r+w=;
        b=BtpezNooGKfMY2JzTtDlmN/C/ehRSv0y9C1i+0zqO13ywjNOt5kxtRIaTGn9TcwYMf
         5RE88VI7Y98bVovwWXX1Fsr9Zz68mAYbloAkj7gQp0Qlhb5iNjBeuQ4Z4MIq/6tfkTr/
         xUiY55Ed2QOmiIRIMv8KQVQmQyKpWa+jxAF6llAh9PsTKHTOj1rlcYEB6H2cYpTZoFND
         7hwfhKx2mGh1omP8sivwXg97MpqwzEnsnpRmOYbwejqfX5+4WoXvCssnK1RHUGnTOBA+
         lcAJqYgbJ3xQKIIT/SrDH/i3CGwIJYe+bLtzaGjtn5MPkY2FoBd9t9Pa1i8oHxUf/D+E
         X8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789415465; x=1790020265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kO+COyVynF86QFCnzCKJO2bXl/nmlPUY5lN3yUs1r+w=;
        b=dZCtSi44su0x9el276K6h566pzOrIIF5ozxkhFP8tAXFJfGoVS4DEtg9PexSlP1bMA
         lJdG5Z3niMzWZcY9ppCgvzHh5PhGjhnVBN0JRf7oggTIILHc0K5wUGED/hwHYIC5Trfu
         bnotTjOWBcB6Uyqd4R8KxYpY9/N4z6Kku9kKo3v3vgYumEkkGmwDr7PeEKMumq93JA4V
         DeDcGcSR0c3dBcnR3z04191Z3mpmqeEbF9RxgQOytI267LxegyYf6bQt0B6x7k8VRrpu
         hQ8zzGefULFow3evV7a43o6Q0idQIbwK76zDvPPNySTgP5gBOJbEtXgNDmpyaoNSgIR1
         M8tg==
X-Forwarded-Encrypted: i=1; AKwUvBzT/OgUytSYdUHjLBB131nlJdlNb16Xw0bs4O6i+IlbqYnJKEmMMVr1FV8zEtK2r1DJqVKQ2kGiiEYURnI=@vger.kernel.org
X-Gm-Message-State: AFuF++lz1h46ZTKuHxJ/C8AYJb03maUJtMXrXJrYCAcGGZnFUsFHvWiO
	KSTtWnCl4r/+aNIshfU+7UZ8jNVVhOc+guW9dah9Kk54pmou1wVLegqXJnfjCV/rdOX8LUwQJqo
	tnwIE+jwFfFPOqZNHjfFm5btt7NrVdWopWuyzaKfA
X-Gm-Gg: AYBFou1sw+kYEP2LOfUF1aJ4i5ZvzNU2C/IOZfHZyrGOMTLtUE54H/4Y73dMqtE7s8A
	2LC4Fah7P21GA9PDwF14Wuo2tbI4fi3Uopahw3ZoXcbDneZsHFwm/CZLK8WaXQwpotGkObCuHLa
	ydmJVYb7YRA4xfqn7z3c/myseZgqywohICsUS062JvU6kbVDcLgDy4r45q7V9wMUmSsiCqq1Co1
	NnXj3PUu+uULULoi7st/07MyzCAWtPTc6owJdavr+kWkjMgzRHsk/Jjk/ZUO1ZxQMBYMyyogEi/
	1JLHQ3dW3DGEUeDBfciYCFsVvHCTQ5u4zKlgLW8cINtCxiuX6Rhi2qxWDHmDeGSw8g52jpqkafQ
	SHtGake+jhj13SJnvaKdBCmHauzQcYcR5t5V77T81jWKa1nFilKUmDtMkk69AnwqtPJ79HjCNhk
	vYGzBIviUnlAsG6VJKX7PGC5h5FSquzfg=
X-Received: by 2002:a05:6a20:7288:b0:3d3:af66:9f61 with SMTP id
 adf61e73a8af0-3db4076e3edmr7597487637.27.1789415464132; Mon, 14 Sep 2026
 12:51:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911073758.2714564-1-xiaolinkui@126.com>
In-Reply-To: <20260911073758.2714564-1-xiaolinkui@126.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 14 Sep 2026 12:50:52 -0700
X-Gm-Features: AcwNN1VDum4gOlZSbg0hzDAlTLdEEBy4SOc89xunAgFU8fCHs5BPg2Oc9Kr5JrQ
Message-ID: <CAAVpQUAUAgAVutpQgMu4LjG1KOpm9Du0Kw1kbp2vHtHqQ5USZw@mail.gmail.com>
Subject: Re: [PATCH] ipv4: fib: annotate data-race around nh->nh_saddr
To: Linkui Xiao <xiaolinkui@126.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linkui Xiao <xiaolinkui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:38=E2=80=AFAM Linkui Xiao <xiaolinkui@126.com> w=
rote:
>
> From: Linkui Xiao <xiaolinkui@kylinos.cn>
>
> fib_select_multipath() compares nexthop_nh->nh_saddr against the flow
> source address with no lock held, while fib_info_update_nhc_saddr()
> stores a new value from another CPU as soon as the preferred source
> address of the egress device changes.
>
> Commit 195374d89368 ("ipv4: fib: annotate races around nh->nh_saddr_genid
> and nh->nh_saddr") added WRITE_ONCE() on the store side and READ_ONCE()
> in fib_result_prefsrc() after syzbot reported
>
>         BUG: KCSAN: data-race in fib_select_path / fib_select_path
>
> but it only covered that reader. fib_select_multipath(), reached from
> fib_select_path(), is a second lockless reader of nh->nh_saddr and was
> left bare.

32607a332cfe added the reader after 195374d89368.


> Annotate it as well so that the value cannot be torn or
> reloaded while the per-nexthop scores are being computed.
>
> Fixes: 195374d89368 ("ipv4: fib: annotate races around nh->nh_saddr_genid=
 and nh->nh_saddr")
> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
> ---
>  net/ipv4/fib_semantics.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/ipv4/fib_semantics.c b/net/ipv4/fib_semantics.c
> index 7a362f2e2c2b..885c6fae5232 100644
> --- a/net/ipv4/fib_semantics.c
> +++ b/net/ipv4/fib_semantics.c
> @@ -2204,7 +2204,7 @@ void fib_select_multipath(struct fib_result *res, i=
nt hash,
>                     (use_neigh && !fib_good_nh(nexthop_nh)))
>                         continue;
>
> -               if (saddr && nexthop_nh->nh_saddr =3D=3D saddr)
> +               if (saddr && READ_ONCE(nexthop_nh->nh_saddr) =3D=3D saddr=
)
>                         nh_score +=3D 2;
>                 if (hash <=3D nh_upper_bound)
>                         nh_score++;
> --
> 2.25.1
>
