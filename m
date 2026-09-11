Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326BA3EC82B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097544; cv=none; b=aHZwnGVcGgRyjx/SnZqLsJ3xc4CD8M5+/gzSIPJmkqppzl9TcINyTdcHlF7+ZEG7dUOCjK4VWHKbMex3EvJiggGUCsBwJf21ErwLIpni3cOmf8AfvkPGsrVdm65E72ZlyuPSM5QV2zJAX9JHeCkV3FayN06aLeaV7rDGybDWWfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097544; c=relaxed/simple;
	bh=tTcdgtfkRdrrInk4x8w8aSGGE+X4ge2928bklO9RIEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVNTRjU5wSsSoF9yykrscMmwPyTK1T4UO4ysHzbJoWZ7KuggY63xbd3qeedkHcT8rzlqkfIuQcB0WUqU//mcthx0XUhtdYc0Wa0MIpZmgT+BETAs41u/KX3zjmfdLU22TRmRzp7wnExmKQjWLOTlC8/+evS9S8aY7yQDyl2JDAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGek2WNa; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGek2WNa"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6eeso4939276d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789097542; x=1789702342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=628v54VOGyoBAzqTpzRM1YpRZTIxWjHP4RZIO6itcPY=;
        b=AGek2WNaZQBNZR6cbs9PdtuTlu256AZlOE0Nj7UCc7exC0d9XHgc3pWlfFOW0qFbGn
         s98XTPxQvflF1KA4klCirXNYU4pejJLbfAtP1JmmCVwP0vYtB2bOhqLbfoH6SNQHN+5N
         wj6D15dDGdBHDBctlPN/YGtEHIXUNhzmWiXKNYbPSP5zlVJoBHeykIeH1COuk0aKXSfx
         Gwr4g42Xc5FSlIVheMIDoDF1ojC9E2RlyZ7VuQG/2ctNP1q09brwpdEMO67yXGyzqBM5
         o7dx5k/dMn6UHmpTMhGiVYEbt32XEpc0mfNlf0E9emfIIG9+x7T4Gku3ZbpXRj7Q1sW2
         Ru1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789097542; x=1789702342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=628v54VOGyoBAzqTpzRM1YpRZTIxWjHP4RZIO6itcPY=;
        b=Tw3Xjir1m2gqf4z21TtaBMAz74gX9bney4sHMy0dArYgs1uk3MHqbryumXwcR/68JU
         jW0JHKUUbVhNIvZZUzgud2m9WoF8mb/5LMm1jUxJn/ZMdN5LtBFOUBC8QKoVBm//mfk6
         y+Hk6N7irNfe6PjkHpJcjt9xb/coow9td0BAj58yS4RBg0nD9pRpQbSkAf7u3SiqterB
         rHkqW9z5jROdYQYvkJXZXRiguB0oP3A/5Lc9wRLy7MBnV8SaPzn/FRXii9KVzE2F5qgZ
         K24t1yZk07rYnZRC0mcxHq9+msboUHIpV0CGFuNR+9Z06Q1nJUs34ILJB1eEpRfw1yYd
         m9ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwr7NyVBDESFiNErv5R9foo+99tAN86ly8uDuM/0jwQbcd3IyTfpAvW64fDViQCE7M33041u/QNOY890Lg=@vger.kernel.org
X-Gm-Message-State: AFuF++nfNp72uBxrLIimKxs5sxJKg6zX9mFXCfQJ/DHuLzzW3Zk/UtLv
	suwB/CYSlqZRNdAc5EFAP21ST4WAhFFpAFLQElH3aaw1Zz4tLyrzvLY=
X-Gm-Gg: AYBFou02iyIkcXaSWp8OBbhg+Vf0AbxdCC2sZ6ct2O01upgxbf7/p0Y75x9m1Zghskc
	jwkw6nmirwvsB7kBdy9LrVC6xchhoC+CL3ijCpKX+5TmTVCif1XtSa0Pg/qUg3pgqEoLpAY0e9j
	F6MGziWM7Dfl4gzMgtRmkJVKTViQI48l3bgtiIIxZ3c4NM4Qr7J46hMHQnn15tHhayra+91n/X1
	Hf/84Xt+qmTvphHzYp+OL2eVPpRIe3IawYKGzgnuHFOga4NCkFzzg2J+Syh72/IHdi8S+EzEx8X
	kpcg0VJRBuv3GsZN3e+kuB/9N1uvlpQu8TCfTzlVoMfzTr5RkokMoTgodxfD4yI5v+qQtwJY2mC
	hUajU5wb84yojHaPLVBNn3w3gEq2zYG/Y46Oueu2RoJMrF2HydwdEFEDilzFrJ8nbeOzM9L6HCX
	vYivYvcJL7tJl8O47YL0+FW/LoEVaTtAR2sHy+oTyHy/avV6u5sagfyaaNkIR+Ey2Xrmp9sJdcW
	dvGlPZ9ImmiDvX/6MDsvMApwz69WLwxGDMvtuEOQ6O5wRwWarx6UlVJ3V0D+/2osAfXZ5g/zggD
	JVbojF4MmQZ9M7vMArgbFy/JTI55brykxA==
X-Received: by 2002:a05:6214:2504:b0:907:dd19:fcb3 with SMTP id 6a1803df08f44-912120f0f85mr29026286d6.24.1789097541743;
        Thu, 10 Sep 2026 20:32:21 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d389esm11109516d6.42.2026.09.10.20.32.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 20:32:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: GR-Linux-NIC-Dev@marvell.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net/qla3xxx: Use managed PCI device enablement
Date: Thu, 10 Sep 2026 23:32:19 -0400
Message-ID: <20260911033219.34566-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ql3xxx_probe() enables the PCI device and balances that reference on
probe failure. However, ql3xxx_remove() releases the mappings and PCI
regions without disabling the device, leaving the enable reference
held after unbind.

Use pcim_enable_device() so the PCI device is disabled automatically on
probe failure and driver detach. Remove the explicit disable from the
probe error path to avoid disabling the managed device twice.

Keep the existing manual cleanup of register mappings, PCI regions and
the netdev. These resources are released before the managed PCI disable
action runs.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 5a4faa873782 ("[PATCH] qla3xxx NIC driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/qlogic/qla3xxx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
diff --git a/drivers/net/ethernet/qlogic/qla3xxx.c b/drivers/net/ethernet/qlogic/qla3xxx.c
index 861a13ad7e1ac50fd1607818d592828c869dba0e..c1fe943c91319956c62e317e99478b936562663f 100644
--- a/drivers/net/ethernet/qlogic/qla3xxx.c
+++ b/drivers/net/ethernet/qlogic/qla3xxx.c
@@ -3755,7 +3755,7 @@ static int ql3xxx_probe(struct pci_dev *pdev,
 	static int cards_found;
 	int err;
 
-	err = pci_enable_device(pdev);
+	err = pcim_enable_device(pdev);
 	if (err) {
 		pr_err("%s cannot enable PCI device\n", pci_name(pdev));
 		goto err_out;
@@ -3764,7 +3764,7 @@ static int ql3xxx_probe(struct pci_dev *pdev,
 	err = pci_request_regions(pdev, DRV_NAME);
 	if (err) {
 		pr_err("%s cannot obtain PCI resources\n", pci_name(pdev));
-		goto err_out_disable_pdev;
+		goto err_out;
 	}
 
 	pci_set_master(pdev);
@@ -3891,8 +3891,6 @@ static int ql3xxx_probe(struct pci_dev *pdev,
 	free_netdev(ndev);
 err_out_free_regions:
 	pci_release_regions(pdev);
-err_out_disable_pdev:
-	pci_disable_device(pdev);
 err_out:
 	return err;
 }
-- 
2.53.0
