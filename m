Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80539348C70
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177731; cv=fail; b=OfeNQgVCXkMAZ1cmBJQFMQ30bKiCjmeCEpDkLIpeMGdYlShiajsTDuq+bep5Viyz8CKxw6aFHaMbHfJoTH6rVzcUx5Yt6Jq1J+TcA9YMg3Siy+tmQQlL3eJrvKlqRNoYfeq9VMjRof5N6f+pcTj5Sb/jCKbSIvchOr/nLaWJZ4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177731; c=relaxed/simple;
	bh=OBhfePlHSfFSSIHHuEKFsDoc//nzapG4jnXearpn55U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ghc64sM++lz09sQBSGeJ9SewMHpC9kzjqHw84cdpXbGkUIXYDgwOQsHEJql/6pFIVGaLtLr0QuH6kjk1qBi4k+8VgrFV9yheizbmj1+EB24cLv053qcVFScaJVapMjKhArtB1fHTdNYhG+pvkXauXFGsDBZHMbzaTph2ZZ+iD7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=femdVmQb; arc=fail smtp.client-ip=52.101.53.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="femdVmQb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyBkk0LeJo36y1b7EVy1q2pRVUS6WexcvzNPXbR+VnKgsE9aRiIIZNOjVc5X7FQMUYIzjhr5H8UkD+Lx2TJv2InlD7E/yuCf2nkQctKQUXoptRdIDi1yEuNBTT3stbw2LYIx0xS1DZhKijhPyB5zmSCcerCFFXvCD94TMSBNMCl1TK/HTBQ2uAjASCewuN1YxYOGGRbkXQRP1ICip75ygQVnW/eUePhlvXFJoDLXfPFGyBqh1C2gvy77GuNwIhtm8Jme1gpZnvFAvBzcX01QGbRyDZ1XgVgBszQHHKp5SHVHw524vT3UGqNAjKmasdDyBkUkDT66S1fKRUP58loQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32tEMqalnYinDgJiFrPy2hUA4L0wfu+x8SPLDRspAu8=;
 b=n2KlNZQO4BnQiWhuTxEU5rqYZcUbAt288Js6Dp7dNQ6CXYShQvHNy6hANw3rrEBD3kVmRZZtwV8tXLQ5Ez3T5V1sUQwA238B82D/PEZVd36ZEzfr7jbHhwvjuRo7gCvw2tcFd/kiqob+VRpFND+yso8r+ZB8mOKoKxJUF6ABW2lRT6uweOiHo8/+bl7pfdx8FwaMZPO6zgt/ltoPbg/BC/ElefscpZ46q8/WNLFJHCK4Qj9EmsCh/bKqCmF5w0h+9odPt0t0zgDHCExTxjTQXk3Uz9JM53Jxnl5FPOBbcDLigDH17CaFZzQpxpY7kg2C2vGv85ScLXsYojxBvkB8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32tEMqalnYinDgJiFrPy2hUA4L0wfu+x8SPLDRspAu8=;
 b=femdVmQbs7VPXjBo7tfh1rBp+eLGBtrE+ZFlpMHa+5s9vN6lAUd9JhMewpQUgAKZzOLVqLqX529aEYCxsfejsF1ENFq1xPI/EkU7NXfroYaZPR9GbTA1iRb6qxL4KX422KiPPclbw7gjWVuB2PNGejMAVLbKchIA8QDQGtkszoxiKm2u3MFsP0GEr5ewZUIniEPsAhy5yNL1Liy3X2nFBm1bxYFyx6/YrKOIqEvf0qFxSI9jAa0UZnwDmUu6ei1mGfa7Crl3Yxu6qVQXlVbDD/1z8w8OESucwSIpm0lhp8w40w6V5lPTwSL7i5+0Ifp+Mnw2k+wpXaErju2gQRSTsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW4PR12MB6875.namprd12.prod.outlook.com (2603:10b6:303:209::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 12:02:06 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 12:02:06 +0000
Date: Mon, 31 Aug 2026 09:02:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>
Subject: Re: [PATCH v4 10/18] PCI: Account for ACS egress control in
 isolation checks
Message-ID: <20260831120205.GF4157646@nvidia.com>
References: <20260821-fix-p2p-acs-v4-0-v4-0-94426b96de73@nvidia.com>
 <20260821-fix-p2p-acs-v4-0-v4-10-94426b96de73@nvidia.com>
 <178761377056.3197084.2573998749847027711.b4-review@b4>
 <20260830092033.GE24140@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830092033.GE24140@unreal>
X-ClientProxiedBy: YT4PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW4PR12MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d673ea-03ae-4554-0874-08df0757ad6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|3023799007|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LwUZPsnsqxWtGINOxo+xqncVlr5I7ZNO3AwGR3mXtLkhkwlFZRkoH39rJeQ37X1Z0rpB8HkJ2Ncjj9NqPPTk5MX23bkztGtjyNE2gfvG+vQ28idfVUQecT+7TokmkNsVL7ywrqLVn2MRzSiinC+Gpa6oO6E3k8Ojiu79mPTguZxNRPjB59oD210bmaWzwAG3cdMT0+Ne/zuuJES3rEwvF1iJmrAeO4zvRR66J8djh7MgwT1UWwCsRtvijtuOGN2BQcVSWldio107DsiQsIMLCh6Zim/oWccGU3Kq5t9tlB15LsC8RkUuzIDVHNKWqGuJaQ/y/JQCrqhEHIs4cgtiBx4iZyQIasFhyCNshzX6x+j3fS4iNkDsWNZGVbDgzxkxcX3UGrEZlHaX8oRuSc683uxsqwhcUZFTV4DfSRjVtxav3KNwdNHXkF6qcFUIitquSp/SELwkoS+gqnVX8/7dRYxMhjVMaERnlbsK2VIak5ToS7s1hAhhJI47S+z0xlEQ6zM7YNgwDfAjxG5f5o4/H6cgRpVNuUB8ueM8kGWk8fot7GnKb4xRJrpXY5CWi5/zW492R0CiECOzGHzCYk8MFHs/pBmT/k2DoJZxtUbEaaI99XNOyLtsTh2vcKv/kZCgM2MZHPNE/fJFoXS1Z4fWsDyj61hWewwXLvn4UNh1l6w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9YMXwDEa+uW+4bGCAh1xRIKE8py7tLL3W6VRT7fPtPIkgyewfSIS0yOBfBUQ?=
 =?us-ascii?Q?jFiBDT8uNog8+E3LBoVkPkV692LjRyu1aJlGs31kMsudmkm5LZiBH8POcIrB?=
 =?us-ascii?Q?PWtm+xOkjBePEvQduMoairvKYpjutV2WatsxHeNzHg3SXHFvT5uU793d5R/+?=
 =?us-ascii?Q?UHkXwP0V8c3GAWIN5D0++Kt831+Y/y4ZV3Sn/Nb33h28Km8wwgJ2nwHKnSZq?=
 =?us-ascii?Q?SBY107OWHqUNs0gyP64sY5ydD34GoL1QZBP8ZWVZHybxsiqQQAVr1+aLdtwk?=
 =?us-ascii?Q?dfobbt4oaMC4sq3w7UIhBOC52VcPNtoaatZDP/WJcdBoExfFZoWCbz3W93QD?=
 =?us-ascii?Q?bEUKqnPuyn3G59VWiGqyYi3pl09ArN1r1dpv61tpOjRGDUBvpRVOnqe8eDI0?=
 =?us-ascii?Q?bk9qWUNTQo96Nc2oBjWKuHYMvUKID4Ic6BBj1QDI/gxFQcYabqagn1ctjEgl?=
 =?us-ascii?Q?PCqGs3SB0mALiJUF+ZPaYmNs7IslOvJQo2JPuLKRviHkJBSyoBR64nVl4t1I?=
 =?us-ascii?Q?G+YexO4uwdk2SO7ZgWtmgP1eYgYz/iZdqP27gQjvdRlmqRO2gXqPC5EbWIjz?=
 =?us-ascii?Q?F4Pwr9GC4JTP9Jfc68yySm+7a8AD1jaGrEV22w7FoV9Gm6pfSzzhTQvEsWbS?=
 =?us-ascii?Q?CQ2E6JSwNqBbPqKusYt23jTuTn5vXb0tmRbQkWWlNXDWtQExU9ANSSvdTKWb?=
 =?us-ascii?Q?5aKxR2TAvScRbWdhxT7eA0PGyuIyv+9Kpd0pMb0wTv9KpawLxh6MpVirciKc?=
 =?us-ascii?Q?zUNowJEm6budHUtqu2S1iAbHnkxzB93FBVGIn1WmJCbe6vKFnah/wh+lS1Rx?=
 =?us-ascii?Q?fo/KRGvM2HjiyV6voyMEveV4Lp7axj5IGTWxdhttgAu+r/bq/5+NpceW4Tl8?=
 =?us-ascii?Q?YvDIj110CAjylQLdhw0k6RfRzEBiJQ690kGlSW7AkFgsvXjP65ur5AH5Fapi?=
 =?us-ascii?Q?YEzZDXMSNAjQl4ELdI67GqQhF4PuilfCW90UwzpLgt8vy9e3q3bNbhdIkH7Y?=
 =?us-ascii?Q?85c/85Fcg+J7EGs/7nv/HhjHohGaqI46SjU4lbrFBAxf8UZdrtRtxQv4FdPW?=
 =?us-ascii?Q?Q9ezXds4A6h34SEZv/Ll2fd9usrM6y3YU/5fzv6w4i9E3URWRvSMR/mQ0Zcf?=
 =?us-ascii?Q?QBO8OpQ/lYWK9E2f4uFL6d5WFwiN5wMmXXFOdUBXR3pMj1c2prbvMas3QaUE?=
 =?us-ascii?Q?1RDmNYF46EzPGSrfCx3mK+8aYLfS7Zlx2ycpDkX3kbpVgQLPs2BsWAe9KqpI?=
 =?us-ascii?Q?jYEE/FLHAaaQ3te/0w5ZQ8Nd45q7u/x71TGw3KxNSATIhq5k2br9ylq/0xs0?=
 =?us-ascii?Q?b1R1BPYS32JmHvFkNlTa/TGX1Zeup/F7yU8aSeWbZaodHHvuCJhMTvb/zUFV?=
 =?us-ascii?Q?dozWjpUNk//umhM1v/7WmybVTQ+jLR7TH+CX/YZxZkhwfVSEaLsjl7dAdcE6?=
 =?us-ascii?Q?IAZDGEXRF4huqQazObi/taXuApUlQKs3uAmOtXWludrVgDkSmiHYyaHCBP6J?=
 =?us-ascii?Q?nMkK2r+GK8+q7FHIj1le8I2YdGV9EdcDCgRODCmSL3MOFUs1Bxt7JJNmVwx1?=
 =?us-ascii?Q?JV1SuqqKFPXl33vFn1chJUwNsFSv7rnaMQixzrV8dtKk8XM+py8JlBZfdxid?=
 =?us-ascii?Q?1nYmwWuMM8PCguFM73rhPnvUslt7RLDW9V8S8xa31eFbep41OPXXrBFYS6lk?=
 =?us-ascii?Q?/OnM2HZFCfTcxQCHiJCfX3DH2Zc/NHGuNIx2oZqKNN+WRm7N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d673ea-03ae-4554-0874-08df0757ad6e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 12:02:06.5189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFGBGg6oy/ws2Si1xOrAbQOKh8T4vcRqA2rmKi9N4CT+fFdaB/a/N30LwiFFq6Ya
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875

On Sun, Aug 30, 2026 at 12:20:33PM +0300, Leon Romanovsky wrote:
> On Mon, Aug 24, 2026 at 08:22:50PM -0300, Jason Gunthorpe wrote:
> > > pci_acs_enabled() treats P2P Request Redirect as effective whenever its
> > > control bit is set. PCIe r7.0, sec 6.12.3, table 6-11 lets an enabled
> > > Egress Control Vector override it: a clear vector bit routes the request
> > > directly.
> > 
> > This may well all be correct, but I'd prefer not to touch grouping in
> > this series working on p2pdma.. The grouping logic is already not
> > doing a good job with the spec and we can't change it because it
> > creates regression.
> 
> The longer we wait, the harder it will be to address this deviation
> from the PCI specification.

I think it is too late already. People already made HW that probably
doesn't match the intention of the spec because Linux works with that
HW so we are good and properly trapped now.

Jason
