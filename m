Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792729038;
	b=Zg88A4MibzjqsZFf8Aqbqs+0Ph2ST8QLa9YvP+Kx6BBvgCOwKBgFMuJ5AK3Ia3zoSpRZ
	 nr5MC3GV9I5U2WmqyPJiKRnsCDrtMCFm0BsMufuy/I4Tc/Ppd4Xrw6pmnYpogo/kxcw+j
	 Va1oU9+6aXiJl6yeeCgj+szphkzcWVdt+58SrGXycpvtFVObXFLr0OJ+dEmWgCxkJUyPS
	 Dq9Zd8qj2/gp+ICTOaOsdOPK1FgCymt3FvYa0a+cD58bUf8aVmF76whjdwujCIp2eGNVC
	 hXGvGr1PSeBZm5EDGV8U/hr9vWGpIvfoPUHP2Y7aQNN2ab/5I1S5z7J1IcLZa2la6ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792729038;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=tZVpAtWdlXnl6TCMo3CWgTWfWWIdH1q4ozjaVaEEH/s=;
	b=NF2GvuQSSa1DABJ+f3lyAC5Y7HBVm1KnOXUgEMdX6mla8NtXTuKcqPwxdb58MmPWWGdy
	 mCz2vwGQX677L2RccqaRh43tZPUOVZiIVaARf/CZhLiWJVJHhI1qGCrA/eCxmGP0iTb3k
	 4Zeqm+OVh5n7yw0v9fQeeNqhF7Ei3TCCVAnlzLUfFItgs25myX02uV2x8unJZ3AgHAxt+
	 AbMWgjrnhU/I5ykA9Gwz8V3v86z7C8aG8A5kx7ou7ZKdUiwjv4X5nbah9/adQ1K8OhB+H
	 qdtxVWPuWhomo4uH2DGeZhqHABgkdAQQ+RbCgU1EUZxga9scG2bFzn3WJ0ao1XddVIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ap4s7NlN;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003CC606A319;
	Fri, 23 Oct 2026 04:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 003CC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ap4s7NlN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1792729034;
	bh=tZVpAtWdlXnl6TCMo3CWgTWfWWIdH1q4ozjaVaEEH/s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ap4s7NlNiTcogMEaK1gbk3o45IVbbObCjTB8Zd3YlYLo2GqMiCYw+xvFAzDO7AzDg
	 w76/DIpHgm91TDrWzcca66EF5BL5uefA0aw4PNS9SoXB9QPgMVkkJVnQN4Fw1dLZUc
	 8LVB75coOiCtrgpZzg0+EUbRQNDNySyVGxtTekLSq8O8uVzzaeHWght4WyBWqdrxDH
	 uRlfXMcraH3oAxdD64NhnulQK+hp9bXDRmTl73+mJa8D6b8/CSFGztPWNFHINfd7Rr
	 aQ3qTWedOpXMdzhyZOeBOH/pvXZgnOVlUq0ecYvx3tkJpR7J9fJoZe/S+Prc/je9LK
	 qb87PlEq67/Cw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E1AA46A64B;
	Fri, 23 Oct 2026 12:17:12 +0800 (AWST)
Message-ID: <fb048449033e125df93c2925d6dccafbd4114685.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC
 platforms
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com
Date: Fri, 23 Oct 2026 14:47:11 +1030
In-Reply-To: <cover.1792613583.git.dawid.glazik@linux.intel.com>
References: <cover.1792613583.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Dawid,

On Wed, 2026-10-21 at 22:26 +0200, Dawid Glazik wrote:
> This series adds initial upstream support for the Intel AVCRP and JNCRP
> BMC platforms based on the ASPEED AST2600.
>=20
> The first patch adds the board compatibles to the ASPEED binding. The
> remaining two patches add the board DTS files and register them in the
> ASPEED DTB build list.
>=20
> Dawid Glazik (3):
> =C2=A0 dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
> =C2=A0 ARM: dts: aspeed: add Intel AVCRP BMC
> =C2=A0 ARM: dts: aspeed: add Intel JNCRP BMC
>=20
> =C2=A0.../bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0.../dts/aspeed/aspeed-bmc-intel-avcrp.dts=C2=A0=C2=A0=C2=A0=C2=A0 |=
 322 ++++++++++++++++++
> =C2=A0.../dts/aspeed/aspeed-bmc-intel-jncrp.dts=C2=A0=C2=A0=C2=A0=C2=A0 |=
 276 +++++++++++++++
> =C2=A04 files changed, 602 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.=
dts
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.=
dts
>=20
>=20
> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d

Can you please discuss why you based this series on v7.1-rc5? v7.3 has
been released, v7.1-rc5 is a long time ago.

In the future please base changes for the AST2600 on the latest -rc1,
or the aspeed/arm/dt branch of bmc/linux.git on git.kernel.org.

Rebasing allows you to remove 2/3rds of this prerequisite list.

> prerequisite-patch-id: 3af4bd880f896c97741b54ee18845b305a4bd061

This was already applied in 7.2

> prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222

Can you please rebase this patch to send it to Lee on its own. The
AST2600-based platforms currently generate a warning without it. I had
hoped Lee would apply it in the same cycle.

> prerequisite-patch-id: ac42a7a373fdc407f6377d0b1c74d728af50ba42

This was already applied in 7.2

Andrew
