Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794791448;
	b=1t+uLy03b25TU8AtL623ttH0scWkgaUng+njtcd12Jl830qerPnp752omf4TjhgZUOwo
	 VKjLo2tuOI6Odb//ObOQqBYiE6dV5QlPWMMHHjcBggIWY05wU318ozVZ80ojTJv01ZSlY
	 bJdog9MBviiGV01JzOHiOhhvqGJGxDEoLZR0QN71EzgwGJLekCAOr3DRouKVtaOCTjRiZ
	 Zc/jpdBnAgY2wZFcIn2k0ZkPERZqP7B0V9qBV0LoEyZu06G5L1LF3LmUrEtLgJ81+dLEP
	 kuJN2tpVnPhULecXuHSNTHpd2Z3SjnCeSawvm1jZfFKDIWvJMF/W55U6QgFfPccZ3XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794791448;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=o0t1BCCQjgi14aQO1UeuhL4GaUKuMi9CPoj6dUs17Ug=;
	b=PY8TQbpmP4dNOfhuz3urwOyyGwfup2kSb/4GMhmkxobvmVzFk4iRlF9Udd4iu3YKFJ3D
	 Cr15t2Uw1i4pIgRf/cTr4PrI9ydCFPGM3/D+8hGjl0QwvUNXkirto9B2OyDEG6XDGQMyP
	 JVu8FCa8LtwjBvlhsqUwZ23Ucvw6EXA8UbPj/tzW+kGJYonopJdRCsxDRBXYGCggfsjgB
	 fcCbUtBeFHw11CXo/blkwm4FgHYSvlftFdYuYgg/K81EpFzz8bbQ3TJ+QvBUSN+W0cdEn
	 iiBYVh/zDKdsLj8TZoBF0yhdsc2MYIPaSIrqHJUVg9V6w3dA35bEogWh0Z21Yq1mRUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=qitWkOlW;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65743606A31F;
	Mon, 16 Nov 2026 01:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65743606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=qitWkOlW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794791429;
	bh=o0t1BCCQjgi14aQO1UeuhL4GaUKuMi9CPoj6dUs17Ug=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=qitWkOlWfBdU9bGhaaK2M6cSURL7bsZj74NFCD+E/EZO63omId/9ksYG1iFQncG6k
	 HtEKNbkAdsg59cLnXw5072A9uxWymuRyfSEwYjWVcFvmAZ4+oP3XTr9bDEu3sogmIG
	 l8MoI8MVBQmB49z2IS7ilZWS7Quf2viVMMvNBTOc=
X-QQ-mid: zesmtpsz7t1794791427ta4f1aa07
X-QQ-Originating-IP: lObPZKV0SB4c3ZJUWTaC8LoQmT3EgHmskcCwWr6avlU=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 09:10:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18264630976395257449
EX-QQ-RecipientCnt: 16
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 16 Nov 2026 01:10:23 +0000
Message-Id: <DMW8GL86YRLP.1TAQ98YVMTNUQ@linux.spacemit.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Conor
 Dooley" <conor.dooley@microchip.com>, "Valentina Fernandez"
 <valentina.fernandezalanis@microchip.com>, "Daire McNamara"
 <daire.mcnamara@microchip.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MwK/4n1ZennpkZgC4cex3pse5M9cqcRJx4edKjIH+i82hIsmFL3mMY6J
	Cuepdds4QG9xRjLk/F5Pu2MVv0ZNq/lROpsTFdFhgJmmxhRlgoX+KxQZOvnI9xjFf06+0Cy
	tYCIQyaouICApupBRKv2eJ+n9HJWQKZUjwRwWlKVianzjjoCZS2I9FUHdsZ/S4bKoVeuvbS
	W3N58kIXgD++r1Z7Rz30LQF6fTcp1p8tmHhLKJypxa6evKTeTo1eyxSPmqMTTxuKOgPNBqL
	g5b/xAoMJq4O5bLX4zjJKfsDEl6BCJCOQnAW/53hqaR6ImTmZkZe29PoF3O1U7ZooaiGGM4
	3gpnqKowOApBxkszwef5yQ0UyXVoVFnHdbf5ZQI0d6rihEnq6uoedgZERzzOeIfd2O+hD+2
	JSX7oCx0y7mQ9entxlf/tHSgrKX1Lp09ht/bE9zJ/bu4Jj+5ycntGrVR7t50NIBYnX77Bpf
	G6cNzuUQ1Jyl8mQebrBLBmgPyCWAkhGDgA5OYwLWrC6QEK6TXLIsTypFlf8gtLfcgLEjlav
	JXJa/1DsKBYjcH2gPNLcuCP4Q0kCYNYCOms2hamKzdzchCsv9n2W9rYWRYmXeb7XK2oRn8V
	pLwflOCFaa0VY2YmmUs8Ie2DdUW7I+A5oxt0xFPP4XkQn5+Vq/RJ/Zs1FKu9jEJ/ZXp2WET
	OBLQpQZ7pEwHQFY3mzUCokxkU9nz1PV1NRoIeCH/tGW1YxXhVxNyMBL/ZYDROyga1dgAEr4
	T6ahtkE6d379R1jho5DVfcWBDFdOgFG2FiS+wzRm1p+ML9DS8r8+2urb6cfyCI7EI8ZOHHy
	5UJWhs05RcC3wayGC7CnBVE/RpfSzWHKmQjnGv9wiFnKj7PFJW6gAVZH/2zXHorFxtxrR53
	gDRTfGGvw2g/RocxArz12Ks+v31MjP7UJoeezKGeUzyzJz5VxF8OasatsuMHuVSjdb3aW7c
	ZtCxTcaPqL72966UUiaEKWjmYA0I0TFAnTjETd1oHYJJ0b3q32LboK2OUDwpzqdCYyy4lny
	JthERQEEiGoGoyUdsDKAdIUU+S9QxZzfICvYY82YaLsyCQsyBCU4lTOeKp9F+OQiE5kyI2E
	3VEdbYgbo5v
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

--d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 13, 2026 at 6:52 PM GMT, Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space - missing space.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 542bfc0d19f5..5d5f7f8a393d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -948,7 +948,7 @@ pdma: dma-controller@d4000000 {
>  				resets =3D <&syscon_apmu RESET_DMA>;
>  				interrupts =3D <72>;
>  				dma-channels =3D <16>;
> -				#dma-cells=3D <1>;
> +				#dma-cells =3D <1>;
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavpX/yEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9Y1AEAz3081/Dn4Mbc
v974nlcbbvDPqVh7978m1f3OFJC3JF4A/AhCMm4Su3LtVRzK32K68OxbxeZ/9a+W
x9XsPgs0ljYG
=TIPg
-----END PGP SIGNATURE-----

--d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81--
