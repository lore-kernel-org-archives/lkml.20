Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793373507;
	b=qsRamznQWQRrHZCofmAqifv+nKx8kd3u5PV6GEMy1TtAn6/BsoAvL2aJqy/tCdQz1ya/
	 HhAPFeBK3bCHT/GXmhVH1xBa+iB/tcbB8OjcQjE9/32ViiQ7w0CdVtPQtp5WKm75CFadY
	 CZicpi79mYvPxxt6ftD8Ib66zgrrML/9TIG61+HY8Ea5PXLwKJAZEy3iBI0wIb5UVmBg7
	 rL0LtNwxG0QSloOnZHTp9rice3kfBkm8f7zHm8rQ0g/+G6zi9S2uHxqZo8YV7VZfi+Zu0
	 c6wNK2ugt0CwRE7OVh9BDabgi9sZg2kjOCIJz2U0zewtZcWKPu3bJRrs0QlOmwPshuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373507;
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
	bh=SqEw1up7P2j0xyP7uMmVpjeNv6BRItzMAxqeV2h+wL8=;
	b=wApGScQFl8xt6+CW382eP45HxKi6h7MiUl42XjQKcmbgUdFkawQUyncnQNg+7XoLgr7C
	 PGKgOQcjUQjQW9XjIUOZXWKep5Q00iCmWtAfBP1WHqLIll0pPmKc17tiRw0+bwNhG/3w0
	 XaSqG3nuTOqIY4fWAOUiQYKwDOTQHt40YDUROTRiSC3rPgoPBOPUsQqfXmwLHVbXDrr8F
	 wKYwkcPAwBn5baX/3YbTOIWlEEBY+SfczW67YX1qapmZwOAnh8psVEc4wTRqEsnLKKzUr
	 1yYNgIXqXGzGGpfXvLtWKzuQxmpSGcYOoBVEV6MDil/bcvm6TSo7obPOuLcgwBShlOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gSXwZkhA;
	arc=fail smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81EA606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81EA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gSXwZkhA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793373504; x=1824909504;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nlY+ybFAD10sLpgXz4xtzuh4lV+Xzpu38sWLe6slMcA=;
  b=gSXwZkhAAjpsTvtHF5d8p5wmmmzRPepL5MSEsuu+YnI0ZQyRXUXBastN
   sk2Lmo+UQmAx2BNnj0TxjJhonD4oxmavDL/cAAEmxet7wIPk0gwFO5pPd
   n6Ih/SLo4Z+Hu3Ow8b36WnUPkKWOYsu61DuEK1nqAVX0Lq48nAcsoktGF
   GJDd+q20CO/eG8dqmbHksQIWRbFIFlCSYFko2PnjiwM2BesLIbZU1+VWU
   k2/RlfYwYMZo5ejQd21xjw/erR6D8KYbUQWS0XZoqLKdfoHPwYHRsJrSB
   AbU4qO2fZtphRBk2ce1GvTMkh9hTiscgrV2Q3aMOZpkfRauK1Sp2CfIV9
   g==;
X-CSE-ConnectionGUID: ZeV09HdWSQC9LjfAetiJmg==
X-CSE-MsgGUID: I5iwWtZdQ/yO0xitfMIA9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2154607"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2154607"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 08:18:24 -0700
X-CSE-ConnectionGUID: sAlUIGwOSOO/suP8cV7Y2A==
X-CSE-MsgGUID: i/ON2k8sRHu7jc4gCxSNOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5426786"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 08:18:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 08:18:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 08:18:21 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 08:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6v4WyHQH3Qn7HoN6y8tqnPGC/Xcixf3fn8E7Fv9oob6N8CB+T6VwG/BIHK4SGiMaXZehd6Fh+vCQ0tRgp7VhofjF7ooqVGTcKaF2LHHcIOTnYI8Hhy/g0v77fiFsOPZQ7Awon81guMH2AQyIPx/BWgPtVJzpxIhmwnBtaO3fkWRVWfpaFUthWlYiVV4fvzxFmS7bBGawEAcfGkOxdTgd1ot0wixFpEjwNyh/3Dv1RwvxDuTa/FCor0zk3gwCrfg0wE8jUQmpxl7a6g5TksrsnmDcMK2rqHBWXxOOXWxmk2kje1kIZE7OI7twuzx3EsRn7y1nQW5cCTMZQcTrVSxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqEw1up7P2j0xyP7uMmVpjeNv6BRItzMAxqeV2h+wL8=;
 b=rnSj0T/s8HCW7WoAM2c3VTWkCOEsKGLYgQw33XW6AiB9fLvF+9z92ARWuP4Q+RsP5Fu0yxqifdCHGxJp91mteFoTIDQZa52yWeAdea3NJ7SWDXVQoNJTXy5ORaRf3PZBNVzB+zOXERO5vS6z7Wn2ssLQ62ZZdtC7/mmbUNT3zG3s4ZSJ5mM1hCNzK8pN/+YJTB+BitP1h8NpdbghyxGUU+U30YidHGTfSiwAywhIzWYHZV56zFgueU30Gr/CC+agw6Pv62acbDXZE0lXzYg75K3hR25uGHPFJP6xVCCFGbuIOrNpl84xt4xpE4oQae+o8SRasnVlFe7pWDBg7+HO/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Fri, 30 Oct 2026 15:17:15 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 15:17:15 +0000
Date: Fri, 30 Oct 2026 23:04:23 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, <tim.c.chen@linux.intel.com>,
	<kayracizmeci@gmail.com>, <kprateek.nayak@amd.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] sched/cache: Check reduced capacity before
 alb_break_llc()
Message-ID: <auSx92BuZKD4OyrO@chenyu-dev>
References: <auMBWAGx04w5h80o@chenyu-dev>
 <20261029085530.4054159-1-zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261029085530.4054159-1-zhanxusheng1024@gmail.com>
X-ClientProxiedBy: SI2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:194::20) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: a1367d52-4d65-4892-7130-08df3698e132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|261021121427099003|261022105027099003|261009223027099003|261022075727099003|56012099006|261026121527099003|10067099003|6133799003|3023799007|18002099003|22082099003|4143699003|11063799006|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: ed7kSe5FcdPSTbgti9DiNp0zvpRV3LOQFkvbiF8NFZhMsYGco99zgEkB151pdpHK0+NK5Hm80ybRIMBLZ5LsfZ10RlzM8ffmS9YyhPGEuz5e4lx9kP6Lt3MTdyuChgtqeiJDExfOvB13Hu18EfAKI3zmp86HoKmN7YNerALOsGp5CZgMQppCLQCps+iaHpzl40TDq7RJP86E2dBnRdI7K0oxqAr+79v8K5YPXxtVseVGc+UQUOkn0xcv/BPNDqsUvTEgBkgjcemuNlMDIDcJGoXcU7XzFGp/dl/DdO3erDLneZlOreW3dHscgkOCreyNYPzqIFP6tJ0aZy/msP/TwHKn6odVoAXAl+HZikPzxqchl0VNE5kN0B8B1QC4ePwAmATHqbE2ujdLaEEwc5stSh7LyGyHuCRB2Bvx/t2TQ1mjNudNyuCwKLrrLlS7XlnKHNcqaVMDB0prG6/kLlPRtelslfhpsvm9M6FIGNvwSXWFUUb+Y2HVakm2zfpiERkU8gwI3u50xjz3kcFYZUGp4LWntmxL1DATOpbNIHt6unk7KkndkmlzpK8NNN6Q65lAbfQFjU6xeUJUgbSzkKjHikOSymHAqLEmXLSCHsdeo+JnAHD6ty9XwaAr4whV62cKIwyj2a0QwpnD+lseafg2rp7pI2gYglNWLYKOqqp2HZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(261021121427099003)(261022105027099003)(261009223027099003)(261022075727099003)(56012099006)(261026121527099003)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lkfMhr3Xr9idV9SwBXjOii7Z7KXFKt1IMDQw8meN4vaDaRBb3sJCTe5grTBj?=
 =?us-ascii?Q?5NR1ekM4JR55JzVelpx0/yg7Q7n1Z7IH9QYn5iPs9dQ7ppwz4+dG5/9D3k0r?=
 =?us-ascii?Q?B4RRy6chjrI/VqqSJjf5q8CdSbREpZtBAmBfxh7VQac5bFt2YTV0SvFiYys/?=
 =?us-ascii?Q?nKzGR5GhgTTwKUGZcx4K10UTMn7kpEUvUMlmD6lPNesxj5bO/H8w6CtFU/sf?=
 =?us-ascii?Q?TatJKVbgqdbZKjJ3q2Z+Y4hVALEmtcVSZhFuNiuciyxEraTPs+44JCXBJ9a0?=
 =?us-ascii?Q?ai/S4z0DCa5g6gmLN5Jg+aNjcJxuK3cgv19NLNU9EvdTcC54ti4/AxesaWhA?=
 =?us-ascii?Q?7NoyGO00zx0FBjddhEcrRVAWeieVih1qXjkExMCSspBDXienCym23lTflf4O?=
 =?us-ascii?Q?kNFR/eGL9bkj7hO2B6JFr4uh+6GgZ7A/6V6G788j8ee2We7N4dSS8pXrS0Ie?=
 =?us-ascii?Q?vG1yCYq83auTIGhtBkYdCdiUwSVbz3g8nG7GeHyI1aQqMIo+pTib0Pp2mPHB?=
 =?us-ascii?Q?6dduv/Zs3gez/qgRyGHQlNllgP8VJiJ1J10n7e7edOK1mOrXsrK+yZ+J4kHm?=
 =?us-ascii?Q?9E+JVNpW72zlOop8QRszZZZCEf9jKASQVi5URxGpTYLntz38YGkJT7Iex1Cq?=
 =?us-ascii?Q?5htEHK8Ye6xVMR6TaOJLJ0i0VNVDPPW8p+HqAXWGt19NOULX+CrynAbdYfMf?=
 =?us-ascii?Q?+YWJlp2+qXr69Cjj1J4nBXC/OgbU6Glmwx+A7xOoeMLi6WKkkIvTyTZkmtbE?=
 =?us-ascii?Q?M5OBGeb+Ld8ueROcKYdx8hXqikQa+2QEIu1NDqHXjZdboOxeo3/xHinOn9fQ?=
 =?us-ascii?Q?yTwe4rGtMJMJ68ZNJzi1tAJK/KDn8EdM7UgBKaAeUB7yNZ6sgb9MqbGmY/ka?=
 =?us-ascii?Q?OJw0/5WXb6fKDrJ+xrSSWbIonvcj+DYjgrvfydYP3+xB+0HVbTY2nSnmcCXP?=
 =?us-ascii?Q?7jO07sug/y5t3go75TVuOJ/JRKKkjETNohn+GV2jcERolUHtLWVidkp7IUgk?=
 =?us-ascii?Q?ckIIP3L3KhxMUNMacV+F4v8MnAGmLtsmhk6iIHu6f6xKOWB5+M3M44MPqXEN?=
 =?us-ascii?Q?Tj28bJgdqb2zixnMeW1piwzA+HFzu+1Zpnc/tac2RS1+4BJWtlm7jEdskj9g?=
 =?us-ascii?Q?F/Wgx3/S+HKxJvQwu5r4CdXjNVPibJg11rswtrAOQgxBae0UH+7xemimGgO2?=
 =?us-ascii?Q?IGVK5J3ybkeFc6ypoziIb/7yOkRCKsWmQZplvi6vGZGb2B74uEXiHVPbifFV?=
 =?us-ascii?Q?RNX4ciY60aT3oT7Xpbs9SgZM8jqEb+YnEUV8qztlRIPtOiqyhBy1ndfrA1dZ?=
 =?us-ascii?Q?EZXCBnubVL424rhaWmOoUyorI2srvQlQ4jopmYLehZadQ2/zDXGMW44E4RgW?=
 =?us-ascii?Q?Kdgu5WjV+veuQ4m4opwMrFAh9Bqi/C9UqQNVA5T1u9CPIVuwzrarEx2TZYb4?=
 =?us-ascii?Q?IdxlT7kv1aNZjX00Sfph9EKLU4rpxlcoK1DvqpKKAAtUReH7gQT8ITX38LX8?=
 =?us-ascii?Q?llCE8TgEWlDmzXnEbnjxZ57YCSrkOeywiuAvl9JMB7k2NtSakgoBCFDMort1?=
 =?us-ascii?Q?tW5RmJh4q5sEhGa07DM5M+lONCr/0gXY2OfUIg9PA4mmArmAyCPAFwgi5kDn?=
 =?us-ascii?Q?Vex1WkGJ0OG9GahrC97evxKETs2rMuBSt0QowQmkl1eIjez/Hx/yadmeIcXC?=
 =?us-ascii?Q?P4K8lOWOx88K58PVLtq2ShyCqbGVMQBBLPAh97WwTXb8D5i0gicrhKZvnZ0D?=
 =?us-ascii?Q?NQUyRK1jvg=3D=3D?=
X-Exchange-RoutingPolicyChecked: k9/bHzQ7Y88BgJbGH3gwgIZRIQg6AvclDcpR5IOByrtsmgjhoFIPWoQpbisqB8nvhEB8O7svxNV+iR+DXQRABHIozN7azzNN4ThI2dWw6iy2BFz668QeP6cuL0daHzTG9OTHU7TWLO1563N2t7IxM0Ld0n7h1BpFmJ2OKERxg4pbpeZctNaC8BMVYXvoIdfLvXMn1MehzcczMGw6AIS3z2kEK3jndOA+syfr3ubHLTNLZOWb33dmOwXGFSw+2IBb6fRPHUdZhohf5S1xncO5vmo0uL6+MSIfPYYOXnGFJCHy3fZ2M38QbQZVp1BARYIRFcndBwzcDzM5qnsnG0+hFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a1367d52-4d65-4892-7130-08df3698e132
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:17:15.3503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UD2EPqHM00YJygNlch9L12XAAZNAgCALtBl1CEDeBhTNeW+aaEB1sqtFaZTCAJoktO/fjClY4kQVicGunFosxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
X-OriginatorOrg: intel.com

On Thu, Oct 29, 2026 at 04:55:29PM +0800, Zhan Xusheng wrote:
> Hi Chenyu,
> 
> On Thu, Oct 29, 2026 at 04:18:32PM +0800, Chen Yu wrote:
> > Moving the capacity check earlier seems to completely ignore the
> > task's LLC preference. It seems to be a trade-off between choosing
> > CPU capacity and cache re-population on a remote LLC, and cross-LLC
> > access latency due to cross-LLC migration. I don't know which one has
> > more impact, it looks to be workload-specific. May I know which
> > benchmark/platform you used to find this issue? I'd like to launch
> > hackbench/tbench/schbenh/netperf(or yours) to evaluate the impact.
> 
> No benchmark, I found it reading the code and reproduced it in QEMU
> with -smp 4,sockets=2,cores=2 and IRQ_TIME_ACCOUNTING.  A module spends
> 600us of every 1ms in an hrtimer handler on CPU0, CPU1 runs a pinned
> busy loop, and the test process has one busy thread and one thread that
> only sleeps (cache aware scheduling skips single-threaded processes).
> It starts pinned to CPU0 and is then allowed on all CPUs.  I can send
> the module and the program.
> 
> The LLC preference is only overridden when the capacity check fires,
> which is the same condition as your reduced_cap_alb().
> 
> > May I know if the issue is because of the
> > if (env->src_rq->nr_running <= 1)
> > 	return true
> > in alb_break_llc()?
> 
> Yes.
> 
> > If yes, to mitigate the possible impact, do you think tuning the
> > alb_break_llc() would be safer?
> 
> I tried your two patches on the same setup.  The task still stays on
> CPU0 for the whole 20 seconds, at about 1.8e7 iterations/s against
> 4.6e7 with cache aware scheduling disabled.  Without the early return,
> alb_break_llc() falls through to can_migrate_llc(), which still
> forbids moving the task off its preferred LLC here.
>

It seems that can_migrate_llc() thinks a 60% IRQ pressure does not prevent
the task from being migrated away from its preferred LLC, because after moving
a task with 1024 util to LLC1, the remaining util still fits LLC0.

Suppose, before the migration check, in your scenario:
task p1 has util 1024 on CPU0, and task p2 has util 1024 on CPU1;
LLC0 cap = 1024 + 1024*0.4 = 1433  (IRQ pressure)
LLC1 cap = 2048

If p1 is moved from LLC0 to LLC1, the remaining util for LLC0 is 1024
(only p2's). Since 1024 < 1433 * 0.75 (fits_llc_capacity(src_util, src_cap)),
can_migrate_llc() returns mig_forbid.

That is to say, only if the IRQ pressure is above 66.7% in your test case does
fits_llc_capacity() return false, which allows the task migration.

Side note: while looking at fits_llc_capacity(), I found there might be a mismatch
in comparing a task's util and CPU capacity directly. The former is based on rq_clock_task,
which is transparent to IRQ pressure, while the latter is calculated from IRQ pressure,
comparing task util and CPU capacity is inaccurate. But since it is derived from
group_is_overloaded(), which already compares CPU capacity and task util, we can keep
it as it is until we see problems from this. After all, they are heuristic.

I'll run hackbench and netperf (which should trigger higher IRQ pressure). If there is
no issue, I think your original change is OK.

thanks,
Chenyu
