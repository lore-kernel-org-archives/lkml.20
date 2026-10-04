Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096A84503EC;
	Sun,  4 Oct 2026 15:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791126902; cv=fail; b=c+2hevNKjXZpoFNnN8cPkC7yaOYYJ4e3AcFzyd2x6+MpMCYWPwBCEwFa8Vx2GAn2tMvlEgNQxydVOcjbvnvoUPRnZMVr+XQd/hG2Wziv4s/jG6e7udCVr45a3HfoWtPnXfJUmgx+5aAY/R6t3pv6+YiM0yRTbXduAR9Rnnx05Tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791126902; c=relaxed/simple;
	bh=0fpvns4i8WUN+Gb9u+RsTDLeu1J0TbJp/2jTWBBaKZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XrF5pAcdCaeK9elQUgqdE7S8lldzmt+qegzY3fiDOPV8T7YgxH/EqxFx0Fzyp9anCUnVFvAFYNO4JD8ctlTKmKTgtucHZyveP7m01s8sMv05USXKlH6atbWfkVfSycHZAa2IlXk7HUGewTc/bwRSw11IyEXBzdRNriTNIudby9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rDz/JHc4; arc=fail smtp.client-ip=40.107.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rDz/JHc4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyvy/Z5ujp1PDrBHFZP3tdXAPOrPnWcRkQEiAcHT2gteuhRzFdAk2WVrpGutxYstONEoXRYHjwqj6efO12nOgrMo4/YEkHjPLQkk32MopL09kAKzjmXZMc/N3bTfjFRFK/i0o+5Swv/3ZEwIFKYQXrnuBvReI6ERbJYUZb1+EEkDeRD26Yg2yTof1rNO7IlpSR6ghq8m1qcSn+rfI3L5nc1/FSpHO28kDOyCnVoMd3GMnZJ1UPnTAdij5sgc59l8fXjJujFrSiUKK/ZQ4/tLRRjvmzhLHoKAR8rwOiblTePfnSjTKbF12Ep/2fC6tZZhB83HNwOXKK8dgRBPryzbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ajyXyGKtmtUm6fd2xqDrwT7+ljxI18yWwQdQSCqa1g=;
 b=gze0v32nZ+2091nCGttv2k9L+38DcEcPlsSJYJ8BZOm6mdUxVC9PQPEnlWjcbjA/NdpyO9Gl6uastMZa2505JPsh27Cm5K7smy2Lq+xA9MGGH84Yu5ysNRKRB/7An6c1aFzn6Pb7HivA4Nqg7vNMmk+johNi+YV6iIeS7Pn+Lun4jZdh6yBeCchOCr8MzLJJ9OyYERFkvqQbcPXspuka27lQ3KO+Onk0FzuMGLrycHdqz2qdZ0C7Dj2d1LS9FNMyMIfzd8syCygHUpFvvyDqjYiHftO6SdbSs4HHsmHwNECelDK3BShJO/Gpj/p6vYh2eJ6lf0Zbx3sjifJbubRkDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ajyXyGKtmtUm6fd2xqDrwT7+ljxI18yWwQdQSCqa1g=;
 b=rDz/JHc4gI2myIxefE6ruNkZ8kcwzi50ZzrEZniabKIOa3HWI3EaHwcEZbyNqbRBuefH2TmsMJWJGKc3PpiuFs2Ue6KjCfdXxNEleIXLkdem14SAwTn07FKrKWkSYpPSHCIGjTVOhFtbsWdgrkHcvCThfU34WzMM/WzvHV+paos=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Sun, 4 Oct
 2026 15:14:55 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 15:14:55 +0000
Date: Sun, 4 Oct 2026 11:14:47 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Vishal Badole <Vishal.Badole@amd.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah
 models
Message-ID: <20261004151447.GA2673@yaz-khff2.amd.com>
References: <20261002113204.3358815-1-Vishal.Badole@amd.com>
 <20261002113204.3358815-3-Vishal.Badole@amd.com>
 <20261003012238.GCasBY3rN9K8ps1dDR@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003012238.GCasBY3rN9K8ps1dDR@fat_crate.local>
X-ClientProxiedBy: BN9PR03CA0774.namprd03.prod.outlook.com
 (2603:10b6:408:13a::29) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: a212a7c5-4633-4ab5-87bc-08df222a3edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KdvtIT8JgE5t1f4vHyLB0Vi9X1hhkjqsJAAmM6Qsls/yp036k8SAELG17daKfY8s3QCixw+toVnveb6rh27sNlxBm3Ph56qtMe7yyps3BKmXGLYWdcd11jTVJvR3XwrpGdjCBQSESs8QDMQiz9mI52EhaU7VTC0AIFyg9xnwALfIsipfuCHnCDQP2+grx0bqI0EbCZU0ElZLgeeAO95vFt/m/hL4n8g3Lqqag7My30r0OVxT5G70QP3BaOMN6Ix3yaOUAPvJKU5QcMXSXn9pVYr8HHTTYPrpLVXs+mQj3CP4yzpURr6IDn99Ja+cV1GIiBM+0gHFrXwyoHNvMyFtCPUPSEsrwD/EBVBtQa57jHDC8SnyKnW1BsV03voY8qAEJzLRBKcXiJJBO8NcBgU8/rgb9q9b9V5gFEE95GEBnBua875gwUTCMI93zzxEtco4mZsPNkfjaSrcGD9e4BfULyPexMO+mVSlnhX1W/PNN9X2tTgEQK+kr+dXJMpNlQzWwrXmymRE7gvVr2pK+JPXxAg/XOE8LDiJS7duQKgzsLksyMFX9rBNPzO9mGPz3bGZ48/1y6Kdvq+orKU65/LcCcXnJiol5VvfQFE+z0U24tnVrWiHdHwEaOaVFOdbsLfQgnYBOhZyE1S51cPXIiXQcA8U4xHmy20AA+xCJfIFink=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2XPE1OnErzcDpXG2FPpUzMZfyHDuTJbPoB+cdtyGFV30EP8hsr0ZqZw3Ru6A?=
 =?us-ascii?Q?oZRz3ezuT/efVPgmq0ToZQDewBXPdU0hQCvoxf3wfKdnQVkAPkwC/3G94O2G?=
 =?us-ascii?Q?zzR9JSkE5iwgJZ5GIungBNHRHq+sAVeU+yjb/VOOtp0zyJ55akRYoDj7x2u+?=
 =?us-ascii?Q?N7SQoGq+IZyFM8FYBCuvbLoIAuufGmc1kF55YRC/x/1aobxq8nY3F21l8xRE?=
 =?us-ascii?Q?G+zV3sStyhvEdWctVYVxPFXm1TfqqC4fH6qTWuosJIMkHmuUR/ELjDPjnCAg?=
 =?us-ascii?Q?mpPX/FlGf5Jg3B/8uRcDizLAfqj2lypGsdxYIt8VbEqkmA9LrkE7D2qwQtO5?=
 =?us-ascii?Q?Y0F36rmIeE9Odure2WpsVmjQ5weZiCqClhD0fOUA5yhfgUZiA4rRn6IH6aPq?=
 =?us-ascii?Q?uvUz1DlWXY9pnuHwQR6QJUVcSMkdV29vidmz/7XwF674GMt2w4OZozaLiodb?=
 =?us-ascii?Q?dMBHR91p5ZpNnGDKi/md5NHj4/8Hp9Frc25BalF/09BWaQrbnUK4S2xdnehN?=
 =?us-ascii?Q?Tb7J0okD7723Cp0AFY/Geubu8/hpCOGrLY2w7UHZrR++XVRCw6TnUHO1o4Ha?=
 =?us-ascii?Q?snfBJhTSJD4GbhTt4XMiq56wcQJ+XJopzjcG1o0Jj2QlmUblj0TK1P/M3x7D?=
 =?us-ascii?Q?P/oBCNBCenWR3NMaBo7TPY1EXaoWDIwyyKuksdUsMQbC/ksmou5klcRsIit0?=
 =?us-ascii?Q?yTAOpQbxor5VEGZZiPIWYlw4rC1wizGWzChgZaYaI4lhREP/OG1C8hHu2TEU?=
 =?us-ascii?Q?1elfCKxiaT3k6MzKzhs4eGFtHN1wSgGPg1Ndsm/3HP+gBfo8s+nhC6jwF00O?=
 =?us-ascii?Q?3G46hUiN3ndV+XUjPW9dadrAWZ/d8wHiGORAGuqSgI74jnVlQ59U3pbUUBBW?=
 =?us-ascii?Q?zpkdCGJrNSap4W/3QzZmWT23TGX2zXhG/57rp2aBHknbH5TSXS7EvWROr7zV?=
 =?us-ascii?Q?bXDYmvbsIvpBLcgwpZuF7s5RXqRomtTWazuO/bkZnrTCW0ijk/qVZFZ5p43o?=
 =?us-ascii?Q?klqZUtVYRK5Ix6Qi2refAEzv8OnsC1zHNuBb2upu4WZxgWCl79GBntIcUquj?=
 =?us-ascii?Q?6fdOVz7dpKFuBELYWSoEd4GTkDKSkzF2VqteBBxtXgyXGDO1y7/f5WqD8/yr?=
 =?us-ascii?Q?O3OKNTyLDDEO2oJhp2xqQBYo/xti95txfSUplNXxCTDc5V4MkL8TA6npabvV?=
 =?us-ascii?Q?YTu4a+gNb1xRhOog3mFnbgTDXB606oadrKHiSPka4lnM4aOBKI0cTeY8bkub?=
 =?us-ascii?Q?6cu/+Vvm954mlaKrDKVzKHfDaVu0NNenXbnsMl29yc4pL6l1nXyPEC6D5y4G?=
 =?us-ascii?Q?sAWAn4zA3/11/VF2Ai402ZVZpHjKxmAHpe53ZE1erBwL/9mMcVIau8Dlrz1+?=
 =?us-ascii?Q?Y1Ajad9ELtg9zRp3pTSthzf0mPKW2KYURPkA0gwHiDy/uDEny45EVygDkcWs?=
 =?us-ascii?Q?C/xQSO6BJdR/TAsdXwXUQSSmCjhden23k/ebSYsSa232tSSAM2xLh+LjS5+3?=
 =?us-ascii?Q?noi7O6DN7G33CRrfdoNcKzUZMMyzZuqHxrBjHpz7GPzg4uj/qhI164WNLdge?=
 =?us-ascii?Q?E4CuC10DS94gPelOH3e5AKiQVmyjCxVmI+r4OepWL+jl00Zua80WBV5FDGlh?=
 =?us-ascii?Q?sT6oQ5LZEoA+cnmBh69oGWId8Xl5xrqTZzDHuTTbJuORlpx2DnR2xlJ/MJ9P?=
 =?us-ascii?Q?7JwMX4lpa9KH4BtPL44hrYdSvbTC69njtTBSj7Vl87tiKkfV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a212a7c5-4633-4ab5-87bc-08df222a3edd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 15:14:55.1355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJKQoMD0X0VELOEV90qFFs1kfmzfgzkEitQ4GxATHxk8OobBT4u0sugdfvOVRYQ+yL+mOHpjma60O9UVSmJxFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518

On Fri, Oct 02, 2026 at 06:22:38PM -0700, Borislav Petkov wrote:
> On Fri, Oct 02, 2026 at 05:02:04PM +0530, Vishal Badole wrote:
> > All Family 1Ah models use the v2 register layout. Today zn_regs_v2 is
> > set in each model case. This works, but a new model could forget to set
> > it and read the UMC registers at the wrong offsets.
> > 
> > Set zn_regs_v2 once at the Family 1Ah level so it applies to all models
> > uniformly, and drop the per-model assignments.
> > 
> > No functional change intended.
> > 
> > Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
> > Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > ---
> >  drivers/edac/amd64_edac.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> > index 0c0d11c72925..708fc1b4a999 100644
> > --- a/drivers/edac/amd64_edac.c
> > +++ b/drivers/edac/amd64_edac.c
> > @@ -3887,23 +3887,19 @@ static int per_family_init(struct amd64_pvt *pvt)
> >  		break;
> >  
> >  	case 0x1A:
> > +		pvt->flags.zn_regs_v2   = 1;
> > +
> >  		switch (pvt->model) {
> >  		case 0x00 ... 0x1f:
> >  			pvt->max_mcs            = 12;
> > -			pvt->flags.zn_regs_v2   = 1;
> > -			break;
> > -		case 0x40 ... 0x4f:
> 		^^^^^^^^^^^^^^^^^^^
> 
> Why?
> 
> > -			pvt->flags.zn_regs_v2   = 1;
> >  			break;

Because it becomes an empty case once this flag set is moved up.

Thanks,
Yazen
