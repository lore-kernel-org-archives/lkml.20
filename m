Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26893009CB;
	Sun, 27 Sep 2026 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790543905; cv=none; b=cfsAwfvSwKj+72L2PQcqZOZ0IuaBeYvjDM8T3t76slIO0h5uAmaz/rOYVgRvl7UQUKQH1HSxd/GdcPVjBN6ut6jh9mhJugHqrAwiRPZqpqty9c3AcJcANBh0cJx9hvANd3KK0b6YF0sJ+BE/WeYVGlH+yXby4emGUn5KSXJCbcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790543905; c=relaxed/simple;
	bh=xCFj/xxiXd1WNuyxbAfLfrlA9x5UoRqcQp528m1GniM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dG+n6m1msE/gS7AUsHwUpUl9fQX9eORaCXtnCR6Pcd4IK4KvHS19lS/6/7cmHaN6J6TUAgpPvz4zw/574zTghD3+7WuntVscNRexeU8MPikZ4sQKk30gwknefnsU5vV+KX/XKXf+bAjPhEZggJ8L0m8F2hFZt+jEybOHzo1W+w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=Si+XEBRs; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="Si+XEBRs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=33MsHDwPKKkx+NSkez8Et2HM/X24ivhJAbyLs8SiZQw=; b=Si+XEBRscLmCml1/lRIrfwcH5M
	MI5OhSA8PoN9qtCZVS0OgnoqsdinGm8UdpAQNxfzwsjI4EfN9YT0h+y17f0At4B/LNVR9LKnEBSA6
	LcQeQHdxqns41n5OIv3N6Trf3N746CDPoRex/acXy7we9vM5BT4z6g8+PZzlVsnI+TXNT1JpgOtM2
	dA7pJbAweyePTZAp3mffCHHkpcItFPZo+Lc76jVbO0giudX8S8Oc/0KKeuphZ56sv9zyyFZOXLHTo
	3g8x9N22+VhD2ICCCFy20VaJMi4mO0Kdm4w8SYMvHuOpdPR6bbkB+fu2qAWuKd8X+cSn4InqCbxr6
	GviGGnfg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xAwGC-0000000DQ9b-0cFC;
	Sun, 27 Sep 2026 23:18:12 +0200
Date: Sun, 27 Sep 2026 23:18:11 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Message-ID: <armIExWjR43ar50t@aurel32.net>
Mail-Followup-To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260831044540.3304350-1-aurelien@aurel32.net>
 <20260831044540.3304350-2-aurelien@aurel32.net>
 <20260831045448.58B591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260831045448.58B591F000E9@smtp.kernel.org>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

On 2026-08-31 04:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Removing 'phys' and 'phy-names' from the base k3.dtsi breaks DT s=
chema validation (dtbs_check) for disabled nodes and improperly delegates f=
ixed SoC routing to board files.
> --
>=20
> commit e9dc7ad92d5f4a805cf362fdd51c6ae160da1934
> Author: Aurelien Jarno <aurelien@aurel32.net>
>=20
> riscv: dts: spacemit: k3: move USB3 phy to board level
>=20
> This commit moves the USB3 phy definitions from the SoC dtsi to the board
> level dts files for the SpacemiT K3 SoC. It aims to prevent PHY mode
> configuration errors when the combo PHY lines are used for PCIe rather th=
an
> USB3.
>=20
> [ ... ]
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts=
/spacemit/k3.dtsi
> > index c3f2dce0969c0..6f8d55eae6f6b 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -452,9 +452,6 @@ usb3d: usb@81a00000 {
> >  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
> >  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
> >  			reset-names =3D "ahb", "vcc", "phy";
> > -			phys =3D <&usb3d_u2phy>,
> > -			       <&combophy 4 PHY_TYPE_USB3>;
> > -			phy-names =3D "usb2-phy", "usb3-phy";
>=20
> [Severity: Low]
> Does removing phys and phy-names from the base k3.dtsi break DT schema
> validation (dtbs_check) for disabled nodes?

No it doesn't. dtbs_check seems to ignore disabled nodes.

> To satisfy the schema's minItems: 1 requirement while supporting board-le=
vel
> combo PHY configuration, should the dedicated internal SoC PHY (usb3d_u2p=
hy)
> have been retained in the base file?
>=20
> The dtbs_check validation will fail for any board DT that includes k3.dtsi
> but does not override the usb3d node to provide the phys and phy-names
> properties (e.g., k3-com260-ifx.dts and k3-deepcomputing-fml13v05.dts).

I have just tried, in practice it doesn't. I'll send a new version=20
mentioning that.

> This happens because the schema spacemit,k1-dwc3.yaml unconditionally
> requires these properties, and dt-schema evaluates all nodes, even disabl=
ed
> ones.
>=20
> >  			phy_type =3D "utmi";
> >  			snps,dis_enblslpm_quirk;
> >  			snps,dis_u2_susphy_quirk;
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831044540.33=
04350-1-aurelien@aurel32.net?part=3D1
>=20

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
