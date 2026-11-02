Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793588049;
	b=3ZqRI4Q3zgd90ABIb8OhdrFuIbwXtyj8/O/jSOli9fZwhZfpSbMC0bzJDIm6hFKdfCfK
	 rNgn1TvxZnnFsB17rvzgaK6DM7h//U0aGH3+Ik/r43mUkC8P5r36mk3JF5cLwaok4ivtO
	 Nd9pPdDr9xHN2xlLglBZl/LG2qGaPryPjwFcWxGxde6rfFGwg/fyhEwNfr2HjsgBn81r6
	 OPg0HUACCq9ifIcA1nREqvbU0EfFfcB3hfjo9Ml+0BpmZo9JIplv1G+gxhbEp53U/z+R0
	 om/U+f2HPDwn48RGxUaVMsGopc3vkylNyfJ9nD6ySkijhGoXr3luBo6I7g5Ez8/isqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588049;
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
	bh=53MXfedpZD2QfQflwHwoVEuAIii8aPYEkPAUCpTNs8A=;
	b=f3eB28VXJbQ3Ednp6ZOqUwWXtMFoeRXBpptYqbXawAbmY1wb7RwJ22ucNQ1iurJoOBun
	 dfaXyFjIf92xoTOzm3X914RCzZ/Lwwp/iXyuhJ2VbJpUee2acNCTy4g97nytnw1CQTFPA
	 RqPuVIX0d0S7Cb3IGf64WvQWbrEKvtLb9l0hSq2YFD8S3YCyaWTN3nsA+G85WxbU8WuuF
	 TUrD8ygRAWkotuFwFA8JupiKaZV06P3ZNj7ijbmsgiU3MD6vX8jjsJYd+N4l5XXu8pOPF
	 n4whLMgznpNN3bqKgb1Jl3jQgVQNjvV8AE3oCt7xGya8VcfsLnmBTpdZE02bt9ZUIEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="docqTGb/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.61
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C88606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45C88606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=docqTGb/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUj8ln6f8JA0onKmL+cos4xTfJ6o3P+ylXF6s895okJs0c7jJY/E80i7wBjLRwPQrJjNEPFHpSKvCSjgOSZsQSfe1/aEQpRGNS0sPn2i6+3cAeUbczr1yBLQHvjWtOAELq7iSz5wWtZuvYMXYslBQBFNdoCJL5fgdeti7VvkJLZJOuyFXDVCsdino2XIJCA4bfPLbZgjM3uQIfHYxqBIUM0QGRiFJVn5bXKoRYmCo3siMjnBmhAFCxq/k2kaydcUIRPAQssphskh+zuitwTp8B0oqxcf7ZX5vd+9WxD/UMwC/H+YcGP0v2AGXmWEo4qO15EIw3lhdH9lcz5FC9vSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53MXfedpZD2QfQflwHwoVEuAIii8aPYEkPAUCpTNs8A=;
 b=fW4iurbIqS2lWydrON88EM9WeobcEJcGTMP+b3wgHv0TKAV9ZMXMaoxYfzfhUCyHOxdc1APK9Zf2X5+E7D41J6IjgSSU8YJEFI/LnbTszEpqWGTWKn32lN01Pktq2VrhsQ9LI6Bh+lUe869UuT+2GEiG3WRIPjnCNZgvMVEjeuiAuRNAbnsLZZGuhHOLxP9uby2dwEAkSshttLEneSM+GwBlCoSibaRSe7SEcLxAFjpYvcCfW0EFQ+Jhz8LrBoGH7Aibk/T6MK2ntXchE7wp0ZSX5VLUtpgMgQIF0xqtPvNtG+RPHHrU2x/WYKggZDkRprSCpcV8PAm9/TOgXsVKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53MXfedpZD2QfQflwHwoVEuAIii8aPYEkPAUCpTNs8A=;
 b=docqTGb/OfdFgd7pgME1WST6oXGNms6JW21Vv/lFBZuO2weO2FESHx0m6+j1j9JgcER62dRa4zPgD2RrAskaRGT1OWFXSPPrdLdLhrnR64C/Z4fBdAt4fuCN630XMAk1ykE9j0kZ92DWM6FCrJ5oMSs8l7s4GatEMxL4d7j6d7qiKPKHLiTBG7KBpKK4zkVFbc600pJYTisSl4CTn7f9ANcvmOVtM3z0BWMPt1h/allA3zK/OE2IK0RH19oni4CApdJXNLQuB5LDKbj53BR1NH3lTrKp9aMLviJl34eNt/yHzo9fmwsaMhWBEmpsZskcJQeegVieFNsh7Px4Gy3CEg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9)
 by PH8PR12MB999320.namprd12.prod.outlook.com (2603:10b6:510:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:54:07 +0000
Received: from CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128]) by CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:54:06 +0000
Message-ID: <37db45ed-872c-4519-8240-226aeb79232b@nvidia.com>
Date: Mon, 2 Nov 2026 13:54:00 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] taskstats: reuse na in cgroupstats_user_cmd()
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
References: <20261101005616.3022705-1-brads@mainlining.org>
 <20261101005743.3022780-1-brads@mainlining.org>
 <20261101005743.3022780-3-brads@mainlining.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20261101005743.3022780-3-brads@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MEWPR01CA0197.ausprd01.prod.outlook.com
 (2603:10c6:220:1ee::9) To CH3PR12MB9730.namprd12.prod.outlook.com
 (2603:10b6:610:253::9)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB9730:EE_|PH8PR12MB999320:EE_
X-MS-Office365-Filtering-Correlation-Id: c510aea6-2478-4962-6193-08df388c8f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006|261021123027099003|261021121427099003|261026140227099003|261022105027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	sUbl2tmmeDBOb4fljsU3QsaCniXF+OA8LRJRpewHhscdARK/V3FTuTQnNNYcemSZSCwecOxkkV4buM7Ec5lNSOmpzTvSQioxoyLHdXymllvxZH9jOErNNUPLlLO/LU5EKohutZxY7ZS5UjgFgPGrtfIucH8pu3XZGbTDiUk137Rcc9bTY+MIxLU/PX3u4V/0513vZJJxnwYnqoe0/FmIUimXOQAgg1PSzME+Ni68LYrETSzGR3y3VAZeXuyh8Ms8m3jJyKEG8DLtBcCC4evw1bdg40CWfhObhfIRuoG+vKd3PXWwDlYgrck3cuVet0GNxMTKrdnpoh8sAfy9yH2nuP1FBgm3yqVqw7teuvQT6SkL6idx78uxjJyjPeXJ6oodv1st2qKRTTqETg3AlDxcBdWi7XXHQ++8+JxFMkunhUOclJxNEc2Bqwn1nu/umSJ30jLfpAuYF3ULvMIZfJHHG2St1zgnKwwX53cNvGK5YQbMlhiW5rN1bsI13eDcnAF3YMu90XscP0jlaq7ZhZDI/BgOerTx84PZsmNZN+hentnVTHB64aAflqVA7b9vcp4CsHBiIxgpAHwTzIaZ0MOSh4deLZXBr/kjJm+jlOv0WnxngD23+oMbWfcahJ0RY+sVBQswcq/hM4wpA+9+qeOPXa5vcyhFk6XWf3l9vEfy3qI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9730.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnFPSEo5djEyS1RIcVhVblV5Sk4xdmw0YkhzQ3hiei9SN3NmN2dDTm5ublE0?=
 =?utf-8?B?WDJQSU0ySnljOXhIc1cvRHhjUzFLSVgzYWFMQjJKSVBrbVpRWUdVdk9seENh?=
 =?utf-8?B?cVdMdzRHUXpWN2ZtUFJuNWJERTc1N3FVbXNwbWxYbDdVNG05Nlk1TjJ2Z3Na?=
 =?utf-8?B?aHEvRmVzc0NwcnZJSy8zdlJLcnAxWU1rN0tnSzRoeXBPZXZwRWRER2JDSjJ3?=
 =?utf-8?B?TEtRT3VCNGhMS1pLYWlUdnBqYldJK09QaG9aaEJPemgvYkdpRnIvM0Z3TG5U?=
 =?utf-8?B?STRXaXdyckFBN2Q5QXp6YXVFZlBEZXJPRXQxWTIyZXZwWnpPRCtFUW1jVkJW?=
 =?utf-8?B?bG5wbHh6U1hjUEQ5NXN1T2FDSjVId3NpS0hiWG9jV2FuV3htM1hoOHNhQ2Nl?=
 =?utf-8?B?TGZZWDdxNDkvU1RFNS9ldlBtcS9xRmp5Zkw0NktpUzBZeFJZdUJDRFJxejQz?=
 =?utf-8?B?MmNyemZxMzdSdnJtYy9LUDdDNHgyZW4vU3gwc2RFRUtGN0svcTRmWWJCUkRP?=
 =?utf-8?B?UUk1bms4c1htY0YzSGIxZThMdjFrc1RtdnE4TjJrWFV6c2RFZGk3T0xiYmhQ?=
 =?utf-8?B?c1oxeTFLa0NNYUx2WlA2TThwczcxWDArMytIZ3pSTE14M1l4WjVMK2hZeDda?=
 =?utf-8?B?dVVCeTd6R2praFlDWCsyQW95bThzUm0wV21sS0JPM3REVDlJZUlYMk1CR1Ix?=
 =?utf-8?B?ckMydW42K0VBS2JQUjZkK285UHpmQURPV21oeUYydHFYVXRudHJTOXdzSFdM?=
 =?utf-8?B?YTVYM1VyRFlsRmJJd2xhV1dzSEU3RmlmNHFpM1lCSE5aUGUxQjN0S05MYWFu?=
 =?utf-8?B?VkRwaGFVMGF0aXNyRjFHSEN5SGZIWkN3MlhjN3p4QnRsMGczRWZLbHlJUWxR?=
 =?utf-8?B?aDFMZGFqWVVhdmhUckkyQkZoeEVCNVVKMjExU2YxV3dlTmRpeWJBTDBLaWFi?=
 =?utf-8?B?Um1IWkVJWHlQWksrVU9qeGJQcUkzcWd4akZVc0JaWFhIVTNXM01QbzVCNEp5?=
 =?utf-8?B?UjdYd1VJQ2NZZURhNkdGSWFoYzFoT0l4N05ZVE9wekdoTGxNTlIrT0VlNGpk?=
 =?utf-8?B?UElwTk5ZMDkwbm11ZmFnNHB4clhMR2FrQmtTaXkvbjQ3SzJUWkxyZ1o2NEl1?=
 =?utf-8?B?NXRTZzZIVExXSHdRcTdrYXhDZDZ2RlhHb05TOHVjNjBZWG1VQTByYkJaNHVB?=
 =?utf-8?B?NkpUMngzVHRmWHYraGxsNHl0U1AxOXl6UGxVT1NvS1B2RXhhOG5FMHB2bkR4?=
 =?utf-8?B?SVdFSnV4QmxSdFRGWXZTeDhlWDRLWk1CVlozNFBMbUcrbWZnRWVROHllUXpD?=
 =?utf-8?B?QUJ5OVFPcjIzUUR6MWc5VHVUeVEwQW9sRmlwRnhLb3VUTUlvRVN2NENUQ0Uw?=
 =?utf-8?B?dWpwY1d3aHdrYzkzL2o2Sjdjd3NjU1R0TU9xSTVmWjU1M1k4Q2ZMbVFKMGJS?=
 =?utf-8?B?YWo3dUthUHoyL3EzeDg4WXRWR0ViU2xUK1R3akNZUnpESitDWUovU2lURmpL?=
 =?utf-8?B?ckg2NWRCZTU1VTdtR2Fjczhaek5GWGFQRStSTTNKOGI3bGptV0hGQm03Y0JL?=
 =?utf-8?B?RkN2Qm9ncWZaMlhaSi9zOGt5Qi85SzFHTUwyM2N1Vy80bUYzdmxGMERCeHhl?=
 =?utf-8?B?UVgvVjhJTDBNRXVPaG4yWElXRHE2cTZwdkc0NlA4QldzaEgyWmtWeWNSMkov?=
 =?utf-8?B?U1dqRTB3cEJFdTdsRTMrbGxDWnQyRE5FSHlObERCYVBhTGdmRk1saUlIc1Yr?=
 =?utf-8?B?THcwNnhjNjVvVS81bHI2dkFkZmJKdktycGFrbit6MGw4aDBNRFpKcmZIUjV1?=
 =?utf-8?B?RHRiS2MwR2NQMTZqZ2xtMUhPSE5ZNUJZY2lRNEt5SUc2S015LzZmS25ZSDl4?=
 =?utf-8?B?cUI2RVVuRWhyM1I1b3YyRTAzdDBTTCtjYmtPYmcyckZRN3E2NWJ4dVZLVGJo?=
 =?utf-8?B?RVp1NzdHeXQ3T2U2VVZwTDh1Ni95dFh4SmxzSTdRZWt1aVVkR1JEUkQ4UDZ0?=
 =?utf-8?B?ZnpNNWJvTWU4YTRRdktWM1RvSnBxOVpaSGkzUTEyTi9ydTgrQXdYbGp6UEVD?=
 =?utf-8?B?OVVMb295TW0zUlFXc05hYWFMNXZ0M3pFSXRqdXg3S0ZrbEM1OXR1Y29Mc0x6?=
 =?utf-8?B?eEM0ZytYWU5jOE1QTnNucEQrWmxBUWNEcERUUUU3OUtva0QwWjNQcWgyMmYv?=
 =?utf-8?B?THJzdk9IaGhubzAyMTU0bUlHMk1WR2Q1dTNNZEsycDFTMHBsbWpBZ2VuWll0?=
 =?utf-8?B?OWw1S242RlJMV3BYUTd3Ykt0SXVrR0lZZ1lqeWRSYlArbzBkcGtMNW9XaTNU?=
 =?utf-8?B?NWZuVTZWSDQrNjhleUZ4K09Na29HYUpZWm1JbFNXa0lJVUNQWGVRUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c510aea6-2478-4962-6193-08df388c8f4a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9730.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:54:06.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHyjvefR9YsuYbDHtIwKQOwxmvYgeg/GVX6NFMmxEQSj2LQCqzr/33uHPWlhqJpM6LGrpEbIcsnNRrZr5DIV8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999320

On 11/1/26 11:57 AM, Bradley Morgan wrote:
> cgroupstats_user_cmd() already pulled CGROUPSTATS_CMD_ATTR_FD into na to
> check that the user sent it, then indexes info->attrs[] a second time to
> read the value out of the very same attribute.  Read it from na.
> 
> No functional change.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  kernel/taskstats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/taskstats.c b/kernel/taskstats.c
> index 35e9fa71526cc..9e11f92216861 100644
> --- a/kernel/taskstats.c
> +++ b/kernel/taskstats.c
> @@ -417,7 +417,7 @@ static int cgroupstats_user_cmd(struct sk_buff *skb, struct genl_info *info)
>  	if (!na)
>  		return -EINVAL;
>  
> -	fd = nla_get_u32(info->attrs[CGROUPSTATS_CMD_ATTR_FD]);
> +	fd = nla_get_u32(na);
>  	CLASS(fd, f)(fd);
>  	if (fd_empty(f))
>  		return -EBADF;

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
