Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012015.outbound.protection.outlook.com [40.93.195.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B32645D921;
	Fri, 11 Sep 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115904; cv=fail; b=kzkeCsMS7BadD/AIDaXQ0NJgNGvQv2CbSkWt4wKqwlNSSUQzY1jClg6cFVeNslEtRnJ6DyjxB1NgyjtzVDpldb7hOkLf9qlAvgFXjaAsVuikR3cqMnTo+uaetucdFbe8PEt+DTJFj9OmoYtwCHCT/jXMj5oOKIwZJ4/yx9nEHPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115904; c=relaxed/simple;
	bh=43G3LBjMJWsNAMzuxI+3mky3yRAvpHpiD0Nz8YWm38M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dtd6MXtzowLZCgzhydzr3wWOB/NvBNYK+b6cd0rj+6HT4+NoXQyWM75wPfQ1zakViyZ63+PDgrzBml0KOd911K9PKPtCDi64awqdkAph9k171pWEE1+NIcsEPJB+cRBgWbJ1ZVHCECBaELG0/4+7WQEUyaQc/8CRMw2Zd8EWBAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k53wXzrR; arc=fail smtp.client-ip=40.93.195.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k53wXzrR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0qw4260sDW3sLZnL2Y++60h6mthdiqf6dt96YQNKVvtkvPR9GcbHyM9nwL+qkprqAT0fsxSoHzPWfVfKW1l68Hjvq9KFmUj2vFwUvd4118Cv6vj0AKV5k604q+6EwSNhzazWzm2AOCdlmy+3ysHBRc0PP4D3ZGm1q7aivByaG4oWj8uoHufdXZdMoD3YuUgq2eALbhv+bQosjHjN4Urg1u3j+GRxllNNd94Ht45zzKrOLoVHZEH5sc+EAReYvBFLNqA5DdK91kPRkmKBPEqe+QJN/Mr6ljdSzvAX0GKmi/Baad2wCJIghk+Ge9c7BeIdzcf6WOqhe094MBpIU/0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZS01/yKqoo5wIirjCevD0zNXfRiSI+c6lGzwjS/tGuo=;
 b=j1gUKSRorq/P8d9gbZ62Q/br/6AY3vNXZ1LjJx2PRBFz7gSW6CmBffNLEDgfpfZXd9Z9UKQXETxuQi49xjFV5JlrduCAxaP4SK660j+Yu5fc1Q1kOgEX5UdTHGEsEeP1V0JodnI7bSib4buhkpxnmihmqlJC9+Afq0n/IqVUEv1sBme/FN5CE8+AVF6h49h1iWlnKzlMNOILsBEj681MUBofFxgpmYhL94anOrE1p/gw9ZxBw2KyYH5N9o1RqZNlmODcx7sv2S0A0KJrMsgS2JIJoXVGQLpVcV8BapKgAtMgXOwOhEmLnovI+3N2iG337gbN3qm+rNQtdhPVomerBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZS01/yKqoo5wIirjCevD0zNXfRiSI+c6lGzwjS/tGuo=;
 b=k53wXzrRdnQetqIAxJYOUB/u3At3IQDzWxvJrvbstXwN5CZvpKapt36m/WXZygIYY9a93fw/RmFjEp2M/F0b0ieWXKbNyBiAgkh02T/MRiY0DZ7DwwMlnZBXZ3RNMfT+XZopmZT46KyV+h0Xbx8GhprtU+ZYSWDOoPCJmE3MxdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DM4PR12MB6012.namprd12.prod.outlook.com (2603:10b6:8:6c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.10; Fri, 11 Sep 2026 08:38:18 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:38:18 +0000
Message-ID: <a0d23fc9-6f7b-4c19-9f6f-9cc0c7cce3f5@amd.com>
Date: Fri, 11 Sep 2026 10:38:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
To: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
 <1c39be54-c931-40a2-a806-fa963b2188ec@nabladev.com>
 <e305b607-76ca-489c-b27f-bf45b6fdb59c@amd.com>
 <7b957072-df73-4fab-91ba-9835285ff8c5@nabladev.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <7b957072-df73-4fab-91ba-9835285ff8c5@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::11) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DM4PR12MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 34572196-5509-4479-55bd-08df0fe00744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/38cSH7vNJfvKK05zZyHjwPZnLWcsnuTzchAZtsYpIG2XkASMMqhAlnyMyWBLv1xygkEGQ/HgkaLgwmXL8AZfbl3ZWyfpftV43uLy8OT5+qs/vFFb9GaLYIJp/p9k0SzZ6H6m9dP1KhKek8UAE/z6GjbyE0FaIwMCNMLQ5OfHcHGegfC0/RcncPkWSMdpi3UuNGtnvA6JCwguzPltwcvV/YR0ClIrEUGUvakP8cymATk9t/6XxArtebEt8BSYpaDjNH86ywIE8ZEKpzwZjMW/+MGcFpQ9UcRDDrbDj6OafeFTqBaH81gJ5k5Cpi+OxWdV8Refcl6XTnPVvI7ybM5fDY78U4+4s8lm1mTHu0Z18D4iPM67YNRnY6gSHPqC/26giOM9tUnK/1k0ea/DsR5d6zgttIa1LrampLQOPT2V5fJT9tNaf/Tz2N7eRul2Mz1rMb5d+QBZTb9mJUQWLS9Ob8gvQdFaLZo4hCKSyYb396otkJk+sauIIyWNENPVbMPHOVwHd4z0IcMjh2s54glUZFpUDfQ8sxa7mYtRvqaNAuRyzw3JmaPQkWkjbzRW/+9dR4qFr+F3+AQdGpwQvQDqIU4jrodloS3muKvNs5bovje3tPkU05tLwu3+mhvco+NWFRzobjLrbSpIiyfoF1MwCIHraCOWIFvXRrfmN0Y7Ug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1VXVXJnVjBiVzZzV2tLeDVZdEtmcm1mVWFNRUx2SjE5SjJ0RjJPZ0NKS2NI?=
 =?utf-8?B?aUdseVFERlhTYUFyR21EMWp2UjdiZjdPSExwQk9xTXRaN1pZVDBKMWM0OEFw?=
 =?utf-8?B?dmtNUWE2djRvTnRMUEpUNXduK3dBQXlCaEh6YmxmMTREN1ZzeDc3MmttQWRk?=
 =?utf-8?B?YnlxbUhtU3ZiNzY3MkhzZTB3U3h5SFdWU3d4SlIzZWVBWCtyRFhFWHFScHRZ?=
 =?utf-8?B?Q0trWFJwY2R3TmlwQk9TZnk4VmFXcFpSQWRGQWtsZmJObUQrZW1mRUd3SCtu?=
 =?utf-8?B?aHBlQi9VM2g5ZXFxVEEzaWlwUURCY3loUVhRNjhRRjZUZkErb05ncGY0UytT?=
 =?utf-8?B?VEd0L01GOGM1WEpZdG93dGd1QlZ6T0p5dXFWUG1IRG12UTJyWUY0VW5LZVdr?=
 =?utf-8?B?Vlg4S2ZHdDZrMXdtWmZIK09JQ0g4a09XdVU1bzlUMnBMYjgwY2ZpQXNEaFFi?=
 =?utf-8?B?Wlk5dkNSNWRHeFRUMjFXZlFmZXZmWUVYbGthRWhSQ0I1a3RNZnB2MzcvL0p5?=
 =?utf-8?B?WFU3bnhzOUVZaHRXMEErZjFxbks3TEpYa1F1RjdVRkdRdUNRcXdVamVNdG9i?=
 =?utf-8?B?NDIwK0tYVFF0V2p3blhiVDJzTExPbFlKaXR6MElTVFZ3V0NUSXIreEVhVkxH?=
 =?utf-8?B?ZVpKeXFZM3lOS0ZHb0hlUHB6WmZpUGU4ZmFHVnJWRlMybTJBNDJrSkZqTjJp?=
 =?utf-8?B?RVc3bGVmRnpTd3dlSy9DZ3JvWXVjYWpCUG51dEpGQjV6NTRSS2FEV2tWYURl?=
 =?utf-8?B?MjdRRlpXWG1pV1RRbnVEazl3UFJvL0d0Q1NMaTFSTmM2R0RGREk4U2Q5dity?=
 =?utf-8?B?d3prRTZoZ0h1aFcyZ0MxUzhmRFhKUTZsSE9xanhPSWo0VFladk5xQy9wKzJK?=
 =?utf-8?B?YjVMVGMrcEVsbjJGc00yR0xkdmNoUDhXN05QN284NUlydC9PRlZiQTNlQTNS?=
 =?utf-8?B?UVBGeFgrdUxDRWhBT21Bc1RIeXJWZnl4eXlORzlJZjBranlwNzBzeitpTXBK?=
 =?utf-8?B?QTc2ZnYyVlE2UlhYL3p0ZCt1MGlLYnJyV0VGUjV5cUxuSzBlOHc1Q2JUM3NS?=
 =?utf-8?B?YzlndnZWKytoa1lzeUNHRmVWTHpOL2Q2dERMZGFqSnlmSGRnVFNtd0hXK0V1?=
 =?utf-8?B?OUhwZG5wU3l5N3p1YWduNWFyQVY4dU5ucFJUSnJCMFI2ZmRzMXp5amFlVlFL?=
 =?utf-8?B?dXNremUwRTF3dWk0N2I5TXhTZGZ1eFQwbkpFaE41TWZZbVArMDF3cVVLM1Bo?=
 =?utf-8?B?OGxhOGdqMks2R2FtdXpDYjVoMVhLS29sVWpIeXcrdHkxSVI5MmFDcEY0ay9u?=
 =?utf-8?B?Y1I0U2FXd2lTV2NSMkRjbzdzeVBYUWNVK1hCZFdWSHBxN1FBTURWMFRQdnlr?=
 =?utf-8?B?SXJSZ2o1UWVxYWdGYXh6NnNGdWRkWlptbWEwZEUzamQ1NytyQndKUE9Yditv?=
 =?utf-8?B?dHg5dDJwS0lSZmgxOUNrejBnYVRuTS9xd2Q2SEE5K3dYYytTaG01MGNDZE9X?=
 =?utf-8?B?QmozT1R2MUhQdjRhajRWMy9aUHBEYXY3dGJCWjRKYnBHczBMQ3NJcHV2KzdR?=
 =?utf-8?B?azRlN1lUVlNYRStQN01ZNm1OT0J4cExBdGFhQlZoT0NqMlJkT3N3L0dLTzMv?=
 =?utf-8?B?SFNPWkV4VHNtOFFXVVQvRTFtWXdwelB2SVhBMk44amxvdDluejJiZkJJbGIv?=
 =?utf-8?B?ZFZiYm1pblJSelZmcURWTTRNTjZJRTlxLzFqdy9uNDU1YjltOEdyOHgvR1dU?=
 =?utf-8?B?Zi8zSE1ERjZPcVkrdld1K1FlaU5pb1JaZEt4ajZ3S2lzUkZRMnIrYnR5MVp1?=
 =?utf-8?B?cW9NTDRqWE5sbW85TXVUOWtIQVkwSW1KNGdKZC9TL09BWjJnSUJDZ0sreXBh?=
 =?utf-8?B?MTdWalYvSEpqb0k5MzhnUWliWVpjYllkRFdPNEs5V2M3LzV1MDVXaDBMcVJi?=
 =?utf-8?B?djdkVWpOdjRBajJGemVRMTRTMnNtQ0F0WTBYRm9iNjNmbGc4SVlkR1RwN3lB?=
 =?utf-8?B?RDBjVUFEdndGbXZSejcxTFdJTE5BTWZ3bTBSVElKT203SnNLajVmSmg0TEhC?=
 =?utf-8?B?Y1RVOGVpbitZS3dueVJjUmZKTjdjd3NaRHB5dGsxV0gzcXlyai9vQWZpdDlj?=
 =?utf-8?B?NXcyYmtRMDZabTNSQUttOTNnbWlLLzdoQkVPWndjL3pOUWlXRWhMOGJVUjlV?=
 =?utf-8?B?UklkOXR1UUl3VSt5OXlZcnpDM0JiS0NLekFjTktzVCsrRUNkT3ZhcnhOZjBk?=
 =?utf-8?B?Ynp4UGdKZldnK2xaZXRGM2IzUHdFUEgxMDliTktmRzNoNmRZdHY5N3c4N0xD?=
 =?utf-8?B?dWd5N1FCb2EwQnQ1cjkyTXY5Q3Y5NkI5bk02aU0xNk15bXJaYUhwQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34572196-5509-4479-55bd-08df0fe00744
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 08:38:18.0711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMp0kN3wcBGRUvZz8p/UJ/w7WR/tt4ByRvTZNflwi/2GXIXWt3IY6W2ZvBvgKvQ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6012



On 9/11/26 01:39, Marek Vasut wrote:
> On 9/10/26 9:17 AM, Michal Simek wrote:
> 
>>>>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>>>>> @@ -44,6 +44,11 @@ properties:
>>>>>             - const: xlnx,zynq-zed
>>>>>             - const: xlnx,zynq-7000
>>>>> +      - items:
>>>>> +          - const: ifm,zynqmp-vhip6-evalboard
>>>>> +          - const: ifm,zynqmp-vhip6
>>>>> +          - const: xlnx,zynqmp
>>>>> +
>>>>>         - items:
>>>>>             - enum:
>>>>>                 - xlnx,zynqmp-zc1751
>>>>
>>>> Can you please provide any link to public documentation about this board?
>>>> I wasn't able to find anything through google..
>>>
>>> I do not know whether there is any, it is an internal board from which other 
>>> boards get derived.
>>>
>>> What would you like to know ?
>>
>> I would like to know value for me to maintain it. Why should I care about 
>> board which don't have any public documentation and none can buy? 
> 
> I think because the users of this board actually do benefit from having the 
> support upstream, instead of having to lug around random downstream patches in 
> assorted state of decay.
> 
>> There will be thousands of similar boards out there and I am definitely not 
>> going to have all of them in the tree.
> Why not ? There are users who benefit from having their board support upstream. 
> This is what other SoC vendors do as well, it does not seem to be a problem, 
> rather it is a good indicator that the SoC has users who care about it and about 
> upstream.

If there is public documentation about it I don't have any problem with it.

> If you do require a sample board, I could try to arrange that.

I definitely don't want that board.

Thanks,
Michal
