Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597A414A1E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790528125; cv=none; b=QVsiJ8eE0uq8e6/4+tnvGKMMBD8uDE06RMcJK/1xwABhJi6/YclQbtNjJx/oprGaY7VGJsV7KxVymBYUgMNW5IZcBBZaOSatKrkcIb0YXZgynjDKz11QIoGJdMnIZOf2RkPlqTXekgUR7jLeFJGMTQsixuZmhydBUZj5DVoko8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790528125; c=relaxed/simple;
	bh=cA8/DvTbO0ExzpBzzco0L48mFYDdMD6XjFWWGSpnSpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5ueQwkNoyed3yfD7AKQg0G+RizKTfPoxS7SxAo4JRZ7WlfNabYZ5Ljx9tsUs42t2x1kdiHEePs32aWQOKOtEM57MISBm5EZgUSPVkVrpTA/MeGm/N3PrpD6EOhQW/NJ7fq28ipf78b9A8DMsMmwZapfHiA73kvxjzJoQMjxa5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxG7uswb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxG7uswb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so12542745e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790528122; x=1791132922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTuSGrduqyu3DK4wAPJF2MCmGI7vblXuBOgLU0bscZM=;
        b=XxG7uswbxJu5C8n4x5Xl6aVafRRlup+6UCx6FgPpRrRa0prTvjlGVgPzf0fY9Kcvp9
         MDgJmPCVJClSE/rrrU+teVccPIAdnWJa39PrHYVbUc7TQUslx6X0TYNN3Yf423EuD/ly
         X2v2bLUREsNNpI8GpTb7nt4jTWvp++b8pSrecPkfZ8yb06UQFCexVu60FvkHpu1MCkAc
         ZMuaxv78h+MgLk4IYaNeinSnmbsfhxgOkdQFF/gZNRfi6s0GOhnGUOtsZw3F4GbSbjg7
         zLLCaWhcfRNIF4/J6QEuBSUHnm6PFBZKnOp5BFjCwTInZOGnFw7+oFG/INZmWzvcizGJ
         FAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790528122; x=1791132922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTuSGrduqyu3DK4wAPJF2MCmGI7vblXuBOgLU0bscZM=;
        b=KEIlhVBAa+UwAi3WD6Mh1ng/WzOI4OYWqurI9klbIaVJX4sg2wYXX4yI/FeNhOH244
         OY1JlEW+S/S4YEY706HopcXQ0v0UyNNzwkry+uTldB6HuXvjr9Jx9UlLnV44kznGzIsa
         1FHHxn8fBQxJ9dPCUeGs5i4cC7tiXawkCEh/MEQjdPkjw/xuA0rqDX145IUT1okUTqAG
         cBr/WOAoX4Vh0uD6VCDPfjFMccbYLtYRNl6AoNrklXk5o+5ubYh5W7O9aD5rsGnldtCa
         Dx818U0Nkph+nfMM+nUhOKf8lGTUMa6mP79NRqqPgp2K6r9HVMDxnMHZLVJ2fPZRrFbI
         KLcA==
X-Forwarded-Encrypted: i=1; AKwUvBz+5mPI5sysC6s9aBXumO3A94ZR5yfKqV86nFdGFZEUZuIeqzBxPCNmM8tKLUNBGthpR25lgTlv+asxeDs=@vger.kernel.org
X-Gm-Message-State: AFuF++kaFsHCA16IjfdQfNHKwCPypjAp/0VEA+cHMDTYIvGsMHWwqjlp
	O/n7yicb8UM6pRFmMhqZL5hOthC6weVEQtTJKlfR9+UaEg3ToapQHQ9C
X-Gm-Gg: AYBFou33CkrEZxmjdMp00oUrcW1pYUqruz89h50ujsJPRBQN9oznTReyh2m/IMt+lIO
	yfrx+KXMaqTer91bJiI+2TnCgU5kILcPX5JbFZRuCDqaovSZnB3hcHq/yLHGveHBQKC2Tz7CuEn
	gU4uPj863rPPVMGq2Hs91oiMNjcrgA1Dqm72RoFHEw3u7qscl7JTVKAaI6g1yWK6ofjLj2kZKNu
	HfD2m2/hc+m1tb42EZ1hjJxeBDvsocIhyJLtwogO5Rgp4EpOmNV4CsRPbim8UPCBAR4GfVptz0N
	LkWz3DoFvl2PXqQMpJQt9eTYNOgZ3MwToXFB/rxFM7C7D13CLhrGRqPFpJ5z9lAAaoUktn+vim9
	4iIPYtJ9APXuz54SRcufWg2OLrmr4rGCsq1eeAATw9Ab/5lA4HbQted//SqBJGK6j4zJtMz+bMM
	UUP8YCzXx4jkxqdB/DSuCjt3gc3dK58AlRjbCIvtJv1xndNfcltBpcZMSCghbuPRzlC7llVe2vC
	az6Bn+tWGPTLJ4uz2im1VzsWmHsE4x6vUGpkQQUVeoWMv9ahjGaWH1Du7+BxRulYNl/KNHPVmfS
	Vw==
X-Received: by 2002:a05:600c:34d4:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49fe66d07c9mr170308515e9.12.1790528121995;
        Sun, 27 Sep 2026 09:55:21 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm76167695e9.11.2026.09.27.09.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:55:21 -0700 (PDT)
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
Subject: [PATCH RFC v2 3/5] PCI/DPC: Add pci_dpc_wait_recovery()
Date: Sun, 27 Sep 2026 16:54:56 +0000
Message-ID: <20260927165459.829900-4-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260927165459.829900-1-abhinjoses@gmail.com>
References: <20260927165459.829900-1-abhinjoses@gmail.com>
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
index 2e113806f9f95..ad98e2d9289ea 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -940,12 +940,14 @@ void pci_restore_dpc_state(struct pci_dev *dev);
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

