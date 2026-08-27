Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A75D3644BE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829918; cv=fail; b=JR6ieksyxun+bq7P2uwWuCmg0TR11infNBU+ZGY8UXki3G1k4A41WjrvSJDI/WkglKoLgI8bK604o3SD1W/V35m5gxxb1sS8OIwZ4jUyMHXVnZ+d/lo6FbPFbx+19XfPnxOvW3cEXHrLxe+FPWCcBTIS2vsYiqRpbEJHSiyjBdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829918; c=relaxed/simple;
	bh=LhcxJ9/L0yonK5m7afUMubh/eIAY2umCs7B/q97b+0Q=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=ag8c4VspX3yZXPqCBzffFX+z8Omrm63d2wTgs2qtVjIQsyAF8QhX//ITMJi49z9N2FR9CVRQnNzlPzSShLP5eyif0R1PZ9D9PYSXamCGt+7+t1HusR2pR54ICag8pKmSAbABLQKPtyQJannrcV5DO7urqImhWJG8iBhOtTxF8mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eBpI1k07; arc=fail smtp.client-ip=40.93.196.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eBpI1k07"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qu3tKbac2mF9V7ISqK9dX2R/dw/qvV+vsIVztrXljQhH+MG/3hoaTZM+dXn9Flw7dslvEKab628C7atA7SKz0Ez5Eiq8E/5bzFSJIRzxoh3ZjVqacvx2IMDiDp1aF4qT1g/r77sWItsFxV/09CU5uLwHc4nlztkHEEqVSyPtbfCs44MzIcbDZ5ZGfWJKwtBpSHDTcC/BXMpEWCPgcWRnbIu2UYaJyBFF93Wpl2+tLag4agGfwOdBQ362cx1s6XWsbJGZhFOGO41/JAbSmC8QKCfxzVikjAe+Jnvlk4W6g1V4ev100mJyQR1qoVtdtzghIiPMQiGaIl31KJyCoT6pAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IV0OkedGNdhCeqUQv8A0r0nLdaibU+MZlXYqIEIKLE4=;
 b=qWPzAQp8GXcGledkRXOJexFB/+647SfDIdK7SuUqeB3VbSgH/m4AdRsYM85kP3n8Yz7VTr03En/7+jK8MyN4iTwnYcXi2ZJ4q1I9KCO20I+5E3abCh4M3y0IS7TyMOqMA8lTUvOIVZSN/6cwrPg60GgC7PRZlgnQS0oJeTzgfSQaoRj3CZvL//S0LCOCRDXO5Uyhv/f7oOpFRfpgAn958MYgiPvd5ER8Ma+OzOW12PWkwUON807Tbl1YJiL0ip9v94F82dfY4+Xp+xwAj58gMqzd7xX4ZUrn65zzo//8Ff5lxS7Sf2NpoviTM6DtNqZfuQm1c7k3xRrAjvxPbDleaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IV0OkedGNdhCeqUQv8A0r0nLdaibU+MZlXYqIEIKLE4=;
 b=eBpI1k07ffy+akAAbyqdQOWgkDC2pcS/L5jHEjNjH8r9oz/Yb0P0XeEi6y3u+PSW2qYU52ENqkbLX3r++CqmZCBu72zwTvmX6tV/vlJBe9M+3na2BGmsgdLC9YyaWkEcP7zTr081QqzFP/uPe59MnyFljBBW6edmXwg/OsDBRv54CDynSG0nn8tLD3RG3DAPhyWjIHFvXMJkOOzTWaregCRW63w+jX6YCOdNrQnRcthU2IdKU/hSbVlkb7s2iyXJP9wN1Lme3csaU18QoO2sSLDcM7GMcGT4BN6kse/qdt/+lwDhy5VQ+3MMPCrLjCmBPVKMpqgtjXh8RUURqPFrnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 11:25:13 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 11:25:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 07:25:11 -0400
Message-Id: <DKZOT75FS17S.V9DYDW4V5B6V@nvidia.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
Cc: "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Liam R . Howlett"
 <liam@infradead.org>, "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry Song"
 <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama Arif"
 <usama.arif@linux.dev>, "Lorenzo Stoakes" <ljs@kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260827103435.1371882-1-kas@kernel.org>
In-Reply-To: <20260827103435.1371882-1-kas@kernel.org>
X-ClientProxiedBy: YQBPR0101CA0325.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::23) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 71739448-1adb-4a56-6cd0-08df042ddcc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vN08gAcPNIFlyfnNMfZLMhCjPRpNrAMS7rp32g8InyQKGlRn6WrCk4Apf/30ZERWSASx4tVy/3AZe0B06ZhhwPDqQGo89Rk/D1c51+w5tYnWip0lXYAFQMMwpA/JHsBOipCG05U5feagzUT3+rOmUv3fELhcyqKOrc9zeI8LMsnnmqVleZLUh+ysFeVUmr9cAWRawvyvkHGchQKhmPXK/sDTE22WqBEeqrxeJaIDU8I9byo7+jjHJc0X2tBI8K9M8cINIeBuAlpOtnnIth3MLL2CMtoEPBUMmWGzb7tmttsXDGnvW6lR2QaSLpvm/rognoZTwEXXs5rgFNhsVrhakgm2wp+W1FXrEZKFcfMG3/OC9wKERgZpn1pIrYOhLeVMrBrScvp3kHiBKdGfuu0u0KLQzJ3NThvfDlwEg5J3TN2WeVBvtA0tONpVQYhU0qgwbkIN4fzzg4PxlQznR64ANb1qacp5EhMOmjXsBDVpB7OUpwsEwY+Pohs8X75NwjJb5OldQ34k3RuzjzWPw5cBovU2gb7MBsaLanMvBoMxSp2FuW07ywsKeR9xHtTHOKJchoSHK5wkiLscuxblstjVaeipFshORIQdY6S177+msuaOlpW/XRNszwS5Q2MF/hRQYx1k7Kv9uDgk+t8GsSgHgi2oc5P841385er7Q7OnVp0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEs3eU1COVdUdjlOY1RXV2t3ZFAwcHNkRUZQVjV6K0Z6WVNJbTE1SlhoV0d2?=
 =?utf-8?B?b3d4T3IzbzN2MWNFM3RDalJKODRpaHRwZjhzUTNHR3hFZytodnlkOGJ2aGNX?=
 =?utf-8?B?Q2JpSjFESzRHOTZabm8zMkhSVzNJVXl0ZW4rSU44UU1JNE9OU2Mwb0xnZkt2?=
 =?utf-8?B?dHhGMndMeWEzNXJPTDhRclV1R0RZbkJrNUVEdzcwWGZySDl1VmNINzRvTjBr?=
 =?utf-8?B?TjVRTWxkSHFiTW0zQldXL0R4Vi9xek1CaGRQN0VjRnRvQ2lWenBWRGJNbVFw?=
 =?utf-8?B?d2dVYS85OEgwQ2xwZytxM1JSckx3Z1NUbFVEZzdUeGhPeWxDMURYNm12T2RG?=
 =?utf-8?B?VmFUQzF1MWpLK3NLOVdKbk04aTBxQVd5Q3Q3aHFWV0srTjBoTm5WYlhZYSsx?=
 =?utf-8?B?YkthbUZSdEtLTlZRSlhRajhDZXh1amFydFhLV3l0SjM1OUs0MXdUOGJCOHRx?=
 =?utf-8?B?QnVuYmZDOE1ZdWdkMGYzODZ2MVlZZzNDTmRveTZ0d0xKTTV0VGtqdkJ5Zld5?=
 =?utf-8?B?NDNFZlI0bHBlZXhLZlBEdlZ0bFlOZFlpdzFrWTErNkQwMC80RlZNZ0NUOUU1?=
 =?utf-8?B?WUdPS1FmWVNibTFiRVZWSFpwWmIyTmx5WmJVVWZ1VlRzZGR1Ymh4NkI4bWlK?=
 =?utf-8?B?Njh1bXAzbUw0L21HVGpEbElabkt5MFBCa3c5Y1VCQlRpeFM2OWdzTU41Y09t?=
 =?utf-8?B?RXNKSDlKZlJ0Y0E1MHJuMGRPZHpEVUo2ZkRabjYrTG1GeExqSEIzWm52YVBp?=
 =?utf-8?B?MGtNei9WK1hRZFlvODZnMTdVNVJMNzhlOHhpVzNlbi9LRFIzR29iV0ZpeEUz?=
 =?utf-8?B?cmJDY3RqanBIY09pZVArbUZyNWU3NEUyRmVzclMyaEtpVzBmWmV2dm83WUFS?=
 =?utf-8?B?bm1lQnJtMjN6dVBwWk9xa09KeExCQWl6NCtZTk56d0M0UWZnNUVHOHNHaHNS?=
 =?utf-8?B?dWFYWG5nckRhbTFMWVpEL3FNc1QzK0RVRTdzc2E1UWFlby85Q1pFWU5uYU1a?=
 =?utf-8?B?SjFLQzBFd3MxcjRDWlVORXI1c1hHMXYzMkVTUGIxd01mdHN0cVRTRHlEV2Ni?=
 =?utf-8?B?emdwaDU0bDdRak05UHZuRVhJUktUREgvckxtOE0zUUpNWTNSZkZHT3JHekpj?=
 =?utf-8?B?eGlXamVEUWNCUjZWOTVJLzFaT0JEcFpBVGhURTZMbWNkTWFwMWdFWXBxSWZN?=
 =?utf-8?B?VzZ5Q0tERUFuN1dodW83WGYyRGNmNGVWSWNTUHpVOXEyR00vYjRucnhIckpO?=
 =?utf-8?B?Ky84QzQxOXUySjNSYU14L1NvSWJoUG1zWUU1bVZVWC9SWFpjWXVtME0rKzFL?=
 =?utf-8?B?SlNqakMyUmdZeFZQRWNaS1ExbG9VT0ZKYWVZaUhYNmh2NzBHbWxaSnI2ZlVY?=
 =?utf-8?B?U1hTRmxPbmFpbkNDSHBiQ1AwQjZkRG9nYlFURVl4RWZFbWQxQ1g3MmRNeTVi?=
 =?utf-8?B?c1A1eGxidy9Kc0dhcm0xZzFMa1FVZEszYmczVVZYUm5qeDdMTDF1Z0xSU3Bs?=
 =?utf-8?B?RUhsWGY3eG5WSGdKMThxb2tvdGJaZlZITFZGZ3NYQUIzR2RjZ0tRUitzWTZF?=
 =?utf-8?B?d3h5eSsyZFJsaFZhTXh4cFVHZ3JiVGpwU3BNQ3FGd3dWMExSdVA0TWh5ZEI1?=
 =?utf-8?B?N1FTUmgxdStQU0s4bFhmTU9mT05VNldOZ3dqS3cxQlhWajYrdjJHL1ZReFVQ?=
 =?utf-8?B?eGswS3F0RDQxSDZTaURuQjlLOGthRnM3UnhHNEJMYmg5WkhvbGlqR2R0dGlv?=
 =?utf-8?B?V0U5QWh4N3ZQcEtVM04ycXZuenE5TDVSU3JqUFlVTi84VGxNWXlNWjJFQjQw?=
 =?utf-8?B?UUtreHpFdDh5TnN1SHk2TGRBS0lqMFdsL3pFN3ZOYkpTaXpzSzNPUVQwck85?=
 =?utf-8?B?TnVLRFBhWEJjK25Hdk4wR2F0V1NlSUY2T0wrbUVPK1UzOFl0bEliUVRxamty?=
 =?utf-8?B?TnQ3RVlyQXZOWEYrWEhCcVRyM3VQM0Y0ZnVrbFVRQjU0WVNoaE5vRHBXQWwx?=
 =?utf-8?B?Y0JOVHluNjVrVVNQbWpjN05ZWXpaREhxSVFKU29sR3p1MHcreDVxa0NFUU1t?=
 =?utf-8?B?L2xsWjFuV0ZJOEwvL1ZIRDhmOHAwNXlKVVJ2Wk9OTi9IY05MS3FoT0x3WENq?=
 =?utf-8?B?ZXo3aC9HdGdneGlVT1g3OE1KcnRUQWt1YlAzNUp6eXdqbU1aOUY3UXJ4WjRo?=
 =?utf-8?B?Vy9zZUpGMjRkUWFCazUveHlFNHR1M2NodFVvbGQxcFpmZDJjd2tXeVB0aUdC?=
 =?utf-8?B?NnREcVhJTUF6aHVrUitpSnpiem9JNTNqTEdWS2ZFMWxwWXFpeFlUN1Boeis3?=
 =?utf-8?Q?CB4peH2Cxl4jW+tKE1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71739448-1adb-4a56-6cd0-08df042ddcc6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 11:25:13.4893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fijL0SFVvCeAtZFtZG3UaL6KekWZRVuWXRZ/XcfhIPAdMgway3002e9yzsp0J+jA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370

On Thu Aug 27, 2026 at 6:34 AM EDT, Kiryl Shutsemau (Meta) wrote:
> I have been working on transparent hugepages since 2012, starting with
> the huge zero page and file-backed THP.  A lot of the code that causes
> pain now traces back to me.  It is only fair if I share the review load
> for THP.
>
> Add myself to the reviewer list so get_maintainer.pl puts me on Cc: as
> well.  It is also my commitment to be more active in reviewing this
> code.
>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1be7da9b6e2e..f5bb29ba41c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17264,6 +17264,7 @@ R:	Dev Jain <dev.jain@arm.com>
>  R:	Barry Song <baohua@kernel.org>
>  R:	Lance Yang <lance.yang@linux.dev>
>  R:	Usama Arif <usama.arif@linux.dev>
> +R:	Kiryl Shutsemau <kas@kernel.org>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org

Great!

Acked-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

