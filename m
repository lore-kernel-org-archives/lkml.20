Received: from mail-m3290.qiye.163.com (mail-m3290.qiye.163.com [220.197.32.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C79221FB6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739735; cv=none; b=pvsWFOCwt0haEH+rWW/hR2fGH1MDvdKqIPkrXDDnsDUnZ3egBeuttf3W7O9kBFU24Qsf+zcmJRA25lV2YagR6uIQIJSG5RPN6rNS3uGKm+3i0/T1s3wx0GJ05HdhmS1FAgCPZw0p2JC3t4jW+E391L/fESKEPSwzj/yYVZfyk9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739735; c=relaxed/simple;
	bh=VHSWrpo+vVjktWkOpmIm5+8NXsVJGTAofk/RaxUvfkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uKv0zoxANzIhOLqsdP2pNS5FAQsL8R4BT+XGIjAJ7HCdvBk8BAqjf2zwkQgR4AUKyKXiXLjlfjvNvoswDQkOdmdfRKHBieYDe8h++bj1VOR6lrVYQ/UwJMB4ubnfFC7DKspW5yRNcZ8Y8wGSbj4lZIaSUBojZLMIoJY7+hYzvQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=OxODFohM; arc=none smtp.client-ip=220.197.32.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="OxODFohM"
Received: from xf.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f94c9cb5;
	Wed, 30 Sep 2026 11:36:58 +0800 (GMT+08:00)
From: Finley Xiao <finley.xiao@rock-chips.com>
To: Finley Xiao <finley.xiao@rock-chips.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 0/1] mailbox: arm_mhuv3: Keep combined IRQ enabled during system suspend
Date: Wed, 30 Sep 2026 11:36:56 +0800
Message-ID: <20260930033657.312266-1-finley.xiao@rock-chips.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0f0630f1d03a8kunm0f690f8947b217
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSBlMVhofSxhDShpJTEtNSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZS1VLVUtVS1
	kG
DKIM-Signature: a=rsa-sha256;
	b=OxODFohMjf+FYWy51U18ExdvDCqeo4yz9mpEHq5qFLRyHEA7gob1nMhV/GFVM4mgXkFAVaKVzooj/VBIl7qu0FtgSecoymNtfXw5w0rDSsWExHHGXQ/7Usmr9QLNuTiJBLpqUkUAW/dCLep297GTi+EKU+tGxMjKoIfPWZzlcBY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=KP6ZynFLHD8ri5bMVYI7/ATuH9LqGjJkwYWC0VATw3Q=;
	h=date:mime-version:subject:message-id:from;

Hi Sudeep, Cristian,

This is an RFC to ask about keeping the MHUv3 combined IRQs enabled
across system suspend, so that SCMI clock/power-domain operations
issued from the noirq phase keep working.

SCMI clock and power-domain operations go through the mailbox
transport, and during system suspend they are still needed in the noirq
phase. genpd powers off a device's parent domain from
genpd_suspend_noirq() (e.g. turning off a video power domain when
suspending the display controller), which issues
scmi_clock_config_set() / scmi_power_state_set() and waits for the
firmware reply via the mailbox RX IRQ. Because dpm_suspend_noirq()
calls suspend_device_irqs() before running the suspend_noirq callbacks,
the mailbox IRQ is already masked at that point and the transfer times
out:

  arm-scmi firmware:scmi: timed out in resp(caller:
  scmi_clock_config_set+0x90/0xdc)

We hit this on one of our platforms and worked around it downstream by
adding IRQF_NO_SUSPEND to our mailbox driver. arm_mhuv3.c has the same
pattern: both the PBX and MBX combined interrupts are requested as
threaded IRQs with only IRQF_ONESHOT and no hardirq handler, so an
MHUv3 instance used as the SCMI mailbox transport (arm,scmi-mailbox)
would time out the same way.

IRQ threads are not frozen during system suspend, so with
IRQF_NO_SUSPEND the threaded combined-IRQ handlers still run in the
noirq phase. For SCMI clk/pd traffic the MBX combined IRQ must stay
enabled; the PBX combined IRQ, used for txdone by IRQ when not in
polling mode, needs the same treatment.

The patch applies IRQF_NO_SUSPEND to both registrations, but we would
like your opinion on:

1. whether you are open to this at all, or whether SCMI users on MHUv3
   should instead rely on another transport (e.g. SMC) for traffic
   needed in the noirq phase;

2. whether it should be applied to both the PBX and MBX combined IRQs
   unconditionally, or only in specific configurations.

This is not purely hypothetical: several in-tree DTs already route SCMI
over a mailbox transport without IRQF_NO_SUSPEND on the mailbox IRQ,
e.g. Juno and Morello use the MHU doorbell and the Zena CSS DTS uses
MHUv3. The patch is sent as RFC for discussion only.

Thanks,
Finley

Finley Xiao (1):
  mailbox: arm_mhuv3: Keep the combined IRQ enabled during system
    suspend

 drivers/mailbox/arm_mhuv3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0

