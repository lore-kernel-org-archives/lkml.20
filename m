Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752F486B8C;
	Tue, 22 Sep 2026 18:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102288; cv=fail; b=sJ4kBpsHnSL7EQrha9KYMJK5Uz+Kk6nFmpEPOljECxNIfAO/ybIT0ZtTSqtQWE0siALRzStddXKJDNmhzjO1BVkC0/fplmpNOup/+MYuYZhvHNBpVqPRI8yadm6jG/rhsLsdMhFEA7g3YBvdTcohXJhA6cLOGkTPgmhafV5m1po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102288; c=relaxed/simple;
	bh=ZBOENwhF1JG8GSzymhn7Ez36BnWNCh+3OPvVOYENtdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G5nkmHWcuEStzs+JZKgCVq4JgMy7kg/K+aYESC8YCym0WVCsbuEJ+uAfzv2zUDTfyjjKaJKt+dUFTQMCY51ynnZJ5o8RcOw7ZJ9pPPhdCA4o5i8x/Aekad59Ean8IncJtvTb30olX7a76DGFihNsmhkE6JIa2CkJDSt90EFVN30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JOjaDvwE; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JOjaDvwE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKASaD13Ss0UsDiZa3kDR+Qdyrm+VY37X+PHAybp8Lua6JNp4XfR639+j7NQNbUU8p9/+ne/FuKTPy7O1AwjKMG79NVTY4nVVM0SsbeToSrHb1oAJW/q2sjiEap+PG5ze7KaKwXSpvPaX87x7j+vT7o70GwrVTKtfGVRqqKSNName3KTxni4+orRiOTqQmXGn5e/weToiE/cOBrzfmIutWf4V1UM4G6HayETi/CADuCGvsiABC9rcNDytZ8KEYNPSg6XW57fJ4V+9wJjmR1+yvv4pjMJtoo4XmjcQIN68wpb6cQcbN1TVzsQRdFy6s0hgCITVxz6foOsLFbdHfvAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBOENwhF1JG8GSzymhn7Ez36BnWNCh+3OPvVOYENtdI=;
 b=Dv2QkSG46DLx9sk39uXnPGqKMtmjrtyCOS756Kwf9dDXLqmAuuY58j/7GbnTe1IwuhrkfYRQkKk+8bLVbhbG3ekNgpVSH4VDUG6mYmheJ8nVckrJsRqHWNVx8hqW94lC+YbWvhQxf2a+cKw42OxNgVMmZlwF3iVF0EMu6/6rLkA19+6Zl7G9IusGec1xrA+hFTvSh3gAke21xXMD/z5F6bXaQ9sZlPB/WOZrF/YVuL6KaMbYSJEt8hle05tedEMKnigk1BV1v8VfcQ1xt73UKBrkPimzmJo4Dcb7V4Ts316fjfSjCfJjIWxtpv1Wt9cl+ueXZV+V6ELIl4PBPIqwpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBOENwhF1JG8GSzymhn7Ez36BnWNCh+3OPvVOYENtdI=;
 b=JOjaDvwETJC9w1hFx4WeMJJFQCNQR/aJtMOqGiRYk/dn5FGFfFLyHPb58/EAhH/PTKmPjg6OM2GkcO+A6u1pWC1Lq6nWUsaCZlCvrZY5I861+mGpxo/rOH5e8AIZveR0ZOb/azE6bM/MqAJNa3VLkD4B6Suf662cQ0W671r446k0oI+pID940E3EIqqO2jAr7OBpZMYhHP853QZekByu/yG3c3jD0s2Gl75FIpsTmGntANvP0jhCB+92OXtVlzjFnL8wICNMlUHpCgGt5GYwYYY/vE8uORj8W1Zc0yjOzUpi7mkA8WvAPb3tE6uSrrkZcUNUDo3M2qkoQtyiTJZyWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7481.eurprd04.prod.outlook.com (2603:10a6:102:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 18:38:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 18:38:04 +0000
Date: Tue, 22 Sep 2026 13:37:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	=?utf-8?B?546L54Kc?= <wei_wang@realsil.com.cn>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUkY=?= =?utf-8?Q?C?= PATCH 4/4] i3c: hub:
 Add Realtek RTS490x I3C hub support
Message-ID: <arLLAEsNiGyb_OZf@SMW015318>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-5-zain_zhou@realsil.com.cn>
 <arF6ifEpWAlO10B3@lizhi-Precision-Tower-5810>
 <1453c25fb1fd4db1a928bf83e72187f9@realsil.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1453c25fb1fd4db1a928bf83e72187f9@realsil.com.cn>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6fc91a-b607-4fe5-ed58-08df18d8a324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|19092799006|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/NjK3Md+kQxK0smXhwHScItyvR543JD+L9cyFWUhouI1VaERYBonJiy1/PVQfZar1cu6mVwZ4NXO9OwBW9O+a7gOK11IzipW28K5hH+IdG9BGxmG/vUaoc42lI6lAAiP4BjvxCn7J4mGUL4uESt91bQO9SuzBNVNVTD53jklK083OoA2nF9LLU7zKLpS4hrsauGeZ0egwqYXNrnlSfFRc6eptpuW/FaevwyzZEMKPexJhy7vQ0kiXodLdCZnpGwu55MnUQ5oQcepdLavNbTitveChtkFwTo9dI8EozAnhxYOrml1C1sou2Ms48MvU6JF2rs+kJHS2rmZYDx49XV860TRUD8hX0SMRrWflNDK5ujCtDilRngDdtsLS71sBsQuJLh/FvjKxciRG/pGh1k13hBe3O08inOnwkPxUY/nd38AP2/yzlQRSBj3wEX/2VtohlXe7Kf1T7mikhxooP0QuDNuSSMO9/3tGy87NyW6KDDg32++CieWgWXG8bThD7NdGK/pNXHvYm1vribEnA1gX+DhDJMQpHaA3GS+7mtN2Y1AN2tIrsO8cJHHypN+IIrDK6qBMdjVi5Xx8r93jZxm46Al+aAIBO04ek6r2Z81XlQLc5D3gNeFBM8/ooqssMESq5FA0fan9Asdn0JIkgYtammii8zV5KHf94v1pUcvX8Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUFMeHJOS1NvY21CMVN5aURYTGhRb1Zyc042L044UjNubGxGSHh3aUZFeHdS?=
 =?utf-8?B?QmZhMnlYSkpDbHg3WDhpZit4TU9OU24xcWdWNWhrWGFxTEthcHVtNmZZY3NY?=
 =?utf-8?B?THFMeGdlN1d5UFRZZkRWWVg2dUdWakNMRHlIRlRZaHQ5UVdxRkt2MDI3RzY2?=
 =?utf-8?B?VFdPTkxMMmZDWTdlUnFTaktVMmFGZlY3V0tqSnY1VzByTG1ZYUpKaUdzTldt?=
 =?utf-8?B?L3A5U2NCRWFJNHFkK3NFVThhZ01GaFRtb1Jnc29taDgzbkppRUxZaExxVURj?=
 =?utf-8?B?SWg4Tk9paUlvaHBZK2I5cUM5YzZnWEVYWWdpMSsrakZ1SFFTZ1RzQ1Q5VGlp?=
 =?utf-8?B?MkRzVzZGQ1hBYm1uNTUyclZBbGV0bVAxK2JMZ3Y3aUZoS3dwZG90VnNPNXBJ?=
 =?utf-8?B?YVVLT0UxMkt4YU5GcDNKZ05PUE9WaFV3OEZQSkhPckRuaVo1eWJXNk9VTjdi?=
 =?utf-8?B?Mm9wbUpXa2pRU3NiNmh4b3cyeTB6MmN5dG5hNVYwOUdWcDFyUXdXZ2NXcjk1?=
 =?utf-8?B?K1NNaW53Q3E5TXJWVndteTdKRUpzWHFvWXErSzJTUjNrMTZPVm5DSGxxeG9Y?=
 =?utf-8?B?ZTBZR3dFd2RHR3QrUEhCNTJHQTFxdnI2dFVNWTkzamFEeThQS01RdU41UzNR?=
 =?utf-8?B?UWl6OGhOTWxncmp3VXNITnVSVnJ4dUhjNHV3S2U2dnEwV0Qzd0hsOVlPSjQz?=
 =?utf-8?B?MzNUdkM2S213QnlSRGN1S2xEN3dROUN0QkE4Y2U0MlF3WDlMVGIrZXBJM0lk?=
 =?utf-8?B?KzhFaGhNbTZ3WG80bDdDcjVUbjl3dHVqSnZnNzNoK3FBeVg4TThUdWVBSm5U?=
 =?utf-8?B?c1IrZExSaUpKY1NwcjMvZFV5bmg0N2tFajhVdkQxKytHOStycFZvQmY2dWdM?=
 =?utf-8?B?RkcwQ3RyaVBISXZ1TFpFdjZjQ3NUTGJGZFZ4ektKbVI0Ni90TzNKaDRIRjlq?=
 =?utf-8?B?dVhqSUozUVJOcStUT2M2VFh5bFc4UWc0MGlrcHhlaSs3NHFjSGZmUXcrRC8y?=
 =?utf-8?B?UjhpdHpmemFZUVdDejRHdVZUamt6aHpLbk1uUzY1d0M4bThZQ2JpYVBUS1Nj?=
 =?utf-8?B?MFBFei81cmdHTmdqTXFsbU9FWEl2NmVzaVJFc3JLZ21CZVlQeHMxZmZrOGNC?=
 =?utf-8?B?azlQTW5PUDNqMWlTZWtHdXR2cW5KU0N5S0Z0cEt4Qm9DczVnMndNZTFLaTVH?=
 =?utf-8?B?Rm05OWEzYkovRnU0SExBcVhjc0ZNU1l0bnh4NzhCYzFkYTZZODduSWZyOG1K?=
 =?utf-8?B?Rm52bFdpRnpSRUdBUUtSSUxXZVZDaDlZSFozMitZSGt6bUhXOTBWTEx3RnUv?=
 =?utf-8?B?eWIyQnhsb1VSZExLY3orbEY2eXZ0bk8yUzU2MzJnVWJjOUkwNUM4QTBmMEE1?=
 =?utf-8?B?Mi9KdGVmY1RzOVJRU2N4a0tXbEdOajRYdnRFd3lVMEkwdjVrcjV4Q0xMeVZ5?=
 =?utf-8?B?LzZtWC9IU0NOZ1luemZxV25HVWNETlR3WU5rdGZaTmpzSGk1ZDloYXAvSXgy?=
 =?utf-8?B?R1pqVHNudnU5Tlc4c0ppVUV0eUlxcm5PL25tUG54djJsaG53SmI1ajU1U0Vv?=
 =?utf-8?B?TUJDUzRwY2JYdzBkZ0l1VzF6eklTbTB1SnJHU1RsSkNuTVJwV0g2ZkZ1MnYw?=
 =?utf-8?B?V0U2aFpQT3gwU0hubFRkcWY3Q0xNdVJYcVNZcUQ1MWxUclJhNklmSGtnS3J6?=
 =?utf-8?B?Rllhc0M5N2xaUmZmeUg4SGtCOFE2OTJBblA1cUFiR01ydS9WNUlCYmpObU9T?=
 =?utf-8?B?L05SSnFRTDZyRlZIN3ZoTDJWbWxGNlFoWnBMVlZtcEM1V0FCZHA1VVFRWUVm?=
 =?utf-8?B?T2U0K1JCR3pBTXlRQWhTbUdvcUFMcHVwU0huTG1hblFNVEJSQUFsbW9LNld5?=
 =?utf-8?B?a3hjWEtCRmlEanV1UTdCdEZKL2FZWWEwRkRqc3E1ckdjQjFYY2pPTi9ZZkI5?=
 =?utf-8?B?ZXRoWDlKUkduMUlTZHRFUmNwTllZNEVGZDRXY0FrRTREL25ES1hZaFBxVzRo?=
 =?utf-8?B?ME5uWHQrNGhjd0ZWU0t0M0Y4WHFJSzhUWjVmdjB6c2J2L0U5SkVtNkQwSnQ0?=
 =?utf-8?B?NkxsNUgxV2JRWElQRHA0aFZDOVdOMkF5NDQ5STVlL25XazBCZ2RxYzI2Y3Bh?=
 =?utf-8?B?WVN6MFRsT2FaZTQ3U2RoK2U3QStOeGxtOHRuZEtGcUl0ZUEzNzVmUHdwSzlw?=
 =?utf-8?B?S2ZjZXJ2ZFR2cW43Zkt4aXZDVDk3L1NTVHNsMldtaEVaTDQzb3FyakhXcGx0?=
 =?utf-8?B?blUzYkoxSjN2ZlVQM3BIbUo3UlJURWdQUGhldWxQck5YOXNHSHR5UHlPZERC?=
 =?utf-8?B?S083Ui9nT21Ca1RvdEU0cXNTcE9nYmRGejFGL1h0MmhKMDRHcFd6eFY0Mm5p?=
 =?utf-8?Q?NHVS7n+rxZuH15vvhyPgZsBACJ0O6H/pLt/cA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6fc91a-b607-4fe5-ed58-08df18d8a324
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 18:38:04.2354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPYRuGIgxiu6rYG+/mX/FRgXn4n3BQ44fogZD5FAMSzvoA8dA1BD/oJ49F3X88Os5UtUWmDkfxKLTlpOYaanPb9MSAsX8GjRw13OY9ev5ZTy60T0N4ejU9LowMciwSE/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7481

On Tue, Sep 22, 2026 at 11:17:28AM +0000, 周寅 wrote:
> On Mon, Sep 21, 2026 at 02:42:17PM -0400, Frank Li wrote:
> > This register is the exactly same as P3H2X4X. Can you direct reuse
> > p3h2x*'s driver.
>
> Both P3H2x4x and RTS490x are based on the I3C Hub Common Architecture
> Specification, so identical specification-defined registers are
> expected.
>
> However, the current P3H2x4x driver is device-specific rather than a
> generic implementation of the specification. Do you mean refactoring
> it into a common implementation for devices based on this
> specification, while keeping the device-specific parts separate?

Yes.

Frank

>
> Best regards,
> Zain
