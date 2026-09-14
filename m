Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B6141A76F;
	Mon, 14 Sep 2026 21:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421577; cv=fail; b=a5qHLNf3bgk8deHZWW9Z++KnOGD+p4o/JXqkroeE+TPuS4Uyr1KneajDJEhTSpdKnq0GI2wRHe91NCMwg8sCQ+7DSwUrmgePXxSAD/jwlY7nSAXxEBHl5UKAYPxKPmD+4Vg/V1iZUDC+qCcYQPXCwZsIwt8mNlat4kxAnTA2t7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421577; c=relaxed/simple;
	bh=lZt0kQtIFhrSHay3bwRav2qpZ2ZKuRDLY+cn1xqRJQ0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gss/dpnrLMqveT/dh5bHObHUY+9jEmhPMh309aQfLUMffhwJhdK/CModKNpHqHfGGmwkXEYV35NHj9oKO9YtGVhcY8ZSvWzJJt+RV08mhi4HeStHcZwhJmN/IVlZV42Rqme7ROH/pBEoQxjxGQ6QXaxkLQ33Ezu4fj8vrUtCGgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpWqCO2K; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpWqCO2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789421574; x=1820957574;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lZt0kQtIFhrSHay3bwRav2qpZ2ZKuRDLY+cn1xqRJQ0=;
  b=RpWqCO2KbvN4csDd+RVKECXOCe6y/2wCX0JQm1x2DjgpVXWep+6hXw49
   JbwfRXugo9SZ/0pe5IwEZJl/DIGJLN4fjTvsk3g4IE13k7dG5S7Ns8Ld1
   o9hlF4jY+I7UWKl1zpr0rdkOCxHEhHIuwandhvjSilyYcvyBrDVAkK6SA
   SbUOvY5nN6Mh21voYYePB9/UoWyoueY+UAzbJoMp6uCxkEE9sl3NwYnKA
   zV6Nzi2qaZjBsT3anuQaJb6Bk6QmihDpQ1mJg72wpUcawR+rQFOflsq/Q
   AGdzVSaWPc7jIEhU0A+BZX+v1EmzGP/ZyGSdS312HpVlZeMzSQN+X6B9T
   Q==;
X-CSE-ConnectionGUID: 38HU/YfQSDaDq0cn74ETWQ==
X-CSE-MsgGUID: 5vrKsJxbRy+pDeR+EImoEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88918681"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88918681"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:32:53 -0700
X-CSE-ConnectionGUID: Wu987LCaSiqGqZALUCH57g==
X-CSE-MsgGUID: 7kKJCTvSS/63kncWioOAew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272737499"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:32:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:32:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:32:52 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:32:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq8ONaBV535UthpKFvfzFBj1E37pPawnMlNAdGay82Ss5HgAkwmLi5qy6Zetq/B1hKnDpwLZFQZ6jRvG4fEt/8Ib6Q7i03UN2C5IiFaUuRV8OtnJamE/DrQZkUASZisgWwvYOduqrrq7rl8OWEIxLYKK9anT9jUoLGAaCaKRQYg/cd4oXKs9rfNJogDOTDZYfmr2grjY8IPPgceC6wFlD323bIPNTBDJYd75bDBSa56e2KhXQvry/XozIcy7LyCIWVjc2I58M1egHJLIIgX06XZvM8v0q72zerolSBVHQZkG8iO3mvqDgyFm9tKhtgxX8nmUTawPe6Ki7WfHJ8ECOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awy7BzYZb6Eww0wKAMyl85E0fl9w65xsv5u4GxcQy0k=;
 b=XB9tzwz1e4a0UFsAnzYtD81m6uW5lCjjm8VVULeNF/2dHxZUdhiuLlmpYQ5p4pnYYvECeudE3wAHc3vr1KoCLWavr50a1Fycil01+xb5Eg4vkk4JntubIcRtHpQY0Ue0wl+0022J1poozcwtviyl7IE3yW+KDYDZSjx2i0z+h4XSAZg56YyhkI9QcW+Jg7yg+b2EVtKsyuVKXImKSiJuT+S98YbWYDCKkg61PkJuYfroImKLTpIJtZGLv3x38eahFGPPhIdi3PWnXHTNEzNetfIXs6O1COP3sv0xaEWdSu5I3pqKFpfSdupUYx/vUp6pc9c2+GLHa0GuPTKvfFZDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LV2PR11MB277206.namprd11.prod.outlook.com (2603:10b6:408:3a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:32:00 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:32:00 +0000
Message-ID: <5e8c02f6-4352-42e5-83a8-f6d589278568@intel.com>
Date: Mon, 14 Sep 2026 14:31:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/resctrl: Keep mbm_assign_mode in default mode
 at boot
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1788545152.git.babu.moger@amd.com>
 <176d53626058ae97c4003f77ff47371628da9f1f.1788545152.git.babu.moger@amd.com>
 <69044bcb-e606-4f7c-be83-2188169ddb51@intel.com>
 <e5d60b04-6bd4-49db-aee9-49983be17c71@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <e5d60b04-6bd4-49db-aee9-49983be17c71@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0316.namprd03.prod.outlook.com
 (2603:10b6:303:dd::21) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LV2PR11MB277206:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c3f31b-0904-40ff-23ea-08df12a79c18
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|13003099007|3023799007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ZZc+vXNIK7OIqXK3/SDTAYBD47UdMbnkSMb5L5Jm8CjFqq+2Vpm4ahaGbhu6qcpifcXbtN6kOhUzOrwVBGbys2zeI5P2IcE9cM5tLobd1Ukdd1v8IAhLfRySQP3CY1k0IruddubTI4esPG8w70k9NG1N4x0TXMZiFUWKZU/2zmG7HxCOf0nzzk3Ad2srLS4h6raCi2EOw9LpCN2W+WAb0kZLm+eOjTfow6m/42QnxQwZzF9VbtAsyKnP4UjcAMfnNsmopUkQRBatosMQ7NaiycH5U/Pt/xLSfmAXpcA1nCJJXS8bvU5cXwXrpGcUFMchswKp+634sTA2BTCh6j6/YrY0F7jUpEthqWoxc3jNywvrRuxMvQxkqxrPVeXuU/BLb7QnFBI7x887qdhRpoTnJyL+d/VBE6yIQm10o06LGmocgc9Pl6u/HO8/s3OJBTFMWh+mnIOjVq68NRJMyike1CoZPah5WHCzv35HO6uNoO/mMoBlR2jjsRbLH9lE5TOw/kNIbiA2VFAUEEnqtyuMbLSy+WwtWO4hsHZlPo60Ahlae+s2hkQ1HbNV1r5ziKSpYnFd8VF3uRVQEpD8du2fGQvZK85ereGlkONpV9CdBeU60yGQgtGu6RYN7Y9ebOO21k0rKM1NYJndHb4lJeGv9i1Cxq3jOdylekY4KXldNdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(13003099007)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFhYZHVWejN3ZTNHdGxCZDhVVnBIUEZIVG1ZT0UwZmd6eXFLSTB2VUlkVGI2?=
 =?utf-8?B?VGdFdXF1bnlyTkRtQXNEVVllUStKYVQxZ2E0bEEzNllyNndQbUk5RHZwT0JY?=
 =?utf-8?B?aFpUZGFVRjRiSVgram41aVR0ckRNL0dreUxBV3BKdWJLUGd1ZGtOcXI3MzVp?=
 =?utf-8?B?aStENUtCNHN4WU5SK0ZrTDg5Tm5nVmd4ZG5zb1R4eTBqNW8zM2pmY1hCZW5h?=
 =?utf-8?B?aXNEL1dvd29ENE5YKzk3NUFFUlBLTWh0Y3N0M3M0dk1WN0VReUFzZVo2Z0R1?=
 =?utf-8?B?THpSQkViUEJ2cjN1b2Y0NERaM0djcUpiQSt0czRUUlFpRjVsRTIyWCtRYnNy?=
 =?utf-8?B?c1pQT3lsYURyRlNmQkxDZHMvVDN2MDBjRVdObXlaZ2ZkSjFVQWRoTGw1Qjlj?=
 =?utf-8?B?amEreitrdkhqMnhvMTFUMUd2NjNzYmpUV3VzSGMyOFVYUloyUXRQRHBGWE5B?=
 =?utf-8?B?QnFUVDN2V21pVmY0Nk1rVXR6aTBqUDZhNTc0bGtIbkFjUVNKSTlzNTMyYWdI?=
 =?utf-8?B?UHhWS2FKL1hTTXNnT0FzTVNkMUN1SlBrRXYvT1d4aTMvRHQyOFNIM2Y0ZXA4?=
 =?utf-8?B?RG8yUmxLSW9pK0JsTzlHWGQwSmFGWGF4eVNHNkF6NEl1bDBlTHVHVGV5dXli?=
 =?utf-8?B?TlpER0swc3pJUk5YN3lnREpOakE2MkNNSTlDZEEzWDRHcVFFZVNPTUtrOEla?=
 =?utf-8?B?ZWZQaTV4b21sMnFWS0ZwMG5TYmV3YnB6VEZlQ3VUU3BGUDMyRmlNZUV3bUlm?=
 =?utf-8?B?MmIza1U1R1BMVG5GaDhpblNyUmJOUDZldTVqTTI1U2RyNHJ1bUFBZjE5MXhk?=
 =?utf-8?B?ZFBESmxITllBeXdVckxxY3ZOV0JxdytTREt1NDQrS0pvek1hZ2Jtd2c5ODFI?=
 =?utf-8?B?VFdhVDQxZmpWUEkvbUJnN2I1Qm9lSWduMEpRclFYQllTSEhwRnJsVGhVYjlj?=
 =?utf-8?B?Z0VlVUxRRGZlWWhiUFU4Zy9TTFhEdnk1UzhZZ3M5VlBUSitLemU0ZS9UTE9Y?=
 =?utf-8?B?RVFhY3VJb2poRU9VbVFiQUgrcWkrSWVPNlY4Q1FIMkd1Qi9HS3Z5bC9DZzBR?=
 =?utf-8?B?ejZGR0pQRm9xVGQwY2tJdHdIamY0RmFwTFdvSVEzY0xoOTJUUElSaDcwSVRD?=
 =?utf-8?B?ZENyVkc3QllJL0ozWW4ySWZ6NVF0bCt2WXFReURSMFppN0s5ZUJSQkJtK0dY?=
 =?utf-8?B?YUhFTE5Obi90bFgyWDlKOWR1d1lwYUZNN05wVjlLemp4Nmc0R3p6NWRuQVd0?=
 =?utf-8?B?eW04Ympla1AzNDR0NTdGZWRSdkhwREh3WlZvV09yOGR2R1dxQml2allQdnF6?=
 =?utf-8?B?aEM5VnZBM0hRMDJuSHN6T3BMQkNGMTIxaFN0ZWRWdi9OcDlmQ0NLdG1LRTFo?=
 =?utf-8?B?Nm15RGVZYVlpVDJGaFdnSFlNeDR2eEdSYmx3dmZ3YnQzeVg3NVRQRkJ3K0dP?=
 =?utf-8?B?QWFnYlc2MUxDMy93M2IzbHpwdGdVRmREU1phOVo3K3dxenlVL2RGNkx3VnRS?=
 =?utf-8?B?K25mYngra2NtVG5SL2QyMUJzdGpZNVMwS01WZXFiUjJIMGRqeEI1M2MwWVA1?=
 =?utf-8?B?S25HejNPblFTYmRYYkZzZ1NGWkhTSjJlY0ZUU3MrSk9vWHJ2NUFmZ3UvaGRD?=
 =?utf-8?B?b1FvSCtFdEdoRzNmVCtVRnYvMmRJMEVlU3loOHF6TzluUk1aSGtNQW5lTjNv?=
 =?utf-8?B?VS9OZzFwcXJaWkhnc0VRUkpZdFpYOUd5QjlXNnJtcHA3WTJia1pESlBObnFp?=
 =?utf-8?B?R2hzRFdtbFM1UXprQmRyT0FFaUtsMU8rSXRjRk9SMXBjdHB2dXV1MHpjWGE5?=
 =?utf-8?B?bGtBWHlBY1ptVGUybGRjQmFsd2pxWW9wMU5PU3FPejRkbHliOStmMzlXbDFV?=
 =?utf-8?B?WUdYd2tIQis2MVlRYVR1Q1h0SUlRdGdxNEtLYXZxaHlRV0czZ3dVUS9Sd25i?=
 =?utf-8?B?aG1IclpEN2hXaWxSR0VDS1M2RWh1S2lObGFsSlBDZEJEM3BtZEpmeGlVRUZU?=
 =?utf-8?B?TjRlelMxa1VYZklXeExGaE9BaGt2ZU9ISDNHR3JlL1QwTFRKVjFBWGZ5alcz?=
 =?utf-8?B?NjlBNEVEVC9BN24vd3VTdDdIVjZ6QTg4SEhuZFJLRXNaL0dCZjQ1eHFLczZj?=
 =?utf-8?B?WFNva2Y3WXJUbUJZUlZGZXlod1RNc3Exd3hmVjNGY1FFMy9LbWJJMEQ1dlJN?=
 =?utf-8?B?ckNmQmwzVkNCdDJLdmw0MEtGd3lLTVE5UjgycEZDZ3BadXFnRjBWNDNxSG9R?=
 =?utf-8?B?NFFoT2xQL0xBVllCcC81aUZHZUJrU2UxN1dkQ1FSNFEyeFN1ZGxpNDhrdkNx?=
 =?utf-8?B?WGt6L2thRFBMaHd0Yi9Pd29nRHV5eFhWZkMrQWpBanFGblRwOCtOTlkvbHpV?=
 =?utf-8?Q?xSd0WyXfaeppfDug=3D?=
X-Exchange-RoutingPolicyChecked: UcgsjbV6xnEZhcdETtMJ/26mCZ7rDWrqY/xKL57XGfx3n4okFUcgpdZQT6Ow7gauhgDCGI1eEaocFr5dCqLzUqyy6Pzk4z9eyR0bI2BgN/EzIECljMv+BFKiS4VUbCqaG81cUAATzB71OceTpnyGRV265J2NgoDzv+e2jXogHDUaApDTrsb/+AmCgGaMuqi5y/9Sz2GDhdzdEIxb8r+QSH/bDfM28JrVFRCivclP6cC4C+s1MV67tK5MScZ7TdlM00t1M6dh8cBzpX4s306VZlaMY7T3/dAK9dDxqXa2wv1OgqPO8fDUIChw3+ZCpnAtbPB14apc/4yKzfzoP0BZKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c3f31b-0904-40ff-23ea-08df12a79c18
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 21:32:00.0263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9w6vWrKb8kifh6YzmuVxqNM59PE5B/DUvfudGADC82LijAqqzfasH+6FdYkElbd9S5bcr7DmFAfcWibByl+Bcq0cWwvqslXBqTOw6n20uow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB277206
X-OriginatorOrg: intel.com

Hi Babu,

On 9/14/26 1:45 PM, Babu Moger wrote:
> On 9/11/26 17:25, Reinette Chatre wrote:
>> On 9/4/26 11:06 AM, Babu Moger wrote:

...>>> systems with limited MBM counters and breaks existing userspace that
>>> assumes the historical default mode, including the pqos tool from
>>> intel-cmt-cat [1].
>>
>> There is no record of this breaking pqos. *you* created [1] *after* you
>> submitted v1. What a strategy! I mentioned a couple of times that this is
> 
> Agreed.
> 
>> misleading. Since you insist on proclaiming "we cannot break pqos!" as
>> motivation for this change you have to also disclose the consequence of
>> this change on pqos followed by motivation why that is acceptable. Specifically:
>>
>>     https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com/
> 
> I can provide output that demonstrates the issue, where the event counters report zeros. However, we won't observe the large counter values because the hardware resets the counters after reallocation.
> 
> Will that be ok?

No. This is not about hardware resetting the counters. This is about pqos not handling
text return values, for example "Unavailable" and "Unassigned". This patch only
focuses on pqos treating "Unassigned" as 0, but in "default" mode "Unavailable" will
be encountered and pqos treating it as 0 is more severe.

Consider a scenario where a counter is re-assigned. When user space reads the event
value then it may see:

<return A>, <return "Unavailable">, <return B (larger than A)>, <return "Unavailable">, ...

"B" is computed by adding the new hardware counter value to A. As you indicate, hardware
did reset the counter after re-allocation but that only means that "B" is no longer
accurate. "B" is still returned and it is still larger than "A".

Based on above, pqos sees:
A, 0, B, 0, ...

These jumps between bandwidth counts and zero is what pqos perceives as wraparound that is
presented in the example:

	https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com/ 

>>> For example, pqos mounts resctrl and creates 16 or more monitoring groups,
>>> using two counters per group (mbm_local_bytes and mbm_total_bytes). On
>>> platforms that provide 32 MBM counters per domain, this consumes the entire
>>> counter pool. Additional groups cannot be assigned counters and pqos
>>> reports zero bandwidth for them.
>>>
>>> Leave mbm_assign_mode in "default" mode during initialization. Default mode
>>> can support more monitoring groups (up to 64) than mbm_event mode, which is
>>
>> "up to 64" - so it may be fewer than 64? What is guidance to users about
>> how many monitoring groups in "default" mode are "safe"?
> 
> It is 64. It be more on newer h/w (don't know exact count).

Should it then read "64 or more" instead of "up to 64"?

...

>>
>> Although, the earlier text is "up to 64" so above attempt at guidance may not
>> be correct and there is no knowing how many monitoring groups are guaranteed
>> to receive accurate counts?
> 
> That is correct. We can get this count by assigning counters
> iteratively until an "unavailable" response is returned. However,
> the specification does not mention this behavior.

This is about determining the "magic" number of RMIDs, not about counter assignment.
User space does not do any counter assignment here. In this case user space can create
monitoring groups up to the maximum number of RMIDs supported.

...

> 
>>
>>> +    remain accurate. Creating more groups than that pool (for example 64 or
>>
>> "64" -> "65"?
> 
> Sure.

This would only be useful if all hardware support the same number of magic RMID though.

> 
>>
>>> +    more) can cause hardware to re-allocate counters
>>> +    between reads. Bandwidth values may then be misleading, or reads may return
>>
>> "between reads" - what reads are referred to here?
> 
> "between two event reads" ?
> 

This is unclear to me at this point.

...

>>> @@ -474,8 +484,8 @@ with the following files:
>>>         Determines if a counter will automatically be assigned to an RMID, MBM event
>>>       pair when its associated monitor group is created via mkdir. Enabled by default
>>> -    on boot, also when switched from "default" mode to "mbm_event" counter assignment
>>> -    mode. Users can disable this capability by writing to the interface.
>>> +    when switched to "mbm_event" counter assignment mode. Users can disable this
>>
>> Why is this change necessary? It seems to drop the text that mbm_assign_on_mkdir is
>> enabled on boot ... but it is still enabled on boot, no?
> 
> Yes. It is enabled on boot. It should not be set by default. Will update the patch.

This is about mbm_assign_on_mkdir that *is* set by default, on boot and when switching to
"default" mode, no?

Reinette


