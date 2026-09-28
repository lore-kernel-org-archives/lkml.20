Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFF834887B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617236; cv=none; b=K5iAznykloNVaPm7ADhK0xXM8TjrprHJBg3B5utDuSUc/2pqoWCF7/P2ztA7U9qiZhIjVuucjDkR2yrtX4T2co6QERGfl4tZw5wGZsRZqcVRR8u6uNKMeJPyseVT4oqILL0NWqMsMLHj5l+dTKo1zK1a8KPeNwP6Oi+udczHWc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617236; c=relaxed/simple;
	bh=egCjPYrpj0utXu6SkvCs7DAxmpJxg6GIRoCVZ1sislQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JOErrjS3uO7uRdVwxmpjl2Lx52/aiHukf2lZHlLWQP5XYwPKWbdPvL9aM+y/quyCZlFcaE5IQ8zCCK6+EVyem7PEtLZAirJ0K0/VauXf2DKumMXorY0fDbYjpHUpGnQlbjX3BbroMBm8VS6QeHYiPwV7ehvhlqU/vKazO2xRf/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m/+wC2Re; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m/+wC2Re"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3193360a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617235; x=1791222035; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnJQd6bdeFsZrWHaIElFpdpCIChAmHD+YCH6lWp5XiY=;
        b=m/+wC2RezAeb4p4jDP4rF2BiWSUVjdySFvM4/G+EcPVaX00Zpx41X/uP/eqUs9lPHd
         skq+DD0plJCIXhL0ZLGogiXcyJDOzQt83wc9nPTc5zT57zDHEswv8VPGcwGGKlInR3Ii
         yJhVGmYZ8WjzDVx1Zv063M7hEQCatrF5mVv8NLKhadp1kmFWeRC+oIiwogqYxXtPGMUj
         ZRqAxLXHpJUe+91WAGfDwIROYIPmenEeQYAle9vYtvacXcgGhXxsVkRWp97zt76l/w2W
         Qi+jVhl+Kz2J0OiS5wz644b7WgsUCLOMAMHATyKUaL4fkdM+MIQ9o1DnVCTHh3wEJT7+
         jF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617235; x=1791222035;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnJQd6bdeFsZrWHaIElFpdpCIChAmHD+YCH6lWp5XiY=;
        b=k6Rt0/2sNMkMlncwX7/aXIt89qev+xOimeF+Giwp55k5N92yzIvYQ2f1EDidYsZYmB
         YAAwdFU93zq+aA0Q3Py4WYxSg2qPze7IQBhVwMEWIFAodwgrXsaLB2pS3jNs+rGYkRVS
         xSygjyRZcpGsLSIrNNEXu5+jbvL2Qwwfg8Fo0HdyJtgun5slupZTZv7PwpjMx/5oPaRs
         4qsfjUcK4C8NAQRQsEfUbp2P6Tl9of/REDfPV8xI+06K5tvGtJNPripPCFuKYPdO1lD4
         V3yG0XzdNsNNB40qGCiikshJ0O5fYExhEknFVNnrD8JaIwFaF5bkGlZOJiSjZ9NBwN9I
         1dSA==
X-Forwarded-Encrypted: i=1; AKwUvBzdymDxNA4idM9FTEpnhmQyg6GTPrcmJ4QWa0gc+xqkc83eb0SN93/h/2Gg7l/P+nFk1DFFippuh8h4ppo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWalBJKH/3COCZHXk2kMsQu9vB65/7x3FcRKL8BFq/9NvcobAY
	DyDSyIMXFyoiC2NqeWVt/MtXyOghSJQhYWAy0tkvkqYtG7iVBjADr92Zo7yS2JWqT88GJbQhOpr
	O1FEpcGimMiGOfFeoWuXLgAhqUKORztbCrA==
X-Received: from pgav19.prod.google.com ([2002:a05:6a02:2dd3:b0:cc7:ab3a:23c7])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:498c:b0:3a0:903b:f253 with SMTP id 98e67ed59e1d1-3a09875d77cmr11025914a91.18.1790617234359;
 Mon, 28 Sep 2026 10:40:34 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:40:13 +0000
In-Reply-To: <20260928-b4-fix-aer-memleaks-v5-0-ba6b94c9c9a6@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928-b4-fix-aer-memleaks-v5-0-ba6b94c9c9a6@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260928-b4-fix-aer-memleaks-v5-2-ba6b94c9c9a6@google.com>
Subject: [PATCH v5 2/3] PCI/AER: Fix memory leak in aer_recover_work_func()
 when pci_dev is missing
From: Priyank Rathod <rathodpriyank@google.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, 
	"=?utf-8?q?Ilpo_J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Shiju Jose <shiju.jose@huawei.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Priyank Rathod <rathodpriyank@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

When ACPI APEI/GHES processes PCIe AER error records, it allocates memory
for aer_capability_regs (entry.regs) from ghes_estatus_pool and queues
the entry into aer_recover_ring.

In aer_recover_work_func(), items are popped from aer_recover_ring via
kfifo_get(). If pci_get_domain_bus_and_slot() fails to find a matching
pci_dev, the code previously executed 'continue', bypassing the call to
ghes_estatus_pool_region_free(). As a result, the memory allocated for
entry.regs from ghes_estatus_pool was leaked.

This is reachable whenever the device reported by firmware is not (or is
no longer) present in the PCI device tree, e.g. after hot-removal or when
firmware reports an error for a device the kernel never enumerated.

Refactor aer_recover_work_func() to ensure ghes_estatus_pool_region_free()
is called unconditionally for every dequeued entry, releasing the pool
memory even when pci_dev is missing.

Fixes: e2abc47a5a1a ("ACPI: APEI: Fix AER info corruption when error status data has multiple sections")
Cc: stable@vger.kernel.org
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Priyank Rathod <rathodpriyank@google.com>
---
 drivers/pci/pcie/aer.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index b013b853b555..a6600801af6e 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1366,14 +1366,13 @@ static void aer_recover_work_func(struct work_struct *work)
 	while (kfifo_get(&aer_recover_ring, &entry)) {
 		pdev = pci_get_domain_bus_and_slot(entry.domain, entry.bus,
 						   entry.devfn);
-		if (!pdev) {
+		if (!pdev)
 			pr_err_ratelimited("%04x:%02x:%02x.%x: no pci_dev found\n",
 					   entry.domain, entry.bus,
 					   PCI_SLOT(entry.devfn),
 					   PCI_FUNC(entry.devfn));
-			continue;
-		}
-		pci_print_aer(pdev, entry.severity, entry.regs);
+		else
+			pci_print_aer(pdev, entry.severity, entry.regs);
 
 		/*
 		 * Memory for aer_capability_regs(entry.regs) is being
@@ -1385,13 +1384,15 @@ static void aer_recover_work_func(struct work_struct *work)
 		ghes_estatus_pool_region_free((unsigned long)entry.regs,
 					    sizeof(struct aer_capability_regs));
 
-		if (entry.severity == AER_NONFATAL)
-			pcie_do_recovery(pdev, pci_channel_io_normal,
-					 aer_root_reset);
-		else if (entry.severity == AER_FATAL)
-			pcie_do_recovery(pdev, pci_channel_io_frozen,
-					 aer_root_reset);
-		pci_dev_put(pdev);
+		if (pdev) {
+			if (entry.severity == AER_NONFATAL)
+				pcie_do_recovery(pdev, pci_channel_io_normal,
+						 aer_root_reset);
+			else if (entry.severity == AER_FATAL)
+				pcie_do_recovery(pdev, pci_channel_io_frozen,
+						 aer_root_reset);
+			pci_dev_put(pdev);
+		}
 	}
 }
 

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

