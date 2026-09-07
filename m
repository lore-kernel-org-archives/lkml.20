Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648764AA1ED
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784743; cv=none; b=jVwffw9bxdrn0gvUXueNyMwF1G0EMRfgz3PVxQK0EYF0ltTBM1F8fpf+/zFGrtWT8HY/wheT7DrQ+NuY/50PvScK+T9xduGW0CmE0rcnxj8Mgr6dc/mNiEOLpOYfMrtcImaA1y8WMB1HsdF/y40arSwSTSZiquuNQB4vpYLQ7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784743; c=relaxed/simple;
	bh=QbAjqHnG5PX0RMNS9DTA+5ZjTR6u7O/LMsv2KE3YZoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+Uo6UQIqYzgkKOCP7iJRDo7Rpdw9vJC5/zSVyxWHD5uJrBIF9nIUz7haYHZD73ab2d4jV/56ll/8/+w8vVTJFMcEdZvH2wz1VrXq2c/g2cnwQqLVkhLMSV2U36bRW2mFPRHeH/FPCt0vQir+qDg/jdbg3sXb/glqUXmBe4IBoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=ATyGn/es; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="ATyGn/es"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so2894027a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1788784740; x=1789389540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjLAogUswswy8RDvp093f2073XmPq8bwfDxqjR1LO1o=;
        b=ATyGn/es5pKZD0w51HA5t2FdwxttO9YkucgoDmsezbVaNK5xhK+RiuE+UmR7uUmB/C
         t1+XMz7w4nBduDVQfLQQXn0cthSU5Y3PZfRDjr6xk4tShnyEEc5mmnghS9xTlu6dMXzk
         CogXvBXR3weNrosMuL6mIGuoA3bS7zjYUO0ch69r0j6V/icwd6eaafKo19FNPWyAFVmd
         YnUiXMJ4jERPt3Qlm+4Oe8mujGDOGsT/wL7pwzhY8TV9nN3hDyj/85g80EoYe3EmpykS
         /CX6Zw/ZmHo8XaLp9RXj7mlBjyDCRXGHM1M7MT7QtwaL+bXQVMxXRE7gNv6/SEtvgajB
         FHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784740; x=1789389540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjLAogUswswy8RDvp093f2073XmPq8bwfDxqjR1LO1o=;
        b=ZKIoslZPngw5zuAV9xTIuYsM74MqoWIuj4RrjcB9nSGIF7OXV39YXcN3SONdv64x+b
         LVO6PTZjuh5tTgyl1T4KxpfTgUJRgzJ6RaNAuU8xfjTeTSnyevQl3c5oCgU2/OooCL9o
         t3QLuYAlE+eVB4xAnUqLjNYeoh9aFk8aAjjdtIVRUg0Gx+GM85tBtnbEMp3N5xNq+flS
         zFk6y89JvjD1YChl7c/pt7Hvp6tqWmfb3efAyWq0xAOvBzTMg20In5Bh2eHb19VkTeiX
         MI6SoGeR2x5SoQKmuVVTe8YKCzqms0jetUzlYvk3yodTlYkhVPtGofiuFPDc5HZWXez4
         K3Og==
X-Forwarded-Encrypted: i=1; AKwUvBye41SnZBA+wet+VT1BQhK1XlV9c51iuHC/NKg6EK/WvAgiVWIg20zQXOIa4TuXNn+8IoP8JmWhT5lzCR8=@vger.kernel.org
X-Gm-Message-State: AFuF++l0Q6vz70WE4mvGsoOfTnGES0xNOsukmKZbYxVRRBKrybOxc/ah
	u0Dqp1ew5zdLni5XU2OD4LcYKTK6mkosdzm4QDQsOg5K7t7g0coRkWMu1sLesbctoGD1GxRT8Gh
	WBrs=
X-Gm-Gg: AYBFou1BgPdcLkzKUCs3UjSjXUfCUFvRvqig1SCRgWMFr9YUEfO9/mPrNK0UUOpr8LR
	Nf+JfTKI7f0kBhHonGyVXUjvi/B3AACqc+OWHyMEJSQyY8MEv0abV/j32oYdX8rZcJhrLSg7QFg
	8xBGx4+BahH4aMFgO6+OwUXI8tWM/WGWE78N1PAXlEw6NsrXp/SnODc761iYmr97SKJt6R3gpvZ
	gH2SKMRL8WkNuMpgWqfyU5gpG7KKfbTpGSm1Yd50Oq+o1NcoPI0gh2txHEk5fXAWBYxVIdpVJiM
	fPi6fBhR0Oj/mEThXPISxp2z4iKhk1P+HbHopPCg2q6IHK98o+GJTrgsSu/kaT+5HICaQ/5IlG+
	6fDrvwcc5G9o4dZqL9tbRvjmA8LT/TWEX7dzynfwN7/FL5KM5flr7/zeRnDbb62f+uXdpO+2NE8
	L+ZAYDMQSh/TJY6Z36FzKpiium7xESE/1JZ7AM3EJ6yHu06r0ebbQVMm3I4/KPtKO3tprJ1ziR4
	PuXB6rl69qWpV1WXIy1XVPDuIlA5S4=
X-Received: by 2002:a05:6a20:4311:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3da39eacfc8mr29164935637.6.1788784740385;
        Mon, 07 Sep 2026 05:39:00 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm27656024eec.9.2026.09.07.05.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:38:59 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yury Murashka <yurypm@arista.com>,
	James Sewart <jamessewart@arista.com>
Subject: [PATCH v2] PCI: Stop waiting for link status after config read failure
Date: Mon,  7 Sep 2026 12:38:53 +0000
Message-ID: <20260907123853.1081635-1-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260904111318.1063858-1-yurypm@arista.com>
References: <20260904111318.1063858-1-yurypm@arista.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a nested PCIe topology with multiple layers of hotplug, a link can go
down near the bottom of the topology shortly before a link above it goes
down. In that case, pcie_wait_for_link_status() can wait for the full
timeout while every read of the link status register fails because the
device has disappeared.

Return immediately when the device is disconnected so event processing can
continue.

Signed-off-by: Yury Murashka <yurypm@arista.com>
Co-authored-by: James Sewart <jamessewart@arista.com>
---
 drivers/pci/pci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

Changes in v2:
- Check pci_dev_is_disconnected() before reading link status instead of
  checking the return value of pcie_capability_read_word().

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b2879a6be..a568d5ac1 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4565,8 +4565,9 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
  * @use_lt: Use the LT bit if TRUE, or the DLLLA bit if FALSE.
  * @active: Waiting for active or inactive?
  *
- * Return 0 if successful, or -ETIMEDOUT if status has not changed within
- * PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return 0 if successful, -ENODEV if the device is disconnected, or
+ * -ETIMEDOUT if status has not changed within PCIE_LINK_RETRAIN_TIMEOUT_MS
+ * milliseconds.
  */
 static int pcie_wait_for_link_status(struct pci_dev *pdev,
 				     bool use_lt, bool active)
@@ -4580,6 +4581,8 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
 
 	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
 	do {
+		if (pci_dev_is_disconnected(pdev))
+			return -ENODEV;
 		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
 		if ((lnksta & lnksta_mask) == lnksta_match)
 			return 0;
@@ -4603,8 +4605,9 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
  * according to @use_lt.  It is not verified whether the use of the DLLLA
  * bit is valid.
  *
- * Return 0 if successful, or -ETIMEDOUT if training has not completed
- * within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return 0 if successful, -ENODEV if the device is disconnected, or
+ * -ETIMEDOUT if training has not completed within PCIE_LINK_RETRAIN_TIMEOUT_MS
+ * milliseconds.
  */
 int pcie_retrain_link(struct pci_dev *pdev, bool use_lt)
 {

base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.51.0
