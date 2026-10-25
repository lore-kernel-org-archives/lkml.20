Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950022;
	b=0cJRe+x5qEM/92SpX6OPNpAHR5u+GmFH3LTUSF02gOFqlTrLBvskI9Jecb5sb9zjaH+M
	 yLYilALSku2buyVN2I5hPRGhLXjLTnLCE4I5NMttfUAKmDopZlCqIt/4sTzsUKWQQi15g
	 4pHi25K7jYjo7EuH7QZsEgITwnDJv+L/pV0b36FROZymHGASwwpSDisAtGv2qn9ZRBnTb
	 cgpSMopCIgXnXOX0xt0srQ/EjVPLkljhhd1yPaNyoHGy7auH9+jF0gc7iYlXpIm/a585O
	 WjXjlqXqIUii/fRPr4x/m6AWqt9BPKbWbt+uVMWBhKCISzGHUKyZacc5y24L5njRmig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nlyb5eFqjPdmH1nFRtnItgVGTITVkyurMpQB27D3UKE=;
	b=qQL78jCvw/ZhVZZ6Uwb4L/F/GTQSsQeFbbUdhMXxy+dQqFskrk8ozzGwcUas5Dlo9jXZ
	 ekGap/7u+4880lYrr4FmfSCyQiMVoh6RgFDxJR+to8XwQzi7aUe3xZKb26H4pYY0IlG+A
	 8EeoJZ2BQj3Wp5dx2lwViUeEdKk6ZHDR1Ae6crPnqO91YTUd1KjIkMxhWTQw7FYfSW9V/
	 UKRrxC65BPOTO7bB5bo4yt+rtBJM4/WTLaghGgRaR5tPtry6TKnSmEnRRYKupw/OefOqC
	 5ExkfaWWulp6Bs5/53V6l5sD3fzEXjF4ntXooG62JYLRDX2U4pa7aSmgQDV1/Kb5QIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="RRZfVnC/";
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AB5606A322
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14AB5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=RRZfVnC/
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eadf48fb2dso812827e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950021; x=1793554821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nlyb5eFqjPdmH1nFRtnItgVGTITVkyurMpQB27D3UKE=;
        b=RRZfVnC/dOvs/C75LPnksTwnhs1L79kgUQgaAr57uMxwY7VzS7dWc9QA7n2vpwPSZf
         qYPuTqMOxANWNn7drKpJ7lFq0Zb3vyzGg6rj0/5ldJBNrY6t/58yh9hEX8kbnCaeQG6U
         WbQlratJqulqCeQ7xZX31XVOraunI37u7ERmn8KCIV7KfJ8rtFc1RqgIFFSehagCpjdW
         J/+DEt3OtgTsZuc82RNXaZQZW3XcAZR9HTqG6fAMt5m7ErXtTAV6QXXepzmf02qKfO2x
         QYaImDL/NmNRm9hlWAusGneQy6OSYvnfKgecdww3vdnONdLcdP6rd228Uh5342bUKqzG
         9Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950021; x=1793554821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nlyb5eFqjPdmH1nFRtnItgVGTITVkyurMpQB27D3UKE=;
        b=BYl0ftqiKPi5PjI4mjY56ZptSMd5TTTd1soCL/VFWM3PzJMUObHCwOKYd1Y2Uxdioa
         Zk9eyaIWQo5Qm/c1AaDcGbGqWuSfbqGu3g28XoTxwlISfwybfDDacZeoib9XfudnOSVF
         VE76FcJGSI82H40McHgBZZKmaE3GW3i4SGPQCuqzLdDAWT5aOEndkCKRXmEvzkoSoBXN
         O1fVFDU0DffxtfsUwUWckSoDVLbgH5NqZQQdpx6DgtBAyFMoYEHztxELBpwTvdyhB8l2
         DFkaiKl2BKwZPqf6OIQEial7g1etPlm95Cy8Zdr9ut+1GC5pZOSibLMtXaXusDHYb6RA
         XtKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzykhxidYFQPqo5j9lmP7K07X7y6Y4/1d1kx1GeOs54SjR9sNm7Gt7bt/nxo6AfnxEEXGvzJzFgQEMXg64=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpEcYLDTbSK3xvh7EOsS3FP2LnYLDBoz/uDHsfp0LN5KhBe/tA
	v6n2t9Niw8WkbQQLNmjk832wPp0E2ndPj41646cM6Ll5QYOJfGpuc26I9LJ5vSq7wW0=
X-Gm-Gg: AYBFou1T3gcSLUSq+M2aqIisIs0TBdlWOEUTZnhK/kuIFhuNA5VUwGJeEyShJQnh9D5
	CYBoMCtrOnJTYgGnSja+iFungyhwAYiB6zsLhf5yzd3H389zC7pnH0Yz91Ynd2+JVPLwUXd0sbK
	YEisQ14ZCZPVMd4QIuBSNpfroLsq6Imce7cw+mlwqkI8fDkCvywRX8ZNHOsFVKHe0zDCkUF0tGM
	TUaU3ivFfoMPi/Lk0NEYe58e925xPfr4TGNAu04IbHGJ82/rh2Zx1E/TLIjuYJfwC8EQtfVtEoy
	y0GHFIx6mRjtKMdiEHEiUYDnW4kvOK3y9KFljipzccPudas1iRc+6GSmU992lkDhaCMhKAIDJjM
	13DYbzZvsXmHiBByVRJpGE7a+kTWvCtEw/Xc1JE7fNuG3esbYZNEM+6AOmgC/Su+M2CocaC1ZEj
	JEZudTMgadykP/3GpOEa1BnsUMi2L4en+XpdQmwJHOWZVhg3Au8BIghDzjx7rb3brpHFk5Boe/X
	L8NfnXezQlFwAePVlFotwxfRr9Ty9DKdJ84Q5fzNwR1z2PxMMvdxhc1PhbvEbMARO75SBB5UHly
	fXhxQJibR4zV9JONN3LFesNxL8xkV93/SbQkc8zCxjybJhyD4PhBb3ODxLo0gvQ7b8yTQLp+DMA
	9
X-Received: by 2002:a05:6122:1829:b0:5ea:d649:d1bc with SMTP id 71dfb90a1353d-5ec232b5465mr1591325e0c.18.1792950021033;
        Sun, 25 Oct 2026 10:40:21 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:20 -0700 (PDT)
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
Subject: [PATCH v2 1/9] kho: expose physical address of outgoing FDT
Date: Sun, 25 Oct 2026 13:40:08 -0400
Message-ID: <20261025174017.3870481-2-pasha.tatashin@soleen.com>
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

Expose the physical address of the outgoing KHO FDT via
/sys/kernel/debug/kho/out/fdt_phys (analogous to bootmem_phys) so
that userspace tooling can locate the root KHO FDT in physical memory.

Also add kho_debugfs_cleanup() and remove the KHO debugfs directory
if kho_init() fails after initializing debugfs, ensuring fdt_phys
does not retain a dangling pointer to a freed FDT.

This is going to be used by the upcoming KHO read-only mode.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/admin-guide/mm/kho.rst        |  3 +++
 kernel/liveupdate/kexec_handover.c          | 10 ++++++----
 kernel/liveupdate/kexec_handover_debugfs.c  | 22 ++++++++++++++++++++-
 kernel/liveupdate/kexec_handover_internal.h |  7 +++++--
 4 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 902d171a780a..2ba884c620c5 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -96,6 +96,9 @@ stabilized.
     current KHO state in this file. Kexec user space tooling can use this
     as input file for the KHO payload image.
 
+``/sys/kernel/debug/kho/out/fdt_phys``
+    Physical address of the outgoing KHO FDT blob.
+
 ``/sys/kernel/debug/kho/out/bootmem_len``
     Lengths of KHO bootmem regions, which are physically contiguous
     memory regions that will always stay available for future kexec
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe3181..ce5983abf181 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1851,17 +1851,17 @@ static __init int kho_init(void)
 	if (err)
 		goto err_free_fdt;
 
-	err = kho_out_debugfs_init(&kho_out.dbg);
+	err = kho_out_debugfs_init(&kho_out.dbg, kho_out.fdt);
 	if (err)
-		goto err_free_fdt;
+		goto err_cleanup_debugfs;
 
 	err = kho_out_fdt_setup();
 	if (err)
-		goto err_free_fdt;
+		goto err_cleanup_debugfs;
 
 	err = kho_kexec_metadata_init(fdt);
 	if (err)
-		goto err_free_fdt;
+		goto err_cleanup_debugfs;
 
 	if (fdt) {
 		kho_in_debugfs_init(&kho_in.dbg, fdt);
@@ -1893,6 +1893,8 @@ static __init int kho_init(void)
 
 	return 0;
 
+err_cleanup_debugfs:
+	kho_debugfs_cleanup();
 err_free_fdt:
 	kho_unpreserve_free(kho_out.fdt);
 err_free_kho_radix_tree:
diff --git a/kernel/liveupdate/kexec_handover_debugfs.c b/kernel/liveupdate/kexec_handover_debugfs.c
index 7d74477da0b7..db3830829398 100644
--- a/kernel/liveupdate/kexec_handover_debugfs.c
+++ b/kernel/liveupdate/kexec_handover_debugfs.c
@@ -95,6 +95,15 @@ static int bootmem_len_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(bootmem_len);
 
+static int fdt_phys_show(struct seq_file *m, void *v)
+{
+	void *fdt = m->private;
+
+	seq_printf(m, "0x%llx\n", (unsigned long long)virt_to_phys(fdt));
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(fdt_phys);
+
 __init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 {
 	struct dentry *dir, *sub_fdt_dir;
@@ -172,7 +181,7 @@ __init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 	}
 }
 
-__init int kho_out_debugfs_init(struct kho_debugfs *dbg)
+__init int kho_out_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 {
 	struct dentry *dir, *f, *sub_fdt_dir;
 
@@ -196,6 +205,11 @@ __init int kho_out_debugfs_init(struct kho_debugfs *dbg)
 	if (IS_ERR(f))
 		goto err_rmdir;
 
+	f = debugfs_create_file("fdt_phys", 0400, dir, (void *)fdt,
+				&fdt_phys_fops);
+	if (IS_ERR(f))
+		goto err_rmdir;
+
 	dbg->dir = dir;
 	dbg->sub_fdt_dir = sub_fdt_dir;
 	return 0;
@@ -212,3 +226,9 @@ __init int kho_debugfs_init(void)
 		return -ENOENT;
 	return 0;
 }
+
+__init void kho_debugfs_cleanup(void)
+{
+	debugfs_remove_recursive(debugfs_root);
+	debugfs_root = NULL;
+}
diff --git a/kernel/liveupdate/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
index e9685e1ef6d7..38181076f603 100644
--- a/kernel/liveupdate/kexec_handover_internal.h
+++ b/kernel/liveupdate/kexec_handover_internal.h
@@ -24,16 +24,19 @@ extern unsigned int kho_bootmem_cnt;
 
 #ifdef CONFIG_KEXEC_HANDOVER_DEBUGFS
 int kho_debugfs_init(void);
+void kho_debugfs_cleanup(void);
 void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt);
-int kho_out_debugfs_init(struct kho_debugfs *dbg);
+int kho_out_debugfs_init(struct kho_debugfs *dbg, const void *fdt);
 int kho_debugfs_blob_add(struct kho_debugfs *dbg, const char *name,
 			 const void *blob, size_t size, bool root);
 void kho_debugfs_blob_remove(struct kho_debugfs *dbg, void *blob);
 #else
 static inline int kho_debugfs_init(void) { return 0; }
+static inline void kho_debugfs_cleanup(void) { }
 static inline void kho_in_debugfs_init(struct kho_debugfs *dbg,
 				       const void *fdt) { }
-static inline int kho_out_debugfs_init(struct kho_debugfs *dbg) { return 0; }
+static inline int kho_out_debugfs_init(struct kho_debugfs *dbg,
+				       const void *fdt) { return 0; }
 static inline int kho_debugfs_blob_add(struct kho_debugfs *dbg,
 				       const char *name, const void *blob,
 				       size_t size, bool root) { return 0; }
-- 
2.56.0.307.g5fe7bd680c-goog

