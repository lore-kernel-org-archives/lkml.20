Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A090451986
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723841; cv=none; b=DPSJklNmwEdEJY8YLHjtZrMLjJEadS2qwiX48F79Fsj0zp53vh49e5RbAWJ64oUrZqLyZqayXEhF+RepQYgTRgApmKD0/2FjRHMg+56sTN4Sr19s8ZW4nD4I9qnRyNnTJ8X2vdTE9CSplBHYMJbkupM0iwmiv9UF2gm85wtEfQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723841; c=relaxed/simple;
	bh=q+VC3HNscJRAYLwmC+AlOcfIPsopsHwBlJvq37zCfKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqUFp/iLgeODvY6Ctx6FkM9b+9zcZ2Uyf6r1McpDE2pTD7m14MOEQdUO29nOoZSr26u3RRZldQCJRLH2l15ial2FCfqNYxA6Bku2oGStcEWoSbI9e2WnirxOHeNAHiTyKTfrWdcTv4+5NZpJf9nSKlnSQHU08noj2c/J6vbxsis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaBsUaDw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaBsUaDw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so6501005e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791723836; x=1792328636; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUUhsclM68Xjsn8h8HY1t1Xbm15vgk+qa6obR6iKY2U=;
        b=UaBsUaDwWVkzo5WCVqG5RALoi+cdvQyO9AXs/2fpXcYy/dLYDlfPH052uw8mKfDCjz
         1QlFEj6ZajJLc0iDmzO5wmWYWjrYFgdQU8ONqZSNMLQtmLFUejwdIR6qh8MVT9EOGRVi
         canSeBuDhs4WvVRH0VzexfiQyM/cDLG2/orBK/GC9yUcjH1DZfy2JArwvE6bM5rT6Z5r
         IP03F3U1W/WWTcusbLjOhSyZQdcHJqhJ/baOsms7TwsY0chqLG48zOCQVOpvQn/AYZ5V
         oiyL6JuGmr0jw2Mfx8/Daj7SkUx1a6KhczRzekt63iVFgFLhWdUd97SbwgILJnz2ntUc
         2RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723836; x=1792328636;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUUhsclM68Xjsn8h8HY1t1Xbm15vgk+qa6obR6iKY2U=;
        b=p7/NSuBeU1h45VsBmSxPOxOVkkGWUafyMh37DI358nObk7jyjN4nFUvaDnx9pRiTmf
         +7A0jnOic9Zmfq8HvDVm+5CCEoRlpml7aT5bos3gB+rq5QuT+mHY24jZJkNCgQlz3E/a
         KmZHCPxK5xRFS1LcQ1rstFoXpdv/ronzvtqzapBug7qLe0I33P8KB62Wwf2Xuhy/zuuj
         1ykbbVf6n+QOlyt+a8BLm1Nv32u+BDvl6i7VHT7qRjzgIN7ac8T3EiFj8L/GLev0tPpF
         IxsIBW1es/HDGzNTI6VTiKxdg7Vf/prleJ99H9vc17ZUnRULV+EyLfkuktCjo9F7pTsW
         vVcw==
X-Forwarded-Encrypted: i=1; AKwUvBzyuXecOYDSrPSLXyGcwOgcGeEk4Ku8bSyDG7hY0vHTTkL4RQIaeh7IjymbXVcTezCNYXvappN8JtoLg88=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZrpDuN9OJ+A1/QZQlMWBy8e+O3yLyueyybzeTzG1hHYk1IDYC
	PpuswXA1J8ONDj8gaiZG+gvb+EPXkfWpBjjvtxsNORnYhJ5XMYMeiUVj
X-Gm-Gg: AYBFou2YdkyDIKAweB0tP16RHupPmWXPgnQYswEkZttGKP2710tZQitwackOTQmUSYJ
	Vd89bYazIkef+JhBCFKJDMC9Ue6IprEzVGBqzs7IT1NlyWyYGxJ5MYVyDRniqJL7j5aenolSt0d
	IHSOO4R9yc54+wN4rZXYpEIDElN+Q1iJAGXpYLL9o1IldKCDHcYb2ZLXUi6THaq2Ke9iGu99li2
	0rkye+loKsghyRE5PxGkIh2svIDCJgkNXCI6ZgLvMFPJS2G9LOsIm7P+CSaQUgJ3IcRD/k/khOA
	FhpKzQvMBAsty0x53JNKaf4Xa28kJpcYGw+2qElSfhZbYzAplSBIEHqYFam7dETG4nJ8jcCNX4S
	CCwOIHUm5sA5CxN+rK+LDD2DVCZafSoxKa7XTrpyyYv55H+JUVDD133A4psA1fWF62l+X9aD9Is
	H0ES2qtZkOtITvZz7GTDzZKB4wAde81UdUfeLz6rC8T7tISvWBRnwOa/RNChX+G39li0jS+Y2l8
	azhA65Qu6gTa2YXpYnj6x8lJdgjWyJfT8GlYbFPLDe7Gly6iAVLHrPY
X-Received: by 2002:a05:600c:6215:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a18e4ca157mr109610335e9.22.1791723836253;
        Sun, 11 Oct 2026 06:03:56 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm243456455e9.7.2026.10.11.06.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:54 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Sun, 11 Oct 2026 15:03:43 +0200
Message-ID: <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
In-Reply-To: <20261010130024.177503-14-ghahramani.navid@gmail.com>
References:
 <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-14-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartayMeA89TTDyMHsX0IsJQmw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartayMeA89TTDyMHsX0IsJQmw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Sun, 11 Oct 2026 15:03:43 +0200
Message-ID: <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
In-Reply-To: <20261010130024.177503-14-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi,

I can't say much about the substance of this patch as I haven't dealt with=
=20
PCIe before. What follows are just some gut feeling comments:

Am Samstag, 10. Oktober 2026, 14:59:51 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Navid Ghahremani:
> +static int zx279128s_pcie_init_crm(struct zx279128s_pcie *pcie)
> +{
=2E..
> +       /* Ungate the clocks */
> +       ret =3D regmap_write_bits(crm2, CRM2_CLK, port->clk_on, port->clk=
_on);
> +       if (ret)
> +               return ret;
> +       fsleep(50);

If this is a clock control it would be better to write a clock driver that=
=20
manages the crm2 region and exposes a proper clock handle.

=46or the phy parts that are part of topcrm: drivers/phy has PCIe PHY drive=
rs.=20
Maybe one of them happens to match the hardware registers, although that is=
=20
unlikely given that the registers are inside topcrm. Either way adding #phy-
cells to topcrm and isolating the phy controls in a phy driver would be bet=
ter=20
than having these two syscon controls.

By and large the zx279128s_pcie_init_crm has a bad code smell: It looks lik=
e=20
an LLM translation of ZTE's code to me without understanding what the=20
registers actually do.

--nextPartayMeA89TTDyMHsX0IsJQmw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLiS8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiSIgP/2QBvIWwIVHmKwhmCg1p
GNxlKYheuEN95hM+/16s9Z2ZB19AJOH7rqbpRDkBHcnbRm9R+LVJmnbgDpd/wdis
F9ISmIuQA3MqqlCnUcqDQtFnAELUsxTgyk84j6Bzf0j6un4ch5bkycPs9QJvWLpW
9zsbHJzNhf//uv5WrtHBvO+vPTcJeSWtHr9/MjAIAgPQQiFsVWZ45xOeEaR5mApj
DbwtuBM2gkPdgGZ94rSLawNd/MklkWQOWWOrQf0qb6jyOVmPA0IU54uKUeCaStVH
xMmJ1nu8EBEvzyV8v1WlG3HjonSPc/SQRLv3IBD8cBKFFvnROuiXGvk70aLVg84F
tgFyWcjvrTQ61+aCnd/Yf1bFLKtwnMIjv/eMpUtceiZWwn0XYGlgCKnsW7omre47
71gTg5e8HGHR3wAfBpNLXlxPTREBzQQ7bP+MNbHFdbuilqat9yIWLjEruwUWP5DP
+a+SoFZOWXF+6RtdgaKBaE9HxI8YLaaHjcPDKLVxT5HPKGwu17MO9zuoFAMEtH+6
zosoJ3ZYNXiZp2LIBpJ3UERoHzqERgqAp8tSXaHFyGABlVav+fItIz+YLCw5DVjz
8T4drjN/zl2lJCJj22+ywIo4CNhkRZOvJ/FMUgwPIcRUy2wajkOHWsRTatDa+RxT
nfxS2kfTtdCAjzhnXAtEZti/
=+Ytg
-----END PGP SIGNATURE-----

--nextPartayMeA89TTDyMHsX0IsJQmw--



