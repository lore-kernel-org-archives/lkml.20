Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A054825CB;
	Fri,  9 Oct 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531905; cv=fail; b=fDU0pVuaBHR6c70fPkHL02qULj3UlDz7zW2R7byRF9IoCq8ISLZHe9VtAOPICrjtowx7GPnQzMvIDY5V5KphsT7VhAsVzHTCXabFK2wbfoqkt5Oz1tdD3ig52NuJMHKSbW5kUJIjACiHz7blrwfGxpJGwnDWmyN4ZADeJLtvcE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531905; c=relaxed/simple;
	bh=KYHfzMbVaq609lyN5G1BS2B6FH8vcd1UnIEa3Xes62U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m+Tq03ugrznfxr4ZGFzSx+qzkhm74C72EJink5K2pTeEp/T0/8ybN53xUr2wkPIjAPK3r3wjIJ4mNKkLa67oNvdVoySzJ9uRYBSEJthciv1wO+lDsGj9Lo5G06zhvHQZeJabyxnZlYgCYrHhBTnlkultryUVNu0rDUEUlBO3nTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WcxbOQ8q; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcxbOQ8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791531903; x=1823067903;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KYHfzMbVaq609lyN5G1BS2B6FH8vcd1UnIEa3Xes62U=;
  b=WcxbOQ8qlPqMYuXVpzZdz5BxhX3XA7qSBW0WfvZzjxZZDJSEUoKBeOvf
   2iRUD4lkyQYh2YaYmC0GFuoZJv2Setdc8Cs/1VIcveQNhFQJrl0+pr/CE
   REHwE+RVmKNYEFZ2K/Ce52T/2oG0XMP7dAzAbAw4yQNARxEi8qIZBxhVW
   umZtuYe613SPLEak2jfEhejZhVxGFd3iPnI+k1BBTK89YZhXPVnLkZE5e
   Hahazz/kCuvFq20WJ4WtsqlSGTvFX+ytd75PtnG36wRFcJnLsYtgcTnYb
   4GkowhecMRGerJMCM3bSJdC+bCEkMH4mnr+AwRgN6GjX8/dYbsz4KjBeS
   Q==;
X-CSE-ConnectionGUID: 6B5WpSO3SV66tprSnfkupQ==
X-CSE-MsgGUID: 4jFiu4XnSYKxacOCegq8cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="334541"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="334541"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 00:45:03 -0700
X-CSE-ConnectionGUID: anL4XFWnQzmYVS2A+mn+aQ==
X-CSE-MsgGUID: 1PuPrxMZTJO5Vqxsvnoewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="239278"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 00:45:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 00:45:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 00:45:02 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 00:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUrG6KDVx5S4HG1XSks1SXdSGJqIf+98BhK5WnwxeZfAuVDRwyDqF4I2L9TJdh3w8n+CFuBpZXcAy8Xm1ADLm4CbmwFf3kV/Vo6eC9WnBWPOqYp6sjThYQwHKEBHO860UwLcVw5YmkEpWeXJ+IGTljgm5U7aK2yXexa4G2AM/+mjMZFMSFDYDHZeVYY5pRNlKr+CI2SOJjno8nqLusHoUmKNDZ2xQn4Bpo1mNSuo6z8vfF+vmaFlWu5bdD2jvFIIRWWgVv8IxoK84OIBbll0FJOgh+iV6rQil74GWjxc6uyePrpW+0ua5mduaDmiDGcsuLT0yqk7AlIDx1heu/YYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJcoHmvkOM63Xy45h+xSIxog/C8pYzl5f7EyhR2qMMs=;
 b=rgURXT1MC5ikiAuB65+IvCyFjsiXEIr5OBSaxMxSvUhzAZQmo2GeQxMTe9w/10OpesF+BtWEOIjfSVsoB4FAwcNSCkd5tu411C0mmorVkLBhUXN7aakQ1LN25+QURZ4qpN9DNeesCGiBsRWOBboV9Ar4eUEd69dMMzOQX1QVkQVOij0pmljtGhFn2BPOgiz+g+2MUx1T5niM9Rc8E3l+TfNNNa+vsmFmaGqE01zMN+b94bvwLJNHvFiqxFrP7ZcHIpwJyCUMEChPBgGMtmdNGSOwb6VuxMrDSaEKVYg83v0Fp6aYcg6N5UUwG7HUZ5Bx5Nd4VKlyK3V4HimQqJ07+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DM3PPF807974CA6.namprd11.prod.outlook.com (2603:10b6:f:fc00::f33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 07:44:58 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 07:44:52 +0000
Message-ID: <eba0472e-5bf0-471d-beb2-bcc0bdc13a7d@intel.com>
Date: Fri, 9 Oct 2026 09:44:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ALSA/ASoC: hda: Fix race between unsol events and
 unbind
To: Takashi Iwai <tiwai@suse.de>, <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>
References: <20261007215650.159871-1-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261007215650.159871-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1PEPF00005B8C.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::625) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DM3PPF807974CA6:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9c1704-2cc3-4538-0c5f-08df25d93431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Szb0SX2Mm1CurHQPyH3cW2h09Z/d1e/Itqt6roJIuEkIjF9FhJwZ+0tyd6KM1DIWQrdDT+ajiFbRkaE43Kfpo4T1Z1VBRnyBAonFpq0iLhD0lBtCZhjOcigCJLYUIGNWJ9Nn9VCXHz2692bkQgXXFdp31SIsglS3aDG6IFUB5shGvoHFPDuLycfsIoccUcGLiYdxUPy/UwaM36Sc7JfnvfkYfMkewX4M7ZR1E0fgZO9x/avgd0Seo2kcR7tHxwGeo5OyF40r04BGdDxYlMwsJEu5PR4oSnbscXEJ0GroERfgADc3zMqdHrmkHbSZ5xfWaCSVGPnQNJ4tiAMNnjEVo2wMkfZiNtw9inYYs+tTEZ4Fk1ZB6Z69OQlTKCLUKHS0OJ4YItHt783/FA4lzk08gGL0UWe7fYZhodSEwpWK/L9GtoBivlw5Ar+KhSJe5GJZ0RVxrAl1Wcg3rVVf7AY3hBISpqoppGih3gd9hg6cl5VjCkdy/jKqrUm6kvUQ2TE8VErTd7+cP0kAOq8znHoDITevsb9LFHDI8p9nayWJ7sVOfkbzkVpZegs5NPMY/iOD4plzVMMTwLsUCuR8222KrHMnJLKg53YrhStnuVuAmo4NqrYlKPyegPayV5rGWi6id4xeVBm0tvZK/xlHBa4KUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHdVb3RJNTMrRUZ0dEl4QlpwZlR0bi9TL1NLVkRsVCthYnVUbXdsREtya1R2?=
 =?utf-8?B?bXNsYzdsM25EOWlFNXBjazc3QVdPRDdjOHVmNEZ0OFBVcFRlMXRPc2FMYUxk?=
 =?utf-8?B?MGtjQ29lbTAxbGtuRVdSWWZKQXFWc09lSkREOHloQ2N0azR2WElDWHk2QmFG?=
 =?utf-8?B?OW90LzVaaXNRbklCWWZRY0pLbDNhTmkzeUQ1WTJka09xR0czWUZ6anZqd2p4?=
 =?utf-8?B?b1NZOXVWdG9pcFc5OXFLeHhsdGhNTHl5ekRkeEtzcHBiQ3k1VENaU01TNld3?=
 =?utf-8?B?NkFiUW1vYk9VM0lQa2haVHJldllXU1p2QU5IWDRPcG93SU1xUWJaWFpHWXpn?=
 =?utf-8?B?ZEVCZEFVNG5Wa2xYbEJWMjBmWmhyWm1kZkxQdFcxajRESG00YWNXdDJMSlFD?=
 =?utf-8?B?dmNqWmpRNmx0VU1Hbi9Yc2ZIVVlHSFhDdURsWGl1TlpDbTJ2b1VsVmNOOE1V?=
 =?utf-8?B?ZWJKeXFYK2hwU0U5TDU1bk9FcXltR0czdkExOU5TNkV2bThzSmQyY0lOQ0lE?=
 =?utf-8?B?THlBbUVsSWxLeHZoS2trY3pTYkovSWFKTVFhVTJWTzFzajZwRElXSzdIekhz?=
 =?utf-8?B?bXNndG5ENjZxRVhNN054cHh1YWtGQy9vT2krdDJrNGV5QjVEWDc1ZFg2c3ZW?=
 =?utf-8?B?UjdDeUV2ZXJWbGpWRURXcmltT1ZvYXcrOVhEempOTnVsTEpuQkdLWVdtL0pX?=
 =?utf-8?B?R1haY3QyWW5WZzdQbGZ0akJtaURFZDlOcDlWRUFaeHFBa3JjeTlhWm9ueFRQ?=
 =?utf-8?B?VHpJK2MrcmRUbkdrS2RQOURBT3lQaTh0VFlDNWl0NVozeDlTQWk3V1pJK3Y4?=
 =?utf-8?B?eUlBOFgxYXpHSDIvWVZoMkRXVDB2Z2ltdmNOTmllMUZJOXlTYnU0YmNUVjh6?=
 =?utf-8?B?bGJ6SVRSZHl4OVN4V1pEZ2Q1RVhpZG5sclF5VWc1L3lPenpRN1JuM01qZzNO?=
 =?utf-8?B?bnRyM2tNM2tsWDQwckpLaXc0WmtyblFkNjN5ZVFQdGs4MDJJYlJIdVdYdmh1?=
 =?utf-8?B?NEU3ZXkxTVFqRWowbldQLzE1bkNxYndSN0o0UlY3VTI3RDZiNW1UZE9Kb2ho?=
 =?utf-8?B?RXNqTzhqUURCR3I2ZmU0cGZsQ2lGaEpSOGtiZUt1VjZuTnB0aWVLSi9nMXRM?=
 =?utf-8?B?TnB5elkyMkJ3eTlkdTRPTUliUUUwZDhueFMzcjdEdTRhVS9sUUdSZURXbHZR?=
 =?utf-8?B?a2Njc1hvQzh0QktKcHpCNm5NczdnVzZNZVJYLzFsTFNpQ2tkb0JLY3VrWjkv?=
 =?utf-8?B?dU1UeXFSMjA4b1NaOWgzMlZUSmU0cmd4aXpmL1VuWnBNWWRHTTFwaWZZSlhG?=
 =?utf-8?B?THFSZzI2MEtITm9uaGJYUlZmRWxXU0tyN2RrOXJXOHkrV2dmWmNRNVpEenJD?=
 =?utf-8?B?clpzN2wzZHZBWE82c0dpekNyTFFNbExMMXpnWGo4eGxaanRPRWowYUtEVmFZ?=
 =?utf-8?B?cGsvRlJibE0wMWdRSUxyVldhM2F1Q1oxQWlWQ09rZzJrVW9IU05JS1NtYkx4?=
 =?utf-8?B?cmRvWWZLeklNcStnQU44L1pLNHFickVveitramN0Vk1tMksrL2JSZUlWOE9K?=
 =?utf-8?B?TEFISzJOcGcwdUdFVkk1dVE2MnFmL0lkdkFVNW54dVBQMUkyWFdXZnNSMFR1?=
 =?utf-8?B?RFFqVGR4MTJuTjJKcXlJQTN1b0t5L2hwdmJzempqRExzRnJGUnA5VmdXclZV?=
 =?utf-8?B?dmhzODZ2QlhRcjlLa1NWU1BzUG9tRFNDb3lsdCtXVXVtYUFhVnVsNWM1dW4z?=
 =?utf-8?B?K2RNc0NUaDBIb1gwN3ptRko5a2UzZnFabUtRVUd0QVg2SEpYMzduWGpxdFNv?=
 =?utf-8?B?U2RqS25ibGgxeTY4WjRoVUs0OXhxN0RCdDh0UGluL1czY2JJall3bXZSOFBY?=
 =?utf-8?B?V2ZpYzd3TlhWaWY0dExFV0Y4MGM4YnAvbFdacVFuVFRpaWV6bzBUMlR1bFFz?=
 =?utf-8?B?Rm01cVRna0M2SFpHeEZNYUFxRjdrclNKcWVFZjNvd0V5VzVvNjNKeGdYSmVy?=
 =?utf-8?B?MVpBWUpKMnJzRnM4YXRZeUxJNEp5OWVLUWtqOEF5NmJoTDcySm5Sc25qOEJF?=
 =?utf-8?B?b1daMStWcnBTN241YUJodFZxV3JZS1QxMUtVVmNwUko4SjBTb2tQYW5wSTRP?=
 =?utf-8?B?a3dkUittU0tMN0VNdXpiUDMwY2Y2djd3RmdQZGVKMTdxNUpZRVJIOCszZHJN?=
 =?utf-8?B?bGRQR1RTakx2RFNGRlRuaVJSbitlS3dJcVo2U2tOKzNuaCs1N1EzMFBnWjF1?=
 =?utf-8?B?VmJySUtOMmJaakZLZmY5WWRWcUtSVVN5TktIcjJtckRQSHp0NWJHNjIyYndP?=
 =?utf-8?B?akJaY1l3QnMwendmWGFiODlZeENpcXBzdURSVHlHMlhqQWFUNmkrYkh4WjAr?=
 =?utf-8?Q?LiFBeMusXP1UGpIE=3D?=
X-Exchange-RoutingPolicyChecked: NjtVd5QeMUQWnQDKVbJNE5IutP9foGef3kZpwlA4ueLMXltgjcMNNtyRVTdh8j5bSrEwQkL9OMivnFGJGJ1t/0CTbriLH+mBpGd4TmkFcFoPg91yqWMR1QqTndqBBnPhnf+hDVvrX/Nal5/wbFZ7icqoj8Zvuy/N50k9z/HM8CHXlnifkj9K5oJrby873rZ6KibojLJHOg8GflM//e4gm4hiQJSEzpfAghPlENANo1oQNLt9I7aKxepjf+Nkzul/iO3m9VBq5x+Bm2oAyYzboZENnOPGiRUF1+lgHy5la/oOLGk5aTBLFadgHcFID1jAWmK7OZ9nrAZj7ja1R3rHpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9c1704-2cc3-4538-0c5f-08df25d93431
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 07:44:52.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGK+OBn75c9TKIWGzg0L+OIYpqJhjkrZZkDFkcOB5qzf6Cy9i6s9M7wSktSWsPy2TKHdm6q6Iz7TjxLWsjqlTSMLNI8tTcjx3j2K2u3y9lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF807974CA6
X-OriginatorOrg: intel.com

On 10/7/2026 11:56 PM, Takashi Iwai wrote:
> Here is another series of small fixes for HD-audio, beginning with the
> fix for an issue reported by Sashiko, and extended the fixes to ASoC
> HD-audio and a potential improvement that were spotted during the
> development of the first patch.
> 
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (3):
>   ALSA: hda: Stop unsol events and jack polling before codec unbind
>   ASoC: codecs: hda: Stop unsol events and jack polling before codec
>     removal
>   ALSA: hda: Make hdac_device.registered a plain bool
Thank you for fixing the ASoC's hda-driver too. The first two patches
I've reviewed thoroughly, look good. The third is something I can learn
from.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
