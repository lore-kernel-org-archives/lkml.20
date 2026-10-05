Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012042.outbound.protection.outlook.com [40.107.200.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438FA4B404E;
	Mon,  5 Oct 2026 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212885; cv=fail; b=of7uSYONBt2iEQdcFaFqcZOEfIxih9uHxwkudfciXQxZ9FeAB6u0S4kNTpVG+Q682MyvnmxiQAX6KlEc66QuViCGmrxspFnskAoLw8eNL6/zbbWYcZbhWgKI/noloCcYGE3L4Axt17Yob6Nrxm9rZNqWPBfzbF9kaT9xokXVXTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212885; c=relaxed/simple;
	bh=nBvrI/ZMGYozzvwa4uF2k82QsAeJmTABc5yRBfVnUT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g30tiTSd2rKpQP9RMIQBCTuHnbAKB1DAUNoXnaXIWW/BMf7SxFSxna2IH0rMpsLBh3M8hOeCK8EyIOfn03ybBoF52lxIENGtkcJJ+O3nUAoZ1BRIRSJLJjGcjDQvL8a95fKsjMyiVwV4MBwqgITJ81+7UrrPyfGDiKISQA3giZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NC3UgBaU; arc=fail smtp.client-ip=40.107.200.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NC3UgBaU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efuGgQ/uULTS7iCNHs101Bj4JkYl5A9RS/A22LFBCgdHdgsoFkivrjm2r7Fs3pSfNzLfnXXvi/m+FpBYg0+D4zPvqIehMyXAktlZJcfvM2PE1V0vFqkwG7CCLrKASCjq0BXCeVGA0bAdiAelgdkZJyvzJwxFAOvTQQywuhKE4N2NvDvQRro+kv44IcgyMgeOuMLYTWmtC+uuefoXJ/1AVV19leSa49tEv4LfPhc6zOnGNJitkCNTLQ4H5eL+uA6OqsOvkwhx/Q/5T3YkABIcUMuoNPtV9b/YR/fTCFELa/Wb5fJj6pXG7L+7G6wY+ceKffMsS7n+PruwLA2SED1+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pkfvza4ObaNfYou5r4VdDtyN3r8k1rfSL/Asulxqh2M=;
 b=LU5yMCTFO70TYjIDYmpthjg6+OLEiJ6gbsiw4mQ/62SiqCkYgeY6/1PqKKMfgWnvNzj4bwHAxbC1c2cqlk0wZ7AAyf0ZKqn1rfCjWDVb+WEpGUtkpXcRQrx+odd5rITeRhR4GuWe7uRnFcFWwrQz24glCjEZvC+N6VmaF/YCKADRGxlIuexSRzOPBz5WndYsklwdirILfrtc+mHUvZ4nvzjC587OAAgZQR7qaPTVQ2NEvhDscU5Jr8rB0uDBNPhsf+EFc1cYvtr6vajNvrWmLf30HbcBo796B+FsfdHWvhGlv/XjXnvyQqh8eN3udJMw339dkBY9Eedy2kJIR2lfgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pkfvza4ObaNfYou5r4VdDtyN3r8k1rfSL/Asulxqh2M=;
 b=NC3UgBaUacw2qNmaO5TQIauE4NhRbUFBeM1DeienX8Kw8hgpZMHecBquDnN8WAsNNkqvuVt4KOnfZ7IfwCXrjkth17jiNRsZW/4G/9LHyTenuYXAxYcSILx6+6SazSDWrVng/e2mKTZzJ2hTrfGiXA2IJdHyXBkYOT3qPm1h/Gk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 PH7PR12MB6492.namprd12.prod.outlook.com (2603:10b6:510:1f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Mon, 5 Oct
 2026 15:08:00 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 15:07:59 +0000
Date: Mon, 5 Oct 2026 11:07:51 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Vishal Badole <Vishal.Badole@amd.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah
 models
Message-ID: <20261005150751.GA1159@yaz-khff2.amd.com>
References: <20261002113204.3358815-1-Vishal.Badole@amd.com>
 <20261002113204.3358815-3-Vishal.Badole@amd.com>
 <20261003012238.GCasBY3rN9K8ps1dDR@fat_crate.local>
 <20261004151447.GA2673@yaz-khff2.amd.com>
 <20261004160412.GAasJ4_AhYcuacY6ZM@fat_crate.local>
 <20261004170525.GC2673@yaz-khff2.amd.com>
 <20261004175048.GBasKR-AA6kPKnbgEa@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004175048.GBasKR-AA6kPKnbgEa@fat_crate.local>
X-ClientProxiedBy: BN0PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:408:e6::20) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|PH7PR12MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: 0134f2d8-2a32-4935-6a00-08df22f27139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Tr0kFG7youWLwnbJOA/5zPu87b6hZWo6pH4ufUy/SV6JxnxqeqlBy12uu4IMwASS6Iqr7gpW4v7s+UoyV1bDv48H49/7h9VsLkJ66XKE1uGWYx+QAd7zjGPa+zU2SkkeRBjSJcO5unrkZmMb+FWBkBXMiBozxPWkHr/U87vI4MGCGTIYLEzXYK99x/buHuNYfqD9PHVQDgpfMO7xb5yGysiFVeAOrmfwpUQGHpFdYbeXbus1WIKmPoHO4W7+O+dTv8ZnFQ0yzAwraZThH+qjSdcwC7VpmGiPWsyhQaWeXXhURXvwX+dl37q9o7PxcQJizk+VQ4pIUKoYkVtbTVBfQlz516MhamsUdqhdcAuKRYR7vY0ZTAaneT2CQL2r4MftfIyzAaTYQLltR+knk1l8B8tVM6okQHTc2cR2Gw5yuflxDKWDuMYVCjeJej/DihT1Xn7FvGOjdeYmsE5QJUifK3YMFMzAVVPMdqf3ZiK50pRxNCZTpLf9mFMj9uD06u7dREp8KgmhrfRCp81bx33qrNg/mob5sgbFYFtKrVbqHO38nilbjrxsVnumxYdAIXxwH8P51lHVTf026Jw0sHzRwS76ruM6r/B4dRCUbAwkIP9I6V0AvyjeFJU0ZTr01JlL0JWG+QhuaC6OT2l4l2mX/1dH5Ldg95Izm3A9Vw9bpx4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4w2dFuDHgS3TGfDYs7CUVDSueM+a6KAy2UgwbluPyHC7K3TqMe9axHHzdpFM?=
 =?us-ascii?Q?KApWKZOwFJSQAFtMX/65DahGyJyBLLzgoEERrpzzcwPzes3LHmFogHVQsnyY?=
 =?us-ascii?Q?QzC/d90XSwZOjIiDNGQ/AgxD3VJwtkSA5h9r124+jeGVFlfOfdxcNzW6jhcA?=
 =?us-ascii?Q?iSYRlnINoSLx7dBX99UQqWYAwsGQ8vlkswZhxCYHRoX2xHKNoSDPK44q9Pl1?=
 =?us-ascii?Q?maN6cMHadEiOhwcfL3FA09N3feX/np4NNejV7gsToJg8KxBKbCwmTjiR9xyL?=
 =?us-ascii?Q?BhjO+PXy6HDClTl4UE86KGpPjLIC0dMUvmOySBAWY8X+rhOsMTsDO+tzdG/k?=
 =?us-ascii?Q?ZQ99/1nJ13Dzzan9Nly2TAdzmODNyVtUMjL920XVCJH6QaGOmPvZnjYyVrGc?=
 =?us-ascii?Q?jdS0HPEZZIlwcwXGEejIAo/9SW+ocss5Uzi/vbdsTh7a0tx0GQhMvJaDNRQU?=
 =?us-ascii?Q?+YqcNaki7lygIFhD9AfR6Z6KC0KMKYELgV9/WU+ZtFMf8orcFWVs8F2wU0oT?=
 =?us-ascii?Q?XLq6RH/hvnYtD6b5cpYvof5EtpzZhOV3Rbx+A5g4zMlt+mBN4lIfwnOCgHDJ?=
 =?us-ascii?Q?KAPfuuVsjaX/ZqwgvxbwxRFyhMJSC46SUpjAl1odpQUCB5nXEVhbBHCJ6gSC?=
 =?us-ascii?Q?D/60/UVSos51tkfCpixmHyrYhZo8S6R7TGyFvrh+bXozibxdXHJkXl9Y2kkx?=
 =?us-ascii?Q?5yuK42jsjDJSMch1ZOOKQJSAQiJXn/l2X9+P6wyZklQ+PZGR7GOeOVhpzjrr?=
 =?us-ascii?Q?T/7Sj0hfpruAcFGYhfs9uI1JJh6ZVMYyo9zWWTL5W0+Rp2ldSS80wrNXCLuW?=
 =?us-ascii?Q?i6YWzw0SzzmDgQKtO5dkg5G9zbdcn8uIOoLTn7CBa5MEdeXxHmFM+YHaONZ/?=
 =?us-ascii?Q?vOK/CKcaEr5P1gQqBbdqHXd71FuLdBP7JEHT+MpDGOgJ44MB1FrZ9oc+Zn0d?=
 =?us-ascii?Q?2b1+eojzQUdAbwrQQSc9gjCc9VLohwwEuVfu4/D7X4WkqTZzV6SpjknW8b2y?=
 =?us-ascii?Q?7sU+azqw1KuGkPQKAiVE2NognzssoT1Rah5ABZWLGj2vlpfQWeWz9gi58n5h?=
 =?us-ascii?Q?f+FDkqtm7phMm3iXfbWsbTY1iWqi6a1BVlkU7CTSQjXC8MkM+Ai4Y2FLVZB0?=
 =?us-ascii?Q?vexw7c87OMJgj/YI4V5FE58ZWhD5hK2ngucL/G5z8bcDURg04HRIjkqWdyVl?=
 =?us-ascii?Q?6Ms+WiUfJl8kBM9k2Vs8S1yT6QNuIN3nQYr2dH6/6/bLVx/rCunFJDZPHKsn?=
 =?us-ascii?Q?Boy+ZrG5H1hZZIpd/ERHWfTl/KFQLwCrc2BEdEIV6diBGjv6nERfdqsYbSFe?=
 =?us-ascii?Q?5zLzIFwl7YYw2KbECZD03JTYqAzkaljF8xrz+DVzHmFKkDIkvS6o9Op3Dmss?=
 =?us-ascii?Q?uDHmfb+OKvRc5d/H+NMzpQbYIdeeuhtvSkgVXFdmZxfZ2yuFEfZwHFnkvdHr?=
 =?us-ascii?Q?K26eOtKM8wqmQC4+IIW0b5Evw9aLFE3F8esqEMkUuu/O/KvXcw4/XneRoDzx?=
 =?us-ascii?Q?ROD/3lPYi+ipoog/CmiRBSce1tJ7IuFE7NU4lBXk8Is+BQdrquOQ8be2ux3A?=
 =?us-ascii?Q?hQcXZghJKGUkiqu32EH1j2Oh2X+TpcbSvYFKbyqGBrF5xyjX7WMxRCskM/0d?=
 =?us-ascii?Q?LiVbHhiCLn8PAu+7qLOzlOaYzx/flTx9xyWdcX5/mdrnigFiMegcmCytVZhN?=
 =?us-ascii?Q?nmKSnbFZS6aaTlU0hwL6vMyEM0Xy/Vvo75pMvb3OrhpFMmd8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0134f2d8-2a32-4935-6a00-08df22f27139
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 15:07:58.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Vs3sYt26RbxpOZBWdgr1JoXx074QzHQIO2moTWcQDVDg6e8gpypMMuDCp8GuPcFIu8DiKMqpPh89xorkyTwGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6492

On Sun, Oct 04, 2026 at 10:50:48AM -0700, Borislav Petkov wrote:
> On Sun, Oct 04, 2026 at 01:05:25PM -0400, Yazen Ghannam wrote:
> > I'd rather we load unconditionally for all models with the same base
> > behavior using sane defaults. Then we can have model-specific patches
> > for variations, if needed.
> 
> I'd rather not because I keep getting all those: amd64_edac doesn't load on my
> machine reports. Well, after a while it turns out that it should not load
> there in the first place.
> 
> And then there's the managerial checkbox patch which needs to add support for
> their new model just because... does it even make sense to add support? Oh, we
> didn't even think of that but it says "Unsupported" so we thought we should
> "fix" the error message... 
> 
> So I don't want to have that unnecessary waste of everything. And if a f/m/s
> would keep my sanity, then I'm perfectly fine with it.
> 
> > Essentially, we could avoid a whole class of patches for derivative
> > (client, embedded, etc.) products. The module would load with the sane
> > defaults. If the test folks find an issue, then we can have a
> > model-specific patch.
> 
> Only on well-tested and supported configurations. Everything else doesn't
> work.
> 

Okay, fair enough.

Vishal, you should be able to combine the current version with the
suggestion from Boris.

1) Move the zn v2 flag to the top of the 1Ah case.
2) Add 'failure' for the default case.
3) Leave the 40h model group and add the new group with it. Basically,
there will be two model ranges sharing the 'empty' case.
4) Update the commit message with the new details. Make sure to describe
'why' rather than 'what'.

Thanks,
Yazen
