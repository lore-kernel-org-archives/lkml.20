Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011021.outbound.protection.outlook.com [40.93.194.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351FD2E2663
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040828; cv=fail; b=XUPMAxq6eNIKn7Qr54jPgwRc9Atg1Axom79P6NNwonCz9/pr2Q/wnSHnRhgxirtFwKZSkmKfTat2hcOa1Q0jSlvSlZp5EEHUjj4EZ1tFPBecrUDEoMMOLdE9L+u91PQBZCbKNzOrcX5vylMwc4+0c7RHiVvdDHzt7VPiiGrDMHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040828; c=relaxed/simple;
	bh=sXo8dM1UvlgYBUErvFe6jnIuin27/9XicV9ORwk8E6g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R9eypflw8H70s9xF9TAmwdZE7B/fM8BbYxLNj6fdHlNaBnl+f/maB6yTUzZ1VQbylyFiW7ekMgiz3NnGeVyVF8drs7W7NcuzhaD4E/a4a4R4TX4pKKHQxIBcxarH1ImxEwpQ7k1do0iN/V3jATPwBCNeynGdE/neJJAuFIo4vEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4LODET5h; arc=fail smtp.client-ip=40.93.194.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4LODET5h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdtsqL0w+J5UVza+CdFbgb+2MFt6zCsVAlo9lK4a3qpe3+cTZ+eoK2afzPDvVCOaCl3IErkbNt2QoA+J1/ir2O1a89EzFtnt/Zqmpi5Z78yZ2W5CszRFlWgP6bBGIaIFrenAEcK9HeEtQ3d8XOoO5na2epfu4kb4Km4lrfAHNDISyyvTdEUHhGqN6Q815GH4+BBYy+FBOJ0kLRr5OljKQg0tqRp1LONgKqDDshvLkj7tYzf9+Ytik7K48SifnoBQxx/GR5Y1kQheQmun6/Stw28650/c1NJv/C9QGaILK9PPZBRT9uNZsWtCgb4uK3/XVVcZa8bOv7MdQvvqMzJ+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HFRinHvv28wBdktn9mgPwDsvnWtb1pQdtU5ZnVIXEU=;
 b=BiJEi4y8UPeJU6FRU6y3nYEbNjunz9SwbyGW+uRLhVc8c//je1jFRxNo98tjHVhAgF7nHR7Da/8LJctdyDekhG+9eR6hamferqX+nrNOihoT+V9DeBrN5iCpxMri43fKHidH5j53K3fbzQDhk8BM5G8ficzl0AJpyrDXUQ3eFMy9Cd0vMCsTiyyGcFwNfGh++KlbAx4g7JtQVYCpvX/tx9yHaLaLPo4/SIrie3u7TQGkk+kYg1Tr9+QnmmLhHuinE54dIHN9GmIsOHlnzDkARYcCTY3yhfKe/jjdtZcMQZjm2qtlWK6I5a4jnmFqH4joUu6RyTfmAvaLr75JUAEKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HFRinHvv28wBdktn9mgPwDsvnWtb1pQdtU5ZnVIXEU=;
 b=4LODET5hgH92Ejb3Cfz9TFsvnAdXoFgv0p02fMVdwKb+Vti9Sf8enpfguOadWKAiw8yAOwL97RxEg7PZdhdkmAuWNIGjV/3q0zEuYEA2nRyMVjPjVYeC3a+tcDESPm3qQtgMvPbTKV8VhWxTkVCz5UkSi2P6Q5l87fbLuk8YNYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 01:31:43 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 01:31:42 +0000
Message-ID: <b6b5e5a5-567f-470a-a0ba-3fbad9314811@amd.com>
Date: Mon, 21 Sep 2026 18:31:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] x86/apic: Add an SVSM APIC driver
To: x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, ardb@kernel.org
References: <cover.1789927246.git.huibo.wang@amd.com>
 <69bd40ce677aeac56cf53b10910c602d60604393.1789927246.git.huibo.wang@amd.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <69bd40ce677aeac56cf53b10910c602d60604393.1789927246.git.huibo.wang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa49abe-50e0-4683-6512-08df184941a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|11063799006|3023799007|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	av1vfdAxLwvU9uDLiQTSg6cG+6dkxCrMBcwk/FH0dzH2KXYJauhPA7XaQoo3Q2bIPgJPdRyTVrz+uz50E2L3YMVW3oexEe/WNZUQL+qlRdcgtgVHUIMU4VJzH8C2jHG5hjqnOUf5Bre1c1LdkDmaFxebmNOxsKeE59wGe8Yr/FA5Ld2QaScWoEHdxCTswMXuAmZclYvBjaTwALf5iY86ybKdVSZjvV2jOMPqOtpQNkHRVH7bc7PQcrpL2NNbluWZiutHtQRVzDtW24bbQEeAHgqZZVpKcOR1yVg2QbrSWEmLF54mLhFDm0sQDaaPEDlz3+qlVwQHmDcU4tWn8zVZnR85JHSGkgN5zWpSYo5chUaSerFBlvoKL5c39Voxzi5RebGW4MtB0fC+xdZXb7L80goBMe3mJLYUU/0qiJMhsLJCxxlMkHUR/9YZf095uaXMoQiWnu///xYJutvdpMzzTMGgT0TQigSvkSzMY70hZawqlsG/UAOLqoFw99rbqoQn0MnDolPcThxGQ7Tl88zfSS8WCFZSYF/SXXand1aiIsYZZZOPxKXNjr/HXrKwlfZzWzdwqRD6GHn/zQZsFrTOrghZyVIvjFjVgG20JpD1yrwlWcRHShIDhhEYB53hWXTcW0n0KUTB4h2I28/oS5yBtvnjALgImtnZdxaTya/nBO4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEE2NnJRTi8wMjVVaFhXOU9qSGJkMkppT1AxSG9PRFh3TWpuZ3ZxNytyWG02?=
 =?utf-8?B?Uzlka2V6NEprTGhvdXlDdXNEWGVhMW9wZlVwMU1mVWM2eVUwRmFaaTN3aHBE?=
 =?utf-8?B?RjcvbWF3ZklsUWIyWVh6RjVHTlI0ckdBQzE3SnZGRVptWHc4NXhqdEp4YndY?=
 =?utf-8?B?QmpyK1lUUGRsK2pyR0tIbnRvZUY5clAraGFnbTJtSSsybVlJaXd5dmxOYjFh?=
 =?utf-8?B?NFo5Rm9LZUZ0RlQySXRFMUJBeUZrZzBTeVdBSWtEa0tMZGN3YW1vOHJDaG9v?=
 =?utf-8?B?Nk1kNEpINEhUYlBUN0tFK1h6OEhUOHd5YW1pb1J1UURzN2dBdzVjYnFUajZZ?=
 =?utf-8?B?SVZISUtoOUlqYnNHS21yYmNqTWV4bFFLRDJpaTF5UTZwQ1hIVFk5ck1hc2M2?=
 =?utf-8?B?NFV5MG9icmxkOVQrN2hVQ2N4Z0twemNBTlNBdzBNakUvMzBvb0NsdnhVTTRj?=
 =?utf-8?B?Mms1UW5VUTExWEFMeG01Y2VLbFoyZDVQcTBsQUJKRzJKaGxDaU9hVm9JYVVH?=
 =?utf-8?B?VzFTMXBhcFZxNFlRdHBDU0RjWVRYdjhZdnFRaWFrZU45WDdtZWlLV3h4NFNU?=
 =?utf-8?B?RTlHc0hPU0NMUnIxQTI5V2dHSnpyV1Z6bHQ3ckdwQTJCRjArL1IxUTZyMWxw?=
 =?utf-8?B?a0RMTGdEanBTWTl4dCsxd3V3TUFkZ20zZzhkdDdPdWtKaUh1TnNleHNHQ1E3?=
 =?utf-8?B?RmRiak1qMDRJWnhDbWVWcGJYK05FeW9JczMxc2xac3I1cHFOY29xeS9rYXd5?=
 =?utf-8?B?MDdQSjFDcjVWazFlZTVxQU9vUmxtQkc2VUFpVGZVSFhrV1k3YlVSTW1hYnQy?=
 =?utf-8?B?bXUzZmFyQlRzWGRsTGpQaEFJRnllY1docURZdHBHQzVuNzVnYk1zUkdWdDVN?=
 =?utf-8?B?MGFVTTJsMkxMTk9PWW5Md09yMlFRNlJXRkJ3RitQUFhlSnBDSzZDYitJbHl5?=
 =?utf-8?B?NTRzY0JYWWJ5WWw1YzNBS0phV2tva1N5T09nK0wvQlh4VDZvbGlVTjFkYUtH?=
 =?utf-8?B?VmNONm5NaTdOZ2toNk9RZ25vaEtxU2RkRnBDL0dQbWJ3TnN2eXNUN25qa1NU?=
 =?utf-8?B?OUNjT1lsR3UxYkFBZ2VGMnF5aHVPNFZhblk4NG96S0N5dVdwWmpEVkMrZ2cr?=
 =?utf-8?B?RUlhUVROR3B2WG5vdVRydU9nd055THBVWUM3UEt3SkZWcFBIdVdGSmtRenh1?=
 =?utf-8?B?TjAvdUNHQndncHhldWpYdWMrc2Y0TG8rVUZRT3JBcWVqd29wRVU1R2ZJelJH?=
 =?utf-8?B?UEtlOHFSY25Jc3Z2UGI2YWJWQ1lTMFZYdnY1YVIrL0lkUlZyQ1pQbjBOQXJO?=
 =?utf-8?B?N1FCaWE5N005MjZLMEMwMmk2b2srVkUvYUZTckNLRGxTNXpUQ0hYVnAxTUMz?=
 =?utf-8?B?d0tUdU1HWmxNVHNrNnJnQ041eEIxck43SHltaXJ1eStyc0FteGlmSVVHemIx?=
 =?utf-8?B?RzVNTkxKaDYvYTJzTzhzajZuUVNOdWhkOWVobW9UcXVVWWJ4WW4zMU5OQWU0?=
 =?utf-8?B?K0MxUFJZNlpKbU1EcEI5L2dVcTJ1LzJ0Q0p6TUR5MkpOQVdFakJJa2UyVGVz?=
 =?utf-8?B?dVgxcTlkaTVUSWdVc0ZINHB4SW1JSTZyOU9UbkFBUmFZTHlNaTBQenN2VDNN?=
 =?utf-8?B?eFRpeTFFYldQUU1VMkNUOTNHWXJ6OXVRSjhuOSt3OTVsSTB5ZytvQldIUmds?=
 =?utf-8?B?dUdYNFZvU1JpMUtPbHNZQTN3SzV6UnJPTmhFUy9OYS8weW5kQXJ1aDVQYlNr?=
 =?utf-8?B?WXZwTDBIOUlOc0hpcktvUjJVWDB1MURsb1AycWZMcFM1ZFJhMTcvWUwzQ1ZC?=
 =?utf-8?B?eU1XS2tVRVJvUUIyZ0VHZWZIdjZqQWNFQUFZSVFSaE1kQTk1YkZkSDczN2Y3?=
 =?utf-8?B?cHlTU0lPUFZkbjgwY0J1MTZ2QnRONnlOMzdPbXlMYi9MNkFjaVdzWmJVc0Rq?=
 =?utf-8?B?cldyMmtsaUd1NEkwc0RuQUQ2cjlRNkJXeGM1aDJuSU5ISmI0K0o1anp1R1py?=
 =?utf-8?B?NFhqbnFzQjdWeEdKK3FMc3l2eksvVE9KWmF2VHFvS2M1aTVYS1hQOG5reFhI?=
 =?utf-8?B?emJnM3BKN3pNTXZIL1FxTDVSUkNqOHF5b3BXUTR2WjlWdk9wVldTM1FiY0Ft?=
 =?utf-8?B?aUZMNXFjaGpLR2ZXNnRVQ1VwL0dCVTRuMVptTUJBQzdZbnZvSkM1aU9rOUIw?=
 =?utf-8?B?Y1RtZ2JDdXBMa1p6T245NXNoalV0QThBME1iZmZSN21hWU1NcngvNS9vV1N0?=
 =?utf-8?B?YXpmT2NTTGc3UHJJK2twYmFsdFZnTDVLUWQvbmNxUHFLbWxhTFQ5UUUxTjc1?=
 =?utf-8?B?aW55OTkwS1NXbi84UDBmckpRUHhndWNLY2RodWV3T1lVckkyVm9Ndz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa49abe-50e0-4683-6512-08df184941a3
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 01:31:42.4312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hv/j9sSnhvGiaAPm0pW8Vl0Tpv7a2TT8HjnzsofuehlXhXWXW14oKlgkr9LPM9pU4FC1Nhrj5IcPBHmKtdh1bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179

Hi all,

On 9/20/26 11:16 AM, Melody Wang wrote:
> +
> +static u32 __svsm_apic_msr_rw(u32 reg, u32 v, bool write)
> +{
> +	u32 msr = APIC_BASE_MSR + (reg >> 4);
> +	struct svsm_call call = {};
> +	const char *call_reg_str;
> +	unsigned int call_reg;
> +	int ret;
> +
> +	call_reg = write ? SVSM_APIC_WRITE_REGISTER
> +			 : SVSM_APIC_READ_REGISTER;
> +
> +	call_reg_str = write ? "SVSM_APIC_WRITE_REGISTER"
> +			     : "SVSM_APIC_READ_REGISTER";
> +
> +	switch (reg) {
> +	case APIC_ID:
> +	case APIC_TASKPRI:
> +	case APIC_PROCPRI:
> +	case APIC_EOI:
> +	case APIC_ISR ... APIC_ISR + 0x70:
> +	case APIC_TMR ... APIC_TMR + 0x70:
> +	case APIC_IRR ... APIC_IRR + 0x70:
> +	case APIC_ICR:
> +	case APIC_SELF_IPI:
> +		call.rax = SVSM_APIC_CALL(call_reg);
> +		call.rcx = msr;
> +		call.rdx = v;
> +
> +		ret = svsm_perform_call_protocol(&call);

Sashiko said this:

"Can this SVSM APIC call be interrupted by an NMI, causing CAA page
corruption and guest termination?
If a normal thread or IRQ handler executes an SVSM APIC operation and an
NMI fires exactly between setting call_pending to 1 and the vmmcall
instruction inside svsm_issue_call(), the NMI handler might execute another
APIC operation.
The nested SVSM call from the NMI would use the exact same per-CPU Calling
Area Address (CAA) page, clearing call_pending to 0. When the interrupted
call resumes, svsm_process_result_codes() would misinterpret the unmodified
input registers as an error code because call_pending is 0.
Does this result in ret being non-zero and triggering sev_es_terminate()
fatally crashing the guest?"


This will happen when there is APIC operation happening in the NMI 
handler, there is no such case so I would keep the code as it is for now 
unless there is some use case that needs us to do an APIC operation in 
the NMI handler in the future.

Thanks,
Melody

