Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A447A899
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255448; cv=fail; b=uPMdQSwdL+DrSdsxJp+kX5MhIMWEiZGh/g30E5Gurb2H93xs3ENe+ZexIimpBUc62U1AYFiQt8eqXXuv7JzdDrvAMWD3EImiw2ZzeQZwZcqqj65meUPjsK88ZUTknTbfHlbG80M98SeWMnfZPCQJ/mEEz6QbkzULQdWdDc5KO3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255448; c=relaxed/simple;
	bh=YWF6A9uYWE1+QSwmZzyM+xLqco1xci22dDUxvWUT5mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i4KYaniEOQor1LqV4NTPi+Pv3x6gE0wgDARVDW7RMKI2JkyySr2acsclFjJnJ7bWkzByN5Hjs9JvYgHkAxXIP8TaWleMU/ultlMbceYruLBnEElnhtFPPKPMC3cC3OTCYpP1vBw7wli/FOR+uueHKzP80S/LGCQeZSY4eo79umE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rMoqDwoQ; arc=fail smtp.client-ip=40.93.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rMoqDwoQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWOVu0YjF4WHKdM2hNCFkZ/upd8JiIm7aBMI77NZEZGmZquzlGLOAzv1vF4tcDffr+628AfCp717n8R7Pfis1jYEcUbGLEQfwN4hbipFh4jt43udhCg30nPqemZqKWOwQjz+ZlTwqkkgWQo0IAvfL4CfgLudTfyNWzgmfhWxzKmHqy8LyVdSc+af8H5Enuovh4BUujbeKwejZZyp3j4RaLSJC3bS9IJZhDcdglZ+6U43LYzmmad9ztpuvrDEeDtOcDWhrksYMAltBGTKQ7DQfJlwegnxrBgmR/d1gIZHkaSW/Sk+lzfm9z+Ws+8Whn3/QFhVIq2DvDV3QoFzgS9jCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sxexjAIgEk2/FH/eCdy26NEN8t2xeMkEWsOqnW92IE=;
 b=h77JV2oUbF7CGWVivy3NPLGa0VOAGVCC7zsztES/U2L0QY1SeL0WyTsSnIyXWK97SimGry/kMu1YyNxRC5alX85obCVk7TllzY/fm9h/OJt6+51RHFEBQJCFre0iQ0dheVKfsjI9BIVsdX2to1KC5Heowr7iln/I2DjrygKtpc+yYTNS6d2rMSzt4LM0Ijo5cW8/qoopgDqh3f7/BJdjybQw9nIFWWDyt6LamkP3JucaZZBlYgtylzwRRXW+G/b2uMXmsc2eyTPbtUeuW8ufX50khqbsuVfp/lDHYdhZjZ/uM48HrdjbNHhNn5gYl/F2K7t7d0AkJVmpehA6oizvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sxexjAIgEk2/FH/eCdy26NEN8t2xeMkEWsOqnW92IE=;
 b=rMoqDwoQiT8/lYEqBzCnHRJnSmr6wXum9gX9bWjEeqEmoDW6cX9pOgS4MsUGDvR/QgRv7RWMTEouhzuecV/cmSUCyW7ynAEsxEJImCYuEM5WbZJ1fjaWggEm3Zw1RDCiDf0uttnsei8ybRbPxU4GiIR9JEO3MSPNTcmi3se7l+WoOlaS1dw/O6KFM51D1/qhNHhRxoO3GHqoB8B7Wdf3PmL+2VCk1Y4iFPVSNJF+3CSgAWE8txKFcr2qn0nU8K5nxUS/nD95F8khMKI7riPqVM8mPAQ68WbSdpDsrIDHQZvxs0n39w58qk4BCoG4by4qXarpP2wtQfRC/mHby8nOsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by MN0PR12MB6343.namprd12.prod.outlook.com (2603:10b6:208:3c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 09:37:07 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 09:37:07 +0000
Date: Tue, 1 Sep 2026 17:37:00 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, 
	Tony Luck <tony.luck@intel.com>, Ben Horgan <ben.horgan@arm.com>, 
	James Morse <james.morse@arm.com>, Dave Martin <Dave.Martin@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>, 
	Chen Yu <yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>, 
	Drew Fustini <fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 00/19] arm,fs/resctrl: ARM MPAM MB_NODE support
Message-ID: <apaayESjBl5shlWl@MWDK4CY14F>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|MN0PR12MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 7145f8a2-384c-4d1a-3c9e-08df080c9659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|6133799003|56012099006|10067099003|11063799006|5023799004|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cz0GrORjFMQCVGsSYBlTIvNVu14Q/0eCncjmoF84Ccr+PVuan8DmtsMfDPQYg7ohdRzCNdw5z5V17aOFRvPagtErWoqhU0GQk3XPafq66rI3beKIXI1FjKJ5+w+dpoRzHk0Xjg2eIHNUE2/qYf67HijwsYBucWs6/vy8YVFGFIRKRMPa+0YDxz4DBacJOQPUrtNiYzLy0IAPONGMSDr3EAGD41igWRnHdO89zwP/ir1Ngk9NCju5qs9PlrB+4riyIlvEtHfjP+0tVE63n6lzinBDbsVt44cZJPIvVKUqsLrX7kwhpKcvquqZhCO6m5W0tXuBHbTvpbD3DpgchXok3ktbYLeTj6TrmJTvwafjFnZBjneYf2Dr4ktHYgF1b/XjiXLSjESdJQMlrZ1O74JSNve1d6SBG/Rb4nfktO+qvU3Y95icaujlrWYwbb5upJkyl0fq8ZjhsiPVlWLaT/oOvnydFSJ92U2zf5rpZZl+jgFHo57/YCN0+Kyx3JM0t/G9IX8/B6THt/kgsWs4IQBKWo+mqwotL/e1Q2psfqoGHADBysMwO5Jymw38/HJHP+45r/kzPcj4IURGKDQsawDrLtmhEE5N4wOBD9P5xjmOlPdbqI+UjK/pA3quEGvkWE+Cv+XItmbp08NoKPzlgWwpXTEcuCOFm/8fIna0UpEOkrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(5023799004)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTJNY0JsZ3VCVVRLSExOYVFaWmtScFU5S25YQy83UDF2cXgzb1ordENkVWhP?=
 =?utf-8?B?Y2xhNFVFVkVOcEdyL1Jra1lMNXdWdDU3QnVKVi9Gd1MvRGlkK002ZDN2Q2RX?=
 =?utf-8?B?SXBKN0luSWcwVnN0ZGhQSHRBNlc2QStTajJLL29LVWFnV3ZwUzFRRllYc20x?=
 =?utf-8?B?YlM1V0JDN2RFR3IvcDZ2Myt2SWU0Q0F5aExlOHA2TTVQVGJSRUFqZ2pvby9z?=
 =?utf-8?B?K3BBN2tENkNOVkJkVVF5QndhdXdZa3o0cVU0Tmxtcm9wLy9WQ09QVXpyN2Qw?=
 =?utf-8?B?OVBwOEU5VDZlV29DWTRMYU9kallNUjJQNkozeW1ocnFxbWo5VWtDVEY5c3Mr?=
 =?utf-8?B?SUMzQWZCbzNoSXZYdm1UYVkrTmUrLy91Y3RvUE5Ta2JyVlFBNG5lZXN1alRG?=
 =?utf-8?B?L1BpemRaT1pydThDaDZPSE1hZWc0QVYwSWRGMFdRbFF5ZHBFM091YWxyd0lM?=
 =?utf-8?B?ZVZrd213Kzd4MG5Cc1lwV0liUGVvenVtNXFhOEM5WTUzMjMyOERaLy9uNHJq?=
 =?utf-8?B?NGNoRmhsNUJvZjBLbUUwcnlxUUdDRitFWXQ3Z0w0bGNva0JCaDVxbEhFckcx?=
 =?utf-8?B?UVBSaTh5LzAxN2dyRTVKV25WZExPUGxyQTJ4cGtJVkNYTFZZQ3FmWnF5UGlF?=
 =?utf-8?B?VVFNQnBTOVVGWTlvc0k1dmdMeHJpTUpyOFFoRzJBSHhxRHN1bkh5b0pXeFVF?=
 =?utf-8?B?WERiZFZBN1pEcmMvY0dNU3hHQnViSGNJNndHQWorSC8yMGJFcXlDSzBsaWJH?=
 =?utf-8?B?WWJxU3lOeVBwVDl4cVpKZG9lOFBiOXNQenppS1pleHh0cVhwV1Z4eWJWY0dv?=
 =?utf-8?B?UjZMZndUSUNWZTFoTXZjcDNLUFUvWDBOa0tGS2FoOUJoWUhieFJneDlIakIz?=
 =?utf-8?B?aW1VTG9GajRZUEtDaFRuN2hCaGc1dXhIcUtHL0hZLzNKSUEwTmcxVDBRMjkw?=
 =?utf-8?B?RCtLWDVWT3pUWVlSd1Rham1pWDZGZDRjbXIvY1dmaDc0S0p2Rk9kNS9lWW93?=
 =?utf-8?B?dkcvK3BFR2VDQjJ1VW1wbzRCR0d5Sm9rNi82OUlRUEoxS3UrUlA3MFFXMG56?=
 =?utf-8?B?TnZDM1I3QVVPWnczaUtiNUhVSm1kbjZCUUh2bitPZ2xFM2l6NE1CQ0xUOHBI?=
 =?utf-8?B?TStrQzN4Z1RId2huSjRtUEgrOG9uYVE2TjJOaDVUTGtLTFE5NEkzNzNvMTlh?=
 =?utf-8?B?blZIazlJNVBWKytiTTFIYmRtcXlkZFhwQW84ZGM3NFhQcndpT0svVFJJRFpU?=
 =?utf-8?B?OUR6TGk2RUorNllheU1LVXB4Znp3Tnc4QWJrKzhXdGw2YTZTMW84U2FPcStU?=
 =?utf-8?B?Y2lDaFVUZkVqeWdFMWJLUlp0dHdIL3ZqeThWeS9ZZjBYVlh6dDQ1N2RYWnNL?=
 =?utf-8?B?RHBpd2dmY2tnVit3a0tvTEtQaWJveVBIUjRsNlNUelJYVUt1TzJNelF4dmd5?=
 =?utf-8?B?ZWpseDJEaG00M1JBN1UzTXJzQ2c1VE5ERkIzQktZM1NtT1pXczE3c2FUb0Y5?=
 =?utf-8?B?TTdTUG9TRGcvNHhabWFxczZQd0NrTGU1L1d2amY2VnBSckFnSWhUL3NReTlY?=
 =?utf-8?B?ZzQyWTgzN2ZLVmF5VFpWb2JNbDZxeDZzekZMdXo1SlpqWExLZlhnRS9GU29C?=
 =?utf-8?B?Z1AvZ1RCL3grQUFYRVM0dW5FSEJlbnlQdEhpODF6NFFPQWI3K2E0cVNhdnRB?=
 =?utf-8?B?dUNEamF3M1dscUZMdjJON3lubkx5SzFzRlJJUEZNNDRDSlNsZ2tZSGowNVND?=
 =?utf-8?B?N3IrK2MxTHgwSElHMCtQMlJUcXFGRFRWaS8xc09jSXZBSEphTVhLUHV6eDAz?=
 =?utf-8?B?MzdGdk9rcTlPb24wdHpuOTRqb3Vnd25uT09xckkvb05tSVRUS3ptR0N5d0E0?=
 =?utf-8?B?V2NEUTFJaGlCcjN3Q1Q0NFV0a3RQY2d0MUpaUmVadG0rRzFyRG1BSjFjU2xp?=
 =?utf-8?B?RkYxUW1maHZjLzNhRDRCVTdQN1kvREgvYkRTSnBhSjJtKzRaOVc1dVZmR1l2?=
 =?utf-8?B?czQxVmpzVG1CVy9oZmxtYmozbmVsYlhXTzZKYm1zcDZWcnh2VGpaNE92dksr?=
 =?utf-8?B?N1dhREdLS2dPNGZqanZqQW9YNWllTEJvSmMrQkQ0NXJYaHJ2MHZscDd2YWdZ?=
 =?utf-8?B?ZDVBdFNBYTEzVHJiRExwcTFjQ3M4MG5jYmIvenlLRG9nZDh5RTVTaXI3akZU?=
 =?utf-8?B?YjlJM2hudm1PSnpDVUtvOVVaMEFPLy9lMzlXemwzc1grSWFENE8wU1JMVzRO?=
 =?utf-8?B?QnVhekdXWVZ1N0lJUDV0bnFZWVowZDhzRkxZRzd2SFNkRmcvMU5yYnBOcFdx?=
 =?utf-8?Q?x2nbmuwyoU7ZX5k4+B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7145f8a2-384c-4d1a-3c9e-08df080c9659
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 09:37:07.2097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qqn6jHzsE0HftZMDf9HOBzYPeS3O6AzaTV2RCNegc3uv+EGsIiAin75ekZ9fPlRCsyQZn25TfN2RpV4tYLmEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6343

On Mon, Aug 31, 2026 at 10:22:26AM +0800, Fenghua Yu wrote:
> This series enables MBA bandwidth control emulation on ARM MPAM when the
> default MB control is disabled, using a node-scoped MB_NODE control as
> the native backend.  It extends memory-bandwidth monitoring and
> control to memory-level MSCs or CPU-less NUMA nodes, and adds
> documentation and tests.
> 
> Background
> 
> On x86, MBA bandwidth control is typically associated with the L3 cache:
> schemata lines use L3 cache ids and monitor domains appear as mon_L3_XX.
> On some ARM MPAM systems the MBA control is backed by a memory-level MSC
> rather than the L3 cache MSC.  A memory-level MSC is represented as a
> NUMA node, and that node commonly has no CPUs of its own (a memory-only
> node that still participates in bandwidth control).  For such a resource
> the control scope is NODE, schemata identifiers are NUMA node ids,
> monitor domains are named mon_NODE_XX, and a node-scoped MB_NODE control
> may be the only control with usable bandwidth hardware.
> 
> Because the memory-level MSC lives on a CPU-less NUMA node, the driver
> must handle nodes with no local CPUs.  mpam_ris_get_affinity() derives
> affinity from the component's NUMA node id, so a memory-only node would
> otherwise end up with an empty CPU mask and never be registered.  When
> the derived mask is empty, the driver falls back to cpu_possible_mask
> (masked by MSC accessibility) so the node still gets a resctrl domain.
> The borrowed affinity is kept out of class->affinity: those CPUs already
> contribute through CPU-ful nodes in the class, and subtracting the
> borrowed mask on teardown would remove CPUs that other live nodes still
> depend on.  Domain setup iterates all MSC components per CPU (keyed by
> component), so each component — including these CPU-less memory nodes —
> gets its own control and monitor domain.
> 
> Examples of NODE and emulation interfaces on MPAM.
> 
> ** On platform with CPU-less nodes, by default, control_mode is legacy.
> 1. By default, MB is emulated by MB_NODE in schemata.
> info/
> ├── MB
> │   ├── bandwidth_gran
> │   ├── control_mode        # [legacy] native
> │   └── schemata
> │       └── MB
> │           ├── MB_NODE     # emulated by "MB_NODE"
> 
> schemata: Only show MB, which is emulated by MB_NODE. domain id is numa
> id
> MB:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
> L3:1=ffff;2=ffff
> 
> 2. root can switch to native by writing "native" to "control_mode":
> info/
> ├── MB
> │   ├── bandwidth_gran
> │   ├── control_mode        # legacy [native]
> │   └── schemata
> │       └── MB
> │           ├── MB_NODE     # no emulation, native mode
> 
> schemata: Only show MB_NODE. No "MB:" is emulated.
> MB_NODE:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
>      L3:1=ffff;2=ffff
> 
> 3. llc_occupancy in mon_L3_x where x is cache id
>    mbm_total_bytes in mon_NODE_y where y is numa id
> mon_data/
> mon_L3_01  mon_NODE_00  mon_NODE_02  mon_NODE_18  mon_NODE_34
> mon_L3_02  mon_NODE_01  mon_NODE_10  mon_NODE_26  mon_NODE_35
> 
> mon_data/mon_L3_01/llc_occupancy
> mon_data/mon_NODE_01/mbm_total_bytes
> 
> ** On legacy machine which only has L3 MSCs. No NODE scope in schemata
>    or mon_data
> schemata: MB's domain id is cache id, not numa node id
> MB:1=100;2=100
> L3:1=ffff;2=ffff
> 
> mon_data/
> mon_L3_01 mon_L3_02
> 
> mon_data/mon_L3_01/llc_occupancy
> mon_data/mon_L3_01/mbm_total_bytes
> mon_data/mon_L3_02/llc_occupancy
> mon_data/mon_L3_02/mbm_total_bytes
> 
> The patches can be compiled but not tested on x86 yet.
> 
> The 19 patches are grouped as follows:
> 
> 1. Memory bandwidth monitoring and control on memory-level MSCs
>    (patches 1–10, 12)
> 
>    Generalise the monitor infrastructure beyond hard-wired L3 paths:
>    de-hardcode L3 monitor plumbing, expose MBA MBM counter assignment,
>    name node-scoped monitor domains mon_NODE_<id>, add a node-scope MBM
>    total event, and make MBM handling resource-aware.
> 
>    On the ARM MPAM side, add memory-level MSC and ABMC support, refine
>    L3 topology and class selection, refactor domain setup to iterate all
>    MSC components per CPU (keyed by component), and handle CPU-less NUMA
>    memory nodes that have no local CPUs but still participate in MPAM
>    bandwidth control. Memory hotplug locking and notifier are added.
> 
> 4. MB_NODE emulates MB (patch 11) [1]
> 
>    Wire MB_NODE as the native backend that emulates a MB control
>    in the ARM MPAM driver.
> 
>    If emulation is unnecessary, this patch can be removed.
> 
> 5. Documentation (patches 14–17)
> 
>    Document memory-level MB control and NUMA nodes in the arm64 MPAM
>    guide (patch 19), NODE-scoped MBA domains and mon_NODE_* monitoring
>    in the resctrl documentation (patch 20), and an MB_NODE emulation
>    example on ARM MPAM (patch 21).
> 
> 6. Tests (patches 18–19)
> 
>    Add a KUnit test for CPU-less NUMA node affinity handling and a
>    kselftest that exercises MB emulation mode switching,
>    resource_schemata hierarchy, and schemata mirroring on ARM MPAM.
> 
> Apply the patches on top of [2].
> 
> Testing
> 
>   # KUnit (CPU-less affinity)
>   sudo cat /sys/kernel/debug/kunit/mpam_devices_test_suite/results
> 
> 
>   # kselftest (MB emulation; requires ARM MPAM with disabled MB control)
>   cd tools/testing/selftests/resctrl
>   sudo ./resctrl_tests -t mb_emulation
> 
> This series is in https://github.com/fyu1/linux/  cpu_less.rfc.v2/
> which is on top of [2].
>

Hi Fenghua,

I think the high-level direction looks good.

Just have some question about lifecycle model and object model.

Now MBM event and ABMC state are still partly global. For example, mpam_resctrl_mbm_total_mon()
selects one preferred total-bandwidth event, while the assignment interface redirects or hides
mbm_L3_assignment when node monitoring is present. On a platform exposing both events, L3 init
can consume NODE state, and userspace has no independent endpoint for the real L3 assignment.

the idea of borrowing of cpumask is interesting, but it's now used for several different concept:
domain membership, HW accessibility and worker placement. Borrowing a CPU mask for a CPU-less node
thus will make multiple node domains overlap, while generic lookup and worker-migration code still
assumes that a CPU identifies one monitor domain.

And should we make domain lifetime have an owner ? it's now shared between CPU hotplug and memory-node
hotplug for the complete transition.

If we can make these concept fixed or even clearer, I think it would be amazing, thanks.

Best regards,
Richard Cheng.

 
> Change Log:
> RFC v2:
> - Remove fix patches 1-2 which are implemented in [2]
> - Remove the emulation patches 3-8 which are implemented in [2]
> - Update emulated_by to *emulated_by in patch 11. Ben seems
>   doesn't like to emulate MB by MB_NODE. If that's case, I can
>   remove this patch. But for now, I keep this patch for further
>   discussion.
> - Add patch 13 to implemente legacy and native modes to emulate
>   "mbm_L3_assignments" by "mbm_NODE_assignments" in patch 13.
> - Add patch 9 for memory hotplug locking (Ben)
> - Add patch 12 for memory hotplug notifier (Ben)
> 
> RFC v1:
> https://lore.kernel.org/lkml/cover.1784217438.git.fenghuay@nvidia.com/
> 
> [1] [RFC v2] mpam,x86,fs/resctrl: Generic schema description Proof of Concept https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
> [2] Reinette's resctrl control branch RFC v2: git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2.4
> 
> Fenghua Yu (17):
>   resctrl: De-hardcode L3 monitor infrastructure
>   resctrl: Expose MBA MBM counter assignment sysfs
>   resctrl: name node-scoped monitor domains mon_NODE_<id>
>   resctrl: Add node-scope MBM total event
>   resctrl: Make MBM paths resource-aware
>   arm_mpam: Support memory-level MSCs and ABMC per class
>   arm_mpam: Refine L3 topology and class selection
>   arm_mpam: Include all MSC components during domain setup
>   arm_mpam: Handle CPU-less numa nodes
>   arm_mpam: Emulate MB control with node-scoped MB_NODE control
>   resctrl: Add mbm_assign_scope_mode for native assignment file names
>   Documentation: resctrl: document mbm_assign_scope_mode
>   Documentation: arm64: mpam: document memory-level MB control and NUMA
>     nodes
>   Documentation: resctrl: document NODE-scoped MBA domains and mon_NODE
>     monitoring
>   Documentation: resctrl: document MB_NODE emulation example on ARM MPAM
>   arm_mpam: Add KUnit test for CPU-less NUMA node affinity
>   selftests/resctrl: Add MB emulation test for ARM MPAM
> 
> James Morse (2):
>   fs/resctrl: Take memory hotplug lock whenever taking CPU hotplug lock
>   arm_mpam: resctrl: Add NUMA node notifier for domain online/offline
> 
>  Documentation/arch/arm64/mpam.rst             | 105 ++-
>  Documentation/filesystems/resctrl.rst         | 135 ++-
>  drivers/resctrl/mpam_devices.c                |  59 +-
>  drivers/resctrl/mpam_internal.h               |   8 +
>  drivers/resctrl/mpam_resctrl.c                | 879 +++++++++++++++---
>  drivers/resctrl/test_mpam_devices.c           |  67 ++
>  fs/resctrl/ctrlmondata.c                      |   6 +-
>  fs/resctrl/internal.h                         |  18 +-
>  fs/resctrl/monitor.c                          | 355 +++++--
>  fs/resctrl/pseudo_lock.c                      |   3 +
>  fs/resctrl/rdtgroup.c                         | 157 +++-
>  include/linux/memory.h                        |   1 +
>  include/linux/resctrl.h                       |  36 +-
>  include/linux/resctrl_types.h                 |  15 +-
>  .../selftests/resctrl/mb_emulation_test.c     | 314 +++++++
>  tools/testing/selftests/resctrl/resctrl.h     |   1 +
>  .../testing/selftests/resctrl/resctrl_tests.c |   1 +
>  17 files changed, 1827 insertions(+), 333 deletions(-)
>  create mode 100644 tools/testing/selftests/resctrl/mb_emulation_test.c
> 
> -- 
> 2.53.0
> 
