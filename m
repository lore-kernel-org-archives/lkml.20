Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792698502;
	b=z/Y4stPOsUJDYTqtC0Fqpp2l7tFdWi2jQDmvGNHKhKYpemkpmn4/llZDkjTiGj1/+Bc3
	 3C9Oxb7qtx4gJ8byE5x7+39SrMJ9zxU4F04KrqcStIm6zK4OKplgs0XnM4DQK/rtKegse
	 jrv7ESvvHkUz6BMYEfffxepfGI3zRKYjJRiPWJjdKidb23D7O+QtTeAKUHfYdadctnPuV
	 t1Tdqp/wc/7LNUX/Q5oQ12CHwrd75j8IzMsR0KP4sDo/jtNoR3rgrqW5tCXUL94KIMjtw
	 5XB/a87UUtigFMMUGVeQ/cEJZpzR3pL5NYCna7HxLZ6MbYGKD0ozV8+AoUSgjrwGOLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698502;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
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
	bh=VCLN+2g+sl5xuqNqEXPzgNxH+RnFTCZfojja43kQo0k=;
	b=B2e6r2LPMIfHIxPQaEPyfpqx+13Nr0Gayfy1EVaypS0jKBuakHxptxeZxFSoEvfb5L7x
	 2OqFj9w00SZto8o8FCVatfzUW4ifpqlSPXoS9HtHIMVRZ8c5qofGHbHKlPgYPHNHxpTze
	 6ktmfw/fKm0FZ+q2M20RLOMnxUd9PTMbJZMKn0dsFR1uGsavjAxJfvQBUAVGuDl+9JD0M
	 nYCoflqUF9XhHXQTIU/Vvl7xBI7F8dhrY54G5xngsjhsMrbxHer8zr2og747t3bLrLAaB
	 sg/qiEVlpEPRLI5bxCzeWeU9HQAa8ZQHvazoXlnhRe5eb6tUB0HfjKKL5TOR1MFWSTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XlPSZvay;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.61
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71815606A31D;
	Thu, 22 Oct 2026 19:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71815606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XlPSZvay
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTk2o1mj6BHR7mHSd+DZH1JXouLJrTCzcv28EGA8vEqlOrjUGOZcqG4rlfmzpvinFV7M+/7gDgM9PmmAwlfQAqqgY6k3+KVpt5NrPRS1EActodJ+LBJmcbcccATSRAffLA3e7K+4PuyTsKmnZjS/oIislIyh1eoMQtMovcJyC+99efMNcfFEpwWZDXL14GXygDWo/4XwKE333zhfF/KA/5D8pk5Lu/TTqOhXyxWB7u0QuJD9Zp28H/7IMOClCw7PQyv519ZFABDBRO3H0BMpeOe8qSPP77kPmXhm4UeVz711LfWCL0HxYKgiLmgbIoV5QT4yLf90d03fXyVRxzzGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCLN+2g+sl5xuqNqEXPzgNxH+RnFTCZfojja43kQo0k=;
 b=PGnT6t8wK6YFwt5gbEIcHT1m8pbvHD71RVx68KeCGZOucPqZyCR6v4n79RLKQ/OZ0U1ROThE9GaQ9kkkJX1VW0fyEYXKMS1M9tBprNUMXeJ4K4uGBducGbwP2sUYZADeB8PkWb1mX4LFYIDExCqjhdzhtbDhsC7WPYlVQ95HCmtP8PRK+3Ahe415x/hHk8PMCcWuiGEDkTsPe95XZpmtm8A9pC92QjMbhAzede0Abow+yXD0ONykAIlqNgca1zjJiN1C9bch8nJEXu29Mv6ZBgDs+fA7VLLuhPquUVX2mrpypb80lTZBNII3KnjJR0sHmkEyeub6kwCqbATTdngvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCLN+2g+sl5xuqNqEXPzgNxH+RnFTCZfojja43kQo0k=;
 b=XlPSZvayjJ7IIHb0cNoP1rbaN9MhfkFi84k+qy6MQzBOGQPC4te/ycOX5K1VULbpugSvyJNU+WKiSastNfe1cHZGLRWnwsnzCfHfGi9g11GzmfpAC3XV3LM3MsD/66e7JQ+bBvYvWLpAdf2TJalXLCx4CwUsjq7TnqamB6h6LPV89of+WrLVA9/PoKKndA/QmyszgrzUwwZ9ibN/Z7OYF1/O51cfarRZ1liSi+zxhsrG8H8AsllAhTcBh3XxplCSPVbDwhNrti4q1Uofoh5uJ0swetnSxdi26SXYFUm/TCi1ewckQFWVKuMAp13t3Um0pIIDhKMDcQaWmgqH2UrQIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMDPR04MB11651.eurprd04.prod.outlook.com (2603:10a6:20b:71c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Thu, 22 Oct
 2026 19:48:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:48:19 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v3 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
Date: Thu, 22 Oct 2026 15:48:10 -0400
Message-ID: <179269845116.1266337.7411055467831992530.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002071441.2499132-1-primoz.fiser@norik.com>
References: <20261002071441.2499132-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:510:23c::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMDPR04MB11651:EE_
X-MS-Office365-Filtering-Correlation-Id: 3820b040-fdb1-4966-2bbe-08df30756be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|11063799006|56012099006|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	7flrvU4MijIhu9t62qe+4u43uunH9C/Grg1Ouue9CFM2SvsQI21ZQ3fyo0KC3/E50vsM4a3I75Sqrn4yPu/2iQnBu6BPLOekH78sF7+yASwo9MlrTI2kwdtn+Ukp26bh/MISR8CFyu149fSH6p/vVchjVXK7kdk8ISgSSC1i5WhL+iACHUxFdZx59e2iC1qlPZvFs4ALy9OEveNzUs+MoxrSciMYmAynCJcZ5gjYr3er307LSZ2NGuuyLoSy8XmqAxVWkA4TjWLZV5KqVAJtj0xyvYVQxHowEqvCK0FUtFthgn3xw4YfTs9n8xjMUJD/uSxYZVt45V8vD+cjgkoXzmV0uNxfFoVxukenEDXRVSLEazuAmkumLBrTE/FnZdtcQk0aInDpnnaVyzkphRBLtLsf/RmxQRg1vRfs+xYEX2XvfOZRTRZvfy6xK/dFQNMipCObZGfTIbuQrp7YVXiBYWHE9gvCDCKvVIRyCzBdjmD2C38rAxO3/rxnOJjxcqiU00hD/DYTjrnMzD0RISTwqxJjhc3w+DvTR3YxJJv2/4cM2ubJ+cn8rL6Y4AEY4B12cHhvATVBJRgBhCp+OWz4bFSlyTVxGvofqeFwdBx2eqEBAICf+dbPrSUXnlyo4r+2GcE14CTUeVNAj+xgUjt8ih1tC9hWPucS/yThXBA4oDI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXZ0Rllhc296WW90RXozbXBJdlZoUUx3QjdhTXVGMTYyOWQ3VnRnS0plbUhu?=
 =?utf-8?B?czJxOHpCUWcxSkJ3cFZBeng1a1dGaXM1SnBGMW9CQ1RmWHl5RFJrSFZ5bkRT?=
 =?utf-8?B?M2hxTWg3dkRiTmY2N0o4ck12NWs3ckJBQS9XQUZ1VmpOOGtHUDhwU2ZTcHhL?=
 =?utf-8?B?WDd3VGZIRzg2VExtbjEvMlQ3Q3kyL1NqbHpGdFBxS2RnMTUyYU9JWlVXZGd0?=
 =?utf-8?B?Yjc2TXpDZWtNNmdIV3lXeXV5dTI3UVVTQ1hXR2ZLdzUzOFB3MTJJbXdFeURV?=
 =?utf-8?B?SEYyR3ZYT2hyTUxuc0h3Ym4rOHovTmd3T24rRC9zTDB0TlZ6MnZ1MVAxQlR1?=
 =?utf-8?B?OXhpWFhHbzlOOWNjaHJyYjlJeHF1RTlLNlhVazh2Q2JDQmhSY1NJdHA1ZTVR?=
 =?utf-8?B?VERucGFkdWNNQWtDRTRtKzFxV3lKVGt3VzFwbVdDVzVKcDRnakx2bG9IMi9Q?=
 =?utf-8?B?RGtQbm1qNTVXNEl5dVY2dW5waExvR1p5VjU2UGdPNHlhb2NzZ2RNTG9hSUU4?=
 =?utf-8?B?V2cvS3hhUEpicHpVVFFhMVFqYXEveThBemRzek1LNE5UYTBGSFlvUjZRV2Ni?=
 =?utf-8?B?UGp2cFN3Y013WVcvQ3hlUForbmxMRlk2OXcxdjk3cmJ3LzlMSEdKYW0vZFVJ?=
 =?utf-8?B?aG9VeHZNOHZrWGwxUERDNndvanl5VTJCZVBjUzEzVVNWcWRzb1dlVVNDV3JZ?=
 =?utf-8?B?U2tkQVlFRWYvTm1xa2NJVGdhUzFLSDZsOUx4U0t2bWJRRUxlVTFkMVA2eHJp?=
 =?utf-8?B?Q25FVVZtcHR5YmRsZWRvNjRsR0JIUlp4SE9ZalZXdUFTcWJZRVVpdElTYnE4?=
 =?utf-8?B?RGRCTzNPUisvenY2UG80NGxyMmpVeTd2MGNsdXJ1UmMwRy9WbjVIdWp4MFlT?=
 =?utf-8?B?OHR6ckJKTFMva0l0UldKRnd3Q1pGM2w2SzRoY2JzWkhPSExlK2pEZjNIcnJ0?=
 =?utf-8?B?azhVVjdDV3E5dUVseGJNa1pMZ3BoSk9zNXJUVVEralpabW1HU1pxU0VIZ0Fr?=
 =?utf-8?B?QlhoTzdqYmFqTzVJT1lnREIycDU0bU1lYXdDa2NHRmhKNG4yTzNCdjNrWHRp?=
 =?utf-8?B?b2dndlJPM3FNSVoxdjRhYUh2MWRuTFV5VnhRT0RUNEtUM2Nkc2FrU0NuL0s4?=
 =?utf-8?B?MCtnN0U4NXB0cENDWjlrTFBrM2R1dFdhTk4xdXh4S05KOUY5UmdUQ3VIVjJ6?=
 =?utf-8?B?QlNTSDNmei9xUnZDSDRXcGx4aGwzNjNwMys4SnNyYnFJUzdNMUtmb0M2VitU?=
 =?utf-8?B?bGhVbUYyQnB4ZktmRkhkejFuZUg1RFBpQWtwcFUva3c2dWtvUDNkQXBnUmhC?=
 =?utf-8?B?QUp2bVZmajY2b0NSQ3hmUWJTaWJxMTQ4ZEtaTTdaOE9iTHRHcGUvcUhiUURj?=
 =?utf-8?B?N2wvUk8zdW01b0pWSXRCbGVxQXBxQ1FJYUMwTmlOck8vUnlZR05EQjhXZ2k3?=
 =?utf-8?B?UjNoMGdMMy9ZTmhiYXhnamRBV3IweUhWc3BVeUJGcFpvSmpoQmg5QWk4MkJK?=
 =?utf-8?B?cGhzNld4QkdQVGUrOGYySXpZclZtRzJPUXpCZ1NzTXdUdG1TaEFVd1ZCQXBT?=
 =?utf-8?B?c3hMb204MUI3dHFRajJ2NDJDaTN2Y21lYWM2dUVqSzNmak9GSTJvdEdTK2Nw?=
 =?utf-8?B?N2hwaFpBYmlFdVcvVmRLWkJmNXViTHNNQ1oxcGVTanhLSDg4TmdQR01zSE1s?=
 =?utf-8?B?Y2RENkVPMDZVcFRUMnk4NlFFU29PM3pYKzRCVFozcW9FZkwyd2ltR0ZqL2VV?=
 =?utf-8?B?L2FMZWVSU3h4dnRhODd2Sk93TThDMitZYUZhYUFIWDdjZVRLcVFnT1JRVVY4?=
 =?utf-8?B?aXI1eFAvZUtqR2xRZitTOE9Md0t3VVZtb3dzUjhHbEc0U2U1aWV4UTcrekFi?=
 =?utf-8?B?WGh2Q01MSEErUzNoRE1sTlRYb2RUcnpDRER5T2ttMTc4SEp3RmMxYU1CREov?=
 =?utf-8?B?Q0J1WlJ5Z1IrU1QyTHFjblNPY3hwYTQxdk5MenVGZ2gwY3lURkZPQTJEUk9v?=
 =?utf-8?B?eHlZdzNnWVQ5YUtSQmZCYy8xeVlnSTZZeTh2UUdzbVlVc0Joemh6SEkrQmNp?=
 =?utf-8?B?N0hmeTZJTVBoRWNuNVlGMSt0cEZoY2xzeXR4dzhPVlk0Tnc2OG5PcS92TWhX?=
 =?utf-8?B?T251b3pLejFWdnpmT2EzZzZtS1RHN0xhYWFFaDlFdFh6UW4xaWRUMmlQMHMr?=
 =?utf-8?B?ZzRSckdBOWpPNnJxM2hkenU2WGs4ejdsb01HQWhlWXp6UGdIN2JvcXg4a0N6?=
 =?utf-8?B?RFUxOHlrY1Rpb2MzRUNlejcweVpRQ0RoUTRYWVVnMWhvdDlPY0NDM1hqT2RP?=
 =?utf-8?B?eENCVHByYjFhcXNjd2NaWlkrMlhweE5WU2V6ek1xbjRCUFdmSWFNcXUxVjFT?=
 =?utf-8?Q?rwoHYz+tbMEurQpavloHYqEC8vt9aP2KlQnjJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3820b040-fdb1-4966-2bbe-08df30756be3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:48:19.0324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ob48CAnVAGR0Swu7AiVUnRj4jzcms6XvMWucjqeocc+W7N9NFdJdcpBlYyhI7OwEAKNsT8Gqe532HBBS8vVmvfzarX6hrZsDX+jatKH9FUu9kGsYZkW37/kYn6L7Lci2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11651

From: Frank Li <Frank.Li@nxp.com>


On Fri, 02 Oct 2026 09:14:39 +0200, Primoz Fiser wrote:
> Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:
>
> - Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
>   swapping capability") landed, the touchscreen axis inversion these
>   boards need can be described in devicetree instead of userspace (2/2).
> - Fix uart3 CTS/RTS pinmuxing since pins were swapped.
>
> [...]

Applied to imx/dt-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/2] ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties
      commit: d8e221cde0d5f166bf32a280c60609e95de327ff
[2/2] ARM: dts: imx6qdl-phytec-mira: Fix uart3 CTS/RTS pinmuxing
      commit: 14706ff23ee6174de7a95d127fd613137014d0c8

Best regards,
--
Frank Li <Frank.Li@nxp.com>
