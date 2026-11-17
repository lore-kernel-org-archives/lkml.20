Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898009;
	b=zJd4KQ8sq3hdls/bcPM/a0EApfITX3qA74f9kdSCxYTcWuInBksS3fyt8peM85Lp3mqv
	 cOE6siceAAb/6DrwdedtnFpK3oPQo979H8D4QvNIRauDesNzbBrjEeNvT4VctVW/yWOIq
	 Fr1xqT+E+0S2FBTfzY/hxRy7hv7b00Y/VVW/dnbNGQ9twBdK7xUV2fXpi8eb/xNhI0MOd
	 PTv+wmZMJKDsuEcTVvczAdSYs9SKKPKc3TDFZ9fQ5LuQBxOcmt1i41jLEgNsgZr7SwpQ1
	 /j5oi3JZQvh9TFZ0FV58GF1G88VZsntiCob3qQCgOrGKlBJTLFiK6UDnH34cTspQefg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898009;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=Q+gF1IpQxY3Ah+YgluhpyTuzIbzQciSEK4mZyW1nqNs=;
	b=MUyTq1L+2f8rgXJes1qrM03S00j3cecmp57vHe6jkKNCLQBUaGsRPl+SBSkFhRNE5zWw
	 BKlKcRvTtrtqW6m0gEmAeoCjiIZWwqoQkbO7rD2+57LSbczUQR8ttueUcEJtz8Li5jMYB
	 JGcsNYmt5LnhL9jgPgag5Flqn/YGRUs96fH3b3U/+oVtHIt9wo7bMHti8GMUjVwD5veT2
	 /j7Aznfc+79Bcd4NZLmmkqYpNV1zUt4bR1wMBEUysMVKKuQIdkjNpqZEMIcAmB47V3G6k
	 Mvbt8azQufUyoQKAyIAdqX+HBiBHLaLoFnl4wIAwcO+UIME2OAWRJEo26eETWmsQZPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=izwbJya4;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB9B606A323;
	Tue, 17 Nov 2026 06:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB9B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=izwbJya4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794897969;
	bh=Q+gF1IpQxY3Ah+YgluhpyTuzIbzQciSEK4mZyW1nqNs=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=izwbJya4Pxyd3RK3GSchVQ9kH6RHkXfc/xKaVRxklhelB363uhnKDHzgoxPW9th4r
	 UgCFxTCvcsfff4tCipY/+pTeUDf6waKV7F/nYCBRNY0BU8SXAWphj/Zl4SBhL96VQN
	 4k7V42p0wiwxumILpguiN09ILkeYSJVQbjevkraY=
X-QQ-mid: esmtpgz13t1794897968t2ce933a8
X-QQ-Originating-IP: xAtSpxecaocUxTGnDA10G8x8aHp91+CaQjY0yRXZ998=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 14:46:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10056131255817741553
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
 boundary=7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 17 Nov 2026 06:46:04 +0000
Message-Id: <DMXA85POOYLH.3L9L2Q53OUJ1T@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Sarah Emery"
 <sarah.emery@canonical.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Guodong Xu" <docular.xu@gmail.com>, "Yangyu Chen" <cyy@cyyself.name>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>
In-Reply-To: <20261114082802-GKC100523@kernel.org>
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
 <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
 <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
 <DMTY56PU7CP2.JGIZ9XDXII9E@linux.spacemit.com>
 <20261114082802-GKC100523@kernel.org>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M49ymMyQ5YfuZg6AHji/LxP0UDNTO7r2jo98+M0qvUX4dif67OklTrti
	6woR+EJMu/y5pS6acK8mM6gXVqd6TEVKgyiGUEzYSV6397JK+J3EtEAyZOGiInLruUkmviS
	sVjVrcNqvU1DlJxspttEshw62Iuv6HJN6DJ3iMwHeXwvqcTcEvHwcrPi3gOfya7x//uJTcz
	xLJNBDpM9Q2SbwQrYfar5BwWsquhJUIqtLFtK1co7fK7hx0RnaWpGEKETDY2HDIG4KaaoqB
	Za9tJrDpxzdGHsHiJgXlJWBbsjybGyku6fE9zTdAtn6CXriUReGAgjav1TXE1tfeJGZ+2MO
	7DMXvphl6+nWBITujelevxOLpRYXdpUOjzkGfbM7xTgp/va9EUmVdREED5vrpLrZ96Z9xl6
	J3fp477KVkKq1ukC+Y25FpkfHJ3jWeUZ32g7aVperHtcvYOu/yijnFtChQY2tj6Ykb6Xbqn
	98xtt0E4ADM2CQ0ZvO5Rd69BF7q/kVOz+GRkwMJ7u5JnJmFOAa+NkOq7Ko4DymuVrhNQ0/x
	HzmoZ5U7rRlmx85VWQqaeBr4Bi+7QqIdZt/+AHDR1VZ9Q5aHbAyVQcGXTahmleaRhy2WI7R
	Ha8TxNhMibgihLs8DIbGotj+f34/VYR32C4EEs0dsK6PSyj9vbiChQSADJx5asY3w8yFWbb
	VT7Rr/QLjjRIOWSHX/Rb6kFCn+nsRdCjnENV3saFnYgo3pdyY3PGFiLz59nw5BaKJD4Lawg
	+IApcur6J/oCW1bKIcrFy8bYiwKr/YII2Xy1vrKuPiuAbJty3+vsQCnNZ14DSF/JGgBz+v6
	mHTLcFVKkjz1zYhhNIS1vuWwPPGQKLwgxjg3X56S9EmpjILCYPTtScgGjx5GJjfWPJzBzuE
	6np4hkGGQpi+1MNt8K5VsLgUtEzJjxZ/yjIBSRBP0CnXnht1JwMI2cLGRodXw1/Qh++2uaX
	wuVstoJ42krnZFBYFsYnCgAvL0hsD/KVwsteeJg9c6R/GAKkF8bbbTcIZc+W4PdEYDsA8pm
	C526P5oG8r22tVTq+AhryMMdbEoGqtB+dZIbGI6XPdhwoRs5gVznhpguflHUhZzEPN1Tcgr
	yF8ORU5FLmn
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

--7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 14, 2026 at 08:28:02AM +0000, Yixun Lan wrote:
> On 08:39 Fri 13 Nov     , Troy Mitchell wrote:
> > They are the same carrier board. The only difference is the power schem=
e
> > of the CPU clusters. The bootloader programs those regulators at boot,
>
> If they are physically same carrier board with same CoM260 module, but on=
ly
> the power setup configuration is different? then no reason to introduce t=
wo
> different compatible strings, if still need to differentiant, please find
> other way out?

Agreed. v2 will only add spacemit,k3-com260-tq and k3-com260-tq.dts.

Once the regulators are supported, I plan to describe each power scheme
as an overlay and build the other variant as a composite DTB, i.e.
k3-com260-tq.dtb plus its power overlay, so it keeps the same
compatible.


--=20
Troy Mitchell

--7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavv4LCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+fyAEA32fW5Y/DoYv2
3Cu2McB1vRv5wspPyKSABjOcL99SY0cA/1W5fQ8Axd/DB/a+Y7vunNMxiHzELf2l
tN8+CTlqC5QL
=RSI3
-----END PGP SIGNATURE-----

--7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd--
