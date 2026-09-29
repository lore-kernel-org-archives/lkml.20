Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E797835C19B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711627; cv=fail; b=gC0Odh/5ZyXV4SyytbhxYcmZBa2DNMDyVTRPwOPT1vLUnmBK0L7WPZHpB3mNGDPludvJY1EPU5BhO4guevRSTlwUK5jYigYwjBgmlbEz0tHFwNp2nHKIm59ZK2gEZOQLPJq1oHG8+w3Zf9IcE0tueGyZR6/PrRuszTL3P82c668=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711627; c=relaxed/simple;
	bh=UTzNJRL7L7QeuE5ESDBM0tPwaQYRAbHHakaTjvri2Hk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xdbg+t7PfH12IlmWt5HUM9hIkiCUTlnjZfR2+q5qVD9V4lQ67ya9XozhBIT7m8xgwuFJaxYclG75SEIPUcSH+fbsrid6VOoKN7yXW8EQL2rzr8mhpO8QzkyI/7v0Ij3AdkB4P6QUuJvAN4iEn7OmRnR95B7tQcBbiVWX3Rd0ACg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neE+Gv4m; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neE+Gv4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790711625; x=1822247625;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UTzNJRL7L7QeuE5ESDBM0tPwaQYRAbHHakaTjvri2Hk=;
  b=neE+Gv4mnCyhy8L4Az2KUaCpFWfRUcMEbfz1hORATjN0G6hFi65SXTcf
   T/BCcC+4vW43QSCHi9a5zWc6BdHg6yzAekT6//21xmjsXUSrGn1eEx5rj
   lTYIpqSGpPVhk+pE/A/I2KT8tVmt27tUwFLpeuHJy14pHRTycygvK5qg+
   5oNid8bq8pzmiyMs5ZEGjYxbav9c9/8MtR4ksgMVppkJSam52FRyJ+g5q
   ZEi1Qww3cdI7J0bsoOBhPQKBuPhDv83PeJAPy5l7iFTXWUICC3iNZCZA5
   72tn782+V7KAr8TyHcSPngF1N3WAzBL1nAixTZZIfS4MSB+nwafTK7kMc
   Q==;
X-CSE-ConnectionGUID: 4RUUze7LSwOH0gVEk0Zv2g==
X-CSE-MsgGUID: Ne0WLdTpQimXKtI+B11PYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91462032"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91462032"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 12:53:44 -0700
X-CSE-ConnectionGUID: aL6WAkceSDyuCWwLIA8zSA==
X-CSE-MsgGUID: ojxmUNccSCOT7HB5upQoKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275013927"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 12:53:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:53:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 12:53:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v147F1MJsZxBBTKPqT0zyRgJR5qKfw7hUzVb+P13exzAwXFB3HiqtjSyX8EyEUpX/dO+Ou+phv+Akdrwvb3We0ZEGiiBsSNYXH0TuGJ689SaT9QKvfD3VkccWoegIoyIlkZ/O072ztXit1NkmQ1NJpPYbnO/C3zYa9Q4kE1paItTu0Usp75JWfIMN1kq4wBZf90+t1wvnJe28W5hH4plz5c6V3OfaTmZJokd9ASRYbdrAcdyHn13BgpIRXR3IOLyG6PaZQMLC8CWyQSjmgN/ns9er4mPNKn5HvIaUYqqkqK0s5WD2JJ7TeGOQMcfijrQfEllXJ1O4O+AzxMTthjM8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTzNJRL7L7QeuE5ESDBM0tPwaQYRAbHHakaTjvri2Hk=;
 b=rT2RhXAeIksSgRcvjP4+UmRK3+Edt9Z23Y/alZ/yyW7GdpXiFCT31QC5OUO2rtdWA9xP4Di7ikgLAcrXezGbglh4+ajxY1Ntz9JdudA8bIIAFCfhQQQHpOTuKkPM/Ehjc4N8VfjT3uhqqJusMPImlGxZXikU4go31jGPLnHA9ZLf3xmvsY4nKeiGxigvpjqMZQZGWfhuQPgSMxCLyd+estbgW0vA+p2ZkO+9MR9kAWUEBlA5Yv/1OaX1YvZT2U2B1cf20f0sobRCIBhInuHTehCP0fMSkvffbCVqC/+qwwi8Ml4U/yNbRY3FV0tFWexlbEuf0mdjERnQabqbsntnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by DM4PR11MB5996.namprd11.prod.outlook.com (2603:10b6:8:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 19:53:41 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 19:53:41 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] PECI changes for v7.4-rc1
Thread-Topic: [GIT PULL] PECI changes for v7.4-rc1
Thread-Index: AQHdTTPCHxN2J88Se0OxMLCAfH7Ns7blj/SAgABuFYA=
Date: Tue, 29 Sep 2026 19:53:41 +0000
Message-ID: <9d50bb76347c18e83c112230ca15ca8c07af9571.camel@intel.com>
References: <14b83bcafac21987132c08a23043254c6c43e3ec.camel@intel.com>
	 <2026092907-clique-pod-9eee@gregkh>
In-Reply-To: <2026092907-clique-pod-9eee@gregkh>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|DM4PR11MB5996:EE_
x-ms-office365-filtering-correlation-id: 46208058-dc3f-49a7-c71a-08df1e635c86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info: 1yIKKfqYYXXI0uNEQ4FUpAUS22fSXN3YCI6WTux9wgEeBSmxnnsQWcUt5LIwJqiKs9uCoweRAeuf4DhDU9aTvjyfhrJmeXy2gR7EhMHtjQZxIQNZAlHXc6+za57p1/wOOlkJf/mvhkr1Dn0JqKry7RMa9/M816S8mUdUS8jkX3O7Jk2vtJUc2DvJcsMzMqtOErDqLw7NmAF3tlsjEDQO9sw4JBUnJTPiyAaF2LDk9ASR2w/D4KSKRuMa6z287+XS6l89NuWMinN+yHYxklYaHWn4IIxUagae7f7CF3ard2v6xivVFzt6IW4XLNvNU9rRttPSS7Szz+B1AQ01pr+fzqCgpVrBu3P/iBXjGghxzescTAj2ekHbtEq3isStMbbBZLwd16bAOSEjo+ZM408gSW9MZGSoiS3ULG7KhB6YEJzvyAVDG3/vc3bG7mR07Lo/XQ/F0qDsL+F+pe3tBb2BCmgLq/QfF/S9D0bv2ZrvQclbPjlDnHaEt1vsdaXcfQsy3ZJzyqT5MErTMPDenm9eaailqpFBzVqToK3VxHHaE3OhYEaC5ysB3STz20SWuVsHvDkMcDdjLyyYEyUic372opmalQF3dkLPRO6VqH0gAIGy49hdnD4RXN3KqU1tvKhaysyFTtGZ5lvRms8OIcp6SNFMi4pN0jHQK28kt8Tzr9GgxeQ5fE8F2rMl8VhHeCmeZXMI+uLuAn0BShOu9FIlmA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OG82bVZ2SlFQVTdQd1p0T1g3azhSd2s4d3hDalZRY3dlZHhVUUVqekFKeWFq?=
 =?utf-8?B?Z04vVDFReHlBUlFQQjZtVDZMbEpoZVRvWWh4L1FsSWlSUlVVYVRBTWR5RndG?=
 =?utf-8?B?UkNmNVE4ZzhPWmFaYndPTCtrK0FhcGNHM0NVbzV5M1VhSjlYRkNLSmU1NnhE?=
 =?utf-8?B?YURkRE5nTDh0ZGRaeGVjRDQxQVB3U3ZRMENsVkFCNGVzSVYycUZlSTFYSUta?=
 =?utf-8?B?dHY2cEp4b2p4ekFaRFlLTlQzSmpJMXllV1VHRFlQbVpxc2NTS3pPVVpEalZr?=
 =?utf-8?B?QUsyckJ1QnNUZHA5UlBYSlhIZHVPT0xycVg2akNRVzQ0WVRsdnc4RmN5NHVI?=
 =?utf-8?B?THd5V3JpTUlrYzZORzNmMFpFYThwek8rbTc3N3ZPRzgrem9jWml1a0FjeGha?=
 =?utf-8?B?TWppOFdGd2l0RERDeW93anZ4ZVJLR0NmVlFZTkhZa1RKK1pQR0c5TkNBZHNQ?=
 =?utf-8?B?TjRkeDdHWnVwMXRIVTl1alBvWjlPbmt6eEVkZHVTbkVwTytzbXh0M3JPTFVH?=
 =?utf-8?B?L1RXWVErSjNMZkE4Uy9XY1ZzMG9MZFBTM2tuRlB2czJ1NWROVEhMb05USzhB?=
 =?utf-8?B?cnFybnFqYmV3cUJudXF2UVRvS0VEaU5GT3RoZFVGODlWeFVyVlp2TzFldk1n?=
 =?utf-8?B?eHplcmJEYW95ckFzZGQzWExSUHJ4T3dqL3hkajl3YVJTRVlCZjZYTXpBRmF3?=
 =?utf-8?B?VGFEenFqWmNzTmg0akpCU2k5dTBPSlA4YnRLR01XZTZnR3duTGw1aml4RzB6?=
 =?utf-8?B?SFJhT0FVR1RRekdETlZQVC96TDlsM3haMC9XaHRxYjl5WHlRSEFXOVFjeTRl?=
 =?utf-8?B?TStreTNiZUREb2JtWE10amtjZU9PTVF0Y3IweFFYUjB5MTZUbVBxcFMxNmlP?=
 =?utf-8?B?YkVCSGc5K0xNRXM2RTBFNHhhU3hJenhRcU5LMkZJaDZyV1I3V2RUVy95b3h2?=
 =?utf-8?B?NEVlRmR6UStGWGovOUVWRnBLTFBML3lHMzgrNW80cWJBTk0zZXRQOG0vM3U3?=
 =?utf-8?B?UzRnL0ZNUWxWVndsVndCV3lodEtzbllKTkh6RDVSUE50bTJnRU9UdzV2ZDVO?=
 =?utf-8?B?dE84bUV0NG05dFRkZ1VMUllnQlp5ekxGVWRBaFNjYnE5bFgvNWJKY2crRjJB?=
 =?utf-8?B?VWZTQkxRclh1YXlMVVlZNnorWkhvYUxVbWhnOVhOSFBQajBFZ2VGR0s2dHhq?=
 =?utf-8?B?enNQUHRENkFVanhCNWQ3eG1iZGpEb2V5c1dPSFhJcXpFT0RxVFhGdVdSMk5U?=
 =?utf-8?B?MmVSQTF2dXlwSWFuR3IvMEcrRVYybDNDSFNmaXR4THdDcVRuSFpzU0l6UGF4?=
 =?utf-8?B?N0dsSUJycFdNandOVU16ZFFJZnV4RzNtbU9lRG9sVXNZMld4S2RMYUVaMGk1?=
 =?utf-8?B?bFdjazN1bXpLS3hPUkpPOVdESkdOdlBRQmsrSG1nckQrRjd5REZ1Z1pCT3ZX?=
 =?utf-8?B?Yit6YlRRMjZTQWNFdEVZcW5RZGhKUTVBTmZQa2RMWWtPaklsQzN6WnVZUXVj?=
 =?utf-8?B?dFY0dTF6VndTOWhpbTMwNlpHSTVFNkc0K2owZDRLR3g5cUg4RU5NcE9HMW5Y?=
 =?utf-8?B?RkIxWngzeGw0eEgrVmNEV25CZytjRE5iNVJkUDROOEp5eWdtMTJHZm1acnJB?=
 =?utf-8?B?c2ZmTFFnZGliaVNYWENPSUpEdUNCQ1RISjRxZkVTSVlxaGxYL0dVdUptaGdF?=
 =?utf-8?B?cG5KU0R3cEJScWtnV20zMnhKdjh3NW5kSDQ3TWlwT2x1NGgxMFpTdWExV00x?=
 =?utf-8?B?UjRhVlNSN2c0WU50MG9zdzBuVXhKREF6WDJnZDBTcU10bVhPYXBkc0xFakVu?=
 =?utf-8?B?RWkyK2FBeExJTjJEdlJZNEpzc2t0bU94VmVFQzFxTzNSMnc2VE1nMkJWK2V4?=
 =?utf-8?B?Y3dZZDJmZFp1QVRKZk1FdDVwd09zVkF2NVdrbmRDeitLdkdzNTlqMGhMamFy?=
 =?utf-8?B?L1Ywb0hjNDljWUdPa0pZYkMzMzVyODlVTngxc3pWRXdFMC85WmMrcEoyMHNO?=
 =?utf-8?B?MWNwaEdyUzM4bFBuTGY4ajU0eGxsZjFJOG9lNzRQQnlOMVBnYVoyK2ZFYWlr?=
 =?utf-8?B?blNQaFFQdGEyQVJDcjlKcmowODdKc2lZa2ZXVzZMOFNadXVkK3JaeWtrM3J0?=
 =?utf-8?B?RStLTXM1cytnK0lkUzJDV29FdjFyaXZGQTBSei9XTUo3T09INFphd3BCZEM0?=
 =?utf-8?B?VVpiTjFldFhwTnd0d1RWbm9ZSGZlZWllRnpMTjBudjJoeEVRQW9haWFSU0Yw?=
 =?utf-8?B?bmNQM2w3N0p5Y2hTNGpjcUhJeGJsWWJFYzdCZnhhekR6eW5lbkI3MzRlNC9M?=
 =?utf-8?B?aXdBQlJ6b0ZZeGQvRkcyeUlqVHVieFBObnVRbTBZTTNqM0d4ZFdpWElxMnFB?=
 =?utf-8?Q?Yzet6nw/AXQcNyrg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B9A0A35A329A14AA7ACD90B638ED77F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ItS4KjQABrQxEarAmNltWqVC7EwvYo1W3xncuAokGiTx1b+AxUVIya5B+rxyyp5UNix36/yQzpy5ZEBcAubodZaF37k/n+IoNA3yYURQrWvunVHYVcCZ/6aIICBce/fHrEM7jtOJdROW0XlX6LzMk+XsldFHM+jia5EVscBcZV1fUKP8B/q/qMTkIeNq/PApYTzjmuPtn3F+6N9BFbrs/9mfQtQjhFrO2HcHp9vDCKK8xt4Z9n5tJ4y3CegSKYiTWRXzocbMlU4zul2BDMsSM7o7aQhb9kQT3qIo0EEsGLZjnt12I1T4d1nw+a8ZE1x02feuLmiE25v9BUHPKUXQLA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46208058-dc3f-49a7-c71a-08df1e635c86
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 19:53:41.2513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lA180bnPVpJ6J6Jb8sRGWO7Wnm1mPWyz27wLM8Y1oIYTKzljK/Ce5C20xK//acTjhR2PizvjiOcbOqB+BbOiSabp7DOTQWg7wYrzVoXL0yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5996
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTA5LTI5IGF0IDE1OjE5ICswMjAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gT24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgMDk6MjA6NTlQTSArMDAwMCwg
V2luaWFyc2thLCBJd29uYSB3cm90ZToNCj4gPiBIaSBHcmVnIQ0KPiA+IA0KPiA+IFBsZWFzZSBw
dWxsIFBFQ0kgdXBkYXRlIGZvciBMaW51eCB2Ny40Lg0KPiA+IA0KPiA+IFRoYW5rcw0KPiA+IC1J
d29uYQ0KPiA+IA0KPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgOTNmNTE1
NzllN2RmMjQ4NzgwMjE0MDk0NDE4ZjIwNTI1MzM4M2NjNToNCj4gPiANCj4gPiDCoCBMaW51eCA3
LjMtcmM0ICgyMDI2LTA5LTIwIDEzOjQ4OjE1IC0wNzAwKQ0KPiA+IA0KPiA+IGFyZSBhdmFpbGFi
bGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiA+IA0KPiA+IMKgIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9pd2kvbGludXguZ2l0IHRhZ3MvcGVjaS0N
Cj4gPiBuZXh0LTcuNC1yYzENCj4gPiANCj4gPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gNDI1MTI1ZTZkNDA4YjU5NjlhZmI5OWMzZTk1YTM5MWYxZjFhZDgxZDoNCj4gPiANCj4gPiDC
oCBwZWNpOiBucGNtOiBJbml0aWFsaXplIHN0YXRlIGJlZm9yZSByZXF1ZXN0aW5nIElSUSAoMjAy
Ni0wOS0yNSAyMjoyMDozOA0KPiA+ICswMjAwKQ0KPiA+IA0KPiA+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiBVcGRh
dGUgcGVjaS1uZXh0IGZvciB2Ny40LXJjMQ0KPiA+IA0KPiA+IFNtYWxsIGZpeGVzIGluIGNvbnRy
b2xsZXIgZHJpdmVycyBpbmNsdWRpbmc6DQo+ID4gLSBmaXggZm9yIHVuaW5pdGlhbGl6ZWQgY2xr
X2luaXRfZGF0YSBzdHJ1Y3R1cmUgKHBlY2ktYXNwZWVkKSwNCj4gPiAtIG1vdmluZyBsb2NrIGFu
ZCBjb21wbGV0aW9uIGluaXRpYWxpemF0aW9ucyBiZWZvcmUgcmVnaXN0ZXJpbmcNCj4gPiDCoCBp
bnRlcnJ1cHQgaGFuZGxlciB0byBhdm9pZCB1c2luZyB0aGVtIHVuaW5pdGlhbGl6ZWQgKHBlY2kt
YXNwZWVkLA0KPiA+IMKgIHBlY2ktbnBjbSkuDQo+IA0KPiBUaGlzIGlzIGJhc2VkIGFnYWluc3Qg
Ny4zLXJjNCwgd2hpY2ggaXMgYWhlYWQgb2YgbXkgY2hhci1taXNjLW5leHQNCj4gYnJhbmNoLsKg
IEknbGwgd2FpdCB1bnRpbCBJIGdldCBpdCBjbG9zZXIgYmVmb3JlIHB1bGxpbmcsIGlzIHRoYXQg
b2s/DQoNClN1cmUsIGl0IGNhbiB3YWl0Lg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IA0KPiB0aGFu
a3MsDQo+IA0KPiBncmVnIGstaA0K
