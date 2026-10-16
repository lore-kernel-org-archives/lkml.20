Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87212447231;
	Fri, 16 Oct 2026 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182071; cv=fail; b=PRdO4DMWz2+cq9QRxSd1UI5xjT3dc8wpBDLpM8oUoZp8aZ1JCh6HF5FIqrntoP+h/WEosudI2BfwK0j6qmg4YTuplsLTzTcZCVr1GkZ90UHqNGmz1IXTYJA+xHn24iK+6MSPXL8OmKpgteWufsK5jDZEjA7I31w24qr3fyJVMpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182071; c=relaxed/simple;
	bh=e5yIddnKvv7dJjypHq50zSIGrUuqSm80icRFFBP+pE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e8wH3BbJ+73DUzuafUUb8M6EEwiSwY63VKMjz4FHoFujW4oPwcdltA7eJY3h25z+vKTR7CeOiFf7RYoYmHoV8+Iqck8rzGImlMk7mCodRqpLrNeS8wuqwTcvKcxrz2WyJMOck2o96+EVl/SzjAizRwK3U0IbO8BraR1eCQ+OtKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lujio3i3; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lujio3i3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emkjPR8Wmm8QGFzsCsl6z4QrNIDHtIXQRvBfvb0dakP3YZJhTPmXJ5aHSzz59cjeKd/94PArAQ3EHijOyz+E04i0fVPsx6LkgjC1HdtZ+s6Jb5bMk5FKV4x7f11EHfMHZShm2iQTF6Fjsd31fO//7sV6qrDVfPuFdTWFtTCR3GuOmY5WhBRj0sUEDbjL29SBaVFUf6s+W8bN1f2srE4FuW7rM2meR5qLAfrT2zR8+ATBfE0QxcZY3nJyD9MkPTYngt1R1ZMQKX1PCNuoFmwZhLUhnf57LXwATV8UNbpxSCQbfAa7CFMco/h2H5zC2K9T9C23VoYDqSZuQu5M8Qjuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUQ1eIKJh9vjo/ubvkwTOKMV1/Rtoeos3EcYTT5lJ9A=;
 b=RONF7U+Jk2NjAAjrc9qbOSgrZ07D8n/UCg1q42S4cVcGzh3ZunEhaT6fQh4YREcw+SRPdnZ9KsGjRH1J/wHhE+jvp4Cwvkttf5vfUu7DRx+Ngm5EgpiJPjo2KLDQtPqXm6/BZLuexM65rKryqmb2cneONtSFi+I2V4cjBt8DAbNGd32MUKdPT6dWztbEV4gB6sHjIOcYmwOUq9/8woR+rRLEyu8IdJbatKL3PoiCYtQdMJhKOZx+c780vIKHT7CurvnXtcdpC8ZiHidRFWmOjFxvp0SqFaNfPsGVPQdBqIE4ph2VetvP9m75POXlp0+ck7U9BAHXWbDx+dzxwa+m1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUQ1eIKJh9vjo/ubvkwTOKMV1/Rtoeos3EcYTT5lJ9A=;
 b=lujio3i3mmHe+N9UlrHrz/1i8kO6wqmIZYpivnu3P7gXtZkk8IwyC4rJK6GcAqcbzzIIR4AK2kyuohDy3trxnrn0P+M+CMT6jCwvPaKHkMVwTmgLcSnA5LmPFQwxmE1PvpIymfzlWgUnfmPXlhV0eMKlRCGTbJn29t0ZIXGH9KZ6K+vDHuPp6e2bgIctQajXCxA1VR5wpVi76iAMBkkp/gSEsli57lu6WFOaOkhAfT2lcEWBERiU4b8Vo81pb5U6P3huOY19KmatNkVzjHnqe/g9O0EuSRk7NTYjOjOSTHhGwOESxpIgZiz8cF199bKOsEkO9hp00iS8jeYRQhCrhg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10660.eurprd04.prod.outlook.com (2603:10a6:150:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 20:21:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:21:01 +0000
Date: Fri, 16 Oct 2026 15:20:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640
 camera support
Message-ID: <atKHI1B0hL6q-CmY@SMW015318>
References: <20261015162301.63838-1-stefano.r@variscite.com>
 <atEci_KwxUdvAekv@SMW015318>
 <atJY6DzjmAeq7U8q@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atJY6DzjmAeq7U8q@Lord-Beerus.station>
X-ClientProxiedBy: PH7P220CA0063.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10660:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f81cd5-985e-4795-37c5-08df2bc2ff0f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|7416014|376014|18002099003|10067099003|22082099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 6JxD0WenGgfeRxxnRz8HbxTkT9ukWhE+BVXZnAA+AUXnQxXho+f8z+bIQTDyxtU4BRs7TYlW25+oa1rzqSE4DmldBJEjj9iwnBm+iyZEgBK1LzHMlVqz1u3vmozqUBNTDFsw57pYNrXG76vF/dvk5wAwS7RudzzFnKMNEz5HNYqfhAcyVbXkjbr1lyRgyVLX7gyeTKMW0gLzuxEwnkePcOK9WMItqSXY7vVmjCkedE3e9L9Ol27PyvOIrhz43p1QO4SdI9LLfseZNRBhX1Qv5a1KOjpjvEJqMkl7cybvNwBqslcw3WFZRizmOWPQByNs3NuBr8rgnVY0ccUjS88Jho4vEFj9UGiFOnBtmlWeoENaAQ/x/hmtvM55lWb32r6+Hf6f7rxrve9/dfBGWpbcFX1ifWHhwSch6a44nQbNbHsyoHJHHwg9nsuSZYDmG1H+1eYRMGfpJNELm+hN6ErneGOYhPtLYEgVX56sQ9KhzAurqL/047RzLk/y+iuD5G5oAdQPr0mIS4sbXMQrvqb+ZjlkzrEQqjsI+pWNA7xTsoz7QPwArM5GxW/wVMvSu6H+bCVeINHmA2RbZjl27qG3txCfRDdOJmn8dsuMinBqbOdjb3JYaLVOLfKMHgDFu/Ck9bT+1OH2E5buwNHwptrf1L7CRBekK5O9N8VV/GK4NKM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(7416014)(376014)(18002099003)(10067099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qXoS3JXr/cF56BIaIlSG6eKy0fB7JFWagQZv3O2KE1NkbygiKTY10tH0GtrK?=
 =?us-ascii?Q?20BxhFfEEMEvG796e1CVKT6+Tm2L/HNLCBGSDEUqtCKUc6fc1kyOjj87COrr?=
 =?us-ascii?Q?LroKyMf7TTwJb4EvNJJo/u1clK6RkKdl40mqDmDpv5oZQiwCv2x5wAeSJXJe?=
 =?us-ascii?Q?jUO3HtGi2PAXpEB2yE1Rjo1r4KE5OBnhYfagUqYdrRVpt44W7yo1HujYChVC?=
 =?us-ascii?Q?Uz8ktQ+Lytv/mWBfQCPFxpWOqwIyfXeVnbpkSEbSDLaXldWh6qVhvWVr52CJ?=
 =?us-ascii?Q?MniHi6cIiCN7rispv3p+/+NFPvJup5CcoTZXoH72eUmSA0eZAefzux0R4IT6?=
 =?us-ascii?Q?uHqfhIMYlqbWb1vfcJEG4DEc3weULteJ1/MDdRu9HVAKaQAp/I8LfkS6WUFC?=
 =?us-ascii?Q?bEzJuQIUmqWH20NV3TzrMxIR7wIcYPugH0yzUS5PTCKjupEQ6cNsH49feGJ9?=
 =?us-ascii?Q?VHN2F+Wj73/99UnUhZAjL53e8vbk+jEdHJxpwuLE875gP/fO6nmckCOr06KR?=
 =?us-ascii?Q?1ll1Gxl03DfV7KIGMkx83NWYO2feE4XjBi6KhsaaWpIqM6govXIrRBHoJgWg?=
 =?us-ascii?Q?ta+D3fzfXXkIXdWny7g2MAcAT0oLiIwU3WLDIGnUrWKbQF6P33n7EvuAiRMG?=
 =?us-ascii?Q?MEpVuHwdwrFZgrJSIosJjQLTLGkBGn36IQQeKHZgMvrgU88meW6BWETa3CG4?=
 =?us-ascii?Q?1jQqEyiEpMz753Tk1iMCaH48YZvkr0zV+SOxXuw0WYuoVYrY0bMd7Qq+I1xa?=
 =?us-ascii?Q?A0HVY8c/pKpMSgE3A6zLoW4KNY1gQedEAiq+R9UySqtFQofYlPQkkdW9Ut3v?=
 =?us-ascii?Q?cmZ9tJVmXlGOQKEvLgzjt8mc39CuAyDGXFZLJekPGTGLerJcva0XTe5av3PJ?=
 =?us-ascii?Q?ONIRtksH76mFa6o/9KacfW9Vbao08tm5pGAySBWqgSPs1jezU9mNDdObvvjs?=
 =?us-ascii?Q?YlZZd3jYuVYc/Z3qVm5ZY2V/V4BTZ5CYl+xHwGFo3bXiUmUmUeERwEBIzEsz?=
 =?us-ascii?Q?eOVFYvKTPQj1+iS4BwAQA/Mncxkii4vA951dUUZ7a+StP0x3WX1YvZE7fCmM?=
 =?us-ascii?Q?XGAqMfwGMU/DHTkFbp6pMun8xulRorg5Yuosh59Nbu1i+WYwGVMKz67GhNb4?=
 =?us-ascii?Q?b9VqIIXxQR8Or8ElT6owHPtQgk7EoV+/SNufZBL2BbZKr4VadVfDqjdyM3gN?=
 =?us-ascii?Q?2+xAkPLqW+hOyl+646ZAlRxOkRAs8BiSsnqjz3fojdZYRLhBWEUCliJeOT0s?=
 =?us-ascii?Q?ZZgubTBPeAmcZDKGle1Dkydgz8+9GVlj8PbwUu8ca3RmtQ4X41yDxEBlp6XK?=
 =?us-ascii?Q?Z24mP21VpVxDVbvs12LCz4jnYbtCM0uTBQy3sPjs0khFMoRPsngaKqVdptiG?=
 =?us-ascii?Q?V9BwX/++14eJlS7va2o9YlrL0QXVMQ2Wxt9tGlIDKYnZYAfsEIB22j7mDjo7?=
 =?us-ascii?Q?YshF41bF+ZJGaGQ3sGC2U2woTTr87G1dZkRhweLhzjEkhlRtQRYaYDx/ir/S?=
 =?us-ascii?Q?Yq6XErwuudJsbVrt3LcFFMaEys1FL33P7qOwxLvzoxn5QU6X6MwyfNOufAN4?=
 =?us-ascii?Q?ERROda1czJXYgi1WBBcCR59MlnAAUoDQvmkXOGqX/+IbZu+81qZgmeOoWioH?=
 =?us-ascii?Q?+uPSHbABsWvv16vl8o/ecKo/iC7+MMPR596luiYRsZvliBeg1t/fCSDpHqiv?=
 =?us-ascii?Q?mb6p8amp66nV/vUdI3OqQM81om/Af8YT/pIjIrp1iLO8/UVKZEolb0N+YPKD?=
 =?us-ascii?Q?ZsEoOAukFsnjYaKNCqakZIJ5qFZDjeAtbDZsa6vYen2N/Of0AI+R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f81cd5-985e-4795-37c5-08df2bc2ff0f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:21:01.5611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdgOvlOnp8WbsG6e144yCgtJnCVPL0RUwn8EWMsI8HBcaBdNUAs+HufXrpX6yHrEm7HNbvQTns26tkPrZHwg56XPv7xUPqz0O5Whdeyg6GjTgH3lwSkCglIgy6oL2r9i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10660

On Fri, Oct 16, 2026 at 07:03:36PM +0200, Stefano Radaelli wrote:
> On Thu, Oct 15, 2026 at 01:33:47PM -0500, Frank Li wrote:
> > On Thu, Oct 15, 2026 at 06:23:01PM +0200, Stefano Radaelli wrote:
> > > From: Stefano Radaelli <stefano.r@variscite.com>
> > >
> > > Add support for the OV5640 camera connected to the Sonata carrier
> > > board's first MIPI CSI port.
> >
> > Does this board only support ov5640 camera? Suppose ov5640 module also use
> > for other boards.
> >
> > Can you refer https://lore.kernel.org/imx/20261011-expulsion-frivolous-690de090cf9d@spud/
> > to define connectors?
> >
> > Frank
> >
>
> Hi Frank,
>
> Thanks for your feedback! I looked at the Toradex approach you linked.
>
> In our case, the same connector can also accommodate Basler cameras and
> potentially other camera modules in the future, while some of our other
> carrier boards use different connectors.
>
> Given these differences, I would prefer to keep the classic approach proposed
> in this patch, describing the camera directly in the carrier board DTS.
> Do you think we should still use connector bindings in our case?
> If so, how would you suggest handling these differences?

Need understand whole board familar, basic Two problem:

 	Does carrier board support difference kinds camera?

	Does carrier board or camera module reused for other boards?

Frank

>
> Thanks,
> Best Regards,
> Stefano
