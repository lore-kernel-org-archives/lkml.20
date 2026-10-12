Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DDB3BF69A;
	Mon, 12 Oct 2026 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799419; cv=fail; b=Cc3srJwdzj7iHyC96dBEt3C82c/zGAmb4g7hQ4eXVZZU9MCTNyFQihQDzllkkNf2aEWliWXpdw7nKcAGg2J6ph/DIL6SHNqOaGlykfbdRNvvwhYN8e2Z+VVCZE2LBkhL36WYTigVmbDjIGkda1KTn73hjFSCym77lnCtCFReluw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799419; c=relaxed/simple;
	bh=AaqSgo+EMeVM9Cnd8oPIP/Q2gqKIxlmzKHyACUQboZ8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LA4cFoNyU/T/KAA0TVgLRean/HIkKNqfoqUnBUcJCcNMVDcU05dtU4LPvwRqrGABwAXGDuu2tdPJiF6rWld1aCfbY0+ZuUBmmjXkWxn/ZzB60zuYagjUVptUQU/YInoc0PoFdrhpbDdMLk0xJsGmeMG9kBvF/sNc8pIO1rkOKM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2UO6Nki; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2UO6Nki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791799419; x=1823335419;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AaqSgo+EMeVM9Cnd8oPIP/Q2gqKIxlmzKHyACUQboZ8=;
  b=D2UO6NkiWU65bl57gNJH/HURKyBvazh6lviD36ZLa0VYs76crtKL6eSu
   DHzlRiC+FKhA2dEFvW6Owg1zkyI73rdXP4AS2xgBAgVKnvxoXkcP0vM8u
   mQXtXryqceqTf173F5NLmj7Y//SirLXiP2JeckXQUgbiRoiQlDwVpQ+Dy
   rW0YK1oPnObgJZFAuRvV8WjA7KeGYja0rbGW6G2AXQ6IfjrkdDgjTWdbB
   V0uhNycH+JBzvyZNii7WkXJzBRm16XlZC5LAUd05xCcLsVQJUPSee4exC
   kETf1Wgeaf8IJ07Bk99UuYuQViV4l7V4IWuveSP8k8gWE/KFQAH6iqKeq
   Q==;
X-CSE-ConnectionGUID: fIyR5nQTSE+ykELJayN4Mw==
X-CSE-MsgGUID: f18MLSC0QTWTQdpBYV/9Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="391516"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="391516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:03:38 -0700
X-CSE-ConnectionGUID: QOLhkt8sQeqWUDo7R/aueg==
X-CSE-MsgGUID: 7C5sxLw4S86pHFI9V+3ywA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="789461"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:03:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 03:03:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 03:03:22 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 03:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJ8s5OpDDMFTbKBNIYwZVkQweJTLAW1l9MV9YTvju61ihH1JKJukh4mdGUQk3weWo6Bz4Oq3tKVP2Pv6xRMSf+zuawpMDPsx/kmJx0vF76lSOkaO45ujSpWL02SA3t0F4PRnfAbtXbOf7+byqsUXcD49zjBZARSQPHqomE+qUj6DlHPnP1EPUcuQWg50gvL+PppU6B0bwNsE3wp+w2VmWLMXxikKIclHGkNXcdGQ9pLkJYASO3l/yjifOhjlQbI25NSJtSzHuGLtOxxvZu6hP+kFHo9Sjf/Nmza1i3qTIv9nFmRxrsCfKWMZfNNYfT69cNXRFK/lZhaNrNC0r+XDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4X8o0Uz6dQYdV39rh/ZCle0Z42DZBjPBbwXR3CuA2w=;
 b=N641lWCfJC7ROVs5MHCjnlJH1NApz9DiZMxlBLMEj6vOGIeixqiIXZeHigj9R5tYNJVQNyqbrjPvDxpnDObqrXYWTvx3EzXSmvJxEcN93GqkboVWNwaLEjed4EShu0bBbM7QGRfPei6g+ThLPvM1MI5dG1sVvPbRICp6hsBV+sSD0JhEWndVAR0dQxC8AT5e8kQ18sfBukVJ0KetnqpbbkJPjBsT592l+sefrdsdS8JDomXIPIO6swBRP7CNj7By5zIzqxlp1LiJcMU8E4Cum61+TYIVOotsuYWh2e9COBLU0lZaCSwAbPTx93ySCeS9vewjLlDFFB09mox/BOZQqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH3PPFEC5C0F28D.namprd11.prod.outlook.com (2603:10b6:518:1::d5c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:03:19 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 10:03:19 +0000
Message-ID: <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
Date: Mon, 12 Oct 2026 12:03:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
To: James Calligeros <jcalligeros99@gmail.com>
CC: <asahi@lists.linux.dev>, <linux-sound@vger.kernel.org>,
	<patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Hector Martin <marcan@marcan.st>,
	"Sasha Finkelstein" <k@chaosmail.tech>, David Rhodes
	<david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
 <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
 <l_pd6lBHQaWNYoohhfxhFw@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <l_pd6lBHQaWNYoohhfxhFw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0050.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::39) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH3PPFEC5C0F28D:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be91e65-0b1e-4a28-c40a-08df28480aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|10067099003|261009223027099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: d0xx7ncq5vcGbssY6MMJG4+ZpQG95OTG8HKoS2X7x4s/XkdYiBIQgkoxotribAq2SCyJ5Zw8tOpRMat6hhsqad8VYcxtNNsmAgPr2qwZxckEJBkUuM8h9qmlyFk6R1v/Y6nHnT9XawzzkvflZZe12lUSHRWxKT8Koh0qW6iwUq6hmeqJeZWW7d4bJ8qJU9PHBhSKrvfh3Vo32mWnaKZ5GZUfwi6JkMC89A/5XKWEx2e2kzmTRq+WrOjDcTw59kHmsVhlnP8sik1AU37tRuqzBg9R2IYUALATs7318vOJzQkUD0XVdO0ezQfn8OjH21uQ4p6+k9yWJh7tmbVa+KkYSDGcuIN/sYfPWX2UNXtcAqpdV1FhP+6ecJty9DMjRF5dypoyUo8UKGTRiyqzvHtgYNiddtW6PJtm79uRec8DvxEM/8V3fwNN4oQDBZF8NDGYq4hFNp/wmjPaUBfnUlKm78bNuUCtjb1SIHpJW0iYruHIZqDN01DRk38xcgiNGhWO3NPbUygJmL0eIdPMFWxSsUuM7tcK0VqyzmZNIMcF4xgSdORTJ8yLq4u1eRTT11Ad6ksoflHrDOXccLOaHbFKJfz7we6YBrvhhR/ShYNqXo90Ts7GWd1CoEAuAPDhcCcLcl3RhUd/hh7DJSV6nIJ3qy66dEohvxaifqjcjH0xh8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1d1eFZ1d1VyMUhjUzFwWEpKNm9hZHZQL1dQSnJyb1d2WmFhZGdHUThaSzNW?=
 =?utf-8?B?MjgvNWdhejJBRmVOOGV1WHJWcnltait6YzdINUtZMnZ0WDRvc0QxUldkcVRx?=
 =?utf-8?B?U0NTRUtFdm1qWDBmNUhmNXdiRHBUT0VEUkdWUVFKdEVyRXZDSkJKVTl2TWEv?=
 =?utf-8?B?ZTFNZGNPUDJkMXg4UWZlK3lrQmVVQWhLdUNjb1FWOUF6bEFXMExERFFBdTJU?=
 =?utf-8?B?ZDdIREdnZzdaYmJiMGJpQmVuTDk1YkRFUm5aZmZvOEovYWpwWDZ0Z1NQcHM2?=
 =?utf-8?B?eGl6cTVqTXA1ekZQeDhnTnZnRHY1Y0lZaC8wVDdyWFRXcEd5OCtHNGxNdEZS?=
 =?utf-8?B?eEcwWm9jOTZLbjlMb2JSY1d2U0dwcHc3dHFXSHVsQit5dFgrdWdqNHJZcUg5?=
 =?utf-8?B?bkZXbkd5NUx3ay9HeUJ3b0NXOGJMRWx6TTlNWFhEbFdpS2VqRHljcU45NURv?=
 =?utf-8?B?NitHSjYrQzc5Y2labmM4ZWk0VzV0MVF4WlI3QlNHeG1BMEE5d3hLVTBIeHVi?=
 =?utf-8?B?NFlQUjhoaXFITnVmUTQ1SjA2c2Zlc09COEY1b2ZJUGZTUlhGV3I3eUthbGE3?=
 =?utf-8?B?OTRXSkpVV1BDYW81dE1qZFlha3RHUXIzMXhnbDZsNTVybFRSYmJzNW5pelZo?=
 =?utf-8?B?VlBxN0Q5d0JmbWw1WUxsUy9vbklNenJvcEgxcjVla3lHblA4aHorSXVNa2Ji?=
 =?utf-8?B?VVlGVWE3YjBrQ2ZvMmhGTVZFK0JXVTJPTmpFQWxEVlhlZ1hLSUdQUjRjTGg4?=
 =?utf-8?B?UlJ3dFR4UGprdEpOelZPUFRuUTBWM2FBNnhIbnNDcU1WaG4rbHpzRTRaRGRP?=
 =?utf-8?B?RE9yL3dUR0hxK3ROZXQwdE1yNXZ3MlRpdTk3aVNZd25MdG1Jc1ZLM0N1ckRS?=
 =?utf-8?B?RVdJbE54V3A1VjBGVWJHQ2ZFQm50eUQ3ZDBiNDZBUmxBbmQrMmgrSzhza0FY?=
 =?utf-8?B?MkkvSld5dkRvRGVNY05yazNiY0RjQXB0RGFvV05LdlRPczVmd29pZU9UUWlS?=
 =?utf-8?B?MlJReDJtbnUveGlTcGlXQTdTNHZUMVlSSThqUCtEdnExdlREaWk4QTBIc2ZO?=
 =?utf-8?B?QWZLQXNWK0ZDVEZ5TDdNQjhTV01IZzdRQUFPU3VtdGF0Wk8wS0UvZVplam9o?=
 =?utf-8?B?UVVCRWI3akNnUlJYOHVzV3BxMktZUFhCbFN0NXFJSFVMdmpVZFE1bHRqRHVP?=
 =?utf-8?B?dEMyZFZXclVBV1hFZERsblBJKy9DaVpIYk9CbWw5SlJYN1lPdUQ2UHBIeGs3?=
 =?utf-8?B?MHlVRFZkc3VhOFFkZzJZczNhenZNL09Mc2daL3B1QVlzVmRoelJhRy9Jc3Jk?=
 =?utf-8?B?VjUwWXZXbFVsVkE3cy9KdE5taitWUmlpeXFQOElxVWQ4R3JhZUsvRnYyd2VU?=
 =?utf-8?B?NU9JNDAvcDhkY0s3YTg0V1VtYlkrZ2QwNjByQTd6ZnVaSk9GeXpLTk9Gelpu?=
 =?utf-8?B?Q1U4dDBZQnZUOEkzSzdIRlBJT0w5MHprZWVpMkcyWjYzN092blRKanpjQy85?=
 =?utf-8?B?eG9OdVYwaFROQWpwQTZ5SDluUDVMUkJoSVh3TXdQV2NiVHQzMHpFS01Ed1A2?=
 =?utf-8?B?NDJwaXl2dk56OTE4OU5vZlhpbHpnZC9HRGFOZDYvbzd3cjBHUG9Mc1NoQTJM?=
 =?utf-8?B?bk52enp1OUZJa21GQ3FSRHhiU1JJWHhQQTN6eSswQzFuYk5qK0NiV0QvYWJ6?=
 =?utf-8?B?ZUw5Rmo5VjNQSVVqRGhlNG9ZaXU5ZExlNnJGVlM1VjNXSHR3ajBlVUlyUm1H?=
 =?utf-8?B?alp5bkRjWEdad3lUdkl0SFYzN1l3SVlaOGxOL0J5VG9QV0t1WnV0V1ltcThP?=
 =?utf-8?B?aS9ocjhwK2ZOb05mSzVaOW5PalJ3RXJQNHBqV256R29Qc2NrbktKRXNrT3lY?=
 =?utf-8?B?MTNPT3BFZittcVI4ZklXZFBicFJ2N1kwYm15WU45eDRwaFhUTElRYjJsK1I4?=
 =?utf-8?B?WkFITlIwNEJWTlZnY0NFVVkyT2haRXpCYmpETzlxYnhqc2VobCsxYWE2K1Rj?=
 =?utf-8?B?L2Z5Rmk5SStKTCtUOXB4bzcxQk9UYVpLY2FWd243bk9oNFpJcHJCUFpYZW03?=
 =?utf-8?B?VC9yU2QyY0RCQVlUWnJ6Zkk2Nko5Wnk5UG12bVY1VWx0WVM2WE5xUDNNRlZx?=
 =?utf-8?B?U1gwUFRBT0U1dTZ3dW9hcXNUMHVDR1l3MFF5Tmh5cnk1QitpaktBdmdYMVkr?=
 =?utf-8?B?L1ZnMVdkM01sNTZJWmVuQjFYV0xBemFDTUt0UjlCNTk0S2dGOGJtYVVWMHQv?=
 =?utf-8?B?bUdBcFJjNk9zUW1NMC8vVU9xaTZkVUNBc1VHSEVzRktDQWRadDB2cFFQV01X?=
 =?utf-8?B?UllsSVFXVU93K205cXlqUjNYcHA0RU92YWRHWHhSQ0c4Nm9LV2RVN0V6UFRN?=
 =?utf-8?Q?NkUiedbmk6fQSxHg=3D?=
X-Exchange-RoutingPolicyChecked: G37L55eeLOXeXNxnRoru+GopBmxbdvg5A2kWk+ZrLR/ZRPmyF72yR/HyCPLfusQj6TKjtzoIivPg9IOnRdptKh0ImKQGjUNxmvgb5HscqS2X+4zqj1gvZM6kUhfQUZe19bGr4VdBK4MORFGQr5ALE8VM5SEYQzrZH+03PM3zB2s+AOpF7KwBMpgt9tnD6VboBzsce1J8Fb2M9Ccj45eAJ2YNzTW2bZhCZZqOqVMYfcD9JyJuT1MDPjiMBhU4cs9recZZU8vB7+I5cc8WM6JezicTP/2WnNZwAZKTDFXjXgVz5Pc15UUskctYX86p3+vCmim4p2C3pneRk1Z0eymk+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be91e65-0b1e-4a28-c40a-08df28480aa0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:03:19.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXf86zIssFRWzm7KshtPlfygbmG2F5on8EgUpqMTGEU9G2k2uYDdlgBWamW98OOqB75tz2+ALYBTzmnewoOqzNgWtcmda3bLOke9V+sAv8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFEC5C0F28D
X-OriginatorOrg: intel.com

On 10/10/2026 6:40 AM, James Calligeros wrote:

>> macaudio_vlimit_enable_timeout()
>> macaudio_vlimit_disable_timeout()
>> macaudio_vlimit_update()
>> 	called in context of delayed part of the trigger() callback.
>> 	I'd need more information on the trigger() implementation of
>> 	yours to present a solution. See the comments below.
> 
> are slightly more difficult to deal with. These are called from workqueues
> which only have reference to the driver data struct. Other than keeping a
> pointer to the card around, I'm not sure how else to deal with this other
> than keeping a pointer to card around in the driver data struct.
> 
>> Please correct me if I'm wrong but it seems the scheduled work does
>> speaker-volume operations only. Moreover, it seems that
>> ->lock_update_work may schedule a follow up work in form of
>> ->lock_timeout_work. Are you sure trigger() is the right place to do
>> volume-control in delayed manner?
> 
> The intention here is to activate the timeout when the stream starts
> so that if speakersafetyd dies at any point during playback, the speaker
> volume(s) are limited to prevent damage. We only want this running when
> speaker playback starts and we need to disable it when that playback stops,
> so trigger() seems like the natural place for this.
How does one know the speaker died? Is there some kind of signal, event
or an interrupt we could depend on? As delayed-work is a mechanism of
choice here for handling the case, I believe there is still a gap and a
chance for bad things to happen.

Czarek
