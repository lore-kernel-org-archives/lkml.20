Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44863A6B8E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468812; cv=fail; b=FruR4YJ2G6mIZbSX/31mfLJOxq2C4gwmiTDU7aYdel0TD+l32CMdELHemgeAH2Z36CcHOy5fLEiS4xcBtWM7K/wAWJbZ2ucPUuRETuvETGSzvMKif0JOHPZq0rAu6/ctSS6g9QcoPtbBjvTFd+hywZF6FUSLr+sIovoztaMHwvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468812; c=relaxed/simple;
	bh=BK2KlqWfgs3vhThqBgccvxES69sBDk4J0IzceeSGKfU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QnBd64qS8lraRma0IQpAuQMWXczy/J9C5o+AENbBVLsmw6Cb9E1xxbzHQBs4CoH9wPsBB0cTmTkLiPnFK2ryAuQGaWXUMXvF+MTM//sCDDxjHUZ8cCoPvhMH6jslJNpJemToIlA83jPcckBGIkFtNiuiDPYs34dU7xK/reY4SKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7r6hhBE; arc=fail smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7r6hhBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789468810; x=1821004810;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BK2KlqWfgs3vhThqBgccvxES69sBDk4J0IzceeSGKfU=;
  b=A7r6hhBE1EHRjU7PtKThWSf0VFEfliMuzCxvdIHrbdRNNqN2CueCrD2/
   cwUvyMfNRnWWRDKiOMatFBFUfMwqQbRA0TOZ/zjkVsKfNvB69Fm2WLYx3
   NGlFSsm+GhqlNCAo1mMRT8syz61Sh5q4Xo2Qmt1M4L0pp0BNl1ULnRryC
   XH7MYxXY8c3Et2kLbv+vr+r3U5mqY6Rst2/iWijfw8oERnfaCvb8yIPgR
   MN/Eak33Gzc6YChxNIdUC7ijWl3Qfu7xhd+geWHQvt3m1UkycjR+W9Hbv
   oj9NsTGzhBf6KjZC28ksVtEh4mzzZL4zNaaoeLXBwkLGg2etHlF6gf9mh
   g==;
X-CSE-ConnectionGUID: MgDXkafnTdKmHwSlJpfp2Q==
X-CSE-MsgGUID: L6qM8MUeTO+US6lpmUoRZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="338512"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="338512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:40:09 -0700
X-CSE-ConnectionGUID: IzeAZ4gkRXGa10Hy+m3Mlw==
X-CSE-MsgGUID: Sv1QvZizT5y0WfoiEDZ+2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="266757385"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:40:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 03:40:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 03:40:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 03:40:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eh4UUTlGCHpFb+NJse9L7DUG3QXlMOA3AfxTCKdoRjrxSN4cv5FPshpsVPemdL675u5gjRJokQ0QS8s494QbregtoLxoVnAoGPgOQWmth4do0IBfqp+Uj67/GQezkKVwUHhQH1pW7rERiBgdcFpXjc2ilc8zy9n9aZIzoz2jY2s7kIAHuvLBU1BQ2JGr0feO4JKj5nCIYPXmqFHWAx4s6lK2sFw8CBdC/QQ0EjaLkf3mX+ZUdxDhOn5mLsP/Ojj9CB1ndlntXCXZ6W4mPo3J2O36Q17M9s1LVjaCMZvAc9exPakBeHR6T5wnfdZbTfdInaXzqY5lxxrW3M4yFr7p1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/p/lUkHzhWXjSuFTc0G/pzEC0RV2k54CVIJzMfYHpg=;
 b=oS6NbyQe23gsBUsDV+URkFgEoDoJDefSce6YAOJyA0BiMr9VxhD8BixjzskI3Oc5rOTOj0h8HX7UA9a3remzztRVallaZCroEVyiu9vRaDDslKzW15GGe5nDo2c05OE2acyrvVffbch9Lh9WEb73hQBvPkyJfbp+nJGPpYFXSkLbyqD8UKKePV6Quktn/EfgcYTArVMK7akQfisamvtB02KJxFtZx8LlGaCcNCsvl2So3XCLrCU9wVPb2aO6xKSzbWKNfQazyY2TfBZVuPhnTL7fTk0qWtGFAn0XUFPcvaVJdz/YO2BHhNOoGZmpdB0z0UsE/bDa/KSqPVRhgnQE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 by DM4PR11MB6238.namprd11.prod.outlook.com (2603:10b6:8:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Tue, 15 Sep
 2026 10:40:03 +0000
Received: from PH7PR11MB6932.namprd11.prod.outlook.com
 ([fe80::cca2:8c49:b4b1:761e]) by PH7PR11MB6932.namprd11.prod.outlook.com
 ([fe80::cca2:8c49:b4b1:761e%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:40:01 +0000
From: "Liu, Yuan1" <yuan1.liu@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
	Wei Yang <richard.weiyang@gmail.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "Zou, Nanhai" <nanhai.zou@intel.com>, Chen Zhang
	<zhangchen.kidd@jd.com>, "Zeng, Jason" <jason.zeng@intel.com>, "Chen, Yu C"
	<yu.c.chen@intel.com>, "Deng, Pan" <pan.deng@intel.com>, "Li, Tianyou"
	<tianyou.li@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v9 2/2] mm/memory_hotplug: optimize zone contiguous check
 when changing pfn range
Thread-Topic: [PATCH v9 2/2] mm/memory_hotplug: optimize zone contiguous check
 when changing pfn range
Thread-Index: AQHdRBpeQYFQ9mVeMEqHN/qStzhaGbbPJ8IAgABMWpA=
Date: Tue, 15 Sep 2026 10:40:01 +0000
Message-ID: <PH7PR11MB69325D48C3419508FFD8B8BEA3BA2@PH7PR11MB6932.namprd11.prod.outlook.com>
References: <20260914072929.1883794-1-yuan1.liu@intel.com>
 <20260914072929.1883794-3-yuan1.liu@intel.com> <aqjfyGeQaL4g2EcA@kernel.org>
In-Reply-To: <aqjfyGeQaL4g2EcA@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6932:EE_|DM4PR11MB6238:EE_
x-ms-office365-filtering-correlation-id: 191adab4-cb85-414c-1d52-08df1315b249
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: G4ujBGfL8EPzZm7AVgq5X62ENanXM1NcL1LFibIEr/1wvpSHwJfJ0Q991DuUNVJ0Ia4Wb6QrEZFzgz2qzfgYKBv/uT4xHfDHxeQcE8O0dEWX4dm0z1OctX4vmgqZzJt5TRPIbTJgk02gGNelRrsUzqgip0KKv+dFkW0ycIOJ8mzWwoLWk0dO2YBZsneyvBdcla7GNXhMOvvzmR/L35hJEGzp33RAmTDHDsgZnqq5l2iRLQ4FMVJF9Jz/kH272PfGHC6jZBtDl72e3YjxFUgXUMmHWMsbKftwK8IFOaJLEG52+QP2I/jfUQL6IvORNTkzSYvgTbdQs2cKbhBpYUMURV+HfKSHJu9Kqk6n2OahoGJ7PxhnIfq/lWyheGY2sJfjPh+bi1/2m+j7oFuDi9Dx0oNZK1ZyFtuJIiyPujXhaA2FkLSqmzeBwpi1nF14ZdETdKuKltksnkctzIRLy8ZjOK+bkEdbO8aQjYz29B55Pj8ynJCT15TsA8FdRLHve6Ypkeezts0pf7w2JP8wBx3CuKGnNbnnPc7rroENdoGMmpGzlwK/F7DG6mkFJWXamEXqGQjWMkAJXO1FF655KNAoiG6kW9tkruqcxg4iuVcHKxdteE/NodJExPcC1mkcJpDJl4HLXlK1G5iP5gZw8+xbd5GYsYET+TxF0GZOFtaE1XY2A8iuDWMgjL8dTB3hjiKVaFkDsHKn0vTKiICBG8wcuU8mzpr3xo0awblxGBfsqZo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6932.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nEvOuk7W9CcIvJ7yz6hkR7CuNKj4lEHJk9B/aaCWxqar/Bj7CBs8zVVcxDWd?=
 =?us-ascii?Q?C9oG/AmpIJhMLFlSmKvZw5dfkDNfundGBzN6ezr3kn8Va+GF2zo9vo26hiaL?=
 =?us-ascii?Q?jGFfkUxabLpVzfKsEo9mnfRVc8CY3dRt+yeRfZahH7omyLGFKaYnXaKtpz4J?=
 =?us-ascii?Q?ePmx9UEJB2GyiABgfWTOuxB0VApBaQtQ/je56WBhSA+kiUPlQRYGcBIdomUz?=
 =?us-ascii?Q?LMlwsmUb+ZErewAA+0T9w0XUvxe950r27giwUDGVd89FLvgvxap8WqpCy/VW?=
 =?us-ascii?Q?rQM/XCBzLrMRb/DCMzH6QjD4PB5BJZw1ZcCD334GMn/RxIlqObucUGCqnBik?=
 =?us-ascii?Q?GH2CNVV7O9rsK4tDlV4/LV+fvnquODzXXD3q0nVspZV6EYpm6QjW+J0oNFBY?=
 =?us-ascii?Q?7LOLOiggLIeL3REZgqAPfe/Rzm1KhW6MeSKhomKEeiAMRq8aQZK6DpyiJnxW?=
 =?us-ascii?Q?LKdXvfypHnM2g1m+pBZghVIAkm5ChV3iC7ckHSE6U12hwQDxr98c1au279Oa?=
 =?us-ascii?Q?ApF3j74ApAFMSkWY6z+K/MMJodF1gW/QSMzQhHvyvNLAeNoBaE6+Hu/EOHWE?=
 =?us-ascii?Q?Ok1/XqVFiTiMWa4zHINTx41S+J1KZj/5EJ7iHxv59fcR/c14cYizOGv+CK13?=
 =?us-ascii?Q?8zLx9cB6jwJXo9eS+1wUzNlhySAy/7+FiJ+Rf6Pu5Wyo8dN9AalptKWP0+ku?=
 =?us-ascii?Q?9XmOiYLQH7OHaG9BYQSCepTxIeoZZlN5rGri/scHfPcKR89UednKLkkgYSIt?=
 =?us-ascii?Q?D+ax7QX/VVg7dqF7JL0Ops27ufnvDMw7aXXalYCsR/zKFNKsofyufzLoxuhP?=
 =?us-ascii?Q?+jtmKqUmDdCdjErslpT8QNRbmadvvtvp2PHRXC+4ip00gt9c6edXetB1vyKy?=
 =?us-ascii?Q?pS3tA5SWDydRjO2TwrCJ0gaNha/UGAVwru1BlrA7LjdyMEP8DdN4OJ/zOFIq?=
 =?us-ascii?Q?2w+oPzQUF7PR+iQoXS/QqIzgiOban8bjvcVtHdv6BBi+OddYevnOveesKCbM?=
 =?us-ascii?Q?xkvfXfOkzbFXSlvL5uMVi0fzbxMXnmzXzRvkfY4QupWkDRGYZuO5SCSq9jvc?=
 =?us-ascii?Q?1LEFviunADW7H5Y+7Sd768PVG3oVSsHMemBBFhcB3mpn1TZogInbvjvcHUoY?=
 =?us-ascii?Q?FcmaL6q/EC5K/nyWWy74AO0pGiyDDdLRA+2fzZfsGeN3yPfgVO7nAqPjUSJF?=
 =?us-ascii?Q?d1Ej9uZAZbwKzlw6LLPVYgiR+RKUO+Gq4C1/+wFj+M6X0LjoZuiAPijvhpRr?=
 =?us-ascii?Q?RhmmN3ECAkQ1KgGYHQQ+THjcy7dKABIvxHi5wojjCObf6nFAqNQux4URlNza?=
 =?us-ascii?Q?yNpnboiWgB++T2Ab1BDjGb54lWmFK5V3Otfgnq8SYv/uwFIdjGuBe5mkd8jA?=
 =?us-ascii?Q?81m5RtX3/cOb7a2cW82dOP+BfqehjKxWVeAJ9wtN2esBwcB3QNStzl8GIDxR?=
 =?us-ascii?Q?4E3RzZbP0U/4WyXA6ayliQanzX13x7MI6+iygB+RFSKvzEh9dSDiFYd7A19z?=
 =?us-ascii?Q?09CYvmmmC816WTkv5oKfjCO2aLn2Q5qaBJUHx1+S+nKFwE0RRzd/Z9GA+Z+a?=
 =?us-ascii?Q?dlNIdos2eHoQ1cRk+J0qweWh5hNmn71h1sW3RbLEE+C7P7pCjLOX9FTMQJMN?=
 =?us-ascii?Q?IO1prLUVg+iW+pkBtWzJSZV1DKgTk+OY4bt7OIImQj12SYYYc0CH+nCMbR6J?=
 =?us-ascii?Q?2chO+xjGdTgLy9i/vBBZvUAjtouXps/hp2EoBhiX4K7bjFct?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: e8DyUu7ipD8a13VPELS/SanC/2itZFpelf+SQu02uq9gWrX+oADFxtZnnw26KBuNPSPaNNmMAA+ncvdjKpzh6rujbzk9Wj2/S+sTJ8vAuNc2iHdkaQOWkUEKDgx9rU4W1tTeadEt/vxre/JH0WKdUTk+Ydp45WwARc5Zu11OL2wsXBjlJP+U4sAOCZoTVXlWib58hv8YwsRFnokhXQ9G/bqav5m5LdAx8zMAOo/woHTtp5PGshPN2nl1BpedIVub8x0bRKBFNZJnL4O7knX8nU3lfkllWoLwJrIC91Hs0eJy6qV71EKRXgcceNtYbh3dEYBr9QrT3DwqD0aHj/cBQw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6932.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191adab4-cb85-414c-1d52-08df1315b249
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 10:40:01.5732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PPIuyp9TTDfFi2SlMmNxRytIVGAVNkdn4KjvB0D5oW2Y3j8JPIi07uMdQHtlmprbZNn6KBrqYSPSnTgHDEYffQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6238
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Mike Rapoport <rppt@kernel.org>
> Sent: Tuesday, September 15, 2026 2:04 PM
> To: Liu, Yuan1 <yuan1.liu@intel.com>
> Cc: David Hildenbrand <david@kernel.org>; Oscar Salvador
> <osalvador@suse.de>; Wei Yang <richard.weiyang@gmail.com>; linux-
> mm@kvack.org; Zou, Nanhai <nanhai.zou@intel.com>; Chen Zhang
> <zhangchen.kidd@jd.com>; Zeng, Jason <jason.zeng@intel.com>; Chen, Yu C
> <yu.c.chen@intel.com>; Deng, Pan <pan.deng@intel.com>; Li, Tianyou
> <tianyou.li@intel.com>; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v9 2/2] mm/memory_hotplug: optimize zone contiguous
> check when changing pfn range
>=20
> Hi,
>=20
> On Mon, Sep 14, 2026 at 03:29:29AM -0400, Yuan Liu wrote:
> > When move_pfn_range_to_zone() or remove_pfn_range_from_zone() updates a
> > zone, set_zone_contiguous() rescans the entire zone pageblock-by-
> pageblock
> > to rebuild zone->contiguous. For large zones this is a significant cost
> > during memory hotplug and hot-unplug.
> >
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index 1533aebafb68..d40a8ff23370 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -817,22 +817,39 @@ void __meminit init_deferred_page(unsigned long
> pfn, int nid)
> >   *   zone/node above the hole except for the trailing pages in the las=
t
> >   *   section that will be appended to the zone/node below.
> >   */
> > -static void __init init_unavailable_range(unsigned long spfn,
> > -					  unsigned long epfn,
> > -					  int zone, int node)
> > +static unsigned long __init init_unavailable_range(unsigned long spfn,
> > +						   unsigned long epfn,
> > +						   int zone, int node)
> >  {
> > +	unsigned long next_chunk_pfn __maybe_unused =3D spfn;
> >  	unsigned long pfn;
> > -	u64 pgcnt =3D 0;
> > +	u64 online_pgcnt =3D 0, pgcnt =3D 0;
> > +	bool is_online =3D true;
> >
> >  	for_each_valid_pfn(pfn, spfn, epfn) {
> >  		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
> >  		__SetPageReserved(pfn_to_page(pfn));
> >  		pgcnt++;
> > +
> > +		/*
> > +		 * With vmemmap, at this stage all pages in an early section
> > +		 * have a valid memmap and are marked as online. However, only
> > +		 * subsections in the subsection map are actually online.
> > +		 */
>=20
> I'm having trouble parsing this comment. Shouldn't is say that some
> subsections in a section can be offline because of holes?
>=20
> Other than that
>=20
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Maybe we could add some more comments here
/*
 * With vmemmap, at this stage all pages in an early section
 * have a valid memmap and are marked as online. However,
 * subsection-sized holes within a section are offline, only
 * subsections in the subsection map are actually online.
 */

> > +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> > +		if (pfn >=3D next_chunk_pfn) {
> > +			is_online =3D pfn_section_valid(__pfn_to_section(pfn),
> pfn);
> > +			next_chunk_pfn =3D min(SUBSECTION_ALIGN_UP(pfn + 1),
> epfn);
> > +		}
> > +#endif
> > +		if (is_online)
> > +			online_pgcnt++;
> >  	}
> >
> >  	if (pgcnt)
> >  		pr_info("On node %d, zone %s: %lld pages in unavailable
> ranges\n",
> >  			node, zone_names[zone], pgcnt);
> > +	return online_pgcnt;
> >  }
> >
> >  /*
>=20
> --
> Sincerely yours,
> Mike.
