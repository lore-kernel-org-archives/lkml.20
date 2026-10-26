Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046420;
	b=GkaA37UkzY5H35+KczybPQyYQ6Mr0C1kFw5kw2TCRfd6ZBeisi1R2g8OiuSj4VOW85pa
	 4WAYiQUuQOqYTkHYOqwMTqJQO/RYwUugME7njE29/GnZU6WoFsGYbrOYa7jwtroukz5yb
	 xqsCbhaVBgsBAZHp+sUQiPTVcDSnDJZjPi2O4fN2Viw4l5/xDddG5nN2frl6/xW4976sO
	 p0ITnxgvYJV7fSKW1+6qUMXL48NoHBCtwZ/PCjWJxsjVrbGbyuwno7MV28n3cIxFzRMuu
	 XOslDyOuGmiXX/kDaZwT/IJ5s3A83DNmkG6VLuKLsFW8yi9UJ/gt4OysxmoMSHLqXdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xVGU6u8I9I81Dy5biX5l7sqw5Y6L3E/3yFeQDovPiro=;
	b=w0g2H0H8zK0b4TicrUOmdCGDCjMFIcL4vPHXaSSMVXNF/vtlhWJjrlxSHdTctCs1pGrs
	 Atn04e19hOrJmCji7JVo0ZenM6Q1JjtnMkssyWdMKJ13zh+hSfZYb06bTcB3tl75lmhxp
	 osN99FiVCTIcQnpYl7Hfv7Nl4DQ+0/+8cGoGvyUm71lG8HkmHzi8HJR1NQ/hwz+KmRo4q
	 pytpE6EsmwpuKqSIDjnWXBSqUZNE7NJ9KgkxEEn4y4e3k/a4x9r8kvhsBsfqMVh1ptotX
	 lkAXJKbZ54yBGLxoeF34nyNyq1l6ePMpKojSwfHmyhMV5Ysq7KSlnzfpZLF/O/scnQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TdhsmT4a;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1567606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1567606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TdhsmT4a
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so29562135e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046418; x=1793651218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVGU6u8I9I81Dy5biX5l7sqw5Y6L3E/3yFeQDovPiro=;
        b=TdhsmT4a/cUqCmC9KIOY0x2L+L1Wh18an084AV/M2PnU9akY2yRJ5npaGhKFyi3hJO
         xXW8A1v5DdrqYmVYGk4j5lo9BfS/T4OnNHbqi/MyJQod9E1xdE9iuJVuVzEIfuS9tVYH
         pgiL3p5Ni/1e8ZgGJ1jVgUZfG7Jj2hbfLWzuknejeAiT6C0qzRQR00sqwSiANN1hfHi0
         Y22OkxNW5RoD+5culXs+pW67soIdYQ0EsinF4zh+bsNPCFFZWVG149HEwbl30Cz0xFxa
         iCmwuFBZWCfZa9djaQD8J3NPG2sgmJzLwXXhSFE4pqep3VXQhIFBfED+TGEMfxGcPlpd
         FO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046418; x=1793651218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVGU6u8I9I81Dy5biX5l7sqw5Y6L3E/3yFeQDovPiro=;
        b=h4XA+5hxAo+9OMDWAJCh9Llv1yEnjMdmwRxFIg3Y+iQZ9n0EILRz/i88PPf6HPv4UR
         J8vQ5tchs2ZWlOv68Gql04ET1DjYm+2+zoCJQcHQfOj6mu4ei0dOl0N0mEpCJDbz3w7y
         Q+MRFkQAmoCLcW0Mbn+agtgbN5Yt6sDcE47ngDk3uU5GskefV+jYtEJ4zNGGCiaFzbAf
         AQZwk2jGVsLBV6isMIHyzr/y9vpcppBxH/82JVnBJYwYyI2HeQ7LZJl4OD52uiSg1fal
         opXe/N1Da2xiDKr3/ANJkrSVy3HLOW907ASVtwK8krh3HrnVGR8WX/87pKmzb11NqYQc
         Uoww==
X-Forwarded-Encrypted: i=1; AKwUvBxGJsN8ZK5eGACMDAYZvzcs521dT7iHYdbzpVTEH6vmdSsrquALAsIf9vNQ/BdK4V5FTAdYf3pQo3j9mKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgd11zXf0bU7saFEW67cduxStQWhE9j7wn3CYkAwPlms8k7H9r
	Vosg5WH809VCmuKJUPv4PSs0qXK1+cCx3VRLqterOUEPWDS41PlSIBSb4YxQFniI
X-Gm-Gg: AYBFou39HnmV33FFZTwMpH94RyQ5HdUMkGdMH2a9y1kG4Nk2GGCL072UPOBgidmOOpB
	JcHjZSMQV4UJft1rm9+NoeLYUNpaGo+z8l1gB1AxtYQ0Mcv+9yuSzdtLxoJhNoc4uXgrukcKhDC
	4d+NRjNkmkjygMaCuvH2wOH2E116XAkwrMgeXC05c7Bkl6Lj7kPACxjgagzbAWAjWOkQbSwh5Qt
	2qEZLA5Bn3yTXYSTOsz/TydKITpkqQGcDHrznrL/rhXnRdiubMGvi3eCBxQWmPztTQole0PhS2E
	EmSMg7uuM6uRypR3P6I4m8RKVeEP+2dlm6b+8Oxc2xEDp0not7W8Lda26AWkC3JfjR1ZzJRRwMk
	0oYnhCV7a7NBmgFfeWeld5X7hHAo0Z2tbGUKgl+gmR7HNuylbJTBQR8AQ3ahq0IVqPkocSHHtss
	YAaTHMe89DrOdUwKt3KbfMXPubaAzauxs9Q3rijGm5sT7aWhU8MDvLOa6O4uOERQPlqiAfr5f3x
	rMfWsSZznudQOrm4051dz+iRm7o830aYNdWao3iMfpMkzZ5dxJeEvR8Bfa8oSmS56o=
X-Received: by 2002:a05:600c:a012:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a35ac95b2dmr135170795e9.16.1793046418191;
        Mon, 26 Oct 2026 13:26:58 -0700 (PDT)
Received: from unicorn.lan.internal ([2a0d:3341:b894:4600:8f9a:af38:72d6:7c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a046fefsm276775665e9.5.2026.10.26.13.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:26:57 -0700 (PDT)
From: Giuseppe Piscitelli <ooonea@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI/PM: Serialize PMCSR updates against PME handling
Date: Mon, 26 Oct 2026 21:26:45 +0100
Message-ID: <20261026202647.669817-1-ooonea@gmail.com>
X-Mailer: git-send-email 2.54.0
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

PME handling and native power transitions independently read and update
PMCSR. Config access locking protects individual transactions, so a PME
worker can read D0, another CPU can request D3hot, and the worker can write
its stale D0 state back while acknowledging PME status. This was observed
during normal runtime PM of an NVIDIA UCSI controller, followed by a
D0-to-D3hot refusal message.

Serialize native PCI-core PMCSR writers with the existing capability
lock, releasing it before transition delays and readiness waits.
State-only updates write zero to the RW1C PME_Status bit to preserve
pending wakeups. Read fresh PMCSR for each PM-reset transition instead of
keeping a stale word across the cooldown. Keep the literal-zero power-up
write.

Fixes: 58ff463396ad ("PCI PM: Add function for checking PME status of devices")
Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
---
OpenAI Codex analyzed the passive trace and wrote this fix and its local
tests without changing the running system.

Earlier validation used a source-derived RW1C model and four KUnit tests
on Linux 7.2.11 in QEMU with lockdep. The tests use a fake PCI bus; no
physical hardware, PREEMPT_RT or other architectures were runtime-tested.
This base was checked for applicability; no new build or runtime test
was run.

 drivers/pci/pci.c | 44 +++++++++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d79d2ee..3628886 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1315,6 +1315,22 @@ static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
 	return 0;
 }
 
+static int pci_pm_set_state(struct pci_dev *dev, pci_power_t state)
+{
+	u16 pmcsr;
+
+	guard(spinlock_irqsave)(&dev->pcie_cap_lock);
+	pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
+	if (PCI_POSSIBLE_ERROR(pmcsr))
+		return -EIO;
+
+	/* PME_Status is RW1C; leave pending wakeups for PME handling. */
+	pmcsr &= ~(PCI_PM_CTRL_STATE_MASK | PCI_PM_CTRL_PME_STATUS);
+	pmcsr |= state;
+	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, pmcsr);
+	return 0;
+}
+
 /**
  * pci_power_up - Put the given device into D0
  * @dev: PCI device to power up
@@ -1380,7 +1396,8 @@ int pci_power_up(struct pci_dev *dev)
 	 * Force the entire word to 0. This doesn't affect PME_Status, disables
 	 * PME_En, and sets PowerState to 0.
 	 */
-	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, 0);
+	scoped_guard(spinlock_irqsave, &dev->pcie_cap_lock)
+		pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, 0);
 
 	/* Mandatory transition delays; see PCI PM 1.2. */
 	if (state == PCI_D3hot) {
@@ -1537,8 +1554,7 @@ static int pci_set_low_power_state(struct pci_dev *dev, pci_power_t state, bool
 	if (dev->current_state == state)
 		return 0;
 
-	pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
-	if (PCI_POSSIBLE_ERROR(pmcsr)) {
+	if (pci_pm_set_state(dev, state)) {
 		pci_err(dev, "Unable to change power state from %s to %s, device inaccessible\n",
 			pci_power_name(dev->current_state),
 			pci_power_name(state));
@@ -1546,12 +1562,6 @@ static int pci_set_low_power_state(struct pci_dev *dev, pci_power_t state, bool
 		return -EIO;
 	}
 
-	pmcsr &= ~PCI_PM_CTRL_STATE_MASK;
-	pmcsr |= state;
-
-	/* Enter specified state */
-	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, pmcsr);
-
 	/* Mandatory power management transition delays; see PCI PM 1.2. */
 	if (state == PCI_D3hot)
 		pci_dev_d3_sleep(dev);
@@ -2311,6 +2321,7 @@ bool pci_check_pme_status(struct pci_dev *dev)
 	if (!dev->pm_cap)
 		return false;
 
+	guard(spinlock_irqsave)(&dev->pcie_cap_lock);
 	pmcsr_pos = dev->pm_cap + PCI_PM_CTRL;
 	pci_read_config_word(dev, pmcsr_pos, &pmcsr);
 	if (!(pmcsr & PCI_PM_CTRL_PME_STATUS))
@@ -2433,6 +2444,7 @@ static void __pci_pme_active(struct pci_dev *dev, bool enable)
 	if (!dev->pme_support)
 		return;
 
+	guard(spinlock_irqsave)(&dev->pcie_cap_lock);
 	pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
 	/* Clear PME_Status by writing 1 to it and enable PME# */
 	pmcsr |= PCI_PM_CTRL_PME_STATUS | PCI_PM_CTRL_PME_ENABLE;
@@ -2453,6 +2465,7 @@ void pci_pme_restore(struct pci_dev *dev)
 	if (!dev->pme_support)
 		return;
 
+	guard(spinlock_irqsave)(&dev->pcie_cap_lock);
 	pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
 	if (dev->wakeup_prepared) {
 		pmcsr |= PCI_PM_CTRL_PME_ENABLE;
@@ -4564,17 +4577,18 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
 		return ret;
 	}
 
-	csr &= ~PCI_PM_CTRL_STATE_MASK;
-	csr |= PCI_D3hot;
-	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, csr);
+	ret = pci_pm_set_state(dev, PCI_D3hot);
+	if (ret)
+		goto out_iommu;
 	pci_dev_d3_sleep(dev);
 
-	csr &= ~PCI_PM_CTRL_STATE_MASK;
-	csr |= PCI_D0;
-	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, csr);
+	ret = pci_pm_set_state(dev, PCI_D0);
+	if (ret)
+		goto out_iommu;
 	pci_dev_d3_sleep(dev);
 
 	ret = pci_dev_wait(dev, "PM D3hot->D0", PCIE_RESET_READY_POLL_MS);
+out_iommu:
 	pci_dev_reset_iommu_done(dev);
 	return ret;
 }
base-commit: f4319f548f7d8cb595ac1c91bfd459876399eeb3
-- 
2.54.0

