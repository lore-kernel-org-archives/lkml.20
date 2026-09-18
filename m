Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E8734FF62
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697353; cv=fail; b=IwsgNkPylstXoPpVU+udl2ymmEv5u4DqWGUb4YfiSAIp4veeR6uAid+nIViRj6cmJ3Y7hP9MzvaHiBjZY7OFUQbSbQHHTphG7qvqd+cEolhQ8SYGmU/jai7qySXR7hrXEn7NWqcHJ3DL1VUPpseOMtFmigyXMO71k8yHeArgHH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697353; c=relaxed/simple;
	bh=qnvkS8Ugc0luFo5MOh2q1ftbdhCpwaflfNvppMGx3tI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=St70kDnIFO80LEh4glSAZXbv1EqA1C5ZApzsI/NfyIJB8vIbNEZCW4lGsrEuUppN0maxSAjGfrKB38twRhSMPQY6cvwZSMmyql8IfE2VkAwZEnBFUyvEFi8AfJM2228k3OiVl4369USsQgtUo3k+utlYWNpkWLTyqo8tyLz+0+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/eIMRDF; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/eIMRDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789697350; x=1821233350;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qnvkS8Ugc0luFo5MOh2q1ftbdhCpwaflfNvppMGx3tI=;
  b=g/eIMRDFwd2Eis4in6sxPr0HY7+6CShgaG9IcVLIr+QQWNKc2oUpVOdI
   70ITP5w8StargOwwKyUN1VaYv/e5z8afTCGlfocTNCO4eXT/nCn3hAjfT
   7L2PhjWS7g0aZk2RhpFIN5Fj8NDMoCzeDL/4/88rPR4oqj0K9J1zETIED
   LpTS6kYLDLbLxvgDwNN5C/1D7WZY12tmPqcm+nzl/qfMmP1Y/p2LsVdz0
   PNBrKohWYerMGymX2V8X6ZulxGv5n9rYMFv2AW9nVdtQJTcniUuxfUj+z
   hEO/cfE0qlAuybwUF8g2XoseMFcaD7KtxJ9uA41G+CvkDOMZ6QZtJDsQ5
   w==;
X-CSE-ConnectionGUID: hUkcdKp/S7eOjv/W/y9fNg==
X-CSE-MsgGUID: SkK44WHgSZmfixiHdYT/Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77740856"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77740856"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 19:09:10 -0700
X-CSE-ConnectionGUID: +tG+w7iuTgSbIAvKROLCTA==
X-CSE-MsgGUID: JU/yBUzNQXGSHAbfb1aZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269849925"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 19:09:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 19:09:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 19:09:09 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 19:09:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PX6o63l+v8pTn/QHRL3gMZ1zVUQkfKgR1271A7S+VTVYatXaN7bNWzClrsqcgVgLnuScGUOP9JgAKOEEZNx232KV00uUpsKSFM1VVRGQ+K7g1bP0JjpRMeGMtSS7uOwjN0g2NRAzf1kx/QMF+GFNVNmGlFFk/3igRWQa0LScZ0xSGsJ5OKl1HWcDFydPOvMbA5CQLuH7Dxnd2TMZY9QZ/o2kp80lv0Ad5CVJou6m5Igi6MIGVX+h6vFgyUD6Qu5GHdl9nPCGXxXth3ZaxByGiDpaQHnV8x0Oe6nFDlvcu4uTPfqIhxTXMsYa+tOAQcm71XNA2mSD5XgTQJxhcu7cog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZutcnQRcbGji00Y80v0hltNQDtdmfq8xMYPh++SyJt0=;
 b=E67c4gbTXwoExRp19+Jk0XeAlbEYRMMy4eq0zo4rIArzxGHHrJc06kpervcNpTx7WrXntikqWdk7QPgAD0HzubV+bpDUdWWdtELTEjwXydFX2JaBZxbFqScOrCSR1qF8f7yz0NuyALthCCSK+cssYIG0RMyvw77O9T6uFkA34f72rZ6sy7jTiQ3PczleNMnPv8PpghoD5sdXxD44YABGwdi0rGFol0n77+iL6bn66bXYegd598XtaVz2A0qfq2xmc5Lm5ooylQB56vUpAjOYmlNPXVqU1rXWdx+fyQHF3xJA3KqjAZxmDiv/T/k6NVqu/zO4tnBrXk9eUZRjvIgAew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 by MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 02:09:00 +0000
Received: from PH7PR11MB6932.namprd11.prod.outlook.com
 ([fe80::cca2:8c49:b4b1:761e]) by PH7PR11MB6932.namprd11.prod.outlook.com
 ([fe80::cca2:8c49:b4b1:761e%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 02:09:00 +0000
From: "Liu, Yuan1" <yuan1.liu@intel.com>
To: Mike Rapoport <rppt@kernel.org>, "David Hildenbrand (Arm)"
	<david@kernel.org>
CC: Oscar Salvador <osalvador@suse.de>, Wei Yang <richard.weiyang@gmail.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "Zou, Nanhai"
	<nanhai.zou@intel.com>, Chen Zhang <zhangchen.kidd@jd.com>, "Zeng, Jason"
	<jason.zeng@intel.com>, "Chen, Yu C" <yu.c.chen@intel.com>, "Deng, Pan"
	<pan.deng@intel.com>, "Li, Tianyou" <tianyou.li@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v9 2/2] mm/memory_hotplug: optimize zone contiguous check
 when changing pfn range
Thread-Topic: [PATCH v9 2/2] mm/memory_hotplug: optimize zone contiguous check
 when changing pfn range
Thread-Index: AQHdRBpeQYFQ9mVeMEqHN/qStzhaGbbPJ8IAgACbaoCAADzrgIADnGTQ
Date: Fri, 18 Sep 2026 02:08:59 +0000
Message-ID: <PH7PR11MB69324C2F3079B23F8E20C489A3872@PH7PR11MB6932.namprd11.prod.outlook.com>
References: <20260914072929.1883794-1-yuan1.liu@intel.com>
 <20260914072929.1883794-3-yuan1.liu@intel.com> <aqjfyGeQaL4g2EcA@kernel.org>
 <209de483-a9a5-4d98-bda4-7998e8fdc7da@kernel.org>
 <aqmVQeETYhbsl79A@kernel.org>
In-Reply-To: <aqmVQeETYhbsl79A@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6932:EE_|MW5PR11MB5858:EE_
x-ms-office365-filtering-correlation-id: c4128576-9a6d-4174-ad08-08df1529cdae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|4143699003|10067099003|22082099003|11063799006|18002099003;
x-microsoft-antispam-message-info: izOwHtDl05G8ouss2rEr7Tw614cGO8MvNu+Gmn3uSglxpMjxpLqyMz9wD7HkUa0eXXCUPZVNJR75IJUUdVfxoI1bHyQtdbm7+TlzEz5YrFBp3EmSNeHd+k7pRqyNXmIfru8t6FplFvfjaCPQm1wYLy8TAs7sm7i3oIoFSgyBuSFJRT8Zswml2MtutAN/FN70SdmBktkZOy9O5Pb4sy2fp0Kg6nff3wkkiq9zxs4koJ7TzrDaDZzfubWVryuDl4Nd/2oHLVCQPH3GzPYNEgFjCR+LCCEIzm0nPA8m7zW2EMIcwtFmm6pABJVSBHFDb6wvhrR/tWMp/R0m9TWW2/23xMK/pUglmG7iMArDyOrk7Z4euEIJUK/QwkUw0IkR13gCq+DvFKW9H5p8kH8xvV63SQA9mAlUYdBP1ojmwLlpXmMjATK/kQoKnd+BrijAhgwmGSNmtfTJ8zWTBGUJFqICUPEiFlY4kkSHJyiu5Y5MAuaTvuzp1LMgRFcSKnZ5f56YymxreMx33anVX1aQNYHMrQDJCtZU1Tl+L87pgt2Epe99SRgWy2Hh3CQt6bNau7dtn6axTWjORo6XpM+OrkEiNl0clygD52SmKmCIwoHczQVNt99PaKWZUpq8qbcaf8x4YN1KPIXR4aK9plsH8wxVLi6zpP0lsVKrVi3fwG/XgDen4e0UrhzNvlO6s611GaPPgkbvEuxUpVbsoWPkviqWM4Qjd06b7YWNmfIQVfyhWQc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6932.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(4143699003)(10067099003)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?570ale8Qrk3mmd4Cx5ZoCWpNwj/akkCF7b63WE3ANVqsxhmLbYEIakLhkL3G?=
 =?us-ascii?Q?Cc4N9Mnlx3DOVKykDH1iOn1unk6YXaSMi8WtNKZWpR4M0HMqC5WAyuYgcYjb?=
 =?us-ascii?Q?dcpx6hT58UpNUR2FDtrxnPI/BENDPsNyAj+dyg+6DFXRby1OwMluz2nybg0T?=
 =?us-ascii?Q?6RoIzo9MfW0syDsbo1/tUxl7obOGPlhqt7ZssMeezc4RWOUsLUSmHjD/QNSr?=
 =?us-ascii?Q?XmcdkMjaAmExhozZBsMgKj5DHnk5QrFDuzy3So7nCgGU69ja4kOeFSWSJp69?=
 =?us-ascii?Q?qWWMSE0LzoUUMbyUlm5B6dsb7rE4IC1miDTYVPaqPXnaXrCu+Lg5NmOCSZVW?=
 =?us-ascii?Q?5ky3xgmy6OYPe8lYXipJUn1eIkluy7pMb6b2cWkNlPmQREZH+DWPpP2mZh+v?=
 =?us-ascii?Q?3uFELlUCd2lCggMwRA3JKkN/PikxCdziryVB60rCNSIv15pVTNsCKPMDnc7R?=
 =?us-ascii?Q?0ni65B8Yfn7GiekZjB8vPtLLleFSLobKOcdVQjbpHo+5NkGRU9km36zugBZD?=
 =?us-ascii?Q?xpYYVEV6q69Ma7BLVGD51oFDTk43vsOLxV2m81qH2xjEmr1VN74u2ZvkjJcO?=
 =?us-ascii?Q?epwAKvcTDfAt9yJy8QR2Bkr8cUKfBS+m6x3KS+oSCQxayJYIoMyir0mKAvKI?=
 =?us-ascii?Q?zoFsdT+IMHtQHvghcQOxMDTUogbTYotFKZzitSf3jbUBcB7lT30Xlmumg+h7?=
 =?us-ascii?Q?4Q3IdMGb7eRxvrDUp9xk5QjI37JlmzeLjEuTqfS/FlooXwabZJiqdi+Zje3j?=
 =?us-ascii?Q?aLLoVZ5Pcyz3OJJ4lxmF7UmAeQeeN1leiONpXOo/x4P1OrSQbcOM+iun2E9Z?=
 =?us-ascii?Q?RPlyJUTYwraj7VNR8RNFLZUn1akKOr+o46AaG0hHvGbkNjuzI2YUqxK/E7+S?=
 =?us-ascii?Q?L2C3Z7iSnFbLLWgQlDSWXorIT9HCQxn0XXCW+3xa3OKxuHQN6BzY3BafqNvk?=
 =?us-ascii?Q?ySDHx28Fdglu1fJKF/vRRZPzFiR/VOb+U+IrhAsOIHsbWP4VQgEbFi3BISpF?=
 =?us-ascii?Q?ewtABgCq3gmTNRZ7SXxIT0qBoXAztOeFQblS/K729rMAILor/ibxx15aTCc4?=
 =?us-ascii?Q?QsLhi9x0SY8iYuqBqrhgTsCebx954qN0NwHPLajIbRObJHvWNiakSLHEZolT?=
 =?us-ascii?Q?bOI9oUmiQjgHV8DyaeyVoGmwDqTawU3za9LpnQhEcE1cpgc6zbttvnH3MiY+?=
 =?us-ascii?Q?oayE+jzjIHBT5L9rlrW0ac1mog4GGR7fIm5rg80xUtPCuElsblmkcRAQ9tMP?=
 =?us-ascii?Q?WBksCWPYgSebX6bF5jnuX6RyS6cJetGDpd72QrwSu6pFjJfMEw1ARSANGfOg?=
 =?us-ascii?Q?6Mjbj9sN/Xym/0v5gQ3pdqrLJk3FVlgDfkV8E4ANGf5aPhuIwk0on8ZvU3L6?=
 =?us-ascii?Q?+Hve5lt6zDP7qLPIv5NJEWGsatwEeWokkERkQl+L11rc3CXOgUJ8syS4inC4?=
 =?us-ascii?Q?FcG4Akx5AGBarIzk1OejPbFnQDBQPq7AJRx/Ru99YfnZvTmH7iSG+vNBlIp8?=
 =?us-ascii?Q?uXfQ9YlzI8Wv55QUtKPFB0rVRaQpY+y3KNe+q4PBWSzh1iS/pEN9I/yVe70x?=
 =?us-ascii?Q?WaIi8RbQcUnBoRwuID/ovlDe3D4pGVe8m7R7KEfsaZ/UE6liNSsf96Dp38Ep?=
 =?us-ascii?Q?ZiD3uZj6BH3RGlpzv9Rpu1Bvn8MSKFqgGKUyDan494+XoqEkJnRUnbiCq7Y7?=
 =?us-ascii?Q?Vx1NGKMqJkKKjus3MQ3z5iax6deb4nIUcK9s4dp4NDMVLxDI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: w7LngQVMSe5zj/QGo4eXUdTVNbRgI3qlNA6oQrMk/kehhK7vuJHuhTdseyhXW/+ANMnwMKmxgsZyJIInsb4oaMrE8GNMKHSOrYvQ9qt+IQL9BpYn/0zd2c81ZZJ7ti7h/HHN+hHEgkRynhWcwr1p45dWeST1PyIda1x/y0TVtnjL9Fcc90G8xmYNpXq00f5nwWwzlAb3o/2EcnBpOxH5mfJ5beFdnlmFp+nAoYR11r1iIUdE/iOhdSsrh9wtm6xaIEYMoyupCnlD5axL9wcU9RGXktDVeuGnVlcREXJwXZ1dfKWDuCEKyAppufEtPryW7Z5qfHFnfoMJah4oMaQMGw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6932.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4128576-9a6d-4174-ad08-08df1529cdae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 02:08:59.7990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SedKKSttTYlzZY0ATTQChkIGzpCVNYHjNihCkqLuYPaAmeAFLvku3X4oxvapXTF8u0gTS4RTBs/2P+QMUv26Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Mike Rapoport <rppt@kernel.org>
> Sent: Wednesday, September 16, 2026 2:58 AM
> To: David Hildenbrand (Arm) <david@kernel.org>
> Cc: Liu, Yuan1 <yuan1.liu@intel.com>; Oscar Salvador <osalvador@suse.de>;
> Wei Yang <richard.weiyang@gmail.com>; linux-mm@kvack.org; Zou, Nanhai
> <nanhai.zou@intel.com>; Chen Zhang <zhangchen.kidd@jd.com>; Zeng, Jason
> <jason.zeng@intel.com>; Chen, Yu C <yu.c.chen@intel.com>; Deng, Pan
> <pan.deng@intel.com>; Li, Tianyou <tianyou.li@intel.com>; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v9 2/2] mm/memory_hotplug: optimize zone contiguous
> check when changing pfn range
>=20
> On Tue, Sep 15, 2026 at 05:20:07PM +0200, David Hildenbrand (Arm) wrote:
> > On 9/15/26 08:03, Mike Rapoport wrote:
> > > Hi,
> > >
> > > On Mon, Sep 14, 2026 at 03:29:29AM -0400, Yuan Liu wrote:
> > >> When move_pfn_range_to_zone() or remove_pfn_range_from_zone() update=
s
> a
> > >> zone, set_zone_contiguous() rescans the entire zone pageblock-by-
> pageblock
> > >> to rebuild zone->contiguous. For large zones this is a significant
> cost
> > >> during memory hotplug and hot-unplug.
> > >>
> > >> diff --git a/mm/mm_init.c b/mm/mm_init.c
> > >> index 1533aebafb68..d40a8ff23370 100644
> > >> --- a/mm/mm_init.c
> > >> +++ b/mm/mm_init.c
> > >> @@ -817,22 +817,39 @@ void __meminit init_deferred_page(unsigned lon=
g
> pfn, int nid)
> > >>   *   zone/node above the hole except for the trailing pages in the
> last
> > >>   *   section that will be appended to the zone/node below.
> > >>   */
> > >> -static void __init init_unavailable_range(unsigned long spfn,
> > >> -					  unsigned long epfn,
> > >> -					  int zone, int node)
> > >> +static unsigned long __init init_unavailable_range(unsigned long
> spfn,
> > >> +						   unsigned long epfn,
> > >> +						   int zone, int node)
> > >>  {
> > >> +	unsigned long next_chunk_pfn __maybe_unused =3D spfn;
> > >>  	unsigned long pfn;
> > >> -	u64 pgcnt =3D 0;
> > >> +	u64 online_pgcnt =3D 0, pgcnt =3D 0;
> > >> +	bool is_online =3D true;
> > >>
> > >>  	for_each_valid_pfn(pfn, spfn, epfn) {
> > >>  		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
> > >>  		__SetPageReserved(pfn_to_page(pfn));
> > >>  		pgcnt++;
> > >> +
> > >> +		/*
> > >> +		 * With vmemmap, at this stage all pages in an early
> section
> > >> +		 * have a valid memmap and are marked as online.
> However, only
> > >> +		 * subsections in the subsection map are actually
> online.
> > >> +		 */
> > >
> > > I'm having trouble parsing this comment. Shouldn't is say that some
> > > subsections in a section can be offline because of holes?
> >
> >
> > Maybe extending that a bit we could do
> >
> > "With CONFIG_SPARSEMEM_VMEMMAP, early sections have a valid memmap for
> all PFNs
> > and the sections are marked online. However, we might have offline
> subsections
> > in such early sections, indicated by the subsection map. While we must
> > initialize the entire valid memmap, account only the online pages
> according to
> > the subsection map as online (see pfn_to_online_page())."
>=20
> init_unavailable_range() already has large comment on top, adding
> something
> like that there makes perfect sense to me :)
>=20
> How about a bit different version:
>=20
>  * The function counts pages that should be added to
>  * zone->pages_with_online_memmap.
>  * With CONFIG_SPARSEMEM_VMEMMAP there could be offline subsections even
> though
>  * the entire memory map is valid and all the early sections are online.
>  * Count only pages in online subsections (see pfn_to_online_page()).

Hi David

Should I prepare and send a new version based on Mike's latest suggested ch=
anges?

Best Regards,
Liu, Yuan

> > --
> > Cheers,
> >
> > David
>=20
> --
> Sincerely yours,
> Mike.
