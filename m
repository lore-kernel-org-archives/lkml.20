Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013010.outbound.protection.outlook.com [40.107.162.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E738D412;
	Wed,  2 Sep 2026 19:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376693; cv=fail; b=Xre1UhcCKMQwNWrtRjMVHhcwlTjh7kIbeKZUxAEGSDnTAnz9fnDn1UAJBA/4NKC3gpLK+22WCdFbm5AxyOmJW+tyq+c7TWb/yIhWNgprN4CsHCvQsIDlXSzaz4cUxk6ykT7UJT6+B2nSEobPPifjiOFQTwDVRfFxdkCoaRQIrj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376693; c=relaxed/simple;
	bh=4LzS/rfKs4uWJU6v37K6Yq5uHwYJdXbsw9aHCyfxKG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bHSACac71HwFVdXNyEw/yJ2mZeOghmpRrRSVA9rwxEs26myuEVLqC6kMJON08de38dASK/jGgAi73ouDVM0osNtV6YYWyWqxNQFowoIS9cfjXWosiM3H3BUjRexUuxhAgT0pA8p/vGtgYsvvFj6tZlI0tKsI9S/KezAy5NrAzDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Pvl4V8go; arc=fail smtp.client-ip=40.107.162.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Pvl4V8go"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/K3f8soSx9pTmbc/6o2jMo5y/A+sEsNV262Y9ICKPJp4iGPpJVsLKoEzZ2KWVPqNt4RRJpsOOcDjC5uBHizw+7yzVIQdt9Wdnvq0z+IiNGB1q98RfHeoBKVTSOBznYSVK9tt5rE6r73iLz51WZXH7AJwLHXm0MX1Dec9UTMacHGsFicKo/x1zrjg7cFf3+XPj0Hzl2i+lX6a9s9bHT/5mgOgCesz+LFQuq7nxt1UbVEFwkRWEzeYw6o3+lhfTGdcY0o59GipkCC9U+5oNSXISDgoWc/Ha5nlyOtYTaCkbxji62r8raamBlB9UnMAtHBL+5uGRUrLajA9z5A8kBvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ch61m8EzoEwyam9k/Hnbgj9E8P1V0DQR3AB7gcg7aw=;
 b=V7tt+qk6uQEgHNN4eiu2935nu2WpY9Apfe5vO8n5prdq/kMvWqBY9GsSXuGeJVXIT4FvNq+og9Zn+umQRnWr4CFkPPvkTdVxzbhDsSWqzklyYvtbaB7Un0poiwoZLvj4v4T5Epqj2wNPeOtvSx8viH0GYhf07dBXEF/d5D8Mu2UiiyZb/eMy/etSyjXI49PENLVl3eVo1lW1LVSAeQ6kPd3SAHQA+8iG1oOZyMP99iSN0kzBW5VS6eZ3n68LU89BlSXPCnsbm7w08y0KYRo7DtERUm6fnFAR07uWE9D9FmyhlmWUU9O6B3Zxpj28dWEBJt5hLE0UTYx8hkSxaAVwbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ch61m8EzoEwyam9k/Hnbgj9E8P1V0DQR3AB7gcg7aw=;
 b=Pvl4V8goJiQsfvbK0u9zbAzUkSvdCcYbRATTrdYUG33Cb4YeJfkhlFIFFX9i9sTs/IA71GkZ+KzucLBV09elIi0yGdr9ssz9oLSU+IdmoriCTK7WdACXi7tGbmUBDGE0kBY6O0KY/UcwnoRXU5MRCDCSU2RtccArz5T5qkW7mNSIWpfb9LBlLTbHGQrWPu1ZRsGC1IEexxYRX8OJQnf/e+6NALTekQO4ZUPIyTHM/AZGqYudlFI9X15RL9SJ5IXA4G0fFNGT0xW1OfbwTt4P59W2KpQOy13BaaVsNnKK8+wJ7BYbz5ayh17gFeNxSX8UMCDJ6oYfjfKD7wp36yhSJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8947.eurprd04.prod.outlook.com (2603:10a6:20b:42e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:18:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:18:04 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Fedor Ross <fedor.ross@ifm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: (subset) [PATCH 1/2] arm64: Select HAVE_SHARED_GPIOS for ARCH_MXC
Date: Wed,  2 Sep 2026 15:17:56 -0400
Message-ID: <178837652847.2085581.2862217651267779918.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810213456.1268831-1-marex@nabladev.com>
References: <20260810213456.1268831-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYZPR12CA0014.namprd12.prod.outlook.com
 (2603:10b6:930:8b::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: 637e0c5c-1dbf-42a1-bad3-08df0926e986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|22082099003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	vQRN5sEPFT9xxkpNeUKmf8p68qZOnFxL2SB0d1tdVl5oGNwYlNoOo+yYNf5GCh5DEmSfn6zbnd7zH1Ph3UnaPkG8oD7XLXQ3bhl1+pvKFlMp7qO3z2aSazfilixRWwCABOq7BdNR2YNXsVTH6FHQPWlBlxqWyZPLQ5skhcWvfe+lumdJr4QgU08ubwIbEWDLPBClP8wJkesjyi68kHVQ2F5ZU6/vLA6kA6Gh2qbu6RuK6PNZdEhc5vuWfrzry4fcQkLTeCDrNuJZbaxQKgigTurgFHg5r1mE72LgJG84fABtT6f7S2tGBxPNYHkEVL9IjHvqZZfaC9wxdcsXRdskQxO5seLvo3SJI4nabA+ru4odJqrNwJk1is99dDrnIReYe84PncOu2W/QfAmk1DvEAGq6WYbqSmaQc6mV0vNZjgc7D12Byxh9+hJeam1ukRDGJTTT57Id2em02vXyRe6MaECQ7akwdDx/2WO+7uuNu7G26EVeeYAOZDkfX6Ae833x0SSv6dTpj343OUmn98zKti221/af7fYqQEHzEvsov92Jz3CE0AeV5kCn1Il4S2izt8N6KDH4DEW+gdWZ6KEA0LtDnp9QkOqqKoZgZdp1zYK/bLUbNf68uiXAZRqx2GxckDnQrgtllEhPffjyXtnVzJ08mhu66RHaWDeZ1UAJoe8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(22082099003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVCTDhoTG9sUUZPS3RPR3lzUit2Y1gzazdrRml6b0VWdjFpeHluRGg2OC8z?=
 =?utf-8?B?WUlkZCtRNjN5WW5ybFhVaWVuT1ZXNFNSWm90QmUxcTFuUWc1cjQzQlJKU1Zn?=
 =?utf-8?B?WW9yVjJkbStIYktFV3h2Y05iNUpZc3VQTkRwMXdUcFdNTTZ3QTZ1aUo4R01n?=
 =?utf-8?B?SEhiY1EvMzJSYWljRmtvYXByU0ZUTlAyTVFCUTdVU0lJSXJ1eTY3N1N2TENs?=
 =?utf-8?B?RDdEU0JDTXZlelNVNmZsTjFjU0xoMmFTN2ozZXpWQm9jMVBibWJMNVkzeExh?=
 =?utf-8?B?MmlyMWhkUUNtQXQvamFQekRvTk9rL0l6b0ljVXZ5U3M0MzFsMlZENGwzWFVF?=
 =?utf-8?B?SVltUHBGeHN3bUxMdzA3UW5KZGxhZ2d6QWc1aFd5UGUzdHhneFc4cmtReldy?=
 =?utf-8?B?WHhBSzV2blcrTUdRTzM4UWtjLzEyM0JoNXZXZkFVWnRlU3gwRnBwb2NaTnEw?=
 =?utf-8?B?YnRSN2NkSHdnYnNRSkJsSzNqRDg1M1g0d1B3cTg0VDI0ZXJKUnhjcElJLzUw?=
 =?utf-8?B?UmZUei9uaGlNbnZ5TVhqNThZVU9qMzVXZlFlQmNXVEJtTmZGcHppa3h6WXFD?=
 =?utf-8?B?MFlsb2czYTkxVStTdk5Zb3FBUEZZZndWc0FjRzBzU2E2aXAvUWlnZnVTKzRM?=
 =?utf-8?B?UTllRTlNQWhaVUV5bk5VbEJxQkhzRmNEblJlajVyMktCM1pPb284bURxaGRP?=
 =?utf-8?B?OG1KcGM3cFVtSnp5SVZNd2JDNzlqckgrNTd4VHdsZGpGcUxlTk9zS2U2dTgr?=
 =?utf-8?B?RmZ1Y0RxcVU1Um5kZ3VFT1VIbldtWnJjb0daNjF6WC9YZkRaRFo0ejFOQnA1?=
 =?utf-8?B?dzFXc3BCYVFKNVIzSGlMcVFKbUZtdXJneE5GSWxoZURBYlRScG9IOENlK1d5?=
 =?utf-8?B?dlJTeTM2NzVBMDUxWHNBUUlvVUQwUnJpaDhVQ1hMZGowM1BkanFLYWN2cmJt?=
 =?utf-8?B?VE04aUF0bmNoMG45bk0zaGlpSk9yMy94NkpXNHZQd2J1dHBaUzliWFpqaWtD?=
 =?utf-8?B?eGUzcFpWQ1BDNzlkWk54RTJ3N2dzbFViUm9Wa1BYdk5raDk5NWJWM0lzSXE5?=
 =?utf-8?B?R3lING5qRUR5VjdpczFqWkh2SGs0M3NJUjR3S0JvUURQc3hTMmxDV1ZhTmlS?=
 =?utf-8?B?dVlySVU4Q2wwZjZCOEQ1SU9rdStyRnM0dmkyZEQrZC9QNis0ZUpIZU5CM3JH?=
 =?utf-8?B?aWZoVWZvbGRHallDcC9kUElSeGpxVkw4R3h3T3VWTTR3L04yOUs1Y3Fjc214?=
 =?utf-8?B?UlJlZE1wbjArTzUvQXhkL2JsTTZyWStjSXgvWm9rbGV4Wjk3QW1NQVFySWFw?=
 =?utf-8?B?aHRWQ05GMVlSelBPZGRNYmFaMWxDZ2JzQmpzWE9UVzdmTEVLZzFRdURhMDVJ?=
 =?utf-8?B?eXkyRVNsdXlSNUZCNlpWVHp2WkF4Nzc1WVdsd2xIN3hseHRnVENBR0FZeGFX?=
 =?utf-8?B?Qm8yN1pEQmhYMHE0bWxUbVMvb095bW1aQnBndU12a29wK2Era2lRQm45SEU2?=
 =?utf-8?B?R0hGRGZndlByNWxid0Q4NlVscURtY2RCU3NGcDExZUNXaitTOThaSkJ5dnU3?=
 =?utf-8?B?QVJTemllZE9LU1FxLytOTDVUYW1TeEd4TmVkL09menlPdDdYcG93MnZObzk1?=
 =?utf-8?B?L2RMWERhSHAyY1NiL01kNVdVbFR2MGRNUDF3OVJEbXl5RUlLQ3ZubDN2NFI0?=
 =?utf-8?B?UDI5Wkd3emo2K29xRjQ0NmZEeEs1SGhtdDVFZGhJUVpFdVZlazMxTm00Q2hZ?=
 =?utf-8?B?T3VXUVFuK0N3a2k5MXdteE00TVJzZVNvOTNNVXNLQ292S3hVb3lCM08xdUNl?=
 =?utf-8?B?TjJkV1FwanVnQzIzdEszU1VIV2FRYkZoWFBQTFJaWnIzNkQ3SmVyRFYxRFBz?=
 =?utf-8?B?OUgrakNpUlVBSWpDNStxMDRFSkxzZlZISzJIUlBnV2lncVFqaFpPdVc4ZXRL?=
 =?utf-8?B?aTNwcnRJTkNyN1QyS0ZySXRrQi82VFpSOXovZG5aN0FMMFZUdG5EeTgvWWZE?=
 =?utf-8?B?U0NWZStFSUVDa2JMMEFJRTNlUWs5MVhwWkpTNDlidVhuVTNEc2dWaHo5akRv?=
 =?utf-8?B?OGEwQ3NFNUtsc2FsYmQ2Qktod25kWGJ0b3h0c1I3TUs4bjZnRnMvMW4vQk5V?=
 =?utf-8?B?T1Zncnlrb0NodktWbys3THJCQnlFT2lCdHVmWkYvZDRGWHR3bVVBN1E1Uys1?=
 =?utf-8?B?QnVZbWdmKzAzalkwbERxQnNJNWxLWVZzcGtKcXJwZ2ZyOXBwUkhqbk1kRVRo?=
 =?utf-8?B?V1M5UmR5VDY5TnZjNDZLa3B1bTRsV21GZlZ2VHhGbHo5TC9ZTWpMdlJxc2Fq?=
 =?utf-8?B?NDdwTWJuQkZ0OW85WEQzVzJIZS9kakluYXJhQTI3YS82NFRjYzE0UVNna25s?=
 =?utf-8?Q?8oh4O5m/PL4tr6KssyP1bCzGg6S+q5vqKV02i?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637e0c5c-1dbf-42a1-bad3-08df0926e986
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:18:04.3002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXCgWZESAKGwhT0CI/Y6NvVjGENi6mCgUxYLVq4ebgO/W6XIIuPHO+A/KOqqV1QgDXVfRvHiSzk2VuBRDDyrv5LSf9koA+S2AunUpUFqNmYZFCIQBe6osWDF1kCMQx/K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8947

From: Frank Li <Frank.Li@nxp.com>


On Mon, 10 Aug 2026 23:34:38 +0200, Marek Vasut wrote:
> Some NXP i.MX platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.

Applied, thanks!

[2/2] arm64: dts: imx8mn: Expand EEPROM description on ifm VHIP4 EvalBoard
      commit: 5c67d91ae29a3923fe170845ae3800e4d11225e1

Move reg as second property

Best regards,
--
Frank Li <Frank.Li@nxp.com>
