Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19B03E5A0E;
	Mon, 14 Sep 2026 21:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789422632; cv=fail; b=uAZCkuFKLV6CpFRNA7ECu7098Rpk4t+oULMpmUmWjv+GLDmHjrd7dxGmD5FNoVEMMNTQOzjV2VR4q+nPKtbK0rONVFpcCv8BS43+QQTabBAkBvWmDPQnDeNy+LXxLOzqMiFhz06sK3HoDECn9UZsrCHlm7/MZ3EBGt97/mqQv0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789422632; c=relaxed/simple;
	bh=8huS7A3BYDLedFsQykGTw3czDH19ZwlJ+jk3LWobCdQ=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i5sYiVs3huI97naR4EgH8O7IbLSohMcBADwPxmJIoCTypvhEfhAsY245VZoqRGJ/jfoABnfHQqb78TOXAtA+QzhJX9/uR56XXAV20o4vUk1CAWBzCuvvYmFhDx6hhCWjnTAQSFYao43pmL8d4ScN+RuMBr3+DhHua29V88jXM2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1OaUKt9; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1OaUKt9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789422631; x=1820958631;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8huS7A3BYDLedFsQykGTw3czDH19ZwlJ+jk3LWobCdQ=;
  b=B1OaUKt9qjTp8mgtWM7WT9DysrAhekPdebz5grxWULAYeiYwp843TwLr
   0nKOeVTAZK/HjfYDEtODGufcPEyi+AiuBhPhQ/TalQGaL7h96uH7/oBxz
   58ede7XRg7wHsGRjDzCLm6qba8dr+8CPtMhhWxsXtvehFai4xfXqQv2x5
   K5DL2c4z1yoswiA+fYzqD/r/A1xSzuBUrdxgcHyrBX7/nE3q0d2gPx3vO
   anXmnBDHfztTbV4BGF1QBRUHL2Qxf2v/WK43yCzQDyi/XSpankYYrwIq3
   tiEBrSZnM2DQozUr8qYFzB+j1OrwDP/vwoHn77kOLE5dy2eV9+bKqnXxY
   Q==;
X-CSE-ConnectionGUID: dxyduozlQoa7C9oxqJqkcg==
X-CSE-MsgGUID: 7qE7K8R6SoaBsjSVYkLvIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89823705"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89823705"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:50:30 -0700
X-CSE-ConnectionGUID: i42pwL1NQZWmX5hkGuizxA==
X-CSE-MsgGUID: qyKj4p+ZRBSPhq17DBqMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276522582"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:50:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:50:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:50:29 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8OueLJOR4qJitqqlYaNA278rh35q71/29TZWEyYJdmzqUjNMQpinb4cjPFHwHWSgmLCwJDhdP7mJYKNq57yP6plGMvC9SHYB+D6731DW2ISyQiRbMAn2X9sKjMV7EbXoHkXNdx/heIBvUu2SmRe1bCjS8xfxLrL2f6fV6R4BsBD0iHDyOrqiioicSrAXqRaLEqeoa99skBk3FgBRa8TBt0SBNsSW3DVkCwqEJhD1dcpmYz/ncv6pd+H/fR834+dcgWSJR2R47IF8g9djEDHsp2rKEayXd+Tdg4XSZkmxe1l8sem/bBJFEpwGOIfE9n/lCMsSCPVANFKfM4z/5yrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BZH4QSKWaVMeuvWpaWf7kkT0xxgeJeXxNdCK9cj8C4=;
 b=y57wtqo/LzG0+ux0QOjGbxax0qOucyWM80lXlLmiV2sOWnwoA7Y0zOarAcUH/W50MVgh9BjXhsgWZbnlfpBuE5m4Jw/P0ugfN+EdkV2yU2FZlLqm9Ip1WqjH7ohQmO2mmBgY70ZOz0+WPWaQq34P5JLc/BYwSdG0vROIQDKlY0mZ5ZRzRI/SFNnHzCt1SfZpeYISa9y5fRaxvUOXXe7lRSi8TPKveYgA6He+MNYAkI5NelqrTvAhczxhAxHvL37zN+Mu08iJEA0mDgbpu4fVRTzc8NOQNHptG9vhmfUEFyu1wZ+eBQWHbaz6xyrEclHaDJ8YjXT1mJdfe4lF0XxoDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CH3PR11MB905664.namprd11.prod.outlook.com (2603:10b6:610:363::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:50:25 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:50:25 +0000
Message-ID: <dbaf3440-9d10-42a4-80fa-677451085198@intel.com>
Date: Mon, 14 Sep 2026 14:50:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/resctrl: Fix ABMC counter programming for
 extended counter ranges
From: Reinette Chatre <reinette.chatre@intel.com>
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
 <30dc55d0-511d-4f5f-92df-5dd0add354a2@intel.com>
Content-Language: en-US
In-Reply-To: <30dc55d0-511d-4f5f-92df-5dd0add354a2@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::26) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CH3PR11MB905664:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c202105-2e8a-4b7c-1707-08df12aa2f07
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: GEqo2UvuvyccUSJ9dYY6JyJp4aDpsJx6F/OtKlksZstrZfB7A+JcC/QXyLc62n8U7Aa1/ECezzEfBy2/zbqUicbvotWpn2E7k+pPicGIeWpcBKGW6idEkRZv3x9ecV3pZyjjX51sHGJnitLR+pJ4FgAxnmkvhS4SWpxkZoWQhZVkh/k5//HrU69CoqomMI5dg3g/2LE4zzLKTw87vQa1euMU4kq4BugOTskNeMDPcGArNQ1NiBgjm3lkjTMM2660FyKviaExsDZOyhj4W3Ong9eXIrqnjf39uaA2EYzc49TX7y9HS9JEAlndhsYOx616LtVYy1bzyPovUSbifUveQYF3oUTm5/vEEc12nKvkP57N5uK6lafXiRLbtjqvoBFkxGkICakVYfrtVhSP5UwZtp9yFWm32AyWV82Js0G3XWXh4TBVuaWUMg3nAr8cRfvrsa4j8HriOCc8VsvEFIAFwqLu0dz0ZfLuB0Ctb3+BW8zCGbfG3WI5R89Ott/jKk5OdzSNmF0aNXHXOwDFAVwY+LY9cYwaocRhPPsedMrB9iawof94BInCt1ovbfWGPbxhs/SeV5nTQIhhoWpZZq3VVe+7opVA8OyMk9A2752mkpIUOmEv8SuKhN4EUiWcU5Or5rAXctXWt7fe0fjkIDmvRkwsGm91ViWTuNvFZLJ0zjE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE96TW5pSVJCRnU3WnlwU1MxUWJadW1UYlVSYTlaRldoUURRRTVXWWJIN21K?=
 =?utf-8?B?d0loRk5KS2tjbTVwQ0d4bVhya0toRnZEUzBPejZmY1E3VTA5T3pDK25qM1ps?=
 =?utf-8?B?NXVYK1BPY1B4SXVPQW1mekVwOU5ySWVXUDFGbWRkTHBscEtlMnRsMXZYQzJx?=
 =?utf-8?B?VHF2RXllREVYNEZ5SjllTUxhSFlaZHJvSkhEQkdRbk1NeWYwNG44WTZTRjlL?=
 =?utf-8?B?VkdJa0o2K3F0OFcvazhtQVFYUGNCT0JrRnRoNmNFSUNyNXhrWXYyT3ZRR0dq?=
 =?utf-8?B?ZnhGejhrMDRIdEh1WnhpS0pxVmRlY0xDcTVQYWRnNzZvT0g5bjJ2QjlYUWFm?=
 =?utf-8?B?S1JIcG5ZUWc2ZGRQY1hjcVpHTjdzQkJyRXQ5QXovUFdJTXQwM3BpTDhUcDdl?=
 =?utf-8?B?Ym1NRVpZRFZ6b1d2NHhWWlo5S2ZsZWFuUmRLMUxvMG0zUmlaU2hkVW1iK3Av?=
 =?utf-8?B?RFp5MU8zZGFFbVJuTFlkMUFqMXhxd3diKzFZeDdnOVlUdVBNZld0SHgxOWY5?=
 =?utf-8?B?cnlSS3JaY2kzWkpiUXF3ZXRQYm12RmNjcVo5U3BKUHIxQW80aWJwR2c0QXkr?=
 =?utf-8?B?RHN5cXVob3dTNDhuU2ZDTE55TTZ5RHFUc2ZBT0ZwV3lWMm1ybEc2ZnhCTjFU?=
 =?utf-8?B?REQ4YkxmQnVoWU1aUEpacG9oUHlyZTk2NFcyUzliMmR5blVzMEd2a2l2YXV5?=
 =?utf-8?B?QUt3OHNXWHdSbWdJalB1dldWR0hneUx2NVpIUFZxV0ttZ1hBeUxXQWRvWlFw?=
 =?utf-8?B?UE1qNWxHSlczUUl0YUw3Wm1wZ1JvcUhyaHZiWGdEK2l3eS9mRGtqYW01bGZK?=
 =?utf-8?B?Wittai9laU52bHBsSGZKalJnWWhtcXhwMUFyMEZ1VmJXRmV6R05kMjBuNVJH?=
 =?utf-8?B?aVVsRFBhSTlsVDJKTEIyT3lucElNd0pyN1BmMG1yLzVGcU1VSkdMRm05Mm41?=
 =?utf-8?B?K3hpbjdvd29aUld6a0g4a3IzVUtNN0s5TUpkNnBpanVZOVJ1SExtL1U4Z0NZ?=
 =?utf-8?B?QXBKK0lwNXVxMXRZbXpVdlFUVkRYZ0J4UVRtUVU2MVozQU5FWGw1WUlhbS9X?=
 =?utf-8?B?eXFpc05MczNNcWNnTUFHalU0SEtQQ21LcHRialhYSnNjODI5OGo2OXhZNUNQ?=
 =?utf-8?B?MmV3UkoxT2d0OVp3eUkvVTdUSVhqYkhMd29BaytDK1JuQVp4RUNoM3pYZk5Z?=
 =?utf-8?B?aHEvNHBxeDM0WUNlV2pUYzNFUE9sWElFbXVaZEJUMmliVHNLUjBqUGtuNmMy?=
 =?utf-8?B?VmJqbHJBSzNudUdCYTYyc3VIRXNkeldjVmkvaG4rdWFsTTluQlVRTktOZm5t?=
 =?utf-8?B?eEEzTnlWaTMycjVsRHFQY3JlQlB4ZmY5S1MwWEtGV2J1YzVpdVFMOE5XUHBS?=
 =?utf-8?B?eEZyR0J6cys5OVhiT0lMaHJ5dks1Q2J1Um11Z3UxRU1PcHRXU2ZtTnFzK3cy?=
 =?utf-8?B?NlBMYnRVam1YTGFlQklCK1diVFk4anhncG5mMkE0V3RGbW1RTmlsa3Z3enZm?=
 =?utf-8?B?dHlUTjZuM05rTW9tayt1cFNlYVdZOGpTTzh0S0wvTUVEMFErQkozQUlmSTZC?=
 =?utf-8?B?TlJWOUxSOVR1UjRiUDI4aXd1THpnYklZNkNDM2hNQll5N0pIY1FGVVhTRjEz?=
 =?utf-8?B?aDRvTEZmandtcWRZT0g4VFhhVkloa09OQjQzbTc1VkZzTE1LM21TbFRMZTlH?=
 =?utf-8?B?TE4xUFVIeEUwT3FuQ2FvbTVVNUd0eXp1RlZwTVNIdXpxT0VYcmtObXhRZVdq?=
 =?utf-8?B?SDdGY29GWXRkaEZKZW4vVVBuYzlFbnROeU02ZEFIVFlPU1hldS81Nkpmdmt3?=
 =?utf-8?B?QU83ZUI5bnNRSFZQOXdwbVVqejhTYkl0eXk0S2tqdXhmWHFCM1ZEVS9MMHFL?=
 =?utf-8?B?NWtsZmFoRnNzcGtpNnZzTTYyMnBmemU4L2dMeTViVDFnSzlPOGhSRGhmNFVj?=
 =?utf-8?B?ekd6SWwxV1RrYlZYUkhPclM5NmtiUjZGVWk5cmxQNUhidkpqek1oMnA3c3Br?=
 =?utf-8?B?cjZOZmRMQk8zRnB1MlVQNS9kRW0rM1RLQUtmMWJhcHdyMEFCeXRQQ1lCa3RJ?=
 =?utf-8?B?SjdudGxwamplVFVCN25OM2ZXL2RoalpEVXdobmQ5LytTS1QzS0NXRUNZb3h5?=
 =?utf-8?B?bHpLRDVzL1dLeVJyZ2xOcEc0ZE5WTW1IVThqYTFJbE5KVFNuVlYyMktDOVZR?=
 =?utf-8?B?aXJ5cm9mOG94eUhFdWVNWlMvQlJ4d1I5SWxiOWFHaElpdXkrZHgzbjRydEpS?=
 =?utf-8?B?dHU0elVJQmQ1VVVLWVJHck54dWxqQ2FxRkQrV280a01Rcmg2Z1BLZzF2RTFM?=
 =?utf-8?B?VWpzdXZpeE45T2l5bnhOcjdrL1VpWnVZYzVNRy9pTDNQUTNsMUZMSEhLaW0z?=
 =?utf-8?Q?UmKTu5uGjV6N+5FA=3D?=
X-Exchange-RoutingPolicyChecked: VXbrdzvcp+OuqkGWv62mXJBoGmzJtKAQnb/8WDRssA8MlpjaZm44PtsFXE7WD8XaYZMmmcrRBWtwMTUGmnI6bqzTptw8tVpj9FBBxK259djjCyUonjVqx3x02SV/eCHd55wVe+bICXKiYq1rOIVLQbvNC/LjbeRQ7ZZjKGKyPtzZr4WopBsNjo0BCQ9kJ/gk89VR0gaJm/B7TMZhKx6aHsW6jPEGCV6mHkKJnh2sNy5838d9tSZUCM7p+W7cp3IzAPP95ygLzfC87fHtXbt1CuF1HuVH8Co4fIwNvIrMDPiMgNIdY0TqH8q6Z0D5IWWmcLmd+aDkIjOQHlo4FZelLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c202105-2e8a-4b7c-1707-08df12aa2f07
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 21:50:25.5655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fB5ZpSHWeixkMTIr5LpqGCThXY0nDo4KDqRk4rkTofXwmKCKsgtbdP4f36FufGamZV8n/V08OGhmppr2ft6JTvzSyBmmtF/8PUIwNnhcMCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB905664
X-OriginatorOrg: intel.com

Hi Babu,

On 9/14/26 2:30 PM, Reinette Chatre wrote:
> On 9/14/26 10:17 AM, Babu Moger wrote:
>> On 9/11/26 17:03, Reinette Chatre wrote:
>>> On 9/4/26 11:06 AM, Babu Moger wrote:
> 
> ...
> 
>>>>
>>>> Fix the issues with the following changes:
>>>>
>>>> 1. Update the cntr_id field handling to support the full hardware ABMC
>>>> counter range and ensure that counter programming does not interfere with
>>>> unrelated counters.
>>>
>>> Sashiko's assessment that this statement is not accurate looks correct to me.
>>>
>>> Looks like the enumeration needs a check to limit the number of supported
>>> counters if the hardware supports more than what can be configured? It seems
>>> awkward that such hardware could exist and unclear why the spec has a mismatch in
>>
>>
>> You're right. The spec overlooked this scenario. I've notified the concerned team.
>>
>>
>> Do you want me add this check?
>>
>> -               r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>> +               r->mon.num_mbm_cntrs = (ebx & GENMASK(12, 0)) + 1;
>>
> 
> Yes please.
> 
>>
>>> the number of bits here. Even if cntr_id expands further to use the remaining
>>> reserved bits it would still not be sufficient to configure all the numbers
>>> that hardware may claim to support. Are there perhaps more field width changes
>>> in this upcoming spec update?
>>
>> Two fields(ctrl_id and bw_src) in here are changing for this register. I dont know about other changes yet.
>>
>>>
>>>>
>>>> 2. Expand the bw_src field to 15 bits.
>>>
>>> Do the comments describing the RMID field width when reading the monitoring
>>> data (__cntr_id_read() and __rmid_read_phys()) need an update also?
>>
>> The RMID field width is expected to change. We can revisit this when that happens.
> 
> 
> This patch is that change, no? bw_src is expanded to 15 bits, and bw_src contains
> the RMID.
> 
> This is the new RMID field width for monitoring configuration, after configuration
> the counter needs to be read for the monitoring data via MSR_IA32_QM_EVTSEL and per
> __cntr_id_read() the RMID field is still restricted (although not enforce by resctrl)
> to 12 bits:
> 
> 	* 43:32   RMID            RMID or counter ID in ABMC mode
> 
> resctrl also supports switching between "default" and "mbm_event" mode and there
> is no support for the number of RMIDs changing between the modes ... this reading
> an event in "default" mode should support the same number of RMIDs as 
> "mbm_event" mode and we see in __rmid_read_phys() (although, again not enforced)
> that it supports even fewer bits for RMID
> 	
> 	IA32_QM_EVTSEL.RMID (bits 41:32) are configured with valid RMID
> 
> Looks like after this patch there are quite a few different field widths for RMID
> between what is documented, used directly, and actually enforced.
> 
To add to this it looks like PLZA currently supports 12 bit RMIDs per

	https://lore.kernel.org/lkml/702b88901bc62f07829144a96cc887471b427da8.1787772750.git.babu.moger@amd.com/

I assume this field will also be updated to 15 bits?

Reinette



