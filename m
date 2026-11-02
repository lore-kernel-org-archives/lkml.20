Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793647062;
	b=MexzwrjkQ9p/HKQwGbOnKhmD1AahDZOc4x4rnHcGk/DhVZWSDlHNtiVpy0JlOoIfHP5S
	 /h0pf15WvrGIJXHWAJgDLqNd+0F6jy/YTqq9wX6UAOZfH0H8Cf30zoO1h6G3DCXrxZRWC
	 z+xNJJ/bpBTLRqIZAw+akxl8zuyZXnVDrLqsGANCaYonEATYceeAOeSF32zD0tfT2VqjS
	 grT8xMepNxaYhepSIrLja7zAAeQ3itJL0FhBWC1F5hCmJ2+fOX0XbJd8qM3NLHTIMoirt
	 SarGkvfD5o4CdN25kERKvFTMR/6ZwmbGpe1C1TJ2yxxTyQdJJqDnyjrXeX0e9B/sn6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647062;
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
	bh=STpvKTwSMZ7CCK00YjBZl9GWXnKk2FNSe5gWPXnch9c=;
	b=GdgDz9J2k5XqOgorFxmaNilxlrsp+bSjjvUhIv8QzikZdLyKCmgPLDoCwMUWkEjidVbE
	 fJ6RuA1UZ9LjsFenwql/YXEVbMUMEzHI/exB0OhSLNK/n6ziMTBgiTju29m+UNDo0kjUa
	 j0AjtUT75iDLxSGM13c21hv+tgEun+jCeaa4UCJHHASH0Ce91bM/+QVz4SgfIFow4Ty0y
	 fGoSrVWJSfHN5aSYJQq5qgb12k2BsjMSSCNeYU/JMIRabYjkdlnIheGYskd0Wtj9rWzcW
	 /RpXBmWWpxTfLnsHbqUJdGGLUkJHUlIlqr9R0lKjZOv6DZeBRptzmhDv4K/4exQmfyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2tOGOv3y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.17
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4C8606A324;
	Mon,  2 Nov 2026 19:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F4C8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2tOGOv3y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BekezvVygVTswaYRez7PCZ3VLv70eKt1yY5wpbSGPlLiY+5kNUr2clYzm/HZYIGwEAUGcV/CK69WMxJDbc6dEjGJ5CVd0JTSon2TWQ/Nw8Rszaf6tFjRMXJdT4eQoaUBWosA5T6t4MVtfW1jQlQoM+XjAdW7Ku30pLeF7TUZ205pMtRXKACFQg7Bh08RX1hRTFJztkvJ4o6t0SGzcwODK38KVg8Yu1wxzxV0RPITtXyy4ejnV37wxEMt8Z/Dmj6cSlMABsogTjx9gyc+lyiGjlB15tgrIVAOm/WyWhcetNQ2rSK1Ra4M7r+HiNfwSo+fUfAGNMZBSWMomyT3kLkmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STpvKTwSMZ7CCK00YjBZl9GWXnKk2FNSe5gWPXnch9c=;
 b=UUtEK6H4f8F/V52xtDHGX7+T/zVzlrl8HM2+gjOGorbaadJ0HXkvLU1Q217G/kUiCelqm+pzH6/B4WRVtaDghrYl0Otq4Nk1SWGaBBJrBD0SNa22uPXXQ3Xbccsza3dEH4Ob7e1brpiNgQ5mxO0FYQUkSZ4n42OBDo1WnlJabBvdzTHIaiZXskCor1RsveH8YXSajug86QX3QCUDJYYlUvhEi1s5nIwjG7cgnmAcRVNZgc+/EsEMVKZuDQNCEbIKazIDJirfmkTl9m6egLpUuvoeofKl7CqjXcNoqmhSgEYZtlohAG8r9xp7+BL6obMe8VLlo5aV8zw1Zzr/80kCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STpvKTwSMZ7CCK00YjBZl9GWXnKk2FNSe5gWPXnch9c=;
 b=2tOGOv3y7bGgP4P8IIwAFhDtfy+O+PiWNEQN+NxLZATftAA8P0KoZ5tcrwa2fTq7qmCBIJZ76WNZFC7+HhF49KyT8ISCdRzjCGC8W4jdPpJP05yj6v/L/zLEp0zxBWSN1/rgyTVgTwVuDDQTuQadIOhAW2WYDP8Wu44Z3jKuR3Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15)
 by MW4PR12MB7032.namprd12.prod.outlook.com (2603:10b6:303:1e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 19:17:39 +0000
Received: from LV8PR12MB9133.namprd12.prod.outlook.com
 ([fe80::d29f:9915:159b:b02]) by LV8PR12MB9133.namprd12.prod.outlook.com
 ([fe80::d29f:9915:159b:b02%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 19:17:38 +0000
Message-ID: <55ce6b4c-f892-46cd-9616-38e7dc6ec594@amd.com>
Date: Mon, 2 Nov 2026 14:17:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: amd: isp4: return capture buffers with
 V4L2_FIELD_NONE
To: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>, Bin Du
 <bin.du@amd.com>, Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
 <20261026182442.229869-3-saif.elden.hatim@gmail.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20261026182442.229869-3-saif.elden.hatim@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::33) To LV8PR12MB9133.namprd12.prod.outlook.com
 (2603:10b6:408:188::15)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9133:EE_|MW4PR12MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 07717932-ff96-4dc9-285b-08df3915f51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|261102123227099003|11063799006|4143699003|261022115727099003|261022075727099003|261021123027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|261022105027099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	mr480XG9nlqf8LNWTQLVntC6HQOADEYpA2c4gMxcJC7iog6KhBHWIXjm8JdgEJZSG5zqRsEuLeORS4uZP7+ujj9pf36WcEdRBn0ve5B61RdIuJILt3x5tU4gz3kCzj99pOIkvcOETd3uOwUjBKSjcZT1de4pcQyrr9ZKXNNdeODr4C3NckL7FM84iGslr8yRIFhi4RDYx1pf0tImMcklqoZa0ECrbkc14PSO4VNXSkQH9i0c55agj96Ti+PJXDuRHlj8Y01pvmZXVc3uZv3S6uTdmYoA/OSFz/9VYmqf5rSa6jdDbuEb4kUdsPM4TjcbYKifZlTlBmf+jfyyXIfIVzVoNNg+TX0nTFKWus9vPjk2bX0q5ykaW6cQGoP08DlUCq1nO6jct1BIp1EA7A8r4RLplnbIqJ8h2XMtvybf+NTbAloUSdlLV7p/b358NEDOlfH2E1A08+wkdx+sUkkKVIhaGMBfH04Pa42P83WXuMv0XSzYxBvRjqnlf7O0Y6CmRO+aQt7V70LIre9Z72iIx5MCX3gi/+T+iGHf/n8NmJkZ3peRq0NhDJeeS6/Eo5bEbl9hwXAurbkNdGP4dG0MLvgYaWi9mmQcV3tC+VRsRHOoUX+neJy6c41hhGa8Z29/urqdHcPOr3DNTkt7V2u7LT6vsBXVFfoX1wvRoSYlzdA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9133.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(261102123227099003)(11063799006)(4143699003)(261022115727099003)(261022075727099003)(261021123027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(261022105027099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0IxdGxxdHRrc0xDZ0s5dmEyK3JPZ3hhN3U2TXhRbUw3eUowYzlsVThwOWlL?=
 =?utf-8?B?WVhxNGw4NW5QMW92L2xZMDFjQVpyT0tadXdoVUtMOHVjMndXZ0RBY0RjY1Vp?=
 =?utf-8?B?UnR5OXlJbU5uRkV0ejA0dzRIQlZQUGJJVG5naEg2Rkdvb0c2eUxpcUM4bmFq?=
 =?utf-8?B?MWk2ejNLaCt3eUNqeFhVUXRndFFrcUpKUkRvTmZMR05SVHduQ3NNbm5nbHBj?=
 =?utf-8?B?OWZURjlQdFlWcVFIbEd1T1prZ2J2cytxVVBRVE4zaHpweEltS0VUemhacWhU?=
 =?utf-8?B?Q1o4N2h2Uk5MaEw2MDJSRkw3YXZOeXg3N2RiOUdkeERYUC9TYm0zM1l0WWFZ?=
 =?utf-8?B?czJuY3pmYnl3dzl0amtGS0VnV2gyZ1M5cnJJUTJ5SHFaUlR1ellob1V3elFp?=
 =?utf-8?B?MldSWUxVWEVtZ0xEMlZxbjIwS0tCMFVlVVdvbW9ueURvazVOYTlFQmpWWUJv?=
 =?utf-8?B?d0k1Tk5Ja1gzTkNQTFB2am11K2REYytUcVFUQmFSNnR4d3lJWG84RUFXNnZo?=
 =?utf-8?B?WkNEMkhzN0hmM2NvQjRpejNqT3p5Y3Bmd0d4eE5HYXZ6bjl5RURnMGZSQ1Mx?=
 =?utf-8?B?Nm5jWDIrSHBSMzhvUnBZR3c3RGFvaUkxZ3pHZUtDMzNTb05Zc1dOZi9jSU1O?=
 =?utf-8?B?dFVsOFk3cllsNlhrVVF6Z2N1aGxOUExHd3VEMjNrT1NxdGlzekRzQXUzZ3M1?=
 =?utf-8?B?M2FPMXdoUFdRRkxzcFdwRVpVWWI2bEx5UFo1M3J1UjRSSjRtcTJRNDVEekps?=
 =?utf-8?B?MmNQbXMvTXZCRTJQUGptaUdXMmZadnhsdVNWRUlxQmd5b0xWajFrSHVGWGlQ?=
 =?utf-8?B?RTlsc3NsamJTOEFQVXUzRkZGQ0wzb3FZdmNDWGFRZEFSazVGV1RKRXJOVzlU?=
 =?utf-8?B?WTRISDlYUkVEcDVRa0RSMDBnZVR5N2hNdTVIK3ArdURDSFk3aFBLMlI0dmpX?=
 =?utf-8?B?VE9LOG5KeHBDWmNHOGRXZ0ZGVXppSlJsZ29NZ0VYV2lrYVRRYWt3SmNVS3N1?=
 =?utf-8?B?WGN3YVVuSm9rRFk1THhrR2dwMWR4MktucTVqUnAvTDFQZzBTM1E4bGEvalN4?=
 =?utf-8?B?RXJGdk1ZanJROU1oWlJ4cHRLWUsyby9RVklFdDIwM0NaWWl0dWRCVnE4ZmZj?=
 =?utf-8?B?Q2dWZDNGdWx2eHNkY2RJblVVMXJmOTY2dVhzWVRNM3lEbWRSaDNyOXJGcWhm?=
 =?utf-8?B?UW5ub0pMMzRBUE1tQ3grcUNuSC9vWWpHMWU5ci9vV3VDSWIydHdhV3M0cFo2?=
 =?utf-8?B?VnRtOXQwVXErbkFNazdLYjNtbDlxLys5RUdOWWpxR2xGZk1yYjN3RVVqK2c4?=
 =?utf-8?B?ZlI1eElZbTJ5Y1ArZnVoMU5yR01VSEl0MXFPMldrc3lZQ3F3N0NQbThsZEQ4?=
 =?utf-8?B?NStIKzdvazdENXNTZ1RSWjdmWjJyTEY5MFJhQUI2WE1WVGhQYnRTUTNacVR0?=
 =?utf-8?B?bGtOdWVIVmIzR1hsaUMxcElFZTY4UUl3VnAwQXBzRUMzeDZmZmlnSVp1TlZW?=
 =?utf-8?B?akRMQTVKMXpvVzE2T3VlQmtDWWZFRk94eWM5Rlp1TkZjRzdKdlIrZDR2WFFJ?=
 =?utf-8?B?bm8venM5cUpxZUphUDBQTnRrd3JCTjByM3RhRW56ZURqQTBxRFJYOWtVQ2Za?=
 =?utf-8?B?NU1zMlN4U3FpMlM3U1F6TXlHTXNzZmJpcUkvWWhtN3FBdG9IYm9aUlBjTFB5?=
 =?utf-8?B?TTRqem52YlFkLzFvUTZkMnBDa2s0dWhPS3pXRWl4YXZmVTRrNjIzcFZLZkM2?=
 =?utf-8?B?QVJDNWFyeGlGRTR6bEZOWUVDZ3I5Tm40RWJlWlczVnRzMzMzdllzQ3NCK01m?=
 =?utf-8?B?ZXVJZmlCb1pVQmVQK2xlUk8wV3dWY2dpL1NtN290YzN1MHZBd0doL3QrYVkr?=
 =?utf-8?B?WFNoRnY3eTVhVGxjSTFGa3NTWUh3QVBGbzRXZ2ZsZW1kdHk0VGQrMTl1bXRQ?=
 =?utf-8?B?bDRrSlNTVDB2NW90MXZEMkdQYnRra3g0OUJTa1l1cmErMUJkUGxRZDhBb2dr?=
 =?utf-8?B?aEJ3QXlQeGJzZHAwYlVBK0hEbWJSMmRkVENUSktoV0ZCVDVMTnJLRUptczR1?=
 =?utf-8?B?ZjZtY1lvSVJJUEhvR3BpSlZpekxVT3NlWW1meDRBSm42UkIyZWpqSmVtUmZ6?=
 =?utf-8?B?VGxNNGFvVmt5Z0FvN2NqQlZlQkRYU21ySnhna2VVMk5xMUlHWGdQUERXRDhV?=
 =?utf-8?B?MTgxelNoa3hBUkthdVU2M3Z1US9IMk9vM3l6WmVKWHl2UmE2SW4weVBPR3Jl?=
 =?utf-8?B?SHpiRFhwUVZ5OU5lc0FIM1Y1b25wTEhUdENuRUJ5c0JrMnp4azFXczd4R1E4?=
 =?utf-8?B?WjdLbU9wSG1zWnFnUUY5aHp0YmhkRUZ4bUxhUUdhQWtCTlVZK28ydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07717932-ff96-4dc9-285b-08df3915f51b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 19:17:38.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ld0Az1FEoxv2LwXIkbPDsIPurVhVWgz3UeTY1mnsaizXW5jZJ8IdcfqVH2uH90twlkVUQfTt27j0cM4WYIeogw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7032



On 10/26/2026 2:24 PM, Seifelden Abdelmonem wrote:
> [You don't often get email from saif.elden.hatim@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> isp4vid_handle_frame_done() marks every completed buffer as
> V4L2_FIELD_ANY. V4L2_FIELD_ANY is only valid as a request from the
> application; a dequeued buffer must report the field order of the
> image it contains. v4l2-compliance therefore fails the first MMAP
> streaming test:
> 
>    fail: v4l2-test-buffers.cpp(419): g_field() == V4L2_FIELD_ANY
>    fail: v4l2-test-buffers.cpp(1280): buf.check(q, last_seq)
>    fail: v4l2-test-buffers.cpp(1735): captureBufs(...)
>    test MMAP (no poll, REQBUFS): FAIL
> 
> The ISP only produces progressive frames, and the format ioctls already
> report V4L2_FIELD_NONE (isp4vid_fmt_default). Use V4L2_FIELD_NONE for
> the returned buffers as well. With this change that test passes.
> 
> Fixes: 2ccf48af2270 ("media: platform: amd: isp4 video node and buffers handling added")
> Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
> ---
Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Thanks,
Pratap


> Testing and AI use: see the cover letter.
> 
>   drivers/media/platform/amd/isp4/isp4_video.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
> index 58ea8d6ac..b8af3c766 100644
> --- a/drivers/media/platform/amd/isp4/isp4_video.c
> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> @@ -72,7 +72,7 @@ void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
>          /* Fill the buffer */
>          isp4vid_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
>          isp4vid_buf->vb2.sequence = isp_vdev->sequence++;
> -       isp4vid_buf->vb2.field = V4L2_FIELD_ANY;
> +       isp4vid_buf->vb2.field = V4L2_FIELD_NONE;
> 
>          vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
>                                0, isp_vdev->format.sizeimage);
> --
> 2.56.0
> 

