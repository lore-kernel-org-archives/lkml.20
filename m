Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417678;
	b=v5E95/sBH+5mGUQPHKaE9YHBnEH9Zkqu/MiLdWY7grHLr4OEQqo6vfAYRrrdSgkopbSD
	 adeh4QoX9vRea0d7mRTl3rLs0jIWay2SSuBTiVR95+Kk6qdgqcxWoxgpYM8dlnDqnuyXn
	 K49EQSetmbq2cRoRN/K/bHS7SlrtyZcTWUj5xExjjgCVRZJvODa+w5YOj7z8SEGrtIDYf
	 gHBrY7BnLsqFeLdzsay5gflyIUGBkMNFp2BYLsLvXXjFn9nnaDamR8rQYu7eXYzZr2OZm
	 yQq4yIMj7qkST9DHo/1hgJtcL43Cz8XrQ0BMGT/5vJza9R8JFt6gca1U1kwlVBVHZ1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417678;
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
	bh=sSN1kP1CaB/8fsbefXa3LnME1K/Rku67T2K9S2tGPbU=;
	b=sEzSRFzNGQVKa6GCrJHP7s/LxGwpuAnBoB8nro++GHggv3vOLp0hik3LSTukqhf5xNZS
	 tt8wOkYNFaEZV4TijJKWnvd05UAlax6veJEd8IZP8un9VwNJtdDIOM7tHU3gIpkGHcWQT
	 EidYsHEpgEXpouJfDE+xgxwYYZYa0HVCGERY/DXJNWeMamnSH1V5FiNVgXk6jltpSjka9
	 qkFScVz+6tBrQidUTsMmUKedSYTrHg3OrCPK08iNLQuZTwGEsxmVm5tOl9HYWNgFTxhi3
	 hHhjV+jpC+06HuUMzg2MjHZKdmTRB71eRn1QvRpGT0P00vcaM/V2C3YT/cnenclhgFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mZkYx05t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.16
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2727606A893;
	Wed, 11 Nov 2026 17:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2727606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mZkYx05t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2zEJwOnCW403iD9v/gOg4+ADwoJdPnslg8hKah94UEMyNWlOVK8Ug/+L/o2L+f75coQoLx1Ia6wNe2VX00D9YmFmNOLz5ZIj4y1iSWMVEzTEZ8GMDgjKOkQAdtQSmTJAwcLrJskxbtgbl14CKVf3bNFiyvEAbFqN6OtxCE2bI9moZuwxkMPEsHAFt35JlD88m+vRMh7pBBfE7XRo62YiPJ5nhg6e615fzo/ZYxDh9yWIJ605n13T5FkEGFYTpHWo3xQvvB8lUI9M1wyM8/AzPPgciq+CWHpthdejO1Hn0g6//nTIUH3dkMJNDd7QxsX3kKRaYP2A1sEBHU4iNTXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSN1kP1CaB/8fsbefXa3LnME1K/Rku67T2K9S2tGPbU=;
 b=TT/nTzaDMhHCGKNbTPrrT5dJes5UmirpIvUwVtUCUr37GhJWKCqKEMydBy5L/hoMa+20dCtobIm5k1GcMkIEmbvpBX4f5M7msRH9Ke6VacchwW1Iu4rs+mCTAC/4zbB99jza/MAbmF8l1jm8mGv95XDt05XkLh3IOSvdqqrdMZfSdQYFREA3R3/s252UI2tn8HODQd22G5NXbejF7HLMgoTNlfImGS5pZgCPEbWHIUhFkxWkPmxWFy+88OOUZZU2O/n6bxPlL4y6eg7xbUv2d/rk07WVq59HEgolwrJozVobonUWLlhvdmZs5gjaVt22iqqomMUVJfhjLauD3ZP62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSN1kP1CaB/8fsbefXa3LnME1K/Rku67T2K9S2tGPbU=;
 b=mZkYx05tXx0ocFh/hzGU62jN8eJTmG+WlYOU8AVzSfOK1exaQx/BK8UCd6LUU5H0+f6bJQAlKrBAAQJMchujHwyW7p2uLcHRb3eloJ92GhwTLiPaGC4vi2qpGYSuQZu70gisNovH0lznx9qbu7WUVDZ8vc2M7W2F9yxwJ/S2CunrO3aT6kXbkQpPhw+hVdVRVJCSwEEtJUWJUigZkhCgb+exuThgaDZpS9zgMfx4mSgf5lFXG5pN6RB7vxMKexQsOFqjTcMGP34abiV8qgEG4Q59RxUZv2OKilHOoH8uUvLkeyEZDNAraL/QUHiEKVIx2Lj2/dPWhYAXvnk0zehi/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB9245.eurprd04.prod.outlook.com (2603:10a6:102:2a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:21:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 17:21:13 +0000
Date: Wed, 11 Nov 2026 12:21:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>, tbevis@amazon.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] i3c: mipi-i3c-hci: Program AST2700 IBI
 termination threshold
Message-ID: <avSkAIS82rYaLZvH@lizhi-Precision-Tower-5810>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-7-4d8fff5c5196@aspeedtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-7-4d8fff5c5196@aspeedtech.com>
X-ClientProxiedBy: PH0PR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:510:e::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 404362aa-3071-4570-18a1-08df40182fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|19092799006|10067099003|11063799006|4143699003|56012099006|261009223027099003|261026140227099003|261022105027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3g19CCq/+e0b2Qhspua5XJVgHxebLGPOTvuhKo9kr5RlIWieOu5U+ajlCqRwSLa9nBXPDL26Gu8OyA9ZGddi3tkmbJ8tQ1SFXdFafuBHmyzJE3pGKIWdRpqBhw3CAuxfgPk7QqRFiL4vh6upPAw8iqR1W+eQLjqmJWbvel259KQ2OBGlruCLHXKPDxiAgyqcgSzw9iyZFE6qEyBdACUXYZltjx7vBAUezI72kO31osu27dk5SAWzkRb6sncFZki5KBHj/f8F3cSrIohhDmzxa6lBfDt/HfIlIdq1kJnjcgEkKOJJf9sjHeBWQuFrHbR5tqWpagTA4+3Qsp66kRe4yTubuUD7FRlWQoyjGpJMIeLc3f4F+dnUgGZxl8uOnwMXMQRHUNIUTTUFZ7CRXkJJWuFQL/ocOv9Lap6IGgDm+tDdqQz4WY0zsu1iMQ5eEt367hrjKTs/FDJjXLi1sej7HzRG7p9bMPU94WGlxExFou/3fmfTdkVDWDwGKSjRNdASJIV0lHHfujc4em+OFQ5p9YHtXDjpmkuT/eW5rmPy0fAUOAHWdfQ7vIvg9BY3yEyDpDXoxN6ZpeN0H4mLMWya7QeF3k5ZMucL7TpGoFUonKFObBysk64o153PbKhOFJPO665EYs034OQcCsDfT57w1XO1jcMhktUSssERzIUfswc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MCC/RWgLfTFmmnwytkA74lkPf1RkII28LzXPpZy1cqry+LTwBCQP8FgXVeYW?=
 =?us-ascii?Q?uNp82zQZmHSQRDoDW7AiMCAlN0PPS7SqVOiQU9bWVa/qI4v25D+cJyC/knRC?=
 =?us-ascii?Q?9Iq7DVbb7SR/UeZd+F3VqF+XdUIxPdUKUGq8TDp64TSjqmeeJ1qX8t5LBeZ5?=
 =?us-ascii?Q?jaR3MJ9LbdJMzIhPM4z0SMraw5D+jaYKgMAiSM+GKDsyJFCM/f05aFpUzhzG?=
 =?us-ascii?Q?IyWdOcehyICCLIFfq+Q6d8f7oOtwcN/WSKSjSI0u5MovRkFDQJo8pmRhb3Nr?=
 =?us-ascii?Q?HKiN8s0MWZvShbxoHSBBI5QubmB1DiDVjIkwaZRflt3YWhxK7zfzDLg21jWq?=
 =?us-ascii?Q?lKtXhDN3bs3oDzA33P1pMKrdKzcfVRy3AfwX+IFw+uszCzLmx0vD1GEVfXZw?=
 =?us-ascii?Q?6x8ILTf0ik4GPGMKTDA5KH8MjFj+BKoH51QCI952VAR9R0EfIle0iAkh6eHg?=
 =?us-ascii?Q?Du0pMfJpH58ciZrYk4KY343oTIz1+LYnLGZOPyF8eYhU3JHQsqRcOUIc8rgP?=
 =?us-ascii?Q?EuZLBvG1zUt+z6D/aaTXlXWrv1bUveoJXqurzk1xiyU4WeKq0PfTawIs533e?=
 =?us-ascii?Q?sAAV7avkTXk++NyGkJxmOew29HeKGgobBt2XENYfTtYJsX21yPqzKr2nXzVe?=
 =?us-ascii?Q?Wowym0Fn0skG0alyy6A8+CU/bdS8h3mkss1UY44LgxTkXVxSnTqGnLSqWPmm?=
 =?us-ascii?Q?9uKxxisQQRjMGvADJ36mR4WLnG3fc2szKh4UsnMAVm5cyVScyBJspJZZzBZ2?=
 =?us-ascii?Q?Gyo5jFPoRw3xCmKRzf3sD7bKGrKweHGVLLIjEAziF1/m4IMruLmJYxd9ZOLs?=
 =?us-ascii?Q?sHmSCnYX6lsE1y5OVgDCnfHL81NWnR2gFT8AWeVFEkW8q43kvna/KjMwW/9m?=
 =?us-ascii?Q?Qqoxt+2qquNpbTZRhSLUCo8RQsfBO4Khy0M1fXhoIon5+jFQxDGJPxIwmjPz?=
 =?us-ascii?Q?6l2cyUf4L5Y/uD3eshG3E8UqaPnIQxFwSRHpOR7bM8HzeqYWtgtJ8gR821Uy?=
 =?us-ascii?Q?ExuoxMw4Ii4jPKfmwAmp8efBJ+mQ4iJwXHBnK1LPeVmBDC6fzpJ6TD/6WLkw?=
 =?us-ascii?Q?Hil0b2rrVPmC/pg1s1+h7HyKCSFw+hYggjj1BvxuTVe4Ldx7Dk73WumQV1/u?=
 =?us-ascii?Q?nw6nuadMQm2NUViBtp95DHPb6EisNDz6yToim4CialYDaF+ci5uQQV4Cg1qG?=
 =?us-ascii?Q?Efkq9U26kXTlhwt5LhMEMrERKFU5HAH3OvKHsV4C2FKQf2/t3gQpJvorFlxW?=
 =?us-ascii?Q?cnBtY8ktfhftDjrqo057IVXj1OpPS1IiFcVL9cMsG4MWmc/OyRlfiB3v6jhv?=
 =?us-ascii?Q?v5r7KwbLEzDEe761sGmIHoAI4IZvypKu1fbfgJcf5FRM2Z2zN29IKAMnplKo?=
 =?us-ascii?Q?pOyu437+jbwLTO6rl3nLoLzypjZZ3I0onu0TDhfzlqzsxhdAqMZg61zRn0xa?=
 =?us-ascii?Q?LbTbX8UIYiEHR0TvKD7+c9Fi7E8HWYg+s+6I+T7i2Bs6onjIrzFzB7ITPWmI?=
 =?us-ascii?Q?SX/cMi8uCZZXBKIK+lm0nNh0eoPHr+fK4Y4xffpeySDdFDNbuvkL+Ml9UNjz?=
 =?us-ascii?Q?J5Ad9VY3IhdB4e+awLn1p/9OM4eKD4465nFHGJoGXV5IYBiRxJ3Oe7s5DKb6?=
 =?us-ascii?Q?9DjazYuLRQ3BYEnnTY/ZtnW296oAp0XtvzZLaGYodXeUYJ1sQoQ2N9XYIXC8?=
 =?us-ascii?Q?XB/Mtj79OMheUaz95gyTX27hJVrZfY/Oqua6YHfZ8gOZZNtFq3KeoypuQgMn?=
 =?us-ascii?Q?hp7oCTDU43UBX3CZN5yWoeVJ2p8frEJMtbmLiuJRIuiG/JunYg2h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404362aa-3071-4570-18a1-08df40182fe9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:21:13.7740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jit8HfNwpb8plgWk6IRLYMdtggZZzxJdAHXXmKaq0qj8d9LwvNvJdiTueV29lsBQyhq7NuUV3Kc0XE6qsUrN9AxM59xlZt98qfdafhNtTl4NtYcVEyBIJNroKX9fyJMo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9245

On Wed, Nov 11, 2026 at 11:16:35AM +0800, Billy Tsai wrote:
> For an IBI with payload, it's normally the device that decides when to
> stop sending payload bytes. A misbehaving device that never terminates
> can leave the controller stuck waiting on the transfer. AST2700 has an
> in-house IBI payload length threshold that, once enabled, forces
> termination once the received payload reaches it.
>
> When payload IBIs are requested, grow the AST2700 termination
> threshold to at least the requested payload length and enable
> termination on that value. The register is controller-wide while IBI
> requests for different devices can run in parallel, so the
> read-modify-write is serialized under the controller lock. Gate this
> behind HCI_QUIRK_IBI_PAYLOAD_THLD; controllers without the quirk keep
> the existing behavior.

what's happen if device A have payload 4 bytes and device B have payload
8 bytes, you set payload thld to 8. if device A raise IBI, what's happen
if device have not sent out earily termniate?

Frank
