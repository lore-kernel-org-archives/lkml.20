Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07245198B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520435; cv=none; b=WWn0ISOGdXhcI/ZpYUsegrad35eBBuVaF1TjbwT4Ug9GDieoR1OD5+tAauXZ/G8bJwFUawmIJh1XVuPwCgxo2hI2zKyv2uoipg/PjvSXENXRYp900vU8Jag80vg38XAkOwXUZ+YR/8Kf7okIlmv5aB1miYCk2GKNemKZkIUXwEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520435; c=relaxed/simple;
	bh=Y8T6yLy2yGEI+APB3IYjDn3KveHumya5KjHfGlJCvyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mRaw3rD8/jb02NcjSD//yz087q3kLtZTqPJfTT0JRMSkF8/DGq/nKioLZRaMjmfkWHvqoRhYiQSUZ2kP6XZ0NE/mTLfiWxRBoe1NDEOw8C61yyPs3+/a5kzy8wJg36nYpFJc8CImDsjgWFviqIkpWDSg3K/PTz/F1mI/ILsHZyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=Bf5aRlps; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="Bf5aRlps"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d7195706f1so9750915ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1788520432; x=1789125232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOtfsRW4UXMS4fgRA6s6kxtseIqwUyKdipeNtq+aXP8=;
        b=Bf5aRlpsGP6FsVqN4x34nJ57jo3Q3NVEUZgRcbC0F4TR7my4lAvQ4qhHUxamL6SKct
         IgWafYRfeFezh6HQDxeG3/aSCbR/yF9LeKpmHI4WYAG55t09I0yXEeiHwr0bx/vGmxyn
         Vb8xvQ2vnqIavgt5QfULQhvKlnmG80HkW7T9nLxPcnG2p8l/FPimB4q5ZDYXVmfH1F/z
         EBylCAbQJJ0XCLCBURghZLdj+iAC6Dz5aehneBER9VWC/Uhd6WOimmxA/oraok9JGJR7
         bOc3k1t+kRkkU0TWNRyTte9LzsJ+d+TgDCcdgXRI+caxGQJ+W8K5qb6vDrgefRRApjYv
         wZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520432; x=1789125232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOtfsRW4UXMS4fgRA6s6kxtseIqwUyKdipeNtq+aXP8=;
        b=IBadPcITkgxSZXqTad+qwAX/SXqm1yADG+ZzaJK38PXLJgWRmobm8LAAohQY5p8cd0
         /YcI+T3KP37aIN06NlEMIGFNlL1wZG46bOQgSq239hL9HK9OnUTiVRAs7wI6+9+arwhD
         4YLH5FR8SF8PkVVnD3w+MW7pj/ksDr1tq/kZseHQGdkas4wq+PGeDCN6eSW23N2sCL17
         tWG/hlU7H1fQAvw+K8sTJt1D+80JYRp0WfJjBwf+9dKgc32eUX3IeBHEcOsvVBO7zBcx
         FamigkRKiGo9Qp7mumYgrRjpEzlmgLQrAMljWeeVQXI5/E3LLNXtsKY+QDEGLU3RKcch
         HCqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkyd8S7RNMNQhg+0mw3YlH33R4lbgpzdCklvyb41WRsq/Cn59fxsG6vmLHLa+X2bxrksbJJL0+SVb9Lpc=@vger.kernel.org
X-Gm-Message-State: AFuF++lxPOvsFcGCYOFg4bosO4KsVpT08DarenubfaMLw/krk7R9dZQz
	KIYVkueHGEANfPxPnLEdXoYFlyU8KGjcn6SKfQtvyS3GwG5GLEHYp9+lM9wFYBvOHQ==
X-Gm-Gg: AYBFou1EYZ1BVpL7ArnxOC1vezJiwBLn1i1jkfo3AWWsDXSovERZcpGWZ3fZzJ2v/bz
	dZX7vJNXPzTF9FxyluWxXXShlChdWCJuWkcCqdxaxd6wiC2dy82Si+dV4V1Zwa8WOvwGbNp5i92
	LDdRAs/7IVM39K7JweoIu1NrTbhlk3+6TLrro5mLPcFiS0UCbzotelQeW+QFAEknxX59JE+It40
	7DzCQ1aU3no3j3Gq8SWCRUyh2+0JksJ+RVT7h6mSoLjJr/vVxlSydbQ2M3XpWvHjAEa/K8q955l
	PX5N7vHGy6nWiJunUfG4qoKsge57dDInXdCSVrZRHLVHy+1uFvHZX5I1QfHZZBmpp+63ToLtYtn
	3PzoBO2E1jD+khx8ee6MNTPMd38WhKlZcxtTs5tV2B6Vi8bdXel/UpGPCDHTvm2A71hsOjqry67
	N2IezfxHD0hIGusJly+XVnWbrb3yQgjgkamtUgcKHziBEVV3y/dGI3Mx6X77vcckSxV4Hl3Lxjc
	bElalrsJqIwCvpxA3/V
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr9646311a91.0.1788520432198;
        Fri, 04 Sep 2026 04:13:52 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm6037999c88.11.2026.09.04.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:13:51 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yury Murashka <yurypm@arista.com>,
	James Sewart <jamessewart@arista.com>
Subject: [PATCH] PCI: Stop waiting for link status after config read failure
Date: Fri,  4 Sep 2026 11:13:18 +0000
Message-ID: <20260904111318.1063858-1-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
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

Return immediately when reading the link status fails so event processing
can continue.

Signed-off-by: Yury Murashka <yurypm@arista.com>
Co-authored-by: James Sewart <jamessewart@arista.com>
---
 drivers/pci/pci.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b2879a6be..a568d5ac1 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4565,8 +4565,9 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
  * @use_lt: Use the LT bit if TRUE, or the DLLLA bit if FALSE.
  * @active: Waiting for active or inactive?
  *
- * Return 0 if successful, or -ETIMEDOUT if status has not changed within
- * PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return 0 if successful, -ENODEV if the link status cannot be read, or
+ * -ETIMEDOUT if status has not changed within PCIE_LINK_RETRAIN_TIMEOUT_MS
+ * milliseconds.
  */
 static int pcie_wait_for_link_status(struct pci_dev *pdev,
 				     bool use_lt, bool active)
@@ -4580,7 +4581,8 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
 
 	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
 	do {
-		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+		if (pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta))
+			return -ENODEV;
 		if ((lnksta & lnksta_mask) == lnksta_match)
 			return 0;
 		msleep(1);
@@ -4603,8 +4605,9 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
  * according to @use_lt.  It is not verified whether the use of the DLLLA
  * bit is valid.
  *
- * Return 0 if successful, or -ETIMEDOUT if training has not completed
- * within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return 0 if successful, -ENODEV if the link status cannot be read, or
+ * -ETIMEDOUT if training has not completed within
+ * PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
  */
 int pcie_retrain_link(struct pci_dev *pdev, bool use_lt)
 {

base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.51.0
