Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8DE4756AC;
	Thu,  8 Oct 2026 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448365; cv=fail; b=VjENlcSjlkHXbU/a83fekB+NSmsrmF7x2xcFFJyOK/E77k8vxzf87y2joF7FNGPkMSTph48nAjNM0ykC7FROjD0iujNshyqbpM7PcwdXIktCLX5pTNKcWRjTG/3/7bNIbGtrLSr+m9bL1PoXuuffzb5yIuo/Dylmb30bf7rEAjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448365; c=relaxed/simple;
	bh=dBvk87CrhopzrqRFbGGhqKm68pD/MMVBvdGwS+mg2/Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HZqnyOejlhri2ByK+kIAp/bGfW1VUQtZxTBAgID0O73djURnu+DsOIFsVXlUMTy5ZQmCfv/T1AFrZAZym/VNwlTLveWdIB9lK+FYEeNhdj7n8weM7y0zfjs71mPtb4y5HCPae6yHh9NUPpiy4CY8Xl0iqN/zKu2PGKFczr5/+g8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqKy9fpy; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqKy9fpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791448364; x=1822984364;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dBvk87CrhopzrqRFbGGhqKm68pD/MMVBvdGwS+mg2/Y=;
  b=FqKy9fpyOQCh1c/5DuYEx4pM7d9uF4ptUcnu5ZmL1oxjjrAqTjm7swHq
   HwpGBxQNxd6c4H7hhiX1SAEVQPlRs5E+8tTkMR9zBJDb3PYZrMqwtfQ+u
   LVOZS5JWRhUNWd1mPpCmujrJKzNIzNa7kTjzRZaiQtWE/7Qs0jFeNyV8z
   UumrMLz/4bxAb/dSaakyhfM/fv62Axn+/SjpZbvjKFfwem3f7eO9ZhGj3
   bkAwJpxURUqWz0R2Ak2l7peqjuz3FP7gpSMIMlZG3KGp44ZN9o6GX6ajm
   /8OJLehm3/AQJTqjOK7n5Fw64Dv8UGKp+SnGqyQwwB1zmC8SIoOH5toiW
   A==;
X-CSE-ConnectionGUID: gJv1jMG8ToekeTalcUzvbQ==
X-CSE-MsgGUID: t7TNHr7UScKH1Qz5e1ZpOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="230560"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="230560"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:32:44 -0700
X-CSE-ConnectionGUID: BW9mbsfZT3CBzJYcfh0ThA==
X-CSE-MsgGUID: JibcAO3FR66a92GxiiYjIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="76784"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:32:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 01:32:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 01:32:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 01:32:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nT428vGZFTcHDQY+PflcLZxR+WiIooI4ZSdioV7I05cvZWFk9bG/v9DXxs5De8Z5GYnbEaA2ZFrCfF6pKU+bIs4tyzXdpSdF+IUs7VUJdXg5RfRinbX3OhH/N4/hlStpSWh02XXYJQfyTqvLND0vB6ogtX4vh0t6eIsdt+qJB0Hn18NEnBDEaTtRlgsMgpx3blcwEfJj/chzEQDpLmwEfAwNwRBU+tLR8Kj/k3kK/tgclMMf6o+ZbOBAn6m7cjaYr3xV3H+eyKHv6jJZHFrIHamDW0UVEMIPySKVRHlvky8seE7BnnI7KQk4XF26UdoRfXt+bGGQeJfi/zUvJa062w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AoO8UJDhtSRGqdbw1sXvQ6UC5ivIIffTy7Vlh2dTx0=;
 b=EpN6mSmCSqBwabexvB+kVITTV3U1M0gqPmpmHEB1m4l1ZlBf9cZMEgRczBQNxd6l2raNAZOo6WLA8k4q+LNLh0B0609IJKyCVWcgGSKy2QqTH3URyq1+KeBpcH2mzl1XGa7wTK9aVCHFbk6M1ogtmhFrByuO2Dh+VeOtQbEIT5zoGm8VKFzq044Ud+o6LJfYL3nVxXQFEEhSkuujYqIaGV7EjwHrCQpmiG4+HQlTKVhJpLI5eiIoPQ5fiEocM8lbgxEE3l6Bo1YzKvL9ZyjbeX4xrd84KojSMWdhQQxJVAk+J1Ldy25XdEFJe6rZF/LOcqran0J31kkH02Kq64K7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 08:32:35 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 08:32:35 +0000
Message-ID: <aa22e14b-fa6d-4164-b8fa-6a77eb2a2d39@intel.com>
Date: Thu, 8 Oct 2026 10:32:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] ALSA: seq: Don't lose partial read failure
To: Takashi Iwai <tiwai@suse.de>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
References: <20261007172533.14667-1-tiwai@suse.de>
 <20261007172533.14667-8-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261007172533.14667-8-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0277.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::44) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|LV3PR11MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: f325e9f6-ca4e-4680-e59b-08df2516b40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: sTulCgDiW0+TBph0zHwS3DEZ6RTYmp1YTOaMEpFpXZPiDVos2Yd+b16Hrc+8TwC7q7JwJOIUjokZl+LZjL8PiWGLFQsLcHtNd0o6BGhBD4z2Xt3d8RPFDXvwtUe89eVC+2ef6uck6vEgk8QB0pxtTaLp+bl87S7GH8NmquwCWjEpExaWkOwQbhilWCWpMHTZZXZnZjUrAfqEXbk1wpBXRxfDqO8AM5r5TnyarLUfDrDetbZxGq8JmjlfU5m0lzXTPIXSkcaLtJCA+2ZLqtEsmIv4S6X0QJ/p78fS2QKLiBP4f1aOnNbTiwgJRHsjyjoB27+4CO7kM9sgsILvhIaQhkv7Lbf82Fj50wNSOSsz0UctwwVUW3lQhQZyXMJUVE0JwXZjE+eld8HJedbdp+7rND5ZZKTXYkwX2pWvvYI94cKDCr8pHEwbmos0tbhqrKgmMZyirZyFnnPW+Lh3EHSJZidlOH22mcNz0F8d8nwNV7WJkf7CyQZJJN6UP1bHmB9+L+Wju1TAJrl76TlYn3dDjDIDxZ57K7TFKHm2Ark6aZ0Tduj+P2XapEFSLdfJVAMt+HYEYIGzjLRG6EyJ7w15nvitWEIVLssNBuBC9A8MIz/+GIF65/DRIuJy3UCq5aMf9pgOfX7GNXwarHPS2NLyBx/hm5n/hIP+Q/Hj9afeEiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1p4UTNDQlJ3MG1jR2IvMnlOY1pmNjhDSUpsdEc2QTgwdUloQ2F5NXJLRzhH?=
 =?utf-8?B?aHJHRzB5U0hLZ2JBZGRRbXNSV0RNQWZYRGN6a1hTRzN0MjZXOFh4WGJtdHJG?=
 =?utf-8?B?V2U2bVVnQm40UUFxaDRheVVVZlcvckJKZkszWTlDbVNXSmN4elpzcmFYdkt6?=
 =?utf-8?B?VFd0TnZVRkIxZFZrNnpjejlVQ3c0ZHZsdlVwU1c1amQrVkxiUEhzZWlxUTJ3?=
 =?utf-8?B?OExRSGZDMUxUNndQUW9uQzUvalhMMVY3by9qV3FrSGtlNXprenlYb0REYThH?=
 =?utf-8?B?QmhJL005UG8yY1k1eXNmWlRuU21jU1FIUS9sWnFhKzA2cWN2bkp5Zlk3eXRt?=
 =?utf-8?B?U3NLTWVqc1JGN2JDVDZndzI1V29kNTc0aUdaNkg0NUJMOVFKUldmMzg0NWtR?=
 =?utf-8?B?ZWo5RTh2a3llUjJyamhURis0UEQ4Qm9lbVVGMzVVeTVmbEk3TmRTRzhLSDhk?=
 =?utf-8?B?T3UxNUtvNFg4OVgzZlNPeFdTeDFXcGtRZVp3bFRwYWY1aHo2bXErVDVGMFhs?=
 =?utf-8?B?V3RJdms3YWk1d3NIWndtb2dZQTBFWVB2ZmtnbHJBSDcwaHBUZ3puaGxZUVRE?=
 =?utf-8?B?eGJ6ak1PNWlicUU2WkVNTUZSQy84N3l3TUpERnNlV2FwNmJjRW5OYmZSUGxT?=
 =?utf-8?B?U1hDdjJidTk5VnlmSzJpZFYySEhUemg2R1RFSWgxeHdrclB2Mm5vYmxMcXJU?=
 =?utf-8?B?UzAvLzN5SGlWekRXTXVYM2xxd2FHNEpMcWV4dlRmVG41VW1tZWhMMFRIRE4w?=
 =?utf-8?B?SzB0Y0xXays4d3ZFVUF5alVGR0Nsdk9qQjAvbFRkZ3FBelNXRFMvQ2crWGdv?=
 =?utf-8?B?V3FHTzZFMDM2M3hQKzdNUU1ZSzVvL2x0WE5BejF6LzZCUllwa0F5aHljeUVO?=
 =?utf-8?B?aTA2UVUvMFpBcGtob3o4bkdMMzd1VGpXaHNtZ2N3Z2xOVUFqR1ViV2orazk1?=
 =?utf-8?B?NU5qWUQwQnNJeWZwcjFqZDhJMWZtN0tpaWplaENEVzV0dklTK3NMSlFlQ0Rt?=
 =?utf-8?B?Z0JsdE1wK2E0dzlTdTZ4YVA4MXZlalR1Z2NzM1NPek5rM2UzVHpIZU0vYlRl?=
 =?utf-8?B?bGZEZ2c4aFlXcld5c0hzenE1T0xIeUFBdlUwVVR1OGp0ZXJReU9RMmdHa0FO?=
 =?utf-8?B?ZDlOUzNWOWZrbW9UT0svTk1CSy9NUmhCelRScjFMRzdaS1VNamdBVm9xZlNL?=
 =?utf-8?B?SHVheWU1MlNHY0wrM1VQQkVvNVRrc0hpZEpYZ01kL1k3a1J3cllrUkVEdEg1?=
 =?utf-8?B?Mno4UG5WZStLb0J5SmVnYWp3TVNYdENUUzI1aWRXK2hRWGpWZjNZZngvdXNE?=
 =?utf-8?B?WDNydk5WdmdMdUpUc2V1Q1lacExiTXF3N0R4cEczMmg1SGh2NERaMURkYXVr?=
 =?utf-8?B?M05iQWlWWWVjMGZhTFhOaWhNMXFpcnJvOGYxU2JPMlpoZmdCb2Q2Nlk0ZzhH?=
 =?utf-8?B?eE0vY3NvUmNGS25IS3kyZFRuMWFzajBwUFh6bVU2YTd4cm16L1lGQmZ5bU9Z?=
 =?utf-8?B?UkkyMXVEUGR6VDZxVG9qVDFzZUpidnd6Vm40N2tJSFRCdlZiUlZ1cGwvMzZW?=
 =?utf-8?B?elBrWlk3OWJlYnZRSkRwQXRlRU5tcUQ2NDMyUVBYSUNiUmJSdkp2amVmN2ZE?=
 =?utf-8?B?M2VkQXBBRUN1WjZWdjFIcFJ0VjBiWk1ZWDFPZTRZaHlKTnFnV3JPL3hKenhQ?=
 =?utf-8?B?QWNXUWc0N2F6U0RYaTZlYXZudGNkdWdPTE10OEVaNVJrQjJQV1BSWG5SaDJx?=
 =?utf-8?B?SnRZa2RQTHVIZE5HeXJ2TDdtL0VsbEhOWXN0ZTRpNWVkODhHMTg1NnhwMVlI?=
 =?utf-8?B?Vk04VzhTNFV6WStYSlRVSjVORVViTnRMNkFDUkpJckxqS1ZvYkdkYitGdk9u?=
 =?utf-8?B?bmNqaWUwOEhZZUZJakczN3FjZFhqYzI1b3VjcjZhbFg4SmoxVVh4UFQ2THdQ?=
 =?utf-8?B?c3FLZnk4SUJkSS92Z3p3eTIyc0FONUdNRzNyL3hlVCtZa09Dc0FSZW5HbUJ4?=
 =?utf-8?B?NlBaTzhuZkhHL216SjZINDNwYlhZRWdGaCtzcnhPNW9GUkh3OVRWR01DN05R?=
 =?utf-8?B?b3dVNzF4MUNYVnlFbXBZUkJWaUNzN3hIOENsMEZhQXpDTWdCcWE4NXBLeW9x?=
 =?utf-8?B?U1Q1SVh6UjlJWi9wb1I0MXhGQnVpNXFSREtHWjVPNGxjbzZCWjZmL0tEQUVD?=
 =?utf-8?B?Rk9od3RoZG5WNm8rVGJ0M0FsRmVoWXRWbVlic0MwL2J5KzZQa2c2QU41Q3k0?=
 =?utf-8?B?YjQxOUxBcEZRdDJ4cEdXaFB0YmEveUt0RUtlQzlzdVpMZDRUNHRVK2JIeUFZ?=
 =?utf-8?B?M0xXT2ZKRHdibml5SGZJd0ZTRmtSVlhZTFJ1M05zSnM3a0hibXJSdz09?=
X-Exchange-RoutingPolicyChecked: YNvFomiKqQxhqhSlSPltdWXIef0boz0QXBvk5KMVoYAlgaMFnHJGXMGhmr8043HVTAWdnbTMQx7OH0aahDjx/MtEuRo6aLKWR/R+Jp4pWgvTrUTe3tozRTvocI2yMNwk9N73vhEDPLyyOQhYykL5GaZygbDCnc1/suBTFya90QHH/gbkjx57REne8jTCBvLjVL7RU8lLzTJv2PCt5tmREvQT8YJWsPBW29xFVqchXsWXVRqNA4fJnF/Uc2QL4X5iecfy32SLZtnArXowf6W/k54zD7ZHQQWW6g49sFEgQrmi7mh4cDQjmJ3cphVcrrdBIdT3NzLT6DUnb7B4elCBRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f325e9f6-ca4e-4680-e59b-08df2516b40f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 08:32:35.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFv7/A0DJl5RJUVAr8nRe2aF59Xp6icWHQmflSUI3D3yMMY8C6Ke3tPZajgy/n+am7GG23p/k+a6QXBg0WhMn84axMeitzYDtS+WDrn3F4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8695
X-OriginatorOrg: intel.com

On 10/7/2026 7:25 PM, Takashi Iwai wrote:

> --- a/sound/core/seq/seq_clientmgr.c
> +++ b/sound/core/seq/seq_clientmgr.c
> @@ -480,11 +480,11 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
>  	if (err < 0) {
>  		if (cell)
>  			snd_seq_fifo_cell_putback(fifo, cell);
> -		if (err == -EAGAIN && result > 0)
> -			err = 0;
>  	}
>  
> -	return (err < 0) ? err : result;
> +	if (result > 0)
> +		return result;
> +	return err < 0 ? err : 0;

Can 'err' even be positive? Looks to me as if 'result' holds the bytes
and flat 'return err' suffices.

>  }
>  
>  

