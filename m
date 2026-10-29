Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793245002;
	b=q1lMcntdhKGqcieG6jdm2IUZLR7F97PxD/dijRuI5E2d5ZmOR4yfPjZ6vul8CfuOIJwa
	 QP5mQeqD92bfV7RRRtUezs0NIwmxW/LtVEoW6DlVwlCfn0gAyYziFAfQvlAdu+EAicHun
	 FSCqGx8PCgp0W3/m1kTCArD0GDImrKBWk5J2fxhhTzR4Qxtl/b5E5gfX0/S8cWou1X1vz
	 /CuHnel31Z6gDrMQXkZKeATlMD4hwFPzHRMDFhtAnfpUiKqdr+CdPiWiRlaAyraXX06bV
	 6O/pRbDMO5g8MJslaRLbklEq/nyF8rIb9otzfaJReOlO3Hh2UVHMBXyuH9JPBvTI2dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245002;
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
	bh=8msc7Ois/+ZC+tYFRL5gaLVZRpIfg/KZOwWSQAloa6Y=;
	b=dSaf0lm0sYLGSzLbZDtKclh1dt1P8425rkndXwYOufWRAPcFgQK8GGNT6y/hLZLnQA/m
	 +wqH5hqWDOIY3hm5Gq90n4arW0zlT+ZqO60+ORY8NA1/uxsTuARN2qkQIT0odyJGhJyts
	 fVOBbeBZtM2bCUsYMx1mnMHrVr2IV6qMQSYLs7PAHII2QMNL/9e5vJktGTFqe5snuDLAY
	 I1u8+AlXIRdhOIo+/7bgcx9ti0YMCjsBslTsWGhZIieIaur2ak36mAZGBoi2p6vtx5CzP
	 PgI+mueYjX69jFOab9vgO7H2zAbmsBOT4wFpYbOp5dF1DDo4Zb6HjAzoKjbHIsfLNKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PIJ27La+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.58
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013058.outbound.protection.outlook.com [40.107.201.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D435606A31C;
	Thu, 29 Oct 2026 03:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D435606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PIJ27La+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozlwcFGkxwvnoI4NdL7HTpswbBcwry0zEDFTUMQAz/Z06DAmzB1xw+VDTbsB9phXiaMup34XBxsWBlKrAAhaySqCfOr6yTZqFGegx2/rs0z+qfbAx7Yn0eYMeNeNb1ksROZuphoo5IX8E6cEI2EB9yDGe0YEveF6v8d3jtLbzn6bwF8jaLLyKpZ9UQMElIkM9dvCoQA3dpRax0SFlxUG9lpxYJ7lG1DWCUDzC4wPDnB2DSrA4+OBOYJW7+e8pHduwmZxS5AffC/rK2o6uNcDeL2eCazS/CssG91VCTy9Cl0VMxG1qJ47H4pajZ81Gxt3n02aoi7fV1+Io1aIdYNQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8msc7Ois/+ZC+tYFRL5gaLVZRpIfg/KZOwWSQAloa6Y=;
 b=HkJA5VItBqW59Kgt5IXMxnqfkh27S23grIAukTpWNDT2xVY2e3R3rZ+l8hfLQldI2tvmvq86/XK28Goru//J06C3v4igUFP2G7GvrN4Fz9tQ5y/MkQF0iQdF4HJAaXm38lYWUT/7nS4y9yrjCyiTE+RQTF3RffYeVm1OKHJ0vPly19S7j40Ov2WDSkPX+aPy/53+MF5WFzEal1sAb/WiFl6Topoho1npDHYgmgxSvf75OvtJA69jvZO4SppgtDqr0L2rTx100UMiiK5F2npwETkGKWJphnpqUXyoe4eK3NKoV3G2H8o9O1DSJMOJaj/us5v4xDZQ5M1pOCKwD8cIVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8msc7Ois/+ZC+tYFRL5gaLVZRpIfg/KZOwWSQAloa6Y=;
 b=PIJ27La+DShO7h98uVe09YINfXd9p6ICLiMmbdq1uhE5DrfQAfBYoLWHqUmplE9818xvkzg++fdNIwSEcb34gwYF/rjc8EYi6O8oV4Or1OABU5pVKJbwYIofQTSyjbRRfCDUejaV8tJlrHKRwB+bwydeoXKChU9Qb/O54Mxj8eQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by CY5PR12MB6599.namprd12.prod.outlook.com (2603:10b6:930:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 03:36:38 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 03:36:38 +0000
Message-ID: <3601b4f9-8ef8-40bc-8488-56ba2f1871cb@amd.com>
Date: Thu, 29 Oct 2026 09:05:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ASoC: sdw_utils: honor empty DisCo port lists when
 creating DAI links
To: Matthew Schwartz <matthew.schwartz@linux.dev>, broonie@kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
 <20261016232416.2628603-5-matthew.schwartz@linux.dev>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261016232416.2628603-5-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::15) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|CY5PR12MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: aabe7ba0-a153-4ece-4d69-08df356dd70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|4143699003|261028144727099003|261022075727099003|261026140227099003|11063799006|56012099006|261021121427099003|261009223027099003|261022105027099003|261021123027099003|261022113327099003|10067099003|18002099003|261026121527099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	CzTUFyEXDDtTFFcW4u7skCubjtlFckHnlx3budXZvUAGkpkHe/CNvM7oAJhaiqRVbY03FFIDWq/LY8DBFeF0eaYU4/ug2Rrze38aPIpksl5xG2aV0D5WRK0mU96SMwERt/Y6eZumvOmHY5kpYCTrBdu/VYUICKhoGk7hq1YIllp2YHBVWwribXx1yVT5/+YxiorDynjOJyQD1EWDcs4DS5X1SAq8w6DhNz/GTw/aA1pKwziiLMxMgpQanu53CIUgnnvt3MNz0ZcAKMLrY0QUkVS3Hr3b7Q0dJHa+cQhnhr6kKtdGC/wv/pGn/CxqEjzDdIopglL5H5ITO2txOmrEX/+88vm9dYLP46zbp+2OBHITK6DMUTYVPhrdkm6S/BNRQO0KeCra9AUU+TaCwxcGGH0A4rqFw+ao/4vfXK7Rn3Fn1FKcjULriaw9cl5Nwb7rT7A+C7rEowCwABJSdFKBGZrh+LVBvoBlvuzrCf1EuaapryclDdaC9+XRTPER8Pv7YIx5gp8oi22KM/A2jZ9YwfO66oF5wBgV3K81JGNRvx9OzU2CZ9xytqzGBA1euscUwqL5GhdOm9tyQWCQdp8YU3OJj8jPOXzWwXzc/IVRfzmUplkRlE/yXWCpLzs+9Veb/cPAr7CTGuak5DAV5C/Z8IB4l10eydFUfhNQ2vAfI7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(4143699003)(261028144727099003)(261022075727099003)(261026140227099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261022105027099003)(261021123027099003)(261022113327099003)(10067099003)(18002099003)(261026121527099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejBCTUJ0LzA2a0g0OUpkeUtjK3Z3QjgrY05CYUhRM3h5bzd4V3F5V0FIeHBK?=
 =?utf-8?B?T3lvNk4xWHNETmd1b21FSmlFcWFqYnRnL1drTDRuTlVyR3R1NWp0YmNLdUZY?=
 =?utf-8?B?ZDdObUJ0ZW9qTmxRczliTGliZnJGaGtHSjRKbXo4L2FiREt3aENpd1N0cHpX?=
 =?utf-8?B?Zk9nZGpXem5qbUFpMXV4cUd4N2tlWENQS3hsVUtpYUdWdnMxN1BsblhOWWNK?=
 =?utf-8?B?aUZLRHVlRlI5UzBoZlJXcU4rWTREbkJKOThPNnNucldRTWo5Z2xrRGFZMGFu?=
 =?utf-8?B?ZVhGajFlZ05Mc1gwWkhrRHJkZzVYeGcxZ0JkeTloR25oMUdKbXRhZFNxZWhH?=
 =?utf-8?B?am9KYmJPaUN3Y1lnZnFsV292bSt0c2JPWVhsa2o2bjVFSmRZRjJUUkI0YjFW?=
 =?utf-8?B?c2lQMXFXVDFYTDIyU0h0OHMzNnM4UWo0WUlEMWxFNTFnUUR0NDEvNU1DOGRR?=
 =?utf-8?B?RHpkUllYVkxxRERVK0drTGlRSDJFb3htSkpVM25qT0ZhN2JXeVhNclpMR3JQ?=
 =?utf-8?B?RXErd0VHNGM4OUU2UXZWaXZIdUxlNHVxN3p0RDJKT0ozNzJKVGtLUzVIVkVG?=
 =?utf-8?B?QmFHTVRvSndxWGdrWHRMQ2dlSys0QjFQWTJXRW5tTlVpa0dxOGdlbzlXNDdF?=
 =?utf-8?B?ZlAvZU9IeU13REJSWXFabUhDRHEzMUFEbW1Tc3VKb2dROXVxTjVkSHM1cmYv?=
 =?utf-8?B?R3U0a1A4RHVGdDEvaVNqclIvTHgyd0pxSmtoODNmeDlCWmtrcDlqaURlS1li?=
 =?utf-8?B?bDREdGRHSGdMczhWaHpjUmhJd1JuSzBOTGNXNEFJZk91NWtUb0NUb202ajE4?=
 =?utf-8?B?Q0ZXclQ0MGFsaFBxR2R4UzQ0NU84dVZmeFV2UU1oUzdSbmNaVU9oZUVidDJS?=
 =?utf-8?B?eHVQYTVUNWZzL0hRczViRkpmQ3dXblJCZE5lUFdNZWJRdzdPaFd2SnZnZkRN?=
 =?utf-8?B?VGNWa01WcDZBL3dUZnd3MlZVdHcwOTNpcnpDSFR0SmJMQWJJMThablNCR0JJ?=
 =?utf-8?B?em8zSnR0WnhaVUF0K21EYjJBQ3k2QUFyc2JZVlBqWWVHYjlIY1Q1Qm9vS3N0?=
 =?utf-8?B?Z1F6b3Z6bFNRbUhHb3Z4dDBBMFJ0dHdRMHRFTTJ3WFE0SHl0dDErYnRXSXRa?=
 =?utf-8?B?cmtQSlAvVHFDQUwxTytLbW9SWXV0cUJiU1FZMFc4eURIVXpxb1FEOUk4ZDVT?=
 =?utf-8?B?S1ZnZ2VTVUNSZUtjeUphRnVwcjlmd2dBN3p0Y1JqTzJVTHZPMm9HOVRVc0cy?=
 =?utf-8?B?a2N3eDc1d0ZsTzIzTWJoTkV3ZjNCYjFpa1BPYkRUbEdHTmc2Y1kwUmpqMU0r?=
 =?utf-8?B?cGJacVl1c3o1VmVDZVJRR0pkV2RjNjVWaXAzZCtCUVZ3NjVEZUZKVnF0TUl4?=
 =?utf-8?B?Z3NZN2pTeU92SGtIY2JseDZ2VW9MMUkzNmR5bXExb2JvRUJEWURrMFQ0anVZ?=
 =?utf-8?B?NG1IU1JXbkNpeG5qUFoyNzhSdUlIVEd5aDRySWJYNkFXUG01OEhwVzJZbUU2?=
 =?utf-8?B?NHF1RTg0bkpGaHVjc0dqcjBIMDhHTlo3RFBGTzl3QTU4U3pPY2h1RUJsSTRX?=
 =?utf-8?B?YkpFUGJxMmZnRUZmbzhCVFJsMElnMzUxNVVTL3d6RjM3WjMzRGhjUjN0WVF0?=
 =?utf-8?B?WXRPc1FHZVlSajNLNXEzd0VwZjFEazdMT1IwTmFQRjh6cExTZXBOUWNxVXl5?=
 =?utf-8?B?RDZpYkZ1Snk5cWpURFh5YzNBamdNM2g3U09JelhWMy9sbzRxMndJeEg2dDlM?=
 =?utf-8?B?Y21TRDdTQTlWVVBnUzZxZnpsaXlSQXRWMm0yVDBzTVNVY0J5dnNyVHM0UWtt?=
 =?utf-8?B?MitwcWRXZEltcHNsWjlUUGoxQzVtdFZtQytteTNialBoblJXOFZ3TXVOQ1pP?=
 =?utf-8?B?RDhFMUZaaXFkZzUwdE1nZlliY1Y4TlZUWldGMVpaaVlwaFA5YUIyV2t4WCtz?=
 =?utf-8?B?WXlPVzBRNjlqemxjaW5meXFyck5ib3lHZER6ZlI2azZhNzJ2dUI1S3V2RHN6?=
 =?utf-8?B?a1VrSGFTZkJpNHZBZjZ1RXNJMnJtd0xBREFHYXRRdGtoSThpek43RzVSdUQ3?=
 =?utf-8?B?NjRsNUxScjdIN1ovdmpGVGVjQnk0ZFhHbGE2OW0rSW1GVWsyckRlSmNHWGJk?=
 =?utf-8?B?bGVUMUE4NUZJZUVpUVpSTlAxbjVzRXFRYlFDWWw5M0drYjREUUJ3MjdkenY2?=
 =?utf-8?B?VnZsM054Z2NSd2FvZnl1TmF6WjZuK3BoMitZNVRNZktwWW9Md3o0OU4rQWRx?=
 =?utf-8?B?YmtTNjMwR1ZpdTdwNFVlaXVGMjF0Uk1ibHdXb1lRZEE4YnpMcmJwaWlMODZq?=
 =?utf-8?B?SjdEK0kxTTVwamVLVE9UNnRudmlIQTRkdDVBcTF2OUNLcDlLU2JkZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabe7ba0-a153-4ece-4d69-08df356dd70a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 03:36:38.9055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbrWsVOHs/V3wUIGsr1XU3Q1EK3OI7pSWuAX2BzsHMpwqPCJd8KbrZCDvQzP6EKNezgyJ/9EiZ7imVWsQ4sX6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6599



On 10/17/26 04:54, Matthew Schwartz wrote:
> The codec_info tables give each DAI a fixed direction, so a TAS2783
> always gets an amp feedback capture link. The ASUS ROG Xbox Ally X20
> BIOS declares mipi-sdw-source-port-list as 0 for both of its TAS2783s,
> so the capture port has no DisCo properties and every open of the
> SmartAmp capture PCM fails in sdw_program_slave_port_params() with
> -EINVAL. The PCM is probed at session start, which logs a burst of
> transport errors on every boot, and the same failure is reported on the
> ASUS ProArt PX13.
>
> Store the effective direction in each endpoint and drop a direction
> when the peripheral declares an empty port list for it. A missing port
> list keeps the table direction, so platforms that do not describe their
> ports are unaffected.
>
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   include/sound/soc_sdw_utils.h           |  1 +
>   sound/soc/amd/acp/acp-sdw-legacy-mach.c |  2 +-
>   sound/soc/amd/acp/acp-sdw-sof-mach.c    |  2 +-
>   sound/soc/intel/boards/sof_sdw.c        |  2 +-
>   sound/soc/sdw_utils/soc_sdw_utils.c     | 36 ++++++++++++++++++++++---
>   5 files changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
> index 418466438ea1c..8e247a457a7c6 100644
> --- a/include/sound/soc_sdw_utils.h
> +++ b/include/sound/soc_sdw_utils.h
> @@ -114,6 +114,7 @@ struct asoc_sdw_endpoint {
>   	const char *codec_name;
>   	const char *name_prefix;
>   	bool include_sidecar;
> +	bool direction[2]; /* dai_info direction limited by the DisCo port lists */
>   
>   	struct asoc_sdw_codec_info *codec_info;
>   	const struct asoc_sdw_dai_info *dai_info;
> diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> index a8b62817b2344..d485cee42542c 100644
> --- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> @@ -262,7 +262,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
>   			return -ENOMEM;
>   
>   		list_for_each_entry(soc_end, &soc_dai->endpoints, list) {
> -			if (!soc_end->dai_info->direction[stream])
> +			if (!soc_end->direction[stream])
>   				continue;
>   
>   			/*
> diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> index ec3e1f5f1052c..87e495e601bcd 100644
> --- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> @@ -177,7 +177,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
>   			return -ENOMEM;
>   
>   		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
> -			if (!sof_end->dai_info->direction[stream])
> +			if (!sof_end->direction[stream])
>   				continue;
>   
>   			int link_num = ffs(sof_end->link_mask) - 1;
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index 72fe013fffe86..42c6c262cc80e 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -973,7 +973,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
>   			return -ENOMEM;
>   
>   		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
> -			if (!sof_end->dai_info->direction[stream])
> +			if (!sof_end->direction[stream])
>   				continue;
>   
>   			if (cur_link != sof_end->link_mask) {
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
> index 7a19de75f32b5..126ff1b2dc450 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -2407,6 +2407,32 @@ static int is_sdca_endpoint_present(struct device *dev,
>   	return 0;
>   }
>   
> +/* A DisCo port list that is present but empty means the stream cannot run */
> +static bool asoc_sdw_has_ports(struct device *dev,
> +			       const struct snd_soc_acpi_link_adr *adr_link,
> +			       int adr_index, int stream)
> +{
> +	const char *prop = stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +			   "mipi-sdw-sink-port-list" : "mipi-sdw-source-port-list";
> +	const char *sdw_codec_name;
> +	struct device *sdw_dev;
> +	u32 ports;
> +	int ret;
> +
> +	sdw_codec_name = _asoc_sdw_get_codec_name(dev, adr_link, adr_index);
> +	if (!sdw_codec_name)
> +		return true;
> +
> +	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_codec_name);
> +	if (!sdw_dev)
> +		return true;
> +
> +	ret = device_property_read_u32(sdw_dev, prop, &ports);
> +	put_device(sdw_dev);
> +
> +	return ret || ports;
> +}
> +
>   int asoc_sdw_parse_sdw_endpoints(struct device *dev,
>   				 struct asoc_sdw_mc_private *ctx,
>   				 struct snd_soc_aux_dev *soc_aux,
> @@ -2529,12 +2555,16 @@ int asoc_sdw_parse_sdw_endpoints(struct device *dev,
>   					}
>   				}
>   
> +				for_each_pcm_streams(stream)
> +					soc_end->direction[stream] = dai_info->direction[stream] &&
> +						asoc_sdw_has_ports(dev, adr_link, i, stream);
> +
>   				dev_dbg(dev,
>   					"Add dev: %d, 0x%llx end: %d, dai: %d, %c/%c to %s: %d\n",
>   					ffs(adr_link->mask) - 1, adr_dev->adr,
>   					adr_end->num, dai_info->dai_type,
> -					dai_info->direction[SNDRV_PCM_STREAM_PLAYBACK] ? 'P' : '-',
> -					dai_info->direction[SNDRV_PCM_STREAM_CAPTURE] ? 'C' : '-',
> +					soc_end->direction[SNDRV_PCM_STREAM_PLAYBACK] ? 'P' : '-',
> +					soc_end->direction[SNDRV_PCM_STREAM_CAPTURE] ? 'C' : '-',
>   					adr_end->aggregated ? "group" : "solo",
>   					adr_end->group_id);
>   
> @@ -2555,7 +2585,7 @@ int asoc_sdw_parse_sdw_endpoints(struct device *dev,
>   						return -EINVAL;
>   					}
>   
> -					if (dai_info->direction[stream]) {
> +					if (soc_end->direction[stream]) {
>   						num_dais += !soc_dai->num_devs[stream];
>   						soc_dai->num_devs[stream]++;
>   						soc_dai->link_mask[stream] |= adr_link->mask;

