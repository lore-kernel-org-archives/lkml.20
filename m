Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F254A5ED2;
	Wed, 23 Sep 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163228; cv=fail; b=NW16JB8U7vyKQLjft5rsVbnz6VOqT5MB2BwDV4N/GAy+TOIsobT6YDF6j4ZCS9UMz268D1ue28D84KxFxa9uUS8psg2B47fSqTniqWlyJOw7EPY0Se+LSFjHv9jk9d8m9wMzjZefkPjqHg0l3IgHmm2q/DkEtuzNADfk3L3wUpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163228; c=relaxed/simple;
	bh=yAgqvL0jSD1jrq0mF7XcKBBVtCD4+/AWjrYCc935cC4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nZxfja74gZakhDNmm7fCoMoqtvwXQTaw3YZoQgcUv16I/t5NZylRawSo9rY7RKNg4iOlg5y/XurZMII4vczsuUb9aidJCMXRtH5VfwpOJ2214KL1sN1PGRtF3/CWy8rtEz+JP07zfYcyRAbYFccdsPwj5ppijVxs96meTW5Ncns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2sapQkcQ; arc=fail smtp.client-ip=52.101.193.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2sapQkcQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PX0mKKmhE8CnhsNRfcyIE2sDI4VVsoDY0sHg3Jj8hXTfQWNAaAFGrHXkG0aiAti8M61OHew6YBv8Wk5TAzQ7vi5YEu1RwTCJgkDF+fh39EWwNVUjDSHzPilznz01KKCdcxyT2c+duhbZufbFX1svBRYpXQafjFO4vVr5wrjfmhWDxkO/LPc2LEPGK8/DMgWjrO8xPbf6NY1wNJS6TWN4nikJbFzaj4npX28IVRm2fXPmuMbXkfCQ4u5ww1FOsfsSrH266PRflk9C9gqnfC7D+kuf00hV0OmNjlLw1vOUU68Cq1stQ0I158Z6O85Q0iyLGS9T97jDHp1hojivPq+nig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wy39htXhRBIQNImTPInRBceyPX6pgSkIKJZFCbr1Pcw=;
 b=LG+Cls5kNaoXXtGmpmPc3jnx8O26QWMQKvYat6CJgkUVCq9Dbu7DFH9CKFoOjQsSGLRpTvZ0tN2X/zMnpGKdZ7VJEJvkkrWdgzp0tNvPZKtkOsLumgO2pj1luVgMbTe2UDLadm9SDyCtHFmVdL7FVCSybJXVbEWa0jFvFh1NgPEG+YHkS3DM9GFOUAvui0DMb1f60TPyujWZejH5F+SZ+oTZF/ct7c9/xeTy3Gnm4K0Rcxbzow66fh9X1CCCvIMFYOi1Hc6LmihDfjNaaTsbGmfQxk1r0pwJwD2m+UbDkhob603BlfkXCJyFv7orrnJkuQjmicPlWVjzrlPiGVQcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wy39htXhRBIQNImTPInRBceyPX6pgSkIKJZFCbr1Pcw=;
 b=2sapQkcQj7T0y4rikr8961iPpabNCeJVl+a+kM3dJ7XBtuJzy1nI61etV8iI1fg/hn6+uGC5rwDm8hYHb/cG2tcvt6u7Avj391G/gAEOTQJrYp3swQ/sHhyvmxCrQrD6KIcFvsi62/1sNT653pvcdKLjdFBk31+a2gYCWBvxHdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 by PH8PR12MB6986.namprd12.prod.outlook.com (2603:10b6:510:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Wed, 23 Sep
 2026 11:33:27 +0000
Received: from IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466]) by IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466%7]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 11:33:27 +0000
Message-ID: <5c327774-b5fd-4f17-956d-40b732dbc7ac@amd.com>
Date: Wed, 23 Sep 2026 17:03:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: Frank Li <Frank.li@oss.nxp.com>, Conor Dooley <conor@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,
 Shubham Patil <shubhamsanjay.patil@amd.com>, alexandre.belloni@bootlin.com,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com
References: <aqKWTT47S_zPzvbN@squawk> <aqLQaHndX4t1kKLG@SMW015318>
 <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
 <20260922-immersion-salvage-00450539f1ce@spud> <arKr-oapsl5qzo_E@SMW015318>
 <20260922-purple-overnight-2cdd2ddd5270@spud> <arLKWE1tJrKnzGdp@SMW015318>
 <20260922-unadvised-stalling-5cbeff8f982a@spud> <arL_Zgi1r1IFpNIO@SMW015318>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <arL_Zgi1r1IFpNIO@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0089.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::9) To IA1PR12MB8408.namprd12.prod.outlook.com
 (2603:10b6:208:3db::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8408:EE_|PH8PR12MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d902fa-b870-4bc2-cc8d-08df19667bfa
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|6133799003|3023799007|18002099003|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	ss6IfTLRZIKp4v/5m+oo9D1hWk+Rn8eY3UJlX1khTtnOLLm20kCNCjdxpraoiz+/JMRI+N8pdGjc0aVruWInvj6lu5n0pb54jmebA7+PxVZoSmISnf5x0CgaVhSNd4lfNbOVkVu671z15m4VU9GsAjPys/oqcL71ZB//sjkR39k8Pxyh/rF3X64Z0YHq06PrZy1OLHnQiQSOrwuKnl4n9QvPLAFWMtdh37MbiDTjRa3H8hwyXAvi2+fFWK9/KwetBVVkXtEREkBNKUFKr9AiZC6XSlvgg8eGklhiLR+fK7w//SXRPZ7i+9efxGmEXHDoqtd6CLXZuSQA1ZK33iC42UvRJe3Ssrv+hVC06jH/hcv9WIAO8ZKTSdFUeM3xu7GXlMFDs13WRAH+J3ZO/AZP+x5MYovppD2CMoevNkNAJ2CrMeJpt4ypTXQ6vGNw6CvBxmMfMZ6Y6TCa/Ff7QKgt0385OXidla5jG4CGuI1zgDCMQ12Yq3VKoi+RffgaxILY9NgpCWA45sj5dR0hr+bqgfLQ6uAgXYpsIhjP1EO8ISB0SY+W3F0aN0kJ8vu/2vVjPXiqzBnZSzF0hGpl0esw2YjUN2ZNazOM3p/teg9F5S6RK+wgKqVy7JOQriJjioi8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(6133799003)(3023799007)(18002099003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEVvUlRxNWF4TlNpWFUzeUV3R1UvZ20wb0NqWi9qWUYwbTVwbGdvZFJNdlR5?=
 =?utf-8?B?OFdKWGpwYlcrTVRvN2QvQkpHbHFjenNHTzJZM2JsajZqOEhCN1hnNjgvMEhX?=
 =?utf-8?B?UGp5Z3AyS0dPbTBYOWtZUHJVcmwwZ1c3RHp3TGV1cU5XdGNYYVBCNStiaHpC?=
 =?utf-8?B?dlE3M0txUitpMTNEN21EN21GTHNGQ0FwanN1QlUzb1cxM1Y3VkVFdkR3Ym5t?=
 =?utf-8?B?ek5XL0h5TkRMbDUrVGdrVnNmVmhyUm5rNkU4RUVPKzRMS201R1dxeUxORjBZ?=
 =?utf-8?B?cFBzR3VqdkJxQ28vNHYxY0Jab01JWXhkQ0J2b3ZMRmtTU2libXc0Yzk1ZnAw?=
 =?utf-8?B?SExKdElJZ2QrSGx0SEF1YzhKTVRXbkkwSDZvam5HR0txQzlRRWdhNFFpeHFS?=
 =?utf-8?B?OE4xMnZHVDdLajhZNUhMdmg4Mkpzb1Mzek9nRGZJVThkU3RnN1hXaXozK1NE?=
 =?utf-8?B?NEFuTFZoWHptVUVyNFFvYzZ5NmdxdWxKL0pJd1BXRmx2S1ptaENvcHdWZE9H?=
 =?utf-8?B?MDNlNmlzNDZWSExZV2VNRzloVFZqVW5NczlveXBMYm16dUl3bUFRVWhkR0R1?=
 =?utf-8?B?RGdJWkhSc1JLcStKUjJNMGJ0WDBnamtKYnZpOWMvd2wvbDdnOXMyZ21BZ3Z0?=
 =?utf-8?B?VTd6YXQyZkNwWnJEZ1hGUXBsZm9YYmJ3b1FuWTFTZlB5VUszN25HN3RDWnZm?=
 =?utf-8?B?M1I4THg2RlB0VDEzeHF6NllGTW5jTS9GYmkvb05mS1ZBZ3ZMdkQ3TzJZU29n?=
 =?utf-8?B?SFpzNHRnbDM4QU5Eek41Z2JhZXJwcnJxS0ZiRnRFMDJ5ejFKMk90Rmh3NW16?=
 =?utf-8?B?c0dIUTVCaDNyMmE2bGpNWmlCZW1WUFZTb3BMK0JzQ2g2Mzk3N3pNbGJvMVl1?=
 =?utf-8?B?Tnplek5GZ0VjUlRyaWgyclpsTmZtWm16K21OeEl3QlJPRlVCc1g5WnQwOWx1?=
 =?utf-8?B?eGNIMUlpTVRkQ0ZZaDRRS3ovaEVxdDJuNEw0SUJkZ082M3prWHBvdkpMN2ln?=
 =?utf-8?B?bGFOcWJOa29SZDZIMVMwZmI0NFpwRXdidTJka2g1emkrRnZ6TDdyQzJ4bVpw?=
 =?utf-8?B?MGc0NmsrbWt1dEFEUTN4Z0dXOWtEa3oyaE9mUDFSTnRzZ3FOcHVkTFdtM1ow?=
 =?utf-8?B?S1J4VGtMMXM4TUw5bVkyamxVVDFTUlJocGRJenVqN1ZPR01XZDFpSDhHeUY2?=
 =?utf-8?B?RWRlY2Znd25YcHpwY2g0R1dHUHZnOE91WTdQQXF3MzdpbGV3WkR3SEFrWm83?=
 =?utf-8?B?OE5mNUQ4Q0M3SkNNSFhQWEtST3ZmK2R2T0dpb0tubGJlaCtCQkE3T1VWTktT?=
 =?utf-8?B?Sm12cGVyQlMyYTYrZm45N1oraDdON1ZtYXYxT1BBVEVFV3BYTGphMys1Wm54?=
 =?utf-8?B?TDE1YVdUb2JUSU15a3NxVEdQM0Vwc0gwVEt3ZFBRdXArUFl3bEIzUVB1cGFr?=
 =?utf-8?B?MjcyMjJ6RnFQS2VOd2JrN3RRMldXMUxzQkRuNHR4MnBrWTVYZ3VibE1xVmYr?=
 =?utf-8?B?WWgwUVk3UFQ2Yyt3OFVNVXVRWEFNNWxGcVJOaHpmNFZHYWtZK2owQTV2M3Zz?=
 =?utf-8?B?azBadGZpditrRzA5dHNNdnBMekxYVmxyM2o2Nk15QVBpVGhpTUNRZE40U2xi?=
 =?utf-8?B?TjY2U1JtN3hFYUZMSXZxQ3lkNkRPeTFvdEZVY0x2M2llRjdXYXBmRHYrdFZY?=
 =?utf-8?B?M3VscURYdHlSMjliZmFrdHcveXhkeUNTTXBrVFVTMW9raDlZTGZ4VjVQU1cv?=
 =?utf-8?B?ZkIrcUtMUHIyQzFzQmVUZW41U1c0Um8zT29qU01zSVhJSEhwT2pEWThaWFRu?=
 =?utf-8?B?YUF6cmVsd09MOGp0WWtNQURndi95bDUzNzRIUkZBMDNlN2pGZGo5R2hRUjBp?=
 =?utf-8?B?bWF1NmtBRktWLzhGdHVCWVczVWo2ckw4Z2xKVGpxLzZsVDBJU0hsN3Q4T0Qy?=
 =?utf-8?B?OU9WR0dtdFNmRTJKZkdFak5Ba2ZHbEdJTXR0L3RHSXhsRExVNUVKTG1qMVNP?=
 =?utf-8?B?S29mQStyTVJndCtpaFcrUXF0WnlyNmtkTUpKck1UWjl4ZUQ2REkvVFZqL014?=
 =?utf-8?B?M2xlUFZadTluaEFUSjFMYTYrTmhVZDZINGdnRVNRaFlBWSt6eVZoYnBVQXNZ?=
 =?utf-8?B?TXFLT0h3cC9sMHF3c080NWJvcE9FekQxYkh0WTRNK1oyRzBKYUlKTG5qemdw?=
 =?utf-8?B?UVIyc2diTWtSU0E0SXF6MU1TaDN1SVg5SVF6REJOOVdMaE9lczVQQXNjNjho?=
 =?utf-8?B?ZnZ1azBxckl2eVZ1ekkwZTg2NVNVN3gvMmJzbUMxSjhYUlo0NEpFNzg5eVhh?=
 =?utf-8?B?SW5oODlqYTA1RzB1c29mNkpVaWxUSm8wNllpTk01MCsxaUZMdjAvZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d902fa-b870-4bc2-cc8d-08df19667bfa
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:33:27.1091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cU3IEGzcaNCJ+uOhxQRr2xHnCNsEtdPAIUDF8DMAe8ILGZJYhskCxw+rY7OQd3kc6l2SVdjD7SPM8vP06fD5cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6986



On 9/23/2026 3:51 AM, Frank Li wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, Sep 22, 2026 at 10:29:31PM +0100, Conor Dooley wrote:
>> On Tue, Sep 22, 2026 at 01:35:04PM -0500, Frank Li wrote:
>>> On Tue, Sep 22, 2026 at 06:24:52PM +0100, Conor Dooley wrote:
>>>> On Tue, Sep 22, 2026 at 11:25:30AM -0500, Frank Li wrote:
>>>>> On Tue, Sep 22, 2026 at 10:39:23AM +0100, Conor Dooley wrote:
>>>>>> On Tue, Sep 22, 2026 at 10:38:17AM +0100, Conor Dooley wrote:
>>>>>>> On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
>>>>>>>> On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 9/10/26 17:44, Frank Li wrote:
>>>>>>>>>> On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
>>>>>>>>>>> On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
>>>>>>>>>>>> On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
>>>>>>>>>>>>> On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
>>>>>>>>>>>>>> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
>>>>>>>>>>>>>> IP. Describe them with two boolean properties.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
>>>>>>>>>>>>>> capable design is always IBI capable as well. Both events are reported
>>>>>>>>>>>>>> through the controller interrupt, which is therefore required whenever
>>>>>>>>>>>>>> the capability is present.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>> Changes in V3:
>>>>>>>>>>>>>> - Move in-band-interrupt-capable and hot-join-capable into the common
>>>>>>>>>>>>>>     i3c.yaml schema and drop the xlnx, prefix.
>>>>>>>>>>>>>> - Keep dependencies in the AMD binding.
>>>>>>>>>>>>>> - Update the commit description accordingly.
>>>>>>>>>>>>>> - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
>>>>>>>>>>>>>>     binding [1].
>>>>>>>>>>>>>>     That Acked-by is not carried here: the names lost the vendor prefix
>>>>>>>>>>>>>>     and the definitions moved to i3c.yaml after Frank Li's comment.
>>>>>>>>>>>>>>     [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/
>>>>>>>>>>>>>
>>>>>>>>>>>>> I disagree with Frank. These properties make sense for Xilinx because it
>>>>>>>>>>>>> is an FPGA IP and synthesis options impact this. For other devices, this
>>>>>>>>>>>>> should be determined from the compatible.
>>>>>>>>>>>>> Please revert to how things were done in v2, especially as no rationale
>>>>>>>>>>>>> was provided for why these should be common.
>>>>>>>>>>>>
>>>>>>>>>>>> It is common problems, when IP intergrate by SOC, which may defeature some
>>>>>>>>>>>> part, It is not appeared now just because IBI and HJ have not enabled
>>>>>>>>>>>> widely.
>>>>>>>>>>>>
>>>>>>>>>>>> IBI and HJ is optional features of I3C. Ideally it should be indicated by
>>>>>>>>>>>> some registers. But not all vendor implement provide this CAP registers.
>>>>>>>>>>>>
>>>>>>>>>>>> IBI and HJ depend on some slow clocks, which monitor SDA line change.
>>>>>>>>>>>> Some instances of IP may not have such slow clocks. Some IP's IBI and HJ
>>>>>>>>>>>> use seperate IRQ line, but these irq line may not connect of difference
>>>>>>>>>>>> instances.
>>>>>>>>>>>
>>>>>>>>>>> All of this should be able to be dealt with by appropriate use of
>>>>>>>>>>> specific compatibles.
>>>>>>>>>>
>>>>>>>>>> I understand compatible can cover most cases. Need variance for property.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> like previous SPI vendor customized property, we takes efforts to convert
>>>>>>>>>>>> to common one and also meet back compatiblity problem at convert. I don't
>>>>>>>>>>>> want to do it again. This kind property is most likely as below.
>>>>>>>>>>>
>>>>>>>>>>> What SPI controller specific properties are you talking about here?
>>>>>>>>>>> There are relatively few properties in spi-controller.yaml, and none of
>>>>>>>>>>> them deal with these kinds of capabilities.
>>>>>>>>>>
>>>>>>>>>> num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed, but
>>>>>>>>>> some instances have not route all CS to pad.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> default:  decide by comaptible string or hardware cap
>>>>>>>>>>>> force-disabled: force disable for some reason, like, miss connect irq line
>>>>>>>>>>>> or missed some clock, or IP bugs, or board desgin's some level shift chip
>>>>>>>>>>>> broken IBI/HJ timing requirements.
>>>>>>>>>>>
>>>>>>>>>>> Of these, only the last would be a valid reason for having a property
>>>>>>>>>>> for it. Missing interrupts, clocks or IP bugs should all be dealt with
>>>>>>>>>>> using device specific compatibles.
>>>>>>>>>>> If board wiring causes the breakage, the property may be more
>>>>>>>>>>> appropriate at the i3c device level rather than the controller given
>>>>>>>>>>> that wiring to some devices on the bus may not have the problems?
>>>>>>>>>>
>>>>>>>>>> I3C.yaml is for both master controller and devices now. I3C is bus, which
>>>>>>>>>> connect many devices, if wiring issue, whole bus can't support IBI. And
>>>>>>>>>> if any broken devices happen at address arbitation, whole bus can't support
>>>>>>>>>> IBI.
>>>>>>>>>>
>>>>>>>>>> at beging, I suggest 3 state,
>>>>>>>>>>
>>>>>>>>>> [default, enable, disable], but now I think IBI_broken, HJ_broken is more
>>>>>>>>>> reasonable to disable it, default value should be set by compatible
>>>>>>>>>> string or DCR of I3C regiser.
>>>>>>>>>>
>>>>>>>>>> And some I3C device may be failure to work with IBI even DCR of I3C register
>>>>>>>>>> show it support IBI.
>>>>>>>>>>
>>>>>>>>>> I don't want to appear two similar property between vendor and common, like
>>>>>>>>>> num-cs vs fsl,espi-num-chipselects.
>>>>>>>>>>
>>>>>>>>>> such as IBI-broken can be used for controller and devices case.
>>>>>>>>>>
>>>>>>>>>>> That said, I think that problem should be dealt with when it arises,
>>>>>>>>>>> rather than starting a trend of adding capabilities properties at the
>>>>>>>>>>> controller level when I am not convinced that there's going to be other
>>>>>>>>>>> users in the same vein.
>>>>>>>>>>
>>>>>>>>
>>>>>>>>>> Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
>>>>>>>>>> understand,  logically equial to in-band-interrupt-capable.
>>>>>>>>> Conor: Any update on this one? I think this thread is stuck at this stage.
>>>>>>>>
>>>>>>>> I didn't think there was any need to reply. I took the first sentence of
>>>>>>>> this snippet to be acceptance of what I was saying.
>>>>>>>>
>>>>>>>> If yous desperately want to have a generic property, the negative
>>>>>>>> connotation of the "-broken" is probably better in that it'd be more
>>>>>>>> likely to make people set stuff by compatible rather than have to use a
>>>>>>>> property with that word in it.
>>>>>>>
>>>>>>> That said, technically this platform could be both
>>>>>>> "amd,in-band-interrupt-capable" and "ibi-broken" at the same time, since
>>>>>>> one describes the way the IP has been compiled and the other wiring. I'm
>>>>>>> not entirely sure whether conflating the two is possible? Depends on if
>>>>>>> your IP's programming model changes if the option is enabled even if it
>>>>>>> cannot be used. Not beyond the realms of possibility.
>>>>>>>
>>>>>>> Also, ibi-broken doesn't work for your platform, since the default
>>>>>>> before this patch is no ibi and requiring a property for no ibi would be
>>>>>>> an ABI break.
>>>>>>
>>>>>> The perils of FPGA IP I suppose, and not being quite careful enough to
>>>>>> document all of the relevant options from the start. Been guilty of that
>>>>>> myself.
>>>>>>
>>>>>
>>>>> Check impliment code
>>>>>
>>>>> +       /*
>>>>> +        * The interrupt only carries IBI events, so it is only described for
>>>>> +        * designs synthesized with that feature.
>>>>> +        */
>>>>> +       if (master->ibi_capable) {
>>>>> +               xi3c_master_init_ibi_ops(master);
>>>>> +
>>>>> +               master->irq = platform_get_irq(pdev, 0);
>>>>> +               if (master->irq < 0)
>>>>> +                       return master->irq;
>>>>> +
>>>>> +               ret = devm_request_irq(master->dev, master->irq,
>>>>> +                                      xi3c_master_irq_handler, IRQF_NO_AUTOEN,
>>>>> +                                      dev_name(master->dev), master);
>>>>> +               if (ret)
>>>>> +                       return dev_err_probe(master->dev, ret,
>>>>> +                                            "Failed to request IRQ\n");
>>>>> +       }
>>>>>
>>>>> They can use master->irq is determinate if support IBI.
>>>>
>>>> That seems viable. Where does that leave them for hot join though?
>>>
>>> No reason to keep hj because the difference between HJ and IBI is the
>>> address when address arbitration. If hardware support IBI, it should support
>>> HJ. HJ just use special address 0x2.
>>
>> For this IP, they appear to be controlled by different configuration time
>> parameters, so I don't think conflating the two is the right thing to do
>> here:
>> https://docs.amd.com/r/en-US/pg439-axi-i3c/Configuration-Tab
>> Per this doc, and the original commit, hotjoin configuration is not
>> permitted when ibi is not supported but can be enabled and disabled
>> separately when it is.
> 
> I am not sure why provide such flexiblity, only difference is that compare
> address 2 or other value.
> 
> This feature may be quite common for i3c, if other soft IP provider such
> flexiblity, still common property is the better than vendor specific one.
> 
> Frank

For this AXI I3C IP, IBI and Hot-Join are separate synthesis options,
but Hot-Join is only configurable when IBI Capable is YES.An instance 
can be built with IBI and without Hot-Join; it cannot be built with
Hot-Join and without IBI.

At run time they also stay separate. IBI ACK is CONTROL IBI_EN (bit 3)
with IBI status/IRQ; Hot-Join ACK is CONTROL HOTJOIN_EN (bit 4) with
HJ_STS / its own IRQ mask. Enabling IBI does not enable Hot-Join, so I
do not want to treat "IBI present" as "Hot-Join present" for this
controller.

On using the interrupt line as the IBI capability: that does not work
for this IP. The controller IRQ can be present without IBI or Hot-Join
synthesized. The current driver only uses that IRQ for IBI/Hot-Join and
still polls TX/RX; it has no data-completion IRQ path yet. Presence of
interrupts in DT therefore cannot mean IBI is built in. Probe still
needs an explicit IBI property. Hot-Join still cannot be inferred from
the IRQ.

Thanks,
Shubham

