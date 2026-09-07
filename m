Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E3F3FCB32
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765389; cv=fail; b=GXlEcnpCeQteUXuaIC6GiGLQJZCRfCnml7izMCV4AurBCNo0BYiVAg4t47xv5CySVyHAnP8BY9u9tOCleO9k431xbvLeYamZc1uAlYviHR/wquE9ZjCdGSnJ/4wEYWrTfZf1y9QOCPWeEcrkAVoj94VqyqhGQ5F1/xEKmvTsUZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765389; c=relaxed/simple;
	bh=xN31u6X0JbzkP1TnMckHp+O5kuBITu38Fe8kg7pJEXY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LIp5o20lm1+y0NLjgzxdqZzlyvjKYkZKLnwP9SWhv2tXSU9kezUr/ICua+tKlIFBjw2p7bovf+Wiwfw/JFEVF5f0aaFwCs0fZ8IWXWq8H7tOKQ2nz9grmFokuYn1Qvceab2Z8/cHFaTJKSez8QmoO0AH7WIWRQqtxYJtc9zATRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=laDxJz+j; arc=fail smtp.client-ip=52.101.62.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="laDxJz+j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cm7rf6O+SQnjCa72VWqA8j85isuyfywJ4568LNXHwWBwJ4ArRH6TaO/DHSRy9fOVAIV7hv6anM2kaNMJcxTyFAs2ukCD3euy5yHjisfZLq3Ip/HQsLHp01wzHcpljjS/l83p3rueXwXq1SQtS8owdD1VaSWcDXXyL9+8DW9CiCqoO3O9JKRhqLz2g48EvyGqpWEbi9+NFokiBg9nFbnxyhNuzzSN/PEmC6dzBtjy5yZ70T8dGtJQp1r6jS5lbm5edBv/kZ3KUzLyDDKpA8t4bVs7Em3Uxdn0a/Z81sgFzQHclMSmZssXhrUAQZoknxWKEUs1YhBBFsYHZmcVQ2xmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4PlIp8Blt5csQ+a8zXFR/kBlQCwrju1xHblakGDyTw=;
 b=j2ADqoJ+1SwyTpPWX1E+4aZae6nQvlynx/Zver0roFYRVVPG4Zl1pNG+XlGoJA+qrbsdPpWX55nybIqC/jTVaeJ5lrXFxWpy7V/FaWUeV2AK45/WxUyPVe6zPRcOBw/D3arGnhcrEpdUM6qWuZhUqwtLX43CK/FTeUX5tDFhRniRJmqL7L+sJJZfxyTUVQZFHXnaPOE8vG1lxkGOsprrjVQMBgjSE2gslgl/URX/8Ky7zUZYrlzGREPD0PNf7aXLbAUh1lc2pqHIIHhlicV4iJ5pqi4pXWzl3rbZ9CIBB4VApoOfZdxR/GINi2xNTJKstAQ81lf2NY2C/tq0gQo3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4PlIp8Blt5csQ+a8zXFR/kBlQCwrju1xHblakGDyTw=;
 b=laDxJz+j65Awy+sFOwzvL4Sws/e4Fv2iSaqc3/NEweVIbSGByeqHGcvQNns0gR3xbNjjLEZg11LRuSlnpNNmeYeIFBcD5PVNHg9s7r8xhpqek9MiFmQU3yk7Bo7+Vb3z2K+pqH+NmrAeDUGsC3eFM8evwV1RZ8kofbNr5KgpVLupTiMSlhfh5POoacNycCZ7N9NP+yP8yNUSyFrAkHgvjs1Pudar+/NsxboZADnph/k8Y2tZTTFyc6xeL6g2WzsO9KWQDLy4PHdqTSsVo9n14OeR9idrnmMMhPsD1BAPdcR/u/F+xYm3xoZUjuOJOGkNIf68vqKfQFJR/Ogk2rBGiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA6PR03MB7879.namprd03.prod.outlook.com (2603:10b6:806:431::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 07:16:20 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 07:16:20 +0000
Message-ID: <11d9b59b-4cdd-4aa2-8f69-5751d3550abf@altera.com>
Date: Mon, 7 Sep 2026 15:16:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] firmware: stratix10-svc: add PSCI secondary CPU
 offline on warm reboot for agilex and stratix10
To: Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org
References: <98ce724c07946338bb0a6ffa7d2b204a93a7a6fe.1788452660.git.adrian.ho.yin.ng@altera.com>
 <e153dbfc-e1ff-4811-a470-e547b6c5c7be@kernel.org>
Content-Language: en-US
From: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <e153dbfc-e1ff-4811-a470-e547b6c5c7be@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:295::18) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA6PR03MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a883ab9-c91f-4b38-7242-08df0cafea59
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|6133799003|55112099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	byYN/nbjgoQUwthGBklfVSTCut5GtJ9uTQBgAa+lfaRdrHSPIydif1CTOYJZiGepN7+M8Ir3de3EXH5NWUxrd+w+zruxhpUnQ9Xe/QrLmBzGZFF7VmqS6DidPlsLzGaiYSGEnNkeNqUGFnGu1f0D1L/1aikMbb38mDWfmDimuO4kUhJXewhTe7FAb2xS6/guZ/RUGm9uApqOdqrsPBL0tXjGhpN1bthWBB8h4353F0ko2T2vYmLNq5hb9gRCdpC8HncJItmxeKrd11651hmC2c0T3J8OobhsIBl98+2EWcwIeLtxrp2uwmxCOoPljJ4rp8BFJ0zmqI+KIAr8UZbt2CtNa1tTj8/ljgbVdHvpjwbttXrsEQAgQvmcVLFGrHjU69vEmhpOIW1caKqOqyXv+5k+MXuH7jCSo5SMzEh2VqiupXS/8PPFVDcCTUAASgCf/YKZQELF8L0cgx+y6HDqUlFEL0GvGCYXwdSMgIHurGwjH1DlUyrFCARpUJDHzMZgMK4hoLAPAyZtG2zUiRb0AaXVNo02fHPMFmvKBNIQDKdRknuE1i446dkb1UtyQ89CGNvZKWWOkDQqnwaN5tjtPbOWrB+ooebQonYtLgDNJJQxhGtQjML61GgxYmfJZca5lgG7rgW8zVolD0jwl8l3aK7GAERh9inP0QFDNe8THKQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(6133799003)(55112099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGpTWlltMTU3aStyWVJYWFZzTkliR253UkFkRGNXcjhOOUV3RDQwYjYrVitJ?=
 =?utf-8?B?L3lLME5SYytDbHdKOW5nVzFxaEpwVDlkRkFsd25vZzhYc0llcmF3NVVEMVd3?=
 =?utf-8?B?UytCektYODVQRklpMk9JalpQdlN2RXY4SkRab2EyQ3M1Q2gvVHlwd1VuNDRz?=
 =?utf-8?B?QkZhMDNmMkJhdVhwaXNreCs1eUtwSGN6WUpRVFFSQ3gwVmxNa085Yi80RUNr?=
 =?utf-8?B?Q2hVL0dFaGQ2c2VRWlB6cGk3ZHZoK3dMTnR5cExpdHRWOFN6ano3VDJTVHoy?=
 =?utf-8?B?cjhQVlZmSDNQU3AzZVUrb3RRZUxYTnNXSkF6dFlDdnNoRXZlLzV1MzNZQVI3?=
 =?utf-8?B?VU0yZytzcmlEOEh6WG1wM2doeTJxVUJ6UXBGUkVWV05YMHNTbDlqdHNseHUz?=
 =?utf-8?B?YnhFTHVLNStyMnJpa051SS9OL050U1pHdWZ6bVdiUElhWm1iRmUvRUYxekp3?=
 =?utf-8?B?cFkyNDhHKzFCWE5DK1BXWTVwQU1ZN2RObHA0MzBxSVYzMVRhd1V4dGpGamZn?=
 =?utf-8?B?dkxOU015VnZrcG8wTEp2cFdsaFAvUVdyWlZPbCs5Zk1BTE5BV1RaakM3RkQv?=
 =?utf-8?B?Z3ZOY0VnWXBoV0k0WXA0YmUxelBYUHNzK1ZwaUVEaWJpUjBneG1sS3JrQ1Bz?=
 =?utf-8?B?emNDMmMyeWNxa1UwYWIxSEdIM3p6dWpBSThlTTA3dURjVko4QjNhcVg2Qmln?=
 =?utf-8?B?Ulp1aFU1THhyNFNqY2l1WG9pSmpVRWhLaEtTLzdqQzc2OU14REJpdklLV0Zn?=
 =?utf-8?B?Q05QaUxlcjYvWVhWRkRpV1poemFvTzFrWjRLaEVTZHRtUzN2YVY0SEVFc2ZR?=
 =?utf-8?B?S1REcUFZOVltRWRJaWhvTmVDSlFrSEZMMkdlLzZpT1hyeW1NM2FSUnF6K2p5?=
 =?utf-8?B?djRYNUJ0bUVNSXFLT0dvRnlsS3Bia1pUckNKNUJiUWxpMm1IUndVTzZPTzJB?=
 =?utf-8?B?SU03QzhKUFZ1NnYvYS9GKzZoUHl4NmppZkZKSGRvWXJub09OTE9vYmZ4RHd3?=
 =?utf-8?B?bHBmWDRZaU5GZ0Z3Tk50dzBEaytZZnVTVlY3ZUZQdW82SUIzUWFUSzF1Zm9h?=
 =?utf-8?B?K0xkSTNJNjYwcy9Yd2ZuNmRNcXBXbGc0Y3o0YUNtVmtKWHpQeVZKaVhwcUN0?=
 =?utf-8?B?ME04U0pVd3hqcUw1ZUVEeHpQR2ZwQytnUGVUdFdoRVM0dlJ2aWl4OWV5aldY?=
 =?utf-8?B?eHBGd2c3elZWNUI3c1ovY1BiRzZBL2kxY21IQjJlMGM1V0RIT0dyQ0U1QUhC?=
 =?utf-8?B?Y09ydjJFbDZRMzZpSTl4UVBpTXhKR2VraFJZSW1jMlJpQkZNWS9XdWNHNlA3?=
 =?utf-8?B?cUJVakp2RnFtSHlwaVplWGZINjN3SjFHaVdQakhTSXFWdXZvTmxDV2h2Q1hQ?=
 =?utf-8?B?clNpaFRCcER5czhsdkZXbGVpdGk1TXlWZmw0THZpb3c5RkdZVks0QmlaSkJ2?=
 =?utf-8?B?cGQrMHBGNnI0NFgvd2ExaEtQU3NzYmpkQm9oYzBkcWt3dEoxbWJZcUNYblBO?=
 =?utf-8?B?dThtSE1sUU9kaFZhSGFGR2YwRHVNbkpBTFhVZlByV0d5NEVWZ3RBWmFiM2tO?=
 =?utf-8?B?d0Rqd2RjdjhxTGZrVkRTRlB2YXBlR3pyVWQzZGkzMmlwMmR4OXJkK1M4WFkz?=
 =?utf-8?B?RVA4TXdJVTZ2d0ZHM0Zmc3Z3RUI0bk8yUGlCNEZRZ0RxM2FzV0J6djk0WXpG?=
 =?utf-8?B?U0loMytBUVYxSFBmd0o3WjY1WjdxZGNzMWozbVJTcm9uM2djdFExblp0NWRW?=
 =?utf-8?B?TFoxdW1HQWxhV1hueHRHMDE4ejkyNUFUQ2RTSHpxSlRucnBLNlZjalBJR2lF?=
 =?utf-8?B?WjZ0dGFHVHlrTWQ1WVdKdENqMDl3Y0RRYS8xaWNVY2dRVEFia3p5R3NXWlg4?=
 =?utf-8?B?Rm9zY2VZS2RVQnVtd3dVbWJkWlVCL05MVGs4WEZLVUUva2lsL3UzRGNIYUtn?=
 =?utf-8?B?Y1ovM3ZNYzk0NHBPQVhXVVByeTJZTTZjOE85RTk5YjFuR2ppM3hObnhXR0po?=
 =?utf-8?B?UVdvTkJCNE9kVUp2MVQxdzRHZGVmQkN6ZHk5Q2JEMmlablhXYW1CelhhZWdX?=
 =?utf-8?B?Y0tHNUZpQ2tUemsvZ1I5N3p3RmRhSzhua3o0dlZFVWk4ZndHZUw3aHFXSU9u?=
 =?utf-8?B?ci80UXZtZnFlbDQweFJWM0VneDlTbXo4TzVPVURnUCtweWYvbG1nSVBCYktO?=
 =?utf-8?B?bFc5NUNjY2xOYktPSERLNHFDUDBvT2JDcGxTWUtFbk1pV2U0WmljNFZQS0pL?=
 =?utf-8?B?YzZhN1g4OTZqTFJPdmlXY1FYdjhwL1ZUbXhkTXluNTdMd1VZSmxyY1VUVmVD?=
 =?utf-8?B?TUxzNWtyMDh1ekdMZVN5bjZUWmZwTHp2TkI2NDB4em1CM1F6T21JdHhWdEJP?=
 =?utf-8?Q?HEqNABCMgHsvusH8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a883ab9-c91f-4b38-7242-08df0cafea59
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 07:16:20.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiepZka8DRIVGHGeOan4YOKwvriV/zUQylbe7vor/gTGvCqP6h0MP0EBOYWhlWJro1hW4f8Pkwx9KoSJimI8n79af/GlMPZe3u54rb6Tm+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7879


On 9/5/2026 12:55 AM, Dinh Nguyen wrote:
>
>
> On 9/4/26 00:52, Adrian Ng Ho Yin wrote:
>> On Agilex7 and Stratix10 SoCs, secondary CPUs must be offlined before
>> a warm reboot to ensure a clean PSCI state. Agilex5 warm reset is a
>> SDM-owned HPS reset that holds secondaries in the new reset-release 
>> until
>> ATF releases them, so the secondary cores dont have to be put offline
>> first. Register a reboot notifier that calls remove_cpu() on each
>> secondary CPU when SYS_RESTART is triggered in REBOOT_WARM mode.
>>
>> A snapshot of cpu_online_mask is taken before the loop since 
>> remove_cpu()
>> modifies the mask as CPUs go down. CPU 0 is excluded as it is typically
>> not hotpluggable. Failures are logged and the loop continues so the
>> reboot is not blocked by a single CPU that refuses to offline.
>> The of_device_id table carries a per-compatible pdata flag to enable the
>> notifier only on platforms that need it; Agilex5 leaves the flag unset.
>>
>> The notifier is unregistered at the start of remove(), before async
>> channel teardown, to prevent a reboot notification from racing with
>> driver shutdown.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>> ---
>> changelog:
>> v2 -> v3:
>> - Use ctrl in psci_offline_secondary_cpus() via dev_err(ctrl->dev, ...)
>>    instead of pr_err(). The controller pointer was unused; this both
>>    consumes it and attributes the failure to the svc device.
>> - Keep of_device_id.data / stratix10_svc_pdata rather than dropping it
>>    because both intel,stratix10-svc and intel,agilex-svc happen to share
>>    the same notifier path. A separate patch adds intel,agilex5-svc 
>> without
>>    .data so Agilex5 does not run this sequence. Agilex5 warm reset is an
>>    SDM-owned HPS reset (REBOOT_HPS) that holds secondaries in the
>>    reset-release / P-channel block until ATF CPURSTRELEASE; Linux must
>>    not PSCI-offline them first.
>>
>> v1 -> v2:
>> - Drop workqueue fan-out: remove_cpu() serialises on device_hotplug_lock
>>    internally so concurrent workers provided no parallelism. Replace 
>> with
>>    a single sequential loop over a cpumask snapshot.
>> - Fix CPU identity bug: get_cpu()/put_cpu() did not prevent task 
>> migration
>>    and the notifier can run on any CPU before migrate_to_reboot_cpu().
>>    Exclude CPU 0 (typically not hotpluggable) and offline everything 
>> else.
>> - Fix pre-count race: the two-loop atomic pre-count had a window where a
>>    concurrent hotplug event could cause dec_and_test() to fire 
>> prematurely.
>>    Eliminated entirely along with the completion and timeout.
>> - Replace of_device_is_compatible() checks with a stratix10_svc_pdata
>>    struct carried in of_device_id.data, retrieved via 
>> of_device_get_match_data().
>> - Move psci_cpu_off_teardown() to the top of stratix10_svc_drv_remove(),
>>    before async channel teardown, to close the race where a warm-reboot
>>    notification could fire while the driver is being dismantled.
>>
>> ---
>>   drivers/firmware/stratix10-svc.c | 88 ++++++++++++++++++++++++++++++--
>>   1 file changed, 85 insertions(+), 3 deletions(-)
>>
> I had some erros apply this patch, but was able to finally do it. 
> Please double-check the applied patch on my branch: 
> socfpga_firmware_for_v7.4

Hi Dinh,

The patch looks good on socfpga_firmware_for_v7.4.

Thank You
Adrian

