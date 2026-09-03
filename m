Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010006.outbound.protection.outlook.com [52.101.61.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665F340A927
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454787; cv=fail; b=J4uTiPmbe8MmvGsXNs6GPOVu8bwt94a7BvdcO1pQqwOUgmJAzJo1cRCxzwk8bzaPXUQZbv5TF2cTe8195aQGhAiAnXLBVGeNoUhGsFMMXm51VMaElvZac9QYPu9O3BWIYZdt1cZwh/8DQawNxfQ7ETQG3XOZLmcJXjfRat2MS2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454787; c=relaxed/simple;
	bh=vNtGJjNoU0rcyLpad4SfbCQBxsDbFwMMcZwEwWVK7hc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kzxrXpFYwyMA/i/bZhhuEHcjHapcSmcWrDOqk+P8PTfKfIKNt89a3urwYSReDVwN3Y3y1V+grJ8WlZ7UeGZTxHpbbRHTQNK7rz1RhQ07367GePwK95Oeo2ohQ29B2yA35k84VOKzNiUekwE78P7YypIKB/i/i4RFmHAxyMeEXiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=FmNS0YkE; arc=fail smtp.client-ip=52.101.61.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="FmNS0YkE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0rNx7H03kePjRHlvveqd08deSGKayarrafg/bIfHAX3Nrx7b4QonhptdTV/T7bO8bgTkSI/I1DI9yoDrldfuBUURU5OjjUc07sx/eMHQEnFmSsOpTllf6b16H38hvzSZqSkqAtMfuNFz1oLIBRnpypEjkArjRHMyHzaI/wrlzmBR/NwzvAyi0Z3NKIhgdreFtpUD2gn8M+kTISv0RaGjTQRZM9qz0ujrZ7pS6lOdrpMbWoJlq8hzcsNgfgiF7oRonWPdC1gC2LFDzBxYjLOGa5exdqqcBFTfIo2VXv9GGd3V546dkaP3tBO6RgKox9IMpEVAyYRs4rOwJZRwt/FLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epSzZejHAhWHAk9J/lkzmot7FelnK4t4Dzu0aKQNejY=;
 b=sbEQcnIDP6zgxb8/BGXbcNnucyKZ0wvGZDIXRA2qhMI5fK+gbAYmu/Zazu4c/RSDpQs/MqmKme9qwedTgIcEzMniuUZTuCFe4fqNw//j39RtgzaBJxXehvSqubvjZdATCPbtrnrBNbVahbwEQSkH1gK06vXLyeXeDolJpzpcln3bNQhrZFeYL69G4jrkUEgkqG0PPGPT/HWzFIXxMDqUP4YS8YjtojeJPgLR3XT4hx0fynZHz6Ajy/fE79MAP/Z+PaSmxrR4TpfZwNw9HIARL/7HWWmgg5thXuxEH7ld9iP/0rqdYsFvoCRsNqvjaxqsGpV3toUN3P8JXflfm1vqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epSzZejHAhWHAk9J/lkzmot7FelnK4t4Dzu0aKQNejY=;
 b=FmNS0YkEupm6ntlNmA3EKcWMd19OT57Lj+02yBl11haC+IPLZFY78bhNXjoSqmz16PS2dCKDZGImEdtrtjsJ8YCgqccmyVN949KDHPoomDp4c3msaWo9jLHa7AFiSexPWCXG3875Vuj/wdP0EsMPcd0pqmANJhA8caoIYNVXl0dbnHPT89aIH1XsjrLdXsh2xdBRzjWrGAGQpZlHGYatM+UVo1oT4JT3r6/Jgfy6l8kX3QrAtfsCPkrawzork6GBbJFgcLy0Wze46HLsbGHHEYnqX82Nc/UOze7t0cQP6rgqYEbUApt5Qnn1GL9X781VebaauyJCm4GQCvUP5s1bvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SAWPR03MB989573.namprd03.prod.outlook.com (2603:10b6:806:55f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 16:59:42 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:59:42 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3] firmware: stratix10-svc: add PSCI secondary CPU offline on warm reboot for agilex and stratix10
Date: Fri,  4 Sep 2026 00:52:24 +0800
Message-ID: <98ce724c07946338bb0a6ffa7d2b204a93a7a6fe.1788452660.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SAWPR03MB989573:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fa33a6-cb19-41d6-c2ec-08df09dcbf3e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|6133799003|5023799004|11063799006|18002099003|55112099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xKQDLMg5NJ6FvwIXbZF8s+pdW14EF+6sXU1AUxu7sW+linP+t9IJkNwoe16YEJeQJEWppNAj9wHu+J8sbRzuG+NMckrCu4bsaJZ53Nx+r5LtAr06KK+nX9whBurSqgouga4zic6aexq7Nzh7awK5DnI+p8sm0YIr6VuIYajlYKP+ga5zdvIjoUjwK/MUZEnqnD3NUBCIYN0GIeQGIVzx7eWG4VoxrA+QkfYku4Nxbiqsiv9RliGEixaCkv4Q+j6Xu69e2ZtFWMOQcNjEowZ605PuCPcUxqaOBlOrSOTjQnLLLoeGJcb6M1i6dLWB6AKvzsyTKrVu3WMwrEyvTacVXlf8DZBZn14VLMeJsADvdrI0mQw4lJPQsxPGiTvBT0wn1WEyYidTSbKoVjSUM6RctKNUejz0qrai/Od6RbIVLHXEeXNuyK3rbuy6PQWaS3rZGfuq5J5ygS7LUDzY/Hjvs3fsz7+cAMDjpNNlDKvfjzdJ4el20nf8r4cF/TH9TYbIA9gbal6bLTrrcSZjtiRpRVgTd2w3NYKWhP5haHpsJaER7arSDckPrY/A6IFGkRizApT/BvcGx0FTBMRe8Q83fh/191Q2fJBPVK0jhPuDqzMjVRQi6Ol9HEzs1zLNQy1pkLlbL1xbdBK/62iQ2WspNDkwZQwEw1kfYTepOLKWGEk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(6133799003)(5023799004)(11063799006)(18002099003)(55112099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o0iDYYA8KkLWsF6lmmiGv0ZuQ/QFOsVXppdg/uw7F0KK6HrsddYI50mEppdC?=
 =?us-ascii?Q?7pGWszHupPWkdcKhA19YN6GGq2OmEhydyrevcR/RixW2s/yfYII6puRpYSYZ?=
 =?us-ascii?Q?CNYkdGWMgkba+p8ew+OCTaNG/9SRGV41vlajhXanruR+FM1PGlbXesztRe/C?=
 =?us-ascii?Q?XjEQVvZ4vCu5dc8vX62ojj2JieX18QrdZlN5rOL9O4XcqGAFWM9wUEmOig1K?=
 =?us-ascii?Q?rDfO1hivSeowb0IFujoW1L2LHXcmDuzEBRkdLM7JjjhbRx7SKD0SrscBza5x?=
 =?us-ascii?Q?GK7YbHIV6ZOQtJQK4lO3mDop4jbjwXSXzuS2b2YjUumFKr695/SgJpirzAIR?=
 =?us-ascii?Q?DFW7s1MtFrtv8MlWgJILs5EE4gcSnLozKRMMs/BfOnTPZjuo2SrUE87r9t/S?=
 =?us-ascii?Q?WC7x2hKUpQ1bVN17MvGSpgElW6JA2yyjJZzd8KS9JWGIBQpSTXROv3OSbNJs?=
 =?us-ascii?Q?LLvfTvkc9nJKIwiLrW+jYyEnGzD3I2qKewtv9q3+eZ/Z2vbOPCQdrPx/SaDR?=
 =?us-ascii?Q?YhL2kJu6q/ZKXFF4hzyr02HAxvpnPNpXO6lb0RTKMGdCe50u8d2nrFV2JBVY?=
 =?us-ascii?Q?JNE8+HboS4+2hwjJM0w1cfmFJ+TdeNdSn7veQ4GAA4IUKzZDLauS/NpjkVFr?=
 =?us-ascii?Q?sEMflfDWNphVf0UggdgbXTAYsSmKZOTbVkjI3/ecJkf3/Xh9WYYdIgw1Akj8?=
 =?us-ascii?Q?T+1ZoBjl6+0RMzha6lijHvq5a1qj1iMgqZ4USYdnBVmr5Q5RfLFBpG4EATb6?=
 =?us-ascii?Q?v8Tp+W8uOnSLHue7N+kETSQPQYJCY+ZhrVL5Y/bFp4oC3Fz3E3yLDggKUxaG?=
 =?us-ascii?Q?OoHWy8Lo6m5DUqwjWplgv715djD4hMnXxEk8540NxlLEHhpMaBzodgrdMF1y?=
 =?us-ascii?Q?EvWmeQbmkh0tPEJ3Ptnqf+ZTRcE9j2A7xVkm7usDLiS5vRmoFFd18prtAvOg?=
 =?us-ascii?Q?2rkMcVCKm+vUwG20IjrFXAgRC9JRjp0r/Tt9rEvF0lNTCzWT/7WNKdcvkYdL?=
 =?us-ascii?Q?ISalgnmSKEnwEGG42go/qlI1TfeklwH/Hroq3GgpBJJvW6yHimggFBc8cAdI?=
 =?us-ascii?Q?LZCRvd78F7sakLTtPGV58e/fJglypyCnvUtHUSGNSnV0gn49MrIBmW479LAv?=
 =?us-ascii?Q?65rpfO6nhM857m/d157cQs2gqTFO8E9CesFjkr7I38/k1MbGbADJE4Avg+1R?=
 =?us-ascii?Q?ZdYvqSsGLBwe6r1r6Vt6a2ouSmejPfVU9w777UdwvB6mptEsSXQGPLvg0LbH?=
 =?us-ascii?Q?qhS/PfJ0aS4cG/GiQ2CVNc/adB4yXSk1w83xeC2+dTOHJcXkQ0xMPbpLauJb?=
 =?us-ascii?Q?Jq2ukqf9kZFTs5I+mO9wufFGRZLWkt/CAF67qe0oxPjgtpZYv4MlDDEemtMO?=
 =?us-ascii?Q?TQOmHrmB8k1s01zu4F9R7GocurwzetRYZaATB9qcOKlxYZzqzabXtYBIGa60?=
 =?us-ascii?Q?vJ4dcZ3pghBe7YE0tn/dZlEienpSnBmr2/rS1XjYkGEcej7v95qQ/GI0W4KB?=
 =?us-ascii?Q?dQJPriFVY9FcFbIPJRvXT1cKwqUtJaX8na0mxAkNLRy90LT8I5w4pXrgw53t?=
 =?us-ascii?Q?b35mNBs91mvBvqg9RSLMz5kG72VSDEgLJD1kFAzGgagBqz+F81nEOCeD4uCE?=
 =?us-ascii?Q?e0XNHGJ2hN0ACxHKs8Hp2ucJ7GDfG/h6vekNsxZJIQ1ZVbcHPH0Qwd+FK3OA?=
 =?us-ascii?Q?e9rtq9d7UCNysIKJKQSQIHb2V9BqCKOsq+KFEMXC6u0IG7zAVV/2tp4ZaKJS?=
 =?us-ascii?Q?ptU7FbBDQyTbCuTBUZsfqbjzTqGPuP8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fa33a6-cb19-41d6-c2ec-08df09dcbf3e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 16:59:41.7538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kf9Z+b1pI9NtwsL1UCN7qVQl/QCrpbcFo2clhf3OO50CQuq1IDTN1MeivVfr8KPoJazIzlt8W6SvVAEHUsDhNZnp6Snf1NXprB4XU9kqLt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR03MB989573

On Agilex7 and Stratix10 SoCs, secondary CPUs must be offlined before
a warm reboot to ensure a clean PSCI state. Agilex5 warm reset is a
SDM-owned HPS reset that holds secondaries in the new reset-release until
ATF releases them, so the secondary cores dont have to be put offline
first. Register a reboot notifier that calls remove_cpu() on each
secondary CPU when SYS_RESTART is triggered in REBOOT_WARM mode.

A snapshot of cpu_online_mask is taken before the loop since remove_cpu()
modifies the mask as CPUs go down. CPU 0 is excluded as it is typically
not hotpluggable. Failures are logged and the loop continues so the
reboot is not blocked by a single CPU that refuses to offline.
The of_device_id table carries a per-compatible pdata flag to enable the
notifier only on platforms that need it; Agilex5 leaves the flag unset.

The notifier is unregistered at the start of remove(), before async
channel teardown, to prevent a reboot notification from racing with
driver shutdown.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
changelog:
v2 -> v3:
- Use ctrl in psci_offline_secondary_cpus() via dev_err(ctrl->dev, ...)
  instead of pr_err(). The controller pointer was unused; this both
  consumes it and attributes the failure to the svc device.
- Keep of_device_id.data / stratix10_svc_pdata rather than dropping it
  because both intel,stratix10-svc and intel,agilex-svc happen to share
  the same notifier path. A separate patch adds intel,agilex5-svc without
  .data so Agilex5 does not run this sequence. Agilex5 warm reset is an
  SDM-owned HPS reset (REBOOT_HPS) that holds secondaries in the
  reset-release / P-channel block until ATF CPURSTRELEASE; Linux must
  not PSCI-offline them first.

v1 -> v2:
- Drop workqueue fan-out: remove_cpu() serialises on device_hotplug_lock
  internally so concurrent workers provided no parallelism. Replace with
  a single sequential loop over a cpumask snapshot.
- Fix CPU identity bug: get_cpu()/put_cpu() did not prevent task migration
  and the notifier can run on any CPU before migrate_to_reboot_cpu().
  Exclude CPU 0 (typically not hotpluggable) and offline everything else.
- Fix pre-count race: the two-loop atomic pre-count had a window where a
  concurrent hotplug event could cause dec_and_test() to fire prematurely.
  Eliminated entirely along with the completion and timeout.
- Replace of_device_is_compatible() checks with a stratix10_svc_pdata
  struct carried in of_device_id.data, retrieved via of_device_get_match_data().
- Move psci_cpu_off_teardown() to the top of stratix10_svc_drv_remove(),
  before async channel teardown, to close the race where a warm-reboot
  notification could fire while the driver is being dismantled.

---
 drivers/firmware/stratix10-svc.c | 88 ++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index f8c2da207cb4..722d478b57ac 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -24,6 +24,10 @@
 #include <linux/firmware/intel/stratix10-smc.h>
 #include <linux/firmware/intel/stratix10-svc-client.h>
 #include <linux/types.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/of_device.h>
+#include <linux/reboot.h>
 
 /**
  * SVC_NUM_DATA_IN_FIFO - number of struct stratix10_svc_data in the FIFO
@@ -97,6 +101,14 @@
 #define STRATIX10_GET_SDM_STATUS_CODE(status) \
 	(FIELD_GET(STRATIX10_SDM_STATUS_MASK, status))
 
+struct stratix10_svc_pdata {
+	bool needs_psci_cpu_off;
+};
+
+static const struct stratix10_svc_pdata psci_cpu_off_pdata = {
+	.needs_psci_cpu_off = true,
+};
+
 typedef void (svc_invoke_fn)(unsigned long, unsigned long, unsigned long,
 			     unsigned long, unsigned long, unsigned long,
 			     unsigned long, unsigned long,
@@ -283,6 +295,7 @@ struct stratix10_svc_chan {
  * @svc: manages the list of client svc drivers
  * @sdm_lock: only allows a single command single response to SDM
  * @actrl: async control structure
+ * @psci_reboot_nb: reboot notifier for PSCI secondary CPU offlining
  * @chans: array of service channels
  *
  * This struct is used to create communication channels for service clients, to
@@ -299,6 +312,7 @@ struct stratix10_svc_controller {
 	struct stratix10_svc *svc;
 	struct mutex sdm_lock;
 	struct stratix10_async_ctrl actrl;
+	struct notifier_block psci_reboot_nb;
 	struct stratix10_svc_chan chans[] __counted_by(num_chans);
 };
 
@@ -1999,9 +2013,60 @@ void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 }
 EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
 
+static void psci_offline_secondary_cpus(struct stratix10_svc_controller *ctrl)
+{
+	cpumask_var_t mask;
+	int cpu, ret;
+
+	if (!alloc_cpumask_var(&mask, GFP_KERNEL))
+		return;
+
+	/*
+	 * Snapshot cpu_online_mask before the loop; remove_cpu() modifies it
+	 * as each CPU is brought down. Always preserve CPU 0 (boot CPU) to
+	 * run the reboot.
+	 */
+	cpumask_copy(mask, cpu_online_mask);
+	cpumask_clear_cpu(0, mask);
+
+	/*
+	 * Offlining is best-effort: if a CPU refuses to go down we log the
+	 * error and continue so the remaining secondaries are still attempted
+	 * and the warm reboot can proceed.
+	 */
+	for_each_cpu(cpu, mask) {
+		ret = remove_cpu(cpu);
+		if (ret)
+			dev_err(ctrl->dev,
+				"psci_cpu_off: failed to offline CPU%d: %d\n",
+				cpu, ret);
+	}
+
+	free_cpumask_var(mask);
+}
+
+static int psci_cpu_off_reboot_notifier(struct notifier_block *nb,
+					unsigned long action, void *data)
+{
+	struct stratix10_svc_controller *ctrl =
+		container_of(nb, struct stratix10_svc_controller, psci_reboot_nb);
+
+	if (reboot_mode != REBOOT_WARM)
+		return NOTIFY_DONE;
+
+	if (action == SYS_RESTART)
+		psci_offline_secondary_cpus(ctrl);
+
+	return NOTIFY_OK;
+}
+
+static void psci_cpu_off_teardown(struct stratix10_svc_controller *ctrl)
+{
+	unregister_reboot_notifier(&ctrl->psci_reboot_nb);
+}
+
 static const struct of_device_id stratix10_svc_drv_match[] = {
-	{.compatible = "intel,stratix10-svc"},
-	{.compatible = "intel,agilex-svc"},
+	{ .compatible = "intel,stratix10-svc", .data = &psci_cpu_off_pdata },
+	{ .compatible = "intel,agilex-svc",    .data = &psci_cpu_off_pdata },
 	{},
 };
 
@@ -2019,6 +2084,7 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	struct gen_pool *genpool;
 	struct stratix10_svc_sh_memory *sh_memory;
 	struct stratix10_svc *svc = NULL;
+	const struct stratix10_svc_pdata *pdata = of_device_get_match_data(dev);
 
 	svc_invoke_fn *invoke_fn;
 	size_t fifo_size;
@@ -2058,13 +2124,25 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&controller->node);
 	init_completion(&controller->complete_status);
 
+	if (pdata && pdata->needs_psci_cpu_off) {
+		controller->psci_reboot_nb.notifier_call =
+			psci_cpu_off_reboot_notifier;
+		controller->psci_reboot_nb.priority = INT_MAX;
+
+		ret = register_reboot_notifier(&controller->psci_reboot_nb);
+		if (ret) {
+			dev_err(dev, "failed to register reboot notifier: %d\n", ret);
+			goto err_destroy_pool;
+		}
+	}
+
 	ret = stratix10_svc_async_init(controller);
 	if (ret == -EOPNOTSUPP) {
 		dev_info(dev, "Intel Service Layer Driver Initialized (sync-only mode)\n");
 	} else if (ret) {
 		dev_dbg(dev, "Intel Service Layer Driver: Error on stratix10_svc_async_init %d\n",
 			ret);
-		goto err_destroy_pool;
+		goto err_free_notifier;
 	} else {
 		dev_info(dev, "Intel Service Layer Driver Initialized\n");
 	}
@@ -2150,6 +2228,8 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	while (i--)
 		kfifo_free(&controller->chans[i].svc_fifo);
 	stratix10_svc_async_exit(controller);
+err_free_notifier:
+	psci_cpu_off_teardown(controller);
 err_destroy_pool:
 	gen_pool_destroy(genpool);
 
@@ -2166,6 +2246,8 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
 	if (svc->stratix10_svc_hwmon)
 		platform_device_unregister(svc->stratix10_svc_hwmon);
 
+	psci_cpu_off_teardown(ctrl);
+
 	stratix10_svc_async_exit(ctrl);
 
 	of_platform_depopulate(ctrl->dev);
-- 
2.49.GIT

