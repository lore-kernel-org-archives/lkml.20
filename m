Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BB54C652B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007667; cv=fail; b=q0gZdmK5uhd7yVaKN5crbcm1Y1E/nswqIcKizmQqhI4eJDCMQtGy4yuDrPlfBvY1+l0AxVcC6LDtTKWYY8FLQcZangMdWRYqaA6WiHYNe73esPT5YwKNAFFr9yiZZcRuJ4X0L66PqHj9sW1xgi3uHxZiGwDwyw+6jBmzXyvWimw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007667; c=relaxed/simple;
	bh=CuVpPs8vGTZ5YOJalwHEgYfKS8N5+fyaBmP1/PMIf3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X2rQWFB7gQLTVBVv3e9y9Phh/rWdJeu86U4RjQsoKnnyAxxNhazztpF8VzBqozyw4He1l2kVnMIbOmmKL77TfUQCWx7iEf4tdWTbYsL4CylpGcqWfMlBDo0A6b6qAbKo3saUUXfwEoVBGh0pr8+Hqk+o+D+vqcvEMJsxT8vLMfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cuPVXxu3; arc=fail smtp.client-ip=40.93.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cuPVXxu3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWDsfL1VR0dHU+JMOVr9tO7+wm4wCbpuUE7kFRR+8u3VW5s82mPsod+YR/wYkzA3staUxTsfNGJFMljevtqV+AXcq2aUSPpCEpSjiNPPywre7oYRExsB2VI5bMoV30lMNUBTMLPQf/DOSMDq7lSxbgQnOqTdnw281aKKeg+QBMAT1TTl/ZcSys+Aay30r4uvwScGNDpYuJdh/yVLI00B8bqn/4RsBWqd1ciJM0rESJgokMj3RzzsSutjTKlOLjoc+VGTfqu1VAEO0RGGk8g4WbbWfWIAoD5ENvgTYanhrsmwQXio7Ja0cMg3I/ySSLp+Hqneoe8rZYTDxjR1TX9Jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CW1Nu+sRbay3QMOOsHOO6/O8S9MBWMLle7nhYHXtEwE=;
 b=dbtX67//kiixJfYVn7PaVn1xVXx0fhQ8jJpQPrHRLSCsk5xuSxb81WfWmxVpv2xkFuamE2gz4X7vWhCp9v/hel/FJnJsviv9jyloqet3rk8RZ/yqTy7BdFWdZ1dhHOmTEgFCleKPyGJ5SIsTwNpKuDV90osVgULJqVbGMbi4ECyj0Ltt5tF72JRWcijyeJ7vopZ1unmYRyBUoc94XMwY0S6OPdpiRxpuCkdZZO9RGlCncM8uZ956uTG2Kaf7swszraxbqeSAIbhJ0ZdaH/hzC7P1csWUWy+miSZ6V/cvTq+9cqbxT/kku+O3fNrvMw1itUYPtaqBpPadOkpJ/mtvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW1Nu+sRbay3QMOOsHOO6/O8S9MBWMLle7nhYHXtEwE=;
 b=cuPVXxu362ja8zOFluW5s00DGm2K3BPA5g/c99UsMMsvNWg9IpBt9MnTUy3Zj906yi8TNdaQgCi1/GL+eDqo7O6T6iP3vw4DvMJLLvwJqRSdkdhlmDOBeKI7R1TVWCd0OcFQ8hjm1hINUuKucxlUoBUKDnYKC+cw+XCoJCJZcDMXfdsv7WJ/hxCOphduPstGDBtYaRvCN7Q/QBS5gg8af4Mgl4nAgBWOo1n3ykMcT8Zm6IowXzdw6vrjeQqqvzI4Mu06HWuxYL70TNloKq6CPMWG1+dYG2lPfmaYYdg2H2tXwaVeC/Gil5U7g8UiscVQ1ykttLKQHDtZW9RPsrQq1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CY5PR12MB6347.namprd12.prod.outlook.com (2603:10b6:930:20::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:20:59 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:20:59 +0000
From: Zi Yan <ziy@nvidia.com>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org
Subject: Re: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out
 of build_zonelists()
Date: Mon, 21 Sep 2026 12:20:57 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <B90DCE73-CB50-46AD-95E5-C00EF6C083D1@nvidia.com>
In-Reply-To: <arCkv_0nk-BtW_DW@gourry-fedora-PF4VCD3F>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-3-gourry@gourry.net>
 <DLKNHNP6LH59.3MEEBCAJGFEVK@nvidia.com>
 <DLKNKTQHSA6H.6XC9WV37LSVR@nvidia.com>
 <arCkv_0nk-BtW_DW@gourry-fedora-PF4VCD3F>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0639.namprd03.prod.outlook.com
 (2603:10b6:408:13b::14) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CY5PR12MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: d2f24889-c1cf-4bbf-95b9-08df17fc5296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CL7GYDkZPghhCAe0HFZUvoiWhAbgYimR5795C29zZ+NELcs4fcibpulMi+5OAVpEXDXoNxU4oiMut5IQ2dsVZBcn0o9ubsO6aCQ52+h5yBzn5JkzOdmDgDN+COi9WfCpjqA7F7Q9GURrVmg6VttPorhbk2cBOoa09FRiXMlXjn3ooRB3WLGX2MYED0jKeXUbplXsO+vGtW4NZURYmJnyc958Cv3WM9MkIbulT68XN+bUi/dTUVsqoKq+/w7ol1U/6olETRBOY/vGSpsWifrrE8ESSTAMP+/ooQCnuG7/gbrtBRL3h/KvTJLaAnAZuCw3NITKqSYSfbNmrubZYTVorF/CrqI0W0Gw6eT1I9LqQJzMJkFW2alsv6LrVVh/jmanU5r+O0wee6o49/VV1ecbDQ7MKuJ0M/WyDwEzYYa6hJBs9B1fWEInZ25mefYAQySDqUY89PAJnDhlsTWCi+jhH1JoNAlnASEp0W4H2ei6/KhxFfCtn0Ja06e8nNnoCO4e0fNfGMoDZfv6O0cU+z2mTBYuVPKo6wsrJRhjiN4s+UBoQkQW04FKe82dvApbG9PO2jZRp869gzrBboDpi080BRfbwNPHVNx+O2mDev/Ve9aTRmq4T8Gocz3+LWjH1hRBuyP+X1naXeWvz6CuS0uWAk419Pf7lpmbK3qkV+8ucd0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xM8ixYp510aYFJSUEB32MgtS/cbplfzqzKqIH6A2uX+7fA58ceo/6nWh+JPh?=
 =?us-ascii?Q?rN6N4cgSEAvu0yV4fjmw2jzMn12fIIZjvqIjkeCAKqDnGMP763QrHJMrR9as?=
 =?us-ascii?Q?jtt6o2cizy35/WXjDdOi/sEBEaf8NdFlqtZdVZe6EcKKO9k5vL2jtl6KDw/d?=
 =?us-ascii?Q?AZYIrMus1d6oAy9gp6+GbkBDaewFZjCbf/99zDdB0NcZhhbAYlc3BQjv9r5j?=
 =?us-ascii?Q?SrslI5MmPLnuk8F1kw9asHDsv51ZO7ASNMAaBA0y7MfyP8jRF91W3Rhe3rqg?=
 =?us-ascii?Q?IjUtB5tQ4sm6rJWSfWNGCCLBXlNPV+zP4L8cXrV0aIMxlBn1UgrrSklRXtYQ?=
 =?us-ascii?Q?dXhDf/bwQ04xMaeJnjkTFU2RpRSz10dlEk2AZAPf8FUNMI3/W7bySrgUDD18?=
 =?us-ascii?Q?snsYG1s8gKvLUOoWcnjHTAbzYCwGhlKHpf/K6I1i9oRR5BxgRLnQJEaJtRZQ?=
 =?us-ascii?Q?ksv3RRR2qmfQGId9J7OPCkHzSmQqRfV1cvKatmCUuDtKDAlffeILpyVbSgnQ?=
 =?us-ascii?Q?W5O5KA6+RAQOE5DiGQqlbKBQh3jt74pf7HM4Q0EokZNPre/5vVk/W5E/Jx3K?=
 =?us-ascii?Q?eCt5GKEpRXi7tzQy6CMWIFTkGJaMYCr4+YNYbsMn/OGvE9DFlGutWG+Iyy7m?=
 =?us-ascii?Q?IJu3/OcDNXOrjiCMSTIe9zjwNZhBhflTDjTDwGiq/Q4HoRiuEZ0SnIRV36x9?=
 =?us-ascii?Q?kDGQ7As/c2YgR9C0KazP887a2Q97GveWxKYpmpd3a7amiFJQ51Z5MdpTwYeA?=
 =?us-ascii?Q?X1Pp2tpjFW9DwD//CIsOQ4MGr9f59YfRl1DYQ1t3MRysednWdQkpFPoKt6w6?=
 =?us-ascii?Q?wWIUd27lWTqek3eP+tj3OXUmUODG9sSJZ5ralRrUEz2tAk0EdrRexzcXyjhp?=
 =?us-ascii?Q?uOSMP1RGcFqM2R9u7LWDjt+eOlSOK6+9vU4xBUvVslHYPfsl/VcfvqKphxB7?=
 =?us-ascii?Q?rJZ2Q2XHd0hM24VJqtOietXi+a5rINPYQQ9eWN11fmbFxWf9KhD4gr3RkttA?=
 =?us-ascii?Q?lnT6Gklub9W9E6Eb1fiCQPrWMGGFUbF97MJWZzhG/iPoqfIdpJlQU2CXgpW8?=
 =?us-ascii?Q?MNaXBp8kRPqwn6hGfRq4kjlgTg95B+DjCoYzkVYw/6lM2LPG+VyPINI+eE8Q?=
 =?us-ascii?Q?I2eEsymbN+Uqq1KAP9dGU8yKeLsYggQxXz9+TcoASuvscd8GN5tyGXKK8FmL?=
 =?us-ascii?Q?FHapqewSSoc7OZkLhS8UEEL4IDly/QOwu9XDkNH7bTcL7kFGHzG5V9h6EBNn?=
 =?us-ascii?Q?DBxSHlY2E98UufSWWxKPec8W4ZMJICO0kNCW59Ak1yh/2UgB13vAAmWB79zC?=
 =?us-ascii?Q?Agcnz4XdvPO0Qub2nf5+KqZSbS8eYiWouecPD2bB0Q6KcaUMRh7c62BehJHJ?=
 =?us-ascii?Q?QUbsmhwNo0qO8TIfIE4sjkncZCHdN+AKM5bJBe1LrnYiu+m0+Z6BU6HJY2xr?=
 =?us-ascii?Q?stcQcLXeGCuUaMSLDKMd9lPCpoMxGDkBBNEB8VlNet9A578/k6HxbuoWDHdN?=
 =?us-ascii?Q?py/Zp+G++rC4e0R8PxDr7Zj2lWK5gH1CAroaVMR2DY+bda8cU9rQRCuX5IjD?=
 =?us-ascii?Q?pL9hKVju75vzosHKskushJ7ZLmoNyXOyOcZdihFLc9U2oaylU7uaYQ3YgnxB?=
 =?us-ascii?Q?reSpiBF+kj+Zl5YmzeUjkJZJhrB2NketODGWvkcBgubuWLpGnKDN+8aj3WHJ?=
 =?us-ascii?Q?zxfzZuUTRZSr5p2ArAf5/ItDiXMrZEINAcw4Utj8XoFsqUOSiAbOszxQVj9x?=
 =?us-ascii?Q?rKKq/vc5tQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f24889-c1cf-4bbf-95b9-08df17fc5296
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:20:59.5729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPgFlVncbDceZULTcqXckxEA4wejWkmx4g+8Eba/LtVEtx6wkO8b8AVcZb+RXAZ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6347

On 20 Sep 2026, at 23:33, Gregory Price wrote:

> On Sun, Sep 20, 2026 at 10:53:13PM -0400, Zi Yan wrote:
>>>> +static void build_node_zonelist(pg_data_t *pgdat, const nodemask_t *candidates,
>>>> +				int zlidx)
>>
>> Is build_numa_aware_zonelist() a better name? Since the old comment said
>> "NUMA-aware ording of nodes" and the code uses find_next_best_node_in().
>>
>
> I think that's a vestige of older version having different ordering
> options.  Now the zonelists are always numa aware (except for
> !CONFIG_NUMA, which... duh).

Yeah, I am OK with the current name to avoid confusion on !CONFIG_NUMA.

>
> Anyway numa-aware is implied by "node" in the name.
>
> But I don't have strong feelings about the name either way.



Best Regards,
Yan, Zi
