Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0A041A76F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832849; cv=none; b=lvzXIiwUUH3l3FSDS1vVZUyKGZSW4Dseap7+IPhBRXuBZlfMNBnO/YpX9vK53OTKO8fsYuzlko3nWeHcLm4JG5yaizljGKHGmdTwSkHrXw09ri1NNH2muQ7V4JPvUUP0/v0OWbvI5zEDkIUohJGMoJprKHNA7JmgjCC06sYQbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832849; c=relaxed/simple;
	bh=vua/rEuSC5nNbdHzcHkyGo/1ous9FXPDxfCyfc6JXZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0uAn5xSfzOCMrTerPyjefxnkXcJFZ7ku3bP5RkZQ33SzDoNPZtF2jCBWM5lESsPN3DGjvvgET9Gtv7zrKKkeqDSrsd0oyaFOy+7R7TORdlhb7hbjj72nnRrnBxOarME/KvN/IiPVwgKADYMCBahv6BXw63u9AUmWzPNC75UIeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHEuCt6P; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHEuCt6P"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a17baef589so18072555e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791832846; x=1792437646; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vua/rEuSC5nNbdHzcHkyGo/1ous9FXPDxfCyfc6JXZo=;
        b=ZHEuCt6PvjEj8lkG+bf1zD6rVjYF2pRJeLKZWeYrlzcKqlKzg71+HWv0zC/cSQis1K
         pwWADdp35cH5JSsVshS/TfuWEb5jzS+ja9c/7K4X24940mDSrTdL05LPhGNWkIppjHOx
         LlWTBZAmoUncRds27vuqw1qH08TKWcYuIRRzzfwUWn/5sW7O5TmQjOmf2NA8kzlNPYXh
         lwUT695jJdZya+Fm2nqycbzXRaMq4z74W2Ttp8VPTJQcmQEd1TFYKASmmhW7nD7CmloH
         4eacTnia1G1mRECnIJoyoO3y0gs+tvMslmzJtOPAFoUrGhHn6Y2B2haoSUzpeJ11G+/N
         mmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832846; x=1792437646;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vua/rEuSC5nNbdHzcHkyGo/1ous9FXPDxfCyfc6JXZo=;
        b=lA3/njoSXHBdCR3XQuS6nqIhLoDPI65F2x2MZZt8bUQhjhZhWaJYe+faZCY88O40mt
         VbxmcXsoo2xtHSE3AE61MNO8GEmSHyDBI4UTnGXLGJaGyPBzfxaPXgPc2vd/gW9cteUC
         gNySTWIajOlIVPJRaQ1cKyT9zzArQcVBXs86VV5dqKp6603zIKYR8dkCPkVpa/p0Rp10
         7xoxGn81i6ZEV/q0Hlf75t0I2YAKWyMx6DAO/28HHCnOa4hkqW0U38NKLyVbAtuAyR88
         FsWmzMcr76GpYv2thLctaSW+plq0BwUO0QjwUTghAAp8HrtQurmfYnJMxj9TL7N306kc
         rDAA==
X-Forwarded-Encrypted: i=1; AKwUvBwGQnaINMSOY3wU0YQn5buUqzsuhmTmq1+/0OXQt+cTzoqYBhvjTUnzl+u+Jy3EUC2r05ekHt1TKzk5jpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTe/h7OAyWA38iV8qchYT15a/X5P1l7z5sXgKskia+hsjjoq+O
	Cqk3DPThvHe+17QzbN5nZugoPJ5tmRT/8/pCkqZuczVMkBYMZDFq+vrX
X-Gm-Gg: AYBFou2aZPccVXKLxPl0iyjYuytRTLzWs81uydHFZu4DsLVTS+JR+qEQn20lXPqJQzw
	YmMsaBGWYnxoTlLskjt/ypmos2P4EfxzPfa9NivyJXZ7KB4EKsqX7mEsYU5gaqjTsVELB2CqS6x
	L4FpJr2lHHVLzecCq8+twMoXEJRmZKtLkHTBXOAnjKJ7V0rsLg/HjtOi34Hu6aggCvyAHWTGoNf
	EmAkrH/B+9xc2FRzMJPs2k/rQlHjWc9jfYrWon1c8/lmZfA3+1ia9GbMAYmS8mXk4Ww2PoRsbn9
	hd6F42vSpw0EHjXFk4U0RVonDlz7kUs0dzRjEEu+rMk/0FL1VTkRSd+VP4e2zlgOekEhniI8ag8
	IYYi3ZxJug/IsD5BWqIE+aAi46iMc549i8JsGej/LavaA2o9mMJS4MpUooK6+MTgFYQXTq5Rk2c
	MGG15xQT026ifG0hk89x3/xsD7PWDpDR7zvwo+IUY4i12i2mr8QPU+E4CIu6DECwGMDi5saLjo1
	lprwQN+6qdO02WKWIwQ0eCPGGfEsL/uC2HLhkFkaH0djr3hmwJowrHKnfmDU9ujY/Y=
X-Received: by 2002:a05:600c:e556:20b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a193fd0b12mr95118415e9.4.1791832846219;
        Mon, 12 Oct 2026 12:20:46 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm182472605e9.0.2026.10.12.12.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:20:45 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject:
 Re: [PATCH RFC 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE
 ZXHN H3600
Date: Mon, 12 Oct 2026 21:20:39 +0200
Message-ID: <Lurh_NpYS2qId-6ONmcWzg@gmail.com>
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartgYuGsmX0Q9y6iZp1YqP84g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartgYuGsmX0Q9y6iZp1YqP84g
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Mon, 12 Oct 2026 21:20:39 +0200
Message-ID: <Lurh_NpYS2qId-6ONmcWzg@gmail.com>
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi,

Am Samstag, 10. Oktober 2026, 14:59:38 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Navid Ghahremani:
> This series introduces mainline Linux support for the Sanechips (ZTE)
> ZX279128S SoC and the ZTE ZXHN H3600 Wi-Fi 6 router.
>=20
> The ZX279128S is a dual-core ARM Cortex-A9 network SoC with an ARM PL310 /
> L2C-310 outer cache controller, dual PCIe interfaces, a 5-port Gigabit
> Ethernet switch with hardware packet classification and flow offload,
> SPI-NAND flash controller, and DWC3 USB 2.0 host.

=46irst of all it is nice to see more interest in the ZTE zx hardware and i=
t=20
looks like there is a considerable driver reuse potential between zx27 and=
=20
zx29.

I replied to individual patches with technical points. For the PCIe and=20
Ethernet/MDIO parts I can't say much as I don't have experience with these=
=20
buses.

My overarching concern with the series is that it largely looks like an LLM=
=20
translation of ZTE's downstream sources. I don't see a problem with LLM use=
=20
per se, but the question is how well Navid understands the hardware and can=
=20
handle cases where ZTE's code is wrong or misleading (I certainly ran into=
=20
this on zx29) and make independent judgement calls.

What I'd like to see is an improved clock driver that fills some of the=20
hardware understanding gaps I pointed out in patch 7 and a pinmux driver th=
at=20
goes beyond a few hardcoded values.

Cheers,
Stefan
--nextPartgYuGsmX0Q9y6iZp1YqP84g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrNMwcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiD6kP/3dsABTCbqTpLj8QwVZf
wwDo+Mtm/Z6jC9QhNG1HcYuq1+/r8K2bLixqEC6uLbbFs9de5oZCiRsJmkLJPS01
1Yh1NXi4pc8dRoNMTmtsl3SfaQcHwB8ZmQd+ouxW2svc0cdk1knJn+XN1a0itXNC
0S0ocrBZZzg8f7olpzw78tEDHTmYnzr0wtzBS9PToG7ytdGJu3srIz8Cgv5TWJgv
2MovfWuhqhgKWj1aMns9LW5P1DnCpta4zEHEav7JNv7GKfUz5rJifnLVy1ILzqEo
6O2B9vQMDuh03vPNXSWHwper4S/8S64/loO2PeXluyiWSg6thjWrboVIBr09rdlx
VPAE8taO9xTT0DShNA7Fjdoy7rYrvbFrDK8FHcggcgt+fCFdIgZ0rdZ9qhaRX57i
udz9Sbm3Lhf5862HhJNsz6CpIwZflBNSyZqNSmyo1eUpMCTvMOHeDhKM4mFUsw7U
1G8Lb1BbmqihgkYC7NfMK1c7z6hxuIcUWSEJPn10I69hwy3XnP/hKOQGLMa/p8C3
r4V611KUsCMDTvnC9z4tzjypVZy0ZvjqLiWHexLMKSAy8MEhfvfuBPsmMoJTXGsp
bySs9usMYeIKlvJnDtaES9lvdm7K3umj8ZTRHJdAqp0TnaNi5586F/v5nPI5UjpJ
KV+ZXscQ3kiY3gtKRT/yJ+EM
=vU03
-----END PGP SIGNATURE-----

--nextPartgYuGsmX0Q9y6iZp1YqP84g--



