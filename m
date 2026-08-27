Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDFA49550A;
	Thu, 27 Aug 2026 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787855372; cv=fail; b=nBq5IlHLW39YaebCWGyUp+tIMxv2yCc7hjI5/IJ+G7okZg4KElnNy/l1hYFpG616B89CvKhO2G+pIuIZIaWv3BX6QGuF9c88zItegRth6HfFOSkd+bvQMZFsr5NIkTcgH+7BeSq5Hb7k/uGERNKkdXbjc9SR18AhI5RHgZa32OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787855372; c=relaxed/simple;
	bh=BOA3+37/ErhfbGFjHbEKt8ws+Y/PsvTz18kAZktu6Aw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EeftrKQrPweQqKsv1v4X/RG4jBxrJYZyu1FVvYw93omAEVKNv/83aZ0LryaQ8tmHSQQTEQlltX4mOTZV1aU7ZSRLdW3L3ISQu4Y9MdCqEBaSJiRfVFlgAUub+QKfdABiYMtVW9M9tKgxT2a0DOf1CafRIlkFuV3Hqkc2Xj+9pPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWgFaWZZ; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWgFaWZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787855370; x=1819391370;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BOA3+37/ErhfbGFjHbEKt8ws+Y/PsvTz18kAZktu6Aw=;
  b=OWgFaWZZs403VBaM5JtvL1gVitvXrJwwZVavVObll1vG8mad5c1HPzX/
   ByHrviSnp9ih3E4F0O1dEpApMvKuWm5vvUV2EHQHL9KyqhXsSxt4gA2gD
   DdERkL4X3NtkvMQsoDJgqimp6iFlbJu2pzkJpdX4kBXVlx/MofKYN633x
   me1Z00FPiUzNtWG2K8vguQ4ASMH1QCag82GW2PdN+WXuRORVioInWgBbj
   E68+Jz0y9cwcLhHZBvOy9MUGGfE1o94JXxHuP0eWz3V2U9mK12Z+BxQJj
   +z4lnd6hbiCHOTFOB8kgrn1rs65pT8GUtluC9rtM12yEiVMFrY5q9GBGi
   w==;
X-CSE-ConnectionGUID: qpd6nWSKQNqQETvOMa7NqA==
X-CSE-MsgGUID: /2l4jWAnSpaCCpbqUtfWKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88220724"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88220724"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 11:29:29 -0700
X-CSE-ConnectionGUID: BhBMj3KPSR2e+gQcjgL6lQ==
X-CSE-MsgGUID: mNF+sPO8Ree126STyaE/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="271481819"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 11:29:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 11:29:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 11:29:28 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 11:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcY0sRI46dii95rEDnV/wm9FGtuPqoGEHidisQlKAbMCc+Hxiy7BqMnhgP442bHkMCVi1Yp0PDALdNnDSPMdl5DOGcwNi+XXC5cJSMkWHmkPcN/8mAs/YGRToVC/34szH5taRI8RZ5UJ5q8eoJi/hFLn0CXg3/wiAWoP19bSn/uqPn0BzWTBUUHt2p11n9Py7ZcJW9TVBs4CmpYR76LAxqXAYYgATm8aWipExMu00B2rpocHYUe159UNpedFUmP4/murSw9V/QwrJ/C+d9YnXH3ttk1ZsF4YIvvZi5qFGi/zDlViI//6hCgwFiN78NlghKcEI2nGP9gawEkxL7d+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Gdy9elDaRwgJqZiqms/2Et0RhLVuS6t5uuFxAKXLc0=;
 b=pVKg6hzlKGQafoobkjTZXAvquHoV8EL4xt4ZF94LQ18uPJuvyRHLG5jaQLg7S+tSXugoLlfMvpiGCIBs1DM2TpH08QYZqgLiN/FB9giHEmAzdWzpckBsrMXQ2jlNPfdt1OvKteJbxpmGqu27CnxUj/C+k80E9iopOmcRtQHmyq6Frh2oKZh/ev62LldGtjPbwzFz24laqntz5nTM4kaAn85RXa7+2siRelZivInaXqelfVU4I0HFP5jvrpCRdCGdQu0rk5mIguaSJ7v6MolTO9osI1aq2csqWWbi9vbusZlC5gUgR11SrskCvXmHZ+31AhCzY+VL/U7Fu6tS7FRnlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DS6PR11MB894442.namprd11.prod.outlook.com (2603:10b6:8:529::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 18:29:27 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:29:27 +0000
Message-ID: <2f3200ee-12a4-4a82-b5a3-f1aa0d6e2532@intel.com>
Date: Thu, 27 Aug 2026 20:29:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
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
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260827181236.2421882-1-mauriziocasciano7@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0026.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::10) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DS6PR11MB894442:EE_
X-MS-Office365-Filtering-Correlation-Id: 450c44e3-8ef5-4ab5-a085-08df04692044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2aczcw8NyQrotsToF9DaINmK4bRdpo1xSxe8YaBMT3aazveYZZVN8x5HF16U9Ft/ZQRJqC4aZ+QHxNCUmXmgJS+k8pmjP7thIGahjMB6D3RRlNBCoB2krPIlWD97g5kUMdCEHt6l+QY0J8dJpfl6QQsnfev+tpRU0uJLgQkeja5aE+6NN+b9EIIGFzABfz4pCAOLzDiuuA/nPmMTFPaj561G/Cxu5vr7W8EygOshJXkI81qOzPu6IAGCxVHbW6XtaEXSe8cIDZtA0oRyzUOHe2NfY4VqUyRM30MujmYDzxOVv65JZwa0HwmrwJWAKgyoomB80JDAtb0XP95X7J3oNDNmuD+2YltbxoFTPzk0mX0GiONvU2G522+6JmeeOj+uZO6zcaPy/4yTsk/VSFpYjBUdNteuAACskUjCWLG2qzLyyKlMSWgFqXi963/Cs88+lr2WQkisf9qNkR+dqQFFN/qVfgQihtgdoPpPhFsV2+a3PRglLVAhR8v4YKBBJbFqcbxUuD/SzJf+bgxod2MfQyLmkAlfiD34H1JaCJRXEh2olWCuYXsZPXXDiTE5MtsstFy54aFDJ+EmwEWOYGcKD06F/eAYGISWnIjpRks/xf/bkbGecKPp1XfBgj154xcUl4BrXRaVWI4kbUDOoFEJHbgpHmbpDyxEq8Zv63jT0YU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3dNT1RqMDVGeWxheEc1QU9KdHpmY2x3ODJ4bG5tblRoL0phKytGRFNDSlBK?=
 =?utf-8?B?T2xMd0EvNzdtN0FnbnZKQ3podTJ4bWZGU2dWVGEwbUNMVGIyS1BNZ2hEa21t?=
 =?utf-8?B?OEs3OThTOERCbVBWeC83dmo3RUlkdFZaNmVpWTdwd0JPVGJON2tIWS9LWnRS?=
 =?utf-8?B?V1BabThGdk5QSzJaeGtvWmxkZS93VVhGOU81K2xZZzR3dXVUYXM5YWEyVytk?=
 =?utf-8?B?TU13YVNLQ2xRSms3THdwaUZQWDUzYnlkQ3BxYzZRdk9XTXgvbWw1dm96UTdG?=
 =?utf-8?B?ZkVveTBiUFFhRWovR1BuN2J6dXFnVFdoVHJ0Q0hJbXpxY01PK3FGZFIyam1F?=
 =?utf-8?B?WUl6aTlmUmVGaUNaZnZVenZvT2xyM29xZE9JVkpTVDlmRENiWS84bHhlVCtu?=
 =?utf-8?B?VisvOEJLZ28yaytYSnpaaXlYQnNzS2VwQkkrbzdlRlpGODlTdjNwd1hpajVw?=
 =?utf-8?B?Z2tSNW5xMCszMGRQVG04NDBWZFF2QnIrNHo4SUp2M0gydEhiYWtOUk90anpM?=
 =?utf-8?B?M2ZDSzEvamtkaUVuNVh0bktmUnlnOHdBcUxBeVEzUWJLbFJTUE03anQxMzlq?=
 =?utf-8?B?Zk1jMi9wdkM0Snh5QnhQVXdtL2ZYeFl0VlYrUW8vaUdTdkNHekhwcUhRN1BQ?=
 =?utf-8?B?aEFPTjBWTzlLSlpzNkduVkRReUhUZHhNNFpUQlExUVRjUXkyVkFkNXR1YUt6?=
 =?utf-8?B?Zm5tRlVkaGFsaFlyU2VIaTgraW9WQ1hrcGR6ak5vK2VVVHVDeFlzRVU0L0tW?=
 =?utf-8?B?Rzh5N0lGb1lnOXFaQWI1Y0RpVDV0dEhCTmNqem40SllId3IweSs4Vks3cEta?=
 =?utf-8?B?NnZBN1kyZDZFZTJEeXZRMDFpL29PVU9uZ3QwbGRJQnR4bEN4SDdKbDRjVWJ6?=
 =?utf-8?B?TVFUS3Y3R2xaaTdLS2MyQVBJRlpmK1h4Sk9Ec2pON1ZieGsxYUJkNlFHZVNZ?=
 =?utf-8?B?MTloWGNkTEVTVG1RUWdoRVlEbE5tODRVSnpvU3FKRFg4TW96TU1LV1VXMjhX?=
 =?utf-8?B?dHNMekhZTGJGbGc5RVBVbDh5WVlvQjg2ckZ6Umg1MFVteFV2VUhMb0t1TkJT?=
 =?utf-8?B?c2xFNGp2OHFxNlBKTFZBZGpXeVJWamNTZVNxZGluN3l1UnV6QkZXNkNZcld2?=
 =?utf-8?B?ZzQ3bkRKYzZnWUw4TnN2bFdQWjYwU3FvR0NPYittTURRbCtlWnRuNzRYMUd3?=
 =?utf-8?B?ZUNxMzQ5SnJEWlBVMG5CSnhzeEZUZ2Y3bUZ4d0hMeFdacGFYUFVhTm1jZGd4?=
 =?utf-8?B?WEthRGNFbDFhNnFjRmRMejdVOTZ6aVRqSy9VM2d2bFZZUTNQbDRTd1BMWG9s?=
 =?utf-8?B?YUJiMllzL0ZCelBLT2x3SEJuWFQxb2FkWmxSSjZNNXZSSXhndHhKSS9UalBY?=
 =?utf-8?B?aWJMNzVJNjRoV2dVelU5UmxKQktiQ3BtTG5kUFd5KzFZV3MwMDV2QnBCRG40?=
 =?utf-8?B?a0dXN2FBelBTbFN0bUMvRlVBTG5rdUd1WWRvMzZxdE91d3M0MjdjRTNjdkFN?=
 =?utf-8?B?WlQwVUJtcEc2ZDFPUlNFM2I4ZjdLWHVQMDRtcCs2RU9jeVhEZjRscHlBWEZ6?=
 =?utf-8?B?aGRWWFVuSFBCMmVocVRrelJnRERxWDVRKzF2NkRBWTRWdlhIREkvd3p2K3FS?=
 =?utf-8?B?RjNYSEFUc1dFY0lmNjgxdHdNcHpmMWVVWmY4UHhGQUJ3SzhuVFdlRzhKMzJJ?=
 =?utf-8?B?V2paSjZRcTl3MlVXeG01YmNseFNqNXlDdnZXQ3NyZ1VZL3VkUGtyZkoxYjVu?=
 =?utf-8?B?N3hIVGVRVkJpYXFpMDFwdUlLdEJrN0IxQzMyblZwejd0czBpVW9QWXFHUk5J?=
 =?utf-8?B?by9yNDQydjRRR3RsWVdWQzNwcnoxM3VWUmNOV3RHemh1Q0tHUjlXNFBzT0s4?=
 =?utf-8?B?S1M3cEs3TVRVemo3bXB2dEdIN0MxbzlRaHdNQVlTL0NvbVp6U0pTR2RsYnAw?=
 =?utf-8?B?SnhPYUplbEhaeGJwdldRSll1cUUyVWtvTTdIOVNhZ2JOc2o4dnl3S2xKNCtZ?=
 =?utf-8?B?UWRvMG1qRHlEQ1ZNcGJCMlEwcHgzeXpkVVVLVXZzaHFCbFc5TlI2YjJKUHlo?=
 =?utf-8?B?V3pFaGFFc21CWDJhR21zdWRLdFovMDdFVWswdS90QnZmTjljVXNROUJTUnVW?=
 =?utf-8?B?UnllWlN0VHp3UTduYkJqblpOdmdqOGtMdkhEMFl6clkrZ1Uwa2tCS0p6TnJx?=
 =?utf-8?B?NHlsSlphangzaHhkZnlNNHJSQVE0NU5JU2RsaDcxOEVFaFp1N0VTY2JJeTFK?=
 =?utf-8?B?YmhiUHBGaFNKSlNxd1dWb0oyUnh4YkxPeGlVVS9rNVRjeG1DOEwwQUlBL3dG?=
 =?utf-8?B?cU1XdXRaYTMrN1BNSzRWc3JBWkpuT1E4aHRycENYWWZINzhSTUcveFhkZ1Ji?=
 =?utf-8?Q?ov/5A35DFvqFqxY4=3D?=
X-Exchange-RoutingPolicyChecked: iCan2Cxtq6hPpgeqqVsduft/9cMo7d+cBSczme4nYJBpIJ5LQq+Co61pe54PDK5qEXv0dSoTEdp0NOSYM+mvfU46oee0Oi/WLmglcortpfJcN1E7m2W3NC82QMBWMv1uKzD9BhPJW4n/wM2IV2V7fnsKoC6xzJbHXTCaugafPj21WBQ4Z9+jAB8WrluOmKMcRLZUvKUvlqwQ8/voNj4E8a+7pPEwuc9xHG4iclCg1dkMQVqxgOq1y6YgT4DwiGCTXCYCR2jkzwZBzbBGaqxPXqZpwqw/oaX76/KUlmTKJ6j/vxsyaI0lwMi4ujxV4JnEdi32EUsgdG9IkS8Yz7Ttsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 450c44e3-8ef5-4ab5-a085-08df04692044
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:29:27.0176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7O+o1NCaEUqoHrFrrTX3yApMFQBP1XcIyG//dooCkrb9wTc0KUENVlQnE0Vn3kTJywmXuBmDc33Qg6/8EROnifo8AT3rb7atHifVuu+WEnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB894442
X-OriginatorOrg: intel.com

On 8/27/2026 8:12 PM, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91F/L uses a Cherry Trail SSP2 link with an
> RT5677 codec and a TS3A227E headset detector. Its amplifiers and
> headphone path also require board-specific GPIO sequencing.
Please do not send new revisions in response to the previous one. Also, 
please give people some time to review, especially that your patch is 
not a one-liner.

Kind regards,
Czarek
