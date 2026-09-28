Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011034.outbound.protection.outlook.com [52.101.62.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9A64DD6C8;
	Mon, 28 Sep 2026 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606330; cv=fail; b=bT+1D9WrOHNxCbji/7eG2I0EPrhlIEucuhNGhHIyqhucvFEdGtgnlbGWNfCDfNe5r8sNmcQ2S+p/aHP7op+IEQtW8Mj2wN0Cj9UsNMkxJj9nvt8MGNTgK4/+j0V4yAxdt5q8Q7z1xzCqP00lZFZKdJdLPtiCgZFX/iIGWuekU9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606330; c=relaxed/simple;
	bh=+OiUH4iamG92h/HOxEIgd5E/ZT8/s2qNJ+RpJDLiRdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aj3lKjCarmivsTZRlztuc2u6GfPREfnakitgL/fkSMQisRYfFvlkBKcG+rCj9Q5tzpJpxrLFJR1B0unC0/uN59Sq0pHtkw6gi10SW8G93weWcznOaTcIOGu4H+ox9kCv5NHOIR5+INdT74RleWNoGeM/xJG956XrN1MfW/52ekk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EPLuwYG8; arc=fail smtp.client-ip=52.101.62.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EPLuwYG8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJBTtEF1Lob7qp4FW7eR7Z0/5wVSWeIAr1ichIDkwhhGIPJxBUrpvDqPGM1CsVSyWEeRQna7mCY1Nt8DnwJcjvqG5E1Kp1uhtyMfA9LL4voXIzMcL89g1hGwQBZvgpWY1sBVVXyGDznHV7NrWQK0W2RtvFLl/cZpYSd+tlTaWWTDij4s1vKbcxJNI2ZIgbb+iCy2oGecaAzZc2NltZ5kBfXs+kEz9kHInAuv0PBgezUWLlfCvLmFTI53DTvgbUyllhEIRuCeQJzl6SA5sZ0QQMW5JzRO0iBm+1QutPxfF7WTmqC3THhnuoDE1kj/L18/yJ84BrENu4w240v7ctcTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX/ee3XUb1L9EoRN28H+KT/iqn5U5wgXa39CwHnVHig=;
 b=xZhsJPG4F3toSBtwx1nlA0vPthEESfaos4duGfNcIKFVCp2muIgv4IEXuXerl9znr0sH2Lq1brhWeXA5u/l7XQV2I1USgwpZJVHVqbpQDlBJY1CaEot7dqUZ4Y90DFznM8h/J/PAAfRcBHYger6+RKFLQb4W+reNhWUezngNxYtqeVjTlnYOhg+1UhzGTf0IQ/8WDlG3orxsfuL1GlnuarRLYFRcga+kaC5vOFCCMMgsp44NX89JgVbaQu2qQo+iPjVeqRTw9D0n/8ev7vp2VEk1aRI2BxQF14UHqLQGnv7do8/mYTh/dlUEX+jQflv7m6A2U1skOZ4CET15OAUnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX/ee3XUb1L9EoRN28H+KT/iqn5U5wgXa39CwHnVHig=;
 b=EPLuwYG8jQGA37JI/jvBI3ofxvYMr40SOGecwexJHszKM4wjUioPSicWRsu1tIAaLiPvKtjYBiQbHN36sSYFosvf5dSjDh5GKKQbPApfAUd7uFJ3/191jdgDxwAsqwAbNGaYUQcbs2jBq7afv3ifK/jqPppGg+7XEFzvq9AnZRg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.23; Mon, 28 Sep 2026 14:38:29 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:38:29 +0000
Date: Mon, 28 Sep 2026 10:38:21 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Vishal Badole <Vishal.Badole@amd.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] EDAC/amd64: Mask UMC chip select to the four
 implemented selects
Message-ID: <20260928143821.GB2289128@yaz-khff2.amd.com>
References: <20260925172639.97063-1-Vishal.Badole@amd.com>
 <20260925172639.97063-3-Vishal.Badole@amd.com>
 <20260925181429.GBara6BXp_J2rnvoOp@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925181429.GBara6BXp_J2rnvoOp@fat_crate.local>
X-ClientProxiedBy: BN1PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:408:e2::30) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0c48c8-1449-40e8-239a-08df1d6e298f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BCHMNv/B6YvTuOY//qN3ONxdo0RiWvWRxaly3Lmce1sIRfxXFNZudUzyzAHMk5G2CpA8WrzJcKxNplx46eAsvKLwTE7EYWdPY1tBkACacK6l2EryM8XC0y9AlHe8jq5sf2fR7ILRKN6Sa7wPhAi5dKqSZWURoL+StfzHUQNDkbZAvsaDNnSsiKYHJ2+mclN2tgji3xJZdJcBcnBj+5p1QJJjCkq1FWs85sRnEGKDykBwpm+cejumP6QSAGgctqw2dWGn7kaLd2TfXWPcPSUzG8wqBWPgPUIDGCfUutmh944brgIuBNLaCvFNtsT//pera/C8xhtesLhkmqWIFZWPC+t5ebdCzaxEaMLu1x0WrDnwsbj/6YaoDxAtnLmQPfOCsLmDJ/g2P/SwAfqE569UokEY0VYBDCJ+LFmrymDAZK20yI2m9Jph1a3udbkVukj8SDJh0/2S4i24fIp6SP2hHKEheBZyhdWpopfzs0cXl3mc4pnVNCbgdpYNUDqejRJBp5TrAdkDKalO/cAIUZtWxDc8Ff3My415hrGqROBvZr6WIvmoj9eFg13oD8hVZasnosy8bGDVDgtJ3Rh1PW49U324LBd5/5CVVLHO+fk0nkwYsMzWTXJbGMbwHeN7PyKSOuaG2VgPMNY+eYPu7nE5pLADcDbePbX4ZWWgIaK6mr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qGZai4vwkT/4CNJjLmXRwWr9dKyGDLCNiIDSxyI2wp5ka6GzGue2qLWv4L9L?=
 =?us-ascii?Q?ORBJsdRMwjxJH4qC4sJgMGfrtP9lMFkE+S1xilYowRCi2LZnuAl/gviHXTfY?=
 =?us-ascii?Q?6S3Mo8mxwO2TNnTjxF7TVy/KWqRTUVGEp2FLmRRvQQcIF7ldeDS8V08EN92e?=
 =?us-ascii?Q?wV4kI0BIyBQ9+yKqJO084/Lrb7KLuKdoKjl7ddZ0fvww51FRjPYWv+7SZn/7?=
 =?us-ascii?Q?BMf+KR1ChCmAD7T4oV2W9yxrFgZfSjPAA7BRd2tPCacLFIVtt7lZld6Zh4IS?=
 =?us-ascii?Q?H9lXgpHPAvioksrKTrPWWZgpdQxHAS9KrC5aGfYdFb4tS1R4Tg0zJqjyjfQX?=
 =?us-ascii?Q?PR/8O6XJRnGiXjWAO+kSEYq4aG/Vx3+QNWHEx7HJYcZJYwfrE24StHOPmvTZ?=
 =?us-ascii?Q?+9AiVtUSUaGd3xvxBh9U9z6F9Qg33uEUgBCFwQKFBrf67chJispcUwncXz7Z?=
 =?us-ascii?Q?IY5eIqtZMiMaQOfH7WU5JxfCtjLSM4VXjWdIDil8D70qe3zE7KtewzxukBzu?=
 =?us-ascii?Q?CKWeH/PggtLyW8z8TC5bTa8t1Ox01U/MRGXQSbXFkkrJDVNVg2DOOgJSQLKC?=
 =?us-ascii?Q?BjfafZviwYzhvmUf8p21dgPBeF9FJiurYkZhFqDY9rUv42wOhZO88WtJl7O5?=
 =?us-ascii?Q?/hm4f6dfouVkvhqHQET5iCEda3b4SyyvqukWuPhow2ZPINDydGvXgM457UTg?=
 =?us-ascii?Q?DL1dUocLPYosiyC9H7+vJbqFMrCbI+wjlvK3X4Ad3a4Tv7/+Se6dbIN2SP+i?=
 =?us-ascii?Q?/ERHpfqky2OMG7eKT53kLsTlSJqS8Lsgahqn88JstIA39L3rtV2huNVnkClD?=
 =?us-ascii?Q?6szi4BLgayK3dMiy9IIxOas185ksPKo15lPqmqrQNWfJcCYVqwn+lnHcNgyI?=
 =?us-ascii?Q?ThoD2fdYVeu861Yuu/xHy88BrhpqLPW+uhKg0Vwy6IJCmR41SopuUuw1ISQo?=
 =?us-ascii?Q?tQY2vdvIkAiaOKdlv5EElMhaTTLYNZE4rgNVZRAxomASB06KZi1ZWJPFZduy?=
 =?us-ascii?Q?ByIvF7Zz/f5fB/4ZwCZQY2tnV68cGv1F81ecuErVQ4q51ygkrx9Iv4OmMVqH?=
 =?us-ascii?Q?3HHt3H1/H1CqHWDsb/KCRE4eX080yhO1zTDKbr9FSxBKECecdYV+4SLIBoLk?=
 =?us-ascii?Q?ZgpCZ/eWVYAiKoM/YHp/BAnxGGbOca9WaNA1JPWnPT7KnIHheY5OtaOFISkv?=
 =?us-ascii?Q?TA2N7k18pV8dyq2XISaHMofuPeuBoMq5Uwgj7Gkis5HP05QiWjeIvrjhmFiw?=
 =?us-ascii?Q?yxRSHcmT3jNFdPQ2BBtKiu8Y5jPyW1HwyuCyUB7wNewmPNSWv0Xe5u0Fjfee?=
 =?us-ascii?Q?P19/wPrGnBJ72urR8n7GGFb49Yf3riAJBOYumW7a/pKqGgCD6G60b8UfeXCd?=
 =?us-ascii?Q?IbtZPuhX1rkcSW5+M6loaa6fzeKeBbDLKP2ldYBIuswgapCWLF77SCWsJ8BX?=
 =?us-ascii?Q?9sKoEVVErx8CYvqj7pFSaxqVm8ccIgs3KgQfZiIz4WWEXImQdaqrMpi4skYp?=
 =?us-ascii?Q?a2Gpvtk5pWb15706P5LA6wnDzvdtKSdKHvLMLprvOWMzRo0hmoZZ3B9mkncR?=
 =?us-ascii?Q?l/wVgPyATk8+INNLWq4oxLpLa4YRcRYCmDxJXRaSHpBDu9jwGX8q+JTFZb9D?=
 =?us-ascii?Q?mybsW2eos+xgRtkYvEgwE+doz2NcqBXVDKDA6P7oKa8mklNNLJVy91TTXIfT?=
 =?us-ascii?Q?RhH6d2BOxGNUwviEpVydV459BCn8m/snKyxnW4KDOHR8V5+T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0c48c8-1449-40e8-239a-08df1d6e298f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:38:29.2635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQVaLCX3pgOzlT8BqVsygnJ19xs0sAlMplLd3WSfwxbz0UH6AOMQQsoeYYUhJJPGlKRWRsrBrVYzvbEj4x4nnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018

On Fri, Sep 25, 2026 at 11:14:29AM -0700, Borislav Petkov wrote:
> On Fri, Sep 25, 2026 at 10:56:39PM +0530, Vishal Badole wrote:
> > umc_get_err_info() masks the Chip Select from MCA_SYND with 0x7, a
> > leftover from Zen 1 where the architecture reserved space for up to
> > eight chip selects. Only four have ever been implemented, and newer
> > products document this as MCA_SYND_UMC[1:0] = Chip Select.
> > 
> > Since only four csrows are allocated, a syndrome with bit 2 set decodes
> > to an out-of-range csrow and trips:
> > 
> >   EDAC MC0: INTERNAL ERROR: csrow value is out of range (5 >= 4)
> > 
> > Mask with 0x3 to match the four implemented chip selects.
> > 
> > Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
> > ---
> >  drivers/edac/amd64_edac.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> > index cab696be4f07..b69c3f51dd37 100644
> > --- a/drivers/edac/amd64_edac.c
> > +++ b/drivers/edac/amd64_edac.c
> > @@ -2802,7 +2802,7 @@ static inline void decode_bus_error(int node_id, struct mce *m)
> >  static void umc_get_err_info(struct mce *m, struct err_info *err)
> >  {
> >  	err->channel = (m->ipid & GENMASK(31, 0)) >> 20;
> > -	err->csrow = m->synd & 0x7;
> > +	err->csrow = m->synd & 0x3;
> >  }
> >  
> >  static void decode_umc_error(int node_id, struct mce *m)
> > -- 
> 
> Is this ever going to change?
> 
> Do we need to track this in the per-model struct, i.e., what your patch 1 is
> touching?

This works for everything up through Family 1Ah.

It *could* change in the future, but I don't want to speculate.

Also, I'm working on a fresh EDAC module without all the model-specific
stuff. This is the sort of thing it would avoid.

> 
> Is this a fix that needs to go to stable? If so, Fixes: tag and CC:stable.
> 
> If so, patches going to stable go first and need to be minimal for ease of
> backporting.
> 

I didn't consider this a necessary fix. But it'd be good to have it to
avoid noise from reports.

Vishal, please do add the 'Fixes:' tag, Cc stable, and reorder the
patches.

Otherwise, looks good.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
