Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792773782;
	b=FfcPsxHvwDjFgTk4wrMp9A4nexoN/fLeRDx/3iQTnP5jiLfpSghOHVGVmPVyTpvoIi/D
	 V/ud4kimLOAgKrVFFYUCARLurCADgAYp8X9z+eO9+pPmIq07p++kRMYCl8Op23axTcZdD
	 1iMxH+Zw8nsVCWZZZYEvT7n//v55wf2gUj/PeL0aZcB4SBzy9ir/YajmTfPC7+QvsudXQ
	 Sfz1pOGs+ggFba9dhMh0Ey+T+r/Pqw2Z+Y+WgrK6Xzsm8R7WV3nr0nihNcAKLcSbfaCgv
	 UYHQ/wiIfEtbPfLsNkYluhD+zELWW9tQV3+16/7EVr4nZniBPMrcvsmyO8AKrw1WRtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773782;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=rvsCfzpIrAtt8zvHO534uYdE+QVL+++IglLUdn3WST4=;
	b=DXsKpPJ6d6fg/pJ5oAjnZAjHftYrxUPPraJ25WQYGBVbhft+1X2O1NtUtKi3O4A0dk+Y
	 UGKOU2vL79YR0IWV07cTG0bYB8YnWKbffFO4g3T/r7Rzi5jj4fjvwdZ+uw3s8En035MA5
	 t3g1kHkxbe/BgEH38h49XVnKv3gZc1UDCxo/Bfjiye+2WGrvEncrqpu+c3IUqm5unRirx
	 j2ETmLL40n2bvlZmJFGcjH64FzvbcVx+zTkeQomI9n6xypp5HftgNCkLvmoFYrM7lcDty
	 GUAA/M9+4vZ2byTHY1rgD9l2dTsldvQK35aqJPmZ6J0en9KyZ3PzLEBg5blL08CHsCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kJ2CYQ9O;
	arc=fail smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D47606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D47606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kJ2CYQ9O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792773781; x=1824309781;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pAAo+5LJ2zWNuG6JqXaLYVZPdGDm6cCxFKrCtIPtonA=;
  b=kJ2CYQ9OORnI8BKH1/I1mv0EpzUvQ2L4jLOUSd2y5DJm6+oalEuT+aLY
   makAA5wIf8jXCovTAys0GFgcbkeUBOQmNi+RtxysFz9FjSpXbLGrAcDgw
   N5qssioX8FXCQFURqm04q1U7K3idsmT/1Abvb/3mODNsnLKlTsL7p3n4l
   d5q3akj2GLx5h20/yDGSRmYtaaK9AvyNECTjmEnKej0q5Y3M4+1BW6mHw
   zgqbGr1HVw8Kg9wQn0Y+9VPBFKwZJgR02AP4oz2HnnIRS91Cl4LT0WdAF
   S6ut6oBZv5VhY4bzflVvNou2mGuQB309/cSIC4t/38vKsTtmYc/qXIVuN
   Q==;
X-CSE-ConnectionGUID: 5Lgl36+0QWesmootD/09dA==
X-CSE-MsgGUID: yKfFDm/3QYqYAT1VxxIMJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1411255"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1411255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 09:43:00 -0700
X-CSE-ConnectionGUID: TclSb0CGQYC7RvmK/5buZg==
X-CSE-MsgGUID: azraFeLsSFOinQbFflWSAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3633669"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 09:43:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 09:42:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 09:42:59 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.45)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 09:42:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chNiofyn7zhc3pGrWoevgvG6BpMjKUuSDP3lrhQuPGlD8IQDDHAKz8ZBDZCgHWJ6QrEj0+neMtp0wlI8Y51P0dowGFNfEaR/5x2+0SN5yLBH5syPumogM7N2RylOp0vT7eq7v45Zrx1bOXA1rPCohi+KV4XnTky7SnwXQgfzJJrmIz9DbtGVbLf7RSkYWf3ZuTLFiBa6Ii3iyYfAqymhWIMhyAGdfMBobPZFrGHWx5x8PPLOttWwLkaUr7PQS49syF44R2zvO/VwK9GpF/qALgJQfKsmYYph1szaS2gW1WHozBlMEVtkzOKb9h5hbsdO4KkpHH4usC3JTjAJwXHmZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oBaMVM4JXawhyP+Ms2/6sJ4ZbUNBN44/yQ0/I64+IA=;
 b=dEKb9sWk2u/YO1b1lZWD7KyH99pW3/CpC9RtpVjWHvypL/BPs791eQsBJ3jIBebvkQHP3ZtygHVLlH0O0VYKbFGYQIsJyqa2Va9v9TyG0JN3jS7sPjKWP3wxIux2RUhRJff7gv10Yy9hVW7xAUD7+wSM6meJRxJShN9HFUBVVu71zWd2LVdRs6Cq4GQq7ygwaW9IsrQaJUwaqZZyqKIeogwtSVILCAWyPdxMFxvZu6GdK2UTvgF+c6bAjV7Zb3uZTEd2lCyKnYfEoGuLwgOdsmnyA+WSbNJhMiu4lhyML/XGBkyP6KYdFbwDegrZvQ1BseHx4xg5GiZ6bziw1yUJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF0BAC23327.namprd11.prod.outlook.com (2603:10b6:f:fc02::9)
 by SA3PR11MB346485.namprd11.prod.outlook.com (2603:10b6:806:5a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 16:42:52 +0000
Received: from DS4PPF0BAC23327.namprd11.prod.outlook.com
 ([fe80::6fbf:c112:d0a8:f1a8]) by DS4PPF0BAC23327.namprd11.prod.outlook.com
 ([fe80::6fbf:c112:d0a8:f1a8%5]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 16:42:51 +0000
Date: Fri, 23 Oct 2026 09:42:42 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Hemanth Selam <hemanth.selam@gmail.com>, Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, <nvdimm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] nvdimm/pmem: Release gendisk on probe failure
Message-ID: <atuOgqJLxVVw6X1Y@aschofie-mobl2.lan>
References: <20260911082543.473670-1-hemanth.selam@gmail.com>
 <ar8Lc1-griI_TwS4@aschofie-mobl2.lan>
 <1fea2b63-b1aa-4b2e-992e-9dc0c973a1ac@wanadoo.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fea2b63-b1aa-4b2e-992e-9dc0c973a1ac@wanadoo.fr>
X-ClientProxiedBy: MW4PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:303:b4::19) To DS4PPF0BAC23327.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::9)
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
X-MS-TrafficTypeDiagnostic: DS4PPF0BAC23327:EE_|SA3PR11MB346485:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e2b076-3cb5-4498-3240-08df3124adc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|261022105027099003|261022075727099003|4143699003|5023799004|56012099006|261021121427099003|261009223027099003|260925021311599003|260925021911599003|10067099003|260925022911599003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sDYR9IhSLATZMPfQ7fwyAe3yvz6ad2kQhTUlty4Sxdt1LjsXOmsJi6QeKi8pMQiXP6QIOmLV56F3Dh47rau2SPtOuaLKIusxxLdK+sVSfn9Do2TEoMoerEgXFiwiHnVNL5ptIJPb/zlscih1xKaAyMVRGJqG16eyOT0LtIa/RQDdc1Naesw9CWbO1kXTI4lVPkIAtCW4f/BPNxilTmrgrnODQlU99tYP91c7lps+jSIKH2Dsop0QtLOHxiMLqo46SDnDaTMsB+aVYA2vFtGAzOlX6LYMwBSDx4EUmS5FpYxOD+9rj9ApIJID8PisOlPaLSwWiNQQ6ddCI1h4IASea4D/goW4608QrreuuV68rWz1J0zEEji3y02uqZ4o9hZgQrwgRys+EGulHxR/O502JGlDzmSxooayCD3wVZ+OzUAFlA4O4Yc47oHqYhkjD96jREGHdz8L1T9USp8asoKcJx9pSJgbbbmJbK/beyFNW1/UwX9uvhBEsP3m2pezh6c6l0i4A9ygokfkV4XLxqrhu0UBI2W395D5gDJGtLcLGAdu5uyCAnrPKa6nV166yrJF0ObLsA2sDEcNvEUFY3yLob3zM6YgGiLBYBIUUUwlvybNGVvh+jZCqkA51zy053wj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF0BAC23327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(261022105027099003)(261022075727099003)(4143699003)(5023799004)(56012099006)(261021121427099003)(261009223027099003)(260925021311599003)(260925021911599003)(10067099003)(260925022911599003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lL/CNjfv86fvkjGib60KCMMEg9nMFlpXBgg3xJhcHTA2n8L1B6By3Uxh+m?=
 =?iso-8859-1?Q?7xo5nKV3J7oFdEeqRyS++t7n3OTrsfMb/Evx0zBEUkHnPmXK9siwucJYoA?=
 =?iso-8859-1?Q?D3vyCmY4z/S1nVWWhoEercakdqnS7zP8nNX8FxR5kRjwOCx0Bhk9B7DGnS?=
 =?iso-8859-1?Q?eVzBvnptykwdjGj+dtEQv1oRvHyVKU3e46c9JL/s8IIhmb4+l2+y16VuBT?=
 =?iso-8859-1?Q?QypX2fd5P9AMOcdtHKMTfgn84CcHKY8nkbI/lsf4XabQclKTms/MSAC48g?=
 =?iso-8859-1?Q?WclfTPPmIKpxW7MTYfH49MjK75g4p8ai2ayCB2XPDeOTQFFtBSEcHDDdSS?=
 =?iso-8859-1?Q?khr9Rg5wh0vomTa3V85/XUxPZMCbUSmiFXzrcVbrN6ooKSBl+13oEcck2y?=
 =?iso-8859-1?Q?r3Hsipz3wgLrxrP0FV0vNhDxwDJlJoxbG4UfUyr0FPBRxGTfVgKI/bAddr?=
 =?iso-8859-1?Q?fNqwfJKJPoJ4IvJt9rLEqbashU5EPdn8jBtaCc0paA/tCAqVg7mCfgBb4D?=
 =?iso-8859-1?Q?l7XhtVnn8mK+U5CCsDqo8HtueGTaRJdsZBHk+SYmxgkV35F7W2kPVTJcC5?=
 =?iso-8859-1?Q?vhhmTzWNqrrfKgXVD1NWkkYVBoLOqKTnhghbINDrQOi43jjBDjyyvnxFsW?=
 =?iso-8859-1?Q?bSMvn1/WyrM60VYt3G/we7VbJwDjjimgS70gkWLRJa+09SpOo10d2c1LKt?=
 =?iso-8859-1?Q?SsZZ54yRmE+2ci0OEVi7cS7GOYXV1orFb4jiIdLU2WtbxqN2F2wqHlLIjN?=
 =?iso-8859-1?Q?nQSw9oLW3iHkKS6v14artvn5XYJRKQNH9YSI4oT7gGkvS1z6bi13qEGMQ8?=
 =?iso-8859-1?Q?QW+/nkOGvK4uhrCeIQW7w9PjbOUQERrJzRV1ndrSTFrZNU0S6LCJ+rcWmM?=
 =?iso-8859-1?Q?ROJXrDcOiy/7TtKjUxjD1glGjPJ8o8dt6Inv0oj2TQVY6Nju7TVxUatG+k?=
 =?iso-8859-1?Q?WbXtSpzae2Tht1iea/M+oHcVNphCaquLn3jOak4b4cRr/y20p8Uz2VZXAA?=
 =?iso-8859-1?Q?JL0XtjLJaTwqQ7cTM/2lE68iPba0Lw4Fpu9HcmHGmKreZJckVFKCIVX56f?=
 =?iso-8859-1?Q?7fa6LReS+79jOQcJQ+pcu4p7n/x+O+fXfros0KErqVE0AZt5HbSv65qwty?=
 =?iso-8859-1?Q?y+GiAF+Fo/2sYA9ojMAn6Z1Y+isi/kpiz5pdP1WfZ/qH2oQk2lcGBWjIrP?=
 =?iso-8859-1?Q?qFQ9XFeCGEsAbVn0Pjx6+j0fXuqMMxMlHVMvBnVkCwFRdpFRY7/jUZtmkY?=
 =?iso-8859-1?Q?yFrXy7pa1F2OW/8IYPZXIxZh0guuAckHMS7rDhf9OT/YzMRlfJXvdYY8K7?=
 =?iso-8859-1?Q?sZc294VuvpTnQlPHEUhbqIEGiiQe5WQ8xUGUt/8pHttOwiJeb1w/9kdz5R?=
 =?iso-8859-1?Q?xXqJjLwqsWCuuELfF7p1SiybhwY2aTeVMJy0+BuO2DYGifmY+coBRrPW8+?=
 =?iso-8859-1?Q?urxA0lUI1FB579QCYR2xuhLmTOJamV8dsTreUmj/bDwJ5nnUCJQJ9OhySb?=
 =?iso-8859-1?Q?bvollhzfVCGIYgvvk4Wp8z53Al271/9mX3gPa7Ql6wAuKWlUU2pjbPdZjb?=
 =?iso-8859-1?Q?xbCegNCa6/yxgEPraWOQ84Uh9UauRN7ELYfGno4mw6F303mvt3AtyEVXj8?=
 =?iso-8859-1?Q?qRcp8O51R5v39xyulhnL8d5TuyVD89uZY3A/30sqYQNIqwMw80tv4EcJRb?=
 =?iso-8859-1?Q?a1Tj+tZl6wpYKaMotQKvW1LffJMyiVzAaoWGATiOmEwpQsukQ7yz5Qb1U4?=
 =?iso-8859-1?Q?HqsixjLfR6J19qMwpX3i3khmZ7tSKfKBCCSpDe7F0gonN8SagzIHD4Yqbt?=
 =?iso-8859-1?Q?t5D5ZzaXwiS+/Al0nhgGBPRJG5J6u20=3D?=
X-Exchange-RoutingPolicyChecked: d8nucY5Zb4Z+J4mZtKGrmuwLmrCB572rlByElCqr5TH983xQEEcsBHd4K8+aru5tRWhh6Lh9yXxIe6F06M2cFLf8Wq89VBf7XRewRNwAYzxAH3JRDfTVllDBoz6x45RiNYW+MtNwovQWhZQgZS0uz/hXP0Y2SMhhFX5tqVsVsKs2dXT5FUekwha517ajGDs0ISZJFyycJwtx0BFsCSqHFeEe+d6atO2EyRSv2YicNVUHQSaVpmSrMSolSh9lGV3xvxYhq/2O7QE6oJMG3f/uNU/B0xY4lAPhnCFKK6mDL+QXGFfaBlpA8o+QCVkwOlN57i/jdJyRHk1iO0wArh7Dig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e2b076-3cb5-4498-3240-08df3124adc4
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF0BAC23327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 16:42:51.6604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKV9WV8DkzOBCCTx0e7HDIYcBDot1HBuSC5zyUc71VSV9wS5FoY0gaJdryJhdqsk546vaWHFpr8M/huTN6Ib/aAyuUmBWRIrS1Aq6Iiu9Vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB346485
X-OriginatorOrg: intel.com

On Fri, Oct 23, 2026 at 06:11:09PM +0200, Christophe JAILLET wrote:
> Le 02/10/2026 à 03:40, Alison Schofield a écrit :
> > On Fri, Sep 11, 2026 at 01:55:43PM +0530, Hemanth Selam wrote:
> > > pmem_attach_disk() allocates the gendisk with blk_alloc_disk() and hands
> > > it to devres only once device_add_disk() has succeeded.  Until that
> > > point the probe path owns the disk itself, which is why every failure
> > > after the allocation jumps to the out: label and puts it there.
> > > 
> > > The devm_init_badblocks() failure returns directly instead, so the disk
> > > allocated a few lines earlier is never released.  Nothing releases it
> > > afterwards either: the devres action that would have done so has not
> > > been registered yet, so unbinding the namespace or destroying it does
> > > not reach the disk, and it stays allocated along with its queue and its
> > > bdev inode until the machine is rebooted.
> > > 
> > > devm_init_badblocks() only fails when a single page allocation fails, so
> > > reaching this at all needs memory exhaustion during namespace probe, and
> > > because device_add_disk() has not run there is nothing user visible left
> > > behind: no device node, no sysfs entry, only the leaked memory.
> > > 
> > > Release the gendisk through the existing cleanup path on this failure.
> > > 
> > > Fixes: 3dd60fb9d95d ("nvdimm/pmem: stop using q_usage_count as external pgmap refcount")
> > > Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> > 
> > 
> > Applied to libnvdimm-for-next:
> > https://git.kernel.org/nvdimm/nvdimm/c/855a46681e0b
> 
> Hi,
> 
> For the records and if it sounds better patch, see [1] which propagates the
> error code from devm_init_badblocks() instead of hard-coding a -ENOMEM;
> 
> CJ
> 
> [1]: https://lore.kernel.org/lkml/f1933a01d9cefe24970ee93d741babb8fe9c1b32.1636219557.git.christophe.jaillet@wanadoo.fr/
>

Hi CJ,

I'm thinking the best way forward is to rebase and send a v2 of your patch
from 2021 for upstream review.

-- Alison

