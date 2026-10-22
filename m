Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688338;
	b=JpO5naLV61R9HVZ/bfC+etMXxCiWr8ZMcA1AlBJ5MubTudSYD0BC4Z5DGYb8pCzorYKg
	 PpifziulGfDh8VzGgi43uJJN1AcjjqfMwaHFPBIAkAex+Hqa7xW/V1TwkRo4HlQpmH5Gq
	 v6j9egy8sogzgzLfu4A0D68BDtbTqjXIuCtMkfqs+VABKeTPRgIp6/Pz4p6jqpVG1PbHd
	 YaT1VECAa2ShM1bpeSTJA3k1OizXCjoHrujI/BZjBaLUHnMexF4HQY5o4/wVYvkwrw+0j
	 s4run+fL5QujXHOu0KyQf/GKI7vREDDuGVQo/TONsoSbh0vjSHjI91wsmzL2tEztKaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wszrh6R2g8rAfmRyvD0Q1PJ/LXwFW3iH+CJpBKb1e0Y=;
	b=wBKgFLIbeXKxa2mh3/MTocFYgDE3JtXcmRZ3Nu62JQYcAA3Wmm6oYa7CXgqmpF20vZcV
	 hxAgXXhsZR9KpAKNq7TVKE96M6aL0lkHOYiqRYX6LM6fxzSyHzLb6WzjpZo4qwSxPl07/
	 lO6VMvl1o44qWqk3Uf+20VeC54FlkPj07EX6L36Y6E6M01NP/wk0irXJDqfcQqqfpHEzq
	 0OFT+Ap+dVjttefP3ovpA5sF+TcwFwCRCS79MtuCOwI+Tuch5lu5+Mv6fqj5/Z5G6MCyU
	 QcxhuxD4YCu3BvP3ghAG9A4A01su3oKsb9FGFE6ohbRKxhCXUnrcqgSoK2/sXKGjN3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=FL1ZaMku;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B64606A327
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B64606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=FL1ZaMku
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so5249283eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1792688336; x=1793293136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wszrh6R2g8rAfmRyvD0Q1PJ/LXwFW3iH+CJpBKb1e0Y=;
        b=FL1ZaMkuY3485iIc3ZQCn3sG+fTJWBdV09VwotBgZrc/rZo7Cho79baKAkZAUlJ2JY
         uu/5e9rj05pf3lj3sBw7UBZfpuBp8V08rw+qABCc+IFc7QxBq/C0X9x5iGEsZzPT4YiO
         zrSz/MpcrWnCNgS//YZKHTrYOOfNuhtDXhgdg/TaBAHletiw4lGLDbU0nTmcvzGDYMW7
         q4GnWSZmABXUt9yGZmbyTuUhddJQndmGdbu7IegHeKuwwHH18YRtaACBapikc2uLQlOh
         UjvxsWAClH91Qkx1lCxQCtYyCv+wCXzSGfdY/1596lds0RqodFwXVYChF6kpT9hTg4eG
         iOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688336; x=1793293136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wszrh6R2g8rAfmRyvD0Q1PJ/LXwFW3iH+CJpBKb1e0Y=;
        b=Mro8GguXJ99s6lorViin9shhq8g5fcdJ9mHRiiLS/YPSmXCDW/m7k70g7FooiA8jEP
         wr0iCmq2g6Rd5g373SZT3Z1Or21hGn9UsDoHLsC+wn/7kPZfsE1ln7Pp+XovuqdvbRln
         WvUWVLC1jlM9gjzr25tyn+7QxuGMa7CltfyIm4YYK0IAVT62pMaq+UczZKyU+COd4tG7
         GlfbymGtzcGn/OXekYfctfT1lR4MCNSCj8ruzpb+mv2LdgBw7zP7PAsY9IqkBDBWW14j
         0lEk4b962o2pfqZWaB3f/PpM9D9dcjUUAvH7NhOvoeS5sgRA16cLXVjyV8ZGgsosj1h1
         T/hA==
X-Forwarded-Encrypted: i=1; AKwUvByr4dLk0VVazdBVOJ3r/0iDI4/CLKahtex5ywBzxHO6vo3gfA0X4Y7pp2q/T8f94B8IiLX4DdWjRUroyh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqQErWvtqsnfQsfnAEEHREbrG2pScDWlMug+tT10jZJV+F5ZKX
	nHEGNGo/gSjeX+DW7HkzyXqmtnXKErTSa59Mkfyy7QTEReFKX60doK0mf7HVgRF+3g==
X-Gm-Gg: AYBFou3JGKWMIBkpBPkwNJWN36Ut3PnLGpoyukmCFowpyPJ2KsVpR8xVLr1Ado/R/vx
	jo+oIoXHbR7bp198mto+eyha6rAsTEKm7StsFllXenO2L5EJUeh9ijfKCf2Fw3G9p7/vWqd6PFl
	xY+lYg3/JU0Xq0/PyDPqK2ZFfF5dmF865RllZDPb78iaQ5Lsh4V9osDOTwA5STLiPnM/KSs21AG
	lLsHwFHtiReS1fc1qFhVFgrUcQTW6gsO7wg84Wy0M2A9W90dDpx1rcablCzJJbOAxY10ajvTM6c
	C8iJiCKMiaHkynwxSkXEGUNVisE3UfEq4XnJ2hRG65J05fSgPF7QJXR0tieV3NqRRv46SHpcyus
	LBKvX3G3Qnx2/eoUDLJitu76VpV0GfItHHHFwg1qPxUcE80+SyPzYQjSHV+cyn/pXDVZawhQRZU
	PzJNZan+gTtcVL8IbgL8KyIAbCm3mW1HCnMkJaItI+72TJtYK0BCjVctmdMC9QSD5fSR0V7ukg+
	zd22sDQ3tKtfK6zpVwqdJJYzMm04BHuqbzocxq/Rx4FFX5Jv8fVFdvXHPgVwforMoHhdtWei6nu
	EKrbH7wFk+R3B4+7P8s2HIaqaZcUJhhSOg4=
X-Received: by 2002:a05:701b:204f:20b0:184:329d:eced with SMTP id a92af1059eb24-190a52de3edmr7715048c88.25.1792688336131;
        Thu, 22 Oct 2026 09:58:56 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d3ae06fsm15951151c88.19.2026.10.22.09.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:58:55 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mahesh@linux.ibm.com,
	oohall@gmail.com,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/2] PCI: Add pci=noaer_recovery kernel boot option
Date: Thu, 22 Oct 2026 16:58:41 +0000
Message-ID: <20261022165842.1463451-2-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261022165842.1463451-1-yurypm@arista.com>
References: <20261022165842.1463451-1-yurypm@arista.com>
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

On large modular systems with a complex PCIe topology, allow userspace to
inspect uncorrectable AER errors before Linux attempts recovery.

Add pci=noaer_recovery to retain AER logging while skipping recovery for
uncorrectable errors. Check the option before dispatching either CXL RCH
internal errors or ordinary PCIe errors so CXL driver error callbacks
cannot bypass it. Also skip recovery for errors reported through GHES,
while retaining error logging and releasing error buffers and device
references.

Correctable errors continue to be handled normally. Skipping recovery
avoids its clearing of uncorrectable error status, but does not suppress
Root Port interrupt acknowledgment or change firmware error handling.
The option is AER-specific and does not disable DPC recovery.

Signed-off-by: Yury Murashka <yurypm@arista.com>
---
Changes in v3:
- Check the option before both CXL RCH and ordinary PCIe error dispatch.
- Preserve logging, correctable handling, and current GHES cleanup.
- Clarify the AER-only scope and rebase onto PCI next.

v2: https://lore.kernel.org/linux-pci/20260709185429.627968-2-yurypm@arista.com/
Review: https://lore.kernel.org/linux-pci/20260709190616.DF0CF1F000E9@smtp.kernel.org/

 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 drivers/pci/pci.c                               |  2 ++
 drivers/pci/pci.h                               |  2 ++
 drivers/pci/pcie/aer.c                          | 13 +++++++++++--
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4b..6047efd3c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5118,6 +5118,11 @@ Kernel parameters
 		noaer		[PCIE] If the PCIEAER kernel config parameter is
 				enabled, this kernel boot option can be used to
 				disable the use of PCIE advanced error reporting.
+		noaer_recovery	[PCIE] Disable Linux AER recovery for
+				uncorrectable errors, including CXL RCH errors,
+				while retaining AER logging. Correctable errors
+				are handled normally. Requires CONFIG_PCIEAER.
+				Does not disable DPC or firmware error recovery.
 		nodomains	[PCI] Disable support for multiple PCI
 				root domains (aka PCI segments, in ACPI-speak).
 		nommconf	[X86] Disable use of MMCONFIG for PCI
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index a62af7320..9ca8d3fbb 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6840,6 +6840,8 @@ static int __init pci_setup(char *str)
 				pcie_ats_disabled = true;
 			} else if (!strcmp(str, "noaer")) {
 				pci_no_aer();
+			} else if (!strcmp(str, "noaer_recovery")) {
+				pci_no_aer_recovery();
 			} else if (!strcmp(str, "earlydump")) {
 				pci_early_dump = true;
 			} else if (!strncmp(str, "realloc=", 8)) {
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 77efa4c5c..ccc6a678c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1337,6 +1337,7 @@ static inline void of_pci_remove_host_bridge_node(struct pci_host_bridge *bridge
 
 #ifdef CONFIG_PCIEAER
 void pci_no_aer(void);
+void pci_no_aer_recovery(void);
 void pci_aer_init(struct pci_dev *dev);
 void pci_aer_exit(struct pci_dev *dev);
 extern const struct attribute_group aer_stats_attr_group;
@@ -1348,6 +1349,7 @@ void pci_save_aer_state(struct pci_dev *dev);
 void pci_restore_aer_state(struct pci_dev *dev);
 #else
 static inline void pci_no_aer(void) { }
+static inline void pci_no_aer_recovery(void) { }
 static inline void pci_aer_init(struct pci_dev *d) { }
 static inline void pci_aer_exit(struct pci_dev *d) { }
 static inline void pci_aer_clear_fatal_status(struct pci_dev *dev) { }
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index c376c3adb..c41e5e13f 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -142,6 +142,7 @@ struct aer_info {
 					PCI_ERR_ROOT_MULTI_UNCOR_RCV)
 
 static bool pcie_aer_disable;
+static bool pcie_aer_recovery_disable;
 static pci_ers_result_t aer_root_reset(struct pci_dev *dev);
 
 void pci_no_aer(void)
@@ -149,6 +150,11 @@ void pci_no_aer(void)
 	pcie_aer_disable = true;
 }
 
+void pci_no_aer_recovery(void)
+{
+	pcie_aer_recovery_disable = true;
+}
+
 bool pci_aer_available(void)
 {
 	return !pcie_aer_disable && pci_msi_enabled();
@@ -1338,6 +1344,9 @@ static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
 
 static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
 {
+	if (pcie_aer_recovery_disable && info->severity != AER_CORRECTABLE)
+		return;
+
 	cxl_rch_handle_error(dev, info);
 	pci_aer_handle_error(dev, info);
 }
@@ -1383,15 +1392,15 @@ static void aer_recover_work_func(struct work_struct *work)
 		ghes_estatus_pool_region_free((unsigned long)entry.regs,
 					    sizeof(struct aer_capability_regs));
 
-		if (pdev) {
+		if (pdev && !pcie_aer_recovery_disable) {
 			if (entry.severity == AER_NONFATAL)
 				pcie_do_recovery(pdev, pci_channel_io_normal,
 						 aer_root_reset);
 			else if (entry.severity == AER_FATAL)
 				pcie_do_recovery(pdev, pci_channel_io_frozen,
 						 aer_root_reset);
-			pci_dev_put(pdev);
 		}
+		pci_dev_put(pdev);
 	}
 }
 
-- 
2.51.0

