Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899613;
	b=h02yjZ2i/u+LAM61lt1JE9sO9NUShdZNm3a6o9rPE5kIEBKq9TW+Foi8/wOLDbDGlA82
	 jdvANjolwFvAtTUwu5E+VG9MAZCs/GsW8D3ntk5mau1uat43A+k7i7TJHEk8uVNMUAxw4
	 WN9iwHH68orMIRwD+VpBeO29JHYbSHAPLYwcIJltyWP7XWJi+y3ZyRyPbFt6MlRZX5MSO
	 1ZTmsrGBjYIOU9jYreKuAyrRN/JDYBC+v9CCR28qgxzWC7zhGG0fgwTydgxoHy+4gwzYD
	 BmtzofIFoWwmO82vVIeQHwrftW41PCnV1IrX2KCySC9ugjdaPaYFgBGS3600phCOtOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2ig6VaSgCXuiuyN2YfSP2KMmKdlCjFPySPXtFnYMWLs=;
	b=nNe+IxAV/KQNTRkrYZb8XtY0LwHBkMVVHR+uXRaeCWaTVrhvIzNRssHPYu+cRh6rinZq
	 TTF1PSyP4FSflgwdnKvGFRGTBQlY1Fmfe09GmWgZIfDyqlr2B5q+EGbDKAqC9rTb6BDLy
	 zdpeCim1NT1WJRc7WnJBQaKPgJtgoHKTSnfA+N+eWTIUdL2y6Hah300AeBkE4W8gW1Q4R
	 GYmz7ofasCL4yk/6DPgoX93KkH/ZHrPgSwRnpjN7oTPK0VTG4bwFET8OH9EGUGNIF5D/b
	 LJVLkEvOwLhNia+Eq2bsC1TB5JvEBx3DTsuYYKTzs6sdwGUZOKlYuohSrbGPpXMBkHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1rWWMHv;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F24606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1rWWMHv
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3be948e60so28755a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794899612; x=1795504412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ig6VaSgCXuiuyN2YfSP2KMmKdlCjFPySPXtFnYMWLs=;
        b=G1rWWMHv6VX/0UMZ88Ot2OKrwHVwh54/9gmnsJm9QoZL7188FIGTBnomhJYBi2bXWM
         2peV4WGkUOueznXtCL82I/FPana6pobYDz/aFOqZrxDpzhiwfshQ17Gf7g8Rk6N9kIit
         JSxOcISaJ4tPahozpRE9doXv+WP39a7XNDFfFvG6iyvs83vCUdDD4hlzbLQCPuWJjxBh
         95KzXKRlw/wt4JYYajdYTbhjZnINaaVHEUPhvu8UozczXDJ4iQxqrKgUKY1WQPkrs308
         Cam7Q+744i5YhslxuZXW6QlHUNbLtf53A1+WxQkZlsDCezxdkVCp08nIOXNpcvNE4eY6
         DiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899612; x=1795504412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ig6VaSgCXuiuyN2YfSP2KMmKdlCjFPySPXtFnYMWLs=;
        b=BZsTw0d9+v2uhcO7bqcppQ9rmwmJJ+mX/akHVzF2WU41ueD/vHfaI48aXez5ne3Dxo
         rChe1O+X8hFE9myDlKf0CalaYs6LR5/ePH0BT3Iog7s4zLF2uUqUkFS/VZciJjTLwV99
         NUiYps5hiPyl8UiuGMqvVOvsptu/2FpThMcCeOrS50wvma1eVBlaBHZxdI1OcJsrm9Sw
         rJDofaUdeibGSA91Q62a3L5h4M1xaPSb/WUVOBeeR+Ys68Y+1x1+N5Y6acLj+rssKPJd
         EZTrdNF0I91xd6qKV9L5nR2EWZlhQhaQGwEZY8Rl7cRjX0cAz9Uxw36Nk1RtMcwBGa0b
         Dp9A==
X-Forwarded-Encrypted: i=1; AL+hErHxoeh78IG7mAPLwVukoNk9QM2qHarDrEh2q4OK0DH0MMn0H4wVzicc15vN1EsK0R7PQRPt9dcouVxtZy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LXO1ZFEBbtFt843CVqavzkHsiU1sNeVIdjbQp0S7v1Odcou0M
	GiDVWES6YuM4ExY/7tfpzgp5rRTHYae2X40zpMYPvPioz/l3+YxMvtMO
X-Gm-Gg: AZFdTZfU7vJS/uLu9spiXqtCzxCOqTacHzUS6RMA+Is7BHMBTbzR+zQKLLJXIlKo+bx
	V1KDv2l4QP1asgCbP74RMpXIBBxhf+uQpy5CitRxHadu20ne4cHlD3BctqVwGQEb0znrnt7Fb6K
	nTa6R9DaO9kODusray9oL9vSoQEL/GT95edueOnNij/V/mD458WXbB/N9hGPJ48lEjfeIGphcFk
	aFD5fuDAYysALZjSlwNOzkdaCkidUbr2Oh2qJbh3NXeIHhh26eVjoikb3T/rP+TRfmoG04/utzs
	Qn6MhRLLxi3miPILYfJ6dYFqvtuPksYufiAfOgesjM3ZXdSQxtWhlq+fbZS/rlnn1t7kSS2d7GX
	jl+bJzaquusGNcpMgjfZEfQw8JPH/9Z6V3H1mAcrN45saRF3E5CtgerC+5VjFbhkWX0mqXvoO+w
	aYlK0+RrQDQY+ElAizZxmpaB9lNL8dvC/n6g1RGTY0+8BZqs+2qbvFz5AAvQkVexIPBt5tTJR7d
	fT8xLav2Vo7CaSzdvEpoa3vWzSyG/u3rJLJQp5ahqCol+40wJukhctpj4cubLogM8Wv3kUorytc
	s+DgAlshfFzqAjzAR3aCD2CRMMo=
X-Received: by 2002:a17:90b:5687:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b1b0a407d6mr12704650a91.17.1794899611999;
        Mon, 16 Nov 2026 23:13:31 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2550e1sm2581347a91.3.2026.11.16.23.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:13:31 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 8842A4240780; Tue, 17 Nov 2026 14:13:27 +0700 (WIB)
Date: Tue, 17 Nov 2026 14:13:27 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Lincoln Wallace <locnnil0@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux@armlinux.org.uk, kees@kernel.org, will@kernel.org,
	linusw@kernel.org, f.fainelli@gmail.com, catalin.marinas@arm.com,
	joe@perches.com, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: Drop outdated links in comments
Message-ID: <avv-kYJ4PGgSnaad@archie.me>
References: <20260718175114.1404471-1-locnnil0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7iwgQdVqEyoHJMRV"
Content-Disposition: inline
In-Reply-To: <20260718175114.1404471-1-locnnil0@gmail.com>

--7iwgQdVqEyoHJMRV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lincoln,

On Sat, Jul 18, 2026 at 02:51:14PM -0300, Lincoln Wallace wrote:
> diff --git a/arch/arm/kernel/hibernate.c b/arch/arm/kernel/hibernate.c
> index 231a76af09a0..5bec408478d2 100644
> --- a/arch/arm/kernel/hibernate.c
> +++ b/arch/arm/kernel/hibernate.c
> @@ -7,10 +7,6 @@
>   * Ubuntu project, hibernation support for mach-dove
>   * Copyright (C) 2010 Nokia Corporation (Hiroshi Doyu)
>   * Copyright (C) 2010 Texas Instruments, Inc. (Teerth Reddy et al.)
> - *  https://lkml.org/lkml/2010/6/18/4
> - *  https://lists.linux-foundation.org/pipermail/linux-pm/2010-June/0274=
22.html
> - *  https://patchwork.kernel.org/patch/96442/
> - *
>   * Copyright (C) 2006 Rafael J. Wysocki <rjw@sisk.pl>
>   */
> =20

There are lore links for these ([1], [2], [3]). I'll send a patch shortly.
Thanks.

[1]: https://lore.kernel.org/all/AANLkTimmvPMG0GFEXfgFlXgC7V4dIWmW8vEC5gegs=
KSE@mail.gmail.com/
[2]: https://lore.kernel.org/all/1277908081-17195-1-git-send-email-Hiroshi.=
DOYU@nokia.com/
[3]: https://lore.kernel.org/all/5A47E75E594F054BAF48C5E4FC4B92AB0322A8AACA=
@dbde02.ent.ti.com/

--=20
An old man doll... just what I always wanted! - Clara

--7iwgQdVqEyoHJMRV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCavv+kQAKCRD2uYlJVVFO
o7ZqAPsHovBFDs+Y2+Zr2bvgXMVig4hsWRvRoQjn21bPeJQVHAEAikX057N0YNVy
VLGgpl32CfgV7dgSy00s6p6a0ll9kwY=
=e3m/
-----END PGP SIGNATURE-----

--7iwgQdVqEyoHJMRV--
