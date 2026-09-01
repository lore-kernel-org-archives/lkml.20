Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B1737B000;
	Tue,  1 Sep 2026 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275620; cv=fail; b=uj2E9QNlb2JxxGfyCkwV1V9ZxFFk7AzwJZoEVn0tJMaoQdcmMWYYVsT3vLtNJKDKOsaLn99Iet/5SY9FmjnruBKWQO7QtGade4B0upS39AH+wvRLhnHdhr8EOPxhaJm56VddePX8quqJrW3vsDUJK7KOPIYbeCxeFSSM2a8Jnv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275620; c=relaxed/simple;
	bh=ASttXJWPaQnv82ZkYXfsDkrPakDzuWhyZG+A+F43EjU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SVA2Q55HvNE8FbqQhc9wRa1RPS322Iiov131NugvI5ZY2QMA22KxSO3qZncD4UzJJaxvioT0+opf34fFXmAdovGS1Jq7V1H09T44XXNHQIT2AAv+98ReX+RTxD2iGQ5QtAd23lYvnOyTmpbaDDQ8vxvV/rNaVImijgc//XxDOtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LppXrOg2; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LppXrOg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788275618; x=1819811618;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ASttXJWPaQnv82ZkYXfsDkrPakDzuWhyZG+A+F43EjU=;
  b=LppXrOg2tW5cQjO4sqqLyxGXkeWLIWDftIXfdf5Z7Ly4g/IbZ9ITydhd
   Gu6EilpeQrpMBXha/N4kflSGFGLZPWEt0Tn13OS3hBGzjVZyogoxKqYkK
   YOK8aMthTcE9rLUvpobbpTG5pA538PfycSSnEKSUHAuCfCmgqdz4LFRA5
   eqXWgPPHpGlX+T1TViHkcaQnSyhs3NFrnSmRjA7ZcKvK1B6n7HpgEwQG1
   rEkMbypVNuVj6Zl0/HwvUGgoD0NCXm0uoX4UgUixW1ckGc9Q8fIZtDB4k
   elm+hBhoRdYTQ6vcyHgW1FPb2QIcK3BmFeYU9mnxvEdN9JPCz4njjJYNq
   A==;
X-CSE-ConnectionGUID: JDqUHwpRTZ2vgZTAZPCo3A==
X-CSE-MsgGUID: 48fY48yORbaJcP00/lh8Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99868483"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="99868483"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 08:13:37 -0700
X-CSE-ConnectionGUID: u3EWlU7STKagdcSdHlnx+w==
X-CSE-MsgGUID: mjlaB0BfREmbkz8aUYy/0g==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 08:13:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 08:13:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 08:13:36 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 08:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7niV18xQPltIUM/JIT5I4kC8doGk7QD7unGSMbzPdas5sh1FqzihhdBUapu3rCMHryPnA/OQs9D/uPyXGY6g0ewAkO1VsSw2Lvcd0WkXMmeKE460bIKlLTwbIfN+3b3BWIeEAAUoeky35YzFDNbcLL2wZ9rMSBZj1TQyu2EfZNLsZ7XI3YuzFFlhkarYfoITa8+JxrK6wa+5yBmptvosNGPtI7h8Mg2bfnyWZmJKjY5x4H7B0fPH2aYIqXssFHYzt1kOuD+LVp2UBk/HJTkhn6RqiwqC4bErrijCnwKhpHntoYcysnKHNL9sxtOsqbSkzwMPhPi3tAHk5lluBrQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8vMOcijPzh7GdJOQopnf5rIzS8AieYo+h1uZPDfEDg=;
 b=Vg5B+Bq8EUVXSnNAcMLpWLMGPlYdd4ufre+GDgwDDu4N/XK0hvKWVMF+H/CPbLBAUe75NOqnKm2ET0XkrBVDqvBcLkPoLb7AVoqVnuFJVxg+rg1eui/XahKJOMBZaGqUOFZcKyAe8DzCYwu2lrYvl0Qrj2kwKKHwRQAQaYUxmsgE/ZhI0QHqWdDJg1XoYmsejAtXVP4CgvurJ3g8sOJp+jsW3Y67IHZiWD7Jx99S1ipYyXWEmyRRiB41lon6aTHDW4hum6TjVqAEqnWjOyTq0LUH5PcV8OO6VRjG5P972okc4ke+DctREwkhGTSSRLQr708geDqegIggszjOvH+xYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PHXPR11MB9685.namprd11.prod.outlook.com (2603:10b6:510:3ca::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 15:13:35 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 15:13:35 +0000
Message-ID: <012545ae-b1dd-4c07-9ee5-f81a2c92a5da@intel.com>
Date: Tue, 1 Sep 2026 17:13:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] ASoC: Intel: Add Cherry Trail RT5677 machine
 driver
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Yauhen Kharuzhy
	<jekhor@gmail.com>, <linux-sound@vger.kernel.org>
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
 <20260827181236.2421882-1-mauriziocasciano7@gmail.com>
 <20260827181236.2421882-2-mauriziocasciano7@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260827181236.2421882-2-mauriziocasciano7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PHXPR11MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a5f76d-fde3-43c5-12bc-08df083b9791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|6133799003|3023799007|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WB7joOcnKXMzxmCIN/HQmv14MVZI4Otkd+ETRyyEdYpGxpzjMjJPfKaiUTOKQGg9kmSg2hLEWctQZgplwY+fnTjskjWLQnScX9jGJMu8VijiqDag6sflCONox1rw6hhHoML4YFxOWM+6fFOA5tk7Zo+btUCGDe05un/AhUixIuonhxGA39Srzicta+kes+M4H8UT058mFkI7TVHgAMqhTEkL8Tf7VkqcUVIDSZm3lBPOLH7T6Yvol+j080H1S9IIEwRaRA3J/FuUQOgdbNi5VNe1msiponzJ3WwdwGoaIYB38FePoIEn4/GksEF93L8ijBLydsuI3wD6CWRhe9cR0Cz8rQ1B4BpIkqihCEA0HZaTrR0Zhi9J7RRal/PVt1hwdWho0x+wAB3FpNQXj1vG05mzL81pFj2lB/0qe2Q1zL7/EVUQubdGe7W4ihkREHCSpLqWAZm5D3XsMjUPOxYw12fT5McXIgGLYPfx6W9MoNavdXJ7gxYYR+KSW31waYKwvHRVIlODpIaJrxxpCeH2si5Demzlyk1D1l8Q4TU76exIPs45Cs12HjTdBvkiMLOIyUX6+6iCndWU2e8DCk3NrM/ycGD1sspnfbF5G3nE5FV4iPJYzWpONM45ZLG2q6lmVA467QgkhHtfjr430shFITAWaEzlHyYfErIsoysbQWM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzV6NFR0RG81Wk9ueThiSHVUaU5zQWN2NTlPaVIvQ0RDZUtucnhxaXhMVHp5?=
 =?utf-8?B?SGRwMU9Jb1pmNG90R0M4WCsrQVZBZjNKcGp5cEovVUxZdG51MDgvbysxOGI1?=
 =?utf-8?B?V2FXa0Z0eWhmbG8rTnZWYjFGWkRYLzZHRXk0Z3JCUUxUZjZOTWNQdWFmME1w?=
 =?utf-8?B?ZDhuRnQ2QXd1TEhYRWFKaGNxdGNrdFVpOEVRMUdRbCtMN0JaUExEeGN3c2du?=
 =?utf-8?B?d0ozY3BkbUl3TDdYN2JTSE1DNkR0N1hIbEVCRWd0K3l0ZnpwWU5OMlZRWVhJ?=
 =?utf-8?B?cW9QeW42MkJtUDczcStNZjFHZnJWMktQL2pFZ1FkQ0lIbjB0bndDY01UUFg1?=
 =?utf-8?B?RitrYWRaaGNXbFB6VTBneHUrWXgwdDQ4MGtnMmMwd3pPL0pNaGhERUxFNUow?=
 =?utf-8?B?SURHRENVc1VPQ0ZNaFFaMXBFbXE2c1g2NzBEWXpadDFCNUM2ZWE4S3dBYmpq?=
 =?utf-8?B?VG0yVEQ0eS85NEhXMEV4ZWQ3RWh5dU1RS0ZiTlp3c3VrZWVGbm9pUjR3dVRS?=
 =?utf-8?B?NXc3c0F1U3paMDBvYmlXSkl3dG05QkJNTUJ6WFBnbDFmRTdWY3dzV1pZbnQ5?=
 =?utf-8?B?emhPeGVUcVhwN0xhRFZsSUFYRlRuUXhJd0JWZEsrSEFTVVdmb21qcnZlQ2FE?=
 =?utf-8?B?Z21aSkkrL2lwSnJzdGd3Qm9DRloyQitqM1BhQ2ZVZWROZDMrK1ZCUlI4emxI?=
 =?utf-8?B?Z3BBaDd4K3pmenFwUFh4TUdCRWlBN0hVU2syNlVLUmYrVmUvUFJYaUZPdGVo?=
 =?utf-8?B?YllpdkFqK1d5aWpweC9yTEtpSWQ2ODB5YzdVNkFoUVErM2g1Y3p1UXp2WHdh?=
 =?utf-8?B?RS9VTEk4NC9ncGRqR2F4QjFKbWFyZTc5RE9nNW83dzJENWJTNE5CZEFhUktx?=
 =?utf-8?B?dm5GbzlNQWZERjF1bVZWd3pTeFFKNmVmdjU2amNmOWZmbnZPaGd4VEhXTzFx?=
 =?utf-8?B?cW5Pa2RtUlVBa3JpUjlqK08rT1d3TGNPaFp2dVhENE0wdU9BN2s4dG0yUlNB?=
 =?utf-8?B?UHNqcy9VOUFGTHhLL1BXcHJpbXlGc1lMZzk0dTdXakd5UG45Y25pS2kvakVY?=
 =?utf-8?B?SHVLWnhMRkFubi9McStrdWhrckVaOWZxMGkzbXNtVGZHM01DVC85QWd5ZXhk?=
 =?utf-8?B?NXJIWjZUb3VISjcyVXIwQWpkMlMzUnRrQ0dxMXhISFdWaGU1R1ZNSGNrZmt1?=
 =?utf-8?B?aVl2MExKc214M3dZR2pCUDFYWldIZVJ5dS9RSDNrSjltYlYzV2lEZHhRWldq?=
 =?utf-8?B?R0g5N0laOEdKQmZsSm9XSjE0VC93NXB5VHJDV2I2VUlLNW10bGdkZTc3WjNP?=
 =?utf-8?B?WlBiTmFyM2tSRitOYVdMRGdoblFoWWNNdGJibTQwVm1RR3RpQ2pMMGdkZ2Zi?=
 =?utf-8?B?Wlg5NTRGUTRjYjRlYnBmb2xqRUxZb0NRc1ZGaVdlcGZ4Y05WbG9RQmNEMTRZ?=
 =?utf-8?B?SWtvMW4vWkhWamZuMFRSUjRsMURrY3cvUTBVRVNaSWpDQnpkc2dRYm95SUdL?=
 =?utf-8?B?bm5EM1JiSFhickdteWp3R1VDck54eWNlSzRTWEx6ajJoRXl0VnF3ZlFwKzEr?=
 =?utf-8?B?dEU3ZUN3VVpXQnp1TWg0SDJ6RkV3WUxTbVJpbld5Q3lmNW9kcXdNUkJXajY3?=
 =?utf-8?B?M3dCSnhlUnd2S29adi9iZzcrVlUxS0tOanQ4ejZBd3NSYmpiQ2RHV2kza0Zs?=
 =?utf-8?B?a2pzbTUxMzEwdkQ2K3E4WmVQWkN0cmZoZFJJdFpPK0RDMjh2bGlhNkdaWjRs?=
 =?utf-8?B?NUhpT1Y0ZWZIUmtVY3RRdytibDFHVEpnaDlZbzRvK3V6OC9HZndoYU4zcXpV?=
 =?utf-8?B?WG9sMFUxVFBsNldwSHA3d1hWUUdBMHhXYXBEYWtXaW80c01tc2hsY3hUblZR?=
 =?utf-8?B?Z1l6N29mYzVrUFdBNUVhYzc2R3ppOUVNcUVwQ2EwZ3dZdzlDSWgxcXppejR3?=
 =?utf-8?B?VlNMdHI2dllkeUVoaytMeHBEOXNRWVRxR2FPQ0hxMDN0ODZ2ZklVbTJRZUFP?=
 =?utf-8?B?YzJuRmN2NnVySlQ2bGVuc0g2aHRjRzQ2b092NTlyNTlMdnVQNTU2K0RJMUdT?=
 =?utf-8?B?NXBldWQ1WUtORHJxTDN2YTZkT1NIZ2U3RjNFTlo2QWMyWnVnOWk0WVA1Mllh?=
 =?utf-8?B?RjJsWmJIZUYybXJtWTF0eUFQYUlaWXNkQlJMekR2Ri9SaVFlSDhrNkRuSWx5?=
 =?utf-8?B?b1VTUmdqSHZ4YWt2cUpMRkEwVk82REEzMGJ6NGVPQzA1dDJpcXNpTzdRNlY2?=
 =?utf-8?B?U1l4QU93b1MrNnUxUXBYRmdWbGVyK1ZUK3FnUUN4eFBJVmdZUFA0Y1BPQWV4?=
 =?utf-8?B?VXh5Rk9xZWRyb1kwMVFjT0tlL0tuSHJrbFJ3VHR6SzFBTmRmcVpGL1IwUTlB?=
 =?utf-8?Q?76lXdiU6t3Y6BOzU=3D?=
X-Exchange-RoutingPolicyChecked: vrjVgCKB4z+26U+9L9UFMdCcdN4zY0BNHbbKiIf5Z9d2pjaaefl4Gz+U1E8w1E1wTVD2aYh8RTTtWsB7GFGMscQ6WHC1Jc732ZKfnj/CzCBshl2UkcWKamuTMXQKKDa4Z0Gi7PV8q1p7gF+UMim7/0O0RwQEvRfLN0M/fJNZhPkN3MZeALr5F80u6fnemZCn9bM5a6Pr5xvHmip30NvPKtmtwRBpKQIWDUSiQIp7LdBbho6IEXW6vLu5G4BNbeM8/0UxMMzXyTaDNVnfMg7PWt8UUC4gxL7QMdQ/qONsw4Pjxv8GWdBI3S8K/uBy5/142veR/RT0C+PcD4LTP34n1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a5f76d-fde3-43c5-12bc-08df083b9791
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 15:13:34.9815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZ2AB3vGiWr2LBAJwj4uzMJxHkVAZ0BzsVQ2UJQ+6xt7+OSQZ8NyBB96AYGr0Z6ZU0fjIHgm5MvCxEwCYGpqpoXiFGCvgbNlZX/maRF3c8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9685
X-OriginatorOrg: intel.com

On 8/27/2026 8:12 PM, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91F/L uses the Cherry Trail SSP2 link with
> an RT5677 codec and a TS3A227E headset detector. Its amplifiers and
> headphone path also need board-specific GPIO sequencing.
> 
> Add a Cherry Trail RT5677 machine driver based on Yauhen Kharuzhy's
> implementation. Clone the card, DAI links and link components per device
> so probing never mutates global templates, and allocate jack storage with
> the device lifetime. Support SST and SOF parent naming, MCLK and PLL setup,
> jack buttons, microphones, and output controls.
> 
> Link: https://github.com/jekhor/yogabook-linux-kernel/commit/4e41d0ff72c1d1fd8d5c59dda247e4ca8a1da999
> Link: https://lore.kernel.org/linux-sound/20260611-asoc-yogabook-v2-v3-3-3128447b67b6@gmail.com/
> Assisted-by: Codex:gpt-5.6-sol sparse
> Co-developed-by: Yauhen Kharuzhy <jekhor@gmail.com>
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>

Looks better, a bit of work and we have a merge candidate.

> +static void cht_rt5677_platform_clock_disable(struct snd_soc_card *card,
> +					      struct snd_soc_dai *codec_dai)
> +{
> +	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
> +	int ret;
> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_RCCLK,
> +				     48000 * 512, SND_SOC_CLOCK_IN);
> +	if (ret)
> +		dev_warn(card->dev, "setting codec idle sysclk failed: %d\n", ret);
> +
> +	clk_disable_unprepare(ctx->mclk);
> +}
> +
> +static int cht_rt5677_platform_clock_control(struct snd_soc_dapm_widget *w,
> +					     struct snd_kcontrol *kctl,
> +					     int event)
> +{
> +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> +	struct snd_soc_dai *codec_dai;
> +
> +	codec_dai = snd_soc_card_get_codec_dai(card, CHT_CODEC_DAI);
> +	if (!codec_dai) {
> +		dev_err(card->dev, "codec DAI not found\n");
> +		return -EIO;
> +	}
> +
> +	if (SND_SOC_DAPM_EVENT_ON(event))
> +		return cht_rt5677_platform_clock_enable(card, codec_dai);
> +
> +	cht_rt5677_platform_clock_disable(card, codec_dai);
> +
> +	return 0;

I believe clock_control(event=disable) should not be ignoring result of
cht_rt5677_platform_clock_disable().  Yeah, currently the function
returns void but with small update, this could be corrected.  In
general, the right approach is based on the use-case - teardown path
invoked during error handling should be persmissive.  Conscious disable
operation (here, clock control) I believe shall not.

> +}
> +
> +static int cht_rt5677_hp_event(struct snd_soc_dapm_widget *w,
> +			       struct snd_kcontrol *kctl, int event)
> +{
> +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> +	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
> +
> +	gpiod_set_value_cansleep(ctx->gpio_hp_en, SND_SOC_DAPM_EVENT_ON(event));
> +
> +	return 0;

gpiod_set_value_cansleep() can fail and blind "return 0" is discouraged.

> +}
> +
> +static int cht_rt5677_spk_event(struct snd_soc_dapm_widget *w,
> +				struct snd_kcontrol *kctl, int event)
> +{
> +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> +	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
> +
> +	gpiod_set_value_cansleep(ctx->gpio_spk_en1, SND_SOC_DAPM_EVENT_ON(event));
> +	gpiod_set_value_cansleep(ctx->gpio_spk_en2, SND_SOC_DAPM_EVENT_ON(event));
> +
> +	return 0;

Ditto.

> +static int cht_rt5677_codec_init(struct snd_soc_pcm_runtime *runtime)
> +{
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
> +	struct snd_soc_component *component = codec_dai->component;
> +	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(runtime->card);
> +	int ret;
> +
> +	/*
> +	 * The codec derives its asynchronous sample-rate conversion clocks from
> +	 * I2S1 while the SSP link runs from the Cherry Trail platform clock.
> +	 */
> +	rt5677_sel_asrc_clk_src(component, RT5677_DA_STEREO_FILTER |
> +					    RT5677_AD_STEREO1_FILTER |
> +					    RT5677_I2S1_SOURCE,
> +				     RT5677_CLK_SEL_I2S1_ASRC);

Please do not ignore the result of rt5677_sel_asrc_clk_src().

> +
> +	/* Mono ADC L uses the codec system clock rather than the I2S1 clock. */
> +	rt5677_sel_asrc_clk_src(component, RT5677_AD_MONO_L_FILTER, RT5677_CLK_SEL_SYS2);

Ditto.

> +
> +	/* Firmware may leave MCLK enabled without updating the CCF count. */
> +	ret = clk_prepare_enable(ctx->mclk);
> +	if (ret) {
> +		dev_err(runtime->dev, "preparing MCLK failed: %d\n", ret);
> +		return ret;
> +	}
> +	clk_disable_unprepare(ctx->mclk);
> +
> +	ret = clk_set_rate(ctx->mclk, CHT_PLAT_CLK_3_HZ);
> +	if (ret) {
> +		dev_err(runtime->dev, "setting MCLK rate failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

> +SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
> +
> +SND_SOC_DAILINK_DEF(media, DAILINK_COMP_ARRAY(COMP_CPU("media-cpu-dai")));
> +
> +SND_SOC_DAILINK_DEF(deepbuffer, DAILINK_COMP_ARRAY(COMP_CPU("deepbuffer-cpu-dai")));
> +
> +SND_SOC_DAILINK_DEF(ssp2_port, DAILINK_COMP_ARRAY(COMP_CPU("ssp2-port")));
> +SND_SOC_DAILINK_DEF(ssp2_codec, DAILINK_COMP_ARRAY(COMP_CODEC(RT5677_I2C, CHT_CODEC_DAI)));
> +
> +SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("sst-mfld-platform")));

I'd suggest to drop the newlines between SND_SOC_DAILINK_DEF entries.
Perhaps also have a tab(s) instead of a space before DAILINK_COMP_ARRAY
so all the definitions are aligned nicely.

> +
> +static const struct snd_soc_dai_link cht_rt5677_dailink[] = {
> +	/* Front End DAI links */
> +	[MERR_DPCM_AUDIO] = {
> +		.name = "Audio Port",
> +		.stream_name = "Audio",
> +		.nonatomic = true,
> +		.dynamic = 1,
> +		.ops = &cht_rt5677_aif1_ops,
> +		SND_SOC_DAILINK_REG(media, dummy, platform),
> +	},
> +	[MERR_DPCM_DEEP_BUFFER] = {
> +		.name = "Deep-Buffer Audio Port",
> +		.stream_name = "Deep-Buffer Audio",

Did you test both endpoints, the low-latency and the high-latency one?
While I did not touch atom-driver really, when refactoring its sibling
(now called catpt-driver) I had to do quite a bit of tinkering to verify
the high-latency playback path actually works.

> +		.nonatomic = true,
> +		.dynamic = 1,
> +		.playback_only = 1,
> +		.ops = &cht_rt5677_aif1_ops,
> +		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
> +	},
> +
> +	/* Back End DAI links */
> +	{
> +		/* SSP2 - Codec */
> +		.name = "SSP2-Codec",
> +		.id = 0,
> +		.no_pcm = 1,
> +		.nonatomic = true,
> +		.init = cht_rt5677_codec_init,
> +		.be_hw_params_fixup = cht_rt5677_codec_fixup,
> +		.ops = &cht_rt5677_be_ssp2_ops,
> +		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
> +	},
> +};
> +
> +/* SoC card */

The comment is redundant.

> +static const struct snd_soc_card cht_rt5677_card = {
> +	.owner = THIS_MODULE,
> +	.num_links = ARRAY_SIZE(cht_rt5677_dailink),
> +	.num_aux_devs = 1,
> +	.dapm_widgets = cht_rt5677_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(cht_rt5677_widgets),
> +	.dapm_routes = cht_rt5677_map,
> +	.num_dapm_routes = ARRAY_SIZE(cht_rt5677_map),
> +	.controls = cht_rt5677_controls,
> +	.num_controls = ARRAY_SIZE(cht_rt5677_controls),
> +};
> +
> +static const struct acpi_gpio_params speaker_enable_gpio = { 2, 0, false };
> +static const struct acpi_gpio_mapping cht_rt5677_gpios[] = {
> +	{ "speaker-enable-gpios", &speaker_enable_gpio, 1 },
> +	{ }
> +};
> +
> +#define SOF_CARD_NAME "cht yogabook"
> +#define SOF_DRIVER_NAME "SOF"
> +
> +#define CARD_NAME "cht-rt5677"
> +#define DRIVER_NAME NULL

I'm going to repeat myself from v2 [1]:

Have you tested the driver with both, legacy -and- SOF firmware? If
you're using just one of them, let's limit the driver to that one.
Anything else can be part of a follow up series if there is a need to
support multiple solutions. Otherwise we'd be merging code with no
coverage and no user.

[1]:
https://lore.kernel.org/all/7932c58b-b6fa-40c3-8967-7710d84f9667@intel.com/

> +static int snd_cht_rt5677_probe(struct platform_device *pdev)

> +
> +	card->dev = dev;
> +	platform_name = mach->mach_params.platform;
> +
> +	ret = snd_soc_fixup_dai_links_platform_name(card, platform_name);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "fixing DAI link platform name failed\n");

Could you run a test without snd_soc_fixup_dai_links_platform_name() ?
The function is more of a relict of the past.

