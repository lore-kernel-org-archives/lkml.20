Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793085995;
	b=Ir6VuMyXlPoPSl5K5nsd6Y4T1gJE522xSOgBGM9Qju1f5zC0DN8itauiZ5j39xDtbdtv
	 2pDtMIVpbA5ZlcIRzvprexkX413IA2Qkc6/BGSt6M+SojeRgD/sSJlPH7M+rkrcE55k2I
	 UQgu8FnJz8MMN1rtbFIFcQOdOGKXbdq4b3+136bi04YN+tobST3okstPAxMyjrbHUpk6+
	 ZqkgdkgyzsuBn+w+4akei6RI8ohd7QqyO20dxC6e7G/A1I7R04cIHxXVPfrULFUX/XKyt
	 XmPzUG/SxobNxQXCmg37FafZpxi8j5jc0QGExnaYchujuGtxMPQJVPiSgrpApdtuS9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085995;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=A6ZE8RXfiMqWAVaIgHo9MCcOUOKTx0cS80JgbYtzqDM=;
	b=ROSTf0b9uoFfqStKeGfs0PtSM2nQnRQZDjHVtKDNG2lYxjRzYnqThUsgw/UaM5pEYbfG
	 2FT6RBGJKmDpBk3Wc/cXaMyoIjx/LiBtClVoci64Kb9/nu1MjleUgjRdbj5R8e1q9ySRl
	 I2+CTPlXOHmcP7jgupesUABjkZDclQGttm7+YUlEoRdl6XUhZHfB/U/N9MBstVpCrZhz/
	 ugNO+vnLODA8VZfYltVCnWiUIwO6DTeEotUJi01WcUJxr4AqipftSfxpiC4zqGZdstFgS
	 +KBCQHSvN3TuJZcZATdYJfLp5TFBmTzRevkmICQNVJVKiEBsvGKiNMVJGt3HxWS0guA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZTWopbCD;
	arc=fail smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81211606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81211606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZTWopbCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793085994; x=1824621994;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=I9pnVJ7mNNbNNiVOxBQYfeiItkroMbc8zSh4PrT1zwY=;
  b=ZTWopbCDtmt/pJML88tpQzTz9REvyMu0v7ooR8bJVXxD50u0fbuUl2cJ
   XE4ZAe8SlTuUcSVs8QOxvUd5jVD02SB7gHvgQko6DY7V67yesV3PexS2a
   lsJRNDpkMvcSMHgX7OUa7th2InXO0+zWWvvf/Be7WVros4P1kRgoOoMpo
   kqjkbK7Kh2UVpk5jzpHUVWHESbxJNBJldTAkIXQakExUjd4egqLjl82sV
   DamrKu6gDfGY81UZ/IjJNe1qR+FOMZmU4ti8/1TwhpzCXrO815dJd7VnR
   FyQiSChLyNx0atls3eMw2kVLebpMyb/TzwUB5sNfVSzK4AEFlODWaXF2w
   Q==;
X-CSE-ConnectionGUID: R0u3Ti8ITna/h5RniovnQw==
X-CSE-MsgGUID: WIikHoRYTLGo5ILDsSd4OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1655065"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1655065"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:26:33 -0700
X-CSE-ConnectionGUID: noUGSgDHR9uv3lWa7YEOpQ==
X-CSE-MsgGUID: LXcoDqwUQS+YiRsxm24P5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4626254"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:26:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:26:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 00:26:32 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:26:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPt0rcUkqC90yJ/obC1G7rmvkFkQc2Cxk0AZekwgqMylSOSCkg8zwhCDe6mB7aMpfDtxm2ghQXV7eAhUSM1H8iydma8smZk/XA4o4rxNe7vQg/wIkip5ZrrvsLNAoep61fnHd2u753GjoUi+o4AqYmLc5Fp1fqomfobKK3FzQV/XiPAT5C4U1EJXBzaWUSt88nynE5hSgcPKdQHV7SKB+6+VaUuF+3mV/nsNK/T0R3/KMs9T57oSFt+OoAjyMIxUWlhdNVnsqV/E3ll3fMe4nsIYHPdHns0OqeejamJgDasKfNULHqYy414Aw4+/9tU9M2ICzS5ycR24FHFIs5Q3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6ZE8RXfiMqWAVaIgHo9MCcOUOKTx0cS80JgbYtzqDM=;
 b=cSJVxuO3L1CbJ86ojrQEdPstGbFdeTxb8cvXvTbf9lSeKG5ME65JXzjddPL+khO4XzhmjbXpze/0pgO0eGkXuPM2K3tYOTEjVN9qkaUtTsbK57PDG72hc31C/BaEkUSG0Y1bYqgsIApLIOoe17NOP8KLn5d9UXH4aIkas56BbEKYLZNN9DGt/4p+rTlC7+/WIqhudzxWhT4un1Np+KukuXZMgwHdnCpeAtMMlfghWV+qcEEou86a5BjxlY8Pt/UHaDB8H8XiCtPxKiW8bFpEOHAFfsNdWJWBc2EC/HfzHzbhtUaMInpM+jym5nsco1TBSuKwIS1qSUYCNuSD2EQNew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 07:24:54 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 07:24:54 +0000
Date: Tue, 27 Oct 2026 15:24:47 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, "Jason A. Donenfeld" <zx2c4@kernel.org>
Subject: Re: error[E0080]: evaluation panicked: assertion failed:
 size_of::<isize>() == size_of::<isize_atomic_repr>()
Message-ID: <auBRv4PoSBN9yuHL@rli9-mobl>
References: <202610261307.vnC1uCAL-lkp@intel.com>
 <20261026215551.GD1330439@ax162>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261026215551.GD1330439@ax162>
X-ClientProxiedBy: PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::9) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
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
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 917a469c-7afc-49f3-fa94-08df33fb65ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261022105027099003|261022075727099003|261021121427099003|260925022911599003|261021135927099003|260925021911599003|260925021311599003|10067099003|56012099006|261026121527099003|22082099003|18002099003|4143699003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info: SgQTlL0dlFeI5cdnUsXDl3EFF1J85tmQq0/YULVXfUYVmt2Z905OF3YP4x9bwQxEA0rZ11ea3Lq7bKZry36HFcMPyI34oLkx6oZh1L4k5RgTYvKYaIsOENAyESY4rZYcGwpSEZJ2TEzbIZt2ogcUGnW7l1wSGrsmHwaqd5Ru5QSqrYhHKGkYpOXDyRazlfTsHBucT7ZlZiv9qNmIesxKqpgIFl89VASiBYS3Oe7AsCp1OxkcxIKkJ19rD/625cn/bo/bfKEk0zWpGQW8FxBAXTC2pd3MQCzEoTj2BWkVgQCH/CHdr+MuU9n8E6qp+mkNY93yCApyqWXt4+OOgpBa4fK/+kthYrbG4/OtYJtrnYqo5Jqeq8RtUKM1BEShLAniUgQGIRnh98riEel5DzlaItLEjPnKGKggXHc0MRSgPJ4Tdy12pkSU74LlGhDCCpymNCMek829o26ncgToFnPjKATdDNhWDAvHA3BNzJkknwzz4WUR52+TIb7A8QvR8lMSIGXm8/WPn8hRvm0uGujeRjIrQUY0lOoHCzHJ8+z7U1DT+lZ6gz9z3DiW1muF/atlEfPq95Gq1WPCEH/o+aGFaUl/rKy+iFsGAFaWBT5eHnklzXJmyTnn4y1S+ScWSZRn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261022105027099003)(261022075727099003)(261021121427099003)(260925022911599003)(261021135927099003)(260925021911599003)(260925021311599003)(10067099003)(56012099006)(261026121527099003)(22082099003)(18002099003)(4143699003)(11063799006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+q9Q3VDe1Zf75oBMgWdtH+WZUgbTc1DbGsusW7hLcLwZ10JOXwSylXkf2+ur?=
 =?us-ascii?Q?vgCHZciUIOM/jVpUCNh0SwDLCM4041PYCFsVAf97UHwyN/m6YoCA3BBd3T8P?=
 =?us-ascii?Q?UYA52mkMl7TaGn0e/Y6thWq4Am0WjMSR3kSr4fV8RQKRFGBZ6mePUEQfxlb7?=
 =?us-ascii?Q?Isc0yqVXZ+d9NyCpNjs5WvKtiKnxd+9VJHVRMW4ZA/CElkox4EWpBQQkikYb?=
 =?us-ascii?Q?okevzbNey4hMXCG+dCzfhc7KUL5sMXtGT5IKvYwDFogBBqjpzAodMdFdGP1M?=
 =?us-ascii?Q?fqChbZaf/jBQLnD1vzp92FGvvZriMDEbp9OQQLHDdCWIIxfe1AzNAwtKq4ga?=
 =?us-ascii?Q?2g6KgtQtVFIbA0gq1T0mdAyu058YHVHIDOrc/cvrIEkY6nl40oQucMJpcfYX?=
 =?us-ascii?Q?arXHpDBFAyeSnQv0kqA4Emwd+5VDVQcQyVHsnXkZYwieqU4M0G08+gdba+3J?=
 =?us-ascii?Q?ov2AT+BzLmZOIG81WSTP+LlmeS4Iw07vgl49nGpNH5649U16OV7/tbbvHTdW?=
 =?us-ascii?Q?5VF7icP16ASK0+DDSwgzgmoWF0BZ7IwS/H01h6Ll24cY8Uwtp7li9Kl4ktHU?=
 =?us-ascii?Q?Avz4TlB2W/0yB+f3UpQq6nmLw8dKqpP1W1k54f2EkDWasuDiN4+vZWef+57M?=
 =?us-ascii?Q?fao4I66LBHZ282lma63HfVM1ku0A8ucRQzXmnUxNqde97V4S/geG8Aw8+7IF?=
 =?us-ascii?Q?fJlFPWDcj4BM1TD2i182j+Cn5ZXCONcXLmgCFGHV6fnC0L2CPzTj4aFo1cey?=
 =?us-ascii?Q?/LDioNghPvOcrrB04hKmfk9CuuYBHaPlAG05wZZmFpGQvmu9/7wtAMnYwSMd?=
 =?us-ascii?Q?gT1rzthIMxEsEjuRp8K8Lmqw0eZLo0lH4CC8USPOFirGbfd0MC0IWsUvx/YU?=
 =?us-ascii?Q?NK8fg6k2N6wZnd27RLfLNB92MZkMraSgtqo6uUKNvCF7HvsaJqrXQt2wYU4H?=
 =?us-ascii?Q?xG6GnIRxtVDtmsaME7yicMyvy0QHm10EGcoim9IU2IGBzlnEuI55/Mm8S6uR?=
 =?us-ascii?Q?Xb5oYxGeAfbaRVXxoooI5ldecI+lm6pObRbYWw3UqYADDk5zue4aTci8MSyf?=
 =?us-ascii?Q?pcdupwpwbcaDH+O9E4vsqsHJ2DjMKWp5TOH/VMq4AJ3Rnc7XlFO/lFA596ZO?=
 =?us-ascii?Q?ISgq70T36mLfiQUWslacpRbeBrAeo/U7obtPb32N31XA4koc+ppvI57T3uty?=
 =?us-ascii?Q?a/h9w3jr62mlR9u2pwBaIvmGZW8J+ntITbc4Jha4/sv9opXZXIAaTVPy48sO?=
 =?us-ascii?Q?QXU7ef0eUMQr1PO0rYUkel6z7FqpN0zcqqZRny3wAnJTTGeSsmEuhzRx34BG?=
 =?us-ascii?Q?n/TIqwLMHBE0vJw0cmBF3vXK6o0YFcilcMmmrslCNq9RnzjCfrhKhfa6KgW/?=
 =?us-ascii?Q?scp9mP6jv9mwppLjIlD7/77yCfPd1CTbD3RwoqkS5ufMEnsVEwi7UzQd3ZaH?=
 =?us-ascii?Q?Ypk08CLuysCtiWYRoSIFByTBU/Rlk5+WZTFvwhyz27JggqaEhFXkNlW9CeAK?=
 =?us-ascii?Q?cLmSg80Ti0L8Nkj+HVUHLVE71Fk23StclAzn27ri35q+wYLtsgqZ5Ir/Loud?=
 =?us-ascii?Q?PXfA+sLlxf6It9XueJg1Ov8YvfnMDyfaVuFHdG1eWhibHuW+CzTnICCLBUwp?=
 =?us-ascii?Q?8CqEz19hS/VlZ/zTn560rFWvOmfaPGxk4sF5qvnh8lbUy3ZqJQVTPJlIdaGn?=
 =?us-ascii?Q?519/gsMR6HAzQ2j47/OthLSmUihySceeH5GNUkS0YeRocFQ9NSI/isL+65q5?=
 =?us-ascii?Q?afiYEaYU5A=3D=3D?=
X-Exchange-RoutingPolicyChecked: eIKy7lw9+qvWro+N0Q/2WQvxtQXw5UC8iGNTqf2fayf4P6A/Ryb6gBZa3FKTERmqJVxT4g0L3jQcLp6ViOwdyz0+K+/miWdS4nt7gAn8vPMhdxUZ4dHIrG8mB6f0zdH9ACMZvnBKR1RIEl8jx63yZ4WA17anBRxyREN6HQVUAao4rqAIcrOWzr/mw/bg7fMQvj7b0S0pUAsOpkSTWux/zKk1mGs/sTxRFzjD2iW2A3lzrC3oNQc11WZSgxPo1Y+TBXkO6U9YUug5dtTlKOnQTPg9JsMLZlFayOgQUkPsY0EQWQa8uP3/ER3RnjTdaI4mZFwy5+7Wm3mTm1ZXFf0Kew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 917a469c-7afc-49f3-fa94-08df33fb65ad
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 07:24:54.6840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkW5J0PqVb/1LELkb89+pjKfTNyvAqW+yRy7crSclsmFhFTKnFVUaUInrmz2TH/eRteZO2WjADwK88AxaA/wAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
X-OriginatorOrg: intel.com

On Mon, Oct 26, 2026 at 02:55:51PM -0700, Nathan Chancellor wrote:
> On Mon, Oct 26, 2026 at 01:51:14PM +0100, kernel test robot wrote:
> > Hi Nathan,
> > 
> > FYI, the error/warning still remains.
> 
> I think the result of this bisection is wrong. When building at the
> parent change (703749b069d5) with this toolchain, there is the error
> that this change (eb13a1ff271b) resolves:
> 
>   ld.lld: error: undefined symbol: memset
>   >>> referenced by getrandom.c:87 (lib/vdso/getrandom.c:87)
>   >>>               arch/loongarch/vdso/vgetrandom.o:(__vdso_getrandom)
>   make[4]: *** [arch/loongarch/vdso/Makefile:83: arch/loongarch/vdso/vdso.so.dbg] Error 1
> 
> If I use LLVM 23.1.4 + rust 1.99.1 to build at the parent change, I can
> get the same error reported, so I don't think my change is responsible
> for it.

Sorry for the false positive, I had updated the bot to avoid reporting this,
and I will check how to correct the bisection as next step.

> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   6b4b543fa18757297ac756a6fe6e64f506b7844a
> > commit: eb13a1ff271b0d180687eebb30611b0b276d5193 random: vDSO: avoid call to memset() when zeroing reserved parameter
> > date:   3 weeks ago
> > config: loongarch-randconfig-r2103-20261026 (https://download.01.org/0day-ci/archive/20261026/202610261307.vnC1uCAL-lkp@intel.com/config)
> > compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
> > rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261307.vnC1uCAL-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: eb13a1ff271b ("random: vDSO: avoid call to memset() when zeroing reserved parameter")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202610261307.vnC1uCAL-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> error[E0080]: evaluation panicked: assertion failed: size_of::<isize>() == size_of::<isize_atomic_repr>()
> >    --> rust/kernel/build_assert.rs:112:23
> >    |
> >    112 |         const _: () = ::core::assert!($condition $(,$arg)?);
> >    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
> >    |
> >    ::: rust/kernel/sync/atomic/predefine.rs:98:1
> >    |
> >    98 | static_assert!(size_of::<isize>() == size_of::<isize_atomic_repr>());
> >    | -------------------------------------------------------------------- in this macro invocation
> >    |
> >    = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
> > --
> > >> error[E0080]: evaluation panicked: assertion failed: align_of::<isize>() == align_of::<isize_atomic_repr>()
> >    --> rust/kernel/build_assert.rs:112:23
> >    |
> >    112 |         const _: () = ::core::assert!($condition $(,$arg)?);
> >    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
> >    |
> >    ::: rust/kernel/sync/atomic/predefine.rs:99:1
> >    |
> >    99 | static_assert!(align_of::<isize>() == align_of::<isize_atomic_repr>());
> >    | ---------------------------------------------------------------------- in this macro invocation
> >    |
> >    = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
> > --
> > >> error[E0080]: evaluation panicked: assertion failed: size_of::<usize>() == size_of::<isize_atomic_repr>()
> >    --> rust/kernel/build_assert.rs:112:23
> >    |
> >    112 |         const _: () = ::core::assert!($condition $(,$arg)?);
> >    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
> >    |
> >    ::: rust/kernel/sync/atomic/predefine.rs:100:1
> >    |
> >    100 | static_assert!(size_of::<usize>() == size_of::<isize_atomic_repr>());
> >    | -------------------------------------------------------------------- in this macro invocation
> >    |
> >    = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
> > --
> > >> error[E0080]: evaluation panicked: assertion failed: align_of::<usize>() == align_of::<isize_atomic_repr>()
> >    --> rust/kernel/build_assert.rs:112:23
> >    |
> >    112 |         const _: () = ::core::assert!($condition $(,$arg)?);
> >    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
> >    |
> >    ::: rust/kernel/sync/atomic/predefine.rs:101:1
> >    |
> >    101 | static_assert!(align_of::<usize>() == align_of::<isize_atomic_repr>());
> >    | ---------------------------------------------------------------------- in this macro invocation
> >    |
> >    = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> -- 
> Cheers,
> Nathan
> 
