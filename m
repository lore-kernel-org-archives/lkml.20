Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794932136;
	b=otclOHW4hRGOiMExQrUWpca7EoB2VDHqUHgqe/VSawT9HtlZtCjq5d5jzqEtsZp6uh/Z
	 BXCS8qWYl8zkQxMNtbMjmASLcOmsgvVrWINIBc4kiWGiFQYuW0ysRuwAEUX6jWBV3KZ+J
	 fX6t0E6ignWVIt/Di7m6wR+snkjqcxvKAvsgH4rDWoafHLWFRf3PgTM4PGRl3s0AsuSvI
	 FKxD9/XtFyKgsCjQIIOaouLAjZ3SmiyawWxMfspziTuXltpy6zotHMaMmCkW3qKx9Va0m
	 APXSl28vu5IVt57DjZ8bJWxzbcUSv2Z9+vDKqbuIG61c3KF46MZCD5bpU6CSIwlfsaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932136;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=gBZAxQ11Kh+0HRKytw8TbCbfiQGZQCD9H2l3xVrJtXQ=;
	b=hFN4jvRWOOP702mUeIe1XKkn/FojexA9jaOzrwh4Yqqy/Tw80hFaXKytAnt90CBfBXf4
	 v9uAJaYjv62kgdKZbFR7X4KGHy5/R4jauomt5RhewF0ge/PHeUMj2Z7/JCp+7OVbdQHwa
	 APL24si3kTKU6Z8zeYNv1BWrRuWhucLBzL04ebzVgRlSswRlMkF3W21KhakQsjuSwwEKg
	 uCX4nCqN78H/jGb4inEy4Q/dZ+Uavdw7mRV6Wc4p92NgQ8YDnzI1LRvFMCcjjLj9BwnLB
	 Wi8q+x/WRXTzWkzUfqrEdFpDdNaTTHacIdsB/sSubPSu4v+Xkfi12U+13ayzgdGFkRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Mi52k0UF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.38
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013038.outbound.protection.outlook.com [40.93.196.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E6E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E6E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Mi52k0UF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivAwnAbSFIsNjiwu6rtoL4mmMAJQgmyw9YKPlelRVr0ExsqITelESN6FFyhZwgzSnEvSiAeHQXa+dvkVe7MjR4WbAASFH3MdzCN3FeFM3BX9LYintIrQIgFmxQvlkgXydYeLqi5EybeBJrU40nzT8dQey+W0ymuysuzl+UyLueIf8uXYLJLXjhB7Ss3F5DX50HphTbqs4Ez2WQlghM7tgu7SlmGC2auRR+VM5BEB/mnuH2vIhwes4wDYIGkPuc/j+cjQHie2JDdSs/m30BNotkwYOYLsDNXOnuVSX62P08Kd37TZ4bRBTznMWMmjZK/gawXSpao9zIp7PF4TgTEkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBZAxQ11Kh+0HRKytw8TbCbfiQGZQCD9H2l3xVrJtXQ=;
 b=Nz3DIOTDAve1Ttqo73XhvZLFsk2RnkkTZO2NCHffaI6Yi/JR7xYB0DawxzxKP725KBQP6K9OT+qMO6aJJSqtcCmZ3FEFbWjx4LN/5P7K5/6qXdC/wIlUCkTKaGGDeGUBSIwReTVVxeCsM5lZE0Zw/v+buZMriqsAGl0bORw5909xQfd+FKJoeyuirgrQQpRDSMpNUHTKB7xyfjp6aXniVcIRKhHJlusm/hvYn6hPO3DYzjPV/9WwptO0zujgbGqWbiVpkSSI4EVU2MUQVVBzTZJgNZ1Aks59kQSLA9J8idxojgZjplFaYqCRLwBlIo4gR/dEq42t98kyHb3Zsy2hEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBZAxQ11Kh+0HRKytw8TbCbfiQGZQCD9H2l3xVrJtXQ=;
 b=Mi52k0UFEv5y4u3iwErhPOw/LS5BBbgoa4LAZblfQG1eipps/tfTrVVFN5auxT7sNRHnxGPRTFcihDlCuayAXFx85XYfqEd4hj7Uxyy6JJVUxtSew6IVCfYLfTJ9lQ+8QiydKkfyvfQDmeXeAR2QtpGXNCMSvNogFwlmrWdJ40I=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by BN7PPF2E18BD747.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6ca) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 16:15:30 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 16:15:30 +0000
Message-ID: <8418248a-aeae-46e0-bdee-4db1783d1bbc@amd.com>
Date: Tue, 17 Nov 2026 10:15:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] x86/mm/pat: don't populate page tables in
 set_memory_{en,de}crypted()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
 <20261112-fixes-x86-v1-3-791adb8d6670@kernel.org>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20261112-fixes-x86-v1-3-791adb8d6670@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:610:58::29) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
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
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|BN7PPF2E18BD747:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d0d59c-d885-48fe-a290-08df44c60026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|11062099010|6133799003|22082099003|261009223027099003|7136999003|11063799006|56012099006|4143699003|261102123227099003|261028144727099003|10067099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261026130827099003|261022105027099003|261022113327099003|261021123027099003|261022115727099003|261021130227099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	m5b+8PjRg9+TeSEx+QYUcu+byv5FzeUiyRv9apEs1hS/t0Jn/QLAFEsVd0bEAeJo6sZfpEQJ09mmDA0DrhBIWeeLS0yPl1JX0LfiM4RCYi+WSdRjN8uJvUZraW1XywofOpmuooqggpDT1Ypq5Kpfh8nwsoPEUao7VnubgXfW1tGM7PXn4Tdk/5S4aUsz5BNlVRvzFN+qO/R5/hXOaKRP97ewD/MxIhFQi2Bmy/k1hzBDFCHhqisYsl6Fb7+LTirk1FOGew786kZ5ni6Tx9fQhzUCEqEM+0SGEg58GAOEw5NtvUinRXq74EqVXFtafn07sIYIfqz1IIzI8ByvmuLs8alXNOYvPKy9AZbWlPnedS74NmDyruC0BtfC1az680tw47/R2aqFP121ANTCawH9gYxWaS5T7y0y/s8zvy3EC01WdLslVZm/ZRJiuZ6t5UPSA/Jif9O4tEH3fHyZkYKjogTuqW/gZiNENXU8lZjPWw9LC05BCdNfG3OpBOjwS5EH8KNUww5le/kHTHLcp7XFgsll1R+5B6MmRx/XD5O+H7SMI3ioeGkeqjFYZllgkcf1ADE+RrhnuvrKHOn9OX+IfieKb4LLu8K6pcK5bJZH3s5F+FsYfnz4twvLkPp5oI0HqWGMae5G16IFL+AhZEkO1bL78HQzAdUs64MlGCIzxdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(11062099010)(6133799003)(22082099003)(261009223027099003)(7136999003)(11063799006)(56012099006)(4143699003)(261102123227099003)(261028144727099003)(10067099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261026130827099003)(261022105027099003)(261022113327099003)(261021123027099003)(261022115727099003)(261021130227099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlB0UXlrQkJub3NWdGVwaXNlYUM2QXljQzZYcU03SkJQUXhaZnloMERVRng2?=
 =?utf-8?B?YkcxMTA3T1pqbTJhdHBkVVRJOHRjUkU2N1lVeWVmNldIbWlZU01vMHNLNVkz?=
 =?utf-8?B?MU1VS2tHbnhjenRhV21DRm5BU2RETEVOWTVPRytRYlVHVFRiL2ZCVWw1Rjk0?=
 =?utf-8?B?U2xJakhOTm02VmpaM0hxZUsyRTFVbkFxa3ora2JNVGpKLzBsQjF3emZoZ1V5?=
 =?utf-8?B?K1hzMk4vWEN5eHhtSEk1UDBtZndyY2xRS3JMUnk0RGRIWVlvUXFkcmF6My9u?=
 =?utf-8?B?UkpsbFhmMjFXZ1lPK2dRbmg4NVdkeXVrVjBXdGExSVhSQ3ZJYUFRemhnU3Ni?=
 =?utf-8?B?c1JIM04rbmlZZ0FUeDdDOXh1NFh1bzE0N3ErZ1lJMzdQYU1WVHgrMGROL1ZO?=
 =?utf-8?B?blhGVUZRTWtEckhBSTZodyt3ZnRLV2FqVTlXYU1wL0FCbVd5M1J2K21jR05D?=
 =?utf-8?B?YkFQWHRaa1hmcFR1L2NIbVVBKzk4YmZPSkIyeWFjY29wN09ob0R4eTFKMEZG?=
 =?utf-8?B?VThuV1c4Y3JiaTFERjNkUlFwdU44U3FUcDBaSkxzalhpMHAya1JoTG1OWHlN?=
 =?utf-8?B?UkRNSE9CYUpTTXJBUUV5OTRZNFEzaTVuV1lxTm9GeEc3eXBHNXYvRXBseE1K?=
 =?utf-8?B?aWxCZlJKczQ2dGkzanhCemh5WDdKNkdXZkRTbzFubU5SZUFHMU1Va0NYVm9v?=
 =?utf-8?B?d1VVOFFkUVRaOTd2alVhNDhEdWlYUm9Feks0SzJ6cEF1anV2V1Zab0pOeFdD?=
 =?utf-8?B?cmJoOEtCK1h1T1JHU1VNTVI3VFp4TSt5VlE0bkIwd2ZCTCtTcUd0VzJJZTAr?=
 =?utf-8?B?YVkwOTNwZW9MSXZORzZ6M20rSjhrWldlVVFrUnYyVFVOeEU1Mlphei9VdU9m?=
 =?utf-8?B?Yk1YRm5Gd3dqWElqOUJTRk9kRFF6U1NaWUhES0pGSVV5OVZwVmhLWU9uSlNa?=
 =?utf-8?B?cTY3alBKTFhTWGZmc2cwaUM1aGVLcTVtOC9ORWp1anRRVTJEeFZHUkRjRUVa?=
 =?utf-8?B?WDdzNU84M1FSaytyT0hmQld2ZnM3TGVoY2NTalltanBvTlNYZkthVEIrKzNz?=
 =?utf-8?B?VHlMbURmbkNhMjhQTm9JK2pQNmRLV0dtRG5jZlNKNkNMR1hWamliRnZIaXE0?=
 =?utf-8?B?Ky9qUDhkWExacEtFN0FnTGZnTkhmeVRRZFVkNXZVZnd3Z0M2RjVVemVzV1V3?=
 =?utf-8?B?TVBlRmJwMlVqTkIyeVhySldNeGZFaThBTjNORWZjWGFaOS9hdjJjZi9OMlls?=
 =?utf-8?B?eEliZEtwOFpLZHdpamE2NzJHZ0dxOEpjcGVuTnZtVy9OeXY4NGFsWXMwRkYw?=
 =?utf-8?B?bjRXT3NzSmlIZUhZWmRyazRkSXcwMTJrTmJ2RUROUWM5ZkNxRURpRnFhblY3?=
 =?utf-8?B?aHg1SmJQNCt0VlRqRS9LdlRwMTYwVDJ2V3dvejNuMDFGTWd6eitjTVQ2cXRS?=
 =?utf-8?B?bmFsVUdGRC8wRXEwMFExNytlMUxyQm81R1pPaE1wdEVrSTdkS3pGSks3OFoz?=
 =?utf-8?B?TFc4Q0tadExJTlYwbkp4TFNFL3VlaWdkWEVMbXB0NEZCa3FHTGxPenVOcDZa?=
 =?utf-8?B?TWNRekFIMGtLS2pzTlNJRGIxWVhHVXg4dHhYdlUzOHFMV0QrSWpTVVBldkYy?=
 =?utf-8?B?ZE9YQ2NPcTlGVkRjejgrdXI3TDU1SkZjVkxTcVBsTG9rYUphSlJObzQ1a2w5?=
 =?utf-8?B?VHF5SWFqUVNjMDBDc3BJM295Rk1qMzVCVXJ6cHdDQnRGaHN1bGlkVGxwMFor?=
 =?utf-8?B?QVREK253aFZlNW84anJDQTZGeVk2ZnZ4MklYYTd6R3RSN25HQS9LUG55YTZN?=
 =?utf-8?B?R1RRTmxpQ0E5Zlk0V2huV1QxYzVaamJLZkVjUkpxd2xDak9XWUJDdVlYU2to?=
 =?utf-8?B?Ri9mKzNnL05DekZVMEh2TTZFSnZldUc1MWxXSjJnUnFFUmVwSmtCc2hiQTI3?=
 =?utf-8?B?a25aRW50ejB1aHdDWnV2NFUwN1RzeVlqVVFvcFNhZEpGek9xYmdUaDlwYjVC?=
 =?utf-8?B?aXZMR1RDek9Wa25XYmFncU1WaC9PcVhiUHNCQXJxS3pjZzU4TmM4NCtRbmdQ?=
 =?utf-8?B?NWY0NjREeFFlMEFESTRVbkxIdXN6WW5aNzZPVGdCa1liSmJrZURVSTV5STFY?=
 =?utf-8?B?UGtCQnkweUcwVUZ5NEI2WUZ5REZhRU5Qa3lBbjVVZm95ZytQVFJjRVR1THR4?=
 =?utf-8?B?M0lzckRWUVd4SU95Wjl4NGltN1VSYzY4ZTc0V3g5bDk5Zi9tWHAzbGltMCtN?=
 =?utf-8?B?VlpDNEtKWHhxclgyTHZFVVhlY1AwbnhNcTh4QjZPeTZhaXg4emRRRFAyNWs0?=
 =?utf-8?Q?A2eEZl3djB2lSyb0IO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d0d59c-d885-48fe-a290-08df44c60026
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 16:15:30.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0WSfk63A2f1zRpHMazLzzDhm1T3Qg2NH0j1baDaPGUUFd3xXLimT1XXoGCHh/CQgGij9dTcsUlSytoYp6KSiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF2E18BD747

On 11/12/26 10:31, Mike Rapoport (Microsoft) wrote:
> __set_memory_enc_pgtable() sets cpa.pgd to init_mm.pgd. With cpa.pgd
> set, CPA populates holes in init_mm instead of failing, and
> __cpa_process_fault() says that only EFI does that.
> 
> So when an address in the range is not mapped, the request does not
> fail. populate_pgd() maps the physical memory at cpa.pfn there, with
> _KERNPG_TABLE and the encryption bits: present, writable and executable.
> 
> A caller that passes an unmapped address is buggy, but it must not get a
> new mapping of some random physical memory.
> 
> Drop the assignment. The request then walks init_mm as usual: a hole in
> the direct map is skipped and any other unmapped address fails with
> -EFAULT, as for the other set_memory APIs.
> 
> Fixes: 77bd2342d430 ("x86/mm: Add support for changing the memory encryption attribute")
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
>  arch/x86/mm/pat/set_memory.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index fb2413cb8d314..aa7052d247e60 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -2457,7 +2457,6 @@ static int __set_memory_enc_pgtable(unsigned long addr, int numpages, bool enc)
>  	cpa.numpages = numpages;
>  	cpa.mask_set = enc ? pgprot_encrypted(empty) : pgprot_decrypted(empty);
>  	cpa.mask_clr = enc ? pgprot_decrypted(empty) : pgprot_encrypted(empty);
> -	cpa.pgd = init_mm.pgd;
>  
>  	/* Must avoid aliasing mappings in the highmem code */
>  	kmap_flush_unused();
> 

