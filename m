Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06C53AFAE4;
	Wed,  2 Sep 2026 20:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382430; cv=fail; b=MHUN4KzWZhxIENF6SqCwPDq29F5cM38JUClghTsbTw8GpPB6HBydB5tX9n49G/ZVXzsUoHN2udsl4oVaFk4tsndkvnSeNzN2SedseQMEiXaWQMdXF6V+gYiuqwB+iKGNuWJJATQbS0Gnc/cmA77ZbFqze12Qa6lXZd8jfuVZXLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382430; c=relaxed/simple;
	bh=KUdEwm6uaD731430p4gHL7ZZIqaaTtwfpZ5E7UmcF9U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UZ7lagclSubOJh46A1wisnJeKDsf+latuRJB5z2XiCJ+Y8dtvTprtwhfg4XI82ZZXrGPNVPe5KRcYRIOsFM5Dg8cjcUkcwAMiIaTDKO2KW+9Gv4Oou5sfGEn2yrY97R3894weVzxOp4GsVbny0Lppo7b7lyb9BMTw8diO+APbwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eW+nsVVP; arc=fail smtp.client-ip=40.107.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eW+nsVVP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcWaqw1DEcVH52jg8rlcpNUKOrQ6fVFYlEvKyEDYgWvI4yy+Fm/ND3GasCxhYOnoGdnVWiQ25DHfGBoovpHr3bhSKtDoEywOrf7yzgE87am2ZAr3igVCPArTBOt51NhOxq4Fm+LJZD9AoXs2L4HWNw3OXjTjOHn+v5rkB6gAY47kKSkzemJrqylZGjX3JkvXWWPy8JvtnJte43PTSqeFcDXLIkZ7nn42XekYuusHJ5JQHn1Cu5OL2uR+GkkpYo9889W7oGWhWZbZ3dcd77pe75zyvDOvpFL5/YOYmwPdtMqN0FnGJe41kmWYQR0Gor7OmVJvBzK0XSg1l8w2tQ2jRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DijA54VFPXlTKBxki7phButKARQuXP/awBkaO7+ICPs=;
 b=q2C2qJkCi1YkqDCPKRDzgF49U8p5BunN3WCm4mrbCTBG7LgYmQIfEt9ROx/YTUWz0bRfg3BtbQD6sR9dbfvFAgY1ahohoTD9qYGfg95IEyOw81HRHSLmvo60KbOngSZvxH2X0DgyVg5mGhqjV6yf+zDxg1EvkDG6YmVHDIpv8m8sVUM/kNDmKILLRe4OzsfXMH287ShY+tkdEoKVnTus6P566EdQrk89adUXtNJjJlQGS/vz0U+CAJTzNYC1NXjqXUrD2dqZw8yV4JglVjgCvdTfwKa44hWWOZBVXcaftpw93Bg4fVUtJ9hqnEfoAq41HDrsyGLo/dKN1Lvpw+HM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DijA54VFPXlTKBxki7phButKARQuXP/awBkaO7+ICPs=;
 b=eW+nsVVPWZ1WjvJvZZvP81Ss6cVzTLkS6OOjGG45GK7Pk8MWPV9BbwrQQ9Oa3UKuBcx5wNYzpQa1Zqi1rQopn3fkD9dMuPYpPadcmhsEKCF+mcNCgLeA8XkZ3i+wioeAUqfAl3saMko5mI/VkwQaewMcGQKXP10kP7xdNaJj2tA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by SJ0PR12MB6783.namprd12.prod.outlook.com (2603:10b6:a03:44e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 20:53:46 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 20:53:45 +0000
Message-ID: <318bc76c-2fc9-484f-b009-1f21fbdd4d49@amd.com>
Date: Wed, 2 Sep 2026 15:53:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thunderbolt: Do not warn when a reset clears ring
 interrupts
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 "S, Sanath" <sanath.s@amd.com>,
 "Natikar, Basavaraj" <basavaraj.natikar@amd.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
 YehezkelShB@gmail.com, linux-kernel@vger.kernel.org,
 Andrei Rusu de Castro <arc@empyreal.works>
References: <20260902-thunderbolt-cover-2fdc1c1b@empyreal.works>
 <20260902-thunderbolt-1-c48cd6e7@empyreal.works>
 <20260902125010.GK106095@black.igk.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260902125010.GK106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR08CA0009.namprd08.prod.outlook.com
 (2603:10b6:610:33::14) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|SJ0PR12MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b99417a-1f43-4b3d-9a7a-08df093447ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|4143699003|6133799003|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	FF7Atl4i3CNZ65jYZ5hhXrz6WlM6Whvq1hM0zB3SwhnQcJ/F/cyHvYkQmpKS+QdMq47LMBoAzcZTD12eWmw8vmGpcRzJT5aym7JXahZ8vVKWVnpCoiO+nnRV+uM/eZqEUN77Ar0ktCTeBecUlUIrvqVRRrvzLn3szjb6Zbjyvj8Jxgct3xAK597d+ZX8ItOiOQvG9aodbWEW/F5oAkQBRGRqJuZK2GOh6vh/RLgyohzeQCTXHgdhtkdL/VyV94WolBEpEE3SInzZTwAHViKSN9XIC814YX5ZB7mdwG3fLnDy3OVUTPnloN/QmlR93rKEI9VxA2ry8c3cL0WC6cDWVB4FYPDvU/Iqs9O0x8d8FkFR/pFdqUb3Rg4K0lxG71jhNkpLOs4ojVBNa515PhQdRgZywVXVPJA3rAcRsT0JZCrVeLKmXadPHaAELqxAruA9OCE0TRC71+gLlUrsrXH6oSSunI3Yam1sDcyla6DQYkqxji/O5IFN8pIk+lXy8EIOg7jx1JX0U/xtEyPF86t4re3aEMBTxKg/Q75QzwQ3kRSMzsg33/q72Ee/w6QtjPKJ4aPUo3dwKJe0gPgiTcrTzXfBh3Vnu84TqpANPOqLODvqn5jzeGDzgrgmxRLzdi1mQsLVQxGhwQi6vbyKXUouPhB5KJIY/i+vz1p+GZ1KU1Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3VOSHdtY0tVWXZpc3FJdTdWN2ViRlJFYVY0b3liVDZKWTI3czNGRTVWODl6?=
 =?utf-8?B?OVRXOG5RSTNvQkVOV3NqempkVG9NMmZyV2JZQzdNWVV5S0IyeFhBRWVwNEVu?=
 =?utf-8?B?RFdMNzZHUTRyTnRDazNSK1U3MGJ1YTVwVXFCZmtrUmhUTGRKdzVwdGZQNVNz?=
 =?utf-8?B?SFo1NkhMUTkvODVaV0tnRHJvTVZ3dkd3WXpoWlJjTXM1c3ZGMUJzQmFwT1JS?=
 =?utf-8?B?RXgzc244VzZDUVFXL3UyUmFsbnNnbG9JZEh6bVNmWnhzaXN6ZlB4bmRBMHZO?=
 =?utf-8?B?MDJDajZ1UHo5a3Rid1hUNGVwTVZDalVQaTBwWVBxMTRYVjFFbmRJU3MxVWJk?=
 =?utf-8?B?WWtLdllCY1pobWFwU1podjhnNHIwSXFIdC9jZkNRM0N2aitpME9yQkxRb252?=
 =?utf-8?B?WVZVUjVOZEJZOHRoRFlHMDRGZVJXaXEvTzNSclZPbU80Nkg1Ky90Wlh5V21z?=
 =?utf-8?B?emxDRThCWkNkQU1Na0swclE5Rmg3M3M2ZWRHQTVzQU9PeWhNTkw4MjhubnNW?=
 =?utf-8?B?VjkyRlR5VzVtb005RmVib3RiSG1JeCtwODdtbXcrMlpqNlJHaDZyMDFLVmNT?=
 =?utf-8?B?SWFpYk12MzdmVXhqYjJSL1JPTXdmMHBubDl1SnI5V3M4S2FVaTRubGxGZVJF?=
 =?utf-8?B?VHczOSs2SWhRZXl0V2lLWFhNYnB3a3oybVRTNDRkclZCOFpVODBtMi9pckUx?=
 =?utf-8?B?OWgxWjNCMWlNZ1hoUW1WNlRIdHBPanRxV0JjRXRFcU1nTWhUWXVZUVF3ZjVq?=
 =?utf-8?B?b2FGaWhtZEFQdnhIQ3VJMkx1bnpndkVlNHFyL2sybTdORUJjVm1pWUZ1Mm5D?=
 =?utf-8?B?NnkyZisxNzBvaHIxamE5NE1ndlhhT0htMW92UjdCVXZ1bEc0blBkcVpKRjgz?=
 =?utf-8?B?OHNsbmgrRlZGUktuMytEY3UzVndtVEwxZ3BoaWRsKytFaUxla3RBQlFoa0hR?=
 =?utf-8?B?ZGhKb3BqMGJFQ1pxN3JuaVpIMC9FKzkyZ2xIb3VtandlaUwwQW1tRFM2T3p3?=
 =?utf-8?B?QkRHOGJNM3pvVitaWnhVYlhGU25vSENZQmtWcnBPQ1V3R2lLbjQ3S0xlRnNG?=
 =?utf-8?B?M3NnSU9tbC92OENyVXh5TjNMSGcrc1RrS2swZU50N2hVWjNzNnlLd1Z4Ky9P?=
 =?utf-8?B?SnFVeHRxNkx0STRXNkduQ2dHZUNKNTFWMUdGZTd5Yzdzbkk1cks4S09IeFl1?=
 =?utf-8?B?QzhJUWxVRHJPc0hqc3NVbW9OZUszTW5Ka2o1dncxUGNiL0s1bnZRV0w0Z0hU?=
 =?utf-8?B?cDRqRkVRYXFkdy9mK1dReDM1Z0ZySTVrVmZSK3lwQjBZTUMyTjdJN2lxOEJo?=
 =?utf-8?B?bm5FdUMzKzRWeVJWNGlHdDFRVGxFbGtvQkVsMUp0Q0VOQnpJUUthbG5UekE1?=
 =?utf-8?B?MEhsZ1hEakErNDdUbjlIMzNHV0I3cVBvOEo2UkExZU8wc2NWL256U0M0T3li?=
 =?utf-8?B?Tmk4N1dveHJrWVRQaUUvR2JpZUtUM1hJVWhRV3ZzRjRWZ0tNZEpOS0h5K2F6?=
 =?utf-8?B?OHZ6QkUrVmt1U0xwVUNUamRYNjdDZFlpM3B5SGdkaWpTRjQ4Z0FXdkVKbnhx?=
 =?utf-8?B?UExFOTg5aDdDeFM1bVFhUC9TSTFpNFhiSUFsODhpMmUwSDdDR0I1WU1qUEVv?=
 =?utf-8?B?NHZLV3FnSW1Ub0JpK0kyTXJ4TUV5dllGVFBiSUtGNDk3K0dPTGhJZGpLZEVX?=
 =?utf-8?B?cGdUem93QUY3Y1d3THBjY0U0UDNCT0htS0Z4ZlRSSzFTR00wTHFLMWdLcXc4?=
 =?utf-8?B?cmYydVhjYytnaW12bEQ4TnBVbE1ZK1cvUnhaSC9QRVVoMWpiN3haNklCZE8z?=
 =?utf-8?B?WXlldE5icHhkTlM4SHdKNHlWek1hTU1kVnA2bEZ4RHRtUXhvRHBzOHdlbTho?=
 =?utf-8?B?ZE5MQlZxRnV2eXI0TCtOMnBuWWxLTzJHeXZoVkM2bit0ZTZHczhFZFFQTFRl?=
 =?utf-8?B?bFljNFF0RU1ra1ZSZnZzMENHSnBNcWZxWlo5NUlDOWlldXZnakpIVVdmQU1H?=
 =?utf-8?B?SkF3UUdTemRHRFhNWGtVa0JrVGk1ME5ncUFQMmpCSjV5T3EyZ2VINjdxb0lO?=
 =?utf-8?B?U2E3d2w5eTFiclZad2cxN3A0M2Fud0Z0WUYvaVlBeWlHVUFLTTNJcWFYRnJL?=
 =?utf-8?B?Zm9nakY4UFNYaXdqNXV1UWZoRFNCQUY3ZXNsS0xneWR3d0Vuam5XVWZHMVVs?=
 =?utf-8?B?dkdHZC9sdE1yRUt1S1NRaTkxYVBmdGdJWWRHNjJIWXBuYnpqWGZPQTk1SllM?=
 =?utf-8?B?U2kvU1RNMkdsRlFzODU0S1RzUzhDTEFia2RPb1pLb0ZNVmdMUUZpMnZQeWlN?=
 =?utf-8?Q?3IyC7IjwcXMGDWOMWw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b99417a-1f43-4b3d-9a7a-08df093447ab
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 20:53:45.7614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLPKZ2RMle/imATrWqae3D437BFcTWF2BmM/KXCk7yaoVZIIgflf3puXY7OA5RNYKTYen1k+qRs2+6YI+CJCGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6783



On 9/2/26 07:50, Mika Westerberg wrote:
> +Mario
> 
> Hi,
> 
> On Wed, Sep 02, 2026 at 12:34:13PM +0000, Andrei Rusu de Castro wrote:
>> The AMD DMA-teardown quirk resets the host interface before USB4NET
>> stops its service rings. The reset clears ring interrupt bits while the
>> rings remain logically running. When tb_ring_stop() later disables the
>> interrupt, the register update is a no-op and emits a dev_WARN() splat.
> 
> Yes it should not do that. It's too "big hammer" and we should avoid that
> if possible. There is also the deadlock that resulted this series:
> 
> https://lore.kernel.org/linux-usb/20260825214237.4179813-1-juan.martinez@amd.com/
> 
> But that still kills the whole host interface if there are other users,
> like USB4STREAM using the rings at the same time. I suggested that we do
> the reset when the rings are idle and while they are not and we have spare
> rings we hand off those instead:
> 
> https://lore.kernel.org/linux-usb/20260902054800.GI106095@black.igk.intel.com/
> 
> We still need confirmation from AMD if this even solves the problem or is
> it hanging the whole host interface and not just a single ring.

I'll let Sanath and Basavaraj double check this on the affected failure 
case.

I believe think that the whole host interface hangs when this condition 
happens.  Another way to mitigate it can be to force a power state 
transition though.  If we can force the router into D3 and back out it 
should reset the condition that could lead to a host interface hang.

> 
>> The path teardown order is required. Stopping a ring first clears its
>> descriptor base and unmaps its frame buffers, so pending path traffic
>> can no longer drain and some host routers never clear their pending bit.
>>
>> Keep the warning for genuine software-state drift. Increment a host
>> interface generation after each eligible reset and sample it when an
>> interrupt-backed ring starts. Excuse a redundant disable only when that
>> ring crossed a reset. Duplicate enables, duplicate disables without a
>> reset, rings started after a reset, ineligible resets, and double
>> software stops retain their existing warnings.
>>
>> The generation sample precedes interrupt enable while holding the NHI
>> lock. A reset racing with ring start is therefore observed as newer than
>> the sample and attributed to that ring.
>>
>> Source and call-graph analysis identified the reset and
>> ring-teardown ordering. The change was compile-tested; KUnit coverage is
>> added separately. It has not run on affected peer-host XDomain hardware
>> because the attached USB4 device is a hub and does not form that path.
> 
> This looks pretty much like LLM generated so if that's the case you should
> add proper assisted-by.
> 
> Anyways I don't think we want to do this just yet if we can avoid resetting
> the host interace behind everyones back.

The resetting host interface /should/ only really happen when unplugging 
the cable.  If it's happening in more cases, that's not intended at least.
