Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012021.outbound.protection.outlook.com [52.101.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB94371876;
	Thu,  3 Sep 2026 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467642; cv=fail; b=N9sG/mb4fwtP232t8UxbvvseFKVEMriR+TXx+MsyjJ4pSJcjjQCxhDBs1ec6wScVxyKv+9hV7KCsIOk6O1Fi48QlexwBX0kwRmVUyWZPS9Pe1edothKujG6f43ENSC9eOQydHZyfLNWWby7j9T6xxtBlatL68DpAeNrP3A9YqCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467642; c=relaxed/simple;
	bh=ctzGdzNdT13silWcbzrMJAfEghv9CZIyqMp4RnoAv0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y9oLxdRqgVVAz+HBXJ9T+OeplpxP6n5outubzdXvxOMLRAgAS7pqEo76gHfQE0PBDzegO8jwwK8b2y0s50YxfbJgcdaJEOoZ/QEaG+mb/IaNDmlTOomU1xrbPfk0hNb2wmSHRq9glbVR5/u+lXlRd0p9sJSuswUqwMeQmq9f6vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=fail (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2JJad2hz reason="signature verification failed"; arc=fail smtp.client-ip=52.101.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2JJad2hz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCCJ/Qo8vCDKzVzWWxST4+Tl3pvHwk5GFHmBaWhgZeVd9Mezb12Ap/xhBDRRs6nz13g+K9nNUiYPFNU3s9LjFAuSjCsVweT/ZU4iV6kBRrE+TW2Qc+dZSicxK+lyFp1LpklXcNsn6AwD457CebUF4pAdIY8Rrxk5nhqVvuzES3rVco4gl8074a8f4thGCSeSs64vi724w0Y9q7c05MN5FNZ3GTQlFjh5r7P2pjmKFsBgk2MPWQXyE55UoyNKbG7zSqeXMl0p5NK+BaMCwAmj0OjcREhUcRN4QusoT053pxy/YUKfLuEjc3N/X59Of2alcnenFiSYsoGnaiKXSgSRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwfYk2UflytCDougglxS1ZktUT5qI4NU9MjjidWCZY0=;
 b=dXNwRkDSOY3NM+00C6UFmII7r5QoaTSbMTpogyGMEY46jADiMAJ7BLHyEv98oELOfmnURmapdzGn0bROdShd95Y1bJzVYiqyMIjs4spFDtuPd5g56w12s9TnCQY0f56m5p03GWFRsJKs4Msw6LWDpBT6bpALFYGN5A0qQCGGJNH3Lqy5RPyRqnhXPaAwD1no0vdmOykjbJIsbvuxCsY3vtRzG6ryUJzTon0PfsMm/QlU+OPo0tq40dQFdLBwQ2UHU8d3pxk/g3Weso4dYvNy5SxNJ3azeP9tUugjaRim85L/S/7Dy8Bd9mvpiMUFKsQ13+xfxZAkqKhOmFjCrEx88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwfYk2UflytCDougglxS1ZktUT5qI4NU9MjjidWCZY0=;
 b=2JJad2hzspK87UF7d4R9FkC03kumvQ45ZS3IZ05UOuVxD4AqbHKA9sTcJsw8cq2X9TrYhNNYaLjdYxCUqi6BPd9ZQjSaIfblSBbKhZ0mPD6PcVDKnlAteY6i5v+Je33K88DHauyJmyFnhCcYKUah/19FgAnjL0Zo1AMXOhCNmus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CY1PR12MB9558.namprd12.prod.outlook.com (2603:10b6:930:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 20:33:44 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 20:33:43 +0000
Date: Thu, 3 Sep 2026 16:33:39 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: OptoCloud <git@optocloud.no>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Subject: Re: [PATCH 2/3] x86/mce/amd: Reset MCA_SYND1/2 between bank scans
Message-ID: <20260903203339.GB145182@yaz-khff2.amd.com>
References: <7EacjuP2vbN93ctW6NuNj0xNiJK0J17etJfHrSNAotd0fSdNc9c1ZKr957iB6gkmpUu_xLHdgrGczfvoZPoyJQerWGYRCEnQYI4gqkhPXKs=@optocloud.no>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7EacjuP2vbN93ctW6NuNj0xNiJK0J17etJfHrSNAotd0fSdNc9c1ZKr957iB6gkmpUu_xLHdgrGczfvoZPoyJQerWGYRCEnQYI4gqkhPXKs=@optocloud.no>
X-ClientProxiedBy: BLAPR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:208:32e::30) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CY1PR12MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: aecd1175-1366-477f-4a66-08df09faa57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|22082099003|18002099003|5023799004|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	hW46mOYjn2ZWku1zQTyFuF5Zd+iN1UD868Zlf1f6oNVwns1qOqyWimfMGBqIl7/QiY5njV15QCBKH5irncjQJS1cO+A9wtn4wbVVFEu/8m/Lk5BZMoEkVy9MAtgMiKLFqT1oGnScBcSelvcX+As261VMv2jUWkE9adFWsSXw1ofnwG630L976C4GjQ9UWmzgAinHBtE8bswWxOc25MYJuQCqymfbAs+hHCLm4J68ioa0ca8/MiVMObBJF7k9yPx+abYcnTk3+8QFmEl6PfSM3twJjo/SI1kjNVbxsF/I6YMNs60EugEbghK3uX2EwBirtTT9k8gmMAHM4GW23SijA8dAGvF/OibbLQyEWwToN5aXKDNEpw+v4JGQnt0dsqRSRMOdC84Qzim4tiu3vtSosIHSw/bL9VIqr4sb3MkKVyeuGmpOCgP2dLpqKHApIYok317STACTXiZlpBNVi5N1Anx/yiWEPSIvrAM3+4Lf2P6ys5pTxUucWyhm+qTXjgoR2MJ1zqZjp9Ej1kTR/8Y/CKwEd7EsaUgoaq7lLPNtdx5lDjJLptq9kWePGUCLCQaNB1Hpadhn7cfZLxyDLpYnHRV6Ff6vKzHf6Q5S2z1Z1RmYthzj5twc9EBaFDiUO9+fkEuynam0HDTeyEgQPWNQZOyHE0xFTHIO1h3wtyF0dDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?5Fz8tFbr2wQg2J14eRuedtkN5c3XWfE0uV3gC4MOT/5hjk7n2nOlOTne34?=
 =?iso-8859-1?Q?I77XmDR1nWJsQZDvMFCADu4kafEzeIrnXrXxFDnZNpreO+KO4cQy9At1TY?=
 =?iso-8859-1?Q?JPbaEgMgCBePY0YVBhov+bnfD+3AAebdcGazmZxR5GWYgKKl9y+lcMKHJr?=
 =?iso-8859-1?Q?Hngd8KF1QsUeWl8jPNo1sRPX1ZlIWkjIYKo5I9OjreMZBjVa/pNysX6nL9?=
 =?iso-8859-1?Q?88qDkdyBa+WxIENK1eft35EXRy29LhElxRyAZT5AZipNWj5bGPOlXi3TEw?=
 =?iso-8859-1?Q?1DfoGsfK9WfHQkjh4XW949Zbr9urnkrKmeOu57deYfj2UBhsO2KGlImMnW?=
 =?iso-8859-1?Q?lDOiZ4BjBg1V3CBkXfWwrtqj5fmdJn7dvSQsCWin6FwIph7L+foycbt7FQ?=
 =?iso-8859-1?Q?//DPZZKdJC0MxUJviHOaZgSTRzoxjrroRx5tqOcdI9OAhe8Jw7azh6yr8n?=
 =?iso-8859-1?Q?6DvJtjsfGKPjfnMSqdzpNBD73qr/GytI08Zn3JxhCk1VL5K27kI7O30Sww?=
 =?iso-8859-1?Q?2OxO6x7+zuN8qXez4skzeKIn2m5vPK2LDephwDqfzfXP8Awq4OQJnwMOCE?=
 =?iso-8859-1?Q?C0QDsSZmpmIymcIWRF0BGI63viahTNQpa54ReCoPTwGSgPitXWk/KpFjhu?=
 =?iso-8859-1?Q?qGDpNTwQbI4p2toW4v7nJXcfieHtP6z9lnXKyXSrHtIAQIljiOa6M2Jc3N?=
 =?iso-8859-1?Q?2LMr8vn9KCom40GYW0Vy2RWgEUWU1k+69ZHdRjIZM6kPDX/jGBGAFOkmhD?=
 =?iso-8859-1?Q?6aNTqNne65dIGHirihTg1Ub5da5kE+BxRsmESw9F2jcfgQtPlpScEH353U?=
 =?iso-8859-1?Q?j+vbnVs9gqeZXePDV2A+nL+EcPjKpJO9fu2BvzKdcB/fXgLqbTre6O7X2O?=
 =?iso-8859-1?Q?Ho4kKe4AyVH1YJqpvO+D6qrC2eRkvofmBMntl+KI1ko93yXhVDQ9PH0HTG?=
 =?iso-8859-1?Q?Gwu63NgMwzrWFOpgcPVYTn0pvgODLX5fPMZO5l3K+GLRoil6PM+NfenSUO?=
 =?iso-8859-1?Q?kMu5p5HTeK/8IfauaGb8z2IcPBlIYJf/h1WHVm5Y/xPOyIRgcpdYgtw7WH?=
 =?iso-8859-1?Q?IAdST9P0hrpkJ+PUkRDUyj8NzE8AmtTvEVYnS8QF53/x8lucg1ANXqtOZk?=
 =?iso-8859-1?Q?Wbb6HxFU60Bd5gC6cdk9GbvH6rV7oBrPRV3C/RfDNvf9Q6oKPoVksRNJ+H?=
 =?iso-8859-1?Q?7QKj3UH8BreoXZ+Xr8VSa5HhCxw3dkBgeApFJOM7LPDrKE05ttdP2esf4Q?=
 =?iso-8859-1?Q?92sVJ4RV+4w2HJy9dU14gbFccmeT2qxjZsz8Nfg66ln2qMEWMnxmRXtw4H?=
 =?iso-8859-1?Q?NmasejOVokvkHcJT/WjREINGQgxy82VxltPn0O8EnaJf7S6iC4KDHZ4spR?=
 =?iso-8859-1?Q?+CUbbcm+zJoQf+zupQOMFguydxwK/qYUvMi2hY3jvxCdoo3+LR47qW9jRC?=
 =?iso-8859-1?Q?9N2nCbK93XOpQpZ9t2jXXkEEofAZSJ6QaX+E8wcaHqLCMlT/RzxEpAk/Hc?=
 =?iso-8859-1?Q?xpgXGV1mpsVARcqxAHMh2QfLJtcxjsM2WGjlprha9bW/7CAEJ2rtXp1BYc?=
 =?iso-8859-1?Q?q8iqgdp3hcfWgMO3kbuwTG4/lCQgpi1hFC3w67xOaKhHSVotbGpXz2Ke/c?=
 =?iso-8859-1?Q?5rG+cVuuize6iROxnkEBHwnu7OPtEgZRj4kHsTlkQfbQskXxxVrFGt+6iV?=
 =?iso-8859-1?Q?0pE/sNSYa4e91lRT7OnW53gd4E8d26+7YJtPYAmSmk2bPHGePnW2Zq6CuG?=
 =?iso-8859-1?Q?Ar36TW3sKUF56EjokmX8zqQ7bzizvD5/icq2Mz6fz6APcz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecd1175-1366-477f-4a66-08df09faa57f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 20:33:43.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gx5iRLdJFJl40F43FLAI2KZrZvMbIkMXXwpe85Tgt/1XCF7DpsnkFH8+9nOVZax341j31EtKfEymVW+dbMITDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9558

On Sun, Aug 30, 2026 at 04:42:54AM +0000, OptoCloud wrote:
> Same issue as the MCA_SYND leak, for the two supplemental AMD
> syndrome registers. mce_read_aux() writes
> err->vendor.amd.synd1/synd2 only when MCI_STATUS_SYNDV is set, and
> nothing clears them between bank iterations in either
> machine_check_poll() or __mc_scan_banks(). A bank without SYNDV can
> inherit synd1/synd2 from an earlier bank in the same scan.
> 
> Reset both fields at the start of each iteration in both loops.
> 
> Found by code inspection; not reproduced on hardware.
> 
> Fixes: d4fca1358ea9 ("x86/MCE/AMD: Add support for new MCA_SYND{1,2} registers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eirik Bøe <git@optocloud.no>

The same feedback from patch 1 applies.

> ---
>  arch/x86/kernel/cpu/mce/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 16183fa4ddc7..e4e588d02a18 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -809,6 +809,8 @@ void machine_check_poll(enum mcp_flags flags, mce_banks_t *b)
>  		m->misc = 0;
>  		m->addr = 0;
>  		m->synd = 0;
> +		err.vendor.amd.synd1 = 0;
> +		err.vendor.amd.synd2 = 0;
>  		m->bank = i;
>  
>  		barrier();
> @@ -1349,6 +1351,8 @@ __mc_scan_banks(struct mce_hw_err *err, struct pt_regs *regs,
>  		m->misc = 0;
>  		m->addr = 0;
>  		m->synd = 0;
> +		err->vendor.amd.synd1 = 0;
> +		err->vendor.amd.synd2 = 0;
>  		m->bank = i;
>  
>  		m->status = mce_rdmsrq(mca_msr_reg(i, MCA_STATUS));
> -- 

At this point, maybe we should consider having a "reset fields" helper
function?

Thanks,
Yazen

