Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793249797;
	b=Ibpi6bkvrQAFKPgCqk7pg5bwgG4PiyA96B8BSJeenRxv7lFiYCrrwGjjmzb/Y4aoMKec
	 BGnbTMNzhiYTaLLMn5Tl0kIcWQc0ch2bEC/b3LWAZh9xVxriS0nsfgWr/y8YV83OtVNn2
	 aDxoOt3EXSAmIyZZT1K5KsdzmpbJ85Gf+iwFGU9gIVv05uh3W+hPRX1svwa50ba5AlY+R
	 d1uIy1OrKFXfn23QzCACGhmvSknYppC3GOCuPbZI+hezTyLtbpn/rdupPpyBKTECs1qvC
	 ArNAo5l9DPY5mQt/qJOYSxx1MmNENePKglFKpCPrQCEw/dux1XrvOmkVm226qX70S9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793249797;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xGpA9Yg1/F1cBRsil9u7wYgIfJ2S8sCSmyOB+OlPbeY=;
	b=CMjER9Qmy9+AOw5/daABWtzBhg6r8v/Bfuf35f0qCh5+j6PLqA2UhVHSR3BdzbeMsgmr
	 Sj6OhY0h6eZEc1u67db3wnNR3xdvG4DZ9y7dg6ThvKRlIyXlmYeQKQq9pcXc9z8o/lZa6
	 3O2Bl+Gpa7IPsZVRcGolVcsNwKgvdjojiPVs23JXUWLBfAbS3JxM51krKRYbIF5WRTuYv
	 Xr61y0KyC1Y2xwgpqXMy3LJ5S2TjbdeUsvoWPhVK8N/e+k+2zqJjA2qi6zTe9gO3lB4DD
	 js3txj+JRGw0NAfrqXQUi2m06nb6hoYmRvp0tmGXM4NmibjTE4aIWPx8bx2YJeJAkyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="AovZ/5kF";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.2
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610EE606A31C;
	Thu, 29 Oct 2026 04:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AovZ/5kF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoTkyR+7ZG5uDmakAyAwi7unclQE0LvGeqvBHKLmrSX1Yozf06dUWokGQd2kBfce8D0ZSdgXAGYPjVGLFYTE0TRRvUkMNzdIj47wdtAfAavF5uDDmm2uEzExbn/l5QqvdC8d6Wd1liWuXVWcELv2p18LT72UFmuhFazb2GbQLt00dnKvMnnWu/nF4RYPUxyN2DOTH+FFoDpVQ1INlCi6dHP9Dup35xd5yD8E380RgLNqOOjO+ifNSKD7KxkCkkYq6L0NUR2mIHfb1+97YTD1U2Cyl2WdAQqKe7TPdCuoqCT2CoHwCHfwgDcyzRXOxNguQwwId0plNmCoC7Rrvqimww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGpA9Yg1/F1cBRsil9u7wYgIfJ2S8sCSmyOB+OlPbeY=;
 b=HEKfSOFRwDHUcyBUoV1JDSQXwxGObxvcLeM6VhFVw3X4i4a2zb9ZkgcSk7LAwovxVD80ERk9xCe4t5Bj2GFBfRustb30Q6Kq4aeCi/B3ebcej61B4xn4cqMiVZEgaCpy46ZfpWYw5gOPgKUbxODmu5JTBy6tdpkcGS0TrtaYfYloLb5popjFcpNsbJCjdB25MD8EeQ5zS8drKKRYJJSZthRDL+5CfcboV20a3ZawXObTJ2+DgzDKBDDDAbBuRiFoOosgQ/u3ZqcyCI/fhvaCn4H4xL9/HeZe4bNeKLCQDO226NP7RbbqQjIl652MTemq+8JZcKXU/qotiI9iQaNL9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGpA9Yg1/F1cBRsil9u7wYgIfJ2S8sCSmyOB+OlPbeY=;
 b=AovZ/5kF2N6vaLdESFvhZaftwMZSE9M1/eglz3KuWNar5ZLYaFvPNfDX4cgvZWvAKkzufesfha4sbDGIYgpPMSW+VYyM8dVB+TIaXsSAliKDQA533Go+D2q0Ev0aX5WAR9duwJyst5CSMy7hgpQeJ1PqQqPxmwdp+yIUjbkPPzk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by CYYPR12MB8703.namprd12.prod.outlook.com (2603:10b6:930:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 04:54:33 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 04:54:33 +0000
Message-ID: <a5771999-6521-4d02-868a-5cf5b75b6848@amd.com>
Date: Thu, 29 Oct 2026 10:26:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI
 link support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
 <20261023065216.3473883-3-Vijendar.Mukunda@amd.com>
 <f4a337e6-9ba4-4f52-be99-95d0d5ba11ff@linux.dev>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <f4a337e6-9ba4-4f52-be99-95d0d5ba11ff@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0107.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::10) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|CYYPR12MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: a8dfb622-e951-411e-c8a7-08df3578b96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|261028144727099003|261021121427099003|261022105027099003|11063799006|4143699003|56012099006|261026140227099003|261022075727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	BZK0qyT4fP2CtLLmgs9xUJNPH2Aht1JYv10y83u/VIRN+S2oWWe5pooSbEvwSr/L67mLXEms4VjiEkn3ue+/SXfTRHLAi7y/dqxPgcQjgQgdgh812EMG7U14I4Xt2aC/KCOnABxinkNxGVmCl/k2x2+fwkTdklkJ6dbSCSAF7JTN9H1tRTfsVScPf5Uzaubvii18F6az16tmvT5No6Ce1oZ8SL4HNaUIVe7LbpwM8QBiFv4xUeSWzd9S31ux4GDsPlRF+HzImDCrnCL8qPYJTNl3xZ1TaK+Qg+FjdR3g2dLQa3+KfblF+6cKrDEflFkw0RMuLNEbh6r0GfUjn5aKpcWqpl6k909qxGNQfM9WtFwP/uTRCjSwfMu4j1Ckwa6spCdi3K7sw87E3KAZ82KFRHF2Vbb9BuNIzgPnCkJCV8Er6EQzfPbxI85eKvEjhyGqS70xwPNar6I+ZVVMwLQ6uvKRVEM3EM8H1+xpqABSxmPZ6LR83ADyVL+aoVx54SUb7VZ76rKrj36cPFcsBbISQ4bDSEL6SV46OaKPli3N8TJiNPcnKsPd2sZUemOVIp6siiz3q43zGmJ796P/XsIXPywdgJ18kaVvjMXPwgPCpDMRPru9t1S42adF0cKga6hCx6sPNwnDnfcxmgRLVX392hqWKtCPPmvxMvxOSOLAfPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(261028144727099003)(261021121427099003)(261022105027099003)(11063799006)(4143699003)(56012099006)(261026140227099003)(261022075727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlhzTWpRdzBFMWxxc3dZK3BMMnlJcjJxdUJyVjJmV1dwZThGMFZRN2RRUWFn?=
 =?utf-8?B?WGEreTc4RkhLNHAvSzNheWJGajI5Y01tYVFUdC83VUdIbzVqSU5yTVNjRjNN?=
 =?utf-8?B?M3pQVFEyNStrczBpYVF2bmNkZjhPcnNYZGdaUmpTSWRmQk40OEx4ZXRHa2ZH?=
 =?utf-8?B?L2JtUjgzNFBDS3MrcTZQeXU4UW80OW5adC9GeWNnV3hzYnh3U1h2M3dIQ1Y5?=
 =?utf-8?B?bE8vNFJkaC9lV3BieGxGdXNxOFJGcFpPMEV0SHloMXJ1S0ZxcnhIYVIrRElX?=
 =?utf-8?B?ekkwSzFSNFVFanRpWm4yUURsZ0U1ZGJDZ3pRaEZUY2Y5SFFZZFh6MjBBbTF3?=
 =?utf-8?B?cG5sWlpnUjNpZkU3d0FpQ0dnZTNJTFJGM0hVVGhpd0RKMUgwNVRqVzZSeGRL?=
 =?utf-8?B?Wk55eC9qRE5FUURUUzZFSXJ6bVBOZy81bzRLczZUTnY2NC8zdnF2ZnVzeUpS?=
 =?utf-8?B?dmczSGV6a3VLRmVsYUovQ0lBUk1yRGlockZDTUV5bEJhbjg3SXFwMU9PTXoy?=
 =?utf-8?B?YUs2SzZmYXBUQjBVMml4TUFzT1BZaGRlUk03SjgrQ3ZDT1Y4QjBLRTZ4LzMr?=
 =?utf-8?B?M28wSUlkVW42dkZKMUJ1VXIzWU9IUDhVM0RUQVVkTi82UWljVEJJR2JRWFph?=
 =?utf-8?B?ZGpYZkZyZ2ZxOEI4SSsrTWRYSngzTUQrMTBBVVljZHR3NE9MS2dpQ1dJd0s1?=
 =?utf-8?B?VVd3OE1FUDJXN1BEZUhkaGVUUjZjbW9DQ2swbVhKRmV0aXJEdlRVRE5Ldktn?=
 =?utf-8?B?VlNPeEJHZUF3UGFLdW4wYjdkZXloNGp1M1VsT3NFdXFpOHBqRHp0SUwrZzQv?=
 =?utf-8?B?Yzkyb25PQ2VpVlZjcGxnSmo0WG9ZOU5VUkNjamVKeElRTGpCdEwyN2NabTY2?=
 =?utf-8?B?SEdaaDBEa0lMNUt5dW9qeER2a2FUdk4rYjVaSTExYXpJSlBodVloeEVrbUl1?=
 =?utf-8?B?S3FmMHIzY3hDYTZFa0diQUxuU3dxb2sxV0RaZEtrY1dwYnJBQlUvT05yTW51?=
 =?utf-8?B?Q1VRNkRoN2NBMWo3WTlESnFmUGZ2MDd5YzFhb21GaGZBOGxJQUVUQUpGZU1h?=
 =?utf-8?B?M3crd3JPVXU1ckp4eXQ2cTdPOEtzYXQycVZpN1V6dmhiNUtRV2E3WnZYUytl?=
 =?utf-8?B?S1YzOXRnRm8rZWVZUDNiQXJzTjFhc2xqeHpsUU1UajY0eUJveEpYdW5wZ1dY?=
 =?utf-8?B?TWhMZ1AzWWxPeTFpTTJmblVLRnk2WXJmOHQ4TDd1dThEYU9uUG9FVHZydDdI?=
 =?utf-8?B?N2h0MDJ4Wmk5ZFFZYTZvYllER3U3WDNsL1dva2dzbzkxNnI4UndQQUJISkpz?=
 =?utf-8?B?TUJrTk51eDVqb2NZUHNkbDJzcXp0dW1tcjBuZFlqNk9WTWRGQnRBcXMxWmlh?=
 =?utf-8?B?QXVsSkNmdDlBTERxdGZPL0hPc3hvbGRQQml0MWpuV1dzeGtsUUdtSVhaNjFr?=
 =?utf-8?B?dkZZcUQ0Qjd1dDVVVmQ2YlBJWmtMSTlZaE1nV1U4RjdOQUpCMHloZ0VVSlpx?=
 =?utf-8?B?WVJsNXJDUzdFZHA5eWRncnVjd3VrMFNGakFIUTBXa3VjYU00dm5HQzJLc0du?=
 =?utf-8?B?SndYdkNZNFUyeVViR1JTR3BZS09HU2hWZFY3M29xSWFYcGphOFNGUDNHS3JO?=
 =?utf-8?B?SHpEZzNmWm42V3JocXl1Y0RGNG9oWEttcWdwenFIWC8vekNuU09xVkt4VUp5?=
 =?utf-8?B?VUtZL05iQyt0bVowczUwS3MrUW5iSW1scnFpL3dXbm1GZmpMd2FDandDNzdz?=
 =?utf-8?B?c0IwR1hPMlZyUFBuWlVWV3plWFZrVU5pcUh5ZE52blhTaDc1ZDh1dnNJenc0?=
 =?utf-8?B?MlQ3RHNTMGwwZ2FmZ0JZSHd3MTU2YW1RamZvWEF5WjdXb0dhQmFLRmJqODZO?=
 =?utf-8?B?Z3BLaENxZi9wSFBBMkVqWmZMUUxUNVdRNnFkWENmbDV2M0lCQ1hFaGhEc2JW?=
 =?utf-8?B?MjJrSE54Ni9rMGhzd0hzbk5MSFdjcFdaYzRUT0lTQ2xKY1dYSXpCYlhYVGRD?=
 =?utf-8?B?OHNvSklSZ3Q1RU9ZaFc1TjBkQ0IrNXZrYnNML09kT3pBN0w3UWFlNjhqWk12?=
 =?utf-8?B?QjkxLzF5VHZpZ09FZ1BzMWc3YWs2WTVZanNVOEhFYXJLUnpBMXdoR0VHSC9L?=
 =?utf-8?B?aGF1RzNvOWgzNDZENWMyOTBTbnNuUEExV3c3VUR1SXdobDVQUUdKdXhhZE9C?=
 =?utf-8?B?V0t3ZmhVY2g0M09XcEdvWVVNVWRsZ3hZb05HUTVuWUd0RGhJYUJXLzFjTzFs?=
 =?utf-8?B?a0VYUWNuSnZGc0l5VWpMY2JkeXlLSHRrRmdYT1ZlWVg1V3ltblZoS0pkZkh3?=
 =?utf-8?B?L2V4MmlVZVFLdnQxUjFTVFJIWVordDlWL0YyMnBGS3Vrc2dKbldSZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dfb622-e951-411e-c8a7-08df3578b96b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 04:54:33.6539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUVS9d0ptjoVd+JG1XbBHjQq6oNkQVsygyU/ayaHM7V50Oz5eXoAZ3Dv1TfTcARJEqAR3kaXW1Pfg6NI8M4hvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8703

On 26/10/26 02:41, Pierre-Louis Bossart wrote:
> It'd be useful to comment/explain why this routine only relies on a
> subset of IDS...
On ACP7x, each SoundWire data port has a dedicated DMA channel mapped
in hardware. This function selects only the ports required by the
currently supported ACP7x machine topologies:

  AUDIO0_TX (0)  - headset/jack playback
  AUDIO4_TX (4)  - amplifier/speaker playback
  AUDIO0_RX (11) - headset/jack capture
  AUDIO4_RX (15) - amplifier/speaker capture (feedback)
  AUDIO5_RX (16) - DMIC capture

The remaining port IDs are defined for completeness to represent the
hardware data port layout, but are not used by the currently supported
machine topologies.

The ID numbering differs from ACP70 due to the hardware differences
between ACP70 and ACP7x. ACP7x uses a flat ID space, with TX ports
numbered 0-10 and RX ports numbered 11-21.

Will add comments above the define block and the function to clarify
this in the next version.

>
>> +int get_acp7x_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev)
>> +{
>> +	switch (sdw_link_id) {
>> +	case AMD_SDW0:
>> +	case AMD_SDW1:
>> +	case AMD_SDW2:
>> +	case AMD_SDW3:
>> +		switch (be_id) {
>> +		case SOC_SDW_JACK_OUT_DAI_ID:
>> +			*cpu_pin_id = ACP7X_SW_AUDIO0_TX;
>> +			break;
>> +		case SOC_SDW_JACK_IN_DAI_ID:
>> +			*cpu_pin_id = ACP7X_SW_AUDIO0_RX;
>> +			break;
>> +		case SOC_SDW_AMP_OUT_DAI_ID:
>> +			*cpu_pin_id = ACP7X_SW_AUDIO4_TX;
>> +			break;
>> +		case SOC_SDW_AMP_IN_DAI_ID:
>> +			*cpu_pin_id = ACP7X_SW_AUDIO4_RX;
>> +			break;
>> +		case SOC_SDW_DMIC_DAI_ID:
>> +			*cpu_pin_id = ACP7X_SW_AUDIO5_RX;
>> +			break;
>> +		default:
>> +			dev_err(dev, "Invalid be id:%d\n", be_id);
>> +			return -EINVAL;
>> +		}
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +	dev_dbg(dev, "sdw_link_id:%d, be_id:%d, cpu_pin_id:%d\n", sdw_link_id, be_id, *cpu_pin_id);
>> +	return 0;
>> +}
> ... defined here - I marked the NOT USED ones.
Please refer above comment explanation.
>
>> +/* ACP7.B/7.F SoundWire CPU pin IDs */
>> +#define ACP7X_SW_AUDIO0_TX	0
>> +#define ACP7X_SW_AUDIO1_TX	1 << NOT USED
>> +#define ACP7X_SW_AUDIO2_TX	2 << NOT USED
>> +#define ACP7X_SW_AUDIO3_TX	3 << NOT USED
>> +#define ACP7X_SW_AUDIO4_TX	4 
>> +#define ACP7X_SW_AUDIO5_TX	5 << NOT USED
>> +#define ACP7X_SW_AUDIO6_TX	6 << NOT USED
>> +#define ACP7X_SW_AUDIO7_TX	7 << NOT USED
>> +#define ACP7X_SW_AUDIO8_TX	8 << NOT USED
>> +#define ACP7X_SW_AUDIO9_TX	9 << NOT USED
>> +#define ACP7X_SW_AUDIO10_TX	10 << NOT USED
>> +
>> +#define ACP7X_SW_AUDIO0_RX	11
>> +#define ACP7X_SW_AUDIO1_RX	12 << NOT USED
>> +#define ACP7X_SW_AUDIO2_RX	13 << NOT USED
>> +#define ACP7X_SW_AUDIO3_RX	14 << NOT USED
>> +#define ACP7X_SW_AUDIO4_RX	15
>> +#define ACP7X_SW_AUDIO5_RX	16
>> +#define ACP7X_SW_AUDIO6_RX	17 << NOT USED
>> +#define ACP7X_SW_AUDIO7_RX	18 << NOT USED
>> +#define ACP7X_SW_AUDIO8_RX	19 << NOT USED
> The IDs are different from what was used for ACP70

ACP7x hardware exposes 11 TX and 11 RX data ports, mapped to 8 TX and
8 RX DMA channels. The CPU pin IDs use linear numbering, with TX ports
numbered 0-10 and RX ports numbered 11-21.

The ID mapping differs from ACP70 due to the hardware differences
between ACP70 and ACP7x. All port IDs are defined here to represent the
ACP7x hardware data port layout.



