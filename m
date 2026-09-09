Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9413576EBA;
	Wed,  9 Sep 2026 15:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968921; cv=fail; b=s++XnLpQJw3Hrx/MGKU7sJn2obYYh//yo0Gkr31GqiF4C2LZQY4ddJYOJY0a8KirTPAZ7TCkJUG5ksgesiz+kP598xZiwnKVu86WqqFe+h06pf1xMYjfyHoTlF36P0F06p4uiTDMy2hT8JS/lA/bSXHKMbXwm8F2HiQTP2yz0BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968921; c=relaxed/simple;
	bh=3Kc1L0BaH6KJPXlzV/6X3hSUIJOA1Sugv0Cf0Z4pDBE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JdjqmMmVriN/iuQd1Qa1HoKtA2NirInrrVwam6ap8jdKioVSUvIHwoq58Wmy5Khpxu2QiwgGZvmNFh7nZytcr9ZQZr5K1iu54W8/YSpoEhXkdx6ELjmGGEOsnerSdwlSeZbc1/A7TN4D663GA/SfL6Tcw5mUQP8bKSvE/hvH42s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePn0IkZQ; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePn0IkZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788968920; x=1820504920;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3Kc1L0BaH6KJPXlzV/6X3hSUIJOA1Sugv0Cf0Z4pDBE=;
  b=ePn0IkZQLfn/+UFBbhWlsdRfHFLAitytkUFGQDMC05CXLLVuswJLWG9M
   hqPb32p/4eIukDk5wxeI4F5dlWWmG3oSAoG7NtFvibJtxaZcv1F1AbBGF
   0AdihBmukEmNLddMCRn/OBE8dRgQ5wnX4iQB0dq3hr+EWueYy5HnzMcVZ
   ziotEj2lteUfeONyDsgC3zP//O5xlR3PMNWx/ryoY2ISRyoy/uqKABT8z
   iJTMFT2R7+7PXSiGxqFVdTqzkPVI1Gb93gH6rasmExX+t4r+RsdanYpcw
   kNChaMtnMCd4TZDKqIGjOAsDEQ2hseiStiHIoAjAe+jyUJaezjF8CQyo3
   w==;
X-CSE-ConnectionGUID: 2BSD9aLdRM+ddRHx9B0UBw==
X-CSE-MsgGUID: Ofb5//d1Te2Qz8Z5TWbdWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89431448"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89431448"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:48:39 -0700
X-CSE-ConnectionGUID: RT7u527mTJmar3CrXRisMA==
X-CSE-MsgGUID: F7FrAuvgS4mUliLk/oRnrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="269590253"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:48:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 08:48:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 08:48:38 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 08:48:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5wuHY4YZIaOzpZcEE4D/oNRu0BlK00aEJmgZ3Hq6RxA0OwOB1Nhz9OFfXlA8ZP7EVr3wNxXrMIZZQa79F4PucNwel1U13abVMedcQfDW4aUhgReWUakFgxP/C8wIcppvo99TaJEym5RPcz6K6Kxg3fr6ELbr3i6BDPnWVTlXNqU/YHwm2KlQJftlymoT2p7d7C7EXD0jS6Sp7dAjSIrQv8SQVwh2DHkupnqu6sZ5bjqzr8GheAGEOedwKRHHaejeOMct1+QsZWoFGUwI/SrmBVxmiQZP5bJOFRkrsStdVsoNbzJ2Z0Yd397jRJSlokkMY3qCGlY+qyJRTlybi4P1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Kc1L0BaH6KJPXlzV/6X3hSUIJOA1Sugv0Cf0Z4pDBE=;
 b=AyjECSkna9g04MNIBqPFhVLY6CQl3ZArLGHJPt018HL6hC4jdDJLD/0JAFH8UkqmJ895hdKG7nUkXdmQKDvPJ2dRCiBcOCF+K4JoDSQj6CWhNh3ZBiURv+m+/jdALg33xrOjnSil7dCJSxjPlCeJd4W1iWzwYDauBXfNkc91GPckpZkrEvhULfNNZ5lBvP4OREDeFVM29YVjFv6/1/LFAG6ZnGgmgxWyJeoOUivHj8Ha2NxD2IE3qq8y8d5N0z54qHDomcBidHxnd2umUqXxYRDMyiAw47wc7XaVlJbzRNmQ9kVfrHSVgEwHj6VTFiSSkA3RgfGuJRtfykVW/xfF/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DSWPR11MB9953.namprd11.prod.outlook.com (2603:10b6:8:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 15:48:31 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 15:48:30 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Leo Zhuo <qzhuo@nvidia.com>, Borislav Petkov <bp@alien8.de>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] MAINTAINERS: Update my email address
Thread-Topic: [PATCH 1/1] MAINTAINERS: Update my email address
Thread-Index: AQHdQG4oBWj+KZ5gc0ajhRCUEVZKirbGZDjA
Date: Wed, 9 Sep 2026 15:48:30 +0000
Message-ID: <SJ1PR11MB608383B6612DB096E8ACE8BDFCB02@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260909151531.69074-1-qzhuo@nvidia.com>
In-Reply-To: <20260909151531.69074-1-qzhuo@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DSWPR11MB9953:EE_
x-ms-office365-filtering-correlation-id: 1cd4cc7a-70db-427d-2788-08df0e89cc0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: /EsIx4GDUTk7HJuCDzu0sWUiPvX33cuR9W/miHynXMA/rUr2QE3IoukX7F2UgrVnpz5fs4WOi3tHCkFUFrCdCNREjDxbrPBfNJBk4eqhf5fKlUkmPY9/oy6LkQmtk8H/X/5KIM9XmkgGxgW6B2AM4wFIpn04YmNPPl/00Y4Ud5j1B+6fb0j52oXDLL1ojwJnc/vYYOwRjsrPy80YUCNWEkpGIPrx/v0JPaZ7evvG1+JLV+gHjn1ZmhuCv676NZjqzS0moNT4tDoTyNFL402WkZe92DAz5ZRnhMGRs3KlzRmFbZIBkcYecrqlCWrRvOYeMZsW1X8keP/S77RcDojKlm4nrNWbwcsFo7uKkaYbZouE5lmtKGgNqvVVX4Ii43oi/0AdcBEosGfZEgi28DvY6BYI79X/2pm/bFp2NQmEREZ3ne/bfSQCfwOlotWmsi4Qixh0m7Ur81mFCtwdKl05rGG99H+AfyUmGjwt+ocvOSCNMSTnsypDQzB4X7YhAWAywC0lTGoJpvvyd5CdaOVHaynGwzryd9Q6mPfZ46rwO6bGOsI9hZZ/HytGDw6z39kXWB0nyFZjjN/CcUryq9ExPFYk/3SH6kRGC+kz/eITZzUAehCquCDZkc45ezvIfAtDTVzUabAgXj9XJMo6x93CUJBE9pYPeg7aFwHerA5COl3jnoiNbpwgv3QwJ0xzFOX3pJRmr9LoJB8ZF4nT6ue+NzcavQc5u0dwOwQhGz/7HY4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+hKsxe9QUdSrLrKQkiCosJEQO7txsGUbfKdzObFOVcAE4SZwhPbX0ikf8JSo?=
 =?us-ascii?Q?9Y7l4QnzBDN5HFP5yP84QickWxGIYzA4BxRy15rQ9FgNjaBOyJaC1plQXhy6?=
 =?us-ascii?Q?tSukg3JqSycL1y9nSail+nPZp18oNImxEl8tHnGHrbqDNT+OoU4cqTuV+gN3?=
 =?us-ascii?Q?wdk5uk/zjXalPiTuyjyy0Pea5ZvqpbT2oraK5CbVNStkXCb/JIi3ceEoX4eD?=
 =?us-ascii?Q?7HjMjDftXQ+awjnSBaCnQxaYdPm4o4hbBEBTC0QTrY1H78PjWQ812/+BcS19?=
 =?us-ascii?Q?ouJr5wmWrMx4fISvVwmitV2Nw0+Z/3otdoYcqG892vF5orTl2lZuhN6BOMHl?=
 =?us-ascii?Q?SrOoW19LlM6XjoSuJxvXnlIxRsaiRH4WRdaz45zvouT24CMNf7YThZ/+5rxv?=
 =?us-ascii?Q?8jVeMjUOx6QsNCZwDSJyMbqjkqQzAeBF8hEbv1106Vt2ivF71NDVtr33Kg6D?=
 =?us-ascii?Q?VDLbCu8X+/oXJHMdgswzgtMdPflZSHYGPavUkXcorv6JC5Gn+nhWytxbnwwV?=
 =?us-ascii?Q?T5iuHJ8V1StPVV19bVlFUwbXhw3P0tZeZItzeKOBeSuyh+aiJp2Cv6O2j0qe?=
 =?us-ascii?Q?phGNyCd02MoooY828lTnZHMW1tgL60Aksd1UvTXiAnJP4LekZr8Tjx3CY+j9?=
 =?us-ascii?Q?ukokwFt05Hy8EzPdXIol666pNeCdgXfVW3EbF73CO1SuvUU4Xivh7xhw3FPD?=
 =?us-ascii?Q?njNwOPgkA1GNlRhRnKkyg6QU2c2FHPAW2WzMQcPlNFFh8JlZCsRR1B1RsJCl?=
 =?us-ascii?Q?8fSFfGe7luxc0zNutEGUVS0SlrPBu7tI1/AvocHobWicviX9q4DWoQUigXNx?=
 =?us-ascii?Q?A76hT+I13ppMHOByb8mpqfOKB2xwRQeh7OgmUCiqgWRHRyQ+yRlNqWJlGSFi?=
 =?us-ascii?Q?VMqCeZUahtB0zLufd3u9fGvbwH9YzZo8e6p2ZGheGKyAaEzZ0mmmEuMmMJJ1?=
 =?us-ascii?Q?keaccXvmtuQY8ANEiVp7fuzdPtmTBGkLzInA4fU+9ufFRfgD/vXhEojx1hJC?=
 =?us-ascii?Q?e4YlAuHlV6ya9OekbzUyIhu+Y5mzIcYxfK11yaZYhgY8oYQeyfiAYE2DW1bJ?=
 =?us-ascii?Q?YAzCzBaafog3m9CBx3/gzjrZmV3zpUoAUsuNizUH0l8PxRhJ/ynkEbTdyejQ?=
 =?us-ascii?Q?sTyB/y3rRhI1EzwJ4G3J0ijCZmT8dDMTHSAa5/49omjaoxJfS6Z3D3uOP0RA?=
 =?us-ascii?Q?gFULIAv3iMIBAcB57Yh0UfCoW3NZgEHrHsiDGwDa2LocgbDsc0dCWWRuKicj?=
 =?us-ascii?Q?ODV8xT/0HrpO6NW8YHrWbyXLy/x/R9xaKmfYXEF2OkWdQl42qney6gIFg/mL?=
 =?us-ascii?Q?/HM7swbJTQmXTFgdDNAiw/UIxbDn6Nf1m4oD4093WeggPJzhGfT6wlvX5TI+?=
 =?us-ascii?Q?9/J/ZGkJsn4nKoJ/YvcZer93XcX9dAmXV+1Sc0fZ/zDmfIfoFjXElU+auIkn?=
 =?us-ascii?Q?DgsgHlEDVA2NUbfl8aXejExUGJoMnfEXnUg9rMdVtaZzJIKUjL82gUC9Zlhv?=
 =?us-ascii?Q?ZXrnKVjVI1IxgI1GfMH2zuR4RNwLdookN+vheXD3hKjc9NXPWh5VM7j/orJo?=
 =?us-ascii?Q?KgQfs145uDYzKF8YaS8HV8KxKFYHRMcXcim7Wa/MxzyEKHrRnRvbUvGULbQS?=
 =?us-ascii?Q?dsdjUJI7KG9/Xm6dYmbGWyO2Gta3Owbv9/Wb/tdpptSnCmHamXwNV7+Vu1L5?=
 =?us-ascii?Q?IUJmdKVkvgGGh3ZoSUEt7Ys+iMFeckVXNdxnCPbDJ5bzwmHm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: a8HUcnUJMDto7uzTmS1uw6e6odOACWrsKdoi7cdZlb1kp2et+APrQQ51qZhqQSHEM0EUwqPT2SBFV7PG3cgocpMKTcdansc5uukLlZLZO/B31GsCtiZwrlxrLqAKL2i9TR3fqXNcCcx6O6h2cWYUdbLmtZ8EtjZvMr1AqQzapzpX+BFtwpBRjTQapGwI/YOmLu/NSEOAQBBR6lkBw/v3/dRobKH4OfOdlkv2KqhfGm/LNPGKYIyVDkDbp7nIkA8Wz11ZvJ35m2Xx+r+tTBxCFRp1esZxVMAWXFZa6ljfeOrY1cMOeNi2KPP1HmVuQ5eK6DbZigm7jVHPmA2Ez29EyA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd4cc7a-70db-427d-2788-08df0e89cc0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 15:48:30.6310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXiBFK74xIb0maP08qSvOSSNicwQsfqC3vXg9MeLLKNGNiFq/frVxRKSZKlrsUdzWMRhSVVS4gJexTvrkJjwnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9953
X-OriginatorOrg: intel.com

> Following a job transition, update my email address to my current work
> address. I'm willing to continue reviewing EDAC patches.
>
> Signed-off-by: Qiuxu Zhuo <qzhuo@nvidia.com>

Acked-by: Tony Luck <tony.luck@intel.com>

