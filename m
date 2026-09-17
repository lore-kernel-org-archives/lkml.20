Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F67A59E351
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657027; cv=none; b=WrtvniCEd4jJbm4HZbWnFPE+mVJddVmlh3l1cPhr4mF4cMfqCtzdfx4QtIc6y4BOvP3g6Sr9nPcqnHFKWbx/OY7cyCsQ8opF4gDwdrcLpoj84Ywkle02jIrZl3HWIAncvYfE04wURmnYgFeIi0QWrSsKyjEX4wTlIrbV8d7919Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657027; c=relaxed/simple;
	bh=MGyp/ALeEy8uuqHVHvuEIqk/S0nAwjOKbP8LJumLzqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBxMtLHQwUgGbJ7orFHCZEXFOsL6DEm5EJnD1haEfKvotA18TvmdzGa5wpCEz+EluW66DDssFSmbPEsysEnsxktotWB5JB6vRbZirO0/AudVxk9BviGtpna3NJf4VoNBoPYeigUl+gEuaFzs5R5AguVMaSJT8GbY7QroA0J3s/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QFpRxlaq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QFpRxlaq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5587B1FCD;
	Thu, 17 Sep 2026 07:56:35 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F2443F86F;
	Thu, 17 Sep 2026 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656998; bh=MGyp/ALeEy8uuqHVHvuEIqk/S0nAwjOKbP8LJumLzqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QFpRxlaqHNExmxbF9n3J1atQLgPtiUU4QQzyLYIBvlV8hljnmGqUf4MFwbJT3pde0
	 DCZAf6WR8si/awQJQMxIdFNboJccRLoclMQLPKbF8z3mpBf3OykpFj0192kZU/1TYR
	 uYyf2fz0EjVfoM4AUKuWW5qM6JpJ+6ReH2VfPVpY=
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
Subject: [PATCH v2 07/12] arm_mpam: Initialize all of struct mon_read in mpam_restore_mbwu_state()
Date: Thu, 17 Sep 2026 15:56:12 +0100
Message-ID: <20260917145617.2202986-8-ben.horgan@arm.com>
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

m->err and *m->val may be read before initialization in __ris_msmon_read()
when called from mpam_restore_mbwu_state().

Initialize the whole struct mon_read in mpam_restore_mbwu_state() and fix
the spelling of mbwu in the name.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since v1:

Set val to 0 (Lee)
Use existing mbwu_arg variable
---
 drivers/resctrl/mpam_devices.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 62562ce2f9aa..cdc2d9d19e19 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1655,7 +1655,7 @@ static int mpam_restore_mbwu_state(void *_ris)
 {
 	int i;
 	u64 val;
-	struct mon_read mwbu_arg;
+	struct mon_read mbwu_arg;
 	struct mpam_msc_ris *ris = _ris;
 	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = ris->vmsc->msc;
@@ -1672,14 +1672,17 @@ static int mpam_restore_mbwu_state(void *_ris)
 			continue;
 		}
 
-		mwbu_arg.ris = ris;
-		mwbu_arg.ctx = &mbwu_state->cfg;
-		mwbu_arg.type = mpam_msmon_choose_counter(class);
-		mwbu_arg.val = &val;
+		val = 0;
+		mbwu_arg = (struct mon_read) {
+			.ris = ris,
+			.ctx = &mbwu_state->cfg,
+			.type = mpam_msmon_choose_counter(class),
+			.val = &val,
+		};
 
 		mbwu_state->reset_on_next_read = true;
 
-		__ris_msmon_read_locked(&mwbu_arg);
+		__ris_msmon_read_locked(&mbwu_arg);
 
 		mpam_mon_sel_unlock(msc);
 	}
-- 
2.43.0

