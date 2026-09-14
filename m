Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6877F412BED;
	Mon, 14 Sep 2026 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421508; cv=fail; b=TvFFmwOsaetXYwqorNRq/hBJZyJF8pNYkqGuMHBa6HofA4/KgVLQgI+SAeoj9rTTV2FMdoCDOawkrfS1ZI13XQktgPg8+tkcvpg3uv02xVeGBQM5csKDqW4hRKDuzRlxUhX0Rqx2SoIQfmN5sGAnx5mpoxsj3CqdFhdE2Fsh2lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421508; c=relaxed/simple;
	bh=rcX94P4BSjpxxJIrcv+PgwS0KSp535cxivdQY1YGPLo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SIeYaffJ6fbyVoWrPzLAzBZOvUiCVmGWYl7hxg0iKzLYkL530yhWxcOI+dsxNnxiY6iZgTB5UbDJwdN/f+Gh6Nlpz4LZBHN0rBpWqUtmQIvds6mDwg3NOIb16I6AuxSKR455fc3Rkv3sIGiTTKflwBlAEI0T73iNXRiiStzOxh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBCfUimG; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBCfUimG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789421504; x=1820957504;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rcX94P4BSjpxxJIrcv+PgwS0KSp535cxivdQY1YGPLo=;
  b=cBCfUimGCcEcwUkSKX+DNJPLZyehXCmVpQ8vNn6jIFeiP8hs8SSDOG0R
   AfnsADNmTZkWdE9gUNwU8rOIBFDVZcu3opoZYl4/aR6oi6dcL1Zdj2GMd
   kwyGX0b83Q17PUQz7qQ4QPbIze0VYnsVugOUQxNtj38/5AjQhmEqIHmk0
   H+sH6ZknlptAzpvJTFdXvQ7KgFM6FRapcclciJxJ3Jl6FG1v9tyrsuU1v
   LMsVrH+QOQ2CUxuIJYOT/ponVtwFOL44VvQJqMnyLSfOOeV8IFGuyRIeu
   jfflldxJA5jqHslC41p+rZnSGNkjLWoDZNtqbnsazGDzE708t+9DVKdKX
   w==;
X-CSE-ConnectionGUID: j3uj/lSHRp+FvtPVW7SpKg==
X-CSE-MsgGUID: DSjtD2WGQO67QEqBXsOEyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101297051"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101297051"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:31:42 -0700
X-CSE-ConnectionGUID: GFLiR6QhR/Ow569TlUJG/g==
X-CSE-MsgGUID: IS5lCGdLRbeRl88Om6yc7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276518101"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:31:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:31:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:31:41 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:31:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDyFRDmIYsKlNLKgz1fcruvQYceVBFX/Ukcby5tU65n72I5DJ2Y+5wI0LS2iXxUBAO6VLj3RV1H6uMUeeNs6vszKxfOV5o2C/Z9zRDvoygokfA1+dMT8gVV2UfC3MIH0Ep6dcFe5WjlC7qROYR+dzyEIcXNnfH03ZZafPjNHbzjT4Y7fjFguNapOEGltxp4h8AahuTXoIMkN7laOLefpkEYfOL3H0jfKyYE/H1OD+zbZ4xvAa3rhl+G5nkWP2GBbKV86d08YBGsjAV8XPjmXmgX3GVqZl3URPfyibED/PY15orfQ0f4etVUGKphbSu/th1f+ss0GKXy9kOd6DKit9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmSp31BI06oEyHk2eap6GU1aQ9YFryCPWG9YdvkFQRg=;
 b=FBev2rdofo/NE3VwTUPLIY1iqgGbPIIfBBuWsua603rVGyi9VFXUpmA+gsOtUWrhyZX+b3m9nMdJt/sX4oBmpRK4L/q0obET2gRMIEWOc3oEyzgarVqZNE6F17civszoAARHWei/hheI6EhkMxLjV6568A5wSPygE1vQ34H0E6zCtPiMIiu5qcxblLuKbCULbs0ZFm+VyclC5RP9gvUdJSODQ9+Zc52fXZLBqT8ZvVzqYpcLGjPFdWfJ4bUNfQjpzC9qYuENUTitIW7Uki9fUWCuMC0rdZQPgyRf7AJLYnuZxafprTtmEYYYgsepz5/k/it+d60nNekst3TJvI5ktQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LV2PR11MB277206.namprd11.prod.outlook.com (2603:10b6:408:3a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:30:42 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:30:42 +0000
Message-ID: <30dc55d0-511d-4f5f-92df-5dd0add354a2@intel.com>
Date: Mon, 14 Sep 2026 14:30:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/resctrl: Fix ABMC counter programming for
 extended counter ranges
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1788545152.git.babu.moger@amd.com>
 <9e85f67add9ac84f55e4b0fced92ed8994f8419a.1788545152.git.babu.moger@amd.com>
 <afd86b47-d508-4739-ba6f-fd1c341e09a8@intel.com>
 <10240e0e-6879-4378-8763-cb1a9baf1f2d@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <10240e0e-6879-4378-8763-cb1a9baf1f2d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0313.namprd03.prod.outlook.com
 (2603:10b6:303:dd::18) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LV2PR11MB277206:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ca6cb7-41b9-4c41-0a71-08df12a76dd8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 2pnUCTR2SdMjD9Lu8M4HW99eu0/HVZXvzup86byOqTV7bu/vyVKXgASxvQ03nfheTKhJEQCVszVfKf0XKR4uNYif94kJEraYBmY+qdEWLBhrC8ScN1l5iwzY7nAg3CTVp8xhogT5hEqSak5pcWhjeaZujluHkfC538K2Xz0h8HLuRAKlnz0ju+BZdI8UWwSOAEb0M4zTV7L7IbJLssUfHEg/ImnHz+8DuqAwHWGwZrnfkZbnRJPJI4zPxRd590NqOndvZjRdHo4eKpCgiJJ+K1844Ah/mOpPEodfmEDVkPMLIbRBAN6+caSFWysodfV3k9dYqMazx/PuOkI47QF7Sipr3cixE2XxItYPeJXnWua7kpzp5NaIF4RP6PvADPiQSzgUB16B/AqXWWmpNREShH36NSWxoQ+EnOZpbAFuGTMyFyg4wjTqiMxEl4MJPqpv3+AM1gqdh4Ug6oxnmBKbwVXt5loCa3xZ2gh79ZU9yya+SDymbkp7Td6QX3ZZsC6L5ZEfzS7VKTgBkc5V4TovRGCeDTXc6Bs6YucfOqekBGY3b63GbHLX1yQZZVTEo//J2TBi8v7MlG0HfhS9Y5j0nwMzJKoolBDLrlU8tQYGY2VJ4s6KRQOrpa2Hx97sBduR9bTNWdhgR6KK/+wamcXA6+eUuaS4Dt2uafud5aEvBw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3hHcnkvRU9RNTFXNXJNU0lja2RLbGkrdmsvc3BRZVFKVXpiZ1JZSGduWExO?=
 =?utf-8?B?QkJiZHkxQm9DMnMvQklKeG1QV2dXUGcvczFvS2dIcHYzRG8xdWROcWx3dGRW?=
 =?utf-8?B?dkNDMFNEd1N0Q0U2RWVEVlZZUDZnK09tZTdRVExhN2FiM3dYNWw3a0huK2p1?=
 =?utf-8?B?d3RVMmlBQ2swaVNaZVFuY0tFTUp2cnMzVDJva2NyaXZBOGtsbWtIRzgzK25m?=
 =?utf-8?B?dEoyM214NWtNdUlJU1pWNVFEdFF4bUlrdHNVN2NJRlNneWpHbjVqbExxY0Uw?=
 =?utf-8?B?RGk2aE9VVnVCa2pBNktuUFpNWk94bFJ3WGljQVFjYk5ZVVB6M1NIcHBQY2JP?=
 =?utf-8?B?Mk85c1daYW1CNldxc0VTdm16dUtwdzVCK3ZJTWZUUHgzRHd3WTBacWVzYmUx?=
 =?utf-8?B?QVpQNXRWRmY5b3AzWG5vKzR6bFRwYjFOS2JjZ2hJRWRIcmgxc1BrRjVlVXhz?=
 =?utf-8?B?QmtnSmJyaTVwdGszbWlEV2Rqdk1wNitHYUtrV3dhQTdqaGYzRW4wM05OQ2hw?=
 =?utf-8?B?UWpSR3d2WU1JRXJCL2F1Qm93NzZvcHNNL0t6UkJacnlpTFJWN1U4RjgwVlhO?=
 =?utf-8?B?cExXQ1Bna0NXTmJoK0o0TjRob1k4cWhqUGdJYzR6ZlBXMXlyUi9xWXFMNksz?=
 =?utf-8?B?eUxuaUNhTHRJTnd5VHJqSTJjRjFoSkxnM1B6SmVOQUlqbHdzbzhGMWp3VXE2?=
 =?utf-8?B?cHppemYzSUFhOTlEYkN5eFFzbmdDMm1RY3F5T2hZdGpTRVl0QUR6bHZPRy8v?=
 =?utf-8?B?OWVWdS9JdzV3T1NTZlhseTkxdFhKWmJDTUNqZ241cUxsRFBWRU80VFUxZGt3?=
 =?utf-8?B?WDNDRlhRTlduODRGSWliMmplY3ppNm52ZFphNHczQk50Tjg4amZ4a011Nktn?=
 =?utf-8?B?a1VwRmc3dlBuYTd2b1duNk0yUWlZTzcwcEg1MXRLS0tiaXBzakJtTHF5ZFJi?=
 =?utf-8?B?M01MUFBUR2hrZWhha2xnVElOODMxdnRuUXRSN0k3Zk5lYUdxWVdCWVl2V25j?=
 =?utf-8?B?QUN5ZWVIa3ViSjd0VGNVSUlzK1J2SGUwa2w1RTlMNUhtd25xdGV6T3FEdWpR?=
 =?utf-8?B?UG9XOXRRaFJqMVdCaUE5QzVjWmFNbTF5OWdkczRqNHBWQ0UvQlFnbmh1SGRl?=
 =?utf-8?B?R2VzbmhDOG9aS3Q0YmNwejN6b0FScjFFM3JJRExPdTdUK3NRK1Q1OSt6Znlq?=
 =?utf-8?B?WmRld1J0c1hDTzg2a3JyeCtSd0U2K2pkbEhweXgyY2pHNXR0ZllqL3d2amFW?=
 =?utf-8?B?K0pCUE16RWZ1U0M5cEV3M1AycGR3ejNxUUsvTnpiaDkwY0VnZXdYYWV6WHh4?=
 =?utf-8?B?SWVtMitUSUM3bkxCbkpWVGxJc1pxVkpYY0Y1bXBmZldibHd4SmVPblk5WFc4?=
 =?utf-8?B?U1JaTkZQQmZyVnpTdFpQRHc4VU1QNUZMMXAxMnB4b1VFUGg0V3dUdHZxaCsr?=
 =?utf-8?B?am9lR1NvYUVEdUtUSHQzMUJxL2ZuU1Q3cGNFSDAyWXc0c0ZXMWZ6TWkyeGtV?=
 =?utf-8?B?Rk9ZczhCdUc0TUk1QW41NW1vUDNSSlVnTE44Qkg4ZWNybENkQmE0eWpLaWFD?=
 =?utf-8?B?Z1oranp3WVJ2Q0V2ZGFnUUVXVUtuOElVV1QzMll2OHlTQjdiY1JhNW1yWURR?=
 =?utf-8?B?QVpUZ2ExaWo3SVBkaDFRWU9DVThxTitCL3NxZ1J2ZG43VmpUL3VUS0ZscXY2?=
 =?utf-8?B?RThnNng3N1ZiMTZDWVlRSEVyL3ZyY3JjTEhoZzl2Wlh0N0VGRHNvdlpYS2Rv?=
 =?utf-8?B?SFZIOEl1UXEwVWhLNkt6cXdNMU5TbHBGKzNnNkpXd2YzcEw5NC93ZEo1SmVm?=
 =?utf-8?B?ZFRrbnFndUZicncvV0pqdFY0cHFxV09YOGRVMVU5VExHUk5henVnZHZKbEg3?=
 =?utf-8?B?VnQyWUxjbTVsbVhMVEttcFgwQlhPNGFBNjJDMnVnZGRGRGRwbTU1bE45UUVX?=
 =?utf-8?B?a0ozaStCeHJUZGZxYzB0ZndtNXVwa1JDZkw4SXJkakoyWnl5MmpiSzJGYzM2?=
 =?utf-8?B?OHFLWUxBeEhwRXNWVUJqNVNBaVRkVWt4YjkvdFQraC9ZZVoyVGRsZnZ4ZEZJ?=
 =?utf-8?B?QlpOTDFteXNpSUFJYUswdGc1QXFoU2RBRVZYakdhSi9Ja3IxSUN2MkFaK2Nw?=
 =?utf-8?B?Sjd1TTUwR3BFOVNHNHFsbGJDVk5xUWo2NUxhRi9QZG96djdJUzB5amhJUWFi?=
 =?utf-8?B?d2xST3VZM0VHYnVQays5cFhlZmRoVUpCdStpU1RlazBJdzE5OEE4bGh3UmtB?=
 =?utf-8?B?bkdwZDY2bS96aEdHY0NOcU1OVDhGa0dVSHZ4V0p3K0swSmZSWXFhYm4vUjVr?=
 =?utf-8?B?MnNoQ2I4MFhHS0QrRDJFbm5EdHhaOHh3cVIwY09hYk43RTdZSjdwNEF5aE1w?=
 =?utf-8?Q?7QONie1HXtmK+Uqo=3D?=
X-Exchange-RoutingPolicyChecked: WOx6vQ8qqOeEC9P8W/UyBveLfx2QpDpSCTl/X/lMByK8wGZFW3cNBiUdEWR9lbscHep7HhA1wSBaJgirP1AmdOi0NI3qOmYAd13uqFNt2YwB7psGlpe54ouvbva/DxEts2wobSzSb+Zf5qcRnQ5LFo5QgldDx4d/1nO5d8y30utMWUiZx3aKlnj4SJfd6Gr+epB88Hx2/uzcsWeAJZeP3s3yz6EfDmvKLCRfnR+1a8JP35gPtwxvupgo6fcZWsWilTawFFW9JL6ljq929I1A1Jp6hoc+4tFEBLOwip+exwACoMqKUN6xX9qDwovbC2H7ugfb2hapHFiDBaO+2/5g/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ca6cb7-41b9-4c41-0a71-08df12a76dd8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 21:30:42.4141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z38QfRjiXPTCMJoQp8HzA1OT/geCaLve/xLsdXOtRIe7JRRvDnk9SVPvzU4eEff7Pv8QnaI6liZS5Js14GMXmsWllVzX175BTbFCjR5CvCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB277206
X-OriginatorOrg: intel.com

Hi Babu,

On 9/14/26 10:17 AM, Babu Moger wrote:
> On 9/11/26 17:03, Reinette Chatre wrote:
>> On 9/4/26 11:06 AM, Babu Moger wrote:

...

>>>
>>> Fix the issues with the following changes:
>>>
>>> 1. Update the cntr_id field handling to support the full hardware ABMC
>>> counter range and ensure that counter programming does not interfere with
>>> unrelated counters.
>>
>> Sashiko's assessment that this statement is not accurate looks correct to me.
>>
>> Looks like the enumeration needs a check to limit the number of supported
>> counters if the hardware supports more than what can be configured? It seems
>> awkward that such hardware could exist and unclear why the spec has a mismatch in
> 
> 
> You're right. The spec overlooked this scenario. I've notified the concerned team.
> 
> 
> Do you want me add this check?
> 
> -               r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
> +               r->mon.num_mbm_cntrs = (ebx & GENMASK(12, 0)) + 1;
> 

Yes please.

> 
>> the number of bits here. Even if cntr_id expands further to use the remaining
>> reserved bits it would still not be sufficient to configure all the numbers
>> that hardware may claim to support. Are there perhaps more field width changes
>> in this upcoming spec update?
> 
> Two fields(ctrl_id and bw_src) in here are changing for this register. I dont know about other changes yet.
> 
>>
>>>
>>> 2. Expand the bw_src field to 15 bits.
>>
>> Do the comments describing the RMID field width when reading the monitoring
>> data (__cntr_id_read() and __rmid_read_phys()) need an update also?
> 
> The RMID field width is expected to change. We can revisit this when that happens.


This patch is that change, no? bw_src is expanded to 15 bits, and bw_src contains
the RMID.

This is the new RMID field width for monitoring configuration, after configuration
the counter needs to be read for the monitoring data via MSR_IA32_QM_EVTSEL and per
__cntr_id_read() the RMID field is still restricted (although not enforce by resctrl)
to 12 bits:

	* 43:32   RMID            RMID or counter ID in ABMC mode

resctrl also supports switching between "default" and "mbm_event" mode and there
is no support for the number of RMIDs changing between the modes ... this reading
an event in "default" mode should support the same number of RMIDs as 
"mbm_event" mode and we see in __rmid_read_phys() (although, again not enforced)
that it supports even fewer bits for RMID
	
	IA32_QM_EVTSEL.RMID (bits 41:32) are configured with valid RMID

Looks like after this patch there are quite a few different field widths for RMID
between what is documented, used directly, and actually enforced.

>>> 3. Change "unsigned long" to u64 to fix truncation on 32-bit x86.
>>
>> Sashiko found that this change by itself is not sufficient to address issues
>> with 32-bit. What do you think of dropping this part of the patch and instead
>> adding your support to:
>>
>> https://lore.kernel.org/lkml/20260831174421.13921-22-tony.luck@intel.com/ ?
> 
> Yes. I agree and support that approach. Looks like all the maintainers are inline with dropping 32. Will drop this change.

If you do support that change, please consider adding a tag.

Reinette
