Received: from mail-m155110.qiye.163.com (mail-m155110.qiye.163.com [101.71.155.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51322F767
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465225; cv=none; b=m4mGbwR2oNwK7I2vwW3e6jW9MxkTV4ctsXNIEJvAe7TNAdTXnSHs5LvwFTOdiB5kXAZrs5zHq9CILmFpcfzrr1pjT5bTi2/nnwgwtBXZJm2Sa2aUx2gazCVdRNLNLYD0OSNMqxly3sZXHDLyWxtLT5NDPgRTAGb+uNZVWLrSxdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465225; c=relaxed/simple;
	bh=zcmeyeoAgahuAuR66zc2xt5AmrVJdQNQi7uOVwSBU4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NBt//GSntG/gy68gLuE0lEW1z/8+WtNuIvzMcsKraRM7L4pxHbIRksUQQ63mpH3jDM6kEe0EGwMfrjdcev9deoRFpCy1NEuMvMfo2ztpDsIBIuUBcuIzxZ7vDsWlXLXtICpdvZlbMyC/n99tEAx2mtserE7StwjmmkFo6hQBto4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=XM6+Zbnk; arc=none smtp.client-ip=101.71.155.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="XM6+Zbnk"
Received: from xf.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 503d04501;
	Thu, 8 Oct 2026 11:03:23 +0800 (GMT+08:00)
From: Finley Xiao <finley.xiao@rock-chips.com>
To: finley.xiao@rock-chips.com,
	heiko@sntech.de,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tony.xie@rock-chips.com,
	huangtao@rock-chips.com,
	frank.wang@rock-chips.com
Subject: [PATCH v2] mailbox: arm_mhuv3: Keep the combined IRQ enabled during system suspend
Date: Thu,  8 Oct 2026 11:02:14 +0800
Message-ID: <20261008030214.368347-1-finley.xiao@rock-chips.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa119772d6303a8kunm2f35a96c7c2dd0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH08YVk9PSUlKGB8aTE1NGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XM6+ZbnkmQNlAhn5qn2uDiSftM3yGfhBT2v45Nv+KYw2bZSQ+UQ2jQ3uV/fZH/5RD1pnEPlWylQsk6yWl/oG4z4CE20ipqczYhXBNtV35Ev8cajAV53RsoRfQ82AznQ3yuX3Uot3s01byq/lTdCDzJwYeQeyzNe1w43vIHdgDLs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Dgleh18hZRn+DpCzOwpEkJP+/6haGcTG+Q6HFfBYP18=;
	h=date:mime-version:subject:message-id:from;

When MHUv3 is used as the SCMI mailbox transport (arm,scmi-mailbox),
SCMI clock and power-domain operations still need to work in the noirq
phase of system suspend: genpd may power off a device's parent domain
from genpd_suspend_noirq(), which issues scmi_clock_config_set() /
scmi_power_state_set() and waits for the firmware reply via the mailbox
RX IRQ.

However, dpm_suspend_noirq() calls suspend_device_irqs() before running
the suspend_noirq callbacks, so the combined interrupts are already
masked at that point and the SCMI transfer times out while waiting for
the reply.

Both the PBX and MBX combined interrupts are requested as threaded
IRQs with only IRQF_ONESHOT. The MBX combined IRQ must stay enabled so
that firmware replies are delivered, and the PBX combined IRQ, used
for txdone by IRQ when not in polling mode, needs the same treatment.

IRQ threads are not frozen during system suspend, so with
IRQF_NO_SUSPEND the threaded combined-IRQ handlers still run in the
noirq phase.

Add IRQF_NO_SUSPEND to the MHUv3 combined IRQ registrations so that
SCMI remains functional throughout the suspend/resume cycle. Note that
this only keeps the IRQs functional during the suspend/resume cycle and
does not make the mailbox a wakeup source.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---

Changes in v2:
- Add Sudeep's Reviewed-by tag
- Clarify that this does not make the mailbox a wakeup source

 drivers/mailbox/arm_mhuv3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/arm_mhuv3.c b/drivers/mailbox/arm_mhuv3.c
index a1c528be47f3..04998e1346c5 100644
--- a/drivers/mailbox/arm_mhuv3.c
+++ b/drivers/mailbox/arm_mhuv3.c
@@ -980,7 +980,8 @@ static int mhuv3_setup_pbx(struct mhuv3 *mhu)
 
 		ret = devm_request_threaded_irq(dev, mhu->cmb_irq, NULL,
 						mhuv3_pbx_comb_interrupt,
-						IRQF_ONESHOT, "mhuv3-pbx", mhu);
+						IRQF_ONESHOT | IRQF_NO_SUSPEND,
+						"mhuv3-pbx", mhu);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "Failed to request PBX IRQ\n");
@@ -1017,7 +1018,8 @@ static int mhuv3_setup_mbx(struct mhuv3 *mhu)
 				     "MBX combined IRQ is missing !\n");
 
 	ret = devm_request_threaded_irq(dev, mhu->cmb_irq, NULL,
-					mhuv3_mbx_comb_interrupt, IRQF_ONESHOT,
+					mhuv3_mbx_comb_interrupt,
+					IRQF_ONESHOT | IRQF_NO_SUSPEND,
 					"mhuv3-mbx", mhu);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request MBX IRQ\n");
-- 
2.43.0

