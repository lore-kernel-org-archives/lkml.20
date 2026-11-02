Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793646977;
	b=NeuF1b2cExSgSrDZ5FUAFvr51CwYDiMWsOxCqwRUPfZ0h5TzB6yAOoKuY8b7U8HVPUy/
	 cqN5m0LQkQmm2MFvefJraDueBaFS4RVwTkkE3fRg8YggvqoVioPaqo/uBjCaL46JOesn8
	 OmEkqeZqcbA82NNVJZWqwQaEXoYCxUD92Sz9d7V9fFv0ItYKfAdIdDY+j1yZmrlsJmyIH
	 7u20cnBHVLH68E5v6ekN+K7y8CzOSK06FBBjlWFtXHwuMJQOSo6g6mh/mnJRjqhppIiJw
	 qe2qUM2rZXI6adlxyLgM+N/uCHTMeRirAf9xj0yPjXYSSFBrbSOPqtjYD9q1Jc6INvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646977;
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
	bh=bqcU2gZin4umywgxhcAAdkduXpQ54/a6+LeOXcClaNs=;
	b=OQWStKxSW+87Vj8BaJd4oCOfTsxQgkBiwseUCwkXvsQoIQUCUzFXBSDiJyxmrM+wCBwj
	 usQyEKI1rGBjwge2bPo9RaLp0+xRq5/Dj+Yjjl0+9VfSEeuEbg9L+wb/aEujqqNzmcl1l
	 T8ERjncBDxQ9adFssxnFBdoyiD5PalQvtYuG59xg56/brmg17wMgFOE33BEYOX1y8my5K
	 EWKoL09sZviFP81tPy2FZLdx2Cfb/QFUtgh99PV+eG1Gsx0YnA38HVwOyN0ikhBuIJe4u
	 bER5JlKI44b9bq17QaYggdOzzGDv+6fv8pMQVQmHKkwPwttpJVoHKDPTDqxI/pKE7jQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EEooqR4G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.57
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56159606A33E;
	Mon,  2 Nov 2026 19:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56159606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EEooqR4G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymf/erMK/YwgCRgZRWt+t4MDhSCQc1DHGPn6sbJLmfLlGcn0Fh/ulX6lWkEh35gEvJ9aqvv6SSblg93HffEAzO4aZD2RtNxzUMxp3AQDMJdtSKpVo1driNtKHvadphJ9DPTK7K4mNx5CLYrLy5NxOr+7rkryyT2l/7u2PIHynzt8yxZOCjRU+WdJgT4JPEnUSHLPoX0r6s3ITeqPUoQNcNmivZ4R0iScRNPieMyZv1dIlL/7zCjvgOy5sLOtknINsiKSVWk9dWCU42EGaP6JJON5tegEKLLRtcOLgeG2J3jLbr0MoQVqrXwetW7c6vyQ6AUxm8feCW6v+lOGedF9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqcU2gZin4umywgxhcAAdkduXpQ54/a6+LeOXcClaNs=;
 b=S2lvnE+wYGucElTocRr8Mw3CbnjBoLb/Q02t7wBlLrQolvcDrJCPnTwaoJB6W63FvdUVX5emnhG9LJelNNzmVfDuwxjfEDYChHZJhmvftry58U/bYmPjAeS8ykWzdAG4lLOvgwIqmT0uKxXQHAFN/kfzt7Zva1vsIkNcODeROpwDkCuhT/3faaqm09CxE1tuO517DAB+w8rIePNGSFiEvzj+Ai45fsbz/3smQRuKnUpXHK5okQzSTPwb68MeNU8gmZiEwkLrZqNEt/DPB3BTeexCzWTe8YiFKOsp2XI6Yy3PxgTNaOYUiqvb1eVKXG/YsJuLNhueX7KUOH0az4S1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqcU2gZin4umywgxhcAAdkduXpQ54/a6+LeOXcClaNs=;
 b=EEooqR4GTk3MiF6DkwuD8dA3SV5MrnnuoVn603udrsjOlCg/JCVzHqwI+yxdjXDkkYLhUyysi6fs9BhHAqfoYLy5pf/wfuscfBFrip9q3AzI2KWu0Q7LPDULpnTdHTuEGzAB5AhI5sDkY87HgLWFXlfLg77TcojjwzppbBgHKpw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15)
 by IA0PR12MB7749.namprd12.prod.outlook.com (2603:10b6:208:432::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Mon, 2 Nov
 2026 19:16:07 +0000
Received: from LV8PR12MB9133.namprd12.prod.outlook.com
 ([fe80::d29f:9915:159b:b02]) by LV8PR12MB9133.namprd12.prod.outlook.com
 ([fe80::d29f:9915:159b:b02%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 19:16:05 +0000
Message-ID: <bef07925-6a2e-48a1-a72a-127b390705d5@amd.com>
Date: Mon, 2 Nov 2026 14:16:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: amd: isp4: hold buf_list_lock while sending
 buffers at stream start
To: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>, Bin Du
 <bin.du@amd.com>, Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
 <20261026182442.229869-2-saif.elden.hatim@gmail.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20261026182442.229869-2-saif.elden.hatim@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::19) To LV8PR12MB9133.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9133:EE_|IA0PR12MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: c26a0a79-c068-43ed-2f3a-08df3915bdfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|3023799007|18002099003|22082099003|261102123227099003|4143699003|261022075727099003|261021121427099003|261022105027099003|261026121527099003|56012099006|261026140227099003|11063799006|261009223027099003|261021123027099003|261028144727099003|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	yYKdFBCK86zwVE93+PTzfMpew1UGL/px+jc1xGgNYM004IkZc6QbgV36PVtDVStb88i7fbEjvenRnFvH7ta4DPfHXK4L/vXYlquafVhXcPlNjC3RiNyJj2SiCtgFqGYHF43LHOopZk36zAjP6CI5OQM0qgI7g2cSIVtt3Ns8q9tSmUhMNPu14L5ywThvhiMxK0T5GPpcy/Ds+S1mpmtKZZRb1rl2QllwlFUCgU5pyazfDFMQdAoWzgYgM5yVkNZmeTdzo/PRddVI6HPdcpGSAiw5UozF+pvHMPCCeR3zXQA4eDOh4TMD5ZuHbannDSpVk2reeQ/A8l4P1pXWsQoFXSZkb2148ovENnZo6oroYho5NanpUMTCel6XgZMlg2qvWY9UboPICEQWg+qNl452IuMHtUFTJi5Nn9u0Sy5dCdv4q41CviaoGUqw+xzZjSRT2UuSmh/wyCPXNCJP0XzTVFO+Waqp4IrzrZrlkGRvsvmnMSE5rSjkvXQTquJdtY+ZROlHeg8KLqd4n8L6vpmzRocApiwfuDk89mAjTPMlLqK3wgwY08fg+u1YSCMH0UHZahsdCgfktLz39si0m4f4T0u9gNUDch5FGKqJ8ji5ltvj7gAjrLQk00LeSS+9ZqmvMj53zlegUI+lmEAESb0MW2hzCHGJINYHthwqsWp6SNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9133.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(3023799007)(18002099003)(22082099003)(261102123227099003)(4143699003)(261022075727099003)(261021121427099003)(261022105027099003)(261026121527099003)(56012099006)(261026140227099003)(11063799006)(261009223027099003)(261021123027099003)(261028144727099003)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXIrcjUzMFRhSzVJRjdBb3hzYWh2cm5IL1QvQXBtODdjSUxiZlFwTjkvYzZo?=
 =?utf-8?B?NUlyZmFFdGREblRCYUVVZ1NnMmRxREozSXdTWUNTZjh0VDlOZmtlbEhpcVdq?=
 =?utf-8?B?TjN1ZXpQTHd0ZlVGcmVuMlRCQms1SU5oeW04QUkwT1UyNTIvbHl0TE0wRHZS?=
 =?utf-8?B?NDZ0eUNWZ2Q5TFNWNHFOSHZHMEtwTVNURFBCb3JuOG5vcVFnN1NOZEM4b20y?=
 =?utf-8?B?Z2JJK2ZTSWxyN2Z0a2VSWUN6VUcxUWozc2VDWFcxVmtPZjZuVytwcXZuZmhY?=
 =?utf-8?B?SDRpSnloREZjemh4eDVxNkVMeStQK3JldjFMdC8wVjlUTTJDQkpKK3BCQTZG?=
 =?utf-8?B?NVVJelRHc0NOOGJPMUNUVEtmUGFSbFVJcVNXZjZjT2JuTVNNK2lSYlE3Y1hs?=
 =?utf-8?B?Z1VBdFZXSHFYWXk0SnM0OGJyT2VuajF3eGxmN1VlN1J0Z05aZDVRcTN1MnBq?=
 =?utf-8?B?NWVxWGpzR1dyL3cyMU1oZWlsSEtIdjNtalVhdHRZdksza1d0alJ1ZGxDZWFk?=
 =?utf-8?B?STR3U09NYWdFUXhhcUJDeEpWYUVzY2luc2NWMmtFcFNuajI3VGpYRnhjb0x1?=
 =?utf-8?B?L2VwbFZXZVBiOGZZWGl6ZUQzeVF3QThCeFBxZUtNK0lwUGk4ajl6UlNmOWtk?=
 =?utf-8?B?bStGL0YrbldFSXIxMlVGTDkyMmJTTDBWaEhMWXhIRGZ0MmJHaXMzK3ZlcFh5?=
 =?utf-8?B?Qy90UmNUdzhyVCtYcUdyelR4c1U1dDNxWFFsYm4zenN6bFp1UURkMnlKdkhj?=
 =?utf-8?B?UE9zM3U3WXIyQ1hoK0JXdXEwRlFHbjUvb1N0Y05yM05PbVg5RHFZK2NBT0lV?=
 =?utf-8?B?MU9RQ0FmbUFnUHcwTENOcUt0NXpUakZUMnV5ZDZQWGU5ZnEzcHU3cmJkekRS?=
 =?utf-8?B?SmRpOTIzeHhablBkSDZhbkhjWUZsSjA2cnBjYmp6cEVqMjhXM3RzdHpMNytN?=
 =?utf-8?B?V2gxOGlMR1lndENiN1E4MVBoSWtLWU1hUkNsbjhQZjRvVVpqYzEvaERoZE9z?=
 =?utf-8?B?bjJHMG5aN2sybVRtZGgyZzFyekw2K3MxekJ1QWpHKzhNZ01ZNUNDamF3MGlT?=
 =?utf-8?B?em4yU3hLcHM0QWRNdVV2TGx6MWdlNFNPQ3VDanRKWXJscDFUbzZHSlJ2ZTNo?=
 =?utf-8?B?OHVlMFM3M3lzbERpZjhaMTVXLys3cFJuMy9tWGt2TUp0ZEMrZHhaMVlQLzQr?=
 =?utf-8?B?ZWpRcE5jSVphZ21aY0FkaU9DV1NONkdHQ0VrWTBTRWE2bkdPYnQzN25ldVNs?=
 =?utf-8?B?Nld5WjhqTndlVitobHZ4ZHNJZDRMcEE5U0YvSndTVEpIZGp6QUprYkdlTjVs?=
 =?utf-8?B?MHY5dkZZZzQ1YmowMXlwTXd1YzlHS3JmQmIrUFhZSkp4TVo1cnFFSVd6MTVG?=
 =?utf-8?B?WmN4ZjNqQzhZN2o0TlI5ek50MTFOM3pORW9oR0FZM1FYSnp6anBxYVBHNWV6?=
 =?utf-8?B?ZUlISFpiMDZYcytwZFQ1UjJETEQzLzdMQUVPNWtYSkw4d2JMNW9MVWM1MUVQ?=
 =?utf-8?B?U0I0aFN5M3lRUjFPUnVHNTJqbkZZQUFZMmhoNmJUZGpqYUdaTXlFd1ZMdzBV?=
 =?utf-8?B?MUU3S2hubGRHWkd5dGREcXArM0E0SEh0VzA2Qmtlc09wc0ZNeTZyQ1ZleUR4?=
 =?utf-8?B?RnQ1NkZnS1FLSmNsNlE5eExIWm4rNVI2NFB3MVhEV0xRZ0VIOU43SVZFUXc4?=
 =?utf-8?B?KyttaWMxNklieExqRFdCSkxXd1F6b2JHZzY2c3lXb3Q1a2szUGhtRmlWSEY4?=
 =?utf-8?B?bExwSDlYZmhwR2xJWGdGSVU4TGk1NlFHWFg3a1gzbG0wS3N5aytCVnFGdFJZ?=
 =?utf-8?B?NDlXOUlsVmFpVGdyUng2TndVVkxBQ2Y3cHdWeXlHaWNLT05wUlZReWdNMTVq?=
 =?utf-8?B?Z3B4VFVzVGlEcHp2dFlFYTNpeHJIZyttNjBYYkZCbGZHSkZ3M0c1RVoxYUJm?=
 =?utf-8?B?bnRVMUdIbVZCQ2hFNVgwSk9KUlc5WHVYSVJ2dUNIMGZQS1doOU5jaEhwdUFy?=
 =?utf-8?B?ZVNEWkRuSWwrOGdXbnZRWVhNcXNKQ1JnUE4xRGNmd040MVRhYWdqaitPd0Jw?=
 =?utf-8?B?MEtTeE5KVXFCTi9oY1B1QmlIR2R1QlVLd1Y0SGNZaUw1R2J4cmxOYnNqcDFk?=
 =?utf-8?B?dDdBNTdldXVhVlRWVnFRZlNmVDZtNGVoK2ZGVUhuUU9xMWJreWdaRHlnNXI4?=
 =?utf-8?B?NUZYRGhvV3FEdGhWRHhYNnJiOGJ0T3VVWStZMFRpNHpZK1dEbUtMUlhTS0xo?=
 =?utf-8?B?T1JRaUtJNVY5UFhNQmdKQTdaTTNlazE4bWVTam5vdW1yU3RHVHdWM081bnZP?=
 =?utf-8?B?cE5DaGJ2cnRTcUdLVndrT2ZYMUsrWTFheUxEWEpmbDQ1VkNQaFdpUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26a0a79-c068-43ed-2f3a-08df3915bdfb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 19:16:05.6428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIfDbjXCX1kEOQRV8OdKwvulct9a8cGiLdZBW9diiHYUsZix8TxZKhdplpZVcDoUaEqFI7VCvTLruI7B8vZ/Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7749



On 10/26/2026 2:24 PM, Seifelden Abdelmonem wrote:
> [You don't often get email from saif.elden.hatim@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> isp4vid_qops_start_streaming() walks isp_vdev->buf_list without
> buf_list_lock and passes each buffer to isp4sd_ioc_send_img_buf().
> Every other access to buf_list holds that lock.
> 
> vb2 serialises the walk against buf_queue(), but not against the
> firmware response thread. Once ISP4SD_MIN_BUF_CNT_BEF_START_STREAM
> buffers have been sent, isp4sd_ioc_send_img_buf() also sends
> START_STREAM, so the firmware can complete buffers while the walk is
> still running. isp4vid_handle_frame_done() then list_del()s the
> completed buffer from buf_list. If that buffer is the current entry of
> the walk, list_for_each_entry() follows the poisoned next pointer:
> 
>    Oops: general protection fault, maybe for address 0xffff8e6944d97060
>    RIP: 0010:isp4if_alloc_buffer_node+0x37/0x50 [amd_isp4_capture]
>    RBX: dead0000000000b8 ... RSI: dead0000000000b8
>    Call Trace:
>     isp4sd_ioc_send_img_buf
>     isp4vid_qops_start_streaming
>     vb2_start_streaming
>     vb2_core_streamon
> 
> The oopsing task holds the queue lock, so the video device can no
> longer be closed and the module cannot be unloaded until reboot.
> 
> This was hit on a board that is not supported upstream yet, with an
> out-of-tree change that made one isp4sd_ioc_send_img_buf() call take
> over a second. With the stock driver the window is much shorter, but
> the list is still modified concurrently without the lock.
> 
Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Thanks for submitting the fix. It appears we were fortunate to have 
passed the tests, as isp4sd_ioc_send_img_buf() never took this long to 
reproduce the issue while the stream is running. I’m curious about the 
sequence you are using to reproduce this issue. Would you mind sharing 
the details of the sequence and steps involved?

Thanks,
Pratap

> Hold buf_list_lock across the walk. This adds the lock order
> buf_list_lock -> ops_mutex. No path takes them in the reverse order:
> isp4vid_handle_frame_done() runs in the response thread without
> ops_mutex. isp4sd_ioc_send_img_buf() only queues commands and does not
> wait for a firmware response, so the response thread is at most
> delayed until the initial buffers have been sent.
> 
> Fixes: 2ccf48af2270 ("media: platform: amd: isp4 video node and buffers handling added")
> Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
> ---
> Testing and AI use: see the cover letter.
> 
>   drivers/media/platform/amd/isp4/isp4_video.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
> index 856a2a0b4..58ea8d6ac 100644
> --- a/drivers/media/platform/amd/isp4/isp4_video.c
> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> @@ -567,9 +567,11 @@ static int isp4vid_qops_start_streaming(struct vb2_queue *vq,
>                  }
>          }
> 
> -       list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
> -               isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
> -                                       &isp4vid_buf->img_buf);
> +       scoped_guard(mutex, &isp_vdev->buf_list_lock) {
> +               list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
> +                       isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
> +                                               &isp4vid_buf->img_buf);
> +       }
> 
>          isp_vdev->stream_started = true;
> 
> --
> 2.56.0
> 

