Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902548;
	b=iTsU7yRs/q9mkPi/lXDPdXURxQq6saPaij/On7yybjwKd1EMMDvXyu2XwnXEJb9sKepv
	 cSXqziH/Fy9zJd2x3BeyafGZ7mY0QAw5q71DInaRixMND2hRMZbzdFWVOztsMmB717CC4
	 sI5shg46by1yhiXtz4fYTOr36eLpx0pfPhxcEKj2y+/3N1s9ipiT1hTBsX65SsiQkgo85
	 /VduwlKmRe4JbHdpThd8Zd0fQ9fgw77nnIBkqz02sqEWKSeoyVPMM9gUUvtmaNTxLaEJR
	 E6taw0y0fKmlRc/fkjBZgUK3NIebRXm4934uV59ztT2ME9jRXnG+DCUKNYoqmrILzGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902548;
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
	bh=X36p78LSBRoTgHkyJR2REj9Du0/SwGMudkAVR8xVwAc=;
	b=czW7w6ty090mHrnXFW0vmm/qJwtmcAW+syHoS3ex2rslAFvo+oSlsGT5FNkVAu1yjEAS
	 aXzCksTfs+/3HyXGsOyDeg8pCwsEQoCNOYU05xUdFsi83B7CEfEGf7OheE82gbNCxh9Po
	 ocpZer0qz6wOiynbR/+OxCuL+XPFlr0SQiCRMYze9M2LcMoO5rZjC1Q8FajpG1gO2UBiP
	 0mvM2ZBkLXbZR03gXJjAa3R+vOvIWUo4ZHFtZ0lk7XlWWPIZQoDiRciwXWK6hbdmIpEEj
	 DQBhr0FWQVJrx7YTqiNfZb8AU2Kf8VISDM2XEQ7YW8pijvROSuJEn4dTJS5J57JVKSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PgbaVtdN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.8
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E3C606A31B;
	Thu,  5 Nov 2026 18:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E3C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PgbaVtdN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzanUYaLRpiZ7DWvmOQhFY27tZs/fUIypc8KkZ/BJroC59clO8UrFBWePsjGmeadadMITRkKyqE/k2G3sL6M5tLSk41y+jF5y/4KlLJAJSAEXPzcw2XtnQCbhPLoJoZUcCzM1ADXjNNxWJQfPe80bQ45jcs5uv/DO8KCeAJ+4JDE6PmBQmztq5DSw7edux8j0ULcZGNApct3cX/K+EWRHghNSC7glPCLtHbafiF0IBXitALdJGtMf0qFXyqT36tb9FbkANEWp6A54YlHf8B+uvuP7Kvf8wtFTh79NFRUk5ktZcNoJBA4xED+cX+S9DMLTp7DaIcwSsCrHO56czcXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X36p78LSBRoTgHkyJR2REj9Du0/SwGMudkAVR8xVwAc=;
 b=HmnWQRshbNpQRMo25xvdCHGNPUXcxwXO+NEIfpPbt3hzHeNg0pSlAZRDNg9WM93A6Gcf4ZNnX+MBU1AbaBrnFtSBjFLOdgQRZ/WdrhDm9VyOFnOvg9TyVwiy9BA9nETPni5Y7XAjNbek+E8aLeY7q44AZOyqM4OZXurHvxXXwqR9Vi0PHB64+8kX3tSeRbYr4nsVlgdduZtULVH+nxHdBiqaZdCJkiGLyTAbj9ET/wQyCFvsjoR52ZdQkEuIFLc27CLbMAGwz0Wb6q3eGQtawD0MxauEaG40qMclRfLYHcqOhRaX1nXXGXetRFy/bDoxMK0ivA13MMZxzFsSF2WqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X36p78LSBRoTgHkyJR2REj9Du0/SwGMudkAVR8xVwAc=;
 b=PgbaVtdN8A5ppswUl+vD2vyaEj2DYFqXsS5rkKM6ZvpJ3yj7usS9Rv8VEDWaQ1rnyYwCzW2TCH8elz8xAnfJ5Ef56waB/TDVzu5QRGOVBt1ta5u/3ljFZVxwxSApJ/jAJRQzvJ16h7pEsxTr7y6Bla0xmLAskeqBxNxndPyVZwcN4opKpN3Ecx4gZWqUWJMUNWnn4jMmFrgUUoYLH1RJSa62nBHA9yhut+ICvEm207vu1FPur4C2QqiyeSW7KbfXC5+hNn8SzYJ50wPxSArRvFVfOOEDFiCzIFnH3bRBtISC+dKb9Yx/SBNDDKcGUS/WNfA5VrQRn8Uao70gK6CXWw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6772.eurprd04.prod.outlook.com (2603:10a6:208:188::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 18:15:42 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 18:15:40 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sherry.sun@nxp.com
Subject: Re: [PATCH] arm64: dts: imx95-19x19-frdm-pro: Move PCIe PERST# and vpcie supply to Root Port nodes
Date: Thu,  5 Nov 2026 13:15:30 -0500
Message-ID: <179390252548.1431843.15669463456227704701.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023-b4-imx95-19x19-frdm-v1-1-a15eecbf9963@nxp.com>
References: <20261023-b4-imx95-19x19-frdm-v1-1-a15eecbf9963@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF00013316.namprd07.prod.outlook.com
 (2603:10b6:518:1::5) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 118920be-c155-4634-675d-08df3b68cc87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|261009223027099003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ot+T58h9XVBbBtxr8ujNbNdlvjXVb7Gck7oUUOznx2J17caOtWV5Rr0GqucJ9FunlTLX36lWbv6/lx1YoDqnlnIPWJCSJdTmnUlXCcJypFznFOqv9vvVMR8I/dZN71Xfs61a+6BO5gkeWAseHsmK19J6OEgjZzdIkdCFx6r5tKhvKLujYOFk8VIG1LWQ+CMJGf7+34PRdJY9K3t12SbLd+vrmfYCNVuzwgMONZy6eXyTWJJZm0DsiC8pLdEUEfbfbMCdtykbwN/Bp7Aivjk1YSQ+HVze9eRYDT5qkEVYaF77JcjSriFI4AfDeZNHck99CQdHtDtSBmbOag9Wof8yOM8XWMwQYNG7Yf+ZJGeYL41GKS6BsOzOOOVBHsPS/Y6BpaS/5l0qaRDtErapc8J8zfIumq32EhubWE00nn8HKA6vlIEYDo9zlLtEIbb1aE5mQReRp1O+g7+NHdqbHIdoa02Egs420jMXdJa9omofAHqv+WjqdynoWiXjdcevTqUaXPQsuFbKHc6LNUQKvA27X70rQtBWZFOHe3quNQIp82vC2u20luJQrKXr4x15NiIe5XU1ouT9GLZyRet/zgWw/KcOKdCel4YFCs3Gw1mkSzTJKWtNYjIE7KLvv+qy4A3BMjWd9HpQDtRags77Yz8TeEj+oBmiZttR/KEf3XWxZGY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(261009223027099003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXNRaGVFclVaY0V4R0YydVZJdEhGSUNqSTdXUVg1SGJhdGNTVXQ3dnBOZlQv?=
 =?utf-8?B?YXg0b3RVVFZULzRQRG51VkhQSWRwa291U2d4dTdydVpNL096MEliV3JwVjNT?=
 =?utf-8?B?QUdoQXY0Q3A0V2RQcTVpT3E3dHRDY2Fya1RIelZWN09yY1VFRUtjekJOVnRT?=
 =?utf-8?B?ZzVzai9vam4vUXpkUkFickRZSDVpc1paejgzSmpqOXZqK3JBTzJ1aHFNRTcv?=
 =?utf-8?B?bVlhSXE0NDE4WXRpTG1ZZGtra2tmd2d3SFVsMTJvTm1OVlc2UUlGU0gxb1RC?=
 =?utf-8?B?NGxuSkZpMzhBVWRWSGFIVFptU2NqWXFUMThsMHQwYS92T0NPelJONVdVcFl3?=
 =?utf-8?B?Y1pGSkhtSEVuc0ZWc2lBTlRIcWtNZ2RZZ2tNWjVISkpzaE5ZUTVvNExyS2xF?=
 =?utf-8?B?NWlVejJRUkdLZXZvZTNnYjlIeHZDTTdIdGZzUlZ2aE5aTk5Hekc1eHRVZkd1?=
 =?utf-8?B?clNoWEtxeTRYRHJYODQ5Mi9obUZCcmZDZEJNZFZjaGR5dzVpQldRVXBDZSt5?=
 =?utf-8?B?VWhVNE5VRHQwd2V6OUtBYWtveUdlVzdLaUhWaC9nNFF0SXJRYlRVTlBzYmpj?=
 =?utf-8?B?VFp1Q2ZCbnJTTmd1ZnJlSS9BbmluMVE1d0JtQjROMnM1NXBiR2pZcTFheXox?=
 =?utf-8?B?clB6N0xieCtlaEtoemg1Wm9QWmpaV2VoYkc4T3NndDR3d05aVW1JMG03ZHVV?=
 =?utf-8?B?cXV4TEd5N0g4U3I2dlk0L21wZjJaOGFYeFJob0JubW1BTXdlcFFpblFydHds?=
 =?utf-8?B?Yk5vRnd0Wko0YXdkMEFMTGY2aGZjMllnb05DRVVMQkVpczRPMkhTYWlzTWgx?=
 =?utf-8?B?Vlc0TXRQVFBSRGZGMDN6dktDcHlXYi9lS1FxbTMzaXNRd1FQRTZDZXhtU1FZ?=
 =?utf-8?B?eDV6U0NUOC9CNDdwZ0VCeFRQR01aQW9KYVpFdUUxVUhCdVV2QWRGMVlYWFZC?=
 =?utf-8?B?UTRkY3h5SU5CT1p6aDJmUWZRY2RUTll4V24vU0JIMnI3NHQxanZBSnIybThr?=
 =?utf-8?B?ZkVzUmdIdThnbzJCc2FNQ0VGQUx2bHhibTNDWkRMTm9yWkRPdk1DR0gxSi9Q?=
 =?utf-8?B?Z1BHQUJGUm9CblFnbjJaVGF5MUprZVArS2NoSUF2aTIzYmlSbmpINEtnMWZu?=
 =?utf-8?B?d3dxZzVUM08vY0VEamRldDEzcFZWalJZYTV0MUo5aWt1cHVxekJ4TzZjcDZS?=
 =?utf-8?B?Q0VFcmhSTUZSdkE3cWlLa1R2UzgwVkhxZHJxc3FRWFp0bHFmbTVhNWNWQmUz?=
 =?utf-8?B?OXF1WFRUYTZRVkplbGJTRG94cUZvcnRKZGRJZlNhM0x2MHh6ZTI4RUM5WTFE?=
 =?utf-8?B?U2VhLytvNndRTDhkbGgvdkxlV1FzQmQ4eUNvL0N2cjJkeXdZUE9iVGJObFZ6?=
 =?utf-8?B?L0FpbXdIbFFhbzFOWERGWGpuelh1UXlZOUIxQzR5YlNHU20vT25QK0ZoNjE3?=
 =?utf-8?B?N3V2dDNPWHV0K1dlUHZtZ0ZHZWhPQ0FJQXB6M29oN0hHWExzdnNWZERab3ps?=
 =?utf-8?B?dlhXaE41YnJvZUhXTU9MdWVSMlI0b1FMT3FjejczNjh6UlVLR2hGTGlXZ2RQ?=
 =?utf-8?B?R2hkcnJqOE9LNzcvSktaQUlNaEphVmFpdmFEMW43TmNEcFVJS1RIOWJFWVZX?=
 =?utf-8?B?VDJpNDlqTWhwYngxSXhSMWIwemFNbmJhNHcrbms2TTA4b0krYUlzOHBGWEoz?=
 =?utf-8?B?cUcwNFZGdUpGYTYvT0ZJNXNncXZzQlp0aERTcUkxTmNKWWF4RlcwaXU2dklS?=
 =?utf-8?B?dXUvTDBQdC9hZkNaazRXYys0UWF2ZSs4UTJJK1NPa040alJabzRYQUs3QTRm?=
 =?utf-8?B?UnROTnloMnhHVi9RWjhWKyt4dS9TdFFEeDRIdlU4YWhyWUxoL1NLd1RseW81?=
 =?utf-8?B?aFh2d0ovN3BYZ0pIZGsxazRpS1NNaWtPTFdDSlRNbjZFUlJIVDBzYVJySmor?=
 =?utf-8?B?bTlPYzdJU3liU2prbVUwdHAwWklzT2hrY0xlUkswSGdqMi9xdXBCendSYTBS?=
 =?utf-8?B?bjMxWGhUMkpEbWR1SlpKZGNkR2pLdEJrQWxlNVVkdE5QTHJYeGh2STF2alEw?=
 =?utf-8?B?bGRMTlpDZG1TS1ZkRUVGRG1NUk80ZGhnSWxMME9xV0Rvdk1nVGlxdXJweitr?=
 =?utf-8?B?OGJFN0VGanlKVitpUjdvMXlUaFduRmpxRTdDUWNBN2hXdEpiNFk2UVh0MlJk?=
 =?utf-8?B?NXJic2g0emZkdmVFaXIyR3hJYXFLZWkxbkpsQ1FuSzhDR3g0V25zV1lVYW84?=
 =?utf-8?B?T2pkRGtHdm9XYXJvWnJYcFRqSU9YNTZFcVZnM096cXEyeEpHbzBYUWtzSlZO?=
 =?utf-8?B?bk0yWFNkd2JiM25sekFJREo4aHlHcnFCYjdQOThJMjlidnRZWjVBd3o2elRQ?=
 =?utf-8?Q?ztILTLa4GSp1WbLfzu1qL9rfFrWFmBDTtwX03?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118920be-c155-4634-675d-08df3b68cc87
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 18:15:40.4984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1tCvjdA53F8sLCZAr3JUfiAiVwJi2n7Yox1Jxntjr8Nz19RDLPGO+LqT44fmKfYrdt61dbGQ9vbh/iZvXZJzcjRpafk86zEpyfGvIH+FjzYGgOvccMMi7GINDUESD+o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6772

From: Frank Li <Frank.Li@nxp.com>


On Fri, 23 Oct 2026 17:37:49 +0800, Sherry Sun (OSS) wrote:
> Describing the PCIe PERST# and vpcie supply properties under the Host
> Bridge node is now deprecated. Add the PERST# (reset-gpios) and the
> power regulator (vpcie3v3-supply) in the pcie0_port0 and pcie1_port0
> Root Port node.
> 
> Since i.MX95 is the new platform that under development phase, it should
> be fine to simply move the PERST# and power supply properties.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx95-19x19-frdm-pro: Move PCIe PERST# and vpcie supply to Root Port nodes
      commit: 21594a3197cdfe7ac5204c7471dacf573c56290e

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
