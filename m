Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793265607;
	b=uR6gBgsEXAsQba4XnH4nfMloqxSuMFHlkSszzXDZZ1IXub06TgtW8kefP4rymvF0ClfP
	 q3er1j0KaGQoAQbemTQEqoBYtfY0km9aafkA0+WMBBEt5IL4U/Wm29sAia2CZIImB6fCs
	 9eLutFQvBe2ND/RV69RoGVzMHaulUh7U7tmTGQbg7lLupTy2jZPQbe2rDgg+/6gquekec
	 6mvlKLlqxPIrMFaOwL+v8VtZM6l3CgrZwVwKrH962YwEUpuUtu5oVxN0sJbxLFU7cWnSd
	 nnGcLgIJFSbBFN6h3n/OhHKchfcQqIAZ+ZEchUFYRZ4htVsh7F+SE8xlOvEy8jOCjUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265607;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=C15i6nYczAPFqQMiD0MugmkBzP3Zoo8qBiyxu15tmzU=;
	b=Tdp78JjTf9y+kqTeYdfG4Ji73ERzUQWK+SgxhQtskleVoeN3E85b7XsBFND3fxSIRGkW
	 khWi1cXAFUyfV2c30csuDwAB+YlNGRQYw/WQkaAeyRuFXZD2FSs3xOX3oR9/Z9r6Tncf5
	 69qPuzEF5pOMWvCvcLFOTNXOhzjywGg22RqJUuNREjponyIVMPVJzx+VgVr9jLdm65sHq
	 v5CERVzTByiDVux10DxzdpShmroa+4mCjlJrIArGVpaH7CeNyfsA6A3p9/apgEYc1xEh6
	 pxldNpM00CVGjQI110LikIghqkp34RdZUyJylz/trGxgspQE7KvUowSYM7f8ApEbZFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MabN0nRW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477BB606A31D;
	Thu, 29 Oct 2026 09:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MabN0nRW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793265606; x=1824801606;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C15i6nYczAPFqQMiD0MugmkBzP3Zoo8qBiyxu15tmzU=;
  b=MabN0nRWtyXNlALuBY7j5sJgyAsxMpJ112pOXQjX0iuqJyF0xNrTwVg8
   o1ht7mxMpO70rPFsqcBipj57NOO06zXdjVDIwLptj5l+8CahM5i0DbwnW
   NUV3ooeHCSSHV7vQ8vZ5R6Hm4tLXdZUvUkueNSO5J7ZvTx3KI7aCz1R5y
   xlXFaEg7F8qS8OKDQLfvgiZgQs8p+WOVEY2li07aRjleek0ZsRmpf3Jqo
   cP3TQGCpdIzF6++uxtAS0gy5wSKYpU5ijyuKg9xY3PvfZFiVUKkc9HE8Z
   ui2mJvuLX9wdoEboJkCHb0ivC4MVeGirzaVHjtoc1JLFmFquKyUy8G1wr
   w==;
X-CSE-ConnectionGUID: 02hNnyZYT7CW1Wks324yMw==
X-CSE-MsgGUID: izehA2eQR6qXiqHXBTf8ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2006206"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2006206"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 02:20:05 -0700
X-CSE-ConnectionGUID: eUYA5tA1TYmRclnNLz7dmg==
X-CSE-MsgGUID: RwNf8qepSje9M1RiYAYd4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5214028"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 02:20:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 02:20:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 02:20:05 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 02:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ol7XDR9zUibHCD4vU+rVuu5v3h2AKKPczZo4pYxT5lHdgJ5NOL0LVKuOZKitNtocgmPGT/mlEecqYqis5rVXlXZe881FD8TnfzTyx+9N+nzORmCpq0wnCvS6Fm5TpBvcR7hfb7dBgiPuMMB2WtRmUrGD5jIKLTJwgYq3z/p2aSEhAeCU4N2OBeXtUDpt2SqYQ4hfqD5r+46tSx7hj02nWRFmbkMH7HUD21FGwMvoqHg+X/mYyVU4M0mzyvHmrzLNIDqv/3kAjtck8u+IjVFLsVs7yS26CtKZJxe47dCo9nPJKwN8iqTfnVv+Dc6B+1rZdO07hmZq5r1ovyv+TRFuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C15i6nYczAPFqQMiD0MugmkBzP3Zoo8qBiyxu15tmzU=;
 b=Ua7iiz+m9Wz5p1yJwnX9RSCw/DM0PHPaSEtPstuwzjv7PasyoqhSuZG3hv4yKoBnl20E3qWNvJkqDke12Gu32X+xa/T5R/nHL7BK3z8zW2BpDo6c7/OCuxAecE6NjQBSCZtxjmHTzc0Izv5YIKp3D2AcqGHYWneJOn3+9zvsbC36CcsqzwL9SIVjvb2xCmo3GwZc20UQI2izwdO1ADcv5nWTvLRYF24Pb4nxbyEZTMo01+Fcg+V7tdgkJBIeqwq1lwzt+c+No5NE7IuMvH3O8rbAykSDpIR+jsiOc9VJDPXPloRm3XxR6imLz1+EvokDl21JDsqNgQy5ZHSbuKA6gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN7PR11MB170846.namprd11.prod.outlook.com
 (2603:10b6:208:5f0::20) by DSVPR11MB9935.namprd11.prod.outlook.com
 (2603:10b6:8:3e1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 09:20:02 +0000
Received: from MN7PR11MB170846.namprd11.prod.outlook.com
 ([fe80::c6bd:5893:4010:b667]) by MN7PR11MB170846.namprd11.prod.outlook.com
 ([fe80::c6bd:5893:4010:b667%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 09:20:02 +0000
From: "Li, Yifan2" <yifan2.li@intel.com>
To: =?utf-8?B?UMOpdGVyIFVqZmFsdXNp?= <peter.ujfalusi@linux.intel.com>, "Sasha
 Levin" <sashal@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Daniel Baluta <daniel.baluta@nxp.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	"sound-open-firmware@alsa-project.org"
	<sound-open-firmware@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ASoC: SOF: Intel: hda: Stop the controller before freeing
 its DMA buffers
Thread-Topic: [PATCH] ASoC: SOF: Intel: hda: Stop the controller before
 freeing its DMA buffers
Thread-Index: AQHdZ3mYmSNPPaQJHUaF9a1Den7D/LcUOkAQ
Date: Thu, 29 Oct 2026 09:20:02 +0000
Message-ID: <MN7PR11MB17084628AB71D0EB1CCCA56D23AF6E2@MN7PR11MB170846.namprd11.prod.outlook.com>
References: <20261028144446.992948-1-sashal@kernel.org>
 <3d074141-2360-4a63-9fcb-ac8f86a8cbb0@linux.intel.com>
In-Reply-To: <3d074141-2360-4a63-9fcb-ac8f86a8cbb0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN7PR11MB170846:EE_|DSVPR11MB9935:EE_
x-ms-office365-filtering-correlation-id: 41458ad0-ef47-48fe-56c3-08df359dd015
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|38070700021|4143699003|11063799006|56012099006|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021135927099003|10067099003|18002099003|22082099003|13003099007;
x-microsoft-antispam-message-info: S3VQ2ieR5zUkZMG3zc/WOh+jwYAKlRAEkJzqq0PsTlcvxpjvioRk2AkmZjcuM7LmLnAW0Y4Cp6eeFES7FQQQiUAmwpTDSp6oQwfQ0gjkacDNBJTQhMjHcec+AkSYuepMuh0ANE2rAr/3z6UGReeNAYrWxNwz+XiToP3NB46jH6IbJSuPRC+veVuKjznFQ2jaFNpzMz7flizsMJoWfVvtogdzai2d63cUc63CeDLJvqSRVmS+rMVUI2Z7VryZ05eb6X3/FNk1lsO3vMr4MXgNWoPa87QNOgxvqbTvmz++CKUdaZ00FkQO3mLD4d57PHVoS3GA6TlX9h7DTEYR8hb1QX3TJFhmOdl0lH3EMWdVh0QDdHCj8IlhKug9dTQNrqXaI9NBwDEY/FBwkF/z0c4fZy+x/tOapMnuVLVLakLfV4SLOtQyfVkf4VOhYoiXnSFKtXTQdCpqEUzflrj0cWKP0M/gkiqH9tkXtEQcpRYSv2k2Do4Pw2zD0Tr4sQvTDB0/RRgpe47XQQvRBqc+kR/LapAQwUtng461DrtRDjaqMS2hDQSW1HEQhniXrFcs8C9fKTe/re50taKHImxzp0b/CJPrjZbBA0uDv6E9EaPS0F6I9jcPTTPDQmnKYUKnW5DQOF4KKtcn0MVUFOAqBgxFvBZKfvAQ+vYrsC3/EEFmfeCliOGKn46NgZG2XGIp3VHu1/lWDlkyeZN4OSQ9HPEFzGj2HfkwVnI1MnDCGyl+5QY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN7PR11MB170846.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021135927099003)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blYrMjZ6emJ5TkdsMDM3dVNpYk9tNXRMTmpTMkhOcG05enlTZTFLRDQzbFY0?=
 =?utf-8?B?cEZKMHQ2VW5lWXkvVHZFVWs2ODBLak1BZ0NMcHB2MVlWQ2FPeUZuazlsbXpC?=
 =?utf-8?B?ZElNNkdNblhKVU42SXdQVTg1RmJXMEwxUnltZm8xWG1KQUhOVmJJbHpYLy9P?=
 =?utf-8?B?bldRZUhRL2JNM1hPVUxVamVKMHJ5Y2ZMS1hOam40cFM1eTM1N28rMmRhQ2I2?=
 =?utf-8?B?L0thQ0gwcXRyS1pTZ0Y0TVo3R2tQcXZNc1VDRVFTTTFLazF5a0JYNUZWQmMr?=
 =?utf-8?B?N01ROUZHL0pSa2NWY3grRUswcTVZQkMvRnRGcjR6N1Ura2l3V0tXb1FSV0Vq?=
 =?utf-8?B?ZzdDVWFsTU5tVkp1QjBuaURaa0lXei9wL1dnOHJ4UjlyVGpEcnZaSEZIdWMw?=
 =?utf-8?B?YnowaGRQTWZGSmlhb1pRdzdIWGNWd2x4dThJNWpZOTZNQW0rNk1GVmFDMEhE?=
 =?utf-8?B?NkFScS9ac0dMb1hPRmM3L3lJMGtDQkhYa0cxM0NzM1dkeEN0d20wVEZVR1ZO?=
 =?utf-8?B?c2xPbk5OT09PNURXazlkS29pdmFDaFh0OVR6Tjh5aTllMVlmdXZuNmlaeldy?=
 =?utf-8?B?Mk90WlJMQkZOSTlwMTFzYUY3V0FMWFNJYnlCcndpdnFEeDE0VWp0dUZNekhx?=
 =?utf-8?B?L3BCWEFSaDVhYlhkRjEwTUUwVXRRMzB1b3cxdElTckx5M0g3YVFRaWVWdlJT?=
 =?utf-8?B?dWNyNmEwbFdSSk0yaVdUMm8vNVRmYzhkLzUrelZMcE85TmRBTXVBZ0ZIbUFY?=
 =?utf-8?B?aUdjWlJRYzUvUHd4V0c5QWhCWmdweUdCTngydzFFbDJSNU9YM0o3azRoSzk4?=
 =?utf-8?B?RnVzUjhDQk8xQXZjVlRFK1VVNzloZ0N1alFYTjd6K3hyNTI5NWJXWUMrR1Rw?=
 =?utf-8?B?NDVzb3ZFSHA2TmE1UUdtNjh0aExjb0Y3Wkhpajd3Z2tGZzhRVmdnb0xUZ0pv?=
 =?utf-8?B?WGRDMUNOSjZHbEIwMkwraG9qNHVWVTJUSmMxc3BRTGg4dFJndnQzOHlzVGdK?=
 =?utf-8?B?b0xnQ0E3bWhCYm5QVStVcHUySXh3TSt3MENzbmVPS2hCY0x2ejJ5S2pUemx1?=
 =?utf-8?B?aGlYTUhBVnhTby84NFdtNFd4cFRnWmNFNFQydGtOcFlxZi8xeFhHVy9IeXFu?=
 =?utf-8?B?TElXbGt2R3ltZGNKem8xUGlzWVBROTVsNDdYS3FhTVhTemJvYytvNURYTkJV?=
 =?utf-8?B?d2JvbmJhL2thYitoeU1iSjQ5eldkUWlHbHFLWEtUb0dHZkM3VmU3OWNZRFlS?=
 =?utf-8?B?K2QxT3NXWjFwbDdiOHR2UVdweGJ6VDBFZUJ0Y0lRZTdYQkNhY3lsaUxRL0Fq?=
 =?utf-8?B?bUltUE9GalJLY28vMjBkemlqSnRLVjBtbDNuajBNd1MrcWhITnBZOWh5bGdr?=
 =?utf-8?B?S0RGZGxaUHgvUUYvMnR5enRCdlhUdWZtWjRvZU9kQy9UVk1zL0lnMUZlR1lH?=
 =?utf-8?B?OHRzOU9hUE1Tb3gzb1p6WHhReTR5WHRPTTRkNnlVN0laVTVTYWhXRzRVaVNU?=
 =?utf-8?B?WCsySXVoUFJSalVFbko0aVN4bXdMYllUY2ZJNHJhYXlNOWxObTdXS1N1UlVp?=
 =?utf-8?B?SUpGdmJ3MVpnVGMyekYvV2xDY252dmF3UE91S2d6OUxRQy9IajVJQkJFc1hi?=
 =?utf-8?B?cW5CbkV0UUpuaUk5aGFyanR4bERZaGlKVTlHR1kwUDBjL21FNS9GaDQ2MUhJ?=
 =?utf-8?B?OWZGeVVqT3l0MS9YRExNdEtpRE9EN0FjeG9QcGU5ajJEYjk0ZzZsV0hhTzhl?=
 =?utf-8?B?UnNTczhuWm5iZSt6bVpSeWNhdWIwZDRwaVpqMkNmeTVTODhhNXdyVFAweGNG?=
 =?utf-8?B?R092N0E3ZVQxbGJxZ3c0L2pmUTJZcUdhbmNOS01lYlY4QUFlOWltRU5TY3BQ?=
 =?utf-8?B?bkpBWC9qTmk1QW5pc004UmppaXNsNXliTEgzZFZ0RS9LallqN25FRDNvSENQ?=
 =?utf-8?B?bk0rRC92UWFPdU5QMEFWK2kxcnkrN0lwQXo5cFpTakJ0cXpuKzg0YUdaOU9S?=
 =?utf-8?B?UE4xUmdIQzJiS1RoeDVWY1lvaDA2RFE2NHFnNWNDYUxrZ1BHSjg2ZEhEdnA4?=
 =?utf-8?B?QzNXUlVwUWYxWC9VSElQbDNFRW5OTi9JSmIzb3pOeVNlc3pINTMzYU03MTNa?=
 =?utf-8?B?SXBvWjZXRkgycm1wTExtcWtGODc3VnpNZUo2OWY1N0l4SCs5R1RWc2lSSnFB?=
 =?utf-8?B?T3pFaXVJK1kzYXE1QXpXaEozRkxYVFhoNjgzMXpyMlREcTlNakF2K1U4bUJS?=
 =?utf-8?B?TjB4LzBDbUdFYUYzUjlWK3dYUzVoV1o5OUYvZHFFZHl1QmFNbWsvVzJ3THRI?=
 =?utf-8?Q?YWx7BQ613UF13MoEKj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WJVSRPnorD43TCwr/KHFC59jWInmzJ7BGUWcQn/nIQR7Omniw9zPCehC88v3M88nHcpGXW7TDfaCb2wyuzGeAFazB40EKbTRQG6dLFl2fHX2LuzeRLpatkdWGjF2feAh7vGWWnACHYWM1KxQVbwXH8kclhq8l+nTUYX5Vgpx27eUa32i2tXG323sSdeVRd6FcEEb/wRLvilfr2TFldCwdvTxnvpgeKuLFZgp50qXXIneS718NNEMHFCSjN1TDI8b85ZlFWYF1sC7HqdQlXL+OsCRLFTqTmLiMxfosXXQjIlDmftlOy/EXT3tqMuwhIq/5gnaN3IzVE0diNUVI3sMjA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN7PR11MB170846.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41458ad0-ef47-48fe-56c3-08df359dd015
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 09:20:02.7022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1PGBwD3OWG7Cw9GiAeaWmVtKV1Yh7Ve8w5rSgoBVlMNiF1Nbf1pRN2VR0e0qadkWSE/qQY8D7kuvK34Lz7tRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9935
X-OriginatorOrg: intel.com

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFDDqXRlciBVamZhbHVzaSA8
cGV0ZXIudWpmYWx1c2lAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2Jl
ciAyOSwgMjAyNiAzOjQ3IFBNDQo+IFRvOiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
OyBMaWFtIEdpcmR3b29kIDxsZ2lyZHdvb2RAZ21haWwuY29tPjsNCj4gTWFyayBCcm93biA8YnJv
b25pZUBrZXJuZWwub3JnPg0KPiBDYzogQmFyZCBMaWFvIDx5dW5nLWNodWFuLmxpYW9AbGludXgu
aW50ZWwuY29tPjsgS2FpIFZlaG1hbmVuDQo+IDxrYWkudmVobWFuZW5AbGludXguaW50ZWwuY29t
PjsgUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS0NCj4gbG91aXMuYm9zc2FydEBsaW51eC5k
ZXY+OyBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+OyBUYWthc2hpDQo+IEl3
YWkgPHRpd2FpQHN1c2UuY29tPjsgSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej47IHNv
dW5kLW9wZW4tDQo+IGZpcm13YXJlQGFsc2EtcHJvamVjdC5vcmc7IGxpbnV4LXNvdW5kQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IExpLCBZaWZhbjIg
PHlpZmFuMi5saUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEFTb0M6IFNPRjog
SW50ZWw6IGhkYTogU3RvcCB0aGUgY29udHJvbGxlciBiZWZvcmUgZnJlZWluZw0KPiBpdHMgRE1B
IGJ1ZmZlcnMNCj4gDQo+IA0KPiANCj4gT24gMjgvMTAvMjAyNiAxNjo0NCwgU2FzaGEgTGV2aW4g
d3JvdGU6DQo+ID4gaGRhX2RzcF9wcm9iZSgpIHN0YXJ0cyB0aGUgQ09SQi9SSVJCIERNQSBlbmdp
bmVzIHRocm91Z2gNCj4gPiBoZGFfZHNwX2N0cmxfaW5pdF9jaGlwKCksIGJ1dCBuZWl0aGVyIGhk
YV9kc3BfcmVtb3ZlKCkgbm9yIHRoZSBlcnJvcg0KPiA+IHBhdGggb2YgaGRhX2RzcF9wcm9iZSgp
IHN0b3BzIHRoZW0gYmVmb3JlIGhkYV9kc3Bfc3RyZWFtX2ZyZWUoKSBmcmVlcw0KPiA+IHRoZSBD
T1JCL1JJUkIgcmluZyBidWZmZXIgYW5kIHRoZSBwb3NpdGlvbiBidWZmZXIuICBVbnNvbGljaXRl
ZA0KPiA+IHJlc3BvbnNlcyBhbHNvIHN0YXkgZW5hYmxlZCwgc28gdGhlIGNvbnRyb2xsZXIgY2Fu
IGtlZXAgd3JpdGluZyBSSVJCDQo+ID4gZW50cmllcyBpbnRvIHRoZSBmcmVlZCBwYWdlLg0KPiA+
DQo+ID4gVW50aWwgY29tbWl0IDllNjk2NmY3MDQwNCAoIkFTb0M6IFNPRjogSW50ZWw6IGhkYTog
S2VlcCBub24tYWx0IG1saW5rcw0KPiA+IHBvd2VyZWQgYXQgcHJvYmUgb24gQUNFMisiKSwgaGRh
X2luaXRfY2FwcygpIGRyb3BwZWQgdGhlIGluaXRpYWwNCj4gPiByZWZlcmVuY2VzIHRvIHRoZSBu
b24tYWx0ZXJuYXRlIGxpbmtzLCBhbmQgZHJvcHBpbmcgdGhlIGxhc3Qgb25lDQo+ID4gc3RvcHBl
ZCB0aGUgY29tbWFuZCBETUEsIHNvIGEgcHJvYmUgdGhhdCBmYWlsZWQgbGF0ZXIsIGUuZy4gYmVj
YXVzZQ0KPiA+IHRoZSBmaXJtd2FyZSBpcyBtaXNzaW5nLCBkaWQgbm90IGxlYXZlIGl0IHJ1bm5p
bmcuICBOb3cgaXQgZG9lcywgYW5kDQo+ID4gYXMgdGhlIHByb2JlIHJ1bnMgZnJvbSBhIHdvcmsg
aXRlbSwgdGhlIGRldmljZSBzdGF5cyBib3VuZCBhZnRlciB0aGUNCj4gPiBmYWlsdXJlLCB3aXRo
IGJ1cyBtYXN0ZXJpbmcgZW5hYmxlZCBhbmQgdGhlIERNQSBlbmdpbmVzIHBvaW50ZWQgYXQNCj4g
PiBmcmVlZCBtZW1vcnkuDQo+ID4NCj4gPiBOb3JtYWwgcmVtb3ZhbCByZXN1bWVzIHRoZSBkZXZp
Y2UgZmlyc3QsIHdoaWNoIHJlc3RhcnRzIHRoZSBjb21tYW5kDQo+ID4gRE1BLCBzbyB0aGVyZSB0
aGUgcmluZyBidWZmZXIgaXMgZnJlZWQgd2hpbGUgdGhlIERNQSBpcyBydW5uaW5nIHVudGlsDQo+
ID4gcGNpX2Rpc2FibGVfZGV2aWNlKCkgY2xlYXJzIGJ1cyBtYXN0ZXJpbmcuDQo+ID4NCj4gPiBT
dG9wIHRoZSBjb250cm9sbGVyIHdpdGggaGRhX2RzcF9jdHJsX3N0b3BfY2hpcCgpIGJlZm9yZSBm
cmVlaW5nIHRoZQ0KPiA+IGJ1ZmZlcnMsIGFzIGlzIGRvbmUgb24gc3VzcGVuZCwgYW5kIGV4cG9y
dCBpdCBmb3IgdXNlIGZyb20gaGRhLmMuDQo+ID4NCj4gPiBUaGlzIHdhcyByZXByb2R1Y2VkIGJ5
IGJpbmRpbmcgU09GIGluIERTUGxlc3MgbW9kZSB0byBhIFFFTVUNCj4gPiBpY2g5LWludGVsLWhk
YTogYWZ0ZXIgdGhlIHByb2JlIGZhaWxzIHdpdGggIlNPRiBmaXJtd2FyZSBhbmQvb3INCj4gPiB0
b3BvbG9neSBmaWxlIG5vdCBmb3VuZCIsIENPUkIgYW5kIFJJUkIgRE1BIGFyZSBzdGlsbCBydW5u
aW5nIHdpdGgNCj4gPiB1bnNvbGljaXRlZCByZXNwb25zZXMgYW5kIGJ1cyBtYXN0ZXJpbmcgZW5h
YmxlZCwgYW5kIHRoZSBwYWdlIHRoZXkgdXNlDQo+ID4gaXMgc29vbiByZXVzZWQgYXMgYSBwYWdl
IHRhYmxlLg0KPiANCj4gVGhpcyBpcyBpbmRlZWQgYSBwb3NzaWJpbGl0eSB3aGljaCBJIGhhdmUg
b3Zlcmxvb2tlZC4NCj4gRldJVywgTGkgWWlmYW4gc3BvdHRlZCB0aGUgc2FtZSBpc3N1ZSBlYXJs
aWVyOg0KPiBodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVjdC9saW51eC9wdWxsLzU5NzYN
Cj4gDQo+IGJ1dCB1c2luZyBoZGFfZHNwX2N0cmxfc3RvcF9jaGlwKCkgaXMgdGhlIGJldHRlciB3
YXkuDQoNClRoYW5rcyBQw6l0ZXIsIGFuZCB0aGFua3MgU2FzaGEgZm9yIHRoZSBmaXguIEFncmVl
ZCwgdGhpcyBpcyBiZXR0ZXIgdGhhbg0KbXkgcGF0Y2gsIHdoaWNoIG9ubHkgc3RvcHBlZCB0aGUg
Q09SQi9SSVJCIERNQSBpbiBoZGFfZHNwX3JlbW92ZSgpLA0Kc28gSSB3aWxsIGRyb3AgbWluZSBp
biBmYXZvciBvZiBpdC4NCg0KU29tZSBkYXRhIGZyb20gcmVhbCBoYXJkd2FyZSwgaW4gY2FzZSBp
dCBpcyB1c2VmdWwuDQoNCldlIGhpdCB0aGlzIG9uIE5vdmFMYWtlLVMgd2l0aCBhIHY3LjMtcmMz
IGJhc2VkIGtlcm5lbCBhbmQgdGhlIFNPRg0KZmlybXdhcmUgbm90IGluc3RhbGxlZC4gQWZ0ZXIg
dGhlIHByb2JlIGZhaWx1cmUgdGhlIElPTU1VIGtlcHQgcmVwb3J0aW5nDQpmYXVsdHMgZnJvbSB0
aGUgYXVkaW8gY29udHJvbGxlcih5b3UgY2FuIGFsc28gZmluZCBpbiB0aGUgc29mIGxpbnV4IHB1
bGwgcmVxdWVzdCk6DQoNCnNvZi1hdWRpby1wY2ktaW50ZWwtbnZsIDAwMDA6ODA6MWYuMzogZXJy
b3I6IHNvZl9wcm9iZV93b3JrIGZhaWxlZCBlcnI6IC0yDQpETUFSOiBEUkhEOiBoYW5kbGluZyBm
YXVsdCBzdGF0dXMgcmVnIDINCkRNQVI6IFtETUEgV3JpdGUgTk9fUEFTSURdIFJlcXVlc3QgZGV2
aWNlIFswMDAwOjgwOjFmLjNdIGZhdWx0IGFkZHIgMHhmZmZmZTAwMCBbZmF1bHQgcmVhc29uIDB4
NzFdIFNNOiBQcmVzZW50IGJpdCBpbiBmaXJzdC1sZXZlbCBwYWdpbmcgZW50cnkgaXMgY2xlYXIN
Cg0KYW5kIFJJUkIgRE1BIGFuZCB1bnNvbGljaXRlZCByZXNwb25zZXMgd2VyZSBzdGlsbCBlbmFi
bGVkDQooUklSQkNUTD0weDMsIEdDVEwuVU5TT0w9MSkuDQoNCkkgdGVzdGVkIFNhc2hhJ3MgcGF0
Y2ggb24gTm92YUxha2UtUyB3aXRoIGEgdjcuMyBiYXNlZCBrZXJuZWwsIGFsc28gd2l0aA0KdGhl
IGZpcm13YXJlIG1pc3NpbmcuIFRoZSBvbmx5IEhEQSBjb2RlYyB0aGVyZSBpcyB0aGUgZGlzcGxh
eSBjb2RlYywNCndoaWNoIHNlbmRzIG5vIHVuc29saWNpdGVkIHJlc3BvbnNlcyBhZnRlciB0aGUg
ZmFpbGVkIHByb2JlLCBzbyB0aGUNCkRNQVIgZmF1bHRzIGRvIG5vdCBzaG93IHVwLCBidXQgdGhl
IGNvbnRyb2xsZXIgc3RhdGUgZG9lcy4gV2l0aG91dCB0aGUNCnBhdGNoLCBSSVJCIERNQSBhbmQg
dW5zb2xpY2l0ZWQgcmVzcG9uc2VzIHN0YXkgZW5hYmxlZCAoUklSQkNUTD0weDMsDQpHQ1RMLlVO
U09MPTE7IENPUkJSVU4gaXMgYWxyZWFkeSBjbGVhcikgd2l0aCBidXMgbWFzdGVyaW5nIG9uIGFu
ZA0KUklSQkJBU0UgcG9pbnRpbmcgYXQgdGhlIGZyZWVkIGJ1ZmZlciwgYWZ0ZXIgZXZlcnkgZmFp
bGVkIHByb2JlIChhdA0KYm9vdCBhbmQgaW4gNSB1bmJpbmQvYmluZCBjeWNsZXMpLiBXaXRoIHRo
ZSBwYXRjaCwgQ09SQi9SSVJCIERNQSwNCnVuc29saWNpdGVkIHJlc3BvbnNlcyBhbmQgdGhlIHBv
c2l0aW9uIGJ1ZmZlciBhcmUgZGlzYWJsZWQgaW4gYWxsIG9mDQp0aGVzZSBjYXNlcywgYW5kIG5v
IG90aGVyIGlzc3VlcyB3ZXJlIHNlZW4uDQoNClRlc3RlZC1ieTogTGkgWWlmYW4gPHlpZmFuMi5s
aUBpbnRlbC5jb20+DQoNClNhc2hhLCB3aGVuIHlvdSBzZW5kIHYyIHdpdGhvdXQgdGhlIGRkOTZk
YWNhNmM4MyBGaXhlcyB0YWcsIGNvdWxkIHlvdQ0KcGxlYXNlIGFsc28gYWRkOg0KDQpSZXBvcnRl
ZC1ieTogTGkgWWlmYW4gPHlpZmFuMi5saUBpbnRlbC5jb20+DQpDbG9zZXM6IGh0dHBzOi8vZ2l0
aHViLmNvbS90aGVzb2Zwcm9qZWN0L2xpbnV4L3B1bGwvNTk3Ng0KDQpUaGFua3MsDQpZaWZhbg0K
DQo+ID4gRml4ZXM6IGRkOTZkYWNhNmM4MyAoIkFTb0M6IFNPRjogSW50ZWw6IEFkZCBBUEwvQ05M
IEhXIERTUCBzdXBwb3J0IikNCj4gDQo+IENhbiB5b3UgZHJvcCB0aGlzIEZpeGVzIHRhZywgdGhl
IGhkYS1jdHJsLmMgaHVuayB3aWxsIG5vdCBhcHBseSBuaWNlbHkgdG8gb2xkZXINCj4gc3RhYmxl
IGtlcm5lbHMgV2l0aCB0aGUgcmVtb3ZlZCB0YWc6DQo+IEFja2VkLWJ5OiBQZXRlciBVamZhbHVz
aSA8cGV0ZXIudWpmYWx1c2lAbGludXguaW50ZWwuY29tPg0KPiANCj4gPiBGaXhlczogOWU2OTY2
ZjcwNDA0ICgiQVNvQzogU09GOiBJbnRlbDogaGRhOiBLZWVwIG5vbi1hbHQgbWxpbmtzDQo+ID4g
cG93ZXJlZCBhdCBwcm9iZSBvbiBBQ0UyKyIpDQo+ID4gU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2
aW4gPHNhc2hhbEBrZXJuZWwub3JnPg0KPiANCj4gDQo+IA0KPiA+IC0tLQ0KPiA+ICBzb3VuZC9z
b2Mvc29mL2ludGVsL2hkYS1jdHJsLmMgfCAxICsNCj4gPiAgc291bmQvc29jL3NvZi9pbnRlbC9o
ZGEuYyAgICAgIHwgNCArKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi9pbnRlbC9oZGEtY3RybC5jDQo+
ID4gYi9zb3VuZC9zb2Mvc29mL2ludGVsL2hkYS1jdHJsLmMgaW5kZXggYWViMzQzMTBlZWJkNi4u
MzMzZjZiYmVhNzUzOQ0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3NvYy9zb2YvaW50ZWwv
aGRhLWN0cmwuYw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLWN0cmwuYw0KPiA+
IEBAIC0zNDksNiArMzQ5LDcgQEAgdm9pZCBoZGFfZHNwX2N0cmxfc3RvcF9jaGlwKHN0cnVjdCBz
bmRfc29mX2Rldg0KPiA+ICpzZGV2KQ0KPiA+DQo+ID4gIAlidXMtPmNoaXBfaW5pdCA9IGZhbHNl
Ow0KPiA+ICB9DQo+ID4gK0VYUE9SVF9TWU1CT0xfTlMoaGRhX2RzcF9jdHJsX3N0b3BfY2hpcCwN
Cj4gPiArIlNORF9TT0NfU09GX0lOVEVMX0hEQV9DT01NT04iKTsNCj4gPg0KPiA+ICBNT0RVTEVf
TElDRU5TRSgiRHVhbCBCU0QvR1BMIik7DQo+ID4gIE1PRFVMRV9ERVNDUklQVElPTigiU09GIGhl
bHBlcnMgZm9yIEhEYXVkaW8gcGxhdGZvcm1zIik7IGRpZmYgLS1naXQNCj4gPiBhL3NvdW5kL3Nv
Yy9zb2YvaW50ZWwvaGRhLmMgYi9zb3VuZC9zb2Mvc29mL2ludGVsL2hkYS5jIGluZGV4DQo+ID4g
NGRiYmE5MTg2YjI5ZC4uMmE0MGNiOWJmMjRkOSAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2Mv
c29mL2ludGVsL2hkYS5jDQo+ID4gKysrIGIvc291bmQvc29jL3NvZi9pbnRlbC9oZGEuYw0KPiA+
IEBAIC05MzksNiArOTM5LDcgQEAgaW50IGhkYV9kc3BfcHJvYmUoc3RydWN0IHNuZF9zb2ZfZGV2
ICpzZGV2KQ0KPiA+ICAJCWhkYV9kc3BfY3RybF9wcGNhcF9lbmFibGUoc2RldiwgZmFsc2UpOw0K
PiA+ICAJfQ0KPiA+ICBmcmVlX2lwY19pcnE6DQo+ID4gKwloZGFfZHNwX2N0cmxfc3RvcF9jaGlw
KHNkZXYpOw0KPiA+ICAJZnJlZV9pcnEoc2Rldi0+aXBjX2lycSwgc2Rldik7DQo+ID4gIGZyZWVf
aXJxX3ZlY3RvcjoNCj4gPiAgCWlmIChzZGV2LT5tc2lfZW5hYmxlZCkNCj4gPiBAQCAtMTAwNiw2
ICsxMDA3LDkgQEAgdm9pZCBoZGFfZHNwX3JlbW92ZShzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYp
DQo+ID4gIAkJc25kX2RtYV9mcmVlX3BhZ2VzKCZoZGEtPmljY21heF9kbWFiKTsNCj4gPg0KPiA+
ICBza2lwX2Rpc2FibGVfZHNwOg0KPiA+ICsJLyogc3RvcCBDT1JCL1JJUkIgYW5kIHBvc2l0aW9u
IGJ1ZmZlciBETUEgYmVmb3JlIHRoZSBidWZmZXJzIGFyZQ0KPiBmcmVlZCAqLw0KPiA+ICsJaGRh
X2RzcF9jdHJsX3N0b3BfY2hpcChzZGV2KTsNCj4gPiArDQo+ID4gIAlmcmVlX2lycShzZGV2LT5p
cGNfaXJxLCBzZGV2KTsNCj4gPiAgCWlmIChzZGV2LT5tc2lfZW5hYmxlZCkNCj4gPiAgCQlwY2lf
ZnJlZV9pcnFfdmVjdG9ycyhwY2kpOw0KPiANCj4gLS0NCj4gUMOpdGVyDQoNCg==
