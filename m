Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47AD48A2BC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395320; cv=none; b=rMMPu9xnYom1l/NX+5JdviGjzPQKzo9p6NKV0xJGJ1CIM7coEEgmQRU14LmiN/vl8Wd3DZuIneYuKZJIV5IYdHMkbZLNpchkxl4cETExCydMxRpoXhJ5q9AaVRb/DEORkQ8nO8aesiijeCli3RpCS9QOcyCiWvreUXSSpFGf4cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395320; c=relaxed/simple;
	bh=jzSU90tPxf+sKa0Pm2jqv+PbYsJlPIY4mJ8YnghTTek=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=FBSxIKdxtAIq/s/LLOtdBwzC5IUxnfTr8bvSr099zDH4N5L/NpYYVwsEGd/gZLOM8BwdET25KuUN3BKrUqCrbB49M+YwOWmPhQWcVNWlu3fXqSUOYK22BezRuP5RXVkq2inQUZR5LjDXIVhh56pFgyepEDmBcVkRMJHvje91dl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=UTPf8mdj; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="UTPf8mdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395314; bh=oDSI8eWMRkE1vqgSZCg4rrWcU0C3IgHnfIdcwdzy/Ds=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=UTPf8mdj8xtDp5IySVcaCxA5WYbChw+8liXRZAzd/+lQfvhUHBiqgwyumokmUh6+B
	 oOIbTl98FWHxvZlO28DEBsbPlsvnr5cQ/MhiNmE+t5FLNxHvQYKB0CWH0JdvrRaJ7u
	 DhEBKNjIdT2Z5kIBLUdnDsxgrikbCt0oCvQpQI5I=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395310t4123gcia
Message-ID: <tencent_2F094844B05B3129D619AB63BD959FB4AE07@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuSj1wGuaxjrHhwke+aYLgBcDLIa6inzJ/Qt87v4fEb6DIhQd8Fj
	 tYKo58NiCPSiWeMtCSWnH/JKuuEK0xBoUpaiyESsiGrnXjSTMA5j2u0iQ/NbOZWU4iMSbr0701KB
	 u1P2BVxEGKpsZUDL3ACv8BHYPWeZ49oXYQBcH6xXYclEDuSZuLvcfR06DimddjTwmvoXRm9a8us3
	 F36h79ln/pRgMiEAKtLH2WWztDybf26tpAcapYKM4Gakbz+8YAyjYOWtEbdLB3QyNClB54+LGSz0
	 GLn2bEbRS3sUe1Aym38pbFBgl8TnoaAifc4aTEWnuLRcBc3WaiMDjQDxS1FoX50iJkEEIKxMtYBN
	 1eLtXqPtHNocUrSSKA4qnqTf3skg7AFpW8K1B3RfB8ej03xzOU0hgoI/YMSYH8sS8KO6Jnf77n1v
	 uphuNWXNyCjvGO6C65zDmLHBUd3huhakFfrkuU3J91X4s3BVj/bCQqK72ms31I7/yBelzZCeL75W
	 8EVt5aUYjBhbGzAHtff4WThF3WlyNWNtJcw4xzHzpSNdA2Fdx0//WV78lxhCr5OvI8nLY/PS5yWw
	 nasfB4RdhYXi/6qdJGze+J49QuyB0cMTwLdW6fkn64/Md4C9h5YF2+tHzsaUkE40gMjGZ+OtS3MY
	 D//11evjyHKBpfIMeKHhy6kLX7HvcT3b48EVcI9nw3p2+4vi15g2DNCGk4Iz7u5GNkIqOahjC/UH
	 jyClsXG6wvyKXzSuSJAlr7q9ufuWeZeMg05rkCEflBanYQZCxWAosskuDr6JatO98VTlVQFxSq7j
	 3ufflWbwtjpTHxgu7ZVg73tahnIitwjmZrzt6s5+WJeSfW5vKi+M9QEgHxqwjqikaHjQDKMHY/X7
	 f4O41spj1VqndTC6FTljstUdbd30gmOZ57UG2BrMw+AT0facBQtom88k/c8bB3dVCAG04pefEpm4
	 NOwYwKefpk9L9Wl0EFClsB+IGCyKvuWoBeULX73ksPnc+8O2lwyYBh2l/j0zaHa/t6ZQlpC9JYKt
	 cayIPFFHzQVCOTZ8sGe4pwiBN5R7Jin8muz6UmaF7wP5Kwbt6Brt1V5n4+T+oY5o+FT2yvWjZx8u
	 zJmu8T
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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
Subject: [PATCH v10 09/15] arm_mpam: Add a helper to check a PARTID is in a CLOSID
Date: Mon, 19 Oct 2026 15:33:35 +0800
X-OQ-MSGID: <20261019073453.2142856-10-2118537295@qq.com>
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

match_closid() open codes the CDP special case that turns the task
PARTID into the CLOSID it belongs to. Move it into
resctrl_partid_in_closid(), so the question "does this PARTID belong to
this control group" is answered in one place.

No functional change.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index cf5db752aa35..332388a092ce 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -353,15 +353,21 @@ void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 	mpam_set_task_partid_pmg(tsk, partid_d, partid_i, pmg_d, pmg_i);
 }
 
+/* Does the request PARTID belong to this control group? */
+static bool resctrl_partid_in_closid(u16 partid, u32 closid)
+{
+	if (cdp_enabled)
+		partid >>= 1;
+
+	return partid == closid;
+}
+
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
 {
 	u64 regval = mpam_get_regval(tsk);
-	u32 tsk_closid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
-
-	if (cdp_enabled)
-		tsk_closid >>= 1;
+	u32 tsk_partid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
 
-	return tsk_closid == closid;
+	return resctrl_partid_in_closid(tsk_partid, closid);
 }
 
 /* The task's pmg is not unique, the partid must be considered too */
-- 
2.43.0

