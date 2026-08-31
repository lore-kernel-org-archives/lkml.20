Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256FB3BFAEE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216302; cv=fail; b=tPCU/a4+WorcLbLP8Rf92WWL6AoVAuOPI5vPj3S5XVQUqqVBnlwKO82ogUbEcV6NjmXs0lorcQjvEd8eJIsGN9cQVYSkzcbk83kp+TiyBCCEdxOKIut7sJw7R01WHJHyuwA1ZGwGht8Iwlb21klwbW9sfKENzbV7h3rOJlYnKs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216302; c=relaxed/simple;
	bh=TVQpjMrBgl972wQnGROLb0suZUS3Q86nF+hR+GCJasI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sSTMaGTkf4gq0fWzeRLESb1Awzv+qi5qHSa1DGBVS2N+fvMK9IvEQVesrmeSLFItcidSN2QE07pXMYvmmDFbrn/vcTdFXKXQHBwchcKCNA9VDucsYMMBQeqxkp0G4iIV1DSFoM1KaL7qccTCXRjR/X6uE91ONGthvSS7melBux4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ndZkXnti; arc=fail smtp.client-ip=40.93.195.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ndZkXnti"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOVpH5S5koVN/woL8eQLhFCUnMmITHYFPelOSxaQ/coffxub6VWoMLENdQtBdaopnPSxKwfHWGKSb60Bf9RtPoOQ0GuPv+HI8Ky3C3GPT/Kh3fTXWsKR8oLnNEAmyaMnxBwoSrM5rMhAM45FNeLlrCgPYMAcm4eRLJPKc1wXm2l1W/aE64R3Ae5jvhSIIFJEysoZ1BZDgreCZCf+gK8BY1SZ7B1chgnI/WogfyvpC2CjHgc3YCTW70xFV4brnQm5EgHLOwqy5a2p/OSvRWmq4T+wXd1maFArQZifV2+4PqR0oyhCo9FSDNhpkB+vFKJu84S4olreRXTECYBQxOcOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV6FTXHQ5UKUM3SnTT8wED6Qkx5nLZs1t9ZZQsD0MJM=;
 b=MP/moDjtE/2+1XBgZiBNh5ZQRKcV/10qIHzYFvwiCgraRgfhCyhfY3MEag8fURp9DptyeW/eAerw3Hx7KWgGXySMiyfpq2E+FvgVzM1WxTLLXvUeAS4mzcbHChYuZMunBFGscCAuHowv2z2A/eNLLnE9P1dZY8hRfVSakgfw6VePXVGh+ZZZglGqIRdXC/HhDtnwtmr2iliKdpTJzxXNQ40OSyCnruRWVxCn2BMP+hae7GN50OKZldzhQY4MM4p0x/vMKdCHem7FLTTuPiZIqOhk775QSX3Kk8fGRzZ2CbA/KENN73dKihl/n207SXrxPv5DqZGo8Gnu0logvStpXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV6FTXHQ5UKUM3SnTT8wED6Qkx5nLZs1t9ZZQsD0MJM=;
 b=ndZkXnti6iUoIEv2XoO90qriTOGKeLqzAqdqgTQjoBkE7E7/24FuD1Tr8/N/PJmVq95IVxHWMk0rXZ/hfJeF9J98E31iUfTirAO4j7Qg0tfsf7JBr9jqFGRMP5EYHKu8EGLj2Vf+66uwJbnUIHj2ooX8uoB5L0EVFLpej32u99A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) by
 CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 22:44:56 +0000
Received: from DS0PR12MB6655.namprd12.prod.outlook.com
 ([fe80::cca7:d50e:86e3:24fb]) by DS0PR12MB6655.namprd12.prod.outlook.com
 ([fe80::cca7:d50e:86e3:24fb%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 22:44:56 +0000
Message-ID: <caa8512b-8262-4007-93b3-318349cb80f4@amd.com>
Date: Mon, 31 Aug 2026 17:44:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bugs: Only log missing retpoline when it's actually
 the missing mitigation
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Michael Roth <michael.roth@amd.com>,
 Borislav Petkov <borislav.petkov@amd.com>, Borislav Petkov <bp@alien8.de>,
 Naveen Rao <naveen.rao@amd.com>, David Kaplan <david.kaplan@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Nathan Fontenot <nathan.fontenot@amd.com>, stable@kernel.org
References: <20260826222228.3668418-1-kim.phillips@amd.com>
 <ccy6cxmro4hyvradyddbqubt5jlth3l7cwp3v4obz2lviazyry@2d4ixypnltll>
Content-Language: en-US
From: Kim Phillips <kim.phillips@amd.com>
In-Reply-To: <ccy6cxmro4hyvradyddbqubt5jlth3l7cwp3v4obz2lviazyry@2d4ixypnltll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:610:b2::34) To DS0PR12MB6655.namprd12.prod.outlook.com
 (2603:10b6:8:d0::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6655:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d49cf5a-d462-442f-bf7e-08df07b17a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|18002099003|11063799006|4143699003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	Wge0kBFP9uoHPFji1rSSta3PuVFCyjqdzFN0e+eQ1svCz2A79C0cAy59I/oG0Lec0Jve6xISdEAy1Q5uBD2vKpk8R4o/vvSzr6s8tmlvim8CtrAL5P4Bmxne2KopALMAxWP9SRwvAibP/kitiwybfOfGfGpQTbAlsMjSWo2ns6r9Ko5BUcEYoDWX5FekQpd7rmpQ4i00zJ4oLF8c4HfQ3F598Xn/PiqU9M75hQaDupB9jS3/khI2b9mfB49KqPr9vfFYuUbuaQs5ZgVSSdeB4kUsdqvtxpkUcJYD8iC53+MQCRi6MO4rn/EyapWZ5uAS5YCq4e7MMqmpLFxtortxpycdHuhts2M/PmD0qN9qD48n3N4fVZZXhQsjFnXmLZoGsT+RZOgboFzJCaXjLoj/2ZSkLToCX7D8imISzbyf3dK0938vYJ92eqZpSkagVy7gli81aaTAggHdtkBl2IinYHakO/OTUXiiuLTtiK6e7ZUQ8J9O5tEaiTJ2OopNiCpVty3VXzucaGJl39vw+klXnWc0JsQI6ZcOAJyRT1KqRttWAB81jWneyNdsu390lRJXvHWkU09MiEo/1F1TOdgzE6DdWvfYHMkmED3I74rmWCSOypRWrQ9ojNEgXVwT/zPCCnExX1UmZ5uUhR5lak6cJ18ffXwgYtYj1IedUuDoSEY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6655.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(11063799006)(4143699003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnNPZ2xJMG5jL2F6MWxROFNaeUUvZmpWSDVXNThGVGxkd2RPa0tGaTFXTGxS?=
 =?utf-8?B?aGhTamlKRXZkSzBKVUpvL3haN2JRWU1rTFFPMEM3ZG9jaWpBdThzcFBESTMz?=
 =?utf-8?B?clI5b1ZzZDZFZ3IyOTY1N05LZzd2V2VCRk9uNCtDKzRtNFVUTlIvd0t4eWR1?=
 =?utf-8?B?ak5raFVPNUNRMDFNOXJmMGxTemFZWGFlbXFseC9raTFyeVc0anJlY3N4SUo4?=
 =?utf-8?B?QzdmeXRQRWl5cHpqNHczUjhlMUxFbHprS1NsVDlVTnBHalBCNU9KOHQ0VzFw?=
 =?utf-8?B?SXhWTlR3TWdYcjB0YlUva3N0UEowbnI4NFBMclV0eVlHNXJ3cVNHRnl4T1dv?=
 =?utf-8?B?RkhBQmpCVElsQSt3SHFKUGFBSmg4RVJGTk1UKzd3V3FVd0R0YXpFbFhuVnZT?=
 =?utf-8?B?S3I3ZlgxcFJFbjgwNUdaWmowNWFpL3NvUmsyMWRZLytzZU9yRHNMaVNyQ1pi?=
 =?utf-8?B?WFB1YWRzVC9ieEtlTzM1ZENRbExuMkU0b3VCZER6dHlUVGE3aTV3YzcwcFEy?=
 =?utf-8?B?SS9SckxPWCtTVU5MT1QwelMzcWxRaXdNcU94cmFCY2Q0SDhWd2pRd0w4Si9h?=
 =?utf-8?B?bDBwYXlkTmM2TjYyTDhjUXJnT0dJRXJMZzc3SVNWNWk4L3dudlJXZ2RPdHJK?=
 =?utf-8?B?a3JVNy9DdWFpcUMxNGsvR09BMXVaSjBxTmpGcktXVERhQVFweVBXL2VKSXpn?=
 =?utf-8?B?WWxSK1F0aXZ6bVVEZVluVFljdkpvbkEyUVZlYWJZVU9CRjJvd0tORG9EWFNY?=
 =?utf-8?B?SjVhdkJsUG1GMlpOSkdNSG5rWE9TNWZPeXdMdlowTUJMYWRrTjJOcE4wU0NL?=
 =?utf-8?B?SjVoMEVmSkN6UGVFblpabEc5a0lSVWtxZzdNV0VPaG90SUpUbXpZakN0ZDht?=
 =?utf-8?B?c05hUFI5UlY3UnduSmZiaTF3UmFXbzlsMEg2OTFSZlpPOU94V25uLzlNZFpl?=
 =?utf-8?B?eUxTSEx4RkZ1cGNxNzlaenlSS0JZMzVXRVg1OHRmZ3dNNXRQeUpTb01rbHov?=
 =?utf-8?B?dGlHWXl6T2FHMXMrNEVSSHBGOWpvOEx0d1pLbjBQeHloN0hNZnFMMnRJMDZV?=
 =?utf-8?B?dHBiL1JvMzdpRmFMZ3U1S1FQUXZxbDIzd0FXS2w3Y3dpenNrbVVPbWlaYmZQ?=
 =?utf-8?B?a3hWaktzOTE5dTdVSnd3dlBKRDhBald6U3c3U0JTaTVVbjhqOVJzZlBDeFZC?=
 =?utf-8?B?Z2xjMmY4LzdYbXdzcFlZZDdtRXA1a0hwVFRNTkR0ZW5DeTh1RklLeC95NWZJ?=
 =?utf-8?B?ZXhHa0lZSFVueDdEZ0dHaE5jRlRIU0V2SWV4NlFsS0FsNkVCYUNNYUFlTDNJ?=
 =?utf-8?B?dE0vMHNWU01QbnlzU1VMc1Q0OWxJTnB1RWZIUjBLd3pucGRrSlRUalpoTEp5?=
 =?utf-8?B?UDByZy8yT2ZsdDNkNlBrcFhUdkI2eExXWlVDeEVEbHlac3VuLzZGa2xFU2I5?=
 =?utf-8?B?V0F6UDlKaW1tcmVXcEtYWlltdWtoaDRPb2c2MTFmUTgyUWJ1d3hGK3dIWTFh?=
 =?utf-8?B?TDZDUXI1a3ZNdlZQenc5VE5HS3lQQVpwVzY3MFRqWTl5czMxenZ2dG1mYkdT?=
 =?utf-8?B?dzNhTlI1SnVtSUQ0R2xRSTVBZ1BxTW1SOER0c1k2a3V0cnJBYkNpYXNqQTZF?=
 =?utf-8?B?YUJSaTBEQU9pem1oUk4xTVF1akc5WWl1RE1jVWNXQWxndk55dGNUM1FtdUov?=
 =?utf-8?B?VnNoZG1Ednp5TnFLWUJHN2FybDNYV2wwSWQ3TFVzdWFUZnZndnYvMkZMZDZR?=
 =?utf-8?B?OXVhb3E5cXJGS09PMkU5cWdsUTFCeWdHVjNiVGpMMVVrZ1FSQUpZU3JpZWFp?=
 =?utf-8?B?a0FhdXBCKzRzU0psbWZOTWhYVGFyUERGMDJRMFRzM2RnM1dDN3ptSlhsVVI4?=
 =?utf-8?B?MXgwMVFWOXQrWW5aS09wdDVPYy9NUFJEVXVJMDJMeThmOEpkTzExaVZOYkpS?=
 =?utf-8?B?a1RYdWpHWU50VVE3RElvbmMySWsvSFJSazNld0hxTVlZMGtqaW1LdEtCSUVN?=
 =?utf-8?B?TWVuMEhQdGVnekEzTVN4MnhoMmFXRk0rNTI5bWVkSlVXclNGVCtKUkZRTk5i?=
 =?utf-8?B?NGxzT2RJZ21WeVFEcUpFbGdRYUM0cjEwR1hyamtnQkM0OERWWWhqUU5SWEk2?=
 =?utf-8?B?d3RFWjhkbytPbnc3eTVJbmhKTkltSjV4RGN0N3VQcGw5YnlyV1hzcHlHTlRa?=
 =?utf-8?B?RTdjWm9MUWxkTlgzQ2huNGJEamhxUHE5NHRhbnUrVWVPRzlsSDV0aUMyNGxH?=
 =?utf-8?B?WlJ4WDc3Ykh1dzAwbCtNaW51cVBITUcvb09DNng3dko0UTZrU1pxdElmRzlR?=
 =?utf-8?B?V1NES0JwNnM0UkowUURsMG5Md1NXTHFrT1p4ZGZ4S01JMUNyZGFjQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d49cf5a-d462-442f-bf7e-08df07b17a9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6655.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 22:44:56.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OC5b+RLb3emePqGTxmbOi5ACXUL5b+9F402ZdvmM3sY65NuJ4/wrCfanVfMxo9WG7dUq/8SH78LSBTd5/+Kezw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482

On 8/26/26 11:59 PM, Pawan Gupta wrote:
> On Wed, Aug 26, 2026 at 05:22:28PM -0500, Kim Phillips wrote:
>> +++ b/arch/x86/kernel/cpu/bugs.c
>> @@ -1956,10 +1956,8 @@ early_param("spectre_v2", spectre_v2_parse_cmdline);
>>   
>>   static enum spectre_v2_mitigation __init spectre_v2_select_retpoline(void)
>>   {
>> -	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE)) {
>> -		pr_err("Kernel not compiled with retpoline; no mitigation available!");
> 
> The claim "No mitigation available" is really the problem. And, it is
> redundant here because the final mitigation state is anyways printed in
> spectre_v2_update_mitigation().
> 
> How about just change the message to:
> 
> 	pr_err("Kernel not compiled with retpoline");
> 
> It stays accurate here, telling retpoline mitigation was attempted.

Thanks for your review.  I've made these changes and reworded the commit
text and submitted a v2 here:

https://lore.kernel.org/lkml/20260831210916.987152-1-kim.phillips@amd.com/

Thanks,

Kim
