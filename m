Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B34A0915;
	Tue,  1 Sep 2026 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289594; cv=fail; b=NV5RUWErOy62lnSg4HK/2lO/F/JQJFnZrgBgzynYvtO6J5s6opmJXEbgYOqvT4dipA0VcaneQcbJD9TZXTS2YHrOcPXbl5EAY0I4SBrGZCD1CXt07i1cX+hAp2Aa/xdRRDCpqqrC7DN8HWlEufLwEPSv7dNqtbHJSXLp49ih6VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289594; c=relaxed/simple;
	bh=u8vP8OelOx19iRC74G6Adk9lsyICFPbZUEUJxp694zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fo84enJ1JvIKj6VPsazoXlO2zP4DmT/5VX5jao4yb+b2la07JhxDvIz//NshCspvSiRt+IsiS8quDsB+PKyPx5+sTP1Nz57+97+GfIS/fBCFwjF+ULJVWHVJPa6nMmictm28hVAAJ1p45JxWqlFxvJNcAy/oQiUhffAdEEUZ8h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aDS4WGc6; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aDS4WGc6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsKz30viVBeZAyYNg6q5avprNJHNSkQpWJgj4sRWnzElmvQqTHgzSPhSGXKdXg0r3wxACHLIs9Aee5xmjMIDkjVoDFeo77VCF5SWv46XBXdUhkOw6uA/SVoOmfeV9jgFDbsLnnq4J26Q1zf6M4ZGIv4CiTyHjF0c9Qit8gAZdy6XMV3EwF1KwnUw1VmrikSYN52VBep3fk5Tc6r47yL3wuIDkQOwKlGDa8NPIvqyWF4AhSAco9o3YtDKySJwYzjBCScGV3mQfdwKTEyEHsRqvwrxbxPA0N5oMUVexMOR9D3NJ6EVJZSOU7b6k/wFWTtMa7aWohGBTWGXrI6pGmeshQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3ohV/9th35Ap85T0qAnrChZgSzTJSASAcsp0trPnrE=;
 b=xcQnw8O0tPyBlW2Wl4P0FGOoyWM80JUGUKHxFp+PuByRmcYGmIDhaTEpXb5KyXKhDunl7dmRlledz/57CoLyQVMcjEMZGYyp7cVGCrfdE4OgfG/9N2IygqfM/5CVCPyI7ODo4E9alsQTcVieSVEr34BZfiLw6E49y9/EFLMqHPY1yiDTfAwsMobLqYcU6OjcYGJ+bJgWwrJag1N6gwoPnfwqySanX9txq0QPbKYw4KPGjbGvT3fBp+lBiH8rGWV1aJPgf59w4WuOCutHv8FNyALTi3VlanWxchR6J9TCl1Lnpxr/AJenuj5lgu+42/xo9oTOcT4OwjMCbS6iENljDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3ohV/9th35Ap85T0qAnrChZgSzTJSASAcsp0trPnrE=;
 b=aDS4WGc6smZoOM362rlERzR/9igi6/Zb/MAPt35EqVFMLyzgqq8u1wlMfe/SzkrEWZmukhUSMFieB+ZvTYt6b7Y5BRoTzioZ4etLePIrq3InGtfzGQ6tkJA+qiB+1IngfyB7fAl518R+XRXz7fUcpCgKu3Q9lr9evuawxpfnhFSbS3cnYUyLYvWHcfczCc3W8jVw5RxuaLDW5iWIn+ksxNMgNMtNHILHcOeWI5isv2Fc1SQVU00RX0ecM9jKi3nxWvpIuiOR0AsSRpIO7OjS2ko8OcDOb5v+DnOg+C/DfmMsQbku030KXSww0P9lll9Qhv+6rNqYw04OmRgvxxZ0/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6919.eurprd04.prod.outlook.com (2603:10a6:20b:10e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 19:06:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 19:06:29 +0000
Date: Tue, 1 Sep 2026 14:06:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] media: imx8-isi: Enable ISI RAW10/12/14 output
 LSB alignment
Message-ID: <apciK7Wvl9GfN47j@SMW015318>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-6-fafdb4b446d4@oss.nxp.com>
 <apWfk3ZjVZl7SKnB@SMW015318>
 <AMBPR04MB3355238DA1504F1525BCC43843FAA82@AMBPR04MB335523.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AMBPR04MB3355238DA1504F1525BCC43843FAA82@AMBPR04MB335523.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH7PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:510:174::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fd72ed-daf9-451d-7bed-08df085c20c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|18002099003|22082099003|56012099006|3023799007|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	jt1PFjqpBQ3QBXk1F5tsdjZCLhEIkN0WxgcdTCMBrZ5facENQP3SODdT/59MnxMX2VYhKla+kAokEX1R4cAAt72uPN3af2qQMCivUDMpV9JnobYqv6j7k3hJHcmGcyzvYrLmvVAuTqMcIuFRRC6T/GEC1n7EJTUSTUM4rNbjycO1CT1WfFG8s0CaWqbAL7x09/4PLV1/JHqyZEmc9NR6tWcUIpAxYkQQj1N1DyqPjH+TV+qdXNoMemjKf9wsBCBfpHc9EvIT14cgtEKyxnNWBQR9rWwUezItllaJYScN4Nlh8CMNOasQSH48A54BNG6L5xxWxALKgLIyZxktui8VMU8mRBpB3I9NZORkBT9WDncc7GA1WIKGUEEFLHp4wHMY9KWnb7uiAi/83MWvBvqwrR7PJH3XFxwxTorLY2ZYqKobP6N+Omi6oENNn94tA7TU11r2Z8pEGMfMnI+mVARwbFA51E4S2bkmd5XSZSf3GSI9fb1Lfds6NGAZRRtwnfQtnq2KCWQ9jcQjf6JzIMdOFEKvQ3FcI7HrG71Q4hJtmZ3+eHjvCusveg2T5yQPQ5BZ+In8hbtgYtjAVR9c9G0heD0E6fKViaYardtAXSRMKgblOvKJA02pQ+OdK47wC0oiGwrIkdwWPJC/l+RJoM1Hm8TY4AfETVJeZFOgFsa6Iwc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BE9bYMXQdghz4mztC9cOriBPw81y6CLkSMB7LurcuhK5ymPIvFkMwIfzOAJJ?=
 =?us-ascii?Q?MrWIXLc0QE0oBwK/TU0Gj1UKDR1lqVNI8uPR2FGz3Qt/XFiJmB3hj86wNQNS?=
 =?us-ascii?Q?Q/1sTRiOcScAj/w48jSfbOm9iECAH4XPCE73W4EWuncYnoEMHh1/+xl3tEk1?=
 =?us-ascii?Q?/q7fC80DP7ozJAGXpvECdiB+8rx7DvvfyKY3C6fHJOhI286yrXIEIQENyRqn?=
 =?us-ascii?Q?TzIsl4qKGxV9RcIT10CrPPG1P6+/cB2wKo/ZoV+vQf5sFhXsv4auL758jYRY?=
 =?us-ascii?Q?2voxQKMgK5IG9NdJ6GnfmJoZM5Qx1K7Lj7zup4J33irqWw/oGXGKF3jVUYbq?=
 =?us-ascii?Q?1rfrBOunCG4/FOsWWMaj5aLIk5Az0NqHV7yllQqyvwIjoFYCWagqflCt/DN9?=
 =?us-ascii?Q?oUUAaW55mMS1Wk7e+NN6mF1TMLgXl90CO4eVljE4/+W4BOwwXR4bQgJSN1F+?=
 =?us-ascii?Q?YMQ45SREIHzku6Wm+qya59GTdJSouIvEptDutYZHYWTouCWErQpgnfOmEG1D?=
 =?us-ascii?Q?tsEO1+L2ArHTfyxY3M6YYnGDcWqXBJ/7pX12CCfKhhxIPZF5GX3bJYv24I9m?=
 =?us-ascii?Q?CKRk7IcOo0OtpbLgJMRER+Qu8urzEV+LXNSxV+b/CJ6Qw3aLmJDiyskr3lTc?=
 =?us-ascii?Q?nkOr8DkCSTaOQELqdrsjcZeyVW3O9XxFtNlbvQZjMyVfIHXWjiMxbv93miyb?=
 =?us-ascii?Q?wmeVXhwDhoeEiMg0OsUWKZCdkGdE130sdiiQFL0bHnlq3qCEoPLuLSG8ctdz?=
 =?us-ascii?Q?iCavyNllvfhYcB7Wh7iapbq1xcHsNgMDWF/rI2L8vKd56Vrwsx3r/Rk7Wchm?=
 =?us-ascii?Q?CBPz15MHq3EDOMoeWCVN8w4VkqCr4CvekCCI4VHcY0MJMGcEQOqVKifYKRjy?=
 =?us-ascii?Q?O4n4I/kNQJyZJhmeeX5C+MhqUxvNmZ1liejDcKFI6wLh2b3do5ahIgh59ebp?=
 =?us-ascii?Q?RF0C5oDjP4PyD6v6zsWl2kXs6gHs/JCKgVwtno27SyhwWR5WlcxO5JhKihnI?=
 =?us-ascii?Q?4lNdFRVVwIVXku1fRwzOIuQI0pT7Oi0lV2m/kBw83pYWvdsBVC6fXA2YoG1G?=
 =?us-ascii?Q?LRLzPC6LbzUs6kMYIoMZI8xAwEI/MmYLJNa3Vw39REHOywzTZo5aoVG5S9Y7?=
 =?us-ascii?Q?E8GndQCoJDArS2E/punGElIiQd0OUxqvjwEOOAQEmSrhxMAV47/a56BCIsu0?=
 =?us-ascii?Q?ztgKUdlIOVxgzaoYZbDkrFIXa/ytO2RY/MnLluPzIx5HabqsI11S/4wkv7Nh?=
 =?us-ascii?Q?PQ4Lqu6ySXQVhOTCQjQxy/Boj3sxEmNQ+AMrcDugL8O7cobONppvvOzsGZnt?=
 =?us-ascii?Q?Lpcxkq+prfdYMV1Li50K43sp7sbj6x2915CLQ4wLpShK+8Kv7ZiMqxy9iqiX?=
 =?us-ascii?Q?qQFJDVotAKOz9zcS7/KX2mMjhcbBd+q7YJaARHl3kL6Te0xfbRGM7Tary38b?=
 =?us-ascii?Q?oFvPw3L38XNZaYb38/6t6WC5QAlov3QUJSzd6w4GSSpI4ca0MDjIOsBf18qA?=
 =?us-ascii?Q?dTYzqlSJ4ZsPNe1otYFtCQSdU+s3+AQKIR5PzA/y+sg5CMtpv+6UYclIYkEQ?=
 =?us-ascii?Q?aBObiEm0GGDw4Y7k29bMBDNC8bvEI2NUJRPhQAikZnq4LF7tK5Pe3TZ4aduX?=
 =?us-ascii?Q?NxURFnBRpciDxmjdQMsjueIqWLeagp0mI7Sa+dVWyDDYV5Tme7K6htAKCwPa?=
 =?us-ascii?Q?vx0M/laxWpi2ss4hkilbt9qVH/TOncv44XoRpQv4/A354kjP9fdScQgxcUXo?=
 =?us-ascii?Q?+QrsMQUB1PHmfGCyEngvjSZpGoRfs+BnrMrjKXj8DKL86SBBmZLB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fd72ed-daf9-451d-7bed-08df085c20c7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 19:06:29.3270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UiNLIfbQRqtnQt+e0oA4hwbh51CZwl6d/kc54NTYdxqy3//+qR2Yoct4a3VxbYi6J0EwnzwcgxayJxZZ2r9ILq1L5SuQFBn10iBb//+Yuaqr5xQISw5o4gUNXqvn5dMi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6919

On Tue, Sep 01, 2026 at 06:16:36AM +0000, G.N. Zhou (OSS) wrote:
> Hi Frank,
>
> Thanks for your review.
>
>
> NXP Confidential
> > -----Original Message-----
> > From: Frank Li (OSS) <frank.li@oss.nxp.com>
> > Sent: Monday, August 31, 2026 11:37 PM
> > To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Frank Li
> > <frank.li@nxp.com>; Mauro Carvalho Chehab <mchehab@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Rob
> > Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; Loic Poulain
> > <loic.poulain@oss.qualcomm.com>; linux-media@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: Re: [PATCH v2 6/6] media: imx8-isi: Enable ISI RAW10/12/14 output
> > LSB alignment
> >
> > On Mon, Aug 31, 2026 at 11:37:01AM +0800, Guoniu Zhou wrote:
> > > V4L2 requires RAW formats to be LSB-aligned (right-aligned). Before
> > > i.MX952, the ISI shifts RAW10/12/14 output left to MSB, so the driver
> > > works around this by using RAW16 format instead.
> > >
> > > The i.MX952 ISI introduces a RAW output LSB alignment bit. Enable it
> > > along with the input MSB alignment on platforms that support this
> > > feature, so that RAW10/12/14 output formats can be used directly
> > > without the RAW16 workaround.
> > >
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > > ---
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  1 +
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 39
> > ++++++++++++++++++++-
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  3 ++
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 +++++++++++----------
> > -
> > >  5 files changed, 63 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > index d492631dfb6d..0f776fc8fd7e 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > @@ -394,6 +394,7 @@ static const struct mxc_isi_plat_data
> > mxc_imx952_data = {
> > >     .format_mask            = GENMASK(30, 24),
> > >     .buf_active_reverse     = true,
> > >     .has_36bit_dma          = true,
> > > +   .raw_out_lsb            = true,
> >
> > Sorry, I may miss this change before, if it is difference with imx95, needn't
> > fallback to imx95. You just mention what's difference at binding doc.
>
> I think the fallback to imx95 can still be retained for imx952. Although there is
> a raw_out_lsb difference, RAW10/12/14 will still work through the RAW16 path
> when this feature is not enabled, so the behavior remains compatible with imx95.
>
> Therefore, I believe the fallback is still valid, while the raw_out_lsb difference can
> be documented in the binding description.

Okay, make sense

Frank
>
> Best Regards
> G.N Zhou
>
> >
> > Frank
> >
> > >  };
> > >
> > >  /*
> > > ----------------------------------------------------------------------
> > > ------- diff --git
> > > a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > index 73f6ea7b0ea1..c352bcf8dc47 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > @@ -166,6 +166,7 @@ struct mxc_isi_plat_data {
> > >     u32 format_mask;
> > >     bool buf_active_reverse;
> > >     bool has_36bit_dma;
> > > +   bool raw_out_lsb;
> > >  };
> > >
> > >  struct mxc_isi_dma_buffer {
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > index 2405f7d33d0a..4838b445f279 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > @@ -308,6 +308,7 @@ static void mxc_isi_channel_set_control(struct
> > mxc_isi_pipe *pipe,
> > >                                     unsigned int vc,
> > >                                     bool bypass)
> > >  {
> > > +   const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
> > >     u32 val;
> > >
> > >     mutex_lock(&pipe->lock);
> > > @@ -357,6 +358,20 @@ static void mxc_isi_channel_set_control(struct
> > mxc_isi_pipe *pipe,
> > >                     val |= CHNL_CTRL_VC_ID_1(vc >> 2);
> > >     }
> > >
> > > +   if (pdata->raw_out_lsb) {
> > > +           /*
> > > +            * Enable RAW10/12/14 output LSB alignment to match the
> > > +            * V4L2 requirement that RAW formats are LSB-aligned.
> > > +            */
> > > +           val |= CHNL_CTRL_RAW_OUT_LSB_ALIGN;
> > > +
> > > +           /*
> > > +            * Align the data selection from pixel link to MSB to
> > > +            * avoid data shift since the data from PL is MSB.
> > > +            */
> > > +           val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
> > > +   }
> > > +
> > >     mxc_isi_write(pipe, CHNL_CTRL, val);
> > >
> > >     mutex_unlock(&pipe->lock);
> > > @@ -406,11 +421,19 @@ void mxc_isi_channel_set_input_format(struct
> > mxc_isi_pipe *pipe,
> > >                   CHNL_IN_BUF_PITCH_LINE_PITCH(bpl));
> > >  }
> > >
> > > +static bool isi_out_raw(u32 format)
> > > +{
> > > +   return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
> > > +          format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
> > > +          format == CHNL_IMG_CTRL_FORMAT_RAW14; }
> > > +
> > >  void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
> > >                                    const struct mxc_isi_format_info *info,
> > >                                    struct v4l2_pix_format_mplane *format)  {
> > >     const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
> > > +   u32 fmt;
> > >     u32 val;
> > >
> > >     /* set outbuf format */
> > > @@ -418,7 +441,21 @@ void mxc_isi_channel_set_output_format(struct
> > > mxc_isi_pipe *pipe,
> > >
> > >     val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
> > >     val &= ~pdata->format_mask;
> > > -   val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
> > > +
> > > +   /*
> > > +    * Before i.MX952, the ISI shifts the 10/12/14-bit formats left
> > > +    * by 6, 4 and 2 bits when using
> > CHNL_IMG_CTRL_FORMAT_RAW10/12/14
> > > +    * respectively, to align the bits to the left and pad with zeros in
> > > +    * the LSBs. The corresponding V4L2 formats are however right-aligned,
> > > +    * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left
> > shift.
> > > +    * After i.MX952, ISI add RAW10/12/14 LSB output alignment, so skip
> > > +    * the above workaround.
> > > +    */
> > > +   fmt = !pdata->raw_out_lsb && isi_out_raw(info->isi_out_format) ?
> > > +         CHNL_IMG_CTRL_FORMAT_RAW16 :
> > > +         info->isi_out_format;
> > > +
> > > +   val |= CHNL_IMG_CTRL_FORMAT(fmt);
> > >     mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
> > >
> > >     /* line pitch */
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > index 35dec3a650ac..c9c22a3668f9 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > @@ -20,6 +20,8 @@
> > >  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN                               0
> > >  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN                                1
> > >  #define CHNL_CTRL_SW_RST                                   BIT(24)
> > > +#define CHNL_CTRL_RAW_OUT_LSB_ALIGN
> >       BIT(23) /* i.MX952 only */
> > > +#define CHNL_CTRL_RAW_IN_MSB_ALIGN
> >       BIT(22) /* i.MX{91,93,95,952} only */
> > >  /*
> > >   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
> > >   * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
> > @@
> > > -88,6 +90,7 @@
> > >  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P                  0x3a
> > >  #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12                   0x3d
> > >  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12                   0x3e
> > > +#define CHNL_IMG_CTRL_FORMAT_RAW14                         0x41
> >       /* i.MX{8ULP,91,93,95,952} only */
> > >  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)                             ((n) <<
> > 16)
> > >  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK
> >       GENMASK(23, 16)
> > >  #define CHNL_IMG_CTRL_GBL_ALPHA_EN
> >       BIT(15)
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > index f45c2aae59ce..9a6a8302774c 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > @@ -221,11 +221,11 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >     /*
> > >      * RAW formats
> > >      *
> > > -    * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
> > > -    * when using CHNL_IMG_CTRL_FORMAT_RAW10 or
> > MXC_ISI_OUT_FMT_RAW12
> > > -    * respectively, to align the bits to the left and pad with zeros in
> > > -    * the LSBs. The corresponding V4L2 formats are however right-aligned,
> > > -    * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left
> > shift.
> > > +    * The format entries use the native RAW10/12/14 ISI format codes.
> > > +    * On platforms without hardware LSB alignment, the driver
> > > +    * substitutes RAW16 at runtime in
> > > +    * mxc_isi_channel_set_output_format() to avoid the left shift
> > > +    * that the ISI applies to RAW10/12/14 output.
> > >      */
> > >     {
> > >             .mbus_code      = MEDIA_BUS_FMT_Y8_1X8,
> > > @@ -240,7 +240,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_Y10_1X10,
> > >             .fourcc         = V4L2_PIX_FMT_Y10,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -249,7 +249,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_Y12_1X12,
> > >             .fourcc         = V4L2_PIX_FMT_Y12,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -258,7 +258,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_Y14_1X14,
> > >             .fourcc         = V4L2_PIX_FMT_Y14,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -312,7 +312,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SBGGR10_1X10,
> > >             .fourcc         = V4L2_PIX_FMT_SBGGR10,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -321,7 +321,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SGBRG10_1X10,
> > >             .fourcc         = V4L2_PIX_FMT_SGBRG10,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -330,7 +330,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SGRBG10_1X10,
> > >             .fourcc         = V4L2_PIX_FMT_SGRBG10,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -339,7 +339,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SRGGB10_1X10,
> > >             .fourcc         = V4L2_PIX_FMT_SRGGB10,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -348,7 +348,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SBGGR12_1X12,
> > >             .fourcc         = V4L2_PIX_FMT_SBGGR12,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -357,7 +357,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SGBRG12_1X12,
> > >             .fourcc         = V4L2_PIX_FMT_SGBRG12,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -366,7 +366,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SGRBG12_1X12,
> > >             .fourcc         = V4L2_PIX_FMT_SGRBG12,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -375,7 +375,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SRGGB12_1X12,
> > >             .fourcc         = V4L2_PIX_FMT_SRGGB12,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -384,7 +384,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SBGGR14_1X14,
> > >             .fourcc         = V4L2_PIX_FMT_SBGGR14,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -393,7 +393,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SGBRG14_1X14,
> > >             .fourcc         = V4L2_PIX_FMT_SGBRG14,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -402,7 +402,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SGRBG14_1X14,
> > >             .fourcc         = V4L2_PIX_FMT_SGRBG14,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > > @@ -411,7 +411,7 @@ static const struct mxc_isi_format_info
> > mxc_isi_formats[] = {
> > >             .mbus_code      = MEDIA_BUS_FMT_SRGGB14_1X14,
> > >             .fourcc         = V4L2_PIX_FMT_SRGGB14,
> > >             .type           = MXC_ISI_VIDEO_CAP,
> > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > >             .mem_planes     = 1,
> > >             .color_planes   = 1,
> > >             .depth          = { 16 },
> > >
> > > --
> > > 2.34.1
> > >
> > >
