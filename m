Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792578304;
	b=c9FeYoUMt/pvDPyi4GQB6hKRTkYRiquGOd3WADE5fAx7zOzOk/3p4WpA7cLRfejCkp01
	 xu81025zuSmIulF/iQDVnPAVuSsJmSEcnK0yfKFwWJXIm4ml82RmzJCxHkfA7mCqt/TDm
	 AscB/5xnHcuasORVXEl0070PQ/LD3pAGjFN5CKCwMPqT4BND2AN4ZgyLuxfAqJDIEtJ+3
	 w4ZVXmkhAYK+LoqfmvBLNrR4D4qlwI94L7ebz4C9nm39XivX95dgxfmZ/LOSJPiejrYzV
	 SDAYX1nYBWVMBF5vUNHypmUlRcXws7f9VGmFZHJjStE79C9Pd/Q2SqENCkFnmLOzVcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578304;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=rMQziwrQTuU9aUQOBKe4VdP2uDPIs9yQwHclbXP9rAM=;
	b=oQ6n81V/HsUO8mZ+D2E1pvyCKTitxgGI3mTJ4L9+4dFmkanlEYI3OhgwIvAqKCL2//vZ
	 cCeGutjCaSySpTGr2RvtL6Tat+7VNkb6POAxHPb/GIhqM8O2+OUyppoBxBHXVF9h1zlaO
	 K2JyH3uBJJy9MI3hTAWHXh0tzi8SrvzgFYy9LBD67B97mM+JLwgt0o44BOlQfuzn5RK7X
	 4hu+zGbukGRxf83DC4hFwB5J8RXzXuuntG/SkjqhITr1mlrpGMIUXfObsXDlJ33+T93wJ
	 KOOAncyHflBgWJxNT25KUhyWELt8YwDpnNMDeHtZOjSgCY8EQw1gliMkhH2u+iIZp6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BW4QXRtF;
	arc=fail smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B192606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B192606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BW4QXRtF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792578302; x=1824114302;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ocHaSNtKrXi7fSUsk08xygev80iBng2oyBjFzMjNgLc=;
  b=BW4QXRtFH0yrLR4tIoBdA3XDP7G25SSWdEV5VmYojuDXSCqJfGB+y3F+
   q3ORMqrurDYQCcCrwjDP5pc7QLfZTlm9ZbUBQqV5N+h+vON+zzNmra4Rm
   2yJ8H/cYHaOyD1OGLwU8e/nBG4MfsqlndUFMFO0Cn2npB6W1z0Jy9/EUI
   p73jIUiC8hw8usr8ATppOqboEK0P4NuOfwTxq2cIjGcwsGSrmbcrvg0bg
   jC4w0bHK8bIompqAfyqsYD6kuNsoiBTdTc2yo7HVlfLGjcqznHHOdb4Tf
   Dzy6PUEMn2roS2GnKLlNsFMPpf3imKoSrE4FistcpceNG8hfCRu9iCbt6
   Q==;
X-CSE-ConnectionGUID: zx7WprbhS62ZSs6njt7DPA==
X-CSE-MsgGUID: Jm7xbRhpQjmWBhTzN7JNpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1200614"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1200614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 03:25:02 -0700
X-CSE-ConnectionGUID: MFUn1EIBQb+wOqKvRFNQ/w==
X-CSE-MsgGUID: DI/7kWAGRUmZ/CmKtXyV+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="2945769"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 03:25:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 03:25:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 03:25:01 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 03:25:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKTNJbBt/c/ph0vC028i0MosWMYsWm57K5pslMCxZEEjFBOzuHYuYj2Uv3/v2pe/grpTOqcWn/B8kSP874VVMdunktucGG9XrZTJEUs7jxbUM6msXdclrJD/fry149wj6A0gaShnX2u25fSPK+42wWGp3zekXXuw/56TsXL76hNofiOpeupmG2v5CfszxE6l9q9b6007z/leAipUz8Nafggs8BBbb41KLjyZgI8koveBjNq/yKd8wqtVfKmiUfqaIQloq4bOnXR3QnFNjU0PRoPXs8DdAnbgPmaupNP90t6ynhB7xOfqa8iNolQYmobgeF1oxns/NTzO9py4HsTSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMQziwrQTuU9aUQOBKe4VdP2uDPIs9yQwHclbXP9rAM=;
 b=yd7G+vSG1iSefW30R2YfeeGU5LkhRQ1j+F0EHtwzryVaVsYBIgAA/xKKch3Fqi5Pv25NxXzerFnPK/zrLdapFUoBM1xmOTzTAlMK8scWGFmdB96QO99y/gLDHRo0jcp7o5JbjFktODXvJhOMcq2YCrXF/aRpzvfZTxwPhdk00LvzGwB/REHUVbrFKWYJpL/r5YtjSFyVRa2FbV8REe5He35kbkj9FB30poiCozTnYCtESz7iYYk6xIatXQaxVWMLcmQcTUCQS1PXz1NCj+dGTrV70VP2J/BSoZ0fpDF55MGZdk1qTVIe5QOAX4dxEb/fhN4U1og88rmIbUCa3jzUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS0PR11MB7442.namprd11.prod.outlook.com (2603:10b6:8:14d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.18; Wed, 21 Oct 2026 10:24:58 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 10:24:58 +0000
Date: Wed, 21 Oct 2026 18:12:01 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>
CC: <mingo@redhat.com>, <peterz@infradead.org>, <tim.c.chen@linux.intel.com>,
	<chen.yu@linux.dev>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/cache: Remove the old cache group footprint on
 exec
Message-ID: <atiP8TwaDDtbImRn@chenyu-dev>
References: <20261015053604.29927-1-jemmywong512@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015053604.29927-1-jemmywong512@gmail.com>
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To PH7PR11MB6005.namprd11.prod.outlook.com
 (2603:10b6:510:1e0::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS0PR11MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdf84b0-d4f6-492f-efc1-08df2f5d8e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /yvdAwhKGPWkihsnndymntP6vvEd8UirHObcFOByG8Xb2gpvMulucKs/8FMdeWYU5640H0G9bqJwO4zewyKHMlYCUbUO/jSXMUBmnP0XjppV5T+1KItpaYdiHRX9yuYv9xB8TaM8tM//cbQNZZbWHMhszQAI2Bh+MPB2zIpSR149ReOw6u3Y8TKpGMtHhQLGeSIa+R8ZYdV/I+ywJ/6yHYd4yn3S6kLRt16GYxAKfSblhKEFHQ2Cv4iKuGjXLfgueeBPIusG4qvzt8RUWHGbf9TUZjRLBSvg06AmDwQTjME0RvfnHNism8pjDCEUEMZCzbdSopIPxAppEq2nWFb1UO7p+B46zO8FSsnFz6zd0R7lfkm3uB7CTEAP6iwZCQSHM6Z3T1otk7K+gtw/pFc2fT/6M/ggZY5KfRANiyPgkOxNivUThbIRuQXcBbrG2qLEij4e2e66E25/lQfKE+t6vHPvbGEOwUj7R2hZRasGoJHajt+mlUTa8zZnU0oO5kd+/jlEyarDsmhXzdCd9XTDj/H2TcrzwBcbETnYZjjB5PdlMCiUen8qOPYoGU6GKfY0mVkhVq321+6tzbph7Qn6/6ejDBuk9mB3u+kFxoaprMd6hXEENIZiYtMcsmBXn4zADIztDrgxz3Tzkl5nhL3hsMXrBX9dLGuxffXHet+yaq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0g/LQavN129HEx0CR0tz0+mesVT/vpuvXTzqDO7xxw7stU8FYoK4YA0w6iW5?=
 =?us-ascii?Q?LidrxYcsK4pJGApRxoVhsCwNRqPl5K1p/cEf3jn+dmkwQrarbete/fkQJz3H?=
 =?us-ascii?Q?4Gn9Tx4FVnbGg/V4IRzZd9lwbz7u4yXXsTr+NC5IzoC9DW2Sj6Wa0QbxhERX?=
 =?us-ascii?Q?SqtT4OX5vq3o3/uw/C/EO6nMuU5n1ZmuF9mcSwE1ItevkQg7KL7YPQvWq2YZ?=
 =?us-ascii?Q?yQTh4sP6uGdDHQRI9ztaLlzancv7Enu6lhMYkpPOdD9YcZ6GqZvQ1KEbSPNt?=
 =?us-ascii?Q?5d1EgfvWbHaGyyUNL8QnNltvXvEkyIhAfrPKbJHRcdo77Oa7TS+zOzY/bRLJ?=
 =?us-ascii?Q?Q25/se7nJxelL1UVu4Lh15kyWYfnFHcILWEREiL9SzH4E0exzuAkbCVzAyQ2?=
 =?us-ascii?Q?SCn5PrImxCThwW76RTC9F73RwJ2AZ0SqXGexY6SOSBCELpW5rX3iFO9q8QxF?=
 =?us-ascii?Q?3bcw+bHfdqBGyfTp7YuelAt0lCKuoN3OgVdIop6UJuMF/CO3qWsjLIiRChBN?=
 =?us-ascii?Q?osEKhsDg36Kf60GbQz+TWK8dy2nIOb3uzr7lFQxpTt5T0RS6i6XETfmlWaUn?=
 =?us-ascii?Q?XQbvMHn/aEqWWlzkhxRZS6/Mh3/eObsh1fkIJOsIe11G2TYdx4v7XnwbDpgc?=
 =?us-ascii?Q?1verbahYmxKXNt9HZl+rL0UY6TK87v6lSfPiWr0O28hxl7n4N53XD1xWQAJC?=
 =?us-ascii?Q?L3PPuQCdovfEuGZz3K33lMURkwpuHK2seHbvWO01U0Njt3a2gozvB2JmJqtq?=
 =?us-ascii?Q?ttksNneD3lomeaPWcRn3bMKd4Ec6dWF648WiW9IdFoz3wz+jonoD2X6aK4p8?=
 =?us-ascii?Q?MTMQB+XMVZMoVTiy7MPcoTZV9P//jMNNN1iSeV0YZvdOvqUdWvkJDodGsPZY?=
 =?us-ascii?Q?1UWWLc364jSl9ZaxtM9vM2FG5QHigFBVwWMUMjnIPBCIG0kwUJ/GfHo79cuo?=
 =?us-ascii?Q?JmeE2zkgWwo/u6sME18wyHifv6rMSZ2X4+pFDazEsxppoIcrUwplMNxUYuRr?=
 =?us-ascii?Q?QVoovMkSPP3ilnju5IKHpA4kAMLadTaqzCsX+zseBEptHMiaK+R87PsWmRn1?=
 =?us-ascii?Q?919B+MWhVb+b4acP89WeQaDRVBR4QBHrRz0vVVtkK3c3gWGhudhNsIkzP+y1?=
 =?us-ascii?Q?KgmZ1tzlay/ARb6kN6cF/2BzHcG5jo/KF/vPMBLmLhAb7IXltvwfdedTgxw8?=
 =?us-ascii?Q?XzUXZ8LBi2jYtnNZrWHa8U0dF6/Mv/HYYo/9iYWuTII6uZSrebdZpkNnRkiF?=
 =?us-ascii?Q?oIsZ8UHNTuaQnwBGEXHMDv8kugCT3TxabKgYCQcOSSxO15xZ/tAsqz/L7EdL?=
 =?us-ascii?Q?Hi8BLZkSwFaZJzGAM3t7rH+ddUM30x6nMqyynw9oKsYXM4SlHxr0ds6lAj6W?=
 =?us-ascii?Q?OxE0WM5TGQ1EWExnKbuJFzJMJjWJuC/49cht07m/SYkoxpdUsS1Qe0IN7vd+?=
 =?us-ascii?Q?lBmo5GbufWpbrdsAoFFiEmjLR+aixfTnJN01vqcfKoi7dAVSxdo1heP0kDOH?=
 =?us-ascii?Q?00kEprb1akAfsHYj6+yLCbAxUH/xBTt1VWaa+D1e1omrFrOHz1yGfqjtX5o2?=
 =?us-ascii?Q?wglzzD8Q/7Vha0VoI2dvkgai935MGDYd36hU0G/FW51Zx+XT1tDr29xrQURO?=
 =?us-ascii?Q?E3k2SNghOTzxbjf88QkMNL1bEA7OaIrd0GiO5oMWHnjnzxfSHKZ0kflMPlsS?=
 =?us-ascii?Q?oIc+AXPeKqiv7Tjr10ixW24k3SYW0tEoamrmHeMFidyFSl4ZEEOiU920OxUF?=
 =?us-ascii?Q?9cbqL/u9Ew=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2WGGtDw6f9mZLQG8dtlaAyjaKX4O4bPjAaHwjx7V5oVKcYOHz8+E7I6b45bksfAYm/6PlyRFVUTwlKFbV6O2F0l/E+1G/Ajb3mInHbWSyHqNke6Ih1GEz9Bg+5+TE2jyFlF2xFrO/ihRorz+sD4W/hZceJZGcRqKEeXdW1J1xMY3XHaJip2J7AiSpwm6NJltgx8LjmBphHGuQyD3i2Tl5Jf9YPVcc3KQ4LGdm68ctM1f69gAuHRR6WwDJ1l2t92F2oaszPXGNz4bfS0jDVy5/85e7ntR9i1TihZXApQMMgafQdXCT8vT+tiU9HQ5G/KP+DdR1p07JTuggw4DOTdRMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdf84b0-d4f6-492f-efc1-08df2f5d8e8f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6005.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 10:24:58.8019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOWKYhVhJ9rNzTGZ9lYsfFWn5JequolyGxPUawXwoRJLXPS9351T0N09CaBWqXpHjMM4uI6NMxXONrvWPeme1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7442
X-OriginatorOrg: intel.com

On Thu, Oct 15, 2026 at 01:36:04PM +0800, Jemmy Wong wrote:

[ ... ]

> @@ -3965,36 +3974,6 @@ static void task_numa_placement(struct task_struct *p)
>  				ng->total_faults += diff;
>  				group_faults += ng->faults[mem_idx];
>  			}
> -#ifdef CONFIG_SCHED_CACHE
> -			/*
> -			 * Per task p->numa_faults[mem_idx] converges,
> -			 * so the accumulation of each task's faults
> -			 * converges too - Given the number of threads,
> -			 * it cannot overflow an unsigned long.

Above comments can be kept for future reference, with minor adjustment:

 s/it cannot overflow an unsigned long/it cannot overflow an atomic_long_t

I launched a full hackbench test on a Xeon with multiple LLCs per node. There
is no obvious difference except for some false-positive regress with large
run-to-run variance. This patch looks good to me in terms of turning the
footprint into an accurate counter. Feel free to add:

Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu



First run:
=========================================
Hackbench comparison
BASE: cas_on_baseline
TEST: cas_on_patched
=========================================
MODE     G  FD |         BASE(s) |         TEST(s) |   DIFF% | RESULT
------- -- ----+-----------------+-----------------+---------+----------
process 16   1 |      0.178/1.7% |      0.166/0.6% |   6.74% | IMPROVED
process 16  16 |      4.871/9.1% |      5.230/3.8% |  -7.37% | REGRESSED
process 16   2 |      1.574/3.0% |     1.296/27.5% |  17.66% | IMPROVED
process 16  20 |      6.502/7.8% |      6.262/1.5% |   3.69% | IMPROVED
process 16   4 |      2.296/5.0% |     2.138/13.0% |   6.88% | IMPROVED
process 16   8 |      2.056/1.1% |     1.982/12.3% |   3.60% | IMPROVED
process  1   1 |      2.040/0.8% |      2.010/4.5% |   1.47% | IMPROVED
process  1  16 |      4.837/3.5% |     4.189/12.7% |  13.40% | IMPROVED
process  1   2 |      3.708/5.0% |     2.768/14.3% |  25.35% | IMPROVED
process  1  20 |      4.552/3.5% |      4.505/2.2% |   1.03% | IMPROVED
process  1   4 |     2.696/17.0% |     3.092/21.8% | -14.69% | REGRESSED
process  1   8 |      5.474/3.4% |      5.372/9.3% |   1.86% | IMPROVED
process  2   1 |      1.089/3.4% |      1.115/2.3% |  -2.39% | REGRESSED
process  2  16 |     4.985/13.9% |      5.246/5.1% |  -5.24% | REGRESSED
process  2   2 |      1.063/7.2% |      0.998/3.2% |   6.11% | IMPROVED
process  2  20 |     5.091/13.6% |      5.081/3.1% |   0.20% | IMPROVED
process  2   4 |     3.935/18.2% |     3.438/23.2% |  12.63% | IMPROVED
process  2   8 |      4.791/7.0% |      4.925/3.8% |  -2.80% | REGRESSED
process  4   1 |     0.690/18.3% |      0.586/1.9% |  15.07% | IMPROVED
process  4  16 |      5.878/3.5% |      6.119/1.9% |  -4.10% | REGRESSED
process  4   2 |      0.534/6.4% |      0.512/2.7% |   4.12% | IMPROVED
process  4  20 |      5.839/3.1% |      5.644/5.0% |   3.34% | IMPROVED
process  4   4 |      4.012/1.5% |     3.386/12.0% |  15.60% | IMPROVED
process  4   8 |     4.737/11.0% |      4.703/3.9% |   0.72% | IMPROVED
process  8   1 |      0.317/0.9% |      0.322/0.3% |  -1.58% | REGRESSED
process  8  16 |      3.671/5.4% |      3.922/4.8% |  -6.84% | REGRESSED
process  8   2 |     0.921/35.8% |     0.812/36.0% |  11.83% | IMPROVED
process  8  20 |      4.878/6.9% |      4.769/1.8% |   2.23% | IMPROVED
process  8   4 |     2.969/10.2% |     3.500/16.5% | -17.88% | REGRESSED
process  8   8 |      4.698/2.6% |      4.263/4.7% |   9.26% | IMPROVED
threads 16   1 |      0.192/0.5% |      0.189/0.0% |   1.56% | IMPROVED
threads 16  16 |      5.430/4.7% |      5.685/1.2% |  -4.70% | REGRESSED
threads 16   2 |     0.362/17.4% |     0.577/29.6% | -59.39% | REGRESSED
threads 16  20 |      6.210/3.6% |      5.523/6.2% |  11.06% | IMPROVED
threads 16   4 |     2.678/11.0% |      3.173/5.6% | -18.48% | REGRESSED
threads 16   8 |      2.347/3.3% |      2.394/8.7% |  -2.00% | REGRESSED
threads  1   1 |      2.131/1.5% |      2.260/2.5% |  -6.05% | REGRESSED
threads  1  16 |      0.379/2.4% |      0.353/2.5% |   6.86% | IMPROVED
threads  1   2 |      2.050/0.9% |      2.003/0.6% |   2.29% | IMPROVED
threads  1  20 |      0.347/2.6% |      0.324/0.9% |   6.63% | IMPROVED
threads  1   4 |      1.342/1.0% |      1.333/1.1% |   0.67% | IMPROVED
threads  1   8 |      0.730/2.5% |      0.732/1.4% |  -0.27% | REGRESSED
threads  2   1 |      1.144/1.2% |      1.167/1.2% |  -2.01% | REGRESSED
threads  2  16 |      0.286/1.4% |     0.987/71.3% | -245.10% | REGRESSED
threads  2   2 |      1.035/2.4% |      1.040/0.5% |  -0.48% | REGRESSED
threads  2  20 |     1.016/73.2% |     2.038/43.5% | -100.59% | REGRESSED
threads  2   4 |      0.647/0.9% |      0.647/1.2% |   0.00% | SAME
threads  2   8 |      0.338/1.8% |      0.335/1.5% |   0.89% | IMPROVED
threads  4   1 |      0.658/1.4% |      0.614/4.4% |   6.69% | IMPROVED
threads  4  16 |      6.434/1.4% |      6.194/1.5% |   3.73% | IMPROVED
threads  4   2 |      0.522/2.1% |      0.521/1.7% |   0.19% | IMPROVED
threads  4  20 |      5.361/1.4% |      6.060/1.6% | -13.04% | REGRESSED
threads  4   4 |      0.324/1.5% |      0.335/1.8% |  -3.40% | REGRESSED
threads  4   8 |     0.946/35.4% |     0.854/61.1% |   9.73% | IMPROVED
threads  8   1 |      0.351/5.7% |      0.364/1.9% |  -3.70% | REGRESSED
threads  8  16 |      3.818/4.8% |      4.109/4.9% |  -7.62% | REGRESSED
threads  8   2 |      0.294/6.5% |      0.276/1.4% |   6.12% | IMPROVED
threads  8  20 |      4.640/5.2% |      4.788/9.1% |  -3.19% | REGRESSED
threads  8   4 |     1.548/57.0% |     0.880/11.0% |  43.15% | IMPROVED
threads  8   8 |      5.028/2.2% |      5.161/2.9% |  -2.65% | REGRESSED

Then I pick the following test, which seems to have a big regression with a
large stderr%:
threads 2 16 | 0.286/1.4% | 0.987/71.3% | -245.10% | REGRESSED
threads 2 20 | 1.016/73.2% | 2.038/43.5% | -100.59% | REGRESSED
threads 16 2 | 0.362/17.4% | 0.577/29.6% | -59.39% | REGRESSED
threads 16 4 | 2.678/11.0% | 3.173/5.6% | -18.48% | REGRESSED


The following is the second run:
=========================================
MODE     G  FD |         BASE(s) |         TEST(s) |   DIFF% | RESULT
------- -- ----+-----------------+-----------------+---------+----------
threads  2  16 |     0.915/29.6% |     1.376/66.1% | -50.38% | REGRESSED
threads  2  20 |     2.154/23.0% |     1.299/50.7% |  39.69% | IMPROVED
threads 16   2 |     0.320/18.8% |     0.756/26.3% | -136.25% | REGRESSED
threads 16   4 |      4.139/1.9% |     3.174/18.2% |  23.31% | IMPROVED

So the data seems to be quite unstable when the system is saturated, which
might be another issue that I'll investigate soon.

