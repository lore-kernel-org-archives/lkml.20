Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A661C41BA7A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790528121; cv=none; b=qenu9X3janyiJof/fHpwcx/vAhUrj14eDWX6KbV0LscOCIEd7P7rpCUfRZBZ+WQQafi5z4zc8wzccSQzOQN9gF9LTDbg7Oof3RU3GJ02gIRQYsFAXcqtb5UV4mpBsrm58Hjzc8g3X5NfQJAy1xm8vLOuJCTvm8ELq3bo4mR2kG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790528121; c=relaxed/simple;
	bh=kMzfa7XtfKfG3RJ5zxPo/y9bJ/v4XnXOewXyeN4/zW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mt7BUsXe1imBc5jHpBRrdINA8BB3zMyKszLcplBR2aXgdn2HnyTX534I0MXU9uDUHRWgKUoZVmevLP4ObGu1RzVYHjYlXsZXeiSqKhZncJ680fQLcRGEd+e8BND9HDNR4cmFunB6Xk/SztjRhvQvDsW2yaT9mEy5R7EuQSI9iBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkePKVuu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkePKVuu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so12542565e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790528118; x=1791132918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nO4LPQO5B94BniGFyWk4r3/clPvyPjMU90wwNe9Utio=;
        b=pkePKVuuv6MA9yQ73Ibpie4V9Tx2XE+OCinzLUlNVS7I3IXzNkNi2uGctT4yDIvn5n
         gpigLAKMomOchJOKi33VrPPIg+6k0gO4sBEaqjqfJP0JnQh3HsqJTl2nOFnYoBwuuQgJ
         UpXPxmPeusyCaNmUAqlwvkXPJZVpMIGkdm0g17Fgdd9jx21jab+oqyH5E8uY9qZH8m0X
         T5n++aYyYX4etS1vkfngkXh6yGD4p8EA+lVSZvhrVo/E6198BUYTom4MQcWwUtPSLKc0
         u9G1jl/TqXINGeIVQe0GxAfANTGUVsZU105nlxSjmIFJaVD2T1DTgKIG/eJdglldIAR9
         DLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790528118; x=1791132918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nO4LPQO5B94BniGFyWk4r3/clPvyPjMU90wwNe9Utio=;
        b=bROSRTOGvqN330wpivdJOlWU0YjIA/kl5FuuytBiQ9fNIuXFJbDJd0ORPprbqQ+1MR
         CWPaV0h7LjQIgCHdonM2cZAXYm+z0wgmqKss5gaZ0CozUzEXWtaha2bziyIs7HPDVJNg
         bibAuw2LremfGAsvS6tSohObokj9BU4ij4ONKldvm0ZeNccGcVz/8pJxpm8x3z/DsOmg
         HrZYDWsMq8DN6xGQ34AKGPF2mhg+LS5Skt0612IEVOByckOf5+bcXGZC5hhwDLANwgC/
         QDgnsiAYT6ND8MvtjCSrRPpKWFvS23l5XB9HI4b1zkLkvZco3gh3UtN8kQSBMx5SieJC
         LwDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTUpeJJSQR1QndZ6XEqVzDnYfys62fZUOkO2Viu63va5/Clz2XlZpN2lJtFMiOtBLZsgak+LEkNzPWf10=@vger.kernel.org
X-Gm-Message-State: AFuF++mHkSwHhC7I0hppgCHxRv2m5FkVFV22xrUD+jj6KOHFTjNvUCZ7
	t8SJNmESACH2RHZmtzHetvMb6L5DOAwGMewWW+LEXxaDGKG2sFMh5MFa
X-Gm-Gg: AYBFou37e5Fk4bHczmDODCq+12Sy7qxF28yiEN933tqrTb8SLy3x+evzkARz4lzthT5
	uV75bJ9YC8dcLjnwe82UBMwevzATmYnOqwMI5QCfEKQUYqbG0Sb//msEPrE2reYpHjWU+mT07hD
	PxQEfSwvZ299VMgKE4kfwTRrEYIsvpAvWxtu3rB58vIgU6UzCP4kwCTHpLdf4zs+lA/Feomakec
	MKUzfB5cvoYseztv2kLl6v8bJJmGS7D/dIOd54zVweHVCfFno0dWDMVTyVF0DHVnBC+iBubHsgV
	YMlNE3B+7+qn3dfRhlhQIriB+rf5dgNvQkJCjlRNsp5KFoPTQl8cy+m+V/X7IMZhhm48YECLNb2
	MS7suUn0wGbJySFZC67fpft5xFsoOA6jr02bD1MHNsnaBVwJiDpG2gtRv3Y+iUyPLJ2s0loZUAn
	vK8jViYNzkMumYf+FcMMsf0EjxNCJqAHEbleHUqTC2alydRtUFu0NUWqhTHLDGP8fGq/hoXq4lX
	Jqj9h60zEpmcuXi7CL04rULvrAI6NBt09nXZqoVnudUfvMbkBYTZy0EgG7/C1BQIJU=
X-Received: by 2002:a05:600c:3b87:b0:49d:1916:59c7 with SMTP id 5b1f17b1804b1-49fe66c8a4cmr227126485e9.7.1790528117881;
        Sun, 27 Sep 2026 09:55:17 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm76167695e9.11.2026.09.27.09.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:55:17 -0700 (PDT)
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
Subject: [PATCH RFC v2 2/5] PCI: pciehp: Add pci_hp_wait_link_change()
Date: Sun, 27 Sep 2026 16:54:55 +0000
Message-ID: <20260927165459.829900-3-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260927165459.829900-1-abhinjoses@gmail.com>
References: <20260927165459.829900-1-abhinjoses@gmail.com>
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
top of it. No functional change intended.

Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>
Assisted-by: LLM
---
 drivers/pci/hotplug/pci_hotplug_core.c | 21 +++++++++++++++++++--
 drivers/pci/pci.h                      |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/hotplug/pci_hotplug_core.c b/drivers/pci/hotplug/pci_hotplug_core.c
index fadcf98a8a660..c3e0ee8b36381 100644
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
+		   !test_bit(PCI_LINK_CHANGING, &pdev->priv_flags));
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
index 23b1605e783a3..2e113806f9f95 100644
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

