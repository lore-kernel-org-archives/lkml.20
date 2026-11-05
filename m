Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793909081;
	b=DFzbVXCFO57SUT6ZfQaxR1YRW29YbS6Trte65K7QLRn+OBP/zlpf3pDqk0NSwWds7frw
	 wFXaPBUP0no3xzQk4MlBGww02nko13Fb+zjmqdYuS9Ju+NsFNLMzn4u2u0xK9HX7IO6cD
	 418I2DqSJT2r7rrNdME4I7xxoLJC/x/XQu4gRybe8LN52u8f5u1DQ07WDbR3qrOid8oXx
	 Ru7k+PNRm5WHy37u5jKIEJaE3ABmx5cpCRCtSpZlsdsyE/L2s6NflCepm9yL1/DmarAws
	 si/ltl/wh9Seij480Y1ZIZm6HPOlwECuZfDHJ5fQssLA/PMRLJ028APnq1B4pkZI50w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909081;
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
	bh=w1jpolbFkouvQq1f0pjIfh8z431CIkNLLWuvwJVtOlw=;
	b=KHDfDfEWJf88dL0O6ze+WgouXnBljcR5yrrDx9jjZ3sAFhQ8wDKrVSBFv6cfswqIpdRS
	 IIOVXBqdOC+zYZ5MCi3AQiIEZ+4iYICQUY99P+u2uXz3IZDGq6eOELVdBF/I2vplQR53H
	 PFvr6OGDovLABz5TcXYck7X0RLEO0PHCaGrhMK1BpEYW1ppBdz6mQHdEhx4VDIYfer+3w
	 GPuUwGtxg6hef+n5K/+XcJSPrdSLR6jKNqlxe0MQCs73i5bfoUzmnmCI4PfCrFce01HwE
	 QgWqZB/6nugqbWphGuf+NHYaDsRCKNBtU6VQxusCYGhlOL2B8PIGnlPJNU9pROD4JxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="Yf4yJI8/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.42
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013042.outbound.protection.outlook.com [40.107.159.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0D5606A329;
	Thu,  5 Nov 2026 20:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E0D5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Yf4yJI8/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8fcbRjW+AoF48A93WaYqxZv5B0oXwI/2z6rG2WjsEQ3hM+C1L7uTWfcesaBoC4FIqSS9yMZPNa6+Ev7cninDaVfmInKMxNmpJ1rlYQ2f7R1p1xvsdjnSZBgo1svXBQxl1gfnR9Zw0K2gZgkW0qZ5uvt1n7ZlzBvH6NjDVffqR3TFY3qK6Z+XIgKkJ8F+hTvSQYZRTSm8l0CXuSBi6yqCOr/JXOtDQJZ9FxfkmFqgiz7BuObRBa/az+Mup0b6fxRYp5WT/0aaVGrqG04vAroSr/vLOjU5OgQesEcTicMU7HD9neb8I+SuMsOi47KlpJaIRlnEXDHi9oiFFufsoJynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1jpolbFkouvQq1f0pjIfh8z431CIkNLLWuvwJVtOlw=;
 b=YYlZ7bPkSmCQPXIdN4IC6MOsVLMtuyJ+9KNbUArYn9Uili9tnAZ/m1j4BCAdoO6+izdk6QjBKAtFoQdM5/4FkfcWlpZuPYqAJSDr9E+DBKsMcTu16U73hcgAfbkLEsbWW0af4bMdgovMr1IrxiUAmGZ2x5KzIsaroB6TJvAvVt+WveAz1SPAF+oysm9UJM//7/VoWhBF6fMKbEGfe5hq+90zkbwgPkC18Ax9V3IkmZ7lLbbsUhs8l6AVcpiotciCT0jy0HTiZSg9J/pkP/egB1r6h6pagPeTAJ0SV/Q97HMbq7ktvSP1g4BcOYy77QkqKrPlTkN73NHp0LP/jRbmNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1jpolbFkouvQq1f0pjIfh8z431CIkNLLWuvwJVtOlw=;
 b=Yf4yJI8/T0ff5MG00Ie4gQis2wHcPyYdXuYtLKTbvlfa98NJigTEhPkE4P5Ft7MJr0k9QUQ+gI7aPTk6sR6QtNosGA2kukqNTKUznqj6Kd5B+iJvTFEzpYTIGbooRI4yXunSV0PRVH91riOSL108Gzqra7fe73TGazBgrrt4JArTPxvxqkwFKXcouqzDS618qsMjECzoeYTwdjj4mrFPso2PpuPoq7Uox7tNnanUcbvptp0r+Mv9QZ45WrUWPd4r5sSqrf92yZ+pzVBUAvu0lzJksNYJrO//prohwkZWZo59f8DBR1LIssQluMXMrFCHgI22Oq9HdTixADJmyQt9Ow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by AM9PR04MB8763.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 20:04:38 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 20:04:38 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] arm64: dts: imx952-frdm: support AONMIX MQS
Date: Thu,  5 Nov 2026 15:04:28 -0500
Message-ID: <179390906304.1682341.13745639199701882161.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
References: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: afb789ca-13a2-4c70-bf28-08df3b78053f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|7416014|18002099003|22082099003|10067099003|921020|56012099006|11063799006|261009223027099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	z00et/0OruiOMWwUSwINdUqE+L8TGQM8a3zg12fqB2HBQBUgOwdZtgQkOYLKgqTpxk1DX8etc1OgkFZi7RGLTmLsm026xkrZr3rkd2sDbI9fdGMhVOTmFaSWkcUdcyViokLzF4Kft0atXp+sLobzk61OJGO39f74Vku25ornSKj3nyExGy9DuqqYiG9RuxgPADKqwIPnA8ih4WXuXghxMz2sS/sEH7y8NKnvvRt/DVtbO+nziwig2m9L748erH33ViVbbiGW5pPR8J6JnbYf5YJResFL9C01wuGfzSEhVFmgDPQeO78djkUiM/9/rk3gqXffGNmhb+p77GXW3CgyluxBYyo1T1ZiWgbuo1OaEgdkS6C5CGQKMJPTRpqihWwO1r1q6q6+psDqSqzgcxTkZ2S+KWgtMK7RKF60wP6XaIn8jUdJMbSypNaP5K7mneyquFeMcFUMORxZeOvuFlRXVKUU72vQ9AtHXV5K/S9AtNuz+P1k4hSpOfW4WDwDa0iCc88fw+3pI66a9n8GvD5CU/9MCuhqwx1WnmR8ySwEQ7K1QhOCXr+laObHu7RxTGk9u93M1Um0zGH94/bI2GTG6vFkyblreVznqetNNHVi1UHfP/c9wwXDmSv/G3IIqARZStIct5NAdCIJ5XEIiJA60kApdSUvITQS+TJypcYGjvxKl06HeEHleQharNWiy0FTGn/FAdO/U/UzYXYT96wA7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(7416014)(18002099003)(22082099003)(10067099003)(921020)(56012099006)(11063799006)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0FNZC9hSERYaUxreDI4M25FSThmczdKcGlNUllHK3NuMHdEVTFGU1dCODB1?=
 =?utf-8?B?RWZheGhlV3liQXFqK3dyZGNHL05lS0kyRTNUODFoYVJZbnF5WmZaM0NqZDli?=
 =?utf-8?B?bGw1M1dLeGVMWFFKZFRRTUxOV1l2cEp3a1FaMGNKVzFPcjlVZTFIRVFaK1Vk?=
 =?utf-8?B?cEFoSkYxZXFMcmxjcVBraldVU3hpUWxObnZUVUw2aitMNTdZUmFUeCs5T1pl?=
 =?utf-8?B?bXFVQlNBenlTQWZVaTZ6YjduTWxSZ09oYW02aUlzcCtOUnM2QW5DdDIwSmZZ?=
 =?utf-8?B?RUxqQ2xqelh1WWNWL1ZXbVI0SVRkZjdSbW9wTUc1dThoUlRiVjFxQisvcDZ6?=
 =?utf-8?B?NVpWN1RVTmxiUURNM3ZhMkNTcTd0OTBuVTRVa3FST1lmQzVreG9xRC9FcmMx?=
 =?utf-8?B?Zks4ZlNSQ1pWSHhzTVBRRGF4ODJuTFJqRzY1QjhiK1hxdWFFKzZSdE9aeVd4?=
 =?utf-8?B?d3ViNXlJZTlwLzc4MTVBR2ZjTVFvYU5DVXlTclNoK1JXUjJvVldDWEZXbGo0?=
 =?utf-8?B?R21PWUZybFhNUXVGQmxpZVlSTTBEbFJqVGxjZzYwdzg3Z2NURmk3VzF6VERJ?=
 =?utf-8?B?NkJTWjFWTmtrY1JpaFNlL3FGUFExa09lRWRSNjE5SWRtRmYzWFNDTU1QMVB2?=
 =?utf-8?B?SVc4d0hJYlhoaHlCVm5pZ3JTMHNTSm44STM5SGxqUjdVdGJSaGh0R0xmKzla?=
 =?utf-8?B?dm5VNmsrNlErQ0hFZDFSNFFKZldpQUxtMGJCaEhqcHgyK0U5Tm8yOWRCT3h2?=
 =?utf-8?B?UVNkdXpNSGFpWmZKVmZIdHI3TGJ1ZEdva0lmaXFmUnVTcFY4NWp1aGhhWVNP?=
 =?utf-8?B?YjMyUkMzVlR4THRXWGI2eFlZVU51MnR3RkVuRWxhbGdQTWRlS0RWU2lsTU53?=
 =?utf-8?B?UE4rZzlpMWk2Z0tFZzN6L1MvTUR1RmNYSXNnS2tRT1RiWWVvNERjcE9WbUJu?=
 =?utf-8?B?VUxPMGRpTkE4SHY2SEZlczBiM3JHdlFBbUUyUUVZS3NzazVHRkc3L1BrVUFJ?=
 =?utf-8?B?R1VNbWFLUFNqWUpvMnhoWGY4WUZtQjhoY1dPZnNBSWFUQnNrTnpkcm85aWRu?=
 =?utf-8?B?d1BGck5HcnBWV0R2TFFPeUVyTXNPNGhFN2RpeEVpYmxoY1dxM0tNZkVDT0Ft?=
 =?utf-8?B?NXhDMXR4UFdiSittWFVNMnFxZzZ2VDhMS0xKK3BvK2RxaCtIUTlQZXcrVWwr?=
 =?utf-8?B?MFdVamx1TUltVFVma1dydlMrcW0zVGxIT2lNZDNBcUlERmpUbnlhTlhkbFBC?=
 =?utf-8?B?Y09wWEFPeW5oY05MZDFKeDdONG1MUG94c1d1RTZRNFJWczVLT3lyOEJQaWtE?=
 =?utf-8?B?dkJSUjZLWDNhWWdnREg5NFB1WEsranpBK090R2RCR21zblhxY2ZoQVY0QjFX?=
 =?utf-8?B?NmZ0TW9YajhXMUpUUmxHQ1BiZndUblJSQkxadmY0QWJ5U29oMFlZOVhNTWN5?=
 =?utf-8?B?dFh1SFNZNHZrNC92UkZtVWVRbXcyZDhPM0s0L3pLVkoyOVVaTUpKVDBFN3Yv?=
 =?utf-8?B?a0FMKzJyaFNYWTBMdlRxdk9wRHdBNWZ5djRwMnJFWEVXVE1tYktXQk0zeXRY?=
 =?utf-8?B?THFHOXhzbUM4Tk5ubHQyeGN5Zk1pS1JhNytVNjlYdVB1MW9XOFYrZnlCeURv?=
 =?utf-8?B?ZUJZOCtmZG1BcTR0ZHFWeXd3cDQ1RllKVlNJeFZxZERnaVpuWXB3WEsybWkw?=
 =?utf-8?B?WDJwdXNOVWlUbjZxUW9BQTUzSzN1MlJxZDNKUFY1V1ZHZHpJaFQzZW5tUWdH?=
 =?utf-8?B?MDNZMEltVkkwUmZPRjdUQmViaTlZaVJRM2JtMDdxOElxTG1BVGszL3AxMkM1?=
 =?utf-8?B?cUtUUWk2WDMyZDJSTGhYbGJOZ2ZabVhVQ3lSTGpZdW9BYWNSRm5qYXZ1R1VW?=
 =?utf-8?B?bnE0RlNKNmVyaGJJVXpCaHpiRDg5OEZaMzE0NVZRMlBDcUN4U1JiWFlVUFVR?=
 =?utf-8?B?elZpL0FPYXhDd3ptYUtzVGhRd0U5cGhPVlJid1VtTjBYMDVCRmhNaGlmdUZp?=
 =?utf-8?B?NTJOTjQzL2RTdUpqKys0M1U4M0xwNVBDODJWOXhNekVDUGxyYW9nNHBGMzdL?=
 =?utf-8?B?aHNIcjQyOXBMU0VqQ1BXMi9oRFJaOFdrSmkzOUozN1picDZPODBvaFFpTjQz?=
 =?utf-8?B?VGVMbVQwM3hrSXVoZy9NVjlyMlFQdytGdll1YmdSKzN5b1Y3cUR5L1M4YXhE?=
 =?utf-8?B?QUxBMDRScks2N3FmZ3VwMmEzZ1Y3VXdGbUhtTVZpczhyMGN5TEVZNElEOElG?=
 =?utf-8?B?NE44OGswV2hvUm9ETG4rMnJoeS9MTFdKYVBoWFpTazRJSjhJb3NTU0Z1MVF1?=
 =?utf-8?B?TUlaMVNpdFcvU3NveUFhYUMwWDdIelpWbGJOV3RaRDl1ZmpId3RqejUvTzlK?=
 =?utf-8?Q?1oR5yQeuB131NVljMe9BSehm+wZ2zI2VaMvbk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb789ca-13a2-4c70-bf28-08df3b78053f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:04:38.5577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71tPvERwHPqi5eUZXRmClRsS2WTaucfGIYyG/UwSMljk4k6PafG8RObkttjkTDP+mjXJd98U7uQkqgX6eQN/biwSFQI4xVCEi1czta1YQJTuqiBCRn3Cj3WsvMPikyFT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763

From: Frank Li <Frank.Li@nxp.com>


On Wed, 28 Oct 2026 11:16:08 +0800, shengjiu.wang@oss.nxp.com wrote:
> Add support for AONMIX MQS (i.e. MQS1).

Applied, thanks!

[1/1] arm64: dts: imx952-frdm: support AONMIX MQS
      commit: de72ffdd52783e0324008016bd4791371130e83a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
