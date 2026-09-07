Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42123F4DDD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764017; cv=none; b=mb3QuTbc7PXaBVUnb1UUk4y7y5CeiN+99y9rVtChRn01Porvo+y7lUd3Wbt8zNzbiw9cDKHLe6W8AOYLZfgm0WEa0VBZhHi5pTG7q01J7dRCN1nsjxu8j3ddF8aYo2z6sQHbzR9fTLApvi4lxTD++avVCkj4TT2iDnVaYQgRncA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764017; c=relaxed/simple;
	bh=dftS2wkBALWgTNksVyxycBUcfQzy/IIWfRxto9iOH1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQ55vvHNpBZ4au5TL3XvDgHxvQayf0+AZ8ZhDrElkjqWknCTuTTik8LF/eXeeFL4szRkz92R9GfiGZLH+37yoN3XtPMaGrxX7supvybCfBTPqMVPhoqpShK2z9sarB0qybdrbip/Hq5lQMc1fCPMObweRwRbthY16x67VOHKaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xg6UoCKi; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xg6UoCKi"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2787712a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764015; x=1789368815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0YpADwP/mkKyGO+EKdZI2bBLv0b75u6CTO5qSfwEOn4=;
        b=Xg6UoCKiTvFWUt3w7lpYAVoQFBSmCLepFMXZVPP+J7yK+7c3sYYGtgZWJnUUkyZ9nC
         ASxXhF843g8Fp2Q5d2mOAuoTTgCuaekGw5q3HW97KB1648If0AqoIOs4kQJI7f4pRwB/
         GTN8YP01kGj9a1/yXBA4Ix3Kz0VoMlOZgKCrbzazGEHFjjf7iRkpJiPlre7c0DKdhO9T
         i9ljeAPjm+k1qvTFDYeXzc1u7WdBh3QxdoGlUGQxGzcLub7uW1G4cnPDcaJ5l0qbuxlX
         Ak7zw/78KJKIvXtSicqt1Hf2dlQATkzO0s7YP3lACcANXkN0w+k+ht+c1XqmKZxtLkwa
         eOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764015; x=1789368815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YpADwP/mkKyGO+EKdZI2bBLv0b75u6CTO5qSfwEOn4=;
        b=UiH/cZXYIe+lxnvMQDI7vzZG3rP3Ianimk+SUmKNzIaL9HGidgO7jrqF1EFp4G2SIL
         FZea5rExuqnsVDYOtIu24G/W32cyix2boHxRwla9tEfpr7xIzz2T1BeGJtdN6rCOiYGg
         fBqOVghhyGa6j6jwI9eTBNg2VhqM+ijVvgQO9Uc2OqbaMSLdIXR1glW/h7YhHNGC/o4e
         qrdaiuhTuMis7xZ0n+QdUSXlluj9HiPq4M31pJDX4O+U7XrkJVaewv4ANiB8IP22b3uL
         ZZrkYTehhkbXSuxHKcCJ69yyBj8XMPn/2qhaUgg6gfGqWqU/y0+anwb/NU71B3HPloeb
         7KQA==
X-Gm-Message-State: AFuF++kXP5FNNc9/5kC1cPUIeMgakGtmfI9fiNugWRXsrBFuk5XbgtkW
	QcvAUADUhDablTC4yRqAnZZzUx5Umhqqc/KTfBdW+YPcvJK0ZQ223p1Z
X-Gm-Gg: AYBFou3h0pqRJFCDGRPwWqpQZ5As+I8Zrsx3Zzktt6ZeOXT5zeAo+qP+meaEKG4Hn71
	nr2aLXpelXFYvFqoJj9/X7W53qMa3n7Ggev8gw7b4UGI4ss53tdrMkbds4yuuuqG1QRSjQrbQC4
	ZwkgukI3MDLCtSWTxKB30/bIdLG62Z9kmUxtQOLMfG5mevX019l57cuIz8aUblStc1UYZtQDmzg
	AK5GvijdGdBNT1eapLPyWmUA1jkwF9xwk/kI87/jO7OaPcyjfeyeAiG/Z88XO91LWi9Q2rBkanK
	gR970NPqHJZF/ijs/jUG/IqN0Ue/t+YvX2XpSr2nzzOouVifA9qK+ilaDdYqsvHJPkWVW1UMvzo
	XKX2kZQj9W6onQsNTIqU53KnFQyu4auhvCG4Ev16RiJqECC/+AKDefmzyPauQNWOMNGTvY8Tlmk
	heXJEEwdT+kMJx6o/8+x8KlezwKEILgJ0VfZ42tdrQCCAFaCJcfnXhRrFDo5XQRGVTXy5h0PdoS
	H5FGD3fYJfCFw==
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae0f:5267 with SMTP id adf61e73a8af0-3da3a152a11mr33125804637.19.1788764015179;
        Sun, 06 Sep 2026 23:53:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm24822574eec.12.2026.09.06.23.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:53:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 02/14] irqchip: fix typos in comments
Date: Mon,  7 Sep 2026 12:23:28 +0530
Message-ID: <20260907065328.32009-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/irqchip/irq-mtk-cirq.c    | 2 +-
 drivers/irqchip/irq-sifive-plic.c | 2 +-
 drivers/irqchip/irq-vic.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 914d1d639fe3..d30c34ce0f56 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -247,7 +247,7 @@ static int mtk_cirq_suspend(void *data)
 		writel_relaxed(mask, reg);
 	}
 
-	/* set edge_only mode, record edge-triggerd interrupts */
+	/* set edge_only mode, record edge-triggered interrupts */
 	/* enable cirq */
 	reg = mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
 	value = readl_relaxed(reg);
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac104814..a7cddadddf40 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -452,7 +452,7 @@ static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iome
 		return 0;
 
 	/*
-	 * Interrupts delievered to hardware still become pending, but only
+	 * Interrupts delivered to hardware still become pending, but only
 	 * interrupts that are both pending and enabled can be claimed.
 	 * Clearing the enable bit for all interrupts but the first pending
 	 * one avoids a hardware bug that occurs during read from the claim
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index e38104c5064e..607e3284f700 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -478,7 +478,7 @@ static void __init __vic_init(void __iomem *base, int parent_irq, int irq_start,
 /**
  * vic_init() - initialise a vectored interrupt controller
  * @base: iomem base address
- * @irq_start: starting interrupt number, must be muliple of 32
+ * @irq_start: starting interrupt number, must be multiple of 32
  * @vic_sources: bitmask of interrupt sources to allow
  * @resume_sources: bitmask of interrupt sources to allow for resume
  */
