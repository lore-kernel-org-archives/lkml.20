Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.115
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794581566;
	b=lqLMCrtqxyo5tx2AKE5lBZl90MfXeDAehCmSZV0u5Uvh+s/ZHCGwyjLXF/RO85uixl7d
	 E+swYZ7n//iWK2O5zvFI10g0QZz2LI6UDr8wJiKQMO5Nyg7dV/3QMq+fl9c0+uVC3i7iF
	 T2ahEiqW9d+hedvCEesk3H35cd9nWjhB47E6CnrRbf/+7bp9mM/6H+CEM+R7mKQbsdGpa
	 e9w7qczRzFWLRinxJF4vBL6Dv2P0yg1NZ/qy3yOyZ0xf1jMlLQEjyGS8BjhInfRKB/WS0
	 lNeGnPGj/l6mPRt1J9XXL/45MlANClxnlYPHbCync7PoUdMfoBQUKgRVpZ+sz3qzGzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581566;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
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
	bh=g0QwBnmmZ+kU4UhAVE8puaAmGDWEskaD+4oXiSvyBxE=;
	b=RRvL+FgF3AFG2vfHbyNUslqhlG5nlfJavBBStZDrDNggip7YTZcqg/DEXE9oPgrNAJ/E
	 4EbO81b1K39PKeE4dE8n9rFxBgeKmZ5A9QBE2sMspDHkD4dBknuTSyNhLxTWdcL2sOv3g
	 wVF/iDl6HywybaJp/wc47Avr6ZgiIRbC/DZ1fbI0U0lmzc//G7+8asEUjiVkU/QJu+3bv
	 QyzpG+fmjczPE+6/SQDnXcPK70cNkI30j5Z2pe8ajD3wEDh7oiFjBa24BE60UmRHncsKs
	 LZgBsp8GBVWXo1B2lFJ9pucqf0WEXd3RmNWMmsxeyNTMMgabXChfLhq1kE+erp1XzmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=nToJWI0c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.115
Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020115.outbound.protection.outlook.com [52.101.191.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96B1606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C96B1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=nToJWI0c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8WWs1gxVIy5XkjbMLnehtJrmKFHNC2pIj7r9j6f8UTC148pbTNUJJaesss4fU+q9r1qiqepbmbHRyhHPI+5dS9cRVZ5DYIWhT8abro4yt460cuOKy1DS+sDnY+L8eWmqBr25qC7ej5//zbk4QEa48Rz9vkmKhc2TE2YaBgCE7ApneHtUNir0D22skuRBfGmG5i4m5DQIYFt86alOAv7WH0l6ih+by53rkuzxowA8s38hYmo8F1u/YYGRZIwINIrvfLodtpn5dZS+Shoa1K9TBMU9GrtkCzUv5cD7+vE1wGbQ+kbf37exiWN0FXBLMSyRQL/bn3MZxNHM/3blW0EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0QwBnmmZ+kU4UhAVE8puaAmGDWEskaD+4oXiSvyBxE=;
 b=YmZehmdb18udSOP0PKDofuhezjrch+M9NsiWiWx3yfbEvHLyinq4qPsgfqOkNNPVLUKygACBu10Z0jK2fnsvzLvlLdXN59h4igbkNATdTSVErAreUk508BXebb83oLV9BNM4OoGB8cnClIn6BHu4S2SvmTB+AwzSFwivlTaqdgSKfGdPXHhHaKo37zlvElFfRnKVFfOiefg4nhzeTxXPU4ZeAKqH+FwvNVx7gmHZWP5qO2NMvekcWztC1Y7VIPDNwAFQJo8TEYRCa01zRaMNCHgjhqIqB2I8kLYwlE7T5fXahlA7YubLLJiNFGLz/1hqCmg9pQDhElnu+8oMa/WoUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0QwBnmmZ+kU4UhAVE8puaAmGDWEskaD+4oXiSvyBxE=;
 b=nToJWI0cwvytRHjWddgdlGykU98c/ezxt1Vvxb8yjwlOIFxLTo+eb0nb4Mab71OdbYB5VllyHup06dqELmIiKJjZHr8i7fnAAeX0MJDZvwOeTvKQKcBZXfrbBPRBQ3iYJjXUtufeueDhvshiwp3MeJxeqCtkgmN4j0FPspzef2EvrJq+x1Z8F9vfFn4AQ0vayVggxHwdPdLZ18wUem2/AKgEX3BDVvL01NVf5BSj23vwxsGQJPwHvIeDoe+UmsRnnz0lCV3pW96uEmmvg9b95dWO8ne+FzQbX1TFbxbke8UDP1KMSsfXOLguqtpae43hS+CKZQ68zi7hf5r6LNa5kA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YT4PR01MB9752.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:e6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Fri, 13 Nov
 2026 14:52:41 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 14:52:41 +0000
Message-ID: <7b3aa2f3-aeae-45f9-a8a8-8d8b56fed90d@efficios.com>
Date: Fri, 13 Nov 2026 09:52:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/mmcid: Bound the CID allocation busy wait
To: Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
References: <20260918013454.1850369-1-xujiakai24@mails.ucas.ac.cn>
 <20260918104349.GL776954@noisy.programming.kicks-ass.net>
 <877bjiem45.ffs@fw13> <87mrs8bhp4.ffs@fw13>
 <bd4c03e6-7ea6-4a21-9a3e-74ea9d36fe17@efficios.com> <87eccossye.ffs@fw13>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <87eccossye.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::33) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YT4PR01MB9752:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc1b4eb-ab04-48a7-bd6a-08df4195c476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	1G+6kXqi1LAtmNjHi/TA09HmumFpymgv0aT4CX+epluIIxVdwr8arGvrd1UgeIp5r2L6/48ddYprNkgZHRZKA61JUxYT13uY90KH2WduZoVM39xB+kmXe+3tKJLbnu/Is7C+0S4FJzelsgP69jB8pumtWnnenznEavCp+N58meXzh2ldueQJoPWV13Q0Vbb++yEIO2Xi2hKhJYzK0QKKYIbC5zVcoBVMtXHX0Ubf/cj/xvFcKK84b1ndAqRNpDkwVa5HJxSHEiArJbjpspkX1+8s4r3MjAoMrCXKwBxnZWtM3b8CoTFdkB63YdB9Zu31zb1EJopBy4uWu1+4bS6/aayyn9+5U1hkUUSDEY4xhgrhwx3EkRrJT77idmGM0ZCjoOXa3PgG6grzHnvz2yopaJ7yiI7NFj3WC1KqcNARVzH2MewAuSCHPCVFwtUSseXJnos/3vMWUiJ4De/ASpNGAqF0re2heZ/NUCfMh4Bs928VrEunfN67JYK9rCBDtH0tXD4e9Rd9uC4PwKcdtmoPThtZLD+1DlEGVcEtVtOyX9HZKuCuykGTZH0IM/77+jzE53PpMa6imtW+TFUFzC3iczBNA5wBbLbZ0MjkQ+hxWqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDdxVmI4K0wzQmR0M2tEWXFUU3h3eHRBdmV6eDVtYnZycEV4bkJZWjh4WnRl?=
 =?utf-8?B?OFdndUc4S08rOVpqc2xHQ0xwTDcrU01lNzRha05URk1OUWVPeDdvTDgvbDFF?=
 =?utf-8?B?TG9aVGZXVlI1Vmt4ZmRxU2VtS1ROWHRUUitSZzVqcTJtQjV1Z2RGWExjOVBo?=
 =?utf-8?B?TW93WjNLKzA2eXh2QWU5dFBpRGNqVktaeVBXYTdReC9uaWE2bmtSZk1RV0E0?=
 =?utf-8?B?ZFdjY3VHODRMQ0ExS0JvZlphU0FjZW5CeXZTQ2RsZmJVRFN3ZlNDNGhiRjND?=
 =?utf-8?B?QTZXRXRnRkxJaU41NnN5RDdEa2UrNlVpRkdhUVhJenNmaUNHanNiYVBGbkZK?=
 =?utf-8?B?L092eWtxUmNnVm4zT09rM2Z6V0Z0a2lvQXZ0WTFSd1BjNXVZeTB0SkkrUXpQ?=
 =?utf-8?B?QTJxN2RrU0kxYmUvTnJUUE9vY2h4UXY3dFRZTytPSllielNMZGhWa3YxZlJs?=
 =?utf-8?B?dTFGNGttV1gzOEE4UjN0USsraFcramJ2K0lHZWNPSk1iWHptRWttbVZWWStz?=
 =?utf-8?B?SlBIbWF4SUlOUVlIZk9OUGIrOE5IT1Y2eUcwZER5bGdialVOcUFYVU5tWEUy?=
 =?utf-8?B?eUhHUE0rUDA1aURoSEJRT1JyS1REdis3Y3Jyam1vUEk3VUlQbGo4MG94MDVD?=
 =?utf-8?B?eml3VG1aVXZ2OGl4T2VtbWNxZW5sTnZldlFOeWpkcTNwRk9RUFo5OWljdE9U?=
 =?utf-8?B?MGZYeFp2RFVoYUtXbEtYcFc3b01mN0RyL0tJZnFxeDhlZTZiSGtYam5XM3BV?=
 =?utf-8?B?TVl5Z2FHczRiakQwbW9kOTNxbTE4VVNwcjRXVGI0NUNEc2NQSElxd3BhbWox?=
 =?utf-8?B?YnRBdjdDSUk4OTd3dEo4NGdHTnV2YnZNWGN3dmsvMk5nK0pseFdNcHpmWTFi?=
 =?utf-8?B?ZlJ5UWp4R09qNWpwOUFkUzZFcVpvWDlaZkFTMHRGa1ZqSlBLTGV0YVN1d0Ir?=
 =?utf-8?B?S1VTY3RsSDNHUTBKQjNTWEI4dmxhOEp6a0MzQUJ2dERMRzlySitwVnc3YTVx?=
 =?utf-8?B?b09yU1QrN0ZZd0NKTHhiVTdGQXc0VUVyQ2s4Sy9yWFRjaUY2NU1xRmVxSGtR?=
 =?utf-8?B?TkdSdlZ2MTNKVUU4VnBXUHVrVUUxUWIrajhMZ3prR2ZEL1pScW5FMXk2ZHhC?=
 =?utf-8?B?V2FwTHhOWXNTeWxKVXhRanZDaC93NzNJRVY4aUhFWnpMM1U5TXM2Y202RjVT?=
 =?utf-8?B?TzFjeVdpRFBIeFlzbU9JUTRlOWt1MXFQbFlJbVdoaFFScEVWNEpCTkxYWlo1?=
 =?utf-8?B?R0xZMHZhVFpPZjNPT2pBVkxKaU9LQ1dwYXl4YjJZTmU5V2M5MVBLaWJtU3hX?=
 =?utf-8?B?ZnQzYzBhYmVxdmdaQnhURXNLdGFESjNVVHRzQzJBNi9EMk1DOE5KaW1VRjMr?=
 =?utf-8?B?V2JmSTJib3JMSHhlYmV3Si9WTWFVcGxDQ3h1alRtdTJHTUhEc09UazdmcWJv?=
 =?utf-8?B?d1FEZ2pTTDBVcnR1WklYQjBZeEFYS3RuMkhmWW9YMEx4UnVmOHVLajkxekEr?=
 =?utf-8?B?Zm14bGZ0RCtzR082Z01zYXJKOC9TV096MmVmbmRwL1pDaWxGSFpzc1crQXFa?=
 =?utf-8?B?Q2xvTzN3Vyt1NlV4clpSTU5hOHFBL1BtK1plbFpkNEIxOWxOcFhjaUVCbFRi?=
 =?utf-8?B?MG5GM3g0MllKdGpTTHFPd01JL3hTMmVLZ1MydEJCdG5YMWRWUlNmaDBKWmoy?=
 =?utf-8?B?SytNRW9XUDRVNTdXcFBacStyZkpZWlRMQTdKZC9LcFVONVdsSXBwYnlaSHVn?=
 =?utf-8?B?bDY0cG4wRFU2SXdwWVNIZmYrSTZ2LzBGd0RkcmcwZE5kdDQ4S2poRnJVOGdS?=
 =?utf-8?B?NEllQll5TUY5Y2o2eVR3WWpkMFlsV2NSQktZbU9pOWdXWTIrL05LbnBmcHM5?=
 =?utf-8?B?empvOW5KSE1uMHhrdGdoVmFicEVzWEE0WG1SbjBGV21IYjNJdStwSWVDc29I?=
 =?utf-8?B?N3I4NDlOK3BJY0xxQ1FhQ0tlRkZNZ0dGSTVDckYrd1U4RG1DNzFqMzJoWmQw?=
 =?utf-8?B?MXhjTTJacVVnUVJZZVV3M0lObEg1a3FUV2JQa2dEK3dhS0hYaHFkWFI3ejdM?=
 =?utf-8?B?Z3pFOHEyU2ZMalFnaEpBUC9kYWpONWRMY0RXVmFRVWlhWGRwVmtKcTE5MXRw?=
 =?utf-8?B?U2F4blRadkhMbWZ2d0JPd3NhanlCdFJDYk9CKzAwRkR2bjN6ZTkyTDgyV0pj?=
 =?utf-8?B?ajl2cHpUbzhkUUtYRWlSZHNxWHJDN0ROUTE2SlpYMnZBUTF2ZDFXOXJHREds?=
 =?utf-8?B?Z2pQK2Y4VCt3ZjR5cGhYNFBIWnRjUUdaZCtKNGtlM1N1cmtYSW5yZkg0RHdG?=
 =?utf-8?B?MjJyMStVVUN2ZC81a3NVWVdGcUkwUVRiTlFlazJta2ZJdUhiTGJvRzNZZUYx?=
 =?utf-8?Q?V/iTtjvLE+L2l/f3FWZD3ID7k8T+fhhRYEy3P?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc1b4eb-ab04-48a7-bd6a-08df4195c476
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 14:52:41.2810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxRoHDYs5z6MeyfpC0A4c8mGrmxAIIGh4qRJsKEngt27ABxhYs4CvMTi/+oXCVTyihvaXO1cUTPNH0sZRqKGkcYnyhBXIWkfHdsrDHyJzLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT4PR01MB9752

On 2026-11-13 09:32, Thomas Gleixner wrote:
> On Wed, Nov 11 2026 at 20:48, Mathieu Desnoyers wrote:
>> On Tue, Oct 20 2026 at 15:54, Thomas Gleixner wrote:
>> I have a reproducer for a lockup that starts from the stale state you
>> describe. It needs two more things: the execve() fails, and the task is
>> moved to another CPU during that execve().
> 
> That has been reported already privately to me and a few others and the
> reporter provided a similar patch as you.
> 
> While both variants seem simpler, I prefer the explicit
> re-initialization for the failed exec() case.
> 
> It's a NOOP for newly initialized MMs and avoids the pointless fixup
> dance for the last user in the common case.
I integrated your approach, tested it and wrote a commit message for
it. My reproducer passes with it, and so do my other mm_cid tests, on
guests with 2 to 64 CPUs.

Do you want to take care of it yourself, or should I route it through
an mm_cid fixes series I am preparing? If you want me to pick it up, I
need your Signed-off-by.

The series has four other fixes of mine, selftests for them, and
Weiming Shi's teardown fix.

One of those four was found by a Spin model of the per task / per CPU
state machine. I then confirmed it on a real kernel, with delays
inserted by hand in the window. The model is not part of the series. I
can send it if you want to look at it.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
