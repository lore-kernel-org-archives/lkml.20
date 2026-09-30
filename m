Received: from mail-m1973178.qiye.163.com (mail-m1973178.qiye.163.com [220.197.31.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AEB379EC4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739741; cv=none; b=YYULbz/hhUlLXM5HlekRI9Y8O35wTxuNkc9dx1ooAe9XXgOs/5cRzn7moyQ21g4MezZNIf7M3IVarZumL2ugswJRBsza9ISKEgx/XslTY7K3uBYp1nuFvLyi0muRNMwLhN3UvSY1s+hKpYznFgZ3vjwisOhDZ/Z+B9ZQWRe4taQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739741; c=relaxed/simple;
	bh=t1FOsi0o2TS388z0FexiwNJlwBUWTA22MOE0GpY8vGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0CA5Z2PkciTkyLwqNdmVFxFhrk6yEQn865RWxALTBQTlU2scAx0MCIvivvajbd3fEXSjI/6OsESJapCv/LKEkHN33mHIkuITTwdu+89dh3r4Hqzw2SoVSR8dDA+S1BtRxw0rM5FwNLDeFN7g0zJ/TctbmuL00gasn28Gm6iFEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=jUjKDupp; arc=none smtp.client-ip=220.197.31.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="jUjKDupp"
Received: from xf.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f94c9cbb;
	Wed, 30 Sep 2026 11:36:59 +0800 (GMT+08:00)
From: Finley Xiao <finley.xiao@rock-chips.com>
To: Finley Xiao <finley.xiao@rock-chips.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 1/1] mailbox: arm_mhuv3: Keep the combined IRQ enabled during system suspend
Date: Wed, 30 Sep 2026 11:36:57 +0800
Message-ID: <20260930033657.312266-2-finley.xiao@rock-chips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930033657.312266-1-finley.xiao@rock-chips.com>
References: <20260930033657.312266-1-finley.xiao@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0f06311d103a8kunm0f690f8947b21e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTBhLVhgfGEodSUwdQ0tLSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZS1VLVUtVS1
	kG
DKIM-Signature: a=rsa-sha256;
	b=jUjKDuppHrDYlOaX1PE0bndgBgD7Utkp5fcCqc6rJEO2teseuKZfxOSJttjJNRdQyCs2Sq+WQvaeOJuQKXoyUikGDe0M36sQ2s/QOc0Sxrfes3PNg4WpaXWE6V9thkSOyDcTTZLnb2VIN/otwEZDJemB9pkRh3dju5n4ejAGuTE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=TZ32C2WTWmgi5ZaUexbXzvx93Ac9ZjmfyXwb3Nt7J0k=;
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
SCMI remains functional throughout the suspend/resume cycle.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
---
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

