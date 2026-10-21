Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792577175;
	b=qvxRc+RT+cWxrgyjc/d4U75PFdDbCPXgmqwse9CAPNkpqB731W91KWhrlc0RIkdhudj9
	 Yyv3RX1D/r71j+2zbJORWtRSZVIW6bnSDkgmyQ42pZmCMZD0rA/QPbPisVE3j2ULT5k6n
	 uv6LsLrYa6rkQ6yOxyxrlDuBcjeR0qVy3ZvArG/JLNGjbJ/ck/Ti4usEKSaAOBBOnNJmH
	 Q8/lS6y49OtrtLnSaA4bFHVDi3QpuJQtOqrebY3+tnhv4bZyMQRyalOrzsseUq8bKinji
	 5sZe24TSVcTvXmhh535XnT0UtdHeO5OKAyUujO+eCq2D84edM9GR2vSuB8/zYqzBcgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577175;
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
	bh=H72PF/ZbhuH/kCTn0TafzV7d313LQ7zFW2+PHQhSNY0=;
	b=o52SXHICLXORa5JuM//AApB8dW45vATyV74hd2Zl1RSY0S6132nDKOecfWKX7GXhLx+G
	 ncgSb3+dRYAN9k0IpB2qx1XjQ9RihZcRihSsSdiWZzTqtEuYM9JEXS7zlv9jwl2I/TdvP
	 tlYmrZk7AJ1n4UKZ5H9H+owk9h1nSOwkbQo3d+Xraw7UCsCqgXNyFBLDYt645oQE76pnD
	 WOMoNzjngQw69sBuVjWmhN3J36LCZdNEk4l/0jcj3X1HQ4ep9Vc4c9bRQPLo6hfA8R4U0
	 DWy11yPra2YmGxaQLDgRyxd7jLASyH1aKSN+uua4XGiX7HikXxVMhbfaMK4to65fSNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hJo+d2rr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.21
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013021.outbound.protection.outlook.com [40.107.201.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53891606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53891606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hJo+d2rr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKfhqe8G7D0b60EHzUy8uxtVqTjQPEvPU8U99/qHq++lcptI3Qec+He5IvpOVSbOr1wtMMtx89A+9eY5DuJe0c6rCqlzBcqrgB0e+2UxGg0/I9sfXpJ9IF037G6JbcsGURbsdUls4sALpLbhfksGKzh9X5sRx9tn2Q+Ehf76GymYoEQGyH4ZNlNjLeW1QEJTCubyVQHZ1MrWj3WuDpFxLirVUkA0819cgLyItA0Hayy43WH34krM7Pdksu3Dv2b1AHDgaHs4oph/ge2+KTDTEk4DKLDiR2V8Z1+WVqnALfYbr74ZtjJyW58j+/C0xdXIiCyZiSoz4Twzxyx6iQNRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H72PF/ZbhuH/kCTn0TafzV7d313LQ7zFW2+PHQhSNY0=;
 b=S+ODndv7m1UvLT4R05N/Ul8jJxtCl2geONtUBDlJ7Brahb1Z4oADK8An5K0+jGrim223CfO6mrS93lEIfqCDNQQbWTRIaOeol6vhfmyE+XTAxgBprQl9+Aarm8j1SMvw3hYcibW2y1IHaSpM05R65I4VUL/mKPcLMjDjB2IN73pFrtCaQY7e2IG4BnhUg2B10YW0CWM6Jqyoae2Zb8ZOpsgsPejnov/QnYxMmwfwaiBMi76HT0+zpPOqwX0TZ9F89BILHnqEdr8ZKWZAxk+J7KEbdeOy37Mj3YkFLt89O9Faqw1BuEgho+yk2vRuTgI5grE4ZqDsTjrlAmXyXwsZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H72PF/ZbhuH/kCTn0TafzV7d313LQ7zFW2+PHQhSNY0=;
 b=hJo+d2rrXHqRVrQQmeaZ8sltL99/xN/cexVxcDnxPCUNvsXQVgU60ezjt1InZwALwFt5zCvZkqBT6CFw4WbySXybHtoYDTlGHSEyaV43Fl8nh5UC4hUwhG1Q1+uPXSpsvUnLwc7iKCtFF+JegdZDag+eHe5BkoxzOObdhR3aOzA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL4PR12MB9505.namprd12.prod.outlook.com (2603:10b6:208:591::16)
 by SAAPR12MB826020.namprd12.prod.outlook.com (2603:10b6:802:300::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 10:06:12 +0000
Received: from BL4PR12MB9505.namprd12.prod.outlook.com
 ([fe80::73aa:eb8c:a86b:5a83]) by BL4PR12MB9505.namprd12.prod.outlook.com
 ([fe80::73aa:eb8c:a86b:5a83%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 10:06:11 +0000
Message-ID: <2ac1dbe9-ec16-445d-aa44-9b0152f92fae@amd.com>
Date: Wed, 21 Oct 2026 15:36:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/24] iommu/amd: Assign per-vIOMMU translate device ID
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, joro@8bytes.org,
 jgg@nvidia.com
Cc: yi.l.liu@intel.com, kevin.tian@intel.com, nicolinc@nvidia.com,
 jon.grimm@amd.com, santosh.shukla@amd.com, Sairaj.K@amd.com,
 jay.chen@amd.com, Ming.Shu@amd.com, SooJin.Tan@amd.com, chrisl@kernel.org,
 wvw@google.com, wnliu@google.com, dantuluris@google.com, kpsingh@google.com,
 alejandro.j.jimenez@oracle.com, joao.m.martins@oracle.com,
 guanghuifeng@linux.alibaba.com
References: <20260930092344.5616-1-suravee.suthikulpanit@amd.com>
 <20260930092344.5616-24-suravee.suthikulpanit@amd.com>
Content-Language: en-US
From: Vasant Hegde <vasant.hegde@amd.com>
In-Reply-To: <20260930092344.5616-24-suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0042.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::10) To BL4PR12MB9505.namprd12.prod.outlook.com
 (2603:10b6:208:591::16)
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
X-MS-TrafficTypeDiagnostic: BL4PR12MB9505:EE_|SAAPR12MB826020:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dab8847-dc57-4973-58ee-08df2f5aef15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|22082099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	17oCnLAEscTPdoq8t+xWSl6ZpjoqxuLT+m1h00hyuI2dwEOQFr541RT/mJxIHL8P55c1HZY8j0qH3tJnP8bcKZ4vEZh8duTk+5yxvlZYRpybI5y6DMrBY9Gh1878wf+qxTpfLDeUZVoQDJzDwzLXWCrxdJuza8mc7ZhdBrEhm7N/XAhLtcUG7uksB0BJnmeIqCoyeY/jnp8QGi3WBRt26/dqmiWW9NiFaySy/BXvoDjdXhuwtVZbzhxrcsTkG3wJIE0/O32urwVpH9ZPLUnpH1WIXdd4KiCXVMpnLoxq9q2RTZvCmeNAwo1/L46nQHs4S4MVxwO6e9zHjMjCXS9Td8yAm5Z35mJvF7NwTLosrObdcXcDPzMuxsRw/RQQ1Zl7Ev7H16Kr3r8v08s2H7gM+eydqdNTgz/8/KwYZHXzGvCeg74vy6o3GbHQcP0Ws/vI54Hq73N3/l5xC8Ie/NksFRo+JfYvlAu9JCei6/JaJQo48Um7c0iJMqLh4oc3WXgSw9T6ts59VovdBgZ34+A/7L/uQfssjm+nd6F434ymi04tZpUfhToNMX9SzPMkd2+yhM1ro5+xWZz48bavdvIu+A6aKx7XQbqjcnlafYEcbNuEJm4V8pAm7oy/mBYoVFc3NtW29zNZL3GsiAadyX+OKqtlcMkUtX2jygDXuw6sRdY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9505.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MStzTmIxdVpEN3BsekpqZm9ZL0VGTWphTFcza1h6emEzZ0NiYnJXeVJxSVdM?=
 =?utf-8?B?NEs3bmJabnRRUUdnZUdyUGUydFhXWjBsTDEyZkkxdGJkbEVSS3o0OHJEalBI?=
 =?utf-8?B?R1ZyT0N2L0c0eFZLay9EcG1yYmNIVVV5MGo4bUNBT1NDSHIybkdyYWY5bDBW?=
 =?utf-8?B?bE1YVG5DYjZqbjhlbzlOeHJVQlZCNkRNN09qUURiWGVVU05NZ01GRlNGZHgw?=
 =?utf-8?B?RmtXV3pRZ3g0NGJkcHBRSGlQN0tXSDc2TmNRVmhwS00vM2JPZ3FpalBJUWtl?=
 =?utf-8?B?RDhXbXhBUkRmQngxOFRsSDloRmdjaUdrZDlXZm5uODREaWNTL0d0UzJvV2hz?=
 =?utf-8?B?ZUZ1Z0Z1a0RLQWNTT1ZiUUtQZTdRYVJWOWxPRTVVZEVGTlhEK01tRnNKOUJP?=
 =?utf-8?B?N0taTGFTRE9mNC9ySUpPOUorbHVISUMxVWxROW05NFpkS1VjcXU5YkI5ZHdq?=
 =?utf-8?B?dmhXUzdUOGc5RW5JZm1ENzBqWm9OSm03b1FNYmtjem5LZ3hXWUQzTXFSYWJL?=
 =?utf-8?B?b0VwL0FtS01raTd2THl3Zm5HMVg5ODFnQ2tRaTdTUGZnRTUwL1M4V3AzZElE?=
 =?utf-8?B?TlFkS2tvRG9rMlVWMVg4UXAxd25FS3NKOE9XekFNTmNjRklGMHlESVF1K3N0?=
 =?utf-8?B?VnpPUHpoWjZXT3lBcjZEc0xKaWc3UlpYSzgydDlZUzVHZWh0aEhpditlOVJJ?=
 =?utf-8?B?ME91bFpySlN3MmZKdStnT3RmOTFIRWRvVDZ3MXhObUlxcVZIWkM1UXNPbWFh?=
 =?utf-8?B?UHhFQXArTFN6SU0yQ1pXNHkycWNaT1g5Y2pTTm5MaHNQQXB5QUwwdC9JV2lp?=
 =?utf-8?B?R1ZKcVIydmh5MXBRNjR3aXBRbndnaTVVVmhma2xPejFTOTBwV1owUXE5dC9H?=
 =?utf-8?B?V1VmU2x5NjJPSXIwTnd2RXNidWNyV29RdDZDN0wwZ2pkUlFJeXVNYklRc3hi?=
 =?utf-8?B?MER1SzdCR2tOUFIxakord0FBdUcvYzQ1bEdnSW1Dei9lV05xRG43eTVjNWpj?=
 =?utf-8?B?dEJuTC9kcEcyRXk5azgxUjdRNEh3S2VMOXZQYkY5MzRZakhjcnVtY0R0ckN1?=
 =?utf-8?B?YWtCcC9sZm45SlRIOU9VNS9aa2pCSDhOUElkSWsycXUrQldRZ1hZVGk2eCt0?=
 =?utf-8?B?alU4anY0RjV0RllRWXVlQjhROG9obndkeXRTVWdpR0FpZ0lDMm15MnZWNkFM?=
 =?utf-8?B?ZnVpMElVenR5UzRwdzRpR1R1NFpvQkNwdWVQb2ptR1pqOWdyRkpydjVwcis4?=
 =?utf-8?B?dG5Ydk5HbmhFaFRSRDRvOU5rRFBISk9xTVlCc3hpTTN4QzlUalExRWV4V21k?=
 =?utf-8?B?bFRrRGI1VGRIQWE1UU9VQXlsUGdYeiszK1pRNW8wSlF5RTI0bnMrL3dCM3Bz?=
 =?utf-8?B?MktybERIMFpIek5sOTZCRlJOV3ovNjlIbjIwU3NrdlVQeExpbi9WR013QVZa?=
 =?utf-8?B?M1hobU54TDY1UU1iWEw2RkJYS2twbWptRlIwVVZWWnhrUktzL2EyQjU2SmVD?=
 =?utf-8?B?ODV1anZXTVNsTDR5VVZGbE9ncUNYdFhDT3oraytLUm9Sc1RhS0FLT21uV0ty?=
 =?utf-8?B?eUcvT1JoL1plNThkQVl3Qkk4VnF3Sk1pQzNCajZlZmVldDd6NjBKZXFlYllM?=
 =?utf-8?B?OEtXOXlYRjU4RHVnZzJMT3g3Uzg2NUYrR0ZYR3VKQm9FdllncmlxNEEwSmJx?=
 =?utf-8?B?b21kcVBWaFFPeW5FSVVNR09ZcTJENkVKUnlGQW5rcnl5RXBudXNDTlBYc1dr?=
 =?utf-8?B?YlhDcHY1QkNpeHJ0dVU3R2l2K1VFKzdWWm8yS3Bjd1puSm1Xb1VBSFp1azVj?=
 =?utf-8?B?VVR2QklkU1dBVE5XeE1jQ1o4dTBJYVJNMFFqdjlQNVZVM2tOYnRuQXc5Zm1U?=
 =?utf-8?B?Sm9tV2hCTlY4RUtiRTg0WGZkSXVlMjIrOC84emdVRFVISFNwNE1idHEwQkh4?=
 =?utf-8?B?cW9QeDRhbEtKY0M3YmJJemJlcWdyNStRZEF1TW05T09BS1BGSldWV2RDYkI3?=
 =?utf-8?B?elI5N2Yzc0kzMURONWphQU96UjMvS3dHODF6NEwwb1Y1cnkvS2E1cyszcW9Q?=
 =?utf-8?B?SEZyTTVjaWJlNC9EOGw0Wm5EWmRBU0g0VFRpWGxsdG5mNTh5QllxcHg3K2pP?=
 =?utf-8?B?bTAvelZVeDRCcFVYQ05OMkxHMjdQOHdqcGlRbnlFUVc1SVFwcGVkYnhmZGc2?=
 =?utf-8?B?d1FTYndDVHVSY25TQk05UDB3MXJpY2lMamEzck5XaHJXSElTQ1hsOWdYWTBs?=
 =?utf-8?B?VElQWUJja1RmdWh2ZkdWOXExUkhpSW9WbUNSTGpIZUdvWFlFcTlEV1VwVEJU?=
 =?utf-8?Q?G8uvsr778eGj/xAVNL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dab8847-dc57-4973-58ee-08df2f5aef15
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9505.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 10:06:11.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m4fCVodajU4vG8ZC4o/9lWa8vsUO6RUl9he7IDD3GdvuoR4vAhMIPFdpIt+IBmaKmGDDavGELrA/fxTSSZRxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAAPR12MB826020



On 9/30/2026 2:53 PM, Suravee Suthikulpanit wrote:
> Allocate one translate-device-id per IOMMUFD vIOMMU instance from the
> per-segment pool on init.  Reset MMIO first, then program translation
> DTE and VFctrl TransDevID under trans_devid_lock so PCI-probe relocate
> cannot interleave.  Clear both on init error and destroy, and drop the
> id before amd_viommu_uninit_one().
> 
> Initialize pdom_list before set_translate_dte() so list_empty() is
> valid. Drop the late list_add; set_translate_dte() already publishes
> the vIOMMU on viommu_list under pdom->lock. list_del_init() on init
> error if that add ran.
> 
> Free the synthetic translate-device-id DTE object on init error and
> destroy; it is not stored in the per-segment xarray.
> 
> Add per-vIOMMU trans_devid_lock to serialize DTE and VFctrl TransDevID
> updates on init and teardown.  VFctrl TransDevID is not written from
> amd_viommu_uninit_one().
> 
> Destroy trans_devid_lock on init error and on vIOMMU destroy, after
> the last unlock, the same way as vfctrl_lock.
> 
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> ---
>  drivers/iommu/amd/amd_iommu_types.h | 10 +++++
>  drivers/iommu/amd/iommufd.c         | 68 +++++++++++++++++++++++++----
>  2 files changed, 69 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
> index 5f84f25e3f37..c748bab27509 100644
> --- a/drivers/iommu/amd/amd_iommu_types.h
> +++ b/drivers/iommu/amd/amd_iommu_types.h
> @@ -556,6 +556,16 @@ struct amd_iommu_viommu {
>  	/* Synthetic DTE; not stored in pci_seg->dev_data_xa */
>  	struct iommu_dev_data *trans_dev_data;
>  
> +	/*
> +	 * Serializes this vIOMMU's translation DTE and VFctrl TransDevID
> +	 * updates on init and teardown. VFctrl TransDevID is not written
> +	 * from amd_viommu_uninit_one().
> +	 *
> +	 * Nested lock order: trans_devid_lock, then
> +	 * pci_seg->trans_devid_mutex.
> +	 */
> +	struct mutex trans_devid_lock;

Do we really need another lock? We already have lock for vfctl update and
allocating traslation device id.

-Vasant

