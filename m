Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BEF3164D6;
	Thu, 24 Sep 2026 01:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790213046; cv=none; b=lfvyYEl362bc5OdbGi+7LrYz9jlF4rs9MpqxHCdEXJDVIWF6gI19+gHP3LF6XrfSJLHUqu0MI8bPoFDVcduE7qgb9U7hcK/UPPj3FUFm/Jz5byP8FOL4sCSjohBrQmcxfbeobzXkX6Wyh3nFP/vfoWWuMcYhcYBC2UHjFmEyZO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790213046; c=relaxed/simple;
	bh=CmRkFAun0V9z4Fs3pLZbUq6i5bmcTNIxlCj9GMS9tOA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=glrmK2gqt09mNg5CL8/tBrMUA2K/xVywBiZquKFy1D9sIeoEzAYITHGvd1g/KqIvbkO/dUTSHfPEtkUe6kXbbRuKNSTvluvtgo2eFOJmRlvEWqRBIpPjEdy1H0nd7knKrnlrOQUHmkDo2I5hGUFa85o5Oa9h94dRPKyWcVAuL94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=sqtIWE7R; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="sqtIWE7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790213033;
	bh=CmRkFAun0V9z4Fs3pLZbUq6i5bmcTNIxlCj9GMS9tOA=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=sqtIWE7Rt58op797pJPgXPV9p6UEYWPLOdXQGlFQeugG03h0G7Tx1efFMuuj5L8I/
	 BCRReTxnK4hJ+LgNI28C3+2nTZiHaEHEAFyta9dX+sazokHBPBdBEC48PMUAVrpyPw
	 TE/IIQQOtT2n6Ou1gW/UHHT5im+pOSsq4XxRKtGY=
X-QQ-mid: esmtpgz11t1790213032t84085d1a
X-QQ-Originating-IP: +sZ5XpyEU1H6ti2hpFw0dmpKe5uv2nQk2odQ0iZ9VMA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 24 Sep 2026 09:23:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17327670691509300226
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=095ac3c6058a4dc13a950a888a02e4afa37cd9095f0740980bfd89424564;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 24 Sep 2026 09:23:47 +0800
Message-Id: <DLN5JZ9OM1FJ.3BTU3OU6JAQ7H@linux.spacemit.com>
Cc: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <palmer@dabbelt.com>, <pjw@kernel.org>, <robh@kernel.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <dlan@kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20260922072910-GKB353745@kernel.org>
 <20260923064020.210794-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260923064020.210794-1-amadeus@jmu.edu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NPoj0uw5JpnxjiJcqWedJcoBMaSAP5cA9VY9ERVXmsapFJShDSQUpZnO
	APDBS3OVUnNDzzv9neaMQd3oUAFNwfbX2p+wcg6y1Xml7toonlSsHnjOGQGQxIHnG3GCXHx
	IHf1xA8Vtx4G6bYRFveuOsLUxcWKov8APNiwzRVAQRn5BLPN/8gpY0hj1web9yjjrXFMfmp
	SkWPv6Acx1EMSiHgp57hWx5djvWEIjUFRMEy8GDSiT1k6NA88GajUb7GnmSzjRaNw5GTqHN
	A/656+OFxBUmPvAqXHhg4zg6kWMM9RK3HCL0P9PCT4U94gKjU9Y37mvUPO1kiMHYtBbPIsm
	VpaV27PvyWhKrmcnz/uha2Pr+3k2ouUDGgZJx4SwzLJU+QL9fw5mOsO7NLQ4fMYyZVTViZO
	6Wf6YvsuwpF4EGO1bQNFTmfS8/0F/oc3i1T82LRwsJqD66YEDPWiMMgqU4BnqYDCg33dyRk
	ZDe6RNsjzl1NEWxH+P+o4t62MZkV41L/lJktbaVQB1jW2nSo7RZWeL/5VQXLzJu4uWttxR4
	ZDHp7q3gNWQhxnFN7t+C+T4EKslvBtf7WHvaoVK9eM3MHD1aLVFvcMDEmC0zCvHJr8aEJlh
	5RDWEUnpgJRrUEQM1E/Q9oqf3JZ9beHWFosi8SjFz6d1Rchkomxups8ILQo2eIUBJI7rKbJ
	hJMi3VynslUtmOYeIde/aY4Whxp9jN9NxZMzHaQbyrj7o/gVttEzuvw9Cjo5oAFhRJI15O+
	Kiy0BUln4JMt+C1dKPtQK7wTxqsiZlbrv0qjUrjic+XyX3/h3VlYNQW9F3ST2riSlsuTS3G
	6sbU6TMghCcdEKhR82T0Xs7RvlhR50Z4A9rtE//p91F9BFVhxy6VQGcua5OjaMCQQXY+Lb/
	X5KM8N0GGyWH+DVU+CGeGs8nnjyP9yuph4tbvGVOayjb503jc5GpQPFUsOVeng2nV6Rhqvy
	IyykIG2goQEBO2vb0xxptve6r+Zd9s+3SxH6mwYAZXkGkvpqfqC5QyBYwlbRRBruGKSRxVU
	6L4AogxvflqcMPEWkkEFm9WQcAQ1vnzSxl6LbUjPkCjA2Bn2k3di2oyhD8faYcDV8GhztwH
	gdLgqTlLn0dzlKPEo12T/L7XVKuUfq/KzrECc20NEmtN2B2DoR1CMqKmyOI1TIZwEIcqv9b
	iSSWbWw0lKWzyDhjjnJaB/Pubw==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--095ac3c6058a4dc13a950a888a02e4afa37cd9095f0740980bfd89424564
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Chukun,

On Wed Sep 23, 2026 at 2:40 PM +08, Chukun Pan wrote:
> Hi,
>
>> So checked the code, it's not a direct problem of /alias, but due to the
>> env variable provided to override the mac address, see
>
>> In this case, I don't think it's necessary to drop the ethernet alias,
>> I mean it's totally fine if there is uboot ethaddr env and it wins
>
> Once U-Boot overwrites the MAC address in the DT, of_get_mac_address()
> will return 0, and of_get_mac_address_nvmem() will not be called.
> Then I think this patch is useless.
Please check my reply in this thread [1]. Fetching the MAC address from the=
 bootloader is a
permitted user override, which is not meant to be guaranteed or provided 10=
0% of the
time.

Link: https://lore.kernel.org/all/DLLPWUHF8WRQ.13YQTP32MG59Z@linux.spacemit=
.com/ [1]

--=20
Troy Mitchell


--095ac3c6058a4dc13a950a888a02e4afa37cd9095f0740980bfd89424564
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarR7ow0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvlRABAKmj+L1V4Z5eC4+F9m0y5qC7dgH8ES0DV1DHZrpN
lctUAQClrhCE5p5Rdjn9s6JZB7M2JKrP6IVzowMjcs5TbYmjBA==
=x1MS
-----END PGP SIGNATURE-----

--095ac3c6058a4dc13a950a888a02e4afa37cd9095f0740980bfd89424564--
