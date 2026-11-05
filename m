Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841594;
	b=Bsb8JbCPWbH4A2PJJLsfpE1giKmHL3DZVeQnlpCQReUnP2/6vNtQmPShFqEEVPcjFGiQ
	 MOlAu0hHdXseU/T5YPsvm5TV/BQTVV3TREROnWCUn5QpLtLa6Lh+T3JxL4gU/X4YSytZD
	 c1Fdf+d4bTY4AOprNv4rBCcWbKOtj69KV1t5dncNxQwn0VKIuVW9SESlBkV/UtbrvZ3Xv
	 WbEidB0Ef23g47RamEcJKwP6tvx+trkxm817/ea+gxzVVrgnys/t4B/ywx3vIXcRSIqc3
	 xAruI763wKZk1VgdGfhoVkeUskeil/soBsB/qHbSOoneCUqbV8j9UU+b8TO1VFfKRSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841594;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=qg2+dZF3TjKEHvPr7q+CoS4vmmGWQlhmYsqxlyiBRfw=;
	b=UvIc2g+6vNyT38H4nc7i1lNvN5kRB3wFaTTlMAAtU3nd0nbYSlxuNSOOIGL4in0TADLl
	 6Dg+pprwJBkahz1NbIeQU4Ct3yr/Euf3EasbVQbuIXuzef/ckSdJBBaggKc+7ks5kO1Iv
	 kSKUz9sdyTtUh8o9ykJM+EcTNwUUArTVzMlQYCNfy7eGFwcITdnN8/r7vtiqc1EMGKQeu
	 NF4/m12xkzCh7hIkVxoBu2ggfstQbMxcYyv8s/nW2BxyMfYak05qpJC+9hgxCmsIJFjH1
	 bU7kGWgNmDQiBTrZV6hKeKKlznsif+T8MoCrH7kJxdQOxdyeKsskRCDnJSYVf0IMzTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6B8606A31B;
	Thu,  5 Nov 2026 01:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC6B8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793841587;
	bh=qg2+dZF3TjKEHvPr7q+CoS4vmmGWQlhmYsqxlyiBRfw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=VV2k4dof/jU3tpPXeLLcXc88l4hymqTtXWhpTdPHJT9VseTmTRzr2ohyTIg16NOot
	 NzEjZ4hCm3xsTm8RVM5LSbJWmMWQEfEeRbAbkdbd8TqiGrr39bOlnZlneqXvr99pHI
	 8Q82csGSDnW+R9I0q8INw0WeBpfeHWP64Rt49ycg=
X-QQ-mid: esmtpgz13t1793841586tce477b9b
X-QQ-Originating-IP: db7vP0PyT1iv0ktdaH831sO646d7fHC9DdZ5Je/YyqQ=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 09:19:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 394686068405469888
EX-QQ-RecipientCnt: 14
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
 boundary=2980ced06dce2ce2ba54e857a1b9e298e4eb13b22897ac4ebe45f64efc24;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 05 Nov 2026 01:19:43 +0000
Message-Id: <DMMVRQOY5TBN.J0PHJAAZSC2F@linux.spacemit.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
 <20261102060155.100679-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261102060155.100679-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OZsapEVPoiO6CysBWbheExxOP4cCHLxJ34n2xqQixQ170frSEKKltw99
	deW+mD8REj37AlVlFArSgblpns9yP8QVCChwffS+mz0Urjc4A2PZXKPR2cSgvKwiRky4OcQ
	NM0PzM77/ay+nnlvchbKuTyj2ZJ4Z3qhNpJWr7oxxlHyl5Q6wujnKe59wMwhHq/WsVQzJn9
	OdMr4IdxGaGDF67l7nGCP0AuNomJ5bg0IKcthLbXUQ33CjaSeI4JXWJ4dF4R8gm59xdykP6
	qQxm1qnfkS9YryM84bPsy3XXm4oxCIDthtUwra8Qs6M3XAE0fi5UXFxZWWw58wxYGaWf0Lt
	pR/3bi1Cbxpov9/FLj9VFMVOsDOaSTX/FtiMoqTPrK0wlE6zCCCRjQCdGj3oUlTejM1ynLe
	WuWMNKmTnrqAenO/qOQpJky6yLfWTXr3+8UYiZoLhyXZsnxv9soOrao8Yv8jUOYPagVKbr1
	j1QKxaJYdhYKJiLaucSZnUhtkIVWpE4XJfQR1D7Uyr+EbD37oghckBMtPZdekvRdnEacgpx
	WhlG1STbDAY9US0Er4sdkg0ZRpR/bbq3iYbWBWUiLRwZOFhCZFvfr5PTSb9Z0/VV/jdBcjp
	SmFtOJlHLw16ccYKb8n/sMgyLvlIdZvAjwFevnJ6M4WExRI8GH1XVAiHY9Vk69eSmFvtFNA
	AwcxywLn09McHKGmWO62ojaPbQvEGsJSLoWPCGgLYBrSQRkk20hQWpHzbf/UnCk6+tyl+Qj
	fbaHxJkLBD/Ioomnu+ZnlpgakGThs0tIMYN6NRK/G97YJbxPYyzWiAKfwKIRT+kCRwrAsGV
	/mo7lBEevQEw10ZWoU2uqbuHCMnp3o6XSQMbvSYMThOZlP3CSsRXLXr+YnfSNck71wSDo1Y
	h8SiCJCMsRRYmU4aWwf5bSWueg8okGshBAC8gniA3PVgXXuUewBA+jSEUiGBstBJizURiB5
	R9idTsQfVENpaf7wRsW70RpwEArr1OhTtnLjneAMInVKk8OqsEuFDhM/A0/L1CY3I+VUxdZ
	tiFGpVZ51GWuarRRzqKjtN2eDGjsF+qmFBSy8EnYoCuTlF+LEdNsewy05LEyJPdgxE3ixM/
	AT6Be3fFWKS+Z4zSpXLyKtZSCCZmW+EDI7mzqMT4dVG
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--2980ced06dce2ce2ba54e857a1b9e298e4eb13b22897ac4ebe45f64efc24
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 2, 2026 at 6:01 AM GMT, Sandie Cao wrote:
> Add the device tree node SDHCI-0 controller for onboard Micro SD card slo=
t.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b=
/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index 84f66dd8f962..4471338a9774 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -184,6 +184,28 @@ &combophy {
>  	status =3D "okay";
>  };
> =20
> +/*
> + * Onboard SD card slot:
> + * Plugin/Plugout the SD card before power-on the board for secure.
How about: "Please insert or remove the SD card while the device is powered=
 off."
> + * It works as a boot media. so set it to non-removable.
> + */
> +&sdhci0 {
[...]
> +	non-removable;
[...]
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_0_cfg>;


--=20
Troy Mitchell


--2980ced06dce2ce2ba54e857a1b9e298e4eb13b22897ac4ebe45f64efc24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauvZryEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+r8QD9GxMgY37x8+t/
65Zh+PW3tAkCJ3fBNtdrazmtjmZmGfkA/3z7vLcrPG1IZT0PxKH+NE7ixhomH0B5
aWKFU6efMCcD
=Xgv+
-----END PGP SIGNATURE-----

--2980ced06dce2ce2ba54e857a1b9e298e4eb13b22897ac4ebe45f64efc24--
