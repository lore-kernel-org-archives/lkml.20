Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013010.outbound.protection.outlook.com [40.107.159.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A19524AF6;
	Thu,  1 Oct 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866447; cv=fail; b=TOSNQZuZA0Ak13r+n56QwrYeRqbw/+j7kglCmRoH4AoDPX/D1pir4AQiQRkenMoiasXZEoBef/OpHgbaTfs+dQ2Xbr2/i/41hC9f/zefbqobsdboq/7d96c7/BHyyFnE8B5KQ5nzgQ1Zbw4Hp+YFptmFg2009VBZjPrvxpn+o5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866447; c=relaxed/simple;
	bh=bGklxozeUewAjU2CnFNvC0+jf0IeY5H8qi7cwBQMVVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NCpOVs2MJlaOBqFlm7mpkPLJfLcxUordVLBV/a6Flz1QJs4/SqfODEgGgo1D/RWu1P+7KCmvlFeSmErrkkyH4j5vLzo8yPfwtWAt21Fo1ONz6G5akGvMlWS+wlkAJ4YlPJ+jF3Uc+mqmqsDbYgQ/tzbjJ+Cc0x64UeEM/dBxh7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s93dMosQ; arc=fail smtp.client-ip=40.107.159.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s93dMosQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYPVGuQ/JoKLqM1B41cqS7Ye6Zvzlz132vZ9BulBN+N70urofAyzbYuB8QFLapIR/6rFoKQVFAxYOD1brg3SN2DMqoVlR22034LezeQPIke6g3plZss7uiVCEwS8SonC+3nsy+WZ4GnkYnNbJhzyKSciYOID3AMB4r694dRuhaOIWMDxgRN2vClKm9BoQB635uiCOUQjCMqs5trF0aPKfFBsgzq27cVNxPMQ6A61TnAwxiqqOc5ien7Yuxd0Ii6YMJINly8YGSFxHH7iMGx7wb8Zi6AbdhUQzK/dMilzhuaqhnMkZ0J0Zz4ndxXtdJpTxvK5U6qBVL9kIr8Jr4Nm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VBCpPCR0+/iJOpwL4fk5FY1WQ/m2TXq2WPan0I/i14=;
 b=BFjdYb7d0YEwuhg7fYJtxYtjVdvZ6W9aAbZoeDk2D9bVSV824c8Kw2l9MkwUUcXpMttWVfp+OJYx1rz/eZywYoeZMkvGzZ60NrRQp43DFdX/AGsPYzVZTjaKjqij0vW7OzxTIfH++/iLMzzm2n8HkygMGK2+VSql2uOZ/D9ug79rYTE6ZUmt2msrEW8kDjzjE2n1XinlU2mV5mcd5HBAd38ZgBkMofO4lC7bSgZLEIYqgILXbtuvBTw6PXSIn9p+TesIp3WEc15moUf4OLUYmc/bqpoU6Z+jjsacgdtFrgTGowuOK9bjU94CCa8Nmy+TSVJPQFUbh40EhAYqbtgdLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VBCpPCR0+/iJOpwL4fk5FY1WQ/m2TXq2WPan0I/i14=;
 b=s93dMosQJldG33OiANm2cMmgC5znF8KxkpBfW3Z5FyXiEgMvDGUqFuNiP9YYvnTC1oXB11zbQwJlsoHoIq9D185giZu1WsnktPkCsEurqqLnMRuNeKpPOdwLDevPkuESuCoPfptZ1/9/FIIYkgaPs3jyTceOURSrrL8rJHif7K0jQ3ETdtwj3fMMje3qTm2Z8ehKphe40fe82yuv3s3/QjQANT6WYBJ91R7H+XRPlVY/FYGZj9pRyW9YJ53z0YfVmWs+XRNhmMUCO7O439DJ2Q74WweDOx7b+b26ugQps1QK2ubsaN71hkN8L1zDh1du+UZL6dCaVvtXuqcVtoyuOA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7144.eurprd04.prod.outlook.com (2603:10a6:20b:11b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 14:53:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 14:53:55 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx95-tqma9596sa-mb-smarc-2.dts: improve SD reset pulse
Date: Thu,  1 Oct 2026 10:53:48 -0400
Message-ID: <179086642523.2210450.11429950960153994738.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928112143.294091-1-alexander.stein@ew.tq-group.com>
References: <20260928112143.294091-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYZPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:930:a3::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb8ca92-398c-4a50-e7a2-08df1fcbd0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|366016|376014|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3E4/Vx4GTXmC93pZ3x6MKYOzFlR+JdrdqDVERS6+8/wzJRXc90kQ0I/I8Rm0WX3O9JjtKnpOfkl8LcaBBUEi4eEKaN6bF6PBUikCL4h3brwUeM/OMzNEDOu4r4e7D1OB8xsm5UbOugGcA29FeARu6zdc/vDGm6HctPXvDjF7EziCcVE5ammY+PvJ+7267+5EC00EfjHhxjVOSKWqWlglvJ2HnNSPMnRKzbf6zhW+eDSI3ccGn7UW0RAxty6uuMYVQBDPbpfR3sE21gq988QGsrXgrsMFvBa4Unl3LLek/WvJ4qnsr3O8qml9Gxsf/Ts2K1lHU6u/Vov2SWWLSPwpudlKJMRbZA/C3H7SNHaE50Y1lhxPZyvVeVayz8TwcyXwnyHwHq0K5wqGxnMNFwkHr7rHzCF90DToLhHUSWOy/KYWcH/CBZ70kSxdnFg7GbuSo6xdsQqpUOO/SaNHH4zhMvQJVJaptrJIheVLbj718bHvuaz+ajjZIsV6mGHExdp2juPRUUO7Fwb+SgyR4CtwMIb5aoXAgHM8nsKYMGsUc+BQ8gJdxleC5kDR903vZQKlNqOPbCBez+24FpfArlPrZ242V1VoGdBQgC9KvnWV5p0KxIHFfZuF9K9n6UhUnyD1Kl+eBBaUZxDBahDnJKUL0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(366016)(376014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3U4bDRHbXFtaDA5RWJ4bkt0VFRQVnZ3a3hLaFNzc2lMZ1AvZmJQSHh3K3Ju?=
 =?utf-8?B?QVMrMHBsUVVOb3lQelNSd2lHZVo5N3VKcFNwT0lqQ1p6ZlNvVHQ0TGtIcGhZ?=
 =?utf-8?B?eEFWZFJtUTZsSjRndEdEbnFMbzZ2Q3dPc0Z0bXIxekxCSkZsZ0tjbCtmdVQz?=
 =?utf-8?B?SjY5NHRXaFRjaVRFM1JWY0E0OHlWNXlrSUQ2Z21YK2I2MVV5Y2MwU21TWTdh?=
 =?utf-8?B?eXYwLzBYRmljd3RqaFJYWllWNWFOZHN0UDdtVU9QUjFPRG5NeURsYXBoamFj?=
 =?utf-8?B?ZDFzVVBlZmVJTHpGbWlpcGRmY2hEQjV4cERjbUlFVXZjQitJTEJCYUhjRCsv?=
 =?utf-8?B?UVBzYjcvMU5EaXN0dmUybjhwNXdzQ1ZBUHVKb1pRbUxab09iZTdHc1pTM3g5?=
 =?utf-8?B?RXIrb0lySWtmRFFpdzdlTmdwR3BOS3AxWGZ5SEVicTVER1JNNWpzWEpzZFZr?=
 =?utf-8?B?ZVFFcjRuYVYvTlZuMTdSak9HaXRhcmtyTXM2SnFsZjFkdDBGNjBRSlRKbmVX?=
 =?utf-8?B?N0UyZSs5NzZDYWltMERLTjN5Y0lhRm41eUNEYitLOHJvR2ZaVUxVdlR2amRM?=
 =?utf-8?B?QzhSeXcxYUZWakxZancxVzZ1dllnZVUvcERPYlErS3ZVLytqbkJRTEhnTmZy?=
 =?utf-8?B?K004NjZCSkNobVBKZi9xbjc4ME1XbFo5cDdyMFNqL2xhRmswQmdVOThEbjVv?=
 =?utf-8?B?a1V2a0hVbFZuMVB1NFlOcWF6T00xbEJZeVlqSDg1UzVYV3UvU3MvU1dVUFQ4?=
 =?utf-8?B?L3BDN05zZng1a1dsb21MRUt2OExXZmVRMVJINTZ4TjJJOUdHa1FjSmtSY0lR?=
 =?utf-8?B?RHVqWTVwUTExcGVoeWUvTFU4czVwQkRqRzRKUXEvazhhZW81U0dOL0F5Qjc3?=
 =?utf-8?B?SnIvVzdRbkVYQ3RpSDdVUTJqQ0ZKK2Z0VEViZHN6aTdQSXowam9NaythOG1h?=
 =?utf-8?B?OTJscFdzQWZRYmZLWTF6bktFU0tFeEVqNUljemdGZkNtcDdUUGt1QXNvTTR3?=
 =?utf-8?B?MzBWV2dnR1FqckVQNDdtMzlQa2c0aUR1a0FBdU5Eb3FSUmNCL084UkVhQ1B2?=
 =?utf-8?B?WHNaOUNsTEMvQ3puMzZvZmdWRk1Sd29GSm5xcGo2R2pOck1yR1QwNmVzam5i?=
 =?utf-8?B?UVc2QWZqMWQ4cytzWEVYZU0wYktkK2Q1U1JiYzJ4cmpSWW05NDJVbko5RGEv?=
 =?utf-8?B?WGNJTDNFSXJVM0RpWlROcFlhRnR0U0dXUS9nMEVjNEJTbHRLa2psb2FFamZ2?=
 =?utf-8?B?TkNTQ3MxcERnOXFzeXpqU0IxU3huT2tjOVJKUEh4QURrY29pVjE2K1pxcGYr?=
 =?utf-8?B?TUExSkp0Q1o2N05QeGhCYWRvd1hpSTJ0aDhFKy9yYmRjeDVHVmVSOS8za0JB?=
 =?utf-8?B?dTlOTnE5RkVJMmZZUHplemU3L3RXLzU0d250TSt3MS9WMlRqQ3ZxUHBzZ3ho?=
 =?utf-8?B?RjlxOVlVRlRMQWc0NlloS1pNMm1Md1hwTUplTzg4elk3R1FoMDJSbTNxU0NK?=
 =?utf-8?B?RE5PazJTdzdtNm1uS2c2cnRFaUw0WVZueHQ4U3Z5SVBvcGdNK2NUUHFYVXZC?=
 =?utf-8?B?OVNobnRBS2RkSmVmV1BwY2Jya3VUcWdvOWdpTEpKQ28vaHlpUlplRm1CU0xq?=
 =?utf-8?B?WmJUbTZuSjNLR3BFVjhqVnF1VGwzZk93MXZLMlBGQnV0VzZzeHJNclRLYmFP?=
 =?utf-8?B?WitNYXVhbkhBeFBoM1lqTUtqNFNQNklDbFRTZ05IWDZyUm4zdGRyL1JwcGcv?=
 =?utf-8?B?YTFTbFg4YUdrU3d2NG1ZMmhsNTZKYnFQemZCNE1jMVFMckljMjNXUU9TMTFt?=
 =?utf-8?B?cll3QlF2U1pjWVNrZnR5QXdYbklHNmMyTTR5TmRaTDN3dmgrcnQ1ZVRtT202?=
 =?utf-8?B?N1lYYmY0MGNtMFg2QUdoSm9QOXk5OHdUTEtGaEFoSS9pN291QVhDRmh0ZEpl?=
 =?utf-8?B?djhTTWFyS3U3MVp6OUtiWVdaZ3preDB2QkNvUEpRRTJyblBMMEFtcGNqMXVG?=
 =?utf-8?B?dTRZZkZkMmRDWEQ0Y3ZFbkgyaUk4K2RHeEtxRHI3dTcrM0FnWVF6SUFUdy85?=
 =?utf-8?B?aWloSEMyWDQ2RThxSy9VYzhXZzVtZ0piQjJmL0ljcWJxSDJvbFdCc1MzeEdI?=
 =?utf-8?B?YXA0ZEdhQk4xaXgxeTJqa3YxQ0FJYzc4Zzc1Tlp3ckFEQ25LYXBYQ2N0YW9o?=
 =?utf-8?B?KzFESTk5Q1RMRU5lcjdQTXZ0RGVJUkJ2T3hFeWQvc25zb3NYUnp3TDJWVEZj?=
 =?utf-8?B?c0F3L0U1eHY2MERZb21tU1RFdjRyR2RRbjM5RWp0Y2dBSWszYy9UU1hZQ3Ns?=
 =?utf-8?B?RVZzTnNJTGg4RTlvbXpwYXVERUdxT2c2R2ZjREEvdFhxVzl4cmxldC9lcDBl?=
 =?utf-8?Q?Fd0t8TVwyjNiPB0nzg/a/Uda6z/8l5HTx8Dcy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb8ca92-398c-4a50-e7a2-08df1fcbd0fb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:53:55.8216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXdzNAiRdR8IChMfjotl08C5c5f0ZojvLJA+4fUJF7fAORtdoZIgkH66QL5/5oRh5ZBtH+3I9AoDCzMUOn9e5R16dYeVhk0wHQ9K6rK5u98j6vggWLXkh8qcyrhpTqs/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7144

From: Frank Li <Frank.Li@nxp.com>


On Mon, 28 Sep 2026 13:21:41 +0200, Alexander Stein wrote:
> SD card spec says that at least 1 msec of power cut is needed
> to reset an SD card. This is needed to get out of UHS-I mode.
> 
> In fact this pulse length alone is far too short in real world
> environment due to capacitance etc. Implement a longer pulse using
> regulator settings: 200 msec as working for other SoM using MB-SMARC-2.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx95-tqma9596sa-mb-smarc-2.dts: improve SD reset pulse
      commit: c994546c98ebee18ac062fc5763d99a37d439b0f
[2/2] arm64: dts: imx95-tqma9596sa: Add thermal zones
      commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
