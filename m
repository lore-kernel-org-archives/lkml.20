Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792971064;
	b=moRGX7OnLOvZHQRYBZV8uBYMrR/X30oq3FPQBfbZyEH1JxjZ7AcK0JHdaFVUAa6RUYnV
	 7Cj7LKYHUMeGM4WECsYahD9CpxR2UG9PWCI+vNE2VsSzc1fU+w/DkSFmxI/aliO3L4TFf
	 BSJZYqeDbHss0a1GT3IpVATS1CPg5gyG3fxzzomzUNPPvJhT8/TAD2P3jjkgLRC0omedj
	 8rcgngmN/p0LHZMxNM8ZWycRewcr2X98YkIDxi5qJKSxzeasVFSreymdUOifNQ3+HD0VE
	 MX529OjNAKcMfBVGuR/nKWwDoBqqoof6vCeggh6Psxz2gQOanc5b/7HiVPvBmYTyexA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792971064;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=JvGUTxqAhp/FJcRRh1bkPIKoszluKPLjqotGVQjBjx8=;
	b=YiPHame225cm9JpWrra+fmwAKmYSGGDmAJhPEuHGaCV+bbbZGNDeTFyDrkapWlO+LrXi
	 pRCxvBhw+1ZwQw5knZg3yh/HSLain9kdlPQ9/oncwzz990f3mWVEu+sT88y8AMPCcpqFD
	 ZFeo1BwXiQkPio0n1hJznvoXJktU9QU0+hdUysm6ASCAUBqh0y5DHE+tXaia9cYhLWouA
	 Q0YjT8BRYe8EMHTt1o6kGbWOkim8vziY6cMKoy1C62SZZOMGugXSonLdG1HQCJwEsr9Oi
	 UIfgwthCA4QFYW0MSHVQY3LEqzxV16blnmNxhRcO3gJCtoLAAl+fGv5bQP15E0b11iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MdM8LbOU;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B64606A31A;
	Sun, 25 Oct 2026 23:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MdM8LbOU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1792971054;
	bh=JvGUTxqAhp/FJcRRh1bkPIKoszluKPLjqotGVQjBjx8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MdM8LbOUh425FSEk2CJG/RuZEdiEhPOUrKqYAspOLZrawv24QxPWJ9ioI6T3YT7KE
	 2YkCKKa5XkpvPz2db/e4woIqq9eW4SjKYJPSuMd5h3vKCtW+cq6MKLk8Uqx5VfDDAe
	 xkTROPg2vfMUU0VpHhS8E17EJZwSQgSqDNySd2Mg80NzNoy1rTy3vND/VIBBHgM1fr
	 GcLfHmGDWMyAjcGkTets7PZhsRd3enANbjx7oARxw38EKJBg/DKmO6/cx3Mbi7WcuZ
	 9EvNWdfxH2snn+igU9I1uAj6AvrMXlbO/XuLkGjhoViMwOM3ZX1dni4/YTD67Axz0j
	 AkXf9Bk2xp3Dg==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D24076B2E4;
	Mon, 26 Oct 2026 07:30:50 +0800 (AWST)
Message-ID: <53c6716e5cadedd82d7243dc75a5869c8879fd87.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC
 platforms
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com
Date: Mon, 26 Oct 2026 10:00:49 +1030
In-Reply-To: <9561c180-ff8d-489d-9ad1-8d9a7afb592c@linux.intel.com>
References: <cover.1792613583.git.dawid.glazik@linux.intel.com>
	 <fb048449033e125df93c2925d6dccafbd4114685.camel@codeconstruct.com.au>
	 <9561c180-ff8d-489d-9ad1-8d9a7afb592c@linux.intel.com>
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

On Fri, 2026-10-23 at 11:20 +0200, Dawid Glazik wrote:
> Hi Andrew,
>=20
> On 10/23/2026 6:17 AM, Andrew Jeffery wrote:
> > Hi Dawid,
> >=20
> > On Wed, 2026-10-21 at 22:26 +0200, Dawid Glazik wrote:
> > > This series adds initial upstream support for the Intel AVCRP and JNC=
RP
> > > BMC platforms based on the ASPEED AST2600.
> > >=20
> > > The first patch adds the board compatibles to the ASPEED binding. The
> > > remaining two patches add the board DTS files and register them in th=
e
> > > ASPEED DTB build list.
> > >=20
> > > Dawid Glazik (3):
> > > =C2=A0=C2=A0 dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boar=
ds
> > > =C2=A0=C2=A0 ARM: dts: aspeed: add Intel AVCRP BMC
> > > =C2=A0=C2=A0 ARM: dts: aspeed: add Intel JNCRP BMC
> > >=20
> > > =C2=A0=C2=A0.../bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > =C2=A0=C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > =C2=A0=C2=A0.../dts/aspeed/aspeed-bmc-intel-avcrp.dts=C2=A0=C2=A0=C2=
=A0=C2=A0 | 322 ++++++++++++++++++
> > > =C2=A0=C2=A0.../dts/aspeed/aspeed-bmc-intel-jncrp.dts=C2=A0=C2=A0=C2=
=A0=C2=A0 | 276 +++++++++++++++
> > > =C2=A0=C2=A04 files changed, 602 insertions(+)
> > > =C2=A0=C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-in=
tel-avcrp.dts
> > > =C2=A0=C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-in=
tel-jncrp.dts
> > >=20
> > >=20
> > > base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
> >=20
> > Can you please discuss why you based this series on v7.1-rc5? v7.3 has
> > been released, v7.1-rc5 is a long time ago.
> >=20
> > In the future please base changes for the AST2600 on the latest -rc1,
> > or the aspeed/arm/dt branch of bmc/linux.git on git.kernel.org.
> >=20
>=20
> That's my mistake. I'll rebase onto aspeed/arm/dt of bmc/linux.git and=
=20
> send v4. For future AST2600 changes I'll use that branch as the base.

Thanks.

> > > prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222
> >=20
> > Can you please rebase this patch to send it to Lee on its own. The
> > AST2600-based platforms currently generate a warning without it. I had
> > hoped Lee would apply it in the same cycle.
>=20
> Sure, I will reach out to him.

Thanks for this also :)

Andrew
