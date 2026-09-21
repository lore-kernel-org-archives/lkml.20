Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9947342510
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982309; cv=fail; b=VMXw4Eu0atVr9R6ApNEBOokdv+7wJ3GH07Ldmamc+SMltTKfGzGNRNgwm/N6LvQlWjpsXTPrmvO1R0Pi2UvVQ+E0kuvu+2pZ9D+fxTbMHxtEH9yBhe4mN/24adLmxuS/yyH3FvFPoWHLPm/PDHQdnPfoi3WcBDPO8xLyRM4yt3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982309; c=relaxed/simple;
	bh=9r210deUjQX01QzMzNknHAs2B+pvZaJk1JmXzVDf//Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kxtr58Z/WyKvRGXFKZMXkczalqzRyYQOE9J9n9O+D7LW7LsM1ERuXI9acGjqpvOcQN5qkiUY6+qbmvNLqWj9RVhizffYNyhH+gGVEDz582rTUYeBNu2cZVKr5oRbUtek83XzTc3NQGXDOTS8V6uuclHFOnq558KxZUiYmTV1N1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2qdIR6i9; arc=fail smtp.client-ip=52.101.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2qdIR6i9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWjvM7o+KD43DzvzYIe+ycKPL3NcFmVGhHz3eU43+ldJsOliKZkFZ+eQ6yKsp5WcSRmqKsZl36pHLCdGJe+2ibEi3dpZfme+TpgFjERkJKJ+Kk/euicX6ur00u38pgiPmzTOFfvbXxPe0R2DpO4cHAs0EewEK6Tuzvy6t8TnNHdhpggoJVC/dT93Uq0+82HIStHseAjUBhw9/92t+FbRvqrwTgObd9zn49aB50y6mt+fNhmTTsTRxvLHE8CSYfw5laZWOOaQtgecZrIoGSovcm6SwoGsiI5ghpmDJmF32dVa87uI6l04nw374bDELFFqNQqrb16VzeG/CfD039DPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBf/rxbNAT+Ejqqz5xrSdIM3R7P9tHJJRcSUNqkCKsU=;
 b=jOZPIefyA5ZYIgVFugr/SU8aN9BRoxeDX/vtVX4Bd9vtwfZolT6Xkmxng99hFBhYFh6SqjEam8vyPa0JQPz3JGFmgB5E22vnZDputHLokHFFPCCCyGuFLrPN0lTDcro9gBQyEEV5cfmrAwpa79bSpwl/FmZXYBF2lBR2AIZ5fD+MVBQsdBtjyGHmx1oztIU2VeLpRHbLR0MgMcLmVuy7a894Ipvf1i0J+Yz+X/s3znVryoQUFM34OOuusAHVZ1lrp2yXsFrDospebPB2yVDD/ryPyjEbBe25MvLRL4hJMkNrfgw5dpVgxI/nF+DlLqj4Q/kw/6dEmeQZOmdWBM5SOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBf/rxbNAT+Ejqqz5xrSdIM3R7P9tHJJRcSUNqkCKsU=;
 b=2qdIR6i9ufZvAa7aN5f6EPAUQb9UERJgRnddAhb0BRIrTamMwloAc34Lyp24pJKLXbAL/90LBNIcdUm9DlB389GMlTbmCQQnUeCjbwdxVEnkxsf/nukg6E8/hz+f+4vszL+bxZF846UQMxXWx3fIxZ3riqBFr/VreRLSEq42azA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) by
 MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 09:18:25 +0000
Received: from DM4PR12MB6085.namprd12.prod.outlook.com
 ([fe80::9d84:7eb1:a785:bda1]) by DM4PR12MB6085.namprd12.prod.outlook.com
 ([fe80::9d84:7eb1:a785:bda1%6]) with mapi id 15.21.0406.007; Mon, 21 Sep 2026
 09:18:25 +0000
Date: Mon, 21 Sep 2026 11:18:20 +0200
From: Robert Richter <rrichter@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Naveen N Rao (AMD)" <naveen@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RESEND v4 1/3] perf/amd/ibs: Limit the max EILVT register
 count for AMD family 0x10
Message-ID: <arD2XOBh5SQnKjof@rric.localdomain>
References: <cover.1788425679.git.naveen@kernel.org>
 <b98bf368f4c0e2af51ab8f9dbe3acaf11ebfee40.1788425679.git.naveen@kernel.org>
 <20260919034035.GDaq4EM5Z41kzGVw1i@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919034035.GDaq4EM5Z41kzGVw1i@fat_crate.local>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To DM4PR12MB6085.namprd12.prod.outlook.com
 (2603:10b6:8:b3::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6085:EE_|MN2PR12MB4375:EE_
X-MS-Office365-Filtering-Correlation-Id: 01cf3a90-516f-456a-4698-08df17c14a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|5023799004|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	/5sffgGwDaflySfN68jMnPBx42dGBHXqX0K5JekS/IzaTzQrEjdzF9hON2FCNeetEXv6+6H6EAcTEhAjMGs8VfiIqQ5QpYv6ObJeNgxzyrti8GizCveWzfLTt3ixoM39Xg1ZBr0KsM9dd3tgM+dEC12d7hI0I1Yt1QhG7w4Sp+WRJk4idn9O4MYwwbPx7ddGgUIKJ1+lsb/Y6ufHk4dUjO5CCoq5ZTdSz+e5y+ggc8RntZ7iHAro5zmQJrNOuG9Poo3i1geo6W0Shf62E6PKRb438/HAAtBAIv5y6K4+tI0IannzCWqM62W/R2MYNdAdscNDhGJKuxpaTYQJHg9lw1RSybw2aXHfJfU+h0an7yvr44QcPTtTsdwZzJ8hzUh0MTJPLpOF55qOLg/+1Q1TYvRoNzqfliNLc/2Yz9z/+OJsoXpEOuWpWquPnBxRSwqmsNqeMsmPsJozDihQOxAS+gEVY5Dkyf98JM9ij8JRzMlF3w5CRFzVGKaAbJgudaELBedF4gOrUin3Ayjv0IxcDcdO4wG6RZ3LYQwWGPzNZ+fS9RnQSg6sMFVp7WtA/BKxltxGBHwmrtEmTgY88VgVnWWnyfLFN92q7JSbBm1dcIp72Om5RgWUrZZx13Hy9fPvGrQSJ3f8BrMsmQS3cQyc8CTFM6p3o/dUGbk6XqJoshQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6085.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(5023799004)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9vI9oydVztPGVLnv1YiRXdyFA6OVayEcfK4maUtkrGvhPIbljHgnq/jlDueo?=
 =?us-ascii?Q?M+cxRLeFZCj88WapeA1U8M4IT2t3nhOlS2cXLJ/AUjYNFzidsYoyerPEVAvV?=
 =?us-ascii?Q?9/uRiVsjbzLhEWSaJuRna4nb1iTzVw0cbGApT2DUcdYKFgz32ZJJjEL2l5yN?=
 =?us-ascii?Q?K0kyQGyr9COw6lOXiI+IGniZQr34otjyq2iZjigII4aOfiUuEeCgcAsNKDLE?=
 =?us-ascii?Q?1GXI0H+luAJ0vz+RY7vYvu04OK4POU5fczHAhNbKgPGsAh6KS2u5u0KiJdVT?=
 =?us-ascii?Q?FvR0gUQ9gO9tY22GIKs2AqceVYlDNwe+McrIWfcGv0GYainkT84HyB0zgYoD?=
 =?us-ascii?Q?46qxYBaR0u2gG86I1bvB2vbz7oQe9YNzw+pEmxpAdeKTA33gtiOdWVdOalG/?=
 =?us-ascii?Q?5zjE6ecL3BQ1K0keBDSPUqMXfGnxMQbycg/f2wTn2TC5i9Iy9lm+BzQReGYe?=
 =?us-ascii?Q?iNp1RVmW5DaNnLiDC2wfUBh0B152e42vNtHv7iaACp8xAlzowx1kVsuomKtD?=
 =?us-ascii?Q?5QK3UVtsPrJ5q4nYdFt9pf8IS/GrlJrZdKoskTp+TLh9CCIbiG/q2/7fDi9/?=
 =?us-ascii?Q?0P+MKEeJoQX6vN9lJHZo95BhzDb3hyvo0aI1tsksxVUhiSxByzAM51FjDyvy?=
 =?us-ascii?Q?E/XqFNbkz1CdfYMps3EjhxzBw8gAxB6Vaze+wKd33uatOimwyXSBnN80Hyci?=
 =?us-ascii?Q?0fCRikA3GWuuXE4i6HK5nEUQFupmjULoeInza6dk1B+nSPBif02QIsE348vv?=
 =?us-ascii?Q?XgNQhomoMT3TSjF7FPd/kQNs9JpD6NTkcq8lS7yVhW94Y2UEMdy4/aIeQT4+?=
 =?us-ascii?Q?kvNmLqW16NQr2I6j15X4MYWqv8lZ7jAMmPvK8Fv5F5c98XsOzEW7PuCZL31V?=
 =?us-ascii?Q?l1ihtA+zYcTMUnKUnICDYYGQR1GvK4hRI4UBsynNzRfs+NDJif6ua1TZuO7y?=
 =?us-ascii?Q?ql73YDX2dYGcu7wYohBLM5zPh8B0Q9+6W5lzwrhPjGAJEKona131JpRbWHVW?=
 =?us-ascii?Q?8masahtJiXqBxptKvvIivVAEVpS2HhxGA3oPVzN6TWuLjMrXx6wmmOEns2N6?=
 =?us-ascii?Q?LE+n2ks9dqDfCVxMDpHoOAJl8S+b1WhFBPl4M/oSVG6YifEAx4PjlLCjKTaF?=
 =?us-ascii?Q?x4GmSPrQVTU8825pb00doUCcgANVqNbzmBkTPizSv6ou6aYe062SSHZtkoCa?=
 =?us-ascii?Q?VEszggxhL3DFELLVtCRNS5+RTdAxzegTKogpac5yoLRCYa6D8+lUNV66qzxV?=
 =?us-ascii?Q?SAFidr4UOVxFBefjx8X96MGewkYWTj3Fc5YP4mvGTUnXo4IkJ+1XdK/bqXEN?=
 =?us-ascii?Q?yOMS/T4WysvAffS6BQIVug17xSN6ls84KCnVu1xNoLGecFRHZrX1vfSCh7oW?=
 =?us-ascii?Q?29byr4L46lDHcgiRF6xsmFlVEZMCxTtRatnlFbAANRActZtbw96iKgjJekyL?=
 =?us-ascii?Q?QQQtO3XhouxnZ4wHLuEyHi0BwvDs6eJsz6JwTTgxoZLw5V2Vg402VdESDoVi?=
 =?us-ascii?Q?8hWoebVShG1Q5N65H9QRSVRXp/T89HgwDwXQGO+Q6jvSl4s4PGUhW4kIvHFC?=
 =?us-ascii?Q?k56K3doYuYqdZcW4/nl6s2c9L7cT8sGG4rHPQ4QayHropu6k1by76m+4Ybmh?=
 =?us-ascii?Q?13t7CbWaXDtglqXuqKMQJuZeWYIn1m8eDGqyMNT22srFpsqydZWDsfIrQ+ds?=
 =?us-ascii?Q?Gssh99Omd4GH+PFYakNsgUUt/nCKNzBJiP41xKT+63UzzVZH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cf3a90-516f-456a-4698-08df17c14a30
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6085.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:18:25.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbPzDxXbsG7xtCpB0OeFL5nRZpzMFfH5rx6mBQijOhgNDCMSi1P41m7uQe5LvujlMwurWs2bGE61kEDak2BVHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375

On 18.09.26 20:40:35, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 02:58:39PM +0530, Naveen N Rao (AMD) wrote:
> > For AMD family 0x10, EILVT offsets are not assigned by BIOS and is
> > instead assigned by picking the next available EILVT offset.  Use the
> > maximum EILVT count for family 0x10 (APIC_EILVT_NR_AMD_10H) rather than
> > an arbitrary maximum EILVT count when looking for the next available
> > EILVT offset.
> 
> Huh?
> 
> #define         APIC_EILVT_NR_MAX       APIC_EILVT_NR_AMD_10H

Right, found that too.

> 
> What is this "fixing"?

Nothing to do as long APIC_EILVT_NR_MAX does not change.

It shouldn't be sent as a standalone patch. Instead, embed it in a
broader change to keep it in that context.

-Robert

> 
> Also,
> 
> + Robert
> 
> who happens to know something about that code. Don't forget to use git
> annotate, do some git archeology and CC the relevant people on patches.
> 
> Leaving in the rest for him.
> 
> > Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> > Tested-by: Manali Shukla <manali.shukla@amd.com>
> > ---
> >  arch/x86/events/amd/ibs.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
