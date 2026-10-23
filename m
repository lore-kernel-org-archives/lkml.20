Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792723938;
	b=pOPGEYnREWFIsK9khvDDy6zT+A/6L5z8Z0blOQxVIpZB4YySEGQOapmGHl6Ktam9GWYc
	 Slv1md5/qOrsBzHF1/g/pIObf5gTGu0GmNwvIxAS9LagsES7IdJ8zt7BdwDrQAzAX1vm6
	 +XbCjHQWb653zLS2uh6evwxr+XkzCKlvhQNqmLOU7koO0IisaDpccPeTqiMwLkuyLmt65
	 kIIB24J4aHfmQdscr6IeRSbcQB7U0Ch5FeH4u1F+bmiaGH1Yr5JYTZzi5bhyfb31SCTxu
	 sI7iIqY4qR3AeI++w1ZF/RJYExELqCIRnyEzso4a5ASzYXFsIclyMh72mAUJ570hyjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723938;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=ur0FcSMNFUg5CaZ0au0vAn8qhfvUhW7gSMsruusgE3g=;
	b=O3iEr8RRrfa8znJLw034w2+X4sEmG3mFhW1ywGLBBVacFFbRbfSjdM6W+yocwBP5yYxX
	 DTFqFubkARPo6pzUzLBXF/HMT9/XhdMAPAmbxwmDmvUiWaLGLUvrgYIa/zhcA36bYPdkS
	 otLNFmKtNvJp2+zozOU963jwhqn6gdfPedmBfzblBnTRnkYc9q/755ndT/e+V0dewwW5/
	 7bgRrvlAJ6Ww6KB2uNVu1j+/BvrMMkqJ73jF9uO3lQYCojPs56s2/NRYOOluinmjLq+8J
	 MeF3uDg/oZqa/2z+GpcqU2eFtry4OLvqJfVY5WwcHub5uzr4YpTZAiO15YaXVLHBVGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="ZQh/GmtZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D02606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D02606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZQh/GmtZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792723936; x=1824259936;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ur0FcSMNFUg5CaZ0au0vAn8qhfvUhW7gSMsruusgE3g=;
  b=ZQh/GmtZH2lrncrInbcVzmMq5/yOJ4MzQDXbzOxaXcn+4HfcVgnxy/Pb
   /Ejubq9U079iOtSR8BtwowyLkc9tc6QhpdI7Enwbo7P/tHyM+zox7spe6
   nNYUhuz0j3onHy+tKgHAUadmnX6hNhKxeBdO2n4ooQXcPJUbPbXhvaGqZ
   9qxtN+4Jf8pVUCFsY3f2EHDP+HwDkZyUUzsuOCUOzdztMeW9B3cbZN0XW
   XvJHCjZgMBh3VgtUhs5x+vfLSwR9S0sa2Lcx1WJ9CUWPSyl1AFTq9qUrs
   cOEwAKQByYbOch/CpuTWdmMzhjx27A5OimArdyCfWkXR1HguStwqbLXal
   A==;
X-CSE-ConnectionGUID: uhUnHInoSE6f9YoFTDOXuw==
X-CSE-MsgGUID: MdBbWQfeQ16djAHUDbKEmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1497505"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1497505"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 19:52:15 -0700
X-CSE-ConnectionGUID: KF9lsN1CS02Mqdi41cGgqQ==
X-CSE-MsgGUID: xmHjt2j2T6CFCb5wBLfFRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3996976"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 19:52:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 19:52:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 19:52:15 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 19:52:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6U1d+0WfACNvyreNWuNJ2M6tZuCkXD5TS6le7qb3K59q3FbFNw51+aWDHp72W2VEkOKrrlUlT3YQbpKtuz5uz8Mi0iKUQauYewo2Wt5FplcxttrO38g5C/I5g2GdteE/zgjDCxdX0R6dhXh1kgmYSuY1Zw5IDDbQlCP5fnvniN5NQ6IxufYJUgTxAtRy3tyf/hu1M1P4s5s31lt/sOCdFyk5vB0hTuZl/UttztXwyCGuLWKM4WJxdo/kFZeCXZonLbBg/ji8BCBr0w3k/jKULniDp52Hw/K7SVkJZUwEtDqqo7r6MrwwXJKOkrXgVdIEpgrH4Zigz+G20+cEjQKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ur0FcSMNFUg5CaZ0au0vAn8qhfvUhW7gSMsruusgE3g=;
 b=xiVVYUyiELlTPVGeuTIHbE55BFUFQC7u3HBVQwL163q+EZfLe7r04IHv9ZfzZdLrKgAEdvc5gt4qkj4/GdlAqqbpbUhzYQuru5ez7sw/Wg4C/890lDBSUFAJPkTJ8wL6ApfFEAdsrVBeUa4zSTWLoT1XbqSnOxvRy6JM09FdkOePs/xbnivE1A+ml6XE/WNbd38b+KIZbnMWSRLB3WqRHOWioQGLdl1SQwl1eflKGqFUGG6r/NTj/5XKNFq924zrpIt+2NXimli+1KhjnkagvhneGSf/kVwoglNix8DtO8xS8pW+5GnICA/78hDJghFuX5LBje30Bfni+JsEno+A/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by CO1PR11MB5027.namprd11.prod.outlook.com
 (2603:10b6:303:9d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 02:52:12 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 02:52:11 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "peterz@infradead.org" <peterz@infradead.org>, "kees@kernel.org"
	<kees@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
	"luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"bp@alien8.de" <bp@alien8.de>
Subject: Re: [RFC][PATCH 00/24] x86 Kernel Shadow Stacks
Thread-Topic: [RFC][PATCH 00/24] x86 Kernel Shadow Stacks
Thread-Index: AQHdYZWQt5C03wirwUeZ0936JS4iKbcKZ0GAgAAIlIA=
Date: Fri, 23 Oct 2026 02:52:11 +0000
Message-ID: <ea3a79b7b91a9f2e6c7c4c351162542e87b721b6.camel@intel.com>
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
	 <c8accd0f-118e-49ae-839d-7474250b14e4@citrix.com>
In-Reply-To: <c8accd0f-118e-49ae-839d-7474250b14e4@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|CO1PR11MB5027:EE_
x-ms-office365-filtering-correlation-id: 8935dd14-7c50-4ea5-1e7c-08df30b0a2e6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|22082099003|18002099003|38070700021|11063799006|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info: 8MKUXeM8P76JLiUWKWxLpiM1c812w0jhvyH1RsTP/jLbn89Fyk0LxEajftyGWr6DNfHexcXPZDwHNLHeu2eF434XHqSoGYix6P6S+DYF/flNK1Fymbq6Kcb/nC+25TBInNSFrirVXRQTvHFF1vUK/cgmIsTogooBltDroPfgxnr5UjP4mKQcCDBqk42kj2Lsz6TqltKWzDGxBvYc8cgIQou5aMfCEO2DCzVIj6hgZYnJ1MwPCbbXpfXLv/V1OUpD9N7AzSorizSeZPgzII6mpNEr55MyFDoNAhnUmLEZCmY0Q5gqLD79QY5zJpKla7Bif2Zmn1+pSYYPe1cSCzh8XdyRRasci8mCRtx5znXdbfdpH7Rf8wTpHL+9A6cfwLNK2nS5BifpR1AGQ8e/hFiU63AwOWK4fsBl6CA84ZF0FIAFSI9Cb2jlDS0ZVuA1U0XV1cgtCiejLo6h0gC2rUfLRi0q3hCRzHru52uojFpGfW8o9EU33rpjMpH8f4Rq7znmQ8UTWW1mpK8Gdjl3uieiKTXzNHspJTpptW31L+urDHT1MgIhVavGARgwhFqUT7B5Zp39ylspwWLDmbHiIijKYDeI8eLvX3S11xTZs/DK00BZR30NrC9yoso1atTX8Po04IvKhfXAbUkfsmvbugiZSfzZg1KuwhsS6ut+2j3I+ocmET2U/48PZrWe9XwzwgeFz0Ia2SeiAGbojtu96+JtTQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3NXTmNtTU00dTNVTVZNT25yRUtyMFFFRDNoQ3AxVXZqQ1hvMzZIRE8zNWJP?=
 =?utf-8?B?aFRJOUFjM1M2QkMrV05Ob0J3SkNNYlQ1VENwNVE0djFzN1I1NHJGWHBMUHFR?=
 =?utf-8?B?ZE13eW1kaGdKdmVUbkFGTGt6cGY2bU5rMFcxeEl5MzdRWWN5M0NmcWF6Qi9X?=
 =?utf-8?B?TmY4RHBlVjg2NE9ON2pCVldFdU1pNEdlbmxubUl1cnRqRU5iTWtNR2VZaXBQ?=
 =?utf-8?B?UkFJeW8zRTFURWg3bWg0SUJJMS9xMlhEVU9VNG9mdXVQbVdtb2N2Wm4wVk5q?=
 =?utf-8?B?UFFwNElza3E0UHVsRjNlZ2hwekoxSjlHbFVKZEFwaGk2WW56cG5TbFgwc25F?=
 =?utf-8?B?TDZaN2ZRQlNsM0hYK1NrdktPR0ViN250clZpajdhOFF6WFhCUnRwekMwendw?=
 =?utf-8?B?Nlh4WVlpb05hdWlvcFpFaDFGUVo1K2Vkb2lOUzRjNTlBWDJiWlhoTHpmRmdS?=
 =?utf-8?B?WGtWSnpHc2V4OHRlQlV5Ym1wa3U4WlJUV2pMNndEcWJOQTNpOHQzNEhwVy9U?=
 =?utf-8?B?TXBJU0k0TWgyZ1hvR1lqL2tqSzFoeUdOWXR2MzMyTXJ1eWd4Q3VKWE1JZ2Rr?=
 =?utf-8?B?UjRvN3ZYdGJxMVZmOGN2MXVqclVzcGlaRnJ6NTFUWEc2cnlybVBBRWNnNFRy?=
 =?utf-8?B?bVFsYU1YbmpIa3VkTnRWV3NKeWpKeUVQemhaVWlVdEp2eDhzOHJ2ZHBDeE92?=
 =?utf-8?B?SkUwTXhGUHkvN3RRMWsrZHUyNE1UUVQwSVM4aC90UzBndU1ZRG5PcUhOOCtV?=
 =?utf-8?B?SW5xRWpaZ29MWng5QXBQa0ZEM1VEZFMzQWpxK29OZjh0NVVFTk54WTViZHpz?=
 =?utf-8?B?SWdzd1hhV1RhSVN4QWxLNTJVWFFaMmY5aDA0ZVp5SjhKYWZVN0NIR3Q4STBj?=
 =?utf-8?B?Qi9RY2dqZnNLTVhpcnorRStnbndDTzYxc3FSUkpqR1ZUVzhSY0t0V1pvVldO?=
 =?utf-8?B?azR6YUdPd2xpcm5qZTJOOEF4NnZmdzg1b2xTYWhFaERmT09CRk1vdGtKOGhN?=
 =?utf-8?B?dFE5OW1tN0VmSmJIUFJDV21nQUpOS2huV0Q5Qm54MzZiQjlTSGhKb1NtcUlw?=
 =?utf-8?B?bEpFUkxHRm9pK084VWlJQlBNMGFEZFU3U0hPTi9pRm5nSXMvMDZubnJUaERW?=
 =?utf-8?B?VzFRUC91dDBtSWUvS1AyVnJoQ1dGcENnTjJnbUtTQVFYeXc1OTUxMFQ3NmZn?=
 =?utf-8?B?NkFEYkRGMlFaWUY5bXdMQUpzRW96aVVVbC9YSis3RnRYbW5KWTJ4OUdna2Vs?=
 =?utf-8?B?WXpSakZtSkczS3FaeXFWODVJNmIvNUJzVFBYVFQ5anBPd05IUXF3QTQvY2JX?=
 =?utf-8?B?M0hua2wremhUaEJ6T0tqQnk0c3poazJaOHBUcDdCRm1tUDMraXdGTVpxcDg1?=
 =?utf-8?B?bm1YWE8vVmUzQXNFTXU2emZ5ZUtNeVZTRTVUWW1NRm5HN21vMUhOYWF6SnNF?=
 =?utf-8?B?VGk5bWRybXJRQ1hIa3hJdlRQNVpGelNZb2NPZFltYzAzWDFQQ25LRmhKVzYv?=
 =?utf-8?B?TUl5NzJpeVFCd2JLUEEyRjQ0SG9waU9kbGVlTzRNRFFuRHlpeGhBNStjM0t5?=
 =?utf-8?B?bkZNNVh2WUNhdWdVYzRPajh1Ykp1MXVYMFF4MEMzMVFFNmVmWkU3dkxUdWpO?=
 =?utf-8?B?RzJ6SEpTOUhjNUhzK0thdk0rSys1ZitOOEZDRFUrR3FMaExVdGd1dEZvUkdN?=
 =?utf-8?B?U1MwdTVuNmF5aTJIamljaGV4UEtRYnV3b0pGRXZpckpxRklzaS9rNU9GQy9D?=
 =?utf-8?B?aUtrMEREVndFSkRyNkthQ0ZlVjR0aE03MFYyQVdjTjdPcmp0algzRnk2Nlpv?=
 =?utf-8?B?QURhOUp0Q3EvVDFmRkltZThtYzBmWSt5algyWE9XaS9LUkhBa3YweEVBcGha?=
 =?utf-8?B?akcxM3ExVFpDV2ROOEF5UXhzTy9JSGVWaUQ2cHVUQVZWbFRmb3IvWUtEenZy?=
 =?utf-8?B?bjd4cUpZUWN1TGZIZERqR254STh1MSs5bnVpR1lvQnBINlU2U2dQL1g0Z2Vy?=
 =?utf-8?B?bmxBVGtmc0l1d3l5YnNMKzkraVUxRGx4N2k5elNyOEJmWm1BVEdCdzhoUElo?=
 =?utf-8?B?N1k2SHJjc2pqZ3J5SnA0a0pLbmUyYjFzK3N6MGRzU0s3NjliNVZVSnR2TkxX?=
 =?utf-8?B?dkR2MEFRV0hXSVhFTmZsd3BxQjBrUFBURlh3UTB5WjRKbkF1eXVyaWlPZTdO?=
 =?utf-8?B?ZFZaRVNGblIxcjdqcTZIV3RmVW1RWlg5L3htZ3BUU2wvY3p5eG1oNW9nN0Ra?=
 =?utf-8?B?NkFIK1ZLNnpKUTdEL2RiQVZkVEVVNExTcEJwRVpaYmI5UEUvSllHcmhmL1Zm?=
 =?utf-8?B?NEo1L1FwUWpRSjB4KzdGQmxLMDlrZWVJMTFMemFGUEdmcWVsT05UQk42KzJh?=
 =?utf-8?Q?jzn++Gus3NMImBQs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EA5B7F175157B4482B0D2A94763D3D9@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: wQbdo9zHZHJT5uBNArif4dCh1BVhHmKGegciK4xBx+JmQqpxoC8LVFkpAp0xlPCei/4QSvEprQpNtBJvKndVtD1bsgX1gnkQxT7mD7CtPpFdB8B3u7AynK62OKmrJYrT+hyScJNyfG5sNHl3zwvs1NwBT+0wLvAWCCQMY/HejetiFZvyIyS/rSRfAFNbsNOKXfSdJdA8X/MHbfYU3XazyEtO1rHeutpJkbJd4hBKkSaeD5OyvBOXzLGROmZbUSshZbOsy57sUog8k/TvEulH7Z1rIHdVJREGysa8PrENMvwASSIoKhxzArQB28UZ8upjmaJPWIORXSW3CptgkSS6CQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8935dd14-7c50-4ea5-1e7c-08df30b0a2e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 02:52:11.5190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: faUGL8Tix48c/hPN4fPGrZYhjmEbmXXd43ntxnqe5/X8pfInSmsN547XasJuPglvvIo/ArKYmnnMIURraDI4PxNrfNtcE/+wPxs8FK1Ybbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTEwLTIzIGF0IDAzOjIxICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiA+IMKgICogQWRkIGEgIndhcm4gb24gI0NQIGFuZCBjb250aW51ZSIuIEdvb2QgZm9yIGRlYnVn
Z2luZy4gQnV0LCBiYWQNCj4gPiDCoMKgwqAgZm9yIHNlY3VyaXR5LiBJZGVhbGx5LCBhIHNlY3Vy
ZSBrZXJuZWwgd291bGQgaGF2ZSBubyBlYXN5IHRvDQo+ID4gwqDCoMKgIHJlYWNoIGdhZGdldHMg
dG8gZGlzYWJsZSBzaGFkb3cgc3RhY2tzLg0KPiANCj4gVGhpcyBsb29rcyBhdHRyYWN0aXZlIGF0
IGZpcnN0IGdsYW5jZSwgYnV0IGl0J3MgcmVhbGx5IG5vdC7CoCBUaGVyZSBpcyBubw0KPiBzYWZl
IHdheSB0byB0dXJuIENFVC1TUyBvZmYuDQo+IA0KPiBXUlNTLCBSU1RPUlNTUCBhbmQgSU5DU1NQ
IHdpbGwgI1VEIHdoZW4geW91IHR1cm4gQ0VULVNTIG9mZiwgYW5kIGV2ZW4NCj4gbG9naWMgc3Vj
aCBhcw0KPiANCj4gwqAgwqAgaWYgKCFzc2VmKQ0KPiDCoCDCoCDCoCDCoCByZXR1cm47DQo+IMKg
IMKgIHdyc3MoaXAsICZzc2VmLT5zc2VmX2xpcCk7DQo+IA0KPiBpbiByZWdzX3NldF9yZXR1cm5f
aXAoKSB3aWxsIGRpZSB3aXRoIGEgI1VEIGFzIHlvdSdyZSBhdHRlbXB0aW5nIHRvIG5vdA0KPiBk
aWUgZnJvbSBhICNDUC4NCg0KWWVhLg0KDQo+IA0KPiBJIHN1Z2dlc3QganVzdCBsZWF2ZSBDRVQt
U1Mgb24gYW5kIHBvd2VyIHRocm91Z2ggdGhlIHJlcG9ydHMuwqAgSXQgd2lsbA0KPiBwcm9iYWJs
eSBiZSBmYXN0ZXIgb3ZlcmFsbCwgYW5kIGl0IHdpbGwgZGVmaW5pdGVseSBiZSBhIGJldHRlciBl
bmQgcmVzdWx0Lg0KDQpJdCBzdGlsbCBjYW4ndCByZW1vdmUgYWxsIHNpZGUgZWZmZWN0cyB0aG91
Z2guIExpa2UgaWYgeW91ciBzaGFkb3cgc3RhY2sgaXNzdWUNCmlzIGNhdXNpbmcgdW5kZXJmbG93
aW5nIHRoZSBzaGFkb3cgc3RhY2sgeW91IHdpbGwgZ2V0IGEgI1BGIGluc3RlYWQgb2YgI0NQLg0K
DQpJIHRoaW5rIHRoZXJlIGlzIGp1c3QgdmFyaW91cyBsZXZlbHMgb2YgYmVzdCBlZmZvcnRzIHlv
dSBjYW4gZG8gdG8ga2VlcCB0aGluZ3MNCmZ1bmN0aW9uYWwuDQo=
