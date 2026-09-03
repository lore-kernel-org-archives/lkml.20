Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB54514750;
	Thu,  3 Sep 2026 22:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788472990; cv=fail; b=lSm5uccVqMo7yw+S8BQp4Ug8aamllrnryz3B/56YTk9GxK1Xi8qCZPZ6A9vsG22X+oF0TclrOnUYKeUF9w97AiZiyJTP87/qiVsQqrbGJR7YeU97a8WUL1LXJL80R+qMwN8v4X1bs+MvymSA6LbwqRRexbWycyP+6Fj0xAP/B/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788472990; c=relaxed/simple;
	bh=V5Joaq5WbHEb30MMT8fef966KyEl5rtQA+d8ft6jNMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DpTtCvmAJNX2e4/Szv/OB4pPoAUST+lxXGuZGeVSNkB6f7SF45bBL2bg2rRv/X/Hm16TkOONDvs8QFyQFRG9b2L1WYkhL/7swK11sHPSyhqH3/8aTom/0ewqodli34E0KVoDOgBPPBQWDuxllCcI7nRkvN52VQoxGadLlSauUrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb7ddjfT; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb7ddjfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788472987; x=1820008987;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V5Joaq5WbHEb30MMT8fef966KyEl5rtQA+d8ft6jNMk=;
  b=Yb7ddjfTyE17toNFVqG3n2JFVN2iArD/PfjkjtHTX8cbs4s1WL0Do/aq
   F2MvI68QQhboFAESuAQJUApbA8/5eDeeRBSPKvlU2BfmnVogJL03SFFEb
   Pg0YmZs9vRFN/LJ4ua49YGIZn7OstiCBQ0k34MfQsaX16+3KpARzkr0TL
   0NxB4er634XQtTloJw7ErbL24d+8itFmTfcAu0VzY3a5iH4ftoY8zf4Vp
   Xv8lcOpoItFAHv17FjXg9D2moX13bO4ZhlhlhZ6ZsUFgB1e/B1kZrgkvu
   nGxoOtLMtbI7fzzVG43MWgdLpoNtfCLDe+pOTGyctv/g09X0cW++qN47l
   A==;
X-CSE-ConnectionGUID: n9nt/fVXQ4aYTrDJxNyGOg==
X-CSE-MsgGUID: OKUD1wj2TjykLldOAGNfJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88817278"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88817278"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 15:03:02 -0700
X-CSE-ConnectionGUID: MYdMNJ00Rt+8b2V7PTiwqg==
X-CSE-MsgGUID: 6rzlkjTERKKYRjf+oQ+M0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273630918"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 15:03:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 15:02:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 15:02:59 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 15:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fe2exLmpllqwGXbOd+MSzEoiSsnh99wJ+uBrXF+aRShCGZuv7ekxW1z8kkJ4jcnZaGWXGO6B+WtJFvCuSjL1i127UjWXItZ/YW7TgVw4DS3jXnO+1baeMvMQc0sZ606yqfXD63OtLjMqa/nlvB1FvwpGBMnTXFVvxHsV2xrxUXl62HUCErqgHcucD/tyjCjFehLTNKkLbXSqxEjHAezIt0hhPuZ1xOMXrmWoG4qEYIYey9vnkluz63EZEUJFCH8kZpHam3xI6mdYb6kPwk/wYSJoF/0T2cAsVO4Gq/cZyY0grU+0hwz+CbnLKx6C94AhYJ4sGO5a5T4VAM3FlRwm6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5Joaq5WbHEb30MMT8fef966KyEl5rtQA+d8ft6jNMk=;
 b=wK4L1JSEEq+YJZpua40IMai29TtHnlM5PKQIQrvQWNR9uavvDjLnaUDZXLRBk5X8vdfe9qZK+x9rgcyYIBsJUYz5f86EYiEnKM/ww+rdZBAvF6o/wVWC2W2gUD9V7nANdh22yhGs+PDo0a6GzwOEMPB+ThmXDHqCOt7ToOCb6MeV6PYGQP22QY5+iU7deiPFSMboqQxtxHGMA5DjjLJ08AZzUh08yNNQA4PFGEktNayqNWtez2+h3Dv6J2w4I/Go27TyF7No/23Ri8OOkk1LqTTgCyiEYNGi+L66+Y1rgS38w+OoB+2CZW7MGUIvoO4ynK2ARKmBH1naO/UDTiDmhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 22:02:57 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 22:02:57 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, "bp@alien8.de" <bp@alien8.de>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"frederic@kernel.org" <frederic@kernel.org>, "marco.crivellari@suse.com"
	<marco.crivellari@suse.com>, "neelx@suse.com" <neelx@suse.com>,
	"sean@ashe.io" <sean@ashe.io>, "chjohnst@gmail.com" <chjohnst@gmail.com>,
	"mproche@gmail.com" <mproche@gmail.com>, "nick.lange@gmail.com"
	<nick.lange@gmail.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid
 redundant polling
Thread-Topic: [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid
 redundant polling
Thread-Index: AQHdO9xKSaKgNwIs/U25OZI06KE0mra9XygAgAAF9+A=
Date: Thu, 3 Sep 2026 22:02:56 +0000
Message-ID: <SJ1PR11MB608333A92F98196EC747C75CFCB62@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260903194130.186096-1-atomlin@atomlin.com>
 <4pab5o5tt3qvpu7jcwuf27g5klrkeoyjgzhvw5s7sc3v5wdtl3@dlwjcvr55gck>
In-Reply-To: <4pab5o5tt3qvpu7jcwuf27g5klrkeoyjgzhvw5s7sc3v5wdtl3@dlwjcvr55gck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MW3PR11MB4523:EE_
x-ms-office365-filtering-correlation-id: c203a74f-2365-4322-95f8-08df0a071c99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info: pG+Ptf3Q7YjZbSToGG3W+M9d2UDzC+LrK9rMQEAWlWHRNXdDs4lQ1K91k21bFOK+BJsx9ptX814fsVGnsrI5w8r4EqmzH2mWP+6TH44kVbmwPti7Vt5GEjgzSqrlKg9Uip6VBUznExK3MkWHxfy/jmd8ZuObsUdhk9qvb4c3sUPrK0ucGDDroYxdPG6aPrtLhJGivIwrarB2csekpLQg4KWBdyxAy0BBmVB9j6dwT1UzaajEB4lVFXe3wahr9293rEW3c8QhksWur8aTb5MX/vzXL+3nQ5uouE/ZBoc6iVuf4rIrB7rNoIfRvwa/dla1VJa/mWVBqdwDWf2tz3li//36FeXHIEPHvmH4SlM9/aUMaBPhIB72GARcm+/IxbdkVIlGept//d5o2+Moe12PbX/zuGjylOp2TVFu+hNE8nH5s5GZ3UZKA7ZKkumE2TjRkvaWMoDQLAc6gc7Q00qPfuArfiaqjtn3By07EayMTdV2CuXIUD7hFDBBbkCKq75EAUTxWjeuL6+11SPemI5Wk4Rds55BIzjFRhT/rUS2CPru3VcClzJ3FkB7NavQW3Mb0lnqE7LJlAnj5p5NON0+XEWes/YuqVbYRVGcUTM5JcxUrTy6enFb75FuQjchUWUNaymGcQuSAl5EXVOFacSrQZfAjEoVolNi8RIkE5ckl0Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXY0R3Y2N2VSR0lNVkU5N0oyc3d0WGJLeWhEOGNucXZlSW9EV25zUWlHNm9V?=
 =?utf-8?B?ZFMyQm1ZckpGVWRXUGRoeXB3dVpKd2VYVFBtUHg3QTJWMm9pYmFzaWpmQzI4?=
 =?utf-8?B?SkNxb2ZVL0J6SW9GRzdOYk1qZHFTdHE0dlE0Rmh0dU00Q2Z5NUJrZzF4ZDJ0?=
 =?utf-8?B?aGdRMHplYk9ZK2h4R3ZQeEUvUnQ5dmRobVB5ZnZ5SFRRS1hHeWVyenB0aU50?=
 =?utf-8?B?Nzk5cldrQmFEa21xZ3cxVUdWN01xcDhDZlRtUnV6MU9XMUhqOVRXOVNNWmZm?=
 =?utf-8?B?MmZvdDRSTzVIMGVPYlhDa3VVakxnbk81RDFuZlNVeldOUDVrTVFmbExRUzZj?=
 =?utf-8?B?dUdaQ281dVd1ejl5S3pjd2dTT0FRUFFjWlhVZm12WW1Pa0xhWHhCVXQ4QkNl?=
 =?utf-8?B?QWZQQUNvOVc3NE9tRUtHc1B5TW4vd1VTWWNDZk0wdURnNFpjWDRTNnB5VlR5?=
 =?utf-8?B?OERNSHhPOGxxaXhlYnRNVWV3NFk1cEs4UDVGMmhhMU9CTTYxMjFQcE1hOGxi?=
 =?utf-8?B?ekRIa1hYNmpmbmNGUE1kVzh5Q0tIdmgwczcycnh1UktPaHU1eTZPbXlOS1lh?=
 =?utf-8?B?WWt1bnpJTjAxZWw0cTRZdWdNT1ViM0ExT2xVWE5waXFlaS9IZVpteUZsY2Uv?=
 =?utf-8?B?MTNtVFh1ZExvWDVCNGFjb0ZObXhEQTNZQTdSZjFLSFBqaEZXMTh6R1d5Wm9l?=
 =?utf-8?B?ejRGVmhRTFZneTR0KzNodEhvWjZCbW0rSzZUdTlMZ2JnZ1c2cjRBRHJ0WE45?=
 =?utf-8?B?UUpPZ2NRQW1abnNTcGV4MmRhQzBKbDN4MGZZcE14RUw0dmF0aitVY3JxQ0FZ?=
 =?utf-8?B?STJ2VFd4THZoQ3ExUnlIMi9zMXR0djk0cFNDd0RsU0x1ZFRaakh2ZGNBV1RQ?=
 =?utf-8?B?dWRTYk5wbTJKbkhMODNKUEU1cmZDUzdNRmtZYVlxTHpORVdoQksySnJhc1B5?=
 =?utf-8?B?L24xaUVnWktxWCszZEFEMTBlYjZzZHBDby9tK08vVDJJZHIxM1p2VTVBVTRZ?=
 =?utf-8?B?d2hHZWpMeTRJc01yTTlUZ3U5aVZHb3IxY21DVTlBTE5acG50Rkg2UEFPSjRn?=
 =?utf-8?B?K2o3NkU1cHR4Z2hOMnlJQ3RWcUJVa3ZtUVRYY1ZRay9LSjhzVTJROVU4MExV?=
 =?utf-8?B?K3FMTVMrVVlsRHV6cHJjQ3pKTDU0N1FndTVYbG4yMlJFbWZSNXZaSDV4RllL?=
 =?utf-8?B?RlpBNE5WaUlHaFR4YktkTEs4TUtES2RNUjZZelVjWW0rU21hYjl2YWtWM1Z4?=
 =?utf-8?B?b0lYWGdvMXRmYys4RDJrZ3EvbzAvQW5uVU1GdVh1ZFpUbUJ6RnY2UDMzZGpv?=
 =?utf-8?B?QVFTZm9PYjhHdTNMVEhpNnFJMTFjdkVmbjRac1BzWUhiSEw4MzB1VncxYzVW?=
 =?utf-8?B?czB0cGdPVW5TdXM0ZVcxZTVGQlMvNTRHNUlCS2dlSFJDeVdaQjYyTVoxd3Fv?=
 =?utf-8?B?V3ZESnIvdWNaZy9RdXh0K0pwMG5Qa29CMzlOUXQ1N2hYbzBSdVhFblVLQmQz?=
 =?utf-8?B?TUl6ZG9pZHRrYVc3Tm5LWVMrc0lOcXpraVg4TmxGdmYwSmpuLzZpclYzVXlu?=
 =?utf-8?B?YU5OZVVZL0lITUZQZnhkUzcrbFhHRG9ncHJ2eWpFQXBXc1AxSzE2YXRGWUN2?=
 =?utf-8?B?MEhwaGxpSW1vbEdySDQ2Qm02a3E2Z2syeHJUcXcwMWZadlpVTEFrVDJIMFlI?=
 =?utf-8?B?RWV0OU5JNis4SVYrb04zNENQRk9Bb2FkK0hUb1Y2b25ucFhJZGVOTmNuWHdM?=
 =?utf-8?B?RE96dXkyMjhiaGl1SGp5emU5RmpkdDRxbFZMV2R5MFp2RW95b1RwT2hpNGw1?=
 =?utf-8?B?MlgyNTlpWXFWZjRvMURWZEhLVFR4d01nOSsvT21YZGE5MGJsZURSRDF6QVlK?=
 =?utf-8?B?bW12R0FWVEFLN2dYNU1XM1NXWHo1TXVmV3VGeXpRUzBYL3VVNm9Cb0wwcTRB?=
 =?utf-8?B?SGlXQUN4SlVxcnpXNVBsSjRtY203T0t5WVZBbXIzMUNNMFNsY0VQc084WGxw?=
 =?utf-8?B?WnYvUUR3TGlZSkdncjdTRWZ5bEhXWGJFUEJhZlE4dlo1cnd2NjdFTGFsM0Rs?=
 =?utf-8?B?VFNWVS9sRFJQcjdHeFQ5R08yZ0JqRytrVWM5czdWVFM3SGhjNCtFV1NiSVZy?=
 =?utf-8?B?S1BGSkRrekNqTUxGMWp3MjhaamRRandBZzczTmNYMFFGdW5OeGNmcjRjUFR5?=
 =?utf-8?B?bUdtcndwaU9ZbjFvQ3NWWk9YVHpoSWx3MkhMSE1YWHJYSkxYNGovOHNubkFP?=
 =?utf-8?B?UWMySzJMRnI0eGhHZGtZWnk0QmQxK3k4NW1TUW5sZFRVV3gyb2p4Zld0NSs2?=
 =?utf-8?Q?rpRoX/13k0PiDf8257?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BBtBK3tcX9WUfOp+av1Nv+9GgenWEkFt+BtPPtEcElp1syhKwEXx3pfbgmt70bWulF5zFsnfi3NyCR8UMNXo5coBb1ehioUHtEFSR+sRcHUftFS12CZLFON8OWYNxprruHyjmC41YuLSar37PJCQ85Ri98gS+KehCeyPCJX599jEWcFRdsGOixTy7iEflCqMYY0gSuA3L4DZRyvJYWD9bvXzw3mpbpT0AQHjkwvNgGZ3AHE+5BgQSflRHRAZDsJdu7Zg/c4ko4k4S3lAFRnFQD4wNFUTxHh7hjQh9hrWn2ujgZHBpEuh47ICcR6pysKiJTlkC3HgUZ3Zmd0wy9bjFw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c203a74f-2365-4322-95f8-08df0a071c99
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 22:02:57.0582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f64pNLena3SNG6BcPhiNkVXW4TvXazddFz18eqFr53ghLCHLYfC2y+5o6l3isjfLQqC5kTDixAxAhl/DdC6pXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
X-OriginatorOrg: intel.com

SGkgQWFyb24sDQoNCj4gU2FzaGlrbyBbMV0gaGFzIGNvcnJlY3RseSBoaWdobGlnaHRlZCBhZGRp
dGlvbmFsIHByZS1leGlzdGluZyByYWNlDQo+IGNvbmRpdGlvbnMgaW4gdGhpcyBhcmVhLiBTaG91
bGQgeW91IHByZWZlciwgSSB3b3VsZCBiZSBtb3JlIHRoYW4gaGFwcHkgdG8NCj4gaW5jb3Jwb3Jh
dGUgdGhlIGZpeGVzIGZvciB0aGVzZSBpbnRvIHRoZSBjdXJyZW50IHNlcmllcz8NCj4NCj4gWzFd
OiBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MDMxOTQxMzAuMTg2MDk2LTEt
YXRvbWxpbiU0MGF0b21saW4uY29tDQoNCkknbSBub3Qgc3VyZSBhYm91dCB0aGUgZmlyc3QgU2Fz
aGlrbyBpc3N1ZSAuLi4gdGhlcmUgaXMgYSB3cm9uZyBzdGF0ZW1lbnQ6DQogDQogICBTaW5jZSB0
aGUgaGFyZHdhcmUgdGhyZXNob2xkIGZvciBhIHN0b3JteSBiYW5rIGlzIHNldCB0bw0KICAgQ01D
SV9TVE9STV9USFJFU0hPTEQgYW5kIG5vIGxvbmdlciBnZW5lcmF0ZXMgaW50ZXJydXB0cywNCg0K
U2V0dGluZyB0aGUgc3Rvcm0gdGhyZXNob2xkIGRvZXNuJ3QgZGlzYWJsZSBpbnRlcnJ1cHRzLiBJ
dCBqdXN0IHByZXZlbnRzDQpnZW5lcmF0aW9uIG9mIGEgbmV3IGludGVycnVwdCBmcm9tIGEgYmFu
ayB1bnRpbCBlbm91Z2ggZXJyb3JzIGFyZSBsb2dnZWQNCnRvIG1lZXQgdGhlIHRocmVzaG9sZC4g
U28gdGhlIHVzZXIgd29uJ3Qgc2VlIGxvZ3MgZm9yIGEgd2hpbGUuIEJ1dCBzaG91bGQNCmFub3Ro
ZXIgc3Rvcm0gb2NjdXIsIHRoZW4gdGhpbmdzIHdpbGwgZml4IHRoZW1zZWx2ZXMgd2l0aG91dCBh
IHJlYm9vdC4NCg0KSWYgeW91IHNlZSBhbiBlbGVnYW50IHNvbHV0aW9uIHRvIHRoaXMgcmFjZSwg
dGhlbiBnbyBhaGVhZCB3aXRoIGEgcGF0Y2guIEJ1dA0KSSB3b3VsZG4ndCBzdHJlc3MgaWYgdGhp
cyBvbmUgaXNuJ3QgZml4ZWQuDQoNClRoZSBzZWNvbmQgcmVwb3J0IHJlZ2FyZGluZyBmaXJtd2Fy
ZSBmaXJzdCBiYW5rcyBkb2VzIGxvb2sgZWFzeSB0byBzb2x2ZS4NCkp1c3QgY2hhbmdlIGNtY2lf
c2tpcF9iYW5rcygpIHRvIGNsZWFyIHRoZSBiaXQgaW4gbWNlX3BvbGxfYmFua3M/DQoNCi1Ub255
DQo=
