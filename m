Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44A18C02E;
	Thu, 24 Sep 2026 04:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790222636; cv=fail; b=lQkq4f2y8q7ZZsoZECqWP4xiGETIUvCbDMI+meQp6h4Q2YfiCVFYw2e9xIcu803479oKXy5hvQyLhT5KVobmUEnkcoKAKAp+jYsw46xSOYewkFvxjAOfILroxAEudq19NAvlE6uvaC+M+uIUlc4aDLecdBzFd4iq8iL6OQoM8Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790222636; c=relaxed/simple;
	bh=oY6cH2VJ9H46PKNz54n5kFZLO5LIFPebjI1LQk98Kjc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H+Uw8GWgyooS8x2d1tSpaP73m7M3QlXd3sjSkfAeitXNBPb03LXW79SVcIcz6IH6eeZUiWZi3l+nA82c4LalwJQg489QIyazd15SmlRJZSVTsKIMwjvx0233VwvxcbhsvvEhwptULJo6rr0v959+q1yGylLkP+6wM8j++5iLVxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiC4QC2KVXG8em1C8bQNxQeJWB3GiC67WS0dAHJI2tw3mrNw/diuD9CTN8hGafD2q4PvJQ7GBwtDvrkymtB68P6TQuIk38LIgY1yKKhCDJTzXbdDPC61yxJYY3ZIBi5jyB70N0o8B0BP29WN8isHTlfhIGOZIjDh+DADMXhnEzVEHgVmovSWKUM8oMoThn6wXd88ENr5brBpNsEs0nePw7D/XXbm27xitMPG/+K1rKk5u7vR38Cv/uswkYaTu4EgnjzZ7PTAow49Xw4u2CZirwfKmxXci3qOZjyK5lhChdDjCMdNerU38Xip2DyzVynvzjIagA5RfNoShN5TyYAS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ulc9LYHgRStiImAZhruyPekaaQaMrYUh0lfNMeZyA+w=;
 b=FEXhV3kORpmu0FTA9Jo2EC023URHhjtMXzaZBSk1024TRMVVZGYCY0MRLnC2QMYNVW/jJfP+g/bTc+4OF3n5Dbxk/CJ+iiiwUDLlFb1Dm9tnbDu/1FaNJ9izMcK2QbPVPjGoYI8yir0qnHxRSOPf5/10/kQ1KywsnQRhXMZhvmNdYK4ww0OqD47n/P/U9jzrO1biXNB+Hmh6bv0GVhFJwfsaE758V0MTR+YP6mB/DvvpXKf09GeJabBl5GE/HJoT1VcXhLchlR5i9Lq8BHgX6jmNSIVUGULkZ64kngwW6ALP+Mg6YWEaDV85+tqqH18yJcImhaxQaTllTWqBYqkCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0878.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Thu, 24 Sep
 2026 04:03:38 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%4])
 with mapi id 15.21.0428.014; Thu, 24 Sep 2026 04:03:37 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: usb: dwc3: Add JHB100 device
 controller PHY adapter
Thread-Topic: [PATCH v1 1/3] dt-bindings: usb: dwc3: Add JHB100 device
 controller PHY adapter
Thread-Index: AQHdRzzjXuT9ARZGdUGDbHIGHUq+Qbba3XSAgAJHa5A=
Date: Thu, 24 Sep 2026 04:03:37 +0000
Message-ID:
 <SHXPR01MB0863BEE05D53154B1F61BFE6E6812@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20260918071103.24482-1-minda.chen@starfivetech.com>
 <20260918071103.24482-2-minda.chen@starfivetech.com>
 <20260922-colonize-uncaring-c604b3529275@spud>
In-Reply-To: <20260922-colonize-uncaring-c604b3529275@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0878:EE_
x-ms-office365-filtering-correlation-id: 555de3e7-13e1-4d67-101e-08df19f0cfc5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 8r0ZLbVmhH5hd0bA0A+QRHb8wF7lJrbZlkBZrZz9TMQoz9cUTs6WvfbBx2Sqe1M7z44U9wKXGsAuackOSIr2lxakqG2+PdoCLR2RixkMBdpT26jEMeXZXkldeSOlz5zVcSgr3Hl6OMimQTUGiHnGY6p0CnhnxBRgDfp3MFgmGwffFZpQQ8pXr9apf4G8FPUrhRaNoDrgT8I/JoyRASULAqCP6zLUiGx3H26o87siBKBkBQXudNco+ARnz8X/hZxL+aumTEHcs2i1I/7gqTMl8O/giYKQC8YUsiMg3oZ9Udo/Or5HcvJK7C6xgrNAwHQ/qEpxpbVP1QYAf9gt01TG2sYThoo6TQ0h7sUi9uI5jRNIxr0+0kb5kMFwxG5EiZTwpZ2LwT/e9CmarAofXQACmf0ZNk/HC1OF+L+vAWGD9TpIErtEI5j/lcEsX6OOCuqYj7EQzGZE8HjB6MitGLpywHxjcKbYblKRYb9LBIbEkUIoqPGTS5zF0tCFbVKE2ekoDKhvzAQhSPyJftL3dSe3VtH91Jx82M5MBe2FHCuNHDzHlceJ43y68tmEzeXNBzkf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gJYdN7gGiOgFUsdSkdW4CO5sggmxkKTgCu5igAwq8/oN8BcKYL3z+q7Q2AV+?=
 =?us-ascii?Q?qs1LHvIHcdcFkepEIYXaQnCLSRbSMuSSbMsy3moW0ZQA5ucCs7W3d+8A+TaM?=
 =?us-ascii?Q?hTbDHDmqnAUZ+EjuVwLSu7q9QMJWvcQkLAn/A/RfEDg/jHcS0jMPOC7exHDF?=
 =?us-ascii?Q?RAY8g/IuIv6vazUHsVP3D5GrrdzfhMiqhsDXP7uAVfHhYDoFz9DDZ9bCH19T?=
 =?us-ascii?Q?GC915qwC/b5a6OYK0p7GTybFAY8UD6DK6l7wfN+VuyTU9aQZgpv7JRp2Vy02?=
 =?us-ascii?Q?dOdbqfl9Xz5v/t/vIRA4c5nk6WylxLtLI981zVx50ib8lb0F0I8BUd9LHm9J?=
 =?us-ascii?Q?o7AqMKxdHi1kY4EaXoWsXSmUy9++zziTgvMVULg3wrsmZIbnDQnt1imt0nba?=
 =?us-ascii?Q?ZCBp7FCawlGh3DBcj5JIcLoOJUviTxySVQdgt6iBgDnmvFUzkgKxZyAcS3hg?=
 =?us-ascii?Q?QZfBdjTUJ46CqC6bSqID1zLVhbRjqdvKBsIxsVAxmx/tE+Ly1y3NuBzRcLmx?=
 =?us-ascii?Q?SsvB8KwWqFD0opRWBgkxyjeGj59hu6+hftkWDZAhBLRGYyLPvsdAjHcVSzL1?=
 =?us-ascii?Q?Xo+SDH5c15SPtbAAvlJUQi9UBTeqNVo9/cfMpG7nQf8LLWhSkWzKnWy0ySyR?=
 =?us-ascii?Q?uyu3T17MxVPz+IqDo6wrkSq5LaOIRYOpTe32inuP5Ey5hGmVdlYC+jEBs05a?=
 =?us-ascii?Q?Iww4szy8pFCH7Lillb7ZyZzgOYyQi129SjfczFmMh9sSWI+brmsRiJhA83Ze?=
 =?us-ascii?Q?/OuX8mkczD/FylBe6B0v6BX9dMvBVT3KdQuzj+Asy8RSdKJBVA7geA2K4ftl?=
 =?us-ascii?Q?AxbdxYM87AP2eUzjDIzxEmXinDgZc5ET75+/MQmAEck6QRR1A3uTIaaVdHUG?=
 =?us-ascii?Q?SwtzmB0PkM7+GQuaIozOf8bnS+AKm3RbnG2q1n+BETrJ9RDRrR22fDZtt2TW?=
 =?us-ascii?Q?Vrk3mDc6FExbv+lvuLKaBzlqUYU5+fl74qsAFE5o54PtMuoPWJw9g+lZFx6y?=
 =?us-ascii?Q?PUQuBu2MaC6pyodVkkm5/2SXzWPeLVwPb8d97CmMrZdLUTHvL5H4TQiqSIhP?=
 =?us-ascii?Q?DlJQ0jvPHm7Ey4y3fIf7y04pB+mltjadvXcDcu6l/AhBV1F+CVRI7CTjNBE6?=
 =?us-ascii?Q?7xoNDd50CiN7XeELWRHkHSznb0Tbqogm/cIoUEGeJxyKFlAw/4A5zgJ13mwC?=
 =?us-ascii?Q?LKYtnJWkVh4EsfWRA1f+Q0XAd/qC9MnRwFC/TT/8SACLdk1flZFHcb4boELy?=
 =?us-ascii?Q?rBFnVWbVL9Ais8IMNlIoYjHpBkOaredunJujInyZ02FOYVq0yD8ywQOL6dbE?=
 =?us-ascii?Q?8fNrbhUmTHJb7DvzCUl+LtNIpRmT5OxCOVXDUpDPsvjN1/JUF/3/7YhVL8zi?=
 =?us-ascii?Q?zZit2zpbjeuqZr1LIZkFF7fokJl2mOMKJVTlgn0nNgDW+zBD1Z6S14MLvh1E?=
 =?us-ascii?Q?+zKgjM7FB+t9qZjbcHkR5nUCk/fLMf7pPxn099EhGHziA5snd01dLcxtXeff?=
 =?us-ascii?Q?XvoQHUluWSKSlYMak27LDrH+swhgq58pfQ2+/nALJB4ARZDoVTm2nK7cDCgF?=
 =?us-ascii?Q?e2nieLurEgfGmkfbEozQnFGDeyND5jXzoQhKPlrrRuEDieu8rnVhprH79GNm?=
 =?us-ascii?Q?uzknWFTF3hQZjO0fZe/MYDwrQfJYCLulmXLzCUOZRhjL1NP85aZL7hXWDo46?=
 =?us-ascii?Q?yAsWyTpXjyXyAi76UZWG0LKRhRdnRQKZpEB0hwELaQOyLFbEDLmSPMkrvyjX?=
 =?us-ascii?Q?8+n4hV79dw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 555de3e7-13e1-4d67-101e-08df19f0cfc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 04:03:37.8216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FHD5NUU9n+H3bZbDt/PZwbY4HVRL+xQR7xfd/KovV2yRV6PLTDaHxmEaKmzTAQlr7s8JIHLVWZsliZ3kB3Q0DItMqaPCB+iZqn7mfJedXuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0878

>=20
> On Fri, Sep 18, 2026 at 03:11:01PM +0800, Minda Chen wrote:
> > Add dt-binding of JHB100 server host field USB device controller PHY
> > adapter register IO region and its regs-name.
>=20
> I don't understand the rationale here or the other binding patch.
> Why is it not always 2 regs? Either the device has 2 or it has 1, there s=
houldn't
> be variability unless there's more than one instance and the dfferent ins=
tances
> have different numbers?
>=20
> Cheers,
> Conor.
>=20
Thanks for reviewing. The virtual device controller do not contain PHY
but need to add PHY adapter setting(self-develop by StarFive). So have 2 re=
gs.=20
Previous is BMC USB module do not contain it. But if PHY adapter be moved
to PHY related driver can remove this . But Thinh still no review the patch=
3.

> >
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > ---
> >  .../devicetree/bindings/usb/starfive,jhb100-dwc3.yaml | 11
> > ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> > b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> > index fbabe99e9d5c..b2fd98c06ba0 100644
> > --- a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> > @@ -20,7 +20,16 @@ properties:
> >      const: starfive,jhb100-dwc3
> >
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: Core DWC3 region
> > +      - description: DWC3 device controller adapter region
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    items:
> > +      - const: core
> > +      - const: adapter
> >
> >    interrupts:
> >      maxItems: 1
> > --
> > 2.17.1
> >
