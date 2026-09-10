Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189503D7D77
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093094; cv=none; b=aueoxsL1j9Ti5rGq/v5DXh8h24dem9udhlzalQCxEbU3za7z0xF0+Y6nu29jzjtw565sHm9R9xugTDojMH2t7oW10fU8MfI+kKKKbqv6bM0ot7sHN/nXC8PBbmR75fxXV9f9Uv1ksQ34wtVwHn2JYr/9vSOIMrnCZSMnQqyWZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093094; c=relaxed/simple;
	bh=xTpeZWnxB8JYzvX0SvdSkTs8J9J/h5/z1DlvbATjDO4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=b8995kilVmaqxjXtNa0dLX4KRzVH5liiKJGFuVjzvb2rvX+TyYdX3q4whZHtnk3nved3TPYIJYksZbAYcdT5fbyD/z6jYznONFFCC8ubRXq7yE1gt2qqa1HgFOBfpqahQETal03ClNxJ8liEgbqy9spYYN7+YFci60kw5ZWAjms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Wn4sa2FV; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Wn4sa2FV"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260911021804epoutp039680421f52a6aff3d6f78debc7f47cff~UIq5PXXAU1292112921epoutp03a
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:18:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260911021804epoutp039680421f52a6aff3d6f78debc7f47cff~UIq5PXXAU1292112921epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789093084;
	bh=5YM8svSFCVQDdSKgv3UAZlMbvsdfiUPaNlXn4LTfu4c=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Wn4sa2FVvufvect+j7oF8DiC69HRy5vWIs3xjjyXA4yI9mOiHmE2UiVMUjNWjDxiu
	 LA7kbGOEVxRsc8Trepq3Esq2WO8ALbP/Q4em5AcojGaxirci7YxckUOzdkaj4oBc1r
	 r3+Cmc/2jcD3k0ba7FU4eMEI/flhFPpyrF0Bs0Hs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260911021803epcas5p4efa9de6ffbfaab9bc9dde3b55a209a27~UIq4mrKMn0859908599epcas5p4W;
	Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hgyrC2Bhjz3hhTG; Fri, 11 Sep
	2026 02:18:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260910160148epcas5p17e76bb1266efb4fd90a242db38acea39~UAQ1XB3ph0463604636epcas5p1T;
	Thu, 10 Sep 2026 16:01:48 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260910160147epsmtip124ef79569d3bed41842f5ee216e05ea4~UAQz9HWcH1918519185epsmtip1B;
	Thu, 10 Sep 2026 16:01:47 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>,
	<linux-fsd@tesla.com>, "'Krzysztof	Kozlowski'" <krzk@kernel.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-5-1b755a446b22@oss.qualcomm.com>
Subject: RE: [PATCH 5/5] arm64: dts: fsd: Re-order properties to match
 coding style
Date: Thu, 10 Sep 2026 21:31:46 +0530
Message-ID: <27319466.81789093083302.JavaMail.epsvc@epcpadp2new>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+vGmeAYQ1M8KGwzLNRALcGC0DngL3d43kAoQLh+W12SYeEA==
Content-Language: en-us
X-CMS-MailID: 20260910160148epcas5p17e76bb1266efb4fd90a242db38acea39
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260909141820epcas5p34fa82cdbdc8a4cd6988e57c3a36e7676
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
	<CGME20260909141820epcas5p34fa82cdbdc8a4cd6988e57c3a36e7676@epcas5p3.samsung.com>
	<20260909-dts-samsung-cleanup-strict-v1-5-1b755a446b22@oss.qualcomm.com>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Wednesday, September 9, 2026 7:48 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-fsd@tesla.com;
> Krzysztof Kozlowski <krzk@kernel.org>; Peter Griffin
> <peter.griffin@linaro.org>; Rob Herring <robh@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH 5/5] arm64: dts: fsd: Re-order properties to match coding
> style
>=20
> Re-order a few properties to match coding style, as pointed out by dt-che=
ck-
> style, e.g.:
>=20
>   fsd.dtsi:357: [property-order] property 'ranges' out of canonical order
> (should sort before '#size-cells')
>   fsd.dtsi:362: [property-order] property 'reg' out of canonical order (s=
hould
> sort before 'no-map')
>=20
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



