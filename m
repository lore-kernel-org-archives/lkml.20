Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013028.outbound.protection.outlook.com [40.93.196.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFEE248867
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788625457; cv=fail; b=uqJciSz284gLt1QDUlJGKiBsxw3ddTI/HRh/KevzbdHzzzDwInu6chotn9En7d0ndeSOT7i9aiQy7jm+NPIh4B3V0Ua+/yB/k8Dau9H4Wh5m2dQsZ1PQrDbJPP6oFTTxJ8Ljk3NZkOLnF2kk0FDwikNcVy3PbD+JGzVIzIzw8sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788625457; c=relaxed/simple;
	bh=wEVEiLZeli9uIOmEfxKR4XltJSSgO0QNPR0caZvjb7U=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=hhN8bcsF7lvX5lgiVTTrwPy9S1sY1DJiZf9d35fP/n8R8gfguyNZpl67S6D29vSQlMiIIB6AnECavNfv44Hs+J/ZMY9Cml0vOnEpdvpMhjDdZMuyJmqeC+2kT1tWV01lrR6s14il7N+NtnZEDzOarCQV/NQ/TuUrXj5OR8RJ1Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ioCZhwWy; arc=fail smtp.client-ip=40.93.196.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ioCZhwWy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVeAkfsWy8tF8ZymZPMDu11TnRxggMYTI/WfpAruallaPYX7WK5+8I7bKgEqXRvFg6k81SacJR/8waDv7gRIJjhmqk6bujjTRVulnuc7hGm5yv9Bhe1Ye8btDyL25RFuipFqht+bBxmYAU4yWrVj+9yYgMMNkPSRtJOcPh15rMDgUMGSZ/pkFGm/nxrn412cdWjTfWvgXrpKwSAi/fUKbqF0QmOhlDWOQacv/hfHxFiG9iv6Lka2ZOljf+yxpGAPX2EJl6OJBqRPQZvGUWPqB0t29WkZ6g9dYHTE1dpbYex1Ec3K3kqBSCdL2nrnySkRsro8Ja0vSY3KudZi+9mvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enkvX1acuDbN935agxC/YbowI0kGLhxOhnSaMtsFtA4=;
 b=oXtEmVv3EQnLvZE9qVfvm1CnKSFf1Ms6WrS3W2/l6kzi2Yq0R+tYf6ePQGdmhx8nBFul9Mse0vp7ft3xPN5dmYilyG3MDB8WGWf1Qeh7aX8lQOlY7BkvbCXGg1w4v/AEbXyFv6vSF1J6EbJmjvRv7ZGv/X3rnYLg5W9956Qso2NeV02561BJTEwyHbuXmNtcmmq1iDvzYJ8yIejVDzaH6jkkDijOPjqkMRf102TrXtfOCYREuJX8Gyf6j1taCOoJuqqML3Ayp03/JmWTbx/qxrdfx8mT4NBUdnXFae8XH3HTjgsjNU5khmeawXI0RDChlYSkjZky6PVkFH+nhFDT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enkvX1acuDbN935agxC/YbowI0kGLhxOhnSaMtsFtA4=;
 b=ioCZhwWyiPoS6RRRjzO8ONXsQynUCFhrjfvBALICT4piiBIcsTow8HcGjIEMcYyDpHDub+5IwzT8LZcJVvpvLLq4lF4duMiwi5geX5ZQzNh1P6XzhjMDkitss9QgFLvLydTekpC3GBXIAfagnonjG/qKph5/A1Af0yvftFCXLeIH5MHlBYwlFayvVoWlM+Hq2FViV8f61wemaqBiTBGyqEr/G1qS9YvuxBvrCwcrb8u27KpDzU9ncSPkDji3LVqk+GgVM8ShOYmVVtS5msYuQXtRU8G2D0LKE++a6ylTA5/cqiXpg7OJq4qtcZXdjFAwraOkg2wBVmM6FlKy44cWDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by BN7PPF0FD1DEA27.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Sat, 5 Sep
 2026 16:24:09 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0382.012; Sat, 5 Sep 2026
 16:24:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 12:24:07 -0400
Message-Id: <DL7ISZ2NKFSC.1R1X1VJPVOI02@nvidia.com>
Subject: Re: [PATCH 3/3] mm/hugetlb: fix various coding style warnings.
Cc: <baolin.wang@linux.alibaba.com>, <liam@infradead.org>,
 <nico.pache@linux.dev>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
 <baohua@kernel.org>, <lance.yang@linux.dev>, <usama.arif@linux.dev>,
 <kas@kernel.org>, <vbabka@kernel.org>, <jannh@google.com>,
 <pfalcato@suse.de>, <kasong@tencent.com>, <qi.zheng@linux.dev>,
 <shakeel.butt@linux.dev>, <axelrasmussen@google.com>, <yuanchu@google.com>,
 <weixugc@google.com>, <mhocko@kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
To: "Christos Skarlos" <christosskarlos.kernel@gmail.com>,
 <akpm@linux-foundation.org>, <david@kernel.org>, <muchun.song@linux.dev>,
 <osalvador@suse.de>, <ljs@kernel.org>, <hannes@cmpxchg.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
 <20260905140140.60792-5-christosskarlos.kernel@gmail.com>
In-Reply-To: <20260905140140.60792-5-christosskarlos.kernel@gmail.com>
X-ClientProxiedBy: YQ1P288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::13) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|BN7PPF0FD1DEA27:EE_
X-MS-Office365-Filtering-Correlation-Id: 56649f43-91fd-43fb-111e-08df0b6a1d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	sMOXNm8hfLeHMdQZIxBzuqMUeLaWGfwh0iRvS6GdC06tGvDWx6CkW0/rTO0kn409mG+eAFAWvbPhsrKAe+kjC1iX8wdEijfT+ma2t05RFQb667Y6YXITmxxVD/60afNEhFuHFdpO8eQ+Q/JPlxJfMj2YOTISXTYEp6uhA7uZdtHrLSq6CUbn6jPG99Qnout3kVWg4rYrODa85dbCkn0Yxp3OzxaP3Ufc/TgoBX0hpO3Sc+1tA+j9gxpUCFj1TAxNSXx3WFufE3p6GT5gcgYJb2CBHJwhnZwwc9shzMtEh1oh4WMyoGssaHHimlfEP7a0v27+c/6SuzcyPIfWZzAQ9Cw9t0Mcy+/jH93s2OpoMTrAisxbY/RO4tbI4fDH7uvjyQReEUKIp19FWwU4Ga2BHpXGzmz+6Yj7r8Cz/ScYzLEz0Q9WeofrE+j5NPh1+SY9e6Rpch+3NSvJ0l9OBQqNxf6ajUTZYISYAT+PMK45ag4EJAw/rb4HxsyDOZPoNgkOmkpkFRogCdp/VjiJ6f/RL/aXZz60wycTYd9VxnkmVID33Z13U5TiO+ysqAHJnlQGGG2wcA7//U4VvoPd+q8xicsiGOAY83Z7FNcdzavj6VcpfzmWH5GJQIfzxqHUVbJFIripj1zW3eFVMP+za+khLwrehNe7ct+YuB7922MmaZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alJDUmE5dWh1VHBSV0pGNElVWTQwemt2ZHF4c1cvajIvRVROR2F5a1VQZzNu?=
 =?utf-8?B?NVJvMzZmT0dkWWlmb3VNR25iMUlqZTYrRXNvZFQ1dHJ4SGRJcW44MDZVQ1Nz?=
 =?utf-8?B?OS8wT0V6VVpCT3ZZSWw3eTdJQmd3cUExcEhVZDY0ZG5CTi9PM2w2RFc5VkNl?=
 =?utf-8?B?TjByMHhkU254SW02UGpqdUhZcWJTYUdiOThQK2tUcDJ4a2FpWm5yOXJKRlpl?=
 =?utf-8?B?OERBRlN4S2RkYkpYb0dyRy94Q2RoWGdBZlBSdmltMTdPbWNmbDJtZkFsQmY3?=
 =?utf-8?B?NmE2VHlCaVVnbU5OajBRd3F4QjNBaUJ2bUgvbWJvTlluTnJsRDh2ZTkycWRx?=
 =?utf-8?B?VEF2SWoySXpWdE9NaEZTTUJIZEY5K2drcjhTbzY0U05SdDZSSUgzek5HOFNM?=
 =?utf-8?B?aExIWnB3VDNTWFNFOFFBWXFLSXhzT1pZNWVjUjh6U3dYbzZaWjg2SHdPVHZ6?=
 =?utf-8?B?Z2dLLzFSSU1tQzAvRDBYZXQ5aGtmYUNxWHpaQXBlcUZ6YlNiYU9BWVFvb1B0?=
 =?utf-8?B?NG8rRStGYlYwZjZZWmtna0FrU1FJSXZ3RmR6NGV5S09TOWFuRUt0OXBPTWpS?=
 =?utf-8?B?UlhJWmFNam81U1lzZHNmN1NqOSt2STQwL1VuY3kyUThRdXI4OHRiU0F3QjZx?=
 =?utf-8?B?Z3BkWDVPbUVxTlRTeUdFeGp6UzBXK1N5cnZuakJjRFRNYmUzSU1XVS9RNWNu?=
 =?utf-8?B?dndrZ3V6WWRyZnozWVRCZW9rZ3Q2My9ZSGpuMTBQRmg4VXJ0R0RlM1d0WTZO?=
 =?utf-8?B?RWNLUGlXOGpLRHdZRUlMM2J1VUNZUU5maUZTVjc4UkFndGFwVHN5VFlpendq?=
 =?utf-8?B?Y01aVWxuZU1teGExSGFKVzh4UTBOVU91VHo4UEc4N2pLR1ZYOGhVYlhuOFg5?=
 =?utf-8?B?cDcxQXVHYVpqMEJzeGNVaDB2bHA5dUV5cW96MDY1dGlRTUhxYWY4dXBsRFVE?=
 =?utf-8?B?c3Mxd3o0Mm5TZXNHSFlGcnQzSnlGUXhuWVV2VmJ3ZSs1YkRWTHplMzBCT1Vk?=
 =?utf-8?B?bFFWVk5vSFdxcGRJUWF5MjZpK1VhQWl5TzRFRHhvOTJoNTlPNGdOSHJndHVE?=
 =?utf-8?B?MDVqSUlYelJ3dTJWUkJReU5LVDI2M3pZSTk3ZkNkMCtZd1B6MkttU2RkdVc2?=
 =?utf-8?B?Wk5IamVuNkt5SVByYWR3dkk2RnZqQWt2VWcvMVNpTkZKelpJN2ZqbjFPVmdO?=
 =?utf-8?B?elVFbVdqcm9GU1djTU5XbldnZGw1YjNESWRja0cvM0lZVjFWdFhYYmovb3Fh?=
 =?utf-8?B?VGRwdTdrWERET2dQWHpLcTZiYmNkVFVsejVNTFd4dlVZbWJFTnFPdk43N2xu?=
 =?utf-8?B?RTBMY2p3MHNsSlhwMU1mallLK2R6VU9pdzBDRjFrUTVOSkF1SWQxeXRSeGE3?=
 =?utf-8?B?bURhdmJTZW0veXJzcXBYTmlzdTZqMmhmT05PZDJMTTYrSVNWQU93WFNhbWFO?=
 =?utf-8?B?NHN0Y3BCU2owbEZzREVtZCtuR0padzIxV1h0eXJEZjNmSGRTRFYxSXExSnBm?=
 =?utf-8?B?VGJqcER3SnRpa1d1b2diTk4wNTEwZy9hVVJlaFArQUNLYzhKaHhsRzk1c0xO?=
 =?utf-8?B?WThheHIyMDRxQW9TODhpeG90WXp0UWlnK0h3Z2JLU2wzL3dtOHR4bGhtSjMx?=
 =?utf-8?B?VDFFdTNhOFVjMURGZ1FQYzVWM1VSc2E5eEZ6Tm9jUmdkNXdCNW9GdkRMRHpu?=
 =?utf-8?B?UGNoMFhUek80UEtoK0tLOElJTXBMcXVmMDFvYlVUVkZaKzJ3Mm1aUCtjSTRD?=
 =?utf-8?B?cGFkMS84TnN2Yno2d2libkdqR2lFUFViYUE3YU9aSW5WVzhURUJGVWxIZnRQ?=
 =?utf-8?B?dm9lKy9iWUZUK2l3ZWoxRXorclRwQXp0MHU2cEFCSWlHb3lzZDNmOUlYS1dq?=
 =?utf-8?B?ZXBLRDEyRGVPcExvS3U5Q2RRS0xGSzJRd0FpQUF0cW8yTkdPeXZISXY3M1FB?=
 =?utf-8?B?SUlFQ3pXUHNmRnBPNkdwbG5TZ2FOcngyUDJac25mZWJCcmVWS1MxREt6Mmh3?=
 =?utf-8?B?TE50bmE1SFVBTXdEVGpmeEpLUHMxb0hET1cxTmFKUStTTzBpNkY3VVREa0dF?=
 =?utf-8?B?bllnUFoxcHNOYmR1Ty9zTlBhWkhGSVZ1em1JR3k5U2tTREdCeGQ1cVRoM09P?=
 =?utf-8?B?UjJLbWh6QWJGcFhsVTJZMGpsdEZ2Vzc2RmdzdDBwS2ozQTIyeVJqaXJITC80?=
 =?utf-8?B?THdrUTN3K3d6ajVOUHdhU2tVVHNvUENwb2lIS1o3SkZqSTRDa0xQMmlkUnQ0?=
 =?utf-8?B?OEpROVV1TG45RldJUjhJMll5VW5ycDNqbnV3ZXkyV3Q1THJyVjBXayswUmJH?=
 =?utf-8?Q?LvUT/zAvAMcykr4p+h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56649f43-91fd-43fb-111e-08df0b6a1d32
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 16:24:09.5035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/+XTFC32abP4OZN9bohUjKBNS15Rvx0pouusjI5DKU6dH7qyam0w5m5h07Im+ol
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0FD1DEA27

On Sat Sep 5, 2026 at 10:01 AM EDT, Christos Skarlos wrote:
> Resolve coding style issues flagged by the checkpatch.pl script. Specific=
ally:
> - Fix block comment formatting to keep tailing '*/' on a separate line.
> - Add missing blank lines after variable declarations.
> - Remove anecessary braces {} from single statement blocks.
>
> No functional changes where introduced.
>
> Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
> ---
>  mm/hugetlb.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>

<snip>

> @@ -3764,6 +3766,7 @@ static int set_max_huge_pages(struct hstate *h, uns=
igned long count, int nid,
>  	unsigned long allocated;
>  	struct folio *folio;
>  	LIST_HEAD(page_list);
> +
>  	NODEMASK_ALLOC(nodemask_t, node_alloc_noretry, GFP_KERNEL);

Please check the definition of NODEMASK_ALLOC. No new line is needed
here.


--=20
Best Regards,
Yan, Zi

