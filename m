Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792770932;
	b=Upc7jIeTg66ijS8Apy/X3rbEph0cyX1BJzG/X5emEfvK6VeE3wKkAQt5L0CjhHfdUYgv
	 ez5JLXKvKb+dAqxbRCD1++SKE1PWUOVqNe89yzWl8074P+dGjuIx7833N39po4CCV6f4t
	 IJy/l1QkimScPAxFA5RtrVmElGrXbYV49AxeXiXtOTdM9m5DwrMwf3hEVFelo3TvhdAaZ
	 MVk779durb/8MsFwL8TJ6g9j2TjXL/WuQyXqzfOadduoUyLEjbkpcFcekPVpIbgiLo8Cv
	 IIMuUBN3tdYWHvR8yYhxtsskmu1F9/khwgtDiKi97bHFgvVK3WKF5HeY5cFF3bQLEfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770932;
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
	bh=Io4JDRmv/7LAqfN2ndyYDaeCe7lZAtDjXoHXyixXjCA=;
	b=vpdb2jHsyPXE7wjkllyS6vWsuuiw+uLp3u4sY7x0M7/sGYAC1z0EF8j9z0uSBi8bKEG8
	 BSWbp4+sA+/A5/WHZS9T1jGO0e2gjMCVyYXgCA1kmyEQ8wm9nbUuJgB1ToCpfVlG4+Ih/
	 gVEcVDqcUFWDoSKDlz5I8+AwSB5OVO0LAi+TbzGoOGY4XdE3HuxKaLsCUxnb/wca0/A1u
	 kpFp42j8AytlNhlQpe4dV9wdtv63000Zc4CVHFxp6AU2nFNQ8rRd2eNE84yZBnEPIbhQQ
	 pPKJprfem6DdNNf4BXhleNHbuzSvBMdHoKhc2abnrVenHuaim5gIUi/YfJorsbjJS9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3VD53kB;
	arc=fail smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E76606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E76606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3VD53kB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792770931; x=1824306931;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Jj9Zfha1o7UziFCyOhXw9gpJmygPmhKS/GAjs3eA6Nw=;
  b=C3VD53kBT4/GH19U0fGuWtiRQ29fvx7BfmSIdxtZg881WlyiLkpb9ryY
   bv44ujAX3S4Aea9Fno5seK/kbpEPUsgS23h+dogw2KIyiluSwGGlSD2Sk
   /mJfyRctcCART0a2H9R/XMOYIfpO/55qUky81suAdfcDQGhrV8K79OPYz
   38wK2oFMUoBny4jAWgfGlBzHtKg+VR0TRDZIYi7DZfwFDiMiWNbepDva2
   i5KwqYIju6hAL5rIBgKNsMbY9c5GBcEOtu6TBeGYsqR6eHNRk4vxKu2nq
   OnVU/+Qmv9d4m64clxl+hOxIz3ZO8VhY3xfdq9eWB0R3QYklBNb/HwkF1
   Q==;
X-CSE-ConnectionGUID: g1GDICULT2iWwPk2qIIgyQ==
X-CSE-MsgGUID: XGQJXB2aSOiVMOhluaNTiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1420388"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1420388"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 08:55:31 -0700
X-CSE-ConnectionGUID: YDBE95lJROqKVcHKznGNpw==
X-CSE-MsgGUID: cVbGn3lARoCrPNaAsJe5Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3556987"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 08:55:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 08:55:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 08:55:29 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 08:55:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhcoID/M31grPjXXUpHOWQK5PkeCxtigZpLpUhTLxaP6HaDH0JOGI1mUhkmiWJzclZRI2wE+LHXAPHIXkYL87KXQow0dGq/u6HHka7ygaeRtPA2rAVhaKOGPVQbHYrtS9NsMVz5oATmN4nHldBWo1EJjlYS56qnOQGS+VI5u5E3VtvbwpVpZ6bhKe3EX/f3m56do49KTh4S3uOBA/VlaIVW64vgTnNSAzLvDFZ8uLLScpvrJdbTotakJk0UqloKJfQibDoaLM/YyG4OVcNNfByr12uYWn1+DM/CMJXWdGgPQ2n0CqiKW+jQoK3BNMSVrp14Ip/MfeIiEiHE95553Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Io4JDRmv/7LAqfN2ndyYDaeCe7lZAtDjXoHXyixXjCA=;
 b=QPImRHye09wDoR+tOdx5k+q9iMQBdWpDPRMXd2Ls08hJNPsY9iti0/plGnUAnajny8jJ39FEcYFsHOqIuBd4Xg04nsOlgKOUE0+N44MOdjPrum8SCr18mhfk4mTC2YF2AEPcsS7uRjXUxsKXpcoCuOih/1ML/YIxmojhv/YMrjH0fBuGteNtyyyk73bNHEEmT1QJOYmj+5BnGUCWnM7f6XvOXjmAfA1AwcVCptqysmGt6UwI3VKhYFrF5xsuSy8nHH+bEXNVFPffWIk2AGsIymD/rnPe9hETyu/aplUO4A8QOmI4+DpqTQ6m4jlInYYzZGzApXw7lWthRtaD3qFFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.17; Fri, 23 Oct 2026 15:55:26 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 15:55:26 +0000
Date: Fri, 23 Oct 2026 23:42:32 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: <maddy@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
	<peterz@infradead.org>, <tim.c.chen@linux.intel.com>,
	<christophe.leroy@csgroup.eu>, <linux-kernel@vger.kernel.org>,
	<ritesh.list@gmail.com>, <kprateek.nayak@amd.com>, <vineethr@linux.ibm.com>,
	<vincent.guittot@linaro.org>, <srikar@linux.ibm.com>, <npiggin@gmail.com>,
	<mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/4] powerpc/topology: Introduce llc_override kernel
 parameter
Message-ID: <atuAaE4Y-_2CLA37@chenyu-dev>
References: <20261023131646.2907938-1-sshegde@linux.ibm.com>
 <20261023131646.2907938-2-sshegde@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261023131646.2907938-2-sshegde@linux.ibm.com>
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: cca7823e-a78f-4a51-3ec3-08df311e0df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|261009223027099003|261021121427099003|56012099006|10067099003|3023799007|22082099003|18002099003|4143699003|11063799006|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: zKplD5dS33M0i6GcOzV36/o4V+TIB+9Gejlwtr7K6blqO7l1pArJkuy7zHc6T7/ypQe6kt5UnpiHBn3Z9mZu7ZpDJY4N9X/bxmKNh4H8KIR0WAOoy/NY4sgBf27ciQSumW2rfVHoiWl4yuWZGzfz5lGsIidsl57tZw/o/90jsOq+Mvd8WdsaSBgXSkJMzJ2L9iht0VCskd/eaPbouGb6ph/3MSKjyG+lHZmPD569IgznXgfH3+HcOUIaqU68uLOw4JYQoG5effPKfqZHZe/pf+vdSjnUPvgwVjDU43Y/pzUL6veY3grhMwRtO73qNNfw0BuWvT7KfePVyqdS+7tScrWGHTnfNlTSnubDO+moayMCHN+5Ffj3cc/qqj8LRq6dX+6R8XmYew+6BybPDnjr4OIxC6k+U1mR5PFRd475c27z9kEMG4sAt//RwjhzTav5xpUnIaoFEK9dJ4vnbY0d3Gn3GKTRmnTfbV12J0+EOIgnmKdF3B1cFV73N87Lbo0zoWLpXUycTPSydGgKZY8cjNK5hbIk5UL9ipTjTY6WdtgXZZCLec7kMsCZqJ7YynfO6a4gPLwPt3HwixoX4FPPs9hpNRz3VpMh1vBvaGDDpsLUdJY0bNGunTTLJESj5Y0JUfUOiS7hYeSX/jtI3ii/Ey+FWIgGOWJKrTACBl+cNFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(261009223027099003)(261021121427099003)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iiVVupJmShl6eUdrc5rMO3/lef6VKHOg/VxZq/LBKW822QV+n965KluwlUOQ?=
 =?us-ascii?Q?mk3lC/DN721SsTE/g9wGRykHT8W99Xnwy+CZpokjx1PvmL0HkGA/h2ryL1G6?=
 =?us-ascii?Q?K6qAlH9qIihbMaE48PD/YhFcgd4JZIPsM43aUNbLUN0q2N3KMzx4EsAF7imv?=
 =?us-ascii?Q?cRGpgCMVRGibC+GfoMofZdWviY/8Ajy6xASxZmqrAoQHQjBXo2NOGy7UDWlA?=
 =?us-ascii?Q?+GO3FIM3a0MR0IiXBDqtj6dexHfCx9gLFrQS7oOJoONgCbG/f3XCoq54uQip?=
 =?us-ascii?Q?9G3MdPHGvdWhmfm61Cme4VKMTTc7eRGZBU4wfQpZ89o1u19ucpk/TwzueFfR?=
 =?us-ascii?Q?+t85cbF6puLSaMw4r10EiHyirrw/TEpxhWzsovtImHeCuVtmf4pQ+68FEtZM?=
 =?us-ascii?Q?u9zmmSXhL7Ywx/2NNylFJCdRKCaMyO+K0Kg+QzRKzZ5ZfLZQfGUhsKscmN93?=
 =?us-ascii?Q?DtP2RL/Sdr3XUravZz7krRx5Roquu6sZvpxuyZp+62eds3cPqlFQzDn10Fdq?=
 =?us-ascii?Q?LuBQnrZFErgQQJtJMj6hf9RwlDsVkmvQljVgoiyJxi0VAPQNXq/GbvHRdQ+x?=
 =?us-ascii?Q?aB7vhVmAcwOpskjCAQXmc9rdCMdTX8SAlSHjA5cSSn5aLBw3IyUuF0swDlQk?=
 =?us-ascii?Q?xzKQIon35RQYBbIdXfBbWyiR2eBBpNL7QYF7IcZyqjMPWZ9F/8EDw6y+d370?=
 =?us-ascii?Q?3DUg3kdCdAs8qkopdIAloFQpnJ7jClIZf3/W4+HTxV3famCqRy+ECq3TsqUF?=
 =?us-ascii?Q?jzxwqhJtRr5jiUeLQIMKOq0+P0m9haL/ZsMq2uuS2+xKbKzAHB2PyQ6OYWhe?=
 =?us-ascii?Q?U52oi0kSIxLWQw3+r5Ic75jnk77maakDTRY2uTAkl/11AHZc5XLCKAn4PLF7?=
 =?us-ascii?Q?M6wBaawX4XN6qpvqUe7TJvA9rHeowAbXgBHantWjYDwAzkBMUOEiyxUQJJx6?=
 =?us-ascii?Q?qMwjYeocIcB0nO2YlG7jMJsw8R6SS0mr3zjS7goyofKDnTsIbYE75PauZWFe?=
 =?us-ascii?Q?a+Y5vgc2GpUJXDaMV50/Mlm5TLKbmcbJJWih9tWnNN89IzDNUGjN1+PjrZak?=
 =?us-ascii?Q?k/Cy2MiAEpWqBpKOVHCt8bC7ajXtEhWAMFHl3t6oSlV8Af9Jqbui6GIY60Gj?=
 =?us-ascii?Q?wMMWM9F4UTJv5UZyssCmIGGmcRH+gij6Jvq1frQkfraJnksHPQk6+gFiKSaG?=
 =?us-ascii?Q?PH7OgdG/2wS6TmbzxlqHKb6rO7qZLnzr31owStr4JLOIIBaLhB+N9PSykbZa?=
 =?us-ascii?Q?hI6gxUbNccuudWLGAw4U0KT7V7eKP3b5FYrx3VAhO+v/r8T0205cW90MJDpr?=
 =?us-ascii?Q?uGFmfJNzJUnQZEO90S859qRR4uqzevJiAGhCUopfLZ5LLMlqELWQlGxjJXDD?=
 =?us-ascii?Q?ZajT4QXP+O2pvO9limtBx3fU8X3tPxfaI3NUNXT02Ht3nq+U+seawKHdy17C?=
 =?us-ascii?Q?KvAIJ3YdXTBZuMsBN0tt6NNaxH1/rxTpGkMlLHCbYbupqmgwFTTq5Gk5rxWu?=
 =?us-ascii?Q?bzsOtduzQfCnnyD6UG30J4e4Cs/Tk75QVK0lecK7qxmMohUXS+dK6OC8vDPJ?=
 =?us-ascii?Q?agW3/hVQJ/CKWfrdLTAqvRQzHXs6vNy6//BEcYCrMbpFpKu3sceJd6Z12go/?=
 =?us-ascii?Q?Zomw0DKAyoyzd1ynoMMLc3b+67+BgcQLWErV3sGKk4wLWN4kKbNms5md5GqV?=
 =?us-ascii?Q?g5Iibt73BRuzZ30oBt9XIxsNvQyT+cdRF6huxh4TNysG4vhlM+ah/JGhigXl?=
 =?us-ascii?Q?tBTgIF34rQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 4lZ6IeSO+j0o3RCdrO8bS9TgznsH2iKsqJU54yApd7a0wKuOqfvtb1kKplIE/HTqKgqdqfyFm7jsZZryf36cG9xzpFRm8zrMOVajHGJRegg7/tOoe4mn8PMoPqKLa7GgJRRS2QdhlXPoKCqu7eALAUAKS9t3tjSaRJLBSJyKg5Ly2Xlq5voGE9y3DZYYVpOlarWK7UHp+bEioWXM83NDR9dfFGmmJoJGIt3uuK2nhjkbI2es/GkebSp0EJpvoAwPJgzw74wXMFxsZWOgN134a/orTX0aqKTp7uv6g1Yt2gGaLQ3o96JniXaMDpYHRLSTkOrtKvCeEwjzYa2LexQliQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cca7823e-a78f-4a51-3ec3-08df311e0df1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 15:55:26.5967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bI9Eqkki/XmBpGHVmyRtJKwSMMtIgB+9Mr19nZd5XNH03lItphPShh0D6zJdHh5IO4HUTVAAjMJ/v672UMiohw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
X-OriginatorOrg: intel.com

Hi Shrikanth,

On Fri, Oct 23, 2026 at 06:46:43PM +0530, Shrikanth Hegde wrote:

[ ... ]

> ---
>  arch/powerpc/kernel/smp.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 6a5a5469aaae..6b1201ea3572 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1059,6 +1059,29 @@ static bool has_coregroup_support(void)
>  	return coregroup_enabled;
>  }
>  
> +enum llc_override_values {
> +	LLC_OVERRIDE_MC		= 1,
> +	LLC_OVERRIDE_PKG	= 2,
> +};
> +
> +static int llc_override;
> +
> +static int __init set_llc_override(char *str)
> +{
> +	if (!strcasecmp(str, "mc") && has_coregroup_support())
> +		WRITE_ONCE(llc_override, LLC_OVERRIDE_MC);

There is only 1 booting CPU at the moment, maybe WRITE_ONCE() is not needed.

> +	else if (!strcasecmp(str, "pkg"))
> +		WRITE_ONCE(llc_override, LLC_OVERRIDE_PKG);
> +	else {
> +		pr_warn("Unsupported llc_override=%s\n", str);
> +		return 1;
> +	}
> +
> +	pr_info("llc_override set at domain: %s\n", str);
> +	return 1;
> +}
> +__setup("llc_override=", set_llc_override);
> +
>  static int __init init_big_cores(void)
>  {
>  	int cpu;

On PowerPC, it seems that get_effective_llc_bytes() always returns 0,
which makes exceed_llc_capacity() return true, so cache-aware scheduling
is disabled on PowerPC. We might need to provide an arch_llc_bytes() that
is adjusted based on llc_override - sometimes calculate the sum of L2 across
several cores.

thanks,
Chenyu
