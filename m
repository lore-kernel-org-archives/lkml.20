Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EE44DC53E;
	Mon, 28 Sep 2026 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605341; cv=fail; b=ukU+cRKL/pSqYORFftDsmvH9nfPdJeA00kiOY1k2EFGXOM5GYy7TlSuJCR2TgdSFvi8GxqgBBAQeG1VnW6YrdZBBfSqfix7VY7BMLIA6bIIaT3+6FMM5zazSDqyI2VrKI15HHRsprqAIdT6tAD7jfzz6nPpjO+VVXtxF9lRLfR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605341; c=relaxed/simple;
	bh=1a4zzyN6LwIKfu3u8iAkhFCBvcdWRsIJ958ZBLXIDO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P2A3aysFy1Vdk0SjRpZ6lNR7xE2srMrjTdYb3eGlODAp/wEqLPcRVuKpqDKxOBx4vWqHyA08EaBsuUSmue0x7EpmbXJsutPtcDa8ZFcmX9m19gheiI2yuPajqEhnnnj11Cbmz/ZJyWidVlAM4Q9FgWlVFvFMK4WAkD0v2Id428o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ygg7r9LN; arc=fail smtp.client-ip=40.93.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ygg7r9LN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3x8bOw0YUuYYdCNpE5wDmI2Ix29PMaSBdOLbblkdPGeigJeEE8NRcem24tU20JwHdBzJ1pwuf3obg8kboIEoqDw6nXtR4arPAA5MP0s3hoxk9qqQssPJIn2hnWbRXCiSWTK0XMv9SE8kCAC+4+21DIImS+rINjmSVC+edNhVShGRWW2EVg8Y9HkfYxAI2rRxrH/3UB3ZOZa/Pm4WIOz5jj4r5SFf69CxFU1ly0+lfhG8z9xxESYP4bRKW1IVIApcbuOtnrDfvwk01eFg/QbnVk5zk405KG65kQ1KkeXodiuvxEy1RABW05u7voPrXT6Kt07VgrblNsxiqTBDIClEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZbGo05kScclgtwkpcbZp5kRGBfXyfNK21M65s+2hok=;
 b=B6OoWZ4xse6jFF0D8oOI20M4JSdpxe6xVljlumMlQhcsj2tQPhuud9nXJx0isNm024edaWGPDoLBAfpjDSc9K3mX+Qwhm6/ym5NgzJhxxgDBr6RDCTzj2IdgY4eqtd/ZAan6Yed7lrRCdfvOVXakjFIU+rDcN8Ne8TrbgB7SM+9FYCY8QGY+6QxynN1INxLHQjQ09A6O3xbOf1kGA0jsEPpG90kmMnt2I3FhBBqzwogRcOD0Qien5RqXV3/+iDr0t+6s59a3i/cdZcQ/nQIb/M8cE26uEWIf/gRLuN3AS9EI5nBGTHDd57yzowhMTLzWrs0nOaUOQhoJ6wrHfOvQog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZbGo05kScclgtwkpcbZp5kRGBfXyfNK21M65s+2hok=;
 b=ygg7r9LNcxuUhh7OgMj1BdWXp4ZyOcvc9z8a4Vz1SMyDvIzNb9vqgUsAJyhHSIc1395JzC5aLyxDi0k3mkKbCLsmd350i/gEQDttrq/+RFcf78re7psE4QXslVqjBdQD1Fr7OvfHOdsDwRHCSTmBesMo7HMjUINPch7fqfiRSD4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS7PR12MB8291.namprd12.prod.outlook.com (2603:10b6:8:e6::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.24; Mon, 28 Sep 2026 14:22:09 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:22:09 +0000
Date: Mon, 28 Sep 2026 10:21:59 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Vishal Badole <Vishal.Badole@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah models
Message-ID: <20260928142159.GA2289128@yaz-khff2.amd.com>
References: <20260925172639.97063-1-Vishal.Badole@amd.com>
 <20260925172639.97063-2-Vishal.Badole@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925172639.97063-2-Vishal.Badole@amd.com>
X-ClientProxiedBy: MN0P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::17) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS7PR12MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: b85554b0-a2c3-475d-6bb4-08df1d6be199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dVOkSYnvuDt3N1ttWRyRx67dKRWvC8N58Qc/KRuNmHRa0bZvKfKXPKUhgFJbprXD2YgSvGoWH7VbYLgHpdO/jt7B5RSxrVhwiN5ifeMehg6a7hIwUBCZgepZgleEi1BIW8r0HrQgi9RnEN7zYk0wegago1ZXr1FDtEoRHnSr9rAhQ7wjCE3lCrJyUav2uAWKG3BgxLkScHUL/IaKHZh0Gk7NJHTiHRMdlVsT1bb0FL/tEw65/p+AqwnOIYprPVV0Ut71k2G66QLvkaR/SR2Ba3xBupdjvS44P/AdGfh4hys+5PFjJCfOj8xW6WP3WIdvmsOd2r3hkJKKxchjsrDMVOPliujUB822SyHwjaJZVpptzupFVnQWF07bQbAX+AS4/blaDRemfD8UpnKJLqE264IWsb8/b5S/9D/5Objp+LpTkWvuPWb4gEiPkv4WNHyTql46F2vrggpd7OdQAkdaw64ARBDsGs8+QqIa3x43FfyWsF2XSaUX9rdHD0CV4Zul0YCRx/FrSgMuxP0Zy2dwWOnWzQycg5eCr7xz6qfCbugtESyTwbxYbEcGtjbIUNY3mKz44vJwaK4YFSqYHsteusiQZ5i5f3FZUDWJmY8hA2WVCGmSLeIKp5B0JULdRfcqU4vA7bgYt1evXCmOr+7c+1hjH72t34CRqwi7xfB19j0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gAvfyTIDXixraN3YCaqz3Q411DjmZhY1v1kqB8zcBMwg5vpYNM0Rz5n9MvsP?=
 =?us-ascii?Q?sPMNlIbRbjj9YFqVT3CF58AwPyt92dfP6RqNb9zqljekNwqRd1GCTnif7Crv?=
 =?us-ascii?Q?aqD/dDaQqzCRUKieZ8zl4ObQAjGW7OtvXcab3f5ccwntrxZohbpB+58yn9Ty?=
 =?us-ascii?Q?zHGkGzIbMhGOXNFGoq+JB4B4V5/nnXFD3JinWX06ae+kzW7Enlr2KLUmurue?=
 =?us-ascii?Q?4iqWIRVJNE3jTfK0lfhaIR24Rcd5Iq9Ix0v9pAgIB0NcbkaYl2Deg1PjFhmq?=
 =?us-ascii?Q?1qzUYfxQcVDEtin5Jvn6ejpnZzyboDdy8vOL/Lz0SeQiWKmyiJfKL2zqT+16?=
 =?us-ascii?Q?c02Ud1Tvx/CRnx1fzKdBXX2KLqXPo22TPdfG+OqGLdA7vvACfHI8DxsUb+MR?=
 =?us-ascii?Q?oeLZJUTkRwpKPeuLusDeuxv1mQyE9CFvJ6Oggb8DEg8wM9UhICQJvSkFc3YZ?=
 =?us-ascii?Q?dfoOQagjKDMTVT/osdwAMqwJy2IUwRUL5gn/RnJ85cT7/LbKjro478po+GOn?=
 =?us-ascii?Q?T9TrHvu+oErhGDJpICOQU6GaRmbvuIx1kPijZ2NLSejOc8TGNKIsCfdVPf1R?=
 =?us-ascii?Q?fz0huHSuaaaT3Yc2q7gyU0JDZ/lkfs2PnJ2KE6ySSAFRgLEMzgflnHsMUkAU?=
 =?us-ascii?Q?0Ow8QsMa+ufaYslsbW9XgehnjzUlQdKvbe3R9qPj3fYiNpb3pRciO6Mnb6j4?=
 =?us-ascii?Q?4BM7g4TDwol5b3hkAqBje3XCjudwRe1Vg7jXVFL0yWuLnN6fbMf5/wtWrJvY?=
 =?us-ascii?Q?17/RlDukB9SxXGzN3DtZ5dJWci+ZdY0G/QnTTqizpVeaeUYAJkjqQYxsmCPG?=
 =?us-ascii?Q?uzqnm22m2cpFOhRZFvEiFvFF6EfEA+QUWzVmkUe1kzZ82nRVuEHEs3bjBMli?=
 =?us-ascii?Q?JgVQMRCdxn3ZySRcSs/y5Hhw14dyb9MwabaXcmXszeEwabmlDWuda6TMgpqi?=
 =?us-ascii?Q?H3BcW/u6g65g7ZShE9txEwKp+X9Cc1rhJ5qWyMscsVpJnhCgnONoIT3sxp4U?=
 =?us-ascii?Q?8id61ly6v7PuCLKrJU7o9pz11dCThDdZ+WYYCVqbk+htYUtzUpd1KiTNPsqD?=
 =?us-ascii?Q?XZMkIaNc2FKAuN0H6k/Vi+NIk/Mv3/EdMf1xg6YzviVem7dtItkDaSXyvTW7?=
 =?us-ascii?Q?MEdcsqsXT9QCZMDmen2AG95pqdN5b2zSlZw7jrBDDXmoz4ldI9rpOvlI5ebp?=
 =?us-ascii?Q?4cM5xRouH/Slq019BTlOpka2xyNGckqQmRkn3edtDP/JZHLa+ZKAAOpuMi15?=
 =?us-ascii?Q?j4E8UL6DvvB6IOlJmE3UP3/0wWCCon+3TIpwec8VQdLdC5OetgMOeqUORZdm?=
 =?us-ascii?Q?y7dMbnPx/8pUNgnjn6UeHqkwBRC2Tmzl9OLkoZ3BmElSjcNrlxfuTVfykGvt?=
 =?us-ascii?Q?88IV+hOqhbjOn6Bl/eyq+s2kw7ROKCsvyfRyWpyppNaKwXnoVYRWd2Kzi4nq?=
 =?us-ascii?Q?umdMPdWIs/Yc/uw7Ps2OxnVGjgCIt9iEmGPs66YgOihjVGd7ce6QsgMKyDmr?=
 =?us-ascii?Q?YtJ9aO6Idrj3/+FNzyEE1pvGpbKxZa5z2iX9gAzdsF4OdxNGe014Lw2cCwsr?=
 =?us-ascii?Q?E1KInlXJH959O+VDe//fCjvC3LsVKGY07vSp/2N9WLsly+3Yrie0NvTbucs3?=
 =?us-ascii?Q?U+l/ba+vQHsqFwGTl4K44Pqxq3BPy1ZWOrYz4OOexdFfsn+GLrmofu92aQu2?=
 =?us-ascii?Q?ZV1P2F6zRMjmD9c/hmRgA9xNAsXog54/aHjRcOIDQCIw3qXm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b85554b0-a2c3-475d-6bb4-08df1d6be199
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:22:09.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pa5vdjxkQwWKAyuukjF7P0IqtasQrdI9GcLgPVh7kUGtqQyk1wp7iBp8bogT3xsowE3AW0MCwnp+8VxqrfsdRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8291

On Fri, Sep 25, 2026 at 10:56:38PM +0530, Vishal Badole wrote:
> The v2 register layout applies to every Family 1Ah model, but
> zn_regs_v2 is set individually in each model case of the switch. All
> currently supported models set it, so this is not a live bug; however a
> model added later without its own case, or in a case that omits the
> assignment, would read the UMC registers at the wrong offsets.

This parapragh should be simpler. Also, please avoid using long, run-on,
compound sentences.

> 
> Set zn_regs_v2 once at the Family 1Ah level so it applies to all models
> uniformly, and drop the per-model assignments.
> 
> No functional change intended.
> 
> Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
> ---
>  drivers/edac/amd64_edac.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index 475235c402e8..cab696be4f07 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -3887,23 +3887,19 @@ static int per_family_init(struct amd64_pvt *pvt)
>  		break;
>  
>  	case 0x1A:
> +		pvt->flags.zn_regs_v2   = 1;
> +
>  		switch (pvt->model) {
>  		case 0x00 ... 0x1f:
>  			pvt->max_mcs            = 12;
> -			pvt->flags.zn_regs_v2   = 1;
> -			break;
> -		case 0x40 ... 0x4f:
> -			pvt->flags.zn_regs_v2   = 1;
>  			break;
>  		case 0x50 ... 0x57:
>  		case 0xc0 ... 0xc7:
>  			pvt->max_mcs            = 16;
> -			pvt->flags.zn_regs_v2   = 1;
>  			break;
>  		case 0x90 ... 0x9f:
>  		case 0xa0 ... 0xaf:
>  			pvt->max_mcs            = 8;
> -			pvt->flags.zn_regs_v2   = 1;
>  			break;
>  		}
>  		break;
> -- 

Otherwise, looks good to me.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
