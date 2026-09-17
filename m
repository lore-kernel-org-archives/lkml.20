Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010031.outbound.protection.outlook.com [40.93.198.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0576558FD04;
	Thu, 17 Sep 2026 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654117; cv=fail; b=M2AWNA2mr/TibCj6tD9NpvleheZPM7LyWyw7nz3nC6Fsqpp2I88nvWI/R4/4CDtd/rJR5mC/kmdOg5tILI1vv074TWs5+xIUDO6FzS8SgiI2ggp8zNAu4685HenIQmiXW7QXqba9UJQgXYr9Ffe5Llk0BjFcOuzAOWa5rpG6l8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654117; c=relaxed/simple;
	bh=iplslCs+QjdD9fjX9BSJ8aTYkszRsOXW7pjPIY/kBDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K0z36j14YrpqzRkFXV4VAbxknXMNGrS5f9osZdrRRM9MZS0/Bf18TlPw4yALa+leutQlyuzonTFFFdx4bo3mEzWOS+D3CezaNp5AG2M46N5pwkk6g+klZbgan8ESveR1bpB5K4nc62gY7CsuTnwgOdaEufycuaLfGiMqXwA4eNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AOh5nnns; arc=fail smtp.client-ip=40.93.198.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AOh5nnns"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXTUTTiaJZ/qmqRyaRJ019rx7LzIv9qj8YWahJR8Uij8jg5SdzUl+chHmVHW5eOSnK4A/1+zQS1wXZ5e2S43zr9eQKIKhK02ZT4n1pafD83IjNl+oUjH7WUq19XQg8+6kvMpU9ca+MjgcFhzsjaY2u8BmMT42k79ukV9cmm0V3zkqSntUSdKJ5t+AOKot+YXUS0c7BhYBtLYPm8S0PVhkxXId8ZOyCjZeSmcjZC0UCrw0ySdiK59zPp7+WOgeTK+cQ/+ge+lEgYbrNuWzeBeMQFoWcCaHLRcd/mQ4Qpng8xvyZczHCm2GQCdNfNpD/Pxz/2YKX5nEK8CnsOCO7hruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRtHEZ8Qa4Ud4rjAOfEK3k4x1Lsymmifmhmawuca7Ko=;
 b=hnziBkB+E0MpMVXtEBwLXe0oll4PYc1UNUDorSrTgQGb9Julp/8pG089SJ8PjikoRWjS7eFtyDvn6XvW0vRIHL5tJ6E2Nt3ZmjB1ju2SeivXCV3uj7MWU0uH0ddUrt5LCeYk4Mn4NtCIXL3L4eypwpk8bE5Vq6TyfPsoXQrOyGSBq2OzZjTFcT4rpLrIs77GoKaynKdXQlyWhaqTLpkOWOCWhvknRdK8ApId10MlVZ7btGPVAsPbAxacx4fHvkIdmFvnWenPJ/lqxX8vbd4jk1wKQ6HRdBdQznaIjEtHnXjQlZ38MK4+ZD192+4EOG4+gcd05LwN0jTsarX9OgX9SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRtHEZ8Qa4Ud4rjAOfEK3k4x1Lsymmifmhmawuca7Ko=;
 b=AOh5nnnsNCeBq5yGQGEf329HUpXL9Rza+cOtSqQF0fFfZ3LGDnIdXlvdhpHt0pL4+IySYEK4H1Wl+wlDkxZ3oMZxnpZlzzfTsUdSzyv9Q8sg2cpKd9Lu6EGxfD19TgIVTtylAavZSDsYkWAXqo8r+7CfFvASkhE/V82JlyOjQyRBQeuUUE2M+dcdtcP3FH1NNh9DOK5x0SxXtqw427Py6AiO332CHYPqW2C3tlvPWxWQp33i1YazfmCNr/pKG+UsceO9IMbW8JoL4GLO7SesyjlKk/uq/mXboYjy9lvA4Tj/CefQPZct1Gt36DTqeyFzWqlK8iFRevX8xcYchKHF7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH3PR12MB9219.namprd12.prod.outlook.com (2603:10b6:610:197::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 14:07:38 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%7]) with mapi id 15.21.0428.008; Thu, 17 Sep 2026
 14:07:36 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lee Trager <ltrager@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] sched/topology: Add asymmetric SMT packing override
Date: Thu, 17 Sep 2026 16:05:21 +0200
Message-ID: <20260917140707.3807229-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917140707.3807229-1-arighi@nvidia.com>
References: <20260917140707.3807229-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP6P284CA0072.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1ad::16) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH3PR12MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: 957e350e-2cac-4c01-3324-08df14c506b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|11063799006|10067099003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ElZhtJrlZcnex+cWQ1lO+q0I68DW4HG38DiArxYHuPyI7YH43R8yoaB5tVi6vV/5dZHj60wJvUBXQxbahucquob/w1so9OboeKlPIr7Rx/+qOk1j//iFDNkJj6QUxIKbuoV7oAcatW0JeQzAB/tT7SItlFkVUUTkKxRnY1C5CHehSSixYaxiQ2pgVN45Q2iAdNO1StTu2bFtZmi1VizuyGwI9pNbhBafoBTzErFjt4/sU5npBNJyhhfQ75F+4XSAPrV//zz/+2ZjUtd1OKl4AEumAdL9Qg/x95fwfDlNXThjOUMf1i0qG9lE/5v7iBQBthF8MyavTmC4T4jmnxsHeWE/clKpspk2lLk158uDqOAZS9uT5EVapidCkPtEimX3wbST8fmT2BkZubFYjH5dvw7hjPRV7kqS3SQG9UuAB843cQjaC8Imt8M/PL83J1XUdH0dCsruw5P6TIiqWHyWaKY7D///tYwqQLz7dPJE64sysZZgAo0xt6XUyx/o+YKV7MrBDVxs7nLMFr2v6Mad0VhVorjyWCcsFvxyrtDuFiwTOojow6f86R9ytFG+uTNgf8g07B4VJ3dmBzQIx95UZXrZD5MS8niAPHccWdIxceFsDphUhzerdZWcJNIXBI3s1Ty9symHpd2KSB3OmcEINxzW1m3PWBCyTwVtPX+YrOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0l12khHi0qZdHNGeiv2QPKns21XYT9H9G641iEiuA8szgsgigmG0v9fwtnTm?=
 =?us-ascii?Q?QwdXIWVliQDTbsCoK71lauk6mi7lLRp3fTH/b2yaRfJiPshYX6/Sieez9sRz?=
 =?us-ascii?Q?lhBmDLys5Tq8UaeI52O0Icn6jwJRp3A18wM99TMOAaSZx7fs2la80EYXRSd8?=
 =?us-ascii?Q?UxUYq8y4faVVwPRtbEUVXidjGrREl3uF8VWyJgdO/CVHbHGCXUw07d9pdZ+K?=
 =?us-ascii?Q?KO/AxABxD7KM1bSIHor5FBtKyWh5fGZ4YoHozRxEZCZrpSkaJlF2AzxXDaYu?=
 =?us-ascii?Q?tH5tXyLRFIVs7LZXT2aE6mITuR76Cn3XlhBECvyEmwz+Zqyu0oUBWoMQvrOy?=
 =?us-ascii?Q?5dqVvsLqv/A9pdxqKT3pradEV39s4NId/5vCkMOK41GLz/6pe318ySTtgzuB?=
 =?us-ascii?Q?Q8gxOoUqe+ZpqPV5Ho/avN8xDvb8/zKDmcx5Pyb5qDEBAMDKMlaIPNZp0U4W?=
 =?us-ascii?Q?4fVFHSMTWMtNw/cHkCQAQahO8dDfa5dAcyqf+LyaA1Hn9ASOD6iCa+INWqik?=
 =?us-ascii?Q?15oC3G8GOBFzfqqj2UAnHLNtbdvyFr2LoK5KR+Hz0IDEk2RcTm4aq/GqDl8d?=
 =?us-ascii?Q?c+TvAt1BtobNDvaoKGZB5UVCUa325sSezap/ujmtoVziJHo5sD+zI0wmQrzh?=
 =?us-ascii?Q?m970nVRMsO5nEQ9D3R+agCJDUXW1x4QRn3DZog25ou/hSch9HtPzNqMGP3Bw?=
 =?us-ascii?Q?zndW1UUbGJx4bnFzEb3ECLrEShl06oRdOkadia16MtOFIu6ElzYOzYWf5qfw?=
 =?us-ascii?Q?rG1z10cuWZjYYkgQNGdYJr8wc8N1qNesiAt96258dXVTc0oo4YNcKEi8lCVe?=
 =?us-ascii?Q?KMXjx7Z6ecLXEzMRtcnHlB9sN85ruzH9FbsJPO5hkYsOehliC1oMiP5PKfnf?=
 =?us-ascii?Q?G6pjTO7lNHgLI1wmsf/ESNq52aXdebc5Xa4PXTz8ZH36YRHWH1LP+wXM7c1/?=
 =?us-ascii?Q?JxaLmPleKquNglsgaP+EZlMOl+JMuc2xGpn3QbuNyIxGnRT4zt86Om0kkGIY?=
 =?us-ascii?Q?gbiy/FvZ6Gj4xWIK40sHvIXgoLDygNguXizY5ni/B+eF05RyCNmnbBRMdO4/?=
 =?us-ascii?Q?xxDTOrPbX79z4OdGOuSTPsSg85lS/z6v5xFJDUNRJY+WeeQCEMAApm4ygrPR?=
 =?us-ascii?Q?tUpT4kzcD8pnVg1hhgwkWn/Oq5iUzkTUJakLuCFqZF3uR8I1USuE756FdsxH?=
 =?us-ascii?Q?Vu5HrjHM/brutf1LyYTYPiF+WM14XRNsRjikWZ3QYDBruus0f/6gZVhJBBnL?=
 =?us-ascii?Q?0IwYCJgB5bSqq8N/1tDginI1L5voddt1T55iyu+hpLFRj2G/uZc54piyEONU?=
 =?us-ascii?Q?ilah9bPV3TG05DxRD71FNHPMJtmKFAb3KtOQRmCs/isl6mCYKo73G1F2iKxf?=
 =?us-ascii?Q?Wk+5AdRiBO4nUKSbXZKOzTLyJjjHoMSPp1pIm7LZAjNsLiqNankGDtuwa5iJ?=
 =?us-ascii?Q?C6Xj0gcQ3tcoz1spX3M5ZL5bG2L3M06vRgsj0/e7rvFWAtKUs/63adYzc2/j?=
 =?us-ascii?Q?zqUwvv1wDYvV1rtcZqOCksdEpovOfRMzw1i2BS684G7FjqozdrU0U741j+QD?=
 =?us-ascii?Q?DVGHX6+av16aCpQJCq7ntcMTKXuqk1PExzKujmh8WYLXg2VRWjVcZORo4XMx?=
 =?us-ascii?Q?of6paAYlvE4rg9s/yU/UQg3jolWYtdN4k1ERBDjk9X7uIh30ComLY26QD/UQ?=
 =?us-ascii?Q?hoGU5EJGgpk8+ek6WmBMP+Jubc+Alx7EovqEJAxIOEFafNLonRJFnfTJjAQD?=
 =?us-ascii?Q?g69U/n8yhQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957e350e-2cac-4c01-3324-08df14c506b2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:07:36.8264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPjRL5GAWJjO7/mHIJMeoB5e6MN31aaZ2Q6LvWdHgXMS9mr/O+4mXjvYHEAcLDhpUrz0LPzbZGAYjU2j62y+7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9219

Architectures can use SD_ASYM_PACKING to describe preferred CPU ordering
at the SMT scheduling domain. Some systems benefit from the same policy,
but their firmware cannot currently describe the preference. Inferring
it from the CPU model would embed a platform-specific policy in the
kernel.

Add the sched_smt_asym_packing boot option to override SD_ASYM_PACKING
at the SMT level. Accept auto, on and off. Auto preserves the
architecture-provided topology and is also the default when the option
is absent. On and off force the flag without changing asymmetric packing
at higher topology levels.

Apply the override centrally to domains with SD_SHARE_CPUCAPACITY so it
also covers architectures with custom SMT topology callbacks, including
powerpc. When forced on, priority remains defined by
arch_asym_cpu_priority(). The weak default prefers lower-numbered
logical CPUs, while architecture overrides remain authoritative.
Siblings with equal priorities remain unordered.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 .../admin-guide/kernel-parameters.txt         | 11 +++++
 kernel/sched/topology.c                       | 49 +++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47e..36c3b2e563441 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6799,6 +6799,17 @@ Kernel parameters
 			solution to mutex-based priority inversion.
 			Format: <bool>
 
+	sched_smt_asym_packing= [KNL,SMP]
+			Override asymmetric packing at the SMT scheduling domain.
+			Format: { auto | on | off }
+			auto: Preserve the architecture default. This is the
+			default when the option is omitted.
+			on: Force asymmetric packing at the SMT scheduling domain.
+			Idle CPU selection prefers siblings with a higher
+			architecture-defined priority. Siblings with equal
+			priorities remain unordered.
+			off: Ignore SMT sibling priorities.
+
 	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
 
 	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a7..cdfcecf673fd7 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -32,6 +32,46 @@ static int __init sched_debug_setup(char *str)
 }
 early_param("sched_verbose", sched_debug_setup);
 
+#ifdef CONFIG_SCHED_SMT
+enum sched_smt_asym_packing_mode {
+	SCHED_SMT_ASYM_PACKING_AUTO,
+	SCHED_SMT_ASYM_PACKING_ON,
+	SCHED_SMT_ASYM_PACKING_OFF,
+	SCHED_SMT_ASYM_PACKING_NR,
+};
+
+static enum sched_smt_asym_packing_mode sched_smt_asym_packing __read_mostly =
+	SCHED_SMT_ASYM_PACKING_AUTO;
+
+static const char * const sched_smt_asym_packing_modes[SCHED_SMT_ASYM_PACKING_NR] = {
+	[SCHED_SMT_ASYM_PACKING_AUTO]	= "auto",
+	[SCHED_SMT_ASYM_PACKING_ON]	= "on",
+	[SCHED_SMT_ASYM_PACKING_OFF]	= "off",
+};
+
+static int __init sched_smt_asym_packing_parse(const char *str)
+{
+	for (int mode = 0; mode < SCHED_SMT_ASYM_PACKING_NR; mode++) {
+		if (!strcmp(str, sched_smt_asym_packing_modes[mode]))
+			return mode;
+	}
+
+	return -EINVAL;
+}
+
+static int __init setup_sched_smt_asym_packing(char *str)
+{
+	int mode = sched_smt_asym_packing_parse(str);
+
+	if (mode < 0)
+		return 0;
+
+	sched_smt_asym_packing = mode;
+	return 1;
+}
+__setup("sched_smt_asym_packing=", setup_sched_smt_asym_packing);
+#endif
+
 static inline bool sched_debug(void)
 {
 	return sched_debug_verbose;
@@ -1950,6 +1990,15 @@ sd_init(struct sched_domain_topology_level *tl,
 	if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
 		      "wrong sd_flags in topology description\n"))
 		sd_flags &= TOPOLOGY_SD_FLAGS;
+#ifdef CONFIG_SCHED_SMT
+	if (sd_flags & SD_SHARE_CPUCAPACITY) {
+		if (sched_smt_asym_packing == SCHED_SMT_ASYM_PACKING_ON)
+			sd_flags |= SD_ASYM_PACKING;
+		else if (sched_smt_asym_packing ==
+			 SCHED_SMT_ASYM_PACKING_OFF)
+			sd_flags &= ~SD_ASYM_PACKING;
+	}
+#endif
 	sd_flags |= asym_cpu_capacity_classify(sd_span, cpu_map);
 
 	*sd = (struct sched_domain){
-- 
2.55.0

