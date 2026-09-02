Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB0A49C4D7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359886; cv=none; b=hdE2TubtvubK/mtAXGa/DV7l4sp/3pykF8aZQUIDfxV7uTgPo3AECyqi1FbNOOW0GdyNwtLeARhKBw9XKkkL8op7LQO06t0doXUfmhUlJW/LdzO+20bTpc7EPz5kZIQD0hMI5w7M4d/CvsW0u5MQKyyQjXykVigm7BFf9Xp+7Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359886; c=relaxed/simple;
	bh=4kIIOKwfvEzTXQVgo2KNecr6WiHLfmpMtBCTGPwAT5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MTxzc3BIe6qOW8k9VHsg8H+QY2Fuaigq7UndYzNssilIaVfyclDiWriWEZwcVBE8GU0ywPRj0KjkdPrQsZg6G/xuSU2zrqWTn2UieK+0KJu6y3+srVnOZj4gXi1AMFZ/cw4nJfBZ8MTh2TtmeP8nbbeCrv//mhTiT7k0RgKI2s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lYI/BE3g; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lYI/BE3g"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7277D165C;
	Wed,  2 Sep 2026 07:37:59 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A0693F882;
	Wed,  2 Sep 2026 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788359883; bh=4kIIOKwfvEzTXQVgo2KNecr6WiHLfmpMtBCTGPwAT5s=;
	h=From:To:Cc:Subject:Date:From;
	b=lYI/BE3g3q4vYgmH00Xx4JrOJ6qsedssB1fSmKr0MfomQP5RCVSXM5GMCaFb9wLmy
	 KnXBgdCMno5q3RUT7NHVogsZ7jgiQ8QAnfrRgwkhDrmt+H0x7WtGh+J7qV2vCViTn7
	 0QycnNyC5M0Yn9H/LICY6iNylLQJs0FPGe09yoHk=
From: Andre Przywara <andre.przywara@arm.com>
To: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Tony Luck <tony.luck@intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Yin Li <yin.li@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm_mpam: resctrl: Catch and propagate error from get_cpu_cacheinfo_id()
Date: Wed,  2 Sep 2026 16:37:57 +0200
Message-ID: <20260902143757.3469690-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_cpu_cacheinfo_id() can fail, in which case it returns a negative
error value.

Check the returned value for this error condition, before passing the
value on to other code, which would hide the negative number in some high
value in the unsigned type.

Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953ab..a5e661eff86d7 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
 /* Find the L3 cache that has affinity with this CPU */
 static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
 {
-	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
+	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
+
+	if (cache_id < 0)
+		return -ENOENT;
 
 	lockdep_assert_cpus_held();
 
-- 
2.43.0

