Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793802743;
	b=VBTYa2f+gJWJ5yLjcNGKo8advekwEPWHeU2odLFydDqze2ymaFohyjA/xDB4ZyO4glKQ
	 f7Ct94KvUG0EYRrfwkP//P3EnIFJxCBqS1MuCEUdurLRnLaAkT38gfeBugtnZ4/f4DmdW
	 XH+H2Kk5/sItbWJvN7JTbEOmrFPSxKFqYmTu7tNj5GYyJJcSlU850ExOMLo/4Ky/Uzm5e
	 TOUxC1fuH3hOXxmxKTho8U6khEyuSSkmEVBB1yZLOYfwejkdHV4v4kr8OIvHGPV+BmBry
	 CzxWyXvi07DQCddiuWEC43LeB5xZgFJAvnOWH1qJ3KPB4xBr3ODiu1RmF14a5dG135g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802743;
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
	bh=enpdwYqFRlhL33ia7EWmM996EnbhIO7uT4aQXOzMy8U=;
	b=QE/mQ4ZqjM5BjhYW92Ah8DrBirJVR11bnqov8p9vOodjhKsgwrF3E0ZPUF7yPDh6CVKx
	 /KQx2EnApLeP7DzLYHUhbBaVXewOLvwkREV9DHdZg69CtjcYCKthwjfeCxPPq1dS2jGXJ
	 7tYZJPR9FVIVTfabr56Fzv7TBvv1b5ji/tEJTeAXKmibk4jzHet4Oc3lhXHfwUZt9ADFr
	 LGCpwHSiY03mIFNcccOtFovtLGWhZkGFE9jePZ31Qm8Rwn+iP00z5LcrmUU53X1IyOcDB
	 s8UOrJWGJWqlcNNanKkGltmWw6GYS6Vl27cqQMorSO28aZHWwIa3PMhMkVQXk6iwnzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="lXUL/xTW";
	arc=fail smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB095606A326;
	Wed,  4 Nov 2026 14:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB095606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lXUL/xTW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793802742; x=1825338742;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uzQ3Tuw8u9u11Tw1udI9Evm7YI2aoPJ/sdyPMREYeyA=;
  b=lXUL/xTWRPbc/Hmh0VmGQf2JMDcxhSo/Z0giGdZ/M+8uB52jUxWdMRe0
   rIrMEyINfrFJrRNQRElSweoWNJWCCymt8QxLqgFRqq4Ul4gHBIL5eJtqA
   DpV43ChpycJBTfulNb/8KJdpdBHMQ9XNcNNmAK9PVlErSJhStBlemr8Ry
   1hxhyEHxzD8Rwq1ojH53gv7DwmqEcV5aBtrDQQya/5b2Qvw8uV+nooRYi
   RYcFFCo8lr25gd+uWZ+bVDSF0ag/XEGRBDOLNkyNY3vEcKsao/JW/avGA
   EBa48OXRmg+67FtyXYZnFEnDGbYuby5/l/GxLfVWb744nHhlHy0gmI/08
   g==;
X-CSE-ConnectionGUID: eQH+/UK+TFyJY0OaJX1QTQ==
X-CSE-MsgGUID: zsWfRo04SmWcfCcEspIFQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2553680"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2553680"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 06:32:22 -0800
X-CSE-ConnectionGUID: v+KT0iVeSMqiKja1lYm6Yg==
X-CSE-MsgGUID: 6PQH6e7yTuC4w9BtqKMcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="8602848"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 06:32:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 06:32:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 06:32:20 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 06:32:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqMEzo5I4lhkbXSQlM1IaWghu8LwGKXhHlMUC1jIEAgL11jWEuK3VwoLfJwD4XXelkDgn1b5dOxox3nUwkkXoAzHKwQTmR/n1+CxyEPML8z8VSSrfftaORx5wAabpXOi33ARFOUW/x1KHq/VNFPdAPKJzxd2TFciu9hJ8/MPrOAiBOG+QpXZEg2xosuONI0YZqQuqgYUJDYNvBC1u//Vwp8YFlEX1/NQTAOb4xDprUynyWgCGaYaZjFzLx0kGxCJPKOOrAUJGEJWhWQy6pBh29Apy/d0rmjMQjt8shmY4ilzs+1uQbEFiW9ehNb48u55OUC3n0B+tEfp5kyWPaG2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enpdwYqFRlhL33ia7EWmM996EnbhIO7uT4aQXOzMy8U=;
 b=ceP59IeJyJpRWBq+NBbWvq0rdI20ktH2W6Xlj0QdIhTLVQlzWDlK6I4nGbE4qPr+uiTmoKQBYERi5Rr0RqKLoNyvcevyGMjRUP8DlO9eKiJooKR6t4msKiWG848D0Yqd1cDxdp2KAgLpiHz8o0zlTzmW5hiRCWy0qkJrE5iQ6jPVyQo01fmT+wtNqSbGdAXIIF4QAUeSi+/7brLint6cBB+Q4De1kCRrT7N3REn+xVvaKtA8qGRo6vmzw4XYtczwDh8Hd26XqvtqyXxWXks7J+T5mio0mcD50JYwne7kazYfOh3KYfgVJHkxKV4VZaCW0YWqv2wUq9qQc2WQiA/Pbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by DS4PPFEE549A404.namprd11.prod.outlook.com (2603:10b6:f:fc02::60) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 14:31:11 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 14:31:09 +0000
Message-ID: <746bae53-ed1d-4881-9268-968c25270bda@intel.com>
Date: Wed, 4 Nov 2026 15:31:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
To: Vinod Koul <vkoul@kernel.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>, <tiwai@suse.com>,
	<perex@perex.cz>, <amade@asmblr.net>, <linux-kernel@vger.kernel.org>,
	<yung-chuan.liao@linux.intel.com>
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
 <9da94716-4dde-4389-9574-12f90b52e05a@intel.com>
 <d9672276-5616-4609-98c1-5b9bdd06cf05@linux.dev> <aus0GT3ht1oEY2mc@parshuram>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aus0GT3ht1oEY2mc@parshuram>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0288.eurprd07.prod.outlook.com
 (2603:10a6:800:130::16) To PH0PR11MB4952.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|DS4PPFEE549A404:EE_
X-MS-Office365-Filtering-Correlation-Id: 43250caa-2845-4cd0-9577-08df3a8044ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261022105027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: JDQ8Ydx4aW3Qzp7K3GRM5DgxxxTAeYoqx7sSFoxvDG/mrQqF+yOD62PRI2qS4oWJGYRrCgvazmvFMa7cD4UAqPDt6Cp2sIwIqkopXA3qHZf0wnkOuNrKg8gALu0nQXazI4p0WwwHk1wKEddlim1efN1Wu88nHF5ZHr+TtHgbCjY30dt8VJHYA1SNyjUSl7dlUjAl9/gGlfqQmNlBkU4r+5M06LeTyqSKvlrSui5kn+euzT6Z3PQ43K8HFv6BVoPseXuh+QzirHCihRxBVYcgxsPAQWLe6fMXCn7i+O2mDhBGHN4vc4wLq6rysoEMxxkFvvoK9YcHfkpJmOmCVgJOu2Z68FOOYP0cQDLm6aEgUZNymn2zVrvcg/sgJO9r5quD8f5tzTNX8EQVwEsSEII94DZVFj3qv2TbKMNaEGxXNgsbfbBkhDlhChMikpS0UsxGxragmKDD/eEZMl8+3qToSk/RdAfOgBLeCeEkJx9tKUYzX9feXUUbJ+Ik4jelwxa3RcmIi2sp8NhQ00GDOSpWNEekAJtIP4MHpoP2kZl1nvdS05oVJtD8n8pZT5pUJ4C5r7TRTLF30TwAO4aW5CSgfiLXeSB4YvNml4IIfMW+bonxkooK2l7YAxxgE25OO0niKZ3autUhtHzabZCD5OwulqvatY3jlUGcjftpPrS+2EQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261022105027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZStOV00vemNPN0NCT3NPY3BzQ2tLVGFveXRuOXZwZlNSb3VVZ3drRmtRMFFV?=
 =?utf-8?B?cnJwdzJBSE9Qa1JzRnR2M0krWUhwc2lUYXlkUzI2ZWN2YWVUWEFIUnZJbnU4?=
 =?utf-8?B?R21ZdXlTYnhpdHhzVVA1THUxaFZlWGlVMVVnVVlaOEd5VThjb2lCTWZsUHlt?=
 =?utf-8?B?ZzErb1RDQ0JnUFFMNDVodUt1SDdPajA4azdwQ2NJOE9namM3K29ZNlg3QjRs?=
 =?utf-8?B?K09OSUR6NGRnZTZKTGJTWlI0Qmp5SUpUMi9LZWRqMEx3b1B4cFkyeWpGc3Jr?=
 =?utf-8?B?N1JveW9GeFlwb1BpUGw1YmlXT2xUWDJkMzBEL2hxQnRDcFk3NkxXYzZaK2wx?=
 =?utf-8?B?amJZTnJ6WjNoNTFwckt4RDZHVk9Ua3R2SHpMQjZhUGRLRmkwVkdTR0pzUXU4?=
 =?utf-8?B?VUZDMG1heFRyeXZDd0c2QkQwS2c2aFREQXZhVUFvdGxnYXo5ZTUyS3dJK2FB?=
 =?utf-8?B?am9JZ2IzeW1EanNpV3ROb0orSXNNMlJPbkRIZElXczlJQnN4ZnFEMlgwNzUy?=
 =?utf-8?B?ZjJqZjhVSTIwcGlEOERSbzJDenhRdFNueVplaWo0UWRhZnpKWVUyN04xTTRY?=
 =?utf-8?B?Z0FvM096YUI3SHlwVmVmdUlQd3ppbSs5aTRWeUlvTFh5QUx2TlZzc1J4QUVz?=
 =?utf-8?B?OVRxdHpUclZZcHIzalJOZElzUlBvYThwd0pSU2Fxc1NkdmNiTnNpVk05bTMy?=
 =?utf-8?B?emxKWUtHUmdxcDBuUEhyeWNVRitVWTAwWm1MNnRxSlJNS2tPbGlUVEZxKzND?=
 =?utf-8?B?Mmk2VFlSUGc2YURxaC9vQTdQS0tlVk9tZFViRHNrQWJVSXhPYllGenh6OEhn?=
 =?utf-8?B?dE1oQTNaNjJkck5jelhBeUUwWlBpdVFTSEIzYm1VaFJPMHh4V2lEMlZIM3VZ?=
 =?utf-8?B?ZWN3M3dUK25PYjI4aWozWjNyZDE0ZGxiNVVMRHVBWUEwYjJ4THBYQkU2enRG?=
 =?utf-8?B?bW45NHp4RzJpUWhXbHdIeUVTZTJYc1NtNU9SSUp6QVFqYyt2UEFsdDJaZUlJ?=
 =?utf-8?B?QXJhTFc1R1BhVnpyb0s4UE1Oc3RSa0dSRXRZdlJqUTZmWjNzMDBUTDYyQ2FQ?=
 =?utf-8?B?UGQ1NThlOXVDR3B1cVJHenZHWDhoci9SanUvNVRndGlWaTJmb1h6MVp0U2Jn?=
 =?utf-8?B?UUVrclJVdkpWeVRjZDJMT243di94UVhkajlQeDBPY0tpV0JXemhLcmVIQm1z?=
 =?utf-8?B?aGhyM3poYmVhdG1Ra1UxMmxBSG1ndXZUQ0ZOL0RUQnlxcjRsUHdaeTZBU3Bo?=
 =?utf-8?B?ZFpiVDRoajU1WG4yL21BNktDQVF0QlcvUnNPSzlXRzVnRkRseERRdk1ld1gr?=
 =?utf-8?B?b3llelhhSC94eFR2bzZRY2wvR05WNXVZTVdZS05ETmVlM2VwQWlxcEpiTUtW?=
 =?utf-8?B?WHBKb21vSEI3UExvT0t3TUNsV1U0RStYeHRVZ1FsSktxQkFkMkFCMzI5alRK?=
 =?utf-8?B?V1hTWTBxQ0V5cEpmQ2ZhVEdhcWtMbDlKNy9TaEN3dHRCYk96U1BpeE4xaVR6?=
 =?utf-8?B?Slp5Z2pWUXBZcyt4Y0h5MFlRM01ETW55Qi9DV2lWUzhuQXE3K05ubXJyRldp?=
 =?utf-8?B?dnZKaDdoT25WKzdVYmo1cENOVUVMT1ZraFpKVitTN0VRd0JjMExzVEtiUWNz?=
 =?utf-8?B?blBvSWNseEhxa3VxZ29icTRXdjVUOE1xVEwrZytLTnFkRXJTWW5FSjBoRjh2?=
 =?utf-8?B?Q1Bjc0paNkhQdlp0cHVOQ3BhZEFUa091emZYaG9kcW1ZMmoyN2FJMW0wNG1J?=
 =?utf-8?B?VC9zMlNFSjNyajJKMGNyVzJEMEU3R0Nvby9IZHZnbXZkdkZrNTBDUEpsNHBu?=
 =?utf-8?B?eWZ0Y0c0enRiTnUvUzQrVmdMa09uT0Z2T1dydmhYcnp4OWp0NC9Lc1I2a25s?=
 =?utf-8?B?eWVWM3ZCNk5nSXEzdkRuMnBYY2VCZXJFVkt2bFhnV3VZRFREMGkwQ0t6RzR5?=
 =?utf-8?B?aXFPdWZzRitHTEJ5RE5ydG54L1Iwb2xEeDdpNUlFM3h1cHdmQ2J5eHIzTGIw?=
 =?utf-8?B?dGo5K3FXN0IzQUdQSkhUS2NxMWNuWmVGRHFzRTh6MW53QkJWWnVxanVsbG9x?=
 =?utf-8?B?bzRLYmJ1ZUJIOXFQU3hXSWtSZEFIT1ZZeU5nK25FdTAzVDQ3MFRrT0d1NzBL?=
 =?utf-8?B?dE8rdWRud1VPS2Y2MnU3VVdDeDk2U1A1QlBYYnNCc3JBdytHbEVITnVRQzJk?=
 =?utf-8?B?SkdyTUg0d0UvMHBDRmNWZ1k0eDNYTGs1RCtYU2pCWVNxZGxIVFhCUHpqaUdp?=
 =?utf-8?B?WHZ4aEdYcENuV1o3a2FxSHhaRTNxMVZsQ0tIVGNSejVPNk5ITU1rRzlES1ll?=
 =?utf-8?B?VzJ0eUVFVDBUVWtGcExQYWdzRHNzd1IrcGJZNnVQb1gwakhPYVk1Zz09?=
X-Exchange-RoutingPolicyChecked: LRCozTgS2QFHI60mJPeDQYh3JV4w82+gS5pKJbZ0Sar7cRE5f1aFP/7PHr0EN5rGYMGC4GEkqJZpLdh1SrFNaHVw6RbyJLru+/iCgGujzLLEcVJcEudaq1hOZv+O3KOu8JNRe0Owt9kLHoYnc7uOykkXpXQUKNlUcwkGreD8DsAjL8xLM7W2NXkj5qUf5OX76NpqztWirjeWfYt4Wi4yA4orYPVs1NV0F/OQQ8osYZ+QN6IwBJNBpQ9PScWVY8iSoLKArZjaz3n4LDMOxCxeH/yWM5LqJAb/HMP/W3yyJyc6yIL8kcmgxwuC8Gm3T7BHy+9trc21iqth6B2uLeHbcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43250caa-2845-4cd0-9577-08df3a8044ce
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:31:09.7152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1YPKiIxk/+fc971wPBW1FqILgFZzDBa9PyxaesZr3nDVqK7bztlCV4SnpXommlvXN9VlXsBZHD+3YwS90U01ZaH65q0FZUnmIJno+pWbxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEE549A404
X-OriginatorOrg: intel.com

On 11/4/2026 2:33 PM, Vinod Koul wrote:
> On 04-11-26, 12:52, Pierre-Louis Bossart wrote:
>> On 11/4/26 10:14, Cezary Rojewski wrote:
>>> On 11/3/2026 6:20 PM, Pierre-Louis Bossart wrote:
>>>>
>>>>> Also, the existing code fetches the PDIs based on pre-defined "dai_id".
>>>>> That's not the case for the avs-driver.  It simply asks: "is any PDI
>>>>> free?" and assigns it for the substream if one is found.
>>>>> No predefining.  Again, this aligns with how HDAudio streaming is done.
>>>> Yeah but at the end of the day there's a 1:1 mapping between cpu_dai and
>>>> PDI, no?
>>>>
>>>> All PDIs are created equal, a dynamic mapping doesn't make things more
>>>> efficient. It just makes things more complex to debug since you don't
>>>> have a fixed mapping between dailinks/stream/cpu_dai/PDI.
>>>>
>>>> Put differently, couldn't the AVS driver work around that fixed mapping
>>>> to avoid changes to legacy platforms that have shipped many moons ago?
>>>
>>> Kind disagree on the debugging part.  Having SDW streaming follow
>>> closely to what is done for HDAudio from the beginning (no hardcodes)
>>> makes it easier for a developer to debug stuff.  OTOH if one of these
>>> two follows a completely different path, the developer has to have such
>>> hardcodes in mind when debugging the PCM code or even when looking at
>>> the topology.
>>>
>>> At the same time, I'm not going anywhere and I do intend to work with
>>> Peter and Kai to update the common code. Simply put, such a refactor
>>> would be routed through SOF GH first.
>> The machine driver selects the first available cpu_dai when creating a
>> dailink. It doesn't really add much value to add a second level of
>> freedom to select PDIs, since in practice it'll select the first as
>> well. PDIs have no moral equivalent in HDaudio, it's a Cadence-specific  IP.
>>
>> Also there is already a degree of freedom in the allocation of
>> stream_tag, which is used for DMA support. That one makes sense since
>> DMAs may be used for non-SoundWire things (HDMI, trace, probe, etc).
>>
>> That's 2 degrees of freedom on 3 levels, do you really need full
>> configurability?

I'm not following this "level of freedom" notion. What's part of this
set is a basic allocation - driver (a user of the soundwire-lib) comes
and ask for a free resource (PDI). If there is one, it gets assigned.
Very standard, how many expect resources are redistributed.

> I dont see any gain from this approach. I would reconsider and see if we
> can reuse things
> 

I'm not sure which way the last message goes.

However, I find it easier to move from hardcodes to the basic allocation
approach (seen here, in this very patchset) than the other way around.
The change would consist of updating intel_hw_params() so the PDI
allocation is no longer done there.
