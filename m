Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012059.outbound.protection.outlook.com [40.107.200.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911AD43441C;
	Fri, 11 Sep 2026 17:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148945; cv=fail; b=GjS03iwyXE6/5swLcrGw28RDAJ6Mi9XpM1GVXP9ylfzBs24JPZ84CvYNNIKdoONKnm8qJK7VFWjMWqLLvgLvaf5wOMyCNN7Knqndhe2Ufb5NmvPCrwzdck5MOigQDkiMbrO7EwNU26pNCIThoARqUc826LEml15D4OTWr9jxTxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148945; c=relaxed/simple;
	bh=oO+n3CEh96PXvNC4mimh2gPV2D2l5YqN8P5WwKUvjZc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZCoEfBRPa9soXIEUQQQU6R/IOrxnOD6q40D81G/EBDIiUVagMg1eGfPy78CzShO1XCjfK/r40Juun4+1atLe8mUGFwHkNykHoxMtPOi2zI4bTy3YzhRoakJLJpvF+NBpzVOWIszunyMc70UDcQ3yWK0YxURTtB/YmsFmL30/OJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JBPPpPhR; arc=fail smtp.client-ip=40.107.200.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JBPPpPhR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNlVqsod9xErCyaEo/GxXIN/tWJqiQ76rXlSzWlBn8hD1QMUmla/D199YgxbyWYUSZF9PjKURkGZfUEeNJQC1oUNhLAQw8JJ1cAZ3ChrBvFQWQ6qvxP/keqOgJFWN49AdS+f6nGRxho1aMrAOV/nYpsTa5XuSoFYLWjmGHEA+BdRxTJu6L0yWO9t6Aa+0U9Iycv1CIHlbnWyieDD8xJjjPj3+TWlXP4ad2g9N6lJLBfua0IMZ96XpC+kAOFuhK7YjN4Q83PkjcleEfK60up5R8F4O9Vk4hwFCKHuQJd4DXEg4I5V2ahXZpthG+4PMc/yXsBB1sc27kWNFTRaZ3DK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpspG6vG3Y3cHgg4GM18u+7P5oi/5kSrhld7KKwxxio=;
 b=HjHg6NZuAto5TLVFsxoLbbTGxV0P1XU66O9eGP3e8XeZcgpg+DQvkM9YEtd1D0kDOS/Utf259cklbIZYvuRqq+jLNIgwBz6Ul6wggxhl9ggYo9z/tXaf/VsEwsqQN1PqloHdmGbaxwHLZXWT5dbm2iExz4cO0rPiCvSy4NxVK+sxwJlyD5qYgVDlkr4xWDXglEimkBGsSPifMctHPeWiNheDUHitzfMh0/U68lFJx72/UkUG8DcdGBD0jAMVVk6HZ37jotk4VwqUltiKxCWUGy23MUfWDvbEjslD9lHnEPzDw/1tJbCqL+8Zu71JHHmFosVZ1cXBXwYpdGxgLGeJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpspG6vG3Y3cHgg4GM18u+7P5oi/5kSrhld7KKwxxio=;
 b=JBPPpPhRuH2jGvbdi5MP9CG3+d7fMbCcTXZsGSUVjksnmWkTbSEJ5fN7/968ErLq3KzVcgOHrG6oSq0oOWNjw4UjtjJkQNMEpiZ946xHRB5aqV3l2wn6+Fb4O+wwO6SDBIRrV2O/l08UoTZSAOyqDyWrodzNUnDqQsJbqCe9A+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8)
 by DSWPR12MB999152.namprd12.prod.outlook.com (2603:10b6:8:36e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 17:48:54 +0000
Received: from MW4PR12MB6921.namprd12.prod.outlook.com
 ([fe80::cbf7:e2db:1d37:c83b]) by MW4PR12MB6921.namprd12.prod.outlook.com
 ([fe80::cbf7:e2db:1d37:c83b%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 17:48:53 +0000
Message-ID: <813fafd9-64fd-4f0c-9aa6-37fba57a1f4a@amd.com>
Date: Fri, 11 Sep 2026 12:48:51 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/8] soundwire: amd: fix SDW command timeout return value
 handling
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Richard.Gong@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
 <20260910190240.1604447-2-Vijendar.Mukunda@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260910190240.1604447-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH3P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1e8::13) To MW4PR12MB6921.namprd12.prod.outlook.com
 (2603:10b6:303:208::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6921:EE_|DSWPR12MB999152:EE_
X-MS-Office365-Filtering-Correlation-Id: 0305e0c7-5f7e-4f6b-4363-08df102cf21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ksxsX9R2pZUsADZ7v9NndZWPGD4ZAOi6pn27ZXt+4xODXVoW481KPW/J6NJb137bvW75K4pyHdOBamzdHB5FFQysPlPDG6LW/OvwT5y331BbwDTwx8rja7RpXEEkPJVX966J2SsvmPN1Sgv8GjpsrlM9tuIlXqip+Tj58izLFUzokARBaS08gwSsomy+ruYjaVi42sCGAnFbYwx8Fe4v/9iO52EffTDdGbhVVzgI1gUnTcTGQ3rRO8CxT1mGISsi/75yR9VoBj76Ha3QAPKdo+Hc7ns+TqhS05TUVbcsDbU5Gz3usiwIiefB0QTXavaaE/8NraPKYR6O/9xh2IHaolq/WZkOYCyuycu8Pcaxb2BBlvwnOyaA7cjb9E7A445ark5XElqlOyCnMu/BXAJRexbt2PXA95zD3EZGJMcUs+faE9EKWR8hemWQa6leaLBrfD27M0MzF6Q8KvBOvXNtCzj09qVSgKPEUUVQzO2VLwVrbAPYDBZQAM6+88bsEf6QIf4v2v5BqTDeuZA0f+3e998IJxU/GfCwppN9p8GSrQednbt/yf5NnHol/dGAfFIv6Ovkp+rIoCEx8a+Y0eVUkKB8Sr8FaKsSDWGoa0Q3fLvKniKEqWCesfM8+y0Wl9Xg5eka2yB2y/mNrFCB0dkZlxwpkcGXyA7TV8BLyN5gTm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6921.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW42WjJ3NEZnd1lJLytYZFJEWmppbEEyWFlqb0UySWhpWGJFZUwzbWtSWHB4?=
 =?utf-8?B?RU5HcXR2WlJLL2htUVNWU1FpNzVtaCs2K0ZWa3d2N1duS2ZIczF3dlNhdW5O?=
 =?utf-8?B?Mm5zTDUwTU5xZnJxZythNzhDREp4WktWNXZuQkpLRTN0QmtIcDdWYUhRV3hy?=
 =?utf-8?B?UjJmQTBlTzUwcXNmMEI1OHBmQnl6YndEK1hTSmQxNmp6UkVxanF5YzlJcUtT?=
 =?utf-8?B?eVZNbUJaS2JFYlFQQXV2ZUk3anR4SXc2T0ZOUU1TbVFiVjliVDZNMG9kd2kv?=
 =?utf-8?B?NTBxTG0xYUkxMlNydjJmN3c3OUpHUmRwZ0JqMmpHRXo4TmIycGVUQWoyNXl0?=
 =?utf-8?B?R2tobEhrbzduQVpyWHllUTdUUTFmZ2o3Z25pRDVLUFNXUElrd0xPT0R2RzMz?=
 =?utf-8?B?V0VJSzRTbS9kZkNGZyt1dzJRWkcwblhsc1pNbHVJYWptUHE5KytHZG9NT1o0?=
 =?utf-8?B?M2dlcFhQSHUrUWVsMEJ1T1Z0WXlZZmJrbFdyRU91dHR5ZWpuQ1VrSjRqZGdw?=
 =?utf-8?B?QXBDc3NqU3hRdDNkSWNmSmxBT256ZnFuSnVHbmtKbDl2WkpHRGlzbG1kYjY2?=
 =?utf-8?B?dHZobjAybDVZSVVIR2dxNDlNZXdVWnFFbTdtcXhVQ2NMUkJsRzNGbWpUN3ZP?=
 =?utf-8?B?RGFrclNPc243b0dmVEVScWJVQXkyTmROeThTYk5xbHpQLy9XRVhwR1NOUE0x?=
 =?utf-8?B?NEVnQzI2N0Y3c3FJdndzNzlzZUIvaWdaaldJYlNpaUhjUlFuWFV2N05WLzdI?=
 =?utf-8?B?WVFwLzBpTkU3SlRrelZJaGF6a2NuTnpHVXlINmd6RzRaUW5rOWI0TG1CSDdl?=
 =?utf-8?B?V2dIeGhuWXlXZFE5d09PMWkvdVp1bnQxUm1HdmxMNG9GVDBnYnRvbndkaXV5?=
 =?utf-8?B?VzAvVCtBeCtoQjlZYmtiT0ZBUU9TTm9wVVBiWmtvaHo2S2dSbVA3VUFHTFJz?=
 =?utf-8?B?MmRZVzFTQVNOSlBvOUVJdHlGdFlxTWVyUDNMUm1QY0FQZWR2TENhWHFmTVR2?=
 =?utf-8?B?M1NnK1FRU2UwM1U1c3ZQaUE0b0orbWpPcXZkc2RCVUJ1TWRyUDRKb2Q1NHIv?=
 =?utf-8?B?M3MraC95SmFIcUZ0R3hXb2xGMWw0V0hySWFUWitpeEVHMTAxb1RWRjJwK2x3?=
 =?utf-8?B?Y0NPU1JUVkJ0ODBpQncyQ0NkNVJYaytDNEFIOVI1QWJVNHFEekZYbEpPeDFj?=
 =?utf-8?B?bmlRQldIWElWNUZJWmZZbGxNTXVIOEdzcHg2dW8rN3NmUkNZTkJ3UHowRytu?=
 =?utf-8?B?VHJZZGNCT3hCbHEwbFZoQWw1YUZlaFRBWjBFOVIyV2VEWVMzdTEvVyt6S3BO?=
 =?utf-8?B?ZDA0bHk5a3ZKbW45MTZIQVc4cldyUitiQWhmeTZGRkxXOGRnNGxXU1FFb1ZF?=
 =?utf-8?B?TUVyTnl0RDRhdndreXVUT0JRWlZtbHBNTXJoSmxUS2g0bHZNSnVndnN0d1A5?=
 =?utf-8?B?eTBZMUFzVVcvaEszK09YK29pQmxHamprVytac2s3bU5XSEhOZUNwT2I0UVVj?=
 =?utf-8?B?VSs4aC9YYlp1TXR0dkREM2ZjYXh2S2FNTmE1QWpVY2VKZlZVMjRtQUNrVGVC?=
 =?utf-8?B?YjMvM0FHSUk3QU91bVFBdk9LejJDZjhUa0hvQURDQ3FnbW1uQnM2ZitFVFdB?=
 =?utf-8?B?RVAvS0VNZ0NzaTFhb0pHbzlsaWVxRUVBOUprbVh1ZVVwZWs0enkxelRkUDJR?=
 =?utf-8?B?d0dCOUIvTnZXTlI0K3dsTlpHakxRZm1JWlJSYkpxRk1OZFlaaTB4Y0tlM28x?=
 =?utf-8?B?ajdub3AyY0FBcjdRYkxYTk51Rkd1WU9BYU1nZ1dEQ3E2SGc5NVRNUlkvRGdC?=
 =?utf-8?B?TlVXWTVjR2wwOVN5L3FFYnM0TFNiSVJRM3A4VDM0Z0tsVDk0ZTNFMGc3ejJY?=
 =?utf-8?B?cnlpQTZ2dlBTMnFoSG55OTduempGV1FSUTdlSnlGS1p2OG1vdUc3OTJBNUw0?=
 =?utf-8?B?TERrNFFvZlVUV201aWxHY0tqSURTZmtnMkduQlFqSVE1YnBYcnkyVkNrVW9T?=
 =?utf-8?B?cU5QUk5YREhsN3Vsa0sweXJwU1NQVWNNZ0NmNWFpa1hLT2N1VXRuQXNwWnpK?=
 =?utf-8?B?MkkxcVMrOG9mNXdoTmlnT2dyd1EyY0lnaHhyeFF3c1F1MlVvOC9zbkJoMXgr?=
 =?utf-8?B?TXNJQkQ5Mnd2Uk1aRUY1SVRZTTJRY0ZVOUZxZzIyZzVSSkVzQU1qSEcwbUVM?=
 =?utf-8?B?ang0dkF0Ri8wVHlDd0FqQmR3K0pRcE5WU2hWejQ0OGh2YWxYSkVnMW1aZkxE?=
 =?utf-8?B?UUZTS0tGMjVXS2VialVvcGYxaHdYamRlUlJFV2hLZ2FPWXFmZlJhbXZkRGtE?=
 =?utf-8?B?dllHU3pOZmdXaWdYRHRhK3FsbmE1TnNWbWJtOFk1dHQydlNOanlYQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0305e0c7-5f7e-4f6b-4363-08df102cf21b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6921.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 17:48:53.7719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOyhIP2GM8TBnNsT6HvmL1Jm+rMfapJYIaEyT+iGgPhOkltIKw54t2TPOLCq9tZJm0gokUE5a1v1FmbPqvS2eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999152



On 9/10/26 14:00, Vijendar Mukunda wrote:
> amd_sdw_send_cmd_get_resp() returned u64 but was returning -ETIMEDOUT
> (a negative int) on readl_poll_timeout() failures, which silently
> widens to a large u64 value.
> 
> Change the return type to int and pass the raw u64 response through an
> out-parameter. Timeout is detected directly from readl_poll_timeout()
> return value.
> 
> Update all callers: amd_program_scp_addr(), _amd_sdw_xfer_msg(),
> amd_sdw_read_and_process_ping_status(), and amd_sdw_read_ping_status()
> to check the return value and handle timeout explicitly. In
> amd_sdw_read_and_process_ping_status(), the mutex unlock is also moved
> to after amd_sdw_process_ping_status() so the lock is held across the
> full status processing step.
> 
> Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager driver")
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   drivers/soundwire/amd_manager.c | 56 +++++++++++++++++++--------------
>   1 file changed, 33 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index a3316efdf8ac..fa3f4e797edd 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -250,10 +250,9 @@ static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_m
>   	*lower_word = lower_data;
>   }
>   
> -static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
> -				     u32 upper_data)
> +static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
> +				     u32 upper_data, u64 *response)
>   {
> -	u64 resp;
>   	u32 lower_resp, upper_resp;
>   	u32 sts;
>   	int ret;
> @@ -291,9 +290,8 @@ static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lo
>   			amd_manager->instance);
>   		return ret;
>   	}
> -	resp = upper_resp;
> -	resp = (resp << 32) | lower_resp;
> -	return resp;
> +	*response = ((u64)upper_resp << 32) | lower_resp;
> +	return 0;
>   }
>   
>   static enum sdw_command_response
> @@ -309,19 +307,22 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
>   	scp_msg.buf = &msg->addr_page1;
>   	scp_msg.flags = SDW_MSG_FLAG_WRITE;
>   	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
> -	response_buf[0] = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
> +	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
> +		dev_err_ratelimited(amd_manager->dev,
> +				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
> +		return SDW_CMD_TIMEOUT;
> +	}
>   	scp_msg.addr = SDW_SCP_ADDRPAGE2;
>   	scp_msg.buf = &msg->addr_page2;
>   	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
> -	response_buf[1] = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
> +	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
> +		dev_err_ratelimited(amd_manager->dev,
> +				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
> +		return SDW_CMD_TIMEOUT;
> +	}
>   
>   	for (index = 0; index < 2; index++) {
> -		if (response_buf[index] == -ETIMEDOUT) {
> -			dev_err_ratelimited(amd_manager->dev,
> -					    "SCP_addrpage command timeout for Slave %d\n",
> -					    msg->dev_num);
> -			return SDW_CMD_TIMEOUT;
> -		} else if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
> +		if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
>   			if (response_buf[index] & AMD_SDW_MCP_RESP_NACK) {
>   				dev_err_ratelimited(amd_manager->dev,
>   						    "SCP_addrpage NACKed for Slave %d\n",
> @@ -366,11 +367,7 @@ static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *a
>   		if (msg->flags == SDW_MSG_FLAG_READ)
>   			msg->buf[offset] = FIELD_GET(AMD_SDW_MCP_RESP_RDATA, response);
>   	} else {
> -		if (response == -ETIMEDOUT) {
> -			dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
> -					    msg->dev_num);
> -			return SDW_CMD_TIMEOUT;
> -		} else if (response & AMD_SDW_MCP_RESP_NACK) {
> +		if (response & AMD_SDW_MCP_RESP_NACK) {
>   			dev_err_ratelimited(amd_manager->dev,
>   					    "command response NACK received for Slave %d\n",
>   					    msg->dev_num);
> @@ -390,7 +387,11 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
>   	u32 upper_data = 0, lower_data = 0;
>   
>   	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
> -	response = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
> +	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
> +		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
> +				    msg->dev_num);
> +		return SDW_CMD_TIMEOUT;
> +	}
>   	return amd_sdw_fill_msg_resp(amd_manager, msg, response, cmd_offset);
>   }
>   
> @@ -446,9 +447,14 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
>   	u64 response;
>   
>   	mutex_lock(&amd_manager->bus.msg_lock);

guard(mutex) might work better here so you don't need to cover every 
exit path with a mutex_unlock() manually.

> -	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
> -	mutex_unlock(&amd_manager->bus.msg_lock);
> +	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
> +		mutex_unlock(&amd_manager->bus.msg_lock);
> +		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
> +				    amd_manager->instance);
> +		return;
> +	}
>   	amd_sdw_process_ping_status(response, amd_manager);
> +	mutex_unlock(&amd_manager->bus.msg_lock);
>   }
>   
>   static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
> @@ -457,7 +463,11 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
>   	u64 response;
>   	u32 slave_stat;
>   
> -	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
> +	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
> +		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
> +				    amd_manager->instance);
> +		return 0;
> +	}
>   	/* slave status from ping response */
>   	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
>   	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;

