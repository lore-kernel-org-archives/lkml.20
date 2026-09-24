Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90EC1C5D72;
	Thu, 24 Sep 2026 01:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212713; cv=none; b=MycJygTY/hOuo3VtFvXM8hvcgHvtNqHHaYGhNO/iiZ5jCEOSWkRVUoDpRNGsqvqR0jGB7hXjm8whskaCCF2ISatdsxchxmTfhanaO2x3+EQ6gNZddkuyQpbb+/hb9BiJSUHHXGv1a02pK8p0EwM3SWVE8zqxjStIkTiuV3YAm1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212713; c=relaxed/simple;
	bh=wcjqT5zLGdrrSIrk7hVbs9nJEwefguc5ABHFpulyxt0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=uIRZwDLgalnshfn/97rlk1OrxNKAKF2feuCzKuHE7nCqRKdRo0klVRD8fDvqDQzvLdmlpHRHksD/baz4H4Zb8GgCkcw7PFe4h/DtZetlX3x3F860xLSO44hU2qrdN5sg2lJxvnnjEPELrOfsHtcgrrOjso8w4ryHZHMtSNdKLqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=dTa6tl+b; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="dTa6tl+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790212696;
	bh=wcjqT5zLGdrrSIrk7hVbs9nJEwefguc5ABHFpulyxt0=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=dTa6tl+bERQa7gYr0t/FyC7k8XFGDd427c7Xf4wifZXhQ2siakB1mql1CZtPT1u5n
	 bBy0dzloNkuoHFUyaKgKXYLb2Zh+ECwChLZTszb5iGwj72LQNXUBuv72Rk5/GSCP02
	 FEGcB4nVKwZLqy8oysDq7F4C95EFdYtn4xBd19nI=
X-QQ-mid: esmtpgz11t1790212695t9b09bd1d
X-QQ-Originating-IP: /sHGXt0TDi1uFlPSWcx4jxzF2o8dTubagV/rfHW7MDg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 24 Sep 2026 09:18:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1097969116973290679
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=09e63298bdd63c1cd28b1e0ce1b67eb7db8835fe229092788c9f41ea3312;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 24 Sep 2026 09:18:10 +0800
Message-Id: <DLN5FOFSNKV7.3NL9LZ0FYRPHV@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
 <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn> <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn> <DLMKXCP8EDNL.JW6NFGCTMJVN@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.a37d568d.f88e.4fdb.8c5f.8da4b148415f@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.a37d568d.f88e.4fdb.8c5f.8da4b148415f@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: No4GWyI4cWt6YRNxkeKW0ijY2/NeevDc4TCk3HpmtEUtPFfOB3UfGhSR
	MunG1EIlNKdUn9O1SX9oh2E35HgeGKOFMJlNuQASb0TynkSr0QbDRVcH60jBLwIVVK/m6yt
	msu1icJ65e2glMlJ+QHM4WZiYBJo3KPmtnT/MYQBaj76pT+pCscvZxT73Kx7LUudl/kb1ot
	UxT/F9tn29gjNCqQRfylJuCgqGgDG7evC4TRf1AYwF8TJMF+gAbfCnghKUBGKnPigEs5Efg
	v9z1ZmazrjELPUqt64+LCoxtkezbEGL1bnzSbfQ/Trn+JU6rfYiUsc9Mw7kTwCgQSd3Xg1Q
	/mK8mQGrEhaUrRIjUKlGQUUPJgw9sFOzUN/HkmJg6++XYwPFMJFpwbxiG5MR7ZJAsyp8bMf
	Qdo9qag9qbekMF8HE5A6qD6Tcdf4z/CpCaQ+MioK2gJr9nAUAQY8Rio0Cvvhz+is8Fb//Ac
	a5aU/+gCCfn0A5axe/CjXU04P833JNcVeMO51HnDVbfbrsHkaSs9BVKmZoUm6sX7NzFY3Zk
	B83F8ZQiS6E99k2zzHvOxZFhrb+O7+Kf9vz+fzoQ25t0ZMY4xvrQyiXt7iI4tLyWxHLYlYR
	BB4e80pTqJcfnns46dMZ85vGSn5iuVQSL+C/uGnbnMjX9YK0spnSAojW/8VDWjTs/C6aIyO
	zmyIptgsiG1x0FdWCJjyOWML6QJzqiYdDOQzaVIQUXNTmiSerohuE4SZjps9B9rr+ynoso+
	/Ojq/LPrMRKPNMzQHndLJrFC75wN45SwLMrxNRjGkgTkfl2IfAxUuclHrMg8myEWsROi+H/
	S6wqLpY7+sVhlVNsbwQUGj0Hq4tq0ime0qy+Pz8RnU15GW8ZTbJMU0GZTWP7utIe8KLgByJ
	KUIpg5GlXpMSn8zm9QmZHi9/hTr1KJ8J6RC31uhytlxnw/Py0/2WqQjJD7voaAo2kILx88h
	ZBfKPuOFT4znEH2VtyMPocTD/IYftw4LsUUbZmMAsQIP8lmPMQ45gwnKBHNkMiX7cUS7BPg
	zf/jO+fh+bL8gTBT02aFl+N+C0W06z2oDFtv/IDT8HDLCdKXz/z4uU15zNTCBAQNAUkdzG6
	g==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

--09e63298bdd63c1cd28b1e0ce1b67eb7db8835fe229092788c9f41ea3312
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 23, 2026 at 5:51 PM +08, Sandie Cao wrote:
> Hi, Troy:
>
>> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
>> Date:=C2=A0 Wed, Sep 23, 2026, 17:14
>> On Wed Sep 23, 2026 at 4:01 PM +08, Sandie Cao wrote:
>> > Hi, Troy:
>> >
>> >> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
>> >> Date:=C2=A0 Wed, Sep 23, 2026, 15:02
>> >> On Wed, Sep 23, 2026 at 02:35:20PM +0800, Sandie Cao wrote:
>> >> > FML13V05 SD card slot is inside the board, it doesn't need cd-gpio,
>> >> > FML13V05 Keeps GPIO88 to low, Then SD card is always on for SD Card
>> >> > driver.
>> >>=C2=A0
>> >> An internal slot does not necessarily mean the card is non-removable.
>> >> I don't think its location alone justifies keeping card detect assert=
ed:
>> >> GPIO88 would report a card present even when the slot is empty.
>> >
>> > Yes. The FML13V05 hardware is designed for this. We can't change it.=
=C2=A0
>>=C2=A0
>> I may not have been clear: an internal card slot does not necessarily
>> mean the card is non-removable. If GPIO88 is connected to the
>> card-detect switch, it still needs a pull-up. Is GPIO88 tied low on
>> the board, or does it reflect the state of that switch?
>
> The FML13V05 SD card slot doesn't have cd-gpio. But the K3 SD card driver=
 need it, so the GPIO88 is tied low on board.=C2=A0

Sounds like you should use non-removable or broken-cd instead of
cd-gpios.

Note: Please limit line lengths to 80=E2=80=93100 characters.

--=20
Troy Mitchell


--09e63298bdd63c1cd28b1e0ce1b67eb7db8835fe229092788c9f41ea3312
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarR6Ug0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvlDoA/A6waB73+9c0ODRYFcFHDTW3c1NvzQiWzYM32t0A
jGw9AQChT/NpSJCNvmUJTbcRlbZfurFIO90wLjsaHzuQy5IeCA==
=iXb7
-----END PGP SIGNATURE-----

--09e63298bdd63c1cd28b1e0ce1b67eb7db8835fe229092788c9f41ea3312--
