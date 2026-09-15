Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CA727B4F7;
	Tue, 15 Sep 2026 00:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431627; cv=fail; b=LFXBMH/oXbYraTNjut3Rzq5334Rzy8TYhgbwHrxVZgX/xyptxe2u0dDdvyPV7rchB+i0EkAU3C/nv12CtWVdf//Apxno1YN9qG4PQx/KrIAYp2ZEwDsxATgmWWDpIQVWsuKuX9iS1lbxbBHCd3vxIRWxDwm9enNFctS5kae6z0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431627; c=relaxed/simple;
	bh=dq9bb/mRiaUwkJejtKMWHr9+boa5Hk/whTp2/zIFmiw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DSLpUBYFa5r7yGuLS9pNXuoB3W+et71Ay+WOog38pQMTp9ZtLkdTlXbgF1ccMuz1RjXZLijrBMmb9140Z85Zgg4J6WJhRHZgiuCAjxl/SbKAzHozFNAKrh99WU8UsORYfgEPhqcC2zJNHXNosMQoJ5CwaG0so3LgP7uGUIdX5Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lwRzPkl0; arc=fail smtp.client-ip=52.101.56.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lwRzPkl0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p472DoPk5AcoXU8WVW36Wx2j7nX+Ej39zIoy+JImzd9wWrxYyOLZotRZFl04JiRY0Fy8ESysC9m8JM/oaR/95nHq69+dxhWADZjlzG5ETaxdWhu+nVHHVVxCXEq0YDiFhOCKE4+/5TtuDyfp4p9FpnNOOOV4opIBBnM6Z4J6FTpX2etD4bLBvsR6ibhezgqTyDV+hiAbvTuUDG97axL2mpSFF2QieUSf8LEVc6p+fUAO/vclhmaQE5Fih3QZIULZRXjOyjbYBbefrQbI22GSEFIsFdwLXqOal71/YnNODLU4ax3el44oR4Bsj/bjzYM4S/Ta4GviuTpeTuX/B9MEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJmrOFk+Wi8XZvTMtb9GsaS+ybbqJoGG1tXC4RgQ6nI=;
 b=g8ft5no8S8E3sNJBYy3nwPYGi13TG3ofAK5nGXv6aPYwATnIe50y5PnPf8Hx5SAhuTx7NG2k0rx7ZvaT9QMI6lIfmDWSGIqNXskhF2xVu8fHk3HTKBQegI6qQq1N0rd5EIGLBOEQz+ceQbN/0GrMhxYa2OV1y0UXOj8v7Vm4IqCGD3vC5D5w/6fSV/151sUvTdFDI2DLH5dhgNBVvmvQkFST/QSWB3izOCy+0wxllFwDFL8LJxw1FeBJb1NoW3BbnI8tsb0HR3oZJwJSRzhYiK2R21SJkeZi0HFJoZAHfGma54cx8fBSXP5N/30sIDhQaqhHAB1EcRtO984ZPKVMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJmrOFk+Wi8XZvTMtb9GsaS+ybbqJoGG1tXC4RgQ6nI=;
 b=lwRzPkl0OglN9C1lWxu8X1EKZJ1PcLF1zs+3zBH49XY3bhzhcyKM0zEJir0Ehaxq/YNarv9S7seOenzTZWjI150/LunzTGH5BCDYjgw/E+7bR7zQa6ykEniPg40JbCFgFQeKQEmi8jwDs47ki5MovemJF9jJKhToiFHZavZmutk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH3PR12MB8403.namprd12.prod.outlook.com (2603:10b6:610:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 00:20:20 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 00:20:19 +0000
Message-ID: <82446f14-f961-4f8c-862f-b151f7e8f691@amd.com>
Date: Mon, 14 Sep 2026 19:20:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/resctrl: Fix ABMC counter programming for
 extended counter ranges
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, tony.luck@intel.com, bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <cover.1788545152.git.babu.moger@amd.com>
 <9e85f67add9ac84f55e4b0fced92ed8994f8419a.1788545152.git.babu.moger@amd.com>
 <afd86b47-d508-4739-ba6f-fd1c341e09a8@intel.com>
 <10240e0e-6879-4378-8763-cb1a9baf1f2d@amd.com>
 <30dc55d0-511d-4f5f-92df-5dd0add354a2@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <30dc55d0-511d-4f5f-92df-5dd0add354a2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0168.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::23) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH3PR12MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c38036-d190-46c1-0c40-08df12bf1fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|11063799006|6133799003|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	13LtBAXzS23kYx9P/gwSz+6inwZFoiptIOxS7cqXhjX9+Yf1l3pkH0NGxrYhE95Rj+2jtB16TvK24dId8W5yQK3BQou3gdhlqu/dJmYAX/mJFvm/en/ls5ClLeHYTHt1ZlhcJFKNBP3xDKHyhigJXzEG/S6RsdE7UTL8ypPOqd12e0JI3KqtEmr15pOqjg3q+sPhrxyw33oY7uZeo2okkYtYDkrngWcafAtujKNpymhlcK/2VEQNkSDWdCfCK78kFtrZ807ze86iZXTzSfswf1X16kRK24z1Ir09Js2smCPSVaIuYPFgogU/4qTZo9BRnNR1Qp3SPfhWqLhVkbzui/lm7D4dt1OpFj4GVerbJ6ezJxaG/NSW2RbWXxQDrAVodnpnRHHNQPVvvHFxqhQeCUQtcaTSj2PqAhncSO+GzSII8/umHTUswxOjpipZZNZAKbzTDmc0ZNm/A1KF9o3xJjMN5S+itVgdsnXVcSX7zf/K+O5LGxLbWsoRmDN2+FnAbXQoIxN7HTuzFf5SCa09pSGs7ihall/mf/l6mlLqqDwZhUx2n96SYnq9OIWL6XwH92HsM4qx2FZz/zkpK8G/51x20Ndv+rfXifHDKFK7fBxF06dPNDoegl+hudN6VtOYqCslUTjpLsc7IUYbkzfechlf8CXX/X/pkgACi1xYxxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(11063799006)(6133799003)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGEzNXE1YmxDd0RYbm5tZlpOTE5CbXlVU29FL1V0VGI1bXovZjhwR2JXREhC?=
 =?utf-8?B?K3NRK0NWV2NJeURMZ3d6RHRPWm9pUFUvd0RsRmFLVDNzZ1Z3QzB3RWtKeVB5?=
 =?utf-8?B?OEVwRUFTKzhnRDJBeXN3QzIxQXY2N01kMmRBVDJXWGd0QTlFQTRkUGFRcVp4?=
 =?utf-8?B?Z256Wi8veWpITXRCU0puakVyR3crNGdZRXNFV2t6NjFVWGpITGh1U1FCcGpM?=
 =?utf-8?B?ckRRdHRLSHZ3SHhpZCtsS04wQ29NSllwSExCTU95eGVEakRJR21GckxhZkhl?=
 =?utf-8?B?NHBCYjRkMGRuSndoLzhIbjh5L3gxSlpxb0RJVEozNHNNQ3lhcXlKd25PRmdm?=
 =?utf-8?B?WEdEeDdLRWpnSUlQVmdTKzQrSjBqYXhPNS8vTFljR3lYalE4Y0lTNHVSTElu?=
 =?utf-8?B?VGpockNrSE9ORWkyN2RRdmRpeEVUMGY4cTJtdER6bmVpdURBRjJCc1p2bmpP?=
 =?utf-8?B?MVFtUExlWUk1YVhrMWgzZWpSWnZzSWg4TnlrK3RzeWVzdmFGSi9DaHNoVHFw?=
 =?utf-8?B?bGE5cXQ3N3NkYzRHb3l1a1dXeGEvamdsbitOdEJQTmQxZUhHV1AvbkxUQXFX?=
 =?utf-8?B?SkU1eThzckRpSXF2WGpBSXRWRDgzTVN6NWpzK3puYmJsdStBWkhHN0NHZDZ2?=
 =?utf-8?B?VVJSTXk1RWZZSStVancvSHQ5anVHYnNCMXdsOWVuSzV2V3l6SkVjRzVjMUE3?=
 =?utf-8?B?U09CckRocUpQWHZ3eTF2MEo2V1l4SEVyVjREWVFRZXZNcDVSaGxOZUtiMWdI?=
 =?utf-8?B?UTNUVzVkY2VYbjd5WlNnSmU4ZWorOW5ZWTJzR2FQa2hqUkJkTVNDeHNhS3Z4?=
 =?utf-8?B?U2NacTZBZnBHd3h1dGwxSWtaOEhPbWZ0L2FubEpibUc3aG5CSjF3c2c0bkVy?=
 =?utf-8?B?UUdsLzh1U0FSTWxKU0Rzc01IVStlditCYkJpQzIwT3RMMHJQVjNwekFaNzlE?=
 =?utf-8?B?MlJxUE5jVGFZSUhtKzZvdjJGRVVhUVZPUGlxOXQ2K0M1VENlNkc2NWxRWmYw?=
 =?utf-8?B?SjFSRTBaU1BXdWpyTXJ5eVIreFNFTUloUVNoSUVvdlhSM3dYUE1mQmorVThF?=
 =?utf-8?B?Z21NaDdkMGVleFoxTW9KZkJYMytSK1hwVittaVBBUWxETkdBTUl3TERHQlY3?=
 =?utf-8?B?T1A0d3F0NUgyYnBrczZUWTRkeUUwUlFqVzZsNDV2akRUWnhEbVkrSlI2bjh1?=
 =?utf-8?B?NDM1ejFQVmJrYzFBZXQ3clM2R2pBVUtBcjJKcysyYzNmTTZjV1RCcms1NXdy?=
 =?utf-8?B?ODhLZzRkUWtpeElqaFhCekEyMnFtTlBhVzBIMTVLcVBEeTRDY2lvRkVsTXhG?=
 =?utf-8?B?bjBuNEo3UXJybGV4YlJMTHQvK1BlenUxZmcvaTMyLy9Vdk9CVW82TW5RT2lK?=
 =?utf-8?B?T2QwV2VRRWt3aUV3bFVQaGlUZU1yZjFobFVFdkMwVzVoaDBwaGJQVENpSG5Y?=
 =?utf-8?B?RnJGWnplbzBxeXZZbGRYb2RQRU0vMlJBVDQ1d0pNdmNySDFBbFlUQ0c4OW9q?=
 =?utf-8?B?cVZkRXdjWUgrUEU5R05DQ1BRQ3ZqczdKVVNvV3Y5QjhPdGFISDYrNkdjcnF0?=
 =?utf-8?B?ZUhjUndXdUE3QXh4b3M0TnpsYW9yTGd6OURaSkxoMytBRGxCYjNPNmJhVHpo?=
 =?utf-8?B?N2h2MFVjUHpWejVxQjFlUkh0L2MrNDdUTS8wdFhxMStZMWRHSTBSUE1Bdnd2?=
 =?utf-8?B?NXBYZno3U0piSkhXOUJLVEpWelAwaWpoNDNCUkxYUjIvYnVlNWJQeThTaUh2?=
 =?utf-8?B?akVya0xNMTNDbWc2Rjd1RjRpOFM4eU9qN2p3SE5ISEZHR1ozRWZCOTI1QXVo?=
 =?utf-8?B?WHBXY01sdEFHb1lJWWpIMkRVMkJ4MGJpSktmcFJIOXRzWm16K1J5RjYxRWFH?=
 =?utf-8?B?OTByVlFrNnZ3WHdxZktneFVsUjlBZ2hDYkpCcnlFSHNScnhDVmRGbUlIanlz?=
 =?utf-8?B?M1JIL2g0c2lycVcvTkhNZmh1RWRHMVVlWUg3cldCd2xtVmtSWGJjYjBjYm5O?=
 =?utf-8?B?N0E3Q3pxdmpiQ2ZqeW5FYWhIa2ZtR2k3c0Ewcms0ZjBBNVFoKzhWSk5aTWlr?=
 =?utf-8?B?cGlZM2hhQVZTa3F5Y0tvK0NadiswWllrU25HUWFVSzJ0ekNTbG5RVGF4WDM3?=
 =?utf-8?B?b244eS9PU1AyVHpLa1ZZR3MrWTlVM1kxUE5NZHV1ajl4TnpKZ0RUenpubDRT?=
 =?utf-8?B?K2IxWEhzSU5ibDBCRmxDZWxNTTVVQ0QxRHA5U05kc3pUemZGWW54ajBZTGdH?=
 =?utf-8?B?Q1FHL0Z4L1YzM2VQLzZxNHpZY1BLMml6RGI0VHgxZ2djd3U1QU9jb2RvblhL?=
 =?utf-8?Q?/TCJ2lk4Rl6V2b+kbH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c38036-d190-46c1-0c40-08df12bf1fb4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 00:20:19.0633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uf3U6CeYWwCSTcTPxANwMFgstb0sKobh319Wl7VgkN+9og58I1HNZVzBvAf20geV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8403

Hi Reinette,

On 9/14/2026 4:30 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 9/14/26 10:17 AM, Babu Moger wrote:
>> On 9/11/26 17:03, Reinette Chatre wrote:
>>> On 9/4/26 11:06 AM, Babu Moger wrote:
> 
> ...
> 
>>>>
>>>> Fix the issues with the following changes:
>>>>
>>>> 1. Update the cntr_id field handling to support the full hardware ABMC
>>>> counter range and ensure that counter programming does not interfere with
>>>> unrelated counters.
>>>
>>> Sashiko's assessment that this statement is not accurate looks correct to me.
>>>
>>> Looks like the enumeration needs a check to limit the number of supported
>>> counters if the hardware supports more than what can be configured? It seems
>>> awkward that such hardware could exist and unclear why the spec has a mismatch in
>>
>>
>> You're right. The spec overlooked this scenario. I've notified the concerned team.
>>
>>
>> Do you want me add this check?
>>
>> -               r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>> +               r->mon.num_mbm_cntrs = (ebx & GENMASK(12, 0)) + 1;
>>
> 
> Yes please.
> 
>>
>>> the number of bits here. Even if cntr_id expands further to use the remaining
>>> reserved bits it would still not be sufficient to configure all the numbers
>>> that hardware may claim to support. Are there perhaps more field width changes
>>> in this upcoming spec update?
>>
>> Two fields(ctrl_id and bw_src) in here are changing for this register. I dont know about other changes yet.
>>
>>>
>>>>
>>>> 2. Expand the bw_src field to 15 bits.
>>>
>>> Do the comments describing the RMID field width when reading the monitoring
>>> data (__cntr_id_read() and __rmid_read_phys()) need an update also?
>>
>> The RMID field width is expected to change. We can revisit this when that happens.
> 
> 
> This patch is that change, no? bw_src is expanded to 15 bits, and bw_src contains
> the RMID.
> 
> This is the new RMID field width for monitoring configuration, after configuration
> the counter needs to be read for the monitoring data via MSR_IA32_QM_EVTSEL and per
> __cntr_id_read() the RMID field is still restricted (although not enforce by resctrl)
> to 12 bits:
> 
> 	* 43:32   RMID            RMID or counter ID in ABMC mode
> 
> resctrl also supports switching between "default" and "mbm_event" mode and there
> is no support for the number of RMIDs changing between the modes ... this reading
> an event in "default" mode should support the same number of RMIDs as
> "mbm_event" mode and we see in __rmid_read_phys() (although, again not enforced)
> that it supports even fewer bits for RMID
> 	
> 	IA32_QM_EVTSEL.RMID (bits 41:32) are configured with valid RMID
> 
> Looks like after this patch there are quite a few different field widths for RMID
> between what is documented, used directly, and actually enforced.
> 
>>>> 3. Change "unsigned long" to u64 to fix truncation on 32-bit x86.
>>>
>>> Sashiko found that this change by itself is not sufficient to address issues
>>> with 32-bit. What do you think of dropping this part of the patch and instead
>>> adding your support to:
>>>
>>> https://lore.kernel.org/lkml/20260831174421.13921-22-tony.luck@intel.com/ ?
>>
>> Yes. I agree and support that approach. Looks like all the maintainers are inline with dropping 32. Will drop this change.
> 
> If you do support that change, please consider adding a tag.

Yes. Will do. Will review his code and test it.

Thanks
Babu
