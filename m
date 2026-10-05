Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013033.outbound.protection.outlook.com [40.93.196.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B1A490BE5;
	Mon,  5 Oct 2026 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208501; cv=fail; b=tNNiy1rpC/bzb+FkrwaxyY51WVi/Sp5X6Nz5/nRmLEDSGal2qD6yVdToh08oTWwHX7A2dNx6smUlJm5JKJ53f+TcuHs7gX0YcA2kvoiq6/PVNorEwPvIBms1hlE+YWSNqJItOVZbpNQfbtG372Pfqhin53fyvRYp8Vt9M/NBhOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208501; c=relaxed/simple;
	bh=C12XFOYJa2eohcCZWFznRdC9k5DrJOaJb0jHih6afDM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o3PZ84dTcIsOjtpdv64g+Dcj88rdvC0FhR9lhlzRqTvfYVhA+MTGwDg7u6I4xi2lCq/IRSOvPx8ciJH9lxtGQpSvmJ2EOb9B5PIzBehyr/iCnKDR5inAkG+ioEFdcX6h/17qhsP8Wa3i3Alq0QZb77178R1vB7/imbc2Q+4SGj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cjJQ7zNh; arc=fail smtp.client-ip=40.93.196.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cjJQ7zNh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5Z4/ppZ7n9s2L2Z6WT4wPBjKbWLECAPJsjENFs/J4jVqtsaeugVcxFM/QvE77TCaJPllkETd08fHueG2/BlpZtGajWo414DeimIVRuL0BTPniljnZk238N2Km4xyG8JFExMDakL9imW7aNAD1+8+Nsc9l9K0nEApcaRZbaQpiVoVdl5nGQKY+Yq/fyoBiIXFXczJbOWLp79587Ii8EwevV6dnfXSAHqAYK2C5K9Dq4UnMNaRenXxkbt8eoL0o2bANAjcSMV3NIG1DxrcPW9ptHFljPAVgGTjssBy5sjjveis4zau1k3fHASStj48U/e1mn6L4lHZ5hkm7hHrhfbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfiXmmr+Pw//mxyXuEIICslAFKosi+ywutS1q50j6EM=;
 b=CX6Mpe79e93eQdsUFK+jax226Y7FKykYcrY1CbPk1ftKZCdGDui33CMk1L0CDIpnDNNAvynjCevAfXy472GdrQo8wXAXcrVA6NayHQrFL5ezgMziSttmDa6XrD1iyrGKeac8HICIH1kV8Dz0YUB3XAEp498MOf0W8k2HYGIWKhyA45/E+A4EaD297hcsy8HiGxjHB1G0Z0GiMMvzb+HuexhBIQtePu3G1cpjtkI/QM2ptYwczdwBthzyN9Xu3Zv0e7MSu5lgs4FOCJ/sq8k+Srhl+N4HtGnENcaZF1/rgWryetZEEKv7LoC99IeL+kFgXiFVJUZKeMARiydpu157qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfiXmmr+Pw//mxyXuEIICslAFKosi+ywutS1q50j6EM=;
 b=cjJQ7zNhfEfiFmzzhATL4qXJExmTMk9S3kNYNjG96hz8wBoHQWnIm5rYML0wndOPygERRGdhXB/dJ1DU5SuAuGYkofqaL17dcUg49X3I9cEKTbSQg6z0C7HjRLWD758COyFBBX0YXQDg4YfasHTeE9Mtoyq7fLu0WzXW89Ro/KM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) by
 MW6PR12MB9020.namprd12.prod.outlook.com (2603:10b6:303:240::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.16; Mon, 5 Oct 2026 13:54:39 +0000
Received: from DS0PR12MB6559.namprd12.prod.outlook.com
 ([fe80::3f99:f532:cf6b:ea46]) by DS0PR12MB6559.namprd12.prod.outlook.com
 ([fe80::3f99:f532:cf6b:ea46%4]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 13:54:39 +0000
Message-ID: <674079d7-6ea7-438c-ac57-07def94ec92b@amd.com>
Date: Mon, 5 Oct 2026 19:24:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 "S, Sanath" <Sanath.S@amd.com>
Cc: Mario Limonciello <superm1@kernel.org>,
 "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
 "Martinez, Juan" <Juan.Martinez@amd.com>,
 "westeri@kernel.org" <westeri@kernel.org>,
 "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
 "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260831130638.GK124825@black.igk.intel.com>
 <20260831161610.1322731-1-juan.martinez@amd.com>
 <ae19d381-0fcd-45fb-9e53-033c7d664d73@kernel.org>
 <20260902054800.GI106095@black.igk.intel.com>
 <21cbfbaf-ef1f-469b-a33b-8d623dd7f9a3@kernel.org>
 <MW4PR12MB7016EE093475BF1821A0046281BF2@MW4PR12MB7016.namprd12.prod.outlook.com>
 <70448c19-1ac5-4350-bdcc-eb3ebd008992@kernel.org>
 <MW4PR12MB7016137EFD6AEB235F3D50E481BA2@MW4PR12MB7016.namprd12.prod.outlook.com>
 <20260915060459.GJ106095@black.igk.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20260915060459.GJ106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::8) To DS0PR12MB6559.namprd12.prod.outlook.com
 (2603:10b6:8:d1::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6559:EE_|MW6PR12MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: 906c44bf-2f0c-4f27-9269-08df22e832ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|4143699003|11063799006|260925021911599003|10067099003|260925022911599003|260925021311599003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3gIqE8UIIFeuSw8HVCQtFO1lUUTzKiXGRkFmP6tNqf0hqIKQywCAakbchxMH1qHnSS3qG73e8SDgTpaLaXocdKKAG0u0bk/0XxCilK1GQnPTvRLES+Ac6Iyt0EoQZ/LUAnhH2Hdcwyko/+iZ5WZBHXqU5p2Jcg4ai/o6JhWufPcX/GtGG0xI7frm+ZzvllQt4WAMAdAolzQWHngEbv+TqZqvCFOMmw2BtaPnxSWvpRQ+FjcfFv5phnx8InSvaYp62SxsVhJyY4ts0thyUoCiVpZDlVyJ7oT30lA1oVzISNkZarCj7vKRVj2RvamN+xYxRxEW9M4TqGYePfDxlOroiLZWfYXqP/8assG/AhLs8nWQojUtxMXL/j4fyV2jiWsyPMgw1Othx6wDg/Y/+rELhHTqp8CtYeNE37APWPdylOdaJBLqaVsTd6eRyxYbvRRmReCkOOuPAl2loCggoLh21D0jBG7PQnLTts4nk4Jay3NG8a1FPN0o3EVWq6wNwk09iV2MQ2EluftqU7qjS4/6kCuWlvsanom0+uFbRc1HWap53rUg+eLYmCqXzIbitnpfqNtwa2hDlENdZqB2G7eW9RWUCCPhEALnMku6wMcZXoeRoZhSOk3xGQ95SxK4wuuc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6559.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(11063799006)(260925021911599003)(10067099003)(260925022911599003)(260925021311599003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTNDOFZ0TDh2bFNwaFZldHVnWGU5YjdzZkR2WDVZeGhReTFkOU16TFQ0dGJz?=
 =?utf-8?B?UW5tc0lTLytVeXVRdWJTL3I5ZmxBN2NnM2dQQk9LSVI3REdXb2g1L25ZUHZF?=
 =?utf-8?B?Z01uTnVrRDVmVkU4M1BSVUIwOUdBZExtZUVnSFdZWlNBRmVXVWt5ckl0bFNu?=
 =?utf-8?B?dFhncC95T3JvbU1UYms1YUJTSTlUT1U0c2E1dXEzZWJpYXpJallJOC9UM3ZS?=
 =?utf-8?B?NHN4ZDRma2d4QWxXaUM5Vm8yMEdTSE5lOHhBN1JSVllEbUVBeitaT2pOSDVp?=
 =?utf-8?B?NnBOWXZDcjAyL1greUVUYTBXSmZvbDVhSjR6d0pMU3ZJeEVpNDJYMEtGU0h2?=
 =?utf-8?B?SDBjQ3B3QkxTZmtCNlZ0bXA5K0szVEJZajVZakZ4T2QxY0VjanBvZ2c2TXA1?=
 =?utf-8?B?ZWNXV1F3aGwvYmZidlJxSi8zQUFJL0pMZWZVR0xHVXdPWUlDWEg0VTNBc3lw?=
 =?utf-8?B?SDhUc2ErNWtuTUpUWFg4b1NpYTlVZXdWT1dzdnJ4MXJ1ck85cnRGU2M4WUM5?=
 =?utf-8?B?NnEzTHJWWThFUHlHaE02aC9FeXdGaG9JQlNvMng2WXcvYmtaVnR1U2RSbWZn?=
 =?utf-8?B?L3daaWd1SHVBazlmemVhMDJvNzlXOE9mWDlkK0NyZFY0SU9Rd005QjBqd3Yv?=
 =?utf-8?B?VWtLUWhKQWcveG5MYi92akt2QUNrUDNzWks0MzVGazI0bkFGMGpUSVdjTmdo?=
 =?utf-8?B?MjFKNkNHdVNTTWRJcDdyVU9uaUpoZXF0eXp3RjdBWVh6cWlSZnh0NXBtSGFt?=
 =?utf-8?B?MXh4L21xaWg5b1dUN0tNYTRlb0E0eUVrdGdCeFhpQlFjeVIreFhNRkQyeXhO?=
 =?utf-8?B?eGVIb3RHME1XSk9HWGgzWUF5Tnh0djBmSWFCMFhteUtaYXJmTjYzNVY0ZEQy?=
 =?utf-8?B?Y2hCNVNBZ3A2S2dYZm00UmVmQU1ySlZEU1FRdUZrRzhnbHM3Umdud1Y0Q1By?=
 =?utf-8?B?U2ZZaStZZWZuQVFxZDNrNjVaMjFkS3pXaU9OQXJKd1RPV2cyb2txOTVJMHBQ?=
 =?utf-8?B?dXRVbEtKQk42ZjBhalh0aXZocnNiVHhDUGxjSHJHYmtyV3dnY2IrQjRpcVV3?=
 =?utf-8?B?WkdhK3dBUVFvdUNhclJnWWFOYlQ2ZW4rRDVmTUdLcGpDTFJiOEl1Nzh4MkNr?=
 =?utf-8?B?UWY0VHNLZGg2MXZCeE8zbWJZUWQrcXpzOVNiVEd0NTJUbWhZSWlha3h1OXpL?=
 =?utf-8?B?SUlnV25pY3d1YUFxSmZVYzNzNmlFZW95Q05TdFN1V0FpN0N5c2lBd0Q4S3Jt?=
 =?utf-8?B?QTd5L01XOTF1cS9ULzRsNTlpSWxOdUZWVjFyRk1QekNybmVxbXZSbWdvNjBs?=
 =?utf-8?B?N0l0Q1V3cHBHT2Q5UmhkSkQxUGR4SWxvak9MSk5SY1ZKcG8wYUFYZHkwZW1O?=
 =?utf-8?B?b1lnUkZ6TElURUN3eTNDRXA5cmRaS1JicjQ1a1JGcElFTnVwOHo1SWR1cExC?=
 =?utf-8?B?K05pTmFZWEgybi9wSUVla3NBMTdiNDN1V1VEak5ldEdzK2IzdzJvQjlSNHZJ?=
 =?utf-8?B?cjBWazladXpUbncwbDUzdVNicWxiVUN2aG92ajlDRDRFYk13MDU1Qm83cmxu?=
 =?utf-8?B?VG5vUmMwVmNhbHBESWJrQmhjSmNUcXFRTGRXRzk3VzhEQXVUZ09jSXNsVHRX?=
 =?utf-8?B?SFBFZDBJMmZYK3EyMWZJR3pWK2JPMlZlRnVTekRPazRUSGo2MHgvR3hjeW5S?=
 =?utf-8?B?djRFeDc3L0lheW5TZStDNmZFeWNhQVdyUnVoWi9tMFllSnExcVFFbUFhTklk?=
 =?utf-8?B?NmxwRnpaa2NyaUFwc2tlMXg3UitFVDIwbyt3Zkg2SkN2bGIvRldyTHV0ekNx?=
 =?utf-8?B?RzI2cm5aWlRVL1BXTjBLd3Z1N1ZyYTVJc3FOck1KSXJIV25UaytaR2hNVm5i?=
 =?utf-8?B?R0F3NERiRDAvcVhtR3pXZW84a2dpT0dUTnVYTUxSbmM2MEF3b1lVU0d1Wks5?=
 =?utf-8?B?QzlDWkV0OVo3NTFqWXVuNEtQY2pHRjF0enh5eUltSi9VUHRrWjM5aHdFM3lN?=
 =?utf-8?B?QjVSZ2VjZ3RtY2NCTlhuZUJtTEZNZW1sb2dNMHBjS1U3RlZ3NCsrS3NKRVpC?=
 =?utf-8?B?MjlBT3FZUnFWTzJEZUpDVnVmNld4YUlKbzRCa3dNR1B0TUNkUnVSZzNnTHhW?=
 =?utf-8?B?R3daVFpmWlFtdEJoZzBmVUx6RUF4WkJUN2YzdDRTZld6ZUE3a3FNenpzQlVi?=
 =?utf-8?B?MGNhcnAyWHJGMTl1ZTF3WXo3cmdaV2h0RldKN2NJQkw4aE42NDR4Q0lpeEFn?=
 =?utf-8?B?UVpTcFhhQ01qQ0VwS2pRdUJwcnN6aEJhNXUvSVpub3YvYXR6V1ZHWGoyWjhT?=
 =?utf-8?B?SG5BVlhUU0lub0Z6bVVFbEVDSDB4UmptcGNRNTNWYm5aanpZMis4Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906c44bf-2f0c-4f27-9269-08df22e832ae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6559.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:54:39.0628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwkHhRUvR6VSPrXtPUNpb1zbuHd7sePxmkapYAb3Q/81JjK34jFjqOIODfa2KfMeYrIfvvhNUwVAclCs113nDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9020

Hi Mika,

On 9/15/2026 11:34 AM, Mika Westerberg wrote:

> Hi,
>
> On Tue, Sep 15, 2026 at 04:51:00AM +0000, S, Sanath wrote:
> Ported it and stressed it on two Strix Halo hosts connected back to back.
> REG_CAPS reports hop_count = 3 here, so two usable DMA HopIDs. Observations:
>
>   - Single tunnel it works: 50 x traffic then link down/up, plus 42 x
>     dma_test create / transfer / teardown. One reset per cycle, no ping loss,
>     no errors, and every ring restart had a reset before it.
>
>   - Every reset is preceded by "dangling request in request_queue" and a
>     WARNING from tb_ctl_stop(), 8 of 8 cycles, via tb_domain_pause() <-
>     tb_ring_start() <- tbnet_connected_work().
>
>   - Two tunnels: the networking ring is stopped and restarted with no reset
>     in between, because the check only runs in nhi_alloc_hop() and tbnet
>     reuses its rings across a reconnect. 18 such cycles did not hang, so the
>     unsafe reuse is reachable but I cannot say it hangs.
>
>   - When the check does fire it takes networking down, reproduced twice:
>     "RTNETLINK answers: Cannot allocate memory" plus "out of HopIDs that do
>     not need a host interface reset", until the second tunnel stops.
>
>   - tb_domain_pause() takes tb->lock from tb_ring_start(), while unplug holds
>     tb->lock across tbnet_remove() -> stop_login() ->
>     cancel_work_sync(&net->connected_work).
>
> Moving the reset into a per-NHI work item scheduled from tb_ring_stop() when
> the last DMA ring stops removes the warning and the tb->lock inversion, and
> passes the same tests cleanly. The reuse hole and the lockout still need the
> reset to key off ring reuse rather than ring allocation.
>
> Mika, Can I respin your patch along those lines and post it as a new version?
> Of course. I'm thinking though that should we do the revert for v7.3-rcX
> now and then do the proper fix for v7.4 with your updated patch?

The reworked series is posted here:
https://lore.kernel.org/all/cover.1790854235.git.Basavaraj.Natikar@amd.com/

Thanks,
--
Basavaraj


