Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021122.outbound.protection.outlook.com [40.107.42.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769723B14A5;
	Thu, 10 Sep 2026 04:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015131; cv=fail; b=pQiQRN78R6oq0bLg69Kkqliylg2vL6g7RdC7c2MIPWnYFRX9+O3Hlm1Nj1TCo7jFLZIIVqDHdJuKGdeFUNrD/R7IajRrnUENXDFra1FMq9ll36rkFoZVyGm1qwdh+jdjmC8kgn8obysEPFa8pHc52HWGL3VFNi0+Q6A2NLj8oxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015131; c=relaxed/simple;
	bh=l7A//8l4nJUfb1H6tovcX0yK/gp9nZaYlQxeLi0x2L8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b4yBD+e1x6Mug9hOn/KyVY+FRBVKNTgLNIqb0pZosMHdYikMSlABnv3OxKfxFQh48aOsjKmYQ/RbD+TiU55URydQ//4gC1X93rPRqaQBxrdvGixfeQ/V4KydCLRo+OgVm/Kj/yBtxWGDGisqSqR60ngTs3HzpyjX6aq26OQAuI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=loOWDl0X; arc=fail smtp.client-ip=40.107.42.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="loOWDl0X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWQjvufx2uQ5RTIwHqAbzUKRKBZzE4Td0P6+qTSgSlrdpNs0xkw9kEM+/ZtoaRSDgRCh5cTnXNNXALaLNjGK9q12xSaTN1b+fdI5DzieCsFe1wM3IK/rClYA6iInb77RsRiKzlqxz7PNYWfnQrEBsyIpjIp8L/VrDi0l5cEm9mbZpYcRvfzIikbM/tnS9aHR3E4BFHzfycRgyE3Hi6VNi95tUXyAPfX8bGa1UO88D777brmlLi7U9c9EGVcRKvqTgFucNyAhCyaXXvgG+hr4zGxutWEzQykh8hSRVKBUdKTHPTHKE0PSjOTSReMaE5yWgnpwZUCWF8qaUVFdDRn8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7A//8l4nJUfb1H6tovcX0yK/gp9nZaYlQxeLi0x2L8=;
 b=QZDjbiT5AebTgVYWhouNYsxfowq3LciRLoAnI9C82PyhlD84tMJwmGN7NyVaUIN0TvDbcgyolX2q54I7AiLtcArLxAft/3WWkAH6kEbVssv9lgMA1Pi4hcNk21hggyuK61WLGpIxLCASc+9r1crxVIZ/6BJgZDEJxWx93ZHM61ZuFVMiuiTieXp6CrKmKLs7UaDIUbYcugHJyxXhNzcWPK5pPOcTEGg4dD+63tOYWrOquTFsSA/LdSrI8aqgHSwt5kEi1lwZv74OWoob+Ua3WMarbngCrrWsX/+91AarKY5xsiCkQbPS7r6Dse5gYh4YCXY9bgm6P2O3V9jj9RVhsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7A//8l4nJUfb1H6tovcX0yK/gp9nZaYlQxeLi0x2L8=;
 b=loOWDl0XQZhujFQgZwX/vm+D8xQFU/UQFiIOY6/xo1OsT6SyVIY/8NGePSDkpocpCd7pqJsMYiXp9mPPV1uAJXcrKTp2tsHiirkr1V8+XLg5nLdTn9Hgbc/EB2/q1LpQkQXAy5mZ0pyffBtJPz8AQ/X6MgtuipdrPiurqJVJTgTLdONfsCneXEd1kvcauCn9dIvmaDhGp0wrlLHtXqwMrEfJuDOz7x6skSn0z1+zKyXbpS9A1k7dGKi4xx5TcZxphHo1mNfivMEw3AkJulZiKjtyruK8+5N/s+bWukQdcHZabmRAt+VG9plSLcUo4H2/HJ6MQWI2Nk2oZSrytLEv7g==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE1P216MB2244.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 04:38:27 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 04:38:27 +0000
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
Thread-Index: AQHdPDktsEnKbE5LDkiQBIYQyxEwJLbGvoSAgABg/+A=
Date: Thu, 10 Sep 2026 04:38:27 +0000
Message-ID:
 <SL2P216MB24417ACC2BD099E4A5EE1399FBBF2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <e7f599a5bd65900eb45daa3b637597fce464c383.1788496816.git.nas.chung@chipsnmedia.com>
 <aqHES02SJkIGZWDc@lizhi-Precision-Tower-5810>
In-Reply-To: <aqHES02SJkIGZWDc@lizhi-Precision-Tower-5810>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SE1P216MB2244:EE_
x-ms-office365-filtering-correlation-id: e1205c56-2b76-4d3c-12d6-08df0ef55b9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|4143699003|6133799003|56012099006|5023799004|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 jiNNME06dbiQJCgSeWRlLPBkqvKgA38LUYEchz0bulEgAYqETspKbcupoW2KQimX02v5t2mNJ0/N2HNBIDV0WeOhFmlpNcOvYp/Txay12m0NCa9Yq0ChrcfgAjoZuOfmyaG8ApXK1STpCqhYPYCC0TAgRNBTVGGyCmcqV8msD4s5x0UgnnZ6HGrjREd/dj60PSXHMnKu3heHyTVV0njHMSZPJNGOIc0+Q7nTba6zsv62aCNbTm1W5XCs/fmo5HumjjUBqc8kSi7AKMR+QGqg6PFVJeyozM1GZNzizXkkXG1uv7uhPHEtD+2nFzsAwcEXwnwRIvGCLBsGCzQSISj3TQY2l6OrXL4GBEqAzb1A7MkRGOA/1onSN5ZfICvdouLgsi0xRqhRl9lCkKzSt1QxIGhBx23pwqVYzesIyoBURXFVqzcgFW+RDIVxRba/3HCV2zPkATLU2OHLqohkkkn6KnIRZR8Mo541PyqZrErhtofPzBoE4mWGxkp4d2mGvYvKOMcwUYogKLTLpEzxpUjDzZesnc3ztDc6sqSEtwLSOerMWR8vsFw0UtMrCMDkCbDVabEVwpV2AXtWq4rTs9bzUh9qlbWr6ietBirfMFYFxZybz3M9/rjrCFccu5tzpYxyME+2BetYg05GGunC83bl8VXunv6NMQOyrRafWFQ+JOoLq3JF0RLpljG9KY7cFuKKYPFfDSNKCOKR+3SYkc99fSWPIvb8jVXI7BNy0BY5eDA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(4143699003)(6133799003)(56012099006)(5023799004)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DisuWLUO7e8+JLVi2Nr9z/VJb+CTZHDlfR5pRaWkfAGdNkrPt6m3NCXmAqMD?=
 =?us-ascii?Q?HUsG2GB4YVVwaxiP/CeBKs95Au2F3BMcUfHwKmJmJP6vZnKxxuOf5UzzaEkT?=
 =?us-ascii?Q?6+1duV50k/YEkH+/NOMN6BBal0Y1r4o8itHb10snpL9bOu7gvIEx/TKRrko9?=
 =?us-ascii?Q?iY+5IAnudVRuWRc+V/Q4GxRhY3LxzL28QNtJMLZQC2fscekMXMa58mXIvW0A?=
 =?us-ascii?Q?B25ZS50+zzWXlcwXYwoSM6daHtl4r08AE7FQuAb7y5n7GeZFz9l52WJGre78?=
 =?us-ascii?Q?kwqljzqhMUb48KAC46wtaZYLoXXblnDvEYb24QcEhwKIP1nIeNdP380nkOuV?=
 =?us-ascii?Q?TqBICAtyLhM1SdtCA0/fmQqqPCp0zdce0OMn8U4fdLIRKC2yiWa+G+DsDiJL?=
 =?us-ascii?Q?S3pHgeMMX8xurCNDp/j3ktSHLG7XgBeE3jTF4S7vLnjV82K5H+ypBaC5QhJi?=
 =?us-ascii?Q?vsfAHIN/mWndzVPSkXmsEiUAWrtTn7UKPqnejkFSPKZyX1WOJbjdiPpQhCd/?=
 =?us-ascii?Q?3x/dupWmUXA1mFKcCBsscMPAWRkMObqR/73NKEYvXnk7utzjfl7vsu9mrvaO?=
 =?us-ascii?Q?zxhJbCLSMRKXP5kp/yQqJs+GuU1YZJBLxGs448seshRVxq7CpYGp0zfBKEUK?=
 =?us-ascii?Q?uC6XtQl1PFRIrL2/dnI9juiq/44nGLrNYRHVkiURB78SDEW2sjLppEDA+uKv?=
 =?us-ascii?Q?ieonbyOTnQlZmXrzYKL6aJ7nqaUI6Rqy3RubBXZSOkB65KF4dwcnqpvc1F8p?=
 =?us-ascii?Q?Ger/sHuVtpMjnZCGVR9CVDt+NHtFTroNt5WV/D6jfXhQVf/c6ha/tluvxyWL?=
 =?us-ascii?Q?gXS894rhGaYyt6IRwvBUNqFvXPIYUn4SLtPArIVneYoxj6IgttstYKP027NA?=
 =?us-ascii?Q?ZZZHHN7pqG/1S7EgycCnlGBJTxgepqVKrKnrXLJ16b5d2PFIMPJZWFDkdWFv?=
 =?us-ascii?Q?4qOVLBQfW5IFaCw8uAxLGFxf7IxP6ScwARSRDnDKKbbFBfp+f6pVplLQ6WQw?=
 =?us-ascii?Q?cq50qIW99FTxABG4BMpG0soWENoTEpHiQOlOj5cqHYV6XlSN/Muz9jM2uKN9?=
 =?us-ascii?Q?2wjiPMwDfBwBhL83eMOW1Yib7K3hHXO5vF35SqzCa7/bFXbdnQgi5wk+4lXW?=
 =?us-ascii?Q?3I/x0Xno4kiriyMb2Bgk818iYifXw0ffxLTOaX1xeOOfAZiRnLMJ/stJ+PXe?=
 =?us-ascii?Q?e0HWms5so39IqCyB6JmKYO9UQ4QOtlPi5J64FSttiITyR3RsaLVznA+Ofs1l?=
 =?us-ascii?Q?mD719kQYCVBlDJ8yE2VNncYvf7rNMH2ESfPtSt1Uz9pAMFBVoA0500tN29pJ?=
 =?us-ascii?Q?p1rHRW+sDuDDK8BTbMwQHg0PWqicHaoT8YOSUBi9E69R1nrkLIvtCkI0+H81?=
 =?us-ascii?Q?kWwPBpfZ42D+jYOdYokaxrOMATYgCiJTWvfVCon4JI4KGLlnndtHuv8bf6lT?=
 =?us-ascii?Q?q6BUbRPmwjf1pVCRy87mlO6HBwuCkuiq8WhqTft4ZcZ7OLSQ3sZnzCHYI/z9?=
 =?us-ascii?Q?jVACT68AvKWIRrH2e1nWOrNMCvwvuAqAQjWo2NZlBDyMGuxTWflwLGxE0tIp?=
 =?us-ascii?Q?deZ5zYYl5iy5iwuoAWHj3+vlKHJN1WNh24XajaeBz/8BLvJeJGiCl/NARJrl?=
 =?us-ascii?Q?hOzFJrqPlGYubl8k5qjcn5w36EkK0xaHUiujyyLLhooKJs/ZsrP4zUo8h3S7?=
 =?us-ascii?Q?hOz5ckqC0vwEhmyKKtZsP2Ipa5hn8aCNgp1Tt9zYKwUioLQ08zCvG0n35Deu?=
 =?us-ascii?Q?8XXJI6jvxw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1205c56-2b76-4d3c-12d6-08df0ef55b9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 04:38:27.6293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OCSX7vVT2KmBeNFo/o9z+Bf/t77G4ZGvIvjwljxePhDmX/qST9atolu4rjOo2ybw+8HeOJx4gQTpWL3xHgYUeQOfx+4hNPUMhqs2Xg1g7Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2244

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Thursday, September 10, 2026 5:41 AM
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
>On Fri, Sep 04, 2026 at 03:46:32PM +0900, Nas Chung wrote:
>
>media: chips-media: wave6: Add trace and debugfs

I'll address this in v8.

>
>> Add debugfs entries and trace events to provide detailed
>> debugging information.
>
>Nit: need extra space line here.

OK.

>
>> These enhancements help diagnose issues and improve debugging
>
>Remove "These enhancements".

I'll remove it.

...

>
>> +
>> +#ifndef __WAVE6_VPU_DBG_H__
>> +#define __WAVE6_VPU_DBG_H__
>> +
>> +int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst);
>> +void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst);
>
>You add this patch 6. but call this funcation at patch 4.
>
>You need make sure each patch can build without break bisect.

You are right that patch 4 calls what patch 6 declares.

But the build does not break: wave6/Kconfig and wave6/Makefile are added in
patch 8, so nothing under wave6/ is compiled in patches 3-7. I built every
commit individually.

Thanks.
Nas.

>
>Frank
>
>> +
>> +#endif /* __WAVE6_VPU_DBG_H__ */
>> --
>> 2.31.1
>>
