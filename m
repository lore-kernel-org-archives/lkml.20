Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012066.outbound.protection.outlook.com [40.93.195.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14840F744;
	Mon, 31 Aug 2026 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180925; cv=fail; b=MzCkOjl3fQPejqMgQBCebjqUJz29bfupNNAwsaJs2tW6QzmO7VK7Xln60/D2s1kI+b4M1/+yvdE9rqEO+XhfVaxZ6vP5h4lOC3fLHPftIzbJXdZtUso2/zYUtzYT78tvS8z7NKPQ3d+uZxnhxtTHh8WQ5SeMd1cKBVB0Zw8AAaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180925; c=relaxed/simple;
	bh=8FNFb1iUddeaVpKommT1Yo3tX4dCHge07i/n8d311DM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pIOAP1BHhvgG4uOh0sVriXoEOXMTMhmgifk27WxhpmhNn1N7oNKtTMPV24ma/5C8LRCZChq6plI7y2GJFyUmFJvX7pyaiu25BeRh9lhdufEhYsyVFyOjKzyHhypj6KERBWDNY0eL1TYE5VQAlH6+PZiDCj8NEvEVf//jPhOHv1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CoEUztfO; arc=fail smtp.client-ip=40.93.195.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CoEUztfO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ph3ZgfRIl/m4doxUTBFpq58phuXG5lohXuzS6N6Un6D/SaZ1wbjiWYTJAkI332iUZmzy+WURqmhs+CASfdHDrIOiDX5mHq8r+8+O0K2Lsw0lxNawaQs+mjg7fnty2pt6kwbYOoAXV/9yFFDlK7v4mHSfkUg0Ki1MGbqZ8IJNDi9ZOBAnah1WZ2gRZSzr6HxCh4JcYLK/aldTR3llfmPpsHEgAHFcUi1igeCtRlJPmtCjDevd7Kv/rz/WFrFc0j4157JpVYabrld8/o16p+NkOUf9tw9iZW5gasnLp2+KBaj6OQhPysR5MQUCb/ofBBZvKS4U9OcluFHQYK1B6dvktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iUBvrTqgvuvulivRCgEcmmoMbWBr9gL6+w9HWY620o=;
 b=xfEPe6FP6Ay8exQRimoC/jKeDphfVEhVWPG8Mi5adkhoMNEGb+jAo4GnRRN4Y7YL96TxCprilRESEN+KzjSYmRa5PA3vrQh6H/t9Rfu4OLLFggCY+QVvWD9g8wMgkeiyi+2z4w0sSLFhKn9vWWNeOC3faTZVXuSY5Lt8mO6bJmw2zfS8o81cCQInHcrR2WQFEuu4a6r4K0E+0FV/weXf4m2p8oxL5MWsRTVkiyn4aNjvPUrA4g9pUuKHhXsiYaiBg+mJ0zARNl/E/6MBKLofZ+3NIavCq3FqsMRfFeC2Kv52jpUWe1CqbBtIgHrHqjzbMkBsFZ/r8nSFqOnqgsMcSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iUBvrTqgvuvulivRCgEcmmoMbWBr9gL6+w9HWY620o=;
 b=CoEUztfOL2F/PQN8EFmzntIERVOMj4r1aMCy8pCNA32ZqiNZ6OIY8rzvqtH8i9O/o6K5X/XAUh9dVBjC5iCr8Fh8y0ydVxioQfZ0AhFcK6q3hgRD4QgJzKCmf8BrdggLT6XbVV8q6aYmtLv3JUemckO2WFPYRL7UP71b3Fs63/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by IA1PR12MB6234.namprd12.prod.outlook.com (2603:10b6:208:3e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 12:55:19 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 12:55:19 +0000
Message-ID: <8e20e208-05a2-4ddf-9ff6-081ce33b5a42@amd.com>
Date: Mon, 31 Aug 2026 07:55:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Juan Martinez <juan.martinez@amd.com>
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
 Basavaraj.Natikar@amd.com, Sanath.S@amd.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260827215740.415496-1-juan.martinez@amd.com>
 <20260828051903.485922-1-juan.martinez@amd.com>
 <20260831111128.GH124825@black.igk.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260831111128.GH124825@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:806:22::8) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|IA1PR12MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: 000c776c-f1a9-4621-83f6-08df075f1c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6zwxgb/i0ODMXFDiX+UB2lDORfQscsKryXbV2yWtwpucC5u/kzLJktDTWNIkmM7bnA3cIppDz7co0J+GunGspSZw9t0h8ShvJQYsysId8wh9mMNxf9In+5bQzG1FDcl5+YQpp1IxUXYUAvDhozgV2sJ9B0uROWNeLwRusbqE3wV/Pe/1cegwVNc94lodIMuPpPE7cQQpwmbxzTbgiO4YNN8eXrCFy9cXz8BVhKVDXBk6ghLfhU0hcNkdLTiMz55r+C0eAeyUGER0cCqGr/DnooVelugixVRKPC7ev+MbLBzE8FNjtt49kfozPEUnN2vYP4txZ4Kr2jlRhq42D8Y/h/cbPb+BezYkOc5bXm6bVWyHxwt4EkAw4wLfL+bIDfkJi8e68+lwh5aJZDepz5sHNUzSI69wLV7Uj5VHrnnwACVSDb3V2rGzDa6twBLWSnooqbBp8I1Y6USY1O2QSkeSrVtVdkL/DDxpxnJfQXM2GQwshEagZBuTpAWtGa6E7AyMoyOgkYg/CSa+uMpQO3YCoI5CTcYwOWD9YWvHkcD7KpFOYaNXQbKglS1rSh5gfuDePi/OWL19/nNc6Mlxs4Z1G6eItLlzojP5m1Lr1K661JYpZ9hByeu4aUsT8dj7PzKH9oumHVEmXw7/oJaofn1gP7+jLXD7/NwRFtHFF6cvQpg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEE4WEFxMXcrZ3ZhZm9ycjIxUm92SVdMYUVDcEdBT0hjMy8xTGtHRmpaaEI5?=
 =?utf-8?B?Ukpqa0xmMVVOaE1QSUhibXhKWWk1L2hERFB3ZnlFZHF3R2ZHcXFHL2RZcDJD?=
 =?utf-8?B?eTJkK2s0djM1cURWNE5wTjBRblBWMjBpQnQyNEFmeXBuems5OXNLU3ZqcGVo?=
 =?utf-8?B?b1hITTc1UHZaalZXejA2QkloaVlSN0xqSUtnQktEOGRZK3dZRmVldHN6d2c5?=
 =?utf-8?B?QmVxVG9rQkxQRUR5VXdWaVBrbTJyN0N2Y1F0K3dPdmpDZFh6YWxEaDJRb2cy?=
 =?utf-8?B?S2xRamV2ZUpuWVp2bEgzUFBvYzNrSHJVZFFrK29jZnJBYVR3WjRSWEZPZXRr?=
 =?utf-8?B?eG1Ed2ZJN1NoQlYvTUdRVmxBVFpPRlU1WE9pdzJJMEcxTlExRmFkREl5ZlZk?=
 =?utf-8?B?QWFHWk9NbDNhalBlMDVpNm9yOEIxSmJHNTdWcjQrLy9uRWF6c2Y5WFEvcjJ3?=
 =?utf-8?B?VlN5S05KUjVrTlI5N0JTUEFyZW9JNUpRRU9VZE1hMnpINGRKbExHN3lRM1Zl?=
 =?utf-8?B?Q2cyTHd1RzZnSFd5Q1lTZXI0RkZ0VDBOL0xTenVXUURPdW04UlB0ZkJMOWk0?=
 =?utf-8?B?SGc0OWd4TVF0K1ZOczArMytjbGhOclZpdDdVa01XbmIwVFhiaVQ1V1FoZ01L?=
 =?utf-8?B?NGUzYlFHcmZNWFo4RWJhNkQvak1JVnVoampDSWRXWnRqTzRBZzVIL2EyMm9r?=
 =?utf-8?B?WDRQVVlZdEtQcDc1dWo3QmtvYS85OG5IQUpXdWR5b2pZcnRMKzdpY2FIYUt6?=
 =?utf-8?B?bEpzMDEyS3ppZEhKNVViV3RzWXNhek5aMkhicGVlMXptUm1HYkJ4dWlHNmd4?=
 =?utf-8?B?RE1xNUJPN3A1ZVAwNThVa20va2VlVHp6dlZLK0lOYjJsTFkxdm1wRjBkN1hK?=
 =?utf-8?B?M25RTi9VSEpHVTRVMkh0VUcvZnR2Z2U3RW5RVTl2NUZTNndVUWdlMzIwclMv?=
 =?utf-8?B?QmhlM3RIc1A0a3FoT3E0UEhrVTlaOEVvOGczVkVqSUlleVcvR3IrUkE4R2Fm?=
 =?utf-8?B?L3J3eWZITFQ3MCtsU0VWWnpjeGswTGdQRXlaMkFrTlhaQThXREV4RXBxUDJl?=
 =?utf-8?B?ZkZGOWpyWWlZZEduMlZGQUZQQkgzL3J4UnVVY2MvclE3b3JYZ21DMUkzVW80?=
 =?utf-8?B?QnoyUmJIN1FsQ2lHTzdlQW9YUmdETWhBUGpvV3Z4aWpoUVcwRkdVZW1sWTZI?=
 =?utf-8?B?WWtQTWlZUU5ma3J6SllUOHNZeElIMkhRVjQ1bmxFTFFHYitmN2hsOWxXUHBI?=
 =?utf-8?B?Y3NMVWdOL3Q1eVpyeFNkbUZLM2k0ODlYc25Zd2M5TlVLR1A2UEhHNnJ5cTZp?=
 =?utf-8?B?S1JJdkdqQVhrWUprZnBLUlMvRy9yUEVaYWc1Z08zd2FZTXRpYzVIeTV0SUwy?=
 =?utf-8?B?V05QblFCTU1kN3FvdTdqMWZEYWZhdnJjak5wVGd5NGZVb0FGWkpxaUpkKzdq?=
 =?utf-8?B?VllHZ0JDeHhkcjRkQlN2N3gyZFVuczFFcDRiMGtOSzI2ckRvZjdMZk5NR2xB?=
 =?utf-8?B?czl0SFkzWUVhQncweFd6M2F3N2JzYUNaWU5rWlZRbllUQ0pxaTFoSWxoNEtI?=
 =?utf-8?B?L252dDJMM1YxVWwzQW9LcW9INTdKZ04rajV5TTBxTjBGczdlZXFZTnhPaUt3?=
 =?utf-8?B?V2dtUGdwQW1Fb3llT0dZV01PU2dCTXc3cjhhUi9MZTJaZCtyZ1JEcExSLytl?=
 =?utf-8?B?WmowTDczVzl2UnBSWWZCN1YrOTdlckhocFB6czZ3akg3MGMraFk4eU5qQ0Fo?=
 =?utf-8?B?YUdzcXFTd2NVL205dWVkNk5lUUdaQlRGL3VrQVQvRXB4NmZSSXRaL1JCTGs3?=
 =?utf-8?B?cDhHa1FQaXI0SlMzSlpnd2ZvVU1hSXFWbHRSZmQ3anVUMjdqcE1RRzRWM1FS?=
 =?utf-8?B?OFdORUFqSnV5TWxlQ0taYWhNN3lLWTN4bnRuL2hPVmJNMjJiV0xYTXUxRWNx?=
 =?utf-8?B?UnhSREdIQkdLU0RycEpJZmpIUVl1Q3pzdC9nL1pGRmwvbHpMS3M4MDVrU2ta?=
 =?utf-8?B?NEVxYTl5NVFQcTRHNzV3UVhUUEM5cVp5SDlic3lFWnpIZWpoR25pK3FuZ1pi?=
 =?utf-8?B?L29XM1pmRHpxcXNvNGc2dGk5d0I4a2wyL2QvZEkwQ1hHanpnb2swZ1FHWE8v?=
 =?utf-8?B?SFp2OWx1NWpKR0t2cWhOeWJSOFhiMEFsWktIbENNd05UZUVxYTdWbmt1R25Y?=
 =?utf-8?B?blRpckJhVE1xSXRLOHhJYlpQc093SE5UNktJNjdNcWtNaFpTa2M0NUo1ZUwy?=
 =?utf-8?B?MmdxVTF2QkNqbUdLdVI0V3JBbng1MlRWY3VIYlMvK1AwVHZuSElUWUltK2t3?=
 =?utf-8?Q?2IYvmxgQ9I1wXBOoZq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000c776c-f1a9-4621-83f6-08df075f1c41
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 12:55:18.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ar4Y4EhyQ8MCjF7qwIlJKyiZumLgPUo/qYeg2fdBx4IQrdLRipK6dEN5Evvz4WhcNVuJvL9F+YXFLKgqhUjmEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6234



On 8/31/26 06:11, Mika Westerberg wrote:
> Hi,
> 
> On Fri, Aug 28, 2026 at 12:19:03AM -0500, Juan Martinez wrote:
>> Commit f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on
>> DMA path teardown for AMD USB4 routers") introduced a deadlock when
>> physically unplugging a Thunderbolt cable on AMD systems.
>>
>> The problem occurs because tb_handle_hotplug() holds tb->lock while
>> processing the unplug event. When it removes the XDomain services,
>> tbnet_remove() calls tb_xdomain_disable_paths() which eventually calls
>> tb_domain_reset_interface(). That function tries to acquire tb->lock
>> via guard(mutex), but the hotplug worker already holds it, causing a
>> self-deadlock.
>>
>> The deadlock manifests as a complete network hang because
>> tb_handle_hotplug() holds RTNL while waiting on its own mutex, blocking
>> all network operations system-wide.
>>
>> The existing code already handles this scenario partially: when
>> xd->is_unplugged is true, tb_disconnect_xdomain_paths() intentionally
>> skips the DMA teardown because the hotplug handler will do it later
>> via __tb_disconnect_xdomain_paths(). However, the reset was still
>> being called unconditionally.
>>
>> Fix this by:
>> 1. Splitting tb_domain_reset_interface() into a locked inner function
>>     __tb_domain_reset_interface_locked() and a locking wrapper
>> 2. Skipping the reset in tb_domain_disconnect_xdomain_paths() when
>>     xd->is_unplugged is true (matching the existing teardown skip logic)
>> 3. Calling __tb_domain_reset_interface_locked() from tb_handle_hotplug()
>>     after __tb_disconnect_xdomain_paths() where the actual DMA teardown
>>     happens and tb->lock is already held
>>
>> This preserves the reset behavior for normal shutdown paths while
>> avoiding the deadlock during physical cable unplug.
>>
>> Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
>> Signed-off-by: Juan Martinez <juan.martinez@amd.com>
>> ---
>>   drivers/thunderbolt/domain.c | 20 +++++++++++++++++---
>>   drivers/thunderbolt/tb.c     |  1 +
>>   drivers/thunderbolt/tb.h     |  1 +
>>   3 files changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
>> index 12c88509a54f..4cef9f4de523 100644
>> --- a/drivers/thunderbolt/domain.c
>> +++ b/drivers/thunderbolt/domain.c
>> @@ -788,14 +788,22 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>>   			transmit_ring, receive_path, receive_ring);
>>   }
>>   
>> -static void tb_domain_reset_interface(struct tb *tb)
>> +/*
>> + * __tb_domain_reset_interface_locked - Reset host interface (lock held)
>> + *
>> + * Caller must hold tb->lock. Used by hotplug path where lock is already held.
>> + */
>> +void __tb_domain_reset_interface_locked(struct tb *tb)
>>   {
>>   	struct tb_nhi *nhi = tb->nhi;
>>   
>> +	lockdep_assert_held(&tb->lock);
>> +
>>   	if (!nhi->ops->reset_interface)
>>   		return;
>>   
>> -	guard(mutex)(&tb->lock);
>> +	if (!(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
>> +		return;
>>   
>>   	/* The reset clears the ring state so stop the control channel */
>>   	tb_ctl_stop(tb->ctl);
>> @@ -803,6 +811,12 @@ static void tb_domain_reset_interface(struct tb *tb)
>>   	tb_ctl_start(tb->ctl);
>>   }
>>   
>> +static void tb_domain_reset_interface(struct tb *tb)
>> +{
>> +	guard(mutex)(&tb->lock);
>> +	__tb_domain_reset_interface_locked(tb);
>> +}
>> +
>>   /**
>>    * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
>>    * @tb: Domain disabling the DMA paths
>> @@ -835,7 +849,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
>> +	if (!xd->is_unplugged)
> 
> If I read this right, if you unplug a tree (say a router and then after
> that router there is inter-domain link) with this check the reset does not
> happen and AMD system still hangs?
> 

It should be a different problem.  The quirk fixed a problem in the USB4 
router (router wasn't functional when problem occurred).

This fixes a deadlock in the kernel that system gets stuck while 
shutting down.

>>   		tb_domain_reset_interface(tb);
>>   
>>   	return 0;
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index b7cc6894a598..89dfb3381345 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -2489,6 +2489,7 @@ static void tb_handle_hotplug(struct work_struct *work)
>>   			tb_xdomain_remove(xd);
>>   			port->xdomain = NULL;
>>   			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
>> +			__tb_domain_reset_interface_locked(tb);
>>   			tb_xdomain_put(xd);
>>   			tb_port_unconfigure_xdomain(port);
>>   		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
>> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
>> index 4373336d9425..2e6e0920cb1f 100644
>> --- a/drivers/thunderbolt/tb.h
>> +++ b/drivers/thunderbolt/tb.h
>> @@ -789,6 +789,7 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb);
>>   int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>>   				    int transmit_path, int transmit_ring,
>>   				    int receive_path, int receive_ring);
>> +void __tb_domain_reset_interface_locked(struct tb *tb);
>>   int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>>   				       int transmit_path, int transmit_ring,
>>   				       int receive_path, int receive_ring);
>> -- 
>> 2.43.0

