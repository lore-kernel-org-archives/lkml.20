Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F45B25B0BB;
	Tue, 15 Sep 2026 04:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447449; cv=fail; b=qdO1Sjm7xjqqxK4KCcxtAU6epi9u54K3VZ/C0CkcWrwMVyY2Q/7VQGrQtB0F42wafjXVdIp7WF4TJD4QJyjIDCzK9bCzxOMUDbZBBoolkPGlB4q8QjjIVIIgVr9r3uRaY32Pebwh6sOOFnJSJ5KdbpRGlFZdvIUMXuKqRrk6vTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447449; c=relaxed/simple;
	bh=8IwpK3EbCWAHtAj7RnQAmfMMUp+mONc8tmAEwoNK1y8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZchXvKZVUopjWLKxAlYhVFyf+OBqMt396+BMLfOJSJhkp+Sq3anFOTK2EVsXlfbuaU3VGmJW6hpRGSsDgG7UUVR403IUogdseY8pD/4jAfOeIjNN+AAhjPHOtdRjkZNMGxORtKiCMATSDZPZgsub9lNEOD1I/rXa3KIwzr/5UI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xz0D5DeU; arc=fail smtp.client-ip=40.93.195.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xz0D5DeU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gW2bOcZWjhjPekTuntGV49HmhIQNiJXPfxjrF2eAxoDJAjdZc5zsrPwZVqEokL8kISnPESKJ283xn/dtnXPpK++z8u8ZKl/IuRNeL9AcKjGpEQOfDj75HiVE0buZMIxOkwVX58dKUyYVnQQsDQgjiq5PH2mIJEWPfr/5czkU2FptOp0aB/Ubz7/10oRnpbknwWG9oQ0N/TQndMKc6IL4/XHwOiV88Ai4bkTnO+1QQdhztidAoCRH/uXsAsZ3/2eDVdkkuiS84q7CP5qnaf9f1j73UHxGKJMpduXvnCW4l5oeMGqcpFUOUpLkQPyWW7nIbya9bjnUdzRTH15yi8xOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IwpK3EbCWAHtAj7RnQAmfMMUp+mONc8tmAEwoNK1y8=;
 b=ImGuVsA1XCRDeQxz+zAqRw7gg+tPuiEwQFl9sHgXPjNGxZojnPokAkfkGBB9O/DKqmmO4pUF8MVuM8FAcuetC7NpVECmwSDVkSLwHweDN8r+sOZScBotTZjYLoUYNI7/yYl5mB6ovqVIsywFIHX6JNNK75F3KZWpJl9aiXUeymkL0iseWHbxJaxHJxwtdGNGvuxQ+m+bIZ9SOYVDXMxfJx9TpaaBdHVQwkxc973PvDTFRa2OQdfF5sw0kjCIwfLGDDEe1gcY+x7+ESv5Kyjuj7QZWGAWnod/AZMsSdCmQmvuOw08pdQBDJs+VOtEAnwUvrFq9KDxlbkhZojEkhbdmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IwpK3EbCWAHtAj7RnQAmfMMUp+mONc8tmAEwoNK1y8=;
 b=xz0D5DeUWB9HmWvvvd1S+Cy6M7VgqU8q0VVXG6UZk5sq83IgUbRBw6zPjeiGuXYDEIC6KxxerxI0IYyEgqljtAiN5fpOD6YJtAuBNUeLMO0u11dTNFDdIpxMFNkhVmQgvpetp7h2UeALRcEXXFfylVl1fl3UCmQU/TmzPGGUNTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DM4PR12MB6039.namprd12.prod.outlook.com (2603:10b6:8:aa::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.10; Tue, 15 Sep 2026 04:44:05 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 04:44:04 +0000
Message-ID: <47708252-2867-4b3d-a997-ef153b6eeb05@amd.com>
Date: Tue, 15 Sep 2026 10:12:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] soundwire: amd: fix work drain ordering and
 pm_runtime guard in remove path
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
 <20260910190240.1604447-4-Vijendar.Mukunda@amd.com>
 <860a28bf-9c69-48da-9fa7-1cdb82761c35@linux.dev>
 <3abf2784-49ff-459c-9022-acd88bd767b4@amd.com>
 <029a18c3-f6f5-4971-8ee2-25a98dec416c@linux.dev>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <029a18c3-f6f5-4971-8ee2-25a98dec416c@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::17) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DM4PR12MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbe2f31-0b4d-456a-c845-08df12e3f81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|5023799004|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SmjM9Tu4O0E9eFv4JX1NnKlL+AuQktH7GpvrTMe75g6FDUo49iYOkHw8dR0eBktw/gRWGMAQtGzVHpD/ono/k1VMCSY8pkujamp9ap4cjwGs25XySuRx+QR0MHqucTc4+aWAC6DWGVvBqJ8XDh8If5v9ovyg/n++xk6Gweocd0RY3Cuqzir08tsujaox4QsoFUofYmypFhwRKt0XTBxeubFK8zWyKjp7+/mfcavW08+KV1vcYo9lcUbVnXs6NEkWRIrSNGdB5VZNEAd57R22TfVT2iMZQCriCG+IMvgVpT2ocsdmL+u3+eiGZ3lQUbucFM/eEpzvuCdtaJTNFTZOsPYanHsKS06kw4Z2+YIsoMqS8vZfcrn8NAfsOk5yFP0aeJsNdur7CcHqZSxDWo+zg54wNbXw26935LWPDIw6NoEWYULO4wEYjf1p/ojy1GN8uxbApMx6A26l0Tq3aAm53KYNIo3wU3JbActsp6v43+rSu4HUxfBp67xz6iDqdpx4IhYLl7eswTZ86UqyIvUWcfLJrx9DH8uNbrfbpoUCpoWDQfRB0Dzxsm0+4WES4xRqTv7znWGwqPuRRDREv8LH6OWF/XaWAjugaufzOfunwTRGQEkvq7AGPU26E7nYeEaS3cJvqwbg1BVAG8lK510lG/dwWuxP4T2pxOraWOMpCxQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(5023799004)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm4yVjg0cEgrT3ZvL2xqUjRpT2hURHh0cnZOcXA2ZU9ha0tpRlBiVTQyQ21H?=
 =?utf-8?B?L3VBc1R3MXlFY3o4alB0SVJxVG9tZVh2TW9FRzNqbWt1NkVsY1FSY0Vla2t2?=
 =?utf-8?B?cndlNVN5L3VYK2djTVJkdVdWK0Yxa21UMThudzl6aXZnTnhxZUFoc294NnVu?=
 =?utf-8?B?SFVHSm1EVEllMC9LMkJYS2FKN0luU0M4RWtVL1QyTEUyblBmYW5MSWp3ZE1j?=
 =?utf-8?B?VTJLejNHaWVmRUZWSi9qNW1SZ1hRR2xRZlQxVTYyQmEySHl1RjY2MThMcmpE?=
 =?utf-8?B?RXl2RHluQjBBdXRjOXdRNStPanNEVlBsMTZqcVl3Q1VGQ1BOakdiWTRYWFV4?=
 =?utf-8?B?dDlab2ovdlZKMHVYZ2dEL1ZoSkNrRjN4S3FVempZQUJ1bWliVEFueEpUaUg3?=
 =?utf-8?B?NTNlS0VBS3o1MnRhamhNb1c0ZTJxbUtpS2FPYytwTlBCVGJYR1p5Tll4TFF2?=
 =?utf-8?B?QmR2MGdXUTBIL3lpaExjOWRJMlNQeUp4YjdWUUJpQVRLUFBGcDhHTS9BU0lB?=
 =?utf-8?B?SDVkK0JyYURiNUxiSFFPL2xqYitTZ0VNUE9zTEZVVkFmME9hRGJld3JweXZV?=
 =?utf-8?B?YmNReS9pZTZIUW51ZWo2QlAvalNxbFlOam9adVkrZW5TRldMNlZhbHd6aUNq?=
 =?utf-8?B?bkhjVzFuRWdMU3dNTzFuTmRmdDdrcVpBM01HelgxM3Awblk2Z3NJUjhGSW1P?=
 =?utf-8?B?djRLc2QrbGo1eVViL0t6S2thODlHRWphTUpnc24wS1dONkZ5aHRnbGgxQ2NT?=
 =?utf-8?B?QlJyeGk0dFEyVzR2SEJjeHJmU2RoamlQVFcxcmVRaVJIbVhPaEFlM2RDUTdC?=
 =?utf-8?B?aUVGU25zU2ZaUXdEdEhLZnVIWW5nYjVRZHlVdW5ZdExiZFU0a3RHdzBxZTE5?=
 =?utf-8?B?S3NzeVFRRXdyb1FSYk5WVWN4bnBkNnNmRDNmRDh1MU5tN2MrY2E1NWM2d0VE?=
 =?utf-8?B?ekpTYXBYUlhmdnZYQ0JIS3hycWpnRS90ejhlSVhNSHo3V1VORC8zdjlOSGwv?=
 =?utf-8?B?Rk14Rmo2VFdqR0VwU3pFUkhUUXNwTnY4YnFIdVgydW11Y3hjL09xOXMxMVBP?=
 =?utf-8?B?c0NuSHpaYmtvZjVjMlBhcUp2VzJJbFRoZHorTG9zQ1J6QXNvWWQzajNzRm5z?=
 =?utf-8?B?VUNEeXFhYlhabGh3QnFweUdwTWg5TEZNbHhwLzZEblZUWnhzUHJldmgzSnp4?=
 =?utf-8?B?WEtoNHZPcDUyUWlxSFMzTnJxbzUvbWJtd1V4VEpYZXk5LytuMjliUUZNSkxu?=
 =?utf-8?B?eTZZT1VPYU8waXA2TThnRExQNWR0UHVlQjhmWFVqd1JGcWxNWVRnKzlVOUN0?=
 =?utf-8?B?WVYrb0FYeWVIQS9RMnNoUmdwbGhtR3ZPcEFHYU9jekM1Tm5rRk9YdURUUEV3?=
 =?utf-8?B?aEs1UnFmL2ZkNWsvdmVjZG5nVWhEVXI1eGRHOHJpcXRKb0FYby96d0tqRG56?=
 =?utf-8?B?RkkzOFVYeFR0RFo4ODhCNFo0dkhROVRieldqaVBlYU9SSUhjZ3RKVTQyQTRk?=
 =?utf-8?B?cUhWSExOMEpaS0loUTJ4WnFIdTJOUnZyR1N3RnYyakRKNGxKUDd3aFBiYXdT?=
 =?utf-8?B?c3FlaUMyeFE1NVJ5UUZveVY1L1JNazlTeFQ1andRRGhXTGhjMVhzcVJlTlph?=
 =?utf-8?B?MjV2RUVTUktaNUVldzk2NHdIV2JRcE5kd2FLZWRzL2N0RWVDdGxOMDA5cWZQ?=
 =?utf-8?B?eDVORDZTbFYxYlliUnhsL2tUVlV1M3oydWUrQ09COGVJTC83WmxaVTltV28z?=
 =?utf-8?B?NWc1aTJBaUhCVGp4VjRWTVhOeEJrZXlZelRkbEJwZHF6OUNBK1NyTHl3aWxw?=
 =?utf-8?B?YkZlZ1RoeHVDUlAwT3V6djFML2RhMkFldTA2NWI1ajBUSTBqYldPb0Zwc1ZL?=
 =?utf-8?B?SVlsbURoRnlZTkVwODdlNFVJSExjOWQ0RjVvQld1VXBOcThYUXJEcTRoeVVM?=
 =?utf-8?B?TnhNQTFDdEl4T3RtSDUwVEk1NGxOZzJVR1hrUVN1aTJ2SkR4WllhenZYVXZH?=
 =?utf-8?B?VFZ2dDI3VW15YzBqdHJiRmF4dEhBaGxNUzZmRU13TjlYcWhGbDg4QlJiL0RJ?=
 =?utf-8?B?dE4xSC9QWVJYM0tQaVA0WnE3ZzN4Wkk2dGhqTkxhbDdTRlk4N3dNd2xhT1ky?=
 =?utf-8?B?YmVQak10ZGlHMG5sSXMwWG9uT25CbEJNY1NiYm5pVjBSK1FkTWdEdEF0TDVF?=
 =?utf-8?B?a3FSVkhHV2hjQmw1ZnJGdW84YU4rNkkvN3dMVDRGUy90K3FKQ1F6anVsMGVX?=
 =?utf-8?B?Mk80UzBXZmJDQlFDV1Q2VVpSZXJPbTRTMlNMYTBaVXZKb0hpVjZtWkxqdXpV?=
 =?utf-8?B?VXExbmNQaUtHdjd0emtqVzFPZURZNjVJZ0lFckJ3YmxvYVV1cmN4Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbe2f31-0b4d-456a-c845-08df12e3f81b
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 04:44:04.4163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahmbcwYnUEF2ET7SuGsKkSxdLX1Kw5UYXyRahOaX7voqQ+DjdQhjvJHAHftdWRhta35o6zlUGNLmt/hJqNJXlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6039



On 9/14/26 23:00, Pierre-Louis Bossart wrote:
> On 9/14/26 08:07, Mukunda,Vijendar wrote:
>>
>> On 9/14/26 01:35, Pierre-Louis Bossart wrote:
>>> On 9/10/26 21:00, Vijendar Mukunda wrote:
>>>> amd_sdw_manager_remove() cancelled amd_sdw_work but not
>>>> amd_sdw_irq_thread. Since amd_sdw_irq_thread() calls
>>>> schedule_work(&amd_sdw_work), an in-flight irq_thread item can
>>>> re-queue amd_sdw_work after its cancel returns, defeating the
>>>> cancellation.
>>>>
>>>> Fix by calling amd_disable_sdw_interrupts() first to quiesce the
>>>> hardware IRQ source, then cancel_work_sync() for amd_sdw_irq_thread,
>>>> then cancel_work_sync() for amd_sdw_work. The existing
>>>> cancel_work_sync(amd_sdw_work) is also moved to after
>>>> amd_disable_sdw_interrupts() so that any work item queued between the
>>>> old cancel position and the interrupt disable cannot escape draining.
>>>>
>>>> synchronize_irq() is deliberately not used before the
>>>> cancel_work_sync() calls. Once SoundWire interrupts are masked, no new
>>>> IRQ deliveries can occur. An IRQ handler already in flight may still
>>>> queue amd_sdw_irq_thread, so cancel_work_sync() is used to drain both
>>>> amd_sdw_irq_thread and any amd_sdw_work items it may have scheduled.
>>>> This fully quiesces the driver workqueues, making synchronize_irq()
>>>> unnecessary.
>>>>
>>>> Also guard pm_runtime_disable() so it is only called when runtime PM
>>>> was actually enabled. amd_sdw_manager_start() calls pm_runtime_enable()
>>>> only at the very end, after several fallible hardware init steps. If
>>>> sdw_amd_startup() fails mid-loop (one manager started, the next fails
>>>> before pm_runtime_enable()), sdw_amd_exit() triggers
>>>> platform_device_unregister() for all managers. Calling
>>>> pm_runtime_disable() on the partially-started manager finds
>>>> disable_depth already at its initial value of 1, silently increments it
>>>> to 2 and returns without a warning, so a later pm_runtime_enable() would
>>>> only bring it back to 1 and leave runtime PM disabled. Use
>>>> pm_runtime_enabled() to skip the call when it was never paired with an
>>>> enable.
>>> The alternative is to do a pm_runtime_enable() in the probe(), and later
>>> a pm_runtime_set_active().
>>>
>>> That way if the probe is successful, then the remove() will always deal
>>> a balanced enable.
>>>
>>> Maybe only put a single 'fix' per patch?
>> Thanks for the comments. I agree that it is preferable to keep each patch
>> focused, but in this case both changes are part of the same remove-path
>> cleanup bug and are tightly coupled.
>>
>> I do not think moving pm_runtime_enable() to probe() is the right fix
>> here. In this driver, runtime PM is intentionally enabled only at the end
>> of amd_sdw_manager_start(), after the fallible hardware bring-up sequence.
>> If one instance succeeds and the next fails before pm_runtime_enable(), the
>> remove path can still run for the partially started instance. In that
>> scenario, an unconditional pm_runtime_disable() is incorrect because there
>> was no matching enable for that instance.
> My take on error handling is to avoid partially functional setups. Keep
> things simple, fail big and fail early. Well-intended concealment
> schemes will introduce more problems, e.g. if the link for the right amp
> fails the left one might work, but users will complain about left-only
> sounds...
>
> That said, I am not going to lay on the tracks if this is the design you
> want for your IP.
Thanks for the suggestion Pierre.  I considered moving pm_runtime_enable()
into probe(), but I do not think that is safe given how the AMD SoundWire
driver is structured.

The current placement in amd_sdw_manager_start() follows the same model
used by the Intel SoundWire driver, where runtime PM is enabled only
after the hardware has been powered up and fully initialized.

More importantly, pm_runtime_set_active() requires the hardware to be in
a known operational state. For AMD, that is only true after
acp_sdw_clk_init_ctrl(), acp_init_sdw_manager(),
acp_enable_sdw_interrupts(), acp_enable_sdw_manager(), and
acp_sdw_set_frameshape() have all completed successfully. Calling
pm_runtime_set_active() from probe() would advertise the device as
active before any of this initialization has occurred.

Enabling runtime PM in probe() would also create a race window between
probe() and sdw_amd_startup(). During that window, the PM core could
invoke the runtime suspend callback, which accesses SoundWire manager
registers and performs clock-stop sequences. Since the hardware has not
yet been initialized, those register accesses would occur on an
uninitialized manager.

The failure path that motivated this change is also a real scenario.
sdw_amd_startup() iterates over all manager instances. If one instance
successfully completes startup and another fails later, the cleanup path
must handle a mix of initialized and non-initialized managers. The
pm_runtime_enabled() check added here ensures that
pm_runtime_disable() is only called for instances that actually reached
the point where runtime PM was enabled.

The probe/startup split is intentional and follows the existing
SoundWire subsystem design. Hardware bring-up is deferred until startup,
and runtime PM is enabled only after the manager is known to be fully
operational. Since the runtime PM callbacks directly access hardware
registers, allowing them to run before startup completes would be
unsafe.

Finally, moving pm_runtime_enable() into probe() would separate it from
pm_runtime_set_active(). The current ordering of
pm_runtime_set_active() followed by pm_runtime_enable() is the standard
runtime PM pattern and avoids additional synchronization requirements.

This design is not new. The placement of pm_runtime_enable() inside
amd_sdw_manager_start() was introduced by commit 81ff58ff71ad
("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
and has been part of the upstream kernel since v6.4.

In summary, moving pm_runtime_enable() to probe() would expose runtime
PM callbacks before the SoundWire manager is initialized, creating a
real race between probe() and startup. Keeping it in
amd_sdw_manager_start() satisfies the requirements of
pm_runtime_set_active() and makes the pm_runtime_enabled() guard in the
remove path both correct and necessary.

We will split the patch and push the pm_runtime guard change separately.

