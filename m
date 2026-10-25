Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950036;
	b=21HY+nkCvYc5Bw8cRIxJ8sSgxeNkarAIzlRIBJ9+MrRyoZEXAROVJ370NR/GaAyl84+H
	 O1Kzw5mEGZKN/Vz1aMbvCHtFVJSv0ZjXT2bB/JEf6C/O4H057p6RVAnHOw41VEWecnM1U
	 rUrS0wrRyniLJo5Y6JQ2dwc4TDqW+9XSwbigmNBXDRmurGk2qLj7T58ZSiBE9fv6bey/S
	 NVSCsto0dzscrhKWwSE8wdzHOH5TTeOe/KjUOgunmgYJlNcMQnQEsv6JkdL5gh+gToXnu
	 RYplQltedbxMOf8luuClyHmjnPy9wt9QDmrUapwVMZwBN8PgsLcqxGT43Ht5jTkV+Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QeCPVU+TT7xZWsohIOPLxgTp4DXEQmJIT8fXCzhydds=;
	b=34aP7u7HqVuDYDWv2CyI9gj7X+I4SjdkSJAqfB88nLsbqrY/But+2NIdzRPvYcwZRnoR
	 rKJQ0M/IpwmoBLTa0O8UIyN8ty3rg8LHkSM59Ti6+CcuihbXVKYiGd6WMXaDCV9xn/rHE
	 voXx+jOJaca9CYRBvIxWgI83X7Evd14bLzHAIBN28cIZLVnsv60sSMaO2PWUhwCEV2tPN
	 d1nI2I9ps3APTrg/p3k5fXU/keabM3M7O5rsmwhia+jqkDwr/8N+RqZseEOgxWuW0Ci31
	 zo3xHDjdhhhbjD8qMdAN6FQCPYdxwxtY+zi1Dy9me7ueEatomUMs7DMxsCeS3q2lWNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="YM/+CkA9";
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30896606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30896606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YM/+CkA9
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5e948e56af3so1085512e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950030; x=1793554830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QeCPVU+TT7xZWsohIOPLxgTp4DXEQmJIT8fXCzhydds=;
        b=YM/+CkA9ulfPVh7UdymLwZ58eoNdnyxqgcSrRcAKiZQIeRQkyzQnNFBUuFcqvCJqdh
         vIL67wMfo7Oci4FwOxzpYlVf+vr/8Yf2/AwUWobHpzvCevQ5pfWtnty6NitJnBXNKX8w
         cAwQC/Xl6uE/OajcqgrMWyIZ6CLl65q4pwfzbYI6KbQscchvScZBZrCCq4Atd6hOpGKb
         BjgowFvFHSTFFyKCZLkdPgAe7w5f7WRAmwkhDVzcrVG3oZ/1aR9bbm8KzDgBDYlgulkh
         GZiBMmsvS6LVNHluiqwaxi+yT++NCJSQdk8dTbB/24kW4IslEFVHmho8Y50hv9B7/NUt
         cGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950030; x=1793554830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QeCPVU+TT7xZWsohIOPLxgTp4DXEQmJIT8fXCzhydds=;
        b=KHiQ9ucz899x7I40jwZi+/Mu8qos6lwuceJ4d+h41TUdCkawX4IcjnUoVTOE3tbC8e
         3oNbQ/m20hmYTZYcDkhO+cHr8p44acOIY1tSPqBERhlOUBSHzwhrxw2LPOM6GmHTXbJS
         isq8EMhBaSzWnAs6AkllCl9rkfnzDOyfGIOroQePFr2bVFmzTr586heybj/rxla1D6c+
         m3eiqAu4AbXg6aiirqex7ovhzdhoVQ2WynwaEiplepS8y1yJoYVJLkAiArTxepvjhsjr
         8nCEFnMYXjuwjq2W+e7pDK+t0+wnjpDKZURDhIEasas5IiEsmv4ICheck9yPWzd16ZF9
         zWlw==
X-Forwarded-Encrypted: i=1; AKwUvBzsdTpKqa3L0kbmUZ2U+q5UySb5iI3SfOOFpEECojPpkjiNH7NBsxzabdbnvnz0lkCrTjoM1K5sAljoZDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXnHvBMMwWEgLXedbHVzEUWsu/XIcVw5a8QAdNUIj1HO0rUIK0
	EYNw0q1BBveMuNAnh7pfTYNM6SSxxV6DiWvIHoN58xyk1lEydczHS9J4GkWE9tBrM0s=
X-Gm-Gg: AYBFou2xLE5PNOWa63m+ov+Y6aNzKthzuoAdqUksiHzj9MgbDPU74HGRMka/5vaYSN0
	FOwC0dbVZHofNC2SCApcSheQGzXN4oS8nqISQGHftjLMuGhZVTeOPBSNgNQD8ZZpsX5gHCWeVu9
	ynfvflA3lfhnSnRPIVmRWTNeCie9pouW1yrs3pipfYgiS2CMwNbPuV8Ty5a8ah3lMX2Gkf+92YR
	WAD+2Y0X1OPEe10zocEtesjcM9spO1MacuOO30UVAuZvI3xGN/M6XHabbIZfm37pA+lL1V/ePjV
	Hpe4JNyfZ7zCW4PqM4+vCp9s4YWeT+URmbWt6rZ17y3WvWhID0Zuz7hPX7W1kCGdQkRC6eDEBhs
	T9rfRGb/VCsE6Xg8/luiOjDZSDhcm3YLXUUSPyzq29UkPowIUOn04uFz9kEGnogTstktqgEhLoA
	7qg4QU9DjBAva4a/2JjJcX2haSg0XSPwKUVvWGyU7lcT1LnWCuRaftnLnAah32h4lwJF+n3gadv
	AF25K8tj3lruMWEJVMxbgiEwVY5RPVNt70pAi8mkPLKQcUY0a8p4xpfLVh+jZH+/ps+70/6eupq
	yNS6CmEjmKN18mrU1ZGS1gGnEuqExsHDIHi0uMOOoDEK7C6Pasles7kTml85cj6Z0xQbVrZGQG2
	o
X-Received: by 2002:a05:6122:3d06:b0:5ea:f1eb:b9e2 with SMTP id 71dfb90a1353d-5ec232a31a4mr1273841e0c.19.1792950030175;
        Sun, 25 Oct 2026 10:40:30 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:29 -0700 (PDT)
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
Subject: [PATCH v2 8/9] kho: test: support read-only KHO mode in test_kho
Date: Sun, 25 Oct 2026 13:40:15 -0400
Message-ID: <20261025174017.3870481-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
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

test_kho currently depends on CONFIG_KEXEC_HANDOVER and restores
preserved folios via phys_to_virt() and kho_restore_folio(), which
prevents testing preserved KHO state when booted in read-only KHO mode.

Allow CONFIG_TEST_KEXEC_HANDOVER to be enabled with
CONFIG_KEXEC_HANDOVER_READONLY and update test_kho to verify preserved
state when kho_is_ro() is active. In read-only mode, retrieve the test
FDT subtree, map the FDT folio via kho_ro_map_folio(...,
PAGE_KERNEL_RO), map the preserved vmalloc folio descriptor array via
kho_ro_map_vmalloc(), verify each folio's preserved order in the KHO
radix tree via kho_ro_lookup_folio_order(), map each folio via
kho_ro_map_folio(), and verify the checksum over all preserved pages.
Also guard kho_test_exit() when no outgoing test FDT was allocated.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 lib/Kconfig.debug |  2 +-
 lib/test_kho.c    | 71 ++++++++++++++++++++++++++++++++++-------------
 2 files changed, 53 insertions(+), 20 deletions(-)

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
index aa6a0956bb8b..29029dcf5815 100644
--- a/lib/test_kho.c
+++ b/lib/test_kho.c
@@ -236,10 +236,10 @@ static int kho_test_restore_data(const void *fdt, int node)
 {
 	const struct kho_vmalloc *folios_info_phys;
 	const unsigned int *nr_folios;
-	phys_addr_t *folios_info;
+	const phys_addr_t *folios_info;
 	const __wsum *old_csum;
 	__wsum csum = 0;
-	int len;
+	int len, i;
 
 	node = fdt_path_offset(fdt, "/data");
 
@@ -255,15 +255,34 @@ static int kho_test_restore_data(const void *fdt, int node)
 	if (!folios_info_phys || len != sizeof(*folios_info_phys))
 		return -EINVAL;
 
-	folios_info = kho_restore_vmalloc(folios_info_phys);
+	if (kho_is_ro())
+		folios_info = kho_ro_map_vmalloc(folios_info_phys);
+	else
+		folios_info = kho_restore_vmalloc(folios_info_phys);
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
+			continue;
+		}
 
 		folio = kho_restore_folio(phys);
 		if (!folio)
@@ -276,19 +295,33 @@ static int kho_test_restore_data(const void *fdt, int node)
 		folio_put(folio);
 	}
 
-	vfree(folios_info);
+	if (!kho_is_ro())
+		vfree(folios_info);
 
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
+	int node, len;
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
@@ -304,24 +337,21 @@ static int kho_test_restore(phys_addr_t fdt_phys)
 	if (*magic != KHO_TEST_MAGIC)
 		return -EINVAL;
 
-	err = kho_test_restore_data(fdt, node);
-	if (err)
-		return err;
-
-	return 0;
+	return kho_test_restore_data(fdt, node);
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
@@ -330,7 +360,7 @@ static int __init kho_test_init(void)
 		return err;
 	}
 
-	if (err != -ENOENT) {
+	if (err != -ENOENT || kho_is_ro()) {
 		pr_warn("failed to retrieve %s FDT: %d\n", KHO_TEST_FDT, err);
 		return err;
 	}
@@ -355,6 +385,9 @@ static void kho_test_cleanup(void)
 
 static void __exit kho_test_exit(void)
 {
+	if (!kho_test_state.fdt)
+		return;
+
 	kho_remove_subtree(folio_address(kho_test_state.fdt));
 	kho_test_cleanup();
 }
-- 
2.56.0.307.g5fe7bd680c-goog

