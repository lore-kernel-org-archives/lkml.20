Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF335DA4C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425390; cv=fail; b=mkLcc4ZNIR6ifMH0BQejiHHDqtzg/BgDSeMnhVpLtZ+pAaW0ddybk6aNjdJJ/ne+RYmE44QI9dMn8GUA+qa2Hz1f5oJO6WhCNf4mP7IQ6ri100d9JvVsTB9ruy4Zjqsx/2KYKaLYYMpJJe7QWmqlcgbp5P707eu8WJIaACddSYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425390; c=relaxed/simple;
	bh=f7ywW8mpdOj1K7HP0cuhjcERLhzzK1qfYl/xsEdprxY=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=GtEfOWhk6F00gbK1ZyrdBjTKI3zQb88ke2ErLsnYovXLhWJfbsrQklJaHxkYfhCE3qmfeLlFkGnhQ3VANlZU36/+vNyT9Ddr1MXj5AAQTfL4ylSbG3lnkv/HZicAcnPF4Y752idmuFs0YzspdoehjDTsAp1EIrmJ8jF7R/E87CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JF8Q6w0I; arc=fail smtp.client-ip=52.101.62.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JF8Q6w0I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tO+Vj2GeNKP9HRylCmeB/Mzv6cVCJJTw9clolAWp5R0y+Eai/8JVA3j9e4iaNXZejEvCT9QTt5EfsOjN6sOcZc86wZEKCvIoKp509F0HHbdLLnL7P451L/g0tKCM8H1ltTFMVadOgqlfBs/5soAFlL7+S1dV3YgJZiq8VJ3wdvhbGjpGAy1Sdm0mcrB8lSzN6yuD9+cfLJQ1LI892ckVrxLJ1Syipp40hTfeduqNbMEMr0OXkHsaCRlkJ510RZwNaiHfhMszWg/952jZ9jSfw8dLnlg5/rxP/Vx4GMuxNrYGqywi9rKftdrZ3DITlZn8Llp2ynRyi3C1gWghaYM5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+IduPv9BmkQZHvoVVBCMq9Qd+bCJRLvRfVSurVUsFE=;
 b=tnu920HfLoTzsP+1dyUikWC4uf6hik9vArDCsteyaQpnjLNXVRfZn0QeIJT3awZQKLUOqX89U8oSTucLqiWJqCkwoLLLLgE/RVnCBy+symhJ5qON1hqNpWQyOOxzHFQFzm+vUIulOyjjGjfhab1nZtG4HOPCuGYbrD9ZGeYyCNR13LxZqkCRv2vAZ4zjhHmhVGHKwcRzrlj0vTCpFqXPCKRCW2/ARVi3E9DMz9NdzDH+6h2Dl9CprPZvDOAbcYQx1FZwwhC+ioFVFqLx/REd4hPEKG6CzPivE2qZ7ijSwof9cTMrZPdMnG2i82mhRWfbOSe1+OiGeati0WhBUJmQBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+IduPv9BmkQZHvoVVBCMq9Qd+bCJRLvRfVSurVUsFE=;
 b=JF8Q6w0IohZ7OeRAvkePBg/voM4DKEYRohwxSH+215a9ngcwg8neEFEjJ6gzuJEV+qMO2RjhSf1LfDbJ0w3WWJpGnc/nUwTJ9VP+u15nzKq25FbIhu3zBRZwlC38++oIZOaCoTbRIuxxxr5Ej120qOy4lfYOQEGBtGE1JvMzVe3muhf/DYbqo+GImdkTteK38V8hqHinRYGJT8/WjFTMU5WuhlxrWq+xJL4JlFg+hBx0Kjptpf5Hvg7rAuW+BCswTqZ3Nzkn6vaEMfO0wlzw7yxpsPTdSNvOQZ73m9xljvcgXYaev3EeC5V1/cBQltKKf6a156ja9/ft2mXg2Y9fXw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by LVUPR12MB999135.namprd12.prod.outlook.com (2603:10b6:408:3a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 02:09:45 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 02:09:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 22:09:43 -0400
Message-Id: <DLZ3AS0CRWAR.2RK3L5GBMKGH8@nvidia.com>
Subject: Re: [PATCH v8 09/30] mm/debug_vm_pgtable: test PMD swap-exclusive
 helpers
Cc: <ying.huang@linux.alibaba.com>, "Baoquan He" <baoquan.he@linux.dev>,
 <willy@infradead.org>, <youngjun.park@lge.com>, <hannes@cmpxchg.org>,
 <riel@surriel.com>, <shakeel.butt@linux.dev>, <alex@ghiti.fr>,
 <kas@kernel.org>, <baohua@kernel.org>, <dev.jain@arm.com>,
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Liam
 R.Howlett" <liam@infradead.org>, <ryan.roberts@arm.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, <lance.yang@linux.dev>,
 <linux-kernel@vger.kernel.org>, <nphamcs@gmail.com>,
 <shikemeng@huaweicloud.com>, <yosry@kernel.org>, <qi.zheng@linux.dev>,
 <luizcap@redhat.com>, <kernel-team@meta.com>
To: "Usama Arif" <usama.arif@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, <david@kernel.org>, <chrisl@kernel.org>,
 <kasong@tencent.com>, <ljs@kernel.org>, <linux-mm@kvack.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261002095503.3585565-1-usama.arif@linux.dev>
 <20261002095503.3585565-10-usama.arif@linux.dev>
In-Reply-To: <20261002095503.3585565-10-usama.arif@linux.dev>
X-ClientProxiedBy: BL1P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::15) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|LVUPR12MB999135:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8047f3-7474-45cc-0ff3-08df24e138d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RcBKsgKdqdlWF/kcVnoTjkU3G71qPmTQCiP9rYkicKhPYKAnJiE9z/0ac8NPplOTJcN+4zhSUBHT69wKGE6wYkZn6lj+f3m/+WGJoSMAQAqTgArNBLWdsDjSzA2C0ExXM59EOROpKuzjOMGFmfBpmU+H3xRzmy0X0Et7BleA+//5h7hzYU7dZKEbuY6Np4tjuhFtoAApnTFtpUj4P42vDBBxKhGAGhA9GRRo0Ad+R3mkT/5lLwEO/ZdNKY2ZN1Pw4anrxyKnmL1ql71c6iQ6ooa6Nrq5hNH74nZ5XWKi/UYfxyWizOYaPYc7J+gawY54vA/K7Q+zQJu2cO9weblyLANbQoDQji4od8XBXPoZ8f/j6nkYQlNg5JhmJH0wFj35Atuw6jYVn1SPUtJ+rpdpQTPXu0sk1sil/bGywYwYEw+KgC+EWaf1NkilozIYyXcfo9UXUqbnUZdsGtJ2gWOmu13qkUCr52rcJCo4WcM6YVOlJd7yCibHYXPoPGRLw9/SK/umgoePWzpladEhEokdplJUOWmw6NTL26+fnbjhy4ZKPAGwsN6KoFhuZwScomWloGkhKH/55JOlmewTeMJZjWxCQVoRItZBbO/F2rmRW2BsbGCCUwZx4e+9V8fjBWi6OD/nu8okBXbaAgzwOSg58t9+kEeYMgY7/nOdjKwJq/A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU9IcEhVb3RLdlRCNWV5NWNhR2VlY3NTaUt3RkM1WURPclVRWE1WM1NVNHJs?=
 =?utf-8?B?Qy9KSGEyZFJuMTVBMllOQ2krdlFsSW4yMm16VVAwai90WWQ3QmtVSkQ1QjNx?=
 =?utf-8?B?aXE2c0dWcU5rVlRSSmdnMmJ6bkFxT2hrQ1FLejVoS3dYR1NUTXFSeEVxVFBi?=
 =?utf-8?B?aE9PRzloOEEwbUFKQmpXMHZpRG52dTIwbXVHNmF2NEEwWWxjMXdGZ01JdWRJ?=
 =?utf-8?B?b2Zhc1R0VjVLSUFOSFVoMlp0ZjJJbjlQN3ArYkpubU1qUFNWM3RHSmttVitr?=
 =?utf-8?B?TGZMZURtUW5yaHczenNHZHVyOWlSNDYzMWRWcWE1Nm5VS0N4a0o1NkdtVHdR?=
 =?utf-8?B?dkRqbmpiTFdIZnF4N1QwSjdSZHlMOFNlN3lpOUhqTTFnUnhqTHdxME80Wjln?=
 =?utf-8?B?c3pZQlNRQm9pdHdsVHRCeTV6aUx3b0F6RW9FZDRxQUVZN3o0NDY1ekt5RGVx?=
 =?utf-8?B?VWdLeDJvTk5pamlQcTJFVjdYbTUzNHFudVFrTFBaY3Ird21tOTM3UHU5eS9s?=
 =?utf-8?B?T1VBencrUDR2dS9GOStsL0hxZ0RCWUFEczF2L2EvcVREdnF3aDkvZGZkbWN6?=
 =?utf-8?B?WG5NSGhybWRpVjRLVFZxc3ExTHpEQjZqVEtsSndkM3FoRkZoRitUVnJnMTBv?=
 =?utf-8?B?bG1wcERrTmRnVTNRSGJpdDBKVUN6V1ZkN2hyZzlJdEVQVlRFSmtIWGM5bmNI?=
 =?utf-8?B?dldyem0zTFJZWTV0aFd3K3lsa2hGT1QxU1RIT0ZtdmRVOElvWnVJaXM0alps?=
 =?utf-8?B?dzEyVUpQVzFOdVNPK09mcDBGU1FLNVdjMjJqbXdiY1dIUEh4U1J2Q0xkQ0NM?=
 =?utf-8?B?WkVSQTVRVnNoTTc4MmVPandFNUN1YlVVNUpxSVBFUlhvSzFnVWtpSjNlZFNz?=
 =?utf-8?B?Q2x3d2g4RytqN1A5Yk1xWnNleDVCKzdJWXFkZnduUlQwU3ZzMVRaVFROKzFL?=
 =?utf-8?B?MmQ2M1h2WVVRTG5hVjNuYUU0MEswQzgwd09aYUM4WmRGQndVMVpjSHFuSWVl?=
 =?utf-8?B?SVlvckpCVVV2M2xUV3kweVBhOFArWWg2aW5EbndSUDJRbTU5TThGSUxiSHBy?=
 =?utf-8?B?QUxyZm5TU0dJbTVqMnRlb3c2OHZQQUZYZlpTM09kUE0wK2EyVGFMN3AwNXZj?=
 =?utf-8?B?aVdaN0xSZlE3YjNUT0FVeDIrVU1vWUkxZlJzMVdYQXdFSVRrZkR1ek1LYWxV?=
 =?utf-8?B?OGQ5K2tvY0FZNGpXM2tkTTNiUndZazVZelRqa28wamVuME5naWlYdmQ2dXN0?=
 =?utf-8?B?YTNiemtTZE40Unk2Tkx6ZGkxSTAyaVZ4SzNGeSswMllVZjZ0RkswMVovclBX?=
 =?utf-8?B?K0FpdE5hZi80eXo2akNLUVBPbldjNDBKa2QrUTFkVko3YlRTYmo0K3RmSjNN?=
 =?utf-8?B?bzNuTlp1VysrdldwMzR1VEFCZktKL1Z2V1VJbDZ6eFY2RHZwRWVPNW9xUGx3?=
 =?utf-8?B?T0JWc3p3Mkc2NFpVZDd1UnE4Mk8vd1k1N0pJUFgwTkovREh0NHM0cDZGWS80?=
 =?utf-8?B?bkowVmNoVkJETTFlaUJJZkZ4bmdjWGZkSTgrbDNtcDVWU0xCQ1c2dnpzczNH?=
 =?utf-8?B?Wm5TVDBxVWlMdmY4NUl0L05lNThYeXFWcDJqOVd6R29NTDcxaEswRkMwdkdU?=
 =?utf-8?B?alhzUVpmL1V3K3paK1hua3lIakc4QmoxS2dmM01TbnU3YmN2Q1l0WU5QV0V2?=
 =?utf-8?B?cnEyR0dHSlNwTktKU1ZaVkFWcjV1MWxkZXNITXRlRTlwallwd3BtMkNEOW02?=
 =?utf-8?B?dUZHcnQvNjhDUWhGVmhSWGtvMlB1ZGJ6UU5sT1ZEZ0NhNWEwK21Wc3QvS2FC?=
 =?utf-8?B?b0NVb3ViRnRKYmdIRHdNcmYzTVNRNHQ3Q1dqUU8rblRNd3FZV3BJdVZLeGdl?=
 =?utf-8?B?dmR0U3BGaFZXMEdnS1FudlNsbmhzbHBRRUk4eDY3NlFQcnBZMmdOMzlsdXhp?=
 =?utf-8?B?aWsxVmVSMUpRUWJSR2ZRRzM1aE5EL2IrVFVNM25NY3FFaFdJbTZ2ck16bzN1?=
 =?utf-8?B?ak1heE1vV3ZEbGRRYWJBdkZCTDdhUm9oSXoxdWhNaVdxOFh5eU5UV0xSSXZk?=
 =?utf-8?B?WTNxdFFtL0dIemxtcW9CUTNueHdzSmc1ZnFOK3ZoS3lUM2svNHVpdkRSZHpU?=
 =?utf-8?B?dG50dCtYZFFYOExvTVBFdGQxVzB5Yit5bUZoWVZETzhrN0EreU1uOXo3ZWxR?=
 =?utf-8?B?ejl2bFZsbmYvZHAwTVkwUHRNeXFrN2NvQ2dVdjQwRzc2OVJ0SVRrdTRNZGpX?=
 =?utf-8?B?S1V4ZHRCb3J6S3NBcHRZSkdjLzY3TVM3NjIxNko1VjdxUHdFbENWL3R4enRE?=
 =?utf-8?Q?Sl9qO2hSj0hzj+k3G8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8047f3-7474-45cc-0ff3-08df24e138d1
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 02:09:45.0831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ijTg7ypJhrj17ZGDFbrAJnlPAcYRLUM4gu3AjjjbQ8ZpVUXa5kKCRy7PSpxRrnZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999135

On Fri Oct 2, 2026 at 5:52 AM EDT, Usama Arif wrote:
> An architecture that picked a PMD exclusive bit overlapping the swap type
> or offset field would otherwise only be caught by data corruption at
> runtime. Mirror pte_swap_exclusive_tests() at PMD level.
>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/debug_vm_pgtable.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

