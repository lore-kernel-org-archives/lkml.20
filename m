Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936390;
	b=bufPsgFadeiZwkt9KFUhC8vJUXBZPgiz9YPIz7ZUY8M7viP2xUW4YxcEDe7lvYpgy/p6
	 w4hpq7cLg7XhODXMIyBVxYdwOcGO6zV+3LNIGxAMcbM1Ls6q5zK4+RMMAQT8Sx+YfIpSI
	 sMxwgooIiU+nf1R9Z+BYlGTnWsJqIYD1YP4hz62GrEEvpELYDGckmo4jTw8JxIcd8iTm5
	 /JOrkpiL0GIHR7/n6D62cv80TGgtQ9Fx9m6KKPBxTLTa2u1ioD7pdejEMqPg1IsrcMx7D
	 OzxIkHGEL8gybvBXaoIuMY6Ze3FNrWtx1oPtJsDSy5OeS9HCoRTztcisCfFL7FtGTLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936390;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=YWjCVMH6QOR8U1HdP5g2Ap2iHKmTUMycrvWqvC+OZSg=;
	b=u/fbSGJvRchLeJjeHBKH8KP3+t2ftVfKVZN75yWhXSSFnU3mx/wDcsHw//mf4C38UB8o
	 tAu6ZnSu4swv+mr02zqUxesDJ9rq5K6s2zk/lL5uTqt4PfMbrU74A/7q2mDOX7ca2jRLB
	 KvBOtfkmnLYu28/GHP0/aRKXUseD6r3skva7S7R2DCv37XAEILIKesCjcSblabdamx9Dk
	 V8fQQv14hv8QxPXDX1dP1JbJpxcIYnZN+/8wOnK3jAi3XzvYqI2WSi0bKflMXd8ZwkTKb
	 /oqetiyDRd2+e97hCCjaiRF711K0KCOoMYoAvPToqrhlU58YtlKaOr9wOvXxaWyXbSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NdgnQtfW;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426EC606A31B;
	Fri,  6 Nov 2026 03:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426EC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NdgnQtfW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793936358;
	bh=YWjCVMH6QOR8U1HdP5g2Ap2iHKmTUMycrvWqvC+OZSg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=NdgnQtfWQTdDDLxkFVmyZenAyc2QFWutEtKY0BPTYdVsReEfuLs6n6HfLluLvXXlF
	 2pJUBmMf1oyVBznkOa4Xwuld6C7+vfbTQBhDrNNOH2Gi5VxUUxExHJfcaEAfXXJree
	 G95gYU4uFb6TEW6BRxQSSOpLKKGcnX5Vu0N4N6Ec=
X-QQ-mid: esmtpgz13t1793936357t36e91489
X-QQ-Originating-IP: C3yEeWDAIm4PyjGi5UJr3LByUX02//lzDscXXGL1zXk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 11:39:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9883087005053734820
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
 boundary=fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 06 Nov 2026 03:39:13 +0000
Message-Id: <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Emil Renner Berthing" <emil.renner.berthing@canonical.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Guodong
 Xu" <docular.xu@gmail.com>, "Yangyu Chen" <cyy@cyyself.name>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
 <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
 <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NHLGb615Ee/ro7mEPxFyPT/euJjKyX5DrkSw9FAZqTBtDcM7sc8I3DMu
	AE1/DV7bgQpR3g++m0bMtvu6v5lFl4fUFHssGtqnaRtVWEPfOJmIQIbc7y25gSDrSYE+VUf
	Og9huuxlj/WC9a51hQaiowE6fqHYA6S/tVQxiZvDclUWoIDM9hO12Y/Q0P4G1Yz7/6tX6jf
	a96E7bRck+x3YLEL+Cpz0s/RcI6uyqKR4sIS1T+2+9OHY5FSJG5nYZMfmYrmmIrkF1YROAS
	JOsRH3kOt9/OUoYaGVtg+69G0xWCvfJ19ZN+gDELXlr/MIyawGe887xvX7u+Bu4y3BJN5Be
	z07ST+UrPOm4mqMxc0PyQjJ9t+zcN4idxYDmm/BGRHInolOk4SECT5I9mfflhu7fKq5xzzp
	IlIvkbBTFKCv42ZLKy26e0OHEAOaSpER5nV9JfrDIvaeCXbXecTmUHX73lFy70p7j2ve01h
	lDahcqtREuEmqhPLR0CXfOOy3dETqG5c8M7IYl6tLo4ywobQJvdQoP+LylwFR6ib/P5urL6
	LSJ2TNFTnXFeZ9dLKZBEJAENtoKCJZWQVFxdy6kycF4OZ4X7A6aECBH5xhUqnFSLq36lqMA
	RQUKp0k+1MEyEFQcfoUKNrbtJXZQ36w645+5hjwVDFIMhmFfWaKRA3/BgNMKhbrOxm2fXuP
	CDsF7BlSOOFGdBxwz/yWa8IViHeGa1OsfWtPeyOBQ5EZ7wJBeChJWDIjLjYgdQpg6KFX7lX
	fwx2f1DfnRyY/eb3km4ujzEv7P5d83YdFW4NhTbfIdy3FfOcNfc76sPZdcZ+5uN9k3OtUM8
	PcJ9Znd0RSgjp73sRw83Qz62e7IovqUzKxfa7iXlTSPFrhi8EesdakRXEqwLiYV5XYQN63I
	JEIi1w24BKZaOnnRpC6u9N9V20VmJUDVA7WuTrbEGWHhIGADoyp5RhNXYsdVA+zA5Hs1iIb
	fIVfbZTspW6BS+G85P8v/RQBxDABOK8hHlRWrJEjZ7V1Ok+2N01vxEZAqTEScO2E2jB0ZZ8
	IO74eqMeF/EaGPt0Fh34frBhaVbAaZIVm7NRZRQzKWVVR24mwJTILTUXkYW8xexVbxcJ/Qf
	rnO/VQhm4CGC0P5z/OL0yQEx/cGw/DyF+Jauoj9nWpd/b1bDFrjtd0=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

--fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, 4 Nov 2026 07:43:03 -0500, Emil Renner Berthing wrote:
> > I just had a talk with Dong from Spacemit. He tells me the
> > BS01DCMA is the name of a module similar to the com260, only it has
> > a different form factor and each module consists of 2 separate K3
> > nodes. Similar to how the com260 module can be used in a small
> > carrier board (spacemit,k3-com260-ifx) and in a 10-node server
> > (spacemit,k3-com260-tq), I'd expect to see a
> > common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> > module itself, and then an
> > arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> > describes the extra peripherals that can be accessed when the module
> > is plugged into the server.
> >
> > [...]
>
> Ah, it's called the Cluster Server RV2768
> https://spacemit.com/community/development-kit/cluster-server-rv2768

Hi Emil,

I've checked with our hardware team. BS01DCMA is indeed a module, so
the "board" wording in this series is wrong and I'll fix it in the next
version.

I'd still like to keep a single k3-bs01dcma.dts though. The module is
only used in the RV2768, and that carrier is essentially just cabling
to PCIe network cards. Those are found by enumeration and there's
nothing else on it for the K3 to control, so a
k3-bs01dcma-rv2768.dts would have nothing to describe.

Does that work for you?

--=20
Troy Mitchell

--fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau1L4SEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8bHwEA/wJFXrKpYftH
FB5kzcPBx6DamUD5F+4zMd1bZudAqVUBAKPNyObrwunkgozWj9HWqQMnkYJyk6XD
Wmy765878T8H
=dLV/
-----END PGP SIGNATURE-----

--fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f--
