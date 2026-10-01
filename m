Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6213C197C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839120; cv=none; b=k8CAryufftJp14UMtpTeyxzr/QaAVbUTNDwgNKRQ/zJ3eUdHsTbG7hFhC+HFXvploPI710ACXql9ZSH+ydRvdXAq7IvbrqjoOhJCYMLEXlSnPRUTCUMnC1UiGNpuidI9LKwQv55ImpaXW7uXRpUHiEZzvBNoxHRmOwRR8MMoGR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839120; c=relaxed/simple;
	bh=TKk4lc4Q3kYR4kAtmczq94ezuNcvwhYm99HvFo8Uum4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VmCufyTbs7L6Sp6Dh8dcdY7+3XuSUt9ad9ma1ZIp/oqcjK9KgiAg1lkafsrTo270fL5JyZwD/Dor12J66F2utZ4yiAJdjVDAnD3LoXetI5t815tAt1UQ0g3gdi0pgLVogLK3ED/ukJ6lM5zWjLuqol+Q1h45/U3Z8BTrt3bo/Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=Rwf0q0St; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="Rwf0q0St"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1790839118; x=1822375118;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TKk4lc4Q3kYR4kAtmczq94ezuNcvwhYm99HvFo8Uum4=;
  b=Rwf0q0St8gRySvfkN+yJ7BY4VFby1HmdYed+HEja3NDQTNISatNWCSLp
   DUvSLBSSjCVBuWKe1IcwuDdYuPzU3b0/wyOJDzPiAGwSavrZDrzFaW0q4
   sFSzbpQeJBCdDIadKVCaej7xFnOoCWaMeOnYlaPQyn1TZg/33GaaruwD7
   Q=;
X-CSE-ConnectionGUID: uJQWZ39CRjasYsp0znpwEA==
X-CSE-MsgGUID: jfOoUmy9R967uTBymAgnNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="181704038"
X-IronPort-AV: E=Sophos;i="6.27,134,1787004000"; 
   d="scan'208";a="181704038"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:17:25 +0200
Received: from MUCSE818.infineon.com (172.23.29.44) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 09:17:24 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE818.infineon.com
 (172.23.29.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 09:17:24 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.049; Thu, 1 Oct 2026 09:17:24 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <marex@nabladev.com>, <linux-mtd@lists.infradead.org>
CC: <chengminglin@mxic.com.tw>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <richard@nod.at>,
	<vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mtd: spi-nor: Describe locking support for MX25L51245G
Thread-Topic: [PATCH] mtd: spi-nor: Describe locking support for MX25L51245G
Thread-Index: AQHdTI+RbslWC8yeRU+6uOH9/L7Fh7boPlmw
Date: Thu, 1 Oct 2026 07:17:23 +0000
Message-ID: <9bdd8b02469042ffa71851fd2641708e@infineon.com>
References: <20260925014517.174496-1-marex@nabladev.com>
In-Reply-To: <20260925014517.174496-1-marex@nabladev.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Marek,

> The MX25L51245G part has the same 4-BP locking mechanism as MX25L12805D.
> Describe the locking support.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Cheng Ming Lin <chengminglin@mxic.com.tw>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> ---

Can you test locking as described in [1] and provide test log?

>  drivers/mtd/spi-nor/macronix.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macroni=
x.c
> index b3fdb4b2fa1ca..4de1b490b16b6 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -165,6 +165,7 @@ static const struct flash_info macronix_nor_parts[] =
=3D {
>         }, {
>                 /* MX25L51245G, MX25L51273G, MX66L51235F */
>                 .id =3D SNOR_ID(0xc2, 0x20, 0x1a),
> +               .flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,

According to datasheets [2][3][4], those chips have TB bit in Configuration
Register bit-3 and the bit is OTP. The existing HAS_TB and HAS_TB_SR_BIT6
flags don't work as they expect non-OTP bit in Status Register.
Just supporting top area protection (TB=3D=3D0) would be fine with me, but =
in
that case, fixup should check TB and activate locking only when TB=3D=3D0.

Thanks,
Takahiro

>         }, {
>                 /* MX66L1G45G */
>                 .id =3D SNOR_ID(0xc2, 0x20, 0x1b),
> --
> 2.53.0

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html
[2] https://www.macronix.com/Lists/Datasheet/Attachments/8381/MX25L51245G,%=
203V,%20512Mb,%20v1.3.pdf
[3] https://www.mxic.com.tw/Lists/Datasheet/Attachments/9176/MX25L51273G,%2=
03V,%20512Mb,%20v1.7.pdf
[4] https://www.macronix.com/Lists/Datasheet/Attachments/8657/MX66L51235F,%=
203V,%20512Mb,%20v1.1.pdf

