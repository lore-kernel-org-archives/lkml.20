Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198BB48DB57
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395314; cv=none; b=XTO+8ULztK6WVOS2aHkjKjHrdrod7ssTWwf898mQ+2wlTChfuw2ACWuynLXW8YWbBZYnUWPTJmftZMAn4rBYHGU3RwHsw3rg/KIju/fiub5RPpPMIvzXRulMuyw7la+te3LtjfhiNzrgxtB3ySjTaynSHuzYdu2Z8bP8v4i1WYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395314; c=relaxed/simple;
	bh=5DwXB90x+km1GaU5Oswangknk88e2jmfy3mgUsJDki0=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=TDh/FrFeOH5Ry7qDalBtZ4VlM7z/8CQLYQytr5KehXLsqWrUPKWYJXRuc+kzH8yFScLrX3tCxhWAdbEGUuw6raysV7c9rE5OQv/JT/ugidKyRz6d6zRJDhABU7t94P1sLGxlirEZZYi6uYdmLbVLlpJnpd0nzbstmcDpgO32PRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=itUMe0x6; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="itUMe0x6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395302; bh=lhrKaI4N15EYiTg63k0B1Z7QMoSEk0eYGZeFrqqADyc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=itUMe0x6U6yBfDfifSKcmj8mg1dri5K8h7RSWMwLc9DuacssliDlB8VVDof9q4bEc
	 3q7KiR7PB7SVrz1YUUbvEY2dheqpwZTZs2U1geJK0019oNxIT1DlZWcXzMTmf0pnnT
	 z9mD7mCK3rRSNtNZpSQMwmjbwy5vxWVotS0GeHt8=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395299tr9ycqfxi
Message-ID: <tencent_F98C95E4B4EA8905C487DB16A9D699B6E307@qq.com>
X-QQ-XMAILINFO: MMwjR1C73eIsOgpwswYlW3BKu7vTA7UiPOTh2VxOWCjmsS7jsjZ0beP64vdgpX
	 9zFB606roeMMb7NCxkwS2IvkVto4nvWLZgTHLS6bqPJBuqSyIu9O0qwQHFFrjAd2I9MaO82zADCR
	 r39kD9BXIt21AXwte6TvLevvtVKBUWwCIqnfJ5pfg2xCUjPGPpR1bxLQCEuJmt9hdUyTN8DUZa2U
	 CiA5r6nlAqSL/1XfgSikH5vuFQXBRtfhuf8PiNC5khb9/WYiQKi37OEmkCgvZCSId9Ecv3M9I9Bp
	 xslc0B44d0SvaI8d+og0E2hky0uwG3sdv4Id3TneVAzRBnFyKn6xBrvO0qDaWhRxVpBDJXCkDS8k
	 FRvVXpP/VOYeW2GoktbSneWSyOju7zUOLuHTeDgJONurMnKoLk9odxnHe0Y90dvE3hiDzxvSpUDH
	 w2C/oO6EMEWTLUeb4poD5wib2kwA0k5ovdOrJeHd4/sjUCCWjNKI/1udzULZOU015WFUZf5rJc1p
	 tCWRK8NKyKZtaA31qXRlt2m6Qy1eyMSw2mS7PjXkA69RY1QcV8kjDPbANvdIRhqSjoBVMys3Dw5n
	 DNIjG3k0og6SeW/Uo9HZtlbVSUR4yagQSCG4GjKmnLSgXbGiS7Ts9aL9kZtiAjoNKqj/y2hsnqFW
	 AjCoC7AGeb8nDuAVgmS+FQMBbiXe6M7w2U3MMvD8EfOiocAznHNLD6FFo6XkgPxPhW3xNQhpSUgH
	 7PNysvYnP5bnAsOtvWbzshyYOD7yOmzF4MEOYxJnfZEd2N1/olSwVpCQBFD05Mt3MwQ2IKl9F8Xp
	 NbmQm/fneJwxsqt1wmYaWVGGI5/uNEIfck6I/hoMsUjLk+a1xLw0ft+gfCgNTegGQOwV4Z+B0G3G
	 g4r9zCjJeD4YD3SwBDLont5mfeRwuwsLjs4u1ZUz97O+PTv2CggoMjhZ0rY+XmNAb3hGmlmTqqtW
	 BeoVRNPOZbYzbOuoqeQNA4ihSEUhUpfM8fQmdi8WA2k6R9c326AvzDVI7IDvHnMa9k/RTKLLEtVf
	 7T+G0H9/fB5gbTrT8vk1XyToOv/kD/VfzDfjwXNA==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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
Subject: [PATCH v10 02/15] fs/resctrl: Skip monitor context allocation when force-freeing RMIDs
Date: Mon, 19 Oct 2026 15:33:28 +0800
X-OQ-MSGID: <20261019073453.2142856-3-2118537295@qq.com>
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

__check_limbo() allocates the architecture monitor context before the
scan loop, even when force_free is set. The force-free path never reads
occupancy and never uses the context.

If the allocation fails, the function returns early and leaves the limbo
list unflushed. Callers such as the unmount path then silently fail to
return the RMIDs to the free list, leaving stale CLOSIDs in limbo that
are re-interpreted with the CDP state of the next mount.

Only allocate and free the monitor context when occupancy will be read.

Fixes: fa7d949337cc ("x86/resctrl: Rename and move rdt files to a separate directory")
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index da883adc3adc..ffa9c67c9f00 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -142,11 +142,13 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 	u64 val = 0;
 
 	arch_priv = mon_event_all[QOS_L3_OCCUP_EVENT_ID].arch_priv;
-	arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
-	if (IS_ERR(arch_mon_ctx)) {
-		pr_warn_ratelimited("Failed to allocate monitor context: %pe",
-				    arch_mon_ctx);
-		return;
+	if (!force_free) {
+		arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
+		if (IS_ERR(arch_mon_ctx)) {
+			pr_warn_ratelimited("Failed to allocate monitor context: %pe",
+					    arch_mon_ctx);
+			return;
+		}
 	}
 
 	/*
@@ -192,7 +194,8 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 		cur_idx = idx + 1;
 	}
 
-	resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
+	if (!force_free)
+		resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
 }
 
 bool has_busy_rmid(struct rdt_l3_mon_domain *d)
-- 
2.43.0

