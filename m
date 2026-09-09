Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4E492E4C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914227; cv=none; b=DN6jsYAOXZgfH7+3VSnZEktcRTUN11dvqkwNMjlz92Pq7/MzZkU5/0gVO118btCVH0/MtEhmg57k0D5HGO6Nn73Ge+FpxAYe6PnqfCtbJEP5zCbGEFX63M94n5OIijqA7fD2Z0NQDD962EDikhesABNCWO0TsieN/f0bXOrK/6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914227; c=relaxed/simple;
	bh=5x++Ra8sqAmYAWptOS7Ci2CZmtneObRGP7fziEtN2Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/K3OrcqfiUzfPT4WA1Myg1Npi28f9a1b2G9D82CudtUEpNB0TRsq6xR9+1lQ9BtHbx0SekU7jJMTYztcjxEQer+aUquirPcNGatrnGBIxdEFQkQ+pdH7aYQTlqKwSVLUzHwqnsuDt4SW8XOJR91HtzQATyvyRggCjxKy7KLozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqmvCU+o; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqmvCU+o"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso5788550a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914225; x=1789519025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMNRBrD0F/WKo6JW8olq+4AA/+XHmQzaw6FHgnonGCI=;
        b=cqmvCU+oou9YlUJugw8Qayt5bdVZf+lScshXJRBZXQej3wvDT0ASyUn9hoiqnFkOEF
         IMzK7nXPi0/K9molhjI2i4f9jHlhyGXtg8C3AUDknFEQH46Tv7fufKumB/i1TDrn5K7J
         RhrcI/1cE4gDU1OguYtKQ/NpETONUx1D7RK/0OeDSRyN0VGR5QmNo8cSdI2dj67Jx0ca
         0NjXtVRjzStFc9+m8OCPqlOfNw7B6jvmZiSwPRXv4vL8tWCLk+tY47vrhf2F+rjUI8RA
         k2OtzmQdaDiEX7P4tswyCLkkLubx3jwpoAXNZPmzxPdedvgdTJuLMT2mlptZv3Yv1i+i
         W57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914225; x=1789519025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hMNRBrD0F/WKo6JW8olq+4AA/+XHmQzaw6FHgnonGCI=;
        b=H+sFWTNo0ozHAv1GsVGKzbfpTo62+phWHAocMAbd9LekS64LIUvyjPZmMR0k0EwabN
         VTYeO1F8pMXurXjIbaDLw4rL/mpm/uJ87EmOM/IQDAoliJxs0NoW0T7UkTaMJWlbzZM6
         tKvaW6sVgWgPp/a57j5FbhK0oPP4pWT0+bwbZCQHyoDgAP+A0QQznTTbGXKYNMDyLvE8
         AGjEMQn+hLM4E1LzQDhTccK+DqmUrDiE4lDP1OTGAlIi9s20Ce8LcMgj/+AZhPEf+T4I
         RcG5Vd8yFCI3pzB4t4Y9ovS75hYnYLwirOqaiJGuND/F3t2Nrnl6c07JsfXNq2lVZaD+
         r8lA==
X-Forwarded-Encrypted: i=1; AKwUvBzeSfDDpMUYUotSeGyI4Eo/0X7F6HYbYVg+cH0ht0++d1h81IR1vdP5B8wfAMbi/0pZNTAP8zw1mVWBY9c=@vger.kernel.org
X-Gm-Message-State: AFuF++lsJnHZTvTmWDaxrAXNTA65AdOi+/cgHvax/1RbUtbg9v+hJUia
	rXot+r+8+hVrIc+kyqO+Oez8+D0qjkuxJSjfXKBMJRbC78AwKVQcdLKC
X-Gm-Gg: AYBFou2/NN19V5qyfwXWLPe0g/Zv1cGiI2rBlCLUH/2ANg0FHK94eqP9qllklPWtSae
	x1n0TZpwwNoOL8TGJmtclo93ZpFjTTFJ8JRZbn/G4scf+f9bpH7xvs+kReWjuYqw5wb6MAXy3Lc
	5cxjoTkPkvqUgDNH+nCU8ovHJd2lZ2hh4Vu3tAsRrYvL1hBTk7Msg4GingCbRrTlnaigH3GN/m0
	+/Slg+dWAHgNdS82eIWYhfejz2PRplCmMpY7rOfBwhQezX+feucKMtebs+obD6kRX5XfEG6Q6t/
	ZCSvWIwj1lo2MJp+7BCHvL454kxp/xWGigsXnl3hfzpmGY0iiYQBCO/yqx5bgbIS9j29C4t887g
	pPx0Bvx1ZpgPatat4u9l092DvzvFu/egzQhASoH3gHVANzSGVDAE/gV1j9TZVXoYanISm1GdJSX
	QylyFpVyXXCnzR3OihX0Fx1ByoCakXv3LS5H4jjqldRNl5JlKTysdBbt0y/eTg6X9xtvTT06M=
X-Received: by 2002:a17:90b:538b:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-39b261d5148mr46556851a91.13.1788914224691;
        Tue, 08 Sep 2026 17:37:04 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2615039asm29006878a91.15.2026.09.08.17.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:04 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 1/9] crash_dump: Fix potential double free and UAF of keys_header
Date: Wed,  9 Sep 2026 08:36:43 +0800
Message-ID: <20260909003657.1570544-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If kexec_add_buffer somehow fails, keys_header will be freed. Depending
on /sys/kernel/config/crash_dm_crypt_key/reuse, it will lead to the
following two problems if the crash_load_dm_crypt_keys is called again,
  1. Double free of keys_header if reuse=false
  2. UAF of keys_header if reuse=true

To address these problems and also make it easier to reason about the
code, keep two invariants,
  1. keys_header will always be freed at the end of kexec_file_load
     syscall except during kdump image unloading for CPU/memory
     hot-plugging support
  2. There will always be valid keys_header if reuse=true

Since dm-crypt keys are sensitive data, always wiping keys_header
can also potentially reduce attack surface.

For ARM64, because of commit 108aa503657e ("arm64: kexec_file: try more
regions if loading segments fails"), keys_header should be freed before
retry.

Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump reserved memory")
Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reported-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 arch/arm64/kernel/kexec_image.c |  1 +
 include/linux/kexec.h           |  6 +++
 kernel/crash_dump_dm_crypt.c    | 68 ++++++++++++++++++++++++---------
 kernel/kexec_file.c             |  2 +
 4 files changed, 59 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index b70f4df15a1a..1a0ca54adc9a 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -110,6 +110,7 @@ static void *image_load(struct kimage *image,
 		image->nr_segments -= 1;
 		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
 		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+		crash_dm_crypt_cleanup(image);
 	}
 
 	if (ret) {
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0af8ae4fdd08..82ee550e3cd0 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -552,6 +552,12 @@ void set_kexec_sig_enforced(void);
 static inline void set_kexec_sig_enforced(void) {}
 #endif
 
+#ifdef CONFIG_CRASH_DM_CRYPT
+void crash_dm_crypt_cleanup(struct kimage *image);
+#else
+static inline void crash_dm_crypt_cleanup(struct kimage *image) {}
+#endif
+
 #endif /* !defined(__ASSEBMLY__) */
 
 #endif /* LINUX_KEXEC_H */
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index c685497cd470..f638fb4b8554 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -84,18 +84,25 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
 	return r;
 }
 
-static void get_keys_from_kdump_reserved_memory(void)
+static int get_keys_from_kdump_reserved_memory(void)
 {
 	struct keys_header *keys_header_loaded;
+	size_t keys_header_size;
 
-	arch_kexec_unprotect_crashkres();
+	keys_header_size = get_keys_header_size(key_count);
+	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
+	if (!keys_header)
+		return -ENOMEM;
 
+	arch_kexec_unprotect_crashkres();
 	keys_header_loaded = kmap_local_page(pfn_to_page(
 		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
 
-	memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count));
+	memcpy(keys_header, keys_header_loaded, keys_header_size);
 	kunmap_local(keys_header_loaded);
 	arch_kexec_protect_crashkres();
+
+	return 0;
 }
 
 static int restore_dm_crypt_keys_to_thread_keyring(void)
@@ -286,17 +293,28 @@ static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
 static ssize_t config_keys_reuse_store(struct config_item *item,
 					   const char *page, size_t count)
 {
+	bool val;
+	int r;
+
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
 		kexec_dprintk(
 			"dm-crypt keys haven't be saved to crash-reserved memory\n");
 		return -EINVAL;
 	}
 
-	if (kstrtobool(page, &is_dm_key_reused))
+	if (kstrtobool(page, &val) || !val)
 		return -EINVAL;
 
-	if (is_dm_key_reused)
-		get_keys_from_kdump_reserved_memory();
+	if (is_dm_key_reused) {
+		pr_info("Already got dm-crypt keys, please continue with kexec_file_load syscall\n");
+	} else {
+		r = get_keys_from_kdump_reserved_memory();
+		if (r) {
+			pr_warn("Failed to get dm-crypt keys from reserved memory\n");
+			return r;
+		}
+		is_dm_key_reused = true;
+	}
 
 	return count;
 }
@@ -369,9 +387,6 @@ static int build_keys_header(void)
 	struct config_key *key;
 	int i, r;
 
-	if (keys_header != NULL)
-		kvfree(keys_header);
-
 	keys_header = kzalloc(get_keys_header_size(key_count), GFP_KERNEL);
 	if (!keys_header)
 		return -ENOMEM;
@@ -415,8 +430,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 		.top_down = false,
 		.random = true,
 	};
-	int r;
-
+	int r = 0;
 
 	if (key_count <= 0) {
 		kexec_dprintk("No dm-crypt keys\n");
@@ -424,14 +438,17 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	}
 
 	if (!is_dm_key_reused) {
-		image->dm_crypt_keys_addr = 0;
 		r = build_keys_header();
-		if (r) {
-			pr_err("Failed to build dm-crypt keys header, ret=%d\n", r);
-			return r;
-		}
+		if (r)
+			goto out;
 	}
 
+	/*
+	 * keys_header will be copied to reserver memory later and then be
+	 * cleaned up by calling crash_dm_crypt_cleanup at the end of
+	 * kexec_file_load syscall or during re-try load_other_segments for
+	 * ARM64
+	 */
 	kbuf.buffer = keys_header;
 	kbuf.bufsz = get_keys_header_size(key_count);
 
@@ -441,18 +458,33 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	r = kexec_add_buffer(&kbuf);
 	if (r) {
 		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
-		kvfree((void *)kbuf.buffer);
-		return r;
+		goto out;
 	}
+
 	image->dm_crypt_keys_addr = kbuf.mem;
 	image->dm_crypt_keys_sz = kbuf.bufsz;
 	kexec_dprintk(
 		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
 		kbuf.bufsz, kbuf.memsz);
 
+out:
+	is_dm_key_reused = false;
 	return r;
 }
 
+void crash_dm_crypt_cleanup(struct kimage *image)
+{
+	/*
+	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
+	 * keys_header from being cleaned up during unloading when
+	 * is_dm_key_reused=true
+	 */
+	if (!is_dm_key_reused) {
+		kfree_sensitive(keys_header);
+		keys_header = NULL;
+	}
+}
+
 static int __init configfs_dmcrypt_keys_init(void)
 {
 	int ret;
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..5609301db0bf 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -140,6 +140,8 @@ void kimage_file_post_load_cleanup(struct kimage *image)
 	kfree(image->image_loader_data);
 	image->image_loader_data = NULL;
 
+	crash_dm_crypt_cleanup(image);
+
 	kexec_file_dbg_print = false;
 }
 
-- 
2.55.0

