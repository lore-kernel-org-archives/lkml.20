Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793089620;
	b=ebIQ9YZMTNnUmKbGGPQt6o8Vuu8PAZuWZejuGde1JfopMrTLiRAqpbjC3sJn69neUBva
	 NTmMDcfI5HmJN8IYJeYGyTZrtC10jeC3Rxm39OCmTF5B14iGb5QFKm681DoFk4BbGOxcU
	 GX648+2yE07c19i+clQltRxj4eiFpwaaveo0acNkO7QPNZOsayXE32GRJ9C3LF1ZdtSH5
	 q1fg/4xwoBdLGzQZxSlzT3/QUDFJqk9SaPF1lDWFXOJn++oyaZvjg5/b31DgEROmy4PdF
	 7CqkEn012J3gZrFY6aXR7vEiC0hjbZpVgelkIhnFsXkHCMv+07DVXE5vN8DT+ku8EwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089620;
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
	bh=QaTPi0xuZkOTd8/JfwaHEscS/ChGOlIG5SUpkPmdFSs=;
	b=3QKf/bFaqm7BwUkN+fSNG+Da5LUQSG8Z7iYUmopWGxW6DUBXbWUirWxA9vU993dIDsDf
	 A56nAzd9WDyouWasKZDYD5T6Ml7bmdvGyh3l/dj1XBXjiXCsYelqvi0OzX6/0vL37jI5s
	 myschrY6OoygDZImjKxrGVQXmGQ5ogsD/DZDkLjQYJKqT45sc1rGkj4oLGiqtivzLUBeq
	 FNiQf+vp4LnyuzhLzjj6pavrCii2Lyiv1MorzZzXQ6c4UeI0LdcYaJ6hG3YpkfaZTJUPJ
	 dcaKRT3iM2OQLrlHbmbro0rPQLltYkSpdwSPQzGvNAa00c5KIw9zKtDe5P+QOW7ZpJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C2BgSVtv;
	arc=fail smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3190606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3190606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C2BgSVtv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793089620; x=1824625620;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RC8k8fzFSNrRwpQRsWiCKVpXvkYXthyjfmT2OHVGSGQ=;
  b=C2BgSVtvB7z+6PBirulmXEFv5pSsOG+UYxH1MEhbr0WKgEMZFSxA8kd0
   MaMot4kcROOnZQG8H0Ee3YzqKBkzkLwh9z6zsfIxsSEkIt3v1jKelB5Wp
   zH0VSo9tjAqtPqmYN9Ss2TSdldG8cKgCgTNCrpg/fZmA3Y2niWhloFEGp
   JH5X/9kvYn9K9td3jP0BAz2KFeO4esgndzb5Mk6qQbwEyEUOckYV0rV+e
   WMIITkwiawO+Qxz9Sv8aspknHVz2xSe8a0uUottWbmN/AA51Dm8QAMZ3e
   z9GN4lu3+qqfPQkkDmpdH5gfjUC9xKL06UWpUMLytmzhXfwupoxSHIZP7
   A==;
X-CSE-ConnectionGUID: RNTVWWOmTl+tAbB5O1RL6g==
X-CSE-MsgGUID: Kwk0DZmaRUeX+g0D09XxNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1675534"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1675534"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:26:59 -0700
X-CSE-ConnectionGUID: XOVZBLeiSS6SRZfA4yOUkw==
X-CSE-MsgGUID: jDwtvFhQSf2szwkVhqBbVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4526161"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:26:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 01:26:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 01:26:58 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 01:26:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBs0Dv3ZrCLD1XiOn6kBTHcV5MYPRdkCoHitk1o1WiA5QplIrGWw7ulxvb6k6dU5Yrpsi8/fT/MJDphNw379Y4ajZGLQDcfx+NA/CWhqN1pUieNuFGS7BX7o7EVD4Mh101AT8p39WS2kXansywopQwmHz+ApN0sptqx+GaJoOnTkbJfZGrHtX+Gik+QfuVd8BjBlpfW+ria216r18RXy/Q4tO0S45zowTeLEeWNFvXkam2pH8SDCdnW8fJZJ73xsCcNaH8T3/+PBKCx2iTPQ9ZZCkZ5s/QBNHn/k/sV6rZSroxW4gdVGUU7jTLiXty4CxbC6pLAJ/uXBdLCkCIDE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaTPi0xuZkOTd8/JfwaHEscS/ChGOlIG5SUpkPmdFSs=;
 b=tTNrDSloSUAUKN2ERIv+tInAtjfme5VGEQj2nGUvKKtGOAZ7OqsNoRnzYKcRq+wdWkwxWiLsrZA0SR0xYciuIVctKhOhZ3N9pQQBq6EZhpXH/lJMTei9VrCkJtQ1YY3mE3pqTmqF1oeFbHGcgsYQq6WvGkW9zxTFWjQznCHRBYGmWJY6/gSGNFgZtM69ibPZdhe97fD+OD3EsGq01sAWMwvpO2I62E5xaHowQy3SPELuZ3a8ShLJRW5xsYoz/JvwTbrrcPJzd3t7+57dwXL8UD8YE9yD569Yms1cvbQunGifQArqLIeuIWoJa6IRs38d70KiMTGWxNNBfjOToXNifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:26:54 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:26:54 +0000
Date: Tue, 27 Oct 2026 16:14:01 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>, "Anil
 S Keshavamurthy" <anil.s.keshavamurthy@intel.com>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v9 03/12] x86/resctrl: Parse ACPI ERDT table and save
 CACD cpumask per RMD
Message-ID: <auBdSeJUJqKx6MGu@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <90f0d5e1139e6767ebce4ca78eca871ce48c7315.1791933001.git.yu.c.chen@intel.com>
 <92ca4378-0bce-4638-826b-9ce23a1b5cb2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <92ca4378-0bce-4638-826b-9ce23a1b5cb2@intel.com>
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: b545d0be-81bf-40ad-438e-08df34040ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|261009223027099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261021135927099003|10067099003|56012099006|261026121527099003|6133799003|22082099003|18002099003|4143699003|11063799006|5023799004|261026140227099003;
X-Microsoft-Antispam-Message-Info: 93DRLq85ZtcQ6pkGEjSrghlFLhNLKbh6XGWDTfzfhCENWhrWUrYF/sfLkG8HseDIUYuHr4glaIZxC8GyfB/FCyfkbos3WXXTSNt/elvV1kpvQL2+ebFQZJDlN81xLrDfWOuhButtXuiwuqstqE+s1UudJL9CQPxCLpxo/J3T0wEdjjnD2EHYxqv3W5g72DQlfl3I+yMg8I1+fTJrrzBL8EKg1URA8nBvTns3YNqmPrgbspYr/oH8cXyCF/f+oKrUwJ1Fxo5OKRIfb2NCjhC67Eb1lgkKn4bOGTykE1UTMXJ6aAumZmog2eebIu2VnW3zlA40nfIVWH+3eJuIjXQBg4fBYbGL53xQJ9ieh/sgH0HkLtgpvei7ZmSjxFne+j1Ch5K7p8jR9MXew0Zskn0WjSF8RzzOeb7hFdmuKJBkXv195GOzCQJM56CLoQHZyJeJsdWEqEKVQENCja9CmimitgolaZoy4fXknckgWFkmy6/jR3ADe8P8lmgyfxXIQetnRhs0IpLtnZ5cUv75jtxtj44nklgi1UJJxrImvhR/Zfls5O3zr2LyZz/1IzE3CQbnngQolLvnKA3Wxbj4C8WBhLrXwk5DybndE34vbcZhR+V/1iYTFhm6ebWwrh5gdz9nS/4oxtCaohMfeU9+KS23TtuUvk13act89d1xHyl529M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(261009223027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021135927099003)(10067099003)(56012099006)(261026121527099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rNs0skLWXp3s8QzKRCCfeAtFBIgcVn7np89eytlNgpclDhrZI3ErqJykqJh/?=
 =?us-ascii?Q?p9zklrAA154PMZ5tM7IbLQUosGmKXMTsPhyUHlA5fhhm1ly5NrtAkastwkpB?=
 =?us-ascii?Q?1LYvXGo+RaQfQs+07gymWUol4N9+LM5JbeN8/iv4vtrC+aymQjhjuOjfYBBn?=
 =?us-ascii?Q?mKTaMAk3TBHcBWGZqiw/p7x/FqcxETT5ua3Un+hg/uh4QBNpX0ufRvXQ2JIZ?=
 =?us-ascii?Q?9KViGO50voh981zBBXZC1O9D8Z7zYFmqpAs8E+QAYdSjG3XSMI/jsSjwydTN?=
 =?us-ascii?Q?vZV3ct6qRlKU/E8a9TdXS2OBq7fXDZvYsj59vN8BVD116+YABao2UklI0fyo?=
 =?us-ascii?Q?gDkFRYgIILh1uasbZK7p33tlShjatLZJroBRhsQ7TiApbRAO5sv6whadDdTx?=
 =?us-ascii?Q?jXffLXhBOwzIz0Cubp5M8RwFfc0ds8QeKgNS/TWRSXdBXdthuYuS9ulCzkNt?=
 =?us-ascii?Q?lscONE6ZW1Bb0GzNXP5H+w/UuEWUe2Qt1ZkV3pF7sJcBNQarG9i+TuSyOqEL?=
 =?us-ascii?Q?tovZjUdwhZvHFfG3wh3GTWsiMXxb3tN7XQpgoXMS4+zSOWUD7IpQVo1k/kBL?=
 =?us-ascii?Q?Sy148vxlo8jCZsmYejKsOE02qEg83vP7TgXUh4rimJDWpl3pO3OLPUQD+Kez?=
 =?us-ascii?Q?JmapkLMdB3yV3W6is898IHqb2yR4tbTHl6Tet2SenpaExvMF0f7/S6AImXmH?=
 =?us-ascii?Q?ZKcArcsEoB5hFWhW3IpG7tMZjNPY3no4foP5U3dgOZufKTPBnlI+WL9kbbkN?=
 =?us-ascii?Q?RMbhPw4C0JcuwE/6i1sBhtDSxXDJfXOlXVIswhrtBs8qxp+X/Gu+mvhD6qzc?=
 =?us-ascii?Q?9oJ4If4aW551ATuGcS9Fr1Vv5FU0NyJSHmP2HcdcbZFEKw+z72i5iigg3hze?=
 =?us-ascii?Q?H6vx8C/FSUW0+Nvw3J/FdWfo6N1dYszn+05iy7ugoK9FjQx0GZZBK50xowEt?=
 =?us-ascii?Q?R3vsqB74EZRvP7yPVtJmNpL3GMj46SXEJtaoncnWrZar0apEgRwzNuuu/fkI?=
 =?us-ascii?Q?Vw+jy0GkWHfbpenVJAiQNTR+avrZtPeHhU04NfdYEDQsuhzqA/HlKrIRK37W?=
 =?us-ascii?Q?+H0x9qgxhMZUTJ5BNgWMkxHDGz1tNaFUQHnFulZ2XCsbHWcXiR0JlOyv+G6y?=
 =?us-ascii?Q?0kY41hgYqVwGdjxVqcyoZ29fwy9tfY0kXwAhFOsicdnQVvAVWEjDkShXHfwl?=
 =?us-ascii?Q?JPKb/iqKo5IGeuA2evT9rYilpruPQ0A+yCP5EX3CnjiHjzgXexYGO3CZ/nf0?=
 =?us-ascii?Q?4WCGYC4apkZ7qCM2pyyOIG3NvdEY9/swm4f0KWg/6XdtKYrmrYGErUj+yNQ5?=
 =?us-ascii?Q?vlr1pMOkrOpjEnVh8/j23yKz3Qc3I3c/o4Hwfvu7f5xjPi96vcG4crkwtyRG?=
 =?us-ascii?Q?9rPocCDUCgM0xeLDlWTouinHWJdISZJAbQeTCy4OYsVuABzWG+vdbGqwNBMK?=
 =?us-ascii?Q?tWWmIUH2Ac11c87N2oLUiY78CnMMPsWtIjAISDGJ3gRUh7BxOFOyRoPqURNM?=
 =?us-ascii?Q?enAUL7YENwX6dl4T/ejGMLtnI0SYuglqxOQitBSv/A9C3uqTdSWsFkCBLngX?=
 =?us-ascii?Q?M+3PJq3WtsF3Sp6rmOhrtvUkh7SYBcQ5n1dZHJrJThRkICgHNIx0JzxbJAJv?=
 =?us-ascii?Q?XZMbMceRxwMTi6b+G5nMxcqI3gioIOZ/Yp5SivAhbbVudC1/9sdG0dv1n+Ak?=
 =?us-ascii?Q?KnL8w9uE84lS2AD/Mxc7/LK+uSg0xFS6DIo2AQ2xhavS3edonG+3c79gCbcQ?=
 =?us-ascii?Q?4dQBucO9mQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: KJZxl1HqD7N4/fOjY9zvaDZP+SXAHS24rUr6eLlSdCKvozcdZ2MLnh103+lnqPxxOPe/nHd4OnCIMVzOQ9/t1KwS52mdm+eYQeVyzFPe7ifQHsQUav7KJmhOZPuMkNOzhH10YdzEknElPkySlNAbLK7caVJ6y/9UOSUHRnctPiNM4zHrBQ7AtLqC4TPLFR1g+G1aUjzI4FfYMKgujYYeky1dWIiwYi3cwcAtW6DLHOJRapSIiRhrYj/M2bN24EBx+Y5ZzsrPcnd6wMvrnafRBlncPYYVhL9MBLi5bsFUk3+FF3QwrzEAJzcuC6g3WWSGYb1ooymZJEiF//pGB8X/8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b545d0be-81bf-40ad-438e-08df34040ebe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:26:54.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztLE9FM2yxVW+vxC2u/I9j0Glq5BmoRaSMINZuPVqYiWuyuMpru63vxBy1UJVg5HbpIRKgJtq2JOOdSDnS14+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
X-OriginatorOrg: intel.com

Hi Reinette,

On Fri, Oct 23, 2026 at 04:50:24PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 10/13/26 7:58 PM, Chen Yu wrote:
> > Enhanced RDT (ERDT) exposes per-domain MMIO registers that resctrl needs
> > in order to read hardware monitoring counters on the upcoming MMIO-based
> > path. The kernel discovers this hardware through a single per-platform
> > ERDT ACPI table.
> > 
> > Each Resource Management Domain Description (RMDD) sub-table within the
> > ERDT table represents one resource management domain (RMD). When
> > RMDD_FLAG_CPU_L3_DOMAIN is set, it identifies the domain as a CPU-scoped
> > L3 domain. The MMIO base of the domain's CMT counters is carried by the
> > RMDD's Cache Monitoring Registers for CPU Agents Description (CMRC)
> 
> Please drop this sentency about CMRC table and CMT counters, it is unrelated
> to this patch and distracting from what it aims to achieve.
>

OK, will do.

> > Changes since v8:
> > - Rename the subject from "... save CACD cpumask for RMDD domains" to
> >   "... save CACD cpumask per RMD". (Reinette Chatre)
> > - Rewrite the changelog to lead with the motivation, drop the duplicated
> >   first paragraph, and add a diagram of the ERDT/RMDD/CACD hierarchy.
> >   (Reinette Chatre)
> 
> Did I really ask for a diagram?

No, you did not. I added this diagram to help describe the hierarchy
more clearly.

> It is nice but I think it highlights
> how the various domain IDs can be confusing. The diagram shows domain_id at
> two different scope which raises this importance of these values but these
> domain IDs are not actually (apart from some debugging) used in this patch.
>

OK, will remove domain_id from both the RMDD and the CACD tables.

> > diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
> > index 273ddfa30836..a975c73e273e 100644
> > --- a/arch/x86/kernel/cpu/resctrl/Makefile
> > +++ b/arch/x86/kernel/cpu/resctrl/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
> >  obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
> > +obj-$(CONFIG_X86_CPU_RESCTRL)		+= erdt.o
> 
> nit: erdt.o could just be added to the line with ctrlmondata.o?
>

OK, will change it.

> >  obj-$(CONFIG_X86_CPU_RESCTRL_INTEL_AET)	+= intel_aet.o
> >  obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
> >  
> 
> ...
> 
> > +/*
> > + * The minimal max_rmid of different domains. Using minimal is to avoid the domain with
> > + * small RMID accessing an invalid RMID.
> 
> Going back and forth between minimum and maximum is confusing.
> Could this comment just be simplified to "Largest RMID that is valid in every ERDT domain."?
>

OK, will change it.

> > +static __init bool cacd_init(struct acpi_subtbl_hdr_16 *subtbl,
> > +			     struct erdt_domain_info *domain_info)
> > +{
> > +	struct acpi_erdt_cacd *cacd = (struct acpi_erdt_cacd *)subtbl;
> > +	unsigned int num_ids;
> > +	int cpu;
> > +
> > +	if (cacd->header.length < struct_size(cacd, X2APICIDS, 1)) {
> > +		pr_warn(FW_BUG "Invalid x2APIC ID CACD table\n");
> > +		return false;
> > +	}
> > +
> > +	num_ids = (cacd->header.length - sizeof(*cacd)) / sizeof(cacd->X2APICIDS[0]);
> > +
> > +	for (unsigned int i = 0; i < num_ids; i++) {
> > +		cpu = topo_lookup_cpuid(cacd->X2APICIDS[i]);
> > +		/* Skip CPUs not in the possible mask, e.g. excluded by nr_cpus= */
> > +		if (cpu < 0)
> > +			continue;
> 
> With this new change it is possible for cacd_init() to return "true" without
> finding any matching CPUs. A "true" return would result in an ERDT domain without
> any CPUs added to the domain_info_list. Should such a domain rather be skipped?
>

I see, before adding the ERDT domain into the list, will check if that
domain has any CPUs, I've changed it to something like below:

	/* After iterating the RMDD subtables(including CACD) */

	/* Skip an RMDD without any CPU, for example, all excluded by nr_cpus= */
	if (cpumask_empty(&domain_info->cpu_mask)) {
		cleanup_one_domain(domain_info);
		return true;
	}

	if (!valid_subtbl_mask) {
	...

	list_add(&domain_info->entry, &domain_info_list);

> > +
> > +	domain_info->dom_id = ERDT_DOMAIN_ID_UNSET;
> > +
> > +	domain_info->base[ERDT_MMIO_RMDD_CREG] =
> > +		erdt_ioremap(rmdd->creg_base, rmdd->creg_size, "RMDD ctrl base");
> > +	if (!domain_info->base[ERDT_MMIO_RMDD_CREG])
> > +		goto cleanup;
> > +
> > +	for (subtbl = (void *)rmdd + sizeof(*rmdd);
> > +	     subtbl_valid((void *)rmdd + rmdd->header.length, subtbl);
> > +	     subtbl = next_subtbl(subtbl)) {
> > +		switch (subtbl->type) {
> > +		/* An RMDD table has one or more CACD sub-table(s) */
> > +		case ACPI_ERDT_TYPE_CACD:
> > +			if (!cacd_init(subtbl, domain_info))
> > +				goto cleanup;
> > +
> > +			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
> 
> Should this bit be set if no valid CPUs found (in which case cacd_init()
> returns true)?
>

I kept setting the bit, because it records which sub-table types firmware
provides, which is what the "same set of sub-tables" check compares. An RMDD
without any CPU is now dropped right after the sub-table walk, before
valid_subtbl_mask is set or compared, so it cannot affect that check.

> > +			break;
> > +		default:
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!subtbl_mask)
> > +		goto cleanup;
> 
> How about a check here to ensure that the domain actually has CPUs before adding it
> to the list? If so, it may be easier to map ERDT_MMIO_RMDD_CREG *after* the RMDD
> has been determined to have some valid CPUs?
>

Yes, I change it a little bit to:

/* A CPU-based L3 RMDD must have at least one CACD sub-table */
if (!(subtbl_mask & BIT(ACPI_ERDT_TYPE_CACD))) {
	pr_warn(FW_BUG "RMDD %u has no CACD sub-table\n", rmdd->domain_id);
	goto cleanup;
}

/* Quietly skip an RMDD without any CPU, for example, all excluded by nr_cpus= */
if (cpumask_empty(&domain_info->cpu_mask)) {
	cleanup_one_domain(domain_info);
	return true;
}

if (!valid_subtbl_mask) {
...

list_add(&domain_info->entry, &domain_info_list);

> > +	return false;
> > +}
> > +
> > +void erdt_exit(void)
> > +{
> > +	struct erdt_domain_info *d, *tmp;
> > +
> > +	list_for_each_entry_safe(d, tmp, &domain_info_list, entry) {
> > +		list_del(&d->entry);
> > +		cleanup_one_domain(d);
> > +	}
> > +	erdt_enabled = false;
> > +	valid_subtbl_mask = 0;
> > +	first_rmdd_domain_id = 0;
> > +	erdt_max_rmid = 0;
> 
> The ERDT API seems to expose these globals via helpers that resctrl can call
> at any time irrespective of whether erdt_enabled is true or not. For example, 
> patch #7 adds a new global erdt_scale, and makes it available via erdt_get_scale()
> without any additional checks. If this is the plan then it is very important to
> ensure all globals are reset here and it looks like erdt_scale is not added
> to this list when it is introduced.

Got it, thanks for pointing out, will add erdt_scale = 0 in patch #7.

> Also please consider checking if erdt is
> enabled to ensure a sane value is return from these helpers. Doing so may be
> an easier pattern for contributions to follow than to subtly require a reset
> here that is already missed in this series.
>

I see, will also add erdt_enabled check in every helper functions in subsequent patches.

thanks,
Chenyu
