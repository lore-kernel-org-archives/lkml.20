Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023125.outbound.protection.outlook.com [40.107.162.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737E246D2DC;
	Wed, 30 Sep 2026 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757323; cv=fail; b=MLv7n/LRucNWk4L0cBuDeKoaDJQEmsUOCimXAAMIUQQ8SixrSLdFBKSYIEtrp5S7v/fsI+Kfq7YpI/kaEeKq3JDGWnU35MJ0gsE9zFwRYcYTG9qAJuUcHV1zxIJ5zfBJpKWd2vhHFtrka9VL7eVh1MI3Kdavpm0j9Db1KzuvDSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757323; c=relaxed/simple;
	bh=XpBRyLvnem3iuC43+JyqxPnF2A6CPqRNOsAjERTOu1c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sfh4qLg/p/RBMKEqaTabncQvyPI+npY8bs+fxJVChuzZOtkBz3ZJ0gfXgI3G9QXdk75j+pEnrk7xHU9loczR0aCptBgk15mRqYIrML0fYcgPdT3dBxtV4eiA3SSV0SWUEjgqNIXjW5JtqCSk0h5wXVtD7DVghkei4QpVv3c+RKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it; spf=pass smtp.mailfrom=studio.unibo.it; dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b=uHlo52SE; arc=fail smtp.client-ip=40.107.162.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b="uHlo52SE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJYOjmhWe5O555w5aaRfF8CDXTsImcppEQgA/mN9fHTcvvvlG0aZBTl7W1IwbSFNCupVL+yK8YxzeUf5fqfG8zUWrDtOVxueB8HrVNIASPXn/CfVaebMGes89qzeXnsHL173H5xhwPrGiwHGOMPyFxeZulVWTlujh+bZgjHD+XYE6r1XNWyfcK2gaRRSqJb0K39PAZ7ZF6BgydicRDl4XVtKX+DrFRAd/gScXGXlgoJM3NyaPHd7n3x9x62NXvZ/ktyDJya35qFSqhaAu/foKGwr89o522f0Vpzyw9PiU3dhZGEGIpxI31mHCxSH63Gk/40BZrqCwGbdhh6FasBZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGEcwubc9oUIawFyvRvmp7UNskxlHLPD0xDmr0NgoPM=;
 b=qUMB375nc5slAjIRb4QwKu6lPjXAS7pK/Q8p4+0Zj7ljBrXhnxIDLJZB07k2es+wN9vhIK4COmtIF9PmyQCpYNCAODmSDr4oA7LNcY96uinfBldqncNx5ZNzqeqlDm7gpHqv+Ijwhgel2H0ilItuhvA3IIUz3kV+DwdcZ1UN6ws9slCiNhAd7HM//yNF/kkehT5dUipod91pgBZR2QiTxYl0K5zzmy4wq5OK8h9wEXcJioI18eYLTG6MPYeBqID+yalIkekhSsOKevRa7Fq43THCX/r4URVB+Kxv4DB41VfDXc+xcg49xs59IaCAWSP4ExasU0zgafStSUpalb9HsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=studio.unibo.it; dmarc=pass action=none
 header.from=studio.unibo.it; dkim=pass header.d=studio.unibo.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=studio.unibo.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGEcwubc9oUIawFyvRvmp7UNskxlHLPD0xDmr0NgoPM=;
 b=uHlo52SEIBLXZgQ67aPetamfBPmXNWIk/hI6HLiIOhhPj2PYbNRYvcnHDPR9twDu24e3viQsctdWAK5vFjqDfEqom1nuc+4JDHhWhKpc4ta/LIK3eqMct9gVL1jIxrQ5AERw9rk8d/kyutpzqA+BGS7Vaehwih8n4Uu6Nh9QBimfohiFp8rWmTqG4+Lz1/HriNqtbMfM+kuYnWIkwrhOwjnw7LymmnsvGexlSIizSZ2sMKTFyWYYlJXDKIQ2yG1UnBtDqymRaRVWuF0bZoCHP5cRWpeNb6QiMl8NG0doSRC6fBQrZ6iddT9Y1ZGGNbS6mhxCoCC9fGoEj6kCqa3zMw==
Received: from AM6PR01MB5686.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:da::18) by AM7PPF0EA683B0D.eurprd01.prod.exchangelabs.com
 (2603:10a6:20f:fff1::787) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Wed, 30 Sep
 2026 08:35:11 +0000
Received: from AM6PR01MB5686.eurprd01.prod.exchangelabs.com
 ([fe80::d9de:826:e4be:1934]) by AM6PR01MB5686.eurprd01.prod.exchangelabs.com
 ([fe80::d9de:826:e4be:1934%5]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 08:35:10 +0000
From: =?iso-8859-1?Q?Nicol=F2_Giuliani_-_nicolo=2Egiuliani6=40studio=2Eunibo=2E?=
 =?iso-8859-1?Q?it?= <nicolo.giuliani6@studio.unibo.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
	=?iso-8859-1?Q?Nicol=F2_Giuliani_-_nicolo=2Egiuliani6=40studio=2Eunibo=2E?=
 =?iso-8859-1?Q?it?= <nicolo.giuliani6@studio.unibo.it>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: R: [PATCH v2 0/3] arm64: dts: marvell: Add Sophos XGS 107w NPU
Thread-Topic: [PATCH v2 0/3] arm64: dts: marvell: Add Sophos XGS 107w NPU
Thread-Index: AQHdSV/jd/qJfdsvO0CzFfYtjZ7vC7bm2jMY
Date: Wed, 30 Sep 2026 08:35:10 +0000
Message-ID:
 <AM6PR01MB56865DCADF2BF67FD3277158808B2@AM6PR01MB5686.eurprd01.prod.exchangelabs.com>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
In-Reply-To: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=studio.unibo.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR01MB5686:EE_|AM7PPF0EA683B0D:EE_
x-ms-office365-filtering-correlation-id: 5fa59722-4f78-47a8-8a7c-08df1ecdbdb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|786006|366016|38070700021|10067099003|11063799006|56012099006|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 S2r2DtgQK33czi65EmY7J3DZ3lci7ycwLVCXsxdc5Gy63x3c4xZKquxztY+hE8Tj/naDpyZMlrdl7uJAbihj/pF3nIvKzhAoZ+My+svJS1kpjM/bVA5AvkF2ltduBPUEdAxVPmR06vYycsnJbUM3rpvv5IFpVH8kQbWhgExHpa0j5xdX7eI01PkX1RRDd9qs5yyvMOT+r+BP+ngTikMXUJGIT+8w13+pTidvoKP2xS+SIiDW88/Wkr+iheZZa/JevU4tElxNWdbzZNM2l/+uoUzLacQQzgYbfu87MtsRgS8LYzcRF/KLvKesU39XVhKm/Y/LXWnRvTlkKEhlVF14YhDsMziDD1VK+9xJRsjf9EyIJr56HC/Mznw51ZPh1HzIuB1+5lTWyruXmmQEYQa2+iB9n88sbO0t4n930P6kgk+FVpMDubhlJPA4gZrtGeVQYpPiSrqUWFTR/2WLkSGpBtjxYNqQlnSShfNIoBxRrhUN2xUFiN9ZKfWIMcjZDJpZnmziIT5LQVUQ6P6Me/V+jhygJuboLs4hgwdAD2Q1k4DB38lspEDG50hRw+DnEgkJH9GYe/zlX0RRIXkNA0YOFT0C2lujq6G4F6arF10kUsErF+aIYmmyhdy6ZpoQMvFSNXmfzp3efJNoAa7y66XoSKPR7czzwACaFAxu6oA997k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR01MB5686.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(786006)(366016)(38070700021)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MDIKjs0OWjdeIxCB8USfz1CHk8KT3mTFhg5308iNhBa3QOU7fAUjWIgex5?=
 =?iso-8859-1?Q?kG4xPlEWYdfeQaHaJ8+mqDKVPLECR33QoPoH6Vg4tBRUDWqvUrIQQoqr3B?=
 =?iso-8859-1?Q?+pkKP6oeTc6LqZNPyCKzq+wytNc79nqEIRHRtvNE9+V0u5nX0Rdb+Lvvre?=
 =?iso-8859-1?Q?PiyKoBYkao3V4C9hSM8ATLhMLQQtEdzM/xpTLA999o93vPnCvbC8lwaBqB?=
 =?iso-8859-1?Q?wNfJ13nFOnKM0AJB432TOvNYyTXUTRg6xp69ffQLtZ9UJuuMgcr31QF4Va?=
 =?iso-8859-1?Q?fKGLyoPaRoUh7yfw/E8OLM6YzRaL1I+LB8wU8dWLfC14Rzt1gHt7C1vDOq?=
 =?iso-8859-1?Q?MKavjDtkRgXAO4FSIEg8lhwGaZeVEHl5aX7pD/IF5JT/BVp5vkjmsXqBAW?=
 =?iso-8859-1?Q?edfYg7/5puN9r1rVb4s65OcG/CbeavfOEgsZtGbYJU+wi19x2eBYPjaXfu?=
 =?iso-8859-1?Q?F1J2sGDeb7VUZJb8/Vxtpr0kZ+e56N+kKjFmuatFXMDYP6RkIZ6/WduOmz?=
 =?iso-8859-1?Q?EMT8EpKFr7v6VVKJYXZRH4uOXk2/ZP5l3+cIkq8uK/2ST4mOPgOUsEW9Uz?=
 =?iso-8859-1?Q?fYwo6GA8yW7AfeMzTKSiTUdP3tmPGZXQsQLzTLjvJ3W4IqgC244tzvXoD8?=
 =?iso-8859-1?Q?lpwYuB19xRwmBynATZg3hqqmMxfxCyWjeNM2wXRdnvb1tWSZI8rOpv1UCH?=
 =?iso-8859-1?Q?CvraQT0ybAPhP8yP2huIKft+o/OFRiX1Bhj27/Ssw0UcJ0QzTLnHtjfuy8?=
 =?iso-8859-1?Q?m4CvE6r/RSjYafnH36Bz4/8DYd+ZYa+u4fDJS1E8eABa6DyxkGIWvwhsY2?=
 =?iso-8859-1?Q?S3rWE/fHbKU/PwpVuLVxFtlRq4VAhjtRFZoZ0b3K53yB8VHfflFHvvHJUH?=
 =?iso-8859-1?Q?pLA5AbQ25qjqISYxhee6QY93iryUWvlKnoasb22pCUpcrnuyNGqM0vhg7y?=
 =?iso-8859-1?Q?jDBHZGMHuNG0ecRd4wUQwMvS/ZsxVJNEh/PKxfATDUQSkMi+U9tZOpR+cO?=
 =?iso-8859-1?Q?30Dr0J4CKT/PSVsexAjf+/bdk8wYzdp6QGzq9wmKYUdxXtXOpEaDKTXsAW?=
 =?iso-8859-1?Q?sbi/HmDPOovr/FUeTlCey759osDTOTtYIkQzc3BQ59ipwceFvpZPCUDxjk?=
 =?iso-8859-1?Q?ngEvw7lN2EGHxHjoaqy+vXLF87IHrQmgLr79Mhefy/FvUQmk6kwFCjL50/?=
 =?iso-8859-1?Q?BLZjtED84YPdWCdWuBTXum6fHR8jBnaRTO2TPO75JoNKp3FL335JWKSTlu?=
 =?iso-8859-1?Q?wUu+U/fZa9YCxnobvi5YoL0GiLV4TsbC/14UAL4DzPuCoUrRfFfCF3qZX3?=
 =?iso-8859-1?Q?Pa0AwrLmW18RFnWK4zHCbCfpRYsn5lqD6TMKOWipbxVagtErp5XQ6sVJEK?=
 =?iso-8859-1?Q?q4n9sX2U4qmxayOdIbj70ReI5WYLxWVYUEAucKi8kVcdxkhFLA7V6eeg8V?=
 =?iso-8859-1?Q?cgRjQQwYOXJfsqBGGt4/GfwcPDou5IfKxF9FihkY1Oa4he82yE40gGCWG8?=
 =?iso-8859-1?Q?IzT8PdgD4GBd3im5gZyjYPsN7P1z94pH4VeQRAmVOMxGP+V56rC4rPU5e1?=
 =?iso-8859-1?Q?1J8IQqyn9D01+fHWB5lh6bO8BXIQKFefUWBu+2Ii8ROSWNUpe3ze3dQHkE?=
 =?iso-8859-1?Q?Wp9HhAoHEhF+WjjbAKTzhzIPh4pYOxltgjnpIM1OW4A+gYMT6RB+JjxFKf?=
 =?iso-8859-1?Q?AxgZV0XF4B0V1BjyOVMXW5E3tCVyHlcm6JAnqdEkXopPJSCJMPXTmLPR95?=
 =?iso-8859-1?Q?y6CTU8uLGOxu1j4nNcA7eAtrxYX43z2L7kawbVXF6Oopc/rtxSYSyqM9hl?=
 =?iso-8859-1?Q?nusFXmx7iJuv8E8s8OWQxlv/NCf5z30=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: studio.unibo.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR01MB5686.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa59722-4f78-47a8-8a7c-08df1ecdbdb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 08:35:10.8939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JhcoOVqrPBpEWkN788sSREpn4FT+a79aIURS8lDgTYVEbCJd1lj/K/bN70IVoNfC4SlnebzOi+vztseWpNJ5McTXFOJepplMqVPzdv4Fg+Pys/byLEALUEoz0j+w4bvp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF0EA683B0D


Hi Gregory, Andrew, Sebastian,

This series has Acked-by from Krzysztof on 1/3 and 2/3, and Reviewed-by fro=
m Andrew on 3/3. Is there anything else needed before it can be applied, or=
 should I wait for the next merge window?

Thanks,
Nicolo Giuliani

________________________________________
Da: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@=
kernel.org>
Inviato: luned=EC 21 settembre 2026 02:26
A: Rob Herring; Krzysztof Kozlowski; Conor Dooley; Andrew Lunn; Gregory Cle=
ment; Sebastian Hesselbarth
Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-ker=
nel@lists.infradead.org; Nicol=F2 Giuliani - nicolo.giuliani6@studio.unibo.=
it; Krzysztof Kozlowski
Oggetto: [PATCH v2 0/3] arm64: dts: marvell: Add Sophos XGS 107w NPU

The Sophos XGS 87/107 desktop firewalls pair an AMD x86 host with a
separate network processing unit (NPU): a Marvell Armada CN9130 SoC with
its own eMMC and SPI NOR flash. The NPU serves the eight RJ45 ports and
the SFP cage through a Marvell 88E6193X switch on its MDIO bus, which is
connected to the SoC by a 10GBASE-R link, and reaches the x86 host over
PCIe.

This series adds the Sophos vendor prefix, the compatible string of the
NPU board and a device tree that describes the NPU as a standalone system:
UART console, eMMC, SPI NOR flash, the SFP cage and the switch with its
ports. The port LEDs, the USB ports and the PCIe link to the x86 host (the
CN9130 acts as a PCIe endpoint towards it, which needs endpoint support
that is not part of this series) are not described.

Tested on an XGS 107w with Linux 6.18: boot from eMMC, eMMC and SPI NOR
access, the mvpp2 link to the switch at 10 Gb/s, the 88E6193X probing with
its eight user ports, and 936 Mbit/s through a front port. The SFP cage
is untested.

dt_binding_check passes for vendor-prefixes.yaml and armada-7k-8k.yaml,
and CHECK_DTBS=3Dy on marvell/cn9130-sophos-xgs107w.dtb reports no warning
specific to this board.

Based on the mvebu/dt branch of the mvebu tree (008e9faade).

Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
Changes in v2:
- Patch 1: drop the second sentence of the commit message, add Acked-by
- Patch 2: move the entry before the SolidRun ones and list only
  marvell,cn9130 after the board compatible, as the other CN9130 boards do
- Patch 3: use the compatible list of patch 2; pass the switch reset as
  reset-gpios and drop the boot loader workaround; remove the LED
  expander node and the SFP address comment
- Link to v1: https://patch.msgid.link/20260919-send-dt-v1-0-365615a74ef3@s=
tudio.unibo.it

---
Nicolo Giuliani (3):
      dt-bindings: vendor-prefixes: Add Sophos
      dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
      arm64: dts: marvell: Add Sophos XGS 107w NPU board

 .../bindings/arm/marvell/armada-7k-8k.yaml         |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 .../boot/dts/marvell/cn9130-sophos-xgs107w.dts     | 188 +++++++++++++++++=
++++
 4 files changed, 198 insertions(+)
---
base-commit: 008e9faadef8c0aaa9b8a3ff05a2126e3c5b08b7
change-id: 20260919-send-dt-6bbd08a470d2

Best regards,
--
Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>


