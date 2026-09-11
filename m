Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010044.outbound.protection.outlook.com [52.101.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A693C9EE5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166091; cv=fail; b=jrseu+IXxAFJkXiJUEEtgI/7OlJJc3sLPRLMkTVeB72bZNjqFqpvLzLmiq4tlWWKIikc5H6uJ99QCX0Dx31M4BQFb7OqZ1F5jY/d618eaiYnBa89wGTI+iLb4+38cIMrNBlCcpHtasWft4G7F88RuvgGDgbuO31tcK72WsYGuEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166091; c=relaxed/simple;
	bh=g7zrhvYAuOPPt0N5XME7VMxfO24jJwYOqs9Jxs90yr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l6K4BopsDOQxFwSbih8Tz7G18k7s80KQM/U5emc/reKm0ZgipD4kZ1swqpdekGjV2c+enYUMkBHuXTAiwPC2KkKUcq5EB38zdzsW+4rVL2hcKdfEbjC3a3VpRjBOImBDWZWnZ9vZADKe0qIS7IY7wCI2YCeZ77u17oV2Q8eM4jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QY3/OSuE; arc=fail smtp.client-ip=52.101.201.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QY3/OSuE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7Fe7oU3rLmpsUYnJLVyq1SdOQ6w9trhJ5pQL2PnYQoye2eZsa/QczghUrTzWR0rXkfxdOt9QpLlqZjvdmuGh9E3CsBnLxAKl8c95rSOUaks0krzvJSwYTeN6lSpMXCSlI6q3v1n4Z43M4n5bAdHhiVlu4FJgJ6wox9eV+BFFYPoSOPYu3i8Uv2bhb+6c+h5E18N8XRvf0p6AD0P55MYJff/1NI7z0jXT8qtZ7R0I3aGQKLZP/vQl2Sw68UYuE3ou00skhBvNu2Usw12OYtIRxZHoRnSeWrMMpe8Gk1pJf3uopbVbP1Q5yZNoqbNt7I3ZqoFCWHOo5dBbVHn1ujLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CANLyCkPDt0KdxyCFozpoFxytFcBPfKtxx9T4EIammY=;
 b=QxK6tH9X/OlmraHqUioJ0BK57cUwNUhy+zriyDyd+KuYDRYXafxzi2Nhqz2o5v7jTgwGNpRUVqErRcUE1cNgJgiGXlgSujlQiGzaJmPI/Wlrt7Vl/YJ9+3ZrzLo/NLYk5HHiuk7AjWHR2GV8l5NEK+NBDAER42rRCx8DM5fWHkXpOoprMgzecGc7e9/qmoZlJq2p2JqsAtfFLfrQ9wNYCwDAKRV1c56oGl7J8HccUYlbBaChAt4tTlxNBm3+rPu5g63xo0q6zC+VBbcuRpp714Y6FscIyDw0iEtAWKp30HEL05ElhIar/8YRXhhQUpvowE01WnfjRyjYC31chb8qEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CANLyCkPDt0KdxyCFozpoFxytFcBPfKtxx9T4EIammY=;
 b=QY3/OSuEiUQVhOk8+/OMuC56YoLei5mPpscetmYhSm1tu86N2pZiauSfwxwJtCXuxQ/KIhAaHb4EKvpwzFINJXVeyl10qcJ/fe0f3eJwcxYkA+3td5WrHo+uMAkxkurQFebdZPYX9LIHzbJR9U31bZl1CvyFxAOakcgBsXB3HDzDVd90eXUHnMTLCPbW8ms1L+M48WH+JO4cS8xjCufY5SswnxZX9nwOBSqOsdu3x1IgTM4hknEX0ISvRxOlW6gVTjk5GiBmzUHR32jUSkYUj8c7UihLdclD27wcM9oXDgrQG82b/gfbkDHZ+Dp4HYdtrwH1RvwZ5JCkQbZg68sQfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DS6PR12MB851160.namprd12.prod.outlook.com (2603:10b6:8:416::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 22:34:44 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 22:34:44 +0000
Date: Sat, 12 Sep 2026 00:34:35 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
Message-ID: <aqSB-zn9_ji_Ekc8@gpd4>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-3-arighi@nvidia.com>
 <1529268b-8e10-4fef-be6e-60b6dd1e74a0@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529268b-8e10-4fef-be6e-60b6dd1e74a0@arm.com>
X-ClientProxiedBy: MI2P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::10) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DS6PR12MB851160:EE_
X-MS-Office365-Filtering-Correlation-Id: 7835595a-8fee-49fb-cf63-08df1054e0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|1800799024|376014|10067099003|4143699003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	mukEXUy7vED5a+LeRU+PBobr2GOlhPPAoaVyjRTLabZPrwEMKIhcgn06lk4DhKE+3nlVSq4Y4CAbTRPDgRbrLJ+JTZlBxdhUr+fPMXdNGngy8yTyJkv/CukGrBHxth2eLzi/vAuc28PUmH9lJLyOn9A+74V3CfEE3b5tdqKPoOOuoFTl7iKOacTHDyYHi+GzY91hg90eWLg7hbHC/t+BLm6NjvmcdHRKFYbc9gbhhxj9xq8OOB1KIC1b2l6v1+pv4JY/oLWPGUKk0BlVndzBh3ME8zX60mJ91657ZjyVTPQAXmeTFKDLq8wybdjpoNwjRk36IkoSj5JWS5JyoJXmVQ1rl4slrksau5tGLUtsU4YpmRTqLHLj2ijdiMOmo8sdrODm/ViI6fEy5zgv4dWQe20/CvjQG2NmJWZsy4xiZvRjVtU1I2uJLGo6HJaTwUNF76fveTqFZbUj8nTobt8mFFVbKS+vJhNDCwSvsQX7WeBVWheO2doEztKBEYWDKUjb4v6vcIQNoFkOVKc0eNOFvqMRjtf/bpmTxN3u/fe5PZ7YResz6MRM3BxItY/l++8ywykCPlVqtNG2f9P6K5DjUD35R3Gx4Rob4MExEBOYk3G1aueeIHdHTI5qXm2X1mI2O31LCXJnoeezsAIauRxtzGX/lHbZGT+yLK6tnkPcAvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(1800799024)(376014)(10067099003)(4143699003)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jJ2vo/l+09osGrT+sZIaeK+adTvUbU6AVTkNuP0Re0YiNeJ4+IiEB1Nopt7P?=
 =?us-ascii?Q?RS2DairiK2AiMMLlgA+5aC2SsorJUIFca+GUcge/X25SejfrPix8srfZIbJe?=
 =?us-ascii?Q?KAZrMdXRb1FhEU+fBoU7A90Jbp5p7wkxe3RY5k5MuJqZyP4IUXjMEfGXW/vQ?=
 =?us-ascii?Q?z/9HwOvjgzfF6fkOGb+nBbkDNmmqvHy8iVn82smn02+fCf1h80tijPDAvOEP?=
 =?us-ascii?Q?Pj0Ykv39q5LcqFzVSINbqPoFhbmw8i4FgVwgZhMT8MOMAFM1KCZwnx3/mIEO?=
 =?us-ascii?Q?zDUIfL6E3BprijfyaHfHlPKUkkkKQTtdjUEd++DdO1ZXDw7x2rNp5cEo3JM2?=
 =?us-ascii?Q?RyZ7/XDs8+xLC0nitz9ky4JchUNpHAB239RtvZBzAzxBMhhgiOwCLyjh6pd0?=
 =?us-ascii?Q?ihtNowQ+TCdrpnCTYpN0AnOCvtIxFKDROG2bVbBmmdpxFVIv8EBHqh/VR7+u?=
 =?us-ascii?Q?8NKmhfZR2pSDtlWV6mgmrC7CHVv0HLX19KrAZBDJxn0+e/U0ULxX1LpCFXvY?=
 =?us-ascii?Q?3I+tWm9145esqZeJqZL4AuR0ijse99/8gVdrXJA9hDhMgBLhCNACyr5EiQuY?=
 =?us-ascii?Q?WIET0sI4n2eX0cYniWXXP7MN7g6rm0gmWLhxnINtpZHu/O+ufDJl44V9zmVS?=
 =?us-ascii?Q?c1JDWo0p/6aO91YBPiy+Hqx8uL62YdQ60q2wwFvltao0/f7G2CmctqYCFZIV?=
 =?us-ascii?Q?JUjujnLctoceT0OrTJ7GsIg1y6/O12wUIlN1pvQjonwlcTuF3xJWwOwYnB8N?=
 =?us-ascii?Q?Ky4x+RHI17mInvYCQj4s32hovfQvZWzERN6McacP6NTvLo1Qn/jO7Jn2W7JT?=
 =?us-ascii?Q?cztG27NRpZReXXg28qJCyiHSiNiyiM2ivfGSA7IVNvrEZuC5nlbMIx0cuB+L?=
 =?us-ascii?Q?dHOVi4RZcuNTs+CveVblAMOw6i2MszvZAbR+pznAXTnq81hxxPTGfbnggfNl?=
 =?us-ascii?Q?NVzJk9EZREfsIOPsq74kPWe0KL2zuEzAHSnispUk81mm48HbSMqYkcApsrj2?=
 =?us-ascii?Q?S3JC6YW6bO6I/OGDRmQzO0cmRxsG1JcoHfvW9mSM8dYoBx+2qivGsy4xXTEp?=
 =?us-ascii?Q?SkNbLFd0fxJcYqUdsbhD8t1WT0HoGfZ6FrQNXr+SvEz8vxmI6Qc1DoF7WkeG?=
 =?us-ascii?Q?LTljEoTk1tPU2FKkZZBXmvG7KeEvnSeJoth0BbR9G9WJJoP0Z38aTyPsGDX3?=
 =?us-ascii?Q?p++J+i1hcYvkcz5DPbmE5S9V6eg0hOs3NvI9zM5HU3oxP7NXnudslaojmU+Z?=
 =?us-ascii?Q?iOr+Fm9paOGXQ8f6bMcn+GLqeih5p9FD1g0BC89DXlT1k1ewL814nsx05ZhC?=
 =?us-ascii?Q?5FYIUJU+jHb9VmodcC3jtJuYXwYxAb2o9knSGs3beOE8ajec47uO0WHd3Xhm?=
 =?us-ascii?Q?rIWONkqYCy3FjDEqQREICJgDjcN8tE2l/S+eOeEBlhTKBQKitWB7CLZGjEJt?=
 =?us-ascii?Q?elTAMWTiUepjv6BV5rug/3cw/zPcAFmE1ScsLkgfenFMUkRGOuo/KELKHHFY?=
 =?us-ascii?Q?J2zKe6PyZNUl/L4Ql4qnLtG17RAVuUHLWl2279H0TW2EF3RluOLL/4ohhXKt?=
 =?us-ascii?Q?gxIEdrHaHz5uq0POff92ESpa3Qy63mzVHiH1xhT9GR6BIcz43d/ct4wqJ+py?=
 =?us-ascii?Q?W/Chc3IxLK+5Ez8iO1Xgz2h9Y0QgefAK+co9DZwdpB9X83qOblEOQB7s0iJi?=
 =?us-ascii?Q?9To1LQAjvuE+WrYN93wNRgMlSlkgm4bjl7ojHZ5Crf+0t7mujWK+ZY3wppgu?=
 =?us-ascii?Q?p0+3CbJMqg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7835595a-8fee-49fb-cf63-08df1054e0cf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 22:34:44.6422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewbaNBUiMtCjofjzLprU1gGIsFUA3pl5RH1/5D7zAoVLZAQbvnQUgjv4P6xoUOpNRqJr9ksmLnoKQbGSZAOs2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB851160

On Fri, Sep 11, 2026 at 04:11:38PM +0200, Dietmar Eggemann wrote:
> On 09.09.26 08:26, Andrea Righi wrote:
> 
> [...]
> 
> > +static bool has_asym_smt_domain(int cpu)
> > +{
> > +	struct sched_domain *sd;
> > +
> > +	for_each_domain(cpu, sd) {
> > +		if (!(sd->flags & SD_SHARE_CPUCAPACITY))
> > +			break;
> > +
> > +		if (sd->flags & SD_ASYM_PACKING)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> 
> Replace for_each_domain() w/ sd = rcu_dereference_all(cpu_rq(cpu)->sd)
> here as well?

Correct, I've changed it locally already to inspect the lowest scheduling domain
directly.

Thanks,
-Andrea
