Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF1D4B95B3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386897; cv=fail; b=nY4Gl+aij/gifEjfot0FQLVq4Y0O2NZMqoybKYuRGpP9brCSrnfGBaDIq+Zkon346p9xdPE7jGmjOUc6J5ZTrTCNJpH6nzoNCu5vjDLISf268IZN6U8dvPyXvgMIMkE+2lYsMO1asxAPFJ8VqTghQ/znO5rlPMEcnlcALoZB4ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386897; c=relaxed/simple;
	bh=1UoeeFV5/fbY2K538+PDAdaTBvG91B3aKYPielqxaes=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JaRE96Qv4jggGuvMBlHiKBJZgHg2Xr1TDhuEut4D0yvm0ilTrRIbxZoos3TA8EgLrxBzHfRULjJ27L6Ws6LFfzkpu5JoJlrh4+Pp6oROjVvIYvPzLoG/CzppNXRBMfNhUBrAmgvF0e0xRW1BWv9lH1ZW8bHmM4VSbvu94YkpFAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Na+aThjG; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Na+aThjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791386892; x=1822922892;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1UoeeFV5/fbY2K538+PDAdaTBvG91B3aKYPielqxaes=;
  b=Na+aThjGZl9TTsYo/bor+/CQkvxOXoJT7RyIqw+uYh1UfnVzjbgpFBpE
   A1uXKoCCentHIH+m0mINQTwUFF4fDdibyVWldfIuJWOIsf5vg//RJDfKn
   N9zpSJH6WjTgAO5QWwlT3WIoXgnnNgAlNw7IIa4JdCdhcHvLLKfrjkKez
   z8Awpi0eAXrNqp71Ud4oT0vamM4OT4DEv0dYfaoVPSPP/mzo11BAHiVoJ
   zJ4KT76Jb1Yo8nZjPQO/ZO+rW9GmYkbFUEANOxE59nAGqX7jp+bcZ0mC4
   chFcgtlvTdnC5hnjiFDQCHAvLIhLfHjK1PaUuGG1He6iRm3biUvEjPYR5
   w==;
X-CSE-ConnectionGUID: 1EHU7kL8TUCSm4xQbLHfJQ==
X-CSE-MsgGUID: vN+oVkE+Sbu8YiKS2zJzTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="48376"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="48376"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 08:28:09 -0700
X-CSE-ConnectionGUID: cDPc9WGETDi6jIzPfwiVEw==
X-CSE-MsgGUID: xkdvnYKpTtCI9Hf4oECjng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="281225663"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 08:28:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 08:28:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 08:28:07 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 08:28:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuAKZHXtQqhK13/nV0R+fBMfa+W8OPZctDiGxb1RobH3h7rNrAbnA9LNzP+2QjeKR2AHTzbqFdh+bNHP86u/ZUwrUstTSMvBvZ/OO4xIkEg2hgCYV4/D60d0kxh57YqF7l18aVr3lEA42ABt7xzbcP8IBmTzUiEKYq3UDD8xrUfIxlSqZuu7cT0gy4GgMRk81XNAZohOfNgzI6pYr6TcdPs5sUK1b3iLTe+TQhGqQZ39roNzWOUteviGvCS4qvz1HmHfFyBPQZKJbZ0ISnTT2GllWcIb8sCjng3tFLlPR7VemHvnf7OFsW8HwChJhhde40LDk90OQDc+NX9xPgoK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UoeeFV5/fbY2K538+PDAdaTBvG91B3aKYPielqxaes=;
 b=eUdfpFcRcP7d5rdxXQnsFd4m8wNUuz5D5Hfz03tsnbk3faZHN1+YPPt8X3ypoCVAYJRlkXyT+5ZfyKlTwgT3M79CyWoOsr9GwZq0kTcdHKw1oYoC5B6Vnd1O5EpnujR6IR2PAxKzHsv2z9y4mDAfAIdwFlzX7wV6EK9jAqQU8GTiJ+Tlra+6uhCtgcIbMRqgvafPBi17ocUn+1lS5VLo8UyzMbSVc1shFYrhyhDEM5aRV6JJVISfAaGXym6gHR+wF89qNL0yWKqvzWr+dy5adxaeaKYLyW9/0WRAo1AiuTr3CF4olo2h5m1lw8H/sBs4h0owD3LcsWv/VprelH1y+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by SJ5PPF4DC104A0B.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::827) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 15:28:03 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0451.014; Wed, 7 Oct 2026
 15:28:03 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "fweimer@redhat.com" <fweimer@redhat.com>, "ripatel@wii.dev"
	<ripatel@wii.dev>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
CC: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, "bp@alien8.de"
	<bp@alien8.de>, "peterz@infradead.org" <peterz@infradead.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"david.laight.linux@gmail.com" <david.laight.linux@gmail.com>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>, "tglx@kernel.org"
	<tglx@kernel.org>, "david@vortan.dev" <david@vortan.dev>, "xin@zytor.com"
	<xin@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC] x86: usermode IBT and signal handling
Thread-Topic: [RFC] x86: usermode IBT and signal handling
Thread-Index: AQHdVmBm+Re+9FpUj0WiFJALvJ24PbbyNB2A
Date: Wed, 7 Oct 2026 15:28:02 +0000
Message-ID: <6ddd6b564eee6be56150e39bd34c41d29f6315d9.camel@intel.com>
References: <asZJ7Q1W+Fd/RFoO@wii.dev>
In-Reply-To: <asZJ7Q1W+Fd/RFoO@wii.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|SJ5PPF4DC104A0B:EE_
x-ms-office365-filtering-correlation-id: 48cf2bfe-bdc8-4b20-1981-08df248793d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|22082099003|18002099003|11063799006|56012099006|5023799004|10067099003|13003099007|38070700021|6133799003;
x-microsoft-antispam-message-info: I6PKW+4Sx/OB7+chbmzsYL8GbqKSE20tmE1Sa5vmJy/6shQ3232U50O842fU3183sSHjArbOmlBPHmbu/sTVYIh7U2cNncWstacwJxMZK4ME/OTuzK4EBd9KLE0/01GeDB3sa1z/DvfNQQ9E60h3/LvfKmQu3WVhIwbLnF3Vuvn/0MvbBvQ+S0kAps5hA7NDVuMXpFbye+429ZN61ti+I1Zo4MAJdOfYCBB2AKaM4k6Iv9MrBC/vfKc7XL4B18sG8cL2j1Rj2zLIBLhwvaAdlP/ME/3UeF3mQvI+Fis8cy8S/EIbczQhmbKT/dil4xjFUvjw6vK0grEkstIiliO193aPitWL8KjbaRiHbvPm0J+gKtT9D6jt6GYX4Yvo/Mh5h6P9jItybWBX3ft1M02Mnk81HnpQfHpqyOpJtjx90DkRU1tp+PwhAbeR4JJ7PsWWOSOh1lsGXJpThJvZP4JaF9K1fCdRnvLRWQkygzzDH4DzURm//dgAW9NK8+oNlQ4itRJn36aExct15KdKUqO+TEn3gVlLGPS8ftkmwfUHsfZpPhJ0/G18e8YvjaZSUhJ5qjvBDISAlMuecsCIK6GIIecSi7pFZSq43hDSFYkrK2zXCTL1HcWskQKjf+ZBnSa7OrA+hXhD2D21LzTFjc9+3qZmzLYmZDeXfjqxc7oCyb0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004)(10067099003)(13003099007)(38070700021)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3ZMQVpXcVc5TXFra0dyaEZHMUNoRTlSQlpjSTg5N0lxRDlIeDZVbklkNUQ1?=
 =?utf-8?B?Z1B4R28wTHpnWHFVb211WjUvV0d2ekxWc3JqSEpFazNuYldURUd4VmxrdTRh?=
 =?utf-8?B?OGY2SHk3eVpNYTdWaXpuZWNSNzFPQWZaZ0swSTRIdVlkWkx6S0I5K2RGMi9M?=
 =?utf-8?B?QkpFdmxMankvWVBJQjQ2ME53VXd4cCtRRHkzaVFHMC9kMExId21LQ3JCblFs?=
 =?utf-8?B?NUZyQjFFbGsvSkdlWUpzbFB1OGJVQ0N0SSsrSjdBMXlqTWxFQm9FbzJ2TnFX?=
 =?utf-8?B?OG00TVFvWnN3RG1pallVK3F5ZlBDSzFOSWFmMlJ6U3paZk5ERk5IWTVXSGxQ?=
 =?utf-8?B?RHIvYW9MMEVwUkRpMHAxU1FUUmVvcU1SRmlrcmtpR1VDcEJZS3A2VWVTOHFJ?=
 =?utf-8?B?ZmYvZTIwZlRvaWJaejg5SkEreDVqbnVqcmczOG00cUQ4VmIzTlNMVU9uQitp?=
 =?utf-8?B?NzU0MTFreDAwdVViNndzeGVvS1JQeFdIeTdQOGFMOWxUNVpTWW0rRGZ2KzBY?=
 =?utf-8?B?K3V4dlFuVVdPclVDaHVna1c2M2tSY3lTc2RnNUNNN3RLNGN3V1VlaXVmd25F?=
 =?utf-8?B?Z0hpUmdnTEExeHJSNXAwcXArTG1UeWhtc1lPSlVFTHFYN2NocWNzQWo5UFZ2?=
 =?utf-8?B?WEhGcTlBT09LTWZlUFdjb2p1d1JBSFQzbEtvcFVVM25Bd2pmZHcreklhWFRB?=
 =?utf-8?B?SmVqVjlSTlFvam95YkVDQ1pxK0taaUF6cGxoSDkyQzFHM2t5NndUdGtWWHZJ?=
 =?utf-8?B?clFIRGx5WWN0VEVjYXBHTmtybVN1MlNJODFGeHU5ZVVXbG5XUXpuaEhuZFlF?=
 =?utf-8?B?MEZvdDRmSEI3eUlER1JpUENLYXhNVUVmSzlvdWZQYW12NGpxcTluZWptSDF1?=
 =?utf-8?B?cFVPRExRcmQzUDFQY0kyWTFrM0VoWmlSZkduSUttYSs4TzUyOXJ1U2lMSFRt?=
 =?utf-8?B?NjYwYzgvdk1jbU5IWm9HZFpRT052S00wT1BkSnpFTEMwVER5STFqL1F4M2k0?=
 =?utf-8?B?MG85bDBpL01vRGN3RTEvNWFSbWRzRzUvYlNxQkRiL2x5WFRPcDJiVk15NWly?=
 =?utf-8?B?b3pzckVaUTlYOWJqY0gwdkNRVmc2ZGlXTWVQbXZrc0lEL2w5OFRlMTMranVu?=
 =?utf-8?B?VkZmUzg4YU40UjlmNFI3OHowNzAxREcrV0JxT3pwd2ZYWXNKd2t1TTlaaG8y?=
 =?utf-8?B?OVloVExNUEtxSHlpMUs3TUdlYVdkTENxcS96V0RQSGpOY09WR3ptMHJpaEtH?=
 =?utf-8?B?dGYvV1RudnpCWWlPQ0hLVmQvMXhqYm15R01uVFlScm94MGRKejBCRit6UUNx?=
 =?utf-8?B?bDh1MkZEaGV6MEFQdDBGZ28zQkhSbUNrUGZPVDBOMkZQT1NBcTJuL0tURUpl?=
 =?utf-8?B?Nlcyd1lRYkI1NDdhOS9Za1JTelNDSWxsV1lzanROT040MHd0eDJkL0YyYStp?=
 =?utf-8?B?R1BYM3l1VWlmaGhsalYrMUtwaWlnWlhuc0luSmhvZ09YZVh4MWF3dEhvSTZR?=
 =?utf-8?B?ODA0MFdYYm95WjBYUG5tY1cxRUJLZzZhZ3VpaWNoM0czQWpvcUJ5WHM0WTlY?=
 =?utf-8?B?empNeitCQVJZWHQwYkRwcWQ2RE01OWNoaldkWTlEdDdaZ1YzckRqcy9ScWVG?=
 =?utf-8?B?bGlwNFYyV0tSbENDREVDRlh4bFpnSVhOQ0FoNlhPaXNDaXQvcm14L0ZFSjRP?=
 =?utf-8?B?KzhBL2MxRlZKTHE2cW5INUNaMU91QWFSaFA3ZU12OGFsTzhRSGs5b1B3b3p5?=
 =?utf-8?B?clJ3K0NKaUdNZXlkelpTTUFOQXluVzFuNENLU2hSMkFsdFVKMDRyU0ZUSldH?=
 =?utf-8?B?MzVIMkl6VDdYTjA0LzRXaWtIcklCQXEzYWRma3pvZlYzajB4UVl0Q29LclY2?=
 =?utf-8?B?aXJYTnhXaWxCOWRhSmdhRW9uRXVZYkFjTjlESk8xdjRHenAvU01scWl4SEo4?=
 =?utf-8?B?d3FTajB3TnlvOEVxWUcvelU0bXY5Q1Mwd0I4QitWQXl0Wk95d1BZWjBYeTlP?=
 =?utf-8?B?NGptc00zelpjTFdjaVlzOTZmUU5QcEx0VERFdmt5eTNhYnAvVzRWNURDRWlG?=
 =?utf-8?B?M3JibWZ1WXJYMmltcjJtWVVweFBISFFsMU5xOWtPL3FHazQxUlExUkxuclpV?=
 =?utf-8?B?dVJ0dXdtWVlsSktyamNhSnl1TG5uWWNMNkdqMFBHVEhyZDVSeXhGTXp6THRs?=
 =?utf-8?B?Vm1qYm9xSEVMTUJDVStteWxpeXpTYXlCL0hObHFzNUJVZzZJaTFDRWJ5cEsy?=
 =?utf-8?B?MjZ6THQ0NzE1L2FIeGZNbTZOcjJFbXhqeTh5M0F6bGc1SHJpN1BrRnlqVjFn?=
 =?utf-8?B?MXdFaXloRE5qU2daNnpsd1g0elRObmRtNytrVEJRdk9WYThObnhoSklaQU11?=
 =?utf-8?Q?f1cBKJILE17NTpBA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9ABBA022BAACF41A9BFD22D329F2D37@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EHj/+2MsbZhwDiY+w9boqFAG13Bk2uInih20+7VYtRgCu5XxeqUKlH7WGwjjTTeU2L0cusCdBpfjUrpZvyvgGMP/BVUmCId7JY7v9UoisYuldJmlAsAGVjDRzC2W2jPAciwmKj6/togKFR9lcaJgoBD+As2aNI2Nnjr4AurmQG6oorFK/hzTyFzbVXtujmv9lJmv8jTtzKi6pCZW2LTQG1G2iitLG2z3oqErA8z3PUunntCua76ottQRVSmouDNGXA8CPhUHtsSYpdBae4apMDAZ3i52XnlQLMTfyVQ1ysQM2t0HgDBdWOCbWMXB9pksabBe+G7Uhv5JlQQPTMPLhw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cf2bfe-bdc8-4b20-1981-08df248793d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 15:28:02.9515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bdLf1Vr4v+QYW4Yv+MdVSNi7JIayaIeUpcpfO6P3rjfQlgfvs7nyG/nY7J+otPp455ldsobiHZwukvlHIHBhUCHujAuDwjwonj/9Ycq2LN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4DC104A0B
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTEwLTA3IGF0IDEzOjMyICswMDAwLCBSaWNoYXJkIFBhdGVsIHdyb3RlOg0K
PiBJJ2QgbGlrZSB0byByZXF1ZXN0IGZlZWRiYWNrIGZvciB1c2VybW9kZSBJQlQgKGluZGlyZWN0
IGJyYW5jaCB0cmFja2luZykNCj4gc3VwcG9ydCBmcm9tIHRoZSB4ODYgYW5kIGxpYmMgcGVvcGxl
IGJlZm9yZSBzZW5kaW5nIGFub3RoZXIgc2VyaWVzLg0KPiBBbHNvLCB0aGFuayB5b3UgZm9yIHRo
ZSBjaGF0IGF0IExQQyENCj4gDQo+IFF1ZXN0aW9uczoNCj4gMS4gU2hvdWxkIHRoZSBpbml0aWFs
IHZlcnNpb24gcHJlc2VydmUgV0FJVF9GT1JfRU5EQlIgYWNyb3NzIHNpZ25hbA0KPiDCoMKgIGRl
bGl2ZXJ5PyAoT3BlbkJTRCBkb2VzIG5vdCBkbyB0aGF0KQ0KDQpJIHRoaW5rIGl0IHNob3VsZCwg
YnV0IGlmIGl0IGJlY29tZXMgYSBtYWpvciB0ZWNobmljYWwgaHVyZGxlLCB0aGVuIGhhdmluZw0K
c29tZXRoaW5nIGlzIGJldHRlciB0aGFuIG5vdGhpbmcuDQoNCj4gMi4gV2hlcmUgdG8gcHJlc2Vy
dmUgV0FJVF9GT1JfRU5EQlIgYWNyb3NzIHNpZ25hbD8gT3B0aW9uczoNCj4gwqDCoCAtIHNoc3Rr
IHNpZ25hbCBmcmFtZQ0KPiDCoMKgIC0gc2lnbmFsIGZyYW1lIGZwc3RhdGUgKGNhcnZlIG91dCBh
IGJpdCBpbiBfZnB4X3N3X2J5dGVzKQ0KPiDCoMKgIC0gdWNfZmxhZ3MNCg0KVGhlIHNoYWRvdyBz
dGFjayBzaWduYWwgZnJhbWUgaXMgZXh0ZW5zaWJsZSB0byBmaXQgdGhpbmdzIGxpa2UgdGhpcyBh
bmQgZ2l2ZXMgYQ0KbmljZSBzZWN1cml0eSBwcm90ZWN0aW9uIGZvciB0aGUgYml0LiBCdXQgSSdk
IGNvbnNpZGVyIHB1cnN1aW5nIHRoZSBzaW1wbGVzdA0Kb3B0aW9uIGZpcnN0LiBUaGlzIG9wdGlv
biByZXF1aXJlcyBtYWtpbmcgSUJUIHJlcXVpcmUgc2hhZG93IHN0YWNrIHRob3VnaC4gSXQNCnBy
b2JhYmx5IGlzIHRoZSBjb21tb24gY2FzZS4NCg0KVGhlIG9yaWdpbmFsIHBhdGNoZXMgZm91bmQg
YSBiaXQgaW4gdGhlIG5vcm1hbCBzaWduYWwgZnJhbWUsIGJ1dCBJIGRvbid0IHRoaW5rDQppdCBl
dmVyIGdvdCBmdWxseSBzZXR0bGVkPyBJbiBhbnkgY2FzZSBpdCB3b3VsZCBuZWVkIHRvIGJlIHJl
dmlzaXRlZCBhdCB0aGlzDQpwb2ludC4NCg0KQnV0IHRoZSBiZXN0IG9wdGlvbiBpcyBwcm9iYWJs
eSB0aGUgb25lIHdpdGggdGhlIGxlYXN0IHJlc2lzdGFuY2UuIEl0IG1pZ2h0IGJlDQpzaGFkb3cg
c3RhY2ssIHNpbmNlIHRoYXQgaXMgb2ZmIHRvIHRoZSBzaWRlLiBXZSBjYW4gYWx3YXlzIGhhcmRl
biB0aGluZ3Mgd2l0aA0KZnVydGhlciBjaGFuZ2VzIChhZGQgdG8gc2hhZG93IHN0YWNrKSwgb3Ig
ZXh0ZW5kIHRvIElCVC1vbmx5IGxhdGVyLg0KDQo+IDMuIE9LIHRvIGJyZWFrIGxlZ2FjeSAzMi1i
aXQgc2lncmV0dXJuIGlmIElCVCBlbmFibGVkPw0KDQpJQlQgbmVlZHMgdXNlcnNwYWNlIGVuYWJs
aW5nIHRvIHdvcmssIGFuZCBsZWdhY3kgMzIgYml0IHVzZXJzcGFjZSBpcyBiYXNpY2FsbHksDQp3
ZWxsLCBsZWdhY3kuIFNvIHVubGVzcyB0aGVyZSBpcyBhbnkgc2VyaW91cyB1c2VyIHRoYXQgcG9w
cyB1cCwgd2Ugc2hvdWxkIGp1c3QNCm5vdCBzdXBwb3J0aW5nIHVzZXIgSUJUIGZvciAzMiBiaXQu
IFRoaXMgc2ltcGxpZmllcyB0aGluZ3MuIEJUVyB3ZSBkb24ndCBzdXBwb3J0DQozMiBiaXQgc2hh
ZG93IHN0YWNrLg0KDQo+IA0KPiBGb3IgY29udGV4dCwgaGVyZSB0aGUgcHJldmlvdXMgc2VyaWVz
Og0KPiAtIEludGVsICgyMDIxKToNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjEw
ODMwMTgyMjIxLjM1MzUtMS15dS1jaGVuZy55dUBpbnRlbC5jb20vwqANCj4gLSBteSB2MToNCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDUxNzE4MzAyNC4xNjI5Mi0xLXJpcGF0
ZWxAd2lpLmRldi9ULw0KPiAtIG15IHYyOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMjYwNjA1MTg0NzE1LjMzODM0MTUtMi1yaXBhdGVsQHdpaS5kZXYvVC8NCj4gDQo+IFRoZSB1
bmNvbnRyb3ZlcnNpYWwgcGFydHMgb2YgdGhlIGtlcm5lbC1zaWRlIGNoYW5nZXM6DQo+IC0gdXNl
cm1vZGUgZW5hYmxlcyBhbmQgbG9ja3MgSUJUIHZpYSBSSVNDLVYncw0KPiDCoCBwcmN0bChQUl9T
RVRfQ0ZJLCBQUl9DRklfQlJBTkNIX0xBTkRJTkdfUEFEUywgLi4uKSBBUEkNCj4gLSBJQlQgZW5h
YmxlbWVudCBpcyBhbGwtb3Itbm90aGluZyBwcm9jZXNzLXdpZGUgKGNvdWxkIGV4dGVuZCBsYXRl
cikNCg0KV2hhdCBoYXBwZW5lZCB0byB0aGUgZGlzY3Vzc2lvbiBvZiBhIFBST1RfSUJUIChsaWtl
IFBST1RfQlRJKT8gSSBoYWQgUE9DZWQgdHdvDQp3YXlzIHRvIGRvIGl0IGFuZCBvbmUgd2FzIG5v
dCB0aGF0IGJhZC4gVGhlIGxlZ2FjeSBiaXRtYXAgdGhpbmcgaXMgbm90IGVhc3kgdG8NCnVzZSBo
ZXJlLCBhbmQgSSBkb24ndCByZWNvbW1lbmQgaXQuIEJ1dCBoYW5kbGluZyBJQlQgI0NQcyBieSBs
b29raW5nIHVwIHRoZSBWTUENCm9mIFJJUCB3YXMgcHJldHR5IGNvbXBhY3QuIElmIHRoZSBWTUEg
aGFzICFQUk9UX0lCVCwgdGhlbiBjbGVhciB0aGUgVFJBQ0tFUiBiaXQNCmFuZCBwcm9jZWVkLiBU
aGlzIHB1bmlzaGVzIG1peGVkIG1vZGUgYXBwcyBpbmRpcmVjdCBjYWxscyAobm90ICp0aGF0KiBo
b3JyaWJsZQ0KSUlSQywgSSd2ZSBsb3N0IG15IHRlc3QgcmVzdWx0cyksIGJ1dCBkb2Vzbid0IGh1
cnQgZnVsbHkgZW5hYmxlZCBhcHBzLg0KDQpOb3csIHRoZSBzZWN1cml0eSBxdWVzdGlvbiBvZiB3
aGV0aGVyIGEgbWl4ZWQgbW9kZSBtYWtlcyBzZW5zZSwgaXMgdmFsaWQgSQ0KdGhpbmsuIEJ1dCB0
aGUgaXNzdWUgd2Ugc3RydWdnbGVkIHdpdGggYSBsb3QgZm9yIHNoYWRvdyBzdGFjayB3YXMgY29t
cGF0aWJpbGl0eQ0Kb2YgYXBwcyBtYWRlIG9mIG11bHRpcGxlIHBhY2thZ2VzICh3aGljaCBpcyBh
IGxvdCBvZiB0aGVtKSwgb3Igd2hpY2ggaGF2ZSBKSVRzLg0KU28gSSB0aGluayBhIG1peGVkIG1v
ZGUgd291bGQgYmUgdmFsdWFibGUgaWYgaXQgY2FuIGJlIGEgc3RlcHBpbmcgc3RvbmUgdG8gYQ0K
ZnVsbHkgbG9ja2VkIGRvd24gbW9kZSBldmVudHVhbGx5LiBGb3IgZXhhbXBsZSwgc3RhcnQgd2l0
aCBhIG1vcmUgcGVybWlzc2l2ZQ0KcHJjdGwgdGhhdCB0dXJucyBvbiBtaXhlZCAoUFJPVF9JQlQp
IG1vZGUuIERpc3Ryb3MgYW5kIG90aGVyIHdpZGVyIGVuYWJsZXJzIGNhbg0KdXNlIHRoaXMgd2l0
aG91dCBmZWFyIG9mIGNyYXNoaW5nIGFwcHMgd2l0aCBKSVRzLCBldGMuIEVtaXQgYSBwcl9pbmZv
KCkgb3INCnNvbWV0aGluZyB0aGF0IGluY2VudGl2ZXMgcGVvcGxlIHRvIGZpeCB0aGVpciBsaWJz
LiBUaGVuIGxhdGVyIGRpc3Ryb3MgY2FuDQpzd2l0Y2ggdG8gYSBmdWxseSBlbmZvcmNlZCBvbiB0
aGluZy4NCg0KQnV0IHdvdWxkIGJlIGdvb2QgdG8gaGVhciB1cGRhdGVkIG9waW5pb25zIGZyb20g
dGhlIGRpc3Ryb3Mgb24gdGhpcy4gKG1heWJlIEkNCm1pc3NlZCBpdD8pDQoNCj4gLSBJQlQgZW5h
YmxlbWVudCBzZXRzIGJvdGggRU5EQlJfRU4gYW5kIE5PX1RSQUNLX0VODQo+IMKgIChlbmZvcmNl
IGVuZGJyNjQgb24gaW5kaXJlY3QganVtcHMsIGFsbG93ICdub3RyYWNrJyBwcmVmaXggdG8gb3B0
LW91dCkNCj4gLSB2RFNPIHBvbGlzaGluZyBuZWVkZWQgKGFkZCBtaXNzaW5nIGVuZGJyNjQgbWFy
a2VycywgR05VIHByb3BlcnR5IG5vdGUpDQo+IC0gc2lnbmFsIGhhbmRsZXIgZW50cnlwb2ludCBk
b2VzIG5vdCBuZWVkICdlbmRicjY0JyAodGhlIHNpZ25hbCBoYW5kbGVyDQo+IMKgIGVudHJ5cG9p
bnQgY2Fubm90IGVhc2lseSBiZSBjaGFuZ2VkKQ0KDQpJIHRoaW5rIHRoZSBzaWduYWwgZGVsaXZl
cnkgc2hvdWxkIG1hbnVhbGx5IGNoZWNrIGZvciBlbmRiciBpbiBTVy4gVXNpbmcNCnNvbWV0aGlu
ZyBsaWtlIHRoZSBzcGVjdWxhdGUgbG9vcCBpbiBzaHN0a19wb3Bfc2lnZnJhbWUoKS4gV2hhdCBp
cyB0aGUgcHJvYmxlbT8NCg0KQXQgdGhlIHNhbWUgdGltZSwgc29tZXRoaW5nIHNtYWxsIHRoYXQg
YWN0dWFsbHkgdXBzdHJlYW0gaXMgYmV0dGVyIHRoYW4gbm90aGluZy4NCg0KPiANCj4gVGhlIGxp
YmMgc2lkZSBpcyBhbmFsb2dvdXMgdG8gc2hhZG93IHN0YWNrOiBhIG5ldyB0dW5hYmxlLCB0cmFj
a2luZyBvZg0KPiBEU09zIG9wdGluZyBpbnRvIElCVCwgcHJjdGwoKSBvbiBzdGFydHVwLCBldGMu
IA0KPiBGbG9yaWFuIHNlZW1zIGZpbmUgd2l0aCB0aGUgcHJjdGwoKSBhcHByb2FjaCBhcyBvcHBv
c2VkIHRvIGVuYWJsaW5nIElCVA0KPiBhdXRvbWF0aWNhbGx5IGluIHRoZSBrZXJuZWwuDQo+IA0K
PiBOZXh0LCBjb250ZXh0IHN3aXRjaGluZzoNCj4gMS4ga2VybmVsPC0+dXNlcm1vZGUgKGUuZy4g
cHJvY2VzcyBzd2l0Y2hpbmcsIHBhZ2UgZmF1bHRzLCBzeXNjYWxscykNCj4gwqDCoCByZXF1aXJl
IG5vIGNoYW5nZXMgKHVzZXJtb2RlIHNoYWRvdyBzdGFjayBkb2VzIGFsbCB0aGUgd29yayBhbHJl
YWR5KQ0KPiAyLiB1c2VybW9kZTwtPnVzZXJtb2RlIChsb25nam1wKSBpcyBhIGdsaWJjIGFmZmFp
ciwgbm8ga2VybmVsIGNoYW5nZXMNCj4gMy4gdXNlcm1vZGU8LT5rZXJuZWw8LT51c2VybW9kZSAo
c2lnbmFsIGhhbmRsaW5nKSBpcyBhbm5veWluZw0KPiANCj4gU2lnbmFsIGhhbmRsaW5nIChlbnRl
cmluZyB0aGUgaGFuZGxlciBhbmQgcnRfc2lncmV0dXJuKSBpcyBhbm5veWluZw0KPiBiZWNhdXNl
IHg4NiBkb2VzIG5vdCBoYXZlIGh3IHN1cHBvcnQgZm9yIHVucHJpdmlsZWdlZCBJQlQgc3RhdGUg
YmFja3VwLw0KPiByZXN0b3JlLg0KPiANCj4gwqDCoCA1MDA6wqAgam1wIHJheMKgwqAgOyByYXg9
MTAwMA0KPiDCoCAxMDAwOsKgIG5vcMKgwqDCoMKgwqDCoCA7IFdBSVRfRk9SX0VOREJSPTENCj4g
wqAgKiogQ0VUIHZpb2xhdGlvbiAqKg0KPiANCj4gSW4gT3BlbkJTRCBhbmQgbXkgdjIgc2VyaWVz
LCB0aGUgc2lnbmFsIGZyYW1lIGRvZXMgbm90IGJhY2sgdXAgSUJUIHN0YXRlDQo+ICh0aGUgV0FJ
VF9GT1JfRU5EQlIgYml0KSwgYW5kIHJlc2V0cyBpdCB0byB6ZXJvIGluc3RlYWQuDQo+IA0KPiDC
oMKgIDUwMDrCoCBqbXAgcmF4wqDCoCA7IHJheD0xMDAwDQo+IMKgICoqIEludGVycnVwdCwgc2ln
bmFsIGhhbmRsZXIgY2FsbGVkICoqDQo+IMKgwqAgMTAwOsKgIHN5c2NhbGzCoMKgIDsgcnRfc2ln
cmV0dXJuDQo+IMKgICoqIFJldHVybiBmcm9tIHNpZ25hbCBoYW5kbGVyICoqDQo+IMKgIDEwMDA6
wqAgbm9wwqDCoMKgwqDCoMKgIDsgV0FJVF9GT1JfRU5EQlI9MA0KPiDCoCAqKiBDRVQgYnlwYXNz
ZWQhICoqDQo+IA0KPiBUaGlzIHJhY2UgY2FuIGJlIG1hZGUgZGV0ZXJtaW5pc3RpYyBmb3Igc29t
ZSBhcHBzIChlLmcuIFNJR0JVUyBvcg0KPiB3aGF0ZXZlcikuDQo+IA0KPiBCdXQgSUJUIHdpdGgg
c2lnbmFscyBjYW4gYmUgZG9uZSwgd2l0aCB0d28gbW9yZSBwaWVjZXMgKHNlZSB2MSBzZXJpZXMp
Og0KPiANCj4gLSBzcGFjZSB0byBiYWNrIHVwIElCVCBzdGF0ZSAoYSBzaW5nbGUgYml0LCBXQUlU
X0ZPUl9FTkRCUikuDQo+IMKgIG9wdGlvbnMgYXJlOg0KPiDCoCAtIHVjX2ZsYWdzLCB3aGljaCBp
cyBhIHVhcGkgY2hhbmdlIChJbnRlbCdzIG9yaWdpbmFsIHNlcmllcykNCj4gwqAgLSBzaWdmcmFt
ZSBmcHN0YXRlDQo+IMKgwqDCoCAtIGRlY291cGxlZCBmcm9tIFNIU1RLDQo+IMKgwqDCoCAtIG5l
dyBiaXQgaW4gX2ZweF9zd19ieXRlcyAodWFwaS9hc20vc2lnY29udGV4dC5oKQ0KPiDCoMKgwqAg
LSBVX0NFVCBpcyBzdXBlcnZpc29yIHN0YXRlLCBzbyBub3Qgc2F2ZWQgYnkgc2lnbmFsIGZyYW1l
IFhTQVZFDQo+IMKgwqDCoCAtIHN1cHBvcnRzIGxlZ2FjeSBpYTMyIHNpZ2ZyYW1lDQo+IMKgIC0g
c2hhZG93IHN0YWNrIHNpZ25hbCBmcmFtZQ0KPiDCoMKgwqAgLSB0aGUgTFNCIG9mIHRoZSBzYXZl
ZCBTU1AgaXMgYWx3YXlzIHplcm8sIHNvIHdlIGNhbiB1c2UgaXQNCj4gwqDCoMKgIC0gdGhpcyBt
YWtlcyBJQlQgcmVxdWlyZSBTSFNUSw0KPiDCoMKgwqAgLSBhd2t3YXJkIHNpdHVhdGlvbiB3aGVy
ZSBTSFNUSyBhcmNoX3ByY3RsIG5lZWRzIHRvIGJlIGVuYWJsZWQNCj4gwqDCoMKgwqDCoCBiZWZv
cmUgQlJBTkNIX0xBTkRJTkdfUEFEUyBwcmN0bCBpcyBhbGxvd2VkDQo+IMKgwqDCoCAtIGF1dG9t
YXRpY2FsbHkgYmFucyAzMi1iaXQgbW9kZSBzaW5jZSBTU1AgPiA0RyByYWlzZXMgI0dQDQo+IMKg
wqDCoCAtIG1heSBjb25mdXNlIGxpYmdjYywgQ1JJVSwgZXRjLCBkZXBlbmRpbmcgb24gaG93IHdl
IGRvIGl0DQo+IA0KPiAtIGEgcHJpbWl0aXZlIHRvIGNoYW5nZSBzYXZlZCB1c2VyIHN0YXRlIGZy
b20ga2VybmVsIG1vZGUuDQo+IMKgIHdoZW4gaGFyZHdhcmUgc3dpdGNoZXMgZnJvbSBrZXJuZWwg
dG8gdXNlciwgaXQgbG9hZHMgSUJUIHN0YXRlIGZyb20NCj4gwqAgb25lIG9mIDMgcGxhY2VzLsKg
IFNpbmNlIHRoZSBrZXJuZWwgbW9kaWZpZXMgdGhpcyB1c2VyIHN0YXRlLCBpdCBoYXMNCj4gwqAg
dG8ga25vdyB3aGF0IHRvIG1vZGlmeS4NCj4gwqAgMS4gRlJFRCBleGNlcHRpb24gZnJhbWUgKHdm
ZSBiaXQpDQo+IMKgIDIuIFVfQ0VUIE1TUiAoVElGX05FRURfRlBVX0xPQUQ9MCkNCj4gwqAgMy4g
dGFzaydzIGZwc3RhdGUgc2F2ZSBhcmVhDQo+IA0KPiBMZXQgbWUga25vdyB3aGF0IHlvdSBhbGwg
dGhpbmsuIE15IHBlcnNvbmFsIHByZWZlcmVuY2UgaXM6DQo+IDEuIHByZXNlcnZlIFdBSVRfRk9S
X0VOREJSIGFjcm9zcyBzaWduYWxzLg0KPiAyLiBiYWNrIHVwIHRoZSBXQUlUX0ZPUl9FTkRCUiBi
aXQgaW4gc2lnbmFsIGZyYW1lIGZwc3RhdGUNCj4gMy4gbm8gc3BlY2lhbCBoYW5kbGluZyBmb3Ig
MzItYml0IG1vZGUNCj4gDQo+IFNlcGFyYXRlbHksIEknbGwgdGFrZSBhIGxvb2sgYXQga2VybmVs
IHNoYWRvdyBzdGFja3MgdW5sZXNzIHNvbWVvbmUgZWxzZQ0KPiBpcyBhbHJlYWR5IHdvcmtpbmcg
b24gaXQgLi4uDQo+IA0KPiBDaGVlcnMsDQo+IC0tIFJpY2hhcmQNCg0K
