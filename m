Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED1F490BFC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395325; cv=none; b=Zk/+Qb5fQDRtb9pLkpj8OBVMYaDKOvFype/TXE+0fMwIDCyPt3Os3xs9HR0A1fEcKrUz5oi0AcMJJMDng46vy2VjlvNhDmM1gE99DkbGwzDULAVVoz4a93d161EgBr/lrmXgjLV9vYfb8QxQp5i7YjZAT1a4VPoIlp0v1d9zWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395325; c=relaxed/simple;
	bh=f35/t7zjADQ/MZTeMESmOfTnmHUcK/tl/nrSrFtJu6s=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pnL6WAEK0xq7auemTwyWEk5AR3+QJbEoMb6NHj7bwqY5uVRfjX+iIKaAS9Cwlij1UUAoNlEimdL49sF2ws8CDKp7Fr3hVrtizMN9LknGjoMaukcbZ/0dIAtcikZ64gg8Ul1QvCAA2Vwncgj7ropNxXPVs7XBjD8LQ928BrDXPcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=LYDcedOQ; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="LYDcedOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395319; bh=HqJwVqzmYltEuhXENlX6nwBG8T60ZnZi4h9+aoPtYdw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LYDcedOQhLK20WH3FcRi/hfsbPkGTTPjYh1MjV7VU44zmx+4tXGaP5uqSlCmRtNi+
	 fQNre462RsYqfodk1Xwt0+itYbPnJFMU4wOZRQCpm7koW1U1GgRt6R3YGSpvhbTD5Y
	 xHwNovtnmZdRrrNLnb5wJEsxJdpFMuyVgciwzbVo=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395315t8p933xn3
Message-ID: <tencent_8162C8AD8CD4DF0CD931E28A6C1AEA840406@qq.com>
X-QQ-XMAILINFO: Mxl1cXmTLcf7ARWfuBJMP8612+O2aQatBUuTLZ7vY2Dck1Mso3Heoj35Qnoj/y
	 xOrVsr8tM9AcRHcZ4+ucbYTW9hPUjPlF3OPTmi8nWh9Rs587Dv2i4a9Nq3G9262tIlr5ubu13Vgy
	 itv3jd7E7VXk2LMBiqjquoL5eFebWatCQ+5T52P03kh1NjyhnopM9PXluHelCffz/zM46URPyaRj
	 UdoeUg0Tp0dSu4Md/jAww1wI6o5JGrSte9CuCcVbp+RLQgXId5+9MrBTGpdn5+gvprSq190ay7ey
	 jsRh/tqdIDDuHHEiAKNCzh+klPHP5xi9jE2sftKCHGZEBVwDrklydwbyuKOcG22vGqapikVwc3y4
	 sgh4VKO63MJmfIAljh3bSAk4ktLu9qQyo+y+Z35QQYo0AJCQLYJERdWF20WAjw1LVBr9Gx1V9SFd
	 H+pwH9fCIDgt04rM63EZOiGOitzeUqD0oP/+x8lnDzHXqjGM/041O92qcn9wAYJBoce1SuBxIvyE
	 xntUCU90866BKj0iT7UrZPkVKA87qjPazRQAynDMqtcq1by/GLB9b4InMXNJO1dKm7ELAeDNoJPI
	 LW9eZBlthFHilZDpIZU6+JbWPP2vYaWga1wBQiE/Vw688bJ13z6rU2YeHPq9fW6g6PyE/534JzEH
	 M90HAycoXj//+C/xS5Zgy0QSXSjk2Ix65o6joyXnRzE3owqqRNcc+eeDDnwZggN3lHaL/WQol1gK
	 lJAfhAa3bcn4HvR0pWEcYaAPgqwgtUJw3UkNJPIHqlNkz5Pn1yZbe8JfMruf568GuKY7XveRyiW6
	 XJJV5srL1xYpzc6lqHn3G57NFh2xuZ63YrGQjoZxI+45f9n2v72csKO9Y46xLeS/jXth9lgkD84X
	 O/9UUTvKvrE+hsoy1vz3fWPd/3aqKoIal9417xsg+QInfVnk5x/Xc3r8DgPVNf4nPburg5AqC8au
	 3EhWOk935DwIfE09Pi2WDlAVNZhKp2bcfLOhsKt0QXwXaErk7bQKcs4Ri0YyQ9mk6Kz/R0EVvCSI
	 NBbiPSEUfNLqwpRVXfTGS6Zr7gyRe3+VgzU0ybfMqtgp05iteqdeyBva3BKNLBxpO3pz1BaTCQ1Y
	 8fH21a
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
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
Subject: [PATCH v10 12/15] arm_mpam: Map resctrl RMIDs onto the request PARTIDs
Date: Mon, 19 Oct 2026 15:33:38 +0800
X-OQ-MSGID: <20261019073453.2142856-13-2118537295@qq.com>
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

From: Zeng Heng <zengheng4@huawei.com>

The current resctrl RMID allocation assumes a rigid 2D encoding, which
limits the total number of monitoring groups to the hardware CLOSID count.

To decouple control and monitoring, redefine resctrl_arch_rmid_idx_encode()
as a flat, global monitoring index. When extra request PARTIDs are active,
the task's hardware PARTID and PMG are derived directly from this global
RMID via modulo division. Otherwise, legacy 1:1 behavior is preserved.

CDP and PARTID narrowing can now coexist through a two-phase mapping:
when both features are active, extract reqPARTID from rmid first, then
apply CDP's even/odd split on that reqPARTID.

No functional change for now as resctrl_using_extra_partids
remains false.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Suggested-by: James Morse <james.morse@arm.com>
Link: https://lore.kernel.org/all/2944b506-a462-42f8-95cf-404241fb27f0@arm.com/
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v9->v10:
 - Remove CDP + narrowing mutual exclusion check
 - Add narrowing path in resctrl_closid_rmid_to_partid_pmg() for CDP case
 - Handle CDP in resctrl_partid_in_closid()
 - Add consistent NULL checks in legacy path
 - Remove the dead WARN_ON_ONCE(partid > U16_MAX)
---
 drivers/resctrl/mpam_resctrl.c | 76 ++++++++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 12 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 332388a092ce..d60dea846486 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -62,6 +62,9 @@ static DEFINE_MUTEX(domain_list_lock);
  */
 static bool cdp_enabled;
 
+/* If resctrl is leveraging extra request PARTIDs for monitoring. */
+static bool resctrl_using_extra_partids;
+
 /*
  * We use cacheinfo to discover the size of the caches and their id. cacheinfo
  * populates this from a device_initcall(). mpam_resctrl_setup() must wait.
@@ -274,8 +277,28 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	return (mpam_pmg_max + 1) * (mpam_partid_max + 1);
 }
 
+/* The request PARTID and PMG a resctrl RMID maps onto. */
+static u16 resctrl_rmid_to_partid(u32 rmid)
+{
+	return rmid / (mpam_pmg_max + 1);
+}
+
+static u8 resctrl_rmid_to_pmg(u32 rmid)
+{
+	return rmid % (mpam_pmg_max + 1);
+}
+
+/* The control group that owns a request PARTID. */
+static u16 resctrl_partid_to_closid(u16 partid)
+{
+	return mpam_partid_to_intpartid(partid);
+}
+
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 {
+	if (resctrl_using_extra_partids)
+		return rmid;
+
 	return closid * (mpam_pmg_max + 1) + rmid;
 }
 
@@ -287,8 +310,18 @@ bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
 
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 {
-	*closid = idx / (mpam_pmg_max + 1);
-	*rmid = idx % (mpam_pmg_max + 1);
+	if (resctrl_using_extra_partids) {
+		if (rmid)
+			*rmid = idx;
+		if (closid)
+			*closid = resctrl_partid_to_closid(resctrl_rmid_to_partid(idx));
+		return;
+	}
+
+	if (closid)
+		*closid = idx / (mpam_pmg_max + 1);
+	if (rmid)
+		*rmid = idx % (mpam_pmg_max + 1);
 }
 
 void resctrl_arch_sched_in(struct task_struct *tsk)
@@ -303,19 +336,35 @@ static void resctrl_closid_rmid_to_partid_pmg(u32 closid, u32 rmid,
 					      u8 *pmg_d, u8 *pmg_i)
 {
 	WARN_ON_ONCE(closid > U16_MAX);
-	WARN_ON_ONCE(rmid > U8_MAX);
+	WARN_ON_ONCE(!resctrl_using_extra_partids && rmid > U8_MAX);
 
 	if (!cdp_enabled) {
-		*partid_d = *partid_i = closid;
-		*pmg_d = *pmg_i = rmid;
+		u16 partid;
+		u8 pmg;
+
+		if (resctrl_using_extra_partids) {
+			partid = resctrl_rmid_to_partid(rmid);
+			pmg = resctrl_rmid_to_pmg(rmid);
+		} else {
+			partid = closid;
+			pmg = rmid;
+		}
+
+		*partid_d = *partid_i = partid;
+		*pmg_d = *pmg_i = pmg;
 	} else {
-		/*
-		 * When CDP is enabled, resctrl halves the closid range and we
-		 * use odd/even partid for one closid.
-		 */
-		*partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		*partid_i = resctrl_get_config_index(closid, CDP_CODE);
-		*pmg_d = *pmg_i = rmid;
+		if (resctrl_using_extra_partids) {
+			u16 req_partid = resctrl_rmid_to_partid(rmid);
+			u8 pmg = resctrl_rmid_to_pmg(rmid);
+
+			*partid_d = resctrl_get_config_index(req_partid, CDP_DATA);
+			*partid_i = resctrl_get_config_index(req_partid, CDP_CODE);
+			*pmg_d = *pmg_i = pmg;
+		} else {
+			*partid_d = resctrl_get_config_index(closid, CDP_DATA);
+			*partid_i = resctrl_get_config_index(closid, CDP_CODE);
+			*pmg_d = *pmg_i = rmid;
+		}
 	}
 }
 
@@ -359,6 +408,9 @@ static bool resctrl_partid_in_closid(u16 partid, u32 closid)
 	if (cdp_enabled)
 		partid >>= 1;
 
+	if (resctrl_using_extra_partids)
+		partid = resctrl_partid_to_closid(partid);
+
 	return partid == closid;
 }
 
-- 
2.43.0

