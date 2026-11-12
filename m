Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.10.52.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442449;
	b=SRbjWhAEldsL21/SmXl5wXlri9OuJcdFR3Jk56+M40deh+zBBvHYoFpUUh+QlS20lC/7
	 TvAFCaqudAoPsbj83pdsDC/LPod7spRh04cU1VkXd9z5Ib6jTb1dx32KdrEKt/RRVQ0qn
	 /or1QsuIi+EIy00qq1+2r325v/Uw6WlwaIDqK6kMyALn2lktNTogKjTR+fnbQ/K41UMl+
	 phSdM1Bqj5Qxw5/WDK6BBxfqXYN4eC/ezDKB6bcaeHAwB4V+lg7j/5rQcuGQDngtpYLAg
	 n74GNVGrimqNo1y6+FeD05dn/bNcVHeryC9CE48szsT9FfYpFZzJm1EUs1Dn2pSoo6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442449;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:X-Amp-Result:Received:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Gjj8XrtdGf75bTN04E+EJ60Af0aZGvGLYuMFY0/g4K8=;
	b=0LpTgcBA0Kj7TnFzXuO0d83gmXEz+w75Jmp+GdpEhhpqKnIdXUExqYtc+KpUj6mAnuWH
	 6UEkISrHglu2mBYa68/vyG0dwms7aimZoWo3yTZ1zxdlX/K7HEuDapUYTMvBWZcnz5PMl
	 p4f9FXR1SbE612v6ny+7Wcdoea1dwXV1Jlgh96PSe+NESuzeasDwb6YkR5My0lsPHf8uU
	 f1eMNXkHBvyKRkaTB/9LjdxYzECpJmYJQ7zsPzqcv54xriu4aKgnvN3QGIJHY/83PAp1T
	 asJb646hIgbBn6ddQcI9EgkvlBujrxDYECCerScLmMXYVN1Dld7MpYOaugqHLvhcDLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infineon.com;
	spf=pass smtp.mailfrom=infineon.com;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=ka9qhOLh;
	arc=none smtp.remote-ip=217.10.52.105
Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506B6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=ka9qhOLh
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794442448; x=1825978448;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Gjj8XrtdGf75bTN04E+EJ60Af0aZGvGLYuMFY0/g4K8=;
  b=ka9qhOLhSZNDUUHIL/4k1zEna55R0W/fuq2cIJsK5R1gU41rEW1spQG7
   ADIXcgoBYDse81Y4CGFr3St63Dwi7LS30evIRSbkQsmSD2XwAQeXUtZbQ
   8zWBO114was8cucWE6BerxZ9/UMqH+IZpwHWv229ClxHFidUbsmSv2JBB
   c=;
X-CSE-ConnectionGUID: pSyOsSnRQ+qVXrRISUb0YA==
X-CSE-MsgGUID: tOlzg8wgQ2SHC0KGJW7FEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="169882909"
X-IronPort-AV: E=Sophos;i="6.27,208,1787004000"; 
   d="scan'208";a="169882909"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 01:14:00 +0100
Received: from MUCSE820.infineon.com (172.23.29.46) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 01:13:59 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE820.infineon.com
 (172.23.29.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 01:13:59 +0100
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.056; Thu, 12 Nov 2026 01:13:59 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <changhuang.liang@starfivetech.com>, <pratyush@kernel.org>,
	<mwalle@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v1 3/3] mtd: spi-nor: macronix: Add 1-4-4 DTR read support
 for MX66L1G45G
Thread-Topic: [PATCH v1 3/3] mtd: spi-nor: macronix: Add 1-4-4 DTR read
 support for MX66L1G45G
Thread-Index: AQHdccU75kEGd21+l0yxtHbv82cQY7cpkaAg
Date: Thu, 12 Nov 2026 00:13:59 +0000
Message-ID: <ee182cedf0d94d5fa9dfc9696bb0b890@infineon.com>
References: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
 <20261111101240.7378-4-changhuang.liang@starfivetech.com>
In-Reply-To: <20261111101240.7378-4-changhuang.liang@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> The MX66L1G45G supports the 1-4-4 DTR read mode. This flash uses 6
> dummy cycles by default in 1-4-4 DTR mode.
>=20
> For 1S-4D-4D, its support bit is located in the 21st DWORD of the
> BFPT table, while the dummy cycles are described in the 23rd DWORD.
> Unfortunately, the BFPT of this flash model only provides 16 DWORDs,
> and the kernel's SFDP parser does not derive any
> SNOR_HWCAPS_READ_1_4_4_DTR capability from the BFPT table.
>=20
> Since this information is expected to be in the BFPT, add a post_bfpt
> fixup which declares the 1-4-4 DTR read capability with the default 6
> dummy cycles and the 3-byte address opcode (0xED).
>=20
> The SFDP of this part provides a 4BAIT table, which also advertises
> the 4-byte 1-4-4 DTR opcode (0xEE). As the capability is now set
> before the 4BAIT table is parsed, the 4BAIT parser keeps it and
> converts the opcode to its 4-byte variant, like it does for the other
> read commands.
>=20
> Add a dedicated fixup for the part (SNOR_ID 0xc2, 0x20, 0x1b) that
> keeps the existing QPP 4-byte post-SFDP fixup and additionally
> advertises the 1-4-4 DTR read capability in post_bfpt.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

