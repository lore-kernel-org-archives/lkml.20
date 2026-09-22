Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B9A52D2CB;
	Tue, 22 Sep 2026 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067359; cv=none; b=jnEJAdmi4fcOIqh61xr+mq1JCH2IoaEp/vSWJDhBKdNQp6CpWABg6twqF/1CYNIFFubNBu3XBn/Fu33LECq97YGQrNIvHwC5tCEzLtEkqLhmuOVHEKkpVPV7WLpfiXBFH7RgNr4KaBoMPcpc/XSpuQgqqWYvDnw7kfgJQ1LC01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067359; c=relaxed/simple;
	bh=oPeQ3XLuUKXRQWHXo4tXeoia+BrsKnr/qmeznl2LFN4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=JOuMhq+/kXsvBRG+u1upT0NS6Km7KV1hKSKU3psUoWCUaSKWAhbf01llGw4Kyy1kcfHNL604I2nPXMyhetJyoRDIPGacTuDL/31N/CVo6Ei35F8PGWMa2f+yongWTLGPpFG/6U+UHj2/tWSqu+jsrANyduyZkf6TSlzi11H9ZF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=QuAio5tW; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="QuAio5tW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790067344;
	bh=QJyVwtKSewGzHI+ReObmC25SE/N8bNoOAYhfVLfu9jE=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=QuAio5tWBhg+BdgaEvpzXWtWYbNDIr5FEnoloENdWghduZWQ7S0CaL0WkBn+PAWn7
	 qZAaSqS4SYIFw8GGiutUP2wQ9b2ziCunrPuW+uvx9R0LKUBJedEZmckB368D95OzJ2
	 0wwpHBiKHlcCNHhSP6M0UpAT/ybc0OtjPhsrQPvY=
X-QQ-mid: zesmtpsz7t1790067342tf3de2c6d
X-QQ-Originating-IP: S9iYn0j528t5SWdRrrbA6iz1oreq6FD1VOr214a9x/Q=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Sep 2026 16:55:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7129964714333372295
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 22 Sep 2026 16:55:38 +0800
Message-Id: <DLLPWUHF8WRQ.13YQTP32MG59Z@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Conor Dooley"
 <conor+dt@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, "Yixun Lan" <dlan@kernel.org>
In-Reply-To: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
References: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MdoRYM9mYryd1BZ1ldPzB6izSKRg2im7mqxBiWNbHGrPZsNsKD3+IJIU
	oFQfZvMxR0p67RYaQgTcKDcAMX3wSYCTH2YQ1O/MEahNNnOt6C0/X8ReJIBBp2BwfX42TwA
	xL/aAT75lTZWhnqxChEWsIomzjMxXj8mSjWGugFgCqALv5xrRECPRcDjwjK5sokJvFjYbnw
	Dqx7WmZBgT5b2oaemTqQp0peGQDP0LDT+tMGJk7nfKTMPbLTDmFkzzvx5Lxe5v6oL0Kon/i
	i0YZWlQ21JbcO8OibeUfGhmJd+T/OqH2SizBq9hz84nkF9k5Kqq85GMwd0AegczBVPLc54V
	lOwz2M9N8pj05EEB4f7v/36AOjrNdfupZ0ji90kdrrvsebIcfcN6TUgvl5Te24oaTvIBrIB
	TT3Qz1YFDNJmqcqU9/fIhYpkIPl3Ou4+rAEKWEuRJYd/HHEXYA4MeM/ng0VgdW2zFZlv2m9
	EZ4vK+ZHp34dph3EN/yKIEhQc8or47AND0jLKIe+JJNqi2hbcH1XVGhofop+ZY8TVZnZYt8
	xg6TgZpBi4U4k0hoZqaVIudGHETMZbIQfIGVi6TOdInsl+uZHJryA7G9SBBcseImzHzU6Gg
	o5WDhwZwtWEuJdaNFF7ZIUPA73zNyFnakTQDihd5+OIYQiL0DUSJ6kOMUAnfguqy5wTUtxt
	4tHgB7o7TzKJ8jAIDfKi/cHalp9+ZzobcMBg6yvmeSG7qr6+NW5nJlNK70qn5Pre44BLgVq
	B/iUIzYd7BeL54x/HDPEcTlY82WmpWJ0WabwhmqqYHvaaormOLzdkuCliCwSHZnBurpEtAn
	z+9LqjphZhuUOMWfoneHp0703hPc/4K8myViLVP3qXDDWCdgSReQQeab+is4NS4CJqk56Ac
	90ZKzA/DMRKTS6lyn7wjuqPMxP88iD19kv+QYZnAs5z4fH3IyMlDChvraI8D+LxqwmUGH3y
	EnJ3UpGWWEy9TBlnJGwyajQ5JXDSFLi18RB9YcSWtVnxKSVkmT3Ic6CM/p5dhQuabAke0qI
	nKDIvKwd4mBApzXUMeLmrTzHX1xdt0odbcYK5i9jU7MWkTXpXH8ahQTfV0dLj3KEf4a4RkZ
	Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 20, 2026 at 06:00:00PM +0800, Chukun Pan wrote:
> The EEPROM on the OrangePi R2S and OrangePi RV2 stores the MAC address.
> Assign it to Ethernet, with eth1 having a MAC offset of 1. Remove the
> Ethernet alias to avoid U-Boot patching incorrect MAC addresses.
>
> [...]
>
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -16,8 +16,6 @@ aliases {
>  		i2c2 =3D &i2c2;
>  		i2c8 =3D &i2c8;
>  		serial0 =3D &uart0;
> -		ethernet0 =3D &eth0;
> -		ethernet1 =3D &eth1;
>  	};
> =20
>  	chosen {

Where do the incorrect MAC addresses come from? Linux prefers a valid
DT MAC over NVMEM, allowing a bootloader override. Could we keep the
aliases? Removing them also prevents intentional ethaddr/eth1addr
overrides.

> @@ -66,6 +64,8 @@ &emmc {
>  };
> =20
>  &eth0 {
> +	nvmem-cells =3D <&mac_address 0>;
> +	nvmem-cell-names =3D "mac-address";
>  	phy-handle =3D <&rgmii0>;
>  	phy-mode =3D "rgmii-id";
>  	pinctrl-names =3D "default";
> @@ -90,6 +90,8 @@ rgmii0: phy@1 {
>  };
> =20
>  &eth1 {
> +	nvmem-cells =3D <&mac_address 1>;
> +	nvmem-cell-names =3D "mac-address";
>  	phy-handle =3D <&rgmii1>;
>  	phy-mode =3D "rgmii-id";
>  	pinctrl-names =3D "default";
> @@ -129,7 +131,7 @@ eeprom@50 {
>  		nvmem-layout {
>  			compatible =3D "onie,tlv-layout";
> =20
> -			mac-address {
> +			mac_address: mac-address {
>  				#nvmem-cell-cells =3D <1>;
>  			};
> =20

Have you tested with AT24 and ONIE TLV built as modules, including
network-root boot? Without a bootloader-provided MAC, Ethernet probe
may defer until these dependencies are available.

--=20
Troy Mitchell

--d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarJCig0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv2U8BAJ9HtLWnl55CiMGdaDRYSZReiOVteADUBzeJJoQK
JuYEAQCgs2kWGxqs5Ilk5rGt22lx7egm/u1lHicDhhiCJ7SiAQ==
=TcPt
-----END PGP SIGNATURE-----

--d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3--
