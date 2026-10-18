Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E0B4C33C7
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331381; cv=none; b=q/d+tvcpeYh8NpxfjSjDR2ZzXtQimr8Z6dP8+YgFKYZRAIg3IVPlD+FhYLYg/5uUsDy078CyGy2CMGNHOLi8A+AqPw2gw/fsTFJijK6BXx/SoGmZws3Tot/szNgu3lKOCMB7gNADKP8mHKkIi8HZNM7aJbH8H1NoLq9kb2I9sfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331381; c=relaxed/simple;
	bh=7MGTJdk+4Foua3uK4fT3tosb12DKYulonOLvYMkMDW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxYFQCMEKl5NLO60NHA9VVD3MosNx8va67O/DFWBSwJqD7vZvadiNWODEHDUtvcaGFOMwA4o9GwoyMb+p33VbZndeBkG2bjv3uigjHM3zRKe14/ABzXeY3FqNt22bFfvAGLhfoeUoouPslWIUqXB64nBY8Yp91PXKfMENkfsB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pa2FZ2+L; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pa2FZ2+L"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c411e139259so122414866b.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331378; x=1792936178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgyOpAgwDJcgNK32/9PGTXHO9coJXI+TEruCjzlJ5Mk=;
        b=Pa2FZ2+L/iITeJOAk5eZ7nVtdjgLS0dBf1QrSKg19f+7gHyFMXPWwzmuUBeyqVr5Ur
         VJ9pi10ckWgzDpWG7C9v5FJGqaJSPeSNtXrQgIiRONz8ha/z5t95QUy9zX08VJ1FmOgF
         7E4ox0cqAhHaF58Jc8JqGln5rVHykaqijkk7QBjvySH2udGVAoJxbEno9peE1W4Ejlz/
         U31Th+AqB4V9r5HlFRRM3fxpHW3ecFEUYr5Nx0gkcO9YBgQ4uxoUzMG0a95WKWNbxhWy
         vkiUktCMsGw90p6Wy0jefQ95At39fqHibmzN8Y4qNwmwR2Qnv+0I7KSjWQkwBPIMZPhS
         5QOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331378; x=1792936178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgyOpAgwDJcgNK32/9PGTXHO9coJXI+TEruCjzlJ5Mk=;
        b=lx/MNVIIsaJYLGArYtFgUSq5rBzIUHPEtRq00OslUCUyRGraYv+Q9QPBpd+8uQPQ4X
         GluIqkfzw5f/iCX+iymqwY0lZWnQZV1mmpbDC+ljzbtqpUZypajnlPjsHi9MixhES6hB
         lPrHWH0MI0ePizszPtPvrRVEullmZdWh6FcE2XY+4UAQgdBmdCkDiCdzTu2FVmydTJQI
         wU157tW/UDgoKgn6RPk0WqNECHn6dh2nfX9R6QsDDd2NlcQ4yX2Mtqa4+gWkeqh/Q7Bl
         ivi2LVAQwBLixZLKVXyDaB29FDijWqmr2KMNdrf4Oaf/pL5RGQluvx87OB6uuHYktbmm
         Ki8w==
X-Gm-Message-State: AFq9FYJ6X5/oRREC1a+1GBtMxMGrQG8Z//sljIjV71vE45XLKIPY5aNu
	UQiqZqdFRCsfYhEvoPhFAx7UsrFf9UmV/t4ZP/oKCttMO8AowsDC4erH
X-Gm-Gg: AYBFou1rni7SHPzhS3BPMtFmjT9eBksIrcmZMQmABjQZYDx0ED5z50+/jp8G61/u9fF
	vbutisLl95jCTt+Vuk7FXQujfBIOF/9R5nd5wl1vl7EkRVgnWsZYHFRtEiLsGNnGJrJlmRlQOqA
	qusFTAUQjA9qOSn+KA/QRPZ1Rdnfr6IgCV6P20qrsvs1W5mISWf4s/kp+0Qgoa3NHAgMCtg8dN9
	cfM3vpQm7siiM1dHAFK90pyNRNSyMrx9AnIUBKwjdAr8iYsejsJMr0duUdPhBLOJtcaAXC6vwVB
	mWkli+kk8h6IiuM+WlDok+UHg3iaz2NJCzNumQa2EVQpwAogbOqqJiI7Gp3JXwYaYoc46gEtP68
	3wYb3EuHU04UCsWsIuMfyhpeSfuyZHGH2cQ3kIg1OCyi2qwCN9GHL83jYIRWZlGlfCFGOE0TTXY
	Ag9VOBeVcRaPvK3FY1ZWNVqBxKuSBviU6vC5B5sTl3R06Q4dFmykydwKEJfWWsu5NOrww0bL8Jh
	QuKgepK+ztETmlUudII3p8LDbpS9XhaqxA2NYCV
X-Received: by 2002:a17:907:d86:b0:c29:f5d5:5aa4 with SMTP id a640c23a62f3a-c41a08dbe04mr331615566b.46.1792331378553;
        Sun, 18 Oct 2026 06:49:38 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm267678266b.61.2026.10.18.06.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:49:37 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	krzk@kernel.org,
	oleg@redhat.com,
	linmag7@gmail.com
Subject: [PATCH v4 05/10] sparc64: validate Fire register properties before initialization
Date: Sun, 18 Oct 2026 15:45:07 +0200
Message-ID: <20261018134738.1016106-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018134738.1016106-1-linmag7@gmail.com>
References: <20261018134738.1016106-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fire interrupt translator reads one reg entry, and PCI PBM setup
reads two, without checking that the firmware supplied enough data.

Check the property before allocating the translator or changing PBM
state. Halt early translation on invalid firmware data rather than leave
raw interrupt numbers untranslated. Return an error from PBM setup so
probe can release its allocations.

Fixes: 861fe90656b8 ("[SPARC64]: SUN4U PCI-E controller support.")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/pci_fire.c      | 9 +++++++--
 arch/sparc/kernel/prom_irqtrans.c | 8 +++++++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/kernel/pci_fire.c b/arch/sparc/kernel/pci_fire.c
index c35a8e3c1eae..db160eeb0ffe 100644
--- a/arch/sparc/kernel/pci_fire.c
+++ b/arch/sparc/kernel/pci_fire.c
@@ -416,7 +416,13 @@ static int pci_fire_pbm_init(struct pci_pbm_info *pbm,
 {
 	const struct linux_prom64_registers *regs;
 	struct device_node *dp = op->dev.of_node;
-	int err;
+	int err, len;
+
+	regs = of_get_property(dp, "reg", &len);
+	if (!regs || len < 2 * sizeof(*regs)) {
+		dev_err(&op->dev, "missing or short reg property\n");
+		return -EINVAL;
+	}
 
 	pbm->numa_node = NUMA_NO_NODE;
 
@@ -429,7 +435,6 @@ static int pci_fire_pbm_init(struct pci_pbm_info *pbm,
 	pbm->op = op;
 	pbm->name = dp->full_name;
 
-	regs = of_get_property(dp, "reg", NULL);
 	pbm->pbm_regs = regs[0].phys_addr;
 	pbm->controller_regs = regs[1].phys_addr - 0x410000UL;
 
diff --git a/arch/sparc/kernel/prom_irqtrans.c b/arch/sparc/kernel/prom_irqtrans.c
index 5752bfd73ac0..558ed5114664 100644
--- a/arch/sparc/kernel/prom_irqtrans.c
+++ b/arch/sparc/kernel/prom_irqtrans.c
@@ -544,13 +544,19 @@ static void __init fire_irq_trans_init(struct device_node *dp)
 {
 	const struct linux_prom64_registers *regs;
 	struct fire_irq_data *irq_data;
+	int len;
+
+	regs = of_get_property(dp, "reg", &len);
+	if (!regs || len < sizeof(*regs)) {
+		prom_printf("%s: missing or short reg property.\n", dp->full_name);
+		prom_halt();
+	}
 
 	dp->irq_trans = prom_early_alloc(sizeof(struct of_irq_controller));
 	dp->irq_trans->irq_build = fire_irq_build;
 
 	irq_data = prom_early_alloc(sizeof(struct fire_irq_data));
 
-	regs = of_get_property(dp, "reg", NULL);
 	dp->irq_trans->data = irq_data;
 
 	irq_data->pbm_regs = regs[0].phys_addr;
-- 
2.43.0

