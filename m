Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1091552952;
	Tue, 22 Sep 2026 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099033; cv=fail; b=otBfOhoFDee5KeAXqCyspDtnpb/Q+zEjEbOQSfsRi1yz1eSjA6mJPMykNj9kw2NDxjm8Pl0v8IksfOqd8aq/mS6CmEHJwPbe8B49cxSa9JlMa6krsNfJEVBcouyVu5edPYQrlMM7MmYkcPUDGB0LkYr5mMoTkQE+3xbo3BO8/Jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099033; c=relaxed/simple;
	bh=RJwgxahn02Zt5AyoOdShJLywr3IQcq2aAaCMgVKH+Cc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kzqXrazPXGp5ozxWlWB5cAhjfGq1GLTxe08IU3gpJr39Gcnj5HwmpW0lTi/KCD7jCBrgI6uEL8zK9A84NQtVD8NOTuCzCrQFyAHmibvDZ5VcA4TapfjAV2jBS5XaJYRZB1h11VnpAy+uuEXNXM3L1LFvlPoYIN3f92I/5DdoDsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ga6Fk0IY; arc=fail smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ga6Fk0IY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790099025; x=1821635025;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RJwgxahn02Zt5AyoOdShJLywr3IQcq2aAaCMgVKH+Cc=;
  b=ga6Fk0IYk9b9Eh6RLyuf2yzEuqo7IxNPXSblX6QqMQ7jD76Prqm4JNxO
   MMUFKBNfH+PTxIdX6YMAORy1kMYzzjphhzlm8bUG9qxfwjWaTBadcsNsw
   kEqUPg5D+5oOY/uXMKqS2p+Jero7eGI/3sE78gsjxjO13B+rwwgGPObXO
   7l+mFzdQ24Qi0k4Df074RgTEogjJtYC/ifHyh85tYLfUnH+N898W7GEy5
   cGPtmHg9bUAcmtR5UzzoQAos9rbnEtaKTpyeI7w856/mCntABIDa84K7Y
   FuBfahbcyhxLb9vfDL2UoWYQByk427PVnfImV3ex12YRo25duBvoNh2Ky
   Q==;
X-CSE-ConnectionGUID: fc+1HUkDTma9pchhuc559A==
X-CSE-MsgGUID: 0H42by6IT1W2Oxi/KQbvtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1226121"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1226121"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:43:39 -0700
X-CSE-ConnectionGUID: c0iXDTg3SV+dIzRhRwSWBQ==
X-CSE-MsgGUID: V0hJGkVARHuxAoR/gVC+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="273433911"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:43:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 10:43:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 10:43:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 10:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lELUeAhwhpRQMdauBYlB/07x0d2+rt8/11/l0JpurY2p8cfYoSOICVDw1//ZvPNtrntpobQKn/2ZZVx1lFP9/7jkELv0npkmYBoT7lr87IQq/eyq3AQXCWyBMXE3zNKAKl8Ad2t4e9y+b/Ijwfu1l7cR3SIdeDI/5P2iKlNg1Goc+tgarYhwfakrIncESfqXQq9V3AVePaY75ytK+AZxgCn2PkX30YD4NpJrdIR+c+/2dUkf3wiFwElfJQjIoJupjv9/1tIKijOu8ibVcO0MZDWX8Nso7DcE+gmkKaBF2AU06f2vxexKxQOM3oF7gMpo5QrA8U6iq1Nj2uaTZQPt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzppWJDXZMJtU2jiMEHQDzwhIs83iJISHyF7xMYmz9g=;
 b=g1oXpY40ttWvPOqklLlictT7EcA0u6OAUTsDXUrujd1Cdh6XeUGV+e/MK7by0pb4hh17oTENOrMo0qpmI4mG/7MpDjZRTMIJccify/AwKPctioBeBVIklmMIK9J13thekN1t8QcBJ0o1tq+rKvyL6Kq1Opd9cDWk8Z/I70pu5KyYA+gHpHunorm8JKyVV3harmtYUS237agMNdSxVIoNZ7T3l9mNbIU5cMLH9slcxeQZ9jbFAx9SbJzj7CbA9WTpeDQMB0ZuTAETyHT/ExNDLEykzsVqm/pJ0q9a51i2OHsVa3ywt771yOJqRidNjJDPTyGZp1FoxFQysr4lKfPJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF44E8B88DF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::825) by MN0PR11MB5987.namprd11.prod.outlook.com
 (2603:10b6:208:372::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 17:43:34 +0000
Received: from SJ5PPF44E8B88DF.namprd11.prod.outlook.com
 ([fe80::76b5:a8f:a26f:f57d]) by SJ5PPF44E8B88DF.namprd11.prod.outlook.com
 ([fe80::76b5:a8f:a26f:f57d%8]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 17:43:33 +0000
Message-ID: <955bcc90-00c6-4571-b7d2-46a0823a75f5@intel.com>
Date: Tue, 22 Sep 2026 19:43:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the cpufreq-arm tree with the pm tree
To: Mark Brown <broonie@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
CC: Christian Loehle <christian.loehle@arm.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Sumeet Pawnikar <sumeet4linux@gmail.com>,
	<linux-pm@kernel.vger.org>
References: <arJRjM9WBBjuXdHG@sirena.co.uk>
Content-Language: en-US
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
In-Reply-To: <arJRjM9WBBjuXdHG@sirena.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0089.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::11) To SJ5PPF44E8B88DF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::825)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF44E8B88DF:EE_|MN0PR11MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b76a056-592a-4872-ac7d-08df18d10584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: NCUmt0OnOfvalKcWPNvKQVK3OK14aJC/HhZaGEt2mdkQqSDlIPmhn0wRRDBQCXeqFGutBcr4D3rhSNbIWi0QAo19Phn6cE8j8DOhSCbE1HVBfIEeTVp3ZmaheDaKQAP/fqzshmLEZ2p9xwIPDYl0SvZHIlMOQrS6V+Jc03m3vr2Ac02Y6kAsIu6lVo7K7btldsRgSFQNG01N11P1eCZomx7rmOYfHQgKqJkbR14yOYqBxGpF9LdG6RQprupSXOMEiz544jmYr4T7c8yGlnCz5TGnq0G+9xhNw/dpxV8NLwHwDpqhP+S4QLogAbOmANR5ETsfFKpXmhMXHx0F0aI7QGrxJmEMihe+hnEIwaXXc7SDSJmojfJiquiCrfif/SOXHiipb90VfiRJ9woKHAQ7mHot5fzAtfYKNrYpVOf3v6qtt94i1Zekn5tarPcSCEhNGH1yrrdhuEbbumecW4GIlnV5ImwkHWkDC/l7hfp1X4y+D9Md2igK3BWlZMrKTaTtIK1zHGIrJOqU2Kr1CYpsywdywHMb+VDg+hZBzfnnJ5zob4MHWPyqjQEQA8o/LjuLoLyYNQjfc+NxVYlQRQyjbDd2rrGxoS5w5i1j8npJVwrW7cd0BzIcffwZhb7pwHvXiWc5PS4R7e09rRKo6tUW1MHGoVxLOkVpjj74DB7IXlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF44E8B88DF.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGdBL285aXRSN0swMzNEYWhJMnQrdVZmWklJaEtmOVFEYU9sY01JMFFVM3dV?=
 =?utf-8?B?U3RVVytzM1paRUhsUmdiQVJ5eE1aVSt3TU9ZSmtJYU96R2VLbTgycEl1WHY0?=
 =?utf-8?B?VFhPeFVRSG0rS3kwUnEyMEsxZjNKV1BVdm9jK0k4MXlLRDcxUjNPcDJNNllF?=
 =?utf-8?B?UnI1REI1ZkpJZDhBckVsZlY2MjJCUHFnb3puZCsxTTVlVzZpN2pKNFNoRUFC?=
 =?utf-8?B?dGRiSFdEQWpNSXAyR0lCZTdYN2xRWm40Umh6UGtDYUxqWWhmYnl5V3krYkE2?=
 =?utf-8?B?bTZtaXZHelVQWUFDYm9QTFZzZjB3ekVHcG9VNG1LUndvUFRnV2dIZlFYUnVZ?=
 =?utf-8?B?N2J2K2F2ZjN1WGpHVkRJeTd4WDNXU2FvTDNZTHY0aFJ5Um1xdlRBa05pU3dt?=
 =?utf-8?B?cGNHN1ZPOVlVZlVEeVBjOEZpRDhVMVVONkt2RWdNcktGMEdjV25iWUFVc1VC?=
 =?utf-8?B?M05DLzNVb3dZaWg0dkJJZG1VMEtIblAzRkE2QVFDbFBqUzlzVlpTY0VHYzNj?=
 =?utf-8?B?MXZCNldtMEtXSTVMUFM2VlVpMXpTM1hZTVpGaVlZSm14N1hYbFB4dWRkbHM4?=
 =?utf-8?B?blJSNUFKYnd5b1A5Ly80OGQ4Z1dweGtSallKUHVGSkt6YVZCbUdzeGxDZGJ0?=
 =?utf-8?B?aEg3bUhpRWxkWXd2b0hxOVZUR3Fsa3Zmb3l0UDBSMS9FaE4vYXg3alNkT1Z1?=
 =?utf-8?B?NTJiei9zUlRRQ1hBWHJadUhBZDN2clJSVzYzU0w1VXJUR1lVVHY4T20yYTM2?=
 =?utf-8?B?S2lELytZTnBiWWZualQ2VGoyaU1ENHgwbUZ1TWhwY0NlQXNyTkhHdXVqNlls?=
 =?utf-8?B?K1BsU0xjVEV6dXk4ZlJQUWh1aXdJM3RiNXBCWVZyejFTa2c0WWR2ZGRHM3FG?=
 =?utf-8?B?ZVRBblo3R00yZGVWemFUdE8rL2Z3T29abkVVdkQwemhqQ0lTbHY3Umo4OXBL?=
 =?utf-8?B?Yk9EV1hLNHNuSUh1TGlERk5oQjFjSVBwZ2d1U1J2SEVoRXdEdlZKNWFRNGtQ?=
 =?utf-8?B?elF4dCtibWVPTVdXbWxUNFJsckJtbVZKTEg2cFVXak84Z0wvbmw0OWNFVS9y?=
 =?utf-8?B?am10TlJhbVJJUmJWUDFPWFJHOXBSb3U4MjBpVVY1eEdCSDdQQmFpdGd0QSts?=
 =?utf-8?B?OUdiYzNwd3hjQkdBaTN2RnpGd2FvbzBLUzB3OUhoQ3JKT1AwTVlObFh6MWU2?=
 =?utf-8?B?UytGbzE2ZE9rRGZPQmZ5WGVFOEY0QTg2UGd3UWlEM3N2YldRS29sOUJMRGd0?=
 =?utf-8?B?Skcyd2M5T3YrcVQ0dGZuZmdwbGd0TnF1NTZISWVVbit2WmdpKzZuMitpek5j?=
 =?utf-8?B?V0FsbXNNdUJyR3hUejNQNW4vODZoejdhYTR1Y2g1S29ZU3R4bk1jZnNFdnVO?=
 =?utf-8?B?R2Mvc2ttLzVqS3ZkTWUwbVNVTWVvL1REbnFSMjB0UzlqMjhKdXR2L0NVdUEv?=
 =?utf-8?B?b3Y0VnlnU1FmYTlvblR0Z3VPSGlKQVJoRVE2eUtKQ1pUTStwZ2tGbnZHTXVW?=
 =?utf-8?B?OHFBMVZrWWJINmpIT29mbHMwL2hCVVJYaHFKTmY2NUxtWFl0SkpyVXBtTGhT?=
 =?utf-8?B?ZXhTTlV6RUo0NktReE1BNURlSXV4cEd2aU5sU2Z3dWRmWkRnZWx6NWVWalJO?=
 =?utf-8?B?VnZrZnZVTlNSRUNmWmF3ZGZrMlRtSG9WN2JSMXpIVDhKclRudHdiS0w1Qmpp?=
 =?utf-8?B?akZQNUlleTN2WUM5aVhUOUF3cHkrOVZabVRxZjZBMXBZZkcycVgzTSt2aGY0?=
 =?utf-8?B?TkpyK0pMcVQyZ280NTVsSHc4WlhGSGo4TlphbWpBRW1keDJRRkVvZEpNUDlx?=
 =?utf-8?B?OWJ3ZEVOWW9CZWd4b2VGZmxSNjZUemREMnI0OGpFNi9aTkdoMlFEY0ZzUVFF?=
 =?utf-8?B?dm5jd3FFbUZQZFplNVZqcWFZZEUzSy9wb2pSMVRDN0xyVzcrUnhhNGI5a0x2?=
 =?utf-8?B?dFFKRjlZTm1xZXorblJUV09vM3NFc3JZaFJSK0NIbGdYSFRIcjNCaGJLSjJi?=
 =?utf-8?B?Z0p6ZjYxWWJ4OG4zNFBmTW9rejVwajBYbWdzbjhLV3hjVTVYQUhsWThQWGhV?=
 =?utf-8?B?NmZ2QlpNVnZkMXhCZ1pQNE8xUkh3cHZDOFM5QjdocTZwbFZ6ZTNmOUZ2YVQ5?=
 =?utf-8?B?bkU0NnBoUGlmTzk3U2d2V3V0eVYyeCtjUFlpaUkreDRuOXBWSGx5aXgxSDZ4?=
 =?utf-8?B?VklJOXU4Z0s4U1gxbkhDNjFqOGxRT3U5ak1Tb1ViQmpRS0VNK0tRd0IrUDFa?=
 =?utf-8?B?eUs1YkxwYWJXVmxXSXdoWDE2bjZJSmhZY0g3OFNQOXFxMFlMN1RvRU9lOUpn?=
 =?utf-8?B?elVLTmg0L0dhRnVJZmY0NmVwdE1JVlFWRzR0Y0FXSHp5SmxzNTA1VkNWKzRj?=
 =?utf-8?Q?Xgm3SJqFCOP9KdTY=3D?=
X-Exchange-RoutingPolicyChecked: xLvNNQWsgroNAtB5GIqbBA+gShSgupusnncz/pvL0m8JbxcTSm2ktBzb63jlkoUGHGQu8uE/oUyryFVKX0dviGSx8EzKLlvUWvNTVIq1ySy6F6/om1MIAcn6jN0ZIlY4DoQzbIHxNn0mPsEfZp1ZUbFA5K6FEQRebS/G+FmKnUcVSc37sFvD3aewhUkVXugHXuvGW5zwabY2nnmIy9SjtGHMFCz+VPC7ue7fFWokXIX7GpVh0/4j9HpySz9Y1FISUaXSzQ6vl17VZ7GFyC2ulAsenmZClGQALGMa6ZbGNrjxSkFtfP675d5uKxFX4pUv6+QHL70AgusTZc8HJjEX3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b76a056-592a-4872-ac7d-08df18d10584
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF44E8B88DF.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 17:43:33.1194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcIYjEag0k6XLqtUcY/SiLh8rDhYrRzkl2lb8RiAZDJBvfp7idkeoF6H/QqWOUaq7blkRO0ecsvxVbW+c6KGbhzI4gtWnPp/LTINpm5lMmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5987
X-OriginatorOrg: intel.com

Hi Mark,

On 9/22/2026 11:59 AM, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the cpufreq-arm tree got a conflict in:
>
>    drivers/cpufreq/cppc_cpufreq.c
>
> between commit:
>
>    995e7d4680706 ("cpufreq: CPPC: Create the FIE worker before enabling PCC callbacks")
>
> from the pm tree and commit:
>
>    d82d896f00e7b ("cpufreq: Use %pe to print error pointers symbolically")
>
> from the cpufreq-arm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc drivers/cpufreq/cppc_cpufreq.c
> index 09e55bfdca885,f767898ebfb57..0000000000000
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@@ -240,19 -228,16 +240,19 @@@ static int cppc_fie_kworker_init(void
>    	};
>    	int ret;
>    
>   -	kworker_fie = kthread_run_worker(0, "cppc_fie");
>   -	if (IS_ERR(kworker_fie)) {
>   +	guard(mutex)(&cppc_fie_lock);
>   +
>   +	if (kworker_fie)
>   +		return 0;
>   +
>   +	worker = kthread_run_worker(0, "cppc_fie");
>   +	if (IS_ERR(worker)) {
> - 		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
> - 			PTR_ERR(worker));
> + 		pr_warn("%s: failed to create kworker_fie: %pe\n", __func__,
>   -			kworker_fie);
>   -		fie_disabled = FIE_DISABLED;
>   -		kworker_fie = NULL;
>   -		return;
> ++			worker);
>   +		return PTR_ERR(worker);
>    	}
>    
>   -	ret = sched_setattr_nocheck(kworker_fie->task, &attr);
>   +	ret = sched_setattr_nocheck(worker->task, &attr);
>    	if (ret) {
>    		pr_warn("%s: failed to set SCHED_DEADLINE: %d\n", __func__,
>    			ret);

The resolution looks good to me, thank you!


