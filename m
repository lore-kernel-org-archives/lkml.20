Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC11409E12
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383762; cv=fail; b=dEPrpXDkQ6HCpSrckUbpmmuOT2EcRXdi5iBLOizva9RfX9+aoUV27qBf3SrzWIDesIdEzH6tAqtL/0vRmn3g2i8ZOdBwtzNT6yMRWhIVS19Ka4vXDMEdVty4OUoNGXBu8yaqjmkuyeLRNazIuBCeQ/W05xuf7FE1OLzhvKp87u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383762; c=relaxed/simple;
	bh=JYqzQ3C4NXMtIzkdEtH6mNrKPO5kA7125X0g6GzGo0A=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZeZn12/0G78fOt73TKS02qwInIraKRvn/0Gw8WVY0yaQ7fLhNYED/4KUR4BjPCfuprmMZIdNuXy/jOZgvfKNhuqSjqqhPLYnvJZ4HeI755gEzE62arrPLRztdORMEniOa6x8kmeGkfcYNByaIv2zTA0RoPUI9WnY4/K+KsTe8LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMrkw4Fk; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMrkw4Fk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788383756; x=1819919756;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JYqzQ3C4NXMtIzkdEtH6mNrKPO5kA7125X0g6GzGo0A=;
  b=aMrkw4Fk/k94B2xAljC6tB1aFjHdy1Ol7pwbWjuwd59tkVARr4QFXFAT
   mxTKJ0MaOcLqKle0k4AehIfHRjnsC+HOKvuXTeltt1l6YKInLBHtqFySi
   +oTAun7J3XaZRFi6m0/1CaJrCrEgmAIonzDTxWCS0biuF+S/gpePvojIJ
   /iUIgi2nT93DYbv5+d1DHZZUpNqNbfHWZGaFJ/Jp/6dK3umzZa2YHtX4B
   9IRHQKwwNpaTx7I9LE4htNUS+guKYPmqGEYujpz/SqOYs66EkMm7kzDJN
   sxUmy55+1678sSWdTXIN7mJWz0ENzISyrFc+g0kyj9AKFg+ogRUvdhRMw
   w==;
X-CSE-ConnectionGUID: e/b4stFyQoqD9+ohz3+8uA==
X-CSE-MsgGUID: 9FbCuDgDRcmE6tjjZ4NhzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88703320"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88703320"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:15:53 -0700
X-CSE-ConnectionGUID: 10DGuINhR5y1IDDqGSlaTQ==
X-CSE-MsgGUID: OymUDReoSU6BJrpJhcWihw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="271484802"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:15:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:15:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 14:15:52 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2uPVDhgAIivoVlB5wWK2BmMo2Is9JqqXgofPFv1w1fBDDxI0YnX+xSXVO05JT8DL9Op9HDRlUM38m4j0Cx2rQ5RXVS8WXJ8q7laV+4xoKraPVQQ7nWNvMDOBDdmxctVRKksEBigto5ITn/2ZlGrRfxk9KO6eD3oXwzvhFHJmDVCcPBLnSL2jS5MM2SiQBDXzCjyvN+/0ioKy291NoHmH1UMZ27XDH9YDK5eyrCC/QJKfdQF8sz5z8+scdRJyMl2RJWA3uuTDoJlI4rmYQvLPErXjlJ/HrLfNhLHJBGEp6UxRebdYqkBlosQPT2a0+Y+fgYF/0uA5GwMgaa14LzShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iMrtkOWOq5228oOGkasUOSiFBh5kAp+a0QOvw20fP0=;
 b=XHPO++20JVqxeIfblc5/b94c0IAEJyqi3+9G0Tq8AfE5+lMopOxznNOITw4LmsiGPfzbj/ZSTdGqilP3qbXvJpmeYWwdPxN9rIPrqucp3xUPsIAG/83kHMvviqNMd3aUTUPGrvlSUkpa2aEwHfr3/0Tpf0GQaaLGLhTSgv+gKMSkQqrG98p1qvp+3Clw/tkahLUGHUl+uODMsCdBj7nLI3aCC7dlUQcS37xvsurH255VbuFsi0R5bo4zmI6bH8mpAKea7wixcH1zL7hX0EFPMA9jwkmBQP4oHECWySaacJVV1PPaxm4Epf9UKB/HqVeMeYwbnN3+nRwZMYchLlT27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 21:15:47 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 21:15:47 +0000
Message-ID: <8fcc533a-ab78-4221-82d9-b09cbc13f221@intel.com>
Date: Wed, 2 Sep 2026 14:15:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] x86/fpu: Fix potential underflow in
 xstate_calculate_size()
To: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <criu@lists.linux.dev>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Alexander Mikhalitsyn
	<alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260817042048.1579415-1-avagin@google.com>
 <20260817042048.1579415-7-avagin@google.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260817042048.1579415-7-avagin@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::20) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 940574e8-1c1a-49c7-91d9-08df09375b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|23010399003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vmhHaVZDpGnazl3Zmme+gcgfHt8aoovtS6r/vROK4oen84qMk+P49LjdiAFycJgkSjzhlemlgLJhYwY2fPpeta9ciJPZ/5STgOA2qbhdc/mRGqn9XyQZFVJLLAoRhSP0OrMDEkwNye4wVE02oRMMB+SeezD9BBgpjwqUIxiFFH9km7KEdOQzRUXl+JBt34+n3X9Lo8phZSdnwXk8Io5vlFzqbz5UF3/6yy5iyMUyh7nSJkbbo95A+tQmLeqoX6wkxRcdoJOnP8CY+0M3rYg75+ZdXxSJycnSi0ZAzoVZPUKGuUFf4vCNkgLI5FkIg0+nPPvUxkT8on/rW7I8VdEAYtwVUUoVjTMmF0N+ySkAoGsKIqwE1+CwXRlvMZ/HQym98ddUyyLGfZlvmbCx/ScimirhxZPdntgg06uR986r8S44J6rqfIJzIPAU6xinQsDyxlznMiszp1tQPv6Y5Ur73Iw6oYwb2waaMhjr/fE2V5hq3bEnIkC18p1ushVQbkzq8LIYidL9ixUPnCGxvvCof+f2zSyuCRbT27dGJvtiwxoDiBSRgxMtHiy8/gL7hJAhQ0Z5D014TpX2AWjhoQ5IVlfWUe7qRqyHarb4Ua4RH+/7oKhAV+SqmwJ4WFQ3BQt4cZplQr19iMYEZmfND0gR/AneDg0R4ugKaNsx4VvtAyQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmpLRkZUZWx2VzI0RDVBV2xUYVk1Um1Qdk9jRjFBeVljNkg5UFJ0MDI2TW96?=
 =?utf-8?B?dU1EQkVBYXVkdTRzUjJVaFlYOFZLRzk3SWU0S1owbklZTlJZNGYvc0FhR3Rv?=
 =?utf-8?B?Q1QyeEJ4VGcrcHRxMVRrTmpwbENYRnRoM1haK2tsWEY2SDgxOE5ORys5MUJC?=
 =?utf-8?B?cFZ3QStXNkVnbnpzV2lVRXRYanZqUU4wNytGd0IxZER5Tzl5bTJhb1hKaHlp?=
 =?utf-8?B?UkdrYVlOWnpxcGlFYWZ6MTlkWGdkNXVrdFN3cTNHWkNGTTVHTkZNTkxDdVBv?=
 =?utf-8?B?TXZ1ekExVEtpdkI0eWt6SVJQTkJEMHRWakp2eE8yYWdvUmkyQ1J1amZDc2ZD?=
 =?utf-8?B?RzJjZXhiRkNYYkdicVBUeHlxTmRzblM2VGduRnYydkFnR1c0RFo3WU9MNWlm?=
 =?utf-8?B?L2xKSGZTOUNtWmdxcWdyTmduaEcrUkY0SnU4d2ZhV1VMdzN0T3pXZHdzUmxS?=
 =?utf-8?B?bjdNUTlnU1R3NUtZby9ZNWpzRlpiQzJ3U2EvQlFkVldSOW5EMzBPRytvbEpv?=
 =?utf-8?B?enEzUDdWVzYrNDd3YzVTTHYxei90N3ZkTHBxR1ZFbEpYVkoyRXJGczRWNUx6?=
 =?utf-8?B?TklQdllHb2ljc3dadEtrbnRSakYrNDU1TUJRcFB1NDZ3citHNGxTZ0ZJc3g2?=
 =?utf-8?B?TGFteFI3d01hRHBjK0NLNXBqdnJ1QnBhSGlka0ZyTVQrMDl3TityMStVUjJn?=
 =?utf-8?B?Zm40QVlnNnMvZVhLQWdCbHhmdmdDNzNuVERvYzV0M0QzN3JiZG40ZWJ0R25k?=
 =?utf-8?B?Y1EzdjBkMFFDbC9SaVdDUjl4eUFUeGh5dS8zcmVrRkZRUDRMZEtDdnpURVI2?=
 =?utf-8?B?NExLQW8yc3RqRU15ODM3Y1JjS2lyS29vTndJb1ZYNHlaSGsvK1J0dm02ajUy?=
 =?utf-8?B?Uzc2TkpHZ0hBcjlnK3h2ZGNiZnFnRnZsNEE3NTE5Yy9NQmI3MXY4b25vYVZG?=
 =?utf-8?B?eUhRQWZLVzI5cndDanRmRVJKNDdFeFBYS1hra0RXNlQwUXU0QUVxdGJCeGhM?=
 =?utf-8?B?Z21JNmdwUjZSSVRJS1YwQ1J2V0EwanlxVldvZmxYT1RQSmVwNHdDR3dVMW83?=
 =?utf-8?B?ODlsM1JTVFNpcUc2akVlWDNNQk1RNXVDVVNuK0JzMjRmUUc4K1V1OXhITGMv?=
 =?utf-8?B?eWN1NDZQUVN4MlV3bVcrR2RVUEdNY1R2MGlzTTh2bVV0cG16TnJVZXN1VVhj?=
 =?utf-8?B?UmE1Ky9WRE8rblZlVGtmaWFlalhLM2tzV3dvMkVUbFQwSFdHZDlRdGJFZWJF?=
 =?utf-8?B?Y3hISHhmY1YrUVN5UEI2Rm0yTzBmOURZZnJ0a2d3OG1ZR0VuVDk1cFI1bXhE?=
 =?utf-8?B?WGh2aitBeEtxY1k1dThVMDd3NGV2NmxocUc2U0E3SkRJMkp5dk9HMHZJUTlG?=
 =?utf-8?B?TUR6S0FNNE0vMDBmdThNTDBHS09TcXlQK0p5R3IySWgrYjhrNXNmMjRGQy84?=
 =?utf-8?B?RzFyU3BBMnRVVE5BcjdHazQ5SDE1UG01V29rQ3E1YVVCakgrdGxLMkxOODh4?=
 =?utf-8?B?UUkydTJTNDNsNVl3aVRBeVQzdVN4SEw4NEFEdllOaWZHM2xvajg1VWR4U3Nu?=
 =?utf-8?B?elh1V3RrcHhkRC9lR1F5WjBGS1BDS1V1RGowYldVY1ZZV2FZM1ducjdWZ2hz?=
 =?utf-8?B?RlRYSEUvQklYQWp4cE5vYW1Wb1MzeXNCT25jZ3pWaFlzU0l6SDdJRmhORUxO?=
 =?utf-8?B?TzJhN0JMa1drN3dZcms4Q1k3Zm9uZDFsN2ZGYTZCZnNvUUs0K1ZYMkxMOC9Y?=
 =?utf-8?B?U0RZQkViYmRTM3BHUjJHY2pVYVdzZjB6cWIyMkxVYlFVODZwR0xMTUlxVnUy?=
 =?utf-8?B?d2NOVEkxNWdDeEZXa1U4a0NzdE9XeTVWUlh2bGY4TnFJZlVmMzRrQVZqdVVT?=
 =?utf-8?B?TUtqL255WnFsZExLZXU1OUlBRC9PalgvenF6Yy9uaFhYbHhLQWU1eDFUMUFj?=
 =?utf-8?B?RkpibDJQd0t1VDJuTFJjYjRZMlRYUkU2YmZ3a2J6LzZSRmNiVEV5cEhrSnVG?=
 =?utf-8?B?cjRHVUNVbjVZRE84b2oxVjhiVFZXb2EzZmU3US9QaW9HQmYxajhBOGxCYzVI?=
 =?utf-8?B?dnZiUk8yUlRieVdPaVJRdC9NRlZIdE9leExhTDdzWVJpdzJONnR5dmNTbElP?=
 =?utf-8?B?ZDJ1eU40ZDd1bnZvWFp6bDFPQmFmOWNUSTE0UjY1Y3F5WXhEdWs2cnhmWWFX?=
 =?utf-8?B?NjdkRVpGY0VBMjRhVHdDendYRm94aFRqbURhbXFQcjBHdTVOc2trb3MyNU44?=
 =?utf-8?B?Z0NVU05BTGxLTDBYaGJXakQvMjNyc1RFblp4YkdTbld0L093N1NBQ0NzV2Zi?=
 =?utf-8?B?REVJbkcrdU9rOUxrT0xGN1pscTAvZEhXNHQ1cjBLdk5kVUE2SUxWZz09?=
X-Exchange-RoutingPolicyChecked: km3KMeV7ha5TzBVf8zvQd5Er24nEe4fxWFbWsoVj8oR3F7jcxuP8HdMvFhIIFQhqcLnyBimTefjaOf5hL13sXl5I70LUt+SIIdZN5Ky93dTse8gwe4hqsfflbkwHBhBrGxl5ViVgUdRwa27pnB7Zdl6j3VhAdqrb0kZRRnuiWM0GuaakOqJotXhY7/gj8/nhTJZ+xk0eLxkIwL0VgARNQeoqfGl93hLdEXwk6SLr9GxlZBUXhqSwNZnJ5q+sdlGkfRDZyt1ej4VsafzuCHJpLS4voGxTDY2KFU/UzJaqSuXkQGgP1Xcj+Gs53GYIFooRuZSGzBpgeSFCZC608F8zlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 940574e8-1c1a-49c7-91d9-08df09375b85
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:15:47.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGgNMg7klplpt3pnhS8UqnK2BmkRRteksTvPKTmvia9/zxwABM76WTZBd4pFm/MGU1EwHp4PPyhk814/Dl9/+ZoPlQumYhY4tWE42QvjpgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
X-OriginatorOrg: intel.com

On 8/16/2026 9:20 PM, Andrei Vagin wrote:
> xstate_calculate_size() calculates the size required for a given set of
> xfeatures. It determines the topmost feature by finding the most
> significant bit in xfeatures using fls64(xfeatures) - 1.
> 
> If xfeatures is 0, fls64(0) returns 0, and topmost becomes -1.
> Previously, topmost was unsigned int, so -1 underflowed to UINT_MAX.
> This caused the subsequent check `topmost <= XFEATURE_SSE` to fail, and
> the code proceeded to access xstate arrays using topmost (UINT_MAX) as
> an index, leading to an out-of-bounds access.
> 
> Fix this by checking if xfeatures only contains legacy features (FP/SSE)
> or is empty (xfeatures <= XFEATURE_MASK_FPSSE) before calculating
> topmost.
I think this fix makes sense before applying it to something that 
user-space provides via the sigframe:

   Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>

Thanks,
Chang
