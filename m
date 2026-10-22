Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792685752;
	b=uBilmqzWlQ/Iu/YSuGkkTYN10jKFa5d5PhO3+DjfdgrjHx+Z3g3yZsnY0ao6eLlmfvVz
	 qWhdbNj43yFbtilyIaFmwHTKqftcc8YAxy/QjbjxycOFet/REwUHoHa1Z/DN54Iom5X5Z
	 4DXdGWwcPzHBiC2JcjAVvDBc86aIaRPihkNc+fttbV3EonPoOfDZB2JAfMu7As20UTbxD
	 AvaAIWDAOV4XyzHi7z9j9tWHnSp58D7u5cjUCiR5jjfJGb/sF/wLX+r7ELpR+Q5bX+U7X
	 8DvsakeWeHdqAhc7lteFFQT2vnrpkkxGjdLy6+Xw7AsMBZ1Gl25PfvY16tgkU5OQqPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685752;
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
	bh=3jlzj7Pqvh42HDxu3Pvs/3zgl8BSkZMz+HlgcYp1yko=;
	b=ZS8HuFGXKGrEKaZ5QNwsWtoOJxWusR3Kbt0l7HAskZIo85PTeRLPYD2zu9MLL76CpO4X
	 7YvzSubhxWWQcaVTOMR+DC2D33phGJwpQiLp3axpv9mGghjxf40XJ8QZlLmcJdwR1ZYMX
	 rlicpvOONzoJ32AZ92WuivHwl2L14DHzIeaHa8OBxrSWC7imxvdowgUg8SQOx1iTqNChk
	 d2qV+IhR8QoRAWUyf9c3mhsGaAYMvaxdybtrV3P/ZWIYJcxTX0eZSAjqn2yH9HMM0dOED
	 FCHkAS0BVHI+e8cpL3jjrMAKua00wWUJt0KskqYl4kMHGq0dL6YfJKq0B5jSIgcZjBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lwgCz871;
	arc=fail smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC9606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92AC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lwgCz871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792685749; x=1824221749;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=O8zmsrtNFwIxf2JWNo1cIr9ua3UAFPsX9fhsJy/SGbM=;
  b=lwgCz871oP5PjM0vM/WCeRYNNTcCb039gZQ4Dco1L+KFTC1kLihBG4U3
   9DqLYCaDqNc71uwMUQ9i3K/R9MJRR7ruwIjIkgnxz0KGl4ELzgDv5WCix
   FVg+ST85DeAme3PLpcGQ81m9O6WzPGY0A6L8D8YCFB+XMX32u/kf4wMoy
   LOWJlVqZFc/HqAWQQrUHvU3AJhOTWtlgakCJzPQehVPtXHIMc92OrZwYc
   tiO5/L9ck+qRLiRCtF66s460Fo5ASTG7BcTD4Kv2o39U+ZfQ7oob6tp9v
   PWyg7xsq/V1iFOEonEdt9W9rDt0x5/uY0Ea4OzIS+HcxWw9Zj0uobjg5o
   Q==;
X-CSE-ConnectionGUID: zmhklrkrQFu0TuMVrJDzOQ==
X-CSE-MsgGUID: pKfS8QqGRmOrAyqRmKr8CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1341585"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1341585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:15:49 -0700
X-CSE-ConnectionGUID: MD0OoumPSduQLBiwXa9oRQ==
X-CSE-MsgGUID: PKApggx4Q3KGJMKMinyvDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3388386"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:15:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:15:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 09:15:48 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:15:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJGGkT8Ke7Dq1UOJQYzcTKnH4wuPv9diBxlsYa4GM76OFdWrfaSuYT6jZ5U7sPZ/tXb/yH7XiUolTdYgl44rRJAdmRRKX/bNPbACmQXGAOPPQaPUPpJQl9DTh6/9si1bDDmnjmUpwvTGYHZrJTeBy+mv9z5nxIbhAqATPSibNqRvNxif5DVurUqLw4GKMdBzB5Vb/ekFOoQc6WkrZX6kPFKWIbNPWhbpWHICz7ERlQE5mp8Msqt4833kbVeUi8ffCKQoj3aLFjwYsqp21gzlWbcaAJ5k6vrgf1w0vY5la/ioTvdC7ErwXcPMXc8pnTZIlqYC9fK+Y6KRy2Z1lenMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jlzj7Pqvh42HDxu3Pvs/3zgl8BSkZMz+HlgcYp1yko=;
 b=hKlgD7MrjaqN0sS1kGb3dQTkUXbQ0k+FZSgTDgTXHX7oKSDkpq29zLkxdIVvYXCVGY9y3FARSeSRzzk3xinQwYDZG6sYLr6q8drGfmj7cH7+tvEpc1b6R82N9CenTAnr7d1yyrMrlIL/ynubTfhmDC/YJC6Y52BWSbA3zGV48yiy1jY+OJSsx7mOA1f0VEVie2bYOJvgWBbq20MkszUEy/TgHJzx5/CRV9Guf8rdTbveAyM5sVTKyPZzIvuVYqAQFUt66GelvcN6GyYU/ftQDPBSkpgJ4G70cmRPvInDVpMfjFVHo7SZHFrknn9WfZnSWS+7DCsoacnT8rBFafsfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CY8PR11MB7797.namprd11.prod.outlook.com (2603:10b6:930:76::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15; Thu, 22 Oct 2026 16:15:40 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 16:15:39 +0000
Date: Fri, 23 Oct 2026 00:02:43 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Li kunyu <likunyu@open-hieco.net>
CC: <peterz@infradead.org>, <bsegall@google.com>, <dietmar.eggemann@arm.com>,
	<juri.lelli@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <mgorman@suse.de>, <mingo@redhat.com>,
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, <vschneid@redhat.com>,
	<tim.c.chen@intel.com>, <wujianyong@hygon.cn>
Subject: Re: [RFC PATCH 0/6] sched/fair: Introduce the SMT BUDDY ASSIST
 feature
Message-ID: <atozo8vLDlOB6Vau@chenyu-dev>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261022100821.981VXwAZyKKAsG00eaxoDO9kollDWxuTGq7ALzXMQDc@z>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261022100821.981VXwAZyKKAsG00eaxoDO9kollDWxuTGq7ALzXMQDc@z>
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CY8PR11MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f181335-2382-4491-c253-08df3057b691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|261021121427099003|56012099006|260925022911599003|260925021311599003|260925021911599003|4143699003|11063799006|261009223027099003|18002099003|10067099003|261021123027099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: kse66HJsaW02zXvLFfc7pAzKrcAM2FC6RuuFKlhG6SWuZdneGthNtL2tfYnliD2Ak97In4h+GbGDh+1VpNLxxthShmFQFnW9vchqM7D47/E/ljLBQmad1l7gwNEtpoQ3G1Nsl0TXOBazYHYBR7Uz5l0tB7iEgLDRrxjkacf6aaPY6dbdScaggRPWnc816XXgYx9FDIFNvHZJK7CBPXe93pLYjvBBVagnUHTT1O2RMPA0ALQCNfvFVs1JZtTUIGQlPqgiEhRwQKrGkPPF59XkUaLm1Mmew/o4w5SMrOlw/M7NzsDDmz3zfqGp0wJxlrhvv9N0j+ZlkoMoa1YSxm4sjOiJNJeFckpeiwyfXvnzIbDYyDNIkYx/J3tmJVeaApVYfmWQrHmvSHFlGiBpxX80xrP/6j2bnPHyX16PohzNHgQHP9u56Gp89Pjg86pO/oIOyj//cWQGszaqjtsiMNmkXBt+v7JE05QUwr2KKeN7x1Aa1VFYNjJGCd3XD0V0aDTIcELhOpEsIRxGfouK8X3SqGA0q8MXGVg3Hgd3xgV7aQBefyKySsRG/7clPrJkUUrjp1NcshB1XnQk0MlP3FxKj2aW6XxFPCYiaRlN0yTbeGfhlb85y3DO+DZmg3DKWPSt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(261021121427099003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(11063799006)(261009223027099003)(18002099003)(10067099003)(261021123027099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RZtTq5IbsJac4xHkcPZk91BLC4DlgGPAOK0npJSU3uY1T6TfOz3db7ktF9bR?=
 =?us-ascii?Q?pDcfMnvD41lv43kGQrPzmzggoVn9SNKVq5gKlExNv3zoLNcb1ZWs90RcNZ9/?=
 =?us-ascii?Q?TIIHAPSLQsXq+GkQ+2SeCcuNmtXTSuTIqEPebc+MOTTK0Ufz/UDPKUGGWLid?=
 =?us-ascii?Q?RTChVldno9AqEmVqBvh52md+RY0uDLrdOwfXVmokKEIo962dct5tDTox/7VF?=
 =?us-ascii?Q?3gadUhsT0tTbmk/JvY+QuhD2/FHZt4jJXpUc/Q9YQFqaccd+f6NDaDxyVtjt?=
 =?us-ascii?Q?1Wp8rB5I/ah2gTFm2ua8pZe0wXwi/EOuiZtj2EUIWEaxfpCxx9QmuadgWf+b?=
 =?us-ascii?Q?L7ltRzljZzoSJqdE5l0nWLR6nIiNSbl1n84r5HeXtnvy+W9xX/3oQPvcIPo/?=
 =?us-ascii?Q?7EDpdgBVnMoQU1B7ll3JP4A2eA5JH3AAg1EAUj6YdkkaGbl0jOJX+bPPtZf8?=
 =?us-ascii?Q?XFTnWmLg2QHnQ/v08ovdg4iJvQZWUAVqw95e5EMdtCNywMgObU70bF/cBRs+?=
 =?us-ascii?Q?YE791plVnb5jpHRgyK+ck/0q5gpVWnLHoFHa8MlJI3U1Gt0RHS7E0AwubC5V?=
 =?us-ascii?Q?SA+mYswpJM3ScVhYdp7rZOGF52O+xss8IeOW1wO0ISdtwROevEn2fbU2aw6x?=
 =?us-ascii?Q?flYGz7N1WTg1aa8QUST7buYXZBB/ojhRxfLHSBdCfFv9gD0TbRXtuTeJESOZ?=
 =?us-ascii?Q?1sdy/oekooUlM1O20Fm6mu9ITaFRhZXjEELox3VSTUXDwU4+Z5dJmbLcvK9g?=
 =?us-ascii?Q?JZS2mRXJ9WcTOaK2w+7eFdDBMb9ypmeYd7Y4yTLQL3f9vNn1zrdAF9gnrt/m?=
 =?us-ascii?Q?7AbQe4WMQpjJbJpggIDG0bIhGp5w+DrvGBHuclEkab11FIqLGOhbve5Xk4K0?=
 =?us-ascii?Q?0yZ+imRxCJZ/IksVIk5PwhcRlXQtAl5umY0sUo0N0n5ebppFu6pAHAdjfqOK?=
 =?us-ascii?Q?jKcfCaqNVzzuXeEDd+JvEoMgM0tkUtpRqy7faGy/157y2PrxGjWa9jJJg2aE?=
 =?us-ascii?Q?woTI6B4zLDXcp2a8ul1kZBOmXT64uSdCGKeTiQKTNt+1iJCiBcWpQGAnXnlr?=
 =?us-ascii?Q?0okz5VDFE+/FkdnVUHbkgTa3zURL9sXNPwm3u1KQ8BPFf6P+nrPxo7X0rGZ3?=
 =?us-ascii?Q?w7Cm2iRCLNwc8Hxj6kRR9RP4wYILfmzN+QJbOAwCSyHR9nuqdzqYy2kM9xOM?=
 =?us-ascii?Q?c/XO/vULYbDY2CApFOk8i0h3laPhEyuX8V0f42ynoccewzCuk04tv1Zz2fXS?=
 =?us-ascii?Q?uIX0Z4Wvrz4nER80ySY+VZjvZ64LPxFpGuOtKa0Y9bonMlrY+yYrBIQyR8yv?=
 =?us-ascii?Q?4+BCcpjptrxJSoZKu7ZGI/B08eykkV0YssMfqA4ckc2UGSJchf3ofRLzbGJC?=
 =?us-ascii?Q?lQz7ER8w26Io51x0cApE8/OyXkqNRp7NHEzzyCqjEucjJPJFyiu+9FqTgwFj?=
 =?us-ascii?Q?RRzhsz4VMbhTVRppmCxiiTP6dCCkPFExmxe9QtB8aROhup862sZ6VTcQsdC6?=
 =?us-ascii?Q?lEAXI4yJ5cepC7HvHirv9yUqpzY7dN+50XslmXQoi5Zykq4HQAryUAa0MnCh?=
 =?us-ascii?Q?ex9xmIAkz0TRYcdGpATHmpFoRFAqG8WAbuaMQIOTL6CMG860D8cIg2aO4yWv?=
 =?us-ascii?Q?K4RvKBx/rovBH2lYDYPpFr18MgoxJl3cxqhhT+eXfXcYR6bqXtgPH9e9smAD?=
 =?us-ascii?Q?ZufhLQ8t+DLvARGrcd3vUHF8shJuF22s+4RK8joOVDQQnXZ79mk+kQTXO0vk?=
 =?us-ascii?Q?aZXWSGSQLA=3D=3D?=
X-Exchange-RoutingPolicyChecked: pPzlmy4NZGgCPLoMQdIlWSk96exRC/ypXqqNMAG1HnWWJ8LhuBJZ31Q/o2yJjjmwOkSxaeDZMms4/A+GLYb36NUq/UnQlIHztzxxDJTdhVEyCZajGKYRuyWtww/vqSjtsO5ekUG9btNsalbFI/s4mCJPMS3ebgKo3xTBzft0ogscjkSPM310J4kS1LFv6rHLSKpjkjueP8f/ojN0TtOWqiM0sbubnV5UGTImSE/QSy4bIUiaCJMkb4PoXIulLNHPXNhYHNN6pMSrV5UUN9AvjeyrCG+aWwVURVY5AnecsKMhS2q/e4HYBH5tpIXaBBmT5tFuFwxirGFyWgsRLlN9HQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f181335-2382-4491-c253-08df3057b691
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 16:15:39.5038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjP+C2M4WOfOKKUuq+hpDY196Tb4I+uY/8vK+UHJbSCUjo0xUdRJbm36iRXwHSJ+FHjURD82vQercn9JYZW4qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7797
X-OriginatorOrg: intel.com

Hi Kunyu,

On Thu, Oct 22, 2026 at 06:08:21PM +0800, Li kunyu wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> On Thu, Oct 22, 2026 at 03:40:44PM +0800, Peter Zijlstra wrote:
> > On Tue, Oct 20, 2026 at 04:37:40PM +0800, Li kunyu wrote:
> > > [Problem]
> > > 
> > > It was found that on servers equipped with the Hygon 7447v CPU (Model 7,
> > > 384 logical cores), migrating tasks across LLC scheduling domains during
> > > load balancing caused significant performance degradation:
> > > 
> > > 1. A low L3 cache hitting rate (due to factors such as non-shared L3
> > > caches).
> > > 
> > > 2. The traversal overhead of higher-level scheduling domains (e.g.,
> > > cross-NUMA scheduling domains).
> > > 
> > > Similar issues were also observed on CPUs from other vendors during
> > > testing, though the degree of memory bandwidth increase and other
> > > latency effects varied. Consequently, a series of patches was developed
> > > to address and improve these issues.
> > > 
> > > 
> > > [Solution]
> > > 
> > > This RFC patch series introduces the SMT_BUDDY_ASSIST scheduling
> > > feature. The main work is as follows:
> > > 
> > > 1. Push CFS tasks to SMT sibling CPUs during periodic load balancing.
> > > 
> > > 2. Skip SMT-domain balancing after a successful push and avoid pulling
> > > the pushed task back.
> > > 
> > > 3. Restrict newidle balancing so it does not pull from higher-level
> > > scheduling domains.
> > > 
> > > 4. Compensate for the resulting load imbalance with a burst-task wakeup
> > > path that sends tasks to idle CPUs.
> > 
> > So you're combatting undue LLC migrations with brute force :-( Mostly
> > this looks like something where cache aware scheduling should help, no?
> > That ought to make cross-LLC migrations less attractive.
> > 
> > Now, I realize that cache-aware scheduling as is won't help stream; when
> > build using OpenMP the whole thing is one big process and cache-aware
> > mostly gives up, when build using MPI its a ton of single threads and
> > cache-aware will ignore them.
> > 
> > Still, I think you really should look that way, perhaps investigate if
> > something like:
> > 
> >   https://patch.msgid.link/cover.1787955777.git.tim.c.chen%40linux.intel.com
> > 
> > can help you.
> 
> Thank you for your suggestion. I looked at this patch series and think
> the way it exposes the interface to users ("always" | "advise" |
> "never") is quite good. We will add the related interfaces in a subsequent
> version.
> 
>

If I understand correctly, the goal of your patch set is to inhibit cross-node
task migration so as to keep memory locality.

Patch 4 is the main one, which forbids the newly-idle cross-node balancing. As
a result of Patch 4, more tasks end up on a single node, so the kernel needs to
spread them within that node more aggressively, this is why Patches 1, 2, 3 and
5 were introduced.

Before digging further into the design, I think one question needs to be clarified:
In the scenario you are trying to optimize, do the workload's threads share data
with each other?

1. If the threads share data with each other, then leveraging cache-aware scheduling
   with prctl to put them together in the same LLC/node might be a good choice.
   Furthermore, there is a proposal [1] to enhance prctl to allow the user to specify
   how aggressively the threads should be aggregated, which would work in the "stream"
   case.

2. If the threads do not share data with each other and have a high memory footprint,
   then leaving them where their memory resides would be a good choice. This is what
   NUMA balancing tries to achieve, and it is possible that threads of the same process
   are spread on different nodes.

From the [Problem] section in the cover letter, it seems you are trying to address case 2?
If this is the case, why doesn't NUMA balancing help to inhibit the cross-node task migration?
Or is it because NUMA balancing is disabled on your platform?

Besides, there is a patch set to extend cache-aware scheduling to cover multiple
preferred LLCs and nodes [2], so as to mitigate cross-LLC/cross-node latency as much as
possible, not sure whether this work addresses the issue you mentioned.

[1] https://lore.kernel.org/lkml/tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com/
[2] https://lore.kernel.org/lkml/20260827122816.756234-1-wujianyong@hygon.cn/

thanks,
Chenyu

> > I'm not sure why you're doing the SMT push thing; but there's this
> > thing:
> > 
> >   https://patch.msgid.link/20261002154415.2270586-8-vincent.guittot%40linaro.org
> 
> I previously looked at the relevant patches, and my implementation
> approach was slightly different. Here, I mainly focused on quickly
> distributing tasks to the SMT sibling CPUs; during this load-balancing
> cycle I could still pull tasks, achieving faster CPU load balancing
> (mainly for rapid local task dispersal, and it does not substantially
>  conflict with the approach in that patch). In subsequent patches, I
> also made new considerations: checking the cfs.h_nr_runnable count and
> no longer focusing on sleeping tasks.
> 
> Task pushing at the SMT level is part of the overall functionality.
> Combined with the changes in select_task_rq_fair(), it achieves rapid
> overall task dispersal.
> 
> Combined with the aforementioned user interface, this makes it easy to
> enable or disable SMT-level task pushing.
> 
> 
> thinks,
> kunyu
