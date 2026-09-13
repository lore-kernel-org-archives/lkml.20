Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F8028D831
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789265645; cv=none; b=FnBTwk/KXvKLgYJcZt1LTXNzJiba9/Y2bmwy0Ob6Q9tv8nnZ2KzgEvykIOIFI9ow/I1DtGMtSTtJ83y5cVkh7jsHSuDHO7wz3H3x4FTsQjn9uw7lHv12jZNFUmNbZbmTik5qPMLI6EK4lQ7A7TNmxONMkfWm/bOg92IQPmJhyd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789265645; c=relaxed/simple;
	bh=+0JcbwgDBAnCe37S1lbW1di/g8nThyfXp0uPh67aoJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ou+fj/4bdCx5GK8v0n3d2uc2lhtVYLfEKTrBDGkrLBmmCMhCjipE5vpd0xS3TvyPpGz0o0D8RG+GSsJR92wD42Db5ZcKbjo1tw5L3r5gxMpUvRkAGM2nXCG5rP3jnm0TeeEY+AzW0R9Hundm/N3YrRoD1EXN6gIrEYFUTO4UM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptsTaoOg; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptsTaoOg"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0fd41a7bso53796385a.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789265643; x=1789870443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=88ICzwtScsGBN29oTXuL8hAaTuiJVGtZYlaw6P8iREg=;
        b=ptsTaoOgWBFz21BIqyw2zsxvI+XBkXCYeB1zkpDXlZ87Uhv4zQJinlkUe/ReTPUYsU
         yo1mv/fDtq++xQ+G7cG7xkCfqYaEOf/TrFnUwjTow/tmlNvQ0JauY8ZqVDwEiCrpHoqw
         U8tK8dSwItuiutFGjU8nTLHN3wYYNWHrTtYHiHXLRkJ7hAbxzwbdVZTXX09j9H2yypU0
         tNLs5OykV0qL+Bjvtz2FBsfmbLoxVHd3iR4RETuPMYJlinK/w07IF5WB7+Yoym/F48Gv
         DN+1DhBqew6V9aJbfu7SWZin3nshKS5VpqcvbmltIwrGx8NCX7H008H47weSdidA8AG0
         D2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789265643; x=1789870443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88ICzwtScsGBN29oTXuL8hAaTuiJVGtZYlaw6P8iREg=;
        b=Z+FFf1KpmjRRZ1oLW9LmeRzd+5sq97JBEJ5c82dxy5h94FjisEWbL/r+9oC19ygueE
         DNdakAu+18i5qPse4K8sQyiiVhek4m4XEl6RcW1vZlpfqaYc2P80DuMjZf8uluES4Paa
         q5ReVyVpuMhn8sz14V7Zp/Utud65lsUDntmi0mCZDmJ14912z+/NfZz69jSc2NOPIhka
         UF5Xz4zlVFM0J8+LoiKA0a8LNug82cmBoyBBSj6j/8G2M0+S9YuoKEiRqqDh6aTRY2xz
         8h/ziZCycsZdMyQrE5VHyK2lR44OMjwjWsgODg5pnvfTyyCYop8Duo8gE8hoH1/JrRGV
         kvsg==
X-Forwarded-Encrypted: i=1; AKwUvBxtoj8fcut2VelrPzma2NX51+Z1aERBkpi+mmRwy+mseVBmeaSmatqqM5KNmyWXr2u4oIAp2zuK/7+vzZc=@vger.kernel.org
X-Gm-Message-State: AFuF++lZBFKzCFiaEgi3Y0FLzQIH3w5+B66cFIris78WObrweqNVVJzf
	BNn1mDsvOjjJ6lttmEjS7rYzC6y+aecES65gYYWltKK/nZWQhJHy6Fw=
X-Gm-Gg: AYBFou3HSniL2FEhxcdde2NsIZ5fa2ZPW+3I1i2M7IHpjuB6NKbvTkYc5nSlqlPpY93
	DUMUtPTkLmEXMgrpEc7GF/zcdmNJTfqCeYTwB4f6r+ogwm9lp2A6tjjZNef/JZIC4EdaTq/XKYL
	1Vxi6afJpR6w2GDmqXIKSmxLF8Zr4aDE5S+cUs7YVcTSyv5RxO2hjDbm1JPTR0Zq/5mctC3r6eR
	ZXmBB2mbLCU2hkU/rTQHnCjAiPwNfl0m5Aobvlm8nttMKQW82II6IiuE3WErvZndZACkOTCA7T2
	mqM66fETOrKEYHE9+jkdHHx43XifwWNzxYMMgFZLqnPK9vyCaWBtuhAT/ToTh9NUvOzSzX56D29
	EvDXmeEz7EHV416ayTrn8M8qCyB/sd5+nXBWAdkKwQQlb7bzF7zdYfsiUtzJoQ/By2urgsqQX79
	egxnUS3cHOWzH46h67favFQynXQUunmB7Nj5mwopOwYDa8ArPlWj5/PYR5YAZBatIvPDwV9QP2Q
	r5DlzGRhlAPQ+sOxgkIXwRSYYXkBnTWytxIhlKQSrNnw4AW6jaCyKqdwpssWwhjazfU6tGtTGDa
	Hh9gxv3GwVoQFhOVG1LkLN2xhxqWujK41w==
X-Received: by 2002:a05:620a:838b:b0:939:9bcf:8d35 with SMTP id af79cd13be357-93a03886412mr757341585a.35.1789265643185;
        Sat, 12 Sep 2026 19:14:03 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e8045d9fsm629778085a.19.2026.09.12.19.14.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 19:14:01 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] soundwire: qcom: quiesce runtime PM before removing bus
Date: Sat, 12 Sep 2026 22:13:56 -0400
Message-ID: <20260913021356.60079-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SoundWire controllers enable runtime PM after registering the bus,
but remove tears down the bus and iface clock while runtime callbacks and
the main or optional in-band wake IRQ handlers can still run. A controller
that is already runtime-suspended also has its iface clock disabled, so the
unconditional clock disable in remove unbalances that clock.

Disable runtime PM first to cancel pending requests and drain any callback.
Free both controller IRQs synchronously before deleting SoundWire children,
then disable the iface clock only when runtime suspend has not already done
so. Record the powered-down state for a later rebind. Bus deletion does not
require a resume: the Qualcomm master has no put_device_num operation. The
core disables slave runtime PM before unregistering each SoundWire child.

A pending runtime resume can run while runtime PM is being disabled. Make
its clock enable failure visible to the PM core and restore the wake IRQ in
that case, so the runtime status continues to describe the clock state.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/soundwire/qcom.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 55678a30c..35e552cc0 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1713,23 +1713,42 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 static void qcom_swrm_remove(struct platform_device *pdev)
 {
-	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
+	bool suspended;
+
+	pm_runtime_disable(dev);
+	suspended = pm_runtime_status_suspended(dev);
+
+	devm_free_irq(dev, ctrl->irq, ctrl);
+	if (ctrl->wake_irq > 0)
+		devm_free_irq(dev, ctrl->wake_irq, ctrl);
 
 	sdw_bus_master_delete(&ctrl->bus);
-	clk_disable_unprepare(ctrl->hclk);
+	if (!suspended)
+		clk_disable_unprepare(ctrl->hclk);
+	pm_runtime_set_suspended(dev);
 }
 
 static int __maybe_unused swrm_runtime_resume(struct device *dev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
+	bool wake_irq_disabled = false;
 	int ret;
 
 	if (ctrl->wake_irq > 0) {
-		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
+		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq))) {
 			disable_irq_nosync(ctrl->wake_irq);
+			wake_irq_disabled = true;
+		}
 	}
 
-	clk_prepare_enable(ctrl->hclk);
+	ret = clk_prepare_enable(ctrl->hclk);
+	if (ret) {
+		if (wake_irq_disabled)
+			enable_irq(ctrl->wake_irq);
+		return ret;
+	}
 
 	if (ctrl->clock_stop_not_supported) {
 		reinit_completion(&ctrl->enumeration);
