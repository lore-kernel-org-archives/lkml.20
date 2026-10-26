Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793016182;
	b=L6zRB1QpNFGt0ACIDKcMxY/PRrolgVdHxigBGr69/fsUHB37yqFIZdqcQccOi4ygu//s
	 3o045XA2EddYetA7RuPYeADtqSxCaQa8MKWQszCkJP1ZZwd3JZdIz1dknKorloLfzC7dA
	 PYyykWE2BmR1YuT4NiadI2+nw8IfaTIgd0tRMOZXJe06fa5P7YulFP7ajOXAJ3FPNbdLI
	 QdCzPH+6ARdzohaS97KKC41UauLYydM8DhKFRAu2cBbj8uvXhcyqsfNlxlpnVdsbQ2QpY
	 Rh6a0PBIPZCMzMOF3oBhe78Sv1gcmnq/PWUN1XQfu8anw05wuU8si6OJ9dyiyVIqtRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016182;
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
	bh=M6YkhSoM6h6rfv1ateNJDi0d6hmf1Rd14u1CuPWAcso=;
	b=GYLi+ErEPGPlrnslVD4p4bhRs6jg05zfXcLzmwkvWEZxKRyL/QH4JTRP1xbNee4cCF5S
	 mXLPsPPJUJ6ohdPOm5RVnfwe/35Gedje+fDJqGVLXmNzMMBHg4wHbjTcBV/UxbIrQR/7G
	 BdGDJunuAQ/mNYTU7cxa3r5yYlwEIXdeZHv7mKkGXisxW3Aks14pJ4H69l3x3ZUrkvclB
	 4s1AMIUc32cIp07DohsTC1zEC8lBidShk7VmE8pJMUM0vOP6wOGfmj9fvEy6QrQeGtBMj
	 CSeYyMI/2HFmdYNzN8CeCY0hjDKjg4nZkVOaVeoQZgGJ3AqPhWfW5pKRgXjK/c6zmqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nJrvkGsM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.62
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C8C60A2630
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C8C60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nJrvkGsM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGjoxSV3Otm8+1uDq3ZGJc+uW9dem0yfgQiQ67kxhzgslpzhIpVJME8t+0LAi/McDhzAzClNPPdBSQFemaTMpYvZ65qEX/GmqMsyyebE/+Kih87aFqaau5y4RJ0gqAeoZcC+Rw8LTc/ny/EhtRUxM+5wMQQBbVdhqZX0FZaW8TFW6l9QTuXL/O3mTFiHtvD3pjDsOYSztNrKzExQPoRkkvfJK+3e/7zi6WIhfIiIovFkhufYECr54uiUe5AbjBk2Jcs6woIrJpfBwoxMAfqxU2lewFRfG2zbKMd2and5oPQEyRg5Vw6K5lkOGE1g1hXOZA8vIpeGCMxIwBaO2WZmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6YkhSoM6h6rfv1ateNJDi0d6hmf1Rd14u1CuPWAcso=;
 b=HThzuIzaI3WgWgw2jKvn80UsNUAjEHh6XilEjimQTfhMxXD9bhbwWCz1rM1Nbiascumwy72Hm7gnSNOtqT0Zsenh+80uG90SuWN5PrKV7WSmLhgHqBv0ARx/bM6OEnohe5CG04DLJlMcW/sLovT4rM0EHuGyPJywI9E/FxKK4g0yOnREL+Hj1HZtllyEqI+CW8+SKb3FHXDKnmAmD6HLrBbqGlMOUkDqLiSONNehrRFTkecbLEutKpFPt0wjeAJ3KuHhm9xIa16jOzfHCUFG46m7wo5sKH0jVupvitKaFqTfifJro/nktrMP4xdS0oLu0J7s9s6Kt3FJZzjBLkCYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6YkhSoM6h6rfv1ateNJDi0d6hmf1Rd14u1CuPWAcso=;
 b=nJrvkGsMngYMI9oEggUmnozKUXk/SqGhLEij/B2bdv92cLH+bziGmbzml8kFrcX8s2qkJHhywsHxOEUqfKUsvQIXDAVfwYjdMH6Ufy4u/RRVxDZeGZq3deCbX81R0yLwmTegcYEvnGEept+2BB9NlmHPfRu3Io4lQWUBB8n0lslftHninXw91rG2tsYk+vOMfP2Z9JxZL0d+XfINpatURd/FTben9O4P+b5k0easobS6sF880nsehSQa0QOFq/7Vt74lVk7QWLPVY1iXZ8LdCKtG7+BssnebbDE1D/nqVX4lHwjAmdQeh1dpLBV7rNTY1tqPnShav1TBF6vtk8s0tg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SJ1PR12MB6147.namprd12.prod.outlook.com
 (2603:10b6:a03:45a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:02:51 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:02:51 +0000
Date: Mon, 26 Oct 2026 09:02:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, nicolinc@nvidia.com, aik@amd.com,
	aneesh.kumar@kernel.org, seanjc@google.com, pbonzini@redhat.com,
	yilun.xu@linux.intel.com, chao.gao@intel.com,
	vishal.l.verma@intel.com, kevin.tian@intel.com,
	chao.p.peng@intel.com
Subject: Re: [RFC PATCH 15/15] virt: tdx-guest: Accept default DMAR entry
 during PCI driver attach
Message-ID: <20261026120249.GA4002401@nvidia.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-16-zhenzhong.duan@intel.com>
 <de19ab97-c86b-442b-be23-c921c0831542@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de19ab97-c86b-442b-be23-c921c0831542@intel.com>
X-ClientProxiedBy: BN1PR12CA0027.namprd12.prod.outlook.com
 (2603:10b6:408:e1::32) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SJ1PR12MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae823ff-95bb-402c-a002-08df33590f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003|261022105027099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	Kik3Zuz34Owmm5zFItDygLhkAjLHtv9PhsTtDjRkeLUQopfPmjxSO2DY7VjdkFDC1ObYS75ctPd2+2TiL5Ft4hXATHu/DGhBXuJWuz/Fvmxwg1koy1qinqKCAqY4/MpvR84UtF89JdqoB50T01KMdDLB6rYAVzio30ZaJb40KJ0aOSwKZPLiocv6E7ZSGiIV9is01ShZMKYb/lpUk9QT+NIBDjYYU+txrDC1R8sVIlSS/2pc5sE1Ywsf4l4JZuayG05zd7kF8s0KZXwaiZ7hkthbnNqiqcuif4JwwyEJd9cyjNkiSL5utYby04PC8MHFJqxw+oBW+oKMWq5UuA32pQ7zZlgt5sWrvpWGVGdN3DPEq7pMPEH5e7vfxO78iZyuWriff2YYu9c+jwy4jAoP4BRYd6BlvwJ/5k0LOYsl2354Q3Ghp5qqOc5qe+etrwnB8dUlj2hmo8U0PLUavbivvhVMMn5wiYO1VJA7xsmPngUGhr5k508O5f8sc9kOLpWkzZ1qM+CPCKOiDeJ4wlA1gxrnQK7EJonFudOFaJcIURV06bmHWUCA+KNKYCuoysmY+Yxz+3Fh94e/oFln0+TzryYaSZhQghGA/3VVqM7X+bcDUHSJ3kjIxD94ts7p1HZ2J6u/bTbvXlTeQ8CAHczYov3rU2LUuef2xBlErqjbohE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261022105027099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rCLaQP9p/lBdoObRvhnpA/NhCVQhD2fP5YlPB7biYgwkYaJE57uoLSJSMswR?=
 =?us-ascii?Q?u2d+7TKIJkfAROCiMM7VNT9/Xwb1bCxjdv7WN0gCyojVDcRGyQgbsfuCRfEK?=
 =?us-ascii?Q?kfH2nwF5Tpq8TqE5Bbwrp7L1Vt8Cvz+nCUt9MhkNBm4qZS4bgWV2R4GvUorI?=
 =?us-ascii?Q?kH0BmB7l5q7nJ1APltPYTF2TooZjCLnMj68i8skT/nZwoLVIPvNfjFcu0uIF?=
 =?us-ascii?Q?YJvW9qa3m75aM14k7Orj+DKsKYR+R253wZyPTlzSi7jDP3tzIVCFKH1MCV30?=
 =?us-ascii?Q?TkOyZmNJwPTwUAbajZ5F0loKkCEUL+GKRhDe5ATv4dIV2cdzyOpsPpTsvciw?=
 =?us-ascii?Q?Tf+QnPvMF8cDm/S4EQ3jtW6oyFyHZEvIq20Ph49GGRLXnLdVrArPYAi1YdYI?=
 =?us-ascii?Q?H0Sr6qLnCD+NJhL2gxS5o16dlaRlxjNlL6+36K4wTY7xe9Qxae3SI89RH9Dw?=
 =?us-ascii?Q?E7ql5ylnYBaGAau0P7dCxt5v3DJxOXTrdCG6R+4hlesuMq0RyTubeDxG2Sdw?=
 =?us-ascii?Q?U61pcMiXjZPxkU7CEtleKOswXDpulM/Cx+G8vcJ7UajWbf+bo1YC1UApdTnU?=
 =?us-ascii?Q?XfmNWE0VrJEkGuLwLWHEWIugbnN/VjH5Uo/1m8xU+0tOsbJuA+ewUSZo9Vj/?=
 =?us-ascii?Q?qYqix01PXmAaCswlrUGqXtOSM6dZ8V15AwGR6GbY5qG8pzSQIhGkeMScILc4?=
 =?us-ascii?Q?b6H2NttVXq4GKG0zKAFBCDWFy+lsUDn+dqFSirM+m1O70zR7vXLiDMD+8BvT?=
 =?us-ascii?Q?ERDHzg8OIDjWrXqRUo9o9iymSHsKvtAok3K3SQaxwzWCQmbO7naU0bj9I0zr?=
 =?us-ascii?Q?H9Q2G4XOGjt5+6zmVBAK/WQr584vpEEvbtZiF9MeNI4mslNHw4iV6x/FSn2s?=
 =?us-ascii?Q?VAnkZzOp9PZFE+Pb+Xoo8OdN7JPg5PJsdbRo+7i9VhByuMRbLVHf+ci4gqSh?=
 =?us-ascii?Q?wH2rjdtZnj/pWQPxJTWef7qA2YYew0WA2pe3mMM8GlEWT7I8hjaGD25u2bjC?=
 =?us-ascii?Q?B9/abKhuzpUE7DYCfF0aYbeTacJzA/PkNd4hn3S+vLvy+mT/vs6NME7+OVVc?=
 =?us-ascii?Q?bDnApvnS2j3vCMQWbjmLKUd6fzP9G0YngAT6xoZWhxJ7wGBw6FaAJF2Aco/s?=
 =?us-ascii?Q?Z2rCNsh3DhqQVTK0BegIjRzv9tFskLlTEnd7jogZpbENzMcZyEzdGFPT6QkC?=
 =?us-ascii?Q?Lt4NXugFsqSHbJFoFIF58HTmj1xDor53bTGtBtPyagieTSJgTGPjJLEFjHNQ?=
 =?us-ascii?Q?H6FDH/YmAKPrvWJIf59Cwd+Ty+N3JPjh7UF05cR/I+P/DE2iAQUewv2mB2un?=
 =?us-ascii?Q?0JpDEg+Wc3lIegEzBL1YN+q2a+goXIXfxmT0+Cocs2yMej/ufK+pm08oUQqs?=
 =?us-ascii?Q?/1mv31AetDvqcoxz0YiVi2rben715fN01aGN3+dl8c/VtjUmbJgZOQ/XmCPx?=
 =?us-ascii?Q?lQiwBxQL7/MrFmgLQwLC4PIonvfAN6qYmot3TmQalMxDpFEGEHzm45Z8j03m?=
 =?us-ascii?Q?ek98B+mJr+ocNVrdKBZZG0HenZkpSwbp3b1N01sAWVCktTTS1Cs55fMO+pWh?=
 =?us-ascii?Q?pLhr96LRwah8c2paAvOZLBnKKjSxPKgOBHgDCB6ZU2hdGk1+To00I0lvktwx?=
 =?us-ascii?Q?TdSdM9NaQijIiNMt/trtUTNB9ADiU/r3p0Xw7yVPxaJUda9ZR/+OwCTsmOd3?=
 =?us-ascii?Q?MVwfEntDlDXEXW1zQGpHgfUFMpgQ6/xivG34f+nv3RupPX/F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae823ff-95bb-402c-a002-08df33590f6f
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 12:02:51.5106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wAt/CMQx4aXrnKlG8wmBtoBAz2l0SSuIUDKWJy5xfSNOu5DZhrZQEM7LbIrcs9O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147

On Mon, Oct 26, 2026 at 03:49:30PM +0800, Xiaoyao Li wrote:

> > +static int tdx_devsec_enable_dma(struct pci_dev *pdev)
> > +{
> > +	int ret = tdx_mcall_dmar_accept(pci_dev_id(pdev), 0);
> 
> after going through the series, I have a basic question on guest function_id.
> 
> Per TDX connect API spec, TDG.DMAR.ACCEPT, TDG.DMAR.RELEASE,
> TDG.TDI.MMIO.ACCEPT, TDG.TDI.RD and TDG.TDI.START all require guest function_id
> as input parameter. However, the guest function_id is specified by the host VMM
> on TDH.TDI.CREATE.
> 
> So how can the guest ensure pci_dev_id(pdev) is the value that will be specified
> by the host VMM?

It is not supposed to matter.

The VM sees a device composed of a bunch of stuff: a BDF, some memory
ranges, IRQs, etc.

It locks the device and then it has to query TDX module to confirm
that the memory, etc are all part of the same device. Mismatching is a
bad failure.

If the VMM is messing with things so the function_id is mismatched
then the guest will detect it and fail validating the memory ranges.

Jason
