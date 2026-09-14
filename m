Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022129.outbound.protection.outlook.com [40.107.43.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAB262809;
	Mon, 14 Sep 2026 04:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789360634; cv=fail; b=hbHhrm0TlpvggfeL6tIZuUzQsM/nymr6lZc+HOKOmlfqnTWN4fN2F/KNYvFZf/xrTWqkFkgJpZi3VKZ3nzXW41jaPnJRFF53b9APmoHz77VT5CvsHVKOQE1f/0ETnykMEkHKQV2QHv2KNS4zfbW1xKx16dbOtpiPLULbe46iiSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789360634; c=relaxed/simple;
	bh=eGh1BkeRWEO68H7gL+Yxt26KjG/FJHhCWWGAHnzXowA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sUQ2rmGPr++gMkhOOBFHd7LnKVLnXu+3Jr6NapJnQUiPERC0GJvfIcgQmwpLb0z0i7DcenxYw3fYAMuzaTpszcAUpVjh1QuWSggLyMl8MeOl3WhJqgyHeDECOjmJLxSWsX4EX/pNmbfOOltkmjCe8HRu3AjkM1071Xf8WmXNEpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=yqgBbnGj; arc=fail smtp.client-ip=40.107.43.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="yqgBbnGj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTMvdzEc5Jx0JDk9hX2RFBLVzUNoAOBNUg2EN9ehtSiuDKcQkOc8UqOm5qY6cbN2QeGnVZWCTiPp/E0sbIYosveXY0giEMnqRmXPp1RbkJ6iAFBT1Pg05v+qrPW4mA8Zt6N+Yx88kDSPLC6BrNpUWaFiBQSnDcIEkzRMHDlHlhTyZXaW2GkAteOQxrs+x6KteWtroxV4CAXn/6DzA3VdD+GanJhQkShY694aDsiYJ8Ifp+Iexgt/C3djsI+hrMjeyEIrp/4ogMa2Vv+zK2xK/rPbezNq3sGuzEIZGjxTYfv/xKx4JbkSev8eaON9/ZO6zo3SEKHRtTiqTNs9JouSoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkblFcSFx7e+BWKC1sog0A2vPZDIQKc+8yYgOJrTjHw=;
 b=IbaX55+pABAdHU43Sk7Eh5U43x0mR8pt1DM3HG65X7fsxanvqWs39GcO7xs6I+R71v9aJAbZE6RfeVrsGZrOUgwzkTMBMxTA04ZmgqwT2ObedTuIS8UZ4eMRQ+FNFFyxndM8zMvZrTuAvcesGSEdXV70jAL8Iv4J1d7U1Z/AvIFNe4P826C/yg5WyUq9ZtSCRDMdGDjyOJf67xN0w8B6E7twSSP1RIVKzoIbghJ8Dzo5bk1NappH79+NF8Uq/3OXIJr3pK0VJHehltXpig4pB5ZewJd0TlXuWIDpd0eONpnt1EBCfolyT74EEBMPeVhqXcsyBikJCNG3w+zrUOhEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkblFcSFx7e+BWKC1sog0A2vPZDIQKc+8yYgOJrTjHw=;
 b=yqgBbnGjjSf8RPRj8tJoec/EQcKJJSD0fJDBJIPy/QwZy9Thk/1b1MKBpW7jXvKbTwdyCidVTa4Zu9C7jfM3SnpkCPW6CXBHjnBjzNcaeVl5FzHthIkZjUuNjtk2fjqzMeXN4bM/Shsfo1pYLxo5YLvy3qAPlzf/F1zhXVr0quwKTzrIt4xUy9ibV8eF04uK/bjxct5PD5od1SF9XLs5YvOOZ3yttWRHJKowxzhehHzx8/KHd3BNupet5W77NC3OeGiC8xaRpDpHCm+55AJZGtY+IkYxvAcnjzLVMouvwyENewH0uAe10+G28knwGpHoTfP3UKa2QhY7DaZgEawUiw==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB1358.KORP216.PROD.OUTLOOK.COM (2603:1096:101:12::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 04:37:03 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 04:37:02 +0000
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
Subject: RE: [PATCH v7 3/9] media: chips-media: wave6: Add Wave6 VPU interface
Thread-Topic: [PATCH v7 3/9] media: chips-media: wave6: Add Wave6 VPU
 interface
Thread-Index: AQHdPDkr23ol+EHgZUqQjr0gKJp7ELbIQuaAgADalQA=
Date: Mon, 14 Sep 2026 04:37:02 +0000
Message-ID:
 <SL2P216MB24414CAD6646D4C97CB626FCFBBB2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <39115ce2f3d9cc18350cddc650b7cb40317e5ef3.1788496816.git.nas.chung@chipsnmedia.com>
 <aqMKF2k-SleSW-is@lizhi-Precision-Tower-5810>
In-Reply-To: <aqMKF2k-SleSW-is@lizhi-Precision-Tower-5810>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SL2P216MB1358:EE_
x-ms-office365-filtering-correlation-id: 181158f5-758b-4635-9d72-08df1219d2b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10067099003|4143699003|6133799003|3023799007|22082099003|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 nlEc8RtBGJPpxMqdS7TQD4tHgkSPRhEP35xq6QscozOdbBpEeMeASXIvcr9dsz3iUR6ansTK/8C022Gi+KLHBJ+4tCsbI9qquP+Gw7FDOmmprkyFwOT2CJdtzTHh9kPHPlazWFuayNH7x8wdzcMs2F3L1YmycDFmZMX6iAHRFLDwAVRbDWot55i9vKIfyshPW3umNHJYwQ3SGpVLg9oG4ZtMr+Yc05G0B0VyponjfvRNRa1q2V+aoy3dpynuQcPGBoatdLEvoAqbHU1FYZKBpWL5NHLmkryiH72VtNCHBvUOGTqazKTofHmFHkTOmFX7HjzOaglGhKJIEKZWuniR1dVdheMR5vFzccAoQxbPkpFpohAuZILe7aUxS31NiI4fU/UFV3Jo5+WGj2kuiMoYnci1knDxkFKhx5SPryi1Ooy7vO90sCzk/bzUX/FPWqF8OBse87EWRAPxyjCnYCDoCClG29V5m75SIiOcLku3nNzWgoTczLI7lB4gWVd6QB1PNp+CnnQXxrlP/Sl5LqRIsPSz0Xuc96xl2j5MiFg8poUn2PGA30piooZHP1AxGu7ec1FVahle3UuYz/nyW56JBP+gNJsrv0lSM/NdJapqWBbURYwCBWPa1ptfQYH6Xy0ywqWyWAFWws9DLSRI3UdtjY+0Vllpk9f4myaOPaWbXTOnP9sT324L7tdcHM8V1S6WN94uFG/0KHRnSDp+8gwRDemRtNBImymd5djjBt3TRQU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10067099003)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gVSl3b4B4lVtyx3K3LZhkp0LRMUUaT2PWa8rp8o7TugH0twiInQ/K8Py++8Y?=
 =?us-ascii?Q?/BCoNUkOLHDLMYku33QLa+ppRihkv/g12WOHKv0aGTeSHqROuQPyxBUVs06B?=
 =?us-ascii?Q?W5XmXGJtnuNGbMuKORu3hMYoKFmLd0nO6+zbc3Vm8ByK9mwQ1JxMQHUkPHq8?=
 =?us-ascii?Q?nhwr5TVxh0Dnr+wt9Nx/UYYoedRYLDFyYp3DMtmgRvfXco+/JfYKqIC10dRN?=
 =?us-ascii?Q?8w5j8InuyVLNn6lWlriKWbeSnNCG4EFuwBY+7iriUyUka6JJNPcVqk00f8Cn?=
 =?us-ascii?Q?2gGlazX08+bgM3ovZjgnycPdXwZhcuiIhXOfL40Z9X9PIVigFwt5FDSL7U2t?=
 =?us-ascii?Q?Fz36/8JgAakBSMtGJu9M5u6zvbk3Kc/8ONZEDdbKwQh8//cEJLl6+pVWBCzz?=
 =?us-ascii?Q?y+i9Vvd+4xOpVlVwjc8Jl65iUvet/LcGu13FYxrkATcmOj4Lya+7N6atJqT7?=
 =?us-ascii?Q?udAJPE6SiNib4yMqWo2shuLg6OxR9Rhp8dEOGdcnZXYoXVV1FsqmXcU0W3VE?=
 =?us-ascii?Q?oa0B8d6dagwqRg69a4zb2w2j6+v7bkMuhsk7uTshLD49Q2Uc36OiNM/kFmCL?=
 =?us-ascii?Q?DagxOg42EWWlQ7jAB7sMzMo5V9xWLRqYDpr+AhbIwTqIwfPKBviEE6P4Qh7b?=
 =?us-ascii?Q?zdQuNxw4Sv0DeBzLlHoRZw1W86Wdu6VE0pvY4ur3lbGwrVSiCQrgPXFJmBKz?=
 =?us-ascii?Q?VqazVkQrTPNBGJdDzovFMbGZSGYBeIAuvErD+Fco0/DytU6t2duwYjIFhnvG?=
 =?us-ascii?Q?88bcXZSFFFxyu9I5grsHy4QS/wcSw0zcV52uqDdJzCq0qCe2rLeCDsGJWP5j?=
 =?us-ascii?Q?wjyhUQeBm2O3tD+QCtaskdMQQOqH+xbBj47TlISEPbPFYMuYLCyl+knHhLlq?=
 =?us-ascii?Q?2/pOLLRp36Cfl11srK51dpNFIcAzvjeCmNFltxIqWrVR89O/ib2fAhuVKHXj?=
 =?us-ascii?Q?2yslXBbG9eKLPJYpChhTXT87yycNZdbiz1X+K9YBxNfwKkh2B/o2RMmCxBIL?=
 =?us-ascii?Q?BQa5sp+b5o5xQXOJ2YbbSAhadD5FJ/H5hsydeWrG4Eta8NmBSiGJYM1JV4B6?=
 =?us-ascii?Q?bIgyfl5FOz86qnasHcL/Yv9vI87ZSEfMMHyiRiPZQ3FZLEiDSzgpgEuqu5AH?=
 =?us-ascii?Q?l2FDtatmi6tC0jSOXsEydR12zEY0OsLpZ3otVuMlFvvpLnQqIJlX9ev0k8Bn?=
 =?us-ascii?Q?9OK8ywWx2LVEzzdj5U/oGYNQ7qRhVJQX8U2H66lPis9YnW2EA4fQ0r6qZrYY?=
 =?us-ascii?Q?91f8LCySps+JcpNz7IQ7Sbqq8luGJiuANiMU4hVd0ncBreIZU2rORjaeNyk2?=
 =?us-ascii?Q?3K5eY5y1Ti4zmGTJjWhJIH1PgX2zMeknoKWdul4XBybZCzBJ4UaylzEvPOCE?=
 =?us-ascii?Q?mMDGEiPtFAts0SiloVg5yY3I4jWKMOikuePb66d7+C0eNwy/An+ZsqeO+IUT?=
 =?us-ascii?Q?h2/jtVwOzBbvWz8uZ/pzuR94RV7MJXCTf1WpFcRtbr9JNhLq2sf9plBsK90c?=
 =?us-ascii?Q?olCE8Cuh+QqODrSP+TSdcQdgMnI10s6e9IGNL8SlndoBjP9U+TDwBsc3IimT?=
 =?us-ascii?Q?Ql6AVx5VN90oBSHiZzeSL7wRP8EBS5odsJ3znRAkRAY+KY6N7IO7Y99/J5DI?=
 =?us-ascii?Q?vag4RRTJQLZrX4HRPbwPAsSBmgGAlp+xcvz+QIDaScHLjJWRfx7iudxdSV1g?=
 =?us-ascii?Q?zJEDLbo3Gj2Phtdsx2HICWsh/+qNTHehB4OD3mQZDEzzsFg/paurmeeqy7ie?=
 =?us-ascii?Q?HefUUVh7OA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 181158f5-758b-4635-9d72-08df1219d2b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 04:37:02.8325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMR78/JpCLnoZ7/GII/JH7p7X+Cih2a6vJmdumKBLI7NuM3ddHpEpmAeA/tyNAVzUyE2x3Y0otETW4ofRXoo92042DGEghTRRAyQJG24A+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1358

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, September 11, 2026 4:51 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>linux-arm-kernel@lists.infradead.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>marek.vasut@mailbox.org; Ming Qian <ming.qian@oss.nxp.com>
>Subject: Re: [PATCH v7 3/9] media: chips-media: wave6: Add Wave6 VPU
>interface
>
>On Fri, Sep 04, 2026 at 03:46:29PM +0900, Nas Chung wrote:
>> Add an interface layer to manage hardware register configuration
>> and communication with the Chips&Media Wave6 video codec IP.
>>
>> The interface provides low-level helper functions used by the
>> Wave6 core driver to implement video encoding and decoding operations.
>> It handles command submission to the firmware via MMIO registers,
>> and waits for a response by polling the firmware busy flag.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>>  MAINTAINERS                                   |    1 +
>>  .../platform/chips-media/wave6/wave6-hw.c     | 2030 +++++++++++++++++
>>  .../platform/chips-media/wave6/wave6-hw.h     |   56 +
>>  .../chips-media/wave6/wave6-regdefine.h       |  649 ++++++
>>  .../platform/chips-media/wave6/wave6-vdi.h    |   92 +
>>  .../platform/chips-media/wave6/wave6-vpuapi.c |  336 +++
>>  .../platform/chips-media/wave6/wave6-vpuapi.h | 1007 ++++++++
>>  .../chips-media/wave6/wave6-vpuconfig.h       |   72 +
>>  .../chips-media/wave6/wave6-vpuerror.h        |  262 +++
>
>You need make this patch built-able. Add Makefile and Kconfig part.

OK. I'll move Makefile and Kconfig in v8.

>
>>  9 files changed, 4505 insertions(+)
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>regdefine.h
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuapi.c
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuapi.h
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuconfig.h
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuerror.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7387a11facbe..e29018c2546b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -29239,6 +29239,7 @@ M:	Jackson Lee <jackson.lee@chipsnmedia.com>
>>  L:	linux-media@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
>> +F:	drivers/media/platform/chips-media/wave6/
>>
>>  WHISKEYCOVE PMIC GPIO DRIVER
>>  M:	Kuppuswamy Sathyanarayanan
><sathyanarayanan.kuppuswamy@linux.intel.com>
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c
>b/drivers/media/platform/chips-media/wave6/wave6-hw.c
>> new file mode 100644
>> index 000000000000..a91b582af023
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
>> @@ -0,0 +1,2030 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> +/*
>> + * Wave6 series multi-standard codec IP - wave6 backend interface
>> + *
>> + * Copyright (C) 2025 CHIPS&MEDIA INC
>> + */
>> +
>> +#include <linux/iopoll.h>
>> +#include "wave6-vpu-core.h"
>> +#include "wave6-hw.h"
>> +#include "wave6-regdefine.h"
>> +#include "wave6-trace.h"
>
>Add trace support later, add with patch6.

OK.

>
>> +
>> +void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data)
>> +{
>> +	wave6_vdi_writel(core->reg_base, addr, data);
>> +	trace_wave6_vpu_writel(core->dev, addr, data);
>
>Add trace support at later patches.

OK.

>
>> +}
>> +
>> +u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr)
>> +{
>> +	u32 data;
>> +
>> +	data =3D wave6_vdi_readl(core->reg_base, addr);
>> +	trace_wave6_vpu_readl(core->dev, addr, data);
>> +
>> +	return data;
>> +}
>> +
>> +static void wave6_print_reg_err(struct vpu_core_device *core, u32
>fail_reason)
>> +{
>> +	void *caller =3D __builtin_return_address(0);
>> +	struct device *dev =3D core->dev;
>> +
>> +	switch (fail_reason) {
>> +	case WAVE6_SYSERR_QUEUEING_FAIL:
>
>you define it as bit mask, is it possible more than 1 bits to set?

No, the firmware reports one reason at a time in W6_RET_FAIL_REASON, so
only one bit is ever set.

>
>> +		dev_dbg(dev, "%pS: queueing failure 0x%x\n", caller,
>fail_reason);
>> +		break;
>> +	case WAVE6_SYSERR_RESULT_NOT_READY:
>> +		dev_err(dev, "%pS: result not ready 0x%x\n", caller,
>fail_reason);
>> +		break;
>> +	case WAVE6_SYSERR_ACCESS_VIOLATION_HW:
>> +		dev_err(dev, "%pS: access violation 0x%x\n", caller,
>fail_reason);
>> +		break;
>> +	case WAVE6_SYSERR_WATCHDOG_TIMEOUT:
>> +		dev_err(dev, "%pS: watchdog timeout 0x%x\n", caller,
>fail_reason);
>> +		break;
>> +	case WAVE6_SYSERR_BUS_ERROR:
>> +		dev_err(dev, "%pS: bus error 0x%x\n", caller, fail_reason);
>> +		break;
>> +	case WAVE6_SYSERR_DOUBLE_FAULT:
>> +		dev_err(dev, "%pS: double fault 0x%x\n", caller, fail_reason);
>> +		break;
>> +	case WAVE6_SYSERR_VPU_STILL_RUNNING:
>> +		dev_err(dev, "%pS: still running 0x%x\n", caller,
>fail_reason);
>> +		break;
>> +	default:
>> +		dev_err(dev, "%pS: failure: 0x%x\n", caller, fail_reason);
>> +		break;
>> +	}
>> +}
>> +
>> +static void wave6_dec_set_display_buffer(struct vpu_instance *inst,
>struct frame_buffer fb)
>> +
>> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
>> +	int index;
>> +
>> +	for (index =3D 0; index < WAVE6_MAX_FBS; index++) {
>> +		if (!p_dec_info->disp_buf[index].buf_y) {
>> +			p_dec_info->disp_buf[index] =3D fb;
>> +			p_dec_info->disp_buf[index].index =3D index;
>
>index is the same as nature array index p_dec_info->disp_buf, why need it.

Agreed. I'll remove the index field.

>
>
>> +			break;
>
>where update .buf_y?

p_dec_info->disp_buf[index] =3D fb; assigns the whole struct,
buf_y included.

>
>> +		}
>> +	}
>> +}
>> +
>> +static struct frame_buffer wave6_dec_get_display_buffer(struct
>vpu_instance *inst,
>> +							dma_addr_t addr)
>> +{
>> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
>> +	int i;
>> +	struct frame_buffer fb;
>> +
>> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
>> +		if (p_dec_info->disp_buf[i].buf_y =3D=3D addr)
>> +			return p_dec_info->disp_buf[i];
>> +	}
>> +
>> +	memset(&fb, 0, sizeof(struct frame_buffer));
>> +	fb.index =3D -1;
>
>suppose this error case,  did caller tolerent fb.index -1, I have not
>see check this value.

In wave6_vpu_dec_get_output_info(), decoded_idx and disp_idx start at -1
and every dec_out_info[] access checks both bounds.

I'll remove the index and handle this in wave6_vpu_dec_get_output_info().

>
>> +
>> +	return fb;
>> +}
>> +
>> +static void wave6_dec_remove_display_buffer(struct vpu_instance *inst,
>> +					    dma_addr_t addr)
>> +{
>> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
>> +	int i;
>> +
>> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
>> +		if (p_dec_info->disp_buf[i].buf_y =3D=3D addr) {
>> +			memset(&p_dec_info->disp_buf[i], 0, sizeof(struct
>frame_buffer));
>
>you suppose need set p_dec_info->disp_buf[i].buf_y to 0?

Agreed. I'll drop the memset and just set buf_y to 0.

>
>> +			break;
>> +		}
>> +	}
>> +}
>> +
>> +static enum chroma_format_idc get_chroma_format_idc(enum
>frame_buffer_format fmt)
>> +{
>> +	switch (fmt) {
>> +	case FORMAT_420:
>> +	case FORMAT_420_P10_16BIT_MSB:
>> +	case FORMAT_420_P10_16BIT_LSB:
>> +	case FORMAT_420_P10_32BIT_MSB:
>> +	case FORMAT_420_P10_32BIT_LSB:
>> +		return C_FMT_IDC_YUV420;
>> +	case FORMAT_422:
>> +	case FORMAT_422_P10_16BIT_MSB:
>> +	case FORMAT_422_P10_16BIT_LSB:
>> +	case FORMAT_422_P10_32BIT_MSB:
>> +	case FORMAT_422_P10_32BIT_LSB:
>> +	case FORMAT_YUYV:
>> +	case FORMAT_YVYU:
>> +	case FORMAT_UYVY:
>> +	case FORMAT_VYUY:
>> +	case FORMAT_YUYV_P10_16BIT_MSB:
>> +	case FORMAT_YVYU_P10_16BIT_MSB:
>> +	case FORMAT_UYVY_P10_16BIT_MSB:
>> +	case FORMAT_VYUY_P10_16BIT_MSB:
>> +	case FORMAT_YUYV_P10_16BIT_LSB:
>> +	case FORMAT_YVYU_P10_16BIT_LSB:
>> +	case FORMAT_UYVY_P10_16BIT_LSB:
>> +	case FORMAT_VYUY_P10_16BIT_LSB:
>> +	case FORMAT_YUYV_P10_32BIT_MSB:
>> +	case FORMAT_YVYU_P10_32BIT_MSB:
>> +	case FORMAT_UYVY_P10_32BIT_MSB:
>> +	case FORMAT_VYUY_P10_32BIT_MSB:
>> +	case FORMAT_YUYV_P10_32BIT_LSB:
>> +	case FORMAT_YVYU_P10_32BIT_LSB:
>> +	case FORMAT_UYVY_P10_32BIT_LSB:
>> +	case FORMAT_VYUY_P10_32BIT_LSB:
>> +		return C_FMT_IDC_YUV422;
>> +	case FORMAT_444:
>> +	case FORMAT_444_P10_16BIT_MSB:
>> +	case FORMAT_444_P10_16BIT_LSB:
>> +	case FORMAT_444_P10_32BIT_MSB:
>> +	case FORMAT_444_P10_32BIT_LSB:
>> +		return C_FMT_IDC_YUV444;
>> +	case FORMAT_400:
>> +	case FORMAT_400_P10_16BIT_MSB:
>> +	case FORMAT_400_P10_16BIT_LSB:
>> +	case FORMAT_400_P10_32BIT_MSB:
>> +	case FORMAT_400_P10_32BIT_LSB:
>> +	case FORMAT_YUV444_24BIT:
>> +		return C_FMT_IDC_YUV400;
>> +	case FORMAT_RGB_24BIT_PACKED:
>> +	case FORMAT_YUV444_24BIT_PACKED:
>> +	case FORMAT_RGB_32BIT_PACKED:
>> +	case FORMAT_RGB_P10_32BIT_PACKED:
>> +	case FORMAT_YUV444_32BIT_PACKED:
>> +	case FORMAT_YUV444_P10_32BIT_PACKED:
>> +		return C_FMT_IDC_RGB;
>> +	default:
>> +		return C_FMT_IDC_YUV400;
>> +	}
>> +}
>> +
>> +static int wave6_wait_vpu_busy(struct vpu_core_device *core, unsigned
>int addr)
>> +{
>> +	u32 data;
>> +
>> +	lockdep_assert_held(&core->hw_lock);
>> +
>> +	return read_poll_timeout(vpu_read_reg, data, !data,
>> +				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
>> +				 false, core, addr);
>> +}
>> +
>> +void wave6_vpu_enable_interrupt(struct vpu_core_device *core)
>> +{
>> +	u32 data;
>> +
>> +	lockdep_assert_held(&core->hw_lock);
>> +
>> +	data =3D BIT(W6_INT_BIT_ENC_SET_PARAM);
>> +	data |=3D BIT(W6_INT_BIT_ENC_PIC);
>> +	data |=3D BIT(W6_INT_BIT_INIT_SEQ);
>> +	data |=3D BIT(W6_INT_BIT_DEC_PIC);
>> +	data |=3D BIT(W6_INT_BIT_BSBUF_ERROR);
>> +	data |=3D BIT(W6_INT_BIT_REQ_WORK_BUF);
>> +	vpu_write_reg(core, W6_VPU_VINT_ENABLE, data);
>> +}
>> +
>> +bool wave6_vpu_is_init(struct vpu_core_device *core)
>> +{
>> +	lockdep_assert_held(&core->hw_lock);
>> +
>> +	return vpu_read_reg(core, W6_VPU_VCPU_CUR_PC) !=3D 0;
>> +}
>> +
>> +static u32 wave6_vpu_get_product_id(struct vpu_core_device *core)
>> +{
>> +	u32 product_id =3D PRODUCT_ID_NONE;
>> +	u32 val;
>> +
>> +	lockdep_assert_held(&core->hw_lock);
>> +
>> +	val =3D vpu_read_reg(core, W6_VPU_RET_PRODUCT_CODE);
>> +
>> +	switch (val) {
>> +	case WAVE617_CODE:
>> +		product_id =3D PRODUCT_ID_617;
>
>return PRODUCT_ID_617;
>
>> +		break;
>> +	case WAVE627_CODE:
>> +		product_id =3D PRODUCT_ID_627;
>> +		break;
>
>return PRODUCT_ID_627;
>
>> +	case WAVE633_CODE:
>> +	case WAVE637_CODE:
>> +	case WAVE663_CODE:
>> +	case WAVE677_CODE:
>> +		product_id =3D PRODUCT_ID_637;
>> +		break;
>return PRODUCT_ID_637;
>> +	default:
>> +		dev_err(core->dev, "Invalid product (%x)\n", val);
>> +		break;
>> +	}
>> +
>> +	return product_id;
>
>return PRODUCT_ID_NONE; needn't variable product_id

OK.

>
>> +}
>> +
>> +static void wave6_send_command(struct vpu_core_device *core, u32 id, u3=
2
>std, u32 cmd)
>> +{
>> +	u32 reg_val;
>> +
>> +	lockdep_assert_held(&core->hw_lock);
>> +
>> +	if (cmd =3D=3D W6_CMD_CREATE_INSTANCE)
>> +		reg_val =3D INSTANCE_INFO_CODEC_STD(std);
>> +	else
>> +		reg_val =3D INSTANCE_INFO_CODEC_STD(std) | INSTANCE_INFO_ID(id);
>
>	reg_val =3D INSTANCE_INFO_CODEC_STD(std);
>	if (cmd !=3D W6_CMD_CREATE_INSTANCE)
>		reg_val |=3D INSTANCE_INFO_ID(id);

OK.

>
>
>> +	vpu_write_reg(core, W6_CMD_INSTANCE_INFO, reg_val);
>> +
>> +	vpu_write_reg(core, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
>> +	vpu_write_reg(core, W6_COMMAND, cmd);
>> +	vpu_write_reg(core, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
>> +
>> +	trace_wave6_vpu_send_command(core, id, std, cmd);
>> +}
>> +
>> +static int wave6_send_query(struct vpu_core_device *core, u32 id, u32
>std,
>> +			    enum wave6_query_option query_opt)
>> +{
>> +	int ret;
>> +	u32 reg_val;
>> +
>> +	lockdep_assert_held(&core->hw_lock);
>> +
>> +	vpu_write_reg(core, W6_QUERY_OPTION, query_opt);
>> +	wave6_send_command(core, id, std, W6_CMD_QUERY);
>> +
>> +	ret =3D wave6_wait_vpu_busy(core, W6_VPU_BUSY_STATUS);
>> +	if (ret) {
>> +		dev_err(core->dev, "query timed out opt=3D0x%x\n", query_opt);
>> +		return ret;
>> +	}
>> +
>> +	if (!vpu_read_reg(core, W6_RET_SUCCESS)) {
>> +		reg_val =3D vpu_read_reg(core, W6_RET_FAIL_REASON);
>> +		wave6_print_reg_err(core, reg_val);
>
>You can add such debug helper function later to reduce each patch's change=
.

OK. I'll split the debug part to other patch.

>
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}

...

>> +static void wave6_get_dec_seq_result(struct vpu_instance *inst, struct
>dec_seq_info *info)
>> +{
>> +	u32 reg_val;
>> +	u32 profile, profile_comp;
>> +
>> +	lockdep_assert_held(&inst->dev->hw_lock);
>> +
>> +	info->rd_ptr =3D wave6_vpu_dec_get_rd_ptr(inst);
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_SIZE);
>> +	info->pic_width =3D DEC_PIC_SIZE_WIDTH(reg_val);
>> +	info->pic_height =3D DEC_PIC_SIZE_HEIGHT(reg_val);
>> +
>> +	info->min_frame_buffer_count =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_NUM_REQUIRED_FBC_FB);
>> +	info->frame_buf_delay =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_NUM_REORDER_DELAY);
>> +	info->req_mv_buffer_count =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_NUM_REQUIRED_COL_BUF);
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_CROP_TOP_BOTTOM);
>> +	info->pic_crop_rect.top =3D DEC_CROP_TOP(reg_val);
>> +	info->pic_crop_rect.bottom =3D info->pic_height -
>DEC_CROP_BOTTOM(reg_val);
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_CROP_LEFT_RIGHT);
>> +	info->pic_crop_rect.left =3D DEC_CROP_LEFT(reg_val);
>> +	info->pic_crop_rect.right =3D info->pic_width -
>DEC_CROP_RIGHT(reg_val);
>> +
>> +	info->f_rate_numerator =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_FRAME_RATE_NR);
>> +	info->f_rate_denominator =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_FRAME_RATE_DR);
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_COLOR_SAMPLE);
>> +	info->luma_bit_depth =3D DEC_COLOR_SAMPLE_L_BIT_DEPTH(reg_val);
>> +	info->chroma_bit_depth =3D DEC_COLOR_SAMPLE_C_BIT_DEPTH(reg_val);
>> +	info->c_fmt_idc =3D DEC_COLOR_SAMPLE_C_FMT_IDC(reg_val);
>> +	info->aspect_rate_info =3D DEC_COLOR_SAMPLE_ASPECT_RATIO_IDC(reg_val);
>> +	info->is_ext_sar =3D info->aspect_rate_info =3D=3D
>H264_VUI_SAR_IDC_EXTENDED;
>> +	if (info->is_ext_sar)
>> +		info->aspect_rate_info =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_ASPECT_RATIO);
>> +	info->bitrate =3D vpu_read_reg(inst->dev, W6_RET_DEC_BIT_RATE);
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_SEQ_PARAM);
>> +	info->level =3D DEC_SEQ_PARAM_LEVEL(reg_val);
>> +	info->tier =3D DEC_SEQ_PARAM_TIER(reg_val);
>> +
>> +	profile =3D DEC_SEQ_PARAM_PROFILE(reg_val);
>> +	profile_comp =3D DEC_SEQ_PARAM_PROFILE_COMPATIBILITY(reg_val);
>> +	if (inst->std =3D=3D W_HEVC_DEC) {
>> +		info->profile =3D profile;
>> +		if (!info->profile) {
>> +			if ((profile_comp & PROFILE_COMPATIBILITY_MAIN) &&
>> +			    (profile_comp & PROFILE_COMPATIBILITY_MAIN10))
>> +				info->profile =3D HEVC_PROFILE_MAIN;
>> +			else if (profile_comp & PROFILE_COMPATIBILITY_MAIN10)
>> +				info->profile =3D HEVC_PROFILE_MAIN10;
>> +			else if (profile_comp &
>PROFILE_COMPATIBILITY_STILL_PICTURE)
>> +				info->profile =3D HEVC_PROFILE_STILLPICTURE;
>> +			else
>> +				info->profile =3D HEVC_PROFILE_MAIN;
>> +		}
>> +	} else if (inst->std =3D=3D W_AVC_DEC) {
>> +		if (profile =3D=3D PROFILE_H264_BP)
>> +			info->profile =3D H264_PROFILE_BP;
>> +		else if (profile =3D=3D PROFILE_H264_HP)
>> +			info->profile =3D H264_PROFILE_HP;
>> +		else if (profile =3D=3D PROFILE_H264_MP)
>> +			info->profile =3D H264_PROFILE_MP;
>> +		else if (profile =3D=3D PROFILE_H264_HIGH10)
>> +			info->profile =3D H264_PROFILE_HIGH10;
>> +		else if (profile =3D=3D PROFILE_H264_EXTENDED)
>> +			info->profile =3D H264_PROFILE_EXTENDED;
>> +		else
>> +			info->profile =3D H264_PROFILE_BP;
>
>use small helper function for such convertion, you can use switch case for
>this maping or static const array.

OK. I'll address this in v8.

>
>> +	}
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_COLOR_CONFIG);
>> +	if (reg_val) {
>> +		info->color.video_signal_type_present =3D true;
>> +		info->color.color_description_present =3D
>DEC_COLOR_CONFIG_COLOR_PRESENT(reg_val);
>> +		info->color.color_primaries =3D
>DEC_COLOR_CONFIG_COLOR_PRIMARIES(reg_val);
>> +		info->color.transfer_characteristics =3D
>DEC_COLOR_CONFIG_TRANS_CHAR(reg_val);
>> +		info->color.matrix_coefficients =3D
>DEC_COLOR_CONFIG_MATRIX_COEFF(reg_val);
>> +		info->color.color_range =3D
>DEC_COLOR_CONFIG_COLOR_RANGE(reg_val);
>> +	} else {
>> +		info->color.video_signal_type_present =3D false;
>> +	}
>> +}
>> +
>> +int wave6_vpu_dec_get_seq_info(struct vpu_instance *inst, struct
>dec_seq_info *info)
>> +{
>> +	int ret;
>> +
>> +	lockdep_assert_held(&inst->dev->hw_lock);
>> +
>> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std,
>W6_QUERY_OPT_GET_RESULT);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (vpu_read_reg(inst->dev, W6_RET_DEC_DECODING_SUCCESS) !=3D 1) {
>> +		info->err_reason =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_ERR_INFO);
>> +		ret =3D -EIO;
>> +	} else {
>> +		info->warn_info =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_WARN_INFO);
>> +	}
>> +
>> +	wave6_get_dec_seq_result(inst, info);
>> +
>> +	return ret;
>> +}
>> +
>> +int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst)
>> +{
>> +	struct dec_info *p_dec_info;
>> +	struct frame_buffer *fb_arr;
>> +	size_t fbc_remain, mv_remain, fbc_idx =3D 0, mv_idx =3D 0;
>> +	size_t i, k, group_num, fbc_count, mv_count;
>> +	dma_addr_t fbc_cr_tbl_addr;
>> +	u32 reg_val;
>> +	int ret;
>> +
>> +	guard(mutex)(&inst->dev->hw_lock);
>> +
>> +	p_dec_info =3D &inst->codec_info->dec_info;
>> +
>> +	fb_arr =3D &inst->frame_buf[0];
>> +	fbc_count =3D p_dec_info->seq_info.min_frame_buffer_count;
>> +	mv_count =3D p_dec_info->seq_info.req_mv_buffer_count;
>> +
>> +	for (i =3D 0; i < fbc_count; i++) {
>> +		if (!inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i].daddr)
>> +			return -EINVAL;
>> +		if (!inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i].daddr)
>> +			return -EINVAL;
>> +	}
>> +	for (i =3D 0; i < mv_count; i++) {
>> +		if (!inst->aux_vbuf[AUX_BUF_MV_COL][i].daddr)
>> +			return -EINVAL;
>> +	}
>
>use small helper function, like check_aux_vbuf().

OK.

>
>> +
>> +	reg_val =3D SET_FB_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
>> +		  SET_FB_PIC_SIZE_HEIGHT(p_dec_info->seq_info.pic_height);
>> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_PIC_SIZE, reg_val);
>> +	reg_val =3D SET_FB_PIC_INFO_C_FMT_IDC(p_dec_info->seq_info.c_fmt_idc)
>|
>> +		  SET_FB_PIC_INFO_L_BIT_DEPTH(p_dec_info-
>>seq_info.luma_bit_depth) |
>> +		  SET_FB_PIC_INFO_C_BIT_DEPTH(p_dec_info-
>>seq_info.chroma_bit_depth);
>> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_PIC_INFO, reg_val);
>> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_DEFAULT_CDF, 0);
>> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_SEGMAP, 0);
>> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_MV_COL_PRE_ENT, 0);
>> +
>> +	fbc_remain =3D fbc_count;
>> +	mv_remain =3D mv_count;
>> +	group_num =3D DIV_ROUND_UP(max(fbc_count, mv_count), 16);
>
>Add empty line here.

OK.

>
>> +	for (i =3D 0; i < group_num; i++) {
>> +		bool first_group =3D i =3D=3D 0;
>> +		bool last_group =3D i =3D=3D group_num - 1;
>> +		u32 set_fbc_num =3D (fbc_remain >=3D 16) ? 16 : fbc_remain;
>> +		u32 set_mv_num =3D (mv_remain >=3D 16) ? 16 : mv_remain;
>> +		u32 fbc_start_no =3D i * 16;
>> +		u32 fbc_end_no =3D fbc_start_no + set_fbc_num - 1;
>> +		u32 mv_start_no =3D i * 16;
>> +		u32 mv_end_no =3D mv_start_no + set_mv_num - 1;
>> +
>> +		reg_val =3D SET_FB_OPTION_ENDIAN(VDI_128BIT_BIG_ENDIAN);
>> +		if (first_group)
>> +			reg_val |=3D SET_FB_OPTION_START;
>> +		if (last_group)
>> +			reg_val |=3D SET_FB_OPTION_END;
>> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_OPTION, reg_val);
>> +
>> +		reg_val =3D SET_FB_NUM_FBC_START_IDX(fbc_start_no) |
>> +			  SET_FB_NUM_FBC_END_IDX(fbc_end_no) |
>> +			  SET_FB_NUM_MV_COL_START_IDX(mv_start_no) |
>> +			  SET_FB_NUM_MV_COL_END_IDX(mv_end_no);
>> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_NUM, reg_val);
>> +
>> +		for (k =3D 0; k < set_fbc_num; k++) {
>> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y(k),
>> +				      fb_arr[fbc_idx].buf_y);
>> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C(k),
>> +				      fb_arr[fbc_idx].buf_cb);
>> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR(k),
>> +				      fb_arr[fbc_idx].buf_cr);
>> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y_OFFSET(k),
>> +				      inst-
>>aux_vbuf[AUX_BUF_FBC_Y_TBL][fbc_idx].daddr);
>> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C_OFFSET(k),
>> +				      inst-
>>aux_vbuf[AUX_BUF_FBC_C_TBL][fbc_idx].daddr);
>> +			fbc_cr_tbl_addr =3D inst-
>>aux_vbuf[AUX_BUF_FBC_C_TBL][fbc_idx].daddr +
>> +					  (inst-
>>aux_vbuf[AUX_BUF_FBC_C_TBL][fbc_idx].size >> 1);
>> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR_OFFSET(k),
>> +				      fbc_cr_tbl_addr);
>
>I am not sure how big set_fbc_num, I suggest change to use writel_relax().
>
>because you wave6_wait_vpu_busy() to check status, extra memory barry in
>writel() is not neccessary.

OK, as I answered on your earlier mail. The barriered writel() stays in
wave6_send_command().

>
>> +			fbc_idx++;
>> +		}
>> +		fbc_remain -=3D k;
>> +
>> +		for (k =3D 0; k < set_mv_num; k++) {
>> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_MV_COL(k),
>> +				      inst-
>>aux_vbuf[AUX_BUF_MV_COL][mv_idx].daddr);
>> +			mv_idx++;
>> +		}
>> +		mv_remain -=3D k;
>> +
>> +		wave6_send_command(inst->dev, inst->id, inst->std,
>W6_CMD_SET_FB);
>> +		ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
>> +		if (ret) {
>> +			dev_err(inst->dev->dev, "%s: timeout\n", __func__);
>> +			return ret;
>> +		}
>> +
>> +		if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS))
>> +			return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst,
>struct frame_buffer fb)
>> +{
>> +	int ret;
>> +	struct dec_info *p_dec_info;
>> +	u32 reg_val;
>> +	u32 c_fmt_idc, out_fmt, out_mode;
>> +
>> +	guard(mutex)(&inst->dev->hw_lock);
>> +
>> +	p_dec_info =3D &inst->codec_info->dec_info;
>> +
>> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PARAM,
>> +		      inst->scaler_info.enable);
>> +	reg_val =3D SET_DISP_SCL_PIC_SIZE_WIDTH(inst->scaler_info.width) |
>> +		  SET_DISP_SCL_PIC_SIZE_HEIGHT(inst->scaler_info.height);
>> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PIC_SIZE, reg_val);
>> +	reg_val =3D SET_DISP_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
>> +		  SET_DISP_PIC_SIZE_HEIGHT(p_dec_info->seq_info.pic_height);
>> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_PIC_SIZE, reg_val);
>> +
>> +	c_fmt_idc =3D get_chroma_format_idc(p_dec_info->wtl_format);
>> +	switch (p_dec_info->wtl_format) {
>> +	case FORMAT_420_P10_16BIT_MSB:
>> +	case FORMAT_422_P10_16BIT_MSB:
>> +	case FORMAT_444_P10_16BIT_MSB:
>> +	case FORMAT_400_P10_16BIT_MSB:
>> +		out_mode =3D (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_16BIT;
>> +		break;
>> +	case FORMAT_420_P10_16BIT_LSB:
>> +	case FORMAT_422_P10_16BIT_LSB:
>> +	case FORMAT_444_P10_16BIT_LSB:
>> +	case FORMAT_400_P10_16BIT_LSB:
>> +		out_mode =3D (WTL_LEFT_JUSTIFIED << 2) | WTL_PIXEL_16BIT;
>> +		break;
>> +	case FORMAT_420_P10_32BIT_MSB:
>> +	case FORMAT_422_P10_32BIT_MSB:
>> +	case FORMAT_444_P10_32BIT_MSB:
>> +	case FORMAT_400_P10_32BIT_MSB:
>> +		out_mode =3D (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_32BIT;
>> +		break;
>> +	case FORMAT_420_P10_32BIT_LSB:
>> +	case FORMAT_422_P10_32BIT_LSB:
>> +	case FORMAT_444_P10_32BIT_LSB:
>> +	case FORMAT_400_P10_32BIT_LSB:
>> +		out_mode =3D (WTL_LEFT_JUSTIFIED << 2) | WTL_PIXEL_32BIT;
>> +		break;
>> +	default:
>> +		out_mode =3D (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_8BIT;
>> +		break;
>> +	}
>
>move such long convert to small helper function

OK.

>
>> +	out_fmt =3D (inst->nv21 << 1) | inst->cbcr_interleave;
>> +
>> +	reg_val =3D SET_DISP_COMMON_PIC_INFO_BWB_ON |
>> +		  SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(c_fmt_idc) |
>> +		  SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(PIXEL_ORDER_INCREASING)
>|
>> +		  SET_DISP_COMMON_PIC_INFO_OUT_MODE(out_mode) |
>> +		  SET_DISP_COMMON_PIC_INFO_OUT_FMT(out_fmt) |
>> +		  SET_DISP_COMMON_PIC_INFO_STRIDE(fb.stride);
>> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_COMMON_PIC_INFO,
>reg_val);
>> +	reg_val =3D SET_DISP_OPTION_ENDIAN(VDI_128BIT_BIG_ENDIAN);
>> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_OPTION, reg_val);
>> +	reg_val =3D SET_DISP_PIC_INFO_L_BIT_DEPTH(fb.luma_bit_depth) |
>> +		  SET_DISP_PIC_INFO_C_BIT_DEPTH(fb.chroma_bit_depth) |
>> +		  SET_DISP_PIC_INFO_C_FMT_IDC(fb.c_fmt_idc);
>> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_PIC_INFO, reg_val);
>> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_Y_BASE, fb.buf_y);
>> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_CB_BASE, fb.buf_cb);
>> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_CR_BASE, fb.buf_cr);
>> +
>> +	wave6_send_command(inst->dev, inst->id, inst->std,
>W6_CMD_DEC_SET_DISP);
>> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
>> +	if (ret) {
>> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
>> +		return ret;
>> +	}
>> +
>> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS))
>> +		return -EIO;
>> +
>> +	wave6_dec_set_display_buffer(inst, fb);
>> +
>> +	return 0;
>> +}

...

>> +static int wave6_set_enc_crop_info(u32 codec, struct enc_codec_param
>*param,
>> +				   u32 rot_mir, int width, int height)
>> +{
>> +	int aligned_width =3D (codec =3D=3D W_HEVC_ENC) ? ALIGN(width, 32) :
>ALIGN(width, 16);
>> +	int aligned_height =3D (codec =3D=3D W_HEVC_ENC) ? ALIGN(height, 32) :
>ALIGN(height, 16);
>> +	int pad_right, pad_bot;
>> +	int crop_right, crop_left, crop_top, crop_bot;
>> +
>> +	if (codec =3D=3D W_HEVC_ENC &&
>> +	    (!rot_mir ||
>> +	     rot_mir =3D=3D (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_MIRV |
>SET_PARAM_ROT_180)))
>> +		return 0;
>> +
>> +	pad_right =3D aligned_width - width;
>> +	pad_bot =3D aligned_height - height;
>> +
>> +	if (param->conf_win.right > 0)
>> +		crop_right =3D param->conf_win.right + pad_right;
>> +	else
>> +		crop_right =3D pad_right;
>> +
>> +	if (param->conf_win.bottom > 0)
>> +		crop_bot =3D param->conf_win.bottom + pad_bot;
>> +	else
>> +		crop_bot =3D pad_bot;
>> +
>> +	crop_top =3D param->conf_win.top;
>> +	crop_left =3D param->conf_win.left;
>> +
>> +	param->conf_win.top =3D crop_top;
>> +	param->conf_win.left =3D crop_left;
>> +	param->conf_win.bottom =3D crop_bot;
>> +	param->conf_win.right =3D crop_right;
>> +
>> +	if (rot_mir =3D=3D SET_PARAM_ROT_90 ||
>> +	    rot_mir =3D=3D (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_MIRV |
>SET_PARAM_ROT_270)) {
>> +		param->conf_win.top =3D crop_right;
>> +		param->conf_win.left =3D crop_top;
>> +		param->conf_win.bottom =3D crop_left;
>> +		param->conf_win.right =3D crop_bot;
>> +	} else if (rot_mir =3D=3D SET_PARAM_ROT_180 ||
>> +		   rot_mir =3D=3D (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_MIRV)) {
>> +		param->conf_win.top =3D crop_bot;
>> +		param->conf_win.left =3D crop_right;
>> +		param->conf_win.bottom =3D crop_top;
>> +		param->conf_win.right =3D crop_left;
>> +	} else if (rot_mir =3D=3D SET_PARAM_ROT_270 ||
>> +		   rot_mir =3D=3D (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_MIRV |
>SET_PARAM_ROT_90)) {
>> +		param->conf_win.top =3D crop_left;
>> +		param->conf_win.left =3D crop_bot;
>> +		param->conf_win.bottom =3D crop_right;
>> +		param->conf_win.right =3D crop_top;
>> +	} else if (rot_mir =3D=3D SET_PARAM_ROT_MIRV ||
>> +		   rot_mir =3D=3D (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_180)) {
>> +		param->conf_win.top =3D crop_bot;
>> +		param->conf_win.bottom =3D crop_top;
>
>put bottom/right here to make code consistent.

OK. I'll fix it.

>
>> +	} else if (rot_mir =3D=3D SET_PARAM_ROT_MIRH ||
>> +		   rot_mir =3D=3D (SET_PARAM_ROT_MIRV | SET_PARAM_ROT_180)) {
>> +		param->conf_win.left =3D crop_right;
>> +		param->conf_win.right =3D crop_left;
>> +	} else if (rot_mir =3D=3D (SET_PARAM_ROT_MIRV | SET_PARAM_ROT_90) ||
>> +		   rot_mir =3D=3D (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_270)) {
>> +		param->conf_win.top =3D crop_left;
>> +		param->conf_win.left =3D crop_top;
>> +		param->conf_win.bottom =3D crop_right;
>> +		param->conf_win.right =3D crop_bot;
>> +	} else if (rot_mir =3D=3D (SET_PARAM_ROT_MIRV | SET_PARAM_ROT_270) ||
>> +		   rot_mir =3D=3D (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_90)) {
>> +		param->conf_win.top =3D crop_right;
>> +		param->conf_win.left =3D crop_bot;
>> +		param->conf_win.bottom =3D crop_left;
>> +		param->conf_win.right =3D crop_top;
>> +	}
>
>	else {
>		param->conf_win.top =3D crop_top;
>		param->conf_win.left =3D crop_left;
>		param->conf_win.bottom =3D crop_bot;
>		param->conf_win.right =3D crop_right;
>	}
>
>Avoid overwrite it again at if-else branch.

OK. I'll fix it.

>
>> +
>> +	return 0;
>> +}
>> +
>> +static void wave6_update_enc_info(struct enc_info *p_enc_info)
>> +{
>> +	struct enc_open_param op =3D p_enc_info->open_param;
>> +
>> +	p_enc_info->width =3D op.pic_width;
>> +	p_enc_info->height =3D op.pic_height;
>> +	p_enc_info->c_fmt_idc =3D get_chroma_format_idc(op.output_format);
>> +}
>> +
>> +static void wave6_gen_set_param_reg_common(struct enc_info *p_enc_info,
>enum codec_std std,
>> +					   struct enc_cmd_set_param_reg *reg)
>> +{
>> +	struct enc_open_param *p_open_param =3D &p_enc_info->open_param;
>> +	struct enc_codec_param *p_param =3D &p_open_param->codec_param;
>> +	unsigned int i;
>> +	u32 rot_mir =3D 0;
>> +
>> +	switch (p_enc_info->rot_angle) {
>> +	case ROT_0:
>> +		break;
>> +	case ROT_90:
>> +		rot_mir |=3D SET_PARAM_ROT_90;
>> +		break;
>> +	case ROT_180:
>> +		rot_mir |=3D SET_PARAM_ROT_180;
>> +		break;
>> +	case ROT_270:
>> +		rot_mir |=3D SET_PARAM_ROT_270;
>> +		break;
>> +	}
>> +
>> +	switch (p_enc_info->mir_dir) {
>> +	case MIR_NONE:
>> +		break;
>> +	case MIR_VER:
>> +		rot_mir |=3D SET_PARAM_ROT_MIRV;
>> +		break;
>> +	case MIR_HOR:
>> +		rot_mir |=3D SET_PARAM_ROT_MIRH;
>> +		break;
>> +	case MIR_HOR_VER:
>> +		rot_mir |=3D SET_PARAM_ROT_MIRH | SET_PARAM_ROT_MIRV;
>> +		break;
>> +	}
>
>use small convert helper to make this function shorter

OK. I'll address this in v8.

...

>> +static void wave6_gen_enc_pic_reg(struct enc_info *p_enc_info, bool
>cbcr_interleave, bool nv21,
>> +				  struct enc_param *opt, struct
>enc_cmd_enc_pic_reg *reg)
>> +{
>> +	struct enc_open_param open =3D p_enc_info->open_param;
>> +	struct enc_codec_param param =3D open.codec_param;
>> +	bool is_lsb =3D false;
>> +	bool is_10bit =3D false;
>> +	bool is_3p4b =3D false;
>> +	bool is_cr_first =3D nv21;
>> +	u32 c_fmt_idc =3D get_chroma_format_idc(open.src_format);
>> +	u32 stride_c =3D opt->source_frame->stride_c;
>> +	bool is_ayuv =3D false;
>> +	bool is_csc_format =3D false;
>> +	bool is_24bit =3D false;
>> +	bool is_packed =3D false;
>> +	bool is_packed_uv_first =3D false;
>> +
>> +	if ((c_fmt_idc =3D=3D C_FMT_IDC_YUV422 || c_fmt_idc =3D=3D C_FMT_IDC_Y=
UV444)
>&&
>> +	    p_enc_info->c_fmt_idc =3D=3D C_FMT_IDC_YUV420)
>> +		stride_c *=3D 2;
>> +
>> +	switch (open.src_format) {
>> +	case FORMAT_420:
>> +	case FORMAT_422:
>> +	case FORMAT_444:
>> +	case FORMAT_400:
>> +	case FORMAT_YUYV:
>> +	case FORMAT_YVYU:
>> +	case FORMAT_UYVY:
>> +	case FORMAT_VYUY:
>> +		is_lsb =3D false;
>> +		is_3p4b =3D false;
>> +		break;
>> +	case FORMAT_420_P10_16BIT_MSB:
>> +	case FORMAT_422_P10_16BIT_MSB:
>> +	case FORMAT_444_P10_16BIT_MSB:
>> +	case FORMAT_400_P10_16BIT_MSB:
>> +	case FORMAT_YUYV_P10_16BIT_MSB:
>> +	case FORMAT_YVYU_P10_16BIT_MSB:
>> +	case FORMAT_UYVY_P10_16BIT_MSB:
>> +	case FORMAT_VYUY_P10_16BIT_MSB:
>> +		is_lsb =3D false;
>> +		is_10bit =3D true;
>> +		is_3p4b =3D false;
>> +		break;
>> +	case FORMAT_420_P10_16BIT_LSB:
>> +	case FORMAT_422_P10_16BIT_LSB:
>> +	case FORMAT_444_P10_16BIT_LSB:
>> +	case FORMAT_400_P10_16BIT_LSB:
>> +	case FORMAT_YUYV_P10_16BIT_LSB:
>> +	case FORMAT_YVYU_P10_16BIT_LSB:
>> +	case FORMAT_UYVY_P10_16BIT_LSB:
>> +	case FORMAT_VYUY_P10_16BIT_LSB:
>> +		is_lsb =3D true;
>> +		is_10bit =3D true;
>> +		is_3p4b =3D false;
>> +		break;
>> +	case FORMAT_420_P10_32BIT_MSB:
>> +	case FORMAT_422_P10_32BIT_MSB:
>> +	case FORMAT_444_P10_32BIT_MSB:
>> +	case FORMAT_400_P10_32BIT_MSB:
>> +	case FORMAT_YUYV_P10_32BIT_MSB:
>> +	case FORMAT_YVYU_P10_32BIT_MSB:
>> +	case FORMAT_UYVY_P10_32BIT_MSB:
>> +	case FORMAT_VYUY_P10_32BIT_MSB:
>> +		is_lsb =3D false;
>> +		is_10bit =3D true;
>> +		is_3p4b =3D true;
>> +		break;
>> +	case FORMAT_420_P10_32BIT_LSB:
>> +	case FORMAT_422_P10_32BIT_LSB:
>> +	case FORMAT_444_P10_32BIT_LSB:
>> +	case FORMAT_400_P10_32BIT_LSB:
>> +	case FORMAT_YUYV_P10_32BIT_LSB:
>> +	case FORMAT_YVYU_P10_32BIT_LSB:
>> +	case FORMAT_UYVY_P10_32BIT_LSB:
>> +	case FORMAT_VYUY_P10_32BIT_LSB:
>> +		is_lsb =3D true;
>> +		is_10bit =3D true;
>> +		is_3p4b =3D true;
>> +		break;
>> +	case FORMAT_RGB_32BIT_PACKED:
>> +		is_ayuv =3D false;
>> +		is_csc_format =3D true;
>> +		break;
>> +	case FORMAT_RGB_P10_32BIT_PACKED:
>> +		is_ayuv =3D false;
>> +		is_csc_format =3D true;
>> +		is_10bit =3D true;
>> +		break;
>> +	case FORMAT_YUV444_32BIT_PACKED:
>> +		is_ayuv =3D true;
>> +		is_csc_format =3D true;
>> +		break;
>> +	case FORMAT_YUV444_P10_32BIT_PACKED:
>> +		is_ayuv =3D true;
>> +		is_csc_format =3D true;
>> +		is_10bit =3D true;
>> +		break;
>> +	case FORMAT_RGB_24BIT_PACKED:
>> +		is_ayuv =3D false;
>> +		is_csc_format =3D true;
>> +		is_24bit =3D true;
>> +		break;
>> +	case FORMAT_YUV444_24BIT_PACKED:
>> +		is_ayuv =3D true;
>> +		is_csc_format =3D true;
>> +		is_24bit =3D true;
>> +		break;
>> +	case FORMAT_YUV444_24BIT:
>> +		is_ayuv =3D true;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>
>move to small helper to this kinds of convert functions

OK. I'll address this in v8.

...

>> +static inline void wave6_vdi_writel(void __iomem *base, u32 addr, u32
>data)
>> +{
>> +	writel(data, base + addr);
>
>consider big amount reg read write, suggest use writel_relaxed() and
>readl_relaxed()

Same as above - I'll add a relaxed variant rather than change
wave6_vdi_writel() itself, so the HOST_INT_REQ and the firmware start
keep the barrier.

>
>> +}
>> +
>> +static inline unsigned int wave6_vdi_readl(void __iomem *base, u32 addr=
)
>> +{
>> +	return readl(base + addr);
>> +}

...

>> +struct dec_open_param {
>> +	enum display_mode disp_mode;
>> +	u32 ext_addr_vcpu: 8;
>> +	bool is_secure_inst;
>
>you use bit field:
>here
>	is_secure_inst: 1

OK. enc_open_param has the same pattern, I'll change both.

>
>> +	u32 inst_priority: 5;
>> +	struct instance_buffer inst_buffer;
>> +};

...

>> +struct vpu_performance_info {
>> +	ktime_t ts_start;
>> +	ktime_t ts_first;
>> +	ktime_t ts_last;
>> +	s64 latency_first;
>> +	s64 latency_max;
>> +	s64 min_process_time;
>> +	s64 max_process_time;
>> +	u64 total_sw_time;
>> +	u64 total_hw_time;
>> +};
>
>You can add performance_info later, like trace and dbg.

OK. I'll address this in v8.

Thanks.
Nas.

