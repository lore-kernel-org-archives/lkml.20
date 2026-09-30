Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A384FECC1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777995; cv=none; b=J9X11Xn3Jr+RuehWp/Q09JWG1wfybC/urNDtHCGyQq4RGdLPvoDZquuP2BS6A53B2bX9kj+UPklXzTsY3QqzVlUMzLz9a9rROv/F/OZdxEEL7lQJPiIDpkwsmB3q4RvDZEYSk/weWRbHnzpkwHI7O8x2HMuXhAEIbHMg2BD+U3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777995; c=relaxed/simple;
	bh=2oInkUujHcPCh8EJktDLrE1G7/16ov/wJ8PVeHJP2EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OIRXqAVBe6DFBv9NRDosiAnEihSAs2B5Sai1b2pI+Z6CeH/OyylosoYrh/miEMpfZtaKUl+F4L6if+SF4sughof85gG3tNhMusrsLav00bWn0ShrK7h2XsGorI3FPpFMAuxMfO3dvGxsdl8QFbFBeU/F4JUCaXG4od/Cm8RNvrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZJ3S8pP; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZJ3S8pP"
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-988ce014459so616890241.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790777975; x=1791382775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPD3ctKAhlH9IMFL9cYeG+/h14+GIMiWdqV4FDDyoAU=;
        b=WZJ3S8pPFnuC2dMbajh9W5M3YNLKpForsUtngNSUsZp6/Lv5kEGCMIVZAza4DxFjzF
         eY1MjvyT5yKaV7qtfrcurEaNOuayPm0q34iI7dLGVmzQfRg1k9lrIWzSGx2ByhIXn+mz
         y5KrSw4A5jsywZG4UxlX57d5ToN3ZjerEsq8R6wdcrcoOgN/7s4EXoz27xjeQZGMs5/J
         2j/kQGuMUJLHpyRk9AtwILS93qIsY/51wq1Q7t79x3AiJfd7S/WbElDLTsGRA7/2U3iI
         TAy5ntnTvvOi+2+R/DW7QNSnkFV5DqGEYR+TaiBNBCD+RZ6nuXB7GVbznKcQD73pyKtP
         x06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777976; x=1791382776;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPD3ctKAhlH9IMFL9cYeG+/h14+GIMiWdqV4FDDyoAU=;
        b=Jaxeb/ZYxGpL4ThsJq2BdS16HbTMOUdJnBGjsfiATZ3/CedO1cq0xCpDYcCIO0EUA+
         xKCIsd7LM+gIOyyV8+26+16Dl52q3KZ4NzxC7kz8YJMl6NvRZRY3ZaS8ybxLN3oQhDTS
         6qBgChxEuRtrN5gEtH+ZZPY+ZYtSfnqS6vohL1rcCq9yJ8ZZ6IaWpe0rWOyQdD/68sOz
         Gc1VkQwoYTuw9u0YnRAj/sVso8GP018tZbidVTUvUIDeJXh4HVKHYKS3+xZacDFnZtEu
         HqIde4XxZYl+WjhckeY8z5DjOZVXrLw0TOjQlN4t79gtX+JogyDKRn9sy+GMGNeoB6oM
         SeUw==
X-Forwarded-Encrypted: i=1; AKwUvBy7s7v8b5pFDB00BXRdsvvb8c3O2WUPr8G8btZhGvhpx7O5kXWN16KSP52miFO4zkJnC3rpBLnLxhm8quI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL04mNz0lTQdsMxWKyx7J2MReoJp05tZsOZXTkda4eYDDx3VaCN
	XgE6mLbCGvURzkrM62uIIBSyvLcnZOmqn3Gf3Tlks9l/mtMx1E2WgKtu
X-Gm-Gg: AYBFou3ujqsX3L6W7ZFWkJTwBaj83wUpSpU20tnd6RkOTYw5Qi8+z14nhGjqs4MBZaT
	EHnrvlRkVXVZRLNXvLmhYv8jHvFh1HxP2hL0WY9VgKwhU9osjult9lAm1dKI/cHaTZkhngAUtaA
	aYF8SEnmMOY6P625gMNpjWsoeNajNFBYcmQuOR6dKz6Dbl746FW3irBOVp0YxtQXdrKnrgAHO0l
	2t7v5X/Sd8TOTz6LHj96E0yTm3FOgPUlFiZb2IjZQMW383BlSCVAOj5rkVj7p2c7FslEOYPLegc
	LHt7UxhLF55hEeaTDQAtXvUZfXOgomVbmbb40pF6LgfgCz0SpucclQQcB69mvQeVJUtlExRLkhL
	qxSI7T4sK5QproBXpJv/cK7A5/i25Pmeq/8sdBUu3ks53/JfJ5m9lEMO+g6UfvSRHa8Of3IgWTC
	69Iezq3Qn4oubkIvZDIpvESuyfUU7YowV/5BReo6778BamGD+tQbEgQQaJhaKE3eCEb+kzVLw+s
	9zVkCzzbhcYPBoUxJZP
X-Received: by 2002:a05:6102:3f0f:b0:7b4:7086:876c with SMTP id ada2fe7eead31-7be7339ad07mr406198137.23.1790777975383;
        Wed, 30 Sep 2026 07:19:35 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988d909c4cbsm1793220241.1.2026.09.30.07.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:19:35 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] PCI: Do not mistake an absent device for an active link
Date: Wed, 30 Sep 2026 11:19:14 -0300
Message-ID: <20260930141914.6678-4-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930141914.6678-1-fbeltranmillalen@gmail.com>
References: <20260930141914.6678-1-fbeltranmillalen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a bridge is no longer accessible, its Link Status register reads
as 0xffff, which has both PCI_EXP_LNKSTA_DLLLA and PCI_EXP_LNKSTA_LT
set.  The code that waits for the link then takes a dead link for an
active one:

  - pci_bridge_wait_for_secondary_bus(), for ports up to 5 GT/s, decides
    that the link is up and waits PCIE_RESET_READY_POLL_MS for the device
    below it;

  - pcie_wait_for_link_status(), used for faster ports and by
    pcie_retrain_link(), reports success at once when waiting for an
    active link, and times out after PCIE_LINK_RETRAIN_TIMEOUT_MS when
    waiting for LT to clear.

Treat an all-ones read as the device being gone.  All callers of
pcie_wait_for_link_status() and pcie_retrain_link() treat any non-zero
return as failure.

On a MacBookPro14,3 whose Thunderbolt controller does not come back from
S3, the downstream ports of the controller are 2.5 GT/s ports that no
longer answer.  Resume spent about 65 seconds waiting for the xHCI
controller behind one of them ("not ready 65535ms after resume"); with
the pci_bridge_wait_for_secondary_bus() change it gives up on that
controller after about one second.  That machine never reaches
pcie_wait_for_link_status() in this situation, so that part has not been
tested.

Assisted-by: LLM
Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
v2:
- Also check in pcie_wait_for_link_status() (faster ports and
  pcie_retrain_link()); not tested.
- Say that it is the bridge that is gone.

 drivers/pci/pci.c |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 94de99d31..2e31d18b2 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4586,8 +4586,8 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
  * @use_lt: Use the LT bit if TRUE, or the DLLLA bit if FALSE.
  * @active: Waiting for active or inactive?
  *
- * Return 0 if successful, or -ETIMEDOUT if status has not changed within
- * PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return 0 if successful, -ENODEV if @pdev is not accessible, or -ETIMEDOUT
+ * if status has not changed within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
  */
 static int pcie_wait_for_link_status(struct pci_dev *pdev,
 				     bool use_lt, bool active)
@@ -4602,6 +4602,9 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
 	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
 	do {
 		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+		/* All ones means @pdev is gone; it would look like an active link */
+		if (PCI_POSSIBLE_ERROR(lnksta))
+			return -ENODEV;
 		if ((lnksta & lnksta_mask) == lnksta_match)
 			return 0;
 		msleep(1);
@@ -4624,8 +4627,9 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
  * according to @use_lt.  It is not verified whether the use of the DLLLA
  * bit is valid.
  *
- * Return 0 if successful, or -ETIMEDOUT if training has not completed
- * within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return 0 if successful, -ENODEV if @pdev is not accessible, or -ETIMEDOUT
+ * if training has not completed within PCIE_LINK_RETRAIN_TIMEOUT_MS
+ * milliseconds.
  */
 int pcie_retrain_link(struct pci_dev *pdev, bool use_lt)
 {
@@ -4858,8 +4862,10 @@ int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type)
 		if (!dev->link_active_reporting)
 			return -ENOTTY;
 
+		/* All ones means @dev is gone; it would look like an active link */
 		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &status);
-		if (!(status & PCI_EXP_LNKSTA_DLLLA))
+		if (PCI_POSSIBLE_ERROR(status) ||
+		    !(status & PCI_EXP_LNKSTA_DLLLA))
 			return -ENOTTY;
 
 		return pci_dev_wait(child, reset_type,
