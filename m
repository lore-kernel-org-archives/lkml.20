Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206226;
	b=ojjVcq+3DtTymBdgZaZ0eoQj57wTKAbo2nQ2ln1TeDCSLo5RB1VbjL4inNeZpGjvGhcj
	 /JOmouJOZPyVlbRzJtpz6V2hUWCN8h0mESc5KyhpNcH9+1r1DgvEWqQ/wc+c8Q5mBeL/a
	 7+1kOQjlliFgkyStcbl6KeAsw2dj5yywvbLAY1P+zHeVclQhI7RnF75Q/rpM9CJcCs/Cs
	 BauBZ7eSC5OxbOmUFSkwFb+AEoxDTDgfZP2E+59ihnVrPskCL4ddjnpMD31x9KCTBcHee
	 1/IQ3Z762BeIpd1LXg2QHvVi3CmvPKf+Y6opN9SUIf6zEYA1DywCNpUMXlK0vzMbUDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206226;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=hb7HGbX0oSahgSBh/HsCEGBA4WObvvoSCDVjmlK2qNw=;
	b=sodwsHrXSA6yaVkXX8AuXDq79wmXD9JvG2dNFyeq2Pp7bJl4ohgEh7XFhJFMwCsZKdz8
	 /V0PWszLdNTby3GKVM2DB8zBIUC3vM6Ji99ikh5F5Ei478v5Om7PrjDVZNhiejdnq5gqX
	 y/VE7u4yubr8RssPhdzAYl0B3dKFLDDMnymGfFVfFJoYvx5oouE61XIG+lhM54/3o5mCP
	 Da8AIwK3gbiXAxr1QvSvPz+d3XYC1FSDwEDl1NCeuCcZRZc3QON/E1nffuuZZjmaaq2xP
	 fI9HQG75Yn0pxLEi3cLDxT+ILDXw0T905UhB+b+emoQ9ec0RGp6Pgu2MR2Gc1pwj1LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="g6rah/mK";
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40524606A333;
	Mon,  9 Nov 2026 06:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40524606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=g6rah/mK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794206214;
	bh=hb7HGbX0oSahgSBh/HsCEGBA4WObvvoSCDVjmlK2qNw=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=g6rah/mK6KBoD8DmJY1akr2MCJ1A68KUfmJhKco2pPK7Mf9lsssq30umSZ3TgxU2A
	 0IBF+kXhuMwjxeLO1oZyMBu9aFr8ZOjtBuIgLdKxm2+SlxVWgAyIQc0WUctokodvEe
	 gUpAXMCzrklvHgXEeC9gBA4WHZKC93h7+PiBe2Uk=
X-QQ-mid: esmtpgz11t1794206213t932fa143
X-QQ-Originating-IP: uNnEt3FdwN2rX55aSzOWdv/vmKtzNzVEL643pzBitQ8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 14:36:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14632916415313039984
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
 boundary=78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 09 Nov 2026 06:20:55 +0000
Message-Id: <DMQGOJQ78RU7.NI4IASG2PBGO@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033348.361452-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261109033348.361452-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OW4JKxETGMY2YbRRUWOWCmuWkUNa/4t5hQ3X5qFvm+xiUv1WhrysPjMi
	xGx2J0qPc+rtR9MYTIqtY3X1g/VUAp3tYFG/MFq7c5PLx3lzOYaNqyZetjfSSfyCOn0BITm
	UhGSSHg4XVWStpQ4DT4LTP4RCJOEXYZQBg6L6MAhEvo26xuhi3TKcbHmBGxXermDtgWwKPh
	cyWy2mislgE2bmGc7P5eDw7bQ/UslToPMZSah6v9EEiW2OWbNLYqa0YIOtC+HcPgGRycjs7
	qxrFsyowQKOxPAEMBr/tRpnqrIafbR4U9Kl7qmVQkgUEGFkAag2CxlQVPz7DSuf8qp28e6X
	ALw8AstpQ2igP7FhRPIvzuiIgzbnO8TijevtfhP8xuSCV+B6VL4xmp28D20EywBgxTW3Ki6
	qxr+vAlai4qFCMPQqTW80RGwkiGgEdfbZAq9bx3hiSODUFunFShi14clMC8DZQe0cODWGRP
	qMJpCBSD4Jn98r5gRRT7OHuOJzbZPVlFUthRj2L+7JcjHuTAISYnj9At6I/qtK+qU7PwZuQ
	OdoaOPJ3PnAFrVBxnzkw/YM1+KKm2j8A63jtMObZimtvZ5Mirk0jMruJYWW/8SQevDfTuQ1
	IoC9+Or5qIwuYhNZUsczPLnvbY6zYOuiZMlv3/lxR/iIAyFuTN+0It6jEPp5Vp7SNitAJAx
	BLtXTvRZzcyQHvyDOrUFy6xfgdBIfYXd612LTBazyg5+vEaE51fkaHk3pzyuPdvvX9Y3tGv
	jVjcp6KtrmcxGGBMJGQLCbHq9tzHwnnroBKpWddHwpx2yMl0eUh8Gr+YHW/67Zb4POvd2c7
	twLlfN2SDSnFFtBjcAFomrzYCPM5TY1XYmeIKgan5zK3LEi7DFh7d6MF6kLdJyPisBZrowR
	DPNvFQCLpAo82XxSd1db4ODVUG1k+D3eDR/o91GrOpNt9R3tmKC0rmOwx1KffddXWvviS+u
	lMHvLus9LuxhTRy8SgT3+bzHnz5LMEFZSLjlMx2a5+5vLNYFjP2oaO/BRpGEaGU9/pbMb+g
	S+Xan1t1vNFroNGp9WK6l2D5nJvL2aLZQA1xRpePIBX+42UtrsOvdKOm/oIYmZPqHGTH+ze
	95NP2n1PTIs
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 9, 2026 at 3:33 AM GMT, Sandie Cao wrote:
> Add the device tree node SDHCI-0 controller for onboard Micro SD card slo=
t.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavFmRyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8TRQD/QnNxKjP9gh5K
HAnHWjTo2zHzwTp4TNY9rvjpSYQ9RO4BAOY3+m+hFCumO8ziKLwAT6WNAUI+BNIs
sETLiVSYc0AP
=OKWu
-----END PGP SIGNATURE-----

--78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674--
