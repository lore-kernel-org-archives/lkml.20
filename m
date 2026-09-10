Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022141.outbound.protection.outlook.com [40.107.43.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490503939C8;
	Thu, 10 Sep 2026 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028102; cv=fail; b=nnR0V9pBjpO1v++c5Ee9XmDULVB0kLn7JlGGJoyupUoZelwKp5PdHnawe1+e0MFORp8VcqK4PjeYz74OKU3kn5fEuM22DkzBp+05+NvgnD69utHepA0UIB7/NTf+pvmdxXEegI0G9NH+T5yVhL5mpsw0uOQTGmOTe+BfRKCoD/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028102; c=relaxed/simple;
	bh=t9ZUuu+yks5gDXAvZksLU+iXz1/thnPhERLH+QDpzpk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LXasrQRFctfJOflUp62Gvmfdv3d8t5Gc1ZP9rOuVePxxoHrIUaMndKlGy+0P9ikylaBsIiSV94fx9RX9gHcABbeOCgq/V6lHicQ6UPhkkYCwctFKwAR/+EoSw00ozKjMo3101UWIP0psNXWp4NvJVKynrcVJpMQlyrnCHBtMY10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=tfGaWkP1; arc=fail smtp.client-ip=40.107.43.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="tfGaWkP1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5fem8wqtPGLcxzE1sSTpXfS1ZzhDF+/51kQVtMzcE67PwK0Jh5POUg1uy2n5j+t98tdKMyuQC7NQ8KivgGUpKyCDkYkUJ6SqbuhGnKWjdZuEhu0xTVwhJs5F+oO8apS8hjgNvj+BtFEeglPBX+2oi1PZlouIH7U6pcK9Ra9c8Bunf39+IoZVWnAxWdiSMZBm5ofbpMBON6yRwiKEvAk0Up1VeUkxXIulbhiC+9YXLCUEdPvjrKlC5V2CTTZabwpZ1FmmAP8fQYsGBjbIFSlHyFRZAkTnQvhyYQ1SmxOHbNnlRGprmIdnUIpYhNUVUI6KFYN3StmuPvqvkAqWa5atw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQIJ/dCjrda2aO2fZMmle68lZemmXoHytyBEyuxk0K0=;
 b=wjNv0LrSungCK+upwB7h441jULXGZsQpYWOXMgg7jzRDFEdGod8TSXkHOmv9MHhqyJRaM9ykd22xwlYDyxtN7rZiFonNQ8qTR1v7pf9Zu/hPKCiS/vhlqzH7HJBK+ddkyZKMNT6FfYm9cl4bDQ2jeekFwRdQbb87NSWIjwWbzlNhNGfHkD4P5FXeG7MSptwkm/l2VlTf0yV43h/zlYt5VXxuwcjiO3Uy4Q0HhBDkL9pA49WLTnFoUG6iZcaIfPWhc+BWq9dEy7Fdh/QJdDYB0dw/k3TSoqGpDhy1EwcWoVJU5gdTNxrO8e9RiaPH/XZUlv7fsH9qxk4k5cFoFUD/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQIJ/dCjrda2aO2fZMmle68lZemmXoHytyBEyuxk0K0=;
 b=tfGaWkP1pwlawqSff34mkc6qE721Cvw6zwCz8BTsGlS/ekQq1ySBM0033kwF7rdJCIUv036XaqrERqokRMus2zRmFlJwnWJrEBeelV3B70yY+kQ30i4zfwSNWij/7JKKX9xjtC1bkyO4d6bJNDFHet38YvIC+72Q0/hmXNBxF8lPgnqexbGa6Uyq0xA2lb5aHTvYhvJV5y09rFXxgZj4M4Kt7P0W2rtqv9ouYJsyj+HO0vZ+NYqJaYveyVSeod5kNEdi1Sz3c1aXB5/Y7+5n/41vXJeQqvgv8UIXr4Uq1fidxbHDIuoIghH7O+bTQxdSYdwxqVO6gwYgFYrpb28+mA==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PU4P216MB2025.KORP216.PROD.OUTLOOK.COM (2603:1096:301:131::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:14:51 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:14:50 +0000
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
Thread-Index: AQHdPDkr23ol+EHgZUqQjr0gKJp7ELbGsEQAgAC7lZA=
Date: Thu, 10 Sep 2026 08:14:50 +0000
Message-ID:
 <SL2P216MB2441331C97E21F81D9F17460FBBF2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <39115ce2f3d9cc18350cddc650b7cb40317e5ef3.1788496816.git.nas.chung@chipsnmedia.com>
 <aqG4Vl3yDv3rNSw9@lizhi-Precision-Tower-5810>
In-Reply-To: <aqG4Vl3yDv3rNSw9@lizhi-Precision-Tower-5810>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PU4P216MB2025:EE_
x-ms-office365-filtering-correlation-id: 49215f27-299e-42c0-8a2f-08df0f13962e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|56012099006|38070700021|4143699003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 ocJZFKjFPQZmFcMCqVeP2VvhpXFpOPHvGwB/mUaQPMahte+BGRLvGYqsA+kjegTsTHnHb8UOvl8LZg2zcMgI49gg1sWVhft5fa55L4EZvSq/JlfrH0IdzNa+iZJE8SoiLaaHoIp9t1SGF5kV/jusq3EDQW/2MQlLUQsakKH7R+EAzyK4kYfPIN2gkMyoFmmvKCyMyfbTIgeEIhfVBmcRlRcX4imZaxFD2QE3hHCu5PLV34l1jSPoXD5NwCknp+CKn91XAud7A8++iQtvIRVt7Uj2qCUE0pmJ4QPAR4XmXImZpKAOJbafhcT4jTlMaYGxty7OUO+qWurgNg3yjlixhntl7dLMtklOC+dU5j8vYci+hIhUCp16yaXSYiOxp7cYHycPattoyxsED0QLM9LvyRkH9ZrCxsVNvPAZ4PmdxsDjnW1RBL3Cy0OK0J54eJ+6ncedm8tQpaadLwyhqArQ260grLdM4dx7+T7i8I9v1NWPYAN0sLc/Sjvgppzyvui5b2XU+u6RdL4BQBJWpX1Lwr8gv5m8OgpDOMj2qC6FV8ebyKtnrV7kzz6bSFgSLHkhli5gW4y6oGr5CZh/IaS3mBjJo/ZYyuTbcFknMQ09MUWGNlMegSe4fYcFpbVy44X4zKJs9ynVdH+AxKxUfMfGerk3HHl4l/5h9WuSOYzpCzWkKGxy1L5sdyIK2uKSBMRhM9PPnewMjpmKeLN3IsOlOv/SZA794a/OMkonfUAkuXg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(56012099006)(38070700021)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JoLiZO+mzKpzUyLsyFYxrc4QLV0UbpgxCZOas66YCu5DQWVuCBLmMfHS0fIf?=
 =?us-ascii?Q?PBGhKImIydsXZGn7aD10m+BYOKYjM9z/UU5DB/ywsrBjsUdVDWokTW5TvRqQ?=
 =?us-ascii?Q?4SqvBkFJsXrl7e2l7FbKDTex0mbrueBN69LWeX6o4sMj8GtIy/xICDRfNewy?=
 =?us-ascii?Q?9Aob41fomA5OcXK0ZocTsPuZ50ClmF7hIKa4LMxuZJxKiQKIBbozRhgzP1z6?=
 =?us-ascii?Q?eyqemq8Af+MioLDZsddaNY1W5LISb0XH0TLp1k+pjFqLSWBvsOA0i2cY8Gld?=
 =?us-ascii?Q?6IwgrNmhto98zETb0uV2pnhmkBVes+p6R9Vom+pnlPskwCxQ9YK7HDDF8Crj?=
 =?us-ascii?Q?UzWa62hG73RhQb+lzLVuS1LRAIpMFoGSXluVwHx+knl8QNjUZFtQjGmaLZA7?=
 =?us-ascii?Q?WgJq3/W9GO1TkcgB38yFt6XvevbbrAbqtZJZLxtkzzmiFUrGgml6F0doLjR2?=
 =?us-ascii?Q?UUu+o7xUMGtosWZcvyk5kYJZCPoV40rZ2UQQF9SoW69+kyM7pRUDD+Q0sB3q?=
 =?us-ascii?Q?HVsVulmnjyQRnFvVHdr31deIIUiGtMN/hy5h1fF96TlGdijiWEXuDGy12psM?=
 =?us-ascii?Q?wzf3CbBd9jIPlYmfQ93IPn94AqNzp7gwDuLiEb+UscWdWzGZ3h4iZCATWhpc?=
 =?us-ascii?Q?P31M7u05V2CiD89VVqJXj21/EmE8Q6bZQELLT5xl+xYzCXckYxJuIzh/tlVV?=
 =?us-ascii?Q?Ck15dTaMsFaruuUC8mIB/QgVCz18Ud0Ti41Ec4txe4XwLcM3RsImUiadEH8v?=
 =?us-ascii?Q?X1NaQODAHKTCaR/szcmWP57+FmY2iz5V82J8ZjYA8MmaABEoR/DywILAokwV?=
 =?us-ascii?Q?Vge9p1TiDeYrjqPxDBxi/IqMdgkBxAquzd+3qSUuMACaYDGy3Ib69W9peXHq?=
 =?us-ascii?Q?fklvHt5ovJEgvgkQvrJNKdzA0kxHO0bCK5TRywQitYejqKLIh8I9uIULfiib?=
 =?us-ascii?Q?uzG1AuTtOYWXmdocL3ubneXlcSp3JkJQgFvoIDq7CifFgD8kTq6pKWT8SnmT?=
 =?us-ascii?Q?a+cLGIjr+DgcXVFNj5CoNinIveUuzHZkpNnzPMj8tlD6djp/MdTn9aj05gTS?=
 =?us-ascii?Q?yMkJ6ZsMevujpYHMUE94k7hDkKpXPdlvBOcGiBbHFBKnq034ZKFVs96dCnHw?=
 =?us-ascii?Q?sp0OXq8cgpe9s8LpcrjBZ3cT7boUFTpc0/YlRGUCTy07qELBu2XO7tzVILgJ?=
 =?us-ascii?Q?JnxUE9pK4NelC+/0jqd2EqObuWJOgbGqJtopns1RYXJOBtDOledJ+SLnel7W?=
 =?us-ascii?Q?C/hU+W9KESapjXhkQLOGsKzJgGJ5yOzBLs4A8TOsbe5DiOIXqef22d4Ur4UG?=
 =?us-ascii?Q?1sQ8cxkFPmymJjLwmaPhfWyj2+uN/mAMhh+daAd1xp15IWuj0HvXM4lIzdGF?=
 =?us-ascii?Q?g4qxMQRTsrbA4uKjnJQEQhGpgm10ONnWlB401WgPEYZdfTai5jMaJsv3eoUD?=
 =?us-ascii?Q?EhkrfD6VA7EkSeDIc7zwtxpr++NABIxoq+8AW4tpgi2IUE82SsY277F9WPp2?=
 =?us-ascii?Q?6m+ZMod+NzrgMd5j/qjVLTbwaZKsNFesxZMsD5Kg3EYzCYImSGDlG95BNFs3?=
 =?us-ascii?Q?LY/qu29CK9U8hVJVrG2EKIVhfFzm2REGh7jPa4F8oUPkCXvIm2JC4m7OkFyO?=
 =?us-ascii?Q?itDs63aOP53F2liXBJwVWoCKaB/NV5YsU+wmh5ETBS2XC+sQ3Ril7DICIgoV?=
 =?us-ascii?Q?nuZ9T0CNWrx/6u9z9spN+2CLEPfmGPWiCbPgYh2jTBPg/3lWz1RK/WmtK0+E?=
 =?us-ascii?Q?O7ToHsxblg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 49215f27-299e-42c0-8a2f-08df0f13962e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 08:14:50.7783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igKQt98GkjFk5Ahhen1AnPOuNhOOVFQlzdtfIhU4EEoFogjsExA3pjCKkPLHVHPlqNw1IeHLb4CiLF5D3OHU/UF64lpLvMmeSFOQ3HdMcbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2025

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Thursday, September 10, 2026 4:50 AM
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
>
>Nit: your s-o-b is last one

OK.

>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>...
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
>
>Consider nxp is one major user, can you add
>
>L: imx@lists.linux.dev

Sure, I'll add it in v8.

>
>...
>> +/*
>> + * Wave6 series multi-standard codec IP - wave6 backend interface
>> + *
>> + * Copyright (C) 2025 CHIPS&MEDIA INC
>
>2026

I'll update the other files as well.

>
>> + */
>> +
>> +#include <linux/iopoll.h>
>
>Add space line here

OK.

>
>> +#include "wave6-vpu-core.h"
>> +#include "wave6-hw.h"
>> +#include "wave6-regdefine.h"
>> +#include "wave6-trace.h"
>> +
>> +void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data)
>> +{
>> +	wave6_vdi_writel(core->reg_base, addr, data);
>> +	trace_wave6_vpu_writel(core->dev, addr, data);
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
>> +		dev_dbg(dev, "%pS: queueing failure 0x%x\n", caller,
>fail_reason);
>
>why here is dev_dbg(), other is dev_err()

I'll change it to dev_err().

>
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
>> +{
>> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
>> +	int index;
>> +
>> +	for (index =3D 0; index < WAVE6_MAX_FBS; index++) {
>
>Now, Prefer
>
>	for (int index =3D 0; ....)

Agreed. I'll check for the same pattern elsewhere.

>
>> +		if (!p_dec_info->disp_buf[index].buf_y) {
>> +			p_dec_info->disp_buf[index] =3D fb;
>> +			p_dec_info->disp_buf[index].index =3D index;
>> +			break;
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
>
>struct frame_buffer fb =3D { .index =3D -1;};
>
>> +
>> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
>
>for (int i =3D 0; ..)
>
>> +		if (p_dec_info->disp_buf[i].buf_y =3D=3D addr)
>> +			return p_dec_info->disp_buf[i];
>> +	}
>> +
>> +	memset(&fb, 0, sizeof(struct frame_buffer));
>
>needn't memset here if init at declear.

Agreed. I'll fix wave6_dec_get_display_buffer() in v8.

>
>> +	fb.index =3D -1;
>> +
>> +	return fb;
>> +}
>> +
>...
>> +
>> +static int wave6_send_query(struct vpu_core_device *core, u32 id, u32
>std,
>> +			    enum wave6_query_option query_opt)
>> +{
>> +	int ret;
>> +	u32 reg_val;
>
>try keep reverise Christmas tree order.

OK, I'll fix it.

>
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
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int wave6_vpu_get_version(struct vpu_core_device *core)
>> +{
>> +	struct vpu_attr *attr =3D &core->attr;
>> +	int ret;
>> +	u32 std_def1, conf_feature;
>> +
>> +	lockdep_assert_held(&core->hw_lock);
>> +
>> +	ret =3D wave6_send_query(core, 0, 0, W6_QUERY_OPT_GET_VPU_INFO);
>> +	if (ret)
>> +		return ret;
>> +
>> +	attr->product_id =3D wave6_vpu_get_product_id(core);
>> +	attr->product_code =3D vpu_read_reg(core, W6_VPU_RET_PRODUCT_CODE);
>> +	attr->product_version =3D vpu_read_reg(core, W6_RET_PRODUCT_VERSION);
>> +	attr->fw_version =3D vpu_read_reg(core, W6_RET_FW_API_VERSION);
>> +	attr->fw_revision =3D vpu_read_reg(core, W6_RET_FW_VERSION);
>> +	attr->hw_version =3D vpu_read_reg(core, W6_RET_CONF_HW_VERSION);
>> +	std_def1 =3D vpu_read_reg(core, W6_RET_STD_DEF1);
>> +	conf_feature =3D vpu_read_reg(core, W6_RET_CONF_FEATURE);
>> +
>> +	attr->support_decoders =3D 0;
>> +	attr->support_encoders =3D 0;
>> +	attr->support_decoders |=3D STD_DEF1_HEVC_DEC(std_def1) << W_HEVC_DEC;
>
>This is depend on STD_DEF1_HEVC_DEC() is 1 bit field.
>I feel like below codes is easier to read
>
>	STD_DEF1_HEVC_DEC(std_def1) ? BIT(W_HEVC_DEC) : 0;

Agreed, I'll change it in v8.

>
>> +	attr->support_hevc10bit_dec =3D
>CONF_FEATURE_HEVC10BIT_DEC(conf_feature);
>> +	attr->support_decoders |=3D STD_DEF1_AVC_DEC(std_def1) << W_AVC_DEC;
>> +	attr->support_avc10bit_dec =3D CONF_FEATURE_AVC10BIT_DEC(conf_feature)=
;
>> +	attr->support_encoders |=3D STD_DEF1_HEVC_ENC(std_def1) << W_HEVC_ENC;
>> +	attr->support_hevc10bit_enc =3D
>CONF_FEATURE_HEVC10BIT_ENC(conf_feature);
>> +	attr->support_encoders |=3D STD_DEF1_AVC_ENC(std_def1) << W_AVC_ENC;
>> +	attr->support_avc10bit_enc =3D CONF_FEATURE_AVC10BIT_ENC(conf_feature)=
;
>> +
>> +	return 0;
>> +}
>...
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
>> +	out_fmt =3D (inst->nv21 << 1) | inst->cbcr_interleave;
>
>Can you use macro for 1 and 2. look like it fill into
>SET_DISP_COMMON_PIC_INFO_OUT_FMT()

Agreed.

>
>Seem you need more detail out_fmt for WTL_PIXEL_16BIT/WTL_PIXEL_32BIT/
>WTL_PIXEL_8BIT and *JUSTIFIED. should use FIELD_PREP() macro for these
>settings.

OK, I'll use FIELD_PREP() for out_mode.

>
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
>> +
>...
>> +
>> +int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct
>dec_output_info *info)
>> +{
>> +	struct dec_info *p_dec_info;
>> +	u32 reg_val, i;
>> +	int decoded_idx =3D -1, disp_idx =3D -1;
>> +	int ret;
>> +
>> +	if (WARN_ON(!info))
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&inst->dev->hw_lock);
>> +
>> +	p_dec_info =3D &inst->codec_info->dec_info;
>> +
>> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std,
>W6_QUERY_OPT_GET_RESULT);
>> +	if (ret) {
>> +		info->rd_ptr =3D p_dec_info->stream_rd_ptr;
>> +		info->wr_ptr =3D p_dec_info->stream_wr_ptr;
>> +		return ret;
>> +	}
>> +
>> +	info->decoding_success =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_DECODING_SUCCESS);
>> +	if (!info->decoding_success)
>> +		info->error_reason =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_ERR_INFO);
>> +	else
>> +		info->warn_info =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_WARN_INFO);
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_TYPE);
>> +	info->ctu_size =3D DEC_PIC_TYPE_CTU_SIZE(reg_val);
>> +	info->nal_type =3D DEC_PIC_TYPE_NAL_UNIT_TYPE(reg_val);
>> +
>> +	if (reg_val & DEC_PIC_TYPE_B)
>> +		info->pic_type =3D PIC_TYPE_B;
>> +	else if (reg_val & DEC_PIC_TYPE_P)
>> +		info->pic_type =3D PIC_TYPE_P;
>> +	else if (reg_val & DEC_PIC_TYPE_I)
>> +		info->pic_type =3D PIC_TYPE_I;
>> +	else
>> +		info->pic_type =3D PIC_TYPE_MAX;
>> +	if (inst->std =3D=3D W_HEVC_DEC) {
>> +		if (info->pic_type =3D=3D PIC_TYPE_I &&
>> +		    (info->nal_type =3D=3D H265_NAL_UNIT_TYPE_IDR_W_RADL ||
>> +		     info->nal_type =3D=3D H265_NAL_UNIT_TYPE_IDR_N_LP))
>> +			info->pic_type =3D PIC_TYPE_IDR;
>> +	} else if (inst->std =3D=3D W_AVC_DEC) {
>> +		if (info->pic_type =3D=3D PIC_TYPE_I &&
>> +		    info->nal_type =3D=3D H264_NAL_UNIT_TYPE_IDR_PICTURE)
>> +			info->pic_type =3D PIC_TYPE_IDR;
>> +	}
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_DECODED_FLAG);
>> +	if (reg_val) {
>> +		struct frame_buffer fb;
>> +		dma_addr_t addr =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_DECODED_ADDR);
>> +
>> +		fb =3D wave6_dec_get_display_buffer(inst, addr);
>> +		info->frame_decoded_addr =3D addr;
>> +		info->frame_decoded =3D true;
>> +		decoded_idx =3D fb.index;
>> +	}
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_DISPLAY_FLAG);
>> +	if (reg_val) {
>> +		struct frame_buffer fb;
>> +		dma_addr_t addr =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_DISPLAY_ADDR);
>> +
>> +		fb =3D wave6_dec_get_display_buffer(inst, addr);
>> +		info->frame_display_addr =3D addr;
>> +		info->frame_display =3D true;
>> +		disp_idx =3D fb.index;
>> +	}
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_DISP_IDC);
>> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
>> +		if (reg_val & (1 << i)) {
>
>for_each_set_bit()

OK.

>
>> +			dma_addr_t addr;
>> +
>> +			addr =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_DISP_LINEAR_ADDR(i));
>> +
>> +			info->disp_frame_addr[info->disp_frame_num] =3D addr;
>> +			info->disp_frame_num++;
>> +		}
>> +	}
>> +
>> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_RELEASE_IDC);
>> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
>
>ditto, check other similar logic.

OK.

>
>> +		if (reg_val & (1 << i)) {
>> +			dma_addr_t addr;
>> +
>> +			addr =3D vpu_read_reg(inst->dev,
>W6_RET_DEC_DISP_LINEAR_ADDR(i));
>> +
>> +			wave6_dec_remove_display_buffer(inst, addr);
>> +			info->release_disp_frame_addr[info-
>>release_disp_frame_num] =3D addr;
>> +			info->release_disp_frame_num++;
>> +		}
>> +	}
>> +
>...
>> +
>> +int wave6_vpu_enc_start_one_frame(struct vpu_instance *inst, struct
>enc_param *param,
>> +				  u32 *fail_res)
>> +{
>> +	struct enc_cmd_enc_pic_reg reg;
>
>struct enc_cmd_enc_pic_reg reg =3D {};
>
>move set 0 out of mutex lock, slice better.

OK, I'll fix this in v8.

>
>> +	struct enc_info *p_enc_info;
>> +	int ret;
>> +
>> +	guard(mutex)(&inst->dev->hw_lock);
>> +
>> +	p_enc_info =3D &inst->codec_info->enc_info;
>> +
>> +	memset(&reg, 0, sizeof(struct enc_cmd_enc_pic_reg));
>> +
>> +	wave6_gen_enc_pic_reg(p_enc_info, inst->cbcr_interleave,
>> +			      inst->nv21, param, &reg);
>> +
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_START, reg.bs_start);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_SIZE, reg.bs_size);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_OPTION, reg.bs_option);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SEC_AXI, reg.sec_axi);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_REPORT, reg.report);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_MV_HISTO0, reg.mv_histo0);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_MV_HISTO1, reg.mv_histo1);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_PARAM,
>reg.custom_map_param);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_ADDR,
>reg.custom_map_addr);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_PIC_IDX,
>reg.src_pic_idx);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_Y, reg.src_addr_y);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_U, reg.src_addr_u);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_V, reg.src_addr_v);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_STRIDE, reg.src_stride);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_FMT, reg.src_fmt);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_AXI_SEL,
>reg.src_axi_sel);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CODE_OPTION,
>reg.code_option);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PARAM, reg.param);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_LONGTERM_PIC,
>reg.longterm_pic);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_NAL_ADDR,
>reg.prefix_sei_nal_addr);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_INFO,
>reg.prefix_sei_info);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_NAL_ADDR,
>reg.suffix_sei_nal_addr);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_INFO,
>reg.suffix_sei_info);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP_LOW,
>reg.timestamp_low);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP_HIGH,
>reg.timestamp_high);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF0,
>reg.csc_coeff[0]);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF1,
>reg.csc_coeff[1]);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF2,
>reg.csc_coeff[2]);
>> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF3,
>reg.csc_coeff[3]);
>> +
>> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_PIC);
>> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
>> +	if (ret) {
>> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
>> +		return -ETIMEDOUT;
>> +	}
>
>I not sure how heavy register read() write(),  consider use
>readl(writel)_relex(), if need write/read many registers(). Only last one
>need writel() before trigger DMA.

This should be worth it, especially in the multi-instance case.
I'll do this in v8 if I see no regression.

>
>> +
>> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
>> +		*fail_res =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
>> +		wave6_print_reg_err(inst->dev, *fail_res);
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>...
>> +#endif /* __WAVE6_HW_H__ */
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
>b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
>> new file mode 100644
>> index 000000000000..1d495145bbbd
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
>> @@ -0,0 +1,649 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>> +/*
>> + * Wave6 series multi-standard codec IP - wave6 register definitions
>> + *
>> + * Copyright (C) 2025 CHIPS&MEDIA INC
>> + */
>
>2026

Same as above.

>
>...
>> +
>> +#define W6_MAX_PIC_STRIDE		(4096U * 4)
>> +#define W6_PIC_STRIDE_ALIGNMENT		32
>> +#define W6_FBC_BUF_ALIGNMENT		32
>> +#define W6_DEC_BUF_ALIGNMENT		32
>> +#define W6_DEF_DEC_PIC_WIDTH		720U
>> +#define W6_DEF_DEC_PIC_HEIGHT		480U
>> +#define W6_MIN_DEC_PIC_WIDTH		64U
>> +#define W6_MIN_DEC_PIC_HEIGHT		64U
>> +#define W6_MAX_DEC_PIC_WIDTH		4096U
>> +#define W6_MAX_DEC_PIC_HEIGHT		4096U
>> +#define W6_DEC_PIC_SIZE_STEP		1
>> +
>> +#define W6_DEF_ENC_PIC_WIDTH		416U
>> +#define W6_DEF_ENC_PIC_HEIGHT		240U
>> +#define W6_MIN_ENC_PIC_WIDTH		256U
>> +#define W6_MIN_ENC_PIC_HEIGHT		128U
>> +#define W6_MAX_ENC_PIC_WIDTH		4096U
>> +#define W6_MAX_ENC_PIC_HEIGHT		4096U
>
>needn't U

OK.

>
>> +#define W6_ENC_PIC_SIZE_STEP		8
>> +#define W6_ENC_CROP_X_POS_STEP		32
>> +#define W6_ENC_CROP_Y_POS_STEP		2
>> +#define W6_ENC_CROP_STEP		2
>> +
>> +#define W6_VPU_POLL_DELAY_US		10
>> +#define W6_VPU_POLL_TIMEOUT		300000
>> +#define W6_BOOT_WAIT_TIMEOUT		10000
>> +#define W6_VPU_TIMEOUT			6000
>> +#define W6_VPU_TIMEOUT_CYCLE_COUNT	(8000000 * 4 * 4)
>> +
>...
>> +#define __WAVE6_VPUERROR_H__
>> +
>> +/* WAVE6 COMMON SYSTEM ERROR (FAIL_REASON) */
>> +#define WAVE6_SYSERR_QUEUEING_FAIL			0x00000001
>> +#define WAVE6_SYSERR_DECODER_FUSE			0x00000002
>> +#define WAVE6_SYSERR_INSTRUCTION_ACCESS_VIOLATION	0x00000004
>> +#define WAVE6_SYSERR_PRIVILEGE_VIOLATION		0x00000008
>> +#define WAVE6_SYSERR_DATA_ADDR_ALIGNMENT		0x00000010
>> +#define WAVE6_SYSERR_DATA_ACCESS_VIOLATION		0x00000020
>> +#define WAVE6_SYSERR_ACCESS_VIOLATION_HW		0x00000040
>> +#define WAVE6_SYSERR_INSTRUCTION_ADDR_ALIGNMENT		0x00000080
>> +#define WAVE6_SYSERR_UNKNOWN				0x00000100
>> +#define WAVE6_SYSERR_BUS_ERROR				0x00000200
>> +#define WAVE6_SYSERR_DOUBLE_FAULT			0x00000400
>> +#define WAVE6_SYSERR_RESULT_NOT_READY			0x00000800
>> +#define WAVE6_SYSERR_VPU_STILL_RUNNING			0x00001000
>> +#define WAVE6_SYSERR_UNKNOWN_CMD			0x00002000
>> +#define WAVE6_SYSERR_UNKNOWN_CODEC_STD			0x00004000
>> +#define WAVE6_SYSERR_UNKNOWN_QUERY_OPTION		0x00008000
>> +#define WAVE6_SYSERR_WATCHDOG_TIMEOUT			0x00020000
>> +#define WAVE6_SYSERR_NOT_SUPPORT			0x00100000
>> +#define WAVE6_SYSERR_TEMP_SEC_BUF_OVERFLOW		0x00200000
>> +#define WAVE6_SYSERR_NOT_SUPPORT_PROFILE		0x00400000
>> +#define WAVE6_SYSERR_TIMEOUT_CODEC_FW			0x40000000
>
>Suppose you should get check_patch warning, to prefer use BIT(n) for this
>defination.

OK. I'll use BIT(n) where the value is a single bit.

Thanks.
Nas.

>
>Frank
