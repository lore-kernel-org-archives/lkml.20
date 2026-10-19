Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010048.outbound.protection.outlook.com [40.93.198.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAC24369A;
	Mon, 19 Oct 2026 03:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380580; cv=fail; b=Y63Mawa7ZDKgzhv3FbIFJ3BG4Du7QXVjlQMv2tEFKd5OLMBjp84qYEHUobaSQBCgsz8lp3VaaKiL1YOQXzV7JBvXQINTKCZPhY1uYaUVngGKmnLeQE/BJEuGqUDXWBVGdJvKPNtzCK+lHl7+JIz7JWrT45ZjMmaYQ+0FtZAbCGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380580; c=relaxed/simple;
	bh=W/dQhfYuyj3eL/kwoYdEtUU3nGb019zkiQHGN+sCX5M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NJvnNR3ybRQgibr85Og2G2H2JYNC5a1Td8tk0uLMcrl89+j5kmXjv1QWW+JUHFPvqlvJOA9T1wkDhBNulokdnWhGs3Dj+igkdGua50wk0VdcQBoH1GfCGLm0WA0GwQOyUss4O5YGjh3a8JAm5iRTUYKZMhIRjkIRXFX6b03QTlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VYkjGLt6; arc=fail smtp.client-ip=40.93.198.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VYkjGLt6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqMMh/SNwJEGN6dxwmrz7TREUqcJiCHBnk9KAriZa7mqtH3JhAnBBzhaEhDZqIRQaaG2G68jUaUE3XCMWrPNgIePkqdGhH9uLTCU5NyplePquZmtWMZUbuiFQeZ8pnNm9akp89F7i+fJnOGFQ5bRUVWje+bFTm2Iw/DHKZbL/rkgWQiNC6ZtnaITCiuvSOse5FgBwNifmuOr2R7lDyTHqJyrWcFpy3ydodyfnK7z9R6PPWpNfCMDH/weNttkcDymXhSZjqJGdUz9lCd50mZJgF072Vn719Fg2HTkur/oD+w1o8DY4Acxp22moPkvDnf7J5fb2r4TKjRN9S7/8Wu6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAEK86fsVoZyLDI8AN8z2yiNxWcHs1bUxrooCfbFvPQ=;
 b=TTlRdik4o74lBh8uPBgzhodW46XaY6WWlm5POj3BC4L7spDqKdSvMOrKN426fON2SmAcU7BQMZG/gwvTX3Ft2kuy2nPvsFhArIGmSQ/OAujJwusn3A6aG0dxgBR9MRozDwqSBYiaQqNZU68N+R1E08CDxvDmctgdvK9UVQkX14GFdCx7XmosjKPdJycZJDi3+Mg4fwVtdFxNRpb1W65TZfu2tudFr+akeI/kUF7VRJamv2pAO35qZatbKAENRIx4QLzHdkCGuWCMtD9l1FeRW/RRbsR0vqRkQFQGWgmzmaDSJFFSog0CEp1uRi/sU93/T2kSwlej7seULLwKVzom/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAEK86fsVoZyLDI8AN8z2yiNxWcHs1bUxrooCfbFvPQ=;
 b=VYkjGLt6ojhooYpHOG470VHrn3jYVl4sgOKBrdVy7sssLSwF5WtCJ3+S3nlDwHHy8I7TGL2QknegBxDqOAOF5P/6qi/Va/HDxT7dDAsFMrmsB0rvCNNY8u1GUrdECqdqux7PGRR4fZn1JMCf/mbW+BUv45rUArWcObIMAklWvGU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 03:29:36 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 03:29:36 +0000
Message-ID: <20026d8f-6856-4172-a8c1-674e442aada3@amd.com>
Date: Mon, 19 Oct 2026 09:01:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 10/10] soundwire: amd: fix IRQ thread dropping
 STATUS_0TO7 on simultaneous wake
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
 <20261013085111.2009061-11-Vijendar.Mukunda@amd.com>
 <62eefadc-b0c2-41ca-8a33-af330e78932f@linux.dev>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <62eefadc-b0c2-41ca-8a33-af330e78932f@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0123.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::6) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|IA0PR12MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f085491-2ebc-4479-20cb-08df2d913308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zK7SOxEIvEXBuMZuvucL1fyfB6tHJC7NK8B5KfTTJan+ADDhcke9s8frO0CKMGqGd+z5GniBTAx2QcuKoUWWvkulhgaZq8aOE6JQ69Qrb2RmaRAbhY2oUSTzgd/roFkwObnN2TS6OvyoaE9haOKGP02MX0nDJS64DQ7b3nuN2vCakAedPw7StBff8mh4CU8MCojjkpjd2cMAHpAElnOOt+TU3GgV1d7Jonzhj8XsKzAGy8g/EV68XlSX65GGTzk3yBNX9IxbGwDjalvfuNs1fwCLonuKSojMwkMG1kFY8ioQ/N5xrCLu5UMzt/V2YvqHhGAe+3V3i5lv4BA3Y0jriIBZBqOi7ydW0aZ6WJMNIKRf7ZLFYwVeSNHVYy30kXMZXEZ0C58xmIeT3dFIHZ1LIMKgQ0FnY2ZxyS+Ews+AnbM1Jc3lUzidbTd0MzPOA7nM9i6zIKDU67mLPgRpMZ4ARC4R7MyDBBfbMNLWY0I4bGkUTR3nH1HSHpOub2CTdIZIX/lRCoEWtCTvwBLIfU0+Wct1ipWTNz261yCUF7au1TYcMLy3I0sLNVpuEcZVPX5LCc1TaEjy0JBmGVDXf579FBPchUPRjVVEOBMp9ukuDxWml6oc2onbQ77P5xhbaVyzFXNQls5EpkZyq17h5ICAs47yb3Sg3jDr7lzYduhkuYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzBvSHpEV29ZclplaFQ2K3Rub1RqRzBLa016VE1ZYmw2SDJ3ODlRT3JZb1Vw?=
 =?utf-8?B?bFlTb291Si8rZ3laV1hmTWdqU2F5ckx6SWlFNlZUN3p0VkV2S1FhRmpVeTVT?=
 =?utf-8?B?K083bWxQdnVZM2plck83NnI3TVJSWTZqTDJmUVh2WkxNc1EvM2Q4cEFoYzMx?=
 =?utf-8?B?eXg1a2F1ZmtuYkF1eWROayt5UkNxM3JMMHp5U0x1U0VVSDg0cm5GODJuVDRD?=
 =?utf-8?B?RXhISlU0WjZRWEUzd1hlazAzdVFqMktLaXEvRDlKVFlhbHEzUVgvWXJIRDdo?=
 =?utf-8?B?alNUQzJxeXpKREV2S3ZRK0Rzd2FPdFdncElKRWN2UlRIUmxpQzR6dVJmenda?=
 =?utf-8?B?NzF6dy93S2w0L3dVdW1pdDBOUkpiMFhZcnFKZWZ3Q09MTEwrLzYzRUhDeHQ0?=
 =?utf-8?B?amliK0J5L3Yvcm4xaWxqeDFUZDhiN3hrYUN3L3ZtUkQ3Z1djM0p6aXU0SFdt?=
 =?utf-8?B?MVZNNDM3VWVIUkgzVHhFYU5FVFpOaWRhOGdEZXVOTFgrN0ErR2pLb1VycTY2?=
 =?utf-8?B?ZmU0a0RneEdDd2E3Q2h1bjQ3dFFkRFE3TmRtVDIxU3NNUzNvbXlUa3R2eG1K?=
 =?utf-8?B?ZmRacjJodW5hSGc3YUxRZi9yVERZTDEzNk9rWkRtcUcvRzVqRUpiTGdnckRR?=
 =?utf-8?B?MUY2Ymw5UnNFMzVJOTR3cUVjZkc0MEw0Q0IxRCtMSDluZE1LVS8zdU5rd3V6?=
 =?utf-8?B?eG8wbmY4TFlOWHV2ZmRYU2RpdmpEalQvMGw5Tzh2dFRqRTZodmdRakVjQ2cw?=
 =?utf-8?B?a3JLcDVhVXFOeVhTWnBZTGJZR2syRXVmWm5vYStCSWorU0RjWC9wQ0VSaDR3?=
 =?utf-8?B?R0Jxc2ZuMEN0ZVJYT2o0ejV1MnhtZFE4R1RYQTREZkRzb3FtNkRhcTMyVTBP?=
 =?utf-8?B?dFZ5bmhpUGMzRHN3S2o4NXpkUjc3UmZDWnZwKzhKSkliaGo3VXh1U2JPZmZt?=
 =?utf-8?B?TjlDcUl3ZE9rVXdDaFZ1SDFUVlJMcTdwZ01BK0p0ZnJoUUNmR3ZKbENOdHVR?=
 =?utf-8?B?QUtSQ25ZTEFOTWl2RnpYTXlPMDJaMWxDV3VWSVJ3by9GM1pHb0g3czZLUHNt?=
 =?utf-8?B?dmY4UFdOZ0puVmlIOTMvcE52Q3FCQ1VzS0owakYrbHhLWnkrelNTTC9HdmZ3?=
 =?utf-8?B?UHZNcWxIaUhjSUxWQ1YzUjh6dzBxSFZtMUIzK1Q2QTJYcWRXNEpVeGd2bU9M?=
 =?utf-8?B?T2ljeUxwSERhK3NaWkNQNUlJall2b0o5QzFVanZTNUNjNTF6NG1BUWxTOXVR?=
 =?utf-8?B?UVJXbzd4UnoveHpabDhrWEUxRjZ1eUZBT2txNWtYNmtjWkJ6T3VVZmlFQ3lp?=
 =?utf-8?B?cjhyM25mTFo5WUZrQ1IxczZabUVoS0ZGck85YUNZMm5pOCt5ZUJPS1lDd0U3?=
 =?utf-8?B?UEU2My9lWmJPVWJiYk1EOEhic0pqYWczOGZnYlFBWlE4eVg1aHg4WkpvK0Uy?=
 =?utf-8?B?VDdOQk9nNFBDNjdWL01VS09WcDZlWW1Xa0E4Yi8rc0Z6RjA3c1VMUXM4R0Rn?=
 =?utf-8?B?czZSLzlmOTU2N2pHU0tmRUs1NkFUMlRGTFlxc3NSMXdNM0dYTnpUV1ZZN3Qw?=
 =?utf-8?B?N0tNak9jZzJ5MHJBbjNOTEJSSHB3bmFpRHdDbUozYWxwY3oyMU9aKzRGR2kr?=
 =?utf-8?B?TUZsY2tFd1JYN1FlS2ZPSTA3SXZYWjAyeCtCb1VPdnFZTi8vMUVHVGZJS3dQ?=
 =?utf-8?B?ZkZFRkRQZkVrVnd0NXR6QTZyb3V0OHBjcExOZHdBWXJ6bE1DV1BGeWJNOGh4?=
 =?utf-8?B?SmhKQVdTdTZOZnBrcUhEZFJEUFo5bmtWYmpSUWxsQVVRTklZcU1IS0V6L0R2?=
 =?utf-8?B?d1VIcFBwYk1Xb1N0alYvNEJHaUFDcEhvckhLK0lWc0NCYzRJMzJKeUpPNWgr?=
 =?utf-8?B?SjlHWUFydkhySUFKSmExdjFwbFlWRkdMVHl6bFZzTkRna29acFhnZWtNRjU1?=
 =?utf-8?B?QjhsckdjN3Y5QmpvOFBwWEJmcUlHTVB0ekdTZG52Z0V0WUdPR1B0cWVXOEF2?=
 =?utf-8?B?WEZFbitWMUpsSStuMjNPeHRDalpNbWdYbi9aQzk3OVRMa0pOTGVpVFlPUlJW?=
 =?utf-8?B?eUtZWEFmNEJJUXdBZTVYa3h2NUp4RW9NSFRhKzkwNDIxSGFjbUYxa3Q5dTRT?=
 =?utf-8?B?ZDJBa0prbjJLU2NYTXBGQmFmQXkxd3dlU1pNR2N3R3NOWVVFYUloSTFUZ3kr?=
 =?utf-8?B?c2FucGx1dlI0RExkeE5ZWEJsN1pNNnVzME41MHQ0YnhNVHdpMU5pOHBUTnVL?=
 =?utf-8?B?bmdwVlRuamxvNHBhdmlGWFBJZ0xNL2swdlU4cWEwQ0tLS25qSWtLTEJiRWVw?=
 =?utf-8?B?aUhlbUZHRXZ4clNGaEozZlgvazNBbk8rZEpodjdObmcrQWJJa2VxUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f085491-2ebc-4479-20cb-08df2d913308
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 03:29:36.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2anp+ivCuw9FLCmiW0t3LE6/4qY0V6Wn0JUgvvS8Yzv2Gizm1lDOFFFg3Vm5p4ye4bJXkMowk6wsr68e8AXMZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205

On 18/10/26 22:19, Pierre-Louis Bossart wrote:
> On 10/13/26 10:49, Vijendar Mukunda wrote:
>> When the wake bit and a device-state change arrive at the same time,
>> the IRQ thread returned early after handling wake, silently discarding
>> STATUS_0TO7. If the manager is already at D0, pm_request_resume() is
>> a no-op so the dropped ATTACHED event is never recovered and jack
>> detection stops working.
> this wording is very very hard to follow. Please consider rewording to
> describe the race condition in better ways...
I will reword it in the next version to clearly separate the dropped STATUS_0TO7
event
from the STATUS_8TO11 double-clear race.
>
>> Remove the early return on wake: call amd_sdw_process_wake_event(),
>> strip the wake bit from the local STATUS_8TO11 copy, and continue to
>> the normal slave-status processing path. Remove the STATUS_8TO11 clear
>> from amd_sdw_process_wake_event() so the single tail clear in
>> amd_sdw_irq_thread() is the only write to the register per invocation,
>> eliminating the double-clear race where a new event arriving between
>> two successive clears would be wiped before being read.
>>
>> Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>  drivers/soundwire/amd_manager.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 1a252a81269a..beb982b17fa9 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1006,7 +1006,6 @@ static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
>>  	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
>>  	pm_request_resume(amd_manager->dev);
> ... specifically why this would be a no-op and ...
When SoundWire manager is already in D0 state and if Wake STS interrupt 
is asserted in this case, it would be no-op. In this case the dropped STATUS_0TO7
event cannot be recovered through amd_resume_runtime().
Will clarify this in commit message.
>
>>  	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
>> -	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
>>  }
>>  
>>  static void amd_sdw_irq_thread(struct work_struct *work)
>> @@ -1023,8 +1022,11 @@ static void amd_sdw_irq_thread(struct work_struct *work)
>>  
>>  	dev_dbg(amd_manager->dev, "[SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
>>  		amd_manager->instance, status_change_0to7, status_change_8to11);
>> -	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
>> -		return amd_sdw_process_wake_event(amd_manager);
>> +
>> +	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
>> +		amd_sdw_process_wake_event(amd_manager);
>> +		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;
> ... why adding this mask solves the race
The AMD_SDW_WAKE_STAT_MASK masking does not fix the race itself. 
The race is addressed by removing the STATUS_8TO11 clear from
amd_sdw_process_wake_event(), leaving a single clear in
amd_sdw_irq_thread(). The mask only removes the already-handled wake
indication from the local status value before processing the remaining
interrupt status.
>> +	}
>>  
>>  	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
>>  		amd_sdw_read_and_process_ping_status(amd_manager);

