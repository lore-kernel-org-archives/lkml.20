Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793812642;
	b=5MUtD75siHfOjOYkDwj43I1c0R+agtMXOPnGTM4u5EY8fwPxWvR41BGkKEqh3f5uzC60
	 86dH/rnWJE8XxGAQL4YbzxEFBxfLiPDchZYhwIAuim6XtVxPCGjWUDrDhnxBKPMrWm9oe
	 mCYGEMdo8HYSBhtX2D84Zq9ivwR1UdmawzCTPSIStVcKoElwpRpOrEBiQ2nxqyXdSvs7N
	 FlnOmgNeMX72EaX77EdnZnKAS6TzEWRIKcf0VxWYUw6Oe4yNFMLig5DyzfnKVNV00L5KB
	 lGj/XfjDO2bnWHtmrRNt6jSza4XE1DW1BjID3nXt9/Wn/wdli9ELWusBvCRCLbaHioQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812642;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=srhYQCVK9u7euGbOjZsEF4sFtJKeTpcAFScG3t+bvNg=;
	b=WH4SDdFBXGBtzanI4NdZuppvsbFdliBBspu6baw08kgF6RBn+enp+OZ41gLi7btC6wc3
	 cJX7k56oVQ79Gd81nGVdnOZSoHgWD9HZ4l91dqpzPAKcmoa6DoCgxkNQAxavsEKJJBpOG
	 F4TpgUbRKt3p/nJCY3JcgMMZUYquq9kNeAnjenvuAtxinmCPG2rYVeq80kwA09/2InXik
	 cuTZhBxH4ts4wqMTkdYU/OFJfo/KujgV6Jf/7YQePBGmwkFfoPUzLF4jIPV3D2n7g4GpF
	 hE9+T/fqH9rScmmHQiEhMDOlBCmhtgTMtoWVQ3MPdzu4Bq/e7lryeguetQUoF/9iUiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ODnQozkY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.42
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86000606A329;
	Wed,  4 Nov 2026 17:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86000606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ODnQozkY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTAkvLwVLmSJUB0pHL1Y5rGEGhAhY8cIEL4F1geVFg8TSm3wPOF5C2iBJ712vtblxQCPmjDSiwRAjO5fQ5qV6cxVXjioyjyBzv/SbgdTES6cbKpuIjbE6VyvOQUEa5Y2GGMkB05ABiiHht/2qgZ9Htrbriv+RHx52wIUmxGpgIA5Wj/jWipKsJE6LhmlhGgyrMsHPVAjRNoC/ozcWD8kBuWl6geio4zZekDoneYu1ghNfARQJIuJtG3D93xCy5R+fdoXyHOmzuPBGnfg8RgqsRfF2KDUCTR9TPMsaGZDEo9NN/hqzZiCNlR3Fg5siqNtflZEHiwyA+SwmgXDMhkuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srhYQCVK9u7euGbOjZsEF4sFtJKeTpcAFScG3t+bvNg=;
 b=dn/u+QwVb0hpWKx88dty53XXRpyfDZyeJFHes1ZjIS8shW3vGW4JyVMVeZG83SsAIiBM2Jpx/UBoVxsFQ29WUWURx9ESiFlh0s28m8AddNyR3FS62qQcTyZp2RradHzkKG099LiFf8T2I+rG2tFza+SRxlXnkhMU4qK4h1Yqn6AX69+UEmdrePoVaXPs5B5lge300JjgU0scE9CHT6VEjmaI8Vpn2PtgYaz6fD5zQiv3VvEPk7vkSfuDIPm1sZPWlL2zL3uibOmcS4bSlHteTiTfpqSbY9PshwcM1CfBUbA46MTdzQlZqwRuBiyaCNHxBqXodFt656AGjwe8LQHJOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srhYQCVK9u7euGbOjZsEF4sFtJKeTpcAFScG3t+bvNg=;
 b=ODnQozkY2Lcbr6m5Te0JydrRKtEiHlc4zxNnba5wqMzRckAYGyQaDNWWJHipCwyBPoVvqEGOZUI6juPUuBXfxt3e692m/iZs0fIjaIgWUB2BK70FA6nYsNd2O1VDNKCww3aKtuNg95G/gIDOVEP2wL7grxQm6c1qCO2CO6UsVLY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SA5PPF9BB0D8619.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 17:17:02 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 17:17:02 +0000
Date: Wed, 4 Nov 2026 12:16:54 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Borislav Petkov <bp@alien8.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	x86@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 7/7] x86/hygon: Add Family 0x18 SMN access
Message-ID: <20261104171654.GF716491@yaz-khff2.amd.com>
References: <20261029053313.46323-1-wanglin@open-hieco.net>
 <20261029053313.46323-8-wanglin@open-hieco.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029053313.46323-8-wanglin@open-hieco.net>
X-ClientProxiedBy: BN0PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:408:141::18) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SA5PPF9BB0D8619:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf2e7ef-8593-4127-3106-08df3a97714b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|11063799006|4143699003|56012099006|261021121427099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	awAYSCfujYE9bvvAKeLTzGTHtZ5rA5B+Ab20ZcApLKb4oq59ZhJ6A8uSqZ+Zc7g5Vcp0oj3MfLaq5hnjljMUuIErxgz5me0/s3CSuZi5XYh0ypakh57bHXZObq+Il/Ce2JoSPWwhfu7uuzHavpSnfNO6Ju3p3Mt4HBrPQVC476YkiHwf6OPZRZ6OiNBBL0ihi12CsSqaYtY+VgW1xG3fQpOnEpJ3vDDNJ7S6QkS2hJsEMt8cwe5s7vnzzwJ6Q2rykE1sj2N/WfEdIfyOlr5Sk1mNVU3uB5ue/CSRVOgYtAegYoS9byQSYeNZd+ospg9sAdebCC9oov5XpmknVYJv9+5efmHbX8DgjWtxFND5hXCxlE9UEzXy3N7myYpkSR31FQi+7bH7hmgShTG3FBYSt8NzqBiB3QX4/SiCmQg5qF4q30qJd06Xq+2pHah23b3cASGGP/Rd4xqd4rJ4EQBJtUBFYHcMed9nOCMhTBBeyrOPK0EMHcnULntfAR/66YdFWJZnwl+a5+mtwCbSsWEXXrWd43jcWc9ZrIeg2QrTGhBDuEpU7+6Fteengk9Pszwe3jbFJ8kc6R1PCl8TxOoFnTyA428XOnOdJAnq1xOLojHNyeO2ogalOGkf5vhUqtZqsRvC+3717yElyBmBRbylcle/7K3INHP5aFQnTBSDT5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IzyETgMboKZYgZtQexXmym/tZAQfWqCCUWiOyG9PlxzBl+FqjPWtuD7ROQx6?=
 =?us-ascii?Q?nMHOxeiw61DsTkdl8R8zh5zPT2Zu9Gmh98934BqQG3gNoKPzWLGdRrWVf/UK?=
 =?us-ascii?Q?CfxxhgLgVqpdn8bKSQRo0smSpIs1/yXIkNkExtqagr1khTnVoUpgR8s0Ioic?=
 =?us-ascii?Q?3i1YaiwXb121HIGtmDnV//wd2+2lhRXJVyXSj/vaPp0bba/c9TBixbw84zOA?=
 =?us-ascii?Q?m9UKk3XjmFXuSSGWj3o/klhr5bi8gsbq5/i0yCzPgdchEHUNr7CbPWqC7+qK?=
 =?us-ascii?Q?DgmL8zyahx2wEO/HDcDSNl+k74oIeDDq35xwh/UyeufKE867aVnr0mrAZko6?=
 =?us-ascii?Q?rPxoaKCLRRz3AXKdgzOBTNnLKAVPjUHH3trjp9AaXc3xzMpl5CPmfng9jjdh?=
 =?us-ascii?Q?6Itx6Bhs1rTc2mcvBjqZz3lWZJQ+WYHF1T9R6jtSnI9CcYF/7ld9tV9ENz55?=
 =?us-ascii?Q?5j7LdE8BpV0XZ43wpLz13lIUSmZ/VUu+kRYXOfORYA54FSuKUoXTC5w7vhrU?=
 =?us-ascii?Q?doksDeHgNx/St4facyAhiY9Mfj8A46QsRgfKPYJeYwRQlat+LUQV+ckjXiv6?=
 =?us-ascii?Q?YIUt1OOJG0XyRyoqH06eU73D2JNncqP68AIV60Q/1qSl93OQSaU0r+laEG2k?=
 =?us-ascii?Q?TbRHlBueobuJoI2yOdotmN6/16nA2SMNu6It85HcYcGQ99i/UKN27gxHNvi8?=
 =?us-ascii?Q?R+nZ0ESZGKt/JP+6hqPAs8mdamguZmBkj49YnqHEVsCXQdwK5ntwI8/sFOQK?=
 =?us-ascii?Q?+xuBDeu6vwxKdBtZceqaPqQYA69Cr3DpQXfkEcxTr/2WJdGoJPe/azZsQ6ZO?=
 =?us-ascii?Q?7H3dQhtYRHIDkwZ9tNYrqK4KyWJqAHjYgrOOUJg/T3k7kFJjT3s2F7j5QlXX?=
 =?us-ascii?Q?kqdlskOep+NTc5ae2GAWSzYYReo1qPlDYpPbinPBIQ3sfOOeM9xnERuwQE09?=
 =?us-ascii?Q?1cnZegvsQMc3Btj4LZ3pTWxUCQHCsVh3H+EuL1cwl8ONqv/IgydumebqOiyD?=
 =?us-ascii?Q?oCkpxV7p6Li2ZUWE7A+krgitYkkXr0I9SbsV3aL26Sii5hyjxBfhfC+++wZS?=
 =?us-ascii?Q?JkAacHq+zv4kTBBtlFqTt+5ju8kn9vy5kc7lReQovcvF5As9xWuFOHbQnywr?=
 =?us-ascii?Q?vQ5m9HdzUhbmb2nRNhkm87rs0kTgGXhJK9aMPH6VKjyGNmik2m80OumaU7z0?=
 =?us-ascii?Q?SLnn2Ba/ksSWkPDsmI1CsB2rJAW3oLAeAVk8QWBxM/WjaR4kcpSsji8BSXbg?=
 =?us-ascii?Q?+fMikWfX6a2Ru90y5gCFPft5E6b4/63l/6B1KQrE5aBwX9slkd34zcSo6vfC?=
 =?us-ascii?Q?raysXnCRLsF8FetrMz3XUH/V7FU/PqB8EgsgIKfkjYhRwKbwlD6rsTWSDCRU?=
 =?us-ascii?Q?nu+89k1XKOKaCaV88Yf8KjCE9DpNM9RL2vuir6+c2gkr39aKbQ96X0MqFH0G?=
 =?us-ascii?Q?gjViKTLv6eJurjuP9IWDUZNGZ3XBqgLobLUuIeWWLKJrBeKj1G2yGot/a/H3?=
 =?us-ascii?Q?WQo7oGEWbPpR/2K7VQxsvqwbWnFTex3luT63KjOR6Myykd7sCsc1cKyHN3/S?=
 =?us-ascii?Q?v2LNkQ7M/eXeIHBLhwzYbjk5xLyM9zqXtoMlCfI9qUNP14PHBuspeDANogF/?=
 =?us-ascii?Q?F0faUf8z74WSGvkcCw5NilLWB5vzfIpLIBPnuwnq8IGwjHLQvHZJ0+N2gSsE?=
 =?us-ascii?Q?3C4sM+ujKWt49gR8H/XoodA85NFJ0CiTn0w259GFRUyDlXHYo4P5z38QwFCT?=
 =?us-ascii?Q?BQTVtdsl+Q=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf2e7ef-8593-4127-3106-08df3a97714b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:17:02.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2A6l3sR/pQhOpmEegz6A2Mm9p7C4cAbsQaT4UZ2s0q/uxCMlHGLvices+rx3Yrqre+t2RZykUxq1MqqbOiEBfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9BB0D8619

On Thu, Oct 29, 2026 at 01:33:13PM +0800, Lin Wang wrote:
> All DF nodes in a Hygon socket share one SMN ingress, so SMN accesses
> for a node have to go through a root of the node's socket rather than a
> root per node.
> 
> After DF enumeration, map each DF node to the first root of its socket.
> The roots do not expose their socket IDs, so group them by socket in
> PCI enumeration order. Each DF node holds its own reference to its
> socket's root. Keep config space reserved on all roots for the lifetime
> of the node layer and free the temporary root table after setup.
> 
> Serialize each index/data transaction. A setup failure releases all
> acquired resources without invalidating the DF node cache.
> 
> Hygon drivers such as EDAC need SMN access. Keep the SMN read and write
> helpers local to hygon_node.c until such drivers are added.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
