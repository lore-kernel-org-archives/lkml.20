Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9025427A04
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531535; cv=none; b=OuWzqKvnEulxjgX4NenjsUk2xPsTZe2KAdjDU2Got8yRCbwDHisLR6i2st1rRAH3hMj6eO+vAlSx0x1r3tSs3wjyIsK+RvherJUPrqPavzb8K+CCtDCPCaQJQ/+KhlJM2mkBqS7qbaWvVaxvBBqHyttVAEtprzKfWJAD/WaBkZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531535; c=relaxed/simple;
	bh=W4R8p7pU7NTW2xYYBKXi0TB7rn/G0MhL746kJAez4jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvnPfiw9vdMKQJphNxu2GPf1NhIH5Q23GRNciSh8HxLGqRzcCFf/Hr6nBfWRQOEMnBlY5AExMlnvabRxm/kBpXys57T6kvX9uWFFlv7jSt4jfr5FaRlOpkvtSxGhkb49M8Qit8krSA8/9uMKbvL8YlK0/Vj9IubV8xG1huKVavo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdcq3Rm9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdcq3Rm9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-488885c3844so714242f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790531532; x=1791136332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAfIRjqX3j9SJ+2tHHyzYdgAbG7vEZeWXs9def6Qdmg=;
        b=sdcq3Rm9krh4r+FCe+sVVnA7QCCTTXvEiU0GPC6cT8lsRSFkgAGb2OlUE/I5LEEBLW
         6C+ozr/8SkiO+pE9976HGS/ln4102yTrONB47u0+kx3ERTtnOxku+UDTFO8gqWqJV4QE
         0BQvYbjvG9sVCCNHq6Agz87roQEaayZ/OWKBa7ykR2bbGYWhSneirYxth81JBOhUncQd
         IOuqT2Po+DuoTKIxLH1YLm/B7cOwXSCS+fowlxwLV7WjcqT7JF/XZQncW4ggz91mY0qM
         gxI+pCSM77sNo+gnsgUwRM9D82yjRQ4YF+SxV6SG+bc8e7LZKOlZZLWwRlBfXR0wEwz6
         mELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531532; x=1791136332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAfIRjqX3j9SJ+2tHHyzYdgAbG7vEZeWXs9def6Qdmg=;
        b=I4iB+heRefnyQKT0cRGKCZsWqWkGOhMqX/2Fo+dI5vP1cqDdQ91i99s1itGjEBLzN1
         8Zla5iQUUGkErIqE/PGcWyqNLCD86oPLFUCry6iwjx9ZLksVa4rHBb74kwhpIOZkoZ1s
         cHGrBzVgZ91gF9GMEqunZMU2xNg7RZoPSfacpORcFnzAeIIH8Qd1mOVL4tJZnTYEINXz
         lp/2ZwbLW7HQQYhjENIBQ1UmrLUcmGY/fh+2fv59fxZm7Gzsimc/2XD9/aqPymw8dS43
         dd+e2ak8fibb1WGlrUARELxeNeqzaFhOEWh5hXrfR1g2iycsgvoMjqTvnYdYOm+CcBWX
         fjZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQQUhCD75LlAZoHf9tM7tupnwHOAzGTTnLhu5S7Fn+FKumTjIHdMr/NCDGIS4qVHbb8Sva2RawkYZbsIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe16ttqcCr/nQYcIAleGZSIQcszrwQWaEcCXmOH0fUIHZoe6Xf
	orBzmqUOETRneBPAzD+Wtv2UiI81RVAMTwWY5Y6tJzeiMDD5IhjpXkW+
X-Gm-Gg: AYBFou38wM66tvorMhaugCna9bM+yAAEwisrgXVr0nOItEdca9SbC5+q5E1KNoftj90
	NcZMXYj+zjTJelgXUQLS6bz8DQQgao1iX1u5HsoNmYPGNmeKABdxa73tiWxYj1/Khuea5MjfCMi
	325oLgKrhJ0g70UEnoT4deZDt3QMwAI0OYnDvDQFvgFT7wLsJBUYb53swuhdHkO/2czsFvQE/Xq
	Y4v4ghRtvkrGMhAE13K9B8AgroQaepeYFFtPMv8kZUEx33nUGsYtiH4I8ngPZ3g7vOEf+5HNrsW
	jF8oQ3HdGVQyfeNkyf8Et4Q5/IfTfsgoSrDBFq7qXQeoAJzoLFVmofBvq/rY7/AvYB68DWZIufj
	Xp5uK+4gpH+qOAU/uNbiXL66JYG6WIWI+dAjFeQHdkeq4D+BcfQVRSbkIglXgbaGLwH11Toywc2
	vXYt/d0MDfp+LiM7VYkdI4kswEL4ZIzfqNq/7KTX4XKTtpxlIw1M4f9iK57YhQeNIECc5rthANL
	C6hDjAsnGXW3hFo9P/rcu2UcbEqs8mYG8Hv+7kwRGDFc5lKaLLNDGjhWGQj6JnJHDOYnnjNTBKz
	Bg==
X-Received: by 2002:adf:e197:0:b0:488:8cf8:1c with SMTP id ffacd0b85a97d-4888cf80236mr4089251f8f.0.1790531531795;
        Sun, 27 Sep 2026 10:52:11 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm22563923f8f.1.2026.09.27.10.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:52:11 -0700 (PDT)
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Kees Cook <kees@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Abhin Parekadan Jose <abhinjoses@gmail.com>
Subject: [PATCH RFC v3 2/5] PCI: pciehp: Add pci_hp_wait_link_change()
Date: Sun, 27 Sep 2026 17:51:59 +0000
Message-ID: <20260927175203.928270-3-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260927175203.928270-1-abhinjoses@gmail.com>
References: <20260927175203.928270-1-abhinjoses@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_hp_spurious_link_change() awaits the end of a code section causing
spurious link changes, such as a Secondary Bus Reset, and then tells
whether such a section has executed, using test_and_clear_bit() on
PCI_LINK_CHANGED. The answer is one-shot: only the first caller sees
true.

Split the wait out into pci_hp_wait_link_change(), which leaves
PCI_LINK_CHANGED alone, and implement pci_hp_spurious_link_change() on
top of it. Test PCI_LINK_CHANGING with test_bit_acquire(), so that the
caller's subsequent accesses are ordered after the end of the code
section even if wait_event() returns without sleeping. No functional
change intended.

Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>
Assisted-by: LLM

---
Changes since RFC v2:
- Test PCI_LINK_CHANGING with test_bit_acquire(). (Sashiko)

RFC v2: https://lore.kernel.org/all/20260927165459.829900-3-abhinjoses@gmail.com/
Sashiko review of v2: https://lore.kernel.org/all/20260927170355.759301F000FF@smtp.kernel.org/
---
 drivers/pci/hotplug/pci_hotplug_core.c | 21 +++++++++++++++++++--
 drivers/pci/pci.h                      |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/hotplug/pci_hotplug_core.c b/drivers/pci/hotplug/pci_hotplug_core.c
index fadcf98a8a660..75524fe2bec6e 100644
--- a/drivers/pci/hotplug/pci_hotplug_core.c
+++ b/drivers/pci/hotplug/pci_hotplug_core.c
@@ -528,6 +528,24 @@ void pci_hp_unignore_link_change(struct pci_dev *pdev)
 	wake_up_all(&pci_hp_link_change_wq);
 }
 
+/**
+ * pci_hp_wait_link_change - await end of code section causing spurious link changes
+ * @pdev: PCI hotplug bridge
+ *
+ * Await the end of a concurrently executing code section which is causing
+ * spurious link changes on the Secondary Bus of @pdev, if there is one.
+ *
+ * Unlike pci_hp_spurious_link_change(), leave the record that such a code
+ * section has executed in place.  May be called by hotplug drivers which need
+ * the link to have settled, but not the cause of a link change, so that they
+ * don't take the answer away from the caller of pci_hp_spurious_link_change().
+ */
+void pci_hp_wait_link_change(struct pci_dev *pdev)
+{
+	wait_event(pci_hp_link_change_wq,
+		   !test_bit_acquire(PCI_LINK_CHANGING, &pdev->priv_flags));
+}
+
 /**
  * pci_hp_spurious_link_change - check for spurious link changes
  * @pdev: PCI hotplug bridge
@@ -551,8 +569,7 @@ void pci_hp_unignore_link_change(struct pci_dev *pdev)
  */
 bool pci_hp_spurious_link_change(struct pci_dev *pdev)
 {
-	wait_event(pci_hp_link_change_wq,
-		   !test_bit(PCI_LINK_CHANGING, &pdev->priv_flags));
+	pci_hp_wait_link_change(pdev);
 
 	return test_and_clear_bit(PCI_LINK_CHANGED, &pdev->priv_flags);
 }
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 175273756c183..cfa0202bf610b 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -360,6 +360,7 @@ static inline int pci_proc_detach_bus(struct pci_bus *bus) { return 0; }
 
 /* Functions for PCI Hotplug drivers to use */
 int pci_hp_add_bridge(struct pci_dev *dev);
+void pci_hp_wait_link_change(struct pci_dev *pdev);
 bool pci_hp_spurious_link_change(struct pci_dev *pdev);
 
 /* Lock for read/write access to pci device and bus lists */
-- 
2.51.1

