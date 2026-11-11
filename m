Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437350;
	b=CKiE2Zovjms4W2AFHq6I2GiEtSgKEfIbwhhhuHY0mfup+7hq5Vyj88wRCOtB5eZQibYb
	 XVu3C+ae5ow+VPnUkfZGjodHIePlsAoK/1y9WhZtabL8j9fik4BnLAN3Pnm26rmM+oz+O
	 lASkwS/pECd9aVplAZcBcqnebgvuLXQEiesEZ71NjHzZI/RI4gieeq8sXZCAFuAyr7Wjs
	 e7TQ+EDeG2hnrJaBOGGdKfGaglZHA5hfdyBYCMgvGGuiBL6oop355T0tVqQn4RxCZfzXJ
	 OyacwpSenpVKWHZco9Kst+dQs6ooSVgzo/MScc9L8U2cO5nV8K5j8JtkwjCd45KxBZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437350;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2BUOGcrh2S97il4Ttrd7WSFGfZ/SB2ZyhbaF0FuMYg0=;
	b=JZ/FbJ7H0/nAllFqfOimVZtG9o9BVve3vxeiKKxRk6q6eAdeLfI7t5CEq6kKYd3OhCBW
	 +jlt2H1Qg3jhRrjq9YGpUL8OGR1gE/CRuu+/ilUJKKYueS0z04VDZ3yh3r4znO8oJToRO
	 F4L+hrXkR9WI6AnJqswMBhm6Ik5b1mnYB5rn/yRTqXHcMg9uCycOTgDDaqKqVzsPW8dYy
	 F9n53Ln1pEziNI5CxXSUMmuWBgnhFylhcFtZc3Z7jYFWTrIst9dbDwNJFGmQv1dAeYPBM
	 Kz3Iu/40b/n4tueKagtTuZNaxZk2NcOQuyQ/u2s5ypBoqzi6l0/K8j8D+pHwC/INEUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=K+5tY+xW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.6
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010006.outbound.protection.outlook.com [40.93.198.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5226606A897;
	Wed, 11 Nov 2026 22:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5226606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=K+5tY+xW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=od4pSscMDiC7q2SE+BUP9lvvdNTEDIWNWYL8B81T3BVzRJskZav/NG+jxOEOcL5TQzZXV6XiygcVww/A+iT1xIBfCtpdRgLXtGY7tm8oEnUKtlmUz2RzRx5CqixKTZxtBvZS6Ej80QQNVT/irwqR4rQlQbY21X2mVFLt/RUAs8li5ULW1JD2cF3gCN07vhu2RM5WbOHdUPle88qqol7l6XYzLWfebCVPQK4GvLsba8wu+hqDrGeoFWE5F/e69SvfbK/eFQhnsbkNcf9nmm7Rodd/VSIPjdzHU8Briz5I4iYpRZSg8BKhlk0QKMu+i06A/t58PuYRgJv4gzu3RM+Ptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BUOGcrh2S97il4Ttrd7WSFGfZ/SB2ZyhbaF0FuMYg0=;
 b=MmWRudPtbUqMOoKQYqkMsFu5lIpRrjB4w0i5DcOPvQV8/0V3XqPrPLHVyzMCpxSpbk6FiOegCQ0RxQFTkMOenmM6cPwL0bSB7PEkqahdb96IR9oaJL7y0yY3OAw5fEcrn0kDunTKMPOchz6cE+bdyjUuyz4Zyyr9Gp6efYKGUqBzX9gMtcFjXoa5fjgHH9GWhem7rBfdo0oq0k6KS7fRaYP9WSfBQNRmzBVighAh6PgMEGe0gZyHZVhAFA9mdx/OyJXBQT8422PPfnaMPicacZ8Lom+1urZuHTh2TEzHAvYt890Y0vSnuSCoEsPup7mk1XQJ4UkXWBFmOEE/gCGeXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BUOGcrh2S97il4Ttrd7WSFGfZ/SB2ZyhbaF0FuMYg0=;
 b=K+5tY+xW5SqPW8DavTMqvNVVspzhVbbe9WhzKxAjqpipCkYuh0yfEop9z/FdSGOzC66Kt1s7FdxaCLluSlYtb1USDQKaB0vyxBTcvXb+JvW4dEX3BDFpoo6BfptYOZP1AAPU13PsqzLy9SveRBeJl1PVNzzd7mxQgcdduViVusg=
Received: from MW4PR04CA0234.namprd04.prod.outlook.com (2603:10b6:303:87::29)
 by PH8PR12MB999298.namprd12.prod.outlook.com (2603:10b6:510:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 22:47:03 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::5) by MW4PR04CA0234.outlook.office365.com
 (2603:10b6:303:87::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 22:47:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:47:02 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:47:01 -0600
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <x86@kernel.org>, <fustini@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <jlayton@kernel.org>, <seanjc@google.com>,
	<ewanhai-oc@zhaoxin.com>, <binbin.wu@linux.intel.com>, <nikunj@amd.com>,
	<ashish.kalra@amd.com>, <peterz@infradead.org>, <superm1@kernel.org>,
	<thomas.lendacky@amd.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <ricardo.neri-calderon@linux.intel.com>,
	<darwi@linutronix.de>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 16/19] fs/resctrl: Reject mode changes for groups backing kernel mode
Date: Wed, 11 Nov 2026 16:44:09 -0600
Message-ID: <582409f73650a18edc594c2c40e14b404b0d25b8.1794437052.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794437052.git.babu.moger@amd.com>
References: <cover.1794437052.git.babu.moger@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|PH8PR12MB999298:EE_
X-MS-Office365-Filtering-Correlation-Id: e3733dac-75f7-42cc-b4a0-08df4045b426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|23010399003|376014|22082099003|18002099003|6133799003|261009223027099003|13003099007|260925022911599003|11063799006|56012099006|260925021911599003|261028144727099003|261021121427099003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|260925021311599003|10067099003;
X-Microsoft-Antispam-Message-Info:
	w5dJjv9EfHQzii+TX6UibDNAdmliMAFoDkQnuZBv21IGnQWH3hMST+Sv6GfmS7kWagj8XOKEw/4P22hh8zazMOdcQlTSEbfnp2avg43hdinJUaW22P8CzCwTiaeFqEXSq1S8XM8gfkPjTW67/TSv4lbRq7cg7ZL2exmXIhJ50d6FgywaAEUv5h23jD481wUNKCBm52pvyUR6uQhavCldPIFv5mn5TTRiBIPPabEZtgkAIzLC7iURDzcU5f7Ae7qsCBZc8MGg+9/1RuZnyA4yyv+IB2cOTsdnSh0E1nGHc1Jzdiva0gJqEhCJxgV0O0+Qp8MctfZnSjJ6Hk3pHdsNaHIkRgBcOIBnGqzf8deUobH9L5di0tuPvmI64R8jdV5K/n8oH2X0+iDyTx1pTpqxSYTcDkYNkurOwpS1DtY0mJltLyGnu93WTFXx950qOOcMwvFaIgdvx7z26vssVzDAQM7reaknMcP333mcTGxeCGHlZjEg3kwDaFh/7VoCHp9N8VKXXFMPnl9O2OJpQhbzh/2Wb3zy4AM2Su1fNghEfXKYhenPM1ipg7nZB1sE29zuIAW2pnK3RUFP0dNwDxcRi+hXc9kMr39C8fKJG46ee94MEEso3DEGSetnwWi/WNgOZSq7acyIfEsiwNnzntu0CQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(13003099007)(260925022911599003)(11063799006)(56012099006)(260925021911599003)(261028144727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(260925021311599003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uVNoLKjKHnuYm0CYhmFAZlG4AkK3tUP2ZowAKW4EySK0j/fD5SPZAIERJWRy7PWEh5X/+PIYQ6h9wbSnoBODg7Oq4mA3CMPhALsKsdb9GDyUeBYGSKa+xBGMWU8kEoEhrzA/l2Zx2ECdimU1kIBveVKzQ09Hjpd9Jk8R8c0M9kurhAkZt1wPirCstudaanPhl7FiqgiD/5NBIFKuTA8epeyK1n1xo1iQy9Rj/UIz5Gz2gm++g7fAJz1k4IE3PFqDu5E3F3YxMmSFQm3O6Y6bKV+y+RkfK8uCCn9/IJEObwWQpe4ZA/K8E25zPc2tuk3ht9vOw/FghsSwslIfz5qtD6+FNiqbS0vTX1hxI4YPmPiQPSN0pkNU/Q/4j8ZU3jnzqGsQlo0MJ7B5+r3cRHoNCsFa49T+LXFxMxwtKH0I5q4XqzvM0ZV40WjwrZ9okDjK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:47:02.8003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3733dac-75f7-42cc-b4a0-08df4045b426
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999298

The RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode uses the CLOSID and/or
RMID of a backing group when transitioning from user mode to kernel
mode. Since the CLOSID and RMID are shared with the group's tasks, the
backing group must remain shareable while kernel mode is active.

Reject mode changes for a group backing the active kernel mode and for
the parent of a backing monitor group.

Also reject reparenting a backing monitor group, as it would change the
monitor group's parent and implicitly modify the active kernel mode
configuration.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Changelog update.
    Moved the patch after the kernel_mode modify interface.
    Added code comments to justify reparenting.

v6: New patch to fix sashiko feedback.
    https://sashiko.dev/#/patchset/cover.1787772750.git.babu.moger%40amd.com
---
 fs/resctrl/rdtgroup.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 872755532fb4..1ad169e714a4 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1994,6 +1994,27 @@ static bool rdtgroup_mode_test_exclusive(struct rdtgroup *rdtgrp)
 	return true;
 }
 
+/* True when @rdtgrp or one of its monitor groups backs the kernel mode. */
+static bool rdtgroup_has_kmode_global(struct rdtgroup *rdtgrp)
+{
+	struct rdtgroup *child;
+
+	if (!resctrl_kmode.rdtgrp)
+		return false;
+
+	if (resctrl_kmode.rdtgrp == rdtgrp)
+		return true;
+
+	if (rdtgrp->type != RDTCTRL_GROUP)
+		return false;
+
+	list_for_each_entry(child, &rdtgrp->mon.crdtgrp_list, mon.crdtgrp_list)
+		if (child == resctrl_kmode.rdtgrp)
+			return true;
+
+	return false;
+}
+
 /*
  * rdtgroup_mode_write - Modify the resource group's mode
  */
@@ -2034,6 +2055,12 @@ static ssize_t rdtgroup_mode_write(struct kernfs_open_file *of,
 		goto out;
 	}
 
+	if (rdtgroup_has_kmode_global(rdtgrp)) {
+		rdt_last_cmd_puts("Cannot change mode for kernel mode backing group\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (!strcmp(buf, "shareable")) {
 		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
 			ret = rdtgroup_locksetup_exit(rdtgrp);
@@ -4922,6 +4949,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
 		goto out;
 	}
 
+	/*
+	 * Changing the parent of a group backing the active kernel mode changes
+	 * the effective CLOSID and/or RMID configuration applied to kernel work.
+	 * Reject such moves and require kernel mode to be reconfigured explicitly
+	 * instead.
+	 */
+	if (rdtgrp == resctrl_kmode.rdtgrp &&
+	    rdtgrp->mon.parent != new_prdtgrp) {
+		rdt_last_cmd_puts("Cannot move a group that backs kernel mode\n");
+		ret = -EPERM;
+		goto out;
+	}
+
 	/*
 	 * Allocate the cpumask for use in mongrp_reparent() to avoid the
 	 * possibility of failing to allocate it after kernfs_rename() has
-- 
2.43.0

