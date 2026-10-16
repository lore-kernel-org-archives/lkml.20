Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CBB1AA1F4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158375; cv=fail; b=W5xa7mUqN+BI3euvcz796a6ON7rCHain0VIRKKmQSmaqxWT1sHNDpwgKFlu8qh/TeeWxHXjiUcQHl6CyVuHTr67zvieTiBk1HN8uwYWaY63S1oRJBoqeUX6e1KXK5GTk+SkBjhsAQoPgIUhzU8bFGphbNm/VYWdCYRTVrDmZDjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158375; c=relaxed/simple;
	bh=B7JneNuh23/M2dLz0oO6/prd7W3gtuh16sFRt/iOhYw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PEXgrhzt5u22OVdWeTwQmSG2bCfcvo8XvZtBebP4mj1+j4X1upuT5kTnb42zboGIpHPXLnLm6CPEhaLE1qkjRjOzw77m+M/KOuwPNUOkA9TDovj9Hs3ecw737Z1Ud9MulFIZ3LtIPe2BtOTaDs14Q16ZEPlcrZmukYVynoP/e6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EE6RbAMS; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EE6RbAMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792158373; x=1823694373;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B7JneNuh23/M2dLz0oO6/prd7W3gtuh16sFRt/iOhYw=;
  b=EE6RbAMSX8Pl3G4sBseAPAmqDbnpK89aUqShwcKOoCQgLfyJJ0VnAdZS
   PDCYE5B/mJ130h1VIH/GxwCwaqBOFzWMm3VO9C3onvfsakiUn0jhih0Rw
   8vrYq98MOWAY5BBGKnvdS99mMLCpR5jVfJRKYPzk34EJwRxHFiD9QpQ/I
   wkSH/PwUwYNKEP8uI1T4/Jj/+gqFPo1CqwmRXw5K2CIUAY+pMoi+wes4o
   XWvFEj0fjfvbN0josD3jj2NYyQU0bt/WAKe7hETMH91Zpkbt2qn9xyPpv
   rTX77IcD+dC2rv6ZqnAiU8qAPjjv7s5m24wdrAZBvPEwjk8NNOB4Iz4uM
   A==;
X-CSE-ConnectionGUID: 7xjp7hhDSoCH8GWuT4MfRA==
X-CSE-MsgGUID: JuDs17a+SlONa7UtY9LhXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="827229"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="827229"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:46:12 -0700
X-CSE-ConnectionGUID: ArpqBgksTU2HpZXv0QurCw==
X-CSE-MsgGUID: iwwEuheISbKqQ5eubH0Zgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1949574"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:46:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 06:46:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 06:46:11 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 06:46:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTnPoAx50MG/EjVpSeeeJo6XuhgJVvnbZ1Ox7vD+CFeHtFUSDnCO7Ag/pXo0JKyj/TW5F06fGg0/jKzusMQMzUZNVqknGyCkVp0Jt62/5AgD12jiBTMTWSRDXGVtQSLy+K/Pi6GGqAj82Ok+QQqPufPpBvxhT0qW2xV063lRV+Ykr1oD6LrvwBBeSLvZwrhIZBbcXc/szd8Z3gncxO6QN657aJLcIsgxvki4IuufLr7wM2P7iUX4IyF83hEPZ2nv2bCbzVcrXnMu+thukUWfddnan8LUZaV3N7c22BJYsUQ9gwhsFntt5qGwTHb8WFVif2syCksFGYE1Ax9UvZMlXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWU8hjq9nGj7QSB1HG6KkSoCKAFNGWC5J2Yoaj2qizg=;
 b=b/kZOuxywcHJOcuoP5LJjoNWbx2/MvRk127Rx9FFrZiDquVPNRCyySWw6puyUEpv1joKto5vY/CmGFzQxg1Xnjqj4embAGqscfht+ycLRGsBbo9VWVvKtRbBUYNgEVQpWOgoL8FFOvEqTQmwUEijgU70KXTdpK0bVBMaCN2UOsGI2kDJhbvXaWxnvzKNIZbZYsyqxgGIXqs7kxOfVFvcNg+yWb7yYkk2gwyNCN1y/Shg6mPNxcmadzwBazGlyR5SO/VmjHaPeOhC0jw1YNi0gPdp9e01GJK0/E/p/8CgVnf/jMgn87Nt3Fpplhbc8WAbzrc7L+WMLezx3V4IKqtrsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 CH9PR11MB9902.namprd11.prod.outlook.com (2603:10b6:610:345::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 13:46:04 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0496.015; Fri, 16 Oct 2026
 13:46:03 +0000
Message-ID: <6e7edbff-8c64-4baf-b2b1-62c5d8aeedfb@intel.com>
Date: Fri, 16 Oct 2026 06:46:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] stop_machine: Introduce
 stop_machine_nmi_cpuslocked()
To: <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <peterz@infradead.org>, <david.kaplan@amd.com>
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
 <20261015211426.49114-4-chang.seok.bae@intel.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20261015211426.49114-4-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|CH9PR11MB9902:EE_
X-MS-Office365-Filtering-Correlation-Id: fc25d727-76a6-4825-00c2-08df2b8bd20b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|22082099003|18002099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 9Mm0RTsjWu86ImuycLlMKoLqDMq7b6De+c5LpAgX1L//gJ/fGLt881aT58SBgwm4Ju+n5LUvK7IVH6vYebDTFz41oPeo6dv0S9mwNQandyQIN9bAxnxX2oCJita96Y7gwN5Y0tB/aydwN3R1IHqvrxNO1sKJLlpuU6o+1JCZNOkk4CVlMTDm74TBCqo0zpjUUinD9Tza0Ywzo6kNjzQ0LfiXah1dqKECQ/eOV1q0JQLkaDnHqKK+6Zwf3asYpZiwdKx+Y6CfgJSpowPWq1aBR+ZpqAjn6cLWgp9omqGKwFtYTL25PEyEmFH9Zr3zXYryCwiz4/UKdhDFJkIhvJEFD6kyo0GF46FTXIYFbwtOd5TNCBDPNjU4LtlgjHw1QZZb9gdnd5v0ky5C8VcavJmJdqxsGE3IxUoqcowaM2mqDtOj1+lu9c4kOPkXjDL5ER3yMMC7zCiVnLu0OROkLlWAqWgJWa6S+pazxIF9MnCgr/QGXWEoFoZqfu1jfLwxAb3Hi+r250ZyshbTWVbkchqBczecLZbbqMsI8F1xtKm1v9Qo5yvMR7Y4v7Sz1CRpLabvbz03hJkyuTnJ2bVUpdoDuRXFpEwrvP8LVFB+EUr2hnEb7dTqoH+hjMsAQewMfYTGvQmFWmsOYrtI44DBM8kbpw3YX8kOLMcH7glSJTOOGpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(22082099003)(18002099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUh2Z0dFQSt4aUVwWjl6YzZ2MXQyYlFkcWo4REE0amhQcHlaZTJoWjFzcUU3?=
 =?utf-8?B?S05VUHZzb25iTGRRbTAxeGdycE9Vd2N0VVNiSkRFYVN3MElpNWR5dU1kaFlX?=
 =?utf-8?B?V0RCT0o1Q3pvRVV0blFVZGx4bWJoRUo3ZHNnVXRHMUR5OXpHbUhkWTRBaEFE?=
 =?utf-8?B?MTRuYnVpZDF6TURjeDdsYjEyVkFDSndLVWVaMURoZTJjSGJYY3NBc1FvemFK?=
 =?utf-8?B?OXNCL3NZb0NsMnA4QkxZSVYwYTlXbXpDaVkvQm84bzN6SkhpRGJoTkhRN2U1?=
 =?utf-8?B?RnZoRWhLN25FWXdpb2kxY05GOWV6ZmJ4bXA4K2JvRHhXL2lDV2FvWlB1NGU5?=
 =?utf-8?B?VGlvTHBEUWFKSkdlclZITThqUHNDVnFnUmZERGhWditKQjFPM0hnN295TW1r?=
 =?utf-8?B?WmdzaHgyeXBtS29SZGM4UjFTTUU2R2l1eXBHbkdrZUxFNWJGQ0krT0kzZGVa?=
 =?utf-8?B?aWxOMEt6anJOVTVEYmZCWUswQ091cWpEbE5KNFplbEcxbGJxMWJlQVNTTk0r?=
 =?utf-8?B?U3ZydnMwSzFhNExLbC9pU3d2L3BMdXlIeU5BV2xNclUrdnNIbDdHSEUyWVcr?=
 =?utf-8?B?NGJOdDhrTnVncXVKR05BU1dnZ3A4NUQ4NlBzRnkvOTVjRUdHQmYvcmljRjY0?=
 =?utf-8?B?Zkh0TUpXRVAzOWZ1aEhmM2JuSXpvWGFsc3h6Q2VXZkQ5dW1Pd0M5MUlFNlp3?=
 =?utf-8?B?WG5xVTllUFFFWjFkTHBmQ1ZXanQweTV6KzZOVXF6OHVxOEM2U1JGVlViSk5S?=
 =?utf-8?B?OXUwNVRJTTBVWGp2YkVyWjJuL0VLSTdNZlZQdkRjQ2tpSEUycFBaL2pQc2hZ?=
 =?utf-8?B?NW5BZWFZK2pkQmpiYVNMTzhTM1c3MDlGR3RRT3RZUklabUZrUjBFSkFCWHRQ?=
 =?utf-8?B?aUExcS8vNU9kL3RtdG5PYi9MSUU2ektwSndoQzh5SFpSNWxUUWM0TjRpempt?=
 =?utf-8?B?UkpzYnYwQ2tYT2liSFJXVk9iTGQ5dkVrQkk4UDl3cW5pb0E0TG9OeTc5anpS?=
 =?utf-8?B?dEFJUHVTRFJCb01FdmFFQUhBbGdVY051MGhUWjBrOFA1WVdpUlVFM1VhUFZo?=
 =?utf-8?B?OWpneElyRVZTZmtvRURsZXdoU01JSjJ0ckVvZld1L1RQZThuV09OZ21qVDAw?=
 =?utf-8?B?SXE0ei9qUG01aW5vQmZwSUhiOGg5b0F4aXhkU1daSElpYzJETUYwdFhwTEFD?=
 =?utf-8?B?SHVIVlR3dXNQRTV0bFBkZUR0cXBIZEo4YlZsMnZVaDFCTlMxQ08zbjZtSjVS?=
 =?utf-8?B?U1dWU0xDR2Exa1cyOUlZMnhSL1ozZEljWnREcEg3VUYzNDYzNGFwcVhqMG01?=
 =?utf-8?B?R29Fa0lLN28vZnBBbWdZSXVmYkJBY1VuZzVWdWpsSkJxZzFXTkNacDVLMmY3?=
 =?utf-8?B?MEg5dTJYY1VNamNwVDVtbndWWHQzbzNQb1d0SHluTWRKendPVXkrWVZDSTJT?=
 =?utf-8?B?bHhpbTU0MTgrSFFMU1V1WVJjdWdYR0F2ZUp4d3VFVjJrVENXY2FHMlNyZWZS?=
 =?utf-8?B?aWxRR3FtditYZEV5ZkNOSUdwM0FpbER1OHcrZHNqZVhZNXVsdFBJeHpsTzFL?=
 =?utf-8?B?Wi96TnZSRGR4WGtCa000WlhBdXA4Q2t1SXF1bVFUSkhQTkIvWDR2SmQ4dXFy?=
 =?utf-8?B?YS9TTGpzWmE3SkFndUNxOW1qUFlQWWFTRmFVK1V5YlB4UWorV045K2V4TkQ5?=
 =?utf-8?B?K05hZHlkQzE0dHVNcVZMUTZPRmMzRUs2ZHowQWRGNWdTK2dub3dSVGkyUThl?=
 =?utf-8?B?bmYrSHVlUGIxZ0tPYllNM3lQVG4xbmtUaVlLTzR3dC96bzZvcFcvaTVNZmQ2?=
 =?utf-8?B?OFdFK0dYNnVHa2E5UHkvbUl3cFkwcXZOTTR1Y1JodlpVUFVFL1hTeVBpbnVy?=
 =?utf-8?B?enN5OS9obWVtODNzZUFnMkkzdHNnZUhwZWozRnJnNTc0SkRRVnpIVmVadHJG?=
 =?utf-8?B?QjRFY25Oc2hqbE1OR3lSenFtdU9xYW0waXlhdit6NTNXZDQ1SVovUGNGdGxR?=
 =?utf-8?B?WnR4UkRITU96Y0FETDlsUFVheEtOV1N4VXpqVDVHMEsrOG1qa2wvbHRSQ2lp?=
 =?utf-8?B?dnNPTUJMUG5ycDJIRURid0N4UFhtTSt6WllzMlBJNVhwVWE5akpMZkxITmdY?=
 =?utf-8?B?OWxmdkk3c3JqRHVIcjI3VU93VUNJUktNbCtHTmNkWnNRZy8wYXRyZUdiU0Jq?=
 =?utf-8?B?VVBxbG5kVUYyYVBEQmoyTWFJOHRlK0hQRmRXV1pmZVRrYjlWellsQ2RUbkwr?=
 =?utf-8?B?Qk5aaGdrU010c3o4eG5UZGg3ci9PN0cvVVRpK3VPVUZnMFlXS2FHV253emh6?=
 =?utf-8?B?UVArOGQvOVo3Tk5obzRLdW5RR1NPNkhRNUtQZWk3NGJodlY1SVdsdz09?=
X-Exchange-RoutingPolicyChecked: ONJU+siGKyPnUts9ZiLThxYyenncZBks/TjK0+WZjUxmUMoRhOu1ueWQdJsxqThPIiu7iNOUGpFqf3I+Br3uzR1rYHlPAVhl+dnCFM+kV0C8PncWXYbjsVl/NZbTcxPFj9Qm94svtdSeWbZhfyv+rQKg56EkV0Xs5KEZQrNyrGXv5sfmiB9sZVERbZo8g5qPopDPSRVPh8bQ4EMVV2is38ZW8NwV0MFhsMUgkiCjdXoo1Tx3HZTUvT7388nWCbX+vDgf971LX+BS7har9W1+8po++btV7Z4/420bkxQiB6KP5Ru5G/NNlhRRcmyIHP7HeKM9KIev3+vYM9UpKTltJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc25d727-76a6-4825-00c2-08df2b8bd20b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 13:46:03.8192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BgBeo1o3DRQCRHnG/aw0rjszhtrMXMb/VQsTN8fboMbxTkCa/SqAKyxX2n0M/AEzgfzTvw1BxarfwaqOUFG3hEjShq1IaFFtdZ18pyBkYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9902
X-OriginatorOrg: intel.com

On 10/15/2026 2:14 PM, Chang S. Bae wrote:
> 
> +static inline int
> +stop_machine_nmi_cpulocked(cpu_stop_nmisafe_fn_t nmisafe_fn, void *data, conststruct cpumask *cpus)
> +{
> +	return 0;
> +}

Build error with CONFIG_STOP_MACHINE_NMI=n. Sorry for the noise.
s/conststruct/const struct/. Will respin on -rc1.

Thanks,
Chang
