Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228CA3E6DEB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906953; cv=none; b=U+IGSoeyayrT4vBrE0FS1z8QWcKf+rIFq3ZXll1Vj6ouUa+RnjaQuDDg4mZD+h4yx7T49NeZtkyFjc+1xyykWXXdUJUwSxFTQN/+nW7XcVtlswHv6fvP46b7wQTwWXY1LVXQc08C2r/HvGF5Gfyn61sPlm0zMccALxLEdkIMLes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906953; c=relaxed/simple;
	bh=H7xQmrf/9cBe19OKnaj/DDaZmeqkxVn3iLgxCuh5hOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dvh3VZSk/7MFMbT0hnmZ368aUQH+kHoLebzxFFuv/BbKmMnFZj2LgZ3piVU0p1qB3PfQPO7jApgnQ0o77fck9891xxhWvLAwQKav8bfz0FItIf070HUOP/rphB+RUsEe5vNjy8hbnNqz9NQ1G+mvwF73jgFkEkA1rWXL8asiOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlAe/Qwd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlAe/Qwd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cedda2ce6fso5357845ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906949; x=1788511749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pocGFIirgSi1A7XDDdcVKS31AoGl5aEaP8HYQb/Z4kY=;
        b=VlAe/QwdkkIcYWC0raihOropRZdYkVkoEux3LbIdpfEMSrrtTDoFJqi4pyvr3R0geb
         7Dp5SOuktmuRxZkMbz02EZLDZXDaqtmt+PVLq3WUAElpdJZ7edIM8YboVgzpax3J5PbD
         b7drenkpfFwegjaiaC4zmnY6z+OKLylMlk4DNu3HPkFMzWkIPmEYtgxwFuLB1iZ6+DtU
         Zl2tWtZ7gl2hIJ3sa8gvOD033/oNxuJDwfb/mZQzff27wz4ULJOZjlC2qdz01k5u+x3D
         ReH7s5v1eiEhWFay2uhWnWIz6t8vAlQfrcVY7Bb/Y0D45nB8BMl877jr4qnVTrErwVcX
         0Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906949; x=1788511749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pocGFIirgSi1A7XDDdcVKS31AoGl5aEaP8HYQb/Z4kY=;
        b=qg0ssot6gjmTcX/7uUV9InfkTnOzPbMtsRZB7RcCu8dASnhYjc2iU6u58I2VLzdlMx
         bJj0uZDVuy4igFksmVdRxJJ4mpPLC77YwAxLv/j18v50NSFyUEXbUmPtSpICrqLmN8XZ
         nXXwocfohh97L2UuOfSWkAc7HVA6BY7lhImt8JaPqpYp8GRAsrmnt30gZ28/IEJpx2lb
         mqjdnED7aYlRSLiN45h8EAcbT3ipQhHeSXYUTC+jxDwYesNyp/NeyyQHS/Mh3NUW+4vn
         lWNunDK1WrASnsnEJ5SRPIWP3d1tITyqZNtEY1CjfGHySMN63iF2zPvRdajtEJOMZ2jx
         on5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqBzNuj1oG76xufCtOxZnnyjtrSQLlLlLIRJ2kSSKX8xiDbODxqInF8hW5cvM3iuQUq+hB9dHF9jCadkqA=@vger.kernel.org
X-Gm-Message-State: AFuF++mDyRnq7atJmezJP53+0OSqXIwa+6O2vhY85M8ZzRidUwShvfIl
	ZX8HuMB7h+jATMXRCKxVXRq9aNElzeyl5QbPLO8SGsG4sGfpPHVp7MtE
X-Gm-Gg: AR+sD13sC0CnooDqpAzjcINtl2HyuozWT4KQuPlA2lw6YBeDqt6o7XU3nd02sf8j8fu
	cngv12RnirqP31Z4MlaJufUxfhYNkvwEhiV8ltp+1sLxg+bpwzuPqVwsUbloJEtKbHuWombtM5G
	zVzDrenbic7Jtgns/6/M28PraIHZi3Do4kepMxaTRRkBwIuenzxdSbcwrrjmDB0pn0UmZosTc6G
	2dknmh2xISyatRNNEChso+d5pt3jTdrgf+tpKn91+OmCINu8uWm4A93OFjcwFfl8hufVgqtpYSd
	mwIMAko6gcbN1p0LF+kNr0ONPyLulnpg6DLhwp0vGgzQ8dFxXaA6lNJsm3QzzRDoso2kjbX9htP
	loPo6DRbtNgda+ssnvrQtFj6v8/jr6pWrVn30vhTmjWxTcJWnPBNrnsU7wPw2JSwNEXcsIq1BA3
	yQoXZG4WHlDqryZtVlDn/9KLgPkrySjiNllDRT93Dy90DRZVV8NdCZmVs4wmIsVLdf9BzMhA==
X-Received: by 2002:a17:903:46cb:b0:2d6:3c22:99bf with SMTP id d9443c01a7336-2d74deed252mr104246205ad.9.1787906948801;
        Fri, 28 Aug 2026 01:49:08 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:a97:707e:a14f:cfbf:3e23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm3918689eec.14.2026.08.28.01.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:49:08 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/9] crash_dump: Fix potential double free and UAF of keys_header
Date: Fri, 28 Aug 2026 16:48:47 +0800
Message-ID: <20260828084900.1496839-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828084900.1496839-1-coiby.xu@gmail.com>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If kexec_add_buffer somehow fails, keys_header will be freed. Depending
on /sys/kernel/config/crash_dm_crypt_key/reuse, it will lead to the
following two problems if the kexec_file_load syscall is called again,
  1. Double free of keys_header if reuse=false
  2. UAF of keys_header if reuse=true

To address these problems and also make it easier to reason about the
code, keep two invariants,
  1. keys_header will always be freed at the end of kexec_file_load
     syscall except during kdump image unloading for CPU/memory
     hot-plugging support
  2. There will always be valid keys_header if reuse=true

Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump reserved memory")
Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 include/linux/kexec.h        |  6 ++++
 kernel/crash_dump_dm_crypt.c | 66 ++++++++++++++++++++++++++----------
 kernel/kexec_file.c          |  2 ++
 3 files changed, 56 insertions(+), 18 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0af8ae4fdd08..0fa8bac04576 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -552,6 +552,12 @@ void set_kexec_sig_enforced(void);
 static inline void set_kexec_sig_enforced(void) {}
 #endif
 
+#ifdef CONFIG_CRASH_DM_CRYPT
+void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image);
+#else
+static inline void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image) {}
+#endif
+
 #endif /* !defined(__ASSEBMLY__) */
 
 #endif /* LINUX_KEXEC_H */
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index c685497cd470..4335b6cb1fc4 100644
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
@@ -424,14 +438,15 @@ int crash_load_dm_crypt_keys(struct kimage *image)
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
+	 * cleaned up at the end of kexec_file_load syscall
+	 */
 	kbuf.buffer = keys_header;
 	kbuf.bufsz = get_keys_header_size(key_count);
 
@@ -441,18 +456,33 @@ int crash_load_dm_crypt_keys(struct kimage *image)
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
 
+void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
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
index 59fb9d71e9d8..062f7e79016d 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -140,6 +140,8 @@ void kimage_file_post_load_cleanup(struct kimage *image)
 	kfree(image->image_loader_data);
 	image->image_loader_data = NULL;
 
+	kexec_file_post_load_cleanup_dm_crypt(image);
+
 	kexec_file_dbg_print = false;
 }
 
-- 
2.55.0

