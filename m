Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D0223DC6;
	Sun,  4 Oct 2026 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791126975; cv=fail; b=cs/4ivfxgm3WIfx69H2SdYiOMHb0JCZyM2V0Y3kNuucBfHB3TPcduZmvlG1IeEMKFpNHTuLrjGjt7YR6BRkRxJLLXHxw+1eDBz1v1ZJN/ajYSxT2CCeQy67oYHXBN2IgX32ZvBD1EbmFbE7ptu1jHbfPhpvYMurJeDUsU3HksLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791126975; c=relaxed/simple;
	bh=4XmtTJ8VBcFwZQ0Pz2b6fw0rHK/nGTZP4Yvl1tkC8Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WhrFSH2ef7c4agJnPUNnbyOYQbnod+E43Ar4RUm8zIL30rFEM8PmAeDXBl+GS4tULGFx/Om2CtLXY+0lj7qy5/BOhBZ+zQlUy0oDr+7VE/9qfYJC+Hdtfxdg9LHgBWbKM+EA/BYhnuQhM63G66eohvK5AH5NeYIMAMHhhXcf8Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JqLVYJv9; arc=fail smtp.client-ip=40.107.208.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JqLVYJv9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbSQJyP5SLu14AvNDXewmLHE2jfW5OHP45LheMGLIsV3o6y2AEfYEZvwbigl50bImfO6pBlkENtnSIAx7pNGF7D9j+duqsQh1Ht3cPV01KOK/bGF+DAiqFymqlZUQ/FavBBBZPdSDyQiv310m6/9unTc6ncaa0KLUl98Pd2C4UyZMHEHrA3DspaBifQP4PFrP9rnvGyd6w0XliJ0gmL6MGiBm793Mj58ygTYOIEZ31Hf1/eioTHL21blLtYklCqSsJFu8m8zDPjbbB/0BSRqMLdiUi6W7UDOtVg4cmo+O2e2Ljv43Jafucy3IukFPy8yuzsrHI6tCup+WlTpRIatFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnmoKUBhnPqm3KRQ6F2RkGYA5SYo+gP0qZO8DOSC0qI=;
 b=tWa1BoBbcJ6rkFKlCds78kZDUl1m5bNA8kxHvxMZCz/FLpxANyk0utvFGEd/2agEQMUURdlKHbWEMrKY4ae6Ll7XKWALzSCaKyQIw8BRSUCq4GsBLYemblvs3MVwfm7IGc6qUZNFdbvBEmcU5LmNfSuxEIJkOSOlJIar4ynA/cz7yz0mZzv1csWmltYLH77uDnJrqBPY3VuGqu6xXKs4oO9jhu5S6EuJyFWA8yGUP52QXJPM3/BtTBe+HTQYO7CFf8L5svyZM8MIPmoooyTlYncibLoE6D9oI8Dgr9lHNviQ2F9BnLHBUdw6kXmCtaVuR/SsllaUFL7GD8W9pDgTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnmoKUBhnPqm3KRQ6F2RkGYA5SYo+gP0qZO8DOSC0qI=;
 b=JqLVYJv9t/MmianJCxx1IYzqAY/PciNIWo7vvBq8vgN0FZ5EwdfNyaK0LozJSF/oPCTnpbTz71hJO1w9mXKkb0ByjNKvD42c87/efWh9ZJmEVwiGcCeY2O3JJV9GzvYVKJRpkBFsjgF9PbAAvCKkmBF+jhjfWkfE1pWtN5Qlvqk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Sun, 4 Oct
 2026 15:16:11 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 15:16:11 +0000
Date: Sun, 4 Oct 2026 11:16:08 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH 1/3] x86/mce/amd: Fix bank lookup in
 amd_mce_usable_address()
Message-ID: <20261004151608.GB2673@yaz-khff2.amd.com>
References: <20260903142049.4126599-1-yazen.ghannam@amd.com>
 <20260903142049.4126599-2-yazen.ghannam@amd.com>
 <20261002051942.GIar8-7qT6l3mUhofX@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002051942.GIar8-7qT6l3mUhofX@fat_crate.local>
X-ClientProxiedBy: BN9PR03CA0772.namprd03.prod.outlook.com
 (2603:10b6:408:13a::27) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d5c0f9-b325-4c97-8f38-08df222a6c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A9n92OcNe7EIkv2+dCa/SMM0f6IUcZ6wSZsYBXx8qWXtIBeSu+ivbC3sORNwhWVVpK92WQXG7wpMbDBXvRYweWfRUTOgLQq02vzp2Copb5drOdkCmpQ2uv0NE4hKUnFTy+6dZwKGmm0FAgbkN52YRxv8ZPqv56SPxzsjPQIIn7CRRO9wdK4axJ9zc9FuCNuX98wF2gD3syTzz2lcCNbY6869GRdazSJS4d07UxSfxUVOOVFqV6qaIvrVktdLX9O4wiQFWbwzGyW2isGyWtm4Cn1T6Zwp1km8zYA5erJczm0zQncJ1tBK5z3Mk1ZwgDiyP5G9e4d/G10qcPbNhuDxMiJHx/dRjYrBmG/71nRFVsnrpuh5fR8I0NBSxSjwptnxSvG6VKMqJ6NJQQ/kqgIl8mJFDHIH2iUh02CM23puSEFQS3bMcp4oBMD9OaTdvJeCrNFVSRr+GBlScr2Mb58fy9F0dZZVioQzfkWP+3IWGJodb6gqnYGfnzsVHEsy/wq0wY/A/D4E2tK9QI3EYjYVEUZpwGVUOgztf7C0bwhVq9lJNfFqJZPKTMjY9c/pJ/7P/i/cGx8rHPo8z45d4vX3rU+hpMffg/S4b2q4TuEv/MSF7S0NRhb9HP9CqL7la7KVGnSNYdUfxZJuOQrSW6l+mogAKwkAIhtavxyRPwKSxTQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?344AOrDy8ZJGnx4NmyzwvouyYrsQ7lERTOMMmzoHruQOxNR4hmGGwi2GWbyD?=
 =?us-ascii?Q?dyGYmOziR05UxBBL3P2apyB3ZUxQ34A/GI7MxHAtZXXN6v38/YGNpI4I8Q+d?=
 =?us-ascii?Q?OTVvZPMLpeF6gWCORR0FWLy5Vw9SC1XDp4MOjulgt0AXHqMOysCJ0wectQYR?=
 =?us-ascii?Q?mdiAKzxZSJIUly79XnM83xmLpL/eXDzPeQA8owx3b0z7CEJ5cFgOLaTzoyRQ?=
 =?us-ascii?Q?uNO4eqMiIBcKeokpR/TUJa9PsIxB8eJr8y0UjKCJNw9z1o8kXxLkYuV7CNXB?=
 =?us-ascii?Q?RanJY9cRt5bth7S/UpZB7OxSdgkApQ5jmMZ/A1oq3MiPJnSAhm16fZA9tAm5?=
 =?us-ascii?Q?4zYYp392JEqWkM7O3osKlYe4+fALE1BicnJLhOdISIJCyJErroT7KKgXnj/W?=
 =?us-ascii?Q?3fdQo9mun1JHa1/VYpmy4CCNOBvD+45H3yfAMJKCcr+vsmW2scDIjnUKhhpG?=
 =?us-ascii?Q?j1ATQo8Q3BhN1S2fP4TC7mSjJVkiyYFW2hPQHDQFpMHW1YFzE/HsfwL6Qyzr?=
 =?us-ascii?Q?KuWQT+vj2BxFGTjeE5lwAkP2eyJILEhZ4c2aaFgDdAGzxZQbEJEHrIoXaXqt?=
 =?us-ascii?Q?kztT2dvvf5X8skJUsSDQ78JSVRQibbrWgXACf7l098Qa8CEooGApqzxj7ir5?=
 =?us-ascii?Q?VOfPGeR3wHsHSfZ1XKkpcaMbVfoz54URK47cG40dGyUCsSHRxdpEBZFGRV4L?=
 =?us-ascii?Q?iA49fFCcrUerjwxfyzGjBQfObNQsA3oC4FgDpYb07ENZFJZJJ7RKeRo1f0d6?=
 =?us-ascii?Q?+LgEnPS91oHyN5byuFQBMtdogys7vnIgi3bXDllRD37zZX02+wZieyNcwyMG?=
 =?us-ascii?Q?pHGsmG2HqOvBYZHpFJIDKfL3i7UQym8HeJVNE4dkQytQs8mpvmaQj1PmVZLe?=
 =?us-ascii?Q?sW9zoTGOnpFLG7OR0S/tZqE1/4Omgl9NH8Mr/itj4RX13Ao0VqBAvhg8FO8Q?=
 =?us-ascii?Q?zJTBt0f5KCwr3mzNmQ6uCFNJAFxFMOe3OyjR2daaLd5qwhLPaUXKo06DpTM/?=
 =?us-ascii?Q?aevxF563eZck76L3FJJpcxIrFo5hcda4yRbYQ2XI+gjdIPaBGGeCQ8STq15h?=
 =?us-ascii?Q?E8xwDENWKF32bBkCWeHYaqWuWV2RTXMYighrQqfQucHRDK6cJv/qDi96AcsQ?=
 =?us-ascii?Q?xBOLZp6PygnmbFPfyOBNSU+6z53mfztj8tfkdeaWnEFWhy+iNql/k/HqvV8s?=
 =?us-ascii?Q?IYH0PMprRKJIkE97lJawHV9AcYnx92cJSBoQjfXELuUEaSbjcU4eSktO7q2i?=
 =?us-ascii?Q?Vo+Cp8Xd2Zd43MZBm0SMfWxAXEfqE2hAIguztOKA8oQDjCb0Az1vzYh13xnM?=
 =?us-ascii?Q?ErNQVTV8wP0RSmrJoifsnZPlCbi+Ij/ebhi9ePBhUWOZaZpu3TA7OTf6dzp7?=
 =?us-ascii?Q?togqSu9TRnXd1O/eVgk3bXDk/4zQbF5hLS8k/+8wyY6er/OZnE/V33g7VkJu?=
 =?us-ascii?Q?L3QOiCPjfHXCYFFt4dZl2IduEukGJjKfY/4z4v88iexsc3yJj/L1Zd/WtVJV?=
 =?us-ascii?Q?5k73YbjMmHvWGv9TaB1Wqp77YHFsTH3wCcZmoGhKVHcT6uWZvUdax0/O5VYV?=
 =?us-ascii?Q?c2pIIB42txZTIiuBqB2a/8gBxGlK0uTouILB3yj4tMkiVurNNv4Qx2H4qTCt?=
 =?us-ascii?Q?E7JCzSTQLiRqxOZn5OZlJtPP4B41G2kuJCFKb4eSZcGBRs5+P/h4gX1Alf2n?=
 =?us-ascii?Q?qJ3HLAGiPE9+1EMTYxuFZaIwcplvL3yH4T7l/hX2BBx/V92M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d5c0f9-b325-4c97-8f38-08df222a6c87
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 15:16:11.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PCJc/W1AXZOrNq518vgCKjD9fovaD/SKz1sccDTlM7ocBcusbKewOM8EHKprnGmLoR5dklSWDmYWYW+4zYZ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518

On Thu, Oct 01, 2026 at 10:19:42PM -0700, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 09:20:47AM -0500, Yazen Ghannam wrote:
> > amd_mce_usable_address() reads the per-CPU smca_banks array at index
> > m->bank on the running CPU. The index is not checked, and the bank
> > belongs to m->extcpu, not to whichever CPU is decoding.
> > 
> > m->bank is unbounded here. apei_mce_report_mem_error() sets it to -1,
> > which is 255 in the u8 field, and apei_smca_report_x86_error() takes it
> > from a firmware BERT record. Both reach this function through the
> > decoder chain, which runs from a workqueue on any CPU. Bank counts
> > differ per CPU on SMCA systems. So the read can land past the end of
> > the array, or on a CPU where that bank means something else.
> > 
> > Use m->extcpu for both the bound and the lookup.
> >
> > Fixes: 821f5fe4dbcb ("x86/mce: Add support for physical address valid bit")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-5
> 
> ...: LLM
> 
> For all three pls.
> 

Yes, will do.

> > Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > ---
> >  arch/x86/kernel/cpu/mce/amd.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
> > index f916fb4c5d13..e6542e00dc5a 100644
> > --- a/arch/x86/kernel/cpu/mce/amd.c
> > +++ b/arch/x86/kernel/cpu/mce/amd.c
> > @@ -837,7 +837,8 @@ bool amd_mce_usable_address(struct mce *m)
> >  			return false;
> >  	}
> >  
> > -	if (this_cpu_ptr(smca_banks)[m->bank].paddrv)
> > +	if (m->bank < per_cpu(mce_num_banks, m->extcpu) &&
> > +	    per_cpu(smca_banks, m->extcpu)[m->bank].paddrv)
> 
> Except that this conditional turns into an unreadable mess now. IOW, split it:
> 
>         if (m->bank >= per_cpu(mce_num_banks, m->extcpu)) 
>                 return false;
> 
>         if (per_cpu(smca_banks, m->extcpu)[m->bank].paddrv)
>                 return m->status & MCI_STATUS_PADDRV;
> 

Okay.

Thanks,
Yazen
