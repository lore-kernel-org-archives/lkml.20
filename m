Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733414;
	b=CkzAtljY45Dwfj+DOSwv9xxiTYMlOaCUgcO8mBRUz4tucogIS8kG3+3JXDgXS8WQuv+x
	 g2VgZmivo7M8nVFIABU3hLUrwrVg31wh6H+zNSSOyOvfFf6HJ+1u0351mEMO5In7krm7U
	 G9wBS6/0GRALbcRqPlWxxE488FFqtMLY3ZX2IglwEnwynd6o6rnnnRMV1Mdv901KISlQv
	 wTNzL82L+cSk8oI6FPxbpKNBM1+4jcTyTpoLSZecMB3kYqmug+HCM5AcWIREzVuCyLjP7
	 yZ1+fgy9ch0t/nUfNcqkRyJvHgyk/c2G27WcqrVoT4WhVkdKmhkVThvAVQUdA4EPPRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733414;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=TQDIQpzHb58nAG54hsnGaeLsZebKKo1ep1+3YouILiY=;
	b=mBAMspHyFxhN5Y669Dv3SYIPaAXzp4GQTAO0VslHsfYydX6jK4IjzeJ9OuSw2IoKvbz2
	 c8GQT/PszaP4k/S4IKRyjFDEzeYn8LUrwml2uGic1dPMLqXWA5lgQTcHLV6CPcOD1E7Zw
	 I1VIy9FlYqTq6E5PCSVFgzYCadP2BJBm1rpizaKHjYssuCKn1o+uUeXSRal4bdzap+MpB
	 vftToryehxNyD6F52fNy76uYn64r1d5O3YuY26D70CSDOhpAkESuVk0Ca+u0RIQoQAyvl
	 nTaBdpwS1IdsLuffDo+Dtubmvae7EP2P0JzCBalSgsl7WM0JW+R89ZHREf5cA/1R7mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RbFy2B73;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C0606A31D;
	Fri, 23 Oct 2026 05:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 453C0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RbFy2B73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1792733404;
	bh=TQDIQpzHb58nAG54hsnGaeLsZebKKo1ep1+3YouILiY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RbFy2B73JbdoEwfaZWhw72GGEJ3S18LQVSnu9FB2tp1F62GzNCSAOofV6+ci8j/Qr
	 NTYVIp1W/oSlHcqIpvTGpB3P/t0t0A09IlS1viMM4Mm6czL5gHH9bx4m1QqVQ8wC7F
	 IzPS02S41/QbiwcDyvOPp6AvSa2KUzSIbE9pOo9bG2AsdWi2lakCY1Ys73g5AND+XT
	 yGPPp0XOqjHlK89VohWNdpL155tzNh4xKK69MIdZo6GxV7XGp2AbbxhnYxsrUGuDXO
	 3I1q7aT8mkBYV5hED70/dnKARVm3ekeqWzmRG4UJQJITTHNMQApkJ1lowql7kF/44L
	 i8ZDdGnYoSVnw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4DFF76C53B;
	Fri, 23 Oct 2026 13:29:56 +0800 (AWST)
Message-ID: <b4bb2f36bde9df1e052a70076fb70118cf3c607c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/4] soc: aspeed: Move UART routing driver to
 drivers/uart-routing
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley
	 <joel@jms.id.au>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft
	 <osk@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jani Nikula
 <jani.nikula@intel.com>,  Vitaly Lubart <lubvital@gmail.com>, Hanjun Guo
 <guohanjun@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Breno Leitao <leitao@debian.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>, James Morse <james.morse@arm.com>, Paolo Abeni
 <pabeni@redhat.com>,  Stephen Hemminger <stephen@networkplumber.org>, Dave
 Penkler <dpenkler@gmail.com>, Jakub Kicinski <kuba@kernel.org>,  Jonathan
 Cameron	 <jic23@kernel.org>, Dan Williams <djbw@kernel.org>, Mukesh Rathor	
 <mrathor@linux.microsoft.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Alexandra Winter <wintera@linux.ibm.com>, Julian Braha
 <julianbraha@gmail.com>, Karthikeyan KS	 <karthiproffesional@gmail.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, 	openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Date: Fri, 23 Oct 2026 15:59:55 +1030
In-Reply-To: <20261019100643.49099-3-changhuang.liang@starfivetech.com>
References: <20261019100643.49099-1-changhuang.liang@starfivetech.com>
	 <20261019100643.49099-3-changhuang.liang@starfivetech.com>
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

On Mon, 2026-10-19 at 03:06 -0700, Changhuang Liang wrote:
> The Aspeed UART routing driver is not really a SoC driver: it only
> exposes a serial crossbar through sysfs, and the same hardware block
> exists on SoCs from other vendors. Move it to drivers/uart-routing/ and
> convert it to the common framework living there.
>=20
> The register layout description, that is the list of selectors with
> their register offset, bit position, field mask and routing targets, is
> kept as it is; only the surrounding sysfs plumbing is dropped in favour
> of the framework. The per selector option lists become separate arrays
> because the framework refers to them by pointer instead of embedding
> them in the selector.
>=20
> The Kconfig symbol and the platform driver name are unchanged, so the
> sysfs paths documented in
> Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing stay valid
> and existing configurations keep working.
>=20
> Also update MAINTAINERS to add entries for aspeed-uart-routing.c
> based on the file authors, as the file currently lacks maintainers.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +
> =C2=A0drivers/soc/aspeed/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 -
> =C2=A0drivers/soc/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/soc/aspeed/aspeed-uart-routing.c=C2=A0=C2=A0 | 601 --------=
-------------
> =C2=A0drivers/uart-routing/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +
> =C2=A0drivers/uart-routing/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/uart-routing/aspeed-uart-routing.c | 415 ++++++++++++++
> =C2=A07 files changed, 443 insertions(+), 612 deletions(-)
> =C2=A0delete mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c
> =C2=A0create mode 100644 drivers/uart-routing/aspeed-uart-routing.c
>=20

I'm certainly in favour of moving code out of drivers/soc/aspeed, and
having a small subsystem to handle this is fine, but it's not clear
what happened to the direction of doing this by designing a user ABI
for pinctrl?

https://lore.kernel.org/all/CAD++jLm7hQnCHACsZH0LVnXuCJm0dZ6Bq0hAyOTvVomy6W=
VRug@mail.gmail.com/

Existing code would need to be converted, but motivating that with the
JHB100 support would seem sensible?

Andrew
