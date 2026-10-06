Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78D83DC4C2;
	Tue,  6 Oct 2026 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288690; cv=fail; b=qk15EzWWaLAbjwEzCNlhRDm6FofmxJ9fOgD0rKXM8i/Gu6jv17TaDGf78N7m7t/7l/eUs33xOnHgExhkCg2Gy3gw4Jz+aSYNXI9upikQxo5FUtVmq3IfulnL0FqN2CsreEvVSg9/xykfxTCmWL7RdCcw5+f8G+uxQU5wbWlWYBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288690; c=relaxed/simple;
	bh=3XiYDFCEmGTz2ct2RicNdHBroPse4pekI0h+0rO02oo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F/B5DqOxzSfmOya5gYDeWXI3UR6F8B2eXR1cxtDNuOP3n+7FINMQEi3bV9ROws5DZOzw0h8nDtihVb96at2BRlWPDBmaAMIkeMYmr9kc4MQQxdSBXqcOlrQrY66gJpFP4bqz+R1/p1M173w2Vig7lgUT2CS+xHQzUu2csncRsWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gFA9l6Xj; arc=fail smtp.client-ip=52.101.43.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gFA9l6Xj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqcPSm34wee4qynAlCfH7unrWGkAw1XJc/8p5O2s0UDdCFaU2L7PuWObq1AddfFLBXH3Fvipos46ipCHoOt1RNpflBqD7YiDDxFXqtFF9DmZ7IcFhUSNJD/1N19gzzQC8xgQ20UuTb3EzXJ58b48C4lX8FI/WIEMSVPKvpieR7cvvOy88z2Ux3yGIQEghOMZC5rKaDhhmw2wMWDih9z9cflq8l+XO0RHZXvxAF/p1GZSMU5xVkDSgcsjGRrzppz5etMfYlwueN6FUE4UxRJbIe72IpQ6/1Dmi+yMHCbJQJ8joMdXrjkXnwU6tJAch9LYavDNGJ1QjLejo2gD1iFJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxIF0R/8ZQ5hasHegPFbZLbu2+h8V0n9PRjZMTK1PNY=;
 b=Jgq1VwlCzK62tgK5JcFgONwApigWY5SOsW+zyIG/W/CdhMjlNW3xUtp7GM60hjQQpIy/6efKwR+VFAN60rutxrg0RD7omZrUSNcDIdReVWSihy5MDIZqLVlWtlt8EkfQ39SejFgFMKjyC86W0IioEouv2GIFtEL4iuodYU/FIzawXU863Bd9DQbp4y50//a7YSnJ+V11GM6HU5EmDhhYgZPRYqy9QGm7tQHBUJM1iqT40NdIZT8u6vJqsw3J4QLAZJGxOq9U5IKqiHSEEv9yTqzTrmp9OBMa17wFKACyzjGYPNdNiH+iY70tXSNDXTtT04SRpfEN7mDwAaJ6hESSvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxIF0R/8ZQ5hasHegPFbZLbu2+h8V0n9PRjZMTK1PNY=;
 b=gFA9l6XjFJFmFCupy10vWCodLo2kEuhhmgCyX5+wdRiQrdSWZuYLRsErRVKtWFxU7rPtj0DaBwP7KOgsV1G03ZDJ2IShc88N/dzbg2qs4478u9IfuGjOMBvmzYPqF4jMEyOvjPVU7xWA116UjpR2Ih4uusNHlH3LJ11ztthrKjU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:11:24 +0000
Received: from BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::8e9c:2f3d:9679:942e]) by BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::8e9c:2f3d:9679:942e%5]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 12:11:24 +0000
Message-ID: <0dc0c5e1-0709-4b87-b4c8-b2fe8b6f006f@amd.com>
Date: Tue, 6 Oct 2026 17:41:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] soundwire: stream: allow flagged BPT firmware
 download while streams are idle
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org
Cc: broonie@kernel.org, Sunil-kumar.Dommati@amd.com,
 vijendar.mukunda@amd.com, Mario.Limonciello@amd.com,
 venkataprasad.potturu@amd.com, yung-chuan.liao@linux.intel.com,
 anson.tsao@amd.com,
 "open list:SOUNDWIRE SUBSYSTEM" <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261005091620.1390916-1-syed.sabakareem@amd.com>
 <20261005091620.1390916-4-syed.sabakareem@amd.com>
 <fe936feb-b6bf-4d78-8cb3-d9ea61707a23@linux.dev>
Content-Language: en-US
From: Syed Saba Kareem <syed.sabakareem@amd.com>
In-Reply-To: <fe936feb-b6bf-4d78-8cb3-d9ea61707a23@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::15) To BN9PR12MB5356.namprd12.prod.outlook.com
 (2603:10b6:408:105::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5356:EE_|DM6PR12MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: c32cfaca-4cdf-427a-0590-08df23a2f0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yiEm+Z49Gjj/HX+DSrNUcZcW02HlcjCamNNCgIBz/sY3Rd+4S+COtl65DDUfK+hVP/gxKqGlSQ2BuGKITcipLqs77R5q+VZPIaRivph/sbwa2a4ZHQHCwCYOM5Naqn0x6b4f765fJjdXRIdZtY0fQ78YibrbMZ/Uc6XFHgNJ8LJa+nUkBwn7mPMYLZWiDlsbqC1ujxF3Ssa3AXN+G2UBXA7qWfhIZyJhBFldFs3k6DSdidSA1TlTPvwUDTSeL1/xh88mMcGDKuBXoE1bkkRTkDCFAknwLeG9e34IsansFHNujg65HhAJ14LV2jVL/u5QGNO6tJHr1ruehjW1GqdSvjDkbcWp60dEXn0DSfKDRCcg68UFvgVjnllt2o7xOr4ONo5loc5VQzQoylfXRXagKZf+SxwP+J/mx93QE5gb8srKPq5Wn95y6suVt0PZaC80ToRtyGvKBgqKGfAw5a5NqSjODJMZK5LxlDuJ9eB2D2CqsKPkLFANt4336SVuD/4N3fVQKYvQ61c5EVLXHqUiJmFlOvzknqsYE0nqpOTDL5SHirSglC41uorh+GWVKRdpVgbZZ79mQl1ddns3z5YcUvK9rFfg3AdXUoPKqEdy+ZtRrGZsrjXh9BDRBZdvpog63UszyxMf7hDSGLhLeajFeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEkzcmtvWnQ1aWF6WUZjNnY2N0E0Q1JMQUxkUDN1V2NSUVh4dDZob0hxVHg0?=
 =?utf-8?B?eHo5YlRNbTNhMTZrK0t0M2o2VjVOM0ViNDB3RWZyRzdydk9jM2swMC9JOVow?=
 =?utf-8?B?d0IwL1cxb0VuV1dvampRVEgvWDdEWEgzeVc4MElON3pZWHRRUU4zUHpEM1pT?=
 =?utf-8?B?eE1WRWdtdmtNbnpQL1dHcklJOUYwUFZQbmNUcmMwY1JQdis5OU1HcVhreTFX?=
 =?utf-8?B?dWdLVDh3dFpHOHB2Znp0UzIzTm1FNW5Hc2tDSk1xbnVGYzhJUUQyTEt1aXVI?=
 =?utf-8?B?amw4cklGdGUwSUhiVjFkZWd2b2dCSnIrWFdqcmN1T3lQaDR5ZlNVdVNwY2dr?=
 =?utf-8?B?NUZ0VkNzRkdoRkhhRWVYbUV5UkVZTDF6MkRkYy9JVlRzS3NQWFNLV1ZBQ0Fk?=
 =?utf-8?B?NUJQTmx4ZmsyV3U2dExMUlpCTmd2c1Z5V3pkL09YT2NQRlBHREhRNW8yS1BS?=
 =?utf-8?B?SHNTL09UaHl3QXFPSWRRUGlQMDlPcUMzMVlLcDJ5TFVnRFM5NEZKUnNlZVZG?=
 =?utf-8?B?RitjWlVMNlUvUFVzRGkyYTZRWk14K1FMc0kzbCs0U0V1NmhlOUxWOVpmUVkr?=
 =?utf-8?B?L05WeDYwVWMvdkFua0psWjdMamlobDNDdWV5NzRFVFJham1ucnE4ZU1vbHdT?=
 =?utf-8?B?eEJVYjJ0Y2VpK0g5TzJpSEdMLzNydkhsL2xGMHpQOUpNOXoweEF1b1A4SC9E?=
 =?utf-8?B?SWJ4SmE2M21pamNpUVE5a2gxM2NVeWd5UGxQdzZ1MUVITHgvdkM4akpEOUJN?=
 =?utf-8?B?bExzQzBtNjRzMEhUVHFjTldEN2orNzlHYVRETk9qU00wQ2JSeCtjUFBzVFk4?=
 =?utf-8?B?NU9Fc0tBQkZSYXVUVWZPYThvTFZ1SWRjTUpUUklWKzJvUWtRdGFlL3owMklG?=
 =?utf-8?B?c25ZNGZZQmhsMnY3UTRKMEdwUDNsTTFSOTZMQjdlWUlSNXpMajhranNnaUhS?=
 =?utf-8?B?SVZteUF4alQvNXQwci9IcXBPaWRlSTdyTjhsTTdrVk9TbGhlMHlOZzlFeGZv?=
 =?utf-8?B?NFc0ckRjL1hFV2xoV0FVYVBkK1NqUzVUL3dkbmVOazIxRmhMdzhjZDBEWFNS?=
 =?utf-8?B?UlIrMTZWay9tbVZ5L0lLK3JVcW84UUluY1Y0QWQ3Rm1yTlJMWVlBYmtkMzhz?=
 =?utf-8?B?aVlNVG1VNnhRV3g0T1gxbmpMSWR4VS90K2NKYU8vMmFXTWdCY1BFVndtdGxJ?=
 =?utf-8?B?MnZqM2lEa3dmM0Vzb3NXbnFMQitPNFNhMmdzOWUzS3BWNVNTN0RKNmpCa0VY?=
 =?utf-8?B?N0p6V2p6enF3ejhmTTg2MzhjU3FoZ2E3VUh6WmJuamQ1UUlCOEptL0RwekIv?=
 =?utf-8?B?bDU1Sk5oSHdvM2FjMGpvTlVsdGVUZmErRDdtZWZuSlNkeUovY21FdGJnS1lQ?=
 =?utf-8?B?OGVOUzhQblRnTlg0RXUrVlFhRFZqRkE0MklqRXFEVkdTQVlZbWRaNlRLenZ4?=
 =?utf-8?B?V2ZpMHkrbC9xNG0rS0JNbUw1eVZlamRHcSt6bGhwUzlPSmMvb2ovQ29XV25l?=
 =?utf-8?B?UEdFbFpiTm81Q2g0SmZCdnl5bnlFcHB2cGw3eEpqQ0xjMW9pS3JmeVJZR1Mx?=
 =?utf-8?B?ZUo4T0VSd3orNXR3cnBLL29PNTJOWWJOSkVKa2MweEkwelZIK0UvN212NTBX?=
 =?utf-8?B?SzRSSmsrNWIxTE5ubnQ3REZ2TE1zam9KZTIvbTMxdmRJOHFGdE80TTlPRW1S?=
 =?utf-8?B?cmRzZ1pUbWN6bk1GZkY4TTRqaW5HbDNpckpUM1llZEowRnhoZHB4dkp0RXRa?=
 =?utf-8?B?WlljTFZUN0ptNEp6WWowREorYkU2UVphRVZtMmdvTHdvVStlandzRlJaZDdj?=
 =?utf-8?B?cDhsOVFuVnZoc1k0TnVCN25iU3A3cmsrNTUvK3ZwNEoyeWJBVEMydXNPTVFE?=
 =?utf-8?B?V2JkU2hLVnA4UDdJeTFCWFB0LzNsaDQ2aC9lUjdpWWxMZU9oS1JMeFFUZ2dm?=
 =?utf-8?B?NGVDOFVJZHpjR0Y0eUdNTUx6MlBuVWkrekhVNFJYaHYzeDR1N0pyaENYWXFu?=
 =?utf-8?B?THJNMzhjWGJ1QzhtRHVuZ1lLNWFFdlVtKzRTMlFiRDg5NXlHeGxRSjdlMjFJ?=
 =?utf-8?B?SGxKa3MvUXFYaXg2YnY1a2owU0RxcXpXc1BWYVBJZ1pUa3ZXQ2lCeTlDb2ph?=
 =?utf-8?B?bTU1bUxNU09YUWVYUWxtMHZGeVY1YXA0OENWL2U0Qlp5N29rMGRQODZSa2pi?=
 =?utf-8?B?ODdtNjR4U0k2UVZtM2VqUVhMZjQxcVhqUzgvd2E5RXh3K0VQLzJkNlNVMGNn?=
 =?utf-8?B?aWtrVFV1ai8zVjlJakNQazFDY1NXd255VnRrVTYyR0dtQXVVU210WmRyL04r?=
 =?utf-8?B?TkVzbFBsbENLeXlIeXVGMm9yeHpZZGpsWFFEV3ZzWE0xUVhFSVlZdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32cfaca-4cdf-427a-0590-08df23a2f0cf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:11:24.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZyq3MXKG+kS6eplvrJrKTdwa5iHZEKzrS76YvBHzfmCKEdZmtAfOWKCSj/sEK8jGY9WHUGsuzrYPyVQ/wl2Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203


On 10/5/26 16:56, Pierre-Louis Bossart wrote:
>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index f710e5932b4b..9a3904f42078 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -1005,6 +1005,19 @@ struct sdw_stream_runtime {
>>    * @bpt_stream_refcount: number of BTP streams currently using this bus (should
>>    * be zero or one, multiple streams per link is not supported).
>>    * @bpt_stream: pointer stored to handle BTP streams.
>> + * @bpt_fw_download: set by a BPT-capable manager to flag a resume-time firmware
>> + * download (BPT/BRA). BPT and active audio are mutually exclusive on the bus;
>> + * this flag marks the one narrow exception -- a power-off-mode resume where the
>> + * codec must re-download firmware over BPT before its stream (left DISABLED
>> + * across suspend) is re-enabled. The manager guarantees no audio stream is made
>> + * active on the bus for the duration, so sdw_master_rt_alloc() permits the BPT
>> + * allocation even when idle audio streams are still allocated; an actively
>> + * streaming audio stream (PREPARED/ENABLED) still blocks BPT. It is not a
>> + * mechanism for running audio concurrently with a download. Written with
>> + * WRITE_ONCE() by the manager before it enters the stream allocation path and
>> + * cleared (also WRITE_ONCE()) after the transfer; read with READ_ONCE() in
>> + * sdw_master_rt_alloc() under bus_lock. Single-BPT exclusivity
>> + * (bpt_stream_refcount) means no concurrent writer races the lock-protected read.
>>    * @ops: Master callback ops
>>    * @port_ops: Master port callback ops
>>    * @prop: Master properties
>> @@ -1045,6 +1058,7 @@ struct sdw_bus {
>>   	int stream_refcount;
>>   	int bpt_stream_refcount;
>>   	struct sdw_stream_runtime *bpt_stream;
>> +	bool bpt_fw_download;
> nit-pick: I would add this one line above to leave pointers and
> structures grouped, this would be nicer in terms of alignment.
Good point, will refactor in v4 — bpt_fw_download now sits with the 
scalar fields above the bpt_stream pointer, and I moved its kernel-doc 
entry to match the new field order.
>>   	const struct sdw_master_ops *ops;
>>   	const struct sdw_master_port_ops *port_ops;
>>   	struct sdw_master_prop prop;
