Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF373A9624
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853936; cv=fail; b=m/u69v/NzWutAoNp+1IQzK6WNeF/2RqVJL7eHbrsVDsVJ9RPbS+zjjbaXZ8+avlIuL0WnVeXDK1+E8h2pEWvdRSxS2LJ5YJ/UqTLAowIaxbs7WW3nQzdJt37vXdTs36xXCxgMqu8qsbhoAfZMJNKJ8VM0jnZuGr9Q5R64+a32m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853936; c=relaxed/simple;
	bh=SVZBubxXzdG1xoEx1JIxk3ygW05PVez5WiKGoNW/Ks8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AKSLRTcAqUBWc/JES3xo/tjRjgPbAEOUG9xvc3CXszE9yPqHNUk8FPf5YA+Xws5QRWxvEhz8U48Ee18gN1Cyh+wYwmxZwq5PgAEmWgvJ8xu+io6RSYKL800dw86tLJQcD2Eu7q5OyoWXOPRYeDaUdRKaRLLCBCfFTsZMEbOUkLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TH6WwXZR; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TH6WwXZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788853935; x=1820389935;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SVZBubxXzdG1xoEx1JIxk3ygW05PVez5WiKGoNW/Ks8=;
  b=TH6WwXZRP361XeeyNzLOuJRgcozE/Xnwpm0Ywfi651GU1cn6odjvTfq8
   +mBdpvAl6Ov1L6YsvDQCp3duOlm3C0NFbEDbX7MEKMK3WR4AKEH1oPmtF
   BOFOzWeyug3nGGNnzgUGfr5xbJZQwUw7ivzBjm8PeX9P0qmZVR4dNRxSu
   T9kAaZ1Gw4KCE3Nacwl2A3SKbKtqWIoDw9PRcj/8CD8YfBobH8liDuc0/
   5vHipMAbocr7LxzZ7V3Gw2kAqp6IqVQyWWm2TOvNkXwkcDutmW6Gryuoq
   9umwRbXwqjFrNbaczyzkaw4CAdwb20CsGbS+41UMBTgwRrDp0+kbZChAO
   A==;
X-CSE-ConnectionGUID: Ba1801HgQ3aLyii1XmPcvA==
X-CSE-MsgGUID: 9LrFGq71SWCFTMaV6+2jJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88397604"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="88397604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:52:14 -0700
X-CSE-ConnectionGUID: JJXgTLvMTfuUA3/3pfCKvA==
X-CSE-MsgGUID: /d9SSD0mR6CqpZr0ke75eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="295822590"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:52:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:52:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 00:52:13 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWXTb3yr5niv5CUbUX6ji+nLFgsyV+1WXyfJhpZFjq6Td0lMJyCLjt5ntECPxP/xWJ5hgkRDIygmnfm9beo3WB3bEDIXn8pfLoeGgct5boINMd6HPVZ5LAW6auXE0fvi+85utcFQzUcpOF2J8AXD7osQi9qv6gixaxK0a7eAJRbmrkAWE2qHGeSmsHYSDS4yWi3xSjicq35hXhKKWvPpBP+05RWlR7xkygmmhX8wCm8qEILjkB6N9xdhWPQFEx2+Tdnqyo5i72+iW2PwgIfHfbRicGHmGnRnWwuTnCGinh9GgDxO1/4+H/aRQ0Wtvys8Bz+Au+54lZyueNO2ip2Dfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVZBubxXzdG1xoEx1JIxk3ygW05PVez5WiKGoNW/Ks8=;
 b=RnHdKxusbhdE9hC6+m2jgtxZ92b97jVA0/39pbh0lDJWud7lqeWa5ziAPdU86WZ/b9YVDVhdI3jkKZ4F3+Qzi/VtmHHU37S6ts3zKDO7nSLFfQsdXn84YzBXNQrER4J+zK46NyxLO/VhoTRyasCAbEgfoW/7hV66+pd0C9GYylWAlASFKarJUsAmgfk+mm0a9qQow+/V+xhWW/mCL3R+XaINEKJneV5CnQ8a1eqZgmLcgGeiG8Y9Q045eOsLw2ntCghPdXZ2qK3i4zQ878I2OHj2qrxjkv6Pk7PQ1299SfC2tvQQTT88mmmiDLHYmhIPSKe2bEyDog4ywUj8tA79XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16)
 by PH7PR11MB7720.namprd11.prod.outlook.com (2603:10b6:510:2b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 07:52:07 +0000
Received: from MW4PR11MB6936.namprd11.prod.outlook.com
 ([fe80::96dc:12ef:f56f:dd04]) by MW4PR11MB6936.namprd11.prod.outlook.com
 ([fe80::96dc:12ef:f56f:dd04%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 07:52:07 +0000
From: "Liu, Yuan1" <yuan1.liu@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>
CC: David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"Zou, Nanhai" <nanhai.zou@intel.com>, Chen Zhang <zhangchen.kidd@jd.com>,
	"Zeng, Jason" <jason.zeng@intel.com>, "Chen, Yu C" <yu.c.chen@intel.com>,
	"Deng, Pan" <pan.deng@intel.com>, "Li, Tianyou" <tianyou.li@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v8 1/2] mm/memory_hotplug: make shrink_zone_span() more
 robust
Thread-Topic: [PATCH v8 1/2] mm/memory_hotplug: make shrink_zone_span() more
 robust
Thread-Index: AQHdOdJxBXnXONkqW0erS6f8QQF0Qba9uliAgAaegRA=
Date: Tue, 8 Sep 2026 07:52:07 +0000
Message-ID: <MW4PR11MB693696B7D0D86AE7A3B17138A3B12@MW4PR11MB6936.namprd11.prod.outlook.com>
References: <20260901052950.3284540-1-yuan1.liu@intel.com>
 <20260901052950.3284540-2-yuan1.liu@intel.com>
 <20260904024215.2vg2j77kopwfv54e@master>
In-Reply-To: <20260904024215.2vg2j77kopwfv54e@master>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6936:EE_|PH7PR11MB7720:EE_
x-ms-office365-filtering-correlation-id: 6d30bf97-9b9c-4348-f286-08df0d7e14ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: WcKe+VeJ+1j52U5bucaClWjUbUYW+acrKKxRfGhbu1JpZD6EpJeHWqhQrh2f7MMR0iMmAlyi7T2ZBuIxJAxV9ZeQ0LC03DrclXMwi4WsZgstcxqbAVxcaIijF9MLwvSXw0xEye9bSaXOAZMvFgFAKDiIvNV2bsVPBrvoQcI9id1pfl2h/BjR7V89McqHXXGWXeue0ZvCwD84rgBG+7iIMoseaev7iHQZEruu76dxthspz+ECTiFbJ0d/9bvrnvwbAYtxVTeiZobozIokOglzvArooPfIyQbYVqIbPX7t8VoWBv92ZJfOgcVViHptvD+cMMUMr6MiAuPj7/x4G+EGG8E8ped7q3Pfq9mo9UajkTVxYd4CQnbAi84fdx5q8jSFg8fKuhk751aqmvljX9M76c9m9ZJKPKr4CQ0rA6oIv9/2xQYGuTUARZFAeoMDZoDech0g4LjB2XZD6i0deLOjCw0EjdILmF09j77LgvAhspAV97uZBlK3jl4ITO1JK0jRYbREur/fckfeoxAwwmUn8lQQDvp3d/WMnXgO1ld4A+wpUfgc5BW2s8R6RfMMZU+Tv3mQXshBHI8FRYE1SDlA2Dm2xayGL1rBKlUw6G2TARd7kQ+AnFZCCFBOVvj5U4b+piNVKCiK3Wxnynzj+rbDizaWqaX9WvZE0cz5ZjXkfPcgi4EVFwwJfMaKz63nCZ3opXS9Kfd6eImnOU+0AkfMVKJSwXJQRTS1nM/phHI7qec=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB6936.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7rUv7vUMrp+jFu4hkRsQMFNrwhsnfED3P6Cl/Vwe3rSZ8NVbXB20ixJtH/s+?=
 =?us-ascii?Q?Rxcrsbjv33F5tnwoFXiy1CrtenQc6aV1fu+T2mY2XqVoDFqNkbKdiqKK4dMp?=
 =?us-ascii?Q?K9eDyq0670TcVvA+rxzoF22hXEJ2wLvUZJh7z3720jIolv3M8RMwFr2G4Lxi?=
 =?us-ascii?Q?ydD2aJaT9vj16SspuEKrWG5y8UuSKyd57LjkwxL40wsV2+EvwTpNVXLS7tT4?=
 =?us-ascii?Q?d5xg25rGHJ5JlZp69aICcvDomK7Z71+etAxuwnXlb6FZdUl5dd8XiZDO/8kK?=
 =?us-ascii?Q?pi+zleXf3Lm0qK5GgH1LILt33Yhr5OX8w4hmk70AIloh2RusjR9BDwLi+//J?=
 =?us-ascii?Q?LQ82LXKB4SciYF6pvhRrNYz8lGsIGPXWxN5AvIdzJZZwH2QzqzB7+8OP31zB?=
 =?us-ascii?Q?l9srKlg9Nn8q7fZj3EEA1zC1Gz2zk3SEWF5Lgqy+2TDwMTnupIUbXENAFwC5?=
 =?us-ascii?Q?zEhuK1aIJI7IeJYvEkD+spFlwDXVPNJzwg2xOcyfzX/j47tNgg0zXj+4rCNm?=
 =?us-ascii?Q?0nzMwhJOeYTx82NAiwHwG+RKtQRLoOU2chG7148l1ih78Ljpd0205MmsZRrl?=
 =?us-ascii?Q?aTP9zHbJvs6CObgNq4g0zNZ2k+eUzrSshhI9Ri7AtHXwr0gPqvk7daGV3vfs?=
 =?us-ascii?Q?RIYJwCs/9aPTx2yKCv/83zGsCyn3exYMcbdf7vJBoNcf2jrP/YPBoxO/JmZ4?=
 =?us-ascii?Q?+CiCJPQIUcxly/7IqpWIdfOG1crrBl38Llw16UVS1QtVtyo5BnfZaUQmhrSh?=
 =?us-ascii?Q?wG1uvEEWzpqtkuOP8H2xrDjRmCCyLzJjXqkXHUFLbTsuBz5sKsB1P9kqUm9z?=
 =?us-ascii?Q?1G2EkiyJRmjtYxTEFV8G1LuKWXdk4nDkNMwoJBVBSQb2I4KQJGvtFUgIRqKY?=
 =?us-ascii?Q?aKn3JPNRpkzedV2+dUKWWK7sOChqidknDDqnajzHgqzjjdor6Nr6SFEGOiFt?=
 =?us-ascii?Q?44dFn+Pza4NJzXIWe29J2F0CyWQx2byyT7nVuJMH53+zllJKXosX74NdE9+8?=
 =?us-ascii?Q?ffqHsCHoh+xTj43hlrfyobeumGOd3gFxZpYYHg2Hk+rP67dy2BmgTI0byR9q?=
 =?us-ascii?Q?fAYQTwfRjLCLeqor4MtWw+krpmZdaYO9gW9gomNNx7WlYUse7guoR1EVftMw?=
 =?us-ascii?Q?FPqyAEHEqk7Su3lteKn3y/61ZgDhSWxm0r1ESstLONhtXcmrDdpwHc/5fp4Z?=
 =?us-ascii?Q?Z77pT8BZpoUNGNOjdDJGoLB03RM4s1f/xHbnCryqDkwyOk87DU8KOjJHXhe+?=
 =?us-ascii?Q?EQGLNPuSTJUnSWo2BKphMEU+V1RVtTqYyR6CzUmK01iDn1EzkduF+EL6KRU6?=
 =?us-ascii?Q?gb110q2Su55PJ24H9KN4NQ6o0gkmC+CpDSx2LOap+Rb4zHCXixQMYhIOlekl?=
 =?us-ascii?Q?mKPSiYPqGeKxqxYmVncjhPuRumo2Uno8pnVgcTBwNCtKzVtmA4rQdJdbRm4D?=
 =?us-ascii?Q?B1/VfhUR/B2YCVBasTEl8K3MCmLWSUsRDQew/nNsWp30JnqPavA6pCLyYnSH?=
 =?us-ascii?Q?oCGzmfAhGiFf5YXtIYG1f7gLPt4LXb1zDzBddbLTu8Qn3ZsFZZrCIjswnWpP?=
 =?us-ascii?Q?ZYyQ52ESDkpGaUUPopGQbcE7IMnU/4X8qhNbOAoR1jy/OQj4w7WeVIO/9eLn?=
 =?us-ascii?Q?8z3NZNaleYPxZAaLtVgj5CgKKBTTmkvaNYcJYhLXKd8WAOyh2Z2D/OjtsE+k?=
 =?us-ascii?Q?G3G6vYQyC05ieBGkbBTEy3q7Sfa4MnJ5Fb6ySrmM/6G+iext?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4UaNNzGvpGI1FS64rr04arUauuoeZw4FmitRdCSxUHxkAU6vlWtKnV+ErjEVrFTeYQbsUl6nl9kB3rIToGwhcJAEqtE97OFlrrb9WQkwlhPV+LX9e0WUJl0YG890StFwQ7a7XU7rQbg8huTK5FXOCLBznL43nx3I7B9myxws2M6A2yGXc+rHYrJEDImotHu+1lxfeBtweHkke8QC1gDz8M5LSHhnnLY+JuhqfzVtUW+KvKCV+3seD+K37tnO9qLmTlkWPuYnEFKGIPfHhvnZzCNuYeRARXs+iT0GFXf4zCH7cMZLwKNea4a4naWJFo8i5V8n05MNMy4kOuCipc9SdA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6936.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d30bf97-9b9c-4348-f286-08df0d7e14ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 07:52:07.7683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMQ79U/d9xEyA4GQ3hC+K4sy+rpVt2p0ETgW16I5VVG3gqpv3RK90tqbljfZ4tGMewuYenFbbP5J85TZ2H8ggA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7720
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Wei Yang <richard.weiyang@gmail.com>
> Sent: Friday, September 4, 2026 10:42 AM
> To: Liu, Yuan1 <yuan1.liu@intel.com>
> Cc: David Hildenbrand <david@kernel.org>; Oscar Salvador
> <osalvador@suse.de>; Mike Rapoport <rppt@kernel.org>; Wei Yang
> <richard.weiyang@gmail.com>; linux-mm@kvack.org; Zou, Nanhai
> <nanhai.zou@intel.com>; Chen Zhang <zhangchen.kidd@jd.com>; Zeng, Jason
> <jason.zeng@intel.com>; Chen, Yu C <yu.c.chen@intel.com>; Deng, Pan
> <pan.deng@intel.com>; Li, Tianyou <tianyou.li@intel.com>; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v8 1/2] mm/memory_hotplug: make shrink_zone_span()
> more robust
>=20
> On Tue, Sep 01, 2026 at 01:29:49AM -0400, Yuan Liu wrote:
> >From: "David Hildenbrand (Arm)" <david@kernel.org>
> >
> >Let's make shrink_zone_span() more robust by checking in
> >find_smallest_section_pfn() / find_biggest_section_pfn() that the
> >start and end PFNs of the subsection are within the zone.
>=20
> Either the start or end PFN is within the zone?

sure, will change it as you suggested.

> >While at it, clean up the function by factoring the core check out
> >into subsection_overlaps_zone().
> >
> >There likely is no need to check the nid first. We require
> >SPARSEMEM_VMEMMAP_ENABLE, where pfn_to_page() is cheap, and
> >pfn_to_nid() on CONFIG_NUMA would call pfn_to_page() either way.
> >So let's just drop that for now.
> >
> >Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >Tested-by: Yuan Liu <yuan1.liu@intel.com>
> >Signed-off-by: Yuan Liu <yuan1.liu@intel.com>
>=20
> Otherwise, LGTM.
>=20
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

Thanks for your review.

Best Regards,
Liu, Yuan

> --
> Wei Yang
> Help you, Help me
