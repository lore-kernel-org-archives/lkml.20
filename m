Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5EE3D47A6;
	Wed,  9 Sep 2026 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937704; cv=fail; b=QSeCaP4KJJyYYm0nSBaYD0gYtgdv73Wd01D8fbuivh+mEjiTo5zo4pgl1TTqncSUZkUFjh6mbOq8PNw1EsnTTXYQuq214AmpJjHJUTQ46BncBLYOBPJxjMwRaOavNAjqtvM6b4K4T5fJYQRNS16Je8Tci3yV5f+Dkd3NvE5+1NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937704; c=relaxed/simple;
	bh=aN2CwHpvbL+TtqIOEFVUtZ7+pdjp8oU9SXzqAJMscrQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h5FCkLloXT+wjhH/aL7dxPCmLcB15/zw1qX7/JwcfUHEQG/i2dC+EpACLdyQqEOM7D24W46DlTM/azTPnq4SzIcNbfZRzCSfv9yG2x5Tl5/RItV1P5seIzzf64J3X56Xdf2GxUPY/b2bZB4ymjL66DZZcVRQhGSZRFOUTuDuJso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fa07EJuO; arc=fail smtp.client-ip=52.101.84.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fa07EJuO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yayYu0fLo0CI2AzHWTBZhhn4+rQ7j3vCypkg7o/m/3YF1g4Ic4JmL/yMSukej6Vz0+p9chgIhhGSlbqfHe3ORNyxWpED7p4UMcds3abkmTQzr/Mx/3IKvDP3Iy5CO7n+XoJOp1pe+EtpM8Xeaqq9lUbGtX0OOJqaeZQivUpnVw1+WyhV4hocTDXt5zoAvCKcDwQqdHRFpygf+4VevA1y1q7+ZVQB8B2+8lIF6akmsDWH4PmuABwBLfEXIz1tX6Vbfd8Ft3B7oLNNTW/zVPjOZ0BslTZ2PkQ6PHo5pBSrT4XScJBklOzE/8iMmH8xOjElhX/bChMob3asEQtwHcdVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWAPK9u7zDQrV5J3zegcrgWXfoNJYmASqVdg4uYjmcI=;
 b=JAi0HbIDheRjmGb0gtesX4FD/dVbYsMJrtb5VWfhit4btwgeIbzilfTZgn4b9JPF2jlzPTlzcPyEMsdBgtMur08jq928o+x2frJVwgwtjwIp5O18IoDV2ZVwRmR1OUOt9n9m3WjNVnczid8ZcDeu7PF16LcRLveggv7h4WOoRQ2rgMvuD49fgZiUeZAvB/2yFOv6yWIO4OWSUg+ThjQn9N8Fq08xypxehmD2IM0z1qRWDrLFILNO8Mmq9RABAq7tIzqM0SKo7OSKbFxduoldilCecfK+zpHzvjk2iBBQo9oph39pM3W9M168eTYNgxhKCXdk4rn5AB8Lc8+xrkQCRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWAPK9u7zDQrV5J3zegcrgWXfoNJYmASqVdg4uYjmcI=;
 b=Fa07EJuOMWx5paLnr0sWXZ7M10uplLaGAVayzAQcOPc8SjQHuyuallE6a/V/zJyRQJaG0gZZ8vOlbnQd28GKzcxiTqkgn24qSkJfKifT1/Mcm2X2ekAxCObyaCXWH9C72cb5bSXQKiy35Lu7UnaoC9Dy/bNJ2BgRUYTWEE3hVjZ++tLI7MVNNoeFYpAu5KBxpPNROJ0g6kPt5vEuWTuGkG2kvJm5/RnU3nEdBSBLWejgBjleUY/GzlhU29gGbG0XOjgNTKPrN/1pezrzMsvBIh//T5o0yGogy+s8Od2qxOwLTnDTR9pKq8uJmCimF3Lk7SAWh/USVWB5+ebk5e8DXg==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by VI0PR04MB10952.eurprd04.prod.outlook.com (2603:10a6:800:268::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:08:19 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 07:08:19 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v18 3/8] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Topic: [EXT] Re: [PATCH v18 3/8] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Index: AQHdO2x0AO2+wF04XEe0sNATnkYckrbFzByAgAAQBwA=
Date: Wed, 9 Sep 2026 07:08:18 +0000
Message-ID:
 <AS4PR04MB9362BEAE2ADA8087F00DADFEFBB02@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-4-lakshay.piplani@nxp.com>
 <f33ff763-136e-4c10-bd77-d40bb4baf02c@kernel.org>
In-Reply-To: <f33ff763-136e-4c10-bd77-d40bb4baf02c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-09-09T07:05:20.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|VI0PR04MB10952:EE_
x-ms-office365-filtering-correlation-id: 90a2591e-f019-426b-bbb4-08df0e41207e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|7416014|376014|10067099003|4143699003|18002099003|22082099003|11063799006|56012099006|6133799003|38070700021|921020;
x-microsoft-antispam-message-info:
 eol/f3genDP9fvV4XY5eV2zRZgCny3MMzmBax5VE8h41LNAo8fDoocpbbuFlWWQTeoxAeBQQSOkOvfs/la/QRvPw/5onTWU2kKAy/Zk4A2++b3rCiWL96oZm42N7XTQvwpj6lApohxy06P+OAEdGU5sKLul0YErAplUH578yMNU9d0yWl1FdFH4gRtCymKMJa5N7ZZGNRyCfbccK3o9EAeIFwoysq2XAslAOT2hTvaTn4yQdOvXoJfP0lW+srDkyQ9S5a+15Nfx9jt+iqh/qLX8NWul9jAj3Jl3MlvG14WY7xXXlAVf8uSiOxh72yS1pSqAtDBkokLuiG5BFESviXHUBhGbe4v+C2ZbkheryES0fMQYSjNPGN3GdL4/Adu3abIV1A1JUsqFAb5AQaJtYM/pPBa/CF3M1QU00iK9D4PrqSQIGQif/r/B+fI8aoq5r/6lCOMCQViNSufoAeE58Hi7Y4siPKOp7ai+rwo8IIm5M9j7ZtC/OzRoqIfajZhGZyfLZycXlbD4fEMtI7OBepHDhr/kDB4Dv+RWfJg3E3CBj9LSkyIe9nI4dJ7mmPkrzmVkEUVCa7pUrDooKcXGt1vKdLzGpXt0YzP5L/5Asjubor9gkFbENdTTsXWGTDNcYvyAzldFtt3h0CTaKxRBshyFGlnTvCnqtrLbXwtut7EUrN2XU8lRjYtF4txbxYba2Ws1EmomNRD6Ut3sPElHyB8my+1bBDaDZ5f/0HUgt3ug=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VfM1s7GZcIx8jkhwZzHSBovi/X5tkq+UWEHzu9m4NooBdLxI6mTqHz7+WIAd?=
 =?us-ascii?Q?bK/wMEhnADhqqeoqXHgHG/lrk26oyz5wn2VOaim/4qFhYrZLXIEGpJsH3pAM?=
 =?us-ascii?Q?sZ6v6r6VjkKEokovhj4bH3EvbkCzgCwB6bdWYPusNrU8/0YhyeM9iIViI9qA?=
 =?us-ascii?Q?PXPBe1rb9P+/Dpp1P3mUsqFuli2TPPBYa5zbkaBaNWndaYd1QQW2sneBFohv?=
 =?us-ascii?Q?Mui8heX30Sz0oW52JUN7WKaVWZwUU9+jbV8FM3uHeuwS34japZGNstGY3tYi?=
 =?us-ascii?Q?oRPymdVg1svj2TwD4rDdYmbBb+OT7m3hWzxV6FHcLV3l0AwxiwxIcRjr3IpB?=
 =?us-ascii?Q?1qC7LKWVFsWgEONfHsfkoWTSJqrdHVot253liQxvz1b7WajZ1zndZrWOD+i6?=
 =?us-ascii?Q?lR2G3tJ3NSsum1DTemhsR7u1ZMHx7g0WVYqo9/d6s4jKlkGs87hCNwLa3gAt?=
 =?us-ascii?Q?v0BWx02k/KjPKhrhHz0mDf9SQgepDtcy1vuySZP08LvSiOLBNeX368l8fY4p?=
 =?us-ascii?Q?FAekC1Ol3rU9McxvIHALmW+XNC2Ry2xGhonw6YtRRnmhdiWZ5pvbX4hCMs61?=
 =?us-ascii?Q?9KGzFqaRgw/Zk9C9goUeIlSFv/7pAx8JSUdTyfNDf9FE55g4n6f7aa3WAZsZ?=
 =?us-ascii?Q?Nekxwj20pUv90y07r5Q2M3Kiw1FbSZYFShj8pqz5/mf+QZl/OUgvH0AC2xj4?=
 =?us-ascii?Q?LNk3VtUlby/YzZl/y/yop7GKGgYhEDx2S2fHrViVQ+gGzRJGQ8DQBQ2NCQXd?=
 =?us-ascii?Q?MFh5gLFxRx4WJJSsxa1VYdyLsuhDxI7MI4+MCSCgcYWKBzew2s7dy4yDlbsz?=
 =?us-ascii?Q?aGgNypWq7Lqpm8tEkGiObd4hSRHZedjIJb6aRj+6/tLhjOHsU/9XV0OY5855?=
 =?us-ascii?Q?ZXXVxxz1SfF5l0AoqVlCo8E5bCiNAVy39HBfY3xnALp6MeFOQmaHCyf7yeir?=
 =?us-ascii?Q?6b22+sCXI+HtzJGKMc0whvLeZWZRemOD11vd3S+zZF8wsgXtMW5XbghozMci?=
 =?us-ascii?Q?7F5DNVFYbmA0jHx1cVuPaP78PAqJ0YlpyUppsBypPsbxHygcTWLtpgbGUHLd?=
 =?us-ascii?Q?mSf44ZP9PEhUmHHDyXwZqRz3j+3EC9vzjLJ75VKXNCGfrxifV/1VlZoucBUJ?=
 =?us-ascii?Q?we52SdJesGDV+s7xiSL5FVVCrQeOM3zvNmz7AduWUMGPV35/qMgns3XICw/U?=
 =?us-ascii?Q?HFuVN5h9aXDb6ruDKyfeTKLlrQc8IYHimVRqNno90mwY9OiFtwgye9nUKXxA?=
 =?us-ascii?Q?fPg/zhziCpR6InTBRiHvCFRxdwy6BBB4gb99CY6+A+KHzCrRoiF4GiL4aDo+?=
 =?us-ascii?Q?NpJ8C0MF2j062ntggwy9QzwpcrHrN2eNRxNWGffB554VUeBXrZViE0ja6eEy?=
 =?us-ascii?Q?aBCFkgmb9ezREqIm/BjNqGwl40esv7xcWkGU65RjdquC8dhX1XGK/mSyk32t?=
 =?us-ascii?Q?1NgNJ9U3Oi94o5JlzkWpTFVamjbiiEJXFO12Y0+dAmxUVR8pjRPVZYacpUeL?=
 =?us-ascii?Q?cDxggwuxlPdjWXVU9MNaYzzqdquZz8f57Q44mCtrcp2V1CtleTzm4VmHYPUy?=
 =?us-ascii?Q?ow/5uFUuFXSvgE8k1lGfAupfEueT/32rjknG7LUq46D3IkkMTmfUHzGibF2R?=
 =?us-ascii?Q?+lWO6JAZ25PaaIt/dHlb8FrbtPhOpaKg+WJUY8QVBkITGqNqLarNRgA9vvFY?=
 =?us-ascii?Q?0xEv0hWu2Yw01+xJrasUB67tMa8AxzlyAm4e4UfwXu5GHaEJ5nyzSmAcO7d9?=
 =?us-ascii?Q?L003vqS55Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a2591e-f019-426b-bbb4-08df0e41207e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 07:08:19.0572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5A7HwqzD7gh99S2/J0ZFMfMQosxZD6T9rZGpQFMlD0HGMKwfoIr1Vugkuj5YD1mdr78GK/4IJXMQkEiKmyUBxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10952

> > +description: |
> > +  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport
> > +I3C
> > +  hub devices that connect to:-
> > +  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to
> multiple
> > +     peripheral devices on the downstream  side.
> > +  2. Have two Controller Ports which can support either
> > +     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
> > +  3. P3H2840/ P3H2841 are 8 port I3C hub with eight Target Ports.
> > +  4. P3H2440/ P3H2441 are 4 port I3C hub with four Target Ports.
> > +     Target ports can be configured as SMBus or I3C and connect to
> > +     peripherals.
> > +
> > +  All variants use the same register interface. Software reads the
> > + number  of target ports from DEV_CAPAB. The x0/x1 variants differ in
> > + their  power-up defaults, which the driver replaces with the DT
> configuration.
>
> I don't understand what this driver reference means and what is its purpo=
se
> here.

Okay, I will update the description accordingly to only convey the hardware=
 details.

>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,p3h2440
> > +      - nxp,p3h2441
> > +      - nxp,p3h2840
> > +      - nxp,p3h2841
>
> I don't see improvements.
>

For this one, could you let me know in a little bit more detail what you ha=
ve in mind?

Best Regards
Lakshay

NXP Public
