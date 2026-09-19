Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022085.outbound.protection.outlook.com [52.101.126.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62D2DCBEC;
	Sat, 19 Sep 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789825297; cv=fail; b=K43WhN6bS6+tDDujepcYKSJh7VoKbkWqQjTMUQZqhxHJQMzCwUWxDk495a5+iM7eJp/SvnE6HL6Ws5iqmburK0gDiy0TLhpei9shdYjzwEDkRPbkdQ9cFap6M0I3am+dc+sg/ynEoGNOV3RnssCNGvDGD1QzXylUUq4aXSf5S90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789825297; c=relaxed/simple;
	bh=cAESAurVdkio04CRJfx9UPxdBOTjNHLRuDkkqydrKhk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XUBxEZ/WW8lENeN5S7MzvEchC37LTyP6yk+THD+rXYu8PpXJJDHms88Y2UknXM+mIZ6jTzGTpZF7Asg9AmihBrnQcXID4OKWDC4ZFJGCm9XqrJ2oWEdPsK7aFENciAI9SBgxrI9vNHyby8e1m3lvawxuhy61JCGAB2mixwc8FsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=qPcOdz0X; arc=fail smtp.client-ip=52.101.126.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="qPcOdz0X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHRvPSivKqb9iuBIyK3eihPAOuX6Y1rgIg+afh5Cn6MucPIOcL0Bu/wz9Q0zGFGZTOejnDz/Ldyn54g6nn22Nbp2OeYH5ZClYFNQpIOQS4nKcfQa2gioYomERkTpT62EdScUfVHESMWIaqVp7lGxK6UZCFt3OnaF9oR4GthptZ+NNGB18p8iHyapGsB/JhPMk2583SLTF16jW9JiJxyTewEDJbfEOjGIQrtzCom32L6/xTAzVRgn8/0WCdzJGxfBSv+p3sES2LjtS5JJla7QoPHWmQ5H+CfvfQZDstgDjPYL4Yu0/3aNXh84e5OqFCagOAsX1ULkPO/CgMY+/VOOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2cTSoKc97034v0w/lCIwJttOO+5NlcnJDjdg5EThDQ=;
 b=jsI/LfHOCiUtzhn6b17maP80qBPQIR2fJnQaGZ1p9mJA4cejw9Axc6BsBrMA0+fLKRx40mPBjlIRHK8GzdG3eGN0uFYHMRUEWzwDbyg7b/iFw7PMbJZKuIzRwcJdeCyj2vUzFZc11yZFTffbJAU4RPrvhNowv/bEaYiJe8UGJl3KBQ8tO6A4w/bM9bf3Q4DravAnZsiuEnrjVv3T2GeSVmwdvLy8imbuJnG0OOSNZhZrSFx30lgB+bfLEgKtHurbROQuirrVw1k4BQAJtKEN8yEIh9igfBEGRL9c1w0WbH55eI6go9vg2KzI3xcmfhHlmeYhgPv+2RjUp2GJZ1tfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2cTSoKc97034v0w/lCIwJttOO+5NlcnJDjdg5EThDQ=;
 b=qPcOdz0X3jPWnQzLCjrUFv/kkyhGTu4ougKqAWnyHg2MD3s6G8TVpy7/BF/FaxnTzv7bhhCHelHm4mziI2hgLYPATNDCLRaJXqAjJs0Gtx9whjxyr+SKT9MESMLOtMqGP1uI2dby7EX70HetFs3PK34mDjyPG3H2eXAy5n/iWj5ycWd56+ttaFUxc4BchO7nBXGjZyP7S3wt0KGR6f3QaKlYrC815j1JfwuokwSw3Fn4QOp06+K5vnlt8alMdfl9MeaJGIbD3JNG4G6zD8HTyXKrnEtmGPJtb9rVui6pspSZYPzHb/OVJzbNcDYs1dy4VZ6i1bzFNtyoKSGZAgoekQ==
Received: from PS1PPF6469DE8C6.apcprd06.prod.outlook.com (2603:1096:308::253)
 by JH0PR06MB6581.apcprd06.prod.outlook.com (2603:1096:990:33::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 13:41:30 +0000
Received: from PS1PPF6469DE8C6.apcprd06.prod.outlook.com
 ([fe80::e60a:2617:6895:a0cf]) by PS1PPF6469DE8C6.apcprd06.prod.outlook.com
 ([fe80::e60a:2617:6895:a0cf%6]) with mapi id 15.21.0406.007; Sat, 19 Sep 2026
 13:41:29 +0000
From: Mizuno Miotsuki <founder@crepuse.com>
To: Heiko Stuebner <heiko@sntech.de>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2
 support
Thread-Topic: [PATCH 0/2] arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2
 support
Thread-Index: AQHdSDyTnctY7HRwbk2VBS0DsQnXDA==
Date: Sat, 19 Sep 2026 13:41:29 +0000
Message-ID: <20260919134125.59419-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF6469DE8C6:EE_|JH0PR06MB6581:EE_
x-ms-office365-filtering-correlation-id: 6c8016b1-dee1-4b46-600f-08df1653b5d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|10067099003|18002099003;
x-microsoft-antispam-message-info:
 CdKCIRd9oOSAxmNWIU5dDCxAV64kz2jYYtH2UrTohqSNniWxnN/4EEuKFq18IwrbTLHkwxj8b/bam5/v5TDo88LZ5TkHedtjQtJKn7zafvhJti10rjXGPufN8HLJflkigiBQST2qgG9Ku5e7DaQ3PlRccBz0dsPVJsxk5hHBBNijHA5MwEJywyovz76YZQOZHXSSJ5tngow2E0P3AS/ybcEJz3e3JHQt0AxYZeLdf5JLlorbqEfqdH9/0D7NvkKGyReN1qsetChuRxUjKnWjinhZ+AiD6W4o0R4TS+H9xErbU1KnXTJ3k9oXGf9Zx0GAVUSoC7Soga6+QJ3e4znAH11WDQfs/yt30McH9JD0Ev1aa6BPaxT8Csv/OUNKxNO9OSYkgQgjhL1liWsVSOMWTPiNP230iP1to8rN87qirQl/9pN0E2K7Hui/YfbRHLHpPeAXX3zPW05kYfXfZCRbEmPjNAf0WDHYahYVFSqs8DQDsm3qO1DJyrkKreWgIPAq4eZiBITDCxq7gEzDpeyuDCuCiuJNd1R+pGHuC08NSigqvfgjWfi2ZPky5A5oyMZreBmlK9jz+5rnHZ7ZmZpllaeP8LCjIX/HCLehJ4hY868Z9ms8LentHenWxoVICKjtMSfMuIfJK4aTfUUYs3CumrDIB9ThDGpwIJjL3WV/mTvwQqOpIW3gAypaGf+mRlc0fwkuPaMn1598ihuXGQcKaA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF6469DE8C6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?K7GkyZjTV16muuHA4BAgMhWImEvHQzImht7eprUkqEC/pVLJ4g/REj4DVQ?=
 =?iso-8859-1?Q?HzbGl450i2PaF8Vp9c99D1tolVn3YJan77LDSSVjMGz07ifz9DOBY6PjIm?=
 =?iso-8859-1?Q?Ht89bSmNKCGgXdsqn1QVVXi0zMnQIUo8fobjB+joNuD9voq/+/OrQOfRqt?=
 =?iso-8859-1?Q?QWRaxna5/JFhANgXaeXDCYlSijc7iznztbuuQYPiPuxT3PjhMnuqX+u7xq?=
 =?iso-8859-1?Q?pZDJFQhcCCfqKCqE1UhEWdji/bwVyiDlshLMdX1O7g+32Zw4U0eY94VItk?=
 =?iso-8859-1?Q?QVz1vaw9gyKJuAPSKGsG9ANl99xJkW6jGsYKFFso/XA07744p1LykRxEdF?=
 =?iso-8859-1?Q?pPA6gMAgRBXQgkX5bwh9LdYmOERye8Akp0E6D46lLtn6kebm4kJwbxQD2D?=
 =?iso-8859-1?Q?BS4bpIC5Daq4xxY9aFsfwF0EEYT7zjENE8J5QZ3WAizT1YUAfgY//sD1vq?=
 =?iso-8859-1?Q?oRJuOmZSt9rzO4KwUcT58jckOwXVyOh26hNpAMIrVeshJhkZQp2Ph7KvHy?=
 =?iso-8859-1?Q?5r2FNKEg5T2EQE1V/0tdHSsPv50U2jprSAV5GUE+07GAMUM0G6ZkYl47DM?=
 =?iso-8859-1?Q?pdTDcm3a7kzG1Us9FwA+2NB00TZOl/NaLw5FXtG4gGs2eiTiCM4v20o5rg?=
 =?iso-8859-1?Q?0JQmI7x9pOto4ZZer10PTtkX/Cjj+cYcfAIjDPUglyQsd3a6K3F5Y1S+mh?=
 =?iso-8859-1?Q?PtF2HCuCEk9AZWs0vgO96boNQyUie0mXwseqj3iXdmFtAs617f/5TbNK80?=
 =?iso-8859-1?Q?12ubOxlWkHSXZPLij6jEeowOEZ/8bEKStNVfPi07eaDC1k1WlaWqeuFrKi?=
 =?iso-8859-1?Q?21jE/Ym4UwvuUAEMcZVoBmt1bGSQU78h7xnvN7peKiOCMht9SBgPEElU7Q?=
 =?iso-8859-1?Q?wuaMbtvHgknIevVXFxDeRBv9TbE9Z+ZMQgXK/mZHeP0MBUr2i5kEj4XiVK?=
 =?iso-8859-1?Q?IYDl3nC6EDVbHEpErfNsVVVJnkeCywFMLPe5oo0hnqZC7DtLeIoo/G6Wt+?=
 =?iso-8859-1?Q?O3yZTT8hQQI9rLBzKykj7H5+1dtyzeGrkzz1BHveaDyWY9X0TIKBTERDU9?=
 =?iso-8859-1?Q?TbDna2gTIGkIcAh3DxpsWnpvr+gJXbbrEwqCSBfPrUgfbVyqBXpyUhOYFm?=
 =?iso-8859-1?Q?6WYy3hgdXWvYlrMXanAbgZe+0wHMG4yW8LALQwcyvO8r6/yMtfA0APcuVu?=
 =?iso-8859-1?Q?9k1sc0jrP2B3LbOilInItFlW00RjHJ16pg2mB5DqyITsy6zPQRFQyraVEv?=
 =?iso-8859-1?Q?o7chJFjDoAR9RTp1UI9gk9v767DzHRHA4wNm9bEsFJBaH1HQoCtugWoPPq?=
 =?iso-8859-1?Q?MURdJmnIDLllza2r7DFGl4jSTnnhkhcnv8Qp0qJa/aJOXNXxTDaxuF+kJV?=
 =?iso-8859-1?Q?MUhV32evwPOgSu5d9K5sqKQyATWD4RuTsgFWVui6IPzf+XtjeF3e2pcw80?=
 =?iso-8859-1?Q?iuuXVHEXWFonuffyNYK20tukUceu4ILLvqNiTxGZAJC7XaLWl7L+ARIyVC?=
 =?iso-8859-1?Q?p1YUTACp7Wj9rR9bSZQ/ZhjMM7Ji1rMwXmE38OyRBlKmixTKhX9KvrBvn0?=
 =?iso-8859-1?Q?dwI1xEsZbON4/5Lt0FMiGzqHXXLe6dMJmFp6TLoxtek1O8qm5uJ4q5mWfZ?=
 =?iso-8859-1?Q?VjtkQMIL0QcaALVPWG4UAHV22YLt1VQghX/Y6xwOg24k06qWtKlAiJnbtZ?=
 =?iso-8859-1?Q?bhX3pGdfrvB0gU1qY69Hb8q8ciAHD2EC984A3fBGo9OOSJ+9Imt09n68oa?=
 =?iso-8859-1?Q?hJ4SlbJzSeuC3G5JWv1quBG10VKLSukT9Dwgg2kTFFsNRg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF6469DE8C6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8016b1-dee1-4b46-600f-08df1653b5d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2026 13:41:29.8031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1d352272-7d70-4a91-9c85-0db444db1bc9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sps5WCyN3glE92MOe9kwI8B3yDwVwzaHH6HqT7sDAodnz64rnU5wxEZkoYrp7asqy4bbkOu+u59pSLS2YavNYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6581

Add initial mainline support for the DFRobot UNIHIKER M10 V1.2. Only=0A=
revision 1.2 is claimed because later board revisions have not been=0A=
electrically verified.=0A=
=0A=
The board device tree enables a conservative core subset for a usable=0A=
mainline system: CPU regulation, eMMC, SD, RTL8723DS SDIO Wi-Fi, UART0,=0A=
USB host and peripheral operation, GPIO keys, and the watchdog.=0A=
Bluetooth, audio, display, touch, IMU, SARADC, and GD32 support are=0A=
intentionally deferred.=0A=
=0A=
Runtime validation used normal U-Boot boot from the eMMC boot partition,=0A=
not kexec. Four candidate boots reached userspace. Testing covered eMMC=0A=
and SD card I/O, RTL8723DS SDIO Wi-Fi including network traffic, USB=0A=
gadget operation, USB host controller enumeration, watchdog and GPIO-key=0A=
probe, and an empty deferred-probe list.=0A=
=0A=
SD hot removal and reinsertion, physical USB-host devices, physical=0A=
button events, and an independent UART0 adapter remain untested.=0A=
=0A=
`dt_binding_check` and the full `dtbs_check` pass with zero errors or=0A=
warnings.=0A=
=0A=
Mizuno Miotsuki (2):=0A=
  dt-bindings: arm: rockchip: Add DFRobot UNIHIKER M10 V1.2=0A=
  arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2=0A=
=0A=
 Documentation/devicetree/bindings/arm/rockchip.yaml |   5 +=0A=
 arch/arm64/boot/dts/rockchip/Makefile                |   1 +=0A=
 .../dts/rockchip/rk3308-unihiker-m10-v1.2.dts        | 248 +++++++++++++++=
++++=0A=
 3 files changed, 254 insertions(+)=0A=
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.d=
ts=0A=
=0A=
-- =0A=
2.55.0=0A=
