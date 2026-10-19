Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2129C48DB57
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395319; cv=none; b=HxfqhkT2iJgUYZO/qR2XmzI0FaAALY19GKd7b2pAZouRYt27d6B1O4R1qL13DGwGBY6tqkvzhBvVXj9qYVYR25W3ZXB7tX0LY4iiGfEW78Yf3XiwkX7jnyZBrr0gi6sZEIIEs+gqTraiWUvg+C2Z7++1gMH2uAIU8rx7xjJQ/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395319; c=relaxed/simple;
	bh=dwYBgeWbq6SpFeFJvDdsfZDIS/eVQYCfzZcDpzaxLxQ=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=UIacwsq0wPpPVx4lUW5N3GFbMdZZ4cZrHOUmUkDN7IJmx3zzUjc7YiHwsm420cTOPRr5TVXImzxGlZdRAUHl/aYLrR+vFSq75GQxNGTyZeS8uHCPcdsuR9RbXORQ9k3ErjNNi6ek0n2/57N2pIiPRBQcwOyL1wm1zNXAj+FAhx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=jmC70jGt; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="jmC70jGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395307; bh=XXp5ZEW2LLjJA2Ef8AoDgnebH7MCTVayYYa5vZNEu18=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=jmC70jGtJ/Oi45y3jSyzEH+coyPMlOk6RPCVVDBY+o3nVL4dpQzUlRIAUoYgjtHSv
	 IJnlQFvJoehNX5PEz82ZWEPPH8a7kcKQMZmIXPN8fDjpdfFTi3YxILzDs4xwqayE1m
	 SSNjk4ir65NhEGLULjCiSqy5r1yglN0wLNh7U0ec=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395304tnzjz1wlr
Message-ID: <tencent_B1256E89A422661A8E6F5608D2B627C81009@qq.com>
X-QQ-XMAILINFO: NnIX2CK8LSsJMVRJYWUGyP07qneDJNgrkGhK80Cz8eZRWUU3cm3lt4YRt6U2Fn
	 wTIzMJmyG9CbB2ShWCyBmzaccfAbOGunhbR/JiY5FMxvLluxLr+fzE2J9dHOue8/tVMQUYdWxKWR
	 pvru7grxG04nLMVjVDMo0cV1M0A3NmBj3+X9J9V4ozdPXvgSP0ROiRYdj9a1VKjgPGPhAotbOhTa
	 D0R6EcjuZgKIU15qv7DPBj+gmfpJjaS0QV3RVgSm0FwnjF3X5tHoIYsg3ChKORg79hcPTAXOGGZ9
	 cci5hfbc4SZiBS0kYBKOH4/n4l5t7UF1xDkBkncPNChDr7nmVmGQ0R2ivcqLN9j9fXuhKyCW87w8
	 mwFYB6EHnIsuL5Mx5W1Z1HHU/AffYfScexZhric+X6ndazK/2MSpI0DbTp4ru9xMLtaCfSw90UBK
	 0shTQ8B3EJAhp1P0dXny1SdGGm9HOcJLaMR8xSagWLGtD077W5V+BhcSih+FwmOADKSkwEh6vtKV
	 yXeDMm1cb/8qy+MPqLNDzGUWQLU2odgWJpx/fQur6zxWJnR3+HBR7Hf6+G5KMHPv7ZH4kYN9EkMf
	 wgvb1IahvMfTnWATleiJnwEw/VfZMTXI/6+OojIel2/2SzfPAlc8U7VCKw+feTOZ6dcpcFcs1JxV
	 gyddp6Yj5izMBBCzJGK5DMZVV+LBbFxcY1fF8pTttQWzhkrnUeIOzErVDgSYTq3OGNEyidqNBfO6
	 g5yga4YOLqiUkDQripRAxcJATWNxZfT3MfGnmuLXVqxm03DdP+QWB1QMi0W96EevqJNB8RGe6w/f
	 2KpRblyuJ9HuwbUIPEwabw5Nqd3aEjiMA8a48XzIoClVQPB6VWUZJrswM7NUHEG3R4K32gXyLdsH
	 q34M4FHyXw98qJXq/0keYh8RQlc+84P3E46he7ugYCyK0C+sk/M3p24hOlrP5sXS1W9DmeOsNXxk
	 amehGTME8+IiRhnmjRbmjobcGQct0otj14HSxG8/2Qz+lhBLgffOnO7EUCU0JUkXotAEMa2BVuLo
	 NCY4Fv3MbxEj0e1QxKIUzi3DIIG1oKrpRxHzrs0zObcqaT7kocyAmeKbq9+7zHx9rRqt0VEukCuD
	 tCz/M5
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	reinette.chatre@intel.com,
	ruanjinjie@huawei.com,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 05/15] arm_mpam: Don't stall MPAM enable when an MSC fails to probe
Date: Mon, 19 Oct 2026 15:33:31 +0800
X-OQ-MSGID: <20261019073453.2142856-6-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019073453.2142856-1-2118537295@qq.com>
References: <20261019073453.2142856-1-2118537295@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

mpam_msc_drv_probe() registers the discovery cpuhp callbacks only when
the number of successfully probed MSCs reaches fw_num_msc. Every failure
path returns before the counter is incremented, and a failed probe is
final - the driver core does not retry. One failing MSC therefore leaves
the counter below fw_num_msc forever: the discovery callbacks are never
registered, mpam_enable() is never scheduled, and MPAM stays dead
system-wide - the resctrl filesystem is never registered, and no error
message hints at the cause.

An MSC can legitimately fail to probe on an otherwise working system:
firmware may describe MSCs that are not accessible from any possible
CPU, e.g. when the possible CPUs are restricted with nr_cpus=. The MSCs
of the clipped CPUs then fail with "MSC is not accessible from any
CPU!", or their cache resources become unresolvable from PPTT.

Count every completed probe, successful or not. Failed MSCs are not on
mpam_all_msc (either never added, or removed by mpam_msc_drv_remove()),
so the discovery path skips them naturally, and MPAM is enabled for the
surviving devices.

Cc: stable@vger.kernel.org
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Fixes: f04046f2577a5 ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 61cbc75625fa..a44d66a5733d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2120,21 +2120,31 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 	msc = do_mpam_msc_drv_probe(pdev);
 	mutex_unlock(&mpam_list_lock);
 
-	if (IS_ERR(msc))
-		return PTR_ERR(msc);
+	if (IS_ERR(msc)) {
+		err = PTR_ERR(msc);
+		goto out;
+	}
 
 	/* Create RIS entries described by firmware */
 	err = acpi_mpam_parse_resources(msc, plat_data);
-	if (err) {
+	if (err)
 		mpam_msc_drv_remove(pdev);
-		return err;
-	}
-
-	if (atomic_add_return(1, &mpam_num_msc) == fw_num_msc)
+out:
+	/*
+	 * A failed MSC must not prevent MPAM being enabled for the
+	 * surviving devices. Firmware may describe MSCs that are not
+	 * accessible from any possible CPU, e.g. when the possible CPUs
+	 * were restricted by nr_cpus=. The failed device is not
+	 * re-probed, so count it here too: otherwise the counter never
+	 * reaches fw_num_msc, the discovery cpuhp callbacks are never
+	 * registered and mpam_enable() is never scheduled - MPAM stays
+	 * dead system-wide, without any error message.
+	 */
+	if (atomic_inc_return(&mpam_num_msc) == fw_num_msc)
 		mpam_register_cpuhp_callbacks(mpam_discovery_cpu_online, NULL,
 					      "mpam:drv_probe");
 
-	return 0;
+	return err;
 }
 
 static struct platform_driver mpam_msc_driver = {
-- 
2.43.0

