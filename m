Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122135AC3F;
	Tue,  8 Sep 2026 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889763; cv=fail; b=kehP/GOYvp6Ox4IpYYBFB+ayXExd99zBPEVb7LcD6+9ngsUYm34Jc1TvZmibRW5UzlSNEyWEk642ZSaIxBsVQYWFuVA7yUqXoS09pTcSO4HSpBzkyHyn5Ez4Ut6OS1SZET5AInef7zzjuOZF+IpTClTceZrW5ak+fgJgWWOBU+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889763; c=relaxed/simple;
	bh=CIsGZH/yDiCKRhN2faNVIEiQW98QFAWW2J/41r8w9SI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nsRyGHF1q2gWcG9m66c+BHESlZeiHzkl4Cm093A8WxvBQhwmzBlbNJToSbTeZFwzFq5YEi9y+AO2WCX0HQEp0aJgy7D/AzIOlSKx2erxhi5tA98a6HwFJD/7AlX9Yjk7WkMjARgnLHc2ot7DrlXHmiX5PGik0Fxm4LKPwe0V5Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qqp38dc/; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qqp38dc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788889761; x=1820425761;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CIsGZH/yDiCKRhN2faNVIEiQW98QFAWW2J/41r8w9SI=;
  b=Qqp38dc/RPiuKokw/6C5+NILlV+XVQoIsTLlyoJhBZQR+Ij1kixt9iGJ
   wGTyfashwZ69BcVji8DUOWf+NcbivR0uIW0+8Xlcz6K5VIVSzAV+VSZfU
   uXWbqnOv3sKwGx/y0T/wJMoZMNs+1C8R5xltJtQ5hR53sNBjAyvY9QiLS
   7a4NuNoD7S4bPA1+zVrXfNIjgGVz3KzjscdedqTeoOkPqlBCRnVVuRCOX
   yjoihp7vAtZA21P/9vGB4jpKz/S9NdvYea35QU12J8RVDriKYSJXClh5J
   TG3pxnxf1cqzDyNamYZaw2vermMbEbHYnaE7c0kGu7shRYAqcArmV6TcW
   A==;
X-CSE-ConnectionGUID: wa4pmuxHQHW5YbaqVH45ow==
X-CSE-MsgGUID: zssZjJhZTj2cv4bctwvqJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89506082"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89506082"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 10:49:20 -0700
X-CSE-ConnectionGUID: dd/C46R8TCG+IMJCGJO6mA==
X-CSE-MsgGUID: BAR4OlIeTsWNg1gx1t5nQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="273011022"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 10:49:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 10:49:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 10:49:18 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 10:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IULW6WQLl0J/99Twe9ICfsInmdgezXpqP6viwNmgNjf/ro7Wk5C3Dx0jKbV+vmoxFy7Vc2k3MFs3Z/A0EWH+FvXtCugL8H8f8JTyjUJZwePGSvET7QpgLbYNsHoR+s3k0IKPf1jtTNjp4YJC15Y4WzAeVaZeAtNOohow1wPnKSQLTrE817qDoWp6YCe4gX1SFDsU7j0N1pGdW5iPQKgb28lATuYb/PdLDATxe/TdPMbQgfd0Env5RbLyv4RAlw+DsmXWXZQy2dOpmmmfeRUMl73zF/6vx1WjA2aDeFitr0fL+HKs4mvneXKPWj3UOLY3ZRvm/Rw8/c9C9cieaRJ6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qoy9DvnPVGF+jwQoTxmm7mD5JoQ2Pf4ciP6AFUz8kE=;
 b=UcRkm5ULI+cNJu0BWy5MCHUwj+zTnhZY62aGSBvtBqBxsVpBxALzJy5mO6ji78f730e86INrqRabUCmnH4l18RjpQFK2Rue9xA5q9uI3ZeqqH/3Hlooh3/fCWue2rdo3I7ov+1UOlm5i+JhCtgSEzbxUfJA+btxubi76a4UwqRoLEDTX/biQTCn/SwXdyvzmNAEvYF0GG+3FhxH2Q4r+QFf+pEexPV+T6DEEkCgt3L9IhDEAgKBV1q5B5L2oqMqEB1btnngQdREQuvoKAUmnz4RfHc3ms3pDlmCgpE+qPUudwt2/10SEIqQqlu85hZaZvv7dm4p69Lv0lbxjHbH0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH7PR11MB8572.namprd11.prod.outlook.com (2603:10b6:510:30a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 17:49:08 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 17:49:07 +0000
Message-ID: <e011cd74-7c5a-4cd1-b412-ad11765ad11c@intel.com>
Date: Tue, 8 Sep 2026 19:49:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate
 regmap update errors
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Kees Cook <kees@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
 <20260907120310.135693-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260907120310.135693-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0017.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::9) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH7PR11MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c23b323-8bbc-4991-1773-08df0dd17b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|1800799024|376014|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: Lv8SP1P0JZHHIrmrlQ2ZW4j1aGu+12gHiyehNBWCNGEi/C/rZCb9FSL52Sc4w+zGw4/7UTjyrn/L7nJ5HUW6+BgNm+WjYXMp/XEeC8oYhYU1nosUIAZZ4sH2iFGbFQIl6U9fUnzZBTFXnu+ISAWacL6Aqj5szd/7zKMz2CDJU9cp69MBUnzew4ECoxv7eONUoX3ryf9rWQkpRL64KOvCt8x6V/AQW75WLAPlgqDqVfhc3yIq4VVw3NK1MXXCqeYdEkXAvUISMQfZNd5casio/rPuAo6hUmv0bonHaZEgNyl3/Zec3bOrTVPUpbyN++WysndOUQT3MinxlE1ZGnIQ2doT3AdCfUbbhzjUoOoJv0Ia1QIRiIizX21CTIMHSoCe8Vx+r+RcfLSpPUjlTV4//lNdCnLZjfKOdPmC2Cpx7b8d34YoGyWa6zLALmqBCbKOJePf3ppZu6ZrhCzTdcfdoMFKBZI0dI7vbyc1NV9jbochennefOCkREWlgzPZUWEqCemZJB6eHImCkXe0ePyNb13JQlw31oxKFznZub8UmiowE6tCI8lCrqGhc7NkXIVXcL188Fmraa7xIcbqXbkiqGrfwuZ9aqYP9KQQKRH8SE7m5wI8JK9N0JRT/PESJpcNeC8I1KpFqxrF2iU9YAiEiTIo9nG1AQSoYOr7UvpOLaU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXd3ZDkzRGh2bDc1SFB0dXZpK1dCcEJvc1czeVRHc2szTzMyY0RBUmRvaXZv?=
 =?utf-8?B?aCs5TVdPbmNnbjcvQmhDdnNCTTNRRFdrcnRmSjk3K1VpZi9qNlIzeldkSGRx?=
 =?utf-8?B?M3VYZUNaKytZaHNHZlBsOE5LWll2YXhlb1NRNWpYTjBaVnNmaWhEYVl2amFW?=
 =?utf-8?B?TE9DSVRJZGxyQnpSc0M0clBEWGhYUEpnbWhGWGdLaEtyQ2tLZnl3ZXgxU280?=
 =?utf-8?B?b1Fid1pKQXZIT1Jla2hkdm1tMXhqaHYrdFYzOXJhV3RpejZkVFhTZmgyU2pM?=
 =?utf-8?B?b05DYnFzaWczTUlPWUpyMmNsVkFOZEsremtTZXNWTHcrUXRZUXBEM1ZoVzdy?=
 =?utf-8?B?RENiL2FkUERCdVlsYlBHOUhUTjVZZmFQNVhrQXBwTkUwYWg4aUtvVEpCemVw?=
 =?utf-8?B?T1VUZ3RyVEUvV0RsZDJIbjhDYlJFcG1BTDAyZVZNbXpodWVxYzJvOVdHOS9p?=
 =?utf-8?B?bmloeE9QM09Ocm11U3M0c0hsRitYV2pDTE4yMFUyemlYZ3lrNGcwOXRUUWVI?=
 =?utf-8?B?cDdLT3ZaQXRYbDVBZEphOTFPSnU4djdsUTl1UDJvU3JoeFpDNmdIZG1yYVdE?=
 =?utf-8?B?R2d6WXN3WDRqMUhGb3FWendTMWFFc1IwaHdkQlY3bkNtNGRXWmY3VWdQeExW?=
 =?utf-8?B?UGRScFJwUmFsRWFScDNhTUFSQlpTVk5YVWc3RmNySXQ5QnlsUW45N1kyS0RP?=
 =?utf-8?B?NStiTnFmZUZvVUNFdjdtSVpNZDBvZ0g1Zm9SNExlTUlYdHBzV054UmNJeTNr?=
 =?utf-8?B?RzIvQzRZVVFRb1V4UEpMVDBiZ283MWszcTlWcVFScTB2M3VsaG5wSXpXZnVx?=
 =?utf-8?B?WFNrWDZDM3czMExXWGx5WHpQcW9oT0IrblBXamVYZVVzRENSMHFWcVBaQWNO?=
 =?utf-8?B?NEJDREpCTWFhUzRIcWUzMGtSVFJxTzhsZ3FGMzhmUVYvUzVEd1AwOUlsa1dH?=
 =?utf-8?B?K3p0QnhOMlJsS2tMUmZvckJCRGVLTC9CcS9NU1BaQVQwOVMwRWFBUFE4MTdJ?=
 =?utf-8?B?M2xlT1ljSk5Ycng2WnRuNCtPQktzckFHNHZxQjRFTUVQcW0vUno4WEtLa05T?=
 =?utf-8?B?aVZsQXpTVVZZUkpTLzJmZ2k2dkRJSGxxd2hSS0pwOC93VENzSTFMMFg1aDVa?=
 =?utf-8?B?ODJEb09OcHE4MGhXanlvWG1temJCbGE0WlkyVlVialMyMEYwYlZYUkpoWnRW?=
 =?utf-8?B?RnI4aXQxbk9pN3FHNVZDR0N0Qmh5UGk4T3V0dTRzalRNMzlsN1lCQmNPSHVG?=
 =?utf-8?B?VVN5Q3l4OFNqZGJUampYbEVZQkIzdlhRaDJqaUN4dlJlck5qd2FSV05GMXNj?=
 =?utf-8?B?VlRBUU4xUWxQQk5TNjZ1eUlvcUx4c0xEWDhJemlTK0tGWHV1RzZkclZVMXI3?=
 =?utf-8?B?cmxHcUpPejROOE9xV1pocXVWUmd2ekhxU21yMWtvN2RkQXRtSlhNY3crV2NQ?=
 =?utf-8?B?by9IZmJBSndMTnBKQnZCSGpvZHlnQ2hxZks4T1U5alNoR1N4akJUTVRVNFl3?=
 =?utf-8?B?SnlmV2xIT1pacE5tclV0WUZiRGdKN1M1cEY0R1FvNnhUYXlzUU8yaHZqdmRN?=
 =?utf-8?B?YmdPMTlUMllSbFp0cW9CdFJOTnVvbGRUb1dJQWUzS0Jsc0NQbHUwejJ6eHBv?=
 =?utf-8?B?ZWRUa2kwalA3ZHJKTkVJK01iNTNjdlpNY3hFRVdPeTJndHE3M1FQYXUxeWhK?=
 =?utf-8?B?ZVdkbUZGMmdGWmUySFF2V2UrQUJ0SjRlNUZVeDNZU0YwRk1BR1BxMm1IWkRQ?=
 =?utf-8?B?dzNiYndsYXQ3LytUMUdyZlViSDcyWFk2OVVSSU1zWEI5bXFIVHo3RHdyS2xH?=
 =?utf-8?B?RW1SRGxEUGsvUlJsREMrazI3eXk1K2RNSDg3bE1zK2dRMW9yWHIxQXVLOHIr?=
 =?utf-8?B?SFBBbWM3VnhZK0crTnl5TGNEd3VLYjlWK0M0UWtwTEo1cWFmVkcyQUJMSkhK?=
 =?utf-8?B?OG1lbk0xd3JzdklGVFk5bzhQM1dJZmV6bCs5ZzBiWkhZV09yVTkrNE0wcVI1?=
 =?utf-8?B?czQ0TVE3cTAzYnNpM05DS2VBYktqYXRodmxwQk9VUUh2MGFwbjFua2RJVjhB?=
 =?utf-8?B?Qk9YVDFUa0pGUUtuL0FscEppS1lydnJHSlZOd00xcHhFVHRrMlhBTGhBK21I?=
 =?utf-8?B?a0lMWUovYm9Kc2FSYWp0WnpSUXd2V0IvdHZleWNMUHNhU2M1Q1VUMHBXNjBh?=
 =?utf-8?B?VzNKK0ZNMmJLSXBKUGgrYzVFNUxSbndUUWFxVTF2YkluY2U2amh6Y2NyazFU?=
 =?utf-8?B?am9iTHk0WDVTV1ExUm8xQzEzc25BL251M3dBL1B3ZWN6REttNGZKU0lkVGxN?=
 =?utf-8?B?MkRlWmVxZGFrNHMweXZOMHExTXRGRHdnZDVmT3RrMnhranR0dzl3dz09?=
X-Exchange-RoutingPolicyChecked: qYZnP8BsEaKLGOTPRD9IcUmqGG2xS3wqWk+doBUVXcfg1px0/nuA2v0lWqqKxPKo6fOsddwuwPv+Tx+7hHhpVaMG34A15MqLXpsreeGWHgccRhIZe1vK5E/1eOM7+uhkjvM04sPLeduq6ISX7dZbe9lOwLwfnStqbkhuKvGk5HICaq/j2o6KzuMdPec8Mg+wqXFsUJmppwXQKhQmsRg885WihverEKpfktPLnLwlCoL0I+0eX/o/z3bfdSNgrZGAIz1bl8xcPOjO/WIT3AS/5BDELwkS1nvgouhswO5HsbD7CsqozM6xsCUqjKitDgqZ5t1Nn+RoujpVDQo4mTaMVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c23b323-8bbc-4991-1773-08df0dd17b52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:49:07.9339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRwgMU/hs/I2D+s9Oa45pAFii10YeshxtujZ27SG2eHvE5haLKSWXHE7OFYnqqasBfioWItH2Gunn1Nmri9vwwDbDUM8acAG+s6AZSFKqik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8572
X-OriginatorOrg: intel.com

On 9/7/2026 2:03 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The return values from regmap_update_bits() are currently ignored
> by the clock and AFE control functions.
> Propagate the errors to allow callers to handle regmap update
> failures.
> 
> Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> index ecba13eda440..77511f6fba41 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> @@ -564,9 +564,7 @@ static int mt8188_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
>  	unsigned int mask = get_top_cg_mask(cg_type);
>  	unsigned int val = get_top_cg_on_val(cg_type);
>  
> -	regmap_update_bits(afe->regmap, reg, mask, val);
> -
> -	return 0;
> +	return regmap_update_bits(afe->regmap, reg, mask, val);
>  }
>  
>  static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
> @@ -575,9 +573,7 @@ static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
>  	unsigned int mask = get_top_cg_mask(cg_type);
>  	unsigned int val = get_top_cg_off_val(cg_type);
>  
> -	regmap_update_bits(afe->regmap, reg, mask, val);
> -
> -	return 0;
> +	return regmap_update_bits(afe->regmap, reg, mask, val);
>  }
>  
>  int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
> @@ -617,14 +613,12 @@ int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
>  
>  static int mt8188_afe_enable_afe_on(struct mtk_base_afe *afe)
>  {
> -	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
> -	return 0;
> +	return regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
>  }
>  
>  static int mt8188_afe_disable_afe_on(struct mtk_base_afe *afe)
>  {
> -	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
> -	return 0;
> +	return regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
>  }
>  
>  static int mt8188_afe_enable_a1sys(struct mtk_base_afe *afe)

I'd expect someone from Mediatek to verify this.  While I agree with the
change, some drivers follow "ignore register update result" arch and,
what was previously ignored will now cause basic operations to fail.
