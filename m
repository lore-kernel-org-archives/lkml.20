Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE01E260C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873432; cv=fail; b=fbxaFftBFwzY/+a2/RwIWvizBQgXPkMJMhs3zMhqVDK+G/Ic5zjJP7k3381hiDXVZFheAp/WflUHbnEBkI1PLa+v/yoZv9K46dPuHN+mnn7cGLbfiJFWQzotcDUVoESv2ltf4SgZ7do5g6KVYKgRGdpp84yICFRswjD0K8KcNqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873432; c=relaxed/simple;
	bh=Fd6Ugp32cZGnWZUufVEzZm/TRzKVadJ+sfxKR1JPOcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DdvIzeCTJJCc8xJeHSUZzUj5TuZdp6nY4KInjL6UBZ83xKVqWgvWuojcLINJM4AXbsICgEZffxvXYIJhAbrbsWx+26D7etSKtepqU2AOsLn8vLgbE42lVZqKnvoG2UkmWBWUtz3hyqYEbdtZqLBUdW1KeqBVeOkAS3SZJ7T0q5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a56BFuOA; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a56BFuOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787873430; x=1819409430;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Fd6Ugp32cZGnWZUufVEzZm/TRzKVadJ+sfxKR1JPOcM=;
  b=a56BFuOAJGl/SZEG22XP2fRlhdjQ8QwP6erSxRsD/XyZ7MQFQ+306rVb
   4X3KoIpCAXMJSiqHE4kK+Y6dmRXIWUw7EnDdnXAqPjz4CkYhbXPAQT0BB
   3jFIMnG7Dc5fkkPnmNL3q0RkfnJU3P347Vy97sF7qlCLYCKkbQMJfKYUO
   6662rDu7CCjQHubwwR53WlHAlxzZTA3iq2loMHqj8dX3D2Cg/hUzwSoCP
   nGbcJhWZyrtk+VG78FBCXsN23RU9f/t2SjDqlha/ZTOwd/dzy7aaj0pBa
   FvcevDWtNSc5OplmQshLIyfABDPEr52Hu6d+Q6jEuDQ2xDj3wYhH3XkxX
   A==;
X-CSE-ConnectionGUID: 14wB0KFmRpqxcbnIkdlgsg==
X-CSE-MsgGUID: Z2cN/MFTTGS7bEBHjxcU2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88588608"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88588608"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 16:30:29 -0700
X-CSE-ConnectionGUID: 1tKv0WgHSoGPEjTMTvHXcQ==
X-CSE-MsgGUID: OdVayE8+QkePlthIdxgAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="292822011"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 16:30:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 16:30:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 16:30:28 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 16:30:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvh1PrfL2PKdEUq+8EmuYl99yckdB7UhSm5ATSZ6mK4j9rEF0+s/xkvv6egUgRg21LO7+SBUqcEwYjzKz/eaT6L2HJJw8mgVjFatoEHF839Ol4bMu5PXvaJwgy+Y2bB1F/FxCjJ0u6Yb4tmIQLhhOIfPWXecZSPs2kPpRQJR8PoH8Oe2bjJ9RJ8CXlBaC+Cr0jxQH3pq3t+IRWani+EYEc6XfIS5OlLQiLKs3HPgEhlUMcB5n8c9qFcwVAXldxayZGEP2lcJXqNpKbouvJ8J2c9Pi9fy0+KjkouoV6raZwSRM/EqlcmnsPAv7DzJGR51feJbR/8cqaU7Isi/WmOrbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fd6Ugp32cZGnWZUufVEzZm/TRzKVadJ+sfxKR1JPOcM=;
 b=LRjE9jbAmh9KyOZkRHDCziXUpMdd7hlokIemu8oGIrG50gV4r8aCHZJ2Q1grlbsC3jba0ynLBmoP/liBgjMfYi6Ox6GWGuV27Cgn/rEXeVxyVt2VEjGdZbTp3C0tKhInlUmQ41vpXxurZy0Xu/ZKPyDoQB0j8d/INfay7VYR/sNpNG12qHgrR0ozE/YPHmFQR3NG1bQdArpwM7bzHWpkZl/26XkW+XJ4SG17zlYWeWS7IyvdL3VR8BXvgwCGQAVtglUzvth0G1Zb0taB7LBwwg3gSFXMksMgq7cVtaMahGhzwRnjjS9OseglgDvvTUjndJiVFN1exLMIdjIdnbZejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by IA3PR11MB9160.namprd11.prod.outlook.com (2603:10b6:208:57a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 23:30:26 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0339.012; Thu, 27 Aug 2026
 23:30:26 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "bill.roberts@arm.com" <bill.roberts@arm.com>, "x86@kernel.org"
	<x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "tglx@kernel.org"
	<tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] arch/x86: handle ARCH_SHSTK_ENABLE explicitly
Thread-Topic: [PATCH v2 1/2] arch/x86: handle ARCH_SHSTK_ENABLE explicitly
Thread-Index: AQHdDkSDSv5H8Y52DUCaGkiL9DICi7ay24mA
Date: Thu, 27 Aug 2026 23:30:26 +0000
Message-ID: <d223c3e24650c3d29f162bb7faaac74ccb7bf65a.camel@intel.com>
References: <20260707191136.1732277-1-bill.roberts@arm.com>
In-Reply-To: <20260707191136.1732277-1-bill.roberts@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|IA3PR11MB9160:EE_
x-ms-office365-filtering-correlation-id: 37022432-ea00-4802-01f0-08df04932c66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|56012099006|11063799006|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: Af52H86QwDweGcbWciAQRV+MHBvapoJM+Z+ha5HAnzynBr57VQMPKEqCJk4X9jTgU3+MTPF3omcLezoZgLDdOFmBTmJ7OB0pSodZLgs8aDuRkAkBFO4PxrG6wM/hgpnk+xZirQGPk4AgozgZ4us310s7xOP5cTds4t40S/2NwpdO/WrNNhxVhN0q9NAw7PgqWUUUvhFKhlGyQ8QGzrjiq0qu9o3Yf4YWkjMS0PEEVUp5jUZjWX6IlalI5Vf9KvsqU4tqzittg9tc4XKFjon8l3givFAhC37rCzkDXGuNPogX+AGEXroAd3AaCvVuhoY5sYfWWzKM11GhxCnuRllZyZhVG4l6SXQ6JqPlnGtMTl2wMmb+ikh82N7a+89A9kMc/tnMfNPczuA4PYr2SC6wIdF4aSRQrldk3tnx88ZH/Sg4vUx6E+/37mQQrk9+6gIY8mbjVjr9jiiwwCQo7gz3tufQLyjXHhnDaPgZh2tidWkNpwUxGBSuVHOWH5m5EeH+NT0dRs7aDz2jOgiEMMGo2H/of38wPGFpLMFYW01cxKpUidhGgtycnHvTS1YPUy9XhTCtX7nmJ5/0nbBQY3dZ0V/R/De/eGBl3Kf46ftxyPt2oQFrofnX7kGS7ZKVk8CRreH8hnjYGKM4x64BZ4r0D+T4AdxmPjVLP4MrtOZsNxswTimQx032eoB71i1OqDczH1u/OgjvumH4wbo4+06nsEsCxr87uMJZQBg1qMB+aIc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0Y0R3FEZnNEYm5JVlFtVG5aTW9VWFZDWmdFNEVQRitSVkV3SzFFOHBnRjRO?=
 =?utf-8?B?ekY1VUV5S3U4Z09JbHhieElYOWlKUTlaa1JlZDZpNzlXNlp3Uk5CZ2NvTjIz?=
 =?utf-8?B?RzFBdWZ2eFdnS01Fa0MyWkJqOUI3ZHczUkNxaTdybm8xYUtXNENpRjdYUmg3?=
 =?utf-8?B?SjRUZDYzM2kwUnR6eFNrb2lrWGxnNm1WRDB0S1FJb2JDcHZOOW5Ta1creTR5?=
 =?utf-8?B?OGpPM0hiQUFmeEJDcDhMdXpBLzh6NzkySVYyZFIxYldhVitINVlCVHVCdVJl?=
 =?utf-8?B?eEZWVjk3WVZsdnFuZHBySWVLcW9QNEJvS0NRVzBDTWozZW1LMWU2YzFrK2Js?=
 =?utf-8?B?TkFJVlBxNEFyb2xVL2I4U0dYYWgxNDhUYnBpMFpWUnc5d0RKTkFldWhPRk1G?=
 =?utf-8?B?QTlmanhSaDg0emQ2Nkw2RC9iUFdoWG4ydnpFOFBDSlZiR0NMOG42bzlzdlhL?=
 =?utf-8?B?K3JIQUhndFdZM3FQSkpDekdjODg0b0VHb0J5UER4UjdTWm9LOFV1TXZQcVFO?=
 =?utf-8?B?QWlab3plbFZsWmpGSDQ5OUtleHo5bW1FcGhEWjZoWmFoNHZGMDdlY1VKS0FN?=
 =?utf-8?B?b2JmR09NMExSM2pjSXcwZG5jdHE1R25Kb25VK1JQWDBEMkZ5TEZaVGVuQk1o?=
 =?utf-8?B?TGFrbkx0bW10cFJFWUFPWmZjWE56TlVBdVVJS3JrSmE5RC9zYkh2SllJZjIv?=
 =?utf-8?B?eXlvNnNTcjVMQ08vWnMwbmpMblRLVEc0Qm5ZUDA3S1NpajJKTHd0YzhtaFZW?=
 =?utf-8?B?bVFZQ2JpN1FFSDc0SmlZMlJRMENFYVA3SXZwNjczdWUvb2tYcngzekkyb0Ni?=
 =?utf-8?B?NUc4cHRSNlFSN1N2SVpTL1RjY3VFLzNEbjhJWThYN2tOZFc0S3VRcFozb01F?=
 =?utf-8?B?ak1aVDZUdXBBa25MWFRBOS9nNGhEbnVYcE1HMGxLd1lJSEFyd2d4eit6MCtq?=
 =?utf-8?B?Rkt3UmViOG5XNmZOQzBYb1Y3RnRYTnpkQkhzSmUrSG1HU0FFcDRsUXVoWHRk?=
 =?utf-8?B?b2NlTGRvd0h5bldGSEpzUTZHRGwyYXR2UmZPa0I4endscTRUcEdvL2JtN2I5?=
 =?utf-8?B?VTZWancvZlVtenZyd1lZV1Yya1dvZ3Y3WkQ1OVVSOGFPT09ZWWhMRmd5Q2w1?=
 =?utf-8?B?RE1GMFdhQUdwSkZVM2ZFM3dvaGxJVEozNCtSQXMzZUdmekF4OTcxUXo3d2gz?=
 =?utf-8?B?YzV1TVBmeXVtVFBGajRJcVpYMitFNDNJSCtCd1lxcm14ajJkS1BqTmVmRTll?=
 =?utf-8?B?dUJhMWJRanlvSnJvMzZqOHl2MVNVcElBa1F5eDQwWkhBSWFpcHZHejdteFZx?=
 =?utf-8?B?b1NXcXo3REZydy9KdDFtZjl4amluV1Q5eXNoR3FwYmFOYzZjL1Z5bHY1cGtX?=
 =?utf-8?B?YlVQN2gzdThycmcyeDYzR3ZKUjd6dkJENGhSWGJQaFBNcU1OL2lJcDZ0U2sz?=
 =?utf-8?B?NG5GRTJJQ0EweVlpRWRpaW9ubnFsc1BjWHhwUW1CdEYxMmRIcmdYSTZXMStE?=
 =?utf-8?B?MEJxM1dGcWhDV3RNNEszd2JUS0J1Mk9hemtSOFJaVzhQbVh1elNsZ3FNMXpD?=
 =?utf-8?B?SDk3Z3FlR1RTNDVzeitDMzNzK1NJbmZGMWVudERDQVhxVDh2WWdQUG0wNTA0?=
 =?utf-8?B?azhIa1l3MHp0Uko0M1BZQ3B5Vk00aHV3MEFQb2dPNnJPVHo0WThndVFFOW5G?=
 =?utf-8?B?SW1sMTluZWx5bEJuRUNFU09SeDRGT1g0OFV5UlRNS0tFK3E2MlVmMlhaL0Jn?=
 =?utf-8?B?VEtESzllNCtqelZIZ0ovV2JndCs1MThDQlJuU0o3a281a21EZFM0bTU2Smw1?=
 =?utf-8?B?bTVWY2VZZTlrTE11RlM4VG1FM0V1Sk9BbjVKajlZbE5iRjNFOWkrV1pjS1Jx?=
 =?utf-8?B?Wi9OeHBRN00ySVZSekwwRXNoTEZZNk93T2xydEpJMDQyaGI0a0JHOE1KNGFa?=
 =?utf-8?B?V0p4bnBBSHJ4Vmt0M3c5MGdVN2g0RFFyY3BNQW1TN09lbTRlbklURnY3MHM3?=
 =?utf-8?B?UXpjcE5ZOFpURmRxSUJxOENoc0JmYTlFYnIvQjIwVlg1bnVZLzgyalNDaFlC?=
 =?utf-8?B?a3dvWW54NE1NUkNBdXRzUlJzSDJHcGRiRU1KVlVKRWpZQlI2Vkd6UU5ZeXpP?=
 =?utf-8?B?Z2hJVytTVGpXZnpTQlB5SnAxVVR2eXdYVjR0RndSL3kzalBLdWJ3c0RZTXFs?=
 =?utf-8?B?NTRsRzdJTVE2dGltSUZiOW9MODVPdFdGWHZzS1YzVkE5WG9JMEdNSXc5REFZ?=
 =?utf-8?B?M050TGJGQWRudk9WSE5TVSs2R0pZeGJjQWhEUUlka2YwanhnNVdxRkkyc09j?=
 =?utf-8?B?UDFTU096b2licGxCcTgvL3p2eU90QlYyWVdJZzZhcmJIQW1FanNFdEtROWZX?=
 =?utf-8?Q?u0cVFP5LRtSnrHnk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC74FE8A2F92D54DB1B5AA978E482562@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LlVyLWw4LCLciWHVUEozFeHklnt1Y5QIJ94eIhML/rPaeIYqiReP2d8FYozGiznfPSpndr3IdfdGr1/iTDtFt5av31XW0AYU8ORQ+k06iY3glRpUS4NPgGh9ld8W65KzHAiwd+oCbDoX2dKAxIQ06tRj2xGcrNaKc0XhtXRtQoP2vcB0pgPNTs4Z2pznJ0lx8T0o4l1VbRSUdUwgFs0nAZYUZjl2zaKfGtMOPjif6iPYSUvnQLxNB5PPJvQPoWOc4Xx5ktourLiRQUHHQUpPUtcM3zvbLhgQ4yMHaQYARLmwYMoF76GJDUhiwU9+MmQzQ7kPD3LC6jXXrB9J1F/Ebg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37022432-ea00-4802-01f0-08df04932c66
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 23:30:26.0962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+PMcKcJgoNtqOuVR6zTrBZyOGH84RLp26ev9JTEj5yH88uD3JCqpa76RMMkps3ym9K/V6lN+T9mlbodrjD76DaodeklTS6RMU0/ViweJ5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9160
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTA3LTA3IGF0IDE0OjExIC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
IFRoZSBhcmNoX3ByY3RsKCkgaGFuZGxpbmcgZm9yIHNoYWRvdyBzdGFjayBvcGVyYXRpb25zIGNo
ZWNrcyB0aGF0IHRoZQ0KPiBvcGVyYXRpb24gYmVpbmcgc3BlY2lmaWVkIGlzIGEgc3BlY2lmaWMg
dmFsdWUsIGV4Y2VwdCBmb3IgdGhlDQo+IEFSQ0hfU0hTVEtfRU5BQkxFIGNvbmRpdGlvbiwgd2hp
Y2ggaXMgdHJlYXRlZCBsaWtlIGEgZGVmYXVsdCBjYXNlIGluIGENCj4gc3dpdGNoLg0KDQpTZWVt
cyBhIGJpdCB1bnNwZWNpZmljICJjaGVja3MgdGhhdCB0aGUgb3BlcmF0aW9uIGJlaW5nIHNwZWNp
ZmllZCBpcyBhIHNwZWNpZmljDQp2YWx1ZSIuDQoNCj4gDQo+IEhvd2V2ZXIsIHRoZSBzcGVjaWFs
IGhhbmRsaW5nIGZvciBBUkNIX1NIU1RLX1VOTE9DSyBpcyBvbmx5IHBlcmZvcm1lZCB3aGVuDQo+
IHRhc2sgIT0gY3VycmVudC4gQXMgYSByZXN1bHQsIGFuIEFSQ0hfU0hTVEtfVU5MT0NLIHJlcXVl
c3QgZm9yIHRoZSBjdXJyZW50DQo+IHRhc2sgYnlwYXNzZXMgdGhlIHVubG9jayBjaGVjayBhbmQg
ZmFsbHMgdGhyb3VnaCB0byB0aGUgQVJDSF9TSFNUS19FTkFCTEUNCj4gcGF0aCwgY2F1c2luZyB0
aGUgcmVxdWVzdCB0byBiZSBpbnRlcnByZXRlZCBhcyBhbiBlbmFibGUgb3BlcmF0aW9uDQo+IGlu
c3RlYWQuDQo+IA0KPiBUbyBmaXggdGhpcywgaGFuZGxlIEFSQ0hfU0hTVEtfRU5BQkxFIGV4cGxp
Y2l0bHkgcmF0aGVyIHRoYW4gcmVseWluZyBvbiBpdA0KPiBhcyB0aGUgZGVmYXVsdCBjYXNlLiBU
aGlzIGZpeGVzIHRoZSBpbmNvcnJlY3QgZGlzcGF0Y2ggYW5kIG1ha2VzIHRoZQ0KPiBvcGVyYXRp
b24gaGFuZGxpbmcgbW9yZSByb2J1c3QgYnkgcmVxdWlyaW5nIGVhY2ggb3BlcmF0aW9uIHRvIGJl
IG1hdGNoZWQNCj4gZXhwbGljaXRseS4NCg0KSSBkb24ndCBrbm93IGlmIG1haW50YWluZXJzIHdp
bGwgYmUgaGFwcHkgd2l0aCB0aGUgbG9nLiBJJ2QgaGF2ZSB3cml0dGVuIGl0IGxpa2UNCnRoaXMu
IEJ1dCBubyB3YXJyYW50eToNCg0KICAgT24geDg2IHVzZXIgc2hhZG93IHN0YWNrIGlzIGNvbnRy
b2xsZWQgdmlhIGFuIGFyY2hfcHJjdGwoKSBpbnRlcmZhY2UsIGluDQogICBvcmRlciB0byBhbGxv
dyBwdHJhY2UgdG8gYWN0dWF0ZSBzb21lIG9mIHRoZSBvcHRpb25zLCBhbmQgYWxsb3cgbm9ybWFs
DQogICBzeXNjYWxsIGV4ZWN1dGlvbiBvZiBhcmNoX3ByY3RsKCkgdG8gZXhlY3V0ZSBvdGhlcnMu
IE9ubHkgdmFsaWQgc2hhZG93IHN0YWNrDQogICBvcHRpb25zLCBmb3IgYm90aCBwdHJhY2UgYW5k
IG5vcm1hbCB1c2Vyc3BhY2UgY2FsbGVycywgYXJlIGRpcmVjdGVkIGludG8gdGhlDQogICBzaHN0
a19wcmN0bCgpIGhhbmRsZXIgdmlhIGNoZWNraW5nIGluIGRvX2FyY2hfcHJjdGxfNjQoKS4gVGhl
biBpbg0KICAgc2hzdGtfcHJjdGwoKSwgaXQgZGlmZmVyZW50aWF0ZXMgcHRyYWNlIGNhbGxlcnMg
YnkgY2hlY2tpbmcgaWYgdGFzayAhPQ0KICAgY3VycmVudC4NCiAgIA0KICAgVGhlIHRyb3VibGUg
c3RhcnRzIHdoZW4gdGhlIGhhbmRsaW5nIG9mIHRoZSB0YXNrID09IGN1cnJlbnQgKG5vcm1hbCBz
eXNjYWxsKQ0KICAgY2FzZSB0cmVhdHMgdGhlIGVuYWJsaW5nIG9wdGlvbiwgQVJDSF9TSFNUS19F
TkFCTEUsIGxpa2UgYSBkZWZhdWx0IGNhc2UuIEl0DQogICByZWFzb25zIHRoYXQgc2hzdGtfcHJj
dGwoKSBoYXMgaGFuZGxlZCBhbGwgb3RoZXIgcG9zc2libGUgc2hhZG93IHN0YWNrDQogICBvcHRp
b25zLCBzbyBBUkNIX1NIU1RLX0VOQUJMRSBjYW4gYmUgdGhlIG9ubHkgcmVtYWluaW5nLiBPciBz
byBpdCB0aGlua3MuDQogICBCZWNhdXNlIHRoZSBBUkNIX1NIU1RLX1VOTE9DSyBvcHRpb24gaXMg
b25seSBoYW5kbGVkIGluIHRoZSBwdHJhY2UgY2FzZS4NCiAgIFNpbmNlIGl0IGhhcyBubyBoYW5k
bGVyIGluIHRoZSBzeXNjYWxsIGNhc2UsIEFSQ0hfU0hTVEtfVU5MT0NLIGNhbiBnZXQNCiAgIG1p
c2ludGVycHJldGVkIGFzIEFSQ0hfU0hTVEtfRU5BQkxFIGJ5IHRoZSBlcnJvbmVvdXMgZGVmYXVs
dCBjYXNlIGxvZ2ljLg0KICAgDQogICBUaGUgaW1wYWN0IGlzIHRoYXQgZG9pbmcgYW4gYXJjaF9w
cnRjbChBUkNIX1NIU1RLX1VOTE9DSykgc3lzY2FsbCBhY3R1YWxseQ0KICAgYmVoYXZlcyBsaWtl
IGFuIGFyY2hfcHJ0Y2woQVJDSF9TSFNUS19FTkFCTEUpIHN5c2NhbGwuIFRoaXMgaXMgYSBzdXJw
cmlzaW5nDQogICBiZWhhdmlvciwgYnV0IGRvZXMgbm90IGV4cG9zZSBhbnkgY29udHJvbCB0byB1
c2Vyc3BhY2UgdGhhdCBpdCBkb2Vzbid0DQogICBhbHJlYWR5IGhhdmUuDQogICANCiAgIFNvIGRy
b3AgdGhlIGJ1Z2d5IGRlZmF1bHQgYXNzdW1wdGlvbnMgYnkgY2hlY2tpbmcgZm9yIEFSQ0hfU0hT
VEtfRU5BQkxFDQogICBleHBsaWNpdGx5Lg0KDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJpbGwg
Um9iZXJ0cyA8YmlsbC5yb2JlcnRzQGFybS5jb20+DQo+IC0tLQ0KDQpGaXggbG9va3MgZ29vZC4g
SSB0aGluayBpdCdzIGNvcnJlY3QgdGhhdCB0aGlzIGlzbid0IG1hcmtlZCBmb3Igc3RhYmxlLg0K
DQo+ICBhcmNoL3g4Ni9rZXJuZWwvc2hzdGsuYyB8IDEyICsrKysrKystLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rZXJuZWwvc2hzdGsuYyBiL2FyY2gveDg2L2tlcm5lbC9zaHN0ay5jDQo+
IGluZGV4IDBjYTY0OTAwMTkyZi4uNjVjODk2ZDAyMzc5IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4
Ni9rZXJuZWwvc2hzdGsuYw0KPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvc2hzdGsuYw0KPiBAQCAt
NjA3LDExICs2MDcsMTMgQEAgbG9uZyBzaHN0a19wcmN0bChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRh
c2ssIGludCBvcHRpb24sIHVuc2lnbmVkIGxvbmcgYXJnMikNCj4gIAkJcmV0dXJuIC1FSU5WQUw7
DQo+ICAJfQ0KPiAgDQo+IC0JLyogSGFuZGxlIEFSQ0hfU0hTVEtfRU5BQkxFICovDQo+IC0JaWYg
KGZlYXR1cmVzICYgQVJDSF9TSFNUS19TSFNUSykNCj4gLQkJcmV0dXJuIHNoc3RrX3NldHVwKCk7
DQo+IC0JaWYgKGZlYXR1cmVzICYgQVJDSF9TSFNUS19XUlNTKQ0KPiAtCQlyZXR1cm4gd3Jzc19j
b250cm9sKHRydWUpOw0KPiArCWlmIChvcHRpb24gPT0gQVJDSF9TSFNUS19FTkFCTEUpIHsNCj4g
KwkJaWYgKGZlYXR1cmVzICYgQVJDSF9TSFNUS19TSFNUSykNCj4gKwkJCXJldHVybiBzaHN0a19z
ZXR1cCgpOw0KPiArCQlpZiAoZmVhdHVyZXMgJiBBUkNIX1NIU1RLX1dSU1MpDQo+ICsJCQlyZXR1
cm4gd3Jzc19jb250cm9sKHRydWUpOw0KPiArCX0NCj4gKw0KPiAgCXJldHVybiAtRUlOVkFMOw0K
PiAgfQ0KPiAgDQoNCg==
