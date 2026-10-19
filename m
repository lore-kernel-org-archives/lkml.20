Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792441537;
	b=cZ4BMsLjThTc/IOG07eGoq+aG7NoPcEhdC/W7HEl3WJ1xzMyFRkRkIpEe+ya7fjinVXE
	 NUrGIVFZAtL8oZ5CFBdi3fVTWG20lDKCKOPXbUo4VE2IFxNy751KTwEU6h7D7eQyhbO/V
	 yiibAy5Se8PTwkoSXV7C77yKAa8/Rl9NaaCw1zlcMd1vw6WNn7E3qFLUC/qqERqDLAxH2
	 StDnnVnya+Hpul5ileN38rNR0jj19wlc6/2qFohRroezxKTJ+e421+bwn15rmBqnVs2aM
	 D2b+auSFcokyiCnLOxpTNP9M/Wgv7xNqde7Rjsp2k50iiiD8ZhMVQ5f8y1xV7jWquyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441537;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LDVaE5mGE4du174qJMvoZmYRI0+L3kZnvS6evUqgAcQ=;
	b=dMGPF9vmRQU/pi3VqFhqFMCv5XVOijd4YAJPz1HJr16Dq/SvN0zlXrP26zQ/VZlurGzZ
	 +VdwdhBy7e79jStl8IG5NBC7In2aMFJxSiLNNlB8jd50Bqbtr/AeENh7mjNjk00K/v0s+
	 mdKv6oOQxMCeFy3BuOIDfIUlJc5wo9fw2ZQ4UYiA15iJyJne0TpziL0OHo86suu+b1Uht
	 egcSqPl0MCKQCIPOLNPlBDQGzSgpQTT/ctRS4un6k0JpksYfna3leOMS4J8r52Vb+g96a
	 AAd1Y02vua39ekj9+vCTkIpNGQQNKsJzZ+qBaeBTj80Ynf1b2u2iihUKMwX4CIQtAyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="pnUuS/4m";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D3606A31D;
	Mon, 19 Oct 2026 20:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3D3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pnUuS/4m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/JsKU2G3ao8nC8yumgjM0DK2kHTXruRc8OQuEb+HK39QVIBujqru9xuKVbTTq70lkUMP0YgvK+REja8kKfFLw5BpWOTG17vJhKTieYUoyu++yL60kabA70i56giZqPla4ITSgfjfljdBk3CXkNlTL/ESU9I6DIbczWVSW1puQNT+ZCr2CuuedWNRhaOgvqCWtDeM9sx8Y/1Fv7bkn8YvKtXvjY12IutVWyiNvw9pI3pl3y+aP1/sKpsluBl4Q8UZC+yfKC+zwzZzHfemnKDzoI5tOEvnOUvpTjiMfVgJmGzFEk0xd3fFEVqFOtt5S2/6r51LpLfWeIz87esSS/xZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDVaE5mGE4du174qJMvoZmYRI0+L3kZnvS6evUqgAcQ=;
 b=tqIj6ImgH8Ox7wUo4FN0xxE86fz4hXOCPh4BC0eODz9rq7MHTj/VO1EktulvUvOjdA9AKyo14HqRaDRRccSh45zE0SSElJeKyqNPIAYD57gILMO4ALCn3/WihW+X0uDm747cyRNI3eYWS9u8BPdodlDdJ+jxAPblFRd9kBHJ7SqLjhK14AluRMgi8vSF36nTpWHwwPWKzXXyCUGVkdGCeZFDTICsDSyOAnJswgD9kdKofckFEkeNBu5/1mAhzPnGraDNBqWrwgJSeRWeuxyQ7sX12h8+SmJzI97G7dC2+vl/fqh0Ugu8OaUhx5Ts4Dq8XvV67TebdO3stfpXQ3Ka8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDVaE5mGE4du174qJMvoZmYRI0+L3kZnvS6evUqgAcQ=;
 b=pnUuS/4mvkPkcMuDaOeFRouA3Oc1p8xSMzWhl2Ds5gtUjY09Csxm0RajukUCiViWAbT9OOrmM3UhkZ/pz4YCI7DqjgHQHQ0dFelS4V20NmcYHVGTYcTNtZFjvZUNuUgjwES8nRVScDkaUOAcVaQ7o6TV/RI2zfIOpA2KcCvNQKL9yKOagxG69wn4Xfy7AfvzZWTun/LvOyN3GIs3G23X59h4D64Fnv0LmpTzFTAKRvaSrStvPg8/2746EJDUj/D5SYG4bhrmskY4zfAV6MxD351JVtSkmIdYr2GjcGbBnlPoCjI3qjQytXLhy5A2vP2AZGggAbSABJCmYDsJNEi96w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 20:25:33 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 20:25:33 +0000
Date: Mon, 19 Oct 2026 15:25:22 -0500
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
Message-ID: <atZ8su4Y4yg9CULA@SMW015318>
References: <20261015162301.63838-1-stefano.r@variscite.com>
 <atEci_KwxUdvAekv@SMW015318>
 <atJY6DzjmAeq7U8q@Lord-Beerus.station>
 <atKHI1B0hL6q-CmY@SMW015318>
 <atXver4B2Acc3z0w@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atXver4B2Acc3z0w@Lord-Beerus.station>
X-ClientProxiedBy: PH8PR22CA0011.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM7PR04MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e724ee-2ec7-491c-903d-08df2e1f207d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|23010399003|366016|1800799024|7416014|6133799003|22082099003|18002099003|4143699003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 I+NBfoK486APThArPlOFPhMcQ4rHsysTaBcfe9aojIY7LAoBaW93bXLNs97eUbed4MYYOYWxIf75I5qCW0KN3c6S3HZQaYgTE9a4UZGVT+tUygybsWKpDQg6FIbheNTWCOJkgDb6S41b9BWOEZEIL8S77y2Fupi696jWfuCi0bhEdLUwzhp2IzGUifeMOcsWNFmdj8q/Q7UMg/7Vurn/dWKkJ4Z2lXf3Sr7E2LNNdGIBaPewTTVp/YIKjHouc/8bpQZsuYiHVTy4xG9PmDTZY/dLaQDsNKbz6ozh0Z/ynwv1a+uwUPbVGIRoNA64A6gY+hzYTMGS9IsA4guAcCWb0/16WSCN6AkCstI2wjs9aAG25s6NpHexHNItYTcjHGG11hdId5B9NcVibBuXlpHf2HoWql19m5QywQiGxbpvkwIxYF+f67XVchl6qQLEJN6kekYyhVJdfeU2ngTN3Eff+lZjjlxPAnenXQ5uT0G+sWQu16P80hXDxG2BvM/MIzs1gmWYBmGgmDmHaI0z+8HZbweXzpTj++U6BA/zlyWte5hoSiPtWwZd1O2TZFbttlxPbZZP0nY1xSSeh0Mlwbm7EydAx/j50qMsfDgCxavCRjkz+xBD7LnVUhvUSZDtbr2UPQhOJE8Imu4e8RL56uzqjh7L6YwFpab2djw55Er3fhs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(366016)(1800799024)(7416014)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?bCgeGLNXLYH5N3I+2F0xK0pOFLAijOmCECe+UPaQ7mJCykcEAHE/shBZ9c53?=
 =?us-ascii?Q?xPMCLiXi00Bs9SeI5hafUmruufPDeCZa/PKnCNj1UCI9QWNz08sHlZFXKNoM?=
 =?us-ascii?Q?BOendFOL1an5wBPqiiShnzJYwCIqWhdbEEifxy4Z7K38hcOdHB1uDXxWbDi5?=
 =?us-ascii?Q?DNWZVZrsb/GZyOrvT8DRP3Hj9a4nLpQaIuGK8i5hZ7VT/tSv2IcoT3zX6Skz?=
 =?us-ascii?Q?o41mCathIa6wbuQdKxmlKVA+u08ujWxbBFNnGPTXudmaZnOX4O09B5JlJ2gY?=
 =?us-ascii?Q?XEZFj/ZLAGxQ830gEmgcjQ7VyKcxfxoduNs/YEV8DQQ7Hu+LZP+nXWsZn/Ho?=
 =?us-ascii?Q?KegP9XBPcjZreVPdBWq3A7TZOp63U7NxuGFOnMQbuS0UVKEWEhdkd7F9LuP+?=
 =?us-ascii?Q?mSqbX/rBJ+G0NmdK4V7uZJ2QAVUq3sKKAWjE+pJs1ldrJkNho7chzwJj5kR3?=
 =?us-ascii?Q?F3+mz9k/YFYKltkGXwtz9nReUqodsQr7/sNDWU0x6rWQRfm+92jzy8wCRFJM?=
 =?us-ascii?Q?VU9H5rdW5Gmtz6InJr12qTQX2GoBbfmYvXhdI4uL1ZsqdS4LxYiGn9zDikpx?=
 =?us-ascii?Q?plM1tlVmnbiQH3MOiZEsRWR+R6whriug7uFeXRb4DJ6lG9Wac57QpGkThtQk?=
 =?us-ascii?Q?R/89XQ/D4OUYkRC4DKQeOSa5qWUcCmgZgXZPMlJebOInkplYHOs3w3iD/w5s?=
 =?us-ascii?Q?UrIVu8qmGrVTLsnWA9yb6RcnmHswBzEwB4u6YnuIyNFRprJ6+3g8D0+wosUc?=
 =?us-ascii?Q?TZEBnzjlLiAv/an22zWE56DzY2PiXYw1UIk7+dLPH2Qp+IDFfoTkN9DZvDss?=
 =?us-ascii?Q?mJ4UBkQw6XYvV6L08efk7/ObjMBN9HyGt5EXPTYS/r+WUrNAuhLGI94pY0lU?=
 =?us-ascii?Q?M+zT5OaB4j5i6+eeXP7jGM4yaoMuIf7ZfQcq/riK2XbrGmm/QKr+Ty/FX73l?=
 =?us-ascii?Q?wz8t2YC+HMXXIMsm1Mz2ugHIeZF1/u5+G9mRniAPAXEEub3tZrfZfJIGwlnM?=
 =?us-ascii?Q?TDlDnz1oz2ZhB7aDu7t9JVdjYuuWmvgsff/w7k2amVJibSCE8UmGL8ROcHvR?=
 =?us-ascii?Q?oQXLAfybapubFGB4zoVv+SWBbwdIGYUNBtqqjSfMheCwTZWcXbB8sRWPOajy?=
 =?us-ascii?Q?nzxFYN70QKhbOX42Wb+pW2gzuOirXo2PJQw6wYC2q0Q78d5RItcOAf5ujAeA?=
 =?us-ascii?Q?ErEQY9L3eJDoske6IqPMx+ewbBtqtQwRYiXrww1NWv7PgDRLBp80MKOJq51f?=
 =?us-ascii?Q?jbncPcYArfVX2t1zy3z98WVKEiBw38KwfTa+O5uEkxFv5UHgy8eSnBk+5BHF?=
 =?us-ascii?Q?4wBwKOPWT2gnTtHHFvgmaTE6sXa/BhQ7bn/xfdzxZVJpIFrdOCLtapdbsE0r?=
 =?us-ascii?Q?N3t8yJbwNVa75GfpdIxo3ndH1DLu/efKQuLB38CYMIQuPink14nlNtf4WjFX?=
 =?us-ascii?Q?bUjUoFZFf1jw2iiLdn+LaxIH4puSa5xfhgeYyXv/3GnY0gvPLCwC1Dzyo36t?=
 =?us-ascii?Q?pPomgtqCROkfjt3g/Q6EsVGywf8v4yclmmmY0LcgmFFAjINOvdychK0jSeba?=
 =?us-ascii?Q?cJgQD1atFKDWdp2NVRje6JGLb0cW1sg+UqGPCoDBp/jI4Q9agE5SpeLtbzCc?=
 =?us-ascii?Q?YI19D5l51jl0R2gnkLbhAtKkasHNz1yhyR/CYR2ypFKdk2Nn1syCOr/6pwMG?=
 =?us-ascii?Q?CEh29l5H0kNtd4eRGrdNcWZugCL6ul+H9dpceYeTOPCSy/0ySmOc7AqqOBDY?=
 =?us-ascii?Q?iXomxkHJ/rKt7UuiV8I0GzYK47whG2gkWc+MrBDCMpzApYNKj6dS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e724ee-2ec7-491c-903d-08df2e1f207d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 20:25:33.6199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rDX2ceJLucMCu2gVFOgWKWIBIewrA02LKCA0LPlYBgWmaItFi7ru9UdA5lfKELkNLEVhu+vViclhq5fJ1p1nUKs9CizR4L9EgAI6BgnkYC17j3oS0jKJYhayg+18bpV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776

On Mon, Oct 19, 2026 at 12:22:50PM +0200, Stefano Radaelli wrote:
> On Fri, Oct 16, 2026 at 03:20:51PM -0500, Frank Li wrote:
> > On Fri, Oct 16, 2026 at 07:03:36PM +0200, Stefano Radaelli wrote:
> > > On Thu, Oct 15, 2026 at 01:33:47PM -0500, Frank Li wrote:
> > > > On Thu, Oct 15, 2026 at 06:23:01PM +0200, Stefano Radaelli wrote:
> > > > > From: Stefano Radaelli <stefano.r@variscite.com>
> > > > >
> > > > > Add support for the OV5640 camera connected to the Sonata carrier
> > > > > board's first MIPI CSI port.
> > > >
> > > > Does this board only support ov5640 camera? Suppose ov5640 module also use
> > > > for other boards.
> > > >
> > > > Can you refer https://lore.kernel.org/imx/20261011-expulsion-frivolous-690de090cf9d@spud/
> > > > to define connectors?
> > > >
> > > > Frank
> > > >
> > >
> > > Hi Frank,
> > >
> > > Thanks for your feedback! I looked at the Toradex approach you linked.
> > >
> > > In our case, the same connector can also accommodate Basler cameras and
> > > potentially other camera modules in the future, while some of our other
> > > carrier boards use different connectors.
> > >
> > > Given these differences, I would prefer to keep the classic approach proposed
> > > in this patch, describing the camera directly in the carrier board DTS.
> > > Do you think we should still use connector bindings in our case?
> > > If so, how would you suggest handling these differences?
> >
> > Need understand whole board familar, basic Two problem:
> >
> >  	Does carrier board support difference kinds camera?
> >
> > 	Does carrier board or camera module reused for other boards?
> >
> > Frank
> >
>
> Hi Frank,
>
> Yes to both:
>
> - The carrier board supports different cameras: we currently support
>   OV5640 and Basler modules, and support for another camera is planned.
> - The OV5640 module can be used on multiple carrier boards that share
>   the same camera connector.
>   Other carrier boards in our family use a different connector.

Carrier board -> camera_connector-> OV5640 (and other camera).

==== defined camera_connector carrie boards dts/dtso

camera_conn1: camera-connect-0 {
	compatible = "variscite,mx8mm-snonata-camara";
	gpio-map = <>;
}

camera-i2c-0: &i2c2 {
};

camera-regulator-0: { /* if exist */
};

mipi_csi {

	ports {
		 camera-port-0: port@0 {
		};
	}
}

==== ov5640.dtso

reg_camera_1v5: regulator-camera-1v5 {
	...
	vin-supply = <&camera-regulator-0>  //if exist
}

&camera-i2c-0 {
	camera@3c {
		compatible = "ovti,ov5640";
		reset-gpios = <&ov5440_ep 1 GPIO_ACTIVE_LOW>;
		...
		port {
			ov5440_ep_0: endpoint {
				remote-endnpoint = <camera-port-0-ep>;
				...
			}
		}
}

&camera-port-0 {
	camera-port-0-ep: endpoint {
		remote-endpoint = <ov5440_ep_0>;
	}
}

Use Makefile create combination for difference carrier boards and
camera modules.

You can use similar method to create connector for carrier boards, if
it shared for difference boards.

Connector have some limiation to support multi instance ( more than one
camera module).

>
> Given these combinations, would you consider reasonable keeping the
> camera described directly in the carrier board DTS as proposed in this patch?

It is only if support one only camera.

> This would avoid adding complexity across the different configurations.
>
> If you still recommend connector bindings, how would you suggest
> structuring them to handle these differences?

See above code segment.

Frank

>
> Thank you so much for your help,
> Best Regards,
> Stefano
