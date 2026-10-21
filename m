Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792607909;
	b=vrYrqZWajCnVVbVLJJHnV94j9zCKUgI5ODzyKoN8OViyE/T71ZtF1FnrpRPuJN5NgYgf
	 hOgZUZ5ZhbcdyCmsnavrALr1JGihPFeXjvMtQFLRa0WC0Ro2iU0P5TYsW7YLzvJoYI06a
	 HQq8IQgRHqgvo4g4SIi9xQehME324J4PPEi4ByBiRXjg3b9W3YigrKELNk3DBWU3Qdqr8
	 h0/YvSjE5Fdz6prpT4pK4iYX3rQNX+1LjHVpNR+yJ2MSti/mYxqzowv+s4o5SGlrbh9Gv
	 j156IEGO2RCOlo/CRP5ZVuqATzX7LI7JAnrmPgkpZmcMpISS2r7y6kO5P2O8R+hPeAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607909;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=d0mzl982tjKwuvUBY7q8RYGynbhIaDHM2ZzaJkLZj7I=;
	b=Ly2CPIiUgDCRnath4miHgpHyuZ3ITl7DnbTcHAvqbWT39x+5hdc85PpdNpOkJ4o2Bsth
	 QSGyKAKv3yo/7rncU4HW8neTbmfL1l/uP8vRn1B6xy7vzphLS1JhyxGw5dT/MmLO46SDD
	 IHxAytxACaBpATxPzZPDGzj8pQCw+0wu2GalCT2wIlo48q0l44YxxUbOrha+59yqlwuog
	 Qi76wZMitjyA3sAEYnJ5/mpDY8VoFOKCIxsl+Qz6D7cncPH+LQxV+1Xh9XjGTNac1UisT
	 miYxpCWJzCdSNlXKsRqDILfOVXsuEhulz+uFyMfYnny7s7jgB0omwmLeRP6z+xCftXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pWMmQZnj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.53
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FAD606A31A;
	Wed, 21 Oct 2026 18:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9FAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pWMmQZnj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ehay+5JxvS8ql7zqlezGzUqTDYtATsWBxDBC6IDpM/SIhOTFr1JsHz9CeyG1di3O+GjKPci8BhYXd88prC4uGcKWpNJMzEY9Hlk7b0pZjXwMiecvSOaqsJ82SSL5VX1mB5Qm1Xk4NLk8ubIlUsVC7l/rMdFhmtmF2RcRU8kpdAilqj8PPbZRTkXAOI1KWA1WQ/cwrX6b8N2JXXYzIEOecTIeh6DRfxrUhZiIZf4rPSG3a0/VwOmtcxdgDi/0KX64F6TKznkIdi7BWMuUiO0ya26R4yTmR0TI5gbdL4xUOdEspCUuzh0c5ghJhI1dZGJrNSkhesNsfOL16e/sSDPung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0mzl982tjKwuvUBY7q8RYGynbhIaDHM2ZzaJkLZj7I=;
 b=Zk4boNeeAquKScWrH7A7EooltDM7x1Fd8CynrWuK8EQ2GV9bc7ewIEj2u0PT5vDZhQmmS4X+FWoIDONfPG25aC1Uk4oBStpbxlXgD7qduNHfa497X180SdOIDRR6AaOBa7JMGSbWdt7YN8nKEBMqsTLJ1IzHO4aHaxzhEGiDo2UEQftrwjCJuhpJ6Ts7GBPQUJL2Wkj5nU8JlLROGjQh2F/Q/C+ABzsXtS65wf78KtBtX7hSOL00KK4EVl1eSy+9bSi8lv1H3rp7O1G6SmL3zIrExKR8gEuH2GvrTavvLcyxOPWZJjdmPdnbq9wIux8FeqQYEsf9snSOsec4Qyd8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0mzl982tjKwuvUBY7q8RYGynbhIaDHM2ZzaJkLZj7I=;
 b=pWMmQZnjJvc1hnlZjrZJIG6WVW7CAyI4bQ8cvQwN/jkjkR20WLbSoDNpN72KGs413sWcR9dQikb7B+cDTDeW7CItDI1QbZcB6uddeuZePRXKf26af1pYAlveHYc+yXx5JRknkIEv8u3IA7N5tK7x7fjpGxWNJ6IVw7L2aArn+Mo5xH1e7PwnM+PCkcd6ml5XjTe1lnXCebyWGERkd1QTJ7p3axHWfIyb7PA32JhrLEmqfGGwSYLV+wUcSjQo6YwRIZ14Z6E52ilfUtsyfjGDBvC0sErs8IXl9l6MC0jTGNMLlZoc7uroB89cLZpjvAp+PMtWyx04Ve/3CHrYDEspiA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 18:38:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 18:38:24 +0000
Date: Wed, 21 Oct 2026 13:38:15 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ernest.vanhoecke@toradex.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <atkGl7o2Z2D2qIcP@SMW015318>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <t77enz5e4sywcigwdjwpes66jywhtsruzrtf7opde2umfuaock@3aouga4ng3gc>
 <atjShkhCdLzf921d@SMW015318>
 <7fhtj462lymwxqcaakvocw3cngvauksghxavv25mmfbjxtz3gr@b2r6lb2b2djn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fhtj462lymwxqcaakvocw3cngvauksghxavv25mmfbjxtz3gr@b2r6lb2b2djn>
X-ClientProxiedBy: CY5PR15CA0030.namprd15.prod.outlook.com
 (2603:10b6:930:14::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM7PR04MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ff57ff-81eb-4576-4af5-08df2fa27d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|1800799024|376014|6133799003|18002099003|10067099003|261021121427099003|3023799007|13003099007|22082099003|261021123027099003|4143699003|11063799006|261009223027099003|261009221227099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	utvzwuS3G0nEKq1AzuhBqSPQffMK8vxgpMcTbtPkz6rG+LyaYObh+wcRdAsbPbpbO4C9GkKdkTmMJK6JYUzkrF2+/9ActSHcQW550/15MX4dJJUiNMC/obmHDZ3yoqgxUziZV1JrdjW+0lGWsgd+fa+smduLuwBlwrbQYhrehkdQGONqXv60k7M5H6y1rWxPRvxHSIOIr2qoDr3xdiXnZT490PIsqWSXrjWlyamjSBtmbW+DGw0Ml2b5g5607lcnYuRXIDHKTZHb/mFGSRwGhbPFnXgxAJW6o/Y1tBayITUXLalW0qFs7HPsbox/er05ceLmlkr+CRLm1hwm8jv1nK3KbyCUb27mcHZTUq6xl6Squ/vloWbtrlR4nwjz/SqtNZbACfiN4GyatGwWo8saiGe+acR4rFHAWwlOG+gpdwynQRunYF/WZr8gX8//jZl0lIk3+zHfOVTwkJ4GlodRgZ2RL7JOqmKEoFJ8ifN9lTE8jdiTqO5m0ZR4qHC5bA93vVThksvSQSVlYDiV7XqjDqPYtGGTxSXBS4O83EpD2mZvYbpy2JJ5JDGy5BEPNg1ScKbVnbywb+cfcN3XFHTOc751MfLq/3CEA4WCkCav9wQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(1800799024)(376014)(6133799003)(18002099003)(10067099003)(261021121427099003)(3023799007)(13003099007)(22082099003)(261021123027099003)(4143699003)(11063799006)(261009223027099003)(261009221227099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?15MAQqdGoR9hEmc3uRqmUGw7VHsZ4Ox38B4Rtn/OobGkU0mFKfYybS9PqdAR?=
 =?us-ascii?Q?p5nXB4DEJy6p98jQydOkSPbVufggCaH9rhDOcc9edYZ241VIHVzMDOnf6JYT?=
 =?us-ascii?Q?KNp2vQ18ytU9Lkw9YPVKEXlPV1Cbg88E8Uh8St0KGFaUgqFpAhHDkDReCO0x?=
 =?us-ascii?Q?zbmeKY2rFz01XEZmlOkK/eaLMU8CG7QbfwD1VEdZMNb207/hRheTTc0Z6r+i?=
 =?us-ascii?Q?iEBDq6x8GHJ4mjgbKVXkdIDslgzMQIzyMX9gJcP831vcfffJypOk365NAtA5?=
 =?us-ascii?Q?uenLCjZ+X2QAqvBhahNNNN02JJOjteszw/gxacKDmG/vMrfjUmZZpTf6jSQw?=
 =?us-ascii?Q?QkKln5a+btxHifH0ra28JOEZlUQVFGE9I1kSwX939xVyNECjj+z1IgYmSnYU?=
 =?us-ascii?Q?f01CLqsT2IY0AYLZ5HXyjMbVmmZU2XJjGTlky8n6NDySum1nJUZAVJGQaJWH?=
 =?us-ascii?Q?Q/ny0m9bQ3SMcuKee4EaV5QQvOC4rxrbfP+O805rawwQknh417a/QNcxlvZB?=
 =?us-ascii?Q?D5nxp+lGv5xiAn0CUDPF0ZNQkEint7W9GZXyUHXApkzVqfDV8BaW1Obn/Y9S?=
 =?us-ascii?Q?sEbd9uqNgaYZYVS3DG+UOeyBnI8p6csRVS80F2cexEzc1+oOfhGiBywhexb8?=
 =?us-ascii?Q?3GUGVFWMU5aR7SXe5sLNlNzxf7rm1wX0CjRO+kpEsSjMPOSouqt1l0Jxq4ic?=
 =?us-ascii?Q?E/g06KjzP5Z3KUnwvp9j79dAVq6XOSk6gpvJQrqiCnUwtkSOlCmjDnauo5sM?=
 =?us-ascii?Q?PMcP6OQ4iDx9X4Gs+M/b9vKMobDrky0YpusjJnRxVW21Pmx1KcG82d3xgJbl?=
 =?us-ascii?Q?UTb8tQq7rcINlaxDuPuaePwfpgwURIHixGTEgqjvoaUSf7kWjmvV2lLmqNBR?=
 =?us-ascii?Q?Kbpa/+917Eiw4lpj5oMjN5vsCdq2KPXovDh0ROQtdFwOTqKsn8G5uEumP29b?=
 =?us-ascii?Q?aATpAy4uIz3HU5jrLgndwVTFEyV9gtFpaLswzwrAM2nRaBAzq3Kc+Ek6ldmH?=
 =?us-ascii?Q?BlX+RI8UAVy22OsYYPhyN5CUtb4iHsob+OCG1BWru9uN4iuS2HZaLMTxuA1E?=
 =?us-ascii?Q?CMsX32V38mzNSE8XBx0apzFoXphNyDZWxY7hBJ9WU4V4l2ay6oSZNp+iN+Oh?=
 =?us-ascii?Q?/gik9epxA9Ff7xHFtUfe+euf4hGibE91YoVCXm2jhjWtAAC1lWV2rX3eagZ+?=
 =?us-ascii?Q?P81KE2/tRmKq6zrnmkbh72szEhzEe5EeoGrXGbAblhDtQqMuHHXlSeco/9xA?=
 =?us-ascii?Q?TfB9i2eS2YK3ZqwSfimc+nC/apgPDzPf7G+nX+2gDo2OUnEkM8zucqTERMdS?=
 =?us-ascii?Q?bg7ylVBoMtdcXXqg8eRlsfTppbwo5Fn/G2doTaO4JNwddOe8o0pnBQ2C4sXM?=
 =?us-ascii?Q?lknHnn23vEwyxrgiYLGBGjtvyfBTItziNtTCE+Vi3OVuD9uTgLGF4s3TGteO?=
 =?us-ascii?Q?lRy8zl6nj1tzlQ7aqOcshUjdsGU0TDMaouj08AOyaItvkjz2Npu1nA0cl6q3?=
 =?us-ascii?Q?A3UJ6U0QnTJGEshgU4iqQFRcHvZB5CxYDUIIvXxNvq/5aLpycRc9ky4z1zTB?=
 =?us-ascii?Q?cEU47tROFe9boOnfVYcRBwVSJbE72L2bYx9X2nPxP9/dYdvCinfuYuJ2nNnC?=
 =?us-ascii?Q?W7g6aBYtNRTPvgPbawhlD8e1Gly5Bv2O9yAjyN+8ypok3Qtxj+J2muc8pYf9?=
 =?us-ascii?Q?OKIZyJ2tY08OGyVMN+jHarQ80Ol7ocuFH9WHvaIVQx0kjfPEQL9forMNCkRI?=
 =?us-ascii?Q?3qFNYrscfekbnvwDDsKNfXaMi9I9foRqJBCdwErU9G/h/DhD4ji8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ff57ff-81eb-4576-4af5-08df2fa27d42
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 18:38:24.4715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTwmAPNZ4WmN7kk33+yUsJ4jJb6DwAEVChsWPPgaShvZmfwaaj8NnO1whv9uI1zr1qSojAQWvH5bvg+OXKpXMy/Oet6LCNgsz+bGJtJQUhtxIRABtJMEHruy4bAbsc9g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918

On Wed, Oct 21, 2026 at 03:28:54PM -0300, Leonardo Costa wrote:
> Hi Frank,
>
> On Wed, Oct 21, 2026 at 09:56:06AM -0500, Frank Li wrote:
> > On Wed, Oct 21, 2026 at 07:39:36AM -0300, Leonardo Costa wrote:
> > > Hi Frank,
> > >
> > > On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> > > > On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > > > > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > > > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > >
> > > > > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > > > > by an ILITEK ILI251x capacitive touch controller.
> > > > > > >
> > > > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > > ---
> > > > > >
> > > > > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > > > > >
> > > > > > why not share one dtso?
> > > > > >
> > > > > > Frank
> > > > >
> > > > > Hi Frank,
> > > > >
> > > > > There are two main differences:
> > > > >
> > > > > 1. The mezzanine one uses different backlight controll pins, so here we
> > > > > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > > > > in the one without the mezzanine.
> > > > >
> > > > > 2. The touchscreen GPIO and interrupt pins are also different with the
> > > > > mezzanine board.
> > > >
> > > >
> > > > And there are for imx8mm
> > > > https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> > > >
> > > > https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> > > >
> > > > Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> > > > work on optimization solution.
> > > >
> > > > If use nexus connectors, we can share one dtso now if there are not
> > > > clock settings.
> > > >
> > > > clock patches is close to pick up
> > > > https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com/
> > > >
> > > > Frank
> > >
> > > We tried to make the change to have a single overlay for the boards with and
> > > without the Mezzanine. However, in the current state of nexus connectors, this
> > > can't be done cleanly yet. When trying to describe the hardware at the level it
> > > exists in, following DT guidelines, and using nexus connectors, we still need
> > > two separate overlays to enable the native LVDS with and without the Mezzanine,
> > > so we don't really reduce the maintenance effort.
> > >
> > > See the changes at the end of the email, this is the closest we got to a
> > > correct and clean implementation that would allow the usage of a single
> > > overlay.
> > >
> > > The root cause of the issue is that we need to claim pinctrl_i2s_2_d_in_gpio
> > > and pinctrl_i2s_2_sync_gpio for the touchscreen on the Mallow Carrier Board.
> > > Ideally, they would be defined in the nexus connector, as shown in the diff.
> > > However, after enabling the connectors in the overlay, the pinctrl groups
> > > remain unclaimed. The reason is that nexus connectors have no driver to claim
> > > the groups.
> > >
> > >     root@verdin-imx8mp-14777535:~# cat /sys/kernel/debug/pinctrl/30330000.pinctrl/pinmux-pins
> > >     ...
> > >     pin 112 (MX8MP_IOMUXC_SAI3_RXD): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > >     pin 113 (MX8MP_IOMUXC_SAI3_TXFS): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > >     ...
> > >
> > > There is nowhere else in the carrier dtsi's where the pinctrls belong.
> > >
> > > The pinctrl groups thus need to be added to the touchscreen node defined in the
> > > overlay. However, the pins on the Development Board (which uses the Mezzanine)
> > > are muxed by pinctrl_gpio2 and pinctrl_gpio3. These groups are in the SoM dtsi,
> > > and we cannot claim them in the overlay. Because of this, the Mezzanine needs
> > > a different overlay, which doesn't claim any pinctrl.
> >
> > I met similar problem, see below.
> >
> > >
> > > We like the idea of a single overlay for both carriers, but sadly the nexus
> > > connectors, as they currently are, are not ready to enable this. We therefore
> > > have to move forward normally and once connector support matures, we're happy
> > > to refactor this and try to reduce the amount of overlays for the Verdin iMX8MP
> > > and for other modules.
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > index 72a4f846d694..d73a7e9042ea 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > @@ -4,6 +4,41 @@
> > >   */
> > >
> > >  / {
> > > +	lvds_connector: lvds-mezzanine-connector {
> > > +		compatible = "toradex,lvds-connector";
> > > +		#gpio-cells = <2>;
> > > +		/* LVDS_BKL_EN_CON - Verdin GPIO 4 (SODIMM 212) */
> > > +		gpio-map = <0 0 &gpio1 6 0>;
> > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > +
> > > +		#pwm-cells = <3>;
> > > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > > +		pwm-map-mask = <0x0 0x0 0x0>;
> > > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > > +
> > > +		status = "disabled";
> > > +	};
> > > +
> > > +	touch_connector: touch-mezzanine-connector {
> > > +		compatible = "toradex,touch-connector";
> > > +		#gpio-cells = <2>;
> > > +		/* LVDS_TOUCH_RESET_CON# - Verdin GPIO_2 (SODIMM 208) */
> > > +		gpio-map = <0 0 &gpio1 1 0>;
> > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > +
> > > +		#address-cells = <0>;
> > > +		#interrupt-cells = <2>;
> > > +		/* LVDS_TOUCH_INT_CON# - Verdin GPIO_3 (SODIMM 210) */
> > > +		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio1 5 IRQ_TYPE_EDGE_FALLING>,
> > > +				<0 IRQ_TYPE_EDGE_RISING &gpio1 5 IRQ_TYPE_EDGE_RISING>;
> > > +		interrupt-map-mask = <0xffffffff 0xffffffff>;
> > > +
> > > +		status = "disabled";
> > > +	};
> > > +
> > >  	native-hdmi-connector {
> > >  		compatible = "hdmi-connector";
> > >  		label = "X37";
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > index 846b36706821..736f034c7550 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > @@ -11,6 +11,46 @@
> > >  #include <dt-bindings/leds/common.h>
> > >
> > >  / {
> > > +	lvds_connector: lvds-connector {
> > > +		compatible = "toradex,lvds-connector";
> > > +
> > > +		#gpio-cells = <2>;
> > > +		/* LVDS_BKL_EN_CON - Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
> > > +		gpio-map = <0 0 &gpio5 1 0>;
> > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > +
> > > +		#pwm-cells = <3>;
> > > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > > +		pwm-map-mask = <0x0 0x0 0x0>;
> > > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > > +
> > > +		status = "disabled";
> > > +	};
> > > +
> > > +	touch_connector: touch-connector {
> > > +		compatible = "toradex,touch-connector";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
> > > +			    <&pinctrl_i2s_2_sync_gpio>;
> >
> > Thank you try this method.  Can make a pre-defined label for it, such
> > such as touch_conn0_pinctrl_gpio0, touch_conn0_pinctrl_gpio1, ....
> >
> > So touch overlay use this label directly, like other port, i2c ...
> >
> > After nexus improve by support mapping pinctrl, only few line needs be
> > changes.
> >
> > The bad things is that it need define NULL pintctrl for i2c gpio expander.
> >
> > It is worth to try.
>
> Just to clarify, do you mean doing something like this in the Dev Board
> dtsi?
>
>     &iomuxc {
>         touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {
>             fsl,pins = <>;
>         };

In your board,
	fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;   /* SODIMM 48 */

If use i2c gpio expander, which have not pinctrl, you can try
	touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {};
Do you meet this case in your board design?

Frank

>
>         touch_conn0_pinctrl_gpio1: touchconn0gpio1grp {
>             fsl,pins = <>;
>         };
>     };
>
> This gives warnings in dtbs_check as it doesn't parse the pins array correctly:
>
>     arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio0grp:fsl,pins: True is not of type 'array'
>             from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml
>     arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio1grp:fsl,pins: True is not of type 'array'
>             from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml
>
> Is this what you really meant, or did I misunderstand?
>
> Leonardo
