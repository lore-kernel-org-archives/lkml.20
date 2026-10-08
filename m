Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921AA47B423;
	Thu,  8 Oct 2026 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450506; cv=fail; b=nhvDSH/XFXgZbyVMpedyI+UvJxNZD3hvyUmBKXKZNbsBmeKh8hzfx4efTn/6ywSKkeaTqMSrSHdpsghexg29sXFw1FBzaL3NJIC3asDbvaZX0S9+1Q8kTZHci5Z39wpAVpT5rFFGNdQP/EbXnWF6sHnZU8YbzyrzPxf809E17Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450506; c=relaxed/simple;
	bh=cuhIBbHNxWPtRkSUKXFSqPdOJvIHjyEnKvfyfRszyp4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gm9L3HQ8+n7fCo/27IAtMIZnude/KTWlrwkj+pFf/RBvEKlezxxUORR6M1sucXYv1R0gA108JNTgqLvHEP31+wScAL0GCtHIuEtbABDvsTWvYhDy5FbiBIG7Zx212xfoy4yBMUPuRY2GFI2ZUN8qwBw7qhtOjEDG0tzmRMIBI/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6sYzCfy; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6sYzCfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791450503; x=1822986503;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cuhIBbHNxWPtRkSUKXFSqPdOJvIHjyEnKvfyfRszyp4=;
  b=k6sYzCfyUNrHSV7o96g38QjxMXS8Lz+cqNzW9IVmBh4GFpVryFXjk0Lw
   0fWKjHI36VEoGgtxW8XK7C1t8TdNQ83b8rQCVIiWMliQvB2gIafXu2a3V
   KsrnTD4fQVS3oj2BFaEq5GwXHHt9RIysRoJq4N9X1EwIXToCSaZm1J7Wz
   ZrQQ6K/bJkUHOZvOUVHsrhGodS+8nC4+PhTrHN9JmHaTxBIApDCaE2c4W
   JvwqUm19bmyZfPju3+h2Epy2t+Z8dOJjZz9Jsv3p7BsWz0QfpraQ/uAzI
   gOV4rxIUfD10xe2e2LI7yPBK0tnGe4W3hVEH4etmY/JyzZqUq2F2mWGrM
   g==;
X-CSE-ConnectionGUID: NhwiqqW/Q7qqTX6lcaFA7A==
X-CSE-MsgGUID: uarMLQ/4QAq6Ek7f/kPDMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="122017"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="122017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 02:08:22 -0700
X-CSE-ConnectionGUID: 2w7pOFypTq2X33a2N67W2w==
X-CSE-MsgGUID: HjJmW1NRTlOmva4tkCmYbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="94561"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 02:08:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:08:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 02:08:21 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:08:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuCM7A0qjSqG4hpQ3m6phJFvYYklCeV0wOVGe6/JLcnJnYPq/0vC1q4j/FkGkBWG7vJAdP/gLmityDz+OrL6aEAtWYJPrySulEqAc0XqKFhyt+5ypAAXhIzokOuwBPKNy3Z+27t2NSOvnDJowzwlRnRHioPIwJOlyhUZSlcpSbs3/RnfRIe1EOBQ68WB8ISKvxCS5T5iiFjcAz1LVCNIqN3a84ZpKSEQr2fhqrdBzaUgZDk5/+/OYi/qCW7SeLP04iHmwG55PXN/XCKuBHywQW+oTQp/9bBid7Kd3Ys56WKnt6i6QojNx15SZ2XFcA9XmOFBWLCmTTLtyt9EJZI5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAPIcpBNuxmmJ1FdypZxrqPLGTJl6PXvrs28wotTfj0=;
 b=r5M9PcsQnSxIz9u8C7nrSVFtXERh9sfLxCdDxz0Z0sF/9V82ilfX57NLW8JaTrVo3F4MeXICSsPuiISVEj0yfldcXTEmLRHOyMkNOr6rx+TMztP3uNFVnZKybf+qbtKXUrdEZ7x1Mgvwu/fbKa4kpgZTCD8xUfa7rUyaYA7J5yVvxJOSactm/lfF3IqTqEVVrFYiP2D9vjsYuYCS4MZFjtZXCeTq3RNtzhSEG2Zwnv4LvPG0hE0nGciGJa4kg/LlakhI7aSuGp9cwAJC9yoc3DmbZI5MhfTednhR61uNrRWVAlvUqnv0mGWSlbbTNS0ACdrxanAAEmxnNiqTL8/rkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Thu, 8 Oct
 2026 09:08:18 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:08:17 +0000
Message-ID: <7efc9ca8-b470-410c-b717-3c548bd196f1@intel.com>
Date: Thu, 8 Oct 2026 11:08:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ALSA: hda: Stop unsol events and jack polling before
 codec unbind
To: Takashi Iwai <tiwai@suse.de>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
References: <20261007215650.159871-1-tiwai@suse.de>
 <20261007215650.159871-2-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261007215650.159871-2-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0047.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::16) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|IA1PR11MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 99671027-b22f-4205-50f5-08df251bb13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|18002099003|56012099006|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: 5YNwz0UXryklKUQExCV8gOOOEzqaASbPhvxbmcwpmUTDTkVY8rkMbysiu+IzwkX2FP1n5UaZdfnUuMvoUtLDB7s8mWufnnyowAYnE1AwPv8VldgoqmS/NkHOFPaG9nlGvvl3FEqGKwvyPa3fHOfZ8R+aazEH4qJdzLoqK/Tq66q236vndl84rDt3r7aQI7T0kp3djzSB9YCppxNzAAu5/59FUitA9U9+pQDErmASwd8yk+IIjyvaEb30Rj7924mOtpSYV+sWXJe3NkMRkW+ppa8094YLk4TdwqPMz7nAn5SRZrM/EEUiYen4p6703+rYOjjkWEBdW31cFdyYOTjPG81oui0wUjB2VQgvVd9a6lvUKBggfIOZjfCV0+jdpqyHBHfR6aNkzt/wdLf0pxhLsj5+jKGY+mp66fJz8nssuGKHz3CqfsiAeLe7moEoTvgtK5gzD50PDz3gbScrKwNJZ0NKv4k5BL97VyqGCfsIiOxTwlawd6+9DylZSqKJrB41lFq2yC8Ie45Bur7k2cW3uCaf4PzECaz3Gmm2/Iu9cBVvamx1YSxSZzarlvd0GZIacb7lydwPhTH9SilYb4gqpfOlIz8LId+RG9gGVKB0vIgNM5oRBg2CvnrOU6szUjGpfuRGBu2ESIS6W3phwoVhuur9x4IVC/gPIzlOAQGx5ps=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(56012099006)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVFZUGdDWm0vSGxxMUJ2ck1rRVdzcEhwVlFWSlhncjBrTHZMU3dpdFZuWXRz?=
 =?utf-8?B?T3VpQnBRNFdvcE1TcGJBeUlqWmtWTVMyYlZZc3g0dUtncGFFaDhGODhqRTd0?=
 =?utf-8?B?NlQ3RkhYNUdKQ2VFVkJ1MCtZNTc5QkJkeUlpRUhDRzFqMmFpbmJkOGVQRFhx?=
 =?utf-8?B?VE1tSWR6TFBQbmNKSmxheE5Bd0tzbUk3ZDRLWmpuK0grQ2Fjcis1dVkrdUZk?=
 =?utf-8?B?SWJjbGZIS0t0UlpZRlNlUVF2dUVXMDQyQ3ZEYVZpbUtrN1FGTmZMSnd3VXRD?=
 =?utf-8?B?RzQrQkVtcGNmclF6L0kvcHRWTjZ1YzNjVWkwcVBrcTBmMnRZUVZOdzFRVTVi?=
 =?utf-8?B?czg5YkhRNUtQRGpKNWZQK0xaTU8zak1VdndBaENxYzBXakxlekxWVlFVQWM1?=
 =?utf-8?B?WUdHNVBveU9LSEZJSHlXeE1BNVZuNm1WK2JGbWtEOUJwbFdIYTBPUnhGRTFH?=
 =?utf-8?B?a3c2S0hCN1B1SEZQek1mbTVBWUFIRXcrSjNTbllxOERZVFBvUlNCekl2Y1g4?=
 =?utf-8?B?T1YzV1JxN0ZIT2tVaktPNDhEelQrdEo0Y21ZVGZwa200eVJjalpXK0tvK1lP?=
 =?utf-8?B?a1ZLY0VySnYyVUxsOW1BZDJZTWFnMDFJZEJGb0EraVNIOEc4TWt1TjdMZHdM?=
 =?utf-8?B?ak83UWpLQnB2SWc3cHZYRWgwOUJ0b0psa2xqZmpBTCtvWVFTQjR3UjBPcW1E?=
 =?utf-8?B?TFlaT1dYdWg0R2R2RFZPR1lld0xDaUQ4TytmeUMyTE5NeEd2Njh1UDE1Zm12?=
 =?utf-8?B?OHM5eitSaTJUSENsdVhZL1cwUGdwczJRMzRyYmdSQ0xxM1FsRWNkNWN0STRK?=
 =?utf-8?B?enlWS3ZyN281RmE0OU5XdlZWaUloUU9Za1RvNWhSYmlQVDR5eUFYV2pqRzRv?=
 =?utf-8?B?NW1qd3RBRVJrYTRKSlRabEhSQmVVR2I0U3VseEVsOHhYNU1CODFqd1d3RzZL?=
 =?utf-8?B?TlRqRHZ0NDNMUUZIdUI4MTYxMzREbEN1NzZOQmE2SjFCK2lXR2xHSERmd0dy?=
 =?utf-8?B?OCswUEo5RFk4VW5yc0xjaUYrYUdvM093RGNrc1ZObThiMndReWxHb0ZIRzVW?=
 =?utf-8?B?bU4yVkhSQ2hBd0FVT0k2VjdVR1N6aG9PcmJHSzRGMFZiY1BKc0tLZkZqVkdU?=
 =?utf-8?B?YjVFMUNub2MxbzNrekZXRHBkMVRPQ3l6YUt2MGJHeGthNWZjc08xMHFMR1hr?=
 =?utf-8?B?OTd3OEd0dFFMYTc2NXlqeVU5SnNhUjdqcDJkV05YRWtYWTc3YW82NUUyYTc3?=
 =?utf-8?B?OFBwQlA2RStPeEJWUERnSExpamEwdmtVQUxFOEZScGZwcm16WFF5RlhDUVRO?=
 =?utf-8?B?Y0p3bE5WVmpRbEdGakJHbFhYRTRjNjFEM1dRdGpFZktOZ3FuVDArQUh2OEVS?=
 =?utf-8?B?Tm8vNGExSTZhTklRVDR2YWE4bTAzaE4vWVh4bTRzQlZwWVlzN1VSd0V5SjhS?=
 =?utf-8?B?c0RrQ2Izd1RzVlhMYWJ0NEpidDJEdWVBZitweWRjaWlkcExZWWdnbmgyMXBG?=
 =?utf-8?B?cW5Bd2VIWHNqNUNINldhdzBYUnJITXVZYXlRWGFUVnFPRGlrT0NVQ1hEWnR2?=
 =?utf-8?B?MFdoYlJRakNxcDRZS0ZUTzJ6RzlxZ0x5SEJoUnVkRGhtMU9rb0VuOVo5QnIw?=
 =?utf-8?B?bGk3RVpidVY3bkd5NTdTWENtamJZL2NjZDlqbGpwdWhoaXpVSW5hdk9SQ3Rl?=
 =?utf-8?B?U2xHdDVHSzg2TDdXRFg2SEEveC9BWDNzeFBNUWdsRVRLUnViMWJVcmVLb0p1?=
 =?utf-8?B?bGV4OTZZdEpVeTNsdTBDdDFWTXFjOSt2bEs4SEVvZ3hxcTd3YmpEak9ySHNj?=
 =?utf-8?B?Z0VWdWhNUmptRUtCaWNjMG1nYklmTjhRYTlPTXFRQWUvZzNhek5QUXJlb1gz?=
 =?utf-8?B?dUJUZG9UejFBRWpXVEZXYlpsT3hZQm5KOGRNT21YNmpQdkRib0ZxUkNlZkN0?=
 =?utf-8?B?ZndGcHFxNnlGWGF5ck5oWWl1T0JpZ2o2WUExUklGY05rcXRqL1RIQTZ1a1pM?=
 =?utf-8?B?VWJTRjdETEVWeHZLVnB3NXVWTC9yQ3JIbm9hbTJKaXJHZjdsZkp1dnVESjhs?=
 =?utf-8?B?UitldDI5aUsrYVVFKzZ4YURvRUF1NG94Wm5vUkFPOExBSkZJNmlGeHdacGdz?=
 =?utf-8?B?OE8wUGdVU2gySkFsY1c5ZktBbVRnOGdDQmJ6WGpFbzJKa0RQMjBUMW9ja1FE?=
 =?utf-8?B?NGlxS1N3UWpEZFYyM0lWZEZNMC9tTUdQd2oxU2NDcW9QWFpTL2ZDSGhTZ09o?=
 =?utf-8?B?bGk5d0hMMEQ4bVJLTitMUXExQksweWk2dzArcy9MU2RMZGY3c2VWR1FyZGdI?=
 =?utf-8?B?ZVJ1eEpUUWRIL0o0V2ZIUWRDamUrSlRpLzU4OGh0ZUJpRzkyNGZtUT09?=
X-Exchange-RoutingPolicyChecked: uM76XhJNFbSmC5MPCz6pIuaPfBPLtYv1ezgY0u+SozukewZNyTWC8rdQH2CJHmDRrsYnZLAAeoLl1MSx4iAEwSuSJ5B/YIgXVX90e04Yb20Pfez+goYcmYr2IfNneF3jnE1kXTKxFAOI6Pjr+rb1p0lVgUHINl0QGxJD9ZL0bCvZuPsRSyRphkTaYGhL+C7tqUvmbov4w2WH5OU1LdbsEZfeQ2gVWFTqtA+5lwqzZ7lKdPYrfSOE7vkl2IN+Wd98RngWtBqkef1PkVyPT97f9m0X87IAY051Q4IlJdbODindQ9/tQhn4AurhTWfuJU8KEmygtNvj8hFV28gACDvfSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99671027-b22f-4205-50f5-08df251bb13c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:08:17.8929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NY0AS3z1nQ7KvKv8J39p4KgUyJqG/LwyZGJ0FeTiKT4u1nxvTZ9Kd3J9uTzHWvM+CL0oWE9l2ruY0lMH5SKBYw2k1TpS3aCYHi5QX+oMa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7754
X-OriginatorOrg: intel.com

On 10/7/2026 11:56 PM, Takashi Iwai wrote:
> At unbinding a codec driver, hda_codec_driver_remove() calls the
> codec's remove callback that releases the driver resources, followed
> by snd_hda_codec_cleanup_for_unbind().  Meanwhile, the unsolicited
> events are processed asynchronously in bus->unsol_work, and
> snd_hdac_bus_process_unsol_events() checks only codec->registered flag
> before calling the driver's unsol_event callback without the lock.
> Since codec->registered is cleared only in
> snd_hda_codec_cleanup_for_unbind(), and there is no flush of the unsol
> work at unbinding, the unsol event handler may run concurrently during
> the running remove callback, which may lead to a UAF.  The same
> problem applies to the jack polling work, which is canceled only after
> the remove callback.

> +++ b/sound/hda/common/bind.c
> @@ -100,6 +100,9 @@ static int hda_codec_driver_probe(struct device *dev)
>  	if (WARN_ON(!codec->preset))
>  		return -EINVAL;
>  
> +	/* unsol events are still blocked until registered */
> +	codec->core.unsol_disabled = false;
> +
>  	err = snd_hda_codec_set_name(codec, codec->preset->name);
>  	if (err < 0)
>  		goto error;
> @@ -160,6 +163,10 @@ static int hda_codec_driver_remove(struct device *dev)
>  		return codec->bus->core.ext_ops->hdev_detach(&codec->core);
>  	}
>  
> +	/* stop asynchronous jack handling before freeing driver resources */
> +	snd_hdac_device_disable_unsol(&codec->core);
> +	cancel_delayed_work_sync(&codec->jackpoll_work);


IMHO this is a proof that ->registered flag doesn't do its job.
snd_hda_codec_cleanup_for_unbind() is called right after and it does
contain cancel_delayed_work_sync(&codec->jackpoll_work).  It does
contain snd_hda_codec_disconnect_pcms() and
snd_hda_jack_tbl_disconnect() operations too.

I'd say it is snd_hda_codec_cleanup_for_unbind() that needs an update
and perhaps be responsible for calling driver->remove() too.

> +
>  	snd_hda_codec_disconnect_pcms(codec);
>  	snd_hda_jack_tbl_disconnect(codec);
>  	snd_refcount_sync(&codec->pcm_ref);
