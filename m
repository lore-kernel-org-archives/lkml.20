Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB251212542
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401870; cv=none; b=dR5PJFXI2rndGx/Ag9oaEHbYX8fLj08dSt93AwYLka3xbkhVlNNuzzwyEkgUj91hqWZC6SJOlIqD7+N3Ig5pkhDa8Ja+c/V2uDzEamz3ojdm4qBci6mLZKc9iGuYgH8gKMCXFuo69KSXLlp3nVRjGZKXwj+jNd7LscKRyHUyXVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401870; c=relaxed/simple;
	bh=vnu+7OTVyrfngxBgjEV+wbBsUgwuLr2CGX38vK2EnYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mAbx51q+tD9hA4hZVRQ+OJ914lqHiqkdkfO13geuOw0LywJLmPFkPyXX8VJu7QHEeqxzo672X0lSeCIhRf2lBHH7N2KdkDqaCiPbOy893x5FpZa901KlaTrOEwgMephjJELEYk1ctwxX17R3wo+PDIPnfAdYx8nKm5MTCUTvLg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Mfbm8y+d; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Mfbm8y+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788401722;
	bh=TDmE22prZiWyICupTJBxOHtt4OkSMDD7JlVtXA21HRM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Mfbm8y+dpqDPaV3yADYCDFllKIcl9c2Kiu8QPbafPiO7Pi4jjC9VjKvQbQ1hiuTQt
	 xQ+BEIyxPJ0Pmf5FCTLYlL5i9daIyOXEx+Mue2EajjoCy84BoGqYiNQ4/fNDSUxUMx
	 PytMRsS7Usp/pADc9BB9h+Zistvog2frGUv7/3Qw=
X-QQ-mid: esmtpgz16t1788401716t09e2fba8
X-QQ-Originating-IP: HWN1kVLmaxC5DhOLmv1XOyn9IGplrGoyhXFMvCPmKtw=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 10:15:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11223455846511623105
EX-QQ-RecipientCnt: 15
From: Haowen Tu <tuhaowen@uniontech.com>
To: rafael@kernel.org,
	laurent.pinchart@ideasonboard.com
Cc: tuhaowen@uniontech.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	huangbibo@uniontech.com,
	lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mchehab@kernel.org,
	oneukum@suse.com,
	pavel@kernel.org,
	stern@rowland.harvard.edu
Subject: [PATCH v5 2/4] PM: hibernate: add pm_hibernation_snapshot_done() helper
Date: Thu,  3 Sep 2026 10:14:57 +0800
Message-Id: <0a72acf8defd73508bfc5d2fb7c985521696630f.1788399733.git.tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1788399733.git.tuhaowen@uniontech.com>
References: <20260730153817.GA1555869@killaraus.ideasonboard.com> <cover.1788399733.git.tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nt9LS5Tya5fqVcSbLF5cPkXXPQ6NsO3JdfcI8FaoQekdQhgZ6w8MuoTM
	b3kHZSePM7O3ylFU6fX51RbRx5gjdWAdbsDIncfob60H2FAnrnQ2Ih9rSwvuCWGo0DtKdLv
	+ZOZqIutohCZmsh3URIvd4RIW7E8NCIlpFO8LluDTUb7oii0BBKxGrldOFL2JE6mSapogkP
	r5QAqPg0zWAKBC/sBSV+AW5gWeuPEpd8qDAiXc4sfN7gslhdJCeaS/uKXow1Hs7zy7h+UNn
	L0f3P2JtW/2tm52NUYOinokXb2KHWzPNiSok4VTChyjzVpypcHESc1VJLrKDyzVOrTjDp0L
	70enCXVWa5/jtNlDoPnRsTvq1dI2+CuM+dF7Bqiz1uQHlm+LFOK+H+snW6QNnFO+FTXmfUk
	6t6FrjXCsDZW4534z7d9P6Jw6qLp68gfsAg6zC07RE8/8wCClyoHnpXPQCiFIqxZzkTuKPz
	iFSGvGgvPlieeE9qr1fZetzN/PHf5Yq5FqEVswSlQhEAlJDh7d1uN7ITpgPe10oODk/NCWi
	gfxPTKra5xk/U9vNlkPQ6eL29c+rNPZ7Y1zJoU0JPdfGSmfThTAAnFVp5wTHJJMVdX3or1x
	pm8gn2qq88vDCbJjgIET/0c2WQcPE1QJt/XP3aRnCixYb9dIjUcW9KwabSXpTiZepOzns6n
	efEv1YBzcmQ5MwhpRxlJbChiMy9uzj8AZCdvvK11pjl1/5ydM02+eJBdqDUHosVkaBQDZQg
	Y79EmOvawk6hkhO+ycnTZ3jDHmwC7sXd1dlevEZtckx59eNkuhcNVQoJq+jpekTGofLx4fy
	lj2K2tbfwDO0LAUWHTAeJ4vGEKAJsp7mzLQU8CZBVnF49d4+/Yq8pOOH2eVM2wsXdea8Btu
	8qv/TU8PaTo97n7COcFflrfIc+4K/X28xdMZeFL/nnm/+3eV+jwhppMs2H/hGvYGGaVHJ+U
	5MyHCRPHr1k1mFg899iJqa2dLpdLz+MuOeZXQItQmP+N34D8uYkE8Gf/qbx7VAoSri29eLS
	SUXKrvHy3eRR6t1SrzgShGUlH4/90S917np+tSm46Vxvdo9rn1BAdouldFZvefhIwUWZ8gD
	BMYej2ckL7Nf8ZCyP9lgyw=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Some subsystem resume callbacks do not receive the PM event and
therefore cannot distinguish the PMSG_THAW phase after snapshot creation
from the PMSG_RESTORE phase.

Export pm_hibernation_snapshot_done() so a driver can query whether the
hibernation snapshot has been created and is still available.  The helper
only exposes the PM state; callers remain responsible for ensuring that
any device-specific behavior is safe, including subsequent poweroff or
shutdown handling.

The helper returns !!in_suspend.  This variable is set before
swsusp_arch_suspend(), cleared before the snapshot memory is released,
and marked __nosavedata, so it remains clear on the restore path.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
---
 include/linux/suspend.h  |  2 ++
 kernel/power/hibernate.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index b02876f1ae38..2cebbec3e2f7 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -393,6 +393,7 @@ extern void hibernation_set_ops(const struct platform_hibernation_ops *ops);
 extern int hibernate(void);
 extern bool system_entering_hibernation(void);
 extern bool hibernation_available(void);
+bool pm_hibernation_snapshot_done(void);
 asmlinkage int swsusp_save(void);
 extern struct pbe *restore_pblist;
 int pfn_is_nosave(unsigned long pfn);
@@ -412,6 +413,7 @@ static inline void hibernation_set_ops(const struct platform_hibernation_ops *op
 static inline int hibernate(void) { return -ENOSYS; }
 static inline bool system_entering_hibernation(void) { return false; }
 static inline bool hibernation_available(void) { return false; }
+static inline bool pm_hibernation_snapshot_done(void) { return false; }
 
 static inline int hibernate_quiet_exec(int (*func)(void *data), void *data) {
 	return -ENOTSUPP;
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 6d3e637c5a02..045d29f55011 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -113,6 +113,18 @@ bool hibernation_available(void)
 		!secretmem_active() && !cxl_mem_active();
 }
 
+/**
+ * pm_hibernation_snapshot_done - check if a hibernation snapshot is available
+ *
+ * Return: %true if a hibernation snapshot has been taken and has not been
+ *         released yet.
+ */
+bool pm_hibernation_snapshot_done(void)
+{
+	return !!in_suspend;
+}
+EXPORT_SYMBOL_GPL(pm_hibernation_snapshot_done);
+
 /**
  * hibernation_set_ops - Set the global hibernate operations.
  * @ops: Hibernation operations to use in subsequent hibernation transitions.
-- 
2.20.1
