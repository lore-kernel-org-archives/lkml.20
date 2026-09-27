Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B1F42B324
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790533229; cv=none; b=o/3RnCu4/0wyZxQ5U16TY9WxnvBt437OkKhUGsZohIm7CSoAiPYG1LopBOSVRTAwLgp6YReR8sWE+jAtm9UGeO0/weI59E/2H75s8T9YP3XVWFbnZdIk89/+wruyDuvzSV3EO1WE9jy6q9s4l8QSqncXzSHF0fzRY/jCl0ai+UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790533229; c=relaxed/simple;
	bh=W4R8p7pU7NTW2xYYBKXi0TB7rn/G0MhL746kJAez4jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhegNClbdDtS7bUCf8wOMw0sxuC+FwyE48bTqS2bMwErj4BYlMWnpDygtXY+uI2CIYg9Eq5cr/u3uIJ0ftb/DgP3vOhP18VDN037B4AkXfjVBiQq5wc2kOizP0MpC3OBcz+w4s/lCzIYVtMXiN7ILdqyP03Z/9tX+IuSxp1jj80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfsMuEn1; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfsMuEn1"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso1839057f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790533225; x=1791138025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAfIRjqX3j9SJ+2tHHyzYdgAbG7vEZeWXs9def6Qdmg=;
        b=VfsMuEn1ateoUTAR58brXMOMIQJH4sZw7wD/fZEreR543bAL9O41F1+2rvxWe7T/0G
         wcFRWfEnMk7QS3xA7t/HWIP2SgdVatHgxIx8p/Dh6/e3BRjKXk8vWINlwA4qOziSXHAc
         21lpvQMLSlbz2sXGwXiZoLxQ8+naFfqebq+M7ejjLQxtPk5AmZNSbh39/2jbQLR723aC
         hy4iT3JTtb8wh/Vp9kV4rFrObbEaUseTzssNdWLtCB/wXzTgN5+RxNm6aHd8HG4WAxm0
         7filPnsgsXFfrd+TxG3KITel85/ufcEfSdvb+F5dnQlrf57FUyWBkk53xRC3pJY9afTA
         RjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790533225; x=1791138025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAfIRjqX3j9SJ+2tHHyzYdgAbG7vEZeWXs9def6Qdmg=;
        b=b5KJ0+IKhM2NqTLluTioLqOxUHh2l2Kow/mRiYJxWw3ZRi96viinluIXWwLmqq8lBm
         AOf5rSHGKsXp502cFTmtJnUOhrjbDPEa23pb9al3Tjnyspx62EKSPEK2sWwPvR8JR00z
         0BpVrdbBWL4ee9pCDO4tl5dey0jK1cT6dl8dNdztL6eu9WfLlaWNRBPMUvC2aAdpfTTH
         Z2ZZ49oB9OJZ3A+c3dAjcITIovrgYbfdQeqpvxUrJz9Mu2GCjiqd6Ml2Ak9BMqqPbZsu
         feLq0iFX3F3dkyZ/SYLPqDkhuENj3kg4VTA5+0skBwoY+xuMScT6GrTU3RhJ4Z7tjwvT
         u/Rg==
X-Forwarded-Encrypted: i=1; AKwUvBxbvi6BRzlMsXNC698LWnwyXxG7S63hnTwPi6PckbmLkPbkWKSMk7gUM2d0f4aik+iGPJ/UW06kn4yf/aY=@vger.kernel.org
X-Gm-Message-State: AFuF++nuu7ZJfwZgDUgwDZvD36b59nDsAs/0FnalxyhCpdSGy1M59ofT
	ChVW14Ay4Kv9NTGN5SyYNeYQIF4QbI9GDU7WT7yb5Wso0JyMX6yP9GCa
X-Gm-Gg: AYBFou24Ed/Ax1dgw/e9b/Fhbd9wOEVe4WUqEtVuipwI47615vXhVP/K0zED7whlqrf
	aXokCnjcs056OvMABeyIlb9pSpS/FMJ2y19VUJ1+nywWKf4OeSd3f742pKvNpa8HRAleL7mlxJV
	0LLm73SEO2TYIsOGqS2EEN/VfpvQyIoKuEe1ecMVHQf9tZWb4NgpxvWqz2PGCegkqzZaKsnTEN3
	NCDFaFp4VoAFNlG+xBP/dkdjnaqEwzi+CUdznW50sLwAOn2iVsIpO+DHfIqH8LfEPV4RqnoByIP
	y6j3xJyNzF1qCzXo9Y43BTJdHHgoeef31BUkqjZ4H1l8megjTnkjp2jOl2J5ZfhXKfdF09LQfT6
	LPZAHpx/NqnjuCWekIhgtz+9WkY31bxD77UytWEvV6WdYXfH0Sf+TLjSyMWK1BHYtNsWKGA1C6m
	32SRrLyMnv9ZVVUDUPf/HraSpoyCQ2GepMYAtkWEdGiC7Qdhh80GKYnwluGlZoCxDMwCH6eDwLI
	8I/gDXhP32Amt4D55KqDAF5eimi8V+cgIEHONqCWZtd8bejFCexyIatckHniz90V8E=
X-Received: by 2002:a05:600c:870c:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49fe7bd0128mr187827025e9.33.1790533225384;
        Sun, 27 Sep 2026 11:20:25 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a002d1d8d5sm38371585e9.0.2026.09.27.11.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:20:24 -0700 (PDT)
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
Subject: [PATCH RFC v4 2/5] PCI: pciehp: Add pci_hp_wait_link_change()
Date: Sun, 27 Sep 2026 18:20:13 +0000
Message-ID: <20260927182017.938565-3-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260927182017.938565-1-abhinjoses@gmail.com>
References: <20260927182017.938565-1-abhinjoses@gmail.com>
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

