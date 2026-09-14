Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC49477987;
	Mon, 14 Sep 2026 16:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404676; cv=fail; b=H5ThjJftSX8RJqEoqnPCvOAxZrxhlTUedEiEYRsrCi0qMIiX2Bh9yRfCYMIS1go1sV5NW7eFiSIkDiRqF92CVOkThPEob9xl7+6mph6+anUfRYm43pYN/OXthFV0FdzKOYbfqmuGIOv43YzxvFafsZwwuKs0P+b5wPknGoMxkIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404676; c=relaxed/simple;
	bh=aNweQbHmR/Ejd9eKiYW+wuHLIzQDJuHomTxBfnBefG0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VmNx/BZZXnQXMYZfICdp7/z5avAl0YWPFmv6bmRNbbTolW4eL1QuuB0i1uXHMoqTP4tjI4m/LZhpqvnqn6jikrnA2Hbvqn903IFdiGT2tXRl2SKvfK/TMs8fjqvM8j3CdBHVVIQQtiRzEjfIkUsrRIPXv+7gUszPKx6nut8Ieow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axy8MwMS; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axy8MwMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789404675; x=1820940675;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aNweQbHmR/Ejd9eKiYW+wuHLIzQDJuHomTxBfnBefG0=;
  b=axy8MwMSQ3LEYCmM4239/0T9+uU9/YAEdRZyT3RrsGwhxcUC2BXYqcui
   LP2oO2NlTzzivnSu6VTXDL19lUEb8T7qmU4p1GCB+9SWmLqDso+L6qsGG
   kwWskiPojfBgXp+isbF0nztVEYC5QMEFGZHdQIgoqDZDG37QLwGCCqt9x
   pmJNcxwvTq4U5NrRuFEuVYNMsGLhq1ngJkq4T1GOwLLcQ40zqnoa3MU5M
   6iQWHcDAK8FE9HKMRkJmsPt7MoNRJ+3OdS99SdJBrSabpRcLw20Ohx5AU
   hqnCXhpJjIQMeuCSpKrSUugwlhmkSpoWXeKgVShkxwTo1a1J7wyjBxBh3
   A==;
X-CSE-ConnectionGUID: KvXZC0s8QT2yxT7lz1bYjg==
X-CSE-MsgGUID: ssx9POYfRzCXjqw0OzTqMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101278274"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101278274"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:51:15 -0700
X-CSE-ConnectionGUID: BAeetooySwW1PHvIBhu6Hg==
X-CSE-MsgGUID: Zx0xi86mRgOhAs6+yHYkKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270882965"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:51:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:51:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:51:14 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:51:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ly7dzDawzvD4YsZa38ARYoX1WOtAN4W39twRqv9Adh9vLVZ+souStpDPfzyMop86VINEqIZXRnCzDeiNGYbDPvpwYRF3rum3xiARhDj0X37QSW88M7as0BnOkXT0bMMFohRp10DkB4MYQHuPg06FjgQXwyeNRvceyghs4jO13w0pv5tsegBCi8X7ojXHkC5CZ7mPavqC+jKd4CjnQU42rlzAnAiYp1mTkcCw6Ut/gwYNfgcTI0ql5ZmFWm5oB8Ddf32mJWQlCwcEX7SlpRm+8BzQZNf6kdNjDGdTlJGBqmlPvUxfh3pK/t1HyfZJV3vMVwV5Ob/js+jJwVshYFIwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNweQbHmR/Ejd9eKiYW+wuHLIzQDJuHomTxBfnBefG0=;
 b=Esj+9Q/RvIjI9O5XE06BT1yNFTdcZZ9imDrW3Quye9tfgG+ih3iXd3HD7hXKhEUBfsWLrNEkn8RLH3VfG5zLcrXZuMJuMUAEYl6q9sTCEkXUwXKel0WuVDKuSK79JeXUGM8DWErscV2anppxdpwA3fqAb5CLO9brnDVDkDVpLH/cqrB3CVKayOAMJjD41BtIUqbSoz4y2S3OLE8EP9ct9QncDWf0g7CiM8C7nP37z7AoHzOFHCaoEocLvGvrs4UCGlvY10Y9i28rO9SxXqa55TLJIaLeMhZZbQKEYNE/Z7NatYthwUh/ENSfrFfIRZPViT5Gh+hEIu6i6fvNisbMSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:51:08 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:51:07 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Myeonghun Pak <mhun512@gmail.com>, Jason Baron <jbaron@akamai.com>
CC: Borislav Petkov <bp@alien8.de>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Ijae Kim <ae878000@gmail.com>
Subject: RE: [PATCH] EDAC/ie31200: Disable PCI device when probing fails
Thread-Topic: [PATCH] EDAC/ie31200: Disable PCI device when probing fails
Thread-Index: AQHdQ8ZruXMPh8V+gkKNyULY+FimlbbOSmyA
Date: Mon, 14 Sep 2026 16:51:07 +0000
Message-ID: <SJ1PR11MB6083885F54ECDC88B894EEDAFCBB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260913212500.60272-1-mhun512@gmail.com>
In-Reply-To: <20260913212500.60272-1-mhun512@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CH0PR11MB5265:EE_
x-ms-office365-filtering-correlation-id: 9c67f564-e209-4fd7-d324-08df12805f62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: bq3/WgialynEFFUvU5fV68cJesU9Zt2JAijGsEcex/CoqLsbuZmxO8EC1wiONDWqEAqA8L1m170jwacyXl+2rk8ntuphODlwBuhgbctsW+PciEkJoKPfoAe7jk9IqPe1wBPTV5CwZZ45/97BXs8q/D/RNVz6+GVbo+nJ5kc+sSHBGSVDTzP5cbFrM8mdqgGr1F0AchjjQuTswo6M8Uj4OQtVuIx1PYhhk9QL6MeOlU+0sAjep+SSCj3C1lm/LNujeZSmtyQJaocDwHP77P9RAUDqYxpFda6a1L7OpTP1aLKKXo6DXsKDUGaYnQweyKUefeKrukhn5yOpQ2UoncKtc3TfskgSlV1Wzb0ME18TiW0Bi4gaG3MFxqJbe+1mT3On15mAeMB9OYiH88kF6PLxlSC3hem7mGJY7XWEigJ+MMwVSfezLu4Nao8wAcVrz7QSN72HdYHnVMXdpWBvDrHvgk/MPRZ6y40J8NTQotqubIrkqjy6q9Jg1ku+pcVXqnPhCCPhI0ib928ZNBhXw/ILfGx8BanYfssXdibqU1Dn97EhzB3GixGlXZPxoAOY3TDGhi+baZwIZYgQRFiQn3JVfVACzCtl5Z6FUu8BzeSKUreBKKw+FUMAHiDeWvoeTcw4flBRK6xm8Y96RAHaDLSdHc9zXaoOrbahNcgS59F7gq5R2/9FiG63I8tMsD1klBhOPX0Z/Hqacl4a+BBQTRQkVqp5mhiCf+Kl43RtVLIG2D4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m12eSzJ1I5Sm+Cdp1bG9Z9ri0WEaTz1G58xaO/cwfJX4hsxdbtJj4xLr4LC4?=
 =?us-ascii?Q?VV1gR5aZ4Wcaqx0NYJT8RtQC4OL1q2FHe5vuE2edSIJabfP/tVvz6jhWA9vu?=
 =?us-ascii?Q?4iS6+n7Td6GmMG8tpf+KdxYUsN2YmFj/oNmWc+74+UZwBGJjYtMHeVePVXGu?=
 =?us-ascii?Q?KVJ8Uxg2KVg2FG0sUOS/gU62jXsMHAIxJZhEgCslC3fVaBEyVAAYKyXlIFYe?=
 =?us-ascii?Q?W1mbH8R2sl2OrCc/m3d0YpGXMARcUEedsACEdu2w/O3/2VXTNB2da0DHh5RG?=
 =?us-ascii?Q?u3cjqoIjTTwTjNOohsag+M8+6IXmH+7RBk1CVYPvVVlwIra1H2F1bneJRJIZ?=
 =?us-ascii?Q?pbW4b5KmgI+eQLwNNPpn2GJcPCj9+oqUsO2ml456Q50OcqNAwl2/kZYapnAP?=
 =?us-ascii?Q?4X9WEylP8RX8SKxfb/DGmKpf9Pze3uoLS74YKfVDyZvnLxXi2+gr6DIJfYEN?=
 =?us-ascii?Q?9pm2LQnVfqLJfFQj+1HDpWYIswSLigM0b6qZYnZy0Bwx49qPb/mFwO7m0yoE?=
 =?us-ascii?Q?SXyM1TnGoN7GmLUnLH4EKjjT7Hm5Q3u6gj3zDNQAelU3m1p2ImUzf2KZzadt?=
 =?us-ascii?Q?LX0oEqlpfhET5JYCCOtNgZDPuDMIZ9bUAZ4/QlrtRdPFl1L2fnESm8+QuAcs?=
 =?us-ascii?Q?RBFErHRrE8i/bFXIeKlnN22IW20oko5IN0M53X7MSjDyZbiGkqyxL5+nEYIp?=
 =?us-ascii?Q?NjXFnngJyVVFrZ7Gc+WUHu2sPA74MyJL0PTDunZxgrwnwH4By6OSJdtBf5Oo?=
 =?us-ascii?Q?81scz8yrU2i5gdb8eL4gYUq9EW45k5cMKZCZaRGsKHPwT42F4lbTrPw6mh4+?=
 =?us-ascii?Q?7P2AbeVzxSTCW48eNJ/Db2LOojPVNwHKNRr7nHOw1fQX4MddlHVgBSdOwNVf?=
 =?us-ascii?Q?RuWk2/7soDTqAz4trB6KNJdEpJdN0XpDX8SMdN6Vi3lTg2YEeej7ZaA6fC2I?=
 =?us-ascii?Q?g8QMjv17f4QhN30IlSRmCkJmnKijf0Um1Y09VBt2CpheqZ2YR0ohlgVkiv/+?=
 =?us-ascii?Q?62spetBXhVrNP4jA2650utqfwkZlWE3bUaclr5W7wdabhrwnCqFREgtLnewX?=
 =?us-ascii?Q?ipm6O+R92Ce4At0ZSY5ZUCxU365hjYDX/ZIeGKXDqIpUFTH+GH4DIDmfyPDh?=
 =?us-ascii?Q?kYnvgePjOxGFRrO7awU39sMNguPVFlxy5Y2WrtcKVoOr37+aT8XCNbZxTOqJ?=
 =?us-ascii?Q?EZENGwqHBqQWdAwbR+1SYBVuAvqPubrNI10DWzPHUReRirUzShTaKVTCBFg+?=
 =?us-ascii?Q?7OrtJmkIYhh7lprxYTPfBSWY/586dyS7WkT31QtklYyK2U5f/7Dh28osBiyR?=
 =?us-ascii?Q?tGGk1se/VAaK+R8fDHMo7oNhvSHXHF3AftUfzcP/TtVLxqRqz5L+zX6HmSq5?=
 =?us-ascii?Q?Syd4aQQ3O10cqWsmChZI48gdsEA6xR9z3NilXO4rl018DckRYheRPmtne1p7?=
 =?us-ascii?Q?wX8hxzb6vmXwlW5uZaItcxqD3LtiV46Uvy/nszsKPES60fH7CQd5StTllIRz?=
 =?us-ascii?Q?iBN36ae0KBbr0601rZm4xXutbXxFg6H+8womDwMlg6gq0txuLkUcIXD4hbum?=
 =?us-ascii?Q?0JaqWfKPQ4qgmrmmA/G0gZFo2PD809LXm0GXhUerPwTbqleaNxyn0Dqr+wAL?=
 =?us-ascii?Q?3Et1LBeGfDOTAcgNwRJ491DOR/Rxg3SsfBXbeCQ1YH53Ee9qWNceuUFkhhqU?=
 =?us-ascii?Q?1JRTZ/KZ8cnJ6UkkwYenaqfU/sKqNyL3QvfaDfWqJE0vg13n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xXd6aidIEobUWy3ZuERtxXIu82HFVGbHMqkrdSMgPDXXflciFcDMqJQfFjQjTZScYhzy5NQb2stTpWc7HO3TGZhB0DTROV6tZQQ+YBmxpuJ2QvM7D/VAq3K8GE5Fm+NLR9NxJl9E8JQoaFxBEhbASOCiG8KfmPjFe5YWaTZ52QYf3dbnEi7fqQP6bQ/IV2vU8IwWCVvaSeIJiUaMcc6K/U+FbjC/gyCoK6kaccWBTxWhVltIfT4JhJavwE8ClBuxcNe0lOedSxgD4cTAeI1c7TM35kmZHnxEmhoYijuTPp+go2CX72HaaD8QfZBCq+UGm95JBmZ5hHIp5GrytgjJ+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c67f564-e209-4fd7-d324-08df12805f62
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 16:51:07.4917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3b1M17eNU24+LpCtuz6bPtsnXw7Il3eP2SSAiM1FUXd38nJZZFnRBOgiETMlJUKk7XoU2KJI30yzYPHe6DuMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
X-OriginatorOrg: intel.com

> ie31200_init_one() enables the PCI device before calling ie31200_probe1()=
.
> If probing fails, it returns without balancing the successful enable,
> leaving the PCI enable count elevated.
>
> Call pci_disable_device() on that failure path. This also covers the
> direct ie31200_init_one() call from the module initialization fallback,
> while preserving the existing return values and successful probe path.
>
> This issue was identified during our ongoing static-analysis research whi=
le
> reviewing kernel code.
>
> Assisted-by: OpenAI:GPT-5.6

I added "LLM" to this tag based on current guidance in Documentation/proces=
s/coding-assistants.rst

> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Applied. Thanks.

-Tony
