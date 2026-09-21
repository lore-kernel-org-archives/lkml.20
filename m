Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C54A64CF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003968; cv=fail; b=pHzvV6+upsoKs41FQv6yp78fl+IdL61a/g+MeXgFuBmp57X+EzrfVSbqkVfPdQ17CyZPkdnuGtGAAFiznc+ikBrKzkats4OXGe2JV7YLroqi/SkT9K1Zloxt0MjIi6OdDV9vD8r0hORv9aebkxtf48r/6BA0wCa5QvMoGLcm7T8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003968; c=relaxed/simple;
	bh=2pBlYxegan+X1dx3uSJIS33/i+rPRQS37bEydddfO9Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qscfDPbuumY6fIGCOiFujGAB1ubMWKwylQ9EiT/SiFn1SiMs/IoQn740P5A9At7QUqKsiBB2QQDzQTAjj9oB/PXONEqQ1IdiXVjoJUchczWP5+vkzHTO4kg4UKHd1Kzu8i26vDFkoFUD2BAyAhWvFWj1X9wNOfb5CgfiDFV0XH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A01QkI5p; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A01QkI5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790003965; x=1821539965;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2pBlYxegan+X1dx3uSJIS33/i+rPRQS37bEydddfO9Q=;
  b=A01QkI5pGxwouMOMCKhStCWWfSd20OI2Eb8BdxCsxgfa83s2HhktyKlP
   t2hipJKA6R94hfQTYM7Nb0lGUFrR48oPmGP26fh9/i7W5+7d5CP5o7+ql
   xuFHpvgQh/oIFxwd+6rLXuVrH1jtNGfOv6D5H0NwJw0pztzTnpTJYNvqj
   isqoCO7YZJTobSU8UufEQQwbjCRn3a9/dxiBUf2+eS1Ile5wLu1p8UPul
   TqybK+pKPSr/YaJuyGaHOpRZ43suqvMCsyFVrOZ+JCqXVf9N8OZE8TQez
   Gyoxb8LpwUrBcq2ljdHqdDF6I6RjVkoetHFplRC1Tg2C4BlSd/Yhspk2m
   w==;
X-CSE-ConnectionGUID: GoH+dbaVQn+ACmBVbBFAnQ==
X-CSE-MsgGUID: 9YmDLw7PSeyhP92Mgf+CqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89661493"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="89661493"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 08:02:10 -0700
X-CSE-ConnectionGUID: p7ohyNyFT5C8+ufN9HNu4w==
X-CSE-MsgGUID: txkr0yyYQM6gH5eE3iRvjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="271866888"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 08:02:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 08:02:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 08:02:08 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 08:02:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibfClWpnhD7Rj0wp6S2S0/v6MhSe9dcxuCRs0iRa/U0VUM0w7H+ncOPShObUkGynlH2s6yBucD15mhZuXCtK3JpVQRGphq+JCuG6nSCoZBbOZEV0ccE7t4+6SmqokS6N1dRnQuNIOAb1f14ogIpp8ZnJQ6bSKK3jxYcGybd5zF1hQW7pLQ1xcHrZrX4co74ycPgV2QaDvKsxK3b5jxQNwQ0FR91NH9TnQhNlF12c1QdV651x7xTG2080QcPSf/bifCqsMnw3E9ZIiYwDGysA3Vz8N/+DpY2hL5pyiGtM9A7cO0MN0fVc6cENxNmQOtPzfSPkrRCCeVRBcoFDOwvMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLR1qVvrUipg7id5t4x+hQc9A0+2x+ckLzff7F2yIlk=;
 b=Uv22V8+eBhjTakjhbPuAyrkaTTS7/iwQ1gr/CzS2EaP04fhJqshog2saW3tCbxca1fnF4/5PREdCgNlcbZt0rTVudX4ugrsFYE00F3fQF4I11SrITb4tgPN8fI102gG2ezJbXhTbVu9f+Nz4L1vjYVHAA1PsMBv1JY3r9dWXGTihcKwB8TztytQz6SxExM/DWCrd/YrEofdhL8Q7YAQG/5FtR3b02Z6XsnW3gU8tvAsX7pWyvZ+P/aKx5rwyA6l0hKki0Qyve0cKi6sZT2ElONJeI/3nPfETfELP+ROBKQyF+I0I6DddGKhJyVYqiCRFuC/NoPOa2feG3rA1Q6oKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 21 Sep
 2026 15:02:01 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 15:02:01 +0000
Message-ID: <0a38668f-ce14-46c0-993d-6c2286636cb0@intel.com>
Date: Mon, 21 Sep 2026 08:01:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: "Chen, Yu C" <yu.c.chen@intel.com>
CC: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, "Thomas
 Gleixner" <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Newman <peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dave Martin
	<Dave.Martin@arm.com>, Ben Horgan <ben.horgan@arm.com>, James Morse
	<james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, "chen.yu@linux.dev"
	<chen.yu@linux.dev>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <9e38f138-7872-445d-9a11-105f9d0fa4d0@intel.com>
 <07a79f5f-ad39-447d-b43d-01e44c7870a2@intel.com>
 <e859ba7a-d488-4c35-b0e2-fc88cdb34f29@intel.com>
 <ef14b978-1b58-446f-b07a-691422220cb8@intel.com>
 <aqdguFLXpds-FrEW@chenyu-dev>
 <da618b0e-aced-42b1-8497-61ba4b0bb973@intel.com>
 <1511a82d-4c1a-42ad-9b2e-7def751d2824@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <1511a82d-4c1a-42ad-9b2e-7def751d2824@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:303:16d::10) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CY5PR11MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: 75cba5cb-bcbd-4d61-5f74-08df17f14a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|10067099003|3023799007|6133799003|4143699003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: HBJndhVxZEF3Dw63GYJMpi5D+N7wG7AzFPJYBosL/Vhj0DaT4t2uvOXEfMamgr0JSkrKWbqh+Vhj0yo2JBux2vB6R/t2NmqvwYJ3aCM4iGdrWzbnzAVtsEcKIhUuxJgNCqM1ZoKxmf1p9TDyAJ2BGPXs0UiQQ0tbbAg97PSphHXjMxSMknO72bJJ2nMK71BPMnmhRckmJLlwrAQT2yizrl98wgyLlIJtGC/71tBR8wbfwvaemkAe9zm25oqlYsZTyi7HbCIN+CLqYJnfOWRz2NAqgPMca5AwX2Aj3gpcmFz22Cg8XXl+I4HGo1ipRbr2GaT4NYFk82FplPE7LcrDuJ04Jo/+MDZGWRJkewiwDS6cPIgSzWTWVkUTMYI/OD/xZXSu+aiTZnvSZgloHU5Fwcym+TWE5VSeVusOMGnA2MNkVcIwoHWm8ehIrTFSh85ytwyKWbsM/+fDFNbBFy3AWbQE+nD3iWxdh5LySEzFnkK0Oz6AE4M4leJdSzFoxRGQGZhUzEdjBjw67Ubj+8c2PZ2mvNkICs/IVzADPBrwvctD3qO5BNgmdxxfhY0eOD27/4B3cKteir4DjPLtYZ6TEhcOKXgy/qFDosqa04W6XzcD9mxQabUsH+dy0hJvBLtp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(10067099003)(3023799007)(6133799003)(4143699003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGFQeEc3UWovUlFxbkY2RFBlWGYyOENQeFRrV1Bmc1orK2xycW9sNE1kUGFL?=
 =?utf-8?B?WXJCM1JVWjc1dGZwY2ZvUHRqcEM5NkE4eGhyWVdEMThaRk0walNiRXJyd1pZ?=
 =?utf-8?B?VlJmTXQzcWl1MFgzMCtEZW5GZEdQQTMwVDh2ODdya3hvRi9uLzhQdGcxQ1Ri?=
 =?utf-8?B?WHE4N3IwSzQ2TkRUakp3ZlpYNk56dFp4bGxaZTJYVXJaRTMxaHRGclc4MFp3?=
 =?utf-8?B?dk9hTFdTeU50RDlwcXk3cVIyMmI2ckhxTXJFYWhXUHpBVkg4VFhKV2Y0NE9y?=
 =?utf-8?B?V1NUdHM5bFRmK0RsS0FpQ01VcStaTkxKaUIxYnpOUUNwYnkyTXB1TnhDc1do?=
 =?utf-8?B?UEhGeGI1dnhyY0JJdzNWRVV4VjdrcGZISVZoYjd3KzZPdmUvYmhzOFZraDRm?=
 =?utf-8?B?ck5NMUYvMVdVaVF0ZVN2V00zM0s3Z3FFQm9SN0ZZOUZtRm40eDNkUGNnMUQ5?=
 =?utf-8?B?TkZNamJ4Szg4eDljUmE2c29QcnlUSElQMkxKQmNNVmNMMVJhRmZ0dTA5TDVm?=
 =?utf-8?B?WmZmNmE4d3oyTWZxYW9YVWgyayt0NEVsNWdJb0FYVENVUWRNRW1HQ1IrcVhQ?=
 =?utf-8?B?YjJEZ0I3OTFoTWEyNVdlcVZlWWNRQzExaUVkdEh6VkJHMUhkVTEzYlBXNmNL?=
 =?utf-8?B?T3AvMC9SZGVKdnFONkhqMnhEaXNUUE9oeTduOGNPV2ZDZVQvclIwL2NWaGZW?=
 =?utf-8?B?cFJCa0lkczlQczk0enU2MlRKUVZGZ1dDWkZNSzJjRytPZWZZemFpVC9rVGdZ?=
 =?utf-8?B?a3krcVc2dEM2OGdiWXBrRXlRSnFBaEJhRzA3Y2dsZ2NacFEwRUJETWlsMVgy?=
 =?utf-8?B?NGtTT0NWVVhNOEM5dDBoaXl0Mmw5TTZqVDVtZFg4Q005RlNKdk5Jb3RZdmVB?=
 =?utf-8?B?U2RQZnpQOXpDRzVkZ056NmNXcXJYQUtoeFNkOVc5a0lkU1E3YlhNYStPU2JE?=
 =?utf-8?B?TG9VRjh5LzlaRy9MeERVMXZYZ3JwNlNuTUlySEIwL2Nxc2ptUGZPMi95b2Uw?=
 =?utf-8?B?bHNGbG5CWjE3OXRhQUovRjBFS3gwcWhnM0dMcWdhZmgvbmovdE9vZk1ZUm5M?=
 =?utf-8?B?azlVdEIxUFJiT210OW1rSFJYNTd3Zk5CYUpzUzhkeWhvcXhsMjBtbnZGWWEz?=
 =?utf-8?B?eW50ejdrdHR6aGlkVG14S0lpTStId09qUVo2ZW02TnBjZUtmcHdHOE1kTEdU?=
 =?utf-8?B?MzZiUEpWL3F0MTB0bXdZOWNka2hlVzhOdWxlNHExQ2g2ZFlTaUhzVndxYk5Q?=
 =?utf-8?B?MkhrUXJEU2JoczVmclFHdTA5OGlMbEo2T1pYNjVMb3doR1Z3bnJRcnNZRkhT?=
 =?utf-8?B?SEIrUXVkb2txWDNlQ3pLQWJTR1ltZmREb0JkMTBmRXd1Rkg0TmV0NEwvRXBu?=
 =?utf-8?B?eTZPSXA4SDIvOTZ4RGdRWDI1YS8yRnpjNzNocnBHczZ4NitwcUluMmk3NnlL?=
 =?utf-8?B?WkIvWXRPM0tKVWlwSDZyTmk4czJUbEkyazMrd1B2WVJKY1NVTWJDOGtIWFBl?=
 =?utf-8?B?d0xpQlQ0Z1B4bGQwSzR4bEFsNUdoN3JRUzFIdEdlalBqbUVTTHBJbTYySVZU?=
 =?utf-8?B?T09qbCtzRVFXS1NjVW8wcmxxWjJtKzNNRVhkWVRnY2tJYUQ1TEovUVdtZHEr?=
 =?utf-8?B?Ry9vOE90c0d0RkRzcHU3M3dPU2kwRFV4bElFQzgwaGpMUHIzTHdVTVdZUksy?=
 =?utf-8?B?MitsWVZrS3ppblV0WFMwQ3ZsR09Sc0x5NDdYeDRwdzJURUtOaWF4c2FrNm5u?=
 =?utf-8?B?bEhIa3FtbDQ5S015QnBiWFJ0M29yWHV6bEZmUWJLeXJxR3pkWU0rSUZHSHo5?=
 =?utf-8?B?K09RSWQySzdvbEp2U2JTdWZXS2o2QkhRem1UZmZmTXl1bTY1QkdYNFhGNk9x?=
 =?utf-8?B?SUlXRi85T0ptYWxBZ3ovMEliQ0R0bkNHaXNWdEsvVHJQUitzVjRQcjNUa3J3?=
 =?utf-8?B?R0hPZ3JiRkU3eVBZSU1ZdW1iUytOdVFTMFNxNnpVL0RBdktXYzRjMWIybS93?=
 =?utf-8?B?a21hREFZTVJrVDl0N3h4V3NFc2VuYUE2dkRLVVYwenlnd0VzK2NXc1lMT3cw?=
 =?utf-8?B?TGphK3d4NjZlUFcxdk04OFg5cEJjMkRrR0d6Q2dnd2xlVDY4SC84RUhJcjlV?=
 =?utf-8?B?MGNRMXZnaXVIdG1zWE15c1dTdXBEN3E4bmx2NElua0NGcTEvbE5RNjUrOGJ1?=
 =?utf-8?B?TzdNSGRUZmZYQ25HWjArNE9KR1ZSczFpNE1QbkZ2aE1peWkzdk1SZHZXTnNh?=
 =?utf-8?B?dnFwSS9KM2xxVDdMQzI2SkxiNDVGWVR1S1ptZkFtZ3ZWQ09vWG0zTEt3Q29k?=
 =?utf-8?B?Z2JTVzhac2Y0MlVQMTVjUHdGWG55RFB3eXp5TUpIYVJSSjQ1bWp0QnZHMFFs?=
 =?utf-8?Q?r1dMT5UJjh6AMqRU=3D?=
X-Exchange-RoutingPolicyChecked: sZDnQH00lK5UuRRuK01o1mBAzDBNFH7jlhvEY5/CQUvjOaX1dN93WSMVbZvTGnZXMzRoYEpoi1L/8SCb2s8GRfQrR7UOAsPSIAnwLOgOYeRNEdiYWtdEGNx1H8W4iiNgqKZXwTIj8BPm6GH/uSbh09jbVuFhONmUwmFw6mXwcQkVJLr2sPfBbnfR44f4i/6e9kXmCUxeGFjmR1+9i3yy2+Ob+2kW9VW2bTU3GHQolosKORv3wv5cFYNsapYGuWuNvJJnq2TWWY0Ye0AfE3D/MoghtYxiyXmH7cAgprfMP4Y6LMfcJgWN6squKrp/y0ZTa0G1+6UrzIcZ1EdhJdAieQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cba5cb-bcbd-4d61-5f74-08df17f14a6f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 15:02:01.6014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8BuflybNc/zROShthuvJJx41zSc9Z9sizV8VmkY+eIXl6NJ4AiBkQI1qXdJevOFmZmCwa4EFkLphfu8cB/FfbSv8s2hpmoO1pOAc9GbaMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6161
X-OriginatorOrg: intel.com

Hi Chenyu,

On 9/20/26 10:13 PM, Chen, Yu C wrote:
> On 9/19/2026 7:11 AM, Reinette Chatre wrote:
>> Hi Chenyu,
>>
>>> On Mon, Aug 10, 2026 at 11:09:31AM -0700, Reinette Chatre wrote:
>>>>
>>>>  From user space view "legacy" is the existing percentage based MB control
>>>> that user space has been using until now. The only way to support this "legacy"
>>>> user interface with region-aware hardware is to use the MSR interface, no?
>>>> User space does not care whether the hardware uses MSR or MMIO, it just uses
>>>> the MB interface.
>>>> That is, as you also say, until it is possible to map legacy control value to
>>>> region-aware control value at which point the MMIO interface can be used and
>>>> user space can continue to use the MB control without interruption.
>>>>
>>>
>>> While looking at the context of control_mode under the info directory, it is
>>> currently used only for the controller to switch between "legacy" and "native".
>>> However, there is also an explicit requirement for the MBM to switch between
>>> "legacy" and "native" TOGETHER with the MBA.
>>>
>>> According to the RDT spec 6.1.3.1 RDT Control Register for CPU Agents,
>>> it discourages mixing legacy MSR for MBM with region aware MBA:
>>> "It is recommended that software use Region Aware MBM when Region Aware
>>> MBA is enabled and vice versa. Mixed mode use (e.g, legacy MSR
>>> interfaces for MBM with Region Aware MBA or vice versa) is not
>>> supported and may lead to inconsistent behavior"
>>>
>>> That is to say, I'm trying to add logic in the code so that, if control_mode
>>> has switched, the corresponding "mode" for MBM will also be adjusted to the
>>> same mode. The code can enable/create both legacy MBM events/sysfs and region-aware
>>> MBM events/sysfs during bootup, and make one of them visible according to control_mode,
>>> similar to what Babu does in PLZA when hiding a file in
>>> https://lore.kernel.org/lkml/f7bcf19ac8113a1e3d9575739c1a6400c455ce6d.1787772750.git.babu.moger@amd.com/
>>>
>>> May I know whether this approach is doable?
>> This sounds reasonable to me. Since so many changes are between current resctrl and those
>> changes it is difficult to envision how clean such change would be. We should aim to
>> avoid sprinkling "if ("region aware") then" checks all over the place.
>>
>> A switch like this will force "region aware" to support the same number of CLOS/RMID
>> as the MSR interface. Is this a concern?
>>
> 
> It seems that taking the weakest link (minimum) across all sources is a pervasive
> convention in resctrl, which can be used to avoid out-of-bounds CLOS/RMID access.

Right. My question is what is expected if a resource supports different number of
CLOSID/RMID depending on the interface used to manage the resource? More specifically,
resctrl can now interact with the MB resource using two interfaces: MSR and ACPI. Each
interface separately enumerates how many CLOSID/RMID it supports. Thus, it seems possible,
that the MB resource may support X CLOSID over MSR interface and Y CLOSID over ACPI
interface.

resctrl exposes the per-resource CLOSID/RMID to user space and today thus needs to
pick whether it exposes the CLOSID/RMID from MSR interface or from ACPI interface and
that will guide how many resctrl will support during the mount. As you state resctrl
uses the minimum. 

If the user has no intention of using the interface that enforces the minimum then there
is no way today for the user to indicate this and thus obtain benefit of all supported
IDs.

Can it be assumed that a system that supports both MSR and ACPI interfaces will enumerate
the same number of CLOSID and RMID on both interfaces?

> If a future platform does not support the CPUID/MSR interfaces, we can only rely on
> the ACPI table to get the max RMID/CLOSID.
ack.

Reinette

