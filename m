Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B113A48CE;
	Fri, 28 Aug 2026 04:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892202; cv=fail; b=ptfQCdUHH7b5uHoASuvjjDgAOVL47vAuLM07GN6lB7ULGQn0COWNXCLHdceitnexRCxV2ojkTHDN5wFzB5mSW78GTJ1Dg/UzG3HazxtU/CCG3f7J42XkusHKLNiHWFFDIy2hypDbv3b/QgL+TA2eCID1587KRYBdf5dSO/jTW2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892202; c=relaxed/simple;
	bh=k6omCTgYjTnt8izcyKQ4j28UYoZUM69yuEPdB9D9TNs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j3I1dZvoXyR1o1ZRtKVOtyadJ2Am+0ezYgCjC0sWzCbdPO5AxlvIkFSTJnWtuwxPm6E5JmQxbB2sLTB4Ck4DG7Zk6XmR3jPBzbbUtxiYu+u0DNR4NOE1WT6wcRdDBwMj+86a5QdDoRkifbEaGKe5eRPM3MT4gTlCy0K9q4GOWUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IFy0Kf1w; arc=fail smtp.client-ip=52.101.53.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IFy0Kf1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IY7b6VyGEFcKRL/6SY7YPO9I9jT5xFSlIgz9U75dCBvTc/y2WF+Pzgakrgfy8HcqomQ4bVbZfRxsFhDgVPr9dA6VtiKAvpjzi2ickf2qBtD9lt2qUxQtWtMJHNSRIo6LDUJvp1nIWKnkybKYVR/V1ZULMfNzTgBjWDpiOdFM74qOYjMbjIlE0IvBKt4h6jdCpD3eqVRNGEyB3bOM/2WX8WXvZ64NoF8jgAmBkz6mUydjn0HkgAN1An+4nBbpPWKwPXfXjKaDPOajywUP40TUvCbavoG6hoKyMakL1/hK4DFVGUlHKFnHwoKfde045nz/mYlUq2NRlQd55Qa/wa2xyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YGqhjO5Ich7ZbvuwuzHNqmhPnkfk5j5B+J/sxgKQH0=;
 b=iVMkTLPukGyuQaLdGIl/qB2/pmMSJOu3qpG6pSltPdJ+xWs+eC4mlX8x199qTO3cpwZR0VDHDpK7fv5Bm0WPBgpRGUGegAH57HRsJbC5ExyjbJBNVK//5Wf/JqCc6p+y/vbH8WaioJHKz5lCV3VoKo/yZRZDm60EZz/QBVZOfDpoEyPbstIJPnSt4KZFtFc+xmwCut6g4gk093g7IJEvOYeCkXowqrN35YqGy3QCeSQmafQB2dXX/IdGsJDrRwXpJMaSVqqJIfXsLmOYywjZMeTngpMiNoUlmt+hGfCX736x0wAm9T7UFyYLlyTCXPPUUDhUEe3dWYBmgT6h10jYtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YGqhjO5Ich7ZbvuwuzHNqmhPnkfk5j5B+J/sxgKQH0=;
 b=IFy0Kf1w3h/RHLCsg8rrmyJgzNrl+RWA/6WzKD/4mOjRwW3gIhZbM6l5zqs8S0gfT5kE065REoTUPdyODQBEVH/FEXvPjR955fLMHUaQIF793B1nV3eMrOeGK7obwId5G+8yUcnyL02h+Ri5cAyi3j/9UvsM9+rvjCEzbJutDyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CH1PPF9C964DBFE.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 04:43:16 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0315.012; Fri, 28 Aug 2026
 04:43:16 +0000
Message-ID: <3c98d952-53ca-43f8-88c9-f5ebdbfbdbb9@amd.com>
Date: Thu, 27 Aug 2026 23:43:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
Content-Language: en-US
To: Juan Martinez <juan.martinez@amd.com>, westeri@kernel.org
Cc: andreas.noever@gmail.com, YehezkelShB@gmail.com,
 Basavaraj.Natikar@amd.com, Sanath.S@amd.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260825214237.4179813-1-juan.martinez@amd.com>
 <20260827215740.415496-1-juan.martinez@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260827215740.415496-1-juan.martinez@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0010.namprd12.prod.outlook.com
 (2603:10b6:806:6f::15) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CH1PPF9C964DBFE:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0810f9-0267-4567-2f40-08df04bedfea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YTBK8mxah59Scb/MWQqsJwJMin705U1ufJkvUo9ICRt4eFphCQVmbswHnNp5YlVonZQtzHXJrQTVuIiJQTnutQhNq+SNzqFBJwneBEimTzmUwY4k+fwAoicmEMan5EnjUYOghPEh2QbByZIWhI2AzTkSZGLQHUw+tCB23uBmw/pCC54o/njr9ZoHQaFTa8tmWT19NStrfR7Kj5MSHOlcsoqa449tK6ej3EzEPBcpm6Pyh8VnVu8mSKGOxcm6l1Hv/5+PtYpAskLX+PZZhNhCoyICkx5176Usi0Fthxs/HescHX76427lCWh7PQ5lHplV9VMjz1M7Cd34pN6yn/fI9npB3YJYlXQb8PmIoRQ9IO+MGxywnDMoqKk/SX92cZaCLY2EG+T/utQpE5H0ZsiQYVVqLGyDrPAq89rWipOD+8nmC9HIbY0PMLnAeqeH6y1vr+pHVE0nHi2E974qpHawv13LFXmF6tl3KyCcyZQfuWUYB3f2eFZW/oEpKgeJ4XsMGDgNrglrmCBhB6/X8nhP6I2qhk+MK1U/A0XpGQd3lTn7t+dr3qbgfyJC/h4K6L9FqUDTh84aCuLsBV+9swVqlA3oM1N3lqH5sQWqTBDif1vs9zl+xyk5IRrGOXcAvnNDerWshYNBQpHPV4zzJvOIMN1wApMqouR08DLKiJzYEOQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0lURHduczlwVXloVUZHVHhaMnFvU1N5VzNlQ01PSDVXdUE2SnVVaGtWZ3dE?=
 =?utf-8?B?bmVCWnhTRUYvcnRONWxSRGVPNHlOdHhWSngyZUQvSUtJVDNuNDc4Y1k5NDRC?=
 =?utf-8?B?amxBQWNxMDYwTWVSNzNKTlVhMEEwekJLRTZkMmYydS90R1lJcjZPQXUvd1o3?=
 =?utf-8?B?N0U0cWlKU2Y4MEtabzI3WWo2SmcrdnBjQzR5SHljQU1uZklQVVJ4Qzl6TVV5?=
 =?utf-8?B?UHZQamEzQlhSMS9MUXBDVnZnQVRxbVEvS3diVHV0WGoxUDBKV1R6YTBMZUwv?=
 =?utf-8?B?eUpkNU84RG1wY2k2ZHhRcVFyNjA4UzJRWjk2V3JLa2R5M2RuQlg1OEsvRitN?=
 =?utf-8?B?RWlLdVk5Y2ZSZnAwekwvZGc4U09Cc3crWUg1TWxFazdYRjcvQkNjTkExaU9B?=
 =?utf-8?B?NVZhbXptUWpVdkdMbDhUaDN2VXlXMXo4RjVIN2h4a2hXVGcyb0RiTGlYejhm?=
 =?utf-8?B?UlhZSk1ML002MThiM2ZMQVFUVVJEU1plVHB1VkpXVW1ObUFNOVZKV01JQ1NT?=
 =?utf-8?B?dlQ2a01ZQkhCOHY0SGtiOFM2dUpWenk2MXo1eUlCQi9MdmhoVm5VQ0FwRjEy?=
 =?utf-8?B?TCsxeWFRWUd6RFM1cER4ZitnOGNLTVNHQVd5V1hQdlBkbTJiOEFXYmM0b29L?=
 =?utf-8?B?UE5FWGEweGMxbmQzQndRSlZjTkJEemsrZ3dmK3p4VUtvZmluMFJ4NmJoeWNs?=
 =?utf-8?B?aFNLMHJLeGxtYk9PTldqZTNpVURqaVRjWC9LT3hDUWZtbytWVDR1SzdNaUpq?=
 =?utf-8?B?bDFDajN0NmJrQW1Yb0dValowT2MvSHBGODh1ZU1XTXdDZHlHSGtaRGlPcHhu?=
 =?utf-8?B?ZmpDQndlSnNyaXZiNllYV2xxclE3UTRDT3VJMXVxNUQrNklTRTZlek10OXpU?=
 =?utf-8?B?N1g1QlkxdzhyV3ZTNVBVQ2c3UWI3N1pCdS9aU2NVVGFPdXBwTzFaOGRxT05q?=
 =?utf-8?B?VW1BdVp4OEJuR1U4eWNPTFFJNkttMHNIZk8yTjVvSzRPbzVyM1dtd1hEb3B5?=
 =?utf-8?B?ZDlLUHhFQXk5dXN6VDd3RVcvcnZOKzRXM0FSYUpvZmZKWkdDTXRLWS9Qcy9D?=
 =?utf-8?B?MmpQOTJtT3l3azRmUFFiT2JGWXVWanVZVG9aQXhRSVFTRGZJZUJwMXM2bzhl?=
 =?utf-8?B?OFFuTnBBNFpkZzU3YUliWEZRQTQ3TW1oOVYvajZmYW91eFRiL2VadEVSVmU1?=
 =?utf-8?B?RzVrcklrN0YrcCt5RUkzYjRmb09MeTZqU3ZTNFNGMHJ1aG5BdVdhL3FHS0lW?=
 =?utf-8?B?RUNjOURsdDVPbkFDZTJRZEFJQnpsdUV2UjRWR29xQ1hwVDRKOG5vQmVmTFFY?=
 =?utf-8?B?aFJZTDBEQmhKdjdTdUcrY2xNVUUxdDlEWGNvUWQ5eko0NGdyNjV4UUJtWWZJ?=
 =?utf-8?B?eTdIV3BNM2F6K2pjeS9vdjIrb2s4d2ppTXhuVkdKOUpIT1dKelZWYVZ3VXZu?=
 =?utf-8?B?QnBYd2EzT3plRTdEc0F0Q0Y0THJhekVEMVhwVC9DVjU0VnNVM3RFRGc3cEhq?=
 =?utf-8?B?YjRXZCtGbEN1Qm1TbG1OSlFvUU1WVlZRV0hCcXRpeHYyNFlIRXYwa3JGOWRq?=
 =?utf-8?B?OVJ2RXB4clRzM3JzSDRIR0s1ZWxCYWVNc1ZFbjlpcStLdDdLUE5xc21BZVND?=
 =?utf-8?B?cEtEb0twY1BkWXJMRG9kUEthK2hvRStkWWE5ZkVQWjJVM2RGbmw2OVBmU1l3?=
 =?utf-8?B?bVBBSEhOdTZYbFBYMHFNZXNNZjdNQnk5TEZBT0hVREdVQTZYdGwyeVBIbTVw?=
 =?utf-8?B?ZEVRL0NWSWhnM3o4MVdsek9GY1BHMExlbGlEazYvb0lwa0hJUE5VU0FmY1g4?=
 =?utf-8?B?UnJhbUdsdVlDU3A0K1p1b2R5RnRXMTQwbXRJbksrZk5LL01LNWdKSFlQZ1Zu?=
 =?utf-8?B?WFhwanRSZ2sweVY5YmNSaldEc2kxRWhYYk1Zc1ZTZWhjYkRhOFpMM1diS2lT?=
 =?utf-8?B?a3h5RFFsTlNpM0drdlNkMlFHYUJKQXE2S3lhTUp3aDVPM1dxWWRPUGk1Z3Uv?=
 =?utf-8?B?anlhVXZSU3ZTaDRFMHV0T3J1eFN2UG53TE50VFg0SEdUSkFVVUowUXNuWEJy?=
 =?utf-8?B?ZW5XWEtrRWhtWnYxeHVwdEF1NkNlMlRoSEN4RUIxTHdrN0dKNFNRekg5c3ov?=
 =?utf-8?B?Q2Rsdk5IUlYrSGg5S2M0VkV6T2xtTGtpWmtyUmtpUFJoQ1hrSGh4UXZwQ3dY?=
 =?utf-8?B?M2V0Z0JGOFU5cVpDRG0vRHFiMzJreW82ckJ4S0NYWHRLN0NlVlFQZlVXVURF?=
 =?utf-8?B?TTZyNFVkbkFLUXNrczdlVVRzMEZhZEtUWVJ0cWJ5bU9TY0hVbm52ZHZLa0lS?=
 =?utf-8?Q?yFxpdN29RvwOvjWBUZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0810f9-0267-4567-2f40-08df04bedfea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 04:43:15.8856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmvOOq+tvAthFQuEnmHfbwNp1eKF4a8W7DkP9Cz0ZhVqLCN07dCcpDc8qmjrjrAXTEqVIUAdrF3i+OnFa+OVBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF9C964DBFE



On 8/27/26 16:57, Juan Martinez wrote:
> Commit f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on
> DMA path teardown for AMD USB4 routers") introduced a deadlock when
> physically unplugging a Thunderbolt cable on AMD systems.
> 
> The problem occurs because tb_handle_hotplug() holds tb->lock while
> processing the unplug event. When it removes the XDomain services,
> tbnet_remove() calls tb_xdomain_disable_paths() which eventually calls
> tb_domain_reset_interface(). That function tries to acquire tb->lock
> via guard(mutex), but the hotplug worker already holds it, causing a
> self-deadlock.
> 
> The deadlock manifests as a complete network hang because
> tb_handle_hotplug() holds RTNL while waiting on its own mutex, blocking
> all network operations system-wide.
> 
> The existing code already handles this scenario partially: when
> xd->is_unplugged is true, tb_disconnect_xdomain_paths() intentionally
> skips the DMA teardown because the hotplug handler will do it later
> via __tb_disconnect_xdomain_paths(). However, the reset was still
> being called unconditionally.
> 
> Fix this by:
> 1. Splitting tb_domain_reset_interface() into a locked inner function
>     __tb_domain_reset_interface_locked() and a locking wrapper
> 2. Skipping the reset in tb_domain_disconnect_xdomain_paths() when
>     xd->is_unplugged is true (matching the existing teardown skip logic)
> 3. Calling __tb_domain_reset_interface_locked() from tb_handle_hotplug()
>     after __tb_disconnect_xdomain_paths() where the actual DMA teardown
>     happens and tb->lock is already held
> 
> This preserves the reset behavior for normal shutdown paths while
> avoiding the deadlock during physical cable unplug.
> 
> Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
> Signed-off-by: Juan Martinez <juan.martinez@amd.com>
> ---
>   drivers/thunderbolt/domain.c | 26 +++++++++++++++++++++-----
>   drivers/thunderbolt/tb.c     |  1 +
>   drivers/thunderbolt/tb.h     |  1 +
>   3 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 12c88509a54f..8f33baafe9ae 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -788,14 +788,19 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   			transmit_ring, receive_path, receive_ring);
>   }
>   
> -static void tb_domain_reset_interface(struct tb *tb)
> +/*
> + * __tb_domain_reset_interface_locked - Reset host interface (lock held)
> + *
> + * Caller must hold tb->lock. Used by hotplug path where lock is already held.
> + */
> +void __tb_domain_reset_interface_locked(struct tb *tb)
>   {
>   	struct tb_nhi *nhi = tb->nhi;
>   
> -	if (!nhi->ops->reset_interface)
> -		return;
> +	lockdep_assert_held(&tb->lock);
>   
> -	guard(mutex)(&tb->lock);
> +	if (!nhi->ops->reset_interface || !(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
> +		return;
>   
>   	/* The reset clears the ring state so stop the control channel */
>   	tb_ctl_stop(tb->ctl);
> @@ -803,6 +808,17 @@ static void tb_domain_reset_interface(struct tb *tb)
>   	tb_ctl_start(tb->ctl);
>   }
>   
> +static void tb_domain_reset_interface(struct tb *tb)
> +{
> +	struct tb_nhi *nhi = tb->nhi;
> +
> +	if (!nhi->ops->reset_interface)
> +		return;

Why is this check here?  You already have the same check in 
__tb_domain_reset_interface_locked().

> +
> +	guard(mutex)(&tb->lock);
> +	__tb_domain_reset_interface_locked(tb);
> +}
> +
>   /**
>    * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
>    * @tb: Domain disabling the DMA paths
> @@ -835,7 +851,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   	if (ret)
>   		return ret;
>   
> -	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
> +	if (!xd->is_unplugged)
>   		tb_domain_reset_interface(tb);
>   
>   	return 0;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index b7cc6894a598..89dfb3381345 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2489,6 +2489,7 @@ static void tb_handle_hotplug(struct work_struct *work)
>   			tb_xdomain_remove(xd);
>   			port->xdomain = NULL;
>   			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
> +			__tb_domain_reset_interface_locked(tb);
>   			tb_xdomain_put(xd);
>   			tb_port_unconfigure_xdomain(port);
>   		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 4373336d9425..2e6e0920cb1f 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -789,6 +789,7 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb);
>   int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   				    int transmit_path, int transmit_ring,
>   				    int receive_path, int receive_ring);
> +void __tb_domain_reset_interface_locked(struct tb *tb);
>   int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   				       int transmit_path, int transmit_ring,
>   				       int receive_path, int receive_ring);

