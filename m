Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021142.outbound.protection.outlook.com [40.107.42.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38D6439F88;
	Fri, 11 Sep 2026 07:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110788; cv=fail; b=YLU7A2ymyN3jtDfGyIEd+FW/35eZBNg6XhgCzVDS+jezPg8Jlhajdii07T9GkH51f97VZH2dmUftnHqYO79koQbAMDBU54DMk/kMz9eMBJ990sWr9omauwNvzsmnAWDDWnIJmKa0Xb23TF4/vyILZ86x70faaECyNLWCvTOFJR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110788; c=relaxed/simple;
	bh=wo3+Sz/a4zI/41HfQx4ccSVhFYh08myKjwA5r+a2lPA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q78KVYlclMcr6TzFx60lxaWK9xlylI/320gV6q2fUvgVqWrkCdo2jIMs9YalMs4upDOMMuYvX1qAKsavzAw9+Uoyx0mL+85SikhbdhuXHDQi9ay+wgduBveTF9NMxQ/PL9fIfg6gkFdSH0YeWHDP+fjNJO7nxaErABtTsr2gXpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Wdmm2mn/; arc=fail smtp.client-ip=40.107.42.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Wdmm2mn/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ex28kG01MOBxw2N3RLWxlfSUxeNhM5Kq5uwcKE/TrRkell5IORckefcxBzQbWThLySpNlCOuQ4mbC0QSU9OF7ClOZUrx8gOTziz0Az9uxBt7VCE4Qa+7ymtQ+/xqUOfQX048w8n4rQosSWJXCMl9xHtgdugc7TztDBusm+DmpNGmbvgSydnIAs8pErpqZWrX/3DkzXwC1ETt8VIzoIVH3w2xuOWJsNLN0ZW2lODHDW7qvltk8i4TLVKX3Xp0DtoUx7pW5UGxb6ctC5jucSN+7H0LF2QOqJU0CdzEN04mjnWnXObZr0vlHinhGfv3QokH/wC3MkHa0JbS3R2/Hbaqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD3IwDeIa7ZWgHgdKhRtP79BuYS8TFtZzN9ID+SuYhs=;
 b=mN9y5niwDSaOFC15Y7AePWmObnIdS0R2WO5YCJmgRoeKnp9rIULFeBrmnsuwGRDHoJoAd3qOeBS3A0vW1+GBOLNpV6WeKo9aWSGArgDlyqxfeMEa0D/Kh5/JOUrThE6cHIalOYWiUbulHU9kkhW+AO6E5ZlV9npmy3Zl6mW1JgR52Aeym6Ni8EtGZjjoTuQ61YSo6Y433iWqxSqmwg8eOiRG3rcJ7nrdTFV0S1tB/jactWEVsUnzYHOdpaYQHNdqwRL14+GdYdtGynvFlIbFAnIdrnCf1vP8fWJ9TR0OcIHp2AWDzm2dK2UVeg6MsWaYWw95RulZtZhz0TUIzp09iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD3IwDeIa7ZWgHgdKhRtP79BuYS8TFtZzN9ID+SuYhs=;
 b=Wdmm2mn/lU5jokBBbnELK9fXo6jbc47pMQFNwaSgwvAay7r8hd8HyUb/rL858NqoswGgWWt2UuEn1elzIfv4EsOEqHetgOH0mlbqXku5gmw1e/qwEkPPQSwByNQd80KQy5qwzS7zDuWcI173x8R9N6+1+3oA5nXLgNfK1AZTnCev0OogQh8t7Vd7ynZbAGAeKGt008lhSFLgrHynoSeJig6Q+VpxpbeiUgYPzc/pjPXA4Eb4XmBXSYvUHHW6n0zLQmvzVu5KhhEDGW4rdlZ2Mg1ZHoRBKBFdvjdAB2fbXKsHmxoT8c/bkiO4MSBz/XQ2+ihLNA4VR7Fx+TrIo3CyOA==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PUVP216MB3167.KORP216.PROD.OUTLOOK.COM (2603:1096:301:166::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:12:55 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 07:12:55 +0000
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
Subject: RE: [PATCH v7 4/9] media: chips-media: wave6: Add v4l2 m2m driver
 support
Thread-Topic: [PATCH v7 4/9] media: chips-media: wave6: Add v4l2 m2m driver
 support
Thread-Index: AQHdPDkrjk2iA0sgzkOrELQLBuPd97bIT+2AgACxb0A=
Date: Fri, 11 Sep 2026 07:12:55 +0000
Message-ID:
 <SL2P216MB2441006B30EE93188E94FB7AFBBE2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <235b2de7057182d619a361dffc247f1c1f438a3c.1788496816.git.nas.chung@chipsnmedia.com>
 <aqMVBbzCnEsxx54Y@lizhi-Precision-Tower-5810>
In-Reply-To: <aqMVBbzCnEsxx54Y@lizhi-Precision-Tower-5810>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PUVP216MB3167:EE_
x-ms-office365-filtering-correlation-id: 596e7f8e-4d0b-4578-a4bb-08df0fd41a27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|38070700021|3023799007|10067099003|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 9a3fJlBTy7zwqRCDz/NoAYMwEv+7K36ONRfBZFWUcBu+arbI9ehIO1m1WWRnqijYlK/8Q9WFCJGIqTvMgF1Jnj366rJK5Z74BkGFM2ShUyt/59EdP6FqMiIa/hAbnpRgNUp6tz/bCh/jI8m3H+DQcQs0pidH6ynsv5Bwtppmn7TAHiCBl/XaaR0A+ee8Q7L5VXZrBCXf/4QYvZUQktiD4b2nAuA9ZVzRNXsaGVDGgN51LBUVv88mA1pM1e1EsQ0eGQeVT19sRYFZJV/EiKazHyL9Q7aswK16z7ujphVWEhularwxaLkoXX/PxyZGH+t6Q2R4yjBA1EeEH2EL1HDwdJZoVYl6cZaAktOoIJBzvnlHSkLlcBusiFukagaH6m2ytDLWnIN4zarvZSEFjgYhgF9Y6p4rDr/WZ+UjVX6WuNb3fgS76dMxG3k5YJqLanVshpCkgGATHN0pZkB7TDYBh678lRoJ9ob2HvBPrCgp9pEJ1UI8GYF/XhLW1bVyBmCA593S4RxVJ7KLrJiPqr56pd097wKc5BQxOnxBmDbYwoB9VSel4zTcARAcQxNGN2bix8gR0ZnfD0RvZMrd2qe4pLNnC0R1zP3K728iF6zoYNkASxLc289QhGCqzFDSoKdyV01gSuUOQpGVkRPqh/6tfScZ+7kVgfOBvGbf44BBvhIlernEExm0hCatUOs7fvliACju9gYkuqOaXcFEYr/X660mvQiSkjx2yCQ8HZbHNCw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(38070700021)(3023799007)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?reiZhJnJIqxBx+2xsIJwBREu/jB8xirRWimx+vaGtmaRQXWuS04wJ5ABRTsl?=
 =?us-ascii?Q?8csJ2yzH7iI5uxW5iSKb5RPAvxwu3qr9Nno7NBQ+w8X+gB/hpOT5Y+6is0Kx?=
 =?us-ascii?Q?+ANLegsf/vADXixzLaq7w9Jzy6Z2jPcXwc7OojrvFN/nPEJiMf8hpTlqMUP+?=
 =?us-ascii?Q?LMTFjL5s6qOxhvtU/ws5hvLiJM5U9Dv8TxseszxdxJTBLz6CNNPubM5WNH5B?=
 =?us-ascii?Q?aFmpnW/jySyo1Bqgxkv+Z9AIo9rcFQ8NB6kVjZDDc3uaA/aode+DkhnTey0k?=
 =?us-ascii?Q?i/DOGhWXmApso7pVJo1h+LnRlytDgWn6C+AyKsIzIlKJ++xKo+xZqHu+wg4E?=
 =?us-ascii?Q?NMwffNZNtOkdDR+AyZiYMVFdmktkda0NDKHQbhW8KmLPh3XYguYskNIkaIXz?=
 =?us-ascii?Q?Cqt1tgl6w1YFQn78GUn0CCTgagIryE6PslnfgCzSjdqPdB0F1vuwf/92QlWD?=
 =?us-ascii?Q?On/ubJ49vT+Wq5kJV/ajupZWV+LGmHLMG0/k3cMLP+O1Y2EaDrGhZpa7KQvr?=
 =?us-ascii?Q?g4eNcOoSAVlZVS+zeM7Ev5yM9uRNaTK0kkYluEpEvC1DjWCXrnw89R1zfnUM?=
 =?us-ascii?Q?Z2JocIoVt/Il13hbqus/S5WkoDnoym50Wk7z0Fh/xAHqtrhJLUhg8tuYfF9+?=
 =?us-ascii?Q?jEgREGWTzauBJbf7lqrQY3AXcLN4AvKu+E52HFMhcjEgSll5kq4rAkFz/DIi?=
 =?us-ascii?Q?4KxNVjohlCOIBB5/4VVrGuy+366t78Ku7t3fLJ9bYpU8eOmLHLgUpo7Pkf2B?=
 =?us-ascii?Q?Vguvn2UWIYe8Mdk1oq9RknGjm7CGi3bvaDq2AjB3yjByDCELISLI17z7f4hx?=
 =?us-ascii?Q?M0Fe0rCc3W4K8EnmYPIi+tbjJKmGq32jVxnD8WAZZqMRiJmgANfYdgjHRU9Y?=
 =?us-ascii?Q?ww2JMcc8O5tu/j5X184CsTrrLah/5HBoFPo2HPJmatMZCL6AcJwwBfdLNa3t?=
 =?us-ascii?Q?7gvW+kRbXwgJCFHXvRkkTKlO/0p1QLtt8L1trVKYJFoib0kPzvvfWwHtfijm?=
 =?us-ascii?Q?sQPwbWqvwsGvkqqw6wQZvf14+uQ7WtB0y0+bQfDWqIiDo6BsKTqtZqBWjvN3?=
 =?us-ascii?Q?BUygJqH0LcIw84Nvwz9UnyV2ysTM7JLnKq+GB/Y+39EQIMWPUohBy6f2IYpv?=
 =?us-ascii?Q?8c9YNeD9oewvIsaueo6A+1gg2HEUkP8dIBtVKwfR7hJAFnSRp+oxQfPWsrWi?=
 =?us-ascii?Q?q0GicCAJKvy7v/gaNaVlCuPfyY8ilWBmFLt76xzgxwwRnrCLunKmJTZ29Ew+?=
 =?us-ascii?Q?/bdjhlGXz8ajsyo8f8nzfJhFfHgq8iEDQLZI78pVe+hc6fcoxunZ0TUp0FHI?=
 =?us-ascii?Q?bHgQiO59pmahGPlETH8B5b/lBUMM3gyhZbpVIp4IXDvTYGVadwjregdPFwvS?=
 =?us-ascii?Q?DOWk6y6kWirqIZcsoYRx+q4MSpPZ3mH/9EVLNoaKmIbZ3QmX9j14GpymsJDM?=
 =?us-ascii?Q?JD2nk+c6qqmRgtiv1KsAvfxjZlBndbPnUK56RL8GCa680xkrAqnbfJhJqcqK?=
 =?us-ascii?Q?w8rojXbyd7JWZLla0rRYBBM93Cr3KROqJGVTPYbYQS6/yTCabvXiQ7OeKhnM?=
 =?us-ascii?Q?cQB66ORtOGxty6FR5kue2t41IvT1BB9l3B68XZvcJrvVxCkmMijSoMcMmEoq?=
 =?us-ascii?Q?LKsSIKqoepIJ6erBPBHg8IxF/fyyQF9uPgBnLg2rym+ng3uibQeNfFV99JKk?=
 =?us-ascii?Q?6byxSMaeCHgA9ocwNkU1Rr96hzLZHE4kfhmJ2s5qbZ1hsFPz5qEP8gOL6qZ9?=
 =?us-ascii?Q?9jjnZiSHLw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 596e7f8e-4d0b-4578-a4bb-08df0fd41a27
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 07:12:55.6035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZFZmf0JZmZNcet+7urFEzZ9Xs0/mTXuDKvhu+vGTrDFkD76Jmb9EG8GrG/2STdNVuGKZAX1NS6sGBJvLNBymnxkRgqhXh8q8UbsbERq5E5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUVP216MB3167

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, September 11, 2026 5:37 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>linux-arm-kernel@lists.infradead.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>marek.vasut@mailbox.org; Ming Qian <ming.qian@oss.nxp.com>
>Subject: Re: [PATCH v7 4/9] media: chips-media: wave6: Add v4l2 m2m driver
>support
>
>On Fri, Sep 04, 2026 at 03:46:30PM +0900, Nas Chung wrote:
>> Add v4l2 m2m stateful driver support for the
>> Chips&Media Wave6 video codec IP, including both encoder and decoder.
>>
>> The following features and formats are supported:
>> Encoder (8bit only):
>> - Supported codecs: AVC, HEVC
>> - Supported input formats:
>>   * V4L2_PIX_FMT_YUV420/NV12/NV21
>>   * V4L2_PIX_FMT_YUV422P/NV16/NV61
>>   * V4L2_PIX_FMT_YUYV
>>   * V4L2_PIX_FMT_YUV24/NV24/NV42
>>   * V4L2_PIX_FMT_RGB24
>>   * V4L2_PIX_FMT_P010
>>   * V4L2_PIX_FMT_ARGB32
>>   * V4L2_PIX_FMT_RGBA32
>>   * V4L2_PIX_FMT_XRGB32
>>   * V4L2_PIX_FMT_ARGB2101010
>> - Supports multiplanar format
>> - Although 10-bit input formats are supported (e.g., P010, ARGB2101010),
>>   encoded output is limited to 8-bit streams
>> - Supports crop
>> - Supports extensive v4l2 encoder control
>>
>> Decoder (8bit only):
>> - Supported codecs: AVC, HEVC (8bit only)
>> - Supported output formats: V4L2_PIX_FMT_YUV420/NV12/NV21
>> - Supports multiplanar format
>> - Supports scale down
>> - Supports dynamic resolution change
>>
>> Note: While other versions of the Wave6 IP may support VP9 decoding and
>> AV1 decoding and encoding those formats are not implemented or validated
>> in this driver at this time.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>...
>> +
>> +u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle)
>> +{
>> +	unsigned long rate;
>> +
>> +	if (!core->num_clks || !core->clks)
>> +		return 0;
>> +
>> +	rate =3D clk_get_rate(core->clks[0].clk);
>> +	if (!rate)
>> +		return 0;
>> +
>> +	return (cycle * NSEC_PER_SEC) / rate;
>
>div_u64, otherwise 32bit compiler build failure.

I'll fix this in v8.

Thanks.
Nas.

>
>Frank
>> +}
>> +
>> +int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int
>timeout)
>> +{
>> +	int ret;
>> +
>> +	ret =3D wait_for_completion_timeout(&inst->irq_done,
>> +					  msecs_to_jiffies(timeout));
>> +	if (!ret)
>> +		return -ETIMEDOUT;
>> +
>> +	reinit_completion(&inst->irq_done);
>> +
>> +	return 0;
>> +}
>> +
