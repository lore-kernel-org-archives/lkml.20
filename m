Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F714CDA30
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607755; cv=fail; b=hcmpVNUl8GSE7BEm2zhrIeHqZGXhmicEyHLDPazrMQFRqlu+fw/ozIO+3vbBFXunZoQMj9xVo5cKbVIJPctUcxpVgnYKwflEb0+FczwcJ0vo1uXEqK1oo1qY652REWAoqCkYYzyWdVVtpo3zLlNz8PYMAjXnODnieQjWz5mSbpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607755; c=relaxed/simple;
	bh=HAh7KwR5tCDmeIqcOo8jccia2KsBksUfrjM57uGhbtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JD33QKC6/10sW7ZRZ5YEwQnjeNvO4sIQmfGb/D6COM3SjX1gLn9MrNI7tzZJRcBdQ5Bms6FY48hyNroiadHftIILtsgmm9h7s5sZFzQdX1kqCVGJzkIDqUaVWY2rzH275yXjmzZIAAx1oLIQ/kpbNeaUSZiCQIBoBG8llu6O71o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=pihGPmkX; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="pihGPmkX"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEgtu4655702;
	Mon, 28 Sep 2026 11:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=0lGQx
	A6NYdc5zwssYlNHjhLyf1bN1IurI5c1FPPL4/A=; b=pihGPmkXrGlJNS3PVDDbu
	/HkvqL2SOX/Ipm2kjMQzhE+vmgoy+159Zg9nUTxPxlxb2u8nosuoIf5vXKGG1fuM
	Gw8mvSSda2lM+2OJW5vvBWAfp7Khyv7vd2ByCcwcppjJ57xyPJW+6ryZgDZ901jt
	Q4ZEVOkyTraSzr9OunbVVBQNLSyvEVPnicq9hZyT0SLN7YCLq6vjeoQDjonorieF
	+yFSdyrnlFh2Fu+AA7/fnRxQ0xVVrm0xUoSd5+t/FHmzKNcBxhwT4GsEqccyeLIc
	PIguWEwGr0vXI2VUnLgsbX3TApnV6dhUY3Qcmy60zW1jSeckYyHo7p61GOZHuCgN
	Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gysqr08pk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 11:02:11 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rudQBpYQS2x3YdZmavbHKvEb5D53yauXhWMSNcqARBvgr4UFUoGIXBrRMu3IilwSLyX2wKh9+4LuGulu6/DKj+dYCEUENP8p+Ymme36sv6ZB0AyMAAT/65CtAidUEWwidswMuqB6Xezr0cSWFo9y1DaHVoZzQJtzlKZVsGhTqaiYE2TNnKxc/CZcshUX7ECoIYC04EQoXoHNttPiSNqJefDvVpTv3Ob1zGNLvpEXAZB3P3uivyWvfmFzBAaSDgSt66eF6/N7meCH/aqonCJqbn9XYYgOmi7Ckx/qdOjCPLv2GpvjqPm5ChBXct43mRpwSoDlopDG6wYMILFXbsCQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lGQxA6NYdc5zwssYlNHjhLyf1bN1IurI5c1FPPL4/A=;
 b=xuKMo+C0Bpud5kQaL2V3u1eGHgX2P24bhxE7UEsP5G5DRpzCs7cPJxxh3PdoCp2qr6vOFsTOAwQaV2fr9O+Rx0NNgSpXBfBDVsbCZulWp/iLJCvOh7q6XONLGPw7i6fy/cQCHn9yknMzNRcmlTdN4phTZ04PlvAGHb1WyhFWxHk/EJKz7rM/SEnTZ/j+blihwvfAZq7F6afYNcFfj3YDwX8bZrtVjThL5oZ1MQd6KXkSJrevZSNTlpcmUfEw5SEtInjlicvYpdv8m/O79vJ+YXQ7MEq9ckZKDQENSKzA4osJ5c2Z8kXvg2n1KRJy9QTEMCXp5hSdUu9G/acNxZy+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by BL1PR03MB6151.namprd03.prod.outlook.com (2603:10b6:208:315::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 15:02:09 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 15:02:09 +0000
Date: Mon, 28 Sep 2026 16:03:27 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <arqBm7OpMHuVhzg0@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
 <aqgRsP3cxzcLok5C@nsa>
 <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
 <aqpTO-5LTLtRXaY4@nsa>
 <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
X-ClientProxiedBy: MR1P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::16) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|BL1PR03MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b11e3b-0116-4f07-3dc1-08df1d7177d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bf45ua+3PdISIEgkqsiGprO73NIeVZEo5hDqJHroy3yNBotiTxBmmtR19qqmNNwmrWVjcLDsLNX49yOsN7OidIDwD6cCStVzuTvAgNnp8hLqxZQj5h5wRY3G4jpGtrqA2Px/5OHxKV8OY0z24aInFOQwSfQ/RU/cZJ/1RgGk9cE6yf9BuNv59SW7doBQX5+24MvklcAYhnGJzXqdcLxkZsv8AaIhaOgdkfmYcekLxLYfvgErtkHUD/573Cy6XcbX7ZHqJ7Mps7pP19gG08hGyN9oznh2WS96/pbmpdvim80OZ5dFOat1ZyMOzmU4wonllk3SfRbz6M7uz25CrHI3FsqXXEsTd8YHR5B38ShIH0XliXggLVM66h9Ti1y9IWXD3Hx+xYipKkrTKsE2ltgEQgB2sP9CMl3lFgwBsusgx9QCsKnTVxuanyqATvUmNWdXdnFZOd1KvJmRvNtbrYxWOkRZVgsUg217rPTbWSt+8wmzTN5Fz/XQwd7e0QAjtIplbtPJy8EPR3QyaBLyy8w44zccmWKbmOv4fbq97du8DUhQC/NGNRSc6UGslFw7BASNV86bKx5ERyyeg0YIxvXBDAQtxfYC0oZjsB/ajTXIB9uxU8Qrhmthy8nLDJ8OphnW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzVCVDlLckN6c1FDYjNITTlDNi96aERJbkMrbkRrVHd5MllQbTJZVnAwcHJo?=
 =?utf-8?B?VE5oZHVXSmF0YVg4MVozcm9ha0FFQmtvTkFzcGpVLzFhSms3SEVjdjR3ZzRp?=
 =?utf-8?B?WXNxUTdtT2N1K2lyeWZET1dHR29TTEpZaDBlSktRWnRRNGpDRklPd1diaXBz?=
 =?utf-8?B?NkxWWlpVT3U5dUEyVlZNdEZYY3F4cnN2RWNDejU3WFhFK2JtV2QxWWJIeHor?=
 =?utf-8?B?T1d1VHVrWFJGZjUyckNOSm1UZWg2L0JJZDN6ZEwxcmVxc2o4R05VRDYwc0xF?=
 =?utf-8?B?N1RETGZBNG1jVmJ5bzE0NjJFUDhkdDlXNyt0MlMvbjF4WGdzQ2Iyc1JoeDhQ?=
 =?utf-8?B?QmM2MGFZTFJvRkEvU0l4d3lGWkk0MlV2TlFpZzJVR1hUUGx4TzRQS1F6Ty8z?=
 =?utf-8?B?MTIyQzhoYnZsajNxZVIzaVh3YWlRbElROXZxck9aSzU2YWk1dnZSQ0xVVWYw?=
 =?utf-8?B?dFc1d3ZrN1ZEZEJkbWZROTBVSFRkK2lVZjlDQlg4UXBwSVM0K1Fsd1ZvT29j?=
 =?utf-8?B?cVU2bDRoVFhxcjV0ZU4reTdiVHR2YkZLaW1oSHQxMzNkL0orRDBlekRNbHVi?=
 =?utf-8?B?ek9EUzF2ZjVOZU5HeW1sR0FDNkdEdCtjNlYvK3FjK2JKbmR1clJvdGxMdW42?=
 =?utf-8?B?MFlWQ2FtbzgrMWdYSjlMeE5ablB1WWJWZ210Z25VMG4vNW92QzBhd3VuREkz?=
 =?utf-8?B?M0lTa0wwTm0zdmkxK0RsTmRPcUJaKzZ5akRMak1nUm9URGdNRWZjOW1DSGNK?=
 =?utf-8?B?TXJ6YXlOZjY5cXZySkpXYm1acFFLV1YvVVRBSjhleEpqeVVlNWpQOWs2a0ls?=
 =?utf-8?B?RGVFekxYdG8xS21nRmduRkpieE1FU0NjQzdjOG8zRGtUb2pZeUdKVVhzUDli?=
 =?utf-8?B?UVI5cUhORW5oU2swWE5sTmNRNzVGSExoQ0tZYnFudkFJTG5YY2w4amhONWJi?=
 =?utf-8?B?REFsZTNvclY4UDVjNVZTZjB3STdPNUdLak54Qitucm5VQUg2MzVUTlIxMWhw?=
 =?utf-8?B?T1IwUDJwdTNPVWtJUEx5ZkIrYlRraFBLWFc0blFRQmtZeUp4eTFLNjZ0ZXpW?=
 =?utf-8?B?UFRScW5uSnBwcHE0N1VRWTlzdXArdFJOMzZUOXl3M1piVmVSeG5HYnNRWHBT?=
 =?utf-8?B?MVN2bzZLb3g4cXBYVWRkcHp1RXpKaWZvbXlBeloyMkNYWnVaWUQzRDIwbzRZ?=
 =?utf-8?B?MkhsOW9HMEJETTBCbFQ5TXEvTGJQd1NWT3FiN3hoSWlpK0p2aDE5dE5XbVE4?=
 =?utf-8?B?N1grdzBOTXYzU1F4K0hScDRyQ1lBdC9HSWI5ZXJhbkxzeVNybEE2RCsxaExl?=
 =?utf-8?B?TVJEdnpnQnpVblFkK2ZCbVhoeGhpMEVRWTZrbFZiUXczMXhQSDVXNGtWNy8v?=
 =?utf-8?B?cHB2cC9TZTNjN0taVnVyUjRjOTNZMjhjRzFKRWpPOEw0YUhucE5PUFdSQnRF?=
 =?utf-8?B?ckVnTjFTbENrQXBTTW5mOWZ1ejdja0lYRlhyZlFNWHJUNEh4aDY3TFV2Ykoz?=
 =?utf-8?B?OXNYTk51dGRkSVE5YUF3VWpGenFnaXJYYjg5ZWdKYjFNY2pua256TCtrMlJI?=
 =?utf-8?B?ZFJXQUYwTjhqTUpTb2VCTTFLbE1hK25IK2s0MGYySGoyUHhnZGFvQitSOFRI?=
 =?utf-8?B?NitjUG9QK05LNGhBTXVmLzlxK0NmN003QTA2N3BjTmM1NVJ3YVFwRk9ZN1FI?=
 =?utf-8?B?dzdOVTRzMXo3Z3ZtdEZ1R25ZaCtUOHcxc25ORmFML1FBQXNoVTdsYzZIUVov?=
 =?utf-8?B?L05ZN1hUb25ZUEpLV2lJcWVKb0ErSmVqUDFOWlllQk9NdmdIdnBVNXZoK0F4?=
 =?utf-8?B?d285UHZTaGVya0hERGRsTnBDU1B1L09nUEd3Y0VOWFBNV0NOeEZUUmhubUxx?=
 =?utf-8?B?NFVTUGJsaHgvVDNDQXA5L3BmaklwaDZxRzNMbFVDTUpHQ0VKeHRKSE4yNzlT?=
 =?utf-8?B?UkJ0MTZ5SXQ2cWUxSEk4WWExVG1md01zQkFRTm1YSGQyY3dtdTRBb3pKNW5R?=
 =?utf-8?B?MFdXbnpTMDhPeFVWSmZuS3E0ZDNSU1FNMjZodUxkTGIzeCtOdXJYQk9zYlZZ?=
 =?utf-8?B?dVQxVjlJNlg2MzRWU0p3SUxqaERwbDM5aXo0NEE2d2dIMDVtM0puQnptTWtZ?=
 =?utf-8?B?Vk8wUmJpWHRPZzRpbWNtN3ZFTDNQNXRGd0VXaUVpOW9tMzJqbUpmQUlmNHA5?=
 =?utf-8?B?cERTVnRVMnY3bHBvK1V0UVkwZkhRdU0zaGJGUnBPb0ExMVdzd2NCQXNIazRO?=
 =?utf-8?B?NzM1NWh4OHVUWlJIM216VGN5OEVRU200MndyNlZFSjZDK1NaOEFLN2llNWc0?=
 =?utf-8?B?Q3ZVN3FZMHpMeXJhQ002RGtDYjN4WGZOMFR3eXVxUlFiN3pNNkorQT09?=
X-Exchange-RoutingPolicyChecked:
	c+wnDRbYPcNifo5nks26xLAYk1sfs6MzE4c97g7EbMb6QrzkXDyxAcxPuoBHXihurFKRUTzrjkTfvcLaLNCKN6HButRGmSMeosnkLZaRyrSoSm/zdAS+tOAflWza2da0796/ZO3pDGfnLu9qxK10WAIO0oohyHm1V/Q93Xr+q1jqJs7ZSUE5fOcPEIlzKR5Y5qoKinusT3+tTRvYo2caL6tlH8vsjcPFYuzqcQg1lDmzjYa3MFMxwHjxM8Zn5gYYj5bzLYxbf+0/MeIEDCLv7CZ3+foWZIJv4sBeoI9v9juYPcEk+H1g64XW7fs3SDUrB60m0qypeFeynZ1D+/GjKQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b11e3b-0116-4f07-3dc1-08df1d7177d9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 15:02:09.0572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZzPeUrgNS9nQQM12BDJVTM0z1LEZcVU3uNv/Ldv14klNKTo1ki+PWNnXiUBXxISl6Ki91xj0rRKPjg1WMHz/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6151
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX51bbdjeSY48E
 P/VQ49pxeYeXMgvEp3K1z3evshX8GX+CfofuIJ4x9o8GCQdexEMgDgSRVa6nPp2GtZFZ9efxzZU
 i3O9CfBVeeT/IDGeFYyDgpUy+CW5TJc1QP21X8X7/6B3G6m9IFWt
X-Authority-Analysis: v=2.4 cv=PdBqFShd c=1 sm=1 tr=0 ts=6aba8173 cx=c_pps
 a=E0F994Awt23I4DNeuEdoUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=JfrnYn6hAAAA:8 a=4ovWLWta0zXe-DwPMw0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: pnVkjZEyzv5IYQQJJIbdETWoEhJlo41r
X-Proofpoint-ORIG-GUID: pnVkjZEyzv5IYQQJJIbdETWoEhJlo41r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX9v4JAy1Ca+ie
 kTOeRHvB8d7B/b5GXW6mcQiaVDzEPN3J09VA1LAs6Nw4W7/Q0Dr4NAbsQTEPMRmEHlw1L2gwOyi
 iPolXath6G2g+a9+GF+ainVUoONv+/k6HHiSKr9TinwYic7iiuhdZ2C1vYxYwX/2fzlKTfW61kg
 WT9K5uMfc/2MpxtrdHxPEIYD0g5WHemH2Ybjmg50tBM6v3G5iihf2zcjxK/AZD5ke2UZcmnh6bD
 ARwIs6EVux6guU+bGqInfpDx9kcB34WcHFjx55fIAvS4n3GNtexvivy369xITMkrvqq1z5yP5An
 F/x+xTyJ7+O/swdnzWKQwIhrrmeI1rg8foJQiVK9GWFh25UpSu58tDP5BtXev4Vw+tDeFQktdPM
 1zrU3FUXiGrLE2G4AP9qkMTd1bYiRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280059

On Fri, Sep 18, 2026 at 11:25:54AM +0200, Michael Walle wrote:
> On Wed Sep 16, 2026 at 10:44 AM CEST, Nuno Sá wrote:
> > On Wed, Sep 16, 2026 at 09:14:52AM +0200, Michael Walle wrote:
> >> On Mon Sep 14, 2026 at 5:31 PM CEST, Nuno Sá wrote:
> >> > On Mon, Sep 14, 2026 at 04:04:40PM +0200, Michael Walle wrote:
> >> >> On Mon Sep 14, 2026 at 3:42 PM CEST, Nuno Sá wrote:
> >> >> > (*): I should note that the command actually failed with -EIO but it
> >> >> > actually unlocked the chip! And the reason is because the flash as the same
> >> >> > FSR register than the micron-st flash. So WEL is set to 1 but can only
> >> >> > be cleared when clearing the FSR register.
> >> >> 
> >> >> Why doesn't this affect only the locking operation? WEL polling is
> >> >> used also during write and erase.
> >> 
> >> Sorry I meant WIP.
> >> 
> >> > Not sure if I fully understand. But AFAICT, the reason why erase and
> >> > write is silent is because the default spi_nor_sr_ready() only looks at
> >> > SR_WIP [1]:
> >> 
> >> So usually, the WEL is cleared automatically by whatever needs the
> >> WEL in the first place, i.e. program or erase, write (status)
> >> register. That should also be the case for this flash.
> >> 
> >> Now for this flash (as well as the st/micron ones), there is one
> >> peculiarity. Whenever there is an error bit set in the FSR, the WEL
> >> cannot be cleared by a write disable command. Which we shouldn't
> >> need anyway because it should be cleared automatically if nothing
> >> goes wrong.
> >> 
> >> Also the write status register won't set the error bits if i read
> >> the datasheet correctly and it will always disable the WEL, see
> >> Table 29 ("WRITE REGISTER Operations") in the MT35XU512ABA datasheet
> >> and Table 8,8 ("WRITE REGISTER Operstaions") in the IS25WX01G
> >> datasheet.
> >> 
> >> > OTOH, on the unlock path we do spi_nor_write_sr1_and_sr2_and_check() and
> >> > give no special handling to WEL so I imagine that we try to set it as 0
> >> > but read it as 1 (given that it clears only with FSR) and hence I got
> >> > the -EIO in [2].
> >> 
> >> We do a RMW, so my guess is that it's the other way around. We read
> >> it as 1, but then after writing the SR, it's 0 (see above). That
> >> actually assumes, that if the WEL and any error bit in the FSR is
> >> set, a write status register will clear the WEL anyways. Could you
> >> debug that so we are sure, this is what actually happens?
> >
> > Sure I'll do some debugging on the unlock path. The DS seems a bit
> > unclear. It also states (for the WRITE DISABLE)
> >
> > "...In case of a protection error, WRITE DISABLE will not
> > clear the bit. Instead, a CLEAR FLAG STATUS REGISTER command must be issued to
> > clear both flags.
> > "
> 
> Not sure, this contradicts each other. As I read it:
> 
>  - Write (status) register will always clear a WEL, the only open
>    question is, does it also clear it if the protection bit in the
>    FSR is set
>  - Write disable won't clear the WEL if the protection bit in the
>    FSR is set.
> 
> > But the truth is that the second unlock I did came without an error.
> 
> Which might indicate that a write status will clear the WEL anyway.
> But then it might also be interesting to see if the PROT bit in FSR
> is still set. IOW, if a new write enable is sent, a write disable
> might fail even if there was no actual error.
> 
> >
> >> 
> >> But the question is who is setting the error bit in the first place.
> >> And I guess it's the testing sequence for the locking when you try
> >> to write to a locked range. So you could also actually test the
> >> locking/unlocking without writing any data to the flash just to see
> >> if that is the case.
> >
> > Pretty sure the above is the case! If you look at other tests after
> >
> > "Once we trust the debugfs output we can use it to test various
> > situations. Check top locking/unlocking (end of the device):"
> >
> > Everything worked nicely given we were just doing lock/unlock. The DS is
> > also clear about this (table 8.11):
> >
> > "...When a command is applied to a protected sector, the command is not executed,
> > the write enable latch bit remains set to 1, and flag status register bits 1 and 4 are set. 
> > If the operation
> > "
> 
> Ok.
> 
> > I also did tested with basically the same code as in micron-st and then
> > ERASE and PROGRAM commands just return -EIO.
> 
> But the unlocking does not return EIO anymore when it's executed
> successfully?
> 
> >> >> > AFAICT, we should do something similar as micron so the writing to an
> >> >> > actual protected region fails rather than being silently discarded with
> >> >> > that status bit set. The question would be how to do it? The code is
> >> >> > pretty much identical to [1]. The masks, the opcoded... So should we
> >> >> > somehow handle this in the core (by having some common helper) that
> >> >> > could be set in .late_init() under a common MFR_FSR flag? Or just keep
> >> >> > both implementations separate for now?
> >> >> 
> >> >> I'd like to keep that out of the core.c, but also like to avoid any
> >> >> code duplication esp. because there is already handling for the
> >> >> intel spi controller in there. So maybe move it it into a new
> >> >> common.c.
> >> >
> >> > Also don't like the dup tbh. Could that be a follow up or should it be
> >> > v3. From the top of my head I could think on a mfr_common.c kind of thing.
> >> > Don't thing this FSR register is standard?
> >> 
> >> Not really.
> >> 
> >> But (at least) parts of the datasheets are actually copied verbatim
> >> between micron and issi, I wonder if we shouldn't just put the ISSI
> >> part in micron-st.c. (Yes vendor will be wrong, but I plan on
> >> deprecating that sysfs property anyway).
> >
> > Also works for me. Say the word and I can send v3 with this in
> > micron-st.c.
> 
> Yes. But also please verify the our guesses about the root cause of
> this and what's the actual behavior of the write disable.

Pinging this one :). I sent the debugging results in another message.

Thx!
- Nuno Sá

> 
> -michael



> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

