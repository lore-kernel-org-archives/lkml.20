Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011019.outbound.protection.outlook.com [40.93.194.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E37F35E92B;
	Mon, 14 Sep 2026 18:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412116; cv=fail; b=ZO6HKEoZeFjsJiKRIGk1t6VH7sgtwZbmON2B7Yu9FhkhuyfOTQB1cjjJC/En0iNQsoxSQ3FAmE0H1ei+pwmaaw/oh+bjj4UvBL/tVKo+ZwUCcDaZeBmBSTl/04KLgBafXc+B5OienKfAP3830D0Iml6x/Nw6uqllp7QrOLz48iE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412116; c=relaxed/simple;
	bh=ugrHMb534YO72cPOTPXzaXVdDAymDoOgSLAoPhVFgTI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jdowYot7UyYR9wMHChVVvm+QrGl5hFk4b2ZCaABCaqGN5bwTiedK1O5iFEsr10CzZGGszlhBOWXTPYkCOoNi0xMbK2cxmN9+Mi6mayFN/+BAKKlZL66WW4BePKLkpYJBkti05euj6NrV0fK1MLAgNtpftDxHCIwPVIASeVm6O6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hf4Gyd/B; arc=fail smtp.client-ip=40.93.194.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hf4Gyd/B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCMdOdALr1mn8iq2vWG1DBO+99BY5Gb8eOIbPjsnHnD1VUcHEnm/GVIxt6YMdpalAls4J7gAWrJ2/CZezI74UApsLsBiDbMSv9FrUe0ky1s4XUpHtZb6I9UW8aZ2egA5E8vPv/Bdx1oqJpnheNL2ouNmtSWRlYdnxJa5xvMqCFlbwYCbAMZXNyFR+J7kkE94GyqHVWj3iRnq4d/WhVQfFFB8vTwxwL94d6OcOXZ1yQk3IpyqijTdfpDNzqQmNorQecEYetwmVQi5W7bi1FiAuc7od7iJrcr5tzMd4IULRon8t+A1krWWnsvEPkfgfAyzgEFj+lPWB4kLS+R2UNckOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcfMZ4t1TzUQXI7ctQDQa4DoF7w7ca2/qhIFGmNl0fo=;
 b=eVgtbWkb+5ku2Yz22rR/hbaQa/fc0biAdlAD/rKUV1yYHb7s2I4mlaBZMzkRQNQbEvKEG7uciovWEDaDc9dZ7XOdbl79B/cqoh0yo0MZIyJalbC6zdxqYu4TFZokHevrTkse3hp+sRf3BW/fpstw+VHhACk0TIveqixmMv/QTUEYCkPTm0j5JCZ4nis3rVmexd0vQTr3usiPAwgHDqMTE/tJQDi+WKgIljXKIx8Cgdzzb0dQniImGIbdo+WJXAIr79Lkxp7opXQuBoq2lXY3unBTQFBkPN975iBaUnWJg+yHLoaRIAm41Kd7hJcTEDittKpJHW0Pc+pHYMgoT8TocA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcfMZ4t1TzUQXI7ctQDQa4DoF7w7ca2/qhIFGmNl0fo=;
 b=hf4Gyd/Bi6uQubxY8mOLPbgSkH6u2d0R+AlEz3henQdxdRyGGf3xXnZpVG35abSI2T21BBdemrCG4uwc7e9TcnMxHo453ee7KlZLLgwBElrJ50osJrnPd4Agj/YqVIntvZVya7O0NUgylG9XdSKI/BlLah4tf1fvDBA/3hub/oY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH3PR12MB9456.namprd12.prod.outlook.com (2603:10b6:610:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 18:54:51 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 18:54:46 +0000
Message-ID: <69dae432-966f-4754-9e0b-c77a8fdb1b08@amd.com>
Date: Mon, 14 Sep 2026 13:54:44 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 2/3] fs/resctrl: Assign counters to existing groups
 when enabling mbm_event
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <cover.1788545152.git.babu.moger@amd.com>
 <79d6aaedbef7e3113a15c79b1f6eb7510b2a2a62.1788545152.git.babu.moger@amd.com>
 <3bd4676c-5c25-474f-bdb1-039dd02b79be@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <3bd4676c-5c25-474f-bdb1-039dd02b79be@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::13) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH3PR12MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: a2abbd70-eb75-4d5d-b975-08df1291a571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|13003099007|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sGLeaF+xukBU0T7bbNuBX5fMcJTmeLwYDOgGXNu8Dt6lLBL9JVGR6AU10Fy2Zf9cnDdHBv2ooEP4bMjzcpYPB6rHN36JcdbLEk6fZeMUv0OyEHIf8iOc8Pg39rGplwOmxICFU8p0a8CHwky269lnpFe78BQItk8cIzAKMFEjnn2DweyROYUNRIw/D9M39z30tdhVtVZa29iY/8/clyRo5SGRcWHFl/m0TI8CiqY5boxLA+ODRQdT5BGF4VcR5hQsKiVWqH6+YDQfKzbdHw/PUvxGBIYU6yGjF1lHOHJvHS7E4wLzTyb5pZWgt6xSwZI9z9NSpPha4OMurdwOGTYanES3ief0ZYzfxNtW8yO6jRwaHFZz3QrCGeg1NnXnE8ekNP7nYgbz+MEOtURH02gyHyLD4aOl5dafy9VNIp8/EITKCuHrOzBLbN6gZVndkEk1i7yQz4gTBu495XSYjv6Lx36gBji9PXHErDKCQdlsQK43WeD6C4YVgVzNgwBUzh8aiI0FLdCTEYWl92H2qn6ajlEOD/gGhGJXmHmdza9pwuIddN+tFynBGewQMltVnDnUjQ6dQY3AQP0sbysfk0feJ/8bPaahi7GgH8E78P1A+CQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(13003099007)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU5ac2ZJSllmUERiWG82MmxWbHdrYjF2R2NicHI0VWJ5ZjJWRm5DNE4yQnlX?=
 =?utf-8?B?MkRTeURLZVZMTnNsbXJ6THUyckI2TWZYcngxYVU2ejVDS2NIOVZoM3IvNTY0?=
 =?utf-8?B?akwvbXorb0xlcUlnaU5EVW41cWRoZVFpOTIzOVdzRVlXdDJ3d0JZVlpyVmN1?=
 =?utf-8?B?YUdyVzk5WmxVUEQ5NGNsLzl3NkN4RVpKdkxDaitkdjM5YU1FOFF6K2tBdWcy?=
 =?utf-8?B?TG9wazdLVDBNZWRVc050WUJVekMyei8xU2JoOUZHSEh2MnhyWmJ0UnN6Z1Y5?=
 =?utf-8?B?ZTdXTlhQak1na2QxMDlySEJxVHNOYkl3QXlmTFBKOWFYRXdybEN5VFRrUmNh?=
 =?utf-8?B?MDRwNWtGdnlrSy9CVGtxbWphQjBFdEtpdlVxR3VuV2tWeUhDa0ZSOTQzWXZ3?=
 =?utf-8?B?dWt5cXFxN21BaXp3cncvNThFdWQrc3R3LythYi9GZ2JTdkh2V2FYOUlWVisw?=
 =?utf-8?B?OSthOFhJNENjY3pYQTJJMnc0anVWVUE3RDNUdEVNL011MEZmOHFVUjN0ZkZ1?=
 =?utf-8?B?UU93akJHZGVXZUs3UEVPbTFPZVNDemRLcFJLVmxRT1VHRlJVcEl3eW1pL3hS?=
 =?utf-8?B?b2FlYXhQZmNpQ3U4amRmbjF4RmR6QnhKbEs0NHhDUFMxSnBvS2FoL3ozaXZ3?=
 =?utf-8?B?UG5mcWQ4T0ZTN0dmcDFiQlh2T2Y0S2hOSExYSmJHWmo5aG1hVkovbThKMk1q?=
 =?utf-8?B?SUFTNk4vODNBcWg4UzJaTXRIWkdjZDA3MlBzOVg1SEk1N2pzTjIyb01jaUtV?=
 =?utf-8?B?ZW0xYXlnM1haQkdCdmdVMUptcWZ0cnNOTENCdnExc2VoVFJvQXE3akpXQ3Jn?=
 =?utf-8?B?cmYrdE12Vnc0WWZ5Z2laMW9XMHZsOWt3ZXkyUk9DWGxHUDR6dm1ZbzVrOHF1?=
 =?utf-8?B?ZHliTFB6UVU4WUFFazR1a0YyekwwOXVGNTVSZll1dS9mVXdSRE9pYUp0OVJz?=
 =?utf-8?B?ckp3TGUvRWdURW1BbStFalYwQi85ekk0TFNuc21OL2toUExmbm84ZGRtMmlo?=
 =?utf-8?B?NXlCdFlZMUtvSW5TSmM5bWlHWVNPazJYQ2xjdE1pbm5IWlduYlE0VG1veFFR?=
 =?utf-8?B?ZW9mZDM5VU1qcVJtOGtwSVYyQy8xNGpzV0hmOGpjN2lPd3ljUnFFTEZkQnA1?=
 =?utf-8?B?SDZKOFk5UFRtQlNWQXFqckZPZlJlbmhlUExLSjRGK243VGtTV0p3bmswSEpM?=
 =?utf-8?B?WGRMYzVYaVhZRGVielJLRmVkMUpkOExjbjJyUVkvSTg0NUozTHhFbUhjVlBv?=
 =?utf-8?B?dW9YalJSOVZFYTZHSUttaFY0dmR2bHZ3ZWFpc051emNlZFFEOTY0NHErcWVw?=
 =?utf-8?B?bmpmTzcyZnhyL2FQOTlHN21SbDJLQVVyZ2c1L1B0dDQ2UHdNS3VVNmk2MWJD?=
 =?utf-8?B?WUJGcjV4M09NdXU0R0ZlTmt1c1Z3NmNRS0tuVVltYko5UGhhMExhcDhTcmpD?=
 =?utf-8?B?SjhzbG5EVCtMb2JodU0yaXJvcVBSWDJmekdnYVpTTTVaYllLcS9zRmlFVi9h?=
 =?utf-8?B?M2g1YnBNbkY5a0dwMmwvU0RyRlB5NVpycmhLeUFIbVRqOUt5U1p4TzMwVG5q?=
 =?utf-8?B?NnljdHl6c09KaHBHN3U2VHRNSHEvUitadDlRekxOcHFOR2JxYkhSZ0tYcjVj?=
 =?utf-8?B?OWZPYXFYUStrS3lWTzNaSzdVYU5NTVNhdVFTR1k0VVl6Rjd6WGVTRnRPblJO?=
 =?utf-8?B?YStoMzVPVFpUNVdFalhlU1hKRHE1ckVybWZxRC9tc01jc0VsUllpb2pKWWNt?=
 =?utf-8?B?RUdpejRXaUc0VjFTc1dZczV4TFN3bXdSMkFPaVVFSVo3cFR3d0tkQ2tQQkRT?=
 =?utf-8?B?c1h4RXJyQ085WUNmN0EydWE3WjZLQjFPOVh5eGVnN2JwajdzM0Y1Y3hjcG5m?=
 =?utf-8?B?a0JYK0dhVVZqay8vMENlY0FGN1R0UHA4N3FFd1JzbDMvcGMwQWJSbENMSzlw?=
 =?utf-8?B?WURSbEdzdHpiZmtCY3VIVUZpSGdFbDA0TDRYUkxnZHo5bW9sWHZWc3dvdlht?=
 =?utf-8?B?OENCTnNocUF5NTNMRjg0YWw1T1U1NDBDNjdkYkRhenExZUFGTllDSnB4VE41?=
 =?utf-8?B?bHR6M3pHcmV3OFlpMEVXWFpDZS9CbzcraU1uMjBvUGtBRFk0Y1l1RDlscENM?=
 =?utf-8?B?TTNOc0FpZTJsaGRldnZIejg5MXZkc0hIWkNKVTFxSlBjUVJxbU0xQ0srb2NJ?=
 =?utf-8?B?ZjNZdmdDWE8xSFA2SGdCR2ZML0F5UGdqTEErOVFndWViMllBdkVqckNKU2gr?=
 =?utf-8?B?QTJ1c1FIRWpISVRIVWVYUWtHSDZsY0R1cnNTRzFjLzJQNGo0VXN2b0x2aWVT?=
 =?utf-8?Q?7TYKzrY8lBOynWfM9m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2abbd70-eb75-4d5d-b975-08df1291a571
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 18:54:46.6378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9S/bQj9lE8naVg4YPPZxl6+UBmHjJABIlHhU8NLQgC0dv0l0l28iFl8xisv90REI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9456

Hi Reinette,


On 9/11/26 17:12, Reinette Chatre wrote:
> Hi Babu,
> 
> On 9/4/26 11:06 AM, Babu Moger wrote:
>> resctrl_mbm_assign_mode_write() frees all counters and sets
> 
> The changelog is easier to read if it documents what the code does
> instead of documenting the function names. In its current form the reader needs
> to stop at the first word of this changelog, go to the source code,
> figure out when resctrl_mbm_assign_mode_write() is called, and then be able
> to return to changelog to further try and understand the change.

Ack.

> 
> Consider an alternative like:
> 	When the user enables counter assignment mode by writing "mbm_event"
> 	to /sys/fs/resctrl/info/L3_MON/mbm_assign_mode resctrl resets all
> 	monitoring state and sets ...
> 

Sure.

>> mbm_assign_on_mkdir for subsequent mkdir, but does not assign counters to
>> groups that already exist, including the default group created at mount.
>> Those events then read "Unassigned" until the user assigns counters by
> 
> "Those events"? No mention of "events" before this.

Will change.

> 
>> hand.
>>
>> Enable mbm_assign_on_mkdir and assign counters to existing CTRL_MON and MON
>> groups with resctrl_assign_cntrs_allrdtgrp() so the switch matches mkdir
> 
> no need to mention the function name, this can be seen from the patch. Just mention
> what the change achieves. Looks like "with resctrl_assign_cntrs_allrdtgrp()" can
> just be dropped.

ok.

> 
>> auto-assignment. Groups left without a counter still read "Unassigned".
> 
> "Groups" -> "An event ..."?
> "still read" -> "reads"?

Sure.

> 
> This implies that counters are assigned to all groups but that may not be possible.
> I am not sure what would be best text here. How about something like:
> 
> 	Enable mbm_assign_on_mkdir and assign counters, while there are some
> 	available, to existing ...
> 

Sure.

>>
>> Update Documentation/filesystems/resctrl.rst to describe this.
>>
>> Fixes: 8004ea01cf63 ("fs/resctrl: Introduce the interface to switch between monitor modes")
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v2: New patch.
>>      This patch addresses the Sashiko comment about documentation issue where
>>      counters are not assigned automatically when mode is switched to mbm_event.
>>      https://sashiko.dev/#/patchset/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger%40amd.com
> 
> Sounds like this is needed:
> 
> 	Reported-by: Sashiko <sashiko-bot@kernel.org>
> 	Closes: https://sashiko.dev/#/patchset/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger%40amd.com

Sure. Will add.

> 
> Is this a stable candidate?

Yes. Will add CC to stable.

> 
>>      In fact, it exposed a real issue. When switching to mbm_event mode, existing
>>      monitoring groups should be assigned counters whenever counters are available.
>>      This provides a smooth transition between modes and aligns the behavior with
>>      the existing auto-assignment mechanism.
>> ---
>>   Documentation/filesystems/resctrl.rst |  7 +++++--
>>   fs/resctrl/monitor.c                  | 30 ++++++++++++++++++++++++---
>>   2 files changed, 32 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index e4b66af55ffb..79feeb1dc296 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -371,8 +371,11 @@ with the following files:
>>   	of counters available is described in the "num_mbm_cntrs" file. Changing the
>>   	mode may cause all counters on the resource to reset.
>>   
>> -	Moving to mbm_event counter assignment mode requires users to assign the counters
>> -	to the events. Otherwise, the MBM event counters will return 'Unassigned' when read.
>> +	Moving to mbm_event counter assignment mode enables "mbm_assign_on_mkdir" and
>> +	assigns counters to the events of all existing groups, including the default
> 
> "all existing groups" -> "all existing monitoring groups"

Sure.

> 
>> +	group, for as long as counters remain available. Events left without a counter
> 
> "for as long as" implies duration. Perhaps "while counters remain available"?

ok.

> 
>> +	will return 'Unassigned' when read until the user assigns one using
>> +	"mbm_L3_assignments".
> 
> hmmm ... guiding users to read each event and use the return value to learn whether
> a counter is assigned or not seems inefficient. How about replacing last sentence with
> something similar to the "mbm_assign_on_mkdir" doc:
> 
> 	Consult "mbm_L3_assignments" after switching to "mbm_event" mode for
> 	counter assignment states of all monitoring groups.

Sure.

> 
>>   
>>   	The mode is beneficial for AMD platforms that support more CTRL_MON
>>   	and MON groups than available hardware counters. By default, this
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 73413cb128ea..61463741b91b 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -1326,6 +1326,27 @@ void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
>>   					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
>>   }
>>   
>> +/*
>> + * resctrl_assign_cntrs_allrdtgrp() - Assign counters to the MBM events of every
>> + *				      existing group. Called when "mbm_event" mode
>> + *				      is enabled.
> 
> Please do not include caller information in function comments. This does not age well
> and this patch clearly demonstrates this: rdtgroup_assign_cntrs()'s comments
> read "Called when a new group is created.", after this patch those comments are no
> longer accurate and thus also needs to change as part of this patch.
> 

Sure. Will change it.

>> + *
>> + * Groups created while in "default" mode have no counter assigned, including the
>> + * default group created when resctrl is mounted. Assign counters to them so that
>> + * enabling the mode leaves the same assignments that mkdir would have made.
> 
> Above comment belongs in caller.

ok.

> 
>> + */
>> +static void resctrl_assign_cntrs_allrdtgrp(void)
>> +{
>> +	struct rdtgroup *prgrp, *crgrp;
>> +
>> +	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
>> +		rdtgroup_assign_cntrs(prgrp);
>> +
>> +		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
>> +			rdtgroup_assign_cntrs(crgrp);
>> +	}
>> +}
> 
> I think sashiko's feedback about needing to test for pseudo-locked groups need not
> be followed since there is no overlap between systems supporting assigned counters
> and those that support pseudo-locking.

Sure. Thanks

> 
>> +
>>   /*
>>    * rdtgroup_free_unassign_cntr() - Unassign and reset the counter ID configuration
>>    * for the event pointed to by @mevt within the domain @d and resctrl group @rdtgrp.
>> @@ -1599,9 +1620,6 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
>>   									   (READS_TO_LOCAL_MEM |
>>   									    READS_TO_LOCAL_S_MEM |
>>   									    NON_TEMP_WRITE_TO_LOCAL_MEM);
>> -		/* Enable auto assignment when switching to "mbm_event" mode */
>> -		if (enable)
>> -			r->mon.mbm_assign_on_mkdir = true;
>>   		/*
>>   		 * Reset all the non-achitectural RMID state and assignable counters.
>>   		 */
>> @@ -1609,6 +1627,12 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
>>   			mbm_cntr_free_all(r, d);
>>   			resctrl_reset_rmid_all(r, d);
>>   		}
>> +
> 
> Comment within the block can be dropped and instead a new comment can be placed here.
> Something like:
> 	/*
> 	 * Counters were freed above, so both new groups (via mkdir) and the
> 	 * groups that already exist need assignments.
> 	 */

Sure.
Thanks
Babu
