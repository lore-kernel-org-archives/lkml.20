Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796375;
	b=skQxdr3pcgWXFZxww4yG2SN8Oqo+BFOeWo9ZJH+CH5LAMM0nHKmSaJv8/KMBEIMMzws1
	 wiM2ajjDB2dPzG4zt2/UWXhSBGpGr7Vzoo38fvZwzslbY6BdCPLxv1MPkXhu/P1kJUD1U
	 gzPb/X3OA+f+uioCyxPuooGWc+JTJX2qYJNb7B4aoBLn+JSl2o80wHS/e5Dv1iwXvSJ4U
	 5LBZH6A4XyAwOFOZycS0gp9+PEueEYxHlpidEZHM4hI5o2csxM9Ra7s6FCADodkcGYhye
	 O+KJXGXY8yqSLMBkn+3TBNZGFGSEjNHKr6noS7CCiSdRVff3Cbsk+9FuPjtgnx+xUYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796375;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=ud7i8nnvBkdRVkVjV5P07IGY/fDmIFTDHSVtW4K9wfw=;
	b=BJsJNQJT5oJrjV2vBfy2adrQetjvaQM05f5Wdmh4ORit1osXk9JbByF22mjttLnjyiiu
	 JM0KlzS/REjZITvOSpkgmqzWGoKC1U8s2fEEbAKy0vrMZZSWfR4r4OF8AUABrMO8YQNCH
	 sFkgcaRHaVrjdTl3yFL74T19BEHLw+GtCsp++E5bN4lNLppOrV7x2Ra6SHyEOJdJY2tq8
	 m42GeNyDwCcnF5mBvZAJQWPL8vUvOKtZ8f4nZtrROn052hWXk4AGIGSjcwHaqF9A/nCyP
	 K84Y5dRrylKKcOQEODgwYHc6AJ5jD/hJhwRLmaRPYn4SXGzpCOPrUTREH5NDeANW7yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=vwNJdk9R;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D145606A31B;
	Wed,  4 Nov 2026 12:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D145606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=vwNJdk9R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793796333;
	bh=ud7i8nnvBkdRVkVjV5P07IGY/fDmIFTDHSVtW4K9wfw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=vwNJdk9Rqznf8c0Jd+ViAy9HSDB0XzxyptvnWEJW8/lKu2YobJLyZUkhDg617qtHA
	 9X5s/cjZlNIr2099WbfnyOufkqTIPyEY33L9fS/tlps+uNTIH4WMXmKfAwW9/o2k7f
	 ZbTyLKOWZuKu1i5OmbaOPrdfj0uNFZSt0Ap574ro=
X-QQ-mid: zesmtpgz6t1793796331t28955be0
X-QQ-Originating-IP: hJ9E/gMI2dwNw1YEW3nJrkwLffT0S2bkqJlyttVlVJ0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 20:45:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5863053726233936690
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
 boundary=b7d78e441824c4b04bea4fdbdffd564c14f6ff6ad7497c5a67632b196766;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Nov 2026 20:38:47 +0800
Message-Id: <DMMFL4TP6K9U.5WFLI5G6YC5@linux.spacemit.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Emil Renner Berthing" <emil.renner.berthing@canonical.com>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Guodong Xu" <docular.xu@gmail.com>, "Yangyu Chen"
 <cyy@cyyself.name>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
 <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
In-Reply-To: <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NVrDa/vn3l+O9qiowlTD2zaHKE0g++nF0vjHVbzY0C5kPKcQLtb4u+2L
	qjPDvKpym0s8Db3rTBZjdVtuIuNVW7Z4S3e+nEb0R96VUj3nxKycKSJPlEN3Sr7dsiZPZ4D
	KX08oz8aDvuSRrdpIuQGiWQrCB4+2eGOlaCOlPkD4YuWjL7bz9hMGUOERICj1CAkzASR+y2
	Ex0LuOXq5asYsXOlYvBIA6ZgFPFsQK4nMU2WwbGfJfPMijwDt4/5MRZcKYcwG69SPvTsF6t
	xydpwvCM6cejj3FmdW1jUtQMIgQHTxSy2/NbPf1oeASk4amm1qAU0aYdUGp/HGLAe14Rk8S
	kZxRWsb3j3vRNm4QoQeORotIoW84Q7NFmgq9HMGkDQh3urUuiufOQdNw4VG5r7WS+s27tGp
	wHooCq1VDwzpiMCobOxXelAfSDJBie7gBT+q+iP+xq49WRsqXhwsmf080ARMT7TmBHeGtIN
	6ITSGA5eFdfIspJVlob9KSHqg+dtY2CaRC9gVdREATaYDZatDP71wXdcknsZXzk3I+Bv32u
	jUh71/yR4Msxjzhzny5mgE1/59DfZepTTMzOkGS/v2GAay41hwaJEce2mk1ZiXHDNpsdvnN
	nVkqeEnqNB5MX0azSvNSSDuEpjpGFU7zC3C/erwMeAM2ek9BVaiFh+cdB30CbNS8aR7nA4k
	/m1vqaWruf4q2I6wwqK+EPrbBD6Ki/5V3eoCPYLamdD/v7zUa2aRUAXsJxi+38V+zVOVYN5
	w2PhSazs/PRqkLJW2sXl69H7zUIYf2AbAq2UQfAUrDLhff2NVZWTBlhdJLcpZRlCczE41+Y
	vlOzZngukDGS25bMc1uqymyv+vw7NMGNE99INhFfRtiTgV2cAk/6zNgF00JCjYV0NjPDulJ
	vOLlhO1wNGBF8+YIpKUaJoVpMP4OhYQweD8gh7LiefkDkQqajkRVIE/GmF9Zr3Py9b+yAGW
	aUK2/VpuyLd+0B7ktRjaxKkW17F8kyP2yQ501fk1zuZN/1naGSE6M+G8Cb8sSRPvjpfYkKy
	ZKsWI5iRUBMbOmhtXIHXw/IP25NXIpiAXXbhDUeMQ/M8c6IIEZaJGixfjaFeuNwCmUXtYUU
	qewk1aNk321
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

--b7d78e441824c4b04bea4fdbdffd564c14f6ff6ad7497c5a67632b196766
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 4, 2026 at 8:21 PM +08, Emil Renner Berthing wrote:
> On Wed, 4 Nov 2026 at 07:24, Troy Mitchell
> <troy.mitchell@linux.spacemit.com> wrote:
>>
>> K3 BS01DCMA is a board equipped with a SpacemiT K3 SoC, 16 GiB of LPDDR5
>> memory, a P1 PMIC, an EEPROM and QSPI NOR flash.
>>
>> Add initial support for the serial console, EEPROM, PMIC and QSPI NOR
>> flash.
>
> Hi Troy,
>
> Thanks for the patch!
>
> I just had a talk with Dong from Spacemit. He tells me the BS01DCMA is
> the name of a module similar to the com260, only it has a different
> form factor and each module consists of 2 separate K3 nodes. Similar
> to how the com260 module can be used in a small carrier board
> (spacemit,k3-com260-ifx) and in a 10-node server
> (spacemit,k3-com260-tq), I'd expect to see a
> common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> module itself, and then an
> arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> describes the extra peripherals that can be accessed when the module
> is plugged into the server.
Ah, I think I got the product form factor wrong. I'll double-check this
with Dong. Thanks for pointing it out!

--=20
Troy Mitchell


--b7d78e441824c4b04bea4fdbdffd564c14f6ff6ad7497c5a67632b196766
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC4WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCausnVxAcdHJveUBrZXJu
ZWwub3JnAAoJEJgJ74D5MzQvwR0BAIMhLAVoskfIVLiSUa7AOkJcF8Seux/3ZYNB
5w+rYXNuAQD5XKQ71sqJjooaXjxAwzwcJGIyf9TnZuNkxHNXuC/DDQ==
=LQsG
-----END PGP SIGNATURE-----

--b7d78e441824c4b04bea4fdbdffd564c14f6ff6ad7497c5a67632b196766--
