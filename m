Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC9533030F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788920585; cv=none; b=mn7rhYy61tdvHfUsqoTHjQJOds8EAdDKfshyKAf4xJpMpYx60DjNtXSPOegIY2kzihjL/OuP2Ze37viN503PsMzFOMuessV+QXJ/OY8K31o8gnk7WCZRPSKiNJKJeD7nuML1DcSa7/ds9c3HNNTazbyEJifQxZf4j62nKSeocKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788920585; c=relaxed/simple;
	bh=BTT1HRR8Y8bxVmGOAFwMGT6IKlZ+/KjvH1QKz8C93JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwUzHwvtaWJD4ZVzns+pUlN7CZRMvkwfGWSyqfXyA77A7X/mLv3RASEnvliiZ1tnbyfkmuDu3sJzQsvdi8GpC7kbdFw3P7rDnUvLyc+y+NhVUEP+ibW/RR3RwouwWWz//IyC21AwZiplbgYptXUHmyeaXAcr/I/y/GkRH4iGbKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcrmIwTM; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcrmIwTM"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a483a552efso2259965b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788920583; x=1789525383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNFbGC6vHD9KVYO70GmfNmbHZwcxJjLkcoNakQKwQ9g=;
        b=QcrmIwTMX7ky7AoAC6elp3gRVmIjTk+AsAjWU3H8f7X/tEiyty5ljwnsNTrMz2g7vd
         WES0bygsOrO5Sj6kR6EDCIxKocwQ8+WcBw2pwdWiLHhiOPrOmg/angsHwyRSUZdWxjtd
         um8wZaCZ+nldd01m9Z4Jud7GqiF9I36FdvhEXtMWA2A5ioa6WiriAKqdR3OleMSJM4OT
         vy2oGNuopEvOwcSbi6vQQShlHSplJLbNAh1k6b+I+1BQlT1u2cu7WhQmBRhD/aol+Yzb
         IS9hBUBd7wV/YSSsrjXZNT0VJqCtSGnWblz/6xur4ENT0M+tvfG9yiJGVYcb/glCy2hE
         3LBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788920583; x=1789525383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNFbGC6vHD9KVYO70GmfNmbHZwcxJjLkcoNakQKwQ9g=;
        b=SubYQ2LsBf6FypRhJuykm3u2ArXQ7deQuykrm6h4fSa/DHuy7mzo7gXrkd4wW0b0vk
         lRTJbb4gfqkoq/icZnmt60Hy7QdSROmi36bqcT98zyL/ct3L1to6THvVRHmCdtQeepf/
         Mvj19vabbxq2HMKkQTQC4ArhxXEbm9pWu0tn8NF6bwCTxrVncjD6lJ9VU/MggzxcHgee
         wq+vkZSIYY6aEYUJ8CjwOUPZWJJ6h1a797nxIAX8kCabsHswLVvCAbQZy0CGtCmNjHVn
         bTR4rPtA/JgtEYmhZuy775f7+7V5nGBbiRLbWRnIDX7ScKWKXYfsto9HIQPzR5dLXXEq
         9B7A==
X-Forwarded-Encrypted: i=1; AKwUvBxKLxhbp5MlnWvQLf0JkRmJHH+tpm4ekwJfqgUR7LOGO9lLCJvXv1760FydqycM/AyKMqg/uYoqsVAqmHU=@vger.kernel.org
X-Gm-Message-State: AFuF++krMvMArWnmG4JJZJPWykGj/wYqtuR9v61KDpQYfbgJfBvci9g9
	4EiQSJDXmIYs7bSlXXyT4fz5WolDjGx3GdUEi65GWD/UZ+nir2tCmPpD
X-Gm-Gg: AYBFou39KZIvpcObdqmpnovmEBwxmiiNPMf+NHiO6r5zZmGa1iq2ynvBaGv00ih96cO
	bI7AG97EahtnsvxxV6uexgnaAnXGknL5M5lp3/fBieB99EnXpWtydINjbITmm3bGjVYmsy+88Qj
	2iw7JX2WzYWKV8qugOMxYzcXRgvjXXPxBeWKmPPHTv/1lCndMvl526a/ohJB8rI6UsrqUnd22qm
	4KRawJMohsyBXweAhy9c2f0VtvG/NiWTkgGjcK/Gp93GikgDFS5+TL/KkcbaPL5Y4+p/IChv4Hx
	XsDVH5zYZETUN+mEHvbJ16G2f0WlIxO5OQAB5M0H6bsoJrLFDNRjB8ygubvY19Y55ejpHyjkjpS
	wqqktRF2z9l1j5xwJ0M7H41aGas01n9TMlsyP7nmfsQ4pHS2OqQ2o5msgjW+5rQunhXgpe//2ML
	Cx/5k+dgSZACuOemFbF/ucRwl8g62LnSTca+zkE1O4BXFPJxkv0FO58HC27g0LFtcY4Cda96ukj
	IJGb0nwWr9sPLdmsE0J5hF3zg==
X-Received: by 2002:a05:6808:1b23:b0:4b9:a88b:8885 with SMTP id 5614622812f47-4b9a88b903emr16330362b6e.27.1788920583238;
        Tue, 08 Sep 2026 19:23:03 -0700 (PDT)
Received: from david-hassan-Inspiron-15-3567 ([69.162.230.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971aa12cesm15580584b6e.16.2026.09.08.19.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:23:01 -0700 (PDT)
From: Fahmy Hassan <fahmymohammed@gmail.com>
To: helgaas@kernel.org,
	bhelgaas@google.com,
	scott@spiteful.org
Cc: fahmymohammed@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 2/5] PCI: cpcihp: Check pci_hp_add_bridge() return value
Date: Tue,  8 Sep 2026 20:22:23 -0600
Message-ID: <20260909022227.620217-3-fahmymohammed@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909022227.620217-1-fahmymohammed@gmail.com>
References: <20260909014143.GA123333@bhelgaas>
 <20260909022227.620217-1-fahmymohammed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpci_configure_slot() calls pci_hp_add_bridge() for each bridge on the
newly added slot without checking its return value. pci_hp_add_bridge()
already logs an error for one failure path (no bus number available
for the hot-added bridge), but returns silently if the bridge's
subordinate bus isn't created after scanning -- that path goes
completely unreported, and either way the caller currently has no way
to notice or react to the failure.

Log an error via the driver's existing err() macro when
pci_hp_add_bridge() fails, identifying the device involved, and
remove the now-resolved TODO entry.

Signed-off-by: Fahmy Hassan <fahmymohammed@gmail.com>
---
 drivers/pci/hotplug/TODO               | 4 ----
 drivers/pci/hotplug/cpci_hotplug_pci.c | 5 +++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/hotplug/TODO b/drivers/pci/hotplug/TODO
index 215ab36df11d..0a8e23546e5e 100644
--- a/drivers/pci/hotplug/TODO
+++ b/drivers/pci/hotplug/TODO
@@ -1,9 +1,5 @@
 Contributions are solicited in particular to remedy the following issues:
 
-cpcihp:
-
-* Returned code from pci_hp_add_bridge() is not checked.
-
 cpqphp:
 
 * The driver spawns a kthread cpqhp_event_thread() which is woken by the
diff --git a/drivers/pci/hotplug/cpci_hotplug_pci.c b/drivers/pci/hotplug/cpci_hotplug_pci.c
index 6c48066acb44..3deeec8dd206 100644
--- a/drivers/pci/hotplug/cpci_hotplug_pci.c
+++ b/drivers/pci/hotplug/cpci_hotplug_pci.c
@@ -269,8 +269,9 @@ int cpci_configure_slot(struct slot *slot)
 	parent = slot->dev->bus;
 
 	for_each_pci_bridge(dev, parent) {
-		if (PCI_SLOT(dev->devfn) == PCI_SLOT(slot->devfn))
-			pci_hp_add_bridge(dev);
+		if (PCI_SLOT(dev->devfn) == PCI_SLOT(slot->devfn) &&
+		    pci_hp_add_bridge(dev))
+			err("pci_hp_add_bridge(%s) failed", pci_name(dev));
 	}
 
 	pci_assign_unassigned_bridge_resources(parent->self);
-- 
2.53.0

