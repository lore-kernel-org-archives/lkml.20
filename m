Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793082719;
	b=2K1Fwz3zuxShJlTCahf0b+Kc1GjNh2ZAhUXk722jMjT4SXxy6eRvgx+JW/XbmHmzAEEp
	 ehuO4GH+IIhcQjm2ldpzvOs1DQ+s0sRxNbYWveb/WMm53pymiXC5ivJS6StrA4DO+Y5Wf
	 pHbMEmfEhuNYXZkwlWwbUL89WtBfO/rFasg3Jp/4XYJvJ1dvZAHrM3kKx9mkXoDYOVXGG
	 Jd0Iu0iH1gJHfx2vhEydveiyWk2XB2Ct4bPJcjlw2mBZ29AK+R+srV9VR2Hbvpiud9kyU
	 zMARXYT/4RfaiFPlT/KxVggQVyQRPCxlwP10U/Mb7lpc6yw9UjaKDRHvm+XxilGDXiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082719;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=8J72O3GnFEOh/ghiM8CnwfzgZe4C5szsa7q5uaNEYLk=;
	b=I7qJhZSuI3EJcAkIDT9CnwDA0/PE6Y1JbbUHtXu4MbcjpTb9t4HXIupsk5FwKyS5ji+q
	 4bx/Tdgxa6S83RNM6/4QsEi7WGx/hvyYFwkvYOtppo6yRj/hnZ6mAwhrrMFp9WuMd1qe9
	 0nWorIhm/BdQtJzhA2DfTO8iwbc4aFpBVwtSHkb/XrB6GdQgvUfa7SHLHH1FD22Q4/FZ2
	 KRVXuX7J4NK33Yh0xIA43kT3Xrwegim9CU18XXsgNeVuT1RbB6vXKissk1bUuCdwNVqJQ
	 9ljixudMOlFQti2+2W1KvJLbPdMJDOIQw1CUXtRdkYqifkpMZ47TNzwTsLbAvHxIshw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SF6deb8Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.71
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011071.outbound.protection.outlook.com [52.101.57.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C5606A31A;
	Tue, 27 Oct 2026 06:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E5C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SF6deb8Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxFsf+Xgm5W4i48JhpcNwi/xzsO5K86jTjczcdgPKXXYjXSDbJun+bJwE03uzgfvVKmxQT/W5lICJPc4b15fDotGLJU/LYNuTLlzr0uygjivPz8D0WB9hcl7Yj+Up5UsMOx8w+IcVaBWlxd+p5xQ/Zmw146UeW1EDWdL7q5Vjzbs0YI+uXsOhzq3yvqIeeNrUaHKoDEw1nXNlURVNrfyY4LK9EN5X2E5NFZRuqknFRx+1+MuudxYgJ2qmT8eM/nxuGu80IP9LSsp8Rq8JCqTonDvWRFCf42RTeXHCMuRXFO4rjzyOFX8n8mHDupCV3yLbF45iOrEal2iFJbIK8d9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8J72O3GnFEOh/ghiM8CnwfzgZe4C5szsa7q5uaNEYLk=;
 b=LaBuvopUS1NK5RMmzeR2m43PbFvRX0jhzIhzbxPI2PUKGAogzvSZtv13RYOHZwx/1GnOX0v8MSj2H8laBrlIb59J4inrf5ARopurS7Uaicm+TC8ZKKvb8Z/UEMCF5yKaL/Iy39DxEgdb3r/AWx58RO7CePd/ILiRT+vs+oGInpbNQ+el7x/SVmdqRhONHXLgufQDQGQblSAW9wnw+WadoEZCPvooIWvlCRtPajzH+Pn/lJIKwAiElf4mJ/TncpNwU0NFLBVnSXIrVkEJj46jBiPdWkVKXvqtpkk4c/ZMJ0p+fR8u0KXglqTSW1TuHOznA9dvCDpB4nrr/u4F61ECKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8J72O3GnFEOh/ghiM8CnwfzgZe4C5szsa7q5uaNEYLk=;
 b=SF6deb8Y3gH3CGQDe+VzR7F0WR8DmDE1Uq8/l/SDGZdqWlWxQ1Pq5opSkZWoMZb4gbTLZG9mIhcHoDqsAu62EqZzeCgPe3YXj4Q3gKZgLTphePJRV2mfOtK10fBqJiUkLpafLJBE+IooMBiA/KmIrJD0Xg1IF94NzK5TChAbHuI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH4PR12MB972801.namprd12.prod.outlook.com
 (2603:10b6:610:51e::17) by LV2PR12MB5917.namprd12.prod.outlook.com
 (2603:10b6:408:175::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 06:31:55 +0000
Received: from CH4PR12MB972801.namprd12.prod.outlook.com
 ([fe80::d532:831c:2e30:a7f5]) by CH4PR12MB972801.namprd12.prod.outlook.com
 ([fe80::d532:831c:2e30:a7f5%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 06:31:53 +0000
Message-ID: <57b8aa49-2b7b-4b2c-833d-893eff95134a@amd.com>
Date: Tue, 27 Oct 2026 12:01:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: Fix read-modify-write of
 AUD_CTRL in hw_params
To: phucduc.bui@gmail.com, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261023102818.523331-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: "Gaddipati, Naveen Kumar" <naveenga@amd.com>
In-Reply-To: <20261023102818.523331-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::6) To CH4PR12MB972801.namprd12.prod.outlook.com
 (2603:10b6:610:51e::17)
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
X-MS-TrafficTypeDiagnostic: CH4PR12MB972801:EE_|LV2PR12MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d625e6-824b-4c41-22ae-08df33f3fd7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|261009223027099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Yy2iOdU3TmbwCy3+QSlqBtAqH0LT1l0IK1h9qzH0oAJpZWCKdTHC01pPVogTGfPxND9RBH84OaIH8/9w/86TDwXWPadQwMXmEtoUqqpvdUIVgvRoxv2gN9GQw6+OJdeqzgJYSDui4g/JeUJwL7sDEr3TKZtAsDSqXPm2VTrZ+kxQDjwRXABzsFlbAd2arx3jsY1/92sfgOUN9sF4M0Bjj2VwAN3SV0iDp22TZn3n+8x1tBtkdUKjkys1RS21VNhZ6vVSpHiLg7vhBCiOuKJTOC8lzTiwMgaDH3FLIPwg6lvwVvYEcWO7KgBwV0joBHl/ZTNwIfWZa8Gr30lvSQVYlwqJngHbbNX77u/5yqrPnPUoZlysmp2Mv7zK0u+cVWQpw1iQ8wes8e4ass7sAI+I6Qp07UYn9jDfHZ18iyASgQcW++xKZCgwH5OAY6VcDga68061OlxxCGXKWa0Pp2gYIyvWvI8rtXHXKx38dpAbA/qLtozeeSRD4xDS9HPe4bYLxz55lht67uvrxluMmLTzx5kJoQIIwY304Eof4iDQe3+40HyZgfgTu364ITYk8lDTEq51z80vsmEDxuHNs5ETMjtbxFTEhxkAwQUenshZT7UXK8D0kDQpF9XlSYAi8d7D0KH6eJWW47zJH1cl/gj4+ScaEJBEHRtFY+f4Ynmkb/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR12MB972801.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVJUcmJsL29vR2IrblBQaEw3UVJKQ1Y5VFJIdWRWdVpodXdvMGRlTVdUdkNC?=
 =?utf-8?B?ZEo0TUw2L0pJM01mNmJxUmZXNG1oMHBlQk11U3VoaFFBNy9TQy9tdTR0cEl4?=
 =?utf-8?B?OEdwcVRwRmd3bGNNY2dDUmloM3JGdVJjNm1xYkVTZjY3MFBWUW1rUTFTKys5?=
 =?utf-8?B?Q1FNTzVMNU9QTmpBdmtNa20vVzlhSnhHZzJUMm4zNUxiQjhZSHBEUU1JVGNE?=
 =?utf-8?B?eGdldHBUV3pta21mMDM1bkJaazVURnlSZ2NnZFZ5cXZnRkMxVXhKUnR1ZkNG?=
 =?utf-8?B?Q3RpOTVwOGE2b2ZmSEVNWUdnTkVVaTVETENYNUhPMVZRUE9WMys5TVJCU084?=
 =?utf-8?B?TTAxOGJVc0dVMlgxSytWa3dqUkZVNkhBMnI4eTFmQVgydThsN2FaQjBJLzNE?=
 =?utf-8?B?MmliQUkyZ1ZHaVVBZTBmaHNOajA4eVJxUVZUcjdGdGRJcDJPZFA3SjJVNkZt?=
 =?utf-8?B?RW9WOUE4SEpqYTgwcVZoZGdiSnVnb212UnMxbE43L25nT3M2bFNab2pJZnVV?=
 =?utf-8?B?UkQrenFjUEdHeUl5NXljcEZ5dE1rZnN0dml5Mkxrdk9YeklNb1VnMGFjTExr?=
 =?utf-8?B?MC92djdyWWprcTJpYXd0akhWMEJpVm9YTmw1TlIrWFpiRXFaUzAxME5EZERl?=
 =?utf-8?B?NXZScE5tOENXK3BCakE3RUMxbEJDdTg5MGtIaG5mYUYrcTBONUVOK3BVRmpI?=
 =?utf-8?B?VEs0QTNkcUJZaEVNM3k3UVpNMG1FZG0yK2RqbkYrUDVQU1lDSDVlQWNYWGF1?=
 =?utf-8?B?aG84a1pINXloc1pNR2crai8vRjI5TGpROGFrNXRIQk5CUWo3VUZrVXdVSjg4?=
 =?utf-8?B?Tk9qS2p1MlRoNzZhZ00yQVF3WW1UMmVMRmFZVHR2RDFPMXhxMU9RRHJVNGFF?=
 =?utf-8?B?Zjl1THhsMDJzMWhZcFJaQzRBcmxFOUY2WktQV0EwNlRkV09QeFZYeE94anN4?=
 =?utf-8?B?cTJKVjBiRjdRQjZZQ3p5bU83UlAvcjhvTDFhcmZaRElpS2k4Tk9EVEIrL1Bv?=
 =?utf-8?B?Mk82cWFPYmFFenhBMjhzUlN0QkFiR0pCRUJ6ZzQyT3VOdVU2VHhrNkZYMzJK?=
 =?utf-8?B?VW1hTTM4ZGRRODhYRnJ4Q0U3ZzgwOExiM3d3eitYc09IZ3JmcWdSQ2QxWUFH?=
 =?utf-8?B?b0lHSnQ4ZDhVMTJkSlAydU1FME1aMVVsMExiUWZvcWhqOHMyeGFHNFZDSXdP?=
 =?utf-8?B?dEc5aHgzcFBwa01ocGcyNGIwNkc2bjFlUlVXTEpQNVdzVkM3UDBQYkRhWDA5?=
 =?utf-8?B?ZFBsY3ZPZ0l6bTZ6a1piM09sVzJvbkJRRXJsT3NKOTQrb3VLaUNSeEVuaGg3?=
 =?utf-8?B?OHZUVUhIZFpLTVZ5alk3M3hUUmJCMWFudFlmRlV4cWgzUnpveitkalRhSDZI?=
 =?utf-8?B?WGhBQ0d5L0FXL2hZVHhTZzkrb1VIdmZqRG1mUm9OaWsxVEh3WURoTEpxL0gx?=
 =?utf-8?B?K1pGOWh6MzRJSWVxMzhFU3Q3eXpwVnA1bk5CbjAxYzAxVHlqdFZZREhZNWMr?=
 =?utf-8?B?NW5CdmxJc1VnMDliTVdnbm8wbHMxalorZnNEc1pibXB1TVZuZVNlSGNUQXRo?=
 =?utf-8?B?dEFPR0NIMzdIdzVEOGoreDZNRTlvdHVCbTlVRDFzNWQrU2VtNUE4VHZ4ZE5s?=
 =?utf-8?B?azRMWjRaZmZMOUk4Rk81Y1QrMFJ2YU13a3BSM29rdFZHREF6bHdZK0kxeDI2?=
 =?utf-8?B?eGx3Ly9WQkc3MEIyUzVRbk1QRS9PSlEyV08waVB6K2taZ0dDNTJuWEExdDYy?=
 =?utf-8?B?bklxZ3RPRkZKblc5bzlQR1JpNW0zL3VZRGNDVUcwTzBEYUFXcDRlWTBSd1Y2?=
 =?utf-8?B?Rms4WkFsTDRxcjJBV1M2NStPS1dnaUp1RGtTY0cyTFNxTmUyNHhwdTRaOHhP?=
 =?utf-8?B?aTc0UEs3a3RWNzNlcUpycU5taG1nSFQxZUQ0VHAwRG1FcHdjeEFKQ1RQZVU3?=
 =?utf-8?B?bDJONzVUdHdFWHN6Q2o4eGF0SXVxR3lRNnRyUnh2VEppbHNBUWVKZ0ZpUEdt?=
 =?utf-8?B?bXFZWTlhMWZNRmxsb2I2RGlIaVVoM0JleXNmSDBkWFBWa2lVb1dtTnBjNkRR?=
 =?utf-8?B?N0pTWFVDb29yamtsODJCaGxOcVFFQkJSMXNjb2ZkaHZzazhoLzdZOHoxRklk?=
 =?utf-8?B?TGkycUc4czlYWnRyVXRLZ25FZzhIWEV3TjM2QkxHSUVMdDdGbFhDb0Jzck52?=
 =?utf-8?B?R2ZqWDQ0WGo5bklIbGhUOThRbGlMbC9weTV2N21ZbFZORDNDOHBMbnEvOTA5?=
 =?utf-8?B?ZFVKeExkK1R2eEtCQnN2c3dDTkpTNVE3RVRIU1lUWWlOVVlQSzI5dmFrRUtZ?=
 =?utf-8?B?dkw1OU9BU0xBYTV2L2F4OGxFaG5NcVIxdFBKZXlnSDJSM1VtMWFhQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d625e6-824b-4c41-22ae-08df33f3fd7f
X-MS-Exchange-CrossTenant-AuthSource: CH4PR12MB972801.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 06:31:53.6362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+RGMWGQR/piI1GDClsrX8oHKHMdUctYMfL3hf/7P9Xw89QlMlJU9VD5o1dxh9Q4WWSvAOFbOl9rEaqDqKeA7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5917


On 10/23/2026 3:58 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> xlnx_formatter_pcm_hw_params() does a read-modify-write on XLNX_AUD_CTRL
> but only ORs in the new data width and active channel values without
> clearing the old ones. If hw_params is called more than once on an
> open stream, these fields may retain bits from the previous configuration,
> resulting in an incorrect sample width or channel count.
> 
> Clear both fields before writing the new values, and use FIELD_PREP() so
> the values cannot spill into neighbouring bits.
> 
> Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Compile-tested only.
> 
> The field masks follow the Control register layout in the Audio Formatter product guide (PG330).
> https://docs.amd.com/r/en-US/pg330-audio-formatter/S2MM-Control-Register-0x10
> 
>   sound/soc/xilinx/xlnx_formatter_pcm.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index 304220d9aaf5..781508aef885 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -6,6 +6,7 @@
>   //
>   // Author: Maruthi Srinivas Bayyavarapu <maruthis@xilinx.com>
>   
> +#include <linux/bitfield.h>
>   #include <linux/clk.h>
>   #include <linux/io.h>
>   #include <linux/module.h>
> @@ -55,8 +56,8 @@
>   #define CFG_S2MM_XFER_SHIFT	29
>   #define CFG_S2MM_PKG_MASK	BIT(28)
>   
> -#define AUD_CTRL_DATA_WIDTH_SHIFT	16
> -#define AUD_CTRL_ACTIVE_CH_SHIFT	19
> +#define AUD_CTRL_DATA_WIDTH_MASK	GENMASK(18, 16)
> +#define AUD_CTRL_ACTIVE_CH_MASK		GENMASK(22, 19)
>   #define PERIOD_CFG_PERIODS_SHIFT	16
>   
>   #define PERIODS_MIN		2
> @@ -506,28 +507,29 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
>   	writel(high, stream_data->mmio + XLNX_AUD_BUFF_ADDR_MSB);
>   
>   	val = readl(stream_data->mmio + XLNX_AUD_CTRL);
> +	val &= ~(AUD_CTRL_DATA_WIDTH_MASK | AUD_CTRL_ACTIVE_CH_MASK);
>   	bits_per_sample = params_width(params);
>   	switch (bits_per_sample) {
>   	case 8:
> -		val |= (BIT_DEPTH_8 << AUD_CTRL_DATA_WIDTH_SHIFT);
> +		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_8);
>   		break;
>   	case 16:
> -		val |= (BIT_DEPTH_16 << AUD_CTRL_DATA_WIDTH_SHIFT);
> +		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_16);
>   		break;
>   	case 20:
> -		val |= (BIT_DEPTH_20 << AUD_CTRL_DATA_WIDTH_SHIFT);
> +		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_20);
>   		break;
>   	case 24:
> -		val |= (BIT_DEPTH_24 << AUD_CTRL_DATA_WIDTH_SHIFT);
> +		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_24);
>   		break;
>   	case 32:
> -		val |= (BIT_DEPTH_32 << AUD_CTRL_DATA_WIDTH_SHIFT);
> +		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_32);
>   		break;
>   	default:
>   		return -EINVAL;
>   	}
>   
> -	val |= active_ch << AUD_CTRL_ACTIVE_CH_SHIFT;
> +	val |= FIELD_PREP(AUD_CTRL_ACTIVE_CH_MASK, active_ch);
>   	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
>   
>   	val = (params_periods(params) << PERIOD_CFG_PERIODS_SHIFT)

Reviewed-by: Gaddipati, Naveen <naveen.gaddipati@amd.com>

Thanks,
Naveen
