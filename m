Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793034884;
	b=5CLXPTz4AmfXhjjHAzCZqrr5uYdj6lBZNmbLXn1bnU0EZARBoIV7yZNv27q8uAnj4BsV
	 yTcXJtbsuGnX8QQs+u03PhPZc3krXWRnKwM0F34xmZhy/NpQwcPAHTgvk81kzhn2W6DDL
	 yClRTRo08ngH78qa7ym3Al9U6Axtyvc+UcEQir5WLbOxR7el4UaAICMNZxChycwhgQUn0
	 YxmMmzpjEY1Fp5dq3OPyCIRuWDD7haxCYd86W2WJEG7B2gs+M2oicgdDhlKWmZNvl+E2t
	 xmeae4kZOVLcLVCg0nSyjzYvKPgZG8zeLAJH1iAj11BspRzClq6EZvUYgJ4TLrxEgow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034884;
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
	bh=dVYWCgANKKUSDfoRJ+ayk5oD8iDa2vAxjzNC+zXS6pU=;
	b=pf/7ooRID/aSxlJtn/+/ONAYLiy0/ZjIVy74n9BY/Nw8mN6bNpDKlE/OQa2he7P2zFnL
	 mCTVC7/KnJJIf67Z2+07qMCqe6QpIAIuN8T47u0zOrUF3entICCULgXXrE83RgSEdkCXv
	 s2BCTUpCmrcrlqnozdGlIZ8QYFzgSDd9V/4vSYvY8ooeEOpTt5bPxR7nL7zAO+8U8K0+i
	 ytwrSiuJ1WMTB7J8+dG2HbRa6OnafDc1YeZO81GpPmJYINSvZgegMAMfQg6LzMIXTFMIJ
	 4PDtkicS9NJfTmlaQEKFLe9QUBbsUoQE5PbWGkndvKwp6ibQAFP+Kknv2Sb4gnIJrsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xvIodQAq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.20
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D403F606A31D;
	Mon, 26 Oct 2026 17:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D403F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xvIodQAq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGSbPYjTQiLl/91GvefUoCZZl/2BfPSbdvV1f8J3lDQQZJwE9QmuKnNx9k5lLsgVx/eU2LPa7m0EyPjWHURg0avmpCUuG/kvE39Ti+dYT4QlqNKZA95T07jv+qNuZzLvQNTIBsR5eam24eQ8IkIi1bmhaz1e3J44L+PSqjxerkH99LM+eN2qneF1CTj9qqFBndnxbRP0cEJUOPAhh08lev1QgxmtKKR1BTyVasodQ09nMT1S4koaZ/tLysmYILGcQaL7wchx57yxbd8vd/wHzhAEbltYwbh8VMZRqWBCnUo0zrU7313ZMVhWzIWx+OgHK+8vyu2LT4TeaKkLLRMaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVYWCgANKKUSDfoRJ+ayk5oD8iDa2vAxjzNC+zXS6pU=;
 b=WDOTB919tEOS0R1gx+TecgT8VYUHvclE4pgzPrkWd3dGZBTXZkjUGTPzES5fE0/F63NfkGIvF6ssDMDKmB0FAlViAdWoVb1+DpMZ6EBM4y4hf+bgWbfyuxL/lczqIFHt3dBTF8cBWW9xqZuplAha9H4yQf+ZnLfaWToE2imbByAa5Kj6/2I4VRbhV2tYhbzu1FDwX/6iOr4eD3bMv9+QM6BaImnkDAv3JBwuNod0DkvO4VR2PLoCfE7cBL3XK21xu66VL4VP0Z/aZXZpvSudLj6uWDSk4dpeTrHw0/7JwRjG6arCAw/qspMiIhNDNO6TVwHWFRZj/4dlqvvYnKxApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVYWCgANKKUSDfoRJ+ayk5oD8iDa2vAxjzNC+zXS6pU=;
 b=xvIodQAqDl3hnmWQJ76iVciPNpHYuSFeeh4WrBV9u37x/nAGGeKNIEJKEM7Ab1wiSmYlGCkcDsU7Kd6ZLmE1O/58798Fo9UBaddtLRAS1jAh3J41NyTGo66SbYItGe18c54EZb5YdgeUSaA0xqkFdwLeHPnttzDIELbuHMRoE1Bf+MVg0Kp5dqxCrqbQeDmIQ241VUNkEAXi1Jts7u+bsTfZdTjG+J5g0qiF/3m0SrL7cev315fbmB3iy9MYtCfxjZ7bUfQry5vbabK5Oy23ZBQ2ivnUaIcbg0UJHCsCoEsRrisXXDrWoqipqPk5RfcOqx4xJdmISAlT3z3Cwj8atg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8447.eurprd04.prod.outlook.com (2603:10a6:10:2be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 17:14:40 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 17:14:40 +0000
Date: Mon, 26 Oct 2026 13:14:32 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Lee Jones <lee@kernel.org>
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v20 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <at-KePjAy3e4ggPT@lizhi-Precision-Tower-5810>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-5-lakshay.piplani@nxp.com>
 <AS4PR04MB9362E4F3E5E69CE45BE436E9FB642@AS4PR04MB9362.eurprd04.prod.outlook.com>
 <20261026150446.GB2195460@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026150446.GB2195460@google.com>
X-ClientProxiedBy: DS7P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:25b::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffc4b14-5607-4200-e857-08df33849ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|23010399003|376014|366016|1800799024|261026140227099003|4143699003|11063799006|56012099006|261026121527099003|261021121427099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rzDI84/6mNSGyvX+g9gaOBqF7XtIOWfhukd0z9SavzNSTsLBEvyQeQ0SpAwJ7BD0OeBMsl9SOw/JxkBDHVVv6+lWzfqARlm1qjzrBglXW3OwPL5OgcQnExfeEu5slpDzo+EZL6oJGbKGn5F5OJe1xmS0DiOr+6MK2zd6KLJ2ehXdMv4cog6Ilc6Bp4Uq5/o2ye79zGrQquBTkvhhqai3hOT2yYdf/HfA219XgwT1OPuvEzWNYHJhG5CQeugBwtB+P7SZE1Ex0/p5hTgY4VlsQd0NvQMkkyPftUepBkcYvrksz/PWLtFUvScg3xuoK0a+R48SG2UglX99Qet10BruUKXIsvmeT0naCezzLQnRVziUeWcr3tOXxJtp9IkVVcNQWwppxKR8fxoXP7S8AaypNc1QTb30HMBGC9yChhnGYZzTdq98TEsqegvqkieurYW2dK5zvq7TTqUP7wJtd/IAa/jcBxHBJPNgtrWLip0eI8K7RcIgI79rSWpDhte81qFAKFrTGxNzsbmx9oEEHmAn+VBpXVe9P59kn1GjlHzQymQrgcTFL3T0YAvYVW/Gjw8lFeV0Uf2Hap2W9JcOZe6roFCnko8O0qyGBdoyoxGA88i3V10u2HwRlf8L62TYFaM1fwg7z0oGrs4CymXQ5BCAUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(23010399003)(376014)(366016)(1800799024)(261026140227099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4fpVwDJSeLwb/5VaE0YSc0kcJC5W6L8LXvouYQ67EEHF0CKFzAfeP0IR7JP0?=
 =?us-ascii?Q?Ub9/LfMA0+j8kePrzQQdxO4X40N9fHBMxZV/o1Vl98gH336sUpSsDtzh0WAf?=
 =?us-ascii?Q?8KL9OOK0RdhVwOgsBnoecpsqU8vG/JcftuRuCMpfcCYqWzYNHD8t9Ss/0ug5?=
 =?us-ascii?Q?115CZklNSqJURoASv/A5v+CHpk4dT4VFAbrKdrow/CoQmtJZkSMeyL0K3Lfh?=
 =?us-ascii?Q?yTyekftq/buGbOBfMjEbewoToqIQukpyxxmECa0+1/X/jeqr/axKy0QtY1kI?=
 =?us-ascii?Q?6TgyyaXLgJyCpsdJhcrfAptwdpKLXMG9FcvuPmXbUMp2RBEQVvHQQz9rZdYB?=
 =?us-ascii?Q?QekTwizWDEkTXBrAqYTQoCJn7qZKc76PD2XiCGBAfQdJulPDotIlE+padtCH?=
 =?us-ascii?Q?YLdt2njcZFbfO0fmRUIwwREhaHx+BDYPJ92TTqsgcSoyyqDgHTOya5/XUREf?=
 =?us-ascii?Q?4iLyz+UcVvEbDdoUkk6Y3mHdHca8ZwTJtLyuTnK0JCs5nl7IhTDjLSzXy+ZB?=
 =?us-ascii?Q?4Y9C3KI5uQP2vUq2vSkaHlLdHAg6AbttNkL8K67Iffqli3/2Qbhh/2vf90oJ?=
 =?us-ascii?Q?DvgG/rA+aogIpBUYf0OmbaSdBBEnhE4KdVdiiBLzYjMQq4+mEbUBDyiWDfpH?=
 =?us-ascii?Q?v8X6Xw1zUesXtQ2DcqNhCHdBWc7oWqffuEst2yoWzRDeS/wlqlDC+9BfGQZP?=
 =?us-ascii?Q?CG53S22VbgBH8mYpmeDjgvIBVLrMcTlaRt9m6yD7yXJfsSF8RjrqezlJcDN6?=
 =?us-ascii?Q?tlDhTxl+pDl4RPJj5O7x+vIgVranlm1yKr52fUGClbqdR39JW0teUvWXTEhD?=
 =?us-ascii?Q?iD+TjVF/AITed7vSZ4zkJ22s6WTXtOQuMzxBq0DqsKLj+1n3AaE+VEy6dC2R?=
 =?us-ascii?Q?ZUvUMZJMkwvXTU4zTdSPgozZcHc/CLNYO8VLhR/x6AYBTM9P80HAgb7Xjvu+?=
 =?us-ascii?Q?JIO9Dj3LfZblGHkFNPfUYOLjAIFZ6+Cg6ANobMJ2A9802/UrTTufgMP8rifr?=
 =?us-ascii?Q?vhWRmNT6P8eKWMiT8LlE6XmddPe0n13n+VwqjBKWs7NUTblWBW/G3sdyqKsU?=
 =?us-ascii?Q?uxa2N/2JVUZxS+fMIvOCLHoK68hrhBn1BJ/n4vYZnXw9gyiSY9EGr4T/WfYN?=
 =?us-ascii?Q?qIh0fj+wKVyWS1d0UEP5nOO3Mu8pYpJoaGhoHAvUMjJdiXjLFZW0XCk0Gz4K?=
 =?us-ascii?Q?ANUOGfmcMY4Aauu/5MEcvkvI1V1TmEgmEl0SGiQSBzZ/mo4zSo2scatbYLUQ?=
 =?us-ascii?Q?zo5YTx0eBPn3/yubddWNvW4fnE8ch339+cwgxXn1oVEqkPXYcrNNGLGt708V?=
 =?us-ascii?Q?+cwEi6Z9w1a6tc2OeH2I9p5ASICZoflC/diVmyNLr5lx9/XDuqGFtiAoorhm?=
 =?us-ascii?Q?VZAdmfsiDQuxaIXpH5qnu7c9eQWWCGLXkinXsjGsOrtGSNRk1imOt5gl2/tC?=
 =?us-ascii?Q?VJfidGkX5gdwdSGi60owc5l6iImScQJezVA76Hbylj7ngFzXpmii+FILXuDe?=
 =?us-ascii?Q?kS/bjcPWTZv7Kb6ZmVO1IEwYbYkcm1SwUojmmOwmhkZcI1cGX8DOV3ZtJQRt?=
 =?us-ascii?Q?WvozOXkm6Fxch8srQQEQbncQZgGBfXXlNkynOEZtIrInbpAA9c7n+h+zkZb+?=
 =?us-ascii?Q?O7c/9Hw3HiwpSWnB3MAxvudbd/x1Qfh5M445A+WbYKmSm5UN/4V0LNOLWlA5?=
 =?us-ascii?Q?e0jUolNmN0Wod+AQlRZOYGfhbcyGC17MJkP9FHORfgMXnEdzJ4jCkNR/upQf?=
 =?us-ascii?Q?5tbdSQz//l3rBBFjSTl8FiOxXLaR9xk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffc4b14-5607-4200-e857-08df33849ea2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 17:14:40.0986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHbVaDwHblVJkebNYAcYhJmeg3AD6qVgDfySzlqknwfhhqBKZ5Q3eK7CbMmez46XVax7d1oSOXUN7yxBk76P6BcudHn7ubNg0kBgLdPifcP8kJiZghLyB+Alw6KhD5gw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8447

On Mon, Oct 26, 2026 at 03:04:46PM +0000, Lee Jones wrote:
> On Fri, 23 Oct 2026, Lakshay Piplani wrote:
>
> >
> > NXP Confidential
>
> Really?

I already found this problem and reported. It is auto appended by system.

> > >
> >
> > Hi Lee,
> >
> > Alexandre has already applied patches 1/8, 2/8, 3/8 and 6/8 from the v20 series.
> >
> > Patches 4/8, 5/8, 7/8 and 8/8 remain outstanding, with patch 4/8 providing the MFD core required by the remaining patches.
> >
> > Do you plan to pick patch 4/8 through the MFD tree, or would you prefer it to go through the I3C tree with your Reviewed-by?
>
> I'd be happy to apply the MFD patch and the dependents.
>
> However, right now it looks like you have a bunch of Sahiko issues
> pending.  Is that the case?

Patch 4 and 5's sashiko issue is false possitive. Patch 1,2,3 and 8 already
be i3c for-next tree.

Other problems already are reviewed. Some case is that extreme case.

Patches 6/7 depend on patch 4.

I hope you pick patch 4 and 5 (already have mark's review-by).  So alex
can pick 6 and 7 at next cycle.

Frank

>
> --
> Lee Jones
