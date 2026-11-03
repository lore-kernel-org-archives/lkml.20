Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793696455;
	b=yTGDfqy6CctLFk5zCGhxquO0dgrGsgMaR8qiYO8rlMKfI76B0Fp30Xr1VI3kUM70smye
	 W71G4DPw32/nUrYLHxSE+eTj9m2uMMUg3ChzIeOdrrSlsBxKFPuy4kBOYlUVNhgoHOONe
	 YBs12LWeW+b1lfNs+06SYoT8zvRRNDoYExMWxRT1fba9VdlxDQgfmrcJqsdNhjkety1JQ
	 ANmEkCue5zRz2fRWCanMF3JP4pBsQeMwP3VocadLPfNtTqRIEia2Mo4h0c+9RoFxS7Do+
	 B8Re+7kADPtwdOMMApoavljMPgSbGAaGCsmWAJpZUJnMGQGMCqfWc/2OFqrPU9lNYdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696455;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=60GYysXuHlkzpagqPzkcoQErLlLnUZHd9RdkFBOg+gY=;
	b=dEIVQgQ7j0DPlKUocwtfydmk6NE2+10MjaPwV6kTQLBzPvFDxmvFPtz/rk9aoeRf6PeI
	 VqsbGxgMi/fnnckq6q7fj0HMDkejKMAwblWtmQtcKxMDd8T0aJg0nca0FT2cT77pERSB9
	 sak+7fJ1gKrr9/q1PQjMPQkBrYdU8QQ/UqYoeXjRv8uqWcVaElPPA2LyVPghhzZxmKqZy
	 IRA4a6JyKsV/7mc5y3Eo0ltS9PQn7Q3LgYs2DECmSXM1F4b8QuIcksAm2O231YR+wVuBA
	 K4ipnPLY9c3YGxTtzKllgMU/FpDzkwpLIRatOXb90uQqZj3XALYsv4F1ZruwS6zaTww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sj9T1uFx;
	arc=fail smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78BF606A326;
	Tue,  3 Nov 2026 09:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C78BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sj9T1uFx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793696455; x=1825232455;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nJovAqLZVK+93dZcOp7xgc9Hp/NAELQSw6L4vmT08eE=;
  b=Sj9T1uFxdwtlO+xLph9qoylndrWiqjirh/J73QetNccHATs5bjoYqJfq
   ZB2m5LDFWcFu3MUhydGRBJ9C+lymZhvGJCEPEXDMV5RONCZrAFoYmpJho
   L4S8tQ71z9o5q/abxi/9qYXj1VfNuhmJy2lu07QfL969ofcGpi+dltysY
   SCQitGlSHsJgBAri4QerQvlPE12eKDFGoRt2jrqtHEq7qOJ3sVOIrPfCA
   +Q72gnWqKMFiiPv8M7Nzp1jJHrjamUzdTLS/rHT0hoEoextQZ1WZv/f7n
   Qmx10P/lsNnpPwKU5tpA9FOHhz58EtWWnNwh3p0S7yxxNMpZZRKwKmTEg
   g==;
X-CSE-ConnectionGUID: B7oUzm/TTeq+B8ERfzGTvQ==
X-CSE-MsgGUID: LTFzrlzbQqKJK/NtlubKTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2441008"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2441008"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:59:11 -0800
X-CSE-ConnectionGUID: mqw8KdNgQQWpX3qTTeLmDA==
X-CSE-MsgGUID: RGHqYv2vRjCnobDQtvL+aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6256955"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:59:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 00:59:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 00:59:10 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 00:59:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rldteEzJciCj2EvKQLJ1ztaQ6P9a+ET72tVJ7iTev8+FkpXW7rSoCKVUBw2Wlj7crdv1pofzE2RvEvMFz+J0tZFBIYsyedTzxSXLDlgRb957H1ia7rUssiGti5UUn4Kle7RGFW9yXUvgEGlxdBC5P4X+EZgshPIUUVHk/m/5Kt08RGej7tc2lz5QShftKXvypDexMiOZCi7srTtaLTPcR7YQfVKxxNVkriqoBr9pSksZWT12e2FfVl6xwL+chs4f4ntNMND2zJhWrsiuWwB9auSD78hPvlX9F5yzFsM8SHbWH5SeagBKx1gza9NOHAPsVGCLDSj8LsvdUwgT8syyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60GYysXuHlkzpagqPzkcoQErLlLnUZHd9RdkFBOg+gY=;
 b=D80JrcVhqOYBTFn8hLxtI3nCTUH6QEDKG8KaR/q/VE+HIvE/B9pv4TmpZFwVv77xkPEksYi5YXoC+34v2okCa2tzVdZ/Y7KLvLUHmEDGYcNfytu0YgOKzps/D1Cm8ECwEkya5cAdsgAqyX9JmKxJMwGcom1D8XXXnkbMgm5idEDCmlSJzkWJ3nZFxFLBp79LKIdUTctizeOZ1tuSVepqcwKd1aiXEB8XIzt/GOYgF/oIAdfxzsgq1UCvlws5XE21Gh3nsP2nogJN+gMwQhoLSVb1D6YHvE5ikpyngdJ5DBuqNIDejSUN5sglFgqUQI3amTxeICU8d89cS9/g59EeeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by PH8PR11MB9880.namprd11.prod.outlook.com (2603:10b6:510:3c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 08:59:09 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 08:59:08 +0000
Message-ID: <61aceb15-de8c-4a15-9cc6-79dd02418244@intel.com>
Date: Tue, 3 Nov 2026 09:59:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] soundwire: intel: Split PDIs and DAIs initialization
To: "Liao, Bard" <bard.liao@intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
CC: "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
	<tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>, "amade@asmblr.net"
	<amade@asmblr.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>, "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>, "vkoul@kernel.org" <vkoul@kernel.org>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
 <20261102181042.1922005-4-cezary.rojewski@intel.com>
 <SJ2PR11MB8424F37260E9A70E14744CC7FF692@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <SJ2PR11MB8424F37260E9A70E14744CC7FF692@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0015.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::10) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|PH8PR11MB9880:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6f7865-684b-4027-002d-08df3988b8a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|5023799004|11063799006|56012099006|261009223027099003|261102123227099003|261021121427099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: r80UzGMq6LkXbV9/yONdTjWxirlNCMv98qT3m71kJg10uZ3Me1Z9vPetsZg8n+zqm8xrbZic1ymz9UeX4s6kppsC+wIaHepJQlQryzyUFa4yodoeMFYNCgDSFwN2hzNiOoNyF9S15jSij8vrShLH2JSJWFHzXtVx3qV3vOjF3cIhctCN9HC6PRVjThuoP/MQCpAXNXq0SHjXF8B36nwRmiKL34PBBtFt8mJGLn+rfqXup7qMuqT3I3u0IXxG7554ygfO2WMYphEs/B7It92x65TSBYeuQmps0LJPiIniwun+/87LmJkGX5KTEc7fstxZLc6Pe11dTXeracIOKb6UiSsdoheZS8byLtVn0a1aP56yj7sMY2loGU2HBmfB3alhXRx1dWbIIdnONwej9BBktfQxH4ongNTiovmSBAJ3MfbyiGbB0YuDOYk/BcSjK5U3qW2JBMDFq4568P33JAT9NewYAibf+DmFccZ2XpVjkUGYnw5jVupupIcLIdNcnY2sxKG8ZaOekMdOntlp/C2EnOlaoqAS7XCgyBlveFDmXxc6pv883Jv2BULp2BhrqI11c/C93MQ2v5PBUfH9TdCbbJjc4tmZVo99f5permS00654kQLlR3FihSngNpQwU4eEsEkeeQnj7jX7OhEgRP4WHWeWltWxkBbih81K4pgW7/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261102123227099003)(261021121427099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zjl6RFJybHpxbkYwM2dVVHIxSTE4ZDNOMVlobjM5ZG1tTGVPYUxXdVI5VHBN?=
 =?utf-8?B?SEVNaXNwck1qMlN5bWNOdG9FcCtNb3pITk5meloxRWU5dWJOcFhYNXRsR3Mw?=
 =?utf-8?B?VzBhK2k1NWdtN3NFYkswMkRWckE3OWxHZzVVSk1mYVllVTVNS2RwSTJCYS9G?=
 =?utf-8?B?bGZvQmlmQzRvb3M5NTdLbU1EN2MwRjEvbWJmZ29NbkE1eEhMTlVSaks4SGdv?=
 =?utf-8?B?MlRKTTkzL0hISmhJei94UC9KenI4MEFSbHBDMmtRajY0Q292Lyt5MzR4cndw?=
 =?utf-8?B?MW9nWEV4MUFVREFrMzZQT1dld3o0TUFUWlYwcUxReE11QlJWUTQ4QWppL290?=
 =?utf-8?B?N0hHTXdvRlY2RmJJQTVubDJ2aTNlUXdmVjA0TTMrV0lja2ZKZGFoNCtGd24z?=
 =?utf-8?B?RmFYYy90ZHBvWDk1aDJiUmtyTXQxdTFqM3FKTGhhakFQUlpRMXJNTndIOW03?=
 =?utf-8?B?bFhyNWxTZXVnWk9YdTJldzRWUkpCMVEzaHNERXBEclJQenFyRjlCb1laWnkw?=
 =?utf-8?B?TkVxakNZVTVCTzFuUEVyZVpTNGgrVlM5TUtMSzMrdU82akk3S050cGgwRzRx?=
 =?utf-8?B?UVRCelp0MGtHUG9wNFBNSFd5dkt5RnlScTMrWmRIeGhjb2xONnVOY1dHeSt1?=
 =?utf-8?B?WWJvcHNFaTVpa0FVN1U0VTZIeTU0T0R1OFFsaDFEQWluQ3NxYk82SjkwY243?=
 =?utf-8?B?NnQ3OEg0RzdSbDFaaVJ2SHRUd0JCOUJ1MFFyYlRkOS9wR1RiR1ZyRXVxbTc4?=
 =?utf-8?B?TUNWbnNLekJDb3Q1MkxEN3hEUmQwMDRyUHN2WG13UTlqcWF1MUxSMHBjbDdF?=
 =?utf-8?B?U3NrZEExTjBnZjM5UjQ2UFZLWkxlcnlzbEtmRjFudlhFTmVzNlpUSysrS1J1?=
 =?utf-8?B?d2VtQlI5eVJoSzBlR2k1QThwQmRad1BOc3l0N2hhL1ZOUW5ES3FtaENvRmh0?=
 =?utf-8?B?OVZFcThnSklZNXRqcmVCeks0OWJZc1lvdUlIdWdOT2dCYlNJR01ZaTJrTkR2?=
 =?utf-8?B?dXRzQ0NheWFXZ0ZHNHpHZzNtRjdPVFNnOVNZSlBrZm1vbGZlaytxcXFWK1hJ?=
 =?utf-8?B?d0VEUUs2WFZwSDJtVDVCMjQxY1pKaUJja0tGU29maEpYeFdjTjFBWmc4aVQ5?=
 =?utf-8?B?WFZOZVZ2OWtPcjNobDFQbkliakZlckI4WXlYQUkxbzYzMGljWGU0VEtSeDl0?=
 =?utf-8?B?NnZBL3JvUXVUSndSU0VpdjdnUmF3SUxLK1ZaSEtGcXVtcysxLzg1bW1oZ2dV?=
 =?utf-8?B?WS9NTVZ5YkkvbHY4Znl3S2JFTU8yUWI5ZjJoL0dzMFprZVh6bGI3NGFNenZI?=
 =?utf-8?B?UVpTbmlsZkdGam8vcUpjdk1kM1ZqdWVTTVpDK2VrV0FFTnN2dHJZdHJwYkww?=
 =?utf-8?B?QVRhdlhYNTd3enlvcURBRURJa0pmaUw1MTBWOUhVVVcrU3lCYlRrUmk1eUZl?=
 =?utf-8?B?Sld6NkExNE5BU0xWNis2NGZESThhVVBucnlDRjdSczB6d2dLNC9vMjlTSllw?=
 =?utf-8?B?dVFFMHBub2o0VEl0Q09oc1YrTzFaSWlrZWlaS1V6VmJ3cUJnbnVIU2RKSDJr?=
 =?utf-8?B?eFVpTTBSM0o3ZUFMaGJML2wwWCtoVnhocUdVNVI0UTNSekdZRkJDcFhac2lI?=
 =?utf-8?B?ZVV5ZmhSQStVQ2xLQkhkdU1RVHVUYVZwUExlQ2ExUUdON1RIT2k5S1haTU1N?=
 =?utf-8?B?OG1TR0h2ZVJaVkhHQ3UxQ3Y0VHRPV095OFNCbUxvSkh5YjZKcWJvYVRJL0lD?=
 =?utf-8?B?TUdCNGM4WXRwN2NsbkdqcHduOTRvQWw5dVRJK1BHcXpGZ2RjNWxXQm9uZVpw?=
 =?utf-8?B?ZTc0NlFqTUZ2ZWRqMVE0RVBVaE54SEtRRnA4QXVpYlZUWHMwTXFDL3YrWmYr?=
 =?utf-8?B?Z2orLzNlVG1TWFgzUEt4YkEyMnU3TnRSMXV0Wkk0cDZPbTgwTDd0czJaYUNY?=
 =?utf-8?B?S2I4bmZwV3BTUHphS0pLcFlaSXd2YXpKL0hNd2tUV1ExNWxmUmU2WktkMitx?=
 =?utf-8?B?WWZzdjJQSHo4MXlYR043TDVpU0lqdUlrVlhXeHlNN0o3VEVVYTZLYUYrcXJH?=
 =?utf-8?B?NmdvMndIVEU5Q3VUTlhnZElIU205N3UzT1Jrc1doUkNZUm9MZXBRbE1EdVFQ?=
 =?utf-8?B?aGQrdjB3MnhIOFBiQmx1RHJLQUg2WldkL0xwMjJHVHNOL29ndWJ2RmJNTm9o?=
 =?utf-8?B?ZXlPK09qN2tQRWlueHVNempiS0hZYUR5UmhjaFNnKzlSK3RjSzFqNXZYL1J4?=
 =?utf-8?B?cElQVmZTYlRRcndLWHVacUNYaE9wNGs5ZWIwTmgzVW45N0RMbTBaOHdyYTdt?=
 =?utf-8?B?Z1hWM08wTm0xVHJUVE5KRDBqRmZRamM2ejU3OERpWkRvUmNmY3MvcXI4bzR3?=
 =?utf-8?Q?AAfCXseruyAmMb7U=3D?=
X-Exchange-RoutingPolicyChecked: kM4IcgRvS5F+WpaoihVCpK/I40fR4ExrGIxhtHQd9aqIXs8fZcXl4HaF9M4y312FFibNSSTVhT+dPmfSZZ4aG/qJSAb5KuQJqkK4D5c7r3DjgJW2QH3r38ilx9QgqIugDQvDwfn0K28LdCDJp5A65pUAGGBaiH5gbUdWM6nqolCCizCc/FEu2MII8/ih5PjfnbEZkl4JkcFduJW6PInNCm1bbJXRe+OXc5Oe1tZgVGsD+gu2P/ENayA4LinovjKDq+/VMY3GgxbBfy6fM8yUZbED6d/rTJePGYaK64ZtUL2MBDWRNkOT5ez6J3QNqCAkJ19pGWivsS6TRUW9ssichQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6f7865-684b-4027-002d-08df3988b8a2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 08:59:08.8172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNEsmKMGWYUHrgiu+dTCaLNCMSr4NRk2h5EUfa2o+PIdHTsyXEFd6PeQREjDWNeA8diPqbkZozk4bn1KxYgbx6iXxWnvWFtUvJzMh5M0HBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9880
X-OriginatorOrg: intel.com

On 11/3/2026 3:35 AM, Liao, Bard wrote:

>> +int sdw_intel_init_pdis(struct sdw_intel *sdw);
>>
>>  /* common bank switch routines */
>>  int intel_pre_bank_switch(struct sdw_intel *sdw);
>> diff --git a/drivers/soundwire/intel_auxdevice.c
>> b/drivers/soundwire/intel_auxdevice.c
>> index 5983fbc5725a..114dadedfa14 100644
>> --- a/drivers/soundwire/intel_auxdevice.c
>> +++ b/drivers/soundwire/intel_auxdevice.c
>> @@ -423,6 +423,10 @@ int intel_link_startup(struct auxiliary_device *auxdev)
>>  	if (ret)
>>  		goto err_init;
>>
>> +	ret = sdw_intel_init_pdis(sdw);
> 
> intel_link_startup will be called by all Intel platforms, but the PDI
> initialization are different for the ACE2+ platforms. Please call
> sdw_intel_init_pdi in one of the sdw_intel_hw_ops ops.

Indeed. I'll add a new ops, init_pdis(), and update the ACE2+ related
code. When I've created these, around 2021, the ACE2+ wasn't there and
right now, avs-driver does not utilize SDW with ACE2+ either so nothing
shown in the tests.

Thank you, Bard!

>> +	if (ret)
>> +		goto err_init;
> 
> This is after sdw_intel_link_power_up(), please goto err_power_up
Ack.
