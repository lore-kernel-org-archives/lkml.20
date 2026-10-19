Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF5D35C694
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375891; cv=none; b=PKGREmNB02rpHJrCNN20MzJ7WPddU9PGKoT2E36XbBuL5BjTQCI98CjJL7k+ABOQfwsw42MfhLeCUITA8HiL1nbAKSZtPnHjVZ+v/HKcvPaGmSFoyPOWeZllZcmY2xPzIj82WjQiyk/cvqM4IMNMgVbZRdAAjdYnRqV2vLZT6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375891; c=relaxed/simple;
	bh=Z+xQnvDTnThgai6dpy0hQArRVZ+9TxKC6/pfh5wkiYY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGVEn46V3iRMS+cnF4ZlSV8rJvzbuIU6XuqMk8cxJtEin7UADGC4YXtoMR2R6BCK7x4InsSwuUb79MRGL+B22/wck7hltxJ1RreH8VJiEmTFpv5+3jejX1/4IbTgaCuTkaNds+g3u2pCI73GOdJP4Xexocc2q/Y9nVI7nvH2y84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aXKElFZS; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="aXKElFZS"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7cc365db987so947709137.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375888; x=1792980688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PhWkLfOOfteM1FeePp68BcqpwCgdE0YNcf9YXtfJq5A=;
        b=aXKElFZSyyRWtFGq1dIMH9ro4VT1vH8Z1hq8focCp0oX67cTnKQeaBf1+cUrDryPke
         rnh/IymcZEgmFU86NKDn9PR0mi6nis+LNES710EqZjX4V3DnbZqayhnAmnQyldom+iJa
         dFTy50HxpM4ZLVLVZFOkjN/ovWTWGlxZtAZwkFrNuOZSVWIdtxR7G1dDVcOqmqCaXt3U
         BmyBMq8HgDg/WbHTl5qCQdqJgUkxtQoeBIvF5e5yeAVQWYnRsHD+NfUrEE4jRacHR7hX
         mWqVBopGvbXnh691zPaTfenUYUY4hBooiqRq1hcBkyAhd8o1bEhpRXELpauG5iOFIFOC
         B2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375888; x=1792980688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PhWkLfOOfteM1FeePp68BcqpwCgdE0YNcf9YXtfJq5A=;
        b=iu5DMGTp6E+PqFaZpocgF28XJTAsHbuGvIep6CI5mf7bvfBhLmwETznkOTif3A4YzG
         htv8XEQffk39gMYM8AruxJC/MvTkTUzFq+rJHTNRGG3gmJEhFXjaudLf+R4LTALveePn
         EvFPMWAyw98i/XWbOQImu8fvWyxlz0phzLppadtN6uZ7j5RqWmMpIuZtyMYvI2o41TcG
         ZBKNhtads6ag5sfTBTTEt5dwY5Ed8C/OptoMXkRnvZPn7H8JI1nHxKAKUr0tqS4ACADp
         roktHpQiCvyH/KduanFGomJLafNCwnoDRXQU10C3IA1qX3A8UzHGtVo4TqO0cAcnd7dn
         sU5w==
X-Forwarded-Encrypted: i=1; AKwUvBz+WSPsFaaGOSCxrE7MDM9JGlFR75duY/j6SBPG4hwTfHcyLFBeeUDQ52JtBA7rOvxDyga8RD1k/j8Atw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmRHXWDmbozPou5ZfJe0jNnBLIwn8TJfscbGa2tkWDahT1Q5QN
	sA+ky0KtOtxGNailDGasTdSFjTualOCgkRs2i64jxQn+vL550yjncjNbor130/SHA0g=
X-Gm-Gg: AYBFou2CFHW+t+SuurVq5KceHSb7mEXugpwN0Wb8UnafvtoyUu0MHrwNttHfg0cdEOQ
	+8oTNwOZtOpvJav/DL5K458EGwxqg3IGi5dWGLqz3MT+H4fqL4t54Ix7HQGSRmkPe8zkuLU0Aus
	8QuiaXOa8w+em+bsiZUsZILV7Qpo82XybLrW4DgnKPxCditf/q+zwO4sj0bZUxPh2qqzCW8QdTn
	3j5lp4r4hHyzn5rqFPOK71fN/Du4zOko2vUHsbfQlk1L4QIsR8+Vus2a54/wZLW1AP9dvknDGsv
	EKPvF7mr/F9Ufd2LRf81CXgHPXm/cHUTuVU564hsaYYXWYLhtn8Q4jgUN0zUl6jqdVeoCKK+b6h
	DQa4dmpk0zf1X3U4LjrESjjMSAFJJP25AhroKG3H4o07fTGgP+dGWL+YQBy/kiQodDxA0o5CN1L
	XASoVA0ODxzsjnDODWdKc21SqOiclYxvYhHeQ9OKyHGaikFyoeJB6d3mEpGyM16Wdal74yf0SVO
	6UNvglF6/wL01dQi2Jevez6VyRTkKIGRYZKNvvHdKSyTbq8wcLHtHSo9vFc3H9Yc5QR7tZjMwvo
	zXxyvfoATjudh77ZElidzWMh2cBjIA==
X-Received: by 2002:a05:6102:849b:20b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7cc3eb09b24mr1037299137.11.1792375888447;
        Sun, 18 Oct 2026 19:11:28 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:28 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v1 7/8] kho: test: support read-only KHO mode in test_kho
Date: Sun, 18 Oct 2026 22:11:10 -0400
Message-ID: <20261019021111.990394-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019021111.990394-1-pasha.tatashin@soleen.com>
References: <20261019021111.990394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow CONFIG_TEST_KEXEC_HANDOVER to be enabled with
CONFIG_KEXEC_HANDOVER_READONLY and update test_kho to verify preserved
state when booted in read-only KHO mode.

In read-only mode, test_kho retrieves the test FDT subtree, maps the FDT
folio via kho_ro_map_folio(..., PAGE_KERNEL_RO), restores the preserved
vmalloc folio descriptor array via kho_restore_vmalloc(), verifies each
folio's preserved order in the KHO radix tree via
kho_ro_lookup_folio_order(), maps each folio via kho_ro_map_folio() (and
unmaps via kho_ro_unmap()), and verifies the checksum over all preserved
pages.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 lib/Kconfig.debug |  2 +-
 lib/test_kho.c    | 68 ++++++++++++++++++++++++++++++++++-------------
 2 files changed, 51 insertions(+), 19 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625..74223ef8bd1c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3381,7 +3381,7 @@ config TEST_OBJPOOL
 config TEST_KEXEC_HANDOVER
 	bool "Test for Kexec HandOver"
 	default n
-	depends on KEXEC_HANDOVER
+	depends on KEXEC_HANDOVER || KEXEC_HANDOVER_READONLY
 	help
 	  This option enables test for Kexec HandOver (KHO).
 	  The test consists of two parts: saving kernel data before kexec and
diff --git a/lib/test_kho.c b/lib/test_kho.c
index aa6a0956bb8b..1e0f257a5854 100644
--- a/lib/test_kho.c
+++ b/lib/test_kho.c
@@ -239,7 +239,7 @@ static int kho_test_restore_data(const void *fdt, int node)
 	phys_addr_t *folios_info;
 	const __wsum *old_csum;
 	__wsum csum = 0;
-	int len;
+	int len, i;
 
 	node = fdt_path_offset(fdt, "/data");
 
@@ -259,11 +259,28 @@ static int kho_test_restore_data(const void *fdt, int node)
 	if (!folios_info)
 		return -EINVAL;
 
-	for (int i = 0; i < *nr_folios; i++) {
+	for (i = 0; i < *nr_folios; i++) {
 		unsigned int order = folios_info[i] & ~PAGE_MASK;
 		phys_addr_t phys = folios_info[i] & PAGE_MASK;
-		unsigned int size = PAGE_SIZE << order;
 		struct folio *folio;
+		size_t size;
+
+		if (order > MAX_PAGE_ORDER)
+			break;
+		size = PAGE_SIZE << order;
+
+		if (kho_is_ro()) {
+			void *addr;
+
+			if (kho_ro_lookup_folio_order(phys) != order)
+				break;
+			addr = kho_ro_map_folio(phys, PAGE_KERNEL_RO);
+			if (!addr)
+				break;
+			csum = csum_partial(addr, size, csum);
+			kho_ro_unmap(addr);
+			continue;
+		}
 
 		folio = kho_restore_folio(phys);
 		if (!folio)
@@ -278,50 +295,65 @@ static int kho_test_restore_data(const void *fdt, int node)
 
 	vfree(folios_info);
 
-	if (csum != *old_csum)
+	if (i != *nr_folios || csum != *old_csum)
 		return -EINVAL;
 
 	return 0;
 }
 
-static int kho_test_restore(phys_addr_t fdt_phys)
+static int kho_test_restore(phys_addr_t fdt_phys, size_t fdt_size)
 {
-	void *fdt = phys_to_virt(fdt_phys);
 	const unsigned int *magic;
-	int node, len, err;
+	int node, len, err = -EINVAL;
+	void *fdt;
+
+	if (!fdt_size)
+		return -EINVAL;
+
+	if (kho_is_ro()) {
+		if (kho_ro_lookup_folio_order(fdt_phys) < get_order(fdt_size))
+			return -EINVAL;
+		fdt = kho_ro_map_folio(fdt_phys, PAGE_KERNEL_RO);
+		if (!fdt)
+			return -EINVAL;
+	} else {
+		fdt = phys_to_virt(fdt_phys);
+	}
 
 	node = fdt_path_offset(fdt, "/");
 	if (node < 0)
-		return -EINVAL;
+		goto out_unmap;
 
 	if (fdt_node_check_compatible(fdt, node, KHO_TEST_COMPAT))
-		return -EINVAL;
+		goto out_unmap;
 
 	magic = fdt_getprop(fdt, node, "magic", &len);
 	if (!magic || len != sizeof(*magic))
-		return -EINVAL;
+		goto out_unmap;
 
 	if (*magic != KHO_TEST_MAGIC)
-		return -EINVAL;
+		goto out_unmap;
 
 	err = kho_test_restore_data(fdt, node);
-	if (err)
-		return err;
 
-	return 0;
+out_unmap:
+	if (kho_is_ro())
+		kho_ro_unmap(fdt);
+	return err;
 }
 
 static int __init kho_test_init(void)
 {
 	phys_addr_t fdt_phys;
+	size_t fdt_size;
 	int err;
 
-	if (!kho_is_enabled())
+	if (!kho_is_enabled() && !kho_is_ro())
 		return 0;
 
-	err = kho_retrieve_subtree(KHO_TEST_FDT, &fdt_phys, NULL);
+	err = kho_retrieve_subtree(KHO_TEST_FDT, &fdt_phys, &fdt_size);
 	if (!err) {
-		err = kho_test_restore(fdt_phys);
+		err = kho_test_restore(fdt_phys, fdt_size);
 		if (err)
 			pr_err("KHO restore failed\n");
 		else
@@ -330,7 +362,7 @@ static int __init kho_test_init(void)
 		return err;
 	}
 
-	if (err != -ENOENT) {
+	if (err != -ENOENT || kho_is_ro()) {
 		pr_warn("failed to retrieve %s FDT: %d\n", KHO_TEST_FDT, err);
 		return err;
 	}
-- 
2.56.0.176.g3575e65682-goog

