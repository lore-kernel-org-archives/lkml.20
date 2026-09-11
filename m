Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022099.outbound.protection.outlook.com [40.107.43.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508D6387363;
	Fri, 11 Sep 2026 03:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098824; cv=fail; b=AntzvLbp5qfR8HBOVjLGHt/slhe2VTkZK3XPFSPvO6CD00bwzsfY6NxpQOUNC7Y6KjI0YMj1/XLbf120CVeHxVrw/32DDLp9E6tu9+EuJcmKSrtBw/djHFMwOVKtKlkQiVztL6jtA3nrRH4GsuRNecCiktCJTe7aZkW/VbAo6hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098824; c=relaxed/simple;
	bh=JvMX5wW7fpIbDOcBqikWcQFkcPPuamywo4kFA9HH6zQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tooM8EA7HA5Eh1zLBNCl1fXyViCb/qVynwLwq9wWAidxRDJyr6trcydLBooPzlYNzPFCji2frsr05p1ulOuMkbmp5VT0589/0xTDg9WCVujNmxpuRswN752Mf5Nn1GSYogs1m97TRiso30WfZeYB3K6f7LFeaK0BhDlltQ88HSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=iLsYBpqg; arc=fail smtp.client-ip=40.107.43.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="iLsYBpqg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBImvdPsRnD/gToPI/QqcKhVC9fz+1lPYVrDxukm1PSiycG4V2XMA4GraPEhNAM/5LavHJ/96cbYZiGVUcAh2Ja7tMLo8eJzuRQ32a9rPsMlohhQRl2BlPKDQQKcx6faO4bVUi7r5Lo0A5YlA1CpLhCPLmEuAgUn+WPKEbyooNsADxipv8v1W6Ht81fzgydaAQ0BRExBMYhARJOTOBqswduxAwY2BVbPp3htLC+a10k4iMxLLkXbrtadFSmkgipfghJXBOZzFmaTIIuM5415wo/cUVTRpxHcrSVpUTwcv57drFbdQ6jkTiktuH7+FSdoC6ZxmrwMAzFuhBc1Qdt6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvMX5wW7fpIbDOcBqikWcQFkcPPuamywo4kFA9HH6zQ=;
 b=DHXHFy0OkaTbT9lKMxKWcGAwv1MLhrhBiT7j0dpsBpPOX8pM6EPX9+HFUePr58/y/YgJXeKrj9rtBTksy/oiNjYg0KOJQvEIbT2lQ0EV74usbSrcTBALvb/alCAwhgeGjylQU8iJVdH8jXopUATRAEj79iuo6+1bHOO+e7ws30rXofd3m0VTcBJ6Qngvnj2Z9gDmKy3RAQvjYYNjSGvzleCEm4z4GSS0Xp2LiKcBWbbF8rwhJJrSVZ63StMLNnO0Zxm+JjKWQu3nbToXhAF1DRlOTzhX486hRIn7pFn7JVj8P7L/K/kcDeH3q8/gMPnia8u2+FcvcDSn9cBgqzat1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvMX5wW7fpIbDOcBqikWcQFkcPPuamywo4kFA9HH6zQ=;
 b=iLsYBpqgwrwbHLGALk+fQIRxxPhW2/Ctse13A4ZOHKU1tFVTLv+7byfwP8q5HvbDieG1e3I1CgtvwbE9e4EJkSjgGZ4TJAp3e6bDPP1rfbDNuJdh5ENcbHOcDZPCmZNeEM7VusOnrDr4Cf6FN/q/brIU9AGOPW9pIlCBBTF2qda/cY6K8HEW6KBdzIiRVukIJnqgZR5IfL6dDbAP8uNUU0xFtqd9NZc6xuoV2EdCO9V2+/rWT/j7SmtSUjUmnOZIKmz2M1ADNjKr19b2Qi1PMiYxG9ZsqM57T2evkEe5ve5F4TwmNuUQYPEbL4G/5i26P4BJgXc92BVgtaMNoqZNJA==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PS2P216MB1235.KORP216.PROD.OUTLOOK.COM (2603:1096:301:a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 03:53:36 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 03:53:36 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "jackson.lee"
	<jackson.lee@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>, Ming Qian
	<ming.qian@oss.nxp.com>
Subject: RE: [PATCH v7 6/9] media: chips-media: wave6: Improve debugging
 capabilities
Thread-Topic: [PATCH v7 6/9] media: chips-media: wave6: Improve debugging
 capabilities
Thread-Index: AQHdPDktsEnKbE5LDkiQBIYQyxEwJLbGvoSAgABg/+CAAOd9AIAApaMQ
Date: Fri, 11 Sep 2026 03:53:35 +0000
Message-ID:
 <SL2P216MB244118628F6D188D0096A289FBBE2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <e7f599a5bd65900eb45daa3b637597fce464c383.1788496816.git.nas.chung@chipsnmedia.com>
 <aqHES02SJkIGZWDc@lizhi-Precision-Tower-5810>
 <SL2P216MB24417ACC2BD099E4A5EE1399FBBF2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
 <aqLX2DhQFnY3FAFz@lizhi-Precision-Tower-5810>
In-Reply-To: <aqLX2DhQFnY3FAFz@lizhi-Precision-Tower-5810>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PS2P216MB1235:EE_
x-ms-office365-filtering-correlation-id: ddada477-7c7b-40ee-390b-08df0fb841ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|6133799003|18002099003|56012099006|22082099003|38070700021|10067099003|5023799004|4143699003;
x-microsoft-antispam-message-info:
 BP4635WUojdN6rAIit8vnWj2TJUL5WS1Ly4L6lxDQJj6j/YbzEXfB9RTNXJiZHl8byNLhiINl53nMAeZM/cHipbjS/L+u3gOMtZxJlDTTMrJdo2cW9t+gzEvWEWjq2+RSUFTaIcsm4phzTCo6X2KWBnaf/obt/nWlXIE7JQJyA7uCMLxiU/rYAF2rDlOI+1WDnt8jVouSiuqqlFc4vhUWb+FhrbB7oqkEEkTK7U80TBIc8yYgui23sT/x0PGFMbm42U/oxuWnLqTSHK585Qiek7ufm3kZIrYD13uMRznAKJf6jY4fZdmXm0pZPCfiSf3a3XKIqT1dg6dHBrtDJkw0///jBm7crVuliyVNC9VjpbQI3vBchacIG4MhOPwqUJASs28Xl3g1m8f5FmV7ssHuvLU0XOnjTLThNvq0ltmlZF5LFycT7QZ8PXRvwXeXigZYCzjtMOI24TS4sXKp7ycfLFWSAPt0JGB1jkXSUF2unKEhw+IScdXWSIcR1ITHNNIFl78TDSKcYhZF/0jItVZUbUw8YC5mqN287V7JmkITuUbLsMIdeJ/c1s7PBSI6CX9H6y39JLHJGsckVRBrGct1pZhLfGshzlQquqBmI+JOm2i8eHawuxE5d9k2XUPCPBjbbKLzVj3Z+3iRo3kAe4eU1rVRDSdMPdhkssNSO6fMdpXVJSb0wZpFqA7jrKd2rBQYXpYbxk+PPQs62meezLeLA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(6133799003)(18002099003)(56012099006)(22082099003)(38070700021)(10067099003)(5023799004)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hp+Nw8wMyX5gTlkgsQ5bFw1Yow/ByTGnH1q4nvoh4I9tokgDeM1Yeke/GL19?=
 =?us-ascii?Q?+Aizsl3O5gBFVjW2Mb1gwK2z7M9bC3DKnh4K+4b4Ic4P6JXNoJkAO7IXmScA?=
 =?us-ascii?Q?OmB2PhKby5xvuigsngnitYBCAZAfPOCPhkyfwnEhJJqrIfGIXF4wp7a1eA/V?=
 =?us-ascii?Q?efXfs6TFb7G1ppCqWxgEaiFLGdXprzAyfTqXlIAc052O+151+kmKGYMcDWa/?=
 =?us-ascii?Q?URIXLXi/xkka9BX6fEbD8iQu263ezhxsQ3zaxa6iet5lSg+2aiiSELzzcQ/+?=
 =?us-ascii?Q?e2jRUlz6CA6PFBiayZ97Nhs0emQJQtDV8zgb4NHXuXQjR7qZriYs41IVtb6u?=
 =?us-ascii?Q?7R9R5STAOOrA/aD9kDs7b/defDyEq3+C6sH1b0WPossYAVJpSKeJt09qDbmc?=
 =?us-ascii?Q?XmCl5JgQaY1pFsygIMKUaXs8OT+jTnTVhl37ivvjeNYpz6UdVkKoMFlooVxz?=
 =?us-ascii?Q?E0h+iGKIpSXJ7z7FwSqiocl3pA/XzsEBi9nj3k4meiP5683L6Ik9NzCz1r++?=
 =?us-ascii?Q?yjBTcOBhCbKlXeJqZ7lq4DRAgooTdYFHO6hpZk/7elP9IVpJTiBtCzgTCJXq?=
 =?us-ascii?Q?GNe05eInCyEJrWqpB5UJP3QbG3TP0M6EropCaBig40soEwJioBdPsHWuPBvR?=
 =?us-ascii?Q?SRFmp/Sfxs9H7muQpr8AOQvBLgj8mOSHxjYUydE5kDrhuL5CXexbSPfvWPZZ?=
 =?us-ascii?Q?DqhYEAhT7PwXsuKk3IDkTfwOIwTa93uG6zcTH9oZvZ4uWzMzp1xbzxO0yb2n?=
 =?us-ascii?Q?YivYt99CSoGM8b8PpLEgd2iuXNTEVMJl/DG7rf4JCuioVD1PAlL0GyhJ2m9v?=
 =?us-ascii?Q?q2wPjZDayT60U9lfvj77oJAjObGskLGEmnju/1IiejvpmQh4TWxEhQMSqSB0?=
 =?us-ascii?Q?OCMaD0mwdmQQ7P/AM1Pp2C+CYaziGP624KlGv6V3SYiPEo6u/tQAz3jSMxs0?=
 =?us-ascii?Q?19yYsR1oi/hMEQD/n3j80SvznTBd+dfQrlXXMWI2hX2DKycV4ubl0R4Uz4X6?=
 =?us-ascii?Q?50Gkw1nTe7w+okbAlL+6RrzaRPm8ChLWqqfwopZ0bfmiKqsbRt5KIWazKc+f?=
 =?us-ascii?Q?tnEwBpMv9hAi6/fnEi63WzHU7rHhTTBlwvP7T/xSRaxD+3vuKkQdLGwafxiD?=
 =?us-ascii?Q?yLc9JJn2qCmuMHmoPy5O6XGFyNBmhIMMMPvwNrWySx5rouZTSTRakuKVoWGL?=
 =?us-ascii?Q?JOhIxCDTeA8RRUIqNDP/FWWFSTgSE/Cnk8GAtEIS8xuvLj9I2BgWm7Sdys3i?=
 =?us-ascii?Q?WIsmT8jmz5ZrRav4MMEq+7Otfc5FRIAHl9MzlwMXSGOKjgvnGkD0EA/sNtc/?=
 =?us-ascii?Q?I5Q9+iN4Saf9z29uG1qkZlskRZTI6SbEt71LGjM5RFOLEvMxnP1GqFS+JHzz?=
 =?us-ascii?Q?Zx9W53pPomGkGSP8nmtyYOnVqUBu6Q5PNm5LziT+j9dh/OApxlN/uJGGAIwy?=
 =?us-ascii?Q?AQlUiLmps35/05ZI8OAZunow0mP0D8eIq0ALtR8JHw9+Tm217pA5zLmW3kj6?=
 =?us-ascii?Q?Y2+IhkeTtbq1u30qGoAlU+BnN+O4yyJLsoMiBCPb05/pMmg4N6rYT+ppyvyA?=
 =?us-ascii?Q?Ja6ynfinChRXDSturtsMAItiXjihSLN8ihqQjy1AcxmhwVmsI+2R3NV0Zpk+?=
 =?us-ascii?Q?uLk50hD9v8l39tGY2QVSzDPnHTcIOwlNXBX19XxZm1I7EGWm27KPWiUZZJKp?=
 =?us-ascii?Q?XF6IMPQ7oi6m0jtcruEoJQb9H7D9owcirIu9Z1QrdYT/a7NsoqbW5W4SzQjv?=
 =?us-ascii?Q?+k2k+WQ8YA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ddada477-7c7b-40ee-390b-08df0fb841ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 03:53:35.9899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BoXJ7ynEO4rUP5ho7wR9f+C2dMoxfmMTig84+9TsqL9mugRZ/PiugGrd4AnqhGVQDnecPQuZ/BwwuBc4aUBcPPsWhp7DIzIjuky/Rc3G8rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1235

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, September 11, 2026 1:16 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>linux-arm-kernel@lists.infradead.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>marek.vasut@mailbox.org; Ming Qian <ming.qian@oss.nxp.com>
>Subject: Re: [PATCH v7 6/9] media: chips-media: wave6: Improve debugging
>capabilities
>
>On Thu, Sep 10, 2026 at 04:38:27AM +0000, Nas Chung wrote:
>> Hi, Frank.
>>
>> >-----Original Message-----
>> >From: Frank Li <Frank.li@oss.nxp.com>
>> >Sent: Thursday, September 10, 2026 5:41 AM
>> >To: Nas Chung <nas.chung@chipsnmedia.com>
>> >Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>> >krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
>> >s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>> >devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>imx@nxp.com;
>> >linux-arm-kernel@lists.infradead.org; jackson.lee
>> ><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>> >marek.vasut@mailbox.org; Ming Qian <ming.qian@oss.nxp.com>
>> >Subject: Re: [PATCH v7 6/9] media: chips-media: wave6: Improve debuggin=
g
>> >capabilities
>> >
>> >On Fri, Sep 04, 2026 at 03:46:32PM +0900, Nas Chung wrote:
>> >
>> >media: chips-media: wave6: Add trace and debugfs
>>
>> I'll address this in v8.
>>
>> >
>> >> Add debugfs entries and trace events to provide detailed
>> >> debugging information.
>> >
>> >Nit: need extra space line here.
>>
>> OK.
>>
>> >
>> >> These enhancements help diagnose issues and improve debugging
>> >
>> >Remove "These enhancements".
>>
>> I'll remove it.
>>
>> ...
>>
>> >
>> >> +
>> >> +#ifndef __WAVE6_VPU_DBG_H__
>> >> +#define __WAVE6_VPU_DBG_H__
>> >> +
>> >> +int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst);
>> >> +void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst);
>> >
>> >You add this patch 6. but call this funcation at patch 4.
>> >
>> >You need make sure each patch can build without break bisect.
>>
>> You are right that patch 4 calls what patch 6 declares.
>>
>> But the build does not break: wave6/Kconfig and wave6/Makefile are added
>in
>> patch 8, so nothing under wave6/ is compiled in patches 3-7. I built
>every
>> commit individually.
>
>Still not good yet, you can add call wave6_vpu_create_dbgfs_file() at
>patch 6, instead of patch4.
>
>You need make sure your code is built and passed at every patch. You
>can add library/makefile firstly, then enable it gradulately. But need mak=
e
>sure pass build test, some kernel CI tools build each patch and easy to
>locate the problem, if build failure at last patch, which cause some
>difficult to locate the real patch, which cause problem.

Agreed. In v8 wave6/Kconfig and wave6/Makefile will come in the first wave6
patch so every patch compiles on its own. I'll build each patch to confirm.

Thanks.
Nas.

>
>Frank
>
>>
>> Thanks.
>> Nas.
>>
>> >
>> >Frank
>> >
>> >> +
>> >> +#endif /* __WAVE6_VPU_DBG_H__ */
>> >> --
>> >> 2.31.1
>> >>
