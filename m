Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD825475355
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465764; cv=fail; b=nkcXbLXuiaJ9bEyHRPE6Tz5v6AYNLBYcjBsruOqWEfIHmx+h1lXUWN32aHrj/ZWam3XB9E8UGPOvoZbMNcQO+zsyzHB02+jXGZqP1MJBeMVshbY2AWSwYp6Fb6VNNOIcZMKschFcenC1M5c28sk0+tpaI59Nlk9xMtiynDjs3Xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465764; c=relaxed/simple;
	bh=F1+EOcmQmH3i7J0kPA88CyxSEOuVe4JCgs0/KZ+jbUM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rE11SPIO6TlgDIALB4DuVtkjjbXqNFnutnb27CnnHj06FYbZ7+vcOD3O5dffWKgEQUq5EDpQTaIFVJIWPRoWhJZHHw6heShT9QJ1kU/E70lyV+P3mns7EqNfkXb/dWtOISbVR7Az3YyKXKPMu7odRI1j9V0qQ8IoeP/W3yVgdt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXkjQvsL; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXkjQvsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789465762; x=1821001762;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F1+EOcmQmH3i7J0kPA88CyxSEOuVe4JCgs0/KZ+jbUM=;
  b=GXkjQvsLfGcSXDmGTGF/t3X7HmE0KfysZdZpyFX1/3yCTX5uJlDerOBy
   eUSUm7vctkLiF4pwr/nDb/+gerpsBxyNWkSBMVlWgPbLHQhBP6FAMSmPz
   /Tnsj8odvpW23kcW/K+VUzgOG766/VMJ6bTKDq8BJ2bAWL3/UAt5+4lM9
   QuJOE7NNMpf+/YULukWwIBBbSSz8EywM+g9q8Lq42C66zpR+IDAgKvBY7
   cTxz8yEzN6fAN5kNkhU9NB/x6TmHG862bfOLR+1Jp31h3rZ7UsT2eBv/S
   HjxnJyn5+dMezKLaH8NiWnwvqScX+gyXQb+o2Z0AsCxWpN5o0jwB8AuIh
   A==;
X-CSE-ConnectionGUID: 7baJ3AugRuCnbTDAzdWXDw==
X-CSE-MsgGUID: esHiE9rbTB2wGQHzdTZoFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89583947"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89583947"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 02:49:21 -0700
X-CSE-ConnectionGUID: 9rME4xGVTdC4xx2ySQ/H2g==
X-CSE-MsgGUID: 2dH1CdH2SJ6J5ZuVyx5kCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1327214"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 02:49:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:49:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 02:49:20 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:49:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0+d7kGFXTv3gT2Z1RhygbuhvuNZUFZln855+qH0YGpBDD7ciKs6tTymcfcxLziFc887tUKsHP3SYxmtliNcgc41x4Xapbxn9POaRy6hwyBJLi0vFFavbpJYdLgT1M5I6QPwcY+1U/5ecI6I6NKPVH0eJ6s9bwHW+VOttf4g6rpuRQmsQjJdjC+/Iv94W6RFCs1QXCTrmNpZRbNBI4UHbZakV0Gy9oLaYe0ZjNntlawluJacjTmLdgqkthyQRvarNLrMW4S3Naq28LS1ZM4+gmiWXJF27nYSu99ZxcCV/e58krQ+P3FCIOyn/qGSevaj+pEFpjUcmH2NB2C0Maz4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duCtv3nN/zuMOdZUmVZKoN1aZ7FIds26zisKjo91df4=;
 b=RgXnIlalYWNFx4DF1YJSBZ/bdxWPGIJQ+s+sY68E8PYMN7IvaXQcjbgFl4SW2otWCU8KUXhZyBr5VCd+BEPP0/aUrp+zERTu4yIxqt6jtkSZliutQfRdVMYPcdErwYPHstdQA9X5sv4wNmQPzBNa7EM3eLboY8Y0wiSGxwieXrG9PTl+wNxlls1ZF2sk3OhuABbP5jeSktfnGptYmnZ4wJgEchfQnIIEKUER2BLsQR/hHI37otpnkFgkObHHDH/K2za9F9ctLbN2WEuDW088rRAFKveniRZvEOeoc0DZ4aTlj+Y5b/sJ4ePOwSeR7kAv1J+PlNj3yxB+ydC6z+sQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA1PR11MB9636.namprd11.prod.outlook.com (2603:10b6:806:4dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 09:49:17 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 09:49:17 +0000
Message-ID: <b8737b87-4dca-4d49-916b-f8e468e74a75@intel.com>
Date: Tue, 15 Sep 2026 12:49:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Sam Agazaryan <samagazaryan@google.com>
CC: Frank Li <Frank.li@oss.nxp.com>, <linux-i3c@lists.infradead.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Vitor Soares <vitor.soares@toradex.com>,
	"Oleksandr Shulzhenko" <oleksandr.shulzhenko.viktorovych@intel.com>,
	<linux-kernel@vger.kernel.org>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
 <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
 <DLC6ERLST1B6.6K3HLH38DQLK@google.com>
 <5fb77c2c-40b8-4dfe-95d3-e0c73b8559bc@intel.com>
 <CAHreonHEAPrzhVH0AiAzrZOr+h8D=T8hB_oC0TP50d79y_OWSA@mail.gmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <CAHreonHEAPrzhVH0AiAzrZOr+h8D=T8hB_oC0TP50d79y_OWSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0086.eurprd04.prod.outlook.com
 (2603:10a6:10:232::31) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA1PR11MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: 53222282-7cb3-4af8-0b79-08df130e9b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: luYF2o4G4OnP6NI7DduxCF3RT1XBJMmJO/BIWIT6idmvrEo3tUhAYnQDaArn1wi0GDcPEjn9oZbWg3zR5UeQTOm9hy39ivm8uR44jJz+eQR76aiemSHYJoNLWRrA1ZjTZWk15jtIOr22pc1TefrqERO29UCyJLM0VhG4sQtevpBpfxERoLkFWdWTry/VF7Kt5z5TfxXdA+Hz//0eO7XPEoFPryt3WuYk5fgSaxH9AiaDm7oMGBKF4E+66dAVmkbAzEi2QdP0Qv0VnIGzzkvHzRq+g7KWEd+HP6QT2kYN/EPhtkE8WrfxH3OgUT35PfGq1Q6CkiuCPr1u9SfWG+mjdD0AIBYuqxKJj6h4MJtIc4lJPOPM1ES4Wi/WQRXU9kjiBncMhkJS4uiXHtzozkyatinXieYkMgAKht1NNH7rkju0Bctq/5CBDUEaOTc8g4I8ROxm32keTH9vH9RmoeP/0HhfLR7yQ/zaaTyoxsBTvIEylXtsgbzv+BrFRYpadEmufGMiP7X1BlPQPsRGqnXF/nwYHnRFqTWOyo5PSxbeb1xfZX9glrV3G7BBI64guwsDadWg9hRtOlcQg1PsOoSmtnRS7b07dieUFOYBIwQxuymHlVbTrhrFwkstmesB7dRL7XPWlfm0yGPJZyV9N9Qf1yviYENp0QPpJlNP60nkKQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHFxVDZ2Znp1SGw2cGtLOXpIWHZUbEw4Z0lsV1E2bTdUdjllWVRLMG9TUGdl?=
 =?utf-8?B?b3FUeFRrZ2hYbEUxOHc2a3VERCsrZ2htOGtBY0dMb1FCZjVJNlJGZ25iV3FK?=
 =?utf-8?B?OHkzZXZKcFhoRzlUbVhGcTFvblRhSFIvS08weTFYVDd4SytWVmROZzJjUlQy?=
 =?utf-8?B?eHhGcGVjZ29FTi9yMnkwdityWmxEYzcvNldEMUU2WDVGM0VkQkFRNmVQQ0s4?=
 =?utf-8?B?U1hlTkQ5Q3ZDRW1WazFkRnMvY1NKL1laSlBUZDJCU0N0c2s2SXpLb3ZtK3VK?=
 =?utf-8?B?YzkrWllUR1o3VEJtSmp0bUhxYUVvOXRvUEVnNytqaDhwcTdSMmpoNURBeW9s?=
 =?utf-8?B?QlQwdmNPOUR5cU9jU1pDNGZicjF5cUZjcXlFM010dzJVK1Jzb2lUSHBSQmwv?=
 =?utf-8?B?TWwxRUc4Q1VUcGxoSG9HT1h6OGpuYW82VkhheFFuaEZBR0tvQ1VJbEhhbG1x?=
 =?utf-8?B?cFluTmduV0hnQnJrTytrbVhzTjd0dmY2Q2REdDBnQWlsVUxncGhEbWRtUm1H?=
 =?utf-8?B?LzVOUTljcEltcjgzei9CZ1JnUG5lS0tUR2lxejNoYjZHZ1hUSlgwSy9vekhk?=
 =?utf-8?B?QmpNS3poWmFJa1JGNjJ5b1lyZU42Wi9mdzdVdFVjb1J0bnVUVGhJSDJoSlFD?=
 =?utf-8?B?a3BodWoxMnVGMDNCVkErMnpoVzRKTy84VkdSWHpDQTdSbXBoNUYxZmpRUGtu?=
 =?utf-8?B?NDNFNDdFcURWUHp6aHlybkxaVUM4QytDTjcxRG13VU0zaEVuVCtaUllNVjJk?=
 =?utf-8?B?dkNiVlhrZHg4T2F4NlR0UkgrSDVERUdyL1hBNWRXa3d3TnlpcE41ZldOQU54?=
 =?utf-8?B?VDlhYnpwOUZkRWdFdVpxWVpEU245aWNSNHFObzBDbnVFS24vTnM2SzJYT1cy?=
 =?utf-8?B?WFp6WkNHZXhpZzc3YTEzYWN3bGsySkNZVTlIbDlCdHB6TmV3TGM2dVFtWDdK?=
 =?utf-8?B?elhpL0h3dUUxM1JweklHaWJhTERHRDB0M205UlcyalB0YW51Ym1ITjJBdUww?=
 =?utf-8?B?UEwxQ1Q2MlZUSkc0M2l0dnJIV1ZZQmlqcElDeXhkSUwrYUFienh3QnlGVHkw?=
 =?utf-8?B?VUFFQ1AwQnpNaUdVSWhoS1FMVEZmZ2tjenFOL0EwWGloV3NCdnVtNlpLNkVY?=
 =?utf-8?B?alUyeHJEVGZzVm1YbU40eE0wOTlRR3JoeU93QWRmRytpNEgyUitZT3FlczRZ?=
 =?utf-8?B?bnBwV0hnRDd0OVBJUjRsQ0NYeG1yaHZmT1R5QnZ1WU9IZ1pFTDBSNS9zM21V?=
 =?utf-8?B?d3RNdlNpQW9DVmxZR0s2c2VVSWRzY1orVzNTS3hEcGY3NEJaSHRJSC9pSTg5?=
 =?utf-8?B?VnpRTXdpcVZCbi8wRnJDV0hNd1N4eVZJdWRsRHBjaG9CQjdnM2svTmV5WWNv?=
 =?utf-8?B?MU03UW1OZTZnVERMTUNwQnhXdWJkbjlsMVhRK2pzaEhqT0ZtRWhEZGFsR2M0?=
 =?utf-8?B?NjZQU0RIbytlSyt5VTBsYmZhb3V0N1pCMUU5RzduUE54Qmk0S1RMZnkzYmM5?=
 =?utf-8?B?UjVydVpkNm5kaHpFUExzM0psU1JPMlA4eDZnRXEySW1BLzhFeithL1lkTGZj?=
 =?utf-8?B?R1dWSGJFMGZQUmpmT1hxb08zRkZvY2Yycm1hYktLMXRxT216dVBRT0ZOWlJP?=
 =?utf-8?B?akdBZlZJUURwMGdpd2gzNHNuOUM2UVdiK3RHYitDcThqRzVNSzB2TVRyWE5X?=
 =?utf-8?B?Y3VXbXdISlpoNkxGb0owRHlrejc0NzV5V1U1VlB6OGtpYlU3RGhWZTJRMEtj?=
 =?utf-8?B?cnk1SHN0SXo3a1psY1dYY3NVMkNXb0REVWs5dUtNc3cyOXp3ZVJEZ1NnZExS?=
 =?utf-8?B?cmRLK3ZPV2xuU3ZrcXplUm90ZmxPbTVSMXJ4eS9GUlZ0Sy9teW1zbEhVWlNF?=
 =?utf-8?B?Z29LRG5qV2pnRW01RGxVeXlsL2pCYnBjSXZOUmRtWlJ6am9za056d0Vwdk9h?=
 =?utf-8?B?eTI4bEsyODBndGU2ZTk0b0xIbCt0RmR1VnBTYlkzQmswU1NUWm1CTWR3Rm9t?=
 =?utf-8?B?MnQyYUlxTjNZM09WOUdTMU9KSm9zM2pOWjFIYno0c3pHRmJWTnU2RDhYaHk4?=
 =?utf-8?B?NkRPUFc2OElYazVqcDNQMW1CMU56MWdGQm5LRGFxUWpGS1krdU10ZnlyNW5y?=
 =?utf-8?B?YW1xalJOVlNwZ0ovZkM4N0ZpM2V2RFBoSktLVDJieUYyWkM3UUJxV3UrTEdC?=
 =?utf-8?B?c0JHN0hjVUpRc1AzcEdvWUpNbTB3VVR1VGc0dlV6eXhXWFhDNEluL0pIN2tv?=
 =?utf-8?B?T3p6ZHh4R2pYNytyL2JYVUdVeWtncjhsbWpDaHp2M0xUemwrdGVBRlRrWm1U?=
 =?utf-8?B?bnFiN3B6Wi8zVU9ZaWRqOEpjSXRhazY2MktEaEs4a0FoNXE5U1RIcmdCdmhF?=
 =?utf-8?Q?GGHvgoWGWxCxliWI=3D?=
X-Exchange-RoutingPolicyChecked: rnTesTkCRbiAJadE+CIiMOWK2Acw7iXCzkrO8itcfDXDpg/eE1yJvKe9MhLEMyxb4C20v1ue7cKwOLagsf5iFdxGlMTdG80qa2B787crklLhudX/zUs6cagO5kXffDZgUlPibFBSHpVXD9RYGXL5kel7zM/qGygXqC4YqCx987fYpH0ncSdrPADn4Fp9ZnugrFYnRiH4g+Zmev/KQ8ehS8mqK2mnA1KeJt34jSB87DYt5pBFj/JAm9FizUPqC17JeRqDm+IBVToX/Ph11luf/CvPEsvSG8/vPt3ZYwzaUdeSLj90kSoXgVOt23hiMzLa4PaMMXDZeRRwzsbroZpq0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53222282-7cb3-4af8-0b79-08df130e9b8d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:49:17.2229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOo2fzYxEb8WTWqxmXrGqAJNWv+movTFoURds7bGrfb30gNE4dGLFvzUdE/Xo79cTbT2ASk/4702S3dedtP9sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9636
X-OriginatorOrg: intel.com

On 15/09/2026 02:46, Sam Agazaryan wrote:
>> actual_len is a problem.  Only 2 controller drivers support it.
>> No I3C device drivers support it.  mctp-i3c reads len not actual_len.
>> regmap-i3c ignores len and actual_len.  And its definition comment
>> is not exactly correct since it is only valid for reads.
>>
>> Despite that, the additional issue here, is what to do about a short
>> read.  Seems like it should be in the uapi, but actual_len needs to
>> be fixed first.
> 
> I think something we can do to get around this is to incorporate one
> of Meagan's patches
> [1] which addresses actual_len usage in all the controller drivers.
> 
> With controller support we can add a field for actual_len in the UAPI struct:
> 
>     struct i3c_ioc_xfer {
>         __u64 data;
>         __u16 len;
>         __u16 actual_len;
>         union {
>             __u8 rnw;
>             __u8 cmd;
>         };
>         __u8 mode;
>         __u8 pad[2];
>     };
> 
> As a follow up, I can also help clean up other i3c drivers in future
> changes, such as mctp-i3c
> since at that point we should have actual_len support across all the
> controller drivers.

It is less confusing if it is all fixed up in one patch.  Fix the
comment on actual_len.  Make all controller drivers use actual_len
not len for returning the length of data read.  And fix up mctp-i3c too.

> 
> Thanks,
> Sam
> 
> [1] https://lore.kernel.org/r/20260911210935.1353126-3-meaganlloyd@linux.microsoft.com

