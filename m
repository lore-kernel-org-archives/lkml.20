Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F1F55820A;
	Tue,  8 Sep 2026 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873175; cv=none; b=npQyj3ULuNGxBBPQxESf5/vQPt4llSsJPyNvHHs+ACYRnm2rgHNHR5MiPiExrCH7nks0BoV0Ps/4V9hyLfHCrYhPeual2qU6THQnSZnyCtYoY71Ajq6elYdWdaL8qayegRp3Mu80Wwxf7e1kmv4b8APNbeZDYscugflSlAVwOCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873175; c=relaxed/simple;
	bh=xbA3TJsJKFl8Kye8hJSzoPXYOQ/DZQR1Qmu9u203Sag=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CmL7I4jSkAU3Jd3ZB+uc9OncQJAMlancskzD4v9UcgG6Otx4zQNmzs8pRLlzStQ5VxmyML05woTsofiAi5iEghyaJ6CKGw0r4ILwXct44cNbfQ8/gH5RRa2npVX965QDpPHq3E6BlQwOF4nmKnDSro5M0lleTgheVpgU4aPOzqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=V1ymYYim; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="V1ymYYim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788873093;
	bh=xbA3TJsJKFl8Kye8hJSzoPXYOQ/DZQR1Qmu9u203Sag=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=V1ymYYim0b2xlbpkNBUwv2iB62l+6jTcz1WgsL+mmSmi0qRXgtczPwQuS/SOn247d
	 GhYk4H+YDGJz8DMNu2qimhIeUMZGkNjalyT06m4SNJ68H75lJA71Tallsj0S0tPCY2
	 /jqL4GYasmkuVWtoRB00KlCRiCMy52t/kAxhfWXQ=
X-QQ-mid: esmtpgz13t1788873086t4e5a1872
X-QQ-Originating-IP: SQ6UZhO9IynKB/MfyOlZNAjrd1G0saGKWG5F9GK05qg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 21:11:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16403462046792618605
EX-QQ-RecipientCnt: 21
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=0c6c867a118613367d54fc38d42f6b057468feb5ed531f17b32862ca5431;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 08 Sep 2026 21:11:21 +0800
Message-Id: <DL9YL0LLHMTG.22MRAFNKYSNI5@linux.spacemit.com>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Ze Huang" <huang.ze@linux.dev>
Subject: Re: [PATCH v2 7/9] riscv: dts: spacemit: enable USB2.0 controllers
 on BananaPi F3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com> <20260908-b4-spacemit-k1-usb2-v2-7-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-7-f07342ffa051@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MgB4ni1IX5Y96eK3iLLnCijDMVbexrO00FsP9GXePlsZjvfqPVd7eiQe
	hoSV7u9cK6Nd5kS5bOrEo76ZXzbyPloYsIS32iRvUr0voxHfV+bwOOF1xFEvGOxP8xbf0a7
	fglZzUfDyVqKNn9iYkEc1VGem7kXsg8uXpofqa2j+S4lIi1yhPpmPV0xSoLJAkLWVsV9uig
	ULYV5R5FQ/7tiKtPKZxAexC0Qi6jE5+5gUjXw1zdv5Hrkj5ir0Pqf9UwZeMURO4zTq7dkgh
	7uFjhGK/kKbhu9ODGyPbA9NsREodOF8nBwwztJKvSLmMClZc50i8BpvdcmAZN0VoKFyhZjI
	TuXyyGLktzCx4AKBWzxCN3ICBzVqWvwY0wqt7e9IjeE7EY3rUJCyrKBPipvrzJkSTcw/jND
	8Jj8O/zCoz4p0KA9wtXCM9nLaAmofXuYvVnf9cyojSXgQUQWiPNod4Fwl264HCs1hna+d8V
	2vWza1Uj/Y4KOSTLBpF78VOM0HPOOSQoiJOgEwk3mwqL5/WDwUYsC5ns0jru2pP6H/AP7z1
	i9AbYz52HRoFOoKN9n+LA1VzYPdUTEIStZ+Vbgj7K/Su1nDofGE33p7bn1oXqZAeZmg8VPf
	9NkLO+ZgNzya+bbAyI6hf7+HAyA2DczDU8jqKxiu7aokqSRnRLhzuS26RmKsuFI/L4mK2rw
	uoBDbSRaKidNCRk+xE+42oWPJpi/EY0eS0AzL5jpuDBZs/TVRBCBOZN0OWyH5ZnNRjVLQoY
	urgkgPjuzClfpDOGDAryGDBRLY3Ijqh+gJNSfCtfsReiDWKXZ58hv+Dr+ba0VitutiYO4WE
	D+FT9UdPQW/ID9UFouZ9ZRGjHD6is3zDXErhYZrTd6iEzqfU/60O08ib0EBheTMu0+pPZaC
	ajOLs+6A9sxzRTVQKBuwLe4frmETzSrY5/z9IXNktyE8J1VmwcxtKKr9puNY7fH/4Fux/8I
	yZoPgAKcIqQ8YC4darkKAcvPq9thIcANFTzMEeFkuydjhCT4mMdgV7WvN+poRsKIKTmUfBR
	XDvBcLQu4KeD8C+x1qWcE1fAIpIrAR9c9vRN2yUijAoQVLkE9DGh+3zxrFKiKahw53LREG8
	wutdnl/Qo+al0opfxA8BuastEvpvp30hIx8aT9/zA7qNXCUl4JVdqk=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--0c6c867a118613367d54fc38d42f6b057468feb5ed531f17b32862ca5431
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 8, 2026 at 5:48 PM +08, Junzhong Pan wrote:
> On BananaPi F3, usb2_0 is connected to a Type-C connector at device
> mode by default. This port have no VBUS supply capability, thus host
> mode only works with self-powered device or hub. User could switch the
> role in sysfs.
>
> And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
> support cellular modules.
>
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell


--0c6c867a118613367d54fc38d42f6b057468feb5ed531f17b32862ca5431
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqAJeQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvJnUA/1+zbNPo3KJYIYHyUpwaaZBC3MD2ZHifgIIMyl6N
MnoIAPkBT7qj4aYXw4R5MJLRsNt8mascl2c28wQq1NY3we9oBg==
=poA0
-----END PGP SIGNATURE-----

--0c6c867a118613367d54fc38d42f6b057468feb5ed531f17b32862ca5431--
