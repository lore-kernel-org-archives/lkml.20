Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793697504;
	b=B4kD4glV6GXwJQO5UUS9o9czrLSxeHRkuFwAuFDkZVMhn05c2w3ObM3Qte/klwbVDu48
	 cAXosgpRYo99b6VjjNx9Ueg+7tOOn+0GH2wsUDgKnkpEN3QpgKA7he5Cto8l2dtzAAHFl
	 hnHmxRkL+EYdX14ANNBcNHTebIAgTwTpXC9gMLyTD2FXtiFNJ++cBVgxZPxzYsEvKR8Qh
	 zc5ksehYFPhC0BajgstcBzAm8ABZ268IHmQFG8GnqYIjrP58xQ9CBxj9F5Jmve4EwOs/v
	 ED5WcPtGmsftfLBD10OE/TKC/jTw1RmEHYm0+BdJWv7xDg0ZBI8NUyf6DZezSI1U0GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697504;
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
	bh=kgvOlemPN+AxK6pW+6bOYWw/tSC/jyS6myqEIMK1T9E=;
	b=WFhdCRrBI2Papt9q1Q9A20ccPfoovCNkXuW/j1H4Y5HSg4zJg/dZtcAj9/U8Xd1BFl3s
	 cqBOEY9PsfETPaqaCR41W2itHMjtz7mkPBao+fPQLQp8fZiWAwZSxquMB4sisyqdWOVuQ
	 vE2LF64NOHyuUNW2G/KeTaWIc/4VLqMKMFgZ8tmeYyk9L+85KhxCjLQoM8rVUDb4pTsOr
	 SGL2a4wfXKi8ETMV6+HC91Vgi3j2aA8mwXF2uMbch11q9EzmUqC+HPnHrODX0aYBcQ+98
	 abOuB6SnTD06pEnfCNAJvJT4EVVxUBc8hIvfCioiy/xdJBUIxHPw7RrXt4WTswVjcqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h1tT18Zg;
	arc=fail smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12397606A324;
	Tue,  3 Nov 2026 09:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12397606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h1tT18Zg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793697503; x=1825233503;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kmE0apOH5aR8Oo7ZcJVv+wdAt/9mZd/CT2Sr/NwjpYI=;
  b=h1tT18ZgXsG+sCev/77WEM94U9bqbjIUYK+7q6hzX2U1J1CTa/m8b0us
   F+oIOKFREDHjKLfRAb5f8kG7p23ZGhr3Y5HjRGvX1zjAgfPoql/cNBuOY
   fI1B9dj0WHYMezWml7YDyToXZk6V9Q/Ox74w3JHE/LMNPNsM3WvFpBjJ5
   FarIPytKCp6Ax4ZWhlWCp+XO1bM66IrdY+qoqdAATsIrMKWtH/0Yad3OA
   IYUY03itYB/aBgsQbmEwL9F7TMy4AwYW/nvy0uSQMWHj3vpxK4d0A9DZC
   YUrvkxlhoyBZWvXr/vpCw9j1egrMhYKcIbVNAHK4DUs9kH5ASumMAD368
   w==;
X-CSE-ConnectionGUID: S0CbElG5TFK2Xmt2qLBrOw==
X-CSE-MsgGUID: dlI1ibiARQmGDgGYeXFUWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2421038"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2421038"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 01:18:23 -0800
X-CSE-ConnectionGUID: ROzxPCx4SHag/Lq2tSPSag==
X-CSE-MsgGUID: yUuaHCfuTsmmNyz7kSjq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6264100"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 01:18:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 01:18:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 01:18:21 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 01:18:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cM6r3pTO6ZAaix+RKE2EtrSdE/nlpZbkMG9UnHtATcsyOSEP7x9BLaedCH9gMSzQOk/Z06x6/D4nl/IB7i6p+7EMpHP+v/Mz3fznk9MiBIrBn2iqEqsW8QHlNoek+XJ3TuMKlJNDRUB6aKsDJKq1Hxk+lVkrdA7fSh5dGFRUEptlxQ4wXVw3ITpPYi000eCwvMdwwyZcBZRL2ObCsnVTjJLAsA3H2RkwoI6gez063FJ4npCPcWp7blz3xeiBrx1Hw0wOxOqxPfdyjyEjpUA8EJjh3UpP8NRp8nBAoQ3sBaadIpEgAEPn1SGxrhxuIFWy7pXAlNrAlmamKt2CZBjKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgvOlemPN+AxK6pW+6bOYWw/tSC/jyS6myqEIMK1T9E=;
 b=lo0tJVBXfRCGlM+CbMCpeRu4GoExUX7iEO5nfbu5Zcb3WZVD9wFuw2Q8Mcd58LzDTw0FuQB+BOgZAv5mdu5C51pFgFXrYEdkOWpuwYEma+4HQnZp7jWFKjJahN/0c2bwOESv/ibNn2xY+XEGYHuyo7j1pK2GDGZ16dKr9LHl76BRVvSKqSBqx7Rv0E0W3k1LbYzRYTZlZ2PIv6tQ9ly6jGtoaP31Gj2zXjAOWeLdqOg3DqHEZiFvdsR0eo0A77yXctNUOabwGhNspwcE/Je77a2EQIH5Slc7QezVketUSdnC2w2gqLNj8h0SikMQuXpoDFT5pmw3F0w6FeRj+d0Mgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by IA3PR11MB8937.namprd11.prod.outlook.com (2603:10b6:208:57c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 09:18:12 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 09:18:12 +0000
Message-ID: <6dc77eea-392c-4d63-b2e5-cb0f7d43466b@intel.com>
Date: Tue, 3 Nov 2026 10:18:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ASoC: Intel: avs: Soundwire support
To: Vinod Koul <vkoul@kernel.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>, <tiwai@suse.com>,
	<perex@perex.cz>, <amade@asmblr.net>, <linux-kernel@vger.kernel.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
 <aulzN9MCl5CJB1Al@parshuram>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aulzN9MCl5CJB1Al@parshuram>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0152.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34c::13) To PH0PR11MB4952.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|IA3PR11MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3e29c2-25ac-4b88-3a88-08df398b6227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|261021121427099003|4143699003|11063799006|261028144727099003|261022105027099003|261026121527099003|261022075727099003|261026140227099003|10067099003|22082099003|18002099003|261102123227099003|6133799003;
X-Microsoft-Antispam-Message-Info: ZIvJdv+EdsYQAaCmg4cel9jQ2l8JYZbCfx3sMwaCxbcSUjyo9sqbYzdO2cRc65NRg0DGvkGJp0y7Sq6qYaFxUrcGW4Fu4Tby6srlNndWJ3OmcRD/Ga1tGwclGUx2GvdlvAqgpx6yLZDB8UzKgDGuzDXKzUMeq1aAn6h04thN/UnQIF/o6UiIzyPM/64MhHPtJPUo0/eP5inoFjpNXsYnVcCI2d7XpGzPbl8cSM8hEShc5/gKHAd19C2YHzQ5MixXO2JupGUEcFrIY5RX2L9pnUunvcNEf0DVGRB8lUvTMF+6fPm8xIEKuA7u4eGr4RwbfBidhKYC2CvyWHTWuS0TOQyJ3FCsVnK02RCh8DUhvUG9FVjKeqe4czhw15tYXPivrNE0ke8YwdfzBwZ78blzbbpotOOfEP7ns73C90Iw51/sPAEzsbWXT3A0qOONW2ldRelUqMoZFcgJYfMIhz+mWyPPd/knzOWgnM9tI3Ft6TLqJPFSC+wCcKCKHoJmIRJPm00rpugx6H0+/+MpPcGYaKB0N2LxAzm0oPyHU1hxV8pB7SSN42iRATbPVnpMdi96wkrXcHI3BhHYCS09XE1gOdXh1XYiU5SfaNCLkQMdxM4IK+9ESOIsRWO7cbiMK5tjLIgYRtXo4ODBfMlh6RrkRytzUQ255Bq10lEx2smQeLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(261021121427099003)(4143699003)(11063799006)(261028144727099003)(261022105027099003)(261026121527099003)(261022075727099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(261102123227099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE1VMFNTK1JrRDlCSStoL2ZZUjhmV0lOVDRoblUxNFVvQmpuUVFNdlhYYkNi?=
 =?utf-8?B?OHJyeVZWVEFEdGE3a0lVQitHcWdwTmltZUY0MlZ5YkVCVllVbVBQcU1Hcm9T?=
 =?utf-8?B?OUNqVHVmb1FIb2xiamd1TVNVTnJxQjJWb20zWnR2TTRaWnJzRUJ6SXcyekR4?=
 =?utf-8?B?ZTUwQ3BDaEVTTm85cDh1NW1VaXNoTVZzUkdaSkRQUTEyQUZqRE9Ba1Rxdm5S?=
 =?utf-8?B?RWx6TFdQZG5SeEFGQUNCTTh3NHVOV0V3anRMQ1c1S21oWEJTRFFpVmtBTkNJ?=
 =?utf-8?B?V2krOVNJSzdXeW12Vy8rYUNybWdaK1J4RzNqL2xnK0ZuajQyOGgyUmZHQkdS?=
 =?utf-8?B?SVk2OXJzV0poWXZiQittWHl0Y3BRdWlBOEdtT1k4cGlZWThUTmZHcXA5cE9L?=
 =?utf-8?B?eVR6c3VjMVlUMEUvcVVMZHdQUHBnazRJbFRTQ0gvanFLY2dXNllEbmFvclVO?=
 =?utf-8?B?ZWlLb2R1TGY1QW9hSUdUNkkwUjRtaXNHNUh0bmduYVRKb0lmb3U5aUk2RENM?=
 =?utf-8?B?aFBteElrN0lRd2phd21kUlhSTHdIT3RCYTd3bW5waEFrZXBaRDhyKytneXhI?=
 =?utf-8?B?SUxuSHZLT0c0ME5NTzVNclpibFQ4Z1IxM3NETTNlSkIxdGx6YmRVVXFDd2R6?=
 =?utf-8?B?YmlCTzJvT1R3RFozc1Fwc24rTXZESTNNVGl6b21qNmswVXZrRzM2Vml0NTNV?=
 =?utf-8?B?TTBQSDRNM2J6V0RqU01nR0gwbmxJNk83NTI5Y3BEbXIzK1FvTE0rNmNodEY2?=
 =?utf-8?B?RDc2MnNBL2pYSWUvUkNMdzZMc1lGZkQ2TExwRmZvWEFhL3owOGhJZXdOdW5R?=
 =?utf-8?B?NGtDWG52V0VCcGZ1UVI1WjNtek85OEMzREsvZzJpNCtlWG1TdDZRRFF0N2tu?=
 =?utf-8?B?MFR0WExxaE0rcCtRbldxd0tPd3dHWEd3ZXREYUh1Q1hJOHc0eDdpOU5VUW9u?=
 =?utf-8?B?b1V1VzJRNTN4d3pLd1NxcThJaElUcVJvRXVMdHM3elF5NHQ4cDFweGE0ckFS?=
 =?utf-8?B?ODNtYmRRV3FBWEw1UHpCeHpLYllsVWYxQ0NkQ3NrejhVZFJiYmdFOEF5bUxF?=
 =?utf-8?B?NVg4VmZGRnl0cGloRUtxZjFvakZGUUtmZ2VtaWhaQTZPaWR6WEVuckxBWFY3?=
 =?utf-8?B?TVkvT2dLaVRjSnVLT2txOHFnQTQ3MTY2UHlSeENuVnVlS3kzYkFIR1Rpczl5?=
 =?utf-8?B?bFNKM2tDdDFERHRNMWZrVlk2ZGF1V2JuVDh0SEtKcWlVK2I3THhLYVJ5ZUNK?=
 =?utf-8?B?QVNCMGQ2dk5iNjBwME1PN2VJZStKODBzbkw3L1Z0ejRocFpBaUJjSW1oMWVz?=
 =?utf-8?B?bFlMRnFrNGQ3S09heDBTZllsUHgyc2ZJczJ6TGpyYkwwa1BpaFdOeEIyRGUw?=
 =?utf-8?B?Y0kxdFNDVGFWdXMxNzVDekltTlc2dU1JZU0wQ3dBZU9JclRIMXJGOFFkRVZO?=
 =?utf-8?B?dzVMYnQzQ1dDcXpvK2lHYjJQTmRLd01LWlhBRjNDT1I3bDhWeCs4Z1RjWGdF?=
 =?utf-8?B?MXhMNU51Ukh6U3Fhdjk3MUswcmJ3WXp5cDBiTXZZemhYcVRaRWEzQk9nMVBY?=
 =?utf-8?B?VFNNMk41bW1UblZ5bGRZamVLbU93amNhSXk1ZjNtYnFhamhRS29ZM3Vydk1G?=
 =?utf-8?B?cWtZQ3pTemlMd3A0MlAzRWdwNzJ2RnRFdHJQeWZnOVliaWVkVVlvN1NrMU94?=
 =?utf-8?B?bnkyVXNTL2pWSXBHbkoxeFlMUXNBOEtwWDJLcjRzQnVpY2FTeFppbUNQMjVC?=
 =?utf-8?B?V2MzVVFoTmJ4ZVpYQjRkN2JhUmgxWXp4eFJRM1RsRFpBOVZrU0k3OTUzUVQ0?=
 =?utf-8?B?QjRLK0g5YkRzazJsODBCVnNHQnJzaFpoanQyUDlWTVVZWjliZzByR0grZms1?=
 =?utf-8?B?YUhWRUE0djVUb3FkWDlJQWVNcllYM2JNUGVRQzQzd21hY0tNS0oveGd5QXJN?=
 =?utf-8?B?cDJ3YTNldEFwRGNiQVYzTU92Y1REN2kzRXhzNkN6VytBbmQ0UDY2UUNXNFhy?=
 =?utf-8?B?QktHTjJ6dGFSeWlnK0dBdDNIZkdHK0ROWDFsazhMb2pLNk1nM3NsU1JXQzBO?=
 =?utf-8?B?WDdlYkNGck44cnhTdDZ0UG1vT2dQZVBQK1JqRURJdC9MMi9SYkZRQWpsbGJR?=
 =?utf-8?B?QTY0RHpFOGFEUmt3di9ubmxnZWtmSW1XcC9FcWdDNW4vNVBrdUsySlpNZ0Ev?=
 =?utf-8?B?aHFzeXgyWENTZGlWM3V4ejZ2V291OFVpcW1GWFJkVWlEbzhIUWFOcnJmOXE4?=
 =?utf-8?B?MG5UYTlOK21hSm5ISXVZVUlWN2pYaHpGaXhEU3QzV3hnMVEyS0pLNGl3UldB?=
 =?utf-8?B?TDYzV0JSaDhuSWxpVlp0dHFOYXcxZlhOVml6NldVOWF6bnpIM3h3c3cvOHg3?=
 =?utf-8?Q?uM8UlsODle6yGjdc=3D?=
X-Exchange-RoutingPolicyChecked: B0raekGy0J2SOGzoCi6u6r0sRavPklWP774WJVSGhZJOsBrPq/H2Yz8KxdTAsY6jyc3PlnU4yUk0bycCGYdFjsllIVbya0x/uFhARIXiD8y3SMWthi/kb8bLG774sEydxA4VsQb4pFsm7uedXP5ElHOll2amkLWNXcwPh18e/b8jyaZa9k+E0Q2eKhs3yyNtgfkNQimlSfZY/Edbi9QE19/Js2kT6hyX4m0Y8CYPZGwfrDlCsyjwcibaKgKWPyygX3YtJzTuN+L+miVvoeTs6YkLpqt/MwRj/ariOPegq6XuUqAE+//TDa3hHQu3ycskh4bMI3smNruaKq5C9L2YpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3e29c2-25ac-4b88-3a88-08df398b6227
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:18:12.2066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUtlIU8/kOqX9Dh8hFZ5rc0DQBS1iWyzBpaF8BRJY4szBhA53I0w+0uBytvXiKuUguY8sHBHCM/Tt8Uva8HS6TepOkGDpoSORADfUDfhU4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8937
X-OriginatorOrg: intel.com

On 11/3/2026 6:37 AM, Vinod Koul wrote:
> On 02-11-26, 19:10, Cezary Rojewski wrote:
>> The RaptorLake-P and RaptorLake-M based platform used in Automotive area
>> do utilize SoundWire for streaming audio.  This patchset brings such
>> support to the public domain.
>>
>> If possible, I'd like the changes to go through Mark's tree.
>>
>> As the patchset updates drivers/soundwire, I've decided to strip it off
>> any machine-boards and have here just the changes done to the main
>> soundwire driver and their user/usage.  Machine boards for RPL-P/M will
>> follow in a separate set and do not touch drivers/soundwire stuff.
>>
>>
>> The reasoning behind modyfing the soundwire code:
>>
>> Typically dai->startup() is responsible for checking if all the required
>> resources are available whereas dai->hw_params() is responsible for
>> configuring such resources.  Existing code does the PDI assignment and
>> its configuration within one function - intel_hw_params().  The logical
>> split is not possible.  The change provides functions that represent
>> such logical blocks: assign, release and config.  Such division exists
>> already for the HDAudio interface, see sound/hda/core/stream.c
> 
> I understand that you want to split things up which helps your avs
> driver but I fail to understand why should we add one more layer in
> soundwire intel driver to handle one more driver from Intel.
> 
> Why not modify soundwire intel driver to do both startup and hw_params.
> This way the driver does not care if it is calling sof driver, avs
> driver or somenew team driver! I would like to avoid a new driver
> specific handling please..

The avs-driver does not predefine any resources, so that's the first
difference. Next, the avs-driver allocates all resources on startup()
and configures these only on hw_params(). Given the state of
intel_hw_params() function, I cannot say the same about the second driver.

I do agree that going forward, the existing intel_hw_params()/SOF code
could use an update. There are more benefits to the split than just "the
split" - the hooks in form of struct sdw_intel_ops e.g.: params_stream()
or free_stream() could be dropped.

However, I believe this should be done in a separate series - that's a
refactor and touches largely on the SOF code which I do not test in my
CI. For the refactor, I'd prefer to send such a patchset to
thesofproject GH first, and once their CI confirms come back here and
update the function.

Is such an approach OK with you, Vinod?

