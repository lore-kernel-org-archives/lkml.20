Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058BC34E744
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788631522; cv=fail; b=gl/iayBqVVoeO01sdFRDbc+zPfBZAXNdEcwMkBonFzYcycR+29NnfOlesNqVcnkod3nm6oeTwURLCsQO6b0FAY6iK+1mspRpr6f1BsSUzW91P1fgkGu7BwdO1CybUgk2AZmIwT9rT/brJrP6+ugoWO7JlWfgT8obVrq4+qgPEYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788631522; c=relaxed/simple;
	bh=+pUodIJVO3QEDeQLbIy8+MoXAryAbmP8jbhefx1+hD4=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=P+frNwWg138Q+ISKPmDZkZoIG+Xxt+HtJ+oT7FRnTPIckefdhjzLx99+njHpzcIHqyvwpnpSk+tx35AOQiix+tlVVTWhGvKQ1WfN0kKgNSKTP0P1qo04UWwYjy0GJiwjqSxbZNddNbNzGMq1Ft+gg2STJJEavLJD2AwumYaSQTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bKuPv6dC; arc=fail smtp.client-ip=40.93.198.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bKuPv6dC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZHVolYJI/A6ZAhWPrmZ0i+7dIicAsd1bTdNYZQEtrrmzFCQ4tYT6dtCfrixC3vpM5XjUXp2jdw970CpAZlQjiLp083EqkDSE6NaYILPs1ynPayp8AiyHw2ll9GX65Nox84G/WHnkKs9oxQDgE1BtrKHVPsja/gga578CK1ggloLDUzDFfdnGFxuYOSXurnHk+SfTIGFmU755OLPB1qmiWyx1sxCq19QURMHGJun+wbMIu+rHyCWwUbkyBbP7tZRKhPdz2Zi3Ofc/wp1oE40qRBjpnDQKMUywt9xZdTkFsR5BPuHhfZlqkMq4E7nJQypiZWTW0ANvXBHcEy7z0+yKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2mWRlAIKQZcRyeUUayxPmCpgpnNtOu3g3TGFuv4o2E=;
 b=eofIQhntZ3k3heBvv5me8KpBtbLHBG7eACSJjkAObfEe2Q9SuPPP1vRuRvu0CVkeDXVSL50lPJ/iuPCDwmgR1hib7dOq5A1j75QZbdISaSoFIc/FqKi8A7D07+aG7G9Of3I/Oc2DsDCzkKVI2VHlVORm5bCRT/5JGk2jRXEpBD/2NEFz3BCYWtAcHSvV8soyH7qDhupbBfDIcAy9emxbvqP91kpDscvYe+OSERy73u2hyQFUzGzeraChPCTdgAhBtWgHgLnbO2F6VTEtFc7AOl7WnV8vP1T3HicUerB4BG513UGUrdK2oENEj2FNZOW6kUUaC+18RxbX//9qUMvgrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2mWRlAIKQZcRyeUUayxPmCpgpnNtOu3g3TGFuv4o2E=;
 b=bKuPv6dCavM4NWv5C9dWXly6CosiB4ksd6fmwGu1yFcV3x9Ufp1wVoGSiNSy6g4wrc/91/LM7L2+xzycVm664AKVMNS2mx6lVutmSkQ1Y8bD8myuQrOn+9BlMTc92PbSPCTCGY88vhQOHxVG4TFfN6pOquDaGXNfkQLPoHAweLGqEnIVjPOPNhmQCOILWZPWVAgRadpzu0sjadqw9NDJA+DRCdVp+HKaDu5xewQjGIwFlQjpUqKflyQxRAkftmHG4HcQ8XXYIp0HUehwk+F7nT6zzroPfz+8lqWLs2lkk3cyTlvEIZgzgOLUriPFdRCQseQ0j85tUDPmREtJNVqUiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CHXPR12MB999246.namprd12.prod.outlook.com (2603:10b6:610:2fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Sat, 5 Sep
 2026 18:05:16 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0382.012; Sat, 5 Sep 2026
 18:05:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 14:05:15 -0400
Message-Id: <DL7KYELLVH5U.Q3PDS544DL5S@nvidia.com>
Subject: Re: [PATCH 07/12] mm/collapse: name the per-table scan reset for
 what it resets
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, "Nico Pache"
 <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain"
 <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance Yang"
 <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Jann Horn" <jannh@google.com>, "Kiryl
 Shutsemau (Meta)" <kas@kernel.org>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <cover.1788533997.git.kas@kernel.org>
 <ec3d193817dfa5d0e4fa2f31642c066ebfdd3151.1788533997.git.kas@kernel.org>
In-Reply-To: <ec3d193817dfa5d0e4fa2f31642c066ebfdd3151.1788533997.git.kas@kernel.org>
X-ClientProxiedBy: MN0P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::27) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CHXPR12MB999246:EE_
X-MS-Office365-Filtering-Correlation-Id: 24acf5bc-3a15-4e68-a1c4-08df0b783d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|1800799024|376014|10067099003|22082099003|4143699003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Tn/TtsqV6cqPj7HHAnfNDO4tBGlUBXTSC1cGCNreE/L6Xd06q2eFfhh9R4QPQwi5vlItRbLPh5wu7l/fT2HG/KjH+P9v04hWbu3LbWjVOC7YzpWEC3JhvAP2oc/gbQbzmSwlcgVFL7wKYHQ2Kv9EcLSE8i88vdZBw9MlSAncwMG5mpR/zQB1wIWGXSivT1DICX6t7LjSrH2DNrU1LcKB+n4o4ccOBuRvLjpFD8Xt1L7LZzFf77vzMvAZSUgDDxfnml/O0xukaTNV2tWiRbrGVrE5cCb4uB200PUvVD2G3t1jsMrdpRYjDzaU54ALlmC43C4I4Hfjzjpbp0EwjJVCqrT5/Xq17SVYTtRC9RQ7LKHtd1to/3Tc7hUOtGK38qIUuSTIMtve9hSQMuHmbi3aQJ+4vIF4FXj/vHkZxUlrDZ0m/0MxDV95/ReWIxFCtA2pf4CKpffZUJjli9yhJxou7efegO2kZgQq8C5+4GwemhmvizJIRCHzvzctydVt4i4mXQB3wwIngh3REToD0QqQRHDtPFd9J3Bwws6v3pG6rucVojli/C7GDMR5lYiSNNEk+TQ9Hg7Soh5HgpC0ADBkuHmxjsTOrQM4yxdsq1/IPLATb+hRqJB76tuyUp3SnRmBsaIrtnR7U9wvbjYHoBfNB1L6c8R5NFTMKYR1Q21//P0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(1800799024)(376014)(10067099003)(22082099003)(4143699003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SndaT0x6RXZPZEM2VDB2amhST0x1a04zK0JmWW1NWTVjcjBoTUVJRkFnQXdE?=
 =?utf-8?B?U2pUczhPUjlxOURmMm5BSTRXeUl2cTRNaU53K3phM3dhMUNDNkhVOW1Ma1ZL?=
 =?utf-8?B?dm5CWERoVkVpa3kvbk5TWFhNUVJyd1hmbW5SdVNndXk2Z2dNNjY5WlN6blpG?=
 =?utf-8?B?TU0rOXhRMENNRWlsUmFBU3o1bW5JeXVVUVp1THRDNHlmY3pzQ0lXL2FFYkFj?=
 =?utf-8?B?OHJGdzEzQndIUzBidE1BazlWdGRzeDczLzJGWnRqcjJTL1JCcGVlMmxVdWZ2?=
 =?utf-8?B?azRUYS9mOW91cVRwZitqbmh5bmkvLy9WSGM4TzFseUJSK0MxQWxFME4xLytm?=
 =?utf-8?B?THRzQmhQbEtwTWRDOHltd3l3U08yZzFRaHdubUNvNGFyTHNkR3kwTDlhSjZP?=
 =?utf-8?B?cncwM3JRVU00WEhMaFcyREx5Q2Vib1FERXpna2wyd2VWZFpJRnlUTFhPWU5H?=
 =?utf-8?B?ZlhmdDRNL3pFWEJtUmNVc1Z4SVdDVVdWNlpVSmpveEV2aVBYL1k2MEZWZHNX?=
 =?utf-8?B?T0ZvdWdBNjliRy90RmNjaDlRZmNvZDlTQ01XcXB5NjFwZHlNNE9SWlVzdHVJ?=
 =?utf-8?B?WFNCVUJBMUQxWmVYc2F4RFpVRC8wY0pvM2w2WlBKamxFWHJBRkxJcEd4YzFY?=
 =?utf-8?B?VG9aTkZHTUlkNjNFbnVnajFYeEQ0MEd5N1FGUVl2Z2R0dXZoT1psK1IzNlQ0?=
 =?utf-8?B?WTMvcVFTdk5xQVNFK1BFSUFycTFsb1p3c1ZJL1YrZExFUDlMMHpWMFVOVG0x?=
 =?utf-8?B?RUlXTkw1OTVLelpaS25VNHlhb2NCZ09mV2l1S2VQOE5qK2RPK1U3TFpaZmFu?=
 =?utf-8?B?UzlxazM1VjhUYnhGWUxaN1dtQWhJYnRQVXBCMHNwNGJNeW5reXJkMHZQSTBh?=
 =?utf-8?B?eERxVmNra2lWNnBUNDlZT1dERGRjajZUelkwdGYxSGtTRXdRbllSTy9NSnBM?=
 =?utf-8?B?MHlOSW1aY2t1aVBQaVNiRHJpVTNORWJ2ZkdwM0NmbWtnYlJPMXlUMDJDL3I5?=
 =?utf-8?B?YnVLOUJsYVFEWi9CVFd2SU5oSWZIZGpaMEJ6VEE0UEttVHQvSW90dW11ZVBk?=
 =?utf-8?B?blRNM0FLYmZKS2hYemkzckJyL3JLdzFScjVaMCtmQ1FqN1JCRTdReW93bVdn?=
 =?utf-8?B?Q3FwN2hGWndTWU9uTkhzdTUxWk9zNVU5Q0VsM2xJMFdPclZpYm1qcGxzVjJj?=
 =?utf-8?B?WXQ3aWUvUHBJTlIzYjJHSlFHek5kcXA1Y0ZCWHVpMGNIU2Q1VUVPa09pWTNX?=
 =?utf-8?B?cFphTXlEK0RCWWlhNlJ3VllEcGdZcjEzdUxWbzBUdnlnMWNCUktSZFlMV1M4?=
 =?utf-8?B?dExML0d4T0pSVHV2a2lMQWFJNGxVKy9JTThxSS80bEgxd29odkZEN2dxYWJj?=
 =?utf-8?B?OU8zdjdyWlAxeFYzb2tNNml1b3U3L2VuMGFmamVsdXU1aWRjOXlLSlF1cTQ3?=
 =?utf-8?B?ckJHNnFuak96bm1PYUVMa2k0bC9yQlk4OVZwclYrUlhqTVNhMTNwTDFBRXJT?=
 =?utf-8?B?cGtLK0N5ejAwS3JuU0w0cU9DY1pIRFNXYTFSVDFBaDdkN0RzeUJINXVNUjBS?=
 =?utf-8?B?VFFuUWlRcUJLZDR5bnBhVGFhNm5lTGpOaXRXNFFxKzgzMERqQUx4cDJqR2pr?=
 =?utf-8?B?aUducnAxcm1vaVpkTkllZjNZcjdBTmdGZzZFL2NCNERxemNCb0ozWjZsdis3?=
 =?utf-8?B?K0MzKzdwSWxCUUhCZGRsQWRSaTNWZjBNSTkxRVAzWVpTOWhOSHhtRGM2YTJV?=
 =?utf-8?B?bkx1RlQ1N240bktyc0pLdDA5eWhlYXdTTGZCT3VnY0dONUlwSm54bkZEeHY1?=
 =?utf-8?B?T1hGY2hlS2tXWGpLSVdtcGI1dlJCM0JEOEZ1eGN1M0s2Rk45RFBadzJhZytW?=
 =?utf-8?B?ZUdjdjkzOWhhcEFIc0gvTDhvczJwdXFtaFpEYUc1YTAwWEFZc0NLUVJMWTFN?=
 =?utf-8?B?WWlTSndBcmUwK1IrTlpHSHFpY1FjcFJZUmNnaldYbFBKUDI2bmZDM1I4Z2RC?=
 =?utf-8?B?V29OYmlOZHlVZ3NwdTVYSEt0eDdLeVp2MEVDVU45aXhRc21CVzRaNFFYMG1z?=
 =?utf-8?B?VEF6eEpxNzlhV0VpSm5INXpYcjgxdEpVeUhnekFqZUZ0eEYyeWIwZWRObG0r?=
 =?utf-8?B?NXNvSmlFbXBJTytpd0VMcTZnWGxDT2FJNFh3eG43MVphWUU0NFgzWnZCMjMw?=
 =?utf-8?B?TmJHZ2libXZBQzVGaUkvZERTeEhwZUhmVXlJaWN1UEFPOVhObWJHZU9FMjV1?=
 =?utf-8?B?RG9nUlo4SnhTdGxnVngzMmVPdlhSUklsUjV6R0hvQlpOYXhGTWhTMW5mQmZu?=
 =?utf-8?Q?p7UwXvOzcJ3rK+w9jF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24acf5bc-3a15-4e68-a1c4-08df0b783d37
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 18:05:16.2754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJqy1lgvaiK6t1zFtJSt66kpPCNV8WGy1sVdtvQEQTWKMVgkeLdAe5B7+Dl8gf9y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999246

On Fri Sep 4, 2026 at 11:10 AM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> collapse_control_init_scan() resets what one scan accumulates: the node
> load, the allocation nodemask and the eligible-PTE bitmap.  It runs befor=
e
> every PTE table a scan is given, not once per control, so its name points
> at the wrong thing.
>
> Call it collapse_scan_reset().
>
> Preparation for giving a control a real init and release, run once each
> for a whole series of scans.  Two names a word apart would then stand for
> two different jobs.
>
> No functional change.
>
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/khugepaged.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

