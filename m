Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615693B7753;
	Tue, 13 Oct 2026 05:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870812; cv=fail; b=oDqKcDg3IEaEAwfFN12AXGcp09UKB032NgxfPSIJAtM5/3Q0JkE/0p4tsUCLigT4q6Kg8BuRrB4B0Bhm+2EdF2cr1hBTpn6MFUKp0xbyB1AaeM6Y0o1hkKXYmGIJ+fUmC7sO8KI+z0XTXV8WWirdoidUp/R3JVuxF4X2nrdJvjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870812; c=relaxed/simple;
	bh=/YVxniHkA5eKhzBc4ANnjEtDldGYpe3jY/HyBHXbIYM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KHQn7ykCFuvK7Fky9jMlzXwAmeFxZg/F1JGs1TL36caRQtPW3guInJ8QEgMYK+mOWANS8qqxS8ebl87b/jFwySI0GpD+G80ly3WLwwsXj/0DkmxJMPLXNn/5jutLF96iydjXNKAayOvSCo9kECvDp9R9YtQ1ljKfsyNCgMwDVQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pAMcHcI/; arc=fail smtp.client-ip=40.93.194.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pAMcHcI/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+FjeNhTNINS04yYczpuNHuEHz2TTu+VkTlCj5ii7dx6WH/OypqhrwVzjgeVvN2N4Z/rSzKGY8Y8kKhN/NcAsMqRRZasgj/r6El51WaUF+m++qLBib3SxzTHyB2eF4av/6nB/BlXpZ962E3yKmUp0zVawSpIbZjSy5ObNXRVefiNooYpYz54tjnhUvaEvev/M1chX3OoUhvvdlzwf+6GtuZ5VHNW1Oo8CGQmi43euNjnjdmWPImP9Q4hRuS7OzsDaBSiXsFDv2S9wWMZxeEBYQF+hpzUUdMIlpNud1aVoCy6kYtREeoAHsRFvSac4rLjHtljqGhdKtwk4z1AkpwqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc1bd7MoAeVoc2XS0smte6Kp+Og+Z5CwJG+cCto/Luk=;
 b=ikJHbU/DnI9sRVREhZYeoeJUqdblVOKM8iRpDT6D7Xvbd5ADSDDjSn5Xx3/cecItS7AizVY77H4tVLsMPJ+tYa8trJoztiqk/SQYJ0858NqJyKWCje5rtq/jC7/uKoEhIBuPqG3hCkDfGW6Yu0fjIvLWBlsoyRQLkRcTYTFFLL6+thAGHhpXakRIzrcNjYB1+JiY/4N6C+bkbSIB/ghsHzFh7hge0Af0Djo/MyJ5UbQ0VM2HA/9axa6lehz9cfDoSO55ofLwOQyds0zo1mMmy2xOBzwMpwiouMJ1RE8ESqvl2E2uY7F8kNgxPU1C+wY0m30qnUTmn5nLHUW0sBD5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc1bd7MoAeVoc2XS0smte6Kp+Og+Z5CwJG+cCto/Luk=;
 b=pAMcHcI/en1/U0hDwGkmEVf+6VGO2VzAXrW3nKAi2I5k/qaoPpl8wmxYCDnKJSRuRBGiCFz0MBTwC/GjDsYVjY6Zr67xrCofF/qQxuoD2+i/Xr0j2OAUOyy+rxyxXNZi+uoP7lxknhfMt4iAx/VF262DhLkkwUTEXP69iQSMRSo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SN7PR12MB7347.namprd12.prod.outlook.com (2603:10b6:806:29a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Tue, 13 Oct
 2026 05:53:27 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 05:53:27 +0000
Message-ID: <e64a1339-f66b-4f29-b95f-01578223f1a4@amd.com>
Date: Tue, 13 Oct 2026 07:53:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: coresight: Limit static replicator
 to atclk
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>
 <1128f456-ed6e-47ee-8dda-157af99cc404@amd.com>
 <20261012162851.GB26205@e132581.arm.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261012162851.GB26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SN7PR12MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: fff0ad10-b985-4e85-72dd-08df28ee4d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aW4UQUWCkq2NzvWkaUGbc4/xEVAbQHJZFJO6ibUTGQ7lLAz4gBpcun3+14M5nHivgKGE9yVMgXdT+p3PHvssKAWfV+T+KVlR4dcS9aylV3hhTalp5mzmGHOOH4sLKpWf5yoDAdScTCpMBZ6PhafMp4Yq0XQhY39WvWN6wFtq2NuhrdGoFvi6YqekeB1txcoRYpaQteOon8LwD+bJJOQdHS8TMuqChgdJ1aFLwqPRWU0NDZjYQFdTNwy/TofC6pIE/sumLq0aZyLeMDiSY5zaXGkyskc7PPeqHI1dTsvhlPISqjizdi686tpJKU0dnkUdZUDKRqvEp7aUxwti5i721SRONaRtpKpptkGqwEhHkK998uJaO8jfZOvgl/Rccq16jJ+OL6qVJQJlipLzCw1bMHLvavILj4Cw10+4Up5J+vIvhmRQRR8MyoQEVaV31IxBgZJ0nmKJgIcClKwUttr5tVeR5j9OPSmv0ngOqTbYDHixg/7b1LMFJg3ctca+RRwJt1I7RBQN2/ploNqSoZj3cht8VPhRYt2BwkNSGiXKgv3OIZ37NdnduxfNhJ8JHOmPv6L/u7KmWqRbAF2T67eKvuKqCnjWEmtNVyIoUGrj9fLvAw+Nibo+N8sNHq+/4gfOsexCjxJkD9Hyulx7nh4zxrzJVV6Id2IKjiUZ76/mHU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFpkTjZpVTV1Z0RjOXF2NGF2OHlJaEFjWXRLdWRBNjh2Zy9mTjBFQkplcWE0?=
 =?utf-8?B?c21OTExZb1JBWmNpS2FyQXlWNkkrNHNsS004SlRoa0lKYitCc1hWVDNBVnZn?=
 =?utf-8?B?dFJqZmJkeWhtWU9rRFdFSVBoTEhvZmVvKy91SXEyOHAzaWJ1alo4MUVqaENV?=
 =?utf-8?B?MVRpSHJsMnBXVUEwVG9DYTF3NjVDaE1XeE4zUFN3ZUxwTEVxRnQ5MVBsTVRq?=
 =?utf-8?B?TWp3L2lrVE9heEhpYlVZUjI1SjZmQStpY2NJV1JqNkhSRk4yNE4zbndJU2d5?=
 =?utf-8?B?VnloOWJUMzN0RVN6TlhqNUdVak1paFB3V0RERThTY1RmK0diS1NIem5sZFRh?=
 =?utf-8?B?NnF0a1RqdDBEN0NZV1VzVVg5TFRPbU9ZV3R0aTM2TGhNWDRyNU9qcWNJNFVa?=
 =?utf-8?B?c3JOeGIxc0JOV0dyeXlPT1J4eHhRU2NiWFV4cURFTTB6NFlVVjN3WUVTSEVh?=
 =?utf-8?B?UE9QMzRFa2pLdFgvMXFGbjZKeUhoeGxqb0xQR1ZHZWJGZzU4MGlubWFTN3Ex?=
 =?utf-8?B?MDlYQ2cyY1k3WkdjbHVlS1VEME9mVFZBek9IWEtVaUpjMW0wZmFFU0w0S2Zz?=
 =?utf-8?B?OFU3UDkwd2V5TmFWbERLY0Z6WlZnaStqTThTTDgzM1U5M2d1WDVib0d4RVYz?=
 =?utf-8?B?WFZrSStDQ1VRRS85ZVQveWRrN1lBampTL01yVGdJQk5BV2xyU0pGRVdPS1Rr?=
 =?utf-8?B?Um14cXJ3cDVqMEJaTzdDRTN5V3BjQWlBdWtpTDA5WXplS2wvYW56SDdGclpp?=
 =?utf-8?B?MCtjZ1hkWTFKVW5xYjdlU0ZIK0YvbUhRajNkb1ZkTzR6bnEyNGNsOEUrcXlZ?=
 =?utf-8?B?TFNtWXBQMUJkenI3MzEvZWRwNWg1ejRTYlVuVVhBQmZNTER0d3YrRWRpVVlS?=
 =?utf-8?B?a1p6WlA0T21ZVjFZNWhuSG50WWNjYmlMNDVTS2xQL1NYUXdXTFhxZzhTZUx4?=
 =?utf-8?B?ZXNTWUUra2dqUEpPY3hWellPY1A2YmVualVEd1pCREJrSWlQcSsxdFdUMWJv?=
 =?utf-8?B?eEphWmdKYWJOR3dzQjZ2UDd3cFJyLzI2bGRKNHZvblVUU3BrMkFTTVk5VE9H?=
 =?utf-8?B?eWI0TTdqOFhHdGJnRUtnZHdLRWU0U3pOaDZMZFBxTGpLeCtVZGZMc3loaEFy?=
 =?utf-8?B?ZkdvWWNmRGpLdkU4MWdkblFLUi8yVUNkcURrRzFPeXFqTHM2UlBrSFlXRFY0?=
 =?utf-8?B?T0tJelBJbzBHTkx5dFNXWUlWUWZSc3cxQUpuTlU1aDkranVZellCak9veDZo?=
 =?utf-8?B?UllDVzQ5b3g4TUh2NXJpaVJwK2tmVjFEL3Q2N213SGUrWnd6cjVRSXpOM09t?=
 =?utf-8?B?andTWjJhSTRGM1Foc0dvKzYwWXJyUHBsbjZydEMzQU5tenRkeldGdHozRFds?=
 =?utf-8?B?OFllL24zZDNsVDAvNEtiRXdtcVFadVFjTVAxTEZXWk1JNzZlUUlqS0cvT1JU?=
 =?utf-8?B?bDJ5amVEUmNNWW0zQ0cwNTBEc214OCtjUmk4YmxaQytxb2dRcWY1eVZNUjU3?=
 =?utf-8?B?SUhVaDhZMENHeER2NExDZFJLZE4rWXBNQlJwV3cvSTZ2WnBuSlhGOFpCd01S?=
 =?utf-8?B?bmFKcWI1TERhc1hOTHp3S1NNRlMzTWVLd3pBckZQNjRWYmdoV1o3aHlES3h1?=
 =?utf-8?B?cWNmcUpTOW8zQSsxVmxYUUpFalU5UVJ3VVRoQS9LK0lHT3BENm4rMC9ZNEVF?=
 =?utf-8?B?MTA3aTd1OUR5bDNROStCa0J1WWtsQXdGNk12UW1oYm05R1lQMll5YTl1K0RK?=
 =?utf-8?B?dEdCUUN1NzN3TWFVY2ttUEhFMFVFTndSYzBaUFBHMDBQbUVobXN3cy9yRktK?=
 =?utf-8?B?TlpBaW1mT3JpcklqS1l2bUk5cVB0OEF1Qjl2Um9EQjN4Rm1MemtKL2tBdnVj?=
 =?utf-8?B?Y1BldFdSdGwvUWVyOWovbnBreUlFRTlsSzY2WW1FWTBFYkVPUHhtNXVOM0pO?=
 =?utf-8?B?Qm1DNUpCSWVoNkZGOWZyNk15Z1B3VG5pNy9BNDIvT3BRbW1uK0haSnN1YjIr?=
 =?utf-8?B?bTNhanVEUTRvaFlRcGtTSzVFdVZKTHRTMWhLZ1RxZzIyYVhocm9pR216TjFL?=
 =?utf-8?B?TlloZnd0UWVXSWoyb2t5MkZMVngxQnAwdDRxeGQ4RHUrcENmSys3dTE1SmpO?=
 =?utf-8?B?VVV5NlhtcGZEdGFkekVTSmdBZnY4Y2NrYWdDVkZpT3Y1aFF5M1lmbzdobFR6?=
 =?utf-8?B?SHZuaHZEeWd1SzVtaVVsTHp1S25vRGljUFRiYTl5Nm5YM3FpVmc2UXgxNkpN?=
 =?utf-8?B?V3VOMityMXcyeCtmVU5zcjV1OE1YMDRPdURLT2dIdllUVmwwNmpvRitzWkRB?=
 =?utf-8?B?OE5GOXZLL01Ib1h4SzUxMmp5Q2x3eHZleUlzN09VRiszMlhzd2luUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff0ad10-b985-4e85-72dd-08df28ee4d64
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 05:53:27.6727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaL+vjLjS2+M6cu5KsHUqa9c5R+La8W0U5FTNLO/Ze7TkwZGg7mGOJY8wuQBlDwa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7347



On 10/12/26 18:28, Leo Yan wrote:
> On Mon, Oct 12, 2026 at 02:35:37PM +0200, Michal Simek wrote:
>>
>>
>> On 10/2/26 17:07, Leo Yan wrote:
>>> Static replicators have no programmable registers and need no APB
>>> programming clock.
>>>
>>> The Zynq clock controller registers dbg_trc and dbg_apb and calls
>>> clk_prepare_enable() for each gate the bootloader left on.
>>
>> That's one bootloader behavior. If there is another bootloader that clocks
>> can be simply disabled. I don't think there is any reason to depends on
>> bootloader behavior. If there are clocks which has to be ON I can't see any
>> reason not to drive them.
> 
> My reference to zynq_clk_setup() was to explain that this patch leaves
> the existing management of dbg_trc and dbg_apb unchanged.
> 
> The CoreSight drivers do not request clocks named "dbg_trc" or "dbg_apb".

And this is the point. DT binding is not describing what Linux driver handles.
Binding describes HW itself. And for proper functionality these 2 clocks need to 
be handled.
That Linux driver is not doing it that's different issue.

Thanks,
Michal


