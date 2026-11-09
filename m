Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259488;
	b=AaOLGF9aUw0sESMOnWIqOUxyOkDNs1RjqLm7B/PdsR4WuV0gjoJh57Zs+ziVM/LLWSBD
	 hqNCEOAyUdgwWUpSq4aPxpfYemizwOPO5Ht5QHJIiHdutZvlsF5zfps3TfF2XkB6LmTdN
	 Pswdpi0kkqaixa0SCZRyMy41FBEuNcPrA+XLsfgIlgsA8uJOwoNASw0RaAu8WZYAcaeTd
	 i7BmqWyBAdNyYdHAL5nTa5Wth6wW1Hrt7wMliioYC9V6LnJQNnLuW9u4qY4P9jqL8wX/x
	 1TyeDKNKtZ4vB+xCuEPyHWeR7uOca9Boe8MzyfmJ5gpM+soQM5vN+jYlr7svZ3O3Log==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259488;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=efibv5WKF0zXRvUPIbqRlje9mIfkSR8F59f03DhsrzQ=;
	b=l5nvH+LRmTrdJ89Si51/Ir+ujhhostJh6xat3jva1BmNuOi8yr8nMV3st1R1Ob874cKZ
	 1OWW5k43NSf80dw1rJpDPfA9YuhrfKPFQ8I+/26KwkI0nNnaiwPEZhAiL9fpemic2zI30
	 1Ls4Rr0Ym6gEB866h11pHtO/ItBbGhGBR0D4lB/CRDveL2yT5mzY29r+kYcFxwJNzw/ys
	 +L0zfCslwtHdbx8tmVWnFzffTO0fHxol/p8G6eIzOnp0vpx12vyXKe6gcoqHUDfANn9ZG
	 IJULh1F9F/wnUq/D9WzqcDumqCRkGiin82YMV/iSK/RiJrZs1SmfgWYx0OxlfqYPbMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=grXYIH3U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.65
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D30E60A2603
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D30E60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=grXYIH3U
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiTOzwwyUgE0E7Hcx0MqBbrOyRY4A3644DQ2YlUJ5l9mVeLEIGX51cYTxMZ0ZII15+zp8Smmn8wedGO6mVtA61XRXCopHYSVkf6ziXojdkPvA0eBUhu9mi8SoSd3GayQk+h9csxCDynmYnFelJ2Qzm65at8n6U6hqU7jbx//iyghlYojS1MEU1g7Qg865b9hpbfj9DBjj6NUNSgGdiQL9knTjH9jHRN0lvcbYWbjeN5O+bLFyUk4CU/+08iyE7crM5QgYP17VSPvo6n/+aWLx9MLFus2QXGuvxGOJ7amJjITzdL4Rsgs/dPngxJ2BONd1h+Jz6sek/1LsaGc42veuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efibv5WKF0zXRvUPIbqRlje9mIfkSR8F59f03DhsrzQ=;
 b=e1sA6AYWwM6MqVhHowu49vOUdlvYNRoPF5Z5YwgzllyE96g5TsMImiSH1AJognJ5WIYyOk0t50bhWe9YyRB+/JTWvxaxYN6dZ9mXNE5GegANqpIWr9FPwY00ecogvQnBbOFtHC7yYDS6TYDUqGK7BvgHvIs6UPHw6lvDjINSvYIMKGH48ctO+YV48D8G6RtMh3FEH0pNuvUeOS9n6NLCJ/VAqX9dcEedUYqKbSxhPIZoGDNJUd4mYXGJZG5/mxecmbLZuokdAZ7R98Zsb19o85Z1O+kNmHyPqYNx6DbxVspep8TmtuPaZIuTN0NM7TiIEe4NVqrel4+IkBvaLYJfkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efibv5WKF0zXRvUPIbqRlje9mIfkSR8F59f03DhsrzQ=;
 b=grXYIH3UTn7rPhubR6T76ofFvLr3hS+VSG5ELaz7x7eeUny1guMTtGmzUHEL+E3E7LQ/HyQN3zCsJbpKZ9e2pzta9DFBzuKWJTYYS18GZ2dNs0dE65RUgcHJF4wqV5t5SJm1WAwYGPp22pwrCouoZrS6CpCBajj0pLElqMTigvSzFcXIrkCOzOt0pITpnrkdCfWtVity/if5gQaBY3UJYtme2GKdAHnbGHxbmaqZk4v4daUf/0SZJ9Vpv1q2MnxQQ+mKWUHceZBtxK3yssbNvOvnsygwVIh5H0+YZHmGF2L3TaE360OFW4nbSWOhyHqzyBqyqN7PnF5Dcef7CI8tow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DM4PR12MB8450.namprd12.prod.outlook.com (2603:10b6:8:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:24:41 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:40 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v3 06/15] arm_mpam: Support memory-level MSCs and ABMC per class
Date: Mon,  9 Nov 2026 13:24:18 -0800
Message-ID: <20261109212427.1409204-7-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DM4PR12MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: fea07ca2-d5fb-459a-14c4-08df3ea7dd6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|921020|5023799004|11063799006|261021121427099003|261021123027099003|261009223027099003|261022105027099003|56012099006|261022075727099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vCsRwj4ine3Vz4aMLTtqp1B/wDe2C2so8wvHjON6S2A3n20fs+FeA2IBSNC6q0R+V4moi4NAk4NqiyeSRRZZzFQRdufEtor6AoLzcyyIU1cbSBK6TaGA/ItnGbNsgraQYTHQvHJlkwLwZWzpfChDOOJdeRqzUHSqbOILLgNeRsHdDyjzgMMpmIZ8f9yTnFlAaRS14/7nu/J6VqvqVyWhuhoe4B886BCe16eVc95MaOBauqYqa1WyoV6BomasA/cA5z1hhmxdq9gvVl8hMxxFIaZ6/c83RRmhw2KEzFi7p/ditfNVbkNzwXiRsI4Jr9y63CSBNoVlRaZg3ndrAhZ5EVL25AizcUK4twsn3a2YhkhDjk4YTlWy+iCXtYiUfWTf9pNyxMOoXcTAwVRG9KVFd80Pr9RPQlzrLxcDUUMu7SDk7fNAbQF3z3XhD56wk2kR03hbA+QqN9YHzZv2zjQ+0deleYPRjy1fqK7s49XnsITBHWJc4tbkfr/8pXlcgy8Xvb8CX31tQNQS54JSfp2kKUdi5fGLONquWolDnXbw61slIyyeVF1fgNzeOsmIDXNzjscdqOGc5f77CAQj9uy+YRkSHRSJgJ33DMin8UdMXrHE+yg+7saVQ22dv2CP2/IMEiMucuc9Z2rF4yfD5l3QJFoBsUnHCzNpKMubBdSv5V23DZ+vDxO1hz1Lx5hDuCs8XTB2kNPWUH4TdfQfX2a+dg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(921020)(5023799004)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(56012099006)(261022075727099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x9yoixzSu6GDLGcO+DjwiMbod98fftx+XUPPpFN4vOTon4RKKmIsZukY7KhS?=
 =?us-ascii?Q?mqPeKNN33sfz7rJ2MGLAmm0LPi1zHDpBroEIg3/wjrCnmPqzw0z55MvYESr3?=
 =?us-ascii?Q?RZDMb7lm3GLzrisaV05GC9qlfyRSjP4aldMDXa/BISoFvdTh4HkMuQpYpJ17?=
 =?us-ascii?Q?OIzt9gXFgSFUpOAdpUhUr5NNApWNOyxPVqW8XEZP8nDASg/1kB7jxCxQJlH0?=
 =?us-ascii?Q?DiMWocN2Myurr16rNcvXK4gsv1JCwq8ejpiP7NdO9zSKaZMBfx3xCUhZWl2K?=
 =?us-ascii?Q?u1+pJfvlE7PbleLLMIZt15gVlCMeOucPEIx2hW7feKj+TLg40QCNcO1OliZI?=
 =?us-ascii?Q?QoDEDlLXhmXyJiAJzZ23UUvzgy1Bgim81HW1Khthyi68WJdlcKkXt2qQaTES?=
 =?us-ascii?Q?rhXgTB1u0WqB1u+mYeIKCYxxg5pbvP7TcrRZmoPubc/Dvv0TqxU4/StLvIOl?=
 =?us-ascii?Q?7+Zke4Mxc/fYYIR+Fw4r3NOrMoLRcXYleGMpGY/HyOHJ1kPWIblW/kA8q2hM?=
 =?us-ascii?Q?Z0pyXJngMZ/woQwOqbYcIxlRgofSc4+j2a+BHUQVfRO3/+oTnGyNfGC00XdQ?=
 =?us-ascii?Q?bpqa8UluVhvhfbuiJqMQnJ0i9cTskWbFefqQOdqaB5GK5SywL9Ot7KxW2KeC?=
 =?us-ascii?Q?Mi3DuR3ovgATBvis6xqYjg9zD0cDi09B7leHUz1gxpgQELWByHR/f5b4gMI0?=
 =?us-ascii?Q?J+CILLeJpC3Rq1NWxhxQ+5TdyW85gaF3TttYGn5de22B201f2fXhHsT4XsOE?=
 =?us-ascii?Q?2EO5eDZxySM086RhuhZVu7ZEWqdPAoGiL1ey+elX1vRM0kLP7w09wkHEDR02?=
 =?us-ascii?Q?HNM9XNOof7pij4GqRVf5XbpJVKK4BOHYmhINIPMRiy3ivSdvgmp5YdynhT+K?=
 =?us-ascii?Q?QcMtOKd3hcxaqif9lMDY+u5+Km5k00m0/sCM3XuZF8yAjCKYHjbu5S56GfIj?=
 =?us-ascii?Q?9h32GeabG3Wf67fE3mB78EIjKGoeMHWtJCQSSCghZ7W8DmbzpBBe/aU2sZD9?=
 =?us-ascii?Q?OnFa73xt/Osf7JscQ/xTxo5yKpDjYtSyvl7vY6tHilz7P4nLCEXfRhD54kSK?=
 =?us-ascii?Q?f7NpFXSbM8ZCITnoZAK9R+VRZgg+RnhvYWOF9r6x6gXdpupOnyCMoYJfjXSW?=
 =?us-ascii?Q?3FuQv0RsMCSUcH9wrYx0PUNd1bZwi2sXes4N4KsUJMb0Lvag5q4Jl+b/Y+aB?=
 =?us-ascii?Q?T2KU+8mjT2GFHpU4iZ9sTFa4QtWhH/ML/xrUvg9R2NfuNFL2bqGOV5C94ubG?=
 =?us-ascii?Q?Q7qMql6TOepAVv0bhI1DSyovyJxNLf7n/jPLdmpdriVgu0N91F2y3MV8WaJE?=
 =?us-ascii?Q?eG1+vFuqJmG9lrEBVw6u3quoO8O39JuYjwkoKwjyIUY9qtt1EOGDZxuXLd8e?=
 =?us-ascii?Q?4R4X4KhHGgK899DkEDtByFl2wWtGA4s03HLP0YV6PpjJUiTUInJP3MFLCo9h?=
 =?us-ascii?Q?GC7FsUIsijKcJINrcrTgOS914yXw0c3Qc4SkSnNcOAhDhHctHPCb0njGnshn?=
 =?us-ascii?Q?XQRpkxlaEJ+j7uBz5WCjTo0sV8JAIn31B6LUNUiajs3YLwSAWEV4y8bPiuMp?=
 =?us-ascii?Q?ygkobtXseqEmvq3qnx6o17SzZPu0HSIZZM2LYqRtf0FCUFuD0dxmJvuq8MU0?=
 =?us-ascii?Q?QO8xXVUXjvD6JbuJjwbDRhAIswDVotO689eM/xPJrRgtm4ltrnj/MWeAmWpV?=
 =?us-ascii?Q?9Z+VEZxOPxCf+Iw+tTUYcuNaY/cmVjlgGtv/OUhNBuFR8dPRV8Qtf1Qf5xDU?=
 =?us-ascii?Q?HZuk+NImtA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea07ca2-d5fb-459a-14c4-08df3ea7dd6e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:40.6626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JR5v8fUIdEY9Algvsbs4xDWBz4JTjDMNvN2nsI+P2u68nerj3/LHlUXTNMOQ+mTzE/p5k2FCmrLevZUqVLvwbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8450

Some platforms place MBWU counters on a memory MSC above L3 while CSU
occupancy may remain on the L3 cache MSC. The driver previously assumed
all monitors and ABMC state lived on the L3 resource, which
mis-associates MBA counters, breaks mbm_L3_assignments when multiple
events share a class, and uses the wrong domain ID space for
memory-level MSCs.

Teach MPAM resctrl to map monitor classes to L3 or MBA resources,
initialise ABMC on the resource that owns the MBWU monitor, select the
node-scope MBM total event for memory-side counters, and test
mbm_cntr_assignable instead of inferring assignment support from
whichever monitor happens to share res->class first.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 112 ++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 31 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index ca2ae4b5cc8a..47a7b18d841d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -45,7 +45,7 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
  * to those supported by MPAM.
  * Class pointer may be NULL.
  */
-#define MPAM_MAX_EVENT QOS_L3_MBM_TOTAL_EVENT_ID
+#define MPAM_MAX_EVENT QOS_NODE_MBM_TOTAL_EVENT_ID
 static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
 
 #define for_each_mpam_resctrl_mon(mon, eventid)					\
@@ -88,6 +88,11 @@ bool resctrl_arch_alloc_capable(void)
 	return false;
 }
 
+static bool mpam_class_memory(struct mpam_class *class)
+{
+	return class && class->type == MPAM_CLASS_MEMORY && class->level > 3;
+}
+
 bool resctrl_arch_mon_capable(void)
 {
 	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
@@ -121,7 +126,13 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
 {
-	return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
+	/*
+	 * mbm_cntr_assignable is set only when ABMC is initialised on this
+	 * resource. Multiple monitor events may share res->class (e.g.
+	 * occupancy and MBWU), so assignment support must not be inferred
+	 * from mon->assigned_counters via a class lookup on the wrong event.
+	 */
+	return r->mon.mbm_cntr_assignable;
 }
 
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
@@ -181,24 +192,41 @@ static void resctrl_reset_task_closids(void)
 	read_unlock(&tasklist_lock);
 }
 
-static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
+static struct
+mpam_resctrl_res *mpam_resctrl_res_from_mon(struct mpam_resctrl_mon *mon)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
+	struct mpam_resctrl_res *res;
+	enum resctrl_res_level rid;
 
 	if (!mon->class)
-		return;
+		return NULL;
+
+	for_each_mpam_resctrl_control(res, rid) {
+		if (res->class == mon->class)
+			return res;
+	}
+
+	return NULL;
+}
+
+static struct mpam_resctrl_mon *mpam_resctrl_mbm_total_mon(void)
+{
+	if (mpam_resctrl_counters[QOS_NODE_MBM_TOTAL_EVENT_ID].class)
+		return &mpam_resctrl_counters[QOS_NODE_MBM_TOTAL_EVENT_ID];
+
+	return &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
+}
+
+static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *r)
+{
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mbm_total_mon();
 
-	if (!mon->assigned_counters)
+	if (!mon->class || !mon->assigned_counters)
 		return;
 
-	l3->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
+	r->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
 	if (cdp_enabled)
-		l3->mon.num_mbm_cntrs /= 2;
-
-	/*
-	 * Continue as normal even if enabling cdp causes there to be
-	 * zero counters. This avoids giving resctrl mixed messages.
-	 */
+		r->mon.num_mbm_cntrs /= 2;
 }
 
 int resctrl_arch_set_cdp_enabled(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
@@ -404,6 +432,7 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
 		return mpam_alloc_csu_mon(mon->class);
 	case QOS_L3_MBM_LOCAL_EVENT_ID:
 	case QOS_L3_MBM_TOTAL_EVENT_ID:
+	case QOS_NODE_MBM_TOTAL_EVENT_ID:
 		return USE_PRE_ALLOCATED;
 	default:
 		return -EOPNOTSUPP;
@@ -1160,7 +1189,10 @@ static void mpam_resctrl_pick_counters(void)
 			 * and it's equivalent to mbm_total and so always use
 			 * mbm_total.
 			 */
-			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
+			if (class->type == MPAM_CLASS_MEMORY)
+				counter_update_class(QOS_NODE_MBM_TOTAL_EVENT_ID, class);
+			else
+				counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
 		}
 	}
 }
@@ -1187,7 +1219,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
 
-	if (evtid != QOS_L3_MBM_TOTAL_EVENT_ID) {
+	if (!resctrl_is_mbm_total_event(evtid)) {
 		pr_debug("unexpected event id\n");
 		return;
 	}
@@ -1204,7 +1236,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 		__config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assign);
 	}
 
-	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
+	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);
 }
 
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
@@ -1303,10 +1335,10 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
  */
 static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
 	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
-	struct rdt_resource *l3 = &res->resctrl_res;
 	struct mpam_class *class = mon->class;
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r;
 	u16 num_mbwu_mon;
 	int *cntrs;
 
@@ -1317,6 +1349,12 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 	}
 	memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
 
+	res = mpam_resctrl_res_from_mon(mon);
+	if (!res)
+		return -EINVAL;
+
+	r = &res->resctrl_res;
+
 	num_mbwu_mon = class->props.num_mbwu_mon;
 	cntrs = __alloc_mbwu_array(mon->class, num_mbwu_mon);
 	if (IS_ERR(cntrs))
@@ -1324,12 +1362,12 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 	mon->assigned_counters = cntrs;
 	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
 
-	l3->mon.mbm_cntr_assignable = true;
-	l3->mon.mbm_assign_on_mkdir = true;
-	l3->mon.mbm_cntr_configurable = false;
-	l3->mon.mbm_cntr_assign_fixed = true;
+	r->mon.mbm_cntr_assignable = true;
+	r->mon.mbm_assign_on_mkdir = true;
+	r->mon.mbm_cntr_configurable = false;
+	r->mon.mbm_cntr_assign_fixed = true;
 
-	mpam_resctrl_monitor_sync_abmc_vals(l3);
+	mpam_resctrl_monitor_sync_abmc_vals(r);
 
 	return 0;
 }
@@ -1337,8 +1375,15 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 				     enum resctrl_event_id type)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r;
+
+	if (mpam_class_memory(mon->class))
+		res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+	else
+		res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+
+	r = &res->resctrl_res;
 
 	lockdep_assert_cpus_held();
 
@@ -1365,8 +1410,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * monitoring class.
 	 * Setting name is necessary on monitor only platforms.
 	 */
-	l3->name = "L3";
-	l3->mon_scope = RESCTRL_L3_CACHE;
+	if (mpam_class_memory(mon->class)) {
+		r->name = "MB";
+		r->mon_scope = RESCTRL_NODE;
+	} else {
+		r->name = "L3";
+		r->mon_scope = RESCTRL_L3_CACHE;
+	}
 
 	/*
 	 * num-rmid is the upper bound for the number of monitoring groups that
@@ -1376,9 +1426,9 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * this does mean userspace needs to know the architecture to correctly
 	 * interpret this value.
 	 */
-	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
-	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
+	if (type == QOS_L3_MBM_TOTAL_EVENT_ID || type == QOS_NODE_MBM_TOTAL_EVENT_ID) {
 		int err;
 
 		err = mpam_resctrl_monitor_init_abmc(mon);
@@ -1386,13 +1436,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 			return err;
 
 		static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
-		l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
+		r->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
 	}
 
 	if (!resctrl_enable_mon_event(type, false, 0, NULL))
 		return -EINVAL;
 
-	l3->mon_capable = true;
+	r->mon_capable = true;
 
 	return 0;
 }
-- 
2.53.0

