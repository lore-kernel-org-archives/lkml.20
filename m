Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560730;
	b=aOFSRzchtoc5jHkRbJD6OxgF7vOGrxjekx7+7ZieekK30AWIKzGwy+TXMbafezjLdTsM
	 Al2wq+GpdLR6MhidNg9MrolbAmSQIHtUyImBhH8zGek5ARoPk0Hf2ZzN0BLejvIk6HSly
	 Za6c8lEDsYE/k5aeTlksVLHsw4G4jKHResQn131ufBuGpl69gdEkBTWUMnFveSdlr57gy
	 ZPRSo1B17KXFWLIpihGaCszXS0DHrWUAmyCtiFEMtxUaIxLcrD1tmJ23Bmg+Uap7g4BiG
	 l27M/uWADJZfcew84tFBxpiTgR2u+AjMqh9r4nQ7mk5lfWzKVApSoxsfTQBDq8IeEWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oWh4MmDr+U9A4o1fTENfwkiyBKg+wCiaiL/wQQiKIDA=;
	b=J2+5nDsxTUqwUUgCidQ86zOdyCmpkHaPrrRuL5jzN0eazk5ePpcKjeFa4OrSWtiL6nQh
	 DWKd21XCNPNeFIfS7EvsLCu6ixtHoxccwfJxIF7sZabLEpJbkpwbK5hEe8xAUHwygVgQa
	 3Ab+TrAnkXQM4hsTFwzFyUPEw0G4zFDs0ivtYjxQ617lODdSoqrrBYh1oePN6ZQrMuref
	 G1UKDT6YcHFhszrIzv2JOuuId+f3TYxb108RPVmoRqd9w7K8f9+4TD6omDaYY9NKNl0Yg
	 grXSeVX6oh1pDu3wLBoSKhRK11A+qKzRCb9/Kvr7oSWhilr9y3cjolsiq6ZRXgTT77w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohOfsXYU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2328606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2328606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohOfsXYU
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b3b57a31f7so6270317b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:05:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794560729; cv=none;
        d=google.com; s=arc-20260327;
        b=sA0LYW/WxKOiV0XbNjlJdJdaRFvIuXNuaz6JGEjLNoq64ol4HxS2l38oixyFvzKghp
         2cEijz3rb6vhEXIVlHMGrk8HZkfBvWe/29fDbYrvzvnewZJWCohBQZ5FYiU9/p0mdBVB
         y8a4lQLnsnTrmD8eH6T2wHNJ7lr0Tw5d8QEyGX4zs8Z8dR+C63AQS3YhdpQZ2A1t+NOB
         6UtQLHPrNQOXr1bWy41XqZKu6ZAn6k/ArpqVYF3prSrvYhneggxufD5616NfwqwZz0q6
         GB25RwkwcUKTI+nqS3CchdC5xknHaWQ2MU1pZNRq8a7m1C7BQJo4+McSmPbe2OZ1XyAT
         63hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oWh4MmDr+U9A4o1fTENfwkiyBKg+wCiaiL/wQQiKIDA=;
        fh=0fvaKJqU028/LKROPgzz16bCs1xUUYicpJF+18pnJKk=;
        b=JKdZsr0W2G/8DuWbxF1ENm8zXN6v2uAmLSL9+28mfhCiv5xV2hWVcyRPigpvYJgfV8
         52lgsNTc4vzfXez9vy1eTWQHF0JyBa3sToQRaG8pMdgXrxNAZkKbrB4DGMJl8kdBADZx
         cphvKZLo/m9RjzfHgAkLbJxc5zm+Ng13OTgMyCG7lwYcXqpRq+iNJxqc8sy+wujZ+Y1S
         CQ63sVpBNCXP+LmKjE7tX2Y7we6OwQy4WSFCHA3i7QGuPR6LVpnMg/Kfuw8WKm+DKnm4
         VB9OGAaRypk8hpLFULLK/YhOLK+Yob7n1/tZC2p2c6ZdxX3lWoWalNAVshg6/jHefwhY
         u/YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560729; x=1795165529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oWh4MmDr+U9A4o1fTENfwkiyBKg+wCiaiL/wQQiKIDA=;
        b=ohOfsXYUEXtUaJnoqTPwKxD8hi5D0bZ0ULn+2Ip8lqt2RtdypQp6xbRXPthdmTWv0T
         bebq12qwuGvU4/ITuA8v00J6GjJpT4Q70XkRRg5ezSBFZmoONPt1WQkmz0IAp1JHujJA
         FhSPMRSIuhISE2Vml3sEMYwVgMZ6Ug+SYaFHZ7M/jQ1jnojelYx1h/RWH1kAlvyTIeQn
         5ql/KiwFQkTipqUMZGMy0BtYQIR6705Nco01CFNq9sNqKVs/uiL5r6FjIHdQ+OcTxEVN
         qfj8/490YmGq5B/79pmiWAC8bGHhVx0wHqDOgV9oII08mjpgFLJXQDw3cTGXd51D7kmt
         HnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560729; x=1795165529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWh4MmDr+U9A4o1fTENfwkiyBKg+wCiaiL/wQQiKIDA=;
        b=DjCajjMUwWFOK6zay0NH+25nl80bIWDVKG3oryfit49lKqOhh9aAbjagQ/sTeLFnYZ
         15KAwr+yrLvZ52XMyvIdGPftUJmTbfBb0bdqAN2PP+qIwFjhbEeqo9h6Lo5IuKwyLcE3
         60xTPdq/rJV+XxidJKhq7bD5Qn/YPaX313To1JA4Arh/CPyzk1BGyMqSW+zA5eIiUUJj
         WOUPoSo9ezviEP0TveeS63JhxxN1yNtHzj/Kte90ZheGJUcwRG2AGgR+K1DdEiiF6bYq
         0P0IywVUbjmCzwQCBlWeseZ3Wis2eyrzGb5YYXqqSxuNfgj7UW9kPgH+vctZb54ulG3D
         CoIg==
X-Forwarded-Encrypted: i=1; AL+hErEoDS6tyguJLOcuC2z4rgtwnbbNqyi9CvpyKsm1HYQvqh3ZFl9O5c6bSTd9QbGok5UORxSnK10cXdd9GL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JYOLv73qnSNdcD9tgvsHCHQNcPQHWXUxZ/+4UQZbwc8+SiiGg
	5lTzqg68HKJRSMULR4F/gmR+1u7R4RNROQA6HGpSJrtek6Xy8WuUNmXCDGqriIRF3DTsWN1XJgw
	DrT4N+XCemTJnJ4KcBTZKn+pwhDWrXCQ=
X-Gm-Gg: AYBFou2+rNs7/B1ZGIjyePiFDRj52WSLEON6+tnwR+1NNz51fFzJ6ZkQb88DsDbSVHn
	f9Pnchakol7J59ecziiQDpII1pdI82o+Q82UFSRFCkOJ3DCAVCkYNsPi7p/HfbCJ+L1aPv4MH24
	oMg9yNqQSwF9shJYoar4P2ziBU1OeXD5YYbEJbmZ6Xu5SsRg9BWuDO503qztU7d8ngIYKEIbyYu
	nDxkDxTgqqjv5J/1fI5S+62OGPzXlNbk+WZLye6fWZE7CQMW9r+OybsNkQfR4KDuRZq5zXVteOy
	uPo9mp0/yWwYfTL72LGowD6Gdkp3wPVgqyCwGk7svEmqpOcOPeC1ScD74crvkbN/+Q206FutIZP
	rB+d4LR/ca+cJPeDqsf4It2VN+n8ZDY1E3r+hazvD8hV/10dVzwQ0w63IBFf2Zn+RVMVeOb8qoH
	yiXEo564KcMCsftvHfuzJgA3JdX9HSsJkkiVMDryswpsA6IsiuhRoMydx/k1Rlv9uccRsawl/pQ
	1K0p6cEl1cOV3Ab1zKVudHKnxOFx7NdlVCUoSqDEhuSbb4R4YhVfxcnmjLMwA==
X-Received: by 2002:a05:690c:d94:b0:8b3:8d8:e997 with SMTP id
 00721157ae682-8b4aa2dd6fbmr11603087b3.81.1794560729005; Fri, 13 Nov 2026
 01:05:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAHp75Vf_Ope66gaYtwa-or=r9_1n6wUq7=gs2f5kQX=fDS02JA@mail.gmail.com>
 <SN1PR12MB25284C20A14AC881C1AD6FB0A57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB25284C20A14AC881C1AD6FB0A57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 11:04:52 +0200
X-Gm-Features: AclHuK9IXFCbX1SxdhOA9CB3GFGT2GFIdve4YkuzFr6P_3jVDvAlox3VwshETyI
Message-ID: <CAHp75VcNL9juKhcRQYMH8WdnQJephKb1APuucqLNtk960_s78g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] regmap: add regmap_reg_field_* APIs
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: andy@kernel.org, broonie@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 10:53=E2=80=AFAM Victor Chernyakin
<chernyakin.victor.j@outlook.com> wrote:
>
> > > -#define REG_FIELD(_reg, _lsb, _msb) {          \
> > > -                               .reg =3D _reg,    \
> > > -                               .lsb =3D _lsb,    \
> > > -                               .msb =3D _msb,    \
> > > -                               }
> > > +#define REG_FIELD(_reg, _lsb, _msb) ((struct reg_field){ \
> > > +                               .reg =3D _reg,             \
> > > +                               .lsb =3D _lsb,             \
> > > +                               .msb =3D _msb,             \
> > > +                               })
> > >
> > > -#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) {       \
> > > -                               .reg =3D _reg,                    \
> > > -                               .lsb =3D _lsb,                    \
> > > -                               .msb =3D _msb,                    \
> > > -                               .id_size =3D _size,               \
> > > -                               .id_offset =3D _offset,           \
> > > -                               }
> > > +#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) ((struct reg_=
field){ \
> > > +                               .reg =3D _reg,                       =
         \
> > > +                               .lsb =3D _lsb,                       =
         \
> > > +                               .msb =3D _msb,                       =
         \
> > > +                               .id_size =3D _size,                  =
         \
> > > +                               .id_offset =3D _offset,              =
         \
> > > +                               })
> >
> > So, you convert them to compound literals. This change may be good on
> > its own (see other similar changes in the kernel).
> > The only problem you have is the outer parentheses. They should be
> > dropped. If you need them, it's a problem on the user's side of this
> > macros.
>
> In this comment:
>
> https://lore.kernel.org/all/auzCxxkUB9p6WKNC@ashevche-desk.local/
>
> ...I got the impresssion that you were *against* dealing with it
> on the user's side (in REG_FIELD_GENMASK), and I agreed:

Yes, that's true and I confirm that it's not a business to handle
expressions in REG_FIELD_GENMASK(). We imply that the parameter there
is a regfield.

> if it > can be handled in REG_FIELD, why make users worry about it?

But REG_FIELD is also a macro, it's not their business either.

> But now it seems you're saying the opposite.

Nothing is opposite. The statement is the same, dealing with the
expressions should be done on the caller's side in REG_FIELD_GENMASK()
and REG_FIELD() (as the latter is also a macro).

> Can you clarify
> your stance?

I assume you are trying to have a use of it like in __uart_port_tx().
See also uart_port_tx().

--=20
With Best Regards,
Andy Shevchenko
