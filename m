Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020083.outbound.protection.outlook.com [52.101.156.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14F255E43;
	Fri, 11 Sep 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115754; cv=fail; b=qdD12O/7gxhFGYNIFm36ruV3SVAm5ayQXup+8+DznZdf0WKfKs8zKk4Pzu8jais+s35HcL0MRBljfTi7U20wLmTF4KvUKqgCNUDbisPtjiVbek2b5ffeYoAh6kh54iFdNqySvcC/wgeYKKJ56ToW4X4m+oQ+e2bUO/AoD0w7kXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115754; c=relaxed/simple;
	bh=jichWoj+RqRDzInSqUp0m5P77a0l3jLXnsdfCy09P9E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GSetNEMkwor6IzvEyYib7uG2WcmLEHRfYPHO81JipzK5Thd1Iba/IUjT6AT0ZAetP2eeK9urFdFQ/TMo0JrgnF9Dw+0ntMKV6+g/bF1rhpepV7lvFHvj201w+Nm2PoBrIDfJl5Ec1qNM+gIU6Opekuvsj7I5uxdC+JH/Ija1K40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=UyNJ0FjT; arc=fail smtp.client-ip=52.101.156.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="UyNJ0FjT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cr6vA08CM4t+xTJ5H568ckhfSka0Mcqwu/hb4oDUXRvh77dUl+v2vC1lscEejJPym2OdlgRqIFlFo9uTBq6PB53e02T8p5jNIcS6qDIcWaF+RBIakQA2F+RMyPgJkactCa1vVCcB/oiAkCbg8TtIAPQgLjrr3TY+QYpdWEGM08Dh9BNtP8VnB9ZIw7Tofbydeu6YLkTmrmWrWWy5VbC6eFPJT3p1DAo7nrdecWmMl3i7900YlWGyag+EVsYHcVAfgo2/AfJ39It6bOWAx7JwtHX0cbn2Plo0aKpOpE0uUAqpx/c3LO1MS5VkYW6Mvt8QQu8WtXH7aeGRFnJvx684DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmM/9KeHShqObjlEyB/51c475+G9ku/1YQDcHt6pJmE=;
 b=neNTrWKhQp+FJFBmLs8IVBDSn12PxOZTTDLcAECS69K3WMNENcWDncQWnT0pF4pvlBMJe5bLy8AHtWXc67S3l18ulU4lbWzpMBIkwFdrrBalPYVtJSA2+6SIhp80g+YVvG1jyQvX9RU87QsXGdFIQbaTmyL6t0wdsSbgmOFL6RByMcjLS9UOhrmhxYGExS0sZ/dzI/OvMX4n93HvJNP+wpAU7cjsRANDR4GgpKeZ9QSblopitOZQyxtfuJeZMzYtHxQ/xcenAg+J+V0YV/Ix1cT6GTNl4/7tycNMyFARFuTpMEdRXqMzn5bEGEcpDnXysq0In1rRN9z+Zrl3XkzA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmM/9KeHShqObjlEyB/51c475+G9ku/1YQDcHt6pJmE=;
 b=UyNJ0FjTq84tJ7oB/HzaGQoHdLu8+PQeYR2OitiytequXaV3N09hPukCGoV1F8TSXQ7f9WRXgkcaH+JMPw6w8+OciM83pWRViHgldzXsAKkftN/jaHvZVDhCfhxy5ORqTh3tmx59xJ87xL63cEveIGGIoX62XMH56PvQav0ZIj9AW6qKsKJe7EvBt60/AMXo0xCKKA+/tNjtvrVvAt1iBBkaKFB91zmltrrXsmNzoJAcsMmKQsoyiqN7AHBmHecWYFhnpdWE6WBoZ8c+PSj5qb/XPKlOxoO5vRdmiPQkil2QXEMlHQQ4nBfEkB07EuUWS1I2lctWxsWNUB2trnhJJQ==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PUVP216MB481266.KORP216.PROD.OUTLOOK.COM (2603:1096:301:170::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 08:35:46 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:35:46 +0000
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
Subject: RE: [PATCH v7 5/9] media: chips-media: wave6: Add Wave6 core driver
Thread-Topic: [PATCH v7 5/9] media: chips-media: wave6: Add Wave6 core driver
Thread-Index: AQHdPDksqJyR7EplN0y4kvt0BlfCQbbIUycAgACumrA=
Date: Fri, 11 Sep 2026 08:35:46 +0000
Message-ID:
 <SL2P216MB2441946218CB8AEB1D07DEB2FBBE2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <e8323267420b8e8d29e71c7ea018759cb7298c8d.1788496816.git.nas.chung@chipsnmedia.com>
 <aqMXumGHR9JjvVrf@lizhi-Precision-Tower-5810>
In-Reply-To: <aqMXumGHR9JjvVrf@lizhi-Precision-Tower-5810>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PUVP216MB481266:EE_
x-ms-office365-filtering-correlation-id: 7d013487-136a-4b72-4c78-08df0fdfacc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|56012099006|38070700021|4143699003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 3dL21L9/vD7LTfvUIafDMWt61eGyDH3vBDdWgJU3f+2CeSzTri/kI6Rosb/KxbgPhOBlDKX6DXKq5hQvESg112sjlu4l4vjRL/2Az0iFpunioaUzvioZlhAvuRZrMXc91eA4vSs70kFctWXaoaF7iXSOoVGKTQbaya3w9rm2xDtSsfzxuut36OlGU2KAGDULie6Y7WILx+D/6SFIKnbAjmGnqEdCKfvu603mQVz5QiN/x5Rp+vFUq4o9HVM6TD5VSFnb1lWNsWB3biOAOFEcZWEqYbo3tqoAW5IUBeqZOivzpIhli6wSdklp5fWySslaMHh9J7XyBDxU2QIO9cyRYe1V+Jt1nFF4d+bPeYqN80ezuSVa0hvmyWbMpBUXLlDGetaUQoCVv4MirRx7Rbp2ssusB7VBAqEDkjLwc/suYG7huGzfsNz0XeW2uxP0swJrBirHE+/gP3SnaY4OY3ttXnXccjTBofqNKe+yOR5shVd/6EtXmMj684I16gU7ZTe9APF4bK5GJRvLRSvBGyKz2U+UseLrDmhp+gbJj0n5+I50N6kstt1BAL+e/KPsndj75lLjsU+TgAGUcOVAb5j6hWLNxEAUeDOtaD7MAejgFlohqwDn6yCXBmOAlCZSBai2R2IwKO1xcDuxBUvK0Var1tAPSuNV+O6gFFIGPfn67ruP9MKwpS7vMSx+CnV/AD9uYRzA2/NKQVIfRUQ+TAODeBACbH90Rl6qux1I8caF70Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(38070700021)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OGPB5C/v4iDu36ZzYprch3PHMzCaTjE9tZRB6nwlk1eh6ZJe3t37yg28F7x8?=
 =?us-ascii?Q?LRlxFyd05avRq2tvlQpNddWcOT2YN+y3/KcPvrNdDZVlfowad4+9eyPD45/9?=
 =?us-ascii?Q?bSMmfdlMy5AFUuw4Vk16q1Pn2Cz31lWg4ujIrQlff88JPUteqp7/DOMtcQAd?=
 =?us-ascii?Q?q5bQqiU3nMGqf6Pmx3P5sI2rQA6KMnd1t+wkXt4IBHtO5zBOtiREskg55+PQ?=
 =?us-ascii?Q?xd9AhegKEHCtH3TSrygl5wI3jsis7ujn4V8soqyxeNF9D/2ZiXqZ2Lv8m9kg?=
 =?us-ascii?Q?2XmGkRtJ0b27wvpXm3MRGdg1VAg4tJpI6/6tArH/xog2G2LLvKzsHR5rHyD8?=
 =?us-ascii?Q?ZbCBx13Ifnhs3uDmCyzle2piSC+Lfi+0HikY2lWq4bj6sAig6eT7zg+v9vbc?=
 =?us-ascii?Q?MtO3btcwq2YRIOw3bYGZIQraonmgrZWJRh40EgXjm95N7jIlu+4OJjIhpdp/?=
 =?us-ascii?Q?bdvTOA4/JALtIXilONu541R+ihuuqDO/hNZ2KseXiUuC0YcgvvaAbGRYNzJG?=
 =?us-ascii?Q?IEOdc02lAGSgHv/QqXSAwdjPmmBG1SEDJdpDrK+nc8SU7j8vsSNfdjq5VBFr?=
 =?us-ascii?Q?6IDFsPUspC7TFgvLfnLZ8JXHPv1AslJ/6tVAhqatwY0JUZudE+0/P1462RsW?=
 =?us-ascii?Q?j25UhVTzGfzAOOOlgmHFMsIJ782fQo55zzq5OOHkXVSgdsSZ7rmeazTNQpIJ?=
 =?us-ascii?Q?vNHWl5AI3E9TFUgI8eFTrFptZTasSbfUNyLmCuqkpXt/JZs8g2VwYAzmfSTZ?=
 =?us-ascii?Q?LM+LVtKgeaGC7IECHn8QvWyqhQ2OJ59rOYu1pWVGOUY8Gz3DEaXqY9fOeCfr?=
 =?us-ascii?Q?0QBRw0s88YBSMGb5aFdZXmQSeBDxpVCGeCWOU5kUygs4zExQUwH8XohKaAt2?=
 =?us-ascii?Q?Q6N2gb1W5I3GbfoQrtV3JizmeV0U+WG8179zteCvBP2bN+ZCew+SORV4gJFw?=
 =?us-ascii?Q?UDu0KwZ+QPO7hemvuNBKIJ1nyhqZoqpCXP5DQc7D+sB/TrKt35d4Y0OVKmrC?=
 =?us-ascii?Q?0i4Ldwuj0X8Hl6n7S99+d5a5JTi3klfKP1PF1927nZC6J4mwONAyJ//0n4LR?=
 =?us-ascii?Q?6hQFfleX86t4hGd3z3KNNb9Di6ASmEm6KHP+GBWnfuZ5rVQHxJDT4Nq1C5sn?=
 =?us-ascii?Q?frZuE1pVVEO94CSpWJBTX69aeziFbaWd3qrSsbej6DI8Io0aWZBUR3cx61vA?=
 =?us-ascii?Q?ewz0EIImMCcGKE/4VfcQWXjU4w9uOIlP4zrbP1+xvynYnwnQ9adeGVVhr16W?=
 =?us-ascii?Q?LS+w+XA/xZJeCEMgs0K0cQc5mjJB6saBIcwzR3rHaQokbsXigA1lbfchXIeO?=
 =?us-ascii?Q?MqadOmFPy7v/dv22I7SYT23c86fepnB+EcN5dbPuuHAVk2DK+/3mu3RayBEL?=
 =?us-ascii?Q?zh/yV3VKoaof/Y4LW7ub/sKnCNKsriHteAQ/zs85EEDntmOhrSzSDQvB+ppn?=
 =?us-ascii?Q?t6SNJXQfjq4eG1+SDMpRMtil9JKwchgi7LGY+3pUR+28qYeP7CujX/mHh9j0?=
 =?us-ascii?Q?xhXLBSnY6C5bo/az3FgKTtc8c2cdlTXI0SvIgtKLkDo22n7X1Ycm7QcM0QHW?=
 =?us-ascii?Q?DZxLdA7iH6YCNRAjDWfP8/6vqXJUKCcIy/YGuKyxIvly3oPdeGuhL366Iwll?=
 =?us-ascii?Q?YzlIkgeJhs2a4NpUBvwM1/moB9rbYQbcLgeT9/H5zSi8eIEEb9fRa9Zq8m+h?=
 =?us-ascii?Q?JXuX5JYGgSdV3V+fXEcAzMyV9vcCy29XHBshQcpV5+0V75HkjPhuYXXiVw5C?=
 =?us-ascii?Q?xcatF1c4Sw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d013487-136a-4b72-4c78-08df0fdfacc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 08:35:46.0265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7vFD3vsChzzUIaNe5Eds6ojFZgHVFr2BwHV7TPAI7e5qnYUhIyB3XWd7htSWJ1q6Y8wsmY1ZElkvXM7J0FYKQWqkWkpCaM8Lub+acJ3+Zmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUVP216MB481266

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, September 11, 2026 5:49 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>linux-arm-kernel@lists.infradead.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>marek.vasut@mailbox.org; Ming Qian <ming.qian@oss.nxp.com>
>Subject: Re: [PATCH v7 5/9] media: chips-media: wave6: Add Wave6 core
>driver
>
>On Fri, Sep 04, 2026 at 03:46:31PM +0900, Nas Chung wrote:
>> Add the core driver for the Chips&Media Wave6 video codec IP.
>>
>> The hardware contains one control register region and four interface
>> register regions for a shared video processing engine. This driver
>> handles the interface register regions, each with its own MMIO range and
>> interrupt, while relying on the control driver for firmware loading and
>> shared resource management.
>>

...

>> +static int wave6_vpu_core_probe(struct platform_device *pdev)
>> +{
>> +	struct vpu_core_device *core;
>> +	const struct wave6_vpu_core_resource *res;
>> +	int ret;
>> +	int irq;
>> +
>> +	res =3D dev_get_platdata(&pdev->dev);
>> +	if (!res)
>> +		return -ENODEV;
>> +
>> +	ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>> +	if (!core)
>> +		return -ENOMEM;
>> +
>> +	ret =3D devm_mutex_init(&pdev->dev, &core->dev_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D devm_mutex_init(&pdev->dev, &core->hw_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	spin_lock_init(&core->inst_lock);
>> +	INIT_LIST_HEAD(&core->instances);
>> +	dev_set_drvdata(&pdev->dev, core);
>> +	core->dev =3D &pdev->dev;
>> +	core->res =3D res;
>> +
>> +	if (pdev->dev.parent->driver && pdev->dev.parent->driver->name &&
>> +	    !strcmp(pdev->dev.parent->driver->name,
>WAVE6_VPU_PLATFORM_DRIVER_NAME))
>
>why need check this?

I'll remove the condition in v8.

>
>> +		core->vpu =3D dev_get_drvdata(pdev->dev.parent);
>> +
>> +	core->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(core->reg_base))
>> +		return PTR_ERR(core->reg_base);
>> +
>> +	ret =3D devm_clk_bulk_get_all(&pdev->dev, &core->clks);
>> +	if (ret < 0)
>> +		return dev_err_probe(&pdev->dev, ret, "failed to get
>clocks\n");
>> +
>> +	core->num_clks =3D ret;
>> +
>> +	ret =3D kfifo_init(&core->irq_fifo, core->irq_buffer,
>> +			 sizeof(core->irq_buffer));
>> +	if (ret)
>> +		return ret;
>> +
>> +	irq =3D platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return irq;
>> +
>> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq,
>> +					wave6_vpu_core_irq,
>> +					wave6_vpu_core_irq_thread,
>> +					0, "vpu_irq", core);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D v4l2_device_register(&pdev->dev, &core->v4l2_dev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to register v4l2_dev: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D wave6_vpu_init_m2m_dev(core);
>> +	if (ret)
>> +		goto err_v4l2_unregister;
>> +
>> +	core->temp_vbuf.size =3D ALIGN(W6_TEMPBUF_SIZE, 4096);
>> +	ret =3D wave6_vdi_alloc_dma(core->dev, &core->temp_vbuf);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to allocate temp_vbuf: %d\n",
>ret);
>> +		goto err_m2m_dev_release;
>> +	}
>> +
>> +	core->debugfs =3D debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
>> +	if (!IS_ERR_OR_NULL(core->debugfs))
>> +		dput(core->debugfs);
>> +	else
>> +		core->debugfs =3D debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR,
>NULL);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>
>devm_pm_runtime_enable()

OK.

>
>> +
>> +	if (core->res->codec_types & WAVE6_IS_DEC) {
>> +		ret =3D wave6_vpu_dec_register_device(core);
>> +		if (ret) {
>> +			dev_err(&pdev->dev,
>> +				"failed to register video_dev_dec: %d\n", ret);
>> +			goto err_temp_vbuf_free;
>> +		}
>> +	}
>> +	if (core->res->codec_types & WAVE6_IS_ENC) {
>> +		ret =3D wave6_vpu_enc_register_device(core);
>> +		if (ret) {
>> +			dev_err(&pdev->dev,
>> +				"failed to register video_dev_enc: %d\n", ret);
>> +			goto err_dec_unreg;
>> +		}
>> +	}
>> +
>> +	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
>> +		core->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
>> +		core->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
>> +
>> +	return 0;
>> +
>> +err_dec_unreg:
>> +	if (core->res->codec_types & WAVE6_IS_DEC)
>> +		wave6_vpu_dec_unregister_device(core);
>> +err_temp_vbuf_free:
>> +	pm_runtime_disable(&pdev->dev);
>> +	wave6_vdi_free_dma(&core->temp_vbuf);
>> +err_m2m_dev_release:
>> +	wave6_vpu_release_m2m_dev(core);
>> +err_v4l2_unregister:
>> +	v4l2_device_unregister(&core->v4l2_dev);
>
>can you try use devm_add_action_or_reset() to elimiate these error label?

OK, I'll address this in v8.

>
>> +
>> +	return ret;
>> +}
>> +
>> +static void wave6_vpu_core_remove(struct platform_device *pdev)
>> +{
>> +	struct vpu_core_device *core =3D dev_get_drvdata(&pdev->dev);
>> +
>> +	wave6_vpu_enc_unregister_device(core);
>> +	wave6_vpu_dec_unregister_device(core);
>> +	pm_runtime_disable(&pdev->dev);
>> +	wave6_vdi_free_dma(&core->temp_vbuf);
>> +	wave6_vpu_release_m2m_dev(core);
>> +	v4l2_device_unregister(&core->v4l2_dev);
>> +}
>> +
>> +static int wave6_vpu_core_runtime_suspend(struct device *dev)
>> +{
>> +	struct vpu_core_device *core =3D dev_get_drvdata(dev);
>> +
>> +	if (WARN_ON(!core))
>> +		return -ENODEV;
>> +
>> +	/*
>> +	 * Only call parent VPU put_vpu if the core has a parent and is
>active.
>> +	 * - core->vpu: prevent access in core without parent VPU.
>> +	 * - core->active: execute sleep only after m2m streaming is started.
>> +	 */
>> +	if (core->vpu && core->active)
>> +		core->vpu->put_vpu(core->vpu, core);
>> +
>> +	if (core->num_clks)
>
>Need check it. clk_bulk_disable_unprepare() is empty ops when num_clks is =
0

I'll drop the guard in v8.

>
>> +		clk_bulk_disable_unprepare(core->num_clks, core->clks);
>> +
>> +	return 0;
>> +}
>> +
>> +static int wave6_vpu_core_runtime_resume(struct device *dev)
>> +{
>> +	struct vpu_core_device *core =3D dev_get_drvdata(dev);
>> +	bool boot_vpu;
>> +	int ret;
>> +
>> +	if (WARN_ON(!core))
>> +		return -ENODEV;
>> +
>> +	if (core->num_clks) {
>
>need checkit. clk_bulk_prepare_enable() is empty ops when num_clks is 0

Same here.

Thanks.
Nas.

>
>Frank
