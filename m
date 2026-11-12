Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491957;
	b=W1XqF9VGuFLCihvlrhR4RlVe2PaLHqsWdvjKLI1sbYFGqEk2So5HHBNP8TbeJDJsyBt5
	 Hf3gM2iMm9KWVxuZLlKPWPhEbzKlJTddJ2sgS0F/pgfSWVGwPxWv6l2QMaYebr/ewQBeL
	 aPNIvSeJW1i5o8qDFLJ1jM98QUALbATf+pFVYcEG3nX8fucbh9LwhYmU4S+Azb3Prk+f8
	 N3TtGeXVV7Wv796lZST5NVyxWN5nGUr0sMraDVgAhSHgxWMjHqTu3tv0mwQt2Ry0ShNlT
	 vAN9vNX12Gi1JLnwBhQ8Nv8QcbRUmK2ve4Hgi9WaVyqptkNp416MJx568zUGUYNJZEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491957;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=q1HoR7hNlrPIp5PubZWERdp8OQFQhAOES8j4XxYkqOk=;
	b=CAUfzLoCXOHB3e8OYNa8KNquR7gMgQpEPuZ8AsAqLwrO2WtKETu4q4L3yPQtss/fTdZK
	 Q4bCYr7o0cjTI7cFKZY4ZJQSPM/d8qVMvhq+VXBwGOVTnhjklpIiBMQpZ3uUeZARHs3e5
	 T1Mh6njVQy91MAi+Hnb02S71DsFRlBRDnU4BhsOLL7eJ6ouTQkXY0LQCTp9bL3bkkuFRA
	 /LJTsfr9z4UhyXwQIFr9+3m+2K3knj/F2ULEXieo/14z1Qmct2EKTHBKY4amVtfo1SgWT
	 duLOmM6eH1pmXEhFrqdqLqDBdTJOFbFR1kYrnqAUKSi/bxkDt51pdTmLN5B2E1aEUMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=JjofPIfa;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF4360A3819;
	Thu, 12 Nov 2026 13:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF4360A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=JjofPIfa
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 547738929;
	Thu, 12 Nov 2026 21:59:06 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: Fix potential HFI leak on IRQ request failure
Date: Thu, 12 Nov 2026 21:59:05 +0800
Message-ID: <20261112-88a3a7ff32-media-venus@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d00e149f03a1kunm7e1bba0d29f7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEpCVhpMTUhMSUxCGB1LQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=JjofPIfa/JyL1bk9Omm4EUpRrPWPE8E/w4dOzC61w52xjOVvcKSi6tJMHkg5nSxSlOWf4uFUxar4XyLU88bcPOlA91oZAKLfNnp/NLniCHQnSAe0m9dImvPLYeZhvHwVl4l9YR3ZcN7zX9zy4Kl2GuBrdCEYfRWxAFbka/XIaOc=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=q1HoR7hNlrPIp5PubZWERdp8OQFQhAOES8j4XxYkqOk=;
	h=date:mime-version:subject:message-id:from;

HFI creation now precedes the IRQ request. If that request fails, probe
skips hfi_destroy() and leaks the HFI state and interface queues.

Unwind HFI on this path. Move IRQ disabling to the callers so teardown
does not disable an IRQ that was never requested, and synchronize a
registered IRQ before freeing the state used by its handler.

This issue was found by our static analysis tool under development.

Fixes: 3200144a2fa4 ("media: venus: protect against spurious interrupts during probe")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/media/platform/qcom/venus/core.c      | 7 +++++--
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 -
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7087af32060f..6a429ed17c47 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -496,13 +496,13 @@ static int venus_probe(struct platform_device *pdev)
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"venus", core);
 	if (ret)
-		goto err_unresv_iova_region;
+		goto err_hfi_destroy;
 
 	venus_assign_register_offsets(core);
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
-		goto err_hfi_destroy;
+		goto err_disable_irq;
 
 	platform_set_drvdata(pdev, core);
 
@@ -579,6 +579,8 @@ static int venus_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
 	v4l2_device_unregister(&core->v4l2_dev);
+err_disable_irq:
+	disable_irq(core->irq);
 err_hfi_destroy:
 	hfi_destroy(core);
 err_unresv_iova_region:
@@ -618,6 +620,7 @@ static void venus_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	disable_irq(core->irq);
 	hfi_destroy(core);
 
 	venus_unreserve_iova_region(dev, core->iova_state);
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e7..20e2494697fa 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1693,7 +1693,6 @@ void venus_hfi_destroy(struct venus_core *core)
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
