Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206296;
	b=VlgL6XR5BpLqLl3ew7AGTl/cYz3APqQpPatIst09JT9JIyMl8WciNGEHNakbs3hx6mFV
	 DquVimd4eTS6gjD0WYoDOI5dLVbMkIugcetZO+X3/xH4bFjvDKhaoD6WEx+hjhWw5deTm
	 TfQxORrucs+vhKq5pKAPe0dXnlmHO4+InyAE2y5TcXiqBHkN5dYgGW1MQSSItr4AImh77
	 VYcdU+I6PgaclXWp7dH29chWSNfR0dsI44wyVxu929ZQBCZQldDSNcTWJ5EfHaKibUsAa
	 Hoaax0OKyrmDszwjQmfvyRrS+jCj3Tkz4t363qb09G7f90KkyooBWnvcKR1h77QWA2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206296;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=CR3tvAfi/vhuKX2kubcVJ3VNLkta73TBFdrMFqobo34=;
	b=eOjSUY7D1w5lpV1RXO1SmIa+1DnnRol8MiMVCQDv/ScnUl8wenvpqlRTWj7dYRXZO5GW
	 LcZg8N3H1yw+ljnN2yMYKMSkbPRGFSjo2wRYz8gWDO7uLSyVN496KMaVwbRdVpcNZBdBt
	 h2392IEEvEMqOERk/X7gtSdt2Uihn3nW/azeRZBtsJQe7L5dNU+LkUv1IyQl3KfsvOK5C
	 JHMCAEE+Czp58i8HmXJzWy2V42F962iIj4QR1pDsFOw2BCYIGdtnyJGc+C2EwOYnrcJfj
	 ZyBqauv+LUv9Iap+h/xtCErMbweWHn35+10lO+e7gpp0XkoZbOXq8Kioeui4OXGDZIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Uc5YasCA;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010F7606A31C;
	Mon,  9 Nov 2026 06:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 010F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Uc5YasCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794206286;
	bh=CR3tvAfi/vhuKX2kubcVJ3VNLkta73TBFdrMFqobo34=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=Uc5YasCA9pnYq/k3nXtz0WOFRPWqrjPmW/9Lv7LecXbjQIU/RxtvMZOjxY8vKyarA
	 yP/VghtGjVLUt9Nj8SKqXnG89AF1socEpFVdJoI4djMbA8DqvsyBJN2ZlrRrigRpXm
	 h9VqCWhl/q0rYgDdME5scvArbDxzd+7hzDmHVDLQ=
X-QQ-mid: zesmtpgz9t1794206285t825dde49
X-QQ-Originating-IP: IwUfJm6QB9d8NP+i4b6UrZEEoyyhvenPAmFqfQ3k46w=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 14:38:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15929030815488421648
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
 boundary=a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 09 Nov 2026 06:38:02 +0000
Message-Id: <DMQH1N9VV1IY.2Q1NMMIKR2MIN@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add P1 PMIC regulator tree
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033240.361416-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261109033240.361416-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NNBDHPWljGq3kZDWZpYvuOgD63xfOxUqXXPmJ2z12Z52oSqe5fWQQ9HD
	Usv+CSd59oItI6TuTBdraG0vkWqoH1MeZbYVGd6FHgbclOft3Xk8mf2ouwTE7F6/6uhSEpo
	UH4dgglEs5HzKPeK+6XyrfNdwPmyfNfgUMh0JlTLgvAK85VNvxFhGcPIikuM5qrIsI74NDv
	uIJmR6JZ6x0Qqls2SCCefz9V1b5TLA8JKU2MKD6Tmqx5feb8CdPbmyhp4m6c1f+2LN4OcHM
	nlqKrYYMFKY3Xsq7+2YREzKACIJ+6S/EOJ9+Zy8ILZVRgvTviHWDTND8n1YRx3aGyJ1Z+SY
	4Fa46j88exh2nRhSoSLly11TcassfhuNAfCh1dYyZMgTO6k9wie/CRnIQFq6dJdemyUnK0S
	5tONXhDJum/nhnJsAA4FELoi6Afdx53OYYsfT93C53FUx4GUjbVSQpsdbKJYntfdLvarqnz
	kTcojHDJH3AVAd2WYowsvJeKX/ljSnNksq62N6HMnS6LaUB7B+2klTWq5vQvYMhZMcrVPh+
	TQ58JEPZFF+EKOckoWHrexA5GKPISbEg+FyDdgpVtA6uWhPjGy3TITRt6oi+1X9IHULq8am
	VG5Pi4Ztwi7EyarXcCF5Pn7+4nE9Sw7ztIrQf+eZxTDL/mJlaqAYnTpKcqCPfp6b7Zb7eIB
	1Y5ISSLqNZMos+t1KLq4h5SNbq8lMiWUOYpEALDMDyOXZO20cf011Wvn9R7TsEZhR6+K84y
	9pz1rmDBMKn9+CDf9m357K7jlGWPkTGfaJ3L7ymYyLpdeXTc5cUi5mMZJUVdikLyjgH+YmT
	/UwnMu0SIdeJ5AN0u6NL0ZupIYdTkEXmnz7Isgwjh11psk2Lp0+AZaC37bBmaApqq/bvOJ2
	kqW0E5J+57yGmudUIpvjmvdFpGuA4/kTLeKs50o2/f3Pkdq45xG7fTgB7o09uLfD3CCjj0f
	Eqb9QDaiEadpyMtw4xfqVBcagHWC/bcKT1FM+qDgRK0Dc0wBXOQldWp+HqdftQKCDVD+ani
	AuA9NrYo4UgH9DIfKNI2hhUdiL0vQFegzmavWwHP+v/l2MkYm4IQasczTmOd+mODZHSbWi4
	ZwP+GFPDMVwvB6H6N2bi8IJQmpyPbgyc2h39FJiGJ7x
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

--a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 9, 2026 at 3:32 AM GMT, Sandie Cao wrote:
> Add the P1 PMIC's regulator topology tree for DeepComputing FML13V05 boar=
d
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavFqSiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+cawEAmuTbJIBqSbKS
j8uuHL7iWjyMcnsLj7MKWkndH8HZa/IBANz9W4bE/oiXueScqETBLZGFyktM9kC8
/G7QkwtLUPUD
=s9s9
-----END PGP SIGNATURE-----

--a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2--
