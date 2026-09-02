Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C040DB53
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383771; cv=fail; b=Ucd0KRURL3Ay2rcs6gK7i2VueXlEEi6CMVvpm/bUE2KMk1QLuDQ1M0vQJPkmTcc7Xqgf+AcsKkRVpZQnZJOvKmtuJwFmYKNj2HhIaCWz0QZmpDZAZRRIwXTp4vAZQeHiQW6YbJHBDPTqceHyav3Nm5ECrkijCV1d1xZ9YJ3R2AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383771; c=relaxed/simple;
	bh=p/OMGYXs7PwDW0/LFhE/mKAPe8VPDvmR0WNlyROjCTk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uW+YOmEl5upOdUPGOKW8mSRuHGOlrMG64+4enzWcDV12E12xCOG1DtQIP+DtvbzABvYZSMtndBPplYx8M8ump6wMoYExJyXRAGtmi+jhQ5fpsghBUp87J+uJ6+Rb6lwaLt1dtM5zV+DkWOowUbNUNjtcTPsjgv2IjAbPI25zhCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BO9Q0AuG; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BO9Q0AuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788383768; x=1819919768;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p/OMGYXs7PwDW0/LFhE/mKAPe8VPDvmR0WNlyROjCTk=;
  b=BO9Q0AuGsJvYFysLBgG/HI/hCxRpF3P40Yn9VEHFOuWfM8uZaWGhPPmp
   CXQ6HEwPrhSN5ZsapNk9tMnXEnZ4w90pIMA/OXP7CL9Vul46LuqhEtRU7
   q/9LGjCJN4QrJioy7HytFSVeku96UVSvShCkRVgliA61w9+hWlRxpyqVt
   GLwS50NcJuuIHdCbzo/WjwksgEu0U0JnrgCivyBg+S3OAooEta7A/yoO+
   Ks4jsOMRe2nHph7CZelec112yb/aQ/FS/QT5+WNDVxARM4QrcV2mlm40z
   MKZFQLjWFpUBxibV/VZmIfJcBQ9SqjBZw0hu8lekMiKPb9udyhHUyNxqS
   A==;
X-CSE-ConnectionGUID: n3ZXCa4PQ7iWRR2812955A==
X-CSE-MsgGUID: 1JEpVJUQRluYsT4d+jWUCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92723951"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92723951"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:16:05 -0700
X-CSE-ConnectionGUID: U7lQZmJ/RROznGGmr1OP7A==
X-CSE-MsgGUID: oYjoCiWwTeWGmMRptOMoww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="274807401"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:16:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:16:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 14:16:04 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:16:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/J7N3Y187wo19W1OP4LOieUkNOFXzB6jt2lmovFJbNqxysCmnLfrZYj7tjqILL5YxfDz2u2caw1NJMntQFo/tCyz85TfqZg9LI/mJ2JimZ3Ks7mn2NbFV4PeAne1h+r+G/wvTT0aDCjRXoBblBILW1bHaGEfgAi3AAd5RPYErsX5sJlOdS58cIgnGn796h/C1JtT1DeqzZDeZgCG+op3p4GOUBrUGclkak53opX0MM0yhEHikxuHY/AxUDTzKbd0x0OV2YAEBFweb8T1Bwv5nJIx2Fs2MonFZSa2xJHIHfKPO3LJ+qb5PvqxvnQmPkJrLjgHh0zXW455iT+QFS3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YcS7gaEmNDgOHLsNBbAok48/EeNT/Wg8qNvLYEZeZA=;
 b=oPWeEamLECePCgPydoSmqQ8mBgGRwgV459W6L6Vr4ErYUL9iXV/Kbx+/G2KxNpL88H6vwmDhfpiCa/QdEv1dxsOK4C5LOwuYkxyjjA57xidl1nxPM1e41vM7Ftt/09OsiRBzxkOZB2lXSRIMjPB9zzO9gbyxnFVE7Ex7JZ4Y4uNopkTN/XFfrGdUHZMlCaiGp7WM4hEEk2Hs/rO8tOiM1aDU69uwy3zlPzMViKrMmd63JGeP2OaYUA93+VkuX9s7JMsDxieo5ssaWdBaU8SG2VkL0olokj7vS1HhugFnKOA6AHTz2cYdGCjgDRr5rA81guUumVyY1fkPw1XMVXYb5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 21:15:57 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 21:15:57 +0000
Message-ID: <36269f7b-a76f-47ee-93da-2f6bdc3d111f@intel.com>
Date: Wed, 2 Sep 2026 14:15:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/fpu: Pre-fault only required size of xstate
 buffer
To: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <criu@lists.linux.dev>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Alexander Mikhalitsyn
	<alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260817042048.1579415-1-avagin@google.com>
 <20260817042048.1579415-8-avagin@google.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260817042048.1579415-8-avagin@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 127b46e0-d5d5-463b-9828-08df09376161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|23010399003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: H6YOYTPSKByJ8hlgLzo6rE4A7+tI930nXae0pchL6ELOZ5TbepnGIhUS19FdGuJwZNMMzXO8yMQlRzrZyvNcPSPySLT5hekfmbFKr+Mx3CG4z6qZICN4a6QXAOryXOpngNIpFt4tarWK5Gz6fSOHyd/Gg3Ho5kaG4bsTO2juICv2HAfKuCMGy/CKgnunOuyPrPoEGHeYtIdTySl6gndWfM3yKCDuyGCifPPzAOuPQxleHQyBMJaf4PsJvMoQOOwp4PYjTSswHUW71p1rMJDfe634SsrpOvKz1T/JovKzYTVAsa2+zQ1yqEhtu/Vli1GMxwTtyA9Ny/1yGM6i+lvDWSc4VvwFJhr6Ncii2s4QVR7St7QbZRf6+2AL6NgxyrEC7VSs4X+MLjaSiv1B5DsViuGJMWY6D+R93KyFExg7wX6nW/xHcZp1a63t5xabk86HkVuQs2qubkxSbyj/lVMN4jkLl74mG8aq3FWQakCWL3an0fDqGnxwcqMbLsqMkXQXI0ZZegTcTcU+JaUehJzJ2yBWDrPTIJbWxuOHdQLIchxZw7eibTzeztEyR+i5bvpuQQvdQCdNLEalNcs5raEXv44hfiY8arnYnodv5qqDV9NlPYXJicXAwtWU9R+GpWytl7CYfT6y/x1ISG6pYvGq/yGz+VkyJrwSrhwU4Nf5RDM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckVEK3BIYlFIRnhjT2R6OGRVa0VmMDloRlEzYWh3Sk41dW92b2hGUnpaY2VZ?=
 =?utf-8?B?V24rdEFjZjBkSml1dFZRWWpOVnVLcDZIY2JRaWNVbVE1eXAvRXFqMFB2V09w?=
 =?utf-8?B?elhiVGVOVlovRUtuR1BhVElHazdzbVdmRTZaajc1OFdVdTQvUEUyMG9MRXJ5?=
 =?utf-8?B?VWdXM0lSY1BuV1psczFQSnFuZk5pNEFHU2wrUUVXYXh0ckdDbkRGendPa3Jr?=
 =?utf-8?B?RE1VQTRUN1lEcnJkUWcvOG55SmFLZDZhMDYvRWlaaEEwQVBhUmsvQlU5czVy?=
 =?utf-8?B?SUMvc3I4Qm5NTkRJUnBQbmMzRGlwZjhON3AvS01WTUc4NTBYdUJTTlpUV29R?=
 =?utf-8?B?djlOZXFvWm9hMVIrVXdaKzByNUlUMDZXclRuVTNOTkFoWC8yMzFTdDNueVRl?=
 =?utf-8?B?MHE5UEFsT21VOFlUK1kxbytaT20xWVJJSllveWtra0FoWk1ycjNvaEhoeW8z?=
 =?utf-8?B?K1hZcjF4aXFyQTk4UHo3bjBRb1ZPQmhYNUJDNUUzZng4OGJTcENzR3R2TElP?=
 =?utf-8?B?STErMW5XWE5va0lWODhjaHdoZGtaU2J4RUxpcUdiOElXenJHd3VteGszRDg5?=
 =?utf-8?B?Ly84aWswWS9oTlhVNHFnN2pqK3A5SlJNTll1ZEdZTXBIOEJoTkh2Y1I4UDNz?=
 =?utf-8?B?Ny94Z1JVbjhqdVlsblpxUDh4UkVXV0x3RWFBaUt0cUlkYldtSHVTaEtMcGlj?=
 =?utf-8?B?U3FuRWxhQU9iMDlqSGpnYnowRkVqbTdNUzNsMkxWbTVCcGFWbG9MYWJ3WUt3?=
 =?utf-8?B?eHpleGlLR0tKNHVPNDhkMWNqa2J5MHJGaVhXVTZBZy9PMDhMbnBPbEM0cTVv?=
 =?utf-8?B?STluaU9vNjIyQUgvaGxkKzNpOXAwK3ltY3N4UlUwSHpueTJ3YUdOQkhaanV5?=
 =?utf-8?B?dEY0RlRzckxZUEdPUEtkUjZJRmdZYXRxVmZ6WnJwRmlBY1lwb3JSYjlZYXh3?=
 =?utf-8?B?MjZRdUJ3aFJ3WVhjbi9BMzN6L1lkT0hwa25lbWFQQzZYUjVwNXBhTHBxU0xs?=
 =?utf-8?B?SkRKc24zM1g0eE1nK0J6eTFGNXB6bFZERzM5SkpuL0doVVBad2pMRVJkc1hT?=
 =?utf-8?B?R0ZJUFN6V2V2ZGl6ZDZ3RHNjSEJBenN5NjhpVjBscUxLNW9lU1M4Sm1jZzZa?=
 =?utf-8?B?bzRveHVkZE9ua3Y5NXFyV3ErNHhJeXlHR0haQ2ZTSkdOV013dWtyL3E4Nk81?=
 =?utf-8?B?cno5YWs2cTNneHRGK0tsLzFINnBCM0xrQmdkQ1p3dzJEV3o0eUZ1Mm5JQzhU?=
 =?utf-8?B?Znc5aXhhSm1WK3QxeHF2MjRsTXZKWDlXbEYwVlF4MVo2SU9vRTFPVTFzQ25z?=
 =?utf-8?B?QzBNWXV6OXlZTmRGTk1GSnBrZXFRTDF4dmZkaWRYQm9WWFUwUXJPUyt0UUJz?=
 =?utf-8?B?ZXB5dmxmT2NHakhWZE1wV3g2NVpWNjAzMDFWT3NCVGs5WGFzLzNyZllSSVQ3?=
 =?utf-8?B?ZWtrMW4xQWNaQWxITGFlTDNnaEhqT0MwZGhEbzZqRG52eG5RY3JlR2ZtOGV0?=
 =?utf-8?B?eTRiK01JcHVON0NocDhEZTI2VURIVnh5b212czl3djdMYm5GYjBESk4wcXRy?=
 =?utf-8?B?VUZsVEJBSUxKSU0vLzdncVNwdDJUS3diQnh4Q0gweU5wMXNQbDRkNE9HNFd2?=
 =?utf-8?B?OUU2L3hrZG5NNUhDSFdzSDN4alJCZzdZcUFhZWpYR08zZ0pQcjhEMnN1RFh1?=
 =?utf-8?B?SUVVV1l4ODZzMGxCR2RkZ056cDFhZXVTcFNJdzUwSGhCTTdDV0ovU1lqVGNM?=
 =?utf-8?B?bjVzMWpRS2lKWEowYXJsYjZ0QWNoR1N6dEFJVnVhZHU2OER3eERuMjFIOVNR?=
 =?utf-8?B?Y0NhZ00yTnJOcTFBZTl4NUp5WmoycEhyUk5SVWlBc0pIN1NUamE0dnllaUJB?=
 =?utf-8?B?YTVLWGdiMjdHeUZlNjNtRTJVVUFGTi9yUHM4c2VzWTE4bjZvdmxyUk5sSVRD?=
 =?utf-8?B?c0hmRG5aeDlxNm5Wd1dNYkxXYkNOSEptdS9hdThEak1lSzMvakNPelYxdnFT?=
 =?utf-8?B?cUdxOVNPM0s0TUJ1d29vVGU2V0hVUUw2WlJnbEtxNjdyTE9DMythcGRlT0ZR?=
 =?utf-8?B?MVNDOGVVVkVFc0ZNUGUzbUVIY0EzYkFpamNxOEZndVNVQjZDOHYyOWdBRjAv?=
 =?utf-8?B?WXd4QjUwOXdHTmJZK2pwcGhBYVV4VkkwYitCY0FmVlg1NGJRem42QkN0bC9p?=
 =?utf-8?B?ZDBZNHFSbks1QTJ4VWFqdERVcmhKRmtsY2xnSjNkVG1jdnd1Rk5BRVNvQm1t?=
 =?utf-8?B?ejRqQTE3NjlUcjgraDl4OEVVZjEwSllqUUZndnBKMUswT2FCVTVzVUUxQnFn?=
 =?utf-8?B?aSszZWk5T1hSTEV2V3Y5aUhmaTlKVHJOQS9Vc3BJeUc4TlpYSDNRdz09?=
X-Exchange-RoutingPolicyChecked: A6XP/Si0wpgH5DtyjaVaYMX8uBw3ENpeS9JJNowAc4z+rN8Z7+/KalhXeb/hmyygY5KLWazlDdigVQdTQlWnQs4Myuk+Y++diVqNGL5QPWXZhyUq/5Ey6+vc7iiFrzBIKBNQ029kRcSK/0sJiVVVmIkoo0Os01KEsZTp6M0vC75dgVo+QZBg+A9lSYhDDJu+dIoOSM4WK7rrg21qih+UtXGY3bzPhiv/ybrfa3ubT/iOzv42+zehKPkLJMatJqoBQBFbD4Aq2VlXbOWyEpCzs+8Dj5dG7+/bUJG8VV9fF5a1Ug1ZbaCXkr1LUIBqR1gxG/4q+AJlAUep9h+dO/Khbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 127b46e0-d5d5-463b-9828-08df09376161
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:15:57.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SnFfvXfvEQoI3+X/njk3ZjqabcVhJNQ+C9kBWGrS0csC0xP1EMr1v5vRQd2May2evRVROFYTJ94Yze4Ydf1B8VZmroT6YmW1lHE6I1Mfe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
X-OriginatorOrg: intel.com

On 8/16/2026 9:20 PM, Andrei Vagin wrote:
> The kernel previously used the default task FPU state size (user_size)
> to fault in the user buffer when restoring FPU registers from a signal
> frame. This can lead to attempting to fault in memory past the end of
> the actual frame if the frame was smaller than the default size.
> 
> Introduce consistency checks to calculate the actual required size for
> the features enabled in the xfeatures mask, ensure that the provided
> xstate_size is sufficient, and shrink it to the actual required size.
> Use this validated size to fault in the user buffer.
> 
> Keep the strict check that the provided xstate_size does not exceed the
> default user_size for now.
I think this consistency check should have been there already. Thanks!

   Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>

Thanks,
Chang
