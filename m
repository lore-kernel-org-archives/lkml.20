Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792423944;
	b=R1gtCLbMqmLZbCTeqgQ6stAAgGXvydRj4m+ALMn5SA5DJDBIOvfrZOW6198t0m403v5R
	 Qk27arsvPmF594x2xDy3gTjUXveWcVaQi18wGznKc0hDQ1fj8p4C2dj6XJnllkXzL1PFt
	 COM/Yu/wTytCoUSdFa8EzJOPr9Na+pErtYG27GMZTe9NGnqN3RjI71X0tQr8RuhIhA2rV
	 IiOIhPzSOZE6dC5m12KuGFluVbVfbq+ghgK/8bObnbeGfcA0I1XYWz/6u4Do+8AxeIJDF
	 zvLZjgAviUbiYN7ohKrvfhr1aF78AxL2ZWWWhKEhupOM92Q+BRJBUb1yttZ0cqbWECQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423944;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jde15ou7R0k8LrJfCU+fm+pTujf3oBTXmQNQKKrVi6w=;
	b=g2Gz8Pod54zWOc2Dv42hucQBxbK55w69Bb3gcuQR0Ii2ULz5grapdesuIXYZvY6Fxtzx
	 +MLeA79hBbUcSNpbuveqJodMe0Tx/PMiPGrGkobdilQ5BFUHLbWIKnzbiMe+O+1uMS0om
	 M4rZjdCijXHqedZ47y4UcsTHfl6i4T4lOT3n2JNPHVU8Ad8xWmvlP5DiY971CGkrPbNQu
	 dc2q/jdgtWhMwHU1cbsVbDvfZnwclLdtELA9CxcRFEXsybeH1T5lbBrgwCBWu16VOsRFZ
	 /5y+9vzFZRaKODio2CosbcK2arD1Uro4e2bKgvHnaju4z41DcX7NNaoAogHZEDIZEFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GX3xUvj7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.16
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011016.outbound.protection.outlook.com [52.101.52.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7F60705EC;
	Mon, 19 Oct 2026 15:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F7F60705EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GX3xUvj7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ot0/WkA+Eh2+DkXUHu3dN6kHNf867YHpCtrsgWSS8gjLF44TqHcnrErfPrx4H+ESw2XynyD5ijH+fuoDwdiAqtKZoTxxSS8oDTWdTWmmJ4j7B0uucnAIURwUd55UnDq55abEAM6pEjdJ+mPb17/rahcrhC+P/LUj/fjaXm53YUJ6Hb2+bcRrJXdvS8NYr6Lqma/AvS68x6rl54IpfhCsx07csE+WAq87I1wb4sKa77G/ddsr4pKsZfG0ytL3seu2LqR6gsHHgKjFy2RTwHLAX6aT6DmZmp+jntsY3f2x/utp6jAH1w4BFzbQcOO6yd6/8Uhn0alk7aikrxWSgC8pUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jde15ou7R0k8LrJfCU+fm+pTujf3oBTXmQNQKKrVi6w=;
 b=sJiqDn3nH5YdEtzUgMm10z+Rldmz3Jvjv4T6oYExHNaqJ3O9rSmjI+m+8ZrOXlWx6sZ+4a0o831qeDhtEO5Ye3l1/qhJbgrxf9Ycm2P4Lq5PdO+baGIGmb9UApItIuxu2LLH7gRdlUA8XPQsvYmNLpxwd2+nJGmIyXyvCetuCUD+BzMU52AWbkWlBS6zD61LaK+5HAyp+RBmjs+9Um7ymR5v00NooKADJFJ5N86WvJM/fFeu7LmlA99SblE1Nn5Dd34KOsv8I4pncJJTVU59TlRHAiAP0yXRImbLUqkX31K8PPhwCX0n3dvLZEWi/UVF56J/n4eW9FNQVMaLQ0VXmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jde15ou7R0k8LrJfCU+fm+pTujf3oBTXmQNQKKrVi6w=;
 b=GX3xUvj72f/Qz2Hn3NFsUZ4+2ZHI9590lYBVvWAFyZ8rUNEPLe9wICA8gawffuOiY1u0/HJJAVIlvOhOAaQTsLnb6jS2XKzIq08/VRa/EzBYsI9n5eHXedgmW2w1rv+XZPYjSAfYJiXmfAbS19ESCAUms8tJkhPVUUFyufcucYE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SN7PR12MB7156.namprd12.prod.outlook.com (2603:10b6:806:2a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Mon, 19 Oct
 2026 15:32:17 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 15:32:17 +0000
Date: Mon, 19 Oct 2026 11:32:07 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Adrian Schlegel <me@adrianschlegel.com>
Cc: tony.luck@intel.com, bp@alien8.de, x86@kernel.org,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as
 memory errors
Message-ID: <20261019153207.GA144824@yaz-khff2.amd.com>
References: <20261003222012.19685-1-me@adrianschlegel.com>
 <20261012193305.38931-1-me@adrianschlegel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012193305.38931-1-me@adrianschlegel.com>
X-ClientProxiedBy: SA1P222CA0168.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::14) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SN7PR12MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d5b57f-a186-4ce0-9551-08df2df62853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|10067099003|11063799006|260925022911599003|260925021911599003|261009223027099003|4143699003|260925021311599003|56012099006;
X-Microsoft-Antispam-Message-Info:
	S5qI8+AyqSqyP/n2zv3m5r5PcJz58owgwa4hVQv/Y+w1FeWRkG5kDMa2VT7BeG903kmh1ADPx2oGdOIbyF1hZ5Djp8mWs7hyTVurXjL+nT09i5lpmyUjtTMxS37wi5JsZZLJBVzJCbXpZ+H7iC1eun13FWibpljWEava6nMu7OaIj/daZ969DN3SnmRuq+SIHk/lcgXX8nH3VHg7w+ALCFMHAO/cAh9MbgNCU68CZ/2NTRY5wMWsCr2idyQ/Ez39gtapRl4/qIKAolVBujsHiB2arnkeg/7P1DQSpCGuoZeVRoBtnNJDx4fJs2Y5btra1S1bSh5Oc97sactYQR5QhY4xHM2vi1jkY4u4o30oabsZ6dwXgQk9BDAeaClOoGn98uH0bVGXp7ZjjrcK7DmN8di4cmXAAhzfhT4Jh5p1y5JH+QWmNMFMA/Lk9Xwpd6ZvntDwK3d4UIXdrklNKcR4NpKIHp48pwG2X/12g1oLtSQdSol3O3ZH8thHvT09VAhzyLXRyRLnBEfBTb0zOXZUpr6GeHyeIFWbxNrcNMFe/Bm7/fRtnuGu4iyjHn5kVw3jYbvhLNYtduPk80PHyVlZnBpYStQ+IwAYl9lv36TfwyI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(260925022911599003)(260925021911599003)(261009223027099003)(4143699003)(260925021311599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Gw/nseeeZM/vD9kAZNZ5zVE0MqACGwN/OHJSqOqevlKjaIZwo9NSh1o9+VN?=
 =?us-ascii?Q?cEyONTY56fGeeUvBc4ewUDNCJTJCbnptPhrp0ffgl8q06+tnT9WnO53iAg8k?=
 =?us-ascii?Q?OerLcWIHuTKnJpt0b5CyUrTmLVBP+flEp6JVhFX7AnFWkays9V1XC65U6Ia8?=
 =?us-ascii?Q?IXpUOm+Gr40YeW74BStFGh8s3eyZdbqk9ZhMcRenKDJtFjXR5w3zllxon9H0?=
 =?us-ascii?Q?eE770oJaSauRxFIbqH6lrG5XbJ/3xDuvBUXXN10HAriAVpXM9ynTjrPuFSx7?=
 =?us-ascii?Q?tpjnhVhFJTk44mLgI2d3xK1iYBSPDwU+ugsmqZMisAoIAOPZz5f6NheHME54?=
 =?us-ascii?Q?tAFQBkEW5LDidCQAMjjP3IVRSZ7GKELaafYY8fLICm6BJDzKtOLIbK/Xq2CB?=
 =?us-ascii?Q?Mci9eL0+1FCWixClVqu5g6EhExy5il8BepgEufJuE+Db4OGraM705IVuJbt6?=
 =?us-ascii?Q?xGsHw1VlgSxVtfLwnr3wixmbQJt2oJDaclHrUOadBGPhDx3aT+WyQmWqblbf?=
 =?us-ascii?Q?5I4d5b6LWnJYsAOEmnPNZz+Y9FFL7xWhdmKYZluRC1hooOPNPKtCEAHAKx6W?=
 =?us-ascii?Q?tTodsWhDtkISmFWNTJB0aGMipSP4dHihpKE01Ev3g4QnlXNZvu1NbfDPl4Zp?=
 =?us-ascii?Q?zFexy32r2oCnqf+DIt19Kk9vv7MQm8AcGUcCnNAuE3X+Qy2vuWurQt/nDNXq?=
 =?us-ascii?Q?/wwYhmeVjN+dfMufILvxpeTemh2+6Xj6ZDtcjn8kEZXKRNyZE/7fDVqscqgO?=
 =?us-ascii?Q?jpBBILwBzXbNE2ZOCd8LiEIHHtfZd56X0DRO8PA3p96f0Ztx2SLbE5lSlEnH?=
 =?us-ascii?Q?SFYLfbftEmUZBMMy2V+CLQpqX7lFKmI0TKFttl3Z2wqtQI9a3yxu1VNKWNAe?=
 =?us-ascii?Q?0eNeRTvbBaWi5Cza29O8HKxFhJFDdu58TIEO5nxebIjLXWHKWqrDEQx28s/F?=
 =?us-ascii?Q?iM8mkjZXUZcbgD44sH8VatmRKL03dG7QunAVvizJikqSMutIPUDTvaachBrT?=
 =?us-ascii?Q?+DSUOIUzbO+lgZTi0I4CXw0uHRH5q2Yzf5QjmbhLZHqCs6DNINoDlwhDlO2j?=
 =?us-ascii?Q?Y8fb7SBtL/mMRD2U51ljOxct5zkng+5I43IiRXE6ATKrM5vUON1Ch8ayGy+I?=
 =?us-ascii?Q?cq6aN6LWXCOXy4/qD8vnL0Ny2UVrWgBWLt+CdsV9sx0Z4zTfUc7E/wrlEZDI?=
 =?us-ascii?Q?AkpybUdlxL0wXYdMdQg+DXvJiqDg6zdDbTC/GK2VBSHsRKFYuJCg3DPpVPrg?=
 =?us-ascii?Q?8tS+pwbTzoGdoY05VBNVYJ+q01N9oJ6JX07E3K1l6xUTdvlhbD6bY6vNC3ZU?=
 =?us-ascii?Q?XvzNKXAFfhSWZkz7fTyhZEV2yjmjHHmAqTEFCR4qAuRZOPlB9yXWvmgvyMgs?=
 =?us-ascii?Q?H8ee227tFai66WTXtQUtsmWwPwksiF06ke/ykpBVZZYSAbk52BP70azN9/FX?=
 =?us-ascii?Q?OOGn1lx4ByXfgikjlKpICTC75n7Os5KvUG08NC13YtEtB+5nuL2/EbviTCpv?=
 =?us-ascii?Q?QWW/qi82c3VBi2kPVU1qwWjSGBMyL+ohEdY0fWQNrjxbZSeC9wbWBqX3zHbv?=
 =?us-ascii?Q?trRrFTWVMkSBf7o0t8h7xmimeFbogLCevR6m5nb4eF5hRlvipmfRphoBoZ5E?=
 =?us-ascii?Q?sBz0k8TffCkY8tLnPXofzjCThZTbpDyEn/qGf2PIvtKB2Gk4TA2vTnLEptlf?=
 =?us-ascii?Q?i+9L4qIaXCFdRJ13nPDvZRHOdaXbK6g1gA9nFBxE/Zac5fRQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d5b57f-a186-4ce0-9551-08df2df62853
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 15:32:17.3932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDWwhjg35QIt8Pj/ff9kz5lFB88fp3mSSVVzstqQCsE4TF3q1GhaQq5g1QoRnnP1oiqYgtoS6VRcZ2ro62eq0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7156

On Mon, Oct 12, 2026 at 09:33:05PM +0200, Adrian Schlegel wrote:
> On Intel and Zhaoxin, mce_is_memory_error() also returns true for cache
> hierarchy errors. All callers expect it to report memory errors only.
> 
> The CEC uses it to count corrected DRAM errors. A corrected cache error
> only names the cache line that was affected, not a faulty DRAM page.
> With a faulty CPU core, the CEC therefore soft-offlines healthy pages.
> On an i9-9900K this caused about 500 soft-offline attempts per hour.
> 
> Report only memory controller errors on Intel and Zhaoxin, as is
> already done for AMD.
> 
> Fixes: fa92c5869426 ("x86, mce: Support memory error recovery for both UCNA and Deferred error in machine_check_poll")
> Signed-off-by: Adrian Schlegel <me@adrianschlegel.com>
> ---
> v3:
> - Shorten and wrap commit message (Boris, Tony)
> - Refer to the SDM section by name instead of number (Tony)
> 
> v2:
> - Fix mce_is_memory_error() itself instead of adding a CEC-local helper (Tony)
> - v1: https://lore.kernel.org/r/20260927151904.30524-1-me@adrianschlegel.com
> 
> Tested with mce-inject (sw) in a VM with an Intel CPU model. A corrected
> cache error (status 0xcc5ffc0000100179) is no longer counted and its
> page stays online. A corrected memory controller error (status
> 0x8c0000000000009f) is still counted and its page soft-offlined.
> 
>  arch/x86/kernel/cpu/mce/core.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index ab469605f..54ed053fa 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -540,21 +540,13 @@ bool mce_is_memory_error(struct mce *m)
>  	case X86_VENDOR_INTEL:
>  	case X86_VENDOR_ZHAOXIN:
>  		/*
> -		 * Intel SDM Volume 3B - 15.9.2 Compound Error Codes
> +		 * Intel SDM Volume 3B "Compound Error Codes".
>  		 *
> -		 * Bit 7 of the MCACOD field of IA32_MCi_STATUS is used for
> -		 * indicating a memory error. Bit 8 is used for indicating a
> -		 * cache hierarchy error. The combination of bit 2 and bit 3
> -		 * is used for indicating a `generic' cache hierarchy error
> -		 * But we can't just blindly check the above bits, because if
> -		 * bit 11 is set, then it is a bus/interconnect error - and
> -		 * either way the above bits just gives more detail on what
> -		 * bus/interconnect error happened. Note that bit 12 can be
> -		 * ignored, as it's the "filter" bit.
> +		 * Memory controller errors have an MCACOD of 000F 0000 1MMM CCCC:
> +		 * bit 7 set, bits 8-11 and 13-15 clear. Bit 12 is the "filter"
> +		 * bit and is ignored.
>  		 */
> -		return (m->status & 0xef80) == BIT(7) ||
> -		       (m->status & 0xef00) == BIT(8) ||
> -		       (m->status & 0xeffc) == 0xc;
> +		return (m->status & 0xef80) == BIT(7);
>  

The SDM also mentions "Extended Memory Errors". I guess these were left
out before, but should they be included?

Thanks,
Yazen
