Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2550C5A0AC0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657045; cv=none; b=PyqY+o9G2kmR2tNR0wDoOn/WnuX8DMPrHrNX7qXVqo4i7+UaF+n1+H5q55RU7fr2zj6Jk/4ZkL5wFrIHlqMWhW9hLA55FCSCh0J4Okokw2eXY4gHMvcWEFKbioCljZboV0w+6klUtvb7m8BkLjsF15W3NlMU01aiHrM/zo7ojAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657045; c=relaxed/simple;
	bh=RpO8zOr6jZcL27MkYikOaNk4efDL6B/6X8Hi1ZdtHW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t71tNenU3DU3p6bp6GANkakzmO9VdMxGWW2AwwnvgleUw/p0lIXlVgfWNyp2o7XeC4ARNM9bDUyK8yPSIYrw76XAbkfGtXMPiCip88PWKdYup3A4e+27gHjk6bpne6sUVJFu2ej4ZA0fZwozZsJtFxJbNi3+Fnmj0InBCD+M5Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RX3NAQJ0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RX3NAQJ0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A1C11476;
	Thu, 17 Sep 2026 07:56:40 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B27F83F86F;
	Thu, 17 Sep 2026 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789657004; bh=RpO8zOr6jZcL27MkYikOaNk4efDL6B/6X8Hi1ZdtHW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RX3NAQJ0exD9uuKhKEmGyYyBarHOBOm6jXMVcpW4qKypNCf+oC51ZYTS2oWr9i8mM
	 YhDlcEtzy7C559IwRUVmxfNTHYkAVXzGFCw/0ds4Ll1l/S5LC614axefrxOzgieozW
	 W8QVDlmV9qsvb5VVc9Ouwt2dY9+LgBsUwMEB1mfQ=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 10/12] arm_mpam: Don't loop forever if there is the maximum possible amount of PARTIDs
Date: Thu, 17 Sep 2026 15:56:15 +0100
Message-ID: <20260917145617.2202986-11-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a theoretical platform with the maximum possible number of usable
PARTIDs, 0XFFFF, the loops iterating over PARTID in mpam_reset_ris() and
mpam_reprogram_ris() will never reach their termination condition leading
to a system hang when register the cpu hotplug handlers when MPAM is
enabling.

Fix these loops.

Fixes: f188a36ca241 ("arm_mpam: Reset MSC controls from cpuhp callbacks")
Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
 drivers/resctrl/mpam_devices.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index cdc2d9d19e19..10fc5168699b 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1754,7 +1754,7 @@ static int mpam_save_mbwu_state(void *arg)
  */
 static int mpam_reset_ris(void *arg)
 {
-	u16 partid, partid_max;
+	u16 partid_max;
 	struct mpam_config reset_cfg = {};
 	struct mpam_msc_ris *ris = arg;
 
@@ -1764,7 +1764,7 @@ static int mpam_reset_ris(void *arg)
 	spin_lock(&partid_max_lock);
 	partid_max = mpam_partid_max;
 	spin_unlock(&partid_max_lock);
-	for (partid = 0; partid <= partid_max; partid++)
+	for (u32 partid = 0; partid <= partid_max; partid++)
 		mpam_reprogram_ris_partid(ris, partid, &reset_cfg);
 
 	return 0;
@@ -1811,7 +1811,6 @@ static int __write_config(void *arg)
 
 static void mpam_reprogram_msc(struct mpam_msc *msc)
 {
-	u16 partid;
 	bool reset;
 	struct mpam_config *cfg;
 	struct mpam_msc_ris *ris;
@@ -1835,7 +1834,7 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 		arg.comp = ris->vmsc->comp;
 		arg.ris = ris;
 		reset = true;
-		for (partid = 0; partid <= mpam_partid_max; partid++) {
+		for (u32 partid = 0; partid <= mpam_partid_max; partid++) {
 			cfg = &ris->vmsc->comp->cfg[partid];
 			if (!bitmap_empty(cfg->features, MPAM_FEATURE_LAST))
 				reset = false;
-- 
2.43.0

