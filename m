Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013033.outbound.protection.outlook.com [40.107.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299A34E2F22
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891268; cv=fail; b=EqTO4gr5l9NF2ZfdtlxuT3cnHYEjfsrrw0Ivsr9VZWIqJb75bde/saBTCFqQG61YLHF9ujQ8toFYVZcRqR9+MP2zNiGwTHJyckpnTWjhxAx/Yyd4NxToP1qSRLNo7tHDakamQqKgtMpqcFokj18VxekRMD1ES3HuG6lfrtCV3WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891268; c=relaxed/simple;
	bh=8b/L4jwPq4ys+7wrsoB2dpWN7ZOxsfXBUgVYeRA+FCo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZjuflLTp6tvaZ3MjONVO27XzdifGIT3SV8gV9W5ycfwKYutwpxs+p3x+vJdfa8YKpr/sAdQ6lJAZHjPU0YVVTtw2MAQgIWIVn9egNAH8gDq3wluLcvHrnRk8lz0kjtGHMWimCSKA6yC+LVwW9NWD+qlzveEpHp+hHsXl7rRYm0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=COlcyaXh; arc=fail smtp.client-ip=40.107.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="COlcyaXh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htChK4EWPQkVXCrpEmdtGkfEKqnc8ftk9cJHSL4CztG0bXacsVgXONwfN+lnaT2MDpEczDWAz5W6jDfFdspmF6Ssn+yqyj51JZYeAURHgDSlqRc+JRRexK6QUHpgWPxRYjRtqtXcFEYeLl8KlkufJdp2HpoDarlzXM9sPNDVZ0nWYnGKmSkI/I1qaFxfMfBRqYYcioAxeys7DL9XwLRxNsIrag4aeXE3cpu5/RPB1feW6doVSbXcJCdxJXVhAafLZVxJ6CAHW4mIlb2I2wRX3tYj6iKVkm2sIh77DLKypTs98xnBaCXATAuMsV1vtGwN7+CXr+pY1WemmlOCcKVq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSaR4EfQ2RKPTmsEMq+rue4eZMhrGbcKp9/l9a4Weg8=;
 b=fQwAR1xPHXONR8lPUbcWNADlIBT3d33wXJmcIKWntkCgfQhk+GfBn5k25vQEWMfI8bg4Isi7pzMa8VSQYJdPAafYd5Nki5lGGdirqlo+CpJlJ8JrJkfoHOuL0f4fRQnu6kNrQcHerFYP0v0O6FY95i5G5gw++nqO6XuOXOrLblZYdJh23OOAC3KfMGVXpmTk88/feW93jl9ps7OPulzC5Dp3uMaXEnuetCKqUsGi60XRc+58w5xDIKDL8WG7N5agP/K4FP+q64zQS8FIodN4cZSLGO6xeCcyY82EYrj7gmN6t21PjiEO1O0A+9ybdiP8mOudhtuYLBaxGNIEU/nEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSaR4EfQ2RKPTmsEMq+rue4eZMhrGbcKp9/l9a4Weg8=;
 b=COlcyaXhBhieHNaz1Ef6wVqhuLlAkqHI6mHQUC/osB4f42SLXWnqova5uW/7olG/kOnwJmY92JiQLcQsg2XsZrk195bf1hd8Q65hC4sh6wZhDx8R3zTDkPUxZSktW9ddHLOiKfGbb294xlCwDVFdLW4DyEg1ZxwWorYI/RL9Hc8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DS5PPFFF21E27DC.namprd12.prod.outlook.com (2603:10b6:f:fc00::66b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 11:34:16 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 11:34:15 +0000
Message-ID: <cdf3f87d-0575-436a-9bdd-5fc3053f21c1@amd.com>
Date: Tue, 13 Oct 2026 17:04:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: xilinx: Request pre-allocated peripheral nodes
 after bulk release
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com
Cc: linux-arm-kernel@lists.infradead.org, git@amd.com,
 linux-kernel@vger.kernel.org
References: <20260923100343.3147243-1-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260923100343.3147243-1-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:266::15) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DS5PPFFF21E27DC:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a189362-b392-4f36-958d-08df291de96e
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IPELfsItFleR5NhtrJiSCU1RSj8MQnWM4OPura0sa/GvxRwy2WMONBx5BiTbjxju1lSXwF41L2GZs8SrmmijMDTIRqBARaekyPemmphJnZrezIlLo0Kv1mMYp4SxKwpMjItBJ8fVnpEGSpy+1QyQEzb9iY1orw6ujVir596/Vd9FOBc2KDZDZ2i+pL7970A+iAPU8GIjx1MosGK6COrlBR3kwZ78WTwQBd7X5l5Jl5BhtjHbdqWKU9D++1qkX/h/gUV5zg1JVEzCUWeoBum3gc3o9j/r+0/VcTfd+/vXj2RTc8VK+46+RQy9KmeauJoD+RGLJ3SKKsNQdad4vK8QknK6mMFbkgHyXOxrG/AQXmcI35I6PxDROTKh2rnxExoCH62lTlTdNmaQRMI1j2L5pq+c+txeeAQXA444a9Z6IIfbAizEoBB9+E40acApn/aFi8k0LJ0lCNab9GamhzFZYZBCXNNcDOKSFYqglxK0DBBAhBT17BLYpDgJ4l+veleA9bIUTUC9SrohYKFJYlLTQgmHc5eo/7TqEn7+gKy2ddYsP9PpWqo/zEMBGQ6x1lSYiX5fDacb+g3xGPoFK2vagBU3qr5Jyo/i9gLRvKsulQ2OT+ChaFBTDm+c5r5guPGUANfzDgeesEW9XwSVhn5HNlrvcAkzd3t6IzDMDzIzrR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHBlS0dkMlBHTU8vUzh5cEx1NlVWWm5jU3djcjhXSXpGeFRhMUQ5dWlyK1RL?=
 =?utf-8?B?cjRiaDFTblVmR0pLbXlkb1AwejVYa2tPMUFqOTkxaG90U2Jvem0rTy9La05s?=
 =?utf-8?B?SUllNURPR0orSmJVaXMyVmZqMEVBck9xbmtBcVVsa1dUUzQ3VlZ0U2MxVzBH?=
 =?utf-8?B?REJObjRiNDhRbHhVVWN6WkVvQ2lwTWFQanBYa0h4YndDVmtQNUhKKzM3Y01a?=
 =?utf-8?B?QW12WUpXT25vTzZ0eWYwZW9NNGg2N1JBK2V5dGVNekNhSytPeWRaMG1pWnVt?=
 =?utf-8?B?MWRrZmlPSEdYWnFtL0FHYllXekxCN1lORTYzMVd1N3oreGlRYVgvYTN5VEh2?=
 =?utf-8?B?ZzhVSVhISVI1R2JxS285VjJtYWlWWEwyWTBrUys5RGtBSmtBSmlBaXh2cEt2?=
 =?utf-8?B?bG15ekZValNZZUEzYWpGYzNoV1gyOXRSOFpvQzg5VGFtMVM3Q1JlMzI5Rmoz?=
 =?utf-8?B?cHFHWVliNzdDZ3ljUkFndmtOaGNmbHpWTGdpdWxOYlBjQUxmWkZaL1BtS01w?=
 =?utf-8?B?M3pZSGdOVi9wNTN0OUFIRVcwUXVTNklIK01EYTF2N0FUWUFrdjdpdzJsUjl3?=
 =?utf-8?B?VU1PUGJld2p5NXRZM3ZuSWlobnZxczYwd2g2TXRvK3JTV1Q4dk12ZXg3V3g4?=
 =?utf-8?B?K29QTy9LaVJpZ3ZxcyttM1hIK0J3U053SEs4OHBPV3REYnlYUDNaZmJYeFgz?=
 =?utf-8?B?bnpaMkw0QU9SMFljM20yZVg3S2pYUVh2SW1rQXZFQ2ZTZFlldXI5RVRacmxr?=
 =?utf-8?B?SitudGxLeklsZkFEUEdua3ovWnJzb1lxRnZiNDludU5oaTJHZnVwdW9BTFFX?=
 =?utf-8?B?d092QW5MSk5iNTdzNXdic0RLUjNLTi9XbkFFSUVaU1RudmZXTGZkeWF2K0R5?=
 =?utf-8?B?cXJoWGUvc3ZySFVZeVRCU1RCWUFadDMzN2VWemh6UXRYTzhQajFLRkwxTEpu?=
 =?utf-8?B?L0RobUR0VE1YMDgwdVNmTk80cUdiVFRranRJaUtlU3l0RHo4TVRSRVVvcG9G?=
 =?utf-8?B?Y29YZ2k5MG1FMXE2TXM2T1F4V2JHd2ZhZmgreDQ2SHBaZzZNM3VTOFVOWHcx?=
 =?utf-8?B?WlBDNWxNcVlMa3EwWTQrR0dqTHpsNElHNWg0TW1hcldZQjVTOFR1NmtYdnM0?=
 =?utf-8?B?SWFqNnMyWE9yQWhBRktEZ1JKYjVkRDJPNXViK05pclA3encxbnVGaElMdmpV?=
 =?utf-8?B?U2xEaTk1U3RsaWQzSSt0eUp1Q1phVitZUE5IRVNsQ2p6RzB3T0JiTDdZYjA5?=
 =?utf-8?B?SXhsKy9UWGhETHErc29sc2YzZms3eEExNXRQMG5GcWZSRmN2YTRUZnBxSS9Q?=
 =?utf-8?B?Z2EzWHU1c0cxRlN0Qm9uNlJ6b0xhVFpnU05Mc1hJTkViOXJOM3dSQnJpM3hH?=
 =?utf-8?B?aXlFdDRSRUMxMm1BWWgxbWYrdDY4MmloRUYvUzVLeVUwbWgrNnNtSUE4UHN1?=
 =?utf-8?B?TWNORisvTXpoOERpTTJLUnpsOG1qbHQvc1FDc3gzMkE4bEt5bGFicTNEaEI4?=
 =?utf-8?B?UVZ4TnVvd2hnNUsvWTdsY2swa1Rnc2MyVmtaa0ltSjBPVXJPd2pKL1ZRdzI0?=
 =?utf-8?B?RVZGTzdIMmx6YVhkWmlabWdDN1ZvYzcrOUVKTmF5cExjLzh2N0xnelczRTI4?=
 =?utf-8?B?VWZDZzdNMTc1RmRuNE80Q281QzZLa1JRVGNnbVd1Y0ovMmxxb2hjeE5CTUF6?=
 =?utf-8?B?VWViZEo2ZldpUklzUjJsWFNNbExTNk9oV0hlMGVPRlVabnFvOEhOK0RGbisv?=
 =?utf-8?B?Y3p6UEVNTzdxUy9uM0hEdHVyU29nRjd6K21hS0YyV3lEcVlMOEM5RmIrUWdv?=
 =?utf-8?B?WEJXNERqSHpkT2h6b2dwY1ZKOGdjVXN2ODZWeWplZFZHMExyZ0MwKzkwT0RQ?=
 =?utf-8?B?TnNKU0tIZTZ3bkpJdk9PejVTeERxbEtmRkZaSXBpYkZ5TmdZVkJGaGxkcnBY?=
 =?utf-8?B?eFNPenBneDUxVEFpM2ZoRmx6U3pjWWdpdzhoR25pemFZVjliNzJPTHBQV0ZG?=
 =?utf-8?B?TVFLVWJVRzgwQzgvb1FCRThlYUd4Y2wzR0JGeFJxbkNNR2FrSytmcGZhZVFL?=
 =?utf-8?B?ZjlnUFk2YlN6WWhhOTQ3amRTclFuOThvdUtldk14MVBseWI0R2hwVDY5YVNS?=
 =?utf-8?B?c1pqT0dhQ2hDaE1nL3hMUTMrMzdiaTY5VFJnak5IMzZkWE1OYThBc0tTY2Vo?=
 =?utf-8?B?NHhEelA2UzJ4ZXRlZ2YyUGFNS0ZwU0FBYWxNMS9uTHFseXlIV1RFYmd3MHdN?=
 =?utf-8?B?d2JEWThrSFE3cGljL0pyVzNVWndVeWNobXp0Y2FBMGlUZy9vQWpwbWZGTGE3?=
 =?utf-8?Q?EsB2+k6aMbreMc4xNv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a189362-b392-4f36-958d-08df291de96e
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 11:34:15.8262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2q6k8Zh91wrp2IUc6affZxKbun+QnAI+jNAmh3vKKpfeMZoMTzUheRiTV1TwFhYO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFFF21E27DC

On 9/23/2026 3:33 PM, Jay Buddhabhatti wrote:
> During a kexec restart, zynqmp_clear_pm_state() releases all peripheral
> devices via PM_DEV_ALL_PERIPH. Pre-allocated nodes are then left released,
> so Linux no longer owns them and later peripheral access can fail.
> 
> Immediately re-request those nodes with zynqmp_pm_request_node(
> PM_DEV_ALL_PERIPH, ...) so Linux retains ownership. On a graceful kexec
> this runs from zynqmp_firmware_shutdown(). On a crash kernel restart it
> runs from zynqmp_firmware_probe() in the reloaded kernel.
> 
> The bulk request depends on firmware support for PM_DEV_ALL_PERIPH
> (PM_REQUEST_NODE feature check version >= PM_API_VERSION_3). On firmware
> that does not implement it, the request is skipped and a warning is
> logged. Errors are already logged inside zynqmp_clear_pm_state() and
> zynqmp_firmware_probe() does not abort if the request fails.
> 
> Also, drop the redundant ret = 0 assignments whose value is overwritten
> by the next do_feature_check_call()
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/firmware/xilinx/zynqmp.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fe650747ac91..96dbb23eb673 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -2193,7 +2193,6 @@ static int zynqmp_clear_pm_state(struct device *dev)
>   					"Failed to clear EL3 PM subsystem state: %d\n", ret);
>   		} else {
>   			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported by EL3 firmware: %d\n", ret);
> -			ret = 0;
>   		}
>   
>   		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
> @@ -2206,7 +2205,19 @@ static int zynqmp_clear_pm_state(struct device *dev)
>   		} else {
>   			dev_warn(dev,
>   				 "Bulk device release is not supported by firmware: %d\n", ret);
> -			ret = 0;
> +		}
> +
> +		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
> +		ret = do_feature_check_call(PM_REQUEST_NODE);
> +		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
> +			/* Attempt to request all nodes via firmware */
> +			ret = zynqmp_pm_request_node(PM_DEV_ALL_PERIPH, 0, 0, 0);
> +			if (ret)
> +				dev_err(dev, "Failed to request all peripheral devices: %d\n", ret);
> +		} else {
> +			dev_warn(dev,
> +				 "Firmware doesn't support request all peripheral devices at once: %d\n",
> +				 ret);
>   		}
>   
>   		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */

