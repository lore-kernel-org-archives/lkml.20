Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B755A312836
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888058; cv=fail; b=U0VBf6UepHPu41HMqHN69QHN4vPCjwZYDIyVucWeC+Dj/1ZGz1Ats0nNRtm+Zs1ydtJOzMTNjSH19krNQbLXsgdasObn/mRdCiaEnXoXfyFUWbrUv4KmcmaTt7fzuz476R+3gbyv0HjziNjEJ2+Isw6jja2LaRPbUknnMVfEPfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888058; c=relaxed/simple;
	bh=ohfIvBegHn8e/QApGa0wIIVZUERhL6J8+ff5wYisChw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uaDCWD+G0E6gR/vCOBVyksu88kBo5qoCDK3hxUu8cHPL0oABCNlXl//mNb6Lr0t+XVljrqQ3XjkBxvvm+WGh6xewR8bs+/Up3HixoiZ0bhJ7SUlrv3flges37znPw3S6GqyVvESUvu2vJ2lduV8LTLe4rfL56pZdzO6zOvnSEo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AcnSMHKY; arc=fail smtp.client-ip=52.101.57.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AcnSMHKY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nl4S2v5tjJPYGPsovWQCSIXLD7Tqf7K/3WOKIWlM4K97E4nvjats1D5KCwUadmEzx2jP9lFoi0PfRkd/JIMNJveYIGEDMsovzGU8MBnTmY0mWJpEdTiiDOinVjtvegDjRUE4fdbl+xOMjQCB09TbeQS6nn4lNUASlA9qUnXcwD1HQXxzD9KuJ/BU8CUgNNoOjxS2i2XXhBjssqUY7+PZhx/3JPKOLCUw4vnyzTRE186zM/hTWvNRboOJ86EmHUywVoob4kI/MIpJtgiXw7hp65jIxRnyxiTNfmVlQWUAMXsyRVCXYihRNGORnwICbmIANSnNgDtu2sBLchc2RFLjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubwLb3QpGtsWcKUx+Ws7JP+OREzZLx0BheBjxsnie8g=;
 b=do7aaqYGJOfNgQi6AXuxdQnE3qjBW2Lc0EE3bACVqEiclqvn5N4YduMoR2CL4D0iwn9z3sUJgSNAEM/U4VR2xSNMGG6/IkMMvB9ENe0Rdmm7sp5AbEApp4bfCPgLnFSYMceTHVKZNJWULSZekl2YdYTMB5UjeZpa5CIl4jrde8300FjP8JysHuepoBMpZfl37qGfINx2Yy9Dfn03CHLr/Lf0RtFZv3aNlf4QJDykoM769H4v1RKCIj+a3mEZxNDZ4TB9ql1w4vmHPteI277PGIIoW2CEkeivqdHEm7XNfOdqfO3b/on79QpMHeZCT6p8hiXTMO3hV7plGreWy5Ra/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubwLb3QpGtsWcKUx+Ws7JP+OREzZLx0BheBjxsnie8g=;
 b=AcnSMHKY0qo0SpdcyfOdz4jLG54KFmaLEM/T7pqwn+lo1zZuVNqLBBcvf8BW/7ssV8sX6zBiPoHW5oREdhNAVHNgkSjmuNPMxSs4iG2TVoOypuo+jkUZJ2FrOCbwHbsLwgLe6yk1jRkNpYBOjcGYb8gBVE63kd48P+QQ0emqQ+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by IA0PR12MB8838.namprd12.prod.outlook.com (2603:10b6:208:483::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 28 Aug
 2026 03:34:13 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 03:34:13 +0000
Message-ID: <19b402cb-43e7-4cad-bac3-fc5089353382@amd.com>
Date: Thu, 27 Aug 2026 20:34:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] x86/sev: Register the guest with the SVSM APIC
 protocol
To: Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <cover.1785375271.git.huibo.wang@amd.com>
 <0321fc1324c66bfc02b3c0f65ff5e7a9130a969f.1785375271.git.huibo.wang@amd.com>
 <0fbcb384-e06b-4192-a14f-8800d3fca81f@amd.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <0fbcb384-e06b-4192-a14f-8800d3fca81f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::13) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|IA0PR12MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: 092897b7-b510-46aa-d6d7-08df04b53b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	oMWqE0vEf3j8L/Rhy+BH6FIiyovnaLpPV+rKp+TdViGdn5xS6XFYdBG+2n8Kqlqc+6N7XsvWHDvXtwBE9ElPNasD3bmEDHG9wd25gPpwf7Tq92QB/iVYadlR6GqUxOr2nKJ6MbGdnUsCLnXKnKr+qnJGf2pNxXT0GUuvysIv45ELMMpGvSRN6k1uayKPfdE3nsAA0Ha6hcT25G51WXfMb0v0hJlyg8Z9xuTfnICIM+0x24Rjg/+6la9lRv5sKW/lNb7nTWtAhayoInN2g12HlNc0AWpvuXA3U4RwLZg2VRNfhM5/eTtOOvMe3hMOSdjnGmVk78Q3Q6N5nJc7pES7/gtuQkWtsOCWYlE7Hc4GucBLb5ZEUJLl+0XSRxnnlWnpt9BTN/zb9tEC4WDTNTgCtHruAPZPFL+Hw1eabjZi4AI0VXGPi8YEBAkLEAvliAc+vTrZzfUjfUnMLMy8DG3V7Etde5S4aWlxJkolHB3bgc8zR/Huu86L/EsIrAI0RZ3olsDbbKvrV9ZrtLmOl53Sx5OnbuuCQhl6S2ZH2NsungxchI5ojfImwpG2AETjPMgk9p/j+w651vErrdc7K7qZOSg0Q3q8LkHqiXxKv0Zy4kjKe0w6xujEG8jY1+DtOMl8u1X3WgpfbUxrgJO87K4JRza1OxQyAC3yg8ryrwBAdXI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjJ5eXJsdXVuUmpDcWVRU2lPNFJjR0t5TnZvQlAwaHdZRWZkOFk2TVRNQits?=
 =?utf-8?B?R3JsY2xmYlNnVnZWWktvSWYxU09SOFI0L1Y4YjltREljbXJ2T1lqNkdrT1JM?=
 =?utf-8?B?M05yMjYyNDhkVzNYeS9oOVFjaUU1Q3VJVEtxMis0cEJtVlFkdUFuNjM0L2hO?=
 =?utf-8?B?eDlyUW1EcUR5QUNhVGRFcGcyL1VKeDgzTkJTelJWWVV5T1NTdUYyZXpTZWp2?=
 =?utf-8?B?YnUzZGN6TkNEUnF2YkllOFNaQ3lGQlMrTHlGd3NBREF4UyswRGlJdTdTQjly?=
 =?utf-8?B?cnpDNTVVK2o5b3Y4VUp4YnkwREhHS2s5SFpVS1R5SWl0TnJtZEM0YUNSODhS?=
 =?utf-8?B?NWhPSldKdW91TzY3V1NZVU1oMU9SdkI4RmtkdS9nWEZ3OGpYWnhobmNYVnNZ?=
 =?utf-8?B?RklXRWgxWUtnTTdHMEJUeU5RVlFrTFczL09mTlBUdWl0K0w0LzlqQ013SVJW?=
 =?utf-8?B?N0NCWGRWTWRYUXVhZ0lBbnowZCtJZ0dhRVlVNitUOEZ4SjdySldiMDRKdEJj?=
 =?utf-8?B?ZzNFdjdBY3RLWXVVclVTemFuQTZQbnZmbUhGUnc4YnAvK1hGRHN3RTUva0V4?=
 =?utf-8?B?ZW9XWFhkbmJ3R0p3VlhzQ2lPVjh0VHdhRUtlZEVjMGFmTktiK3owMVFsdTJh?=
 =?utf-8?B?ZWtXNWJXcjgyYnVKeWc2RHBhYlNmazFWZGdRVmJwMytZZ1llZUNXTU5NamV0?=
 =?utf-8?B?NWVRaEZ1aVJJdVQ4S21aZ0hld0J6anNFdVNBelJaY0tETnQ3VFFMcFh2VHg4?=
 =?utf-8?B?RGpZMTc5RWNrQ3lDRHJCTmZISkVXR3NZeVZmMC82dEFzdzZScUVQcmNlWEt0?=
 =?utf-8?B?L1N0bU9Wanp4WHRiM3M5dFRKVndST1ZiZ1lQMmd4YnJPZW5yM0VGblNXY3FR?=
 =?utf-8?B?MUZNWUVqRHFQdVd3MW5Ga2NaYmVySW9NWHBKWEJjQUFLdXZJQzRoREZ2MHN6?=
 =?utf-8?B?dzByak0vVWxjNVJNV2VxeC8xNDRYdEhscU1lL2tyRm1IS2pGaXBXWFhSeWND?=
 =?utf-8?B?KzhWUzN2TGIxUzFHR2s5MlFmcUdoUmwvdVdZQjBPYjB2NjhQaDk4R043dC95?=
 =?utf-8?B?VTdsV3FyeUVQcDlUVU8rdTNoU1dqeGlQeFNONWRveEpvTkQvU1lVbS9NSXN5?=
 =?utf-8?B?U3lDalQ4ZHl1S2lEa0VvTlVPT0hWVDc5cGhBRWVJd1J3bnJJSUJZWXpraHZj?=
 =?utf-8?B?VW02cE5MTlZmSm9SRlR3SGNKYkltVnQzdG50NzUzU3BWMS8wWFpxcGxUYnpo?=
 =?utf-8?B?eUpoQkY0T0VCRzhnOHVFZVZiNW04Z3UzcGYyZVcvdTlhZWdCNVA4QWlBVjkr?=
 =?utf-8?B?ZXIyenpOZCtJaURmN21FSHVkOWd1WVpiK0U4L0xiRWdiWVNPSXNwOVlpTWpK?=
 =?utf-8?B?VlZOclJMTjdhRzZtL09aaGhXVUVZYS9KYlNMaFRpbWd5MkU3SER6UThCMjdt?=
 =?utf-8?B?MTFWY3hSYjU4L041TTMwdGlBOTlrMzRzUWx2VDBMd3NpcjgxTTZFZjZaZkVL?=
 =?utf-8?B?enlvdE45Sk9zaFI4TFBXTDZkQWtUK1BJYzN3VVIxaFRHQU9sOFd2NzhjbGRJ?=
 =?utf-8?B?Zk9aek9OWVlsNFRVd3BaNks0amNjejJrc2lmdWFMTEszRHIyaXp0RGxOUWNV?=
 =?utf-8?B?aW92WjNuUng3YWJUTVhGRDUzU1lNWWI4NWV1QmhVMzFiejY3SjhWWTRhN2hu?=
 =?utf-8?B?OFg0RGhJMmQveDBTM3RBRktIYVYxZEN6SXdDR3NKcWR3ak43TWNpT1IrT202?=
 =?utf-8?B?Rmk1dlYzRjF5TE9yUkVQUlpMQTJBbkxFMmRURGNPU0xRZ3E5WW5KN0tsb2ZY?=
 =?utf-8?B?SHQ3MlFmdnZXT1p2S0JJRldudjNoam83MnpBRTgxM3A0RnpwcWFEdEJsTFNq?=
 =?utf-8?B?SnJqNUNLSDRzakRYZG85TEdyMHVEV2hvTU9rb1pRVG5VRVJyRWIxcm15dCs4?=
 =?utf-8?B?MVVMWDF4U0JVcU5MRVp0VW9LNWc0bjFkTVVhK0dYd3pxZ1hwcGZtYzAzdFBH?=
 =?utf-8?B?SHc2UGoyNEIrSVBxTFZoRDJDSWdTK0VraXV1eGRZVnpoSHBkeWJDOXNnL2hB?=
 =?utf-8?B?Zmp1MjErRWF6MTZLdG1ySWtUNjA0elVDUU9XMm5MVjJDR0YyaXB3aUZBVVBP?=
 =?utf-8?B?TzQ4ZmdEdXI4Y0RXZjFUUHU3eHd5c3loclQzZ1NPZDlUcFliZ3FOeE5QTDhP?=
 =?utf-8?B?THp0STQ5Ukl2NEJhWjNZOFR5OUxCV3RkMzcwUVJ4KzV5bmFFZTJxOGNVaUlj?=
 =?utf-8?B?ZUhnZDlzVGhkaFBPOXB0bWQ0VitFenVRSGxWYW1tZk8ySnNOYTNFMnJ1dTFk?=
 =?utf-8?B?bmU3d0hQRTdwSlZwckVKQmR3eHVzTC9EQmcrYlhMOGhISS9oYWdKUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092897b7-b510-46aa-d6d7-08df04b53b02
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 03:34:13.6754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oI/xij6/laLkgHBe6yHN7zS83qy0y8CeFWgxECE9p3N59oRukje75mPETHs8qjMUDQGR1x+e8K+7bohvT07TUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8838

Hi Tom,

On 7/31/26 12:18 PM, Tom Lendacky wrote:
> On 7/29/26 20:48, Melody Wang wrote:
>> The SVSM APIC protocol supports 5 calls. SVSM_APIC_CONFIGURE_EMULATION
>> (shortened to SVSM_APIC_CONFIG_EMULATION for brevity), call 1, provides
>> the controls whether the guest can make use of the SVSM APIC protocol.
>>
>> Implement this call, and register Alternate Injection for the guest
>> by default.
>>
>> Signed-off-by: Melody Wang <huibo.wang@amd.com>
>> ---
>>   arch/x86/boot/compressed/sev.c | 17 +++++++++++++++++
>>   arch/x86/boot/compressed/sev.h |  6 ++++++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
>> index 655291a03dcc..a98185b3869a 100644
>> --- a/arch/x86/boot/compressed/sev.c
>> +++ b/arch/x86/boot/compressed/sev.c
>> @@ -518,5 +518,22 @@ u64 sev_prepare(void)
>>   	if (unsupported)
>>   		return unsupported;
>>   
>> +	/* Register Alternate Injection */
>> +	if (early_is_sevsnp_guest() && snp_vmpl) {
>> +		struct svsm_call call = {};
>> +		int ret;
>> +
>> +		if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
>> +			return 0;
>> +
>> +		call.caa = (struct svsm_ca *)boot_svsm_caa_pa;
>> +		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_EMULATION);
>> +		call.rcx = SVSM_AI_REGISTER;
>> +
>> +		ret = svsm_call_msr_protocol(&call);
>> +		if (ret)
>> +			sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
> 
> Shouldn't this really be where the permissive setting of allowing all
> interrupts be done, too, instead of where it is done in patch #3?

Yes, I think it makes sense to allow all of interrupts right after 
registering the SVSM APIC protocol because this is just another SVSM 
call that is going to happen and I don't see anything wrong with doing 
that there.

I did run it and it works so my next revision will have it.

Thanks,
Melody
> 
> Thanks,
> Tom
