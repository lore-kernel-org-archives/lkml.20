Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A54A92C7;
	Tue, 15 Sep 2026 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493567; cv=fail; b=NwmGn0Cwv+LAXD/KkElHL0QgFt9a8ZER6ZTUqVfScJcBUsRYFzTnfRAg1joLXCb998uRtHNTPJVukRZ2M2GcoCfT/Z2B0kFWFPK0gn3FrcXDkisETisWsX5Q/XvHk+BpOgKH6PMWBBBt2UQGWQHPva74vgWPHdKvm324b8pDVyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493567; c=relaxed/simple;
	bh=1gO1e7gyb9xCQfELt2T2yQ+Ekb1DSieWJqrIM4ZEjlU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g9RO5WYWVJ2x6ZHQN17f06kb4lFioB2S3fupdIzbgaiJjfHtshNaT5lUWI3jY3XxJuSKCygH1C2F1+z+TPb2R/VIRjj5jMvEYwURzf5WZqi3OI3Yia30dXLPOuVlNW4duNroCluwEiVRAFB5XYLESBUTU91JtZV8g6dhVi0L1qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4vn6pHy; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4vn6pHy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789493565; x=1821029565;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1gO1e7gyb9xCQfELt2T2yQ+Ekb1DSieWJqrIM4ZEjlU=;
  b=k4vn6pHytxtElRP1jWe5kwV+Fb1eO2bbBlrO+HZY1Ku8kur0WlJG1qoQ
   Q3WFfx1ZBh3ek/WJH1ANwdKyVx9SV/AiAsOWQMc4IwI8k0NrZLY4bNXZn
   meKfTcNrnXvLjLDF/3ELgSSh6btQ7Mxrsiy9xXHwjoCpxtZ2jrKzV0mp0
   Qt0yV77lfRhrw0Wt/JV5MjIb9VMQmmRckxxH8uB9Rgpbp3jk8tC0tjkSW
   7TA249B60VFCnHzPNmbGI7GJ4pliuzfNLBV5ZbiCXJUOLU2/Cjn3iEV0F
   vK06UyzUZBde3iZYo8E5xGvEPy4f2DOcrfGSkUdsfu5ZjrkQNkxXhrJIw
   Q==;
X-CSE-ConnectionGUID: vClisM20QfipQpsjfxFOtw==
X-CSE-MsgGUID: uoSrK3njRzOAMxBQWeV6JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89884380"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89884380"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 10:32:44 -0700
X-CSE-ConnectionGUID: PeJYLkYuTg6hegY8jScaIg==
X-CSE-MsgGUID: bCy0pjH8T1iUQD2HCobGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277196009"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 10:32:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 10:32:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 10:32:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 10:32:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuPT2zSNhDU0kTkLN+wXFOBI2kZ1PY9ueg03hUVgGU/lXPO3qstIdn8H76CjRSpQ8R1p5UVCPSxKZGnx4pBKd806TaeBBcpO8H8LTNDGkeyPcNWhP2wGShX/9salIjhLn5OEcFlUHbuI9YkQPlu8OgcCu0upHwwaX4T7okIf93luKqgUYyx1vGw7nF9V8H60LDwCutW0y9B+OCzED/9gdij6nKavdX+X80M19oXkeGGOQMOC8akp4tFT1PXTSGSPS4xP5RXdfJe0WMiCmUUONhcOLyYy2BmtpxeXactwKqCsclJFaVzcmX9IEcAnRBTftpyVXzlPjJEh6pXvGa5gRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6TUIkAHGZNbO/O1VAyTmyAXphDSXSq+ZnwtwdXPaQE=;
 b=JMiAamxGSW3a7ulqwCbLwBu6bQ1t6Bo3T+zgWMw4aKgxv7PtBGyvbhzqO/Frs0u++mb4jbtwprDkDgVF6eNorHrX6A0tPGRu5KyCIqa6wtDJMsKdId5XKGZkPywIHBI7BufMzmXmSqpUscqt4yN6Kdaykcf9J1A3Iu1EOCdH2zcydf4mJ50/QaYP+35GmzoxgkT4Ba28SrO0VW5cavchlsGQf/haX0+cHRrlqrWQBxp8Jb5XPQG7skgs9kPRWqA+oCor9AZl7l47llnuwstbt2K6aDladQwknB1pnkb70irFLW6pm2qgaXkXJ69DUjFRZFis7E2Ng5gbDK2y7m06/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by LV2PR11MB540263.namprd11.prod.outlook.com (2603:10b6:408:3b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 17:32:40 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 17:32:39 +0000
Message-ID: <f1f14def-8b2f-4b55-89fd-65f1e35d48a8@intel.com>
Date: Tue, 15 Sep 2026 19:32:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soundwire: allow drivers to check whether the
 peripheral is present
To: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: <vinod.koul@linaro.org>, <linux-kernel@vger.kernel.org>,
	<pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
	<bard.liao@intel.com>, <linux-sound@vger.kernel.org>, <vkoul@kernel.org>,
	<broonie@kernel.org>, <tiwai@suse.de>
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
 <20260915131327.1783551-2-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260915131327.1783551-2-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0013.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::16) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|LV2PR11MB540263:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e72e8d-ef99-4215-687f-08df134f5721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: HXtqGV4lzyK3AsxeLcV6ycUpmONJ5yv9e6xhlmz4WbrkqVAUDK8D635MIXJ26DCOj5DiH5mhUzM3FwcPPJuciUk0mqg7NS3muxaq2Qe5W/OFVTZSpaOhQfgAmI/H62DMDgNAJz9IR0Hhtuk8NiOaenyS6CrVzgt+ypjX4dk9KE/ZllESW9CFBuFi3qcYpzBefUBvB07LdB+CamdJHw7YYqEFL2zjSng3GfBuz03AbTe1m6dQMBsxFJgA9NLi95HQtsQlbp+KucKNf/BVrCav6exdtZ6O0aRwe2WPmVd3HgegkcAU3HQE1tR1nJtFnLGy+ehyTAlglmp3vTqZd+OsmpfKfI0oLO5tUZiYIxTkNRNZ+/wDGpFY6+Qw8VeJhjSGVmj9gfuxvdhV+2AJecToTvDGcLRMKesBs+bqkycR9M0W63P5oMdbnL7VG67u64qQVyuF9y9n7I2ISPXSvWq1+RZxW+LE1rrtm7PPzXmfMjF4iODU32btv7qNOv6+d1AND/ElJMfRweO4aVKpcu+v9kePtzK8Lr9L/gDPTZeFjBUlFF1lEnkF4r9Mo7GA7gO4ikE2GnOBSEAQV7ZZup45ZjvMATQ5YN4k/oc3AnCoeDg3Zn9ramugxGDdN4jaZj9oNgJ9upcnn3Inrsf1tYYl8yE4SngUUSLZw0Cnav4VIsc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmZEczkwR1JHRWQ0TXpIV3dQTGc1angyV0dWNjZTOXR1eWJYWi9lRW1YdGF2?=
 =?utf-8?B?VU41clRFZU1RcWZQZmtIM3RiTytqVkpEUFhLczREUlROTm1tSHRlTmU0eTYy?=
 =?utf-8?B?TVYrdFFRNFh2YUZ6RDYxTjY0cCtNRm83QmYybGY3MUMvdXdPakJKZzE5NWtV?=
 =?utf-8?B?RC9Cdzd2c3dhdTlUcy9DcFBLMVZpVU5sTDB4ekpHS2xKRlQ4bC9PWVlTMi85?=
 =?utf-8?B?Q012S3k4MCtnUzZ4eTNtUjlRRkV0ejRuWWM0NzF2bmhzS3g5bmZPNkNXWFFD?=
 =?utf-8?B?UnRVQ0RyMC93V0IyQ3Yxbk1PMGdGcFZMRmRUMnRxRzFjZ3ZCTmQ5azBpVnMv?=
 =?utf-8?B?WnJzSzM4NHkzZkt1V1BZcUYyNkcwRFVPNG5pM2R1Vk5DMTFpYktDUWE3Q0la?=
 =?utf-8?B?algyamF0YWhmbTdvQXY4YmJLaXpNMTRTOEJOZUtPRWlvRUtqbUZ4UldxQkpL?=
 =?utf-8?B?RTJDZUhSVmwvcnFJd0Z4ajFZK3FHenBVamhocDNKNkhnMWkxRmFKOE1pWGJF?=
 =?utf-8?B?WnVLKzY0dHRET3pGbVBTT0R6dUhuWTZEWEhSZ1l5ZEtCTEcvWFZRU0xjWTEz?=
 =?utf-8?B?ZW4rUWhjV0VDYjY2OXZtODVPaGo2RFVnaGg4TjZFRkozbTNNYW5IR0hhL0s4?=
 =?utf-8?B?WXlVeXVabFppUWpmTkE1dGFNeit5ZHQrQjczeVNMNW1vWStIL3hvMmh1Vzdj?=
 =?utf-8?B?RjNSVVJ1UGFhbzdjQzJjaVMrM0RJZFVzcWRGZUlSSjloNXF0RkIzdktoQm9o?=
 =?utf-8?B?NGtqY1ljTW5qWHZaY0xTVy9XSG9zeUd1aTVna2V3ZXFkOHZwa1VXVlFCZDdV?=
 =?utf-8?B?LzFYbGhxSWRmeUVCS3FWdTBmOVRLZklrcWxEVjg0SHYreVBobGlQMEI3KzdY?=
 =?utf-8?B?UzFpTTBVa3JtNzNicDFpQ0FkY1VJWmZ2emFNR05SbEFaOWdRaTQwQndiSnhM?=
 =?utf-8?B?L0QzZnNCQTNmNFJqYnB4UE1pSVVSVWh2eDd5T015RnNsZUw2N09uOGxFVHdM?=
 =?utf-8?B?anZiLzFiU2tRa0J4SzZwSmZkcUdJZFZJSy9SckVxd1dUbVhNZDhXZmpKVzgz?=
 =?utf-8?B?Rk9EV0FOYUZtZ0hHTVNtMFVEWXozTFM2SXlUTlZndnZIUTNKeWhzNmxLQTNL?=
 =?utf-8?B?Vitoc1BsQVYwMzdoN0VDekVoUVVUblI3YXRKUkNJZ1FZSEJGVk1xV3phSUpR?=
 =?utf-8?B?cThUYzJUVldFT2tnS0VMM3praG5YOEl6N0FmZ3NzTnQ2cTBZSDY5TFJ6ZGpv?=
 =?utf-8?B?THF5Q0lXZEwyWDZhaHZKQlF5SkF1UElKUW4yYXdxM0VXUkpvU0RzcDM0K1Bk?=
 =?utf-8?B?LzQ5NEZ1UHhXYlhtODhJQjg1ZHJHWnpGbTBkVVRvVlQ1RW1XMG8vQlBYWHNZ?=
 =?utf-8?B?Yi9kZkJHdXNtQ2w5ZE9pRTJPV2FiMjgxZ3R2YUJvUFlNTyt1dVlpN0FZT2VY?=
 =?utf-8?B?Q2pOWUNtNE84Ny9GaDVBNUttYUZlbXpZbjErZzlwQThzVHpoQTU5T2xuc2NX?=
 =?utf-8?B?ZUY5MVBiOVR5WWE0Y1Y5Tm5temZYQ2ZLU0kzOGhvdnhiWWJtZ01NNkVjN2lv?=
 =?utf-8?B?N0c2MElMTGV2ejYxcXdMeFRaVitndllQWXFoVHRPNmZjdS9yaU5xY2VNVDZE?=
 =?utf-8?B?a2QyOWxkdVlhMHcxcyt5RjUySmFNSEFuTmxLdjlpcmFLLzJ1RGNFbDhUZSti?=
 =?utf-8?B?cU9zY1RCYWlBZGRlcldHUUhMbWpNYTV5OU1TZXNETmdndHBBU21VVWV1Z3dr?=
 =?utf-8?B?Yiszbk1OWUkzNk9XdXowbytPUTY3eHRkRDloQUY5Mlk3SXl6Y2sybzQ4ZXU3?=
 =?utf-8?B?Vy9GajZlNlROMXJWTkREVkpJUmMvZ3JydEEyZVZuVVN3M0ZSZGNlWmlaRFRX?=
 =?utf-8?B?VjJ4blNnWXhaNG9CN3VaNW9kcUtJbktmUGFML05OaThBYXA4eVRVcjk4Mmc1?=
 =?utf-8?B?elR4d1ZNY3l1YzBVZFpjTUhPM3hodzE0UlBzei9NUzEwU2N1M3lQeXBkNHVX?=
 =?utf-8?B?U2xDTEVqclF4Ni8rYzdwZ05IMWVIQTJvRFZ0cS9OT1BkZUR4dlBBamgrZTZi?=
 =?utf-8?B?RUVwVGoxay9iZGpiSVUzY2JmVWVBY1BTQm9FNUFhemphUklyK1dSSFNMeUky?=
 =?utf-8?B?aE1BaU1ZVEIzcnpuSGk2U3A4VDduajFUY1lOVTVhbnd4L0tyTWRDVXFRZWNk?=
 =?utf-8?B?d0haTzRTL0ttRitYeU13RWQ0TTZQMURFTDlqLy9BWWVRWk5UcWJPMnpod1FQ?=
 =?utf-8?B?cGpQZjhta0RHRjlLSGtXZXh2L3cwOTRnUWRmTUJPcUNrMG1vUjA4TlZMa1Nr?=
 =?utf-8?B?cm5QZVNaV3VZMkxwQk1ZUzJVN2swSld0UVkxbndDWkptL2J4akdFY05CTXB3?=
 =?utf-8?Q?er4en5LC6lslTFu4=3D?=
X-Exchange-RoutingPolicyChecked: qI3rOHIGqCRi1IQEiW5lqGIKiLpjgT/ymHDjAhLWdMhCmeHhp+1kKYcuc8lStwWrmkYxjLZu3OuKQ8QTgmDr0mgUNuVKS7zbF2tCkadqENNFHl+Q0LnxtU58fxvKTOBaLjiY/CJG7wF9VAxkTHx9L3FcgRpOnDnEkYD1qjG3GjqRgXLGLaDygTmTjC/gJVMho0sHO7CRVe2n85sr9xfa3yf/4n5jp1IXk3FfFfQUeTnejB2Gv1/Q1xFOBIsOkqH9oVzpOIrz3j7AzwruyxnqJp24MSjOu57RSqvnED240vgHClI0vbkEeFwQzjiNUnmk2GH1TGfzNk53wwdtMKO/XA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e72e8d-ef99-4215-687f-08df134f5721
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 17:32:39.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2X3r9QhfS8h9fXF6W9JuqhODUrZY1oVXNJYlRaagYn7hjH7DxdxvLy8+tGaOKUD+QiAFP+l94GBfmk6AYIgAQCY/u64vHjbojG05v3Zzys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB540263
X-OriginatorOrg: intel.com

On 9/15/2026 3:13 PM, Bard Liao wrote:
> A ghost peripheral may be listed in the ACPI table and we want to skip
> it. Add enumeration_complete and is_present in struct sdw_bus{} allow
> the driver to wait and check whether a peripheral is present.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus.c       | 7 +++++++
>  include/linux/soundwire/sdw.h | 5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index aeaae5a57c89..b49864ca683a 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -161,7 +161,13 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
>  	bus->params.curr_dr_freq = bus->params.max_dr_freq;
>  	bus->params.curr_bank = SDW_BANK0;
>  	bus->params.next_bank = SDW_BANK1;
> +	/*
> +	 * Set is_present = true by default. It will be set to false when no peripherals
> +	 * are attached on the bus.
> +	 */
> +	bus->is_present = true;

Does the approach permit existence of non-ghost, SDW master instance
with no codecs attached?

> +	init_completion(&bus->enumeration_complete);
>  	return 0;
>  }
