Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558602;
	b=habkXo5+8XTlSbxGssxaU1ONgFKRb/Ar33FLi/XSBKWa44Cb2vblxk1tI4JiO20nCrdr
	 FZRu46xF2zNDZreftIri9MQBwVzVplGQHa55+ZqKQbyoD6n/iVaFLRgfS6dHiOrvT53L3
	 unEMNaXomnV4twBAbEfXib7iy0uCweIq+feJAvyy8yHoxIJf3I4qy6KGjOmUuaQDUxkIM
	 aga2q8prtUEHh50NFjxcBd+MVDXiDekloLUS7uWuHvQ5P3CaoLaEkhCpU+aAh1sgC1Qyn
	 u9kvvNEes9Dmeh4xsNuSqyCIzamUUO5T1Lns6fD/H1uHjiWy7MGzf2aQHKpS5b+rnlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xBcBGd65cJ/2tYhFkxpBD6DCkK16sRTKCyej41oRV+E=;
	b=Ssxk/MS4Jt209bhBhxp6TDCxt2C8QoyXIseVRLuiHcJUDlBeBd2jIP0Ewem347LFLaGE
	 grqzY+67MJ5y5PxRyyc+aTD/icz/W52oU+o/PBePYfqPzEXGtCpPifsyXKKrPItWfbegV
	 ujlgmA1K8/4GmvzLlpFd/z+IZC/IMKoZ6yka/0494cAHPAwOhkQZJC4u3FuwUrv3O10WI
	 YOSFNQ4W0Z5dlZaDICmhWgumMMkDcMpqFfFu8Ains++DL3UzB/y0zxVzym4ppiKYS+GYt
	 yxRjuZvpHNBoxYwMyrtf1VxBxsp8Ip1cUEcXCdTw1URxjT8ck5xKFZFXR05u+CyjLCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5Mdc2Ik;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F5B606A337
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98F5B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5Mdc2Ik
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67be4686827so547078d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:30:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558600; cv=none;
        d=google.com; s=arc-20260327;
        b=m1VCD1XSB0NjMlIqghH6mt7Jx6h2OoeW1IDsBL4TSlOxau39+iGw7wvOXisTkKyblO
         OkB9I+2Mr5dMiapGxshuTp6mYZneU34kferKXSdouutYqNQgyv9kmBV2inMtmOjsa9PL
         t1n/mxsULwMQ0JDK43v1rEISqfWdbdWwRs8nlYrCLnnMSCBSbtb574VzGks3UgMuUNv4
         u6P1Bl26I5ZfwSnPyB/mZVj5SB8w/s+7xksxCR+ZKnCnpEKpekqDsjQvBNxaBtdE50Fl
         jg5fDNBgTu8BNUeYvwgzwol38c/WCWRQZGFx92hmDLFsjsJ7+Cytr+0Fkf4KSfABAac+
         t/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xBcBGd65cJ/2tYhFkxpBD6DCkK16sRTKCyej41oRV+E=;
        fh=i4za8gksiDUqOyCtFnd2H8FcAJKGelmD6D6mtqcs+2A=;
        b=sI74TA3hqJMUS04uCmU6y21TYkulRULmJfHkDTcC1UG6lpoq7sEnS6/ztVgXk/SgKa
         pLAjgBpkyEhPriz5+XOy/wPjde9qvBsgYRyA1bKXU10/Ghi8jL08Co1j5DZ06adiet0/
         E3tSxCltRt/eHVjcrxYazXgBm/nVIA/iLL4gmhkDNEOc2L2aj6TiHcOJkPzX+09q3Ale
         15ipzYMGF2J+ufto39NIfOjiui1MKTKoKNnS4ol1j8EqAQxv1MZyC35jKBW5zXU9fmhk
         SnGhq3W6H2nNn5642YLzB3WaDOl0e8Br48MOYSz3+sXj102IfzbjfUHGdeYv5mNqXpOs
         tCwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558600; x=1795163400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xBcBGd65cJ/2tYhFkxpBD6DCkK16sRTKCyej41oRV+E=;
        b=m5Mdc2IklNazsRqWDDVRHSF+/Zi8/+UyIbZxdRFR9t10iKYPxLIFv+ZkpU3ewxjb9U
         9fe7GQdhoPZaGfzDEP76c3NAXCuVo29RlFoXOyXUTI9ZjuLiYdLAhhdKVCqov+uEbKkB
         d2uQd7eVkQwUT13YGHX+HC9LMn7OR+3oetxVHlEVC9dLQrbGDHa6PrWaQe3+ALjj6o3Q
         LW26yz1t1Uh/AJ5RZLvg87dsGt52iLIJouUYRKCGhA2SUIKVKJxEPM5/eF8prU5qi1tH
         qpN66rKBpAwMZfLWh3aSyP+TII2VRRUtuTV0PZMcZyv/UELkCtifO1K6mXtNbV6/hszi
         HaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558600; x=1795163400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBcBGd65cJ/2tYhFkxpBD6DCkK16sRTKCyej41oRV+E=;
        b=yCt+T9txxhaGEpdNHnVd7TTtUiLXmjFhgIwCLAYGGX7wbQt3Pty/eUsnJrGkjo5Xrr
         2LPy0wl/CNKa1Cnx1sCXndzBqlv/CecfJKaTbTdXSjok3OjsPlMyE46SRJm2OKqQjlsQ
         BL17vP1sIa2+9Rq6ZlEdjJ1TcqUPyB9mwdK+UUKk30ELYUG1Qk9LMKiXI//LJECjHIEL
         wycIIPPhpcrDGvkUwspC7gLmPe4Igeo5xsUP7rUB7azswapHC+aYhLB6QdSDcKyOQdeN
         PqAPnIS0fbYd8cik24QB9i3AMBTrOm2E4GTGX8K5CNCvEv6qCaJprb1Im8kixtLdMxdb
         ochw==
X-Forwarded-Encrypted: i=1; AL+hErEA9ty6Evg7eGWssFj5a9useHBoMxzmYtli/vUhh1ujm/R1stl+AAnFw8xPDV+UwkxneJ8m/qrLSo534DE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OjCYQMBrO0suggxYS21ajiDCx2ctrziFb/254iJDtO4g2NenH
	PTcDFSYlzgWb+b2Bh57tm9aX+IQsCrl17elem+cLyO2PFlsOeIu+WtomtzBZnlpqAVyiDF+Pqry
	Havr6kUTgA6BfhgubCTvwW84r9qOW+rQ+dTXx2DI=
X-Gm-Gg: AYBFou1SvwxvzQmuOMLhlk9FFjOD3VBOigUmzON0OVkDsrfLXuJJFSz9QdULyrWEIgg
	gQaFGLAnOu0+pR/mSubxarbpGkefJE3/3wqotW0OXmZ8vA25sNHWpgEoQ9yOYPp5buE6UPL/C63
	aX16ZyLLTGyr3P55eKHZnWQ/f9gSidfkUg5kjlojH6GKE9+K9oaR2roBCJiLI/W4TWGvvpeThzb
	ceHba0tKQ19aXjnrJussY1adoQ9T0J64AeafqLI363GPoHVHDMqfn6Ldkaj7MjdW+IadjClIJUi
	l3ib6Xd/ZwTHHUWQLz+DmGrlmLYY9vL2oAz3k6JiuGwHiV0tBmHznJikMpuOgcCvzZG0seM7q4y
	z4n9f5jyXFOZYJ7Is9p3pc/l96kM0z6mbsMwnKrf/zmbdZqCe3Mc/QW/6nwIVg0Ad+Rl2FOHKRj
	Al5OQ7ShshrQCNeSwSeT4RZGEaFurPkpP1QU9ye3Sv/rjRuyEfDxKB8lYRSur6MLgEKRJW1teMl
	vCLvDWPFI7K6pSimEtyaO+5LmlaK2EU3kPcQl8mgUHs330duZ1QZL55LVW4TQ==
X-Received: by 2002:a53:b4cf:0:b0:67c:f37:109a with SMTP id
 956f58d0204a3-67d89809719mr1046551d50.83.1794558600628; Fri, 13 Nov 2026
 00:30:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
 <SN1PR12MB2528007B30A64BD79BB576FDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB2528007B30A64BD79BB576FDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:29:24 +0200
X-Gm-Features: AclHuK8OUox3fKcv5-35RMJci4R-69brLrp1fmmPZ2xYNoAbPMnQl1DAA1CurnM
Message-ID: <CAHp75Vf_Ope66gaYtwa-or=r9_1n6wUq7=gs2f5kQX=fDS02JA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] regmap: add regmap_reg_field_* APIs
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 9:05=E2=80=AFAM Victor Chernyakin
<chernyakin.victor.j@outlook.com> wrote:
>
> These functions are equivalent to their regmap_field_* counterparts,
> but allow working with reg_field directly, without having to
> allocate and manage regmap_fields.

...

> -#define REG_FIELD(_reg, _lsb, _msb) {          \
> -                               .reg =3D _reg,    \
> -                               .lsb =3D _lsb,    \
> -                               .msb =3D _msb,    \
> -                               }
> +#define REG_FIELD(_reg, _lsb, _msb) ((struct reg_field){ \
> +                               .reg =3D _reg,             \
> +                               .lsb =3D _lsb,             \
> +                               .msb =3D _msb,             \
> +                               })
>
> -#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) {       \
> -                               .reg =3D _reg,                    \
> -                               .lsb =3D _lsb,                    \
> -                               .msb =3D _msb,                    \
> -                               .id_size =3D _size,               \
> -                               .id_offset =3D _offset,           \
> -                               }
> +#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) ((struct reg_fiel=
d){ \
> +                               .reg =3D _reg,                           =
     \
> +                               .lsb =3D _lsb,                           =
     \
> +                               .msb =3D _msb,                           =
     \
> +                               .id_size =3D _size,                      =
     \
> +                               .id_offset =3D _offset,                  =
     \
> +                               })

So, you convert them to compound literals. This change may be good on
its own (see other similar changes in the kernel).
The only problem you have is the outer parentheses. They should be
dropped. If you need them, it's a problem on the user's side of this
macros.

--=20
With Best Regards,
Andy Shevchenko
