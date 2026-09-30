Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4313E3178
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808482; cv=fail; b=rBY/iPb1eOv4c8lxKLNXYFRZRGfEdjuy9uJlVRbRM66P8JxxiOUnx29extiiNrn2aWxtSrrYYLubJR7yv9s9p+8af6jPLs1b90i1iZJlMl5+vPzh9MZrwuWh6JXx9ozeyC9AnCeN8St9IEOU4yQBgQc7GINcn53D/8cUjWgvTj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808482; c=relaxed/simple;
	bh=1IjDaW6isxB5eht3rSSMWVclk7MNQtfjlROQ1pJ6ww8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RVdEe3zynPqr1jVoLnJAiZlu7bX1j991kW3L2VF7b2VmOCzrTnSQchyxeiipjAz2nH8Mop7NMNRyhcxqIBKtdD2tVIZxTPE4P3rNmI6E7A94LPnkmHx5iKizVilcCq9Oe3ScXtds6n4b0AdrSZCzlfWvrff56VePyQ9rfXs+I4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S0KxMGJw; arc=fail smtp.client-ip=52.101.56.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S0KxMGJw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiQcllQ82ABVGwFqFkdjs2ZRIuPANrMuhIgInULwatFsqyK2kthyph5slPEYLwOxsWTm1rwyMVG00r/tMNFocaLUjd0YA0Zm5/lsgsKUrOa9+l0WOV0avGN6gSC5A7Rx8PEUtAUUa68ui2+abAnwZ5acZS2I7iJpycD8QFD5WEgFicxbW+3EHjuppI9YbkQMIS9PrBBvcJDGbIP7QvisNNaEq9EdnZgaGGJSTLTeSbqJ39UK/Y8BATDy3EytpAQpJB9mSnI33xbZrKx3bDcxbBpjAYSO+IRiYLanQHOi2j0J7WUBEFMB9fHXil+1WZqzVcf0o8nxjaJ91nzetJEKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q662oIzyBI2U146fm7+mBKB/EH5e43IMxZU/DJ+IuCU=;
 b=lwZIar5M9C7vS6Ww1xDpI+F9hSBqDJ3Sxv084QUzBPJcy4L8p5CUTagsLEnL2rTDw+FRGybJC4Ilk1t9pcDSVnztXMTnv57aZwidejWbbhp3Shg0aJe8AI0BDcUIT9lF3OMvPOWpPgtm7rz6KYn3bwfvxXoUyLX8GGGIFNAj92iSqhhIKAwwecjfChRo2dMeXS7ESehnJT9Qdmxj2TfL7IuSxwpEtWc1DKbQHnkdJVAWrGlNEx+MUyQzXQhZn4vkxhwDwSMkgBXAFOgfrAxESorbg4kmr4+2GUUxNXvXyAzSpgSdV+L8hxthX0+aMmSJIeU/Md06ai2A0ugrQwSXnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q662oIzyBI2U146fm7+mBKB/EH5e43IMxZU/DJ+IuCU=;
 b=S0KxMGJwfs369izwaqlHZkV4ds7E0J0Dd0kC9lGFl5KC3PPsNo8gOlIueklg64g3DqVN0kPv0mmAc7ItMe/wBREz+FBUckGVmdM21k7wcV6t3D/FA7RgOn52iow4Ee2Qk1Yu1eEsqdMvoFkLezagGHhcQB250W0Ba+QEj/wXJUM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 22:47:57 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 22:47:56 +0000
Message-ID: <fe6b2caf-e010-4548-a0e0-45a8abbede8b@amd.com>
Date: Wed, 30 Sep 2026 17:47:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86,fs/resctrl: Use a consistent log prefix
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, bp@alien8.de, tony.luck@intel.com
Cc: tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, Dave.Martin@arm.com, james.morse@arm.com,
 dapeng1.mi@linux.intel.com, peterz@infradead.org, thomas.lendacky@amd.com,
 chang.seok.bae@intel.com, jmattson@google.com, kim.phillips@amd.com,
 prathyushi.nangia@amd.com, acme@redhat.com, nik.borisov@suse.com,
 namhyung@kernel.org, linux-kernel@vger.kernel.org
References: <9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com>
 <bc637e9a1f0c4624a01b8208f0e53582cbf21886.1790721445.git.babu.moger@amd.com>
 <47dbc002-43ca-44f3-8f9d-cdab2c77d542@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <47dbc002-43ca-44f3-8f9d-cdab2c77d542@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0154.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::27) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: e183f950-8065-42c0-a4ae-08df1f44de63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	k9BIGy+BQ6FECyNeZsKSk5CAga7Hhth3dnmikJX1iNws3alwHqM23ZLobZifCmZ9ulpsze+0rVVIveVllxEkHGvWJ2whrbiyldoNeUg3mbUshje1AfEh1fUCWsHflubPatBN9EoxnqosiWWqaimBcIkaqp5AH1+Wy+w1IarpYZgVuR3mzXeEamxRx/5mS+63RDnX+S4UsN3Y1ocoV6tPXrSsMPk9sQcLcwxse7auRB24UtisB7wDDQtGhuc/gt/5zDbEX95bRbf2WXSJ3aWkKjf6uk0CWndEUpHezItFNgcdVdIv2R5rj18hHwhNI4nmIMRDATfnCWzUx45bjG+t3fx4ZIvLCSBMsTQfcx48sUIiKY95156nSPJPAHICMqAuCcibGTO0+faAEjUnkTHTF12UhgJKcPKdHlMC3izDh0YyGzlCVn9gU3XpaCCWear9G9QSrrzD7gvL+YYIRaJxTl3nwzGxuXRVDXFAia0SLUQHPuqg5AlTSz012+t0QQ7RKGsWGQBJV6aBfWTKh1VRSftngi8BdEDf8a2QDOdH5dKkcrxd5EMWBbLCbMz4sC6WE/b9WEN7+m8WJvnEHQSv3besz5sISIomkClxEvmBWMkh0heTVF/AXYqSgpw3y0TcDwTVkpscWm6caD1B3e+O/lGu/wWqqyY4asfiXLkt43U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTc0bmVOZ1duUlZwVzM1dExPQXo3S25Pak80NU4yNE9iLzFoaG5OVnRBck5O?=
 =?utf-8?B?VDE1aXFGcGFyUWdyMTdjR0pLc01SVkdWNGs3TFIzbE9DL01GUUJLc253S2p3?=
 =?utf-8?B?T3ZVZ1d6TlFvQUkrdXFhbHpRNVUxUkxzWE8rOW9KOG9KZk5KdzJLcXFiMWRw?=
 =?utf-8?B?S3UxTzQzZTI2U3ZLMHdFSklCRG1aWW52VFQ1UFFmWmF6K1Zyajc1WHFUUC92?=
 =?utf-8?B?VUhNRkhwdlhDd2ttVE83SGlwWWE4RXk3anEyZjVQV0h5d08rNGsyN3pqVGln?=
 =?utf-8?B?V0ZoRWZWVHlMdjNEVVF6aExQTkVmR3Rxb1FWSUxsNXhWWHRKOWVuUllzNGVO?=
 =?utf-8?B?c3pBdzRzMVB3aGxOTEVwUUY4RnN0bUx2a0hrNVlLYUxwZ0s3MytsZ095ODZI?=
 =?utf-8?B?bmRzL2dxajY3amtWdkQwNW1lQnh4aFlQNUJ0a3JKZDB5Z1JTUU50OXZXN0dH?=
 =?utf-8?B?bkM1ak10YVNFRU4yOUJiRVdBamFLTTRhSURpWnZpTlo3S0JpZGNqbG9ZMkRu?=
 =?utf-8?B?b3RGM0ZHTXMxMkZXUllpN0lBY3J3N0lzdlJvT1RXRWdBMUNkK1d0eDRYMldl?=
 =?utf-8?B?RUQrNmZWWDlFZE1pN0d1azJzYUpScnd3NGsvajgzMVBFZVl2Q0l6d0NkM2RJ?=
 =?utf-8?B?YkhlZ1pmb0Y3VGZZbWFjWVVhZ0lSWTYzbzZNVVRCSmwxdHo3SkZRek5HMElH?=
 =?utf-8?B?MUk4ZkxNNEE0MUNFK3l5azdzMWxINnNxeXNFWmRNMkpndjVuc25CQ0NTM3hs?=
 =?utf-8?B?Sm9FMGJRU3VYRTVkaG10aWVTSWZUSTZqQW1zdDBxUmVBL0VvSm1ya21WL1Qz?=
 =?utf-8?B?MUNMRlNnZ2VqYmFqR1Z3ZFFadEdoQitWdmxrSTFwUktiS0V2QTE4N2xudVh0?=
 =?utf-8?B?SmxiNGZsZTh0TG16S1RUcE95TjRXRkd4MDFHKzQ1ei9wdC9Zc1BFYUpNRkRK?=
 =?utf-8?B?bXRXUmxOaUZoNHlkSGwrT3lHM3p4RzlSWWZoOGprN1lxTkJEKzBJNFRsRlR4?=
 =?utf-8?B?QURYaWN6UVNmcGY4dVc3YmVTVGJpSDRydlVFZDBzSGF1VGgxKzM5QnJ0aU0r?=
 =?utf-8?B?akN0T3RBeEE0M1IwVWRVaEdITVZyRzJJOXlsRnd6OW9BWUtVMkUwR200c2VN?=
 =?utf-8?B?YlY0RE5pbkxyUEppQXk1NVQwY2VEemhEQXkxdWtaeXc2Z2lFWGZuVFlYT01G?=
 =?utf-8?B?SkZTNjNJRmxkSEpacjR2dmM3T3dpTE92bnBUVVBnOTRkNWlUcnNvMUNmWVYv?=
 =?utf-8?B?OU16S1lKZWFLN1JvKzNxVzZ2N3c0aVhPUi83aHp2WFVWc21zOVJOOFNQU0FR?=
 =?utf-8?B?Z2Vlc1J2emQrTG9tTHY3ZGJ6ZStMd0dGSFFTR1ZCRmoxelRFak1aVEdabUlJ?=
 =?utf-8?B?T3M0cFdJblFSNVQ4VlMrUENIN3lDOW5CZ1UrN3M1T3kwcm1GNXpmR09YQkE5?=
 =?utf-8?B?algzaGNFZjU2QXhFYVord2N0WTJBTS9qWUNQRjFtYVIzWFlwdnptQXdUOU5y?=
 =?utf-8?B?MnRrZWpITjF0UGcydGRPdFd5dGpOZWhTYTEraGU3K2piajRFMU9rS1VaM1lB?=
 =?utf-8?B?T3dleXpBZ2FGblVhbU5rN1FDUzhINU5SOEtOK2dzQ3AwT0lCcnVIeEV6S2lT?=
 =?utf-8?B?NGxSL3hXcmdCMjV6U2d6dHJUVEdTMmJsSmJqT3hKOHpqeEw0WTArS1k5V0Vr?=
 =?utf-8?B?cG42T1g4NDc2ZU5LOGZpbHpsWWR6OXE2Q2ozd2pONVRSNTh0WHh5dzYwamRK?=
 =?utf-8?B?aW9UQ0RET3NLSEtGSTRNOGJrczVyWTRNODFJckFkTjJub0ZyMm9nY3hMTThZ?=
 =?utf-8?B?U0FjY0NnaFFVUmVYaXdsM2lFNW5YUTF6TnZjK2k0b1BBRUlwVm1zQ3JCb09h?=
 =?utf-8?B?eXRrUzBWbER6aVdVY29tSkcxNHYxejVvU3hYWHVTczF2NTBEV2ZIUmN6YnJz?=
 =?utf-8?B?Tm1uWVg1YjJETjdjMnBsS3NGZmtTbkJWbmRhTjYzTGtSMDJmRFY4QUVhWnNy?=
 =?utf-8?B?MGlpU2FWY3ZQdEhSRzVmVVJQZGZORWllRStmQURMYVFWdW5tYUhCVjVsdmMy?=
 =?utf-8?B?VTI5ZXEvVmU4cHREL2lwTnR2dll2K0c0VHNOMUlXR09QOFpQaHdyRFlIdll4?=
 =?utf-8?B?NHFYd0FkNlEvemZJRDZqWWxwV0l3L1JKcUZmcUF4TUtrOWIyaFZjdXZMYXgy?=
 =?utf-8?B?cDZpVzFpRHN1RmFiNG9naUg5UkxtL1BESy9wY2hyck91T3pJdVJQMHZ2blp3?=
 =?utf-8?B?VERsUzJHYldSbzd0QlBMQ0puVktTWHFYckNucWt1UDZKcEl0REdhcVBOMjJ3?=
 =?utf-8?Q?q8ECwmRxS5fVUIQ2PB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e183f950-8065-42c0-a4ae-08df1f44de63
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 22:47:56.4135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aEbcq+ZmusdySdij5kQbWY3g0K84Pu7E7aUxoTCZcUQriPuesUSBojnng54Ct1w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055

Hi Reinette,

On 9/30/2026 12:24 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> Thank you very much for doing this.
> 
> On 9/29/26 3:39 PM, Babu Moger wrote:
>> resctrl code is split between arch and fs/resctrl/. Some files derive the
>> printk prefix from KBUILD_MODNAME, while others use "resctrl: ". Since
>> KBUILD_MODNAME follows the object name, messages use different prefixes
>> such as "rdtgroup:", "ctrlmondata:", and "pseudo_lock:".
>>
>> Use "resctrl: " throughout both directories so all resctrl messages have
>> the same subsystem prefix.
>>
>> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
>> index c22c3cf5167d..04b665277884 100644
>> --- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
>> +++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
>> @@ -9,7 +9,7 @@
>>    *    Tony Luck <tony.luck@intel.com>
>>    */
>>   
>> -#define pr_fmt(fmt)   "resctrl: " fmt
>> +#define pr_fmt(fmt)	"resctrl: " fmt
>>   
> 
> This hunk is a bit out of place since it is just a whitespace change. To avoid this
> surprise could you please add a snippet like: "Match indentation in files that already
> use the right prefix." to the changelog?

Sure.

> 
> | Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> 

Thanks
Babu
