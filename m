Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C1B42DA53
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790533233; cv=none; b=qWf4EXTEjuGpKGUy0sHP+0i3lJoxFzgOA1uXFBcukokuPalElAucrJGG3MJEWAOnFt2EyN8jEhke87bqD88WmZ/Ct58qsVdp/47N5WRubBdD0GFaD+GjAna2WaSG1v+khyFHBtMyC5jEEylgBw4i7a+oNVWUCiBJ6cLhvmyq0jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790533233; c=relaxed/simple;
	bh=XSQC/81m+2NGyN2HF+46o8gTXzhtxgDYUbfAyk7YscA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MT1Hgy7C1EIyUQLTFkm/zIf7mTfOZrB4g0SLZ8TfcN+sUNMYoiKCnNngPxwZwpGKrZL3lzl3NrfJh2/87CxfPNvuWsm0y1JHddXx9SyBsX8zXzghssLmv9KEnZPslEhiJOMjzQOMokzHzEUpAtPCPhsH+WUqUnb+pSibKKWliVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNrHDuve; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNrHDuve"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so7685235e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790533228; x=1791138028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YmLfvNYngEdzxR1cneHvQxjYljmSjSjM29lfe3X1Ew=;
        b=cNrHDuveTyopJykNGriqrXFu837JfyfWhl512Q7CQRiQItEdra57RewQJ0t2EaMHLR
         YXBmaxI2fdEsNTtq9XxSBTWwRssyw3QBddaMzw8MtI/zxEHfoxB5jhlA/ZSQ3KvPynhu
         zuA1Cuab6oO0jBZmp4Pe0ku3PSeW9Em/k+PQAWGHWb2SnLv/nGnJRhVRMegJd+LRzx5K
         mey1OpLP7nIXarJI+cE5UqEelCGCYIZaNcyg89ZTDyHM/9/eod+C9l/3JpHEXM9xhrA9
         xk4HHdfFJ8OnpQSBdSi/gJ2gJraxmyQDzoJc9QeGJlZZ8dIlrIaqw7wM7orLenQudtA1
         sW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790533228; x=1791138028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/YmLfvNYngEdzxR1cneHvQxjYljmSjSjM29lfe3X1Ew=;
        b=P9IiyLTnXyu3ILlukhx5d0ZukexbDrTt+LEdd0Uzhrrlv2EkvSIITbRwoPntpfWqJU
         Cx6UirTeuKNVgqBK4QE+O1aBqP79/uytjV/NiSfeV5pHFujDaYiJSge6AGjZupum+KKs
         o/IqzJNac/G1G/YWra1lgtT6vIS0wdeI0DHn2Fdx32lBTJp3LvwrvaHsvFPL5xfQ3m+U
         1hMt9QzQLqxpDfmWfmPQfQNMd6VUQlt1uezvkvIDdGp1cun0AqjnXjV8KsoSkVXok0d1
         74rLgTo4Qrh68WH4c2M+5qBgYcsIHrwXIXSY91QSyS9CLldDOHs9SYS2Jpqh++ytPa2L
         Kymw==
X-Forwarded-Encrypted: i=1; AKwUvBytjj+BTpyRFf4YsYdCsroTcdtas14izVXqGierojepN1n3xilWFVp9BP9cXXZFiclXELeu55SrHeIEs4M=@vger.kernel.org
X-Gm-Message-State: AFuF++ksgOMj/ODeWi1YvmQGH9qMU7Rjh8rCvhOpNy/aGD/uGrwB4qd1
	slF8peELow9IxmJq1qQRmndyESaDDkr7qeThJHSVKOceXawm6YYfoJB/
X-Gm-Gg: AYBFou2X86fLFAJHqIdKbSiLSgcgrzoP4N/wOpmvM0E/+We31vaMCEMXlSmPsUpnsJ3
	1T5cK10bn8EYO5AyY9vjdh1ScYHs+2m5WOMXtGcBx1cgB8hXTxJZ6S7VMw8pWyDkpSbyMx3TwOd
	BwZM0j4ILVW+Ii9KbDV/YQczmgyatW0ysX2sIN/Ttgh3IXOeMSC3io8THRwsM1rAlCh33zyJb9+
	nLS/qQkIqyIsyXU6nIrnRm/9Uen+fY54sOwJk4oPiLQQiCbaviTn2xufEDmRTU6ux0GkHyAkCNj
	6P1pUvDsqPW6oCIQl6mVh/sZMlvqsn5GGhi5xvp9O6pxu8TsYyV1xk798IImrfQSWiTw21gztar
	4l0uk9bNr++f1aW86qb1jm6eSWp3mx65lul9rLE2EF9bVJL5c7r9dhqAr5I/4fBAF0t4aGnpruR
	K/ozdGd8DGOiYvRtWmgAlynBcbAfGkHvnwDBKeNOmwumJV+DA1tYYkwM87B2zP8Fv5q+oB7bF/l
	ufvQMfSX7Ir7i7b/kLXd8xlcy6nZRTGvGgiOdM5sxDiYZKpvbrE5pYHiD95ONB2QLQ=
X-Received: by 2002:a05:600c:1908:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-49fffa2221emr59153925e9.11.1790533227271;
        Sun, 27 Sep 2026 11:20:27 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a002d1d8d5sm38371585e9.0.2026.09.27.11.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:20:26 -0700 (PDT)
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Kees Cook <kees@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Abhin Parekadan Jose <abhinjoses@gmail.com>
Subject: [PATCH RFC v4 3/5] PCI/DPC: Add pci_dpc_wait_recovery()
Date: Sun, 27 Sep 2026 18:20:14 +0000
Message-ID: <20260927182017.938565-4-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260927182017.938565-1-abhinjoses@gmail.com>
References: <20260927182017.938565-1-abhinjoses@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_dpc_recovered() awaits completion of DPC recovery and then tells
whether DPC recovered successfully, using test_and_clear_bit() on
PCI_DPC_RECOVERED. The answer is one-shot: only the first caller sees
true.

Split pci_dpc_recovered() into:

 - pci_dpc_hp_sync_supported(), the check whether hotplug can
   synchronize with DPC at all.
 - dpc_wait_completed(), the wait for recovery with its 4 second
   timeout;
 - the final test_and_clear_bit().

Add pci_dpc_wait_recovery(), which does the check and the wait but
leaves PCI_DPC_RECOVERED alone. No functional change intended.

Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>
Assisted-by: LLM
---
 drivers/pci/pci.h      |  2 ++
 drivers/pci/pcie/dpc.c | 54 ++++++++++++++++++++++++++++++++----------
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index cfa0202bf610b..b1d9df904c625 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -941,12 +941,14 @@ void pci_restore_dpc_state(struct pci_dev *dev);
 void pci_dpc_init(struct pci_dev *pdev);
 void dpc_process_error(struct pci_dev *pdev);
 pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
+void pci_dpc_wait_recovery(struct pci_dev *pdev);
 bool pci_dpc_recovered(struct pci_dev *pdev);
 unsigned int dpc_tlp_log_len(struct pci_dev *dev);
 #else
 static inline void pci_save_dpc_state(struct pci_dev *dev) { }
 static inline void pci_restore_dpc_state(struct pci_dev *dev) { }
 static inline void pci_dpc_init(struct pci_dev *pdev) { }
+static inline void pci_dpc_wait_recovery(struct pci_dev *pdev) { }
 static inline bool pci_dpc_recovered(struct pci_dev *pdev) { return false; }
 #endif
 
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 2b779bd1d861b..a6438a7e3d9c7 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -92,15 +92,7 @@ static bool dpc_completed(struct pci_dev *pdev)
 	return true;
 }
 
-/**
- * pci_dpc_recovered - whether DPC triggered and has recovered successfully
- * @pdev: PCI device
- *
- * Return true if DPC was triggered for @pdev and has recovered successfully.
- * Wait for recovery if it hasn't completed yet.  Called from the PCIe hotplug
- * driver to recognize and ignore Link Down/Up events caused by DPC.
- */
-bool pci_dpc_recovered(struct pci_dev *pdev)
+static bool pci_dpc_hp_sync_supported(struct pci_dev *pdev)
 {
 	struct pci_host_bridge *host;
 
@@ -108,13 +100,18 @@ bool pci_dpc_recovered(struct pci_dev *pdev)
 		return false;
 
 	/*
-	 * Synchronization between hotplug and DPC is not supported
-	 * if DPC is owned by firmware and EDR is not enabled.
-	 */
+	* Synchronization between hotplug and DPC is only supported if DPC is owned
+	* by the OS, or by firmware with EDR enabled.
+	*/
 	host = pci_find_host_bridge(pdev->bus);
 	if (!host->native_dpc && !IS_ENABLED(CONFIG_PCIE_EDR))
 		return false;
 
+	return true;
+}
+
+static void dpc_wait_completed(struct pci_dev *pdev)
+{
 	/*
 	 * Need a timeout in case DPC never completes due to failure of
 	 * dpc_wait_rp_inactive().  The spec doesn't mandate a time limit,
@@ -122,6 +119,39 @@ bool pci_dpc_recovered(struct pci_dev *pdev)
 	 */
 	wait_event_timeout(dpc_completed_waitqueue, dpc_completed(pdev),
 			   msecs_to_jiffies(4000));
+}
+
+/**
+ * pci_dpc_wait_recovery - await completion of DPC recovery
+ * @pdev: PCI device
+ *
+ * Wait for recovery if DPC was triggered for @pdev and recovery hasn't
+ * completed yet.  Unlike pci_dpc_recovered(), leave the record of a
+ * successful recovery in place.  Called from the PCIe hotplug driver where
+ * it needs the link to have settled, but not the cause of a link change.
+ * Nothing is awaited if synchronization between hotplug and DPC is not
+ * supported for @pdev.
+ */
+void pci_dpc_wait_recovery(struct pci_dev *pdev)
+{
+	if (pci_dpc_hp_sync_supported(pdev))
+		dpc_wait_completed(pdev);
+}
+
+/**
+ * pci_dpc_recovered - whether DPC triggered and has recovered successfully
+ * @pdev: PCI device
+ *
+ * Return true if DPC was triggered for @pdev and has recovered successfully.
+ * Wait for recovery if it hasn't completed yet.  Called from the PCIe hotplug
+ * driver to recognize and ignore Link Down/Up events caused by DPC.
+ */
+bool pci_dpc_recovered(struct pci_dev *pdev)
+{
+	if (!pci_dpc_hp_sync_supported(pdev))
+		return false;
+
+	dpc_wait_completed(pdev);
 
 	return test_and_clear_bit(PCI_DPC_RECOVERED, &pdev->priv_flags);
 }
-- 
2.51.1

