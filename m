Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793980042;
	b=ix0vwRMVAy1vqnRFaAW0YhyqE9VU3CLc4FQxZUOSTh23XFmyO8FHwSadqbbtbsJky7Ul
	 LtM1Gowqi03m628brqsbETjPSJL7ToBUhzhQl2M77iqzFoyeSIVvmOsLbqtbl893vEdCB
	 K82ispab8y/H6F5hC1Qaoa9ejvLJ2jBE/ITtALI8U04oomuHfQO1FB9s7MJr2VFWfmynz
	 O7GaQMsnDQmrFtWzcfe/OpaTa9SqkIZgRnLuaHK2GJLLGYBTMjbVWv7A1W0Td7wHi1R92
	 r5oJ/5MfvlGPP3vqC4/9JgxxBpqvhCVoFxrFLGAWwGb3dsSKuL/QU/DH1qooB/EZmbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980042;
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
	bh=/P8EIqFlmLbGRTJqJd3d+LrH+ILJYwpDFOazE5gbLx4=;
	b=oF9cGtuUHFv1OAUPekm5iwmbL62fOzyUwj6mQzeK5SS1NPqgv9KHVmn/TB8XPDaxFArA
	 yn4MpPgc6MCoRNZepst2/Bq1PaYPqaZemV/Cc3oXUirehtCYutyKHkJRrnGF1rPL/Oc07
	 LFmd8sBIHje3qOwhwCHk/65rk2FYWal8GbhRJOI17bJRBC4shwZRt+LVjl74ypm3PbfGH
	 bhgiHTrnQngzOzdXiaZTXt0TAJ7sRYl94x7OoCmeceAQ2zqKhXalD6iqrbPo/6Oc+1Nzp
	 hKf5Js9VyLbDJSiVQY3iUGsVtzgW3h19C4h5GswHUBIS6PHG9zUWWdpOj5q9aoB3Lbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WKY2COVw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.3
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535EE606A32C;
	Fri,  6 Nov 2026 15:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535EE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WKY2COVw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVVqOQUuL9c4AWmEWMCqDm0Cv1rSyqP3wMn4u/ds40ERH3zhmNfiO8Ukt6ODZZ/vkvcF+cr0aWlrm9RKb54wgj+xLXhr/NN+bXjIFWfSFWdNfwU7GjlyUWl2nMrhp69heWLbeQmKwnhWOaGeEW91x6BjxblEgGOLn+wNY6aoAOUfb2QuZuASe3bmWgOiftlnU9tiEZoLQ8vx4MvaPlJi/3oerd4sOukLd+Gvj9JJytY5/LVFMCfZIclooVa+vYp8nobd+syaWhH40EYh3QFsJACKbuuqD/wgs/QyKN2pMWBaLzysqpCx8MZFhWy95rGlrEFiwz7K9Kbu59XemkCsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/P8EIqFlmLbGRTJqJd3d+LrH+ILJYwpDFOazE5gbLx4=;
 b=EYRbzuCMkcaCPOoaL9tJocVV5CFNqm24cSp5vjhgHkwACMiIEA2TnxINmJPfBAs7GDyx0nHp1RWOBKR9kLHjnQDmNILkRJI8XUnLyHZcy5GrIYC26N4ynAG+ysDfbzWChj9q2ANHRCXCmiOsUNNYd6LJRGPzddCSDkxkawLLLYR7WaxITCWkzVLBIGDYiOzQc1uEfPT+R4Il/BzIE6GPIOVJms69Xj3xmFKm8NqOETPbUlnfObuhA42siIml7xD90TLBksWtK/0f3zJDo1eTkloOFmM16JUiviQn993MCId2VQCh3rm5BigbPR2ODpLU8O/Z/hw4TF1jRvj8HYoI5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P8EIqFlmLbGRTJqJd3d+LrH+ILJYwpDFOazE5gbLx4=;
 b=WKY2COVw2F7Uu60T8SbiwfZ9DuS7KS91766/D3RqEKMXcn8fd69MQ4I5xsHIRsl/6iUKoV+f+hgZe1J2pDkXFoI0plQfEltX2XfK9Le5MjisH/x872juvh1RS3KKRAoI1ReOWLaegmCGBV+cW1IBk2AxjsrNFzOSUuywFueZ5E+yZpdiDUmkXM+8UM6hLqY+zgMfQDf3Sv9AXWgPgQEGZJ0iW99Itt9KdpNzXP6DCL11lPAlFtDuV6qtItvvR6kPQ+YxE1cn9HOxM+M4+XAq3DQ6tdJIzYjMvWn6VJnYpgs8yagpjhtOLBhteNu13ksQrpIEWmtKKksO4xSioUWJzw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8401.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 15:47:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 15:47:19 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Peng Fan <peng.fan@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: freescale: Re-enable A72 cluster on i.MX8QM boards
Date: Fri,  6 Nov 2026 10:47:13 -0500
Message-ID: <179398000821.3461841.11297879997237397092.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023-8qm-v2-0-a8812a888e3c@nxp.com>
References: <20261023-8qm-v2-0-a8812a888e3c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7P220CA0060.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:224::25) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 05eb9e84-0c8d-4dce-7ae4-08df3c1d3d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|56012099006|260925022911599003|260925021311599003|260925021911599003|261022105027099003|11063799006|261009223027099003|261026140227099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	iVBo85OXVacogQRg/4E7C+P7yFe8ggYzJacJI03X37dcl6LVulntTReiKNOsLDu6d4+Z/wm1ix28UJDo4K27zuD/Tqhd1NIcg44lriXfGkPFoGTg0x5vx66YdsqWoEBTLR5ui+TobTtBPrU4c9O0DmwrLOmrbZlrLH2m4ZymqYKIi2XK2YKea6Vg7ps+QaTT5AwywTkFro31Zkk91fqPnyg6bQ4TakW3J/EzPeHVVyQtrLfUH/SqECaqcDOemHnSN3IObCpeYCb481dgjshrgv3X77tt8YuNtQYYLRqPUJFq+hUOSGIitMF95k6gmiuiHzu+64fLTQvzZHGhTPWiKuVmfXKJwB3vQBQNPRr/0sHz4Q3A4/bjCwKF5YWVYZIgqj6LdFhyWp6V+/x0UI/kR9zbvSxJxCdihynw9NPTKGbEeRsSf0l0SrkOFxN0J4kHOt9Ob3XWaPQTvBs/pT/1y6MXpZmWNjHVWHnqtqC7+jHOU0HfiPNke3ox+uam/vekrBe4q4/Zjw4B7jZ2Gl0/e1cM9OmsyCMkBHfYHW3Ttwn0WWkYlqEs55WdXwmp5JBl7uLq7IlXVU8+MxnKGo+0uiWUNLjMwv+WIv4sOnOZ9L2lSXSYpRPTloMMlpp2602MAqZnSjcox7FigUI+M/TvPYXCE4n04S6gQBzmlORFw4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(261022105027099003)(11063799006)(261009223027099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1Y0Nm44alRpTDRaWmRqbUlMTnZWVnRIVWt1VGNremRnbytGTW5rT2NZckRQ?=
 =?utf-8?B?TzFaT2ZmY0ZES3ZRNWR0L2FJNTJad2d6TnE5cDE3Y1ZleEIxNHRYcWFRb2pp?=
 =?utf-8?B?VWJaSldIbVNCUUNPa0pCYmVRMFl4aUl0T2RYeUgzSXdHUEozN0dHRGpPS3VI?=
 =?utf-8?B?YkNnNm5Ebk1YZTZ0T3RHZDJMUm00VTArcVJjRytyWVRRUXZ5d25uRkVZUGJm?=
 =?utf-8?B?TGJoMXhiZEo3MVR3d0Vaa2tWS3FDZURGKzJJQ3AwWlh3ck56Z3VVT3NDZDYz?=
 =?utf-8?B?dk1EblZ5MUU1eXVRdzhNTEJ1M2Nzck91dEVySi9VR1h2V2ZaM3BKTWo1d21z?=
 =?utf-8?B?dThrUnZ6UTRkV20yR0c1MmdGY29GdnRlZHJSdXZ5eGJlUnhoOGZpNXVGdEpx?=
 =?utf-8?B?NFA4OERaRGMwaU9UcDZIeW02WFROMzBOTUY3cHI5SG15dk1sTjIxYjlPQWpk?=
 =?utf-8?B?N2ZrUWFYRW9LSytTVEY1L2g1S0tTMUJhUG1heFNvVGtibDRQU283Z2FOYXBy?=
 =?utf-8?B?eVY3dmZxSThHTUE2cDJIdkZSOUx3b3MraDhqTTJWVFhZT0Z0S0RoYXZ3a25x?=
 =?utf-8?B?VXVvbFpvb05ydVFVaDBrNUhGOGdmMVZmYVNoOVdrLy95MDdsbHhnaHg2QWtU?=
 =?utf-8?B?K0hmOEtXZGN0ZWNVZGRYaGovYndUVWpGdVloU0NITWFnU01aQnhiQVRIMUxj?=
 =?utf-8?B?Uzl4Zmx2UDFQUy9kL2hoNjB5eDZvL09BOElsTStKeFM0ci8wUGNCYkJxdlBB?=
 =?utf-8?B?RE5RRkZGSklDcHRxa1JIaGttQlJHRjF0ZzhTUDV1dkNUdElRUFY2VWMxYnBi?=
 =?utf-8?B?ZXA3ZnZUUlBFTnd6M0IvRWVnYnNpREtIUXdnYXlRcTc2WnlVeVdTVElJU1ps?=
 =?utf-8?B?OG9uTnArcmRvZGdlN3owN2RQWkRyN0RpcTdnVVA4WFFTbGdZQ0VYbFNLeE44?=
 =?utf-8?B?N0ZFSmFoNEJpS0NvVVlDUWNiS1pNZHNrT3BhaEZwVmttQ3VVTzdZRGgxU1h5?=
 =?utf-8?B?QmVJa0JoSklUZ2M5ZmZiaDBhZU9STSt0eUhSY25oelJ3dmxZRjdWUXE3eUQ5?=
 =?utf-8?B?cldsdER2MnFreW5ZaFcybTFSQUw3RFhMS1hvMDc0aGEySHZCUnNOWDBNOGEx?=
 =?utf-8?B?QUh5WDdaY3B3UTk0dDJyeVE4dWpYRFJrVlQ0cjJrMkJTcW9iQ2VsTVFpUTlq?=
 =?utf-8?B?SXpsWFNScGxYNUNZQk5yK2xodmhlQ041S01tKzcyZWY4RnVTbWI1YjdaMml3?=
 =?utf-8?B?cnVNdGVhVzdqT2o4RE5SMVYzWFdZM0ZqdHR3TDRaTXVDcGlFYVcrNHNQc3U3?=
 =?utf-8?B?OTU4czA5WjhNU01McUpoQzNFdVo3aGFwYUh5d3RFS2wyYmo5bGhiVGdhY3JO?=
 =?utf-8?B?clVUNGtXWjB4S2ZpL2MxcEJCU2ZKajJjOHJ4Mm9CSWt1TXN1VFZUMzRXR21Z?=
 =?utf-8?B?VmFmYi9XWi9CZkFGK1lZTTRpTWlXekgvMGgyamwwSHdTalJSV3BoV0pyY2Yy?=
 =?utf-8?B?ZENUVnRzMllZRnhqbDRLUDlCa1hsRlhMYitsM3dJNE9rT25lakMyd1lrUVo3?=
 =?utf-8?B?UXNnSUlBeW1HTmJDV2J5QVNVajRmUGxqNTNxRVFzaER6ZjVuS2twQ3RqaFZl?=
 =?utf-8?B?UzZGN0dkOE1ZdHVta01qWTYvV2liTU5TUnNlU2Nrb1lrdUNwQzNLcEFmMUpj?=
 =?utf-8?B?dDlaVUppcCtpUThNdkV2QXZUbVpBdXg1d0ErcVBycHBBMHl0Qnk4UmVZc05Y?=
 =?utf-8?B?VFF6MUE5QmdoZnI0eEJZekFGbnc3Zmh5TmF6OE5NWDF4U3UyaHJrUFZ5UFd0?=
 =?utf-8?B?NTk5VTV4V2N4ZkV6OU5HM2kva21hR3lIN3RxejJNRDc3VXJYM0ZMUnRaTVkr?=
 =?utf-8?B?bDhYQ3VxS2VmdWYyT3JpK3VJaHZKVEMrakRXQU1sSENkNXdtVmgzQ1ZZRlNT?=
 =?utf-8?B?cFZoUS9RRU5IdkxiSVBvZHhvYWdzT2VickZXaTVHMk1mcmdNTldsZlhHRGFq?=
 =?utf-8?B?eC9COUYvMXMvK3Jib0ZHRUlFUEV5bmhaNE9oSFFGMzlpSU4yaVM0LzdaZnNF?=
 =?utf-8?B?TUtTbFU4dmxUMmVEWVpuaWo4d2RLYmxTcWN6dlR3aG1rOFNaY2dyOXhzdjgz?=
 =?utf-8?B?Z2t6S1k5NFZxUG9KeXRvTTJxdFY3ZEpJd1FkbmlUcTViOVczZHNuT3Y0Rmtu?=
 =?utf-8?B?ZnpvVkZwcFlkbWVQTkZoMnNNVU1ZMC80ZzlyemljYkNHelpjdVhURDdDZVF3?=
 =?utf-8?B?bnA2dmxtU25rcVR2aXVFU2hYeDdhdGpVdWVvYVZDUkQrMXhvQVVnSkJHU0pO?=
 =?utf-8?B?SEdzL0xTdU5LNldUKy9odkgzR2hGRTBWTTh3NmFxTzdzUUxTbG1Ddm0yYjZ4?=
 =?utf-8?Q?4KNKEGaq/1IMVGHD3uB/0ereoXNtHG+VxtU46?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05eb9e84-0c8d-4dce-7ae4-08df3c1d3d82
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:47:19.5885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhkP9qZe3xRb1ja5DbLJi6KL9GVoXz8NQSjVaRQkDR0QMvJ00pPYRnu0SOT2G2QsQ5pCvhT9OA+lSMPOnLwRnwZQsirRUuHHEDXSrrvZPw+4nujoMbHr9r5HcXbEagbl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8401

From: Frank Li <Frank.Li@nxp.com>


On Fri, 23 Oct 2026 10:56:58 +0800, Peng Fan (OSS) wrote:
> The ERR050104 cache coherency workaround for the NXP i.MX8QuadMax and
> i.MX8QuadPlus SoCs has been merged upstream as commit d44e08dab27d
> ("arm64: errata: Add NXP i.MX8QM/8QP workaround for A53 cache coherency
> issue").
> 
> The workaround addresses a hardware defect where the upper address bits
> of the ARADDR and ACADDR buses within the Cortex-A53 subsystem were
> incorrectly connected, causing TLBI and IC maintenance operations
> exchanged between the A53 and A72 clusters to be corrupted.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx8qm-mek: Re-enable A72 cluster after ERR050104 workaround
      commit: 38aecc5bf9de1e26dcc8fc0a5a6882593248b293
[2/2] Revert "arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster"
      commit: df30ccf2cf43dbe0f1766eb47fb84c46f6401ffe

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
