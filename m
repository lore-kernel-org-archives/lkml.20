Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301644;
	b=TUgawhLRjtBstK8RoBs93jG3TNAHNGsICQc0hGH119HToNwaKGbbclROZ2J4OvcxyZIg
	 aEblPgfLtt4VrSqZc99+h0nHL4nC88L0eDAyVCR6vxmvvOwrJhjSqd4NQN60LkBAxJInN
	 EteJEkc6fN5c65Y78VApoisg8RP4zp+O9+a4yHI15aSdrIgU/7MefIqBCaOwtF7nMB2a9
	 IKSjF/3jBLpGrINWHg4kZBP/udxcdvFH6+EN+Aq5pq0+8rvo9f8GhHL3Ht+A9+6zB7Fs5
	 eJb8/XAHWRdKrtTQ1CTSchBkURa4a+G7vMRpmg5ZReFQxL9fTZ0dyxI+LkaejQtsfBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oLQ+mmN5dLQLmkoJUCAuKfUnNuDhfYCRTO7wyp1kLyI=;
	b=tX92vYQLSav5uyfRLGeD6PxYA4hDmEHLdoSsM8nXn9okgy8WO711jNJS7/hUkF2iLJj0
	 B3B6Q+Lh0gEuyPTrmNt55qsn9+QvfcAaqU/PL/fbpMB3ttdvtROKovFP6dFMRGe/Mhmoa
	 KmbxV//5e3vQm/bLuIE8xl1qI4Ds3TrByNbSciw9Mgn71A3Tn3Bx6yTvD7uuPGlcXwCB8
	 cWarzvCubp+f+WzLbM4fpplSW49bZNBMYQUNUeBJD9zkMKji4mPIDA9aWQh8pIKCELPKG
	 YxJ9On+aorACw8lrZMDcUvJhKPTFIaZ8HDojLJPyDYGsKGFDZP7OgFpZkxNxQKXVN/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lsNs9LwW;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92570606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92570606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lsNs9LwW
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67a6b2a2259so2035500d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793301643; x=1793906443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLQ+mmN5dLQLmkoJUCAuKfUnNuDhfYCRTO7wyp1kLyI=;
        b=lsNs9LwWwBdIbm2FihFgxoP/fMqkuzDz9ocenyA/JzEWYK52Q6R0nyMw6B8yNQSkKR
         YRbMh3bDBWU5FpLF7oWl1GQA2SJne/g46o0VLzbEJtiflvIG21gn/+8AW75Sc48Clgcl
         XfP5O7A/S9UCLq1iUkNOzYvWp+N9tCxZZpoKNEiQF+cJaFDsNa3n424jLMynJrL+M5pG
         x//bVIyWx7WOm8wjKG0Dd0lYrzIWWRuXHTpmfKEa94d55KBXu/HOv9aSL1DL8vmpSL77
         hZSjAEO0lYcQfhXNArbWuG4XqrtHR2FTpa+sFcOggOw7W5GcHezrsvAII+H6gvVYVyGN
         NS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301643; x=1793906443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLQ+mmN5dLQLmkoJUCAuKfUnNuDhfYCRTO7wyp1kLyI=;
        b=Ap89+oXmETEEf2/7PYMjD3n/zNG77Om7CfINg/mtrL80T9P9Z4qUM9gkR2X8GzNYVe
         wsdrRyIzd9J3Shj4zCzDBfEql8Y4VDIG/yOjUXvBu+cRcsx0cQYS04pyGnW8Gg3XYGCj
         Nza6lKqC28SizX0nvNLY5jvIugxdy/HJ+hZdJA6zBUS3tSt0r/pcgfFeah3zFqwDre6d
         hENfR2lTzmxNXJutkDf7TYqxb7i3txsUsKQK5F67SwtcGdDuT/+vPha/YoYyyZVE3F69
         gCxSQuNQBygd7bGbklmn6j6nlsvXk5qpfu5B7DVwd4twVaJELcepP0rUAhCQoOqIm9jA
         /Uxg==
X-Forwarded-Encrypted: i=1; AKwUvBxWBto/auObz/sqRXe8qr903o9a5SnvSEjKZfM7OrAT/ZBZZjpViLNRVRCcUHExOTIz0H42vrclC6XlLvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJroegK/vfd4c8stbXVmcLCh8nWztlAPmf9h8MAgZYbGZDqMxX0
	rYDhg4DklNaTP8pOua5J/PVxRXRvCrnGtEFGuDqrt16C+DmT+US57dJ/
X-Gm-Gg: AYBFou1O43MbFDz0bDoZysCztbI+xK/7VLoGhsGiN3sl480iLYXVgZ3AE/1YioC5VPC
	yDQi4t3BJ0Jkte5Frn//oan4DFU9i2TxG43LIeIAoJFFrtfSAQmT+aMTfjwMzNE9dGjGo7RumUI
	i5DjqsXjn0xd/Twu8YRM/5+6kmxgnlsmlRQ5ZgrZypYyMRj6q0+MBCKO6JmfcEvha0OP2ZrNjvi
	gKYiSVzBNFXslPl4B3jvrkcjudQFH+gj9JGngA283SSvZnciZ8wjok1vijIrQvHGQozYI2VWk5E
	4EnN7futzqD4WSBayX95pGN8ra1svMrf23mjcNMFw+i6wpxBgUccNfsUx6zAMBoNQDR2GRS0BBK
	Kujo/Js2g3T8pN626n1Rjj4XfWJ9vp6GXJ0vb110/1fRep0Si3GEdWO8DeyZ7QdH8zIpHHQ71hI
	1+nLYcQVQJA2O6w3I18x6XH0ScL0Blq6XX9U+wadXCPnrQQSHvjRHaZp0v47I6bc58l+2JDim6H
	jwG96GN3JGfjFKqP5zlo+iPWG5MMnLrDsDt8umndulhdg/7onnswGzGRhiMNVMtNT2W7irQirM/
	t1jqe8FNWoms5GWBpJ/EUgVl6K/I
X-Received: by 2002:a05:690e:4812:b0:679:9eb4:45fb with SMTP id 956f58d0204a3-67ba502320emr24880d50.133.1793301642649;
        Thu, 29 Oct 2026 12:20:42 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:45::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba3a97758sm147801d50.23.2026.10.29.12.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:20:42 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Alex Williamson <alex@shazbot.org>,
	kvm@vger.kernel.org,
	Nikita Vetoshkin <nikita.vetoshkin@gmail.com>
Subject: [PATCH v2 4/5] PCI/sysfs: Use user config accessors for link attributes
Date: Thu, 29 Oct 2026 12:20:28 -0700
Message-ID: <20261029192032.1325629-5-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029192032.1325629-1-thepacketgeek@gmail.com>
References: <20261029192032.1325629-1-thepacketgeek@gmail.com>
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

max_link_width, current_link_speed and current_link_width read the PCIe
Link Capabilities and Link Status registers with the kernel config
accessors. Those don't check block_cfg_access so a read that races
with a reset goes to the device mid-reset and can fail or return a bogus
value.

Use pcie_capability_user_read_{word,dword}() instead so the read waits for
any pci_cfg_access_lock() holder (e.g. pci_reset_function()) to finish. For
max_link_width, this means inlining the pcie_get_width_cap() logic
instead of creating an additional helper with this single calling location.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
Tested-by: Nikita Vetoshkin <nikita.vetoshkin@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 drivers/pci/pci-sysfs.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index b37a285d717d..a272f8583a8f 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -208,14 +208,16 @@ static ssize_t max_link_width_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	ssize_t ret;
+	u32 lnkcap;
 
 	/* We read PCI_EXP_LNKCAP, so we need the device to be accessible. */
 	pci_config_pm_runtime_get(pdev);
-	ret = sysfs_emit(buf, "%u\n", pcie_get_width_cap(pdev));
+	pcie_capability_user_read_dword(pdev, PCI_EXP_LNKCAP, &lnkcap);
 	pci_config_pm_runtime_put(pdev);
 
-	return ret;
+	return sysfs_emit(buf, "%u\n", lnkcap ?
+			  FIELD_GET(PCI_EXP_LNKCAP_MLW, lnkcap) :
+			  PCIE_LNK_WIDTH_UNKNOWN);
 }
 static DEVICE_ATTR_RO(max_link_width);
 
@@ -228,7 +230,8 @@ static ssize_t current_link_speed_show(struct device *dev,
 	enum pci_bus_speed speed;
 
 	pci_config_pm_runtime_get(pci_dev);
-	err = pcie_capability_read_word(pci_dev, PCI_EXP_LNKSTA, &linkstat);
+	err = pcie_capability_user_read_word(pci_dev, PCI_EXP_LNKSTA,
+					     &linkstat);
 	pci_config_pm_runtime_put(pci_dev);
 
 	if (err)
@@ -248,7 +251,8 @@ static ssize_t current_link_width_show(struct device *dev,
 	int err;
 
 	pci_config_pm_runtime_get(pci_dev);
-	err = pcie_capability_read_word(pci_dev, PCI_EXP_LNKSTA, &linkstat);
+	err = pcie_capability_user_read_word(pci_dev, PCI_EXP_LNKSTA,
+					     &linkstat);
 	pci_config_pm_runtime_put(pci_dev);
 
 	if (err)
-- 
2.53.0-Meta

