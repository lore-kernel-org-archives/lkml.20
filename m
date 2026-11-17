Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922888;
	b=3863CupnWGyA+vFQ64grQclr2KIcWWzithfaMsOUXFh3U9B4jdoU0it+r3ppCvng5Fe9
	 egFY99oLTHkBGUB9vTmsgYNIYCHSo975hhIOYUq2bNIJg22QKdOcWqsPIoQrBRpm7KKft
	 yW9r4Z24l4YMbsSeEBmB1BANDXbBElMTUC8Vv/a2qa0dBtNTQtx5r1srkEBZxNA1eeuw8
	 EktKwGik9yw0QwKW/S7rtIw3R4Pd+sxW3aZOvF/D30Jb+tCZHhiZ9s9wvWGfrjyGKC2RK
	 4gr+07Bc1/ni6CwET4koGkuTXpv6eB5pjQPWfZJmeYFFH0OMp+0t1hau2OqizlPYW1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
	b=TkvDSSpGiycoQdy1qSBSO0iSxP33bZq0N5YnPDCVVHNLD62uvjgShEEGuFYKAtIs3B3V
	 FFg82AitMAYz263eUBXGXZx5vFqclj4A92g6GKW+rbi7VIzgWLQPz07lr91jySmc056tp
	 3yNxV0lSuM231gM8kRl+yKJQ5n2r3WhYkAp+fhM2PZRPQEfTnRwTHNb1FukFYYOIahjLs
	 0cI5Z9+uiSStGntF5Nph2o8THlV8KcU2PtHEbule6rr9SZUsmEN86yzu4/ozHcPT7Ji5h
	 3UsDrW5qrCfo6GrJUVVtpEMVIXdOcoyGTbDWN87q8LCjiSRkaXlHCuTlP+wvcrKDqOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXZD6+bO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ECB606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39ECB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXZD6+bO
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so6017075a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794922887; cv=none;
        d=google.com; s=arc-20260327;
        b=YABIPc5G6NIvQZBDxqp732wz/S/WtFZqDMXw7VO83NnuDblgeZB6SdC3Lc3yQxCUGK
         Hjmk915enVWRXd/68C3JuiGAIYH8yVCPFaa8BbBlg2QDSv/UgaGlkXU9xmatGAumYx19
         +/gL75fLpUNAEL1UwJT950iDN5BkVyZ0b69eMMMHdE1f35bxxWbY+oBFc//3NEiX0Ru8
         X9ARKDI6QCrPqf3dVWscnjyEcsdMI2Ap7tl+WJl8vjmQHdY9oSwDlxCVacGtZJ6wmrpD
         dd+l1n0DEIyG1ZXGwQUBmeQHjXcSXFruZg5cHSypqaQ833vAuQ1rmqG4N8exhKqPAtlv
         YT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        fh=oxPawxL2m9ZP6V383gkLGRIEaM/x8hXyazxvPuXKXXs=;
        b=cnm+M8Uv1FeZRDy5y+c9EAbY9L0ktvqqUw4F8hMUMFmUsu/t/IVj0qUR22cc5+8jAt
         PqGgSeSd+X7phTSv/tfd0GT5zRwuZqxnKtvFHGaOkSxqqjs/at13SXmVKZkP+tBNnO/R
         nU9FvCWr4N3P5am7Anp/K2OMeFD6vdyeTzAx38tfJZgUg3DL50QrwvGUra1DUYyWsWYz
         tnLr7C8ISflIUiyQDLHOm1HAV/VUhya2FMCg0PkM9QL+066MYgPWro0sSM0YCFwQ+tT3
         HjKyTfjChu/RplKER3mXNTt7JZ+H5IZIFb5YgDo2Fr/nztD+x3L3U5DfqSWIhGHImDL7
         Pqsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922887; x=1795527687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        b=HXZD6+bOfJsqVWxCIDhCrOX0w0tZU6Qb/j1uDssVapw+Ww7+0R3+poAelpj8hd30Uk
         NRHXrhn4tct1eSaoNp46WjRi+tv91i99TN22b1qevYVL8cvYI0iyYdiFa5yTKzolgHGk
         8sMne0X5x8cIw0Bn+YjBIpGqXPeglmO0o3KddQI5WHKRGiS6xUDAvsFwtqDTgSDDmUSL
         MUkHm4nVBccOcAud4fo/vDh8WhsTW0pzO74y9BjVQkHMK8lO86VC/EoMAjY/vl22CH/Q
         ECbYDcJOPfeAOCjCZgumewFmNWl431+UgM8dmy1CPsxOhFPEuqJuAjaGLdXJ/yTGpMMN
         GXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922887; x=1795527687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        b=XmnLYtDxf78/iLqfprJPS7PfPt9zCU9VRrud0WG4O/LFLouoC+URgPSdUdX5QQAGku
         mDYBjKN+5ZEVKbd5PwtwzSL9a7nasqNNDP9R7CrieU+xL1z36RJ6vfbEFp/duklek4YM
         3tVFHMElSTJevRDsUZpTC9oXyae9FRfhT1+75tseOaESnLeGZQsdFBfW6BNiess7E5E7
         tjmmQHc064lJVSIRpZZw3Dld91rs9TdQgJrwPJUPJXGcK6fpnWUmR0ZME9AUc9klDeWe
         4Nzbin16WIWPwp2O0IBEplj3ep8dT267F+M7gCVaAlujrmEgQlLO5885pXChAD73yLU4
         kfeg==
X-Forwarded-Encrypted: i=1; AL+hErFaBD7gRV0atbPGnawJltQ6Yv/ENmJEBNH/4QVbawYkvfLWAfhLas4jbPPkUfjnYS/HLLdJWX/ZpIZZo/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bhj37J8AhvYAFqTJVtPYdTc/IlN8CB+LmHGrLZj8WCKe8tAEP
	pDqqX4wGP9qpJiYluHAKcIsWTcgY5zobjx46ZgC4vyGET+yoztx1QknNI6pnrZyA/64Khcv25Od
	a6S8j97eFAzhnU6JG/XCjpdfreluhP84=
X-Gm-Gg: AYBFou3pvD6dlBHciFSFgSfaV6B4mKIhw8G8rg1RsbgIeqw+qJ1z8MMUBdAQopbmoLS
	HaSp0tu7tp2c8oyiQgDPUb3nCSfbDBiQ77vT3QR1sYdZFTi6DxhmDc20VIx2f2IDdZ4nVHfyGEY
	3bodvERYJim7KlaZpFehmvrPNTaNS7mJXn6cRTKYeV/x1R/N8dEEsU4NgA/V5e5kqeZiBdNWWxA
	/LFuU89RWW7N0Geubw2YC9rJaEGlKsE9zK9LYngndHqSO4V4NX51VIUCDHHe5fzZ2DUEwSM7MNa
	I5x87MnkDuJqa0qIRM4eGPIgh2jZB8OnFKuHN5XrynrR5x5SewhPR6K2I75vYzg/Klw0+nSXeeo
	1YGYslLGOdMRJruS+tIi5fwfKOLritaw02nDxgw==
X-Received: by 2002:a05:6402:22d0:b0:6b6:966f:28c with SMTP id
 4fb4d7f45d1cf-6b7c0bbe6f0mr8200959a12.11.1794922886352; Tue, 17 Nov 2026
 05:41:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com> <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
In-Reply-To: <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Nov 2026 16:41:15 +0300
X-Gm-Features: AclHuK9B7NyGEv7s06EQ-PBXvC_X_ioRVUg7CDZFlHxN77tZjCz1y9ac7S-od64
Message-ID: <CAOPX745DQDpYh=PNQxDkH1DbfwMRwD8DV81TaX33mNk-9aX3oQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Nov 17, 2026 at 4:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/*
> > + * LED_COMCON force mode bits:
> > + * bit 2   - FORCE_EN (enable force mode for this LED)
> > + * bit 1:0 - FORCE_MODE (00 =3D OFF, 01 =3D ON, 10/11 =3D blink mode1/=
mode2)
> > + *
> > + * Only ON/OFF is supported.
> > + */
> > +#define DAP8211R_LED_COMCON          0xA00B
> > +#define DAP8211R_LED_FORCE_EN_BIT    BIT(2)
> > +#define DAP8211R_LED_FORCE_ON_BIT    BIT(0)
>
> Given your comment, this last one is not strictly correct.
>
> Otherwise, this looks O.K. Lets see what the LLM says.

Sashiko said only [1]: Sashiko has reviewed this patch and found no issues
For some reason it replied only to me and linux-leds.

I'll fix the comment and make v3.

Thank you.
--
Best Regards,
artem

 [1] https://sashiko.dev/#/patchset/20261117114432.2794961-1-a.shimko.dev@g=
mail.com?part=3D4
