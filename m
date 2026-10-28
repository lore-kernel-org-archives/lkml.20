Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793230620;
	b=0VziXzaORnLJNree0HRGgScO+Ysm10U0RHjagNsq2kfB1zC7xo1UMSasuIn7CKF7dzWD
	 xcJ9tW92FoG8JfLeTca3NpC8iVcuABSlSWqJ4JDDwQp+A5gerKw/5kWJC5JMx0Z6gnAIr
	 slm3qrWFwSxXv5c9sbSkaObBc4C0JpF2CORSsQXPZUD5f+SD0JIoIvixZs4jlcyTZLdmE
	 x4Sh6ma7cAQhyktU+/iIifDC2NArLahOY+mIIdlnCDN3ZAAl5nEdIughSbzu6aDbBo8uU
	 0n4tJ1cEiSMOI9gOgAv5jYBE+HotS41zs6n3Ie1k2nr2pys2nQ7V6IMQUkdafUHLmKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793230620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=P5uccmtD7uHPZQe6RVP+drkPGR4BqjMdb1TsK1mrYKs=;
	b=a7zNdIaP6tash6KbIgSiwZZotFKQpVqfN2YeC9UHC7PUDK1ERBnDFv/YKVm/SfKvtwOs
	 MZam82GzuiocCo60zNDNkQ9BULicaI3D6iY5fKfVPvH9sfcKCaKq/K6UtxTzs2KBNhlR5
	 H0h0BEUBFDRnG3yamGfpRW8V3Mb95nCLhGUvRmBUipfgJAxYzD5UKGL+c/dZ87B6FW05s
	 DdImcVnrn3Pj4BUw1S7uRXwadRTs1iCCj9vP9+YDQeBGlkUa6F3cDnGxajyk/GsCe/pma
	 eCZG6pRFB72Ld0435fFTCYHoawoOjTS1ioN36DRIcHSVAYue2tP/jx93skwAd+G0lMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--digonzal.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DqTpdMrh;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DF2606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DF2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--digonzal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DqTpdMrh
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3692c5b061bso4208748eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793230618; x=1793835418; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5uccmtD7uHPZQe6RVP+drkPGR4BqjMdb1TsK1mrYKs=;
        b=DqTpdMrhb0gEPsgQr3kzA70KsY5CM5R4tu7PrqohQzszSTeM3bkQ/YFraJl0UiZi9T
         qcGIBxV8DUMeyw9zh+Pm9fAIEV0e3tO6beBRPBwiqv2cekESp9sheTY+a27bEhbEb+rd
         W7SEJ+jFRjRMjJow8yQ/mZa7fka+pyW24D8gpn+TlPmE8+nTIrtf3mSVtLnyyr/lR6R1
         vP0+QJaG4Vby/ZMWeNaldKqfMJcNrrnWVQhj3t/ZzFCMf2vLmVYyQb3c0ihP7Gk+KQuj
         Wxe8RRBlPbk7zx7GB0+4bN2vuebAZZbFZU4exzNhilpa5kZ5invRJ8mEBrIffYgkMj1P
         rMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793230618; x=1793835418;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5uccmtD7uHPZQe6RVP+drkPGR4BqjMdb1TsK1mrYKs=;
        b=RE2SNmn7OyzUU/00LFzLbm6ptGr6T7wWdEM9p6BDBUkpO2qUdqmv3ZQWS71c/zB+c6
         uG8jbtKnY8s/XJ/CDt3/q7spxqdy/dvpA++3SCG9OzIcrjjsretzxuwUHLJS7QYocbWp
         EwbI5yVwu7PMurwK6Xb3YzeUAnBWl6qQpQ7UjWNwkMVRotSHOws+Uo2gkN07ESBuRsbY
         OX87Kmvl6NzrpXp6gV0AdGQ6uc6LaaoBu+YDuWWbnSklWXudf1j0sINBoJ6hP/DjVoM5
         J5koizs06PBVVhlemyRhpwegLCjTuc4BXTFKDiR0qvBksRrJ4sy+6oipLJY3nDrt0Y0S
         NHuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbWVbiou6F6hMOspBZ0vJa8f+ew7FA+Yh2C2c1GKnDx1sWSXFL6piHPQ3i3/5qzSGvhAifjSFgVGEywVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSGbnwuiGo+kcpsQLQgTU9u45vM81Z8+n8xKHVTXwgohqGd84a
	lm0ZuZ6oJmC1X2KaFIHNE2tVsakzmV57H60geC6mMemY5+isM06aEzfa2XLJzB5Np09sMF60K2M
	0S8yvBFCpOECUJA==
X-Received: from dycui21.prod.google.com ([2002:a05:693c:6015:b0:353:7f27:8a45])
 (user=digonzal job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:60c6:b0:369:fd32:79fe with SMTP id 5a478bee46e88-36a203cd26cmr5864269eec.17.1793230617856;
 Wed, 28 Oct 2026 16:36:57 -0700 (PDT)
Date: Wed, 28 Oct 2026 23:36:51 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028233651.960835-1-digonzal@google.com>
Subject: [PATCH v2] PCI/ATS: Disable ATS when ACS TB is set upstream
From: Danny Gonzalez <digonzal@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: David Decotigny <decot@google.com>, Sheena Mohan <sheenamo@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danny Gonzalez <digonzal@google.com>
Content-Type: text/plain; charset="UTF-8"

Enabling ATS allows an endpoint to cache translations and initiate DMA
requests with Translated addresses, which an upstream bridge with ACS
Translation Blocking (PCI_ACS_TB) set will block as ACS Violations.
Because pci_enable_acs() preserves existing PCI_ACS_CTRL bits (e.g., from
firmware, a kexec kernel, or "pci=config_acs=") without relaxing them,
PCI_ACS_TB may remain set on upstream bridges.

Add pci_ats_check_acs() and call it from pci_dma_configure() after
pci_enable_acs() to walk upstream bridges and clear dev->ats_cap if any
bridge has PCI_ACS_TB enabled, leaving the endpoint to use Untranslated
addresses.

Tested by booting a machine with an endpoint advertising the ATS Capability
behind a Root Port with PCI_ACS_TB set; verified ATS is disabled and the
system boots cleanly.

Signed-off-by: Danny Gonzalez <digonzal@google.com>
---

v2 (based on sashiko review):
 - Move the upstream ACS TB check from pci_ats_supported() into
   pci_ats_check_acs() called after pci_enable_acs()
 - Use pci_acs_enabled() instead of reading PCI_ACS_CTRL directly

 drivers/pci/ats.c        | 20 ++++++++++++++++++++
 drivers/pci/pci-driver.c |  1 +
 drivers/pci/pci.h        |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 9cb23780093d..0395612f3987 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -31,6 +31,26 @@ void pci_ats_init(struct pci_dev *dev)
 	dev->ats_cap = pos;
 }
 
+void pci_ats_check_acs(struct pci_dev *dev)
+{
+	struct pci_dev *bridge;
+
+	if (!dev->ats_cap || dev->is_virtfn || dev->ats_stu)
+		return;
+
+	/* Do not allow ATS if any upstream bridge blocks translation */
+	for (bridge = pci_upstream_bridge(dev); bridge;
+	     bridge = pci_upstream_bridge(bridge)) {
+		if ((bridge->acs_capabilities & PCI_ACS_TB) &&
+		    pci_acs_enabled(bridge, PCI_ACS_TB)) {
+			pci_warn_once(dev, "ATS disabled: upstream bridge %s has ACS Translation Blocking enabled\n",
+				 pci_name(bridge));
+			dev->ats_cap = 0;
+			return;
+		}
+	}
+}
+
 /**
  * pci_ats_supported - check if the device can use ATS
  * @dev: the PCI device
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index e16aa59dd7ac..9a1856def5bd 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1713,6 +1713,7 @@ static int pci_dma_configure(struct device *dev)
 	 * quirks.
 	 */
 	pci_enable_acs(to_pci_dev(dev));
+	pci_ats_check_acs(to_pci_dev(dev));
 
 	pci_put_host_bridge_device(bridge);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ba3c3fddddc2..cf2c93761d81 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -961,9 +961,11 @@ static inline void pcie_walk_rcec(struct pci_dev *rcec,
 #ifdef CONFIG_PCI_ATS
 /* Address Translation Service */
 void pci_ats_init(struct pci_dev *dev);
+void pci_ats_check_acs(struct pci_dev *dev);
 void pci_restore_ats_state(struct pci_dev *dev);
 #else
 static inline void pci_ats_init(struct pci_dev *d) { }
+static inline void pci_ats_check_acs(struct pci_dev *d) { }
 static inline void pci_restore_ats_state(struct pci_dev *dev) { }
 #endif /* CONFIG_PCI_ATS */
 
-- 
2.56.0.313.g2479322e68-goog

