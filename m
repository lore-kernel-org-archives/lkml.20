Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237624;
	b=TgfGZrOwFF5nv4N6CzHFroQ/n4YtXVXI5ymkgdfSgacOs0V+9KAghsS93/mtrl/AcYmA
	 wt5eSrg3H1IJuHwU+4NWiuzJeYZUcmc+VT6rJkrmDSEj0aoNtP1Wwu8TNfiHJuSNsJlqf
	 Fn3buIYejriE1awHALppbu3l6nJtvQkalZcUzxJXbsoZElNqID58RprTWeCuZy14pyY8m
	 cQpXwoQC/jx7Mnh71jVsFQoBUPtvP6LPDB+7t6R9bRyZvy3pokyj+9+18EF7q5+DeHmhS
	 nMqDDwaUm+S9f9wOBdC5894CQEWjQ/EfSd4bZjR9diX4RO78xteVm8S9YAlpRKxbk3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237624;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=vsIPcLDMIXTyEwRreAWLcBzGkN1NpY74ZgulLKfOydY=;
	b=TjM/WgvovM6/Tg0s2Pf1ttQDF6zaVOyFMZQRLHACwNy9cs0r45WJLudxc5KfDVbMBYXT
	 DnBjomo8JlUMciZL4zZVABJx/Jnd0GMMQzN5u3Xmd1S7HXNhgsjNZPS+Rb9yMAULfZOat
	 cOrCLXpR0a2K+sO8N38frI7MnJNBhRYw45sJRDEOpxYvz7mOn+lWjj808lkNrG+wjKCGb
	 VxK9RVE8rcik44KbMr3iZEQWblHNiouJBSrzWqOi2X4IqMxWWG1rDG03Xv61WdWcGMCh4
	 ocrEdgU/OCRi7eHLkl5mZZSkTjqBZoyKkrdnTEGys8zx4zBuPIy1MfH9q921skEjjCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=BuctK3Du;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB361606A330;
	Mon,  9 Nov 2026 15:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB361606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=BuctK3Du
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794237582;
	bh=vsIPcLDMIXTyEwRreAWLcBzGkN1NpY74ZgulLKfOydY=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=BuctK3DuIvKekUC2uSyt5xjib4q/GmO0uwTGUHxT/c6/EcpvDNSkWVJmdhWrxz+Jr
	 c2C0sd5txupCJKleL/ut0ezyjGKHjkKfePU0zqqIWqz6s18BIHB7C9BZX3oci8e6fM
	 iLPEdzqmyFscqSXqupQv8I9A2uwz5P7zi/IuJ8pI=
X-QQ-mid: esmtpsz17t1794237576tb0683395
X-QQ-Originating-IP: Zc/gz7/geC3Mn7EbL4LCmN3uWkfa4QiL7HNG6KBXuGI=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 23:19:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7132004335593761603
EX-QQ-RecipientCnt: 17
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
 boundary=54f102bc4fad2f6519c1e85625df03a1f0d11fed53a9ec5e8b7d6b0e8a4d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 09 Nov 2026 15:19:33 +0000
Message-Id: <DMQS4Y2FACDA.3T8ZB1OUW5HCP@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yao Zi" <me@ziyao.cc>, "Jiayu Du" <duge1256@gmail.com>,
 <srini@kernel.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <dlan@kernel.org>, <troy.mitchell@linux.spacemit.com>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-3-duge1256@gmail.com> <au6niF5xiqj7cqJ4@pie>
In-Reply-To: <au6niF5xiqj7cqJ4@pie>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MvGpJ04VJ1WqcVvjUaJwKh/8a0Sruq22nabdpa4Ch2nhBmsG9191jPHo
	URs0twg4d4WTWV/hAUKx9RFx9IDZgvvDiyJoCkNXL30Cn/uCbaosYm4sjwM6QNVy+bXTw8v
	+E2VLca19foQMm97iharwmVSvvAw0HnFehzME/kaM/5wqbb6ffguHuGhGHOWhhs++BBzWtJ
	WuqTI65StKnZPO/oOlDPpyDnKWeYdS1/4EPovO1zWfSf6QMU98cc3HXjYkE7d1fdxHBjO4C
	dcEvpScNleFMNOGDr8hEg2DxlmK8SLpece0AgBPfuq/QZRfcOmUR411GD/HFY2Avc/3oMZC
	/9F0vmA8McswPQkFXeef3UhW7kY5ZFenfuiD97DEczp77/JM2OLoGtuD9HkBvXEqu3La5wE
	d2qwIoWroWxuE4LMw84fB5aLz1+3Tct+Ex8qc+ZnR1z619/hhl4lIp07x1RHpxY+zAFaHW1
	Ns7ekr9Hrjx3ZXc/jtPhIrkwvBS0IxM89xnfBhwPlgwEGsn3od1A9ApN0mQLOg/sgrPUsCi
	gk32gxbQ8ctEk1iwkvi506Pl9cRkYn6J8NZotdNY435mTy5589KxyLviWfazFVGDW2vJN6t
	ggm7DGpfu5J4n5Yl1Q+fccsma1v+wYYewiTCGNuyLHKKExLpgLYHwwc6hg5kIBSvY33YNxw
	fm94p5zWDXzEBGQVOR488juE9gHqG/zGcLIbpQRKdz2T+lgPAglj1c/LGW508B/HTwvtr5S
	dnp6xeED+iqjHWtba8ojixV2aaqkNb4j+IpZiKPCmfFuKj7Cm+P/h/oo8aTrV1nj/r0LWuW
	gRpi0UW+Fx0FQ3UZRmsw0ylR2xgmNhT8Ztd7mKBV8TiXqabjanUszw2pQfGOe+d/58JMU55
	taBY/eHOHfiRi805etPbKTjAAe2iJZlWEu7KDGG1mO37AXwErPZQDJLb1bwpIklbzlj2oXu
	Xl6+TxzRbVPMusX3hOaEBQvp9wSIsgOPhOzrGGopUMAiFth7hx8gcKwHwDUI8i5NCJ79V7U
	NMurUIMEvgKtbg99uX4r3AK0vMH77AtX3FQt4tzZ9Maijh4uaS7D6vAWZzTRHy5nLZsLFNF
	/vS+MzqDtfgEqnsnUM3ut7RrpjlrNZhjw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

--54f102bc4fad2f6519c1e85625df03a1f0d11fed53a9ec5e8b7d6b0e8a4d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Nov 7, 2026 at 4:22 AM GMT, Yao Zi wrote:
> On Fri, Nov 06, 2026 at 02:05:24PM +0800, Jiayu Du wrote:
>> Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
>> controller. These banks contain temperature calibration parameters and
>> other configuration data.
>>=20
>> Snapshot the shadow registers with aligned 32-bit reads and expose the
>> data in little-endian order at controller-relative offsets. Serve reads
>> from the snapshot and use keepouts for the remaining register ranges.
>> Keep the AES_WTM clock enabled and its shared reset deasserted while the
>> provider is registered.
>>=20
>> Signed-off-by: Jiayu Du <duge1256@gmail.com>
>> ---
>>  MAINTAINERS                       |   1 +
>>  drivers/nvmem/Kconfig             |  14 +++
>>  drivers/nvmem/Makefile            |   1 +
>>  drivers/nvmem/spacemit-k3-efuse.c | 151 ++++++++++++++++++++++++++++++
>>  4 files changed, 167 insertions(+)
>>  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
>
> ...
>
>> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>> index d2f5bb236663..28d6c59fbd74 100644
>> --- a/drivers/nvmem/Kconfig
>> +++ b/drivers/nvmem/Kconfig
>> @@ -476,6 +476,20 @@ config NVMEM_SNVS_LPGPR
>>  	  This driver can also be built as a module. If so, the module
>>  	  will be called nvmem-snvs-lpgpr.
>> =20
>> +config NVMEM_SPACEMIT_K3_EFUSE
>> +	tristate "SpacemiT K3 eFuse support"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on OF && HAS_IOMEM
>> +	depends on COMMON_CLK && RESET_CONTROLLER
>> +	help
>> +	  Say Y here to read configuration and calibration data from the
>> +	  SpacemiT K3 eFuse shadow banks. The boot firmware must have loaded
>> +	  the shadow registers before Linux starts. Programming and reloading
>> +	  the fuses are not supported.
>
> I didn't read K3's TRM, but is there a reason to depend on the
> bootloader to do so? We should depend on the state set up by bootloaders
> as less as possible, I think.
The GEU hardware loads the shadow after reset. So YES, we don't need to
rely on bootloader.

--=20
Troy Mitchell


--54f102bc4fad2f6519c1e85625df03a1f0d11fed53a9ec5e8b7d6b0e8a4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavHkhSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9AggD+Mnv5Zg61NgXz
ZDjIUJwrW/PSgOH3CWNzSHDOpq+DrYUBAOfObntacDDKXGuGn1wmRp6Qp8QY8cAv
pn30xGwgyhMG
=ZrI5
-----END PGP SIGNATURE-----

--54f102bc4fad2f6519c1e85625df03a1f0d11fed53a9ec5e8b7d6b0e8a4d--
