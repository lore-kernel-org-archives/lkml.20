Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793652318;
	b=N476bdH+0eGmf9X9b4a0XMBZ0NrQS4D++6vx2Yv3yLfIEK0Qo5Kvp75uCakSsdPBMn66
	 tJdLsEH2a3+K50rewXyZHfPFu2J+YEsPa00N+XemRNT5/t8Konljq2D/OgdRgzpNU2Mkb
	 Snu/8mCDEUXf3nn5cY/uCZD9Tv18dyAmcT1LT++sKxQYpRmQ6uT3dxQ3pVg9fZlsrI1kG
	 E4/7HB5fDFuspaSTnK/Uzyaf76Y+Ey0LUKudEXZLKZapTTKVCk8NaBhE/H37RWVO1anuM
	 uL3pa3TdnLd1qbBX+ljUmfM3jyVsXTR8kl8BK5GYfK/VH3zBA7MPnXq9ygM8s9S7CKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9+4MG/RP98VFJErdCyXbOsA7c3c0RHEevq093WDWxVA=;
	b=5sikMBTyHugAqp/+ycc6y8aTdx2fjk3Qzy3d5KO3g6FogC3B4Uw3IxNPDRgpnPAxXpbE
	 7yU5eT2AtXdeoeIPNzFwnuBvZi/dap3z7chwndbP8hXpCzj73Ztpv+oRe31YXXHdq42oo
	 wfoUMwlSJmjWXvBzpt/5cyg2P1jYw44EKzfLV+lQo1v8sxNFJDSN0oh2Ri6eUle8LF1aW
	 6KM57itYRCzeK1Pjipdly4ZX2Zc97oSu6/t5p0e8u938bw4AxabELgzw9lGnYrJk9RqN8
	 rlXlp/dbjlrtERLdV1qn3/5K5ZK4RfssYSakzy0tijQVxBcckJfq+fIetX4zAyh0i8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BWgtXpBP;
	arc=fail smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477D1606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BWgtXpBP
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so557982666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652317; cv=none;
        d=google.com; s=arc-20260327;
        b=LTGQccanDn39EdeHQY/Zj71EgKRfVPRLWoUaaz7vfNNQN5/8ZurzEhVdwgSaUJ009d
         Om2y43It4Zjsn2XuYyJTugKtbL+6k7+Vf91u2tLYMK7qXcsNY7vOXTU0m4a5vXrnDrvR
         snbBH9Lw/NuMLIXJw+ecHW6D+g0szVtXczCu4IL4jkcyH4+INDhnNoKrJ3d8W4OsimIb
         8YGqU7pjBGutUdjPoLg2YurPKdvJOIgDkMr0ycjsqorjtaWDG/NWm0w8DBjjA+BpqZD2
         43kIKRzfuklVRCot0KYs+ai31fkzYMvRzSZTdKTJXTFhWcoIOEbkWrtEx5j77F7inGIT
         LDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+4MG/RP98VFJErdCyXbOsA7c3c0RHEevq093WDWxVA=;
        fh=1DiAhvI0fEx4X1rRUJqnIQ0Sh+refa7giRyQw5eL4pI=;
        b=cJL+yKkYeHRS+Ae4jslF6MsyY3dxKEBWamIh9DXm+LG4+HnXhpLCfLtKMZwxMo3HDA
         S2fqzZcAUF+EoCe+jpgx4xfZyLKh3FHZOqIvH/Mm5chp6KPa2ki6iWsfXopz4sxClUGm
         A3EWCupicByXDjKan2Cd/hmNkiDrc7H2ontXuinidPAEeWcpS3sbIO9MoC35/twh09U1
         ii3Zp1dMrKwAq2K0MWspk+fA+zSY06+QONAJyqA7oxEQkUH6VkOfFsleK/j3d2y67D6u
         aX6tMQxWdS7oSUmp1+m5QHXFKUFlmRnawg+qHNbBglMtv/iVqcy2ym5syp7dzMQibD0x
         BSaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793652317; x=1794257117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9+4MG/RP98VFJErdCyXbOsA7c3c0RHEevq093WDWxVA=;
        b=BWgtXpBP21kxrMgl3/xj7tNTB1/QJCyMEsTFYk16Eb5nUSHOQB6Ifb6Zx7CFQ9sDcB
         AQWxb6G+5RU0dGvHWLa96kF8bDQXNTtnb8mjSujwe4rv0ZYG2Y97XsMVjGnl8mG/H7UQ
         He/wp6v/h28VaWEzLVTdlyiL1PvPiMKl77IXxNnstqsoiflP+CRCFOmxvPS2b85Ps0CM
         O0VP+iv/rbJ2JRbYF8rSkhrzx7tRerx/zkTeCF6e0TCcy5HqYayZIsaA8nwgkg0Q07U9
         exjH6cOmfWLvNSNKQ1cYXo+js934AEkJa78V5DAjQzHETqB2JYCNapJjht7EfkG+v949
         zzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652317; x=1794257117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+4MG/RP98VFJErdCyXbOsA7c3c0RHEevq093WDWxVA=;
        b=qD6ghREmywvrNT1pjjEYnMteYmo4xGng6IMrqv0VJwltHXrQe4kjxI3YbHrnPKntqR
         9DS9EhMxoCCAC8nyGWKxeMw+Ivn4iRYe6sjVjz1ydsSWdSsYhYxAB5ubBBq6EzBsMzF+
         QT0PDhdq0v+6TvHBlUjaVuDQ/47iZR1rEIM1yspNML+clitA6PVxMrOAKvgna7e7ajul
         nYM9r/JO4AD+dBW9oBI3dU4o6iUOFVdfdEKQgI3il6vMUJYVZ47+v/9/CQUF2sem4770
         YSLPsT9ylB/4RYTjijJ2WdnluxV20snw9Ns/sBOe4Mbu9qPo3sBMl7W8xKv6ImdFcFt+
         XuNA==
X-Forwarded-Encrypted: i=1; AKwUvBxE44Xx3Xlsw008KqDsH22i1Z6FclgxYjm+ILdJiUZTZhVpFkB6LB/USJUreoHBhd73s7VAiddN4+bQQ60=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1PZjNXq7NareycrnZwlzZ5V8I4n7nn7iHssJAC81og9B4FXW8
	Td137tXzjpTrNJxNv8QFcswAK4rEjb0nezmIcmIx1TOxXOgz8H9XL9ZT/D+ukTKpmSOELUt82uw
	4SQ7aLLeItMQJSJc/Jfxp2+EpEgbgQXs=
X-Gm-Gg: AYBFou202LMFNBJEAMyGzIrGPOL/lcY/bP7VMgzIDXtVeLFu+Qid+f7gxFqszL+TdxU
	65HySbug941DA+K4L/jKOo2rPvaXlXjfmHeZSEB0eBLw1MPzVN7zzK5u+KaKhU5cIqTWQJstV4+
	idZ8lhw/jLvYwXV9aq+3Fh62UrDbleihNJ4udVjUdwX3c6J2lCuAn0pukVBIv9N8z7nZKmXqS4V
	3bcFPqBdWJfukX28Oh01DWG1idq7vm+EC6z+FwT0LdAkSwxDX1eKhhxkNh94WOGcaJWKzoeH9dw
	PtiQeNPMi7OV6SudEjw2T8iavuxdq9nvBrwda38FLzNy2v4u5ukG8GjZNzKzmIPeexLcVLETeNp
	9tVNUnTs5lGAQxy6+kwpRN/ycG31q9uIIQLcuJc1xt8xiW+GjAqkQvbghS9I13xbZ0jCOthKnco
	E1hbv8q5jruFkZ7iAOBtnEEnjXn6+kQATcWfchZ/p1LV//WStSv3yTyF6Rhb+vmTGLOLyX3TBfa
	SPB82TiwccJNsr3z8LAFOdTHw==
X-Received: by 2002:a17:907:7291:b0:c36:a4b4:b1ed with SMTP id
 a640c23a62f3a-c4ca7a18e9emr1040945766b.11.1793652316563; Mon, 02 Nov 2026
 12:45:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031042315.1122699-1-eric.lee0305@gmail.com>
In-Reply-To: <20261031042315.1122699-1-eric.lee0305@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Nov 2026 22:44:40 +0200
X-Gm-Features: AclHuK9vd6HXpTj_GoBsuPuHc9gsfqa_KIPnkW7tQj01sWOMQhU3GUHBUvE2PZg
Message-ID: <CAHp75VcvKkOmFTtJDHuKCNVUMXgjZLiNqmGcHFKT__dtTt_QJg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix space prohibited before that close parenthesis
To: Eric LI <eric.lee0305@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 6:23=E2=80=AFAM Eric LI <eric.lee0305@gmail.com> wr=
ote:
>
> Clean up the following checkpatch error and warning in fbtft-bus.c.
> drivers/staging/fbtft/fbtft-bus.c:14: WARNING: macros should not use a tr=
ailing semicolon
> drivers/staging/fbtft/fbtft-bus.c:65: ERROR: space prohibited before that=
 close parenthesis ')'
> drivers/staging/fbtft/fbtft-bus.c:67: ERROR: space prohibited before that=
 close parenthesis ')'
>
> The reason of that error is the modifier argument is optional to the
> macro define_fbtft_write_reg. So, even if removing the space before close
> parenthesis, another error "space required after that ','" occurs.
>
> In this fix, I change that modifier argument as optional, so that
> it is both ok to use that macro with or without modifier argument.

It's not a fix, it does not fix anything.
Also study the mailing list archive (lore.kernel.org) to see what
happened to the similar patches in the past.

--=20
With Best Regards,
Andy Shevchenko
