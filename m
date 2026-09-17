Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01C84AAC5A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657016; cv=none; b=QOKQcvFDx48kdo5baZGwdcBlGLwKFirUb14bAiwENM+mKhNepOI1JeMPpiOuixVjjeF37DpMu+oMfVW5+n+fNRj3/bKOBBI6jXehYvbmWyLPzN3JA/u2y35625i78NWUTlPJul4lcDD9d4HcJzR2qhPzIOszTZ+d5OwCFbL99RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657016; c=relaxed/simple;
	bh=THmIJ0mblTEQm05OX560oWA4k2851WiXGCm+VIxUKlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kA7hswnhQ4q9Zsd2MCovyl0USwBU2/kEoib+n5+kzM6LS0+zn1P3UTBJO7GmD+/X9NpO6xWVS4slB5NvQ4xDIgM4Swdz9U/ZpTpN43SAAvkq3LuoG+WDXWZPJBQfbSIPF17WbTwMhq5qL/iFXNkjUu+wGrrBQeBO1PDU40tRaqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PSr5zSjz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PSr5zSjz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20CDC1596;
	Thu, 17 Sep 2026 07:56:25 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A2A73F86F;
	Thu, 17 Sep 2026 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656988; bh=THmIJ0mblTEQm05OX560oWA4k2851WiXGCm+VIxUKlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PSr5zSjzi/w1B/nV+rS3TWGaNq0+wreF4ePi5JzUbMnKFesvnOnOEnfc462c8CMa0
	 RfgpGj/V2P0iaAoij3XMDIMZv2IL9XFG5+jUY2MmvKnmXTzXQsYgdBp+y7y9G3XvzX
	 lptBvwc2R/tUyKplAO80RB1LOdMEu0rDdxq/MaEg=
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
Subject: [PATCH v2 01/12] arm_mpam: Move MPAMF_ECR write helpers to allow reuse
Date: Thu, 17 Sep 2026 15:56:06 +0100
Message-ID: <20260917145617.2202986-2-ben.horgan@arm.com>
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

In preparation for calling mpam_enable_msc_ecr() from the CPU hotplug
handlers move it higher in the file. Move mpam_disable_msc_ecr() too to
keep them together.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
 drivers/resctrl/mpam_devices.c | 38 +++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..580d7ed38569 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1817,6 +1817,25 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 	mutex_unlock(&msc->cfg_lock);
 }
 
+static int mpam_enable_msc_ecr(void *_msc)
+{
+	struct mpam_msc *msc = _msc;
+
+	__mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
+
+	return 0;
+}
+
+/* This can run in mpam_disable(), and the interrupt handler on the same CPU */
+static int mpam_disable_msc_ecr(void *_msc)
+{
+	struct mpam_msc *msc = _msc;
+
+	__mpam_write_reg(msc, MPAMF_ECR, 0);
+
+	return 0;
+}
+
 static void _enable_percpu_irq(void *_irq)
 {
 	int *irq = _irq;
@@ -2443,25 +2462,6 @@ static char *mpam_errcode_names[16] = {
 	[12 ... 15] = "Reserved"
 };
 
-static int mpam_enable_msc_ecr(void *_msc)
-{
-	struct mpam_msc *msc = _msc;
-
-	__mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
-
-	return 0;
-}
-
-/* This can run in mpam_disable(), and the interrupt handler on the same CPU */
-static int mpam_disable_msc_ecr(void *_msc)
-{
-	struct mpam_msc *msc = _msc;
-
-	__mpam_write_reg(msc, MPAMF_ECR, 0);
-
-	return 0;
-}
-
 static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
 {
 	u64 reg;
-- 
2.43.0

