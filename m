Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013030.outbound.protection.outlook.com [40.93.196.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E6857C700;
	Wed, 23 Sep 2026 20:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194045; cv=fail; b=dBuNP7CYazeLq8Btd7TnSWcX9jV2MqvTpkHhZXJYYUIvmyBlH3i3Q3oc/hA15si3UDjkK+4Om+uCuKkXQZu4RvF7EiyjghTS5TxwmxWN7eDgaPMBVisPmJZjbAxJGRmGnwbRRi2X62IP5jyBW1fvsKRxwEgUb5uWY4JW1XBafaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194045; c=relaxed/simple;
	bh=SxsXMGo8nZTNhXrqh0yeB2iTZAaiNdjA+LmyBwx3ZEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZnEWU16gFVlwsdPeyk6bKaGkyptp3IyP0ZL0pMpmUgwpAvamV6bhDPIuuZvdwV0mfTs0CQWqVtue4XNIXIDvWt5sQ/yLXQTCANM6gsUm/Uvn1b6Q+tzXbY/UPIIo5sepoaoLwHEnGbjlEO+cEQXlQW8D+rjzN095UGkR0dWeZpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=fail (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TSGDW1tt reason="signature verification failed"; arc=fail smtp.client-ip=40.93.196.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TSGDW1tt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p52LdD1FfPu7BdJ2IPdaeioce1qU9f+YHbJj/QleooFV/pyowUUXhLMvi4QNer/f2XJB37/pz4sdklkBzw6e2Veay8DsfzOzfwoDf4s8TIIqE3m2G6Sro9BDvhqe8MgzQ6hWBbf7v8MhgLrJqqepylupkgrlMrk8nxnvF/+9nz58gDH0uogqqxV53Y9wNJG92XPDAT167Wn+g+iaPSknQGNJCsZwF3C8YHbORQgXYUpDLZsI2XV4/o4APG9V/PeNuHdSmx8hakvRhymgOkd4sRkoRzpOJZHmX1pRhzYYD/13Sh5Oanj9Ka4YqbpAtdrp9QIrHbZTVHO1FBcMN0wC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAgDKGuYjVdM7k1KqNjnS7qVD/iOmlZg6bGm9vwji0o=;
 b=bH/uEnPCjr5qDqBkVnW/dBJqwaebGNowwK+zB6dsfOTQIvh+I+CpnaKnUc6yBTHocz0XlsR/KuEksh82g6unHwSh6VuUKOVqzaQuOnVWKtD/y/h4zSUqOAbkT7n+W21eHNSfKJV8lWYyNWNzT/yoNPDdJmJRxy4wPx9B/aMgXhPn4cOFjyQJQuavbXqUtQqEQubalPF+vlfxw7Jvhhk7LzEkCiXAl2nnPOUCsT4TJWfDhH8UowfwM07FpXV7ukMd3S11ZamfHjbeXzoe5397wH06ltPlDvNpsD+k+K84eYnGmWLb85B2JkFyEMj/EG5XyB4upWI/P/wf9UNycaM3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAgDKGuYjVdM7k1KqNjnS7qVD/iOmlZg6bGm9vwji0o=;
 b=TSGDW1tthe4W4M77wP4ZAwTWqcZVvQNuMmCTBjXvhOs4kx0aWKE2UBl6qojUUPIpa9iYKpIcHyxcftbtS5W2O9GeMtjbTlY1bhrqJQdjJGngcLFusWk2yyaR8zlKvbxCB95CoJmuIIdw7C6nYTqzf6KYUrl5y4Ch06SiMQRY3t0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CY8PR12MB7148.namprd12.prod.outlook.com (2603:10b6:930:5c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.14; Wed, 23 Sep 2026 20:06:56 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 20:06:56 +0000
Date: Wed, 23 Sep 2026 16:06:48 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: OptoCloud <git@optocloud.no>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] x86/mce: Reset MCA_SYND between bank scans
Message-ID: <20260923200648.GB1080284@yaz-khff2.amd.com>
References: <zmLt5S3aLNcgxhqRI7yuVhN-gNY-W2KFuNz9F9gU4jvyJuY4LGM41p4WuEVus3-_3fs8B9sMA0143PG2urpBRYKlSCxuUQxV401F6USx4DA=@optocloud.no>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zmLt5S3aLNcgxhqRI7yuVhN-gNY-W2KFuNz9F9gU4jvyJuY4LGM41p4WuEVus3-_3fs8B9sMA0143PG2urpBRYKlSCxuUQxV401F6USx4DA=@optocloud.no>
X-ClientProxiedBy: SN7PR04CA0097.namprd04.prod.outlook.com
 (2603:10b6:806:122::12) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CY8PR12MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 7794c59d-24b9-43d8-e977-08df19ae37f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|23010399003|1800799024|10067099003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	m/6t3tbBfhj+Z48tm3+cKX3tfA+TeEZQon6u1hYbtcohSulaTeW6gF640N+rVAUFuZ/6uRrwEAWPAcnO1TZtAk8j/8oMb3r7ohiSUNyR1D/EaJQ1COmI4yVYQBxUiiydMw4cIrDtRyIEm+fC/n0dJ1fBrYglQY8/nHX1O/aJAlzFAGCNv63J3l92XkLF8pNlb2DSC65mkmzrxkR/B1hVe2LtGw1cFG5N5Kvyr1MZHp6jtKPQ0NOE+BJiJWUL3XkP0iRDsJAkxkAKobZP41rVUuxdfyXcF/0v+Q7VyHzd2rOXs3+U4Q56aN0qIgW6zkIAAWWDU2BdAHNFDhCA+VQ7s0M7ZaJpOgd1QxNuVgm7zPbuGzaqEmD4wXK8Sl3U7Sbx1NavoTFKtwBKopAFwn39pCxmbL8P+/YREtNbv3774THWPv+M8Ncg0ZJux4eHSZ9hIzXHiCG9E0+sDwKaCRwUE0NAlQuiHPrBRvzcGLqJnfq395rX7jGlm8DHhP63MxCBM5/q2Eu5axSmHjE2KA4CEcrqK3IBfnAy5kAiZ38KONYCZZf5GSV0l06f61nI7Ijhr0j8LyuAydnTxqjJaDLES4lPayarL9vsKnKohYZxKtfHLqZjEf2HKXK6a5jOLBcx/eNlUnj+IFIIDvwcLcwezzHYWc6y1I/WwESZF0lxHXQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(1800799024)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?D7eoZRH8oKxDokooHTkI2CXT+ngfAKAQpXQ0tI/Q9dmshcMs5j0ISbYv+n?=
 =?iso-8859-1?Q?SkTaB4Aub/J8r/L398R6BAWwc2Cyk6me1ocR31t29KrTMjuHHHn+m3s1Wu?=
 =?iso-8859-1?Q?YOPWJvg5n+ZFZs1GuAZvJqCjRDDiUYwkZ/XiWamfxYz3E/4oMXu5kUEY9p?=
 =?iso-8859-1?Q?Qsnk4eDXFTJCPM/5wosmwK6Vp7HJV2CZnd7qBMi4OhtIlF4fnkipM4eM5P?=
 =?iso-8859-1?Q?H3498DNP02pUuwuavRhF1aFjEUb62n8OLzHcF8ySYag9iXEmpJHWUCcbYI?=
 =?iso-8859-1?Q?3f7zGrf3j1s3v5Yosfinc7XnFANxd6JIePh7HIjc4cmN9LsxyhXtNEevpc?=
 =?iso-8859-1?Q?9Cb9bPN9BgvVxvvzDpOsusgSrJe0ABFhJlqljafItAEYjopRRKeDAIj4ty?=
 =?iso-8859-1?Q?MmrMMAH1cR4/rt1cHzahURCXkDhe60plnIGTMj5yf1x19ufl7ehXhK4+Mo?=
 =?iso-8859-1?Q?pDb5yDUDPIUMg13MEkOin5T8g9Zu/L/qeKWfuu9BRG9MLQ+P9VGrMEqCYH?=
 =?iso-8859-1?Q?VHHCNlQ21IhiEg4eVOyMMu3bDFyVuGCBsM3T0TCZccLT+c2fwg+5IonrbY?=
 =?iso-8859-1?Q?rxKGHrRe16Gy/puiKmtGxIwq5+nUFfe2hYgQaEo/ueBnDPPKo7pcmxu56x?=
 =?iso-8859-1?Q?jB+ti7S92G/xMjmI6YG5ijz4lAdX8HK610ehQ7IKsjg1JsxOa5jIOgMejg?=
 =?iso-8859-1?Q?5cdErntlPhwEzIfdvzPJqN5auW7EEzC3YNayyemejj+UTNmj3Kr8GQcRdz?=
 =?iso-8859-1?Q?/ClYpDfz6aAMZPYL9m8Zvi3QPPX3AQ/XxXUlY2H+6GIng64FRDLqVmF8tV?=
 =?iso-8859-1?Q?I8KUd2bVWeVNspv8Zef0FEX8Hm0cv7FyGvccQvxYXs0jarIcMbVEPVlOta?=
 =?iso-8859-1?Q?z8iuvFbAV1bvAJgmeXZhCFgEBpdUJhulhsUF2YOBqpWpZeHBpwq2lD0578?=
 =?iso-8859-1?Q?Ei1u3/6NSO7+Sin1Kc0mqTGW3zvqW26uUPpTyk+gY+XWw/CrQOranLYmRA?=
 =?iso-8859-1?Q?MhQTYhr69RgRG7UhNGPkJ8gn9Pkz/t9eq+Uw3Es7hhqf+HEFJWu0/3NQr1?=
 =?iso-8859-1?Q?tigkGjOECZNNP0SjSbAZExAL1v6nzNh8iCVewR0FrGe6It/MfkZPY79/Xb?=
 =?iso-8859-1?Q?PxJMi56ysWFTD2c9Nk+Qo05PqmlRoQRUwXetLKEdRQ99QA/a0zKbQdNqUM?=
 =?iso-8859-1?Q?scO3+qnRVe192uYqroWas0xey62VmWVNXGIdDSxZrFaY0yKcVgpaw4EF7e?=
 =?iso-8859-1?Q?9VbPc0TYf3grEVBb4gZXEXVsEOTqMFNmvDZoVsmHqWWwwnyo/ZSCGNW7pd?=
 =?iso-8859-1?Q?w4l1I09pxg/1LcKOfDcFWDVNbcuBfUlsmA0EQqBSGjVBPEH6mPULpyNUwW?=
 =?iso-8859-1?Q?OhQO1RMZyVP4Q4Zuphx+W5jBQibuAcKTqzQD9yfuQycN3MexcQAdDBmuFi?=
 =?iso-8859-1?Q?n4kleOBzVKmFXYkOcZ9ruiIls2MailalaQcXzP310yDWRrgpGS6LXvvGfF?=
 =?iso-8859-1?Q?xZQP/CKjEVGtb1vAGass8VUIilP9h1//endrivV1JteTxxG5j7u09DI1Vb?=
 =?iso-8859-1?Q?WzfJbdTnfOuqH/6+Q+0Y1dWHVxK3676tNxPF/R/Qok731d93ny/TnQODan?=
 =?iso-8859-1?Q?YnoEKsoFzgTaCMLBChJP6i1HsVTc73n72X7FG2UV8VfHTvlkG1zsHpiHYW?=
 =?iso-8859-1?Q?I3TyJqlzRWgr8n5gk3D79U3t1dcUnSQxUEd/qYsaCRYoXqL712cQmRryKt?=
 =?iso-8859-1?Q?LChCrQI562SzAGk4ZPpDl/1dS3vP6C70EtCFm6JHZvs67e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7794c59d-24b9-43d8-e977-08df19ae37f5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:06:56.5964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cd1RdZOTOwC4aAdeVcAfy2Plq+rq6rsTat+eZteC5YvKqmwaOzXmjyuZqHYjS/lgMFnWTfcNCRVwa0/kGGzc7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7148

On Mon, Sep 21, 2026 at 01:37:02PM +0000, OptoCloud wrote:
> From: Eirik Bøe <git@optocloud.no>
> 
> machine_check_poll() and __mc_scan_banks() both reuse a single
> struct mce_hw_err while iterating over the MCA banks. The record is
> zeroed once before the loop. Each iteration then resets only MISC
> and ADDR.
> 
> On SMCA, mce_read_aux() writes SYND only when MCI_STATUS_SYNDV is
> set. Nothing clears it again, so a bank that does not set SYNDV
> inherits the SYND value read for the previous bank in the same
> scan, and that stale value is printed and handed to the decoders as
> if it belonged to the current error.
> 
> Decoders are expected to ignore MCA_SYND when SYNDV is clear, so
> the stale value is cosmetic.
> 
> Reset SYND at the start of each iteration in both loops, alongside
> the existing MISC and ADDR resets.
> 
> Found by code inspection; not reproduced on hardware.
> 
> Fixes: db819d60f672 ("x86/mce: Add support for new MCA_SYND register")
> Signed-off-by: Eirik Bøe <git@optocloud.no>
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
> 
> Notes (amlog):
>     No v2 of this patch was sent. The numbering follows the series.
>     
>     Changes since v1:
>     - Dropped Cc: stable (Yazen)
>     - Picked up Yazen's Reviewed-by
> 
>  arch/x86/kernel/cpu/mce/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index ab469605fc89..16183fa4ddc7 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -808,6 +808,7 @@ void machine_check_poll(enum mcp_flags flags, mce_banks_t *b)
>  
>  		m->misc = 0;
>  		m->addr = 0;
> +		m->synd = 0;
>  		m->bank = i;
>  
>  		barrier();
> @@ -1347,6 +1348,7 @@ __mc_scan_banks(struct mce_hw_err *err, struct pt_regs *regs,
>  
>  		m->misc = 0;
>  		m->addr = 0;
> +		m->synd = 0;
>  		m->bank = i;
>  
>  		m->status = mce_rdmsrq(mca_msr_reg(i, MCA_STATUS));
> -- 

Hi Eirik,

This patch can be dropped. It isn't necessary with the update to patch
2.

Also, please adjust your email settings to keep all patches within a
revision as a single email thread.

Thanks,
Yazen
