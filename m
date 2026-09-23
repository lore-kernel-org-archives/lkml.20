Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2772EEE80;
	Wed, 23 Sep 2026 00:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123411; cv=fail; b=BVntiN2qTMGd+9eix9/GoeWaxdbKsLYMfajmEQOdnai52WxplS6wXvCj2wMJFo/gbHYIavozFtUkLIhFT0tjf8+ca/fLCmCYRWuUgLBq0HAFX+mbtDYPEBAU/YN1qW9RKQefTXmMjsSGr4DDVB93nEWYRn0UmsmM0S+QCq4WyLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123411; c=relaxed/simple;
	bh=+Ibw7uH047SWZokHjrlsPIXgX/5ggLE3AKRYgwKsm1Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g6htvRZNtrTRgNb6C9Xim8pJNPIroPcr0kpCvDvpDcdvUuL0MsKP26CyxvE+keL7LHPUG4J9im7AIoBn19sJH7rZYPQtP4QYzIoEosjz28T8kAzauC/xd1UfSN/i+5F+qUL/J3xoNhHgBPPUZ7VlSiA+fUL8AySFShiBpzJUjEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsgNeQtk; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsgNeQtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790123410; x=1821659410;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+Ibw7uH047SWZokHjrlsPIXgX/5ggLE3AKRYgwKsm1Q=;
  b=VsgNeQtkowo9LgZ3UW3vHZ3KmjH7xgUzpUs/R2mFipdUHtFszX5//LH9
   zfkpUr+AZrpWJWMt2WkreW9C4CMKIVAXeYVuC+RGtetZBXEdtO5DXbKKr
   1ROHTU9RPPEbxxXO7FkzmjYylz1bR8woKLq8zbmHNDMCYW8sN13AJ7PYb
   LGyN/XCGQltgDStWEpV2SDDEw8919TsBhH+a6hyqk4l3wacfR4HsqfTRb
   mDZ2MOesdC8Npw2QPUWg+PCckgyDte3krEdA/SCLNBlomUbAR0dfVdzsT
   PS/S1wcjwGKvmzZKsai5SlNuOyWpQsYjQcVKGF1zPlSwyTZeAOt8WD00t
   Q==;
X-CSE-ConnectionGUID: oQxM+W5pRmCvqs0JvgcjQA==
X-CSE-MsgGUID: 8Sn9nmZbTQaauvQ1Ye/Ysw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90797721"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90797721"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 17:30:09 -0700
X-CSE-ConnectionGUID: AVQuu9DjSeW7Dg6T2cTi0w==
X-CSE-MsgGUID: 6b/oPXrJQ2a2IsN5KAzg3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="271946271"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 17:30:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 17:30:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 17:30:08 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 17:30:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzvQshWwgnetrAKkyjlIDW0EzsdBVfA8gqZFIoVqbujlI4nPZDm5vPt7EoUI1m+7+TbHjkaL9RBniKZ8TOzQbaPZMHx7toQZPQ5mmeBtJmN5edN3sNl3LfUMu9mVgd4V2RR94XvQtvEpBdt39Ba7Kiua6WckpbySTsynUhMyWRGaR7G0L30azwmhUtNR9HhEcDUHYlgup7xBHrzf8+cyj5N6brIoBdXHJ3DWN0+5wIdXVfZfG1HpDl4AnyFeZ/QE0PepLlXXyBrb4PQ3Bp1HDbu2gWWAFqJEvZzWioBXmqXBl/I8l+o0OtzlE/x7OTIlBZXSWZ+5tQtr9cbx+wFr0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ibw7uH047SWZokHjrlsPIXgX/5ggLE3AKRYgwKsm1Q=;
 b=J1PcE627Ei9eXbiy08TNuu4+hXCMCnN5a7a6/NwzWUlifMZvM0inpCSeR6hhlVj2h2uFocvm86zllJGHIbNGpmkHBUX0eSkne/B0cnbXkOaEhPhmc5JfBlAJTkJFyQaRQJ7a4oKhb6khcUfZUkad/do6v3YSDxOb+OtinZbLZXivO7c31ti8k525aPBsNy9b2Rr1LIdIXxXxpWb1TpJ3osbOZyND67FxBszsh0+l9NX+qMg+Sjfv/ewNGjC88HXcp3zEREQoRJ7Q69d5eW/cxPH1a6vsoiXaQ6LXKTN1D2W0twckNDWwbpj6WuSZ01e/BlOZhbrc7/55iU4qPUSSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 00:30:03 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 00:30:02 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: Wentao Liang <vulab@iscas.ac.cn>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Subject: RE: [PATCH] EDAC/i10nm: Fix mdev reference leak in
 i10nm_get_ddr_munits()
Thread-Topic: [PATCH] EDAC/i10nm: Fix mdev reference leak in
 i10nm_get_ddr_munits()
Thread-Index: AQHdRbumByesvcy2AUS+2wuHL3G1BLbTbwwAgAH2moCAA9SnAIAA1iWAgACqJgCAAEEmgIAACRsAgABSRICAAAJPwA==
Date: Wed, 23 Sep 2026 00:30:02 +0000
Message-ID: <SJ1PR11MB6083173AFAEBB2AA8FFAA922FC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260916091251.1997522-1-vulab@iscas.ac.cn>
 <aqx5UOLpXdDnDsi7@agluck-desk3>
 <20260919053437.GEaq4e7SFEZqRzsjim@fat_crate.local>
 <arFVjp8k-3kvSkhf@agluck-desk3>
 <20260922045057.GGarIJMRAjfqj6mkhE@fat_crate.local>
 <arKX7O905e7yv3Ra@agluck-desk3>
 <20260922185307.GBarLOkzBqoqlD_mNX@fat_crate.local>
 <arLWNgnyo08aFM-R@agluck-desk3>
 <20260923002009.GCarMbOYCb4onwhwRf@fat_crate.local>
In-Reply-To: <20260923002009.GCarMbOYCb4onwhwRf@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH7PR11MB6860:EE_
x-ms-office365-filtering-correlation-id: 4492cda0-1e7c-4048-bb34-08df1909ce9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: 79n5UPpyMRb55C5DpoGIhimQTlrmpx6eYJYv/yL36af8ldO0m/j2DYXYm9kpGhZpY0nudgYiB/S14/Tr9m2cCPTqt7kZjYR1Zrth1rkMsNFxNVvX34rkwtVS9l/DvhvWfuT8+98AZruHRdJ9DoMccmWFRsinmLR9dTyT4rgS94QXw8+CsncR24Dk0n7CKjlKfNL1TULZtN17m9vlO32sOfft8WtIl5tkKY4suhTFhUeKO+w8lOwpCX0AC2VCbFUrR7vfH2ZzizInSZFIoGOewFq7FJlVo9OeztcJCJYtVJkA7MBXosOFKDn2HrPR+G7UkU7wDhfUGy+GfZPYy1Y4mkR+15UmIrjl/RWlvdkoalSbZBX4rAqMFzdnMeKPikEnzSjKo2RPkY4DbFFn+BJuHUptkuY80O0oWCTw7QUJocWLV8+AuzqLIh8mPTl5FhT8AaQO3heqFbIFQf1CULZPimbzBawtFW+fMSQJ5+jkXfRL1j7T2uMjiFyr0IgY53DsgYo2V35o67gi0vwjrQ2VTXIeTV4YtqbM1QVuWBgu3fy3EqyDwSNSaXAqMm0AzhKrIKm1tOkb6KoD+29FPxxsLv31ngmHiTFtHetXtAUOtinVV1ZNKtLaoF8uMLfQwI2bfqjj//uXxLe3t9m7zC0tun+1wQxFL6bwpz4oaLpmixLB2JjP2M2E1NNT+JZB9VCWYpqm8iJyRAmfsem9rG+l1pPPG+BmyfWceQdw/+UwaGk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0lTQno4SUpCWVpVeWlsNERPaVZ3ZGpLZXhJOHRWTS90MnpYNWhueXdic25w?=
 =?utf-8?B?ZDlvajdQZFp2UFVlVkxWekg1RENzNGFGbHo0WitkTGlFS3JNUGxoRnNNakdF?=
 =?utf-8?B?WGFmbFpLRE82NzFKbk1NQVYzZng1WjV3SlQ5U2hVQ1JjSFkzYWJaNkkyUFUv?=
 =?utf-8?B?MnZ3MGFUMnBFbXFLOU8xaWU1RVRnU3NuZDluNVp3S2Q1QW1qOXQybVloNkxK?=
 =?utf-8?B?TWI4ZGhST1I1ZjBqdkQxWjU3UVhiMFk0WWdFM2NmUFlrTzNiK0tKdnZHRi9M?=
 =?utf-8?B?cHdqODR3bmQ5NjVLTXZzWHBvRlpBelk5d2ZudWpkQWhIMXZNZ0ZQZm1KWFRC?=
 =?utf-8?B?VXB2QmxVYzV6aUpaMk1WbGVFS1ZJS3dVWWRDSmE4T1AyajBzVy90ZHZhVkwy?=
 =?utf-8?B?VXd2ZWxhdWhnK1ZXMDR2WmRPNFVyMnVubHRnOTFXaUFuQTAwR1F5VkM1NVhY?=
 =?utf-8?B?bStIbjVEaE1OSXdwTEpXN2tkUUl4aHJWTG1jN0d4WXg5M1NEL1BWYktqQUhC?=
 =?utf-8?B?ak5XYXlHc0N1SWNJT0ZvSFNlVWZSTmhsYXVyMTRKcTVZclVMK0UyU3pXUVhZ?=
 =?utf-8?B?WGt3Qjh2bnBsZi9HTVB3NXQyL0FmNWMrcVBwRWh4dHorUHYyNVg1dlg3T0dm?=
 =?utf-8?B?ams1U1dqalAwaHZweURtd3hLekZVcitTN1pZWVBySTBzaUppcXFTaStJVFNW?=
 =?utf-8?B?eGtiZXhVeHdQbHVVSXlUR3U0dlJ6Tm50YUVRSUdrSW5tRWRSblQ0YXArQ04x?=
 =?utf-8?B?UmtXaGFhYUdjM3Q2SkxCUlhZbDFMaC9Rbk5xVmNGay9BaW1qMndEaXE5aVdO?=
 =?utf-8?B?RnNEckVRZThhUzJUSzU3VlVINnZzS21NMGN2QmpwdkdCemxWQlFsWnBudUc2?=
 =?utf-8?B?ZUZ0d2VqTzVMcjlHUk1vR2cxT2ZpREFCSXZtZCt5OXh6ZTVqYzRRcEM5YjNQ?=
 =?utf-8?B?cW5xdW5ETmZzbE1Eb2xPSytBTFFSNXBnZXJVZ0dFb0IwWHVxRFpac3QzT1Iy?=
 =?utf-8?B?M3VxTEJ1NWZHWHdzeFdNc3hEcGU1dllreEM4MW1MVDNlVHpYVGNtc2tEVXFq?=
 =?utf-8?B?cVRUbFFmOTNZQ1YxTVB2QTQ1aWdLZFVHdXlrNHZ2cjM4V1cwR2dydjNQYWcy?=
 =?utf-8?B?d0I0clVxVkxKVlpWMndMT05nQVNLckhDYjkzbWc5bzlINkllbC9aaTZVNldY?=
 =?utf-8?B?ajJMeU5ZM0I4R2ZSS1RaTEI5V0NlNTllN1RlU2lORnY3a2k1cUhVZGI0V1A4?=
 =?utf-8?B?MUZJUnk3cEtTa09odkp4QXVvbCtXNTRYVWtwNmh0WGJkcGROTEY4U2dFNjJ0?=
 =?utf-8?B?ZE13UjQ5YUpUV054VFAvN3dyRnBzdndldHZ3NXNrQ0hsK3hIdyt2R3VlblNv?=
 =?utf-8?B?NURDaEhNaTl1c3VqWHZXYU9HMTBwYUJ3WUxMR0sydW5qczRQcWlCTmNLUU9M?=
 =?utf-8?B?SElQL1g5L0cydmhSa1R1b2NJSVBtRU9TZ2dQTjB4NWpZL25lampPRStXMURG?=
 =?utf-8?B?ZXh0NFY5VVBPd3VncVh4bnFVVEhiMUFDUVZjWGl2aFkxOGdOKzRucUdnVjlx?=
 =?utf-8?B?aSt1aEJLSHZVdVJkV0ZBQkgwSlpNRjJuSnpxak9XK3RPN3hncWo5WmRhb1N2?=
 =?utf-8?B?Uk5CR1ZvNUVjZ0xiRTVOL2dlcnlENjBFNEE5cllFZFg4VUl3U0JvYU5Pangw?=
 =?utf-8?B?Y0ZZazQwREl1T0pTdnF3Uk9nTTlhUHg5OU9WdWhSbmkxSml0bXcyV0ZNa3k3?=
 =?utf-8?B?N2lyRnQzSktRMndBTHQ5VDRHVXZVQW10Mll1QkFCVE1LbjR3bFh1ajNEUVNC?=
 =?utf-8?B?YktPVUxBY1o5RzJxc0lERHFaTzh6UXg5eHhueFZSVEpKem9JbElFM3NFVm1K?=
 =?utf-8?B?dHVwWU5UWjdKNEZPa2RMcmVCbXZrOCtzNzgrWXh1Y0l4aWZ2VmpBK00vd0FN?=
 =?utf-8?B?alJFSEw5RWFqa1lDbDBVcVlZZmZVZ1BFeSsrakZ1d09ROWhhb1JybVoxTi9S?=
 =?utf-8?B?TEg2U2YrWk1hOWtVUk5Hbm1Xa3Z1NE9KR3VEbTZYNVJ4cUJ1YmVJZ0YrRkVZ?=
 =?utf-8?B?SnpFT0lDZ0lOTFBqMzhFS3FFeWxXMThxU1VUTG9mRk52UjdIVEEzT3hsOFBw?=
 =?utf-8?B?UnFpVkFJZVljZ3ZSM2wzMmhjNW1CS3FKM3pJTm5NdWV6dVFPejRZdnJiWWF3?=
 =?utf-8?B?eEhuemtWZzl4NFpIcXdVeDNzaGRabUd5N2sxRllRN1IwTmExTEVtenhZWHhN?=
 =?utf-8?B?MkV3MDV3ZUN5Vmg1bHd1R29TNVVwTnk0VU5yV2E4SDhFWTdIRDkxb0NiOXBO?=
 =?utf-8?Q?9fTRNSvEoHnRXUiZ1h?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ChWzHvLdoN3Rg2/ungZcJt+5/YxsIokOOc7zQprd1kF8MfOhOcsgxrZgEcQXhj/9KKOe1FbeMxeqH2gYS3/VhGlXdMywhBQrmjeraQ/eOAl2FrYXYKpUJbjbWf9E7PAgxiJKbWvr5he91q2AvzKAxKZHvZJT/+P8LIX/vAxbKLC6Y+uiJAW7rR5TJKVPQD+GdHCp5I7sR0Wu2AcrXfU/CImSJwpHgRm8OBX5Ljhk9k4xQedktNNgb8+TbwjrWnK5C2qN4aHJ60JLWfBXLiTm5V1H//YhK7+oRWc1ktj2/Ytt9mZ3X3c9I/zROBEPS4HLCAtgoA1al8o4EM1Neminrg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4492cda0-1e7c-4048-bb34-08df1909ce9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 00:30:02.1287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYlzYBRzd99InkisEncuxIWVURhuPDhPfpFTi8I+kOEsAmGe4k8mpauj2IBZL33pJzjcuOTyLpX2sqzuPW3veA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
X-OriginatorOrg: intel.com

PiBTbywgd2hhdCBJIHdvdWxkIGRvIGlzLCByZWJhc2UgdGhlIGJyYW5jaCBhbmQgemFwIHRoZSBz
dGFibGUgdGFnLiBUaGUgc3RhYmxlDQo+IHRhZyBpcyBub3Qgc29tZXRoaW5nIHdlIHNob3VsZCB1
c2Ugd2lsbHktbmlsbHkgYnV0IHRoaW5rIHR3aWNlIHdoZXRoZXIgd2UNCj4gcmVhbGx5IHdhbnQg
dG8gcGlsZSBtb3JlIHdvcmsgZm9yIGRpc3Ryb3MgYW5kIHN0YWJsZSBmb2xrcy4NCg0KVGFnIHph
cHBlZC4gVXBkYXRlZCBlZGFjLWRyaXZlcnMgYnJhbmNoIGZvcmNlLXB1c2hlZCBhbmQgbWVyZ2Vk
IGludG8gZWRhYy1mb3ItbmV4dA0KKHJlcGxhY2luZyBvbGQgbWVyZ2UpLg0KDQotVG9ueQ0K
