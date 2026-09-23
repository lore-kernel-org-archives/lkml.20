Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E6A3242D4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790140796; cv=none; b=XRYBc1IJSV5v/jgNn0xMAaW6s9lFTmoS+geVVXhTI6uxA13+RgDxjaRQHCR/oAkaj7kuvY4hM3Yz2qA+cU/QZyQ4T2tW4hevp/fp4AXfkYvHd+h+9kEaTMlQOsI8gnyQmHDiedNkquahFuoQVmbdx8hHrBjZG+r37gShoIbvlDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790140796; c=relaxed/simple;
	bh=rd4bVtBebW5Eh3X9btyAfOosrbirLB3M1wbnj3/C+mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Taj+/2XLC4IBbdJGYITGe3W6YCg/w4/pIE/HdxM+Bkzz/Bo6BdjZmR42cFdFfXfghNVCGPVHTIWWOeTLHyXLGvNhEr6WqN/0ZKrVkUxhCz7PhAvsU8310Ivbkb1nJtMsjJ/cztCWuw/Y0/fjHdydt17W7oeVzvAS3oxGUkBHqt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uh+9KJWR; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uh+9KJWR"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadea0so39903185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790140793; x=1790745593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xv3eebB7JJQAp3Uiqk1W5LHA/Ob2Oi0cbs08SqtlKHI=;
        b=Uh+9KJWRKSuR4dXeYYSL9Bh7Ke/kxwRKu57nLCFnC++eHkjr50M1zXVBr0+7XbA9eg
         9uLjwwDZ2DuS9FVTA2O0jVXFFwSwYoz6nszwJZAb2SzwCReCzTdXLfBCPKmZIGMgbwhA
         rw78PGeVkXE8JS5kRuG970uyZfvAKjz6b7THA0rwNbXeoGFYAVV5E6V5AhiISOOdg2am
         urfZatCo0upDueOK/brmYxImgN2k+X/JH8votrDrOlmyr+6t0qSukdUrgrVI2Q7N6Fij
         mfgV+9Gz8Rl36mkh1mysd9JRxB9esfYiI8CFsf2Og9irWhMzxwV3Cy0OuAzAykdMgPPM
         +jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790140793; x=1790745593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xv3eebB7JJQAp3Uiqk1W5LHA/Ob2Oi0cbs08SqtlKHI=;
        b=N1mgtoYTHczFnffChNyk7N8abkx9k1tjyDYGt8BpOdXj04l5BdkEPLe7LYArmT7R1g
         SAsE10+zLrCNyrlIssx3Ihx3bwoTronjhRs+7fdVY3edMweZGairrhhy//bKedBe5OND
         AqNr+dBl/rL/i1OQ1fgQg0YZgPN1B/KncfK6gCJbyvm7zy5T5KullrwvsEfgM0kDzHgu
         kqDQxXYSzPcrz8mmZDhiL1IGjgidbhntTIvg3uoGjmOHwr3wLNtLAtfMl1srcwVD7CgE
         a4R963CApBRhyutK4U4r0YxMP55yIKwdaekBWtLiaocdmQkzOrP41LiN8LQDzjCsAY9r
         2BBA==
X-Forwarded-Encrypted: i=1; AKwUvBwflFBVh0wWjEJlf6TgRpMGVZdnlKASJxokaqQ9IoSh0o7+9sjFQosNcVv4K7XcUI+AVwL7nhORR0sGhOo=@vger.kernel.org
X-Gm-Message-State: AFuF++lvRlLEMEpr8Ul2FKnJkvuFzTFZvoMaOpsiFNpwkLlMLyAbGF0s
	ts2NQWKUtxxyMW9Z4a4K6oIhix/geVFBTxuAW045aPMpoqPxnYOYcFk=
X-Gm-Gg: AYBFou3Lfw2i0vhuWkrs/tgLdaRkhJ30MLyGxjeTICB+W+gykB5zSdn9bxZc126aWe/
	kM3gWgEVtcu33mEimdoGugE65lDZ0CZCG2AunjS5/aqfi6Fag7UMPH9cmNgnFWKUeghfZ2LE1dr
	JSLZ1YRswEvn9uyPkUNefujsClWRhBzazWaxgi0nKt2kYwEhwdG4D4QCuRfR674dHjsStTI4nAz
	WnXJllKA59Woumc/1TirgYjR8d6GGS6edVoRrr1Nx2LhRvd/2URCfsZklRGUjy5BM/bCVG5GyAM
	42DayhJir9F49cGsA6XdnR3MzFCo8UDRaREXq4Rmrz/uUp14Jid6BJYEYq+dZrAjpfbZjdJLPR5
	vvsF746mWY2zhLj3TOZXaHxN89ytpl7v4PXcpATXstGaeXoVQpBmmOB/ikx/2rIa+tmr/YSL9WD
	vfHkL5bsCprHsIEKKKXUSwJUNdYthAZCInaemfPI0IfJ0xml6QHLj8EAu4xpQ+DT6u0lAp530Zl
	Xfj9ODy1lSra5sLOReX6XHA7kcd1Elj77yQTLz5SG34etXSZ35oEEDB2vMpylFaaQ636WGLiWxX
	KuJ6EtO9QGC8Fbdx/YapuyjtUuuLKR1ffCuViYh/EE+y2uTqxpQqPyujV2pXUdKPYdjgkcYhr2S
	uGSxwCLXHa6uO
X-Received: by 2002:a05:620a:8810:b0:93b:e917:6888 with SMTP id af79cd13be357-93c251052e9mr240052285a.33.1790140792573;
        Tue, 22 Sep 2026 22:19:52 -0700 (PDT)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248b7f22sm149877685a.37.2026.09.22.22.19.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 22:19:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: amphion: Stop mailbox RX before freeing the message buffer
Date: Wed, 23 Sep 2026 01:19:50 -0400
Message-ID: <20260923051950.89403-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpu_core_unregister() frees core->msg_buffer and clears core->vpu
before cancelling the message workers.  The fifo keeps its own pointer
to that buffer.  The core workers read it and queue inst->msg_work,
which uses core->vpu and may send on TX.

vpu_isr() fills the fifo from the mailbox RX callback.  i.MX MU
free_irq() waits for that callback, not for the queued work.  An open
instance holds a runtime-PM reference, so remove can skip runtime
suspend and leave RX active.

Stop RX, then drain the core workers and the instance workers they
queued with vpu_core_cancel_work(), while core->vpu and TX are still
valid.  Free the buffer and clear core->vpu after that drain.  Drop
the runtime reference only then: runtime suspend frees every channel.

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/amphion/vpu_core.c | 28 +++++++++++++++++++---------
 drivers/media/platform/amphion/vpu_mbox.c |  9 +++++++--
 drivers/media/platform/amphion/vpu_mbox.h |  1 +
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 85cc4a14f8ed..000000000000 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -299,21 +299,23 @@ static void vpu_core_put_vpu(struct vpu_core *core)
 	core->vpu->put_vpu(core->vpu);
 }
 
+static void vpu_core_cancel_work(struct vpu_core *core);
+
 static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
 {
 	list_del_init(&core->list);
 
 	vpu_core_put_vpu(core);
-	core->vpu = NULL;
-	kfree(core->msg_buffer);
-	core->msg_buffer = NULL;
 
 	if (core->workqueue) {
-		cancel_work_sync(&core->msg_work);
-		cancel_delayed_work_sync(&core->msg_delayed_work);
+		vpu_core_cancel_work(core);
 		destroy_workqueue(core->workqueue);
 		core->workqueue = NULL;
 	}
 
+	kfree(core->msg_buffer);
+	core->msg_buffer = NULL;
+	core->vpu = NULL;
+
 	return 0;
 }
@@ -700,10 +702,18 @@ static void vpu_core_remove(struct platform_device *pdev)
 	WARN_ON(ret < 0);
 
 	vpu_core_shutdown(core);
-	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
-
-	vpu_core_unregister(core->parent, core);
+	/*
+	 * Runtime suspend frees every mailbox channel, including TX,
+	 * and is skipped while another runtime-PM reference remains.
+	 * Stop RX first.  vpu_core_unregister() then drains the core
+	 * workers and the instance workers they queue, which may still
+	 * send on TX, before the fifo buffer and core->vpu are released.
+	 */
+	vpu_mbox_free_rx(core);
+	vpu_core_unregister(core->parent, core);
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	vpu_mbox_free(core);
 	memunmap(core->fw.virt);
 	memunmap(core->rpc.virt);
 	mutex_destroy(&core->lock);
diff --git a/drivers/media/platform/amphion/vpu_mbox.c b/drivers/media/platform/amphion/vpu_mbox.c
index b2ac8de6a2d9..521fd47f1d90 100644
--- a/drivers/media/platform/amphion/vpu_mbox.c
+++ b/drivers/media/platform/amphion/vpu_mbox.c
@@ -88,14 +88,19 @@ error:
 	return ret;
 }
 
+void vpu_mbox_free_rx(struct vpu_core *core)
+{
+	mbox_free_channel(core->rx.ch);
+	core->rx.ch = NULL;
+}
+
 void vpu_mbox_free(struct vpu_core *core)
 {
 	mbox_free_channel(core->tx_type.ch);
 	mbox_free_channel(core->tx_data.ch);
-	mbox_free_channel(core->rx.ch);
 	core->tx_type.ch = NULL;
 	core->tx_data.ch = NULL;
-	core->rx.ch = NULL;
+	vpu_mbox_free_rx(core);
 	dev_dbg(core->dev, "%s free mbox\n", vpu_core_type_desc(core->type));
 }
 
diff --git a/drivers/media/platform/amphion/vpu_mbox.h b/drivers/media/platform/amphion/vpu_mbox.h
index 8b7aea4f606c..a934fe61b294 100644
--- a/drivers/media/platform/amphion/vpu_mbox.h
+++ b/drivers/media/platform/amphion/vpu_mbox.h
@@ -8,6 +8,7 @@
 
 int vpu_mbox_init(struct vpu_core *core);
 int vpu_mbox_request(struct vpu_core *core);
+void vpu_mbox_free_rx(struct vpu_core *core);
 void vpu_mbox_free(struct vpu_core *core);
 void vpu_mbox_send_msg(struct vpu_core *core, u32 type, u32 data);
 void vpu_mbox_send_type(struct vpu_core *core, u32 type);
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.47.1
