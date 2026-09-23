Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201247ECFD;
	Wed, 23 Sep 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154848; cv=none; b=sR2F2z+997v98vuE66lpjHg2gNCBTo7iCheHBijkcyqStLGiXWQ4BbccbQe/eq7FxC9mLv68ZEouF6ZNU+RpKX7JvuNelQogqMbHBCo/q2Z3Vd6DI3HxjbRnMd0sfGiYYCQ/IrghWxYuow7YCa2+H4fPTMbdLDJINp/suv2RUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154848; c=relaxed/simple;
	bh=RzHBofAf7YJyZ07FII2LvnkIIRSoJB9/EG93JfpCjsk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bGdreMQZplm4YclNgASf3iuUhOwhHHGlacSNN7hXV56sHciW46WQImlsUIN0TBMdYK7gDe1VoPev/xoY2InlCR+tfLK59KOiydHAo/xZTdtwdGU0/2YbQACJqt5rx/DYPzyjf9xst8FjG3aQGVuoPjLMLEFrxwwKFXBUU2lciis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=qTh6+gCj; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="qTh6+gCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790154838;
	bh=RzHBofAf7YJyZ07FII2LvnkIIRSoJB9/EG93JfpCjsk=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=qTh6+gCj0Ox5+uY2pC252CptCozdENNnG6UbLAhSnyaSp1/Ur/vLefT8hd3luWNns
	 Jmi18Fc6/euvzgirXw/iUEEryfUJJ7ZPxD23DDTtuCPC4OwE7acfFimaerFfkelKZ6
	 kYtW0mUVxKujSKpUQOvEdG/caIWMALQzBzYZ6IKU=
X-QQ-mid: zesmtpsz3t1790154837t580f4562
X-QQ-Originating-IP: eFC3jACj3kP1sOn8Oha0w0ojCyaVTWCqfCWFgoeOviM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 17:13:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17194645670919471532
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 17:13:52 +0800
Message-Id: <DLMKXCP8EDNL.JW6NFGCTMJVN@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
 <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn> <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OSwb8t2Gu9GeBh6Yhje8f1PmDvECXyxINs4sdeBIi2D0kZ5imxr/qx4z
	KQtqdYg/hVyX+ZML0B8ui29KDpXfoPJHv0JE60QzS029VsrFnU97PpEg8V+H/n6xUx4EneQ
	xJv+9l9RVTRbIflDUuqO6OK+lAvWTBeibEkF59278khwsVS3t+XbGKNB8786AFiMzzc4J2A
	9jzpFpRa/dQx1nsGREiCewgweUKpnbRqiiAyibwz5Zf0tdYQlQWbNeFSWze0YNmRCMyGPv+
	OxcrhZH9DsDra0Qp9GQmJ+pdqEX4Rp118sRMKgH9sg/EAAouKXbmZXg1IYfPSv2/Zd+lOkJ
	YscLl+JSTxxrSEf5xwmniNY21MLBdkCjC/i87u+7wtjPTEOkrgvxxzJze6JpnIcmsy+3d9W
	a9hiyPITopvr66pmOZDkRTOKKzA3tcBedsFPjJSx7WRwvmZZbyNQDq6F/BZXZ5fhHJwsWh7
	AuNUb4roBdoIF6jbgPAEfTgWlgF1klLa/lNG1bRDH2IcsbI57oz63TUbyhan3aiRK7Q616B
	+iZ/pXCvE4dlQw+1NgjehVGYrEYvokpb5cGDg3M5FWgBLD3fwxqezMoRyNVIQijYpwhN9pg
	+Db4+gnWmmSWRcf44LeiweeFqwx8pUdXfZiLl5mSzThI/RO/8A8Qvm/ZCdimNjTInzClN+t
	tYh4TdVy353NMJvYG/DZdCzC1jDH30uMPLHPrUjLz67DUK6yAejbC309MSnL6agt/ALN5Oa
	rIHX5AldYlvecgj0uwk03AOgctDwYQIvHLnc8WZkAsNYHoYbYQ85eileMf9g7vcSHDu+fiO
	j8FpTVwW2MMqguXgoJbqX4+C0yTcWt37Gh9VR67QBCwdA2ZTEnwDK6mC1ZJzXFaenzxmb3r
	YCwrdPqpH46jOObfu3xhiDR3qAW0wcGQK68psJrsK0q9j3Fuc9GxGhJzd82ZRxzn7j2Pk9v
	IsrBKRiC3nn1HhRdwC4O/emMVwAUMGwuutz5TApEognM6CD0OGx5J4fIH3gXJDYLxK3Pn25
	l1vYfKfrDLZvC8U5WNh17Yu47lBzH+cAMNUCtHk8nYbyEXpJANjcG5PfWzmPHykwT80Qa3D
	qSplG2hBOgzm9aHjwRNIAHcUg9ag3Y6xTLgapyDmL49enahGxWgqDzdsnOZkWnfwBWBWiVK
	n0ZA
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 23, 2026 at 4:01 PM +08, Sandie Cao wrote:
> Hi, Troy:
>
>> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
>> Date:=C2=A0 Wed, Sep 23, 2026, 15:02
>> On Wed, Sep 23, 2026 at 02:35:20PM +0800, Sandie Cao wrote:
>> > FML13V05 SD card slot is inside the board, it doesn't need cd-gpio,
>> > FML13V05 Keeps GPIO88 to low, Then SD card is always on for SD Card
>> > driver.
>>=C2=A0
>> An internal slot does not necessarily mean the card is non-removable.
>> I don't think its location alone justifies keeping card detect asserted:
>> GPIO88 would report a card present even when the slot is empty.
>
> Yes. The FML13V05 hardware is designed for this. We can't change it.=C2=
=A0

I may not have been clear: an internal card slot does not necessarily
mean the card is non-removable. If GPIO88 is connected to the
card-detect switch, it still needs a pull-up. Is GPIO88 tied low on
the board, or does it reflect the state of that switch?

>
>>=C2=A0
>> > We check the vmmc-supply is p3v3. We have the same SDK DTS config with
>> > k3_com260[1] , so, this patch follows the SD card patch of k3_com260
>> > dts[2].
>> >
>> > If this is not correct, we will change it.
>>=C2=A0
>> Could you confirm from the schematics that the SD power wiring matches
>> CoM260 and that the card's VDD is actually connected to ALDO4? If so,
>> this supply reference is fine. The same SDK configuration alone does
>> not establish the wiring.
>>=C2=A0
>> If the card instead uses a fixed, always-on supply with no software powe=
r
>> control, vmmc-supply is optional for the MMC core; it should not point t=
o
>> an unrelated ALDO4 rail.
>
> We check the schematics both of COM260 and FML13V05, both use p3v3 (a fix=
ed, always-on supply with no software power control), not ALDO4. ALD04 is o=
nly for USB.
> We will correct it in next patch.
I'll send a separate patch to fix the CoM260 vmmc-supply reference.
You can focus on FML13V05 in this series.

>
> Best regards
> Sandie
>
>>=C2=A0
>> --=C2=A0
>> Troy Mitchell
>>=C2=A0


--=20
Troy Mitchell

--c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarOYUA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv/VcBANrKAZZo7hF1396yvrURKeblfk6N29sDuw3EfLqH
tZYVAQDII+/ULNRkpNFcStI32cx2tF70GmPyD9BkywqSZiBdDw==
=hVAn
-----END PGP SIGNATURE-----

--c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682--
