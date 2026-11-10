Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794324077;
	b=KqOoxEcqOHW3QmQWzrturo1PqVa7LyCkLwoodgKiSSngxtCS21pTSBQQ9fajgDIOQtWh
	 oEoM1yKY/jCznH5AyLdrxQyKAi/aJeqqVlXH5/bp2boKZkIr4TO6HvenuQ5IGcTSaOjqw
	 Rlq9GMdrkXrIXIkZ7FrhReohChZAi2CFucDzrSFD6hgiR2KMAgLjA6SiyCHjx6A26ASYQ
	 +pTWkxWrSEk1BV+KlQfQ0qUTWNQYxYOqoT2t3W6tL2b+VvnAGTy3FbG67GDh5n03+7MRU
	 7my13Z8wCJdWCnY4osTYm++qEgNRGrhYRDX1of6sl+4lwtCMy2FmyvQwWTdSa8ge8Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324077;
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
	bh=qvdbQNT+ZcUGzxGLUnoqfC+lNHUCHbUKEdqKTfkGHOc=;
	b=J/2cGtdQDjb36Kjv0/G/cW0m3RvQowDfhuXdu95KYj17o6Lkw6gVaLo1RzrWwo8+eeXF
	 tw25/acbvobYSArW/BPYg6sMUs8N6WKFHXdxHxodzf7UAlQo44jhr7mrtqxiA2VV0dj2L
	 f4SaUKId7gD57xydBk2fNykaEWfN4Me7UQ8+d4NDfagak5v7SNde133iUS0grE/Uqdo96
	 Joof8qGEE4o/6iUARNTVxz769+ozE0oIMuiJ4jMpQZloDQL/+2av07y13g8JZI+38IR64
	 AtWPTBuKWinGsMPQzao5NPX4guC2p34eWEk/2/JZWVq09PZPeGe9BOGcviT/i6CIITQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0YehZMlT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.9
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB05606A325;
	Tue, 10 Nov 2026 15:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB05606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0YehZMlT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fkq/m4rhdFVVuFIyGt8QeLxv5QqR9LUofO3/gGvMIRKvf7LQ7f9RyH5Un7fvLf1AexISm02KZbGGsfaYrYxCtI/GDxSADhiD4/9n6o8BEwWrpVXSofaWQ6CmBJrivbs53iB8nEBScPn9IfP2IGzDbiK1ravfua29zwVrPe3pnKl/3BHBOSGudZmxWrhkNjt1adEyO89lqc34MXu/rwsGDRp0aEn7VbuKeepXj+kOAcs+z3EWWTJDXt6+RpWFiMEM9njJqODRl6a4crLapLF4DJ+l9OIqAsv35Nyam4EVTrEb+ZivT4M1u1InoMiUDv8NzRGCVtILfuBSW1rfHJbjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvdbQNT+ZcUGzxGLUnoqfC+lNHUCHbUKEdqKTfkGHOc=;
 b=i8OaJNIIbPHMjAlnPem7x2+aI8KzmgpxQZ7MfrKv/WjatjNr4eUYQ13SNdiAUJQherOWtyV5dB87TvcPIWem2Br20+P33Io+EdEcP6NA3huf4BYDEpf/oSwGxaymhe/rpSiAU1Q57yeg+W4dzwovcStlPYJSqnMga6s2aCsFzAkDlbe28MxLgAsbZ9KMxutRjRYdT9pOrH1NHGuNK6KjpSBA+Dqh6z1MxqxNQJeWga/eITwPbycwATPx68dHVJlZSyxFRTabrHKBJyYDW7FovXp7Fm1xkYeNFWuA0bjI2/GgA9Tb0dPqo2BNVKn2UqIZBtKXo+SSZ9zw4v5pM4L7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvdbQNT+ZcUGzxGLUnoqfC+lNHUCHbUKEdqKTfkGHOc=;
 b=0YehZMlT4lWh/yx5hr06fygk9FEh8qkfjHIx9GwQZDipHGA/d9DiEyaJvYvaiP5ECGOoowm821fZDH/UnDV7vUIO5yFwXY+s0ES/2UZ6FrvcmobybxA+BZkxcIsuEwXnAJlV9bkpGuwtTjst91udcK90QqvBqSctiyyPg1z/Hu8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15) by LV3PR12MB9266.namprd12.prod.outlook.com
 (2603:10b6:408:21b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:21:14 +0000
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167]) by EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 15:21:14 +0000
Date: Tue, 10 Nov 2026 10:21:06 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/7] RAS/AMD/ATL: Add unified UMC address translation
 interface
Message-ID: <20261110152106.GA1579751@yaz-khff2.amd.com>
References: <20260922202318.4079080-1-yazen.ghannam@amd.com>
 <20260922202318.4079080-4-yazen.ghannam@amd.com>
 <20261106175635.GAau4U08ECoVyMTEy1@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106175635.GAau4U08ECoVyMTEy1@fat_crate.local>
X-ClientProxiedBy: BN9PR03CA0669.namprd03.prod.outlook.com
 (2603:10b6:408:10e::14) To EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15)
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
X-MS-TrafficTypeDiagnostic: EAYPR12MB923140:EE_|LV3PR12MB9266:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c389d6-f055-48c7-4756-08df3f3e427a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|6133799003|3023799007|4143699003|5023799004|11063799006|56012099006|261028144727099003|261026140227099003|261102123227099003|261009223027099003|261102130727099003|261022075727099003|261022105027099003|261021121427099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CaKjuorGkIny2Y5/ywMVmCnG4muBE4NO6VgW4kJh2dc8eBmAKhZhy77DKhqu98hKctPANr8s3JE8cN4Pprq/XHTJG+y69rxfABgq1qiigPs3dA7nuU3ps5vNOnohc2AwVPsVK3ec5Uj/eFEbVefNxiV0fbKrJ5q18HRFfQfwbp61H47cH7o3fhQGv6zqXguDgqIm73+nIH4qogz9JYEzQ1e8zu8jtwSLltMPwuUIlEAoOrqQsWo/zvOcplF49QlH2Gx68/DWpIef2FKjz4SuqK27+MJi6z7RP5GtAIs2pZvSRXE/9QAhDlnIH7D0oRzD6tVDR3daillWV9pFGwxuMORvCEskNN4e67H1cYMTFQQP8S51tHN/2YlWaJcG76zDjvqj5nAFHN7Sk6WAAciPuD6sqEU3EvGiNpD+82Hk2iRWxLN5GJ8mIA6Lq8DPcO+j2R9kHyB8xjB8nkjOq3QNfGBNaddKRG5CjXFI7HFNWUlu7nDZ1xK5Fmx0ZKrIUks6/zm8tiGLLqntHyaspYdpdalMo2Xy3semH4Nw4NG0S49GNGN3o6/QJeUlUJYCGofpGg1jsrc+IW7Gq05h2UdHy7TumUBmNGGiTDECrZds/msG32KS/s7KWzbsIYoOUPILaOqRNz7+hDJpOSl+F8zjo7x0M1FZzkbgkadbs6JcCo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EAYPR12MB923140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(3023799007)(4143699003)(5023799004)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261102123227099003)(261009223027099003)(261102130727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jrbSQ4Zd1QW1YohYBXaGl+0jXb5cyBGWy2KqHN/0MGX3U63wO6lwxS2gPtn+?=
 =?us-ascii?Q?zhV5dyLdrVztMJH7n03sbUCkFRAyS98tyrVS0xcaVNKoYTDmfJuF8YNXsjSo?=
 =?us-ascii?Q?uuug6vfCnzTRNLZVwZ77TOvLTKRzgqGp7FatPCE3Pv1YqEu3dOcfPruj3jkT?=
 =?us-ascii?Q?98Wrj7Su3hyqkrNRClDva44uBil2wFqRVpCE3uZn9V8IvJAS5lHffA1GgF1V?=
 =?us-ascii?Q?Leh24G30eM3u23CLXrbahq+F+ZTXYEJ/HIUGYEpOphHoYbXxnNPEpCzl/j2R?=
 =?us-ascii?Q?K3UVesx8VredpaktZZwYv0oUp1gS+4MuuBKVbcIrnwjmu30UUQeZ3xqORP0O?=
 =?us-ascii?Q?Z94cnzALBI8/JC8CF31DpfW2rgZ3tOhqPs6SVZ+/e6QdhhJghlb85k3ocpi9?=
 =?us-ascii?Q?buQeBpThL6/i+eIwmDMSZqyYp+B6qh9wXzgDzvvNoZ31SIGAY6+8gsmQbU10?=
 =?us-ascii?Q?4RMjmDp/Tv3/iJWBrVsPvnTws/x5+20WSMYpNJFaiffWu3gZXNnZbmJc2kl7?=
 =?us-ascii?Q?4C3HITtg1bK6QRQQCLiSIzLMH3dNh/QZIIXOT1jVnPYvPRgscDAcTkfc9Gkp?=
 =?us-ascii?Q?gD4lWxT+i56pa8lqDgpMLA+kC9WT/iGR0+e0o9f0VvMrG4vQakFUOUWQ+NOg?=
 =?us-ascii?Q?JAdzT+3V87lTNH7gZJmbDQ6mPwN/4c1xE7wKBr4jQnLVZKLhku3KVLvyWZZI?=
 =?us-ascii?Q?lxDkGtyN3xX7038WF/ludE8DSvl3/clNGWZUsg5fdx4oRG1BlIJyrhHuptrj?=
 =?us-ascii?Q?HamhkbaWcMmiCQ0+KHAWp5xzVNmOdO+dRwaaiL4VwhcsCGHuXryRnJ1FIARk?=
 =?us-ascii?Q?dTb3txg6VCE/pv3O+1mUm8iiMfcOeXimdkiNShKd7AF+pfXmdoTNXJoeryKc?=
 =?us-ascii?Q?3M9KsirasrpXLJi4NHY70wL2pFGYkJIIytkmr1tj2wViOVSkEquzckOUNW31?=
 =?us-ascii?Q?yi45bLeBb7IQ2gkxzqnRCSXWW7lYDcfttLgn+BTnHrfjvufatKWdJOwlz6Yj?=
 =?us-ascii?Q?4ALxq2zwO0orDbVSK5w8FwkhgX8W4bPROMAfZ6FAnc0LR8qSNpaGerihhh0v?=
 =?us-ascii?Q?kk2pLZFlpJEhlKfa0pTwFY0TIvxb1l/aAP/5Nl+ZeKLrbkug6ChBhCMY/q/k?=
 =?us-ascii?Q?lY5jg+pzSwjj8vYHrbht+RKfxk+ueONhoQHit/H8sjsfgtR6l8+w/MZjC1ol?=
 =?us-ascii?Q?OOlmOp6qcrgsrarvyEcC0KH8aXvDeXXRHXigXNJOvojmBk49WKYMKveVYsmD?=
 =?us-ascii?Q?XO6VRnsVTAVOzK+Sy9o4UpAxES7WNGzNJS4CUNkW75h6e1Iall1bnBLzzN22?=
 =?us-ascii?Q?UCrzVhtcpqouPXELPr3kn2JdhkBU3Npr3L2oynXkeBH1L2enJ6UL4JUsGUD1?=
 =?us-ascii?Q?DBGnG1myalDo3Vnzdi0P9PhGR+l6mRKYUp5wW9fqIcJDpNlIinlAwJzmt11V?=
 =?us-ascii?Q?Y9EyXCV6v85jqhyGO3MVM47RgzOezlI8aGoq2/6QwLcG51QXuQXHWPGB8D1i?=
 =?us-ascii?Q?8O7qkUMBDhglcx1tRF98RX4+LFc1AOBTFDWdms+DlO12KQnPgpUyQfUjMZ91?=
 =?us-ascii?Q?NB2Fu+b3ttCpZtaHUgSklZrgieXrgKVjkrLEOncvLC1LqowP7oaD0D2DnKQx?=
 =?us-ascii?Q?GI+XszYFX4EGk2kF7N20y5JbFeLApEI+XxuffYSzBYzJpRoIL1q+u/mg9WnI?=
 =?us-ascii?Q?y27+rYsPTgD7UKsPaDTfH2BB2Q05GRYh1LxGNdFx1+GAL5LL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c389d6-f055-48c7-4756-08df3f3e427a
X-MS-Exchange-CrossTenant-AuthSource: EAYPR12MB923140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:21:14.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DC5ETkbfX46aXalKA2EVAKAXqfzBKVXSA4f6SU1kBJW9icrNNjGL2RrZ58EzrXq2OBfbfsHJyj291d98lsVpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9266

On Fri, Nov 06, 2026 at 09:56:35AM -0800, Borislav Petkov wrote:
> On Tue, Sep 22, 2026 at 03:23:13PM -0500, Yazen Ghannam wrote:
> > The library exposes a single function for UMC address translation. Adding a
> > new translation would mean adding and plumbing another export. Callers also
> > have no way to request more than one representation of an address in a
> > single call.
> > 
> > Add a single entry point, amd_translate_umc_mca_addr(), that operates
> > entirely through struct atl_err. Expand the struct with a pair of
> > operation bitmaps and the per-operation output fields.
> > 
> > The caller provides the error inputs and requests one or more operations.
> > Each operation is attempted independently. The library sets a validation
> > bit and fills the matching output for each operation that succeeds. The
> > caller must check the validation bit before consuming an output value.
> > 
> > Group the error identifiers (normalized address, socket, and UMC bank ID)
> > into struct atl_umc_addr. Lay it out to match the PRM parameter buffer
> > inputs that every handler shares, and embed it in the buffer. A caller can
> > then build the buffer straight from its own struct atl_err. Move the buffer
> > definition to internal.h so callers outside prm.c can do so.
> > 
> > Route the interface through the always-built RAS core so the library
> > remains optional. The core provides the entry point and a
> > register/unregister pair. The library registers its implementation on load.
> > The entry point does nothing (no validation bits set) when the library is
> > absent.
> > 
> > Start with a single operation, ATL_OP_SPA, that produces the System
> > Physical Address. Try the PRM handler first. Fall back to the native Data
> > Fabric translation if PRM is unavailable and the Data Fabric revision
> > supports it.
> > 
> > Leave the existing amd_convert_umc_mca_addr_to_sys_addr() interface in
> > place for now.
> 
> Please remove text explaining the code.
> 

Okay.

> > Assisted-by: LLM
> 
> Those tags are not needed anymore. Yeah, that was quick:
> 
>   1e035297ffda ("docs: remove Assisted-by references")
> 
> ...
> 

Okay.

> > diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
> > index befc616d5e8a..91c02ef5dc11 100644
> > --- a/drivers/ras/amd/atl/umc.c
> > +++ b/drivers/ras/amd/atl/umc.c
> > @@ -416,3 +416,45 @@ unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
> >  
> >  	return norm_to_sys_addr(socket_id, die_id, coh_st_inst_id, addr);
> >  }
> > +
> > +/*
> > + * Translate a UMC MCA error address into one or more representations as
> > + * requested by the caller.
> > + *
> > + * The caller sets the input values and requests one or more operations
> > + * through @err->requested. @err->valid is cleared on entry. Each operation
> > + * is attempted independently. The corresponding bit in @err->valid is set
> > + * and the related output field is filled for each operation that succeeds.
> > + * The caller must check @err->valid before consuming an output value.
> > + *
> > + * The PRM handlers consume @err->umc_addr directly. Only MI300 needs its
> > + * MCA_ADDR value converted to a normalized address first; see get_addr().
> > + * MI300 platforms provide no PRM handlers, so the conversion is left to the
> > + * native fallback path.
> 
> Hm, ok. Sounds like a whole protocol. Lemme get to the end of this and see
> whether this is not too overengineered for no good reason...
> 
> 
> > + * Registered with the RAS core as the UMC address translator; see
> > + * amd_translate_umc_mca_addr().
> 
> Unnecessary text.
> 

Okay.

> > + */
> > +void amd_atl_umc_translate_addr(struct atl_err *err)
> > +{
> > +	err->socket_id = topology_physical_package_id(err->cpu);
> > +	err->valid     = 0;
> > +
> > +	if (err->requested & ATL_OP_SPA) {
> 
> You can make those operations a number and this then can become a switch-case.
> 
> Should be easier, like a dispatch table.
> 

I had considered that. But I went with the flag idea so that we could do
multiple operations with a single call.

> > +		struct param_buf p_buf = {
> > +			.addr		= err->umc_addr,
> > +			.out_buf	= &err->spa,
> > +		};
> > +
> > +		if (!prm_umc_norm_to_addr(norm_to_sys_guid, &p_buf)) {
> > +			err->valid |= ATL_OP_SPA;
> > +		} else if (!df_cfg.flags.prm_only) {
> > +			unsigned long spa = convert_umc_mca_addr_to_sys_addr(err);
> > +
> > +			if (!IS_ERR_VALUE(spa)) {
> > +				err->spa = spa;
> > +				err->valid |= ATL_OP_SPA;
> > +			}
> > +		}
> > +	}
> > +}
> 
> ...
> 
> > diff --git a/include/linux/ras.h b/include/linux/ras.h
> > index 468941bfe855..eac8cf39ddd5 100644
> > --- a/include/linux/ras.h
> > +++ b/include/linux/ras.h
> > @@ -3,6 +3,8 @@
> >  #define __RAS_H__
> >  
> >  #include <asm/errno.h>
> > +#include <linux/bits.h>
> > +#include <linux/stddef.h>
> >  #include <linux/uuid.h>
> >  #include <linux/cper.h>
> >  
> > @@ -35,10 +37,26 @@ static inline void
> >  log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev) { return; }
> >  #endif
> >  
> > +/* Operations requested and completed through amd_translate_umc_mca_addr(). */
> > +#define ATL_OP_SPA		BIT(0)	/* System Physical Address */
> 
> verify_comment_style: WARNING: No tail comments please.
> 
> Please audit your whole set.
> 

Will do.

Thanks,
Yazen

