Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793907748;
	b=FvsoSjG8kPD3UaJCzvjqqT8e4W3m8stvk5iZlfi563XZT9SsYxm4aFMnoBOzuBS/mN+Q
	 Gn6M9CbxCFsF4MHMyOnY0PV7DTUCC/RMUi1/W8ZVQ3YTbd4jcv/u7tP8LRgcRDpp+rXXT
	 aeEUsoC0WwtixkFKBrjuF9sJ9ahS8rVjEV0ew0FkMN+EPJ0q0GBkb3y88pbs0GKsJ3lZC
	 Ki3NvoFShhBmjhcXo9ShAZLqRK+1RFsuuS0dZORtTE/qpx9skxOL9vUhaQrJzv65RGlOW
	 g4Hvy3Awx6CO+D99RcoTSVfSTSafDnsLFjDSsvt2hO6AxWduNconqOAeW9ld/W4oTXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907748;
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
	bh=6sVy56aT0FpZx5PEWKKuOapEM1ktRBdwdbdDYM17wH0=;
	b=3mwTRJx13Ud4AmNFu2VUa0WH3Z+/ZqCTf+7Px3jUZH8pmDxgMm5+LVzSOb7Vc29G4i++
	 iBjUOuI/tQizhQ4QVff85b/ZbR78lJRJJLN76SwoflbUqe3cYNPU6lViQ+oG4E6X3rmRi
	 I87gityUiX7TVayAbmiE/d6OjHRTXE6CoxJ7cR9eloWJWXIaeBhIKeHDtEGCJRLyEkBNB
	 Ue8VMFyh31H7FpKYh6mHe9WvFeFTlbdQQepR8gcc1EQRux3YUgpowqbz9kKqdbDCQEIGi
	 ifsuTz8SA3oFTkvSY5HUAZb6wbyNZWHdqmIH32w1gtPiE1YtxFV2ACg9/VRNAksXHkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Et+8PZdf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.33
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CDD606F976;
	Thu,  5 Nov 2026 19:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CDD606F976
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Et+8PZdf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGrPsOxMlmrPkVrzPl2umdZDxZHt9pGzcj3Rl2oI9JTR3KPxt/XAepGzpfcR5WJR7n+3jwk3+p2E0sN5UeaiPIOLgZdD4jUNwVOtqiK5jUhyd71u/Krg5VL9TotGmipSCVXV+vnGeO02/0oMdW5whyDEUqpwjmyOgoRPCXX2zi4SrU+gqbGG3I+iCoRFwjbx/9od/oK/ZfpIysMb9eDpF2yf6PwYAA0a0nc8rsZ4Uc0yx3rWSbOrkow83ZjoBCcEAdo+DGJUPKMMQMGoS75XM7Oju23fx1cqWs6ID7dwJIRaM+lqPvJGUp0Rlot6lBWMalzg2cYyFFCEDLa4RaB5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sVy56aT0FpZx5PEWKKuOapEM1ktRBdwdbdDYM17wH0=;
 b=JPTIYy1xz0RV3bep1aXp7hCq70ZtagcPqSELpF2BUKJFjUwzLGAyWj1wC/4uMEQaSHX4eeeYQJYQBO9ghV8SwrEnFbp87k0bKupw2SBjUksJF8OEFKcDuiz0XCofiEbxJIDH3WPm72VbHHSeMX2RRQwExnctNdnDtS0GM3rUzzQ4YBXNj8vLJoM1FOkpldVQq+me+3RSKWm+IA+kFaEaak56iz3I2xzCWZgGQ2fL2AWXTjKY/ZHeDPjF0aYRbUJVJ0vorgertMfOOR8T8T8zW1bQVUGZy2BMcVZi6AYmkm3vbxhX6nnnZa+QoRLq8O+Et38LEsJNY09Tp77bTxLX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sVy56aT0FpZx5PEWKKuOapEM1ktRBdwdbdDYM17wH0=;
 b=Et+8PZdfQxmvdeRohrGL2VCou0T/sbh9sTUHa7doHLJt7UrtzNC9godTZxda5wgeNxlnRtKA1i4UBUOfmp21TFW+BxNQRC3E3QACb1zBJFkzHVI5fMnBPpB3R4OmgGF14Hyo+YbQQw8jFjuv8urGSEyh5BhpFWy4EGnaWrDcseuPPi0ZC+KtDUF4ops0RMtMxojNwfUCFfwoSM06Pp8DCqN2leX4LRJvaqq3x+KfKv05il3LcuTxBtzMnaerW99v3SWahGLFlSAC4LXjpHQJliO/vqxsXNEd91G2iC3mcNwI6ErEFpljCg/xJMtG30JF1MEAKqowNAgICmCbHM5N1g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by BR0PR04MB685626.eurprd04.prod.outlook.com
 (2603:10a6:2c8:33::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:42:24 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 19:42:24 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@nabladev.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI device
Date: Thu,  5 Nov 2026 14:42:17 -0500
Message-ID: <179390773301.1628967.3622612803321824655.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
References: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS3P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:45f::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|BR0PR04MB685626:EE_
X-MS-Office365-Filtering-Correlation-Id: 685146fc-249f-4f48-4a69-08df3b74ea29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|23010399003|1800799024|376014|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|261009223027099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	itJlWwPh04hCI8hAp3d8Ux9Ykh/KsviRfYfnRkAwOWLJhiuKE5QuHg2rajtBp92U3bd/78zgPKqQKY+IVE9fprsdf2/GWHUpTAFV3BDTlgoUxlsOL7kWpfXI3L7JjzUjW0NW/fl3B12NsqhHRD97LQipyY56nXsN7tEdrLzZ7zjPNVpt1ZiXA+R2s0oZJpO7oOJmnk7Z6+FMKrP2YL2m27eHXYN7pOTTELg9RypWEQbnXxnGefcFrWqMuY9mgXzIgLpM8B3QSCkspyZRjDrJCe2p2VmwQJKZYWigj6JT0e0ElUCy1k3MRPRmKVfmvJVv9YN0Kd/ujz+x8od7gjX55qqJfJOm8WUw7O2R+VqVnE9uduJ++/bE9t/MxtlGwPXM00qUUN/0SIOd4SPKHeagEdM39GVpWbGpZyOUGoEoCXya1Zl4/yu+2h7it6OpjXBRi1Hteh7t/ssgA2a005U8Wend06afpM+fjI7IYuPDsMF17fQvXEsnm/vt7hSnwJKGDXMKSWhBJRFQqywh3c+SbOwgrjsYCwadnWOK/EMEMjT5dfVOcZ6haTiia0wk/JbHlwRZ9m1IELToJLd9uctcxuuWPwkOAZGDxoiAkWWecg/IDkLePfsEklmVbO50F/zQZYQarUiVMm4RN/SRPXj7RFRaklObJGRum/JLnTzQ5H0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261009223027099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUdsK1ZmUTE0WldMODd3NWF4WFdZQzUvRTdnYi9QbW11Q00wcXI2eTRqNjEw?=
 =?utf-8?B?M2FGNCtQQmhFeStpYTg2dEFDdnovcmZYZ3dnL0pPRk5iczZvMzBScllJMTh1?=
 =?utf-8?B?b29oWmNJeDcyemV3dDkzZEYvejU5aGtEcGdLL1UzVS82YXkrS0tSeHRTSkZz?=
 =?utf-8?B?Z0NoUzZUYVRHK0NqTDlwamthWmxrQms4YTNCQVVUdExLWEU2eXk5ZFVzL3lD?=
 =?utf-8?B?amRYYVBvMDVQRGV1dDJSMURpQ3hjbmNlM3JvYWVaM2lhTGRnQjVtMnZibk9h?=
 =?utf-8?B?ZXJ2c3lxcy9CSW1OenRZTW84eDh6SHd2QzJCNnRXTloyTzVnUG1kSjZnTVBh?=
 =?utf-8?B?Y2d2ZnZ4S002NmpVVTMvdDZQVHZNT1NHZEU1b1VYMmJvOVNlUW1tWnEyL1dR?=
 =?utf-8?B?Y3FYUjVxaHhja1NRSHpHak9qTWEwUUc2TUpLekQzb1cxWnk4Tm1BNTYrWnRr?=
 =?utf-8?B?MHRTQk9OcUlVVE0zbXFVb3NBU0c5Rnp2K1R5enBrQkg0VzduczFBUG5adHdm?=
 =?utf-8?B?TGNwb0Zhd1Q1NzV1UzYrT3p4NUNJTHNRckFTdnlFb2EvWDl4TjRlL2dCenlX?=
 =?utf-8?B?SllvTFhxUEdsRFcweEp5Q0NpZHc2RWFlY0x1QlRFTktPYlhHckkxY0R5TFJn?=
 =?utf-8?B?QXpBUndtbExqZjRwR05QV1hkbHpoQ2MxRHdqcGY3ZkZseDl0cEJYWE90RFJ4?=
 =?utf-8?B?TXdCNEo4R09XUW9KQU8wTWF1SmQ1bXpoVld3eHo0ZGllNTIwWWJRa3hTeUhh?=
 =?utf-8?B?WjdTQnNSeXV0dkdLdkhaVU1Dd3JVN2VLNkNTSkg0aVNualZSREc3TitpZnhp?=
 =?utf-8?B?NEpRd0ZXWE0rNFNVa3BjdXdMWi9yS0ZuQjl4dDk0Qjd3SjdzWnZ2d2VaS3NX?=
 =?utf-8?B?bERkbnFKbXdqZGNYUzd3c21iNXJjZHNCZ28zSWdzemFZNWozVTV1UEQvNzVN?=
 =?utf-8?B?cGRUVWJFNTFEQ1M3OGFrTGc4RmVEcnZnYy9vZ2JudXBTTmNOTnZhOHJUT1Vq?=
 =?utf-8?B?UW9zM2xJRkc3dkttakpZeFJyUEp6aTF4ODY2M2R3RlEybHRTNktMK0xCTkpN?=
 =?utf-8?B?aDdiOGhoZ0laN3U4K055UXRvQkh2UUdUalJDTllud3poa1VZSDlIMUxsZFRa?=
 =?utf-8?B?Vmd5WitoTC9EQkdyNVBMUEYzT2RENEdaMmFxOUJtc0dqbE9QSTBVcHJFR1ZB?=
 =?utf-8?B?UHJ4ZE5MbUY1MkFwMUo3UDVveU9iS1pPUzU3cjBMWEJCMWVjMG5EbzZ4bURx?=
 =?utf-8?B?VWZlaWxaUmFqeUxMNnVNWHh5bDNSQ1RhejhISzZkZVI2Y1NPZTFQRHRqWjVs?=
 =?utf-8?B?ZGo4bWg5alozc2E3Mzk1QWEvTlJENjA1S1p0UmNwZ05rZ3JDWkM3dTFJOHRk?=
 =?utf-8?B?Z0p0akdnLzViajdTaVN1djYwTjNnbklCUkZreHNWeG1FZFJhOUI5MmllbC9B?=
 =?utf-8?B?WmZjRUltZ0FtMjhVVjQ3TCtWTmYwWUtaK0t1Ti9SSUxqWHQvNXkyMXllWjhZ?=
 =?utf-8?B?eGdtcjJqQWM0c3pwUXgvcHZJT1Y1djFCSExnVHRSNm9NZDhHL25FTmNFaEVt?=
 =?utf-8?B?ZGt5eFpYVWE1VnNQYm5LUU9lZmpWSFN2YmdpZkRxbmttTFAxbnhVQkhTTlU1?=
 =?utf-8?B?NkdyTlI5QjFYWTBMS2xJdFEvSWZjcGRKM25KYm1ocG5uVlNibXgrVXFnTEF4?=
 =?utf-8?B?OWg2amNDa0RkUW0rbnUxbmFyYk80RFAxNFVibzJiRExJQ1BNemhpdTB4TkIv?=
 =?utf-8?B?Yy9LOHZ0V2prVURBSU1LY1V0dXBDSUZCU3FoK1lwRGcrS3orVXdlSWhHUTAx?=
 =?utf-8?B?eVE3bVBmVEp4Q3ExSkJ5YlcyRVhVWUhrNDFVY2FWWHFHL21GNG1VQ25oM2NB?=
 =?utf-8?B?NmcydTQ5RWhCdUZPVVVMSlJ3S09aWjh2RUlKZ1hMSnJDZDRrVklpcGljVW5L?=
 =?utf-8?B?ejNhYlROVzdacERtZzcvNThqdXF5eGtxaVpya2htRWtVVGNlaGtsV1RBckZS?=
 =?utf-8?B?MzUvb0FhaXdpK095YXRFUUNZWU45RjlGSUd4Z1dBTU1iUDlDWVVpcVdycUti?=
 =?utf-8?B?ZDF0ZmpoY2VKaHU2cDNBK2JSdlZRNHNJcFR3UUhmY0R2bzNJY2xubDd0bmxM?=
 =?utf-8?B?UVlGSU1kbHBrN2V5TzZJSGFjVDF0YWIwck8vbW1semd0Q0VIaVJWTHkvT0hE?=
 =?utf-8?B?R0dFNHdPZDhaeWQwWDJQSnMxVStJN21vaHRFcGhVZGNCYnF6clRxVWd3ai92?=
 =?utf-8?B?NnlocFd5Vmh0VzZmQ1BwdUEwK0pWNE5UZ3lyYlViY0VmRTh5c2hQdklMcGtI?=
 =?utf-8?B?bmI3UVl0TmNlY0Rsb1l0SEFoVER5OUpidXBvTEVCa0c4VzExR1grU1JacmZQ?=
 =?utf-8?Q?Vkc2Qm/4EaUtbIJIcnojvVRrlotd18Yu7CXaN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685146fc-249f-4f48-4a69-08df3b74ea29
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:42:24.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4Gp+mQfl0GXAUT1SjCiXXldesn9CxsFBnFwJm3FJ+Zhm46h6hIH1M5g7roBpj1Wyx18bpTzlY5GTvpeq5TixFeyXS2surV3qUmncM7JF+WlUTFeZ07i8+I6AcCKo6B+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB685626

From: Frank Li <Frank.Li@nxp.com>


On Tue, 27 Oct 2026 12:12:00 +0100, Christoph Niedermaier wrote:
> On the maveo box, the SPI pins are connected to connector X10,
> but no device is connected. The device "dhcom-board" was used
> only to test the hardware, but was not removed afterward. So
> remove this device to accurately represent the current hardware
> configuration here. Also remove the okay status, since there
> are no longer any devices defined in the interface.
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI device
      commit: 8497247d151a577aea9bcc81120b4ec4225465e2
[2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB number
      commit: 1c81b36b278991f9cc88064b2496b5ee9b79fb08

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
