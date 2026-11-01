Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551381;
	b=MahuZzgkqgrGFyqGxP0bCXEgeGCHGP3ht2FUbkWkdzxtUEG+OmZXF0rveZSXLCH5DduF
	 CUx1w0tJNqs+RHH9HBvE+2KFu4VT2rNrx6Aw+O11rTIO8RgwgraxY0JvEuXum2e+K5JIN
	 AjRs1V3xgBn9WW0qlu++PhrS9J/k0ErzX5ryEU6SBfkJQoBZWQZatfXsbY3gTBq1kDVRn
	 yLUfTiRTCGGN+Ggx97ZAXtjjmB9cQnuyAn1KTOC0mlybUeImsFleRCeUlcNvl+BWC0rX5
	 4G5z/u33bWFzQtX6uVBiDLHYltrHjuUgEpxzFdtG9+KzGncTkjuCE5qIYkv+JitKPaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nqSPqL8yjaU09QPPfgAWe8HPn4ku6hVjF8Y+SAe+d9U=;
	b=dlDQtUcI2+kIcQ4fdpgz0QUMjwi+lCq6pvmGr+262OcWkCrPtJ1/boHCSfwqjglltdo+
	 h1giOPAz5UB91luGvvWKK+675cAjNGWnXG/9JKTDGM7AYVSY2I9R5FLaV/uquYR6NMcBt
	 Qri96HMcri9kV8CtqltWU73ZZ+EgD/dqLPGJaFYmvH/jYICbs2H7nxC2HgQv2Z/AigBHI
	 zHTS6MT+su4/BW/N0DtNVVH4tEwpoM8louNttqPAiFy/KZAc6xoaESyz9fr3Y8p6P6XLA
	 +WMgYJEDC5rbeRHEPZ4HfUt/zBhB0Xp2tCf1swy/VVsdy0sCWF31zWTAIPGRreOHfzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ler5jBfN;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E65A606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E65A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ler5jBfN
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so3631773a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551379; x=1794156179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqSPqL8yjaU09QPPfgAWe8HPn4ku6hVjF8Y+SAe+d9U=;
        b=ler5jBfNdB0+YhpwAf2om5N9kE/dn47PDFSiVVPhQqJwi4Q+kCy4Kel5oKcffZbjXj
         8d/KArdqZZTK1mEjFsT3NGlYGWjyl79+cmny5A07lzUhLUrMEuCfmRVvYGPcHQu/6Tq4
         u9IPpfztx1NRxf2rWEE+5GjV56pyBSjEWO8HgC91POIXQjK8YSdt8Qdjb0+LcTDmf63w
         QtWMO/A4suz4wBqwwIlZEBZPKZDT8us88rOD4EGE/DZpG9lTuzeZz5lC3MLdvmNx6HYm
         YfKTi7lZa0e/TAoKT1Kk8yTR47CExXw4cqvt7SZtJfj+mQA3EJdwhrRI0Pm/N3cpwBFU
         9lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551379; x=1794156179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqSPqL8yjaU09QPPfgAWe8HPn4ku6hVjF8Y+SAe+d9U=;
        b=dhA6l93asNE/1M43B7V5wGLwbaKsHWGhsuZHaXqzce1ZL98L/N55r/bNyp86sbHcwQ
         JmBiKMrCz7QtNEm0HhT1aPmp3EUcIQ8FXtK0jWSjRLaO6L0Ryq/MAuPxU5fCWytPqAaz
         fh40c88yiJqJBQfBOfzHhMiEwZeAW7Pg6L6cbf6Gm1mxRUAiNc4ZlyLNimuOZSeQQ6BX
         uvstolBb9pN5Y3Ywn13DqFnfuwt6kFzzUX46H+nVy0nbpVeikuT5QXRl1f7zwRTTcpOZ
         RdDyKffpcnhQf0wTFe72zUYeGf3T+aK0/1AvTJgXm0MjqKkbq1baVLGBwXwDzSHqoMou
         22dA==
X-Forwarded-Encrypted: i=1; AKwUvByT83zMd5FuDfr7Qc03hv9fb08ri8+TzimYykkvk6vBkTEtPgbUqsLMAp9NlbXWq247qT3H69OOrQtOt6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UjJIDfTx3kUrdehEFC0PIj+6meO7cRm57FSQ3SfY0of1Jalhl
	8ccx8LDvTw0OhM1LruZlC/TMTYjq8kO4IbCEK8C2cC+YkI7IFhlBvqRPJdrbPnBfiQ==
X-Gm-Gg: AYBFou3qDH8S6Wn0IqBl14dpSwSiXKlmip0VzBmY8eNHGv8TNzPVjnRdKct5/Tyirfp
	sWUNVG4Y5SD5vWusIsO0bz25EG/+77iOeSxgvSPn4U9fYNhd8IM5c7j3peRImXTzjg3ztP1oK07
	vUjYKNrvEKCFuD5PYIhwX+hWuVFDj4iBOzk570nEA8rkK37UV58sEyaI2d1vnu9ENJ/GPYS4UwB
	KQMdE9NybFwRlVbXaJalKUNRmqFlBQPwUfvZ1aY3lrHraUSkim/jybr4nf0mKopR0PnsG6G14a2
	vvzEjoKp4IsLZIjSOuaJuQrpqgzEZBmfSOzJ6Bfa6TiXG0uhg/0B0DrsTbvVP1nkygl0yoKeGJB
	dcxuc5b/mMVyDUgb4kajwizjyeOrjRTOHaHZC1Ajuj+D9RlX29yXBdRTDMdkMaj60NCaZSJPNtH
	9ltYf/drygG3ppriHPHRz1VZryTMKUSnqDlPdjuJZGEbRC7ZCGb7x4LVbk+pp1tfL2w7coYdxXP
	QT85kGdDIrLZLtvZIJftrSUaMgVC72kkkr5rcMb4PTtyCnSd+1JgRiXpChYDj/3VC7/WnywrGQP
	ME5UqwRr0vhiHJ0KuQrTG9rtKppiDue10asW6iHAipFVs59G+wBvooyDJRAvLoPgiITwyxpAVJ9
	hQ3Quz8TohtTMh0Ts/KiVAu1wiOKN/gZlnOekzl2LEOvav4ehcTVm7dLfqTSx25xASONpEGikuH
	iZP/emhnfBpLnxEwuSHoY21DXZo/0H9lkK4Ynox+Y2ciyaGXyc9l/qC49FxdYeka1URJ0ZO4YFD
	3dJgqWYN36ATCnYovrXnk8Ms9oOc1GhXNISZEKt3q1ztmugNxJZKPQYzjD1Oq4h
X-Received: by 2002:a05:6402:d0d:b0:6b4:1d53:5185 with SMTP id 4fb4d7f45d1cf-6b4d467ca70mr5007157a12.16.1793551379106;
        Sun, 01 Nov 2026 08:42:59 -0800 (PST)
Received: from Desktop ([217.26.238.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec91e2f2sm2261112a12.0.2026.11.01.08.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:42:57 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sun,  1 Nov 2026 17:42:47 +0100
Message-ID: <20261101164247.258200-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCI ath10k devices are capable of multiple MSI. The QCA9889 of a
Xiaomi AX3600 advertises 8 vectors in its MSI capability (Multiple
Message Capable 3) and, when granted all of them, raises the firmware
interrupt and each copy engine on its own vector, the layout ath10k
used until commit cfe9011a05a8 ("ath10k: remove MSI range support").
Since then ath10k asks for one vector, so all its copy engine
interrupts and the NAPI they schedule run on one CPU.

Ask for as many MSI vectors as the device offers and spread them over
the CPUs, starting each further device on the next CPU. Every vector
keeps the shared handler, which schedules the NAPI that services all
copy engines, so the copy engine to vector mapping does not matter for
correctness. With one vector nothing changes.

On the AX3600, with a station uploading 87-88 Mbit/s over the QCA9889,
the HTT copy engine raised 36891-37590 interrupts in 14 s on vector 6
and the WMI and HTC ones 165-313 each on vectors 2-4. The receive
softirq moved from CPU0 (21-25%) to CPU2 (21-35%), with CPU0 at 1-3%.
Measured with idle-priority spinners, the CPU time of the whole system
stayed within the run-to-run spread: 25-42% of four CPUs against 22-34%
uploading, 14-35% against 10-37% downloading (3 runs each). A firmware
crash forced through debugfs recovered as without the change.

Tested-on: QCA9887 hw1.0 PCI 10.2.4-1.0-00047

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Tested on OpenWrt's ath10k (Linux 6.18 with backports 7.2) and on
ath10k-ct with the same change, where the DesignWare PCIe MSI of the
IPQ8074 lets each vector run on its own CPU since commit eaf290c404f7c
("PCI: dwc: Enable MSI affinity support").

I used Claude (Anthropic) to help write this patch.

 drivers/net/wireless/ath/ath10k/pci.c | 64 +++++++++++++++++++++------
 drivers/net/wireless/ath/ath10k/pci.h |  3 ++
 2 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488..4de789cd06 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -38,6 +38,9 @@ MODULE_PARM_DESC(irq_mode, "0: auto, 1: legacy, 2: msi (default: 0)");
 module_param_named(reset_mode, ath10k_pci_reset_mode, uint, 0644);
 MODULE_PARM_DESC(reset_mode, "0: auto, 1: warm only (default: 0)");
 
+/* Spreads the interrupts of each further device from the next CPU on */
+static atomic_t ath10k_pci_num_devs = ATOMIC_INIT(0);
+
 /* how long wait to wait for target to initialise, in ms */
 #define ATH10K_PCI_TARGET_WAIT 3000
 #define ATH10K_PCI_NUM_WARM_RESET_ATTEMPTS 3
@@ -1943,8 +1946,10 @@ static void ath10k_pci_irq_disable(struct ath10k *ar)
 static void ath10k_pci_irq_sync(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	int i;
 
-	synchronize_irq(ar_pci->pdev->irq);
+	for (i = 0; i < ar_pci->num_irqs; i++)
+		synchronize_irq(pci_irq_vector(ar_pci->pdev, i));
 }
 
 static void ath10k_pci_irq_enable(struct ath10k *ar)
@@ -3164,18 +3169,42 @@ static int ath10k_pci_napi_poll(struct napi_struct *ctx, int budget)
 static int ath10k_pci_request_irq_msi(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	int ret;
+	int cpu_offset, cpu, irq, ret, i;
 
-	ret = request_irq(ar_pci->pdev->irq,
-			  ath10k_pci_interrupt_handler,
-			  IRQF_SHARED, "ath10k_pci", ar);
-	if (ret) {
-		ath10k_warn(ar, "failed to request MSI irq %d: %d\n",
-			    ar_pci->pdev->irq, ret);
-		return ret;
+	/* With several vectors the device raises the firmware interrupt and
+	 * each copy engine on its own one. Each vector schedules the same
+	 * NAPI, so they only differ in where it runs: spread them over the
+	 * CPUs, from a different CPU for each device.
+	 */
+	cpu_offset = atomic_fetch_inc(&ath10k_pci_num_devs);
+
+	for (i = 0; i < ar_pci->num_irqs; i++) {
+		irq = pci_irq_vector(ar_pci->pdev, i);
+		ret = request_irq(irq, ath10k_pci_interrupt_handler,
+				  IRQF_SHARED, "ath10k_pci", ar);
+		if (ret) {
+			ath10k_warn(ar, "failed to request MSI irq %d: %d\n",
+				    irq, ret);
+			goto err_free;
+		}
+
+		if (ar_pci->num_irqs > 1) {
+			cpu = cpumask_local_spread(i + cpu_offset,
+						   dev_to_node(ar_pci->dev));
+			irq_set_affinity_and_hint(irq, cpumask_of(cpu));
+		}
 	}
 
 	return 0;
+
+err_free:
+	while (--i >= 0) {
+		irq = pci_irq_vector(ar_pci->pdev, i);
+		irq_update_affinity_hint(irq, NULL);
+		free_irq(irq, ar);
+	}
+
+	return ret;
 }
 
 static int ath10k_pci_request_irq_intx(struct ath10k *ar)
@@ -3212,8 +3241,13 @@ static int ath10k_pci_request_irq(struct ath10k *ar)
 static void ath10k_pci_free_irq(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	int irq, i;
 
-	free_irq(ar_pci->pdev->irq, ar);
+	for (i = 0; i < ar_pci->num_irqs; i++) {
+		irq = pci_irq_vector(ar_pci->pdev, i);
+		irq_update_affinity_hint(irq, NULL);
+		free_irq(irq, ar);
+	}
 }
 
 void ath10k_pci_init_napi(struct ath10k *ar)
@@ -3235,9 +3269,12 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
 	/* Try MSI */
 	if (ath10k_pci_irq_mode != ATH10K_PCI_IRQ_INTX) {
 		ar_pci->oper_irq_mode = ATH10K_PCI_IRQ_MSI;
-		ret = pci_enable_msi(ar_pci->pdev);
-		if (ret == 0)
+		ret = pci_alloc_irq_vectors(ar_pci->pdev, 1, CE_COUNT_MAX + 1,
+					    PCI_IRQ_MSI);
+		if (ret > 0) {
+			ar_pci->num_irqs = ret;
 			return 0;
+		}
 
 		/* MHI failed, try legacy irq next */
 	}
@@ -3252,6 +3289,7 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
 	 * synchronization checking.
 	 */
 	ar_pci->oper_irq_mode = ATH10K_PCI_IRQ_INTX;
+	ar_pci->num_irqs = 1;
 
 	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_ENABLE_ADDRESS,
 			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
@@ -3274,7 +3312,7 @@ static int ath10k_pci_deinit_irq(struct ath10k *ar)
 		ath10k_pci_deinit_irq_intx(ar);
 		break;
 	default:
-		pci_disable_msi(ar_pci->pdev);
+		pci_free_irq_vectors(ar_pci->pdev);
 		break;
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index d114778edb..252044dd63 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -115,6 +115,9 @@ struct ath10k_pci {
 	/* Operating interrupt mode */
 	enum ath10k_pci_irq_mode oper_irq_mode;
 
+	/* Number of MSI vectors, or 1 for INTx */
+	int num_irqs;
+
 	struct ath10k_pci_pipe pipe_info[CE_COUNT_MAX];
 
 	/* Copy Engine used for Diagnostic Accesses */
-- 
2.53.0

