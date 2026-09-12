Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5C8479887
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217557; cv=pass; b=NwXdD6JNYg+TMj4rXeYkK45mFSkZjL1ZbKOjZ81fBG9mN8i73+0wSh1yA2BHo1SR1mKGmuHjgmvcImgpgkPyYVDhqGMYFkCi2/YscAyjxppgsCmMCOOFgjnGNbgEv8h8QpiK8BnN6/Xv+pvzdFCuN8iW4+CwGVsamOGZF2YpvR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217557; c=relaxed/simple;
	bh=XDRlw7soJ1exP+/EylYzP6c79KQgOd8/gxEoWTmcxxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWiyvxBT76QFYYDQmbTqZ06TipW9Kb46k3bDTnRaInK7ReD+ZZovr0BqxdZbgfuuAEWtMPbgL1Q8wkkKeaFR+mvzEp6w8GHJcI973MBVlpS5F7/gIckl693xobstSSnEt0hqKI8h1hUfJB6LoCJ8TLF2Ftq12KQnmXUYpBf8Zrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiogLxkA; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiogLxkA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c25b661d37dso280003966b.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789217554; cv=none;
        d=google.com; s=arc-20260327;
        b=UiVSARy8yvBNRJLBX0bZ+dvq7wyjnr0a2mnY1IJXbrKzSJNsJpXR6I4+++w3U0JzwA
         tKgwB19jqfQ+InUYXOPb3ZjHgzn/lWhpj4vDItbe+A6dloJBP9Cc+HgW5CRr2Cufw4vD
         S/zFs84kl2kMSkQ9CCGLZzKeJbuo31k7M3r6ILQAWuQfByTn9tkWlKkh9lS1g4vfKC7P
         YTBcYD6GCjKopTdT74daDoH6JKnMjdearTvCriwGqhLVmHRdjfIMe5bEecVtr3AOIKwa
         P8sPIOKLuTO+CUzLuI1rMsNzQHAUcKpqKZbrrXHA1Lz5N050F9fF6+GSzdsGE483/t04
         kHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XDRlw7soJ1exP+/EylYzP6c79KQgOd8/gxEoWTmcxxI=;
        fh=8+0drHg0lK82X5lj/nngpqEQndecJQpj0oaB1Wsan38=;
        b=sFlaGHiqVao00RDPaDivOvYEQFWnREcBltBoOUeA3wMSAS0KjTzE6h//aEsgVJq936
         r52nCTGz0tPTtwmJ+IUWQh56p+ZWGy60B7/Zvvp+VHh+0pweSK/lEWBzcYjiJ0fGK9mc
         yA+IAePZVCS47iq5047SczVafMtEzjl18kelSjPi4Js0U9K9USuoBvSviYnTuqoxehr4
         qsbLB7GMAZzh131lHJp/AIGZHOMDNaJyFXTHDPou8we+UwYTF/OuTxk0l9bduv/byuJe
         Wvu9IvuJtgnMbPvlolHh/r2kAIsiuHHpAuaH41EfHhd4O8YyNgh8RKr1wmr3Pl/jH/Ki
         EKLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789217554; x=1789822354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDRlw7soJ1exP+/EylYzP6c79KQgOd8/gxEoWTmcxxI=;
        b=YiogLxkACUpu37sIPery8UXnPMKXs8CgkenAUNfVsaLuNG7Okgf8c3on7mxOah8crn
         fu9dbHDKpnxy6nzjz2KQ2I++MPRJc9UdvDo+HbnloC6RZpyiyV4tYm5qKotTx8QC32Aa
         OrhgJaxrp1G6BWbROLhd6u/Kbh9JLHem+/roJhf0TDLIg2/+2MVjcbKloVp7cYU99M4P
         73lcTVpg6+vorQzD9uE72F5+UmGffDJVIYAupgCgkiKgn52uAF2eHG67cOcI8INpwstq
         fVNk6d+BtjOjRVNPDY2S5r2+Y9SbSjkruBlYbEiDIO4DBS7U3dfSLT4xcpiqRRDjIR9B
         T9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217554; x=1789822354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDRlw7soJ1exP+/EylYzP6c79KQgOd8/gxEoWTmcxxI=;
        b=rwDVPaKnAYTcC1yedqZJVnzVo6+HXYvHKga0HPEHQTA8/5Yydy5PEHLlepQqMfFJPb
         0/dgM43P1AvIG27PBZHXi/GjUWbiGeMAySYw/60DrmfZs9sVpnEiEw1J4D2ehzpfgD2f
         z0BbjTqIkj3VGiuoYnWlL01h6Urp0baLEx68RSisQEqKC5ieKCP97a2oAkoaOTLs9yUR
         VKnLh8PHhIQcJ64cqwbGzSWQgifsOcSv2gkYTjhVeHy2iDovCzhVoV12GbXNzShUOc4i
         OmYQwxEsjXGw1fHN3WmMrREob6bdBL9kMoL86g74KFTKzD7ihyhxtUE3H6WGTr8d8XTp
         Oalw==
X-Forwarded-Encrypted: i=1; AKwUvBzLBAMjtRHlEDET4P++MQGHRuAq6gipYH0VtEnDEymerSt7Ulibwt+W+B95zJ9DruG0tLROXNH1T9XQKo8=@vger.kernel.org
X-Gm-Message-State: AFuF++lvfWQKZ4Q4H7bEGZ1oKdJLi8r1ox79NCQrn86ZIzbBMDhhvQkK
	JISOXbp+2M4zTSxQNqblj4/lNhnklJfFv8AZAN2V699h/LNwi/yA93AuBWtHYZJs04EA89ZqcDf
	kRRhZvZdYwWMOX96bJF44GRYUhLRSyXs=
X-Gm-Gg: AYBFou26bjC2LQ0p7u/0wLHvY/NpdrbQIFppLg4cAJvTkvHRnQLsxG0HtXE+ucxnSZa
	fbox1cbmOJqFBoMJFLWXpR3qgHwKK7s92y12gg2mRx83gwDlHfPw3EM21ij46JZgq6tGaWxBDrB
	hJWdRldACk+sBUIoHwipfFQKrEYnfUGvOZ/wyuoYhI8Mwxxf2lZwd12yOtABpt6yC3aeZ8kXYyj
	Pv4AQGGOWlz75t0tbjsjUupFnHxjJc0bUhKi/ionkYdMv+Gjs3HhTmBRpcXPtfICWw7hBj0yDz9
	scRTh0twadvrkUK4FLCM629nEKpdjWhVah4CuZeTvVwsz4htUW7JmZ6uQOApGULNDvheP/ZaWP2
	YHS2vsytGkc5Vvgtd9s1DAqUxbZ+iBL/ymqDRMw4glHmrVKSsZbj/lEiB9g/oMs7BgfiQPYD31B
	WPvIu4H5nF1xcv9twSj+WI68hat/TuRV3nRyEfS9it
X-Received: by 2002:a17:907:1c03:b0:c29:53eb:9913 with SMTP id
 a640c23a62f3a-c296676d060mr456030866b.38.1789217554379; Sat, 12 Sep 2026
 05:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911224010.10393-1-kmehltretter@gmail.com>
In-Reply-To: <20260911224010.10393-1-kmehltretter@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Sep 2026 15:51:57 +0300
X-Gm-Features: AcwNN1W3DwqWQd9pEielZqqFLKmY8dVxArEYlj28Uls0VE038UU_dXGO7z6BIxE
Message-ID: <CAHp75VdcVVjotUs84Q1fO162AOQ3W5UOJaY9HxWz7FBbcJ=G4Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: uapi: Fix gpio_v2_line_info_changed reference in kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:41=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> The gpio_v2_line_changed_type comment names the containing struct as
> gpio_v2_line_changed. This was a typo in the original GPIO uAPI v2
> documentation; the struct containing event_type is named
> gpio_v2_line_info_changed.

These two sentences almost override each other. Please, rephrase.

> Use the correct struct name.

Code wise looks good to me.

--=20
With Best Regards,
Andy Shevchenko
