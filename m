Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1F241684B;
	Wed, 23 Sep 2026 06:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145386; cv=none; b=pH7hpy3dBHoBPVxTOwFlwj8YsQ+I534MVyoE/Nqo25U2qG6+A8FY40XxH5mRBVECIma4hzlqZlVFo1vx+kFWLzJoeiOCXD9DQZkHcGMiEBspC/7i/oQDijGK/dhc6SzmUNc4vMLs5OR6WEmOf75ftBFk2oC8S6+/YrKnz5wOtCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145386; c=relaxed/simple;
	bh=QXk6sqnpswcMUyDd2kkQEilIhi7zKKxDdYh0LaPA8n4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=ZkQ1YHppozquYM7b8c+QiP8oPOcl+GjUJyiZKP1vm1Rk2aN8S8ROCYaHSdT/VA9eWFiMTNm6V5zDlAZVLBb3FFt17ex+Grscblf8MkXhL+7+XJmmyMEJqAd3zkuuu0GgeppAgG2aOYpsrltx6zQ7yVsQLG8DyP9lhDl1ZozENN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=VG6ZLmJs; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="VG6ZLmJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790145367;
	bh=7TD6kaLOIkHCV7biWJRQxBpxr+dO2L1mtrMOe3kFMLE=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=VG6ZLmJsiH0JmvVI+mA8iYw5OWhsZZEYhG2FR28omQS4dqnFyUlqZHRIchJg3Vwdi
	 HB8Xx1QsLj7ZRRSMGul+GhleVPw9Wir5mwVuYE8odIz90L2IMQwhfNAgmHKO7+6W70
	 lWZs7K5vE0A3SNUzXhNCEKWBKu/XwmvrtKGwpCNA=
X-QQ-mid: zesmtpsz4t1790145366t12895b09
X-QQ-Originating-IP: iQ++3uqmOnABX9dDUWqAzmBVlnJU4UKa65BUSd0vL6E=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 14:36:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7840022773498223728
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 14:36:01 +0800
Message-Id: <DLMHKHTDP2W9.3GX33KSJ2YIJM@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.b414918c.4333.4215.b208.49d99e9be044@feishu.cn>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
 <DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.b414918c.4333.4215.b208.49d99e9be044@feishu.cn>
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MF5EUprWCjQDzf6yuXnqKrRWC9+nueLk4HchkSxqDxHWgDGD76ek5lzL
	l7UQibFIK1N1omV9jDMv0cRERRr3TYVMILedCqj/zQuxiRW7elyDarlWxmkb9oecvzaJG/u
	xXlBYo7tS7bMKbsUDZRp0MbxF+zlDZBFmBIT0eG1RAvJq4o6T1kgUTdAE6Ug6BB2boXX/V1
	dYk/K39JCYz4yr7d2gkASjiVlS9lbt+O4fpInjeUr2SGqHnNjxeFpRGGosIK4cc/A5u/IHP
	zfYfKr/KKwzVrsMqCvxtoL9mAbE/qscxqXmi5CCCdCtWICUV3G/uYuXb5DiAltJakC3tb0U
	FGMsHAgYtcrt6+bbU1YScEip6yQUkhpE2fY9U9aNkFBzFLWscC17d8G2VJtxzVCWJwW6g+i
	08+rCMDAfD1dy2Npx8nCvCwfM9qLai9/DztFg7K4dcjpiowz7p6KxtDk7O0aoxI1qvsNynw
	sRpOIjUXavbDN5CltYTM+1dCL6rqfGeJjNvNuKWXtDgCSjuZlISP2IHH/vrRKg2o/G7s0i5
	DczeCtViBOtPNmvPn+LGvUse1PCmCrZVbsFSfeXUER2yQeRE+CB9HBv782qWCDwryNSajRx
	DmevZ6jY+F2gmjhY5lR5B0lNVX42ujYpi0Dj8P9frOJfiFBAFGZjriUIi6ViRRz98+vsb+k
	qPqa5nzV/64HaynTTv35q//Xp4tRJL7XNuDkrhCMrYVqwUI8vCJaeld9luEJSX020hY6qz3
	NwhLCyp67oWwpsGZz6LVBAlgMY+b02ksr4me39KZ5K1A/mc9XiPAPpUFbunfmbWwgl6LkAA
	ELYEjFqjoekytwJI9oS9s7WJ2KQS4c6jVSB8jSdbtCJMmOWw46sPrknou+h5pCil/2CpgXW
	kTYC7Ir4r6yJ2bQt0bipbWvXBpd7X470ZVTt8SgOLOyha8j79rTvhYi1IrtfHRf4FKaywqf
	xBL8FhLG89F/S0TbEl+JiNBaa059js38XSCHoPaI1GIyu9d7Q6LFSFkRQgylnw4BCgJLNAv
	PSF5y25jQrP0aEcqRImXDJagl5Oi7XqyqDBXJTFD9XTxrDXhMrIToEePWRY1mnFTwEpdRyp
	JtZbL9XQ2bB1sLGHYTsss/BogrZDXfwZJN443a4eqp3NmZIWuUksNGc+Wve/6rIjPaPrL/9
	QMAzXrWuzsDjAbgwTLB/i1DsDfGSlTgup1UE
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2026 at 12:07:20PM +0800, Sandie Cao wrote:
> Please note: usb3d_u2phy also use CLK_APMU_USB2_BUS.

Could you share which tree and commit this snippet comes from? I checked
k3.dtsi at the base-commit listed in your cover letter,
3f2425f5b5bbbdd991ca9cdfd5502e68d8895998 [1], and usb3d_u2phy has:

        clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;

Are we looking at different versions?

Link: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-n=
ext/+/3f2425f5b5bbbdd991ca9cdfd5502e68d8895998/arch/riscv/boot/dts/spacemit=
/k3.dtsi [1]

--=20
Troy Mitchell

--93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarNzUQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvjqoBALC+90I9O3Z9aQ/60lX4RPaKN48M1FU69LCQe/6g
LaTFAP42AzJ4bt274kIyxURFDfOEeXt9JY4yYAl2jx9atadhBQ==
=Tjxm
-----END PGP SIGNATURE-----

--93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e--
