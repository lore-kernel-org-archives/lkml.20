Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E1D4E3255
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010415; cv=none; b=MTkrJ4o1fI8VWNajeaPfN8eKw3V3sJ25l/JfvtsHoL4D1Y8gxbJG70em4U/g80gPuWt5R2pBpuwdJxtMSs8/jTK3S67bZF/4tM9mK1V82jfe5EOOueutjO5UIbmGG7Jr1tJZswWsIxeFaiokkOLpxtvnS6xRpna/WUYh98X6s7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010415; c=relaxed/simple;
	bh=Ol+o+JAXq5dYlZyih6PceXLRCemV4Y38mFGRIh0RFUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U7h3zZUB8IKCGGt3hszqZvMfeblSzC+4zDYoQc5BUa5qDfw2wBH/bV1ecPKYLCobJhNIXW51DFyjon1GNLVIsAliJlAmZ0bJ3lBl4M3lzydnCWg0h2r1jaT4jkDDT4uI1AM18h57ghVCnlD4V+pg8xub7FTNm3sN8XMJkW4pZio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=YU3K7uay; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="YU3K7uay"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d91ede8035so39333845ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1790010413; x=1790615213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwcsKROG+rZVrILjrCxe0rMudS7EciJJq2bzjW9/XlI=;
        b=YU3K7uayuk5kfs+vI82j1LQyy5y6d9cas2nGw4+ndmzYKeOhr2gdeHKzqpac99qnLt
         a/J41Q9c4R4gh+T6lgbct06oNuhaiEkjYjU5MY9eJ5DyWMTK0QLsyvhyXYFuGaw3fTc/
         97E+SiZdY2nduImn6sjjGc5FBJxyJAWlD2eyr3mA5RlCEbLEUMr/bsDMADOkgiABrErF
         jH2VPhgjbReF/xUMVYXlc5ugUgXch7ceuyouuABO0tO8n7484OS5qQvjPDmdkRsBNZwY
         W039C/rbh+tKdrDkrCZLfUThY6he4SeBFtFVCzumnWQLOEmfkKbYuls8SUAoMBh4xA2V
         9iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010413; x=1790615213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwcsKROG+rZVrILjrCxe0rMudS7EciJJq2bzjW9/XlI=;
        b=NUwhy1T4FVparOI2+toaCBYXr40Ua9uog4tioVpTbgrFMAe+44lXBFwX7oKQguD2H0
         c1t2K6nZuz6CZgN9cAfZAcCpxoVDTfVEXjJhgu0XuS+xgwnfMxcnhJrEUXrmbFJOzYl6
         mk6mqbncNzEOkdXIrUhiF3MPKV0S9W40esziAhyGvUutstnFA3m3X5pqOcyuSdJqCYvC
         7Z5yIRoBOnENBzlOdt8sURGzeVgNexlgQWPTSdbGeuny38qDMh6zrpZ6uUI520ec+3ux
         2XqlNzHOkI1kLbz/HrgGQhDWnGxCvYuenb+sirwwju/B5cQDuY+LcPUSDC7yU3uMt3jv
         rv+g==
X-Forwarded-Encrypted: i=1; AKwUvByy5+b4PleZFYNkYkCWvqcSBwSO18YNyV/4gC0jjHg5id9exqbBWvwGJeoqLTcjZqqKa5vDR5ndWtzHXgA=@vger.kernel.org
X-Gm-Message-State: AFuF++kN0aodnWVh1dZRxggp2o3YBFUU6ib45EWn5XtzTNjTmecEsJVF
	SDlC9n3t8gE5zMyBMzWfTp08Z3hcDNrJeygDoP506G3swzLtVECXbAgg75DuU5PPwg==
X-Gm-Gg: AYBFou18bSnwAfS7+w3o/ueOB9q3iXhhqANgG2JKuWnJN0rkosUi6lIk0MZO8xyaH3m
	pH7YILy37viO3rdd+BUlfLK7hAKUcRmbVkFXgWhqVZP2JKO7hMmL2FKNMzF8cnC0RrsFiQ63TSs
	fNI976Rz0iuxkILe/tqLXHZdEU8ahyW/bbQeIM9fpqlwM2TJz5GYFO1exWDkN1ykwWgbjTgUulW
	S8v+sKIaVpWH/si2jsqibV6aQWygAmNjEV6KYtBzaTWEggcszjPz70x9E6+St4dYBwITTeG5m5U
	dWg7X2OIbnmEidi8zYJ6gKRcm8LrDca9RqOWpWsuhv7SUE7yKAbCTqQvgDzc3Cuy2RnPBwvIx+n
	JHPvv5pv/X5d8uIRdxe07OWlwS9/91IYwC4T1Xoes2h2hVtpwKt6nFjRFCYJv0eEEVUKeke03Zf
	AFtdFGh5zG+RihKqCak7hKCypF+5nEmjWcuVhtvSWLJfNYEIArDoX3lnIVQqjaXZTTeumGZkOU1
	syne3qZUqEv1xmnlC+3v/wU/VBgzY6SwKF9pi8mXwM=
X-Received: by 2002:a17:902:d551:b0:2df:3a80:dcba with SMTP id d9443c01a7336-2df3a80dd6emr83493705ad.52.1790010412484;
        Mon, 21 Sep 2026 10:06:52 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm37147495ad.18.2026.09.21.10.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:06:51 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com,
	lukas@wunner.de,
	ilpo.jarvinen@linux.intel.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yury Murashka <yurypm@arista.com>,
	James Sewart <jamessewart@arista.com>
Subject: [PATCH v3] PCI: Stop waiting for link status after config read failure
Date: Mon, 21 Sep 2026 17:06:46 +0000
Message-ID: <20260921170646.1201148-1-yurypm@arista.com>
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

Return immediately when reading link status fails so event processing can
continue.

Signed-off-by: Yury Murashka <yurypm@arista.com>
Co-authored-by: James Sewart <jamessewart@arista.com>
---
 drivers/pci/pci.c | 15 +++++++++++----
 1 file changed, 10 insertions(+), 5 deletions(-)

Changes in v3:
- Check the return value of pcie_capability_read_word() and stop retrying
  when the link status read fails.
- Do not use pci_dev_is_disconnected() because a read failure does not mean
  that the device will be marked as disconnected immediately.
- Update the kernel-doc return descriptions for errors from
  pcibios_err_to_errno() while retaining the -ETIMEDOUT description.

Changes in v2:
- Check pci_dev_is_disconnected() before reading link status instead of
  checking the return value of pcie_capability_read_word().

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b2879a6be5f8080e949f7abfc4bab39d791735b8..430ff08f4f4b30f12b1190ea9c5408a3a8505a5d 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4565,8 +4565,9 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
  * @use_lt: Use the LT bit if TRUE, or the DLLLA bit if FALSE.
  * @active: Waiting for active or inactive?
  *
- * Return 0 if successful, or -ETIMEDOUT if status has not changed within
- * PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return: 0 if successful, -ETIMEDOUT if status has not changed within
+ * PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds, or negative error code if
+ * reading of link status failed.
  */
 static int pcie_wait_for_link_status(struct pci_dev *pdev,
 				     bool use_lt, bool active)
@@ -4574,13 +4575,16 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
 	u16 lnksta_mask, lnksta_match;
 	unsigned long end_jiffies;
 	u16 lnksta;
+	int ret;
 
 	lnksta_mask = use_lt ? PCI_EXP_LNKSTA_LT : PCI_EXP_LNKSTA_DLLLA;
 	lnksta_match = active ? lnksta_mask : 0;
 
 	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
 	do {
-		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+		ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+		if (ret)
+			return pcibios_err_to_errno(ret);
 		if ((lnksta & lnksta_mask) == lnksta_match)
 			return 0;
 		msleep(1);
@@ -4603,8 +4607,9 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
  * according to @use_lt.  It is not verified whether the use of the DLLLA
  * bit is valid.
  *
- * Return 0 if successful, or -ETIMEDOUT if training has not completed
- * within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return: 0 if successful, -ETIMEDOUT if training has not completed within
+ * PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds, or negative error code if
+ * reading of link status failed.
  */
 int pcie_retrain_link(struct pci_dev *pdev, bool use_lt)
 {

base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.51.0
