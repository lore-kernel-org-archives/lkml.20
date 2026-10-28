Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793178912;
	b=uBaP1+yK++meo/sTzsIsQTS+ztmLZltgKwLL+TUX1AZoGFwrQSC2363xjCEFle7oBDL4
	 kOWLp8ICnQw+/u5c99Ch3/qPrCWWdh8ahwDxdNhVT/PmWGmiBLtHqsdB5l4cFpZ6RAb5R
	 FhWDNjrlJElnSMpgJHbU3/8yrnTQ+XeRgAPEAaIVvKYwLx3meWd3KmujcavHXiU3m0y7r
	 Kp7AGnkNchTjo66jsteUfrWcuRL7unq3eINTGNeO/+5hTzxloU0pKOfAfVkOEEGafBiIL
	 qT2Id54GrfjvWVF0m0uVTRmCCDBn96bqk+TOZPncwF1UjDdUIBWh9NpdHzCzDQyFv9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rgYbJL+97zD3vJtGPYNhG26BnNpkkQBqC88k+H4vZ/w=;
	b=yzHqCqc7NiSqTFgFH8CVbF77DI+hkmu3wUIddxU02LZYrnw+3b4gZqJcOs5pvIvAUVth
	 NbIynJL6VhGVW4M/sa+eq+dCcIOsTNBrd5n2UwT/qZS+78CWx//HlbM69mW6MY5Bxyct/
	 7vjkUSNwTuM9By/CMXdXWUWpRq2U+aIN9A6hgfhbwaOaTypFuiCADNdKdSp5zjmw7WIiH
	 /6+1nh8Vc9I8hGZHIVFUAPg1gkjMIiV4q50TTA3SOlAkfpDDaNNat1/jeUS1NDxmPyuHa
	 4sA/BtIqJDNZkMcB57MPEMgOiaxiLAbdqu6yTxTYe/zakaYeb3nMQkSORQMoLCSIdXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gxj03YUP;
	arc=fail smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46DF606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C46DF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gxj03YUP
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab395abf79so6186547b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793178911; cv=none;
        d=google.com; s=arc-20260327;
        b=o8MDu1dg5KqrfJ5zhYwlQJSZYjMGJQf3heUyYTIPRcPRM3BA0UWGkpGlf9CjJAyqlu
         wG6gkNgGLGXd5Yr/xkU9jF+PnQdVtxAk+IIs+o4odiLolIQZMJ2MdUhDS3B+MiJ5h+oe
         kfai7Z3iByi89S3k5neMJsrOAH1NdObBZQnIRhSPv+QKQmcpG2I2HshktHprLUzYHJVN
         uB1qr0uNoto0p/DJtBJKJ15yjvvijsbEOEv1T7RDMWgCTvZPGhGkox+jZfwFyhjdSAqb
         QvnFKhQKAa/yiznKlFDr+2QxmrWvkGj5lnJpwYqetVU+67ptdMPdOVTpRE/WYtK5xhlK
         u9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rgYbJL+97zD3vJtGPYNhG26BnNpkkQBqC88k+H4vZ/w=;
        fh=6Nix1Bu0KyUdLoxBBUZkrIfyS4+Aq+MROFzo1iXfwmM=;
        b=ZYiMCxHYY/3/xDDF9FNOR0TtY3tfCVJZWuT2K9iqPFA6MGS/Ts0SY09W5MepGcT4oi
         L+NdQcqBll0Nkeg59mwc3usSK/nXNTy29uFqVDmJo1GckuPEqzErZ2m7C7LZ8O5kdNbZ
         g2zHpw5ZxCs54wYqU3isubpFWSOTwmCfJ43zxqVQdqiIiHmYhaB9ZNClNuIiYzGQgruU
         IyHdvzbJg9wGBGl/Aq+yQDK/ziT/slbgYyacARHxoGca6C10cGkPMS0+W35IojK70WwU
         IOQ7oiHLUhTSAAigExcYHrDbViE59arn0t1onwnOpUmFTze1FYRUXPHARUvW01/R/CGf
         B6HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178911; x=1793783711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgYbJL+97zD3vJtGPYNhG26BnNpkkQBqC88k+H4vZ/w=;
        b=Gxj03YUPbdR/clqZg9tlNzk4d3ZlPm48KZ8974pRubp18iFQcXWVbLzGMZ6u4uYFdd
         FTdZaJlCZzMRd1mLk/YDrwMLcE0SblL89K6YM6BiDNmObL9jz/MD2c9uQEDZz5YLcjvW
         DwzFiguKXC0SaiWSEZMqmWYV6qmVmlLt82xj0Wk5TKjLybR/+9/JmQE/0ZCVdDXcpUKF
         l+Yp+AombyPUWFNEvm6A6SFEdq+BUcHsANU4HZlsfXOQQDqjcFMrDuHOI97o7rsslw0q
         kj2Yin2lv2Fcnfkfwb0pIvtEHtXVdT9/mzHt1Mazgo7inEGDfk7y0bzpJqdrtxa+qEnP
         jTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178911; x=1793783711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgYbJL+97zD3vJtGPYNhG26BnNpkkQBqC88k+H4vZ/w=;
        b=m6JYTWfTN4MsQFCHz51gtK4fyM5H5BNob0RqKek99Dz+zrLln9ij2bvppvXORT+ZRo
         NuYDGIoJ5GdDKAepfG/fxUnYLYcHFtMjpFYn2ahfPUPnSNy4odzS0YpHaL63iLs8BwyT
         ejoWNCnowXygxiv3M0pPnPJWLkij8Sd/hp/3/Uo+G0tdmUCpG2ile2j/vdOpxAv+j9FV
         uFwutpKbP6aYqGdY+tQltEhK3+DMN1hRKtlRbeq7rCvB4X5ABonpNcojUT3UJK0Xqbvn
         1zBn++0HG79kHY5X91rCtvXLDh0E3eUupOr0RNuthiZVetQDq35zy3FDAUUgPklU0EOt
         CT0g==
X-Forwarded-Encrypted: i=1; AKwUvBxLN9zn6bhU0mv/1IHm9pFlxiWdKILYUR2aB7Zj73pOkZ/ShclEb4Er3HI/CclxWLxh//fEQdzV8BLIckA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR+UKJFNY5ArzerHJljII9JLHtGsbY2NRlrqKNC/Hv2gsFkJ2q
	/CRLTOZqjV5rxtkohijAZVttvMGX73TstdoudMe729GRq37I4poFPajgCfSpoSt9WQwAcmC5O3a
	AcnkQ6YUyZbGAmzkMxC8dpZr6+SOdfAA=
X-Gm-Gg: AYBFou24wuFFMaSss6IcSDdji81hXKaAQId0NI2aJbMEJoCQ3Wmn9iXP+gH/M/4wAxV
	Ysp0X3PUNJQjPj7XI9wKm5SH4CU44SMmEyNAbiOQx81B+9BiWbCXKbbOTReGaXSKWw/tT7S819C
	uTywng+Fk3N0Zrh66vBztMtrm50hfMG/ot1NWyiX9smMVrDlvUyyWHxa7DmACQ6lMceKfUtb6Yr
	uS83d8nB2Sfk3xTpZoHKbN2OzPa7nvB+4b+mrcTsD2TBqqXCLgRA2Tk2dxlk/oYca1gGE8BNqF/
	QeeySesi8LD3DJLW82PPq0Xg/S7M0r++4FPUyG6IJochRtr29sASnREY1DSWYt4zZOErMYXNnIs
	r2NIxoJ/vTvq1hDrXeiKvnSqHtCoHsRNcY7ioh8AhGOUR2QNJ0Z8tNJg1VteZEq3zL1va9abOec
	s3cNjisKx9ih7sKkpg3qvQ5M9TLH/PRyhOVhgmSxZHjFQ4v/Iy5hJ61wjDOqGhdYiPGwDmea1z6
	Y1C
X-Received: by 2002:a05:690c:d88:b0:8ae:e69d:913a with SMTP id
 00721157ae682-8b1b59e377amr15297507b3.1.1793178910901; Wed, 28 Oct 2026
 02:15:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027202230.3539646-1-florian.fainelli@broadcom.com> <20261027202230.3539646-3-florian.fainelli@broadcom.com>
In-Reply-To: <20261027202230.3539646-3-florian.fainelli@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 28 Oct 2026 10:14:59 +0100
X-Gm-Features: AclHuK_Bot17NYe_eBrBNcjZsY2UOe2pzR0LYlP2a1aeZoUNFbGT_vp8woGlz-c
Message-ID: <CAOiHx=nC4rkmV_F4BLXj5eNYO7VL3epYr-F3ENGmTTCtvo00sg@mail.gmail.com>
Subject: Re: [PATCH net 2/5] net: dsa: b53: fix the SRAB grant timeout check
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:22=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> b53_srab_request_grant() polls for a grant up to 20 times, but checks for
> an iteration count of five to detect a timeout. This rejects a grant
> received on the sixth poll and reports success when all 20 polls finish
> without a grant. The latter allows a register access to proceed without
> ownership of the switch resources.
>
> Check for exhaustion of all 20 iterations instead.
>
> Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch"=
)
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
