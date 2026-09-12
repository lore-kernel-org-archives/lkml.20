Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2559F3630A5;
	Sat, 12 Sep 2026 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789203047; cv=fail; b=SqEIMq0wWjRQMk4H87mPcNPEf0prbswK89Wa2dTr+8N6/+C3tzjj5zwhZSZE/WK40gpoIXP71bBG+Or4hkndPhVU29MqNlQDfvdBchoI4y0NQ1YRwYg11xEH135pD9bHddID4dH6Mx/MTSWkA3s4/95saDISg+dk3XAxUEyoxFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789203047; c=relaxed/simple;
	bh=RrhN5Pgr9JBHp4EobJhwEv9BrCt1zRj4whCoND/C/OM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DPRyX4cZna+MH+oe+oGhve6k2bIuRR+jfIJPCncKVDSqW6kLQFWpRmdyJChSzcVz2Q+tIrxVT3wkQyM6+Ta9dEpcJRzuGKzUC1L8A88WoKTNP5Kparr3GdnI2e8tdNiWw9XEkar62/ePiuabA5FrMMB2S/WnBXeFPKcOfm92bYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EhfAMRNI; arc=fail smtp.client-ip=40.107.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EhfAMRNI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM8pJP2s006WGatT5SZ9GpadKOl6EjUaUc+bGNS+tA6nrVl51EoVFY1vtlyTWcS94eBPmiKS+xfh+2wNeKUJGUGIVOm9Ezidiuw2XasY5y5tLZNV3/w0jKtgD1s+1w3r7SYPMmqP5cMQeydOa3rP+0R+nnh9ZisS8n2vZxDTc7fVv2rMudMcln16zZgsOvNa17SJO13NwWCPw3ZQ2PzKXSjgkOxJ5PJvL8x/ot6C6PioXnw1mZIy82DDPOwxi0Q2joeLND+sbWtvVhlcuYxM7tYyLIMNBR0yqB0AfpoETv4pfKVxUmVaiMjv7mx7Sto81FXozIPSgnrGSzLfwycklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QrEV81hEs0XdDmfsFztPPv4A+sFjqm0H86GVY2rbOE=;
 b=WwoNwA7oa9lBveTyMv7kBtotGcoFnf1Iwp/0AQqfx/qdohaCN59S9/U90suSDY3S3cNqw/wCUJn/PdmWT+fKM/kc2MyZ5mwdKi3mN+hbZx2c/7MBngaif/Puway5Kz9Z8/oBUfqaemJ1Ja5xIsMKCD7DmMJrASX92iTyW2GB8rAmY6uS9BNmJ9aMCtEzyTT6XsMWfUuu8jYCrJS2w+BTIVbOXdXT5AytU10/5DvoI7I3s6FSLIth3rN8rwk+MYk/SC5+ShopE6Dw7agn0Z33f8w/JoATMiU1YMHd360F8mPAMcSQXWZuKQYBmkkFVQ/IbAsLsgbhxyAFY2jQ0i6ctw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QrEV81hEs0XdDmfsFztPPv4A+sFjqm0H86GVY2rbOE=;
 b=EhfAMRNIVNsk/yxKiPS/wvqUyV/mPCrHROt7CaS+Tp6rDvNlIJeVrxKSLEyC90QXkVEzIrAsSSdBHil+pKuSgVAW8wUjUj3hHMBrZo6iCdYQn9uqFygfyAywL1R3o+sHy7jzXTQqu+cofB3bsRPHqeAdhKElUfYAUhH1y8QCQ44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 08:50:38 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 08:50:38 +0000
Message-ID: <1d88a835-5417-4314-b166-47e1ad09bead@amd.com>
Date: Sat, 12 Sep 2026 14:19:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] soundwire: amd: fix SDW command timeout return value
 handling
To: Mario Limonciello <mario.limonciello@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Richard.Gong@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
 <20260910190240.1604447-2-Vijendar.Mukunda@amd.com>
 <813fafd9-64fd-4f0c-9aa6-37fba57a1f4a@amd.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <813fafd9-64fd-4f0c-9aa6-37fba57a1f4a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::31) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 709bfecc-d515-4d63-f35b-08df10aaeaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WA8FjBSjd4JxXD/ZHCP2yTJRpoX9fDUYUNZ6exG9kQFOImeFybtX3YhXSAimq7rEnz/SJxpGCw1/w/DLmovPjhZDUFysQHyNxhBJNOfRQ/8cUK1DfKwf0BbqS1/YqznTpj/n7F6pyG0FTMUX0PzyX4uUAZKlmUIERBS9Z+Smpzr269ODu+YqpXXB0aAjMt/d1Y9Qrc8CAMBwzJptb8Y60v54mQpHXIc8tJNp9FrV5EI5gBfPDuYZP8RVw/h7v6GxtesbhxXZntl1gMQZoTNs72CuXfMaAucUBybKBXBfy9R/b7XqVwiiymje4g+3qrW6vXD4F2K5tt8N7haeAOxRTg8jOTH4nAzIJDAR+rBHeWLEyPo0tjz7RMAEgtFr7tqHLLKIpwXASyhnSF99A9N6kjk5tzZ3JeKQjWnZ+CuScKOfNP0ya9c3tuUgyH4IkVCZV6DyqpgxCwvbjeUKv8eWjuxd8pXCg2VyXGcB7+TwRjnMOgzb40eFaYbRicy6tgpPA1OtQlKop8aJ/j3AzyfE4XxEruCRe0vjW8H9yZcaLdoXSnO2EHDu6++kAaQEqmf1MLS3A8++ZhZq+MwnkRGbmo6hCAvAb409TKm7/98BAJdRAaTo2by2/BrXkXM2C7qb0V9DJl7bh+8YAkkyiwdgqQTdBDwTRNGIAQvcUAh4oTE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGlrV3FtWll0Vk9TdThWRXhlMGZNdnRsVTNYaHdxVjBud0M5ZFBXZytoM25Y?=
 =?utf-8?B?WFdFSmlaL1Z4a0paRytXU01UZnVCLzhlLzlnYldBK3F6eEFjN0U1S3pOY25E?=
 =?utf-8?B?UEQ0N3BZODNnVTRFeFJ5ZTFkMWVrRzBuS3ZUam8xVU4wZm9TcWV0Nk5SaHF4?=
 =?utf-8?B?MkJlSXN0Rkh6eGhOcWVOVXc5dDlWNHB0WjZhRC9BQWFCeVNWQU0zbzlUZ0Fi?=
 =?utf-8?B?V2ZWVnR3N1dRWmtJT2xJN3hYZUVJQWdKV2hXVi9MNmNHM1dGaTZBZWxXaytV?=
 =?utf-8?B?Tm15OFJ2TEtJZG1IaDVTWlMxWXhmNUdBekdhaTQrWnBUSHdsa1ZqL3c1OC9p?=
 =?utf-8?B?RVczZFpJSGhCaHdDZm1iWTk4STFhK1U2UWtNajVPWVpRK2lLQnVkQS9taExz?=
 =?utf-8?B?RTIxRUtHZlJrVzdnNFc3UUM5WjYwTnJONHJra3hIbVc3U1hnbFVtVS9UM3RY?=
 =?utf-8?B?RFAxVklGNkNaRW5ScXU1V0VwK1JsSzFlYTJ0ckhINnNxRTE1WjJiL2VPU1Bm?=
 =?utf-8?B?R0pOMnhpSUU2MzVnRjU5bTNVT00wRHYwTndGelVZZnhkazZIUllWWGNFdDdw?=
 =?utf-8?B?VkVDQkU5bytybWk1bEpWSjZsUWNVdmxlQUZmcksxR2t2Um44ZHgvMmZHdk42?=
 =?utf-8?B?OVFVSFd4WkRaOENrQTZKNmptc08vVURudncwdUY1czlHNmszZ1c3TUxOT2NO?=
 =?utf-8?B?M3hpTExPZXplTGdCUjZ6SUpQd2U0UUFqWXZJVUNXMTVKR3BINmFiYVVmY3RM?=
 =?utf-8?B?T3VVRmlXMlhtdXR5ZGEwWTFyK0EyK094a0p0N2VBOEc1NlVxeGtoWkFZMmhs?=
 =?utf-8?B?WXZ0ZjFrc3BuQ0pOczdQRWZOc1VxRndhelMvMEZNYktwVmdPUWFwU2FBUkdU?=
 =?utf-8?B?Q3NLNjdvUmxpYWZob3MyVHJ4VU9sSlM4Yi9UK3Q1c3gzUzUwYUtTbkIwK2Fr?=
 =?utf-8?B?SlpTeCtwOTJnV28wcmRyTEZaUHRXaFAyOGVoQXJ6NS9sWmJTRmgycXB5MjNO?=
 =?utf-8?B?a2RONGhqLzZoK1ZKSG5kSnh4TC8vWmtFSUp4aDhsam10bWJQNGdFOTU0SUFB?=
 =?utf-8?B?L3g2aHY1K2ZCTDB6VGQ1Nk1jbTZCQ2xDMkJLckRhMVE4aG9UU1d6MlMrMzlL?=
 =?utf-8?B?SnVHOWloUnFzUHRTaW1EQVFzdTRxQXNsZG9mZnJIYkpSWTViTU1nNThTaU5M?=
 =?utf-8?B?NmdxL2hxNDdwYUU2UGQxUDVwWUVwUXlXNk1xKzUzMFJJWUFSUENSSWl1MktZ?=
 =?utf-8?B?UUVuRllZL3R5RmFjSnNPUlQ4TWZIcEsySTVaeE9sTFVkVWpmNC9DMU5HeGl6?=
 =?utf-8?B?Vy9BSjZnQ0F4YjljdTNqQmx0NVhMSzhmY1hGenFabEVPZ0o5bFdoSEpoZk5E?=
 =?utf-8?B?V0libVM1bFVmeW9BYTJnZXFrclU2YWhNNUZrQjJZZ3BINGQwcXZpZlBqRVNO?=
 =?utf-8?B?NkV5NVJtellvSE53aFhhTUNUalhpQzl5STFxYnFOSU03aFpuOGxpRnpMTlkw?=
 =?utf-8?B?Zjd0UlJnQjJOOTJraUV6VXRsYm1lNU5JRUFiWlN3NTBZRE02b3B2eFlrUVFR?=
 =?utf-8?B?d2RIM2JTYmpvdVlBOTdDNjM5VGIrUitpMlhEb0FBZkowbXZsaWF1dks1aHpN?=
 =?utf-8?B?TERIUnQ0aTM2REQxRnBYVWRPa05aWExEZ2RqbFNXN3dIa29ZWHhtcHpqRE1m?=
 =?utf-8?B?V3NZSFEvUmM5elNJT1FDNzlyT0w3eHZYWS8rOUNzS0xyMjR4b3dnMVBUYjBS?=
 =?utf-8?B?VDdwNnFZK3JvckZPNGJCYUVPRVhzYVc4cm9TZUpabHBLYkdmZTBXWUJjWnYw?=
 =?utf-8?B?cWlQWU9SY3N0UllhT0xPcWE1SGJGYlQ2bWRsRHZFWm1FT0FUSGlsK29JK2lt?=
 =?utf-8?B?R0R2WFpUTFhMS3hpZXhGSHhtZ1ZsNEJZdnkxTjg4dW5hNXIvdXRmRDVNQ2Y2?=
 =?utf-8?B?U1Q2WENqU0x5RjYwVDA3MU04Rll0dXlhSGVMY2E3Ni9sQ3dCMWNnZkQ4Vlgz?=
 =?utf-8?B?ZElEKys4SWRPLzNVbDcxandUWWJ5c0t1WGxaN0RoMGlHRmhCcmN3SjhjaGRq?=
 =?utf-8?B?UWpuRWlMMDNWQXByeUZydVVMVGkreEt3MFVCaThUUTlSUzRGbjJQRHdBL051?=
 =?utf-8?B?ck02Tkk1ZEtsVnhTVFVNZnUwOWNFVkdiSnhpZFZIYmtmUDM5bDliQkYyejcx?=
 =?utf-8?B?UWNaaWw5YUNTN3Zub0NacG11T201YlNRWmY3Nmd2Ym5SZk9MS0NGZEVmNVdI?=
 =?utf-8?B?N0hnRjZ0cG12MGxpZTB0Z1hYZnBZKzlSUzBYWFhYR2xVbWhkY3NhYVhJeWow?=
 =?utf-8?B?YlpoQlovODhoeTY2MHdKZ1N2eSt2azlENW5GeG96WUsyT3dpYXpOdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709bfecc-d515-4d63-f35b-08df10aaeaba
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 08:50:37.9810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYt/sPjjtmmzPMEJrgfeIe9RUHUam4z4dM9E4HEUUWB9aj3lzGyB530bl2KDT1B1/cGbZaVNFpHyqpGXf9Vk8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713



On 9/11/26 23:18, Mario Limonciello wrote:
>
>
> On 9/10/26 14:00, Vijendar Mukunda wrote:
>> amd_sdw_send_cmd_get_resp() returned u64 but was returning -ETIMEDOUT
>> (a negative int) on readl_poll_timeout() failures, which silently
>> widens to a large u64 value.
>>
>> Change the return type to int and pass the raw u64 response through an
>> out-parameter. Timeout is detected directly from readl_poll_timeout()
>> return value.
>>
>> Update all callers: amd_program_scp_addr(), _amd_sdw_xfer_msg(),
>> amd_sdw_read_and_process_ping_status(), and amd_sdw_read_ping_status()
>> to check the return value and handle timeout explicitly. In
>> amd_sdw_read_and_process_ping_status(), the mutex unlock is also moved
>> to after amd_sdw_process_ping_status() so the lock is held across the
>> full status processing step.
>>
>> Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager 
>> driver")
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>   drivers/soundwire/amd_manager.c | 56 +++++++++++++++++++--------------
>>   1 file changed, 33 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/soundwire/amd_manager.c 
>> b/drivers/soundwire/amd_manager.c
>> index a3316efdf8ac..fa3f4e797edd 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -250,10 +250,9 @@ static void amd_sdw_ctl_word_prep(u32 
>> *lower_word, u32 *upper_word, struct sdw_m
>>       *lower_word = lower_data;
>>   }
>>   -static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager 
>> *amd_manager, u32 lower_data,
>> -                     u32 upper_data)
>> +static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager 
>> *amd_manager, u32 lower_data,
>> +                     u32 upper_data, u64 *response)
>>   {
>> -    u64 resp;
>>       u32 lower_resp, upper_resp;
>>       u32 sts;
>>       int ret;
>> @@ -291,9 +290,8 @@ static u64 amd_sdw_send_cmd_get_resp(struct 
>> amd_sdw_manager *amd_manager, u32 lo
>>               amd_manager->instance);
>>           return ret;
>>       }
>> -    resp = upper_resp;
>> -    resp = (resp << 32) | lower_resp;
>> -    return resp;
>> +    *response = ((u64)upper_resp << 32) | lower_resp;
>> +    return 0;
>>   }
>>     static enum sdw_command_response
>> @@ -309,19 +307,22 @@ amd_program_scp_addr(struct amd_sdw_manager 
>> *amd_manager, struct sdw_msg *msg)
>>       scp_msg.buf = &msg->addr_page1;
>>       scp_msg.flags = SDW_MSG_FLAG_WRITE;
>>       amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
>> -    response_buf[0] = amd_sdw_send_cmd_get_resp(amd_manager, 
>> lower_data, upper_data);
>> +    if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, 
>> upper_data, &response_buf[0])) {
>> +        dev_err_ratelimited(amd_manager->dev,
>> +                    "SCP_addrpage command timeout for Slave %d\n", 
>> msg->dev_num);
>> +        return SDW_CMD_TIMEOUT;
>> +    }
>>       scp_msg.addr = SDW_SCP_ADDRPAGE2;
>>       scp_msg.buf = &msg->addr_page2;
>>       amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
>> -    response_buf[1] = amd_sdw_send_cmd_get_resp(amd_manager, 
>> lower_data, upper_data);
>> +    if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, 
>> upper_data, &response_buf[1])) {
>> +        dev_err_ratelimited(amd_manager->dev,
>> +                    "SCP_addrpage command timeout for Slave %d\n", 
>> msg->dev_num);
>> +        return SDW_CMD_TIMEOUT;
>> +    }
>>         for (index = 0; index < 2; index++) {
>> -        if (response_buf[index] == -ETIMEDOUT) {
>> -            dev_err_ratelimited(amd_manager->dev,
>> -                        "SCP_addrpage command timeout for Slave %d\n",
>> -                        msg->dev_num);
>> -            return SDW_CMD_TIMEOUT;
>> -        } else if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
>> +        if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
>>               if (response_buf[index] & AMD_SDW_MCP_RESP_NACK) {
>>                   dev_err_ratelimited(amd_manager->dev,
>>                               "SCP_addrpage NACKed for Slave %d\n",
>> @@ -366,11 +367,7 @@ static enum sdw_command_response 
>> amd_sdw_fill_msg_resp(struct amd_sdw_manager *a
>>           if (msg->flags == SDW_MSG_FLAG_READ)
>>               msg->buf[offset] = FIELD_GET(AMD_SDW_MCP_RESP_RDATA, 
>> response);
>>       } else {
>> -        if (response == -ETIMEDOUT) {
>> -            dev_err_ratelimited(amd_manager->dev, "command timeout 
>> for Slave %d\n",
>> -                        msg->dev_num);
>> -            return SDW_CMD_TIMEOUT;
>> -        } else if (response & AMD_SDW_MCP_RESP_NACK) {
>> +        if (response & AMD_SDW_MCP_RESP_NACK) {
>>               dev_err_ratelimited(amd_manager->dev,
>>                           "command response NACK received for Slave 
>> %d\n",
>>                           msg->dev_num);
>> @@ -390,7 +387,11 @@ static unsigned int _amd_sdw_xfer_msg(struct 
>> amd_sdw_manager *amd_manager, struc
>>       u32 upper_data = 0, lower_data = 0;
>>         amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, 
>> cmd_offset);
>> -    response = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, 
>> upper_data);
>> +    if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, 
>> upper_data, &response)) {
>> +        dev_err_ratelimited(amd_manager->dev, "command timeout for 
>> Slave %d\n",
>> +                    msg->dev_num);
>> +        return SDW_CMD_TIMEOUT;
>> +    }
>>       return amd_sdw_fill_msg_resp(amd_manager, msg, response, 
>> cmd_offset);
>>   }
>>   @@ -446,9 +447,14 @@ static void 
>> amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
>>       u64 response;
>>         mutex_lock(&amd_manager->bus.msg_lock);
>
> guard(mutex) might work better here so you don't need to cover every 
> exit path with a mutex_unlock() manually.

Thanks for the suggestion. I agree that guard(mutex) would simplify
the locking and make the error paths cleaner.

For this patch, I wanted to keep the change focused on fixing the
-ETIMEDOUT handling issue and avoid mixing it with unrelated cleanup.
The driver currently uses explicit mutex_lock() / mutex_unlock() pairs
throughout amd_manager.c, so introducing guard(mutex) in a single
function would make the locking style inconsistent.

I'll plan to follow up with a separate cleanup patch that converts the
eligible mutex-protected paths to guard(mutex) consistently across the
driver. Keeping that work separate should make both the bug fix and the
cleanup easier to review and bisect.
>
>> -    response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
>> -    mutex_unlock(&amd_manager->bus.msg_lock);
>> +    if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
>> +        mutex_unlock(&amd_manager->bus.msg_lock);
>> +        dev_err_ratelimited(amd_manager->dev, "SDW%x ping status 
>> timeout\n",
>> +                    amd_manager->instance);
>> +        return;
>> +    }
>>       amd_sdw_process_ping_status(response, amd_manager);
>> +    mutex_unlock(&amd_manager->bus.msg_lock);
>>   }
>>     static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
>> @@ -457,7 +463,11 @@ static u32 amd_sdw_read_ping_status(struct 
>> sdw_bus *bus)
>>       u64 response;
>>       u32 slave_stat;
>>   -    response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
>> +    if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
>> +        dev_err_ratelimited(amd_manager->dev, "SDW%x ping status 
>> timeout\n",
>> +                    amd_manager->instance);
>> +        return 0;
>> +    }
>>       /* slave status from ping response */
>>       slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
>>       slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) 
>> << 8;
>

