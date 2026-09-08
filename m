Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BF4253951;
	Tue,  8 Sep 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881747; cv=fail; b=LhgFp0WORE+/n3WBUJ40t+OnrgE3G6yJmy0OZxat3RduDnsLOp9tJoEuPu2lMI+cPLlOhwKzkejarCBVCLKUnlubVNj7gePI5FxZSnpq02+bfzxOq2jMjvJOl1maEVIEIjLnqV723EfbRfYQq3geUANP3ZdZGruWC41sKr3ULk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881747; c=relaxed/simple;
	bh=dqJ3X3K/upnyFAAdPZ4XIbnffcYiGuNuwKvJAm0sGRk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tq8p+n0zRkQ7O+66yL+WMhOwetChqsCP3yHRhFapCG722jINoniUYIGowFuvgv5x1vNGTU9qYm/tt9ugwc1UNTlRxpcy8S9vlmgthWe8Mu9Tz4UaEYL/U1TJZPesVvF1sld9S9+4tQkpT3vKOILH3LWJV+mzD8qaQG1G5+MFMlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnGPHqDb; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnGPHqDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788881743; x=1820417743;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dqJ3X3K/upnyFAAdPZ4XIbnffcYiGuNuwKvJAm0sGRk=;
  b=CnGPHqDblQobfbTk0tffterQHdNx8j6AY/BQQgHrq3e9p93uN0YPwcV4
   A3jIu5NX4djdMA42gB7LhIOoq+dzM2Ednf/3IwqqosgImlAc4s0xEsmaJ
   BCTQLOS5n3hVK3f5qR6rqGsFb76cfA/npW97KD1gBMfpTZH6xXquQNkKL
   yd48lXA82//3NLLNTFI7dLjss96+gqIeJuYilyXpGmBYmgVZ997y240no
   KRftb5Gy76fYd9giSk3PUyfIrujJUUYHq6dtMEQdNL1+CISvNVERy0GRw
   4EC9F3OThfIayyZa9cI50A9r/qntmiKpLsmhkbdFF85iz/FrXqn1Fmx2h
   Q==;
X-CSE-ConnectionGUID: MCu+bQnHSeuZdRriQzS6gQ==
X-CSE-MsgGUID: g6GRmhXkRdKA/YLQA1s3DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99949695"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="99949695"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 08:35:40 -0700
X-CSE-ConnectionGUID: Nfwflql9Q9eDPqEI07sIqQ==
X-CSE-MsgGUID: YBrmvQ2tS1KsYHxr5CUMuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="267798696"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 08:35:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 08:35:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 08:35:39 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 08:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i41wdscjNvsxE0opl7Qnrt11Ubl3J7p2LCm3sumfwXmlKNacEJx5dH/U2UcjlAC5B1DccL7vz4TYn4+/2vMyCT0vcIOnjZeHd9Bu4/ys8j7O3dbFkprfwFZIBHCaqjz7oqMrerGNrUDQf6Ct4uEmDRg3yJV2Uly+DjGc2T2n+A8i4YbDpFkrq7TPlm/j7ox7YA7qcUuI9n5scLTvLBrLFHawmdo6fG0UBtcSkmUIjUZuOBaX/rr+wM7bgrsgpIrmhoOmYPvugNGWe5qpXPtyPAs0NhYqjlL6nLVWrcWJX3W5hoIp3rnFHvQyLcQcH+Rr7rBeyrz2oZRCys2FQY2dEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLWkUEbLEWlXHQeJUXl8BBsGUUfHkoKud5OicPgz49o=;
 b=WoR6QG928eLmAHpZJDAclcujzsR1729o5cINtCdC3wBbVrwUB3ClVWABLYobXAGbV2DAFxbkEmPCUfUWBm2Vkm993wU5koEYsUeEiXWPPlegBx6A20UAtedjKoGvRUVSDUbUUyihC5FRiIPuAyexhdHcT3u3wd0TiK+jJiwUXvpxmVs/12hv4K7upRIOnUi/aSAM2ycLQZn9EouGNUaD3vi9qZyg2sisa+Rb9pTXY+EPu3kO72FdD7zgXIF9Delji62Y2Cw75+/NpkNyVrqliGkVNWV+HZKdHMxWDDjiXsZpubn6PELaipTfwqo9rbltZ3ueaSggCx//FAKUxgL4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SAWPR11MB9709.namprd11.prod.outlook.com (2603:10b6:806:4ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 15:35:28 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 15:35:28 +0000
Message-ID: <649aef0d-f915-4288-b3b0-4092adb783b0@intel.com>
Date: Tue, 8 Sep 2026 08:35:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>
CC: <x86@kernel.org>, <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
	<dave.martin@arm.com>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
 <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
 <a82061f1-bb23-403f-b772-d5adf7acb871@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <a82061f1-bb23-403f-b772-d5adf7acb871@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:303:b7::19) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SAWPR11MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f34c893-73e7-4fa6-ad6d-08df0dbecf1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: aZGuBKd8WC6yPdMofBtW6M+kCLScvCuw+KXeO9iZs701zaw7Zeo8AcO3HK2pPBvmeKBGg/2lPJmucUvxW+n8q5HvvdtbessREYQHRT7dFZTxcXQslv9JWU+pl3V7XW0GOA+EtGfMcGd08fSSpNdIqLjUD9EbH2VEo0TZutyhmx6VSYuy0YvJRGDlTCvIUgi6fTTXOTpHdPvpc6xW2qlb/sNxlFwXPuu+Nm3RJj3ace1rtM4zxP1aPKMevulTuhw08v62KA3p9Tf+gzT5OkM+9wgpRlbrN4bZH7fvc4fZWWsxV3v0lXlAbf1KXh/6bFJC5rEHskxHHpUtqJXfwdRBW+Ndww2Lgd5PuLRd07mJuXJnQt+UyCMWRcpPQ/8Ta9h33G3xmM+fT9D7YSiL/Imlhh4CKTBpfdNbgD3yStwofHNrpl0YcwIH5qa7/m/9avSBggKWLP3ihIChH/ztNkgbnhK9sqZjfdaYiIoHksID8uoLCAmYk88J9p/mYYRsUB3TK7tBRak/HD93VLBVUHPOZH39hRelORGpF+PpNdXkh1IKoIwk1JAGK7CbA2xYAdm8lXdPesuPCnANfAG3yo6S0+oIc99qDHr/qavAP4liyC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REZtMWdGemJGaVFXbHhKUlFaTmliRmlCaVlhdUZzVmF4TTlMS1FKaVpGeG82?=
 =?utf-8?B?bzNMWm5RZUIyQ200VnBBbCtrUWlSQ0F4SmdCTEtCZlpXWDV1QllpeWVsd0hi?=
 =?utf-8?B?T0FXUUpRK3pnb1pLRHFRQTJLeHZ6eU9hcXA4dWZTNS9ZdFlNRFFXVUZ4ODFR?=
 =?utf-8?B?Mzl3TGRmYWk3Zktya01JbW13aWtrY1I4bmpPcGM2SmgzN3RrclBvUGhhSFZu?=
 =?utf-8?B?bEF3TmxjUzZYNXJ6YkxvaDB4aER5YVZMT3dWTC8rU2NRRDhCalNEY1NEaGNP?=
 =?utf-8?B?cnpVM2l0SmZWSldQNUtnNGYzNDRsWk9NM1hMd1ZKNDZySmFpbDBwZWljaHg0?=
 =?utf-8?B?aWlnVjVGaUcwSm1EenNSb2RFLzlvNVNYZ29neTFQYUo5c3VjUFBqSGltVHdi?=
 =?utf-8?B?d1krVU5ISHVBWURoQVR4UVZGYkdmbzE4cmVYUEcyQlJhZlNUSldaVDlDbHpa?=
 =?utf-8?B?ZmwreXFudUwvNXdBN3M0TDBDMlVQdndva3RzaGVNZ2k2c1Q4M0xhT1BQajFn?=
 =?utf-8?B?N0Mrc29xYTVvWHI0eno0b0ZuQUJiNWtQWGFqbE94bjM3bGVDRTBJeDNmU2VT?=
 =?utf-8?B?dUU2TEI3OEFIT0U2NTVCYzJWMjdVOFExcU9vWFJvb3VWUmFMaURSWFNOZHJp?=
 =?utf-8?B?bFZMRUJCbXd6NStPeERqL3gyQWxsSU43STlYMDA2UUMwQytNRHE0TDMyQVFQ?=
 =?utf-8?B?Z0MxcVVIL0krdjZLS2RWVUJ1ZGliUjFwdElEbmo3dTZPSUxhRUdjRlcySUEv?=
 =?utf-8?B?QWd5TlRMNzI4Vm9sM2grS1dPZzVlSnRIbnptRnlzUlBiSFJTOHpYaitJUnZX?=
 =?utf-8?B?WW43eEFybnB0UElBaUhleGhzaWRPSlFleTU5dXZDQnk5RmFsT3hTa0hTMFJP?=
 =?utf-8?B?WGpRS2ZETTdEblFBVW5iVGhzdXNkOGNlNjBWVlhHc1FkZjg3TllaM1MwK2F4?=
 =?utf-8?B?Z0RQZkZhQWM4cjlndnIzenBsYThiWUZtYlgvaVpPZDNGUFUxYitiV3lKMGYz?=
 =?utf-8?B?bDRIL0tuREN6N1VpMW4zWmcwKzlxUU54RDdZMVBwakJXTmxiVVAvN25ZWWZi?=
 =?utf-8?B?RGhVM3Z6OUhwMDNKb00zRmtnNXJqWWtTUGlES2lORDVFWHoxd1pBWndtZk9a?=
 =?utf-8?B?OXVUS2paUlVYSjBUOG5KM3NrRjI3SG5hTkRrdE5ENmNyUnFtUHFSNGhIV2dR?=
 =?utf-8?B?RHlKc3JUbG9Cb3FrSStkalNsOWlmZHcxLzF2eHdrMFRBU3lmWVQza2MrRHE2?=
 =?utf-8?B?Q3QwbWgveTVUMmJKWklYMkRMb0NOcXFScVp4aFhTMTdPOWNIQUVLMThJWDVN?=
 =?utf-8?B?dGd4R0I5Qkt5QXFFODd3VHozSTdWWUZYUitPZHc2QWZUeXZvSDd2dVI5UXU1?=
 =?utf-8?B?TEgzTzIyajJ4dGxjczZVTkxUQWt2VXVaUURsVUVnbEhCbGR6R2VrVGVpSzU4?=
 =?utf-8?B?S0JBYlpTaE1TVTdoYksxQVNEN2ptVVhBR1htMjhWdkFuQTZuQk5QczFzZDBs?=
 =?utf-8?B?cm5Nb1FEakIrN1V3Q2FJN0p1bFBKRTh5cjVpZHZPaUxEbGUzUDRUWmR1TFBJ?=
 =?utf-8?B?NGhtNmt2SVRHay9CRnBrRElyeW1USStlM08rNzdqWWppckZBMk8wZjVJQ2tV?=
 =?utf-8?B?b2NIUFBPd2ZEQmZIcXZhdTcyNUFwR3IyTXVQQkRzZzhtQUMwdmdzVE9SUGgr?=
 =?utf-8?B?dnh3Mkp4cDgwc2JIQnNzakIySkt6eEN1R0J6QUxtdDZVQldkeEhLZHZYVGpW?=
 =?utf-8?B?WUpmUHhUNk1idjBxeUxJdnlaWU9meG5wd0ZYdFZxTUJxTWFxcnJMNGx1UCsr?=
 =?utf-8?B?eitId3luSUF2UTlvTk5rRzZLNGE3NXZtWkd3cTVRL2R3Mk03Z3V3clpsOWhB?=
 =?utf-8?B?RUw3djd4V0k4aG9FQlZQUExrQWxwcEwxREhlV1dSUUtEanZtRXYrUk4yMlpH?=
 =?utf-8?B?U25jUXJ0WmxwTENKSlVGbSs0L3QvRnRJTFBuZDliaGdGNmxKbEJGVWN1QzV1?=
 =?utf-8?B?V24rR2ZPRXBCeUFTS1JlZUJhOTBZRHplWG1lNmFmOG5zRW51aFZwNXJIRW9Y?=
 =?utf-8?B?eWc2Nll6ODd5dk0yOVE1emt2SkZ3bUc3Um5keTBTaXNmRXI5dVVOb2trQ0ZK?=
 =?utf-8?B?WGdqYkpSWnA2dkRvLzdpcFQ0MmVWSk52cDNMbStHWUdGTHl1RzNwd09rQldV?=
 =?utf-8?B?NzAyV2llbWo2bEtndlY0RUFLSW1mSXMzUzVXeWthVXBUVlBQbzc5dFg5K0Mx?=
 =?utf-8?B?eG5ZbkwrY0RLOW5XWENCRWxxdGgvbW1FVWR3NERrbjh0MzNUQmZNVmgvaFNw?=
 =?utf-8?B?R3dvMHc5Vm1Na0xSUkpab0VZMmZzZFh5UGVkL0xxUi81bjRickp6WVE0R0pE?=
 =?utf-8?Q?6kSHf6UGjhxTB9lM=3D?=
X-Exchange-RoutingPolicyChecked: rj9/3/Hfg4m6DKrwJNVyypAyP4B3AsPCuGJDhVOTafuCaHo+bbNxd7yprG1givYQlOck4oDEWgw5IrqoGfd/khKLf7DQDoO1gnZdQJM+GtEgEpGEMVjHet+5fLrDjaLhuAJ7ikMcP69/gz476fEQnhHbh5E+o7XHctWd0YQtkmadqhsFThNfSxvLPsrGRp0W9Jm74YkvUs0I8WUI0TOujlnsVBB+LpFbFZBNc35KQHLm8fnxj1jASRyg0HZlKG6l6H1WOBMUrw1AfnJ8PaM0ca8ALVPagbVPtsvInD5Sn0OZteX2tipjm9UbpKbqVOd0QeIxlHO3yaqfNNZfyN8mEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f34c893-73e7-4fa6-ad6d-08df0dbecf1c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:35:28.1472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AY4Jo8gxchuj4U088klU0z7a0zaIf/AX8LgbCXRSixRT2bHWOK9Lq0TasppHxpCTrox9yxz4vWaUufc8xVEu7SrZdh9tN7qaUQMz61lMntc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9709
X-OriginatorOrg: intel.com

Hi Ben,

On 9/7/26 3:44 AM, Ben Horgan wrote:
> Hi Boris, Reinette,
> 
> On 04/09/2026 18:36, Borislav Petkov wrote:
>> On Thu, Sep 03, 2026 at 08:37:51PM -0700, Borislav Petkov wrote:
>>> Lemme have a look.
>>
>> Sashiko has comments:
>>
>> https://sashiko.dev/#/patchset/20260709093111.367851-1-ben.horgan%40arm.com
>>
>> Please address them: if valid, fix them, if not, explain why they don't need
>> to be fixed.
>>
>> Thx.
>>
> 
> Regarding the first Sashiko comment.
> 
> The documentation change in patch 3 includes the sentence:
> 
> "
> The allocated bandwidth percentage is rounded up to the next control step available on the
> hardware.
> "
> 
> Sashiko rightly objects to the "rounded up". For MPAM systems this can be up or down and we test in
> test_mpam_resctrl.c:test_percent_to_max_rounding() that it isn't too biased to rounding one way or
> the other.
> 
> How about replacing "rounded up" with "rounded up or down" so that the sentence becomes:
> 
> "
> The allocated bandwidth percentage is rounded up or down to the next control step available on the
> hardware.
> "
> 
> What do you think? Should I respin the series with this alteration?
The change looks good to me since Intel always rounds up. By itself "rounded" may thus be deceiving.
One concern is that "next" seems to accompany "round up" to reflect forward/upward movement.
How about also replacing "next" with "nearest" or "closest"?

I think a respin would be most convenient to ensure the intended changes are made.

Reinette
