Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A3A3BED44;
	Mon, 28 Sep 2026 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625830; cv=fail; b=pqspdi3c+gvjL18Lq49eSxXthFSbpVovWuqFus2iEHMuhp+fY7XyjnzO0gkCtts1/WHdMBogSDsBOHhb4LpGm2u5lLTgkgC3EdrYVNfT6Rzsd8ExVVDfxJs7f1qITjCaSRY8D72bGZwa9hCqH1atY0y+q3rUXuqDRy11i5V55Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625830; c=relaxed/simple;
	bh=U+rhP/zmWLmVs4puuZ1ePGX1pJArnQ80affbWfd+CUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gAptUrHH/MSVZMLb4WDDWua5A4xtB6LdpOqB6rb5wyhodRTxeG4HnOFn6w8oG0Uj3uGLFUVk0Npk6zKRLww3g+A+GzcUeSO2tNCyBs71Be/I6pf6lWzn3JzrGMVk+LpD89QWwj7idlJd2PCr/2QdTri2+IqHx3pDG/BWUcHY5uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B7FawByd; arc=fail smtp.client-ip=52.101.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B7FawByd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H152+PzD95A/yM8SRqEObsM34ui2imYbjR9+WVQ4sbDP0BwPhKn4VTrLbZFk6ah64txfQQVbCoX+rruAZ1hOaIcxTQiHZ1gR18h58hDlU39jLSPrdDDER1IgpNFRoGR7tEgL/6v/97i0m9q9YlwqjI1XqsW3htu1RoTfdBNk2fv5VI5rusegxTFtmcLvud6yaFfIfZR8KpuVE47IO/KR9a+/8oMWK8mvvyWGG8ra5XKOiLXHEn7pYOrBiuYiv1Qf+OGGcQiJ3GXqiBq/aLSW+bfRELwFsvn2bZyi7zRG4LAFnZp1sL2WEB410JpHroiGOUwpbLYPM1Ka6m+q0uafRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dn+LqE+iTyFapqvYwTB2zMllBePmXsr+aY6IJxxp2k=;
 b=qhNO5qIo51JQiyxiu4C9ERLw0qp3UqWouiGsNucio5RIWXW+j6pV+xeNp0pdM1Xq5Z+qy8mXD3kMBwac3favFDuWESu0WWRXOvKPVo86oSKjiI59YQ2K1p9AEpX/URvY4cq5+nJnxapcwNpV0Ey0iKwVowGqB6/71IRPjajIj40AbXL5MvIHJ6AWJ/1CDQMirXxL04Bpo9N7y5RrDQNkWjnlmP839FegufIRdfoqTP8KV5tAfyeFJhnt3Ozkd9Kstv47bEsNaKL74JWcXQCzBNP0lBVGpYoV7TDUmKmqi9jVSnJFxFzA5Gp1q7hOMpaI5tSjB0h4HdAY0mKnc2CHqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dn+LqE+iTyFapqvYwTB2zMllBePmXsr+aY6IJxxp2k=;
 b=B7FawBydjb+iF8hWO7mWQd9kCy2ozop4fisBa5iL7zaAshIsrW8d/bgujxKbXMBROUkt8hBkEZGVJN6x7wbZA/8oaDJQrPvvcDlWU4PVI2qmDGXTaZlumvycIv8HRlq1UQsTJJz3Po8Kf+QU/A7Yeb4/R7U0Yak0B6aGqOvi2Go=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 BL1PR12MB5923.namprd12.prod.outlook.com (2603:10b6:208:39a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 20:03:45 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 20:03:43 +0000
Date: Mon, 28 Sep 2026 16:03:34 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Vishal Badole <Vishal.Badole@amd.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] EDAC/amd64: Mask UMC chip select to the four
 implemented selects
Message-ID: <20260928200334.GD2289128@yaz-khff2.amd.com>
References: <20260925172639.97063-1-Vishal.Badole@amd.com>
 <20260925172639.97063-3-Vishal.Badole@amd.com>
 <20260925181429.GBara6BXp_J2rnvoOp@fat_crate.local>
 <20260928143821.GB2289128@yaz-khff2.amd.com>
 <20260928192045.GAarq-DbwF6-q79hXC@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928192045.GAarq-DbwF6-q79hXC@fat_crate.local>
X-ClientProxiedBy: BN0PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:408:ec::18) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|BL1PR12MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: de12c771-f2bb-4217-a724-08df1d9b98fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|11063799006|6133799003|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gHo0WFjBTlGnneT2uQhHWdJpI1qp6S/6CttAhVMRataqSasw+ftF5xYa0bTMvtntNNsoYuP/noD3XprapRYyyzguN49GQDuLwCrxvoPTAKiHEzu4XKWg5iygNB28zHIUdEpgDgVIZacUVJVsbnBwJCn5aHo3CzP2D0tGYSSWM/YudDerSe/KI2cBCBRGDbsqYcnSUC7wqQI1rTvqMOT/enXwSFEI1U63p9tFDS5AmBnuRxB1tcjorg3fHjQOK6Muvx31nbu1lIbHXjVsHxouXwr4P+Ypr9MLkAfVrYMAOpy6Op5yz0S3bMgiWNP078iDyMl4Cxj4BS9tgvZ58BY4V39PPVsOc0DUvFSNN/TlLTr2d9wA/jC7JzCjYSRoEhFI/2FF8+Xh8/P7P1Mn2OGtLbzCopjIWnV0qmsV/Qs+DhE8igFnLxpmGtRZFGPCmW1XK91fzUUHAjr5oPnsKZl/gwMcXiRZAkUZsiXdZDEr1a5/9roea6DorkFe38ZR1s7Qrr14uZK2PsXlRelq6Siw0KXeC6d5nE7OszxCxo38/vUFMW8hikEiS0TDF5kvnqCdGt2/9NTmT/hdYFRejPUMc0PKb1+pR7sXZT3gcG5s2LQUeQXkQqkqedER2ZKRZVT56OT4Fp4jbBhWdf6HgFGkax+rtB7ZRCAQpyUstRdemLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b9SJCl5f0unG8pSyioxipmwdiljf1dV5ZksI4O384NlmsKxGrtnhdRNLl11o?=
 =?us-ascii?Q?xckFaC7PKi6VhaYxMx7YQsgt/v9sk+8bffFIInB/RG4JRU4vK7cuD3tfkvdV?=
 =?us-ascii?Q?895BVA6iGx2jSaIaJAQ/i9piQYBviU9zLmkGBdAhx0wiy1tjC4mvLAcludSc?=
 =?us-ascii?Q?z4VFQt6Gx4K6TFiUNPwVWUhnjxdT8AvVatDnSwMXteoMGU8Bmq/batkkPqvL?=
 =?us-ascii?Q?UyaGuRzpv64nBQlH2zSMTkau7sPwe08bSp6MBqxfkDi20kml47nOJteQcggV?=
 =?us-ascii?Q?pD/cpTqwdTmXvs7VbUR7Oz50c9/G03dwMIYFNwWTEOFQHGy4TYd5VIAQ+5hA?=
 =?us-ascii?Q?pHEZqTuSDK0YD6VrK69p4XFJQD/GNqXJs/91NqXKqqTJ8Ofc5W5qIHV6R9XN?=
 =?us-ascii?Q?6Vl7OHHATKWbxNKMNME60lvifbcKm1ANRlQ56sXflrW5WEsDk/szAVIGSv7v?=
 =?us-ascii?Q?eBUHaIYkGS8MEzL+5lObLiHG7knvyuExOyoHwEwpUB5lQkdn6Uk8o7p+rLrg?=
 =?us-ascii?Q?aUuL/oW6ReDKu+u/zZu1g3tEUz2NOD5lfbX3r750Pmx4T+JUdRE9jNEDsBra?=
 =?us-ascii?Q?TY/f7btV5gMGs8Q4Mu0n16Zxc1i5vlMI/xoC9UcT112jk8UoZ8uNSkgf3zJf?=
 =?us-ascii?Q?mzuzy1f6HRWp5jrxKrLpzVl1aMYJsi2XePg3ZeNKllyc0yYf9tIe+zy3RdRV?=
 =?us-ascii?Q?L2cVm30jw7kF7cOMMMbeqC04Y7YwwfWTfF6M/qjPHJ3zBhzW6FlIph9a46+/?=
 =?us-ascii?Q?yA0GThIsokDIXRBOx2cwaSeS5GUenivlDIUrZxVhQNBxjj4aOVnAIdD+354h?=
 =?us-ascii?Q?82acwpo5YyYtFIzyfQI0IDf/TYE9hO3LUTT/XM5Ag4J8HMtodJ9okjRH6yfu?=
 =?us-ascii?Q?btIrdX316rN9iMKiVVh4QJaKdqcGklOXcYj0CS9aY0WM/VlrRWzLJ9X3698w?=
 =?us-ascii?Q?jWQv/dYI09wKN0RqSh4MNf4gkSDAG/TcRC1IjQt3K+JgdaWyfN/QAcEL7LOf?=
 =?us-ascii?Q?TT9HmCwhUD4jVvYXrPgXqkiPXSXv5XxCoUoXdv5Rt8RGJoseXzX3q7ULKzsU?=
 =?us-ascii?Q?jt89jGp6XtWpXBPY6CWUlLgNAGYsMadzIfkfIKEYqs0dp6qdfMXB0a3WW/ta?=
 =?us-ascii?Q?tAoPOLrnxvGozWzW7uBFQHiBO/f4S0hg/cLPiQtcdxVIFSwKVEFIe/qW35qC?=
 =?us-ascii?Q?P/0iKCsj/eXGNt+sGYE8oqyoDHbA5zHR4waZO295mJXz8oB3APzM57iWrCDX?=
 =?us-ascii?Q?9xyVx6luiMxIsCZaAziEJ1w+RvFyP1rhkhLdcFajl/Mh7gbjqwLjgJe1nvF9?=
 =?us-ascii?Q?81h1ahn9c2wbACTSv+r94U2R5rIIs3gqA+X6fV8/+VWKrvJZvF5L12xb54Wc?=
 =?us-ascii?Q?Kzt4rH0UVEUaMjyRoX/0iuMelOc/h4NaqETEeucDL7oSsJibhuy5QHscnY9G?=
 =?us-ascii?Q?ZDgISb4q2f63pI9lJfKp0KpVDRvp/+e/eDAbMU8ZrGt/WV2Dw7zgrpgtfNzV?=
 =?us-ascii?Q?JBePpGwC32g2V/v1eXQRe20uhzYud5eEzJ8M0iiijtNftb94jFP7ntgELgxW?=
 =?us-ascii?Q?UGofq/Y8fxN65p1ti3fBevAuh29aFdk8zLMMScdFADWAoTvKJ2cWMx9k9U2m?=
 =?us-ascii?Q?9qbeldBD6IV8pC6b+gbALea8s9S6HEtVjumThVe1XnB7j6fhuhSmHge2Io6o?=
 =?us-ascii?Q?BUVU9B4tNfjig8jw4s5vOcSeffbpaLlOzDk5wIVYNsql5dDI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de12c771-f2bb-4217-a724-08df1d9b98fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 20:03:43.6302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6jzY5D0/+FmF/niDohl4Qzrn1YEVGDZf/3KOcB8Bnc8CAj6fW5tD3sqMn44zVAlz1L4AYv4Y1fl8MLWNomtuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5923

On Mon, Sep 28, 2026 at 12:20:45PM -0700, Borislav Petkov wrote:
> On Mon, Sep 28, 2026 at 10:38:21AM -0400, Yazen Ghannam wrote:
> > I didn't consider this a necessary fix. But it'd be good to have it to
> > avoid noise from reports.
> 
> I didn't either but what is Vishal doing to trigger this:
> 
> "Since only four csrows are allocated, a syndrome with bit 2 set decodes
> to an out-of-range csrow and trips:
> 
>   EDAC MC0: INTERNAL ERROR: csrow value is out of range (5 >= 4)"
> 
> Vishal?
> 
> From reading the commit message, I still have no clue how that happens and
> what are we fixing here.
> 

There are a couple of cases that trip this.

1) Newer hardware where 'bit 2' is redefined. For example, it could mean
'sub-channel' or something else relevant. In that case, a real error
would be decoded incorrectly.

2) Some hardware error injection methods that use arbitrary values. This
is like the 'error simulation' we do in the mce-inject module where we
can write something to the registers.

So the patch is a fix for #2 today, and it is a preemptive fix for #1.

Thanks,
Yazen
