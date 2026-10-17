Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C9A387585
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792220322; cv=none; b=bkp2RfXJgl6s62hywthlBFcr6/fRHH3EoMfVKfoj8aOh+EF7urfOWmKggkmpLkWIctfVrwD3pnETuHn4dXpLLzWKC+F0CZseHBJViteeAprD2Z9sOUoSYoDz8FP4Z0DtHW1tHi9huF8f82Qk0ww3Y1AkRkcr7jjmChcg+CPjs9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792220322; c=relaxed/simple;
	bh=ESRSRmmEgvnSHq2i7EhlN+mYcsFuoC9Y8GhPuHzWZsM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=GrDeldHOPaDbCLqQf5SGwB6EaayxNm3UCFjkhx3E9RsdNi+Kj4OyaWoFqb1vaDll01+wwxG4CJVjcwTV5PvF+n5M676u3s6nDH01qGEFrgl8/D2VcH9t8m3fdr4Yb/uCrP9VNgm0Ad9HqgITQFTeEKlo2ULEjQG7mBQsE5mtf20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8h+mL7c; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8h+mL7c"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd60d155070so310295a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792220320; x=1792825120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1p/9iIZcHkAsPmovUNOT6SYxgHuv9VL91d3C6K5p3j4=;
        b=g8h+mL7c2mv9iJpl77TZYeBwoafbbfMgOkoAw4PS/KrpFfbfefPhOG6xvg1x7CnvxW
         +Jgba0KpIYrcjFt8xDndp4mQrfmEOLYfBEk6WS2D12yB7mFPUjOK2vBBoVeEHIae5rNl
         d6k6J1bh+Pry/LR7nREtV/4xbt9nhubrnxjWa7gTkv+oN65Y7EYUz4Ccqo5HbnbYiEnt
         vcC+7y5o4T47daSAa418eNwEu5SE3HELcUNZ2E2UgY1hVVvVh1KxTZEvTjzzmClBJOaL
         lgvBjr+iJ4jEPKBH3z+C0OmYoiALVuuxqmFEcHuOVpBUNAh3EkoskJrXBUYYwlgMJcc5
         00Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792220320; x=1792825120;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1p/9iIZcHkAsPmovUNOT6SYxgHuv9VL91d3C6K5p3j4=;
        b=A28SmIVUFNikdLdU2oUR/QZcKEu8VXnf6Iwi0iE7U5XW9hiVo5HJ4k0amADDhv8zhS
         5XUizBWd60VwIzjIzfcscZVVQwEcE/LHEj4HpWZcccHHiMMcLxwIbrDE0RtAXvA+uPh0
         epv9XIvfgroNTuMeDPeWJvXFY6/fl/qWHxwxdZdbfSPif0Ib5+oavigXZ2j3dC8YD9de
         tpeBHAwQZNk0t9p17nl1ZVjxXRJ5d36iXEuFEXtjCagbr+smfmTtK6Dx3P+sW052strM
         FZRSFOKlEVnMCQ26g8Mx4FFKfxfM+LmcZzaNNEyUgDhzLdHEdqKHUxvAs/7RcGtU0sLV
         bsJQ==
X-Forwarded-Encrypted: i=1; AKwUvByDeSI0cKXJrzmQAK/9Eo7crmIjE/ngVqICbsWITFcxhL4N09BUfl5Dyr6aeleeVrUz9vZqJggiI8hVts0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdeC8JkSvH7isixiD1B7SZcXnc6LpyCboq2N712dI5q/RmnF5w
	Dt4gwDi8IXwB8x33zDBepBECaQiu+jlAu0kMoZZeS97kOC9UPfzK42sV
X-Gm-Gg: AYBFou2yZVM9fg/8bMnOizCLLGrFhg+g9X7TyjduFlvy/+HuSKmszNpLWo9JQHCu315
	icDjOpfb5mnc05QW4itvKGJHB1ghfW4zHft/hRdcsVohRQaVeQqT9m5cIcl3CcaPi+vyehP87Na
	GBhT8icUqpRKv842k0I0L16cNa/kl52Xjsa9Vd4hV8hdw2aAvnKjwMyYfFJo/ZFScxBqnFQB/xo
	1F3sUxp9Vxw0rtbRRAv/QPG67c06PkETP6r1JPBcPdEt6dLUh3ftYbYZCx0tKnv7xR4rr7Alq5x
	i+VejwnXnFXnhBuVf3ZPz6nQ2K4wrUW3wt5mKRNdzbkWeCV0oX8S9u5HTVxqSBXYhkmlJ0cpy9u
	M77P/JE+FwkB05lfKo+6WNFPokPXfw7SfxQRqvcUgOilhdfTHLB7ov6i4VbrPuRVbEaEFo1g3p/
	lU66AseQGaIAzHYqEc9C9vYKt7HgxNax/cI2NLPT80nYRXAFusqkpCN2PgW2QrLuCATcs=
X-Received: by 2002:a17:90b:4c8e:b0:3ac:b3f9:70cb with SMTP id 98e67ed59e1d1-3acef5f4367mr1770291a91.57.1792220319754;
        Fri, 16 Oct 2026 23:58:39 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc49c263asm6898616a91.17.2026.10.16.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 23:58:39 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: info: Serialize freeing with recursive registration
Date: Sat, 17 Oct 2026 14:58:31 +0800
Message-Id: <pm-pmb-26d66390a25fec9fad6c-v2-743c9b89c0f0d761eda1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An snd_info_entry must remain alive while it is reachable from a proc
node. snd_info_free_entry() clears entry->p under info_mutex, but drops
the mutex before unlinking and freeing the entry. The recursive
snd_info_register() walk can still find it and publish another node.

With a live card and a PCM OSS proc entry, unloading snd-pcm-oss can
therefore overlap a card owner's repeated snd_card_register(). The OSS
notifier removal holds register_mutex, while the already-registered card
path holds snd_card_mutex. Neither excludes the other path:

  PCM OSS removal                    Card registration
  snd_pcm_oss_proc_done()
    snd_info_free_entry()
      proc_remove(entry->p)
      lock info_mutex
      clear entry->p
      unlock info_mutex
                                     snd_info_card_register()
                                       snd_info_register()
                                         find linked OSS entry
                                         lock info_mutex
                                         publish new proc node
                                         unlock info_mutex
      unlink entry
      kfree(entry)

A subsequent open of the new node passes its stale pde_data pointer to
snd_info_text_entry_open(). alloc_info_private() then reads entry->p
from freed storage.

Hold info_mutex across the entire recursive registration walk and across
clearing, unlinking and freeing the entry tree. Use internal recursive
helpers so the mutex is acquired only once. Registration then finishes
before the entry is cleared, or walks the tree after the entry has been
unlinked. Keep proc_remove() outside info_mutex: proc open takes the same
mutex, and removal waits for pending proc operations to finish.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in alloc_info_private+0x12f/0x1a0
    Read of size 8 at addr ffff888115c84250 by task python3/426

    CPU: 3 UID: 0 PID: 426 Comm: python3 Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Tainted: [O]=OOT_MODULE
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? alloc_info_private+0x12f/0x1a0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? alloc_info_private+0x12f/0x1a0
     kasan_report+0xe0/0x110
     ? alloc_info_private+0x12f/0x1a0
     alloc_info_private+0x12f/0x1a0
     snd_info_text_entry_open+0xbd/0x2d0
     ? __kasan_slab_alloc+0x89/0x90
     ? __pfx_snd_info_text_entry_open+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? proc_reg_open+0x20e/0x590
     ? __pfx_snd_info_text_entry_open+0x10/0x10
     proc_reg_open+0x27d/0x590
     do_dentry_open+0x5c8/0x1300
     ? __pfx_proc_reg_open+0x10/0x10
     ? security_inode_permission+0x5d/0xb0
     vfs_open+0x87/0x390
     ? srso_alias_return_thunk+0x5/0xfbef5
     path_openat+0x2460/0x3cd0
     ? __pfx_path_openat+0x10/0x10
     do_file_open+0x21e/0x470
     ? __pfx_do_file_open+0x10/0x10
     ? _raw_spin_unlock+0x23/0x40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? alloc_fd+0x3a6/0x6b0
     do_sys_openat2+0xf4/0x1b0
     ? __pfx_do_sys_openat2+0x10/0x10
     __x64_sys_openat+0x136/0x1e0
     ? __pfx___x64_sys_openat+0x10/0x10
     ? irqentry_exit+0xbe/0x820
     ? srso_alias_return_thunk+0x5/0xfbef5
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7f4e79f32687
    Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
    RSP: 002b:00007ffdd084f450 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
    RAX: ffffffffffffffda RBX: 00007f4e79e9e780 RCX: 00007f4e79f32687
    RDX: 0000000000080000 RSI: 00007f4e79c84d90 RDI: ffffffffffffff9c
    RBP: 00007f4e79cdc1a0 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000202 R12: 00000000000001ff
    R13: 00007f4e79e0b140 R14: 00007ffdd084f530 R15: 00007f4e79c84d90
     </TASK>

    Allocated by task 421:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     snd_info_create_entry+0x56/0x400
     0xffffffffc0401b64
     snd_pcm_notify+0x34e/0x470
     0xffffffffc041b19b
     do_one_initcall+0xf3/0x4e0
     do_init_module+0x281/0x8e0
     load_module+0x658c/0x7cc0
     init_module_from_file+0x15b/0x180
     idempotent_init_module+0x22d/0x770
     __x64_sys_finit_module+0xd2/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 424:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     snd_info_free_entry+0x3d4/0x4d0
     0xffffffffc0400d80
     snd_pcm_notify+0x216/0x470
     __do_sys_delete_module+0x338/0x530
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff888115c84200
     which belongs to the cache kmalloc-256 of size 256
    The buggy address is located 80 bytes inside of
     freed 256-byte region [ffff888115c84200, ffff888115c84300)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x115c84
    head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
    flags: 0x200000000000040(head|node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000040 ffff888100042b40 dead000000000100 dead000000000122
    raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
    head: 0200000000000040 ffff888100042b40 dead000000000100 dead000000000122
    head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
    head: 0200000000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
    head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff888115c84100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
     ffff888115c84180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
    >ffff888115c84200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                     ^
     ffff888115c84280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     ffff888115c84300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
    ==================================================================

Fixes: 2471b6c80a70 ("ALSA: info: Register proc entries recursively, too")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---

diff --git a/sound/core/info.c b/sound/core/info.c
index c4d57d0809adff80732fdb741832c92b9b68f387..9b801caa65caab96ee4aa83a3141ea4306084868 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -737,27 +737,13 @@ static void snd_info_clear_entries(struct snd_info_entry *entry)
 	entry->p = NULL;
 }
 
-/**
- * snd_info_free_entry - release the info entry
- * @entry: the info entry
- *
- * Releases the info entry.
- */
-void snd_info_free_entry(struct snd_info_entry * entry)
+static void __snd_info_free_entry(struct snd_info_entry *entry)
 {
 	struct snd_info_entry *p, *n;
 
-	if (!entry)
-		return;
-	if (entry->p) {
-		proc_remove(entry->p);
-		guard(mutex)(&info_mutex);
-		snd_info_clear_entries(entry);
-	}
-
 	/* free all children at first */
 	list_for_each_entry_safe(p, n, &entry->children, list)
-		snd_info_free_entry(p);
+		__snd_info_free_entry(p);
 
 	p = entry->parent;
 	if (p) {
@@ -769,6 +755,25 @@ void snd_info_free_entry(struct snd_info_entry * entry)
 		entry->private_free(entry);
 	kfree(entry);
 }
+
+/**
+ * snd_info_free_entry - release the info entry
+ * @entry: the info entry
+ *
+ * Releases the info entry.
+ */
+void snd_info_free_entry(struct snd_info_entry *entry)
+{
+	if (!entry)
+		return;
+	if (entry->p)
+		proc_remove(entry->p);
+
+	/* Serialize clearing and unlinking with recursive registration. */
+	guard(mutex)(&info_mutex);
+	snd_info_clear_entries(entry);
+	__snd_info_free_entry(entry);
+}
 EXPORT_SYMBOL(snd_info_free_entry);
 
 static int __snd_info_register(struct snd_info_entry *entry)
@@ -778,7 +783,6 @@ static int __snd_info_register(struct snd_info_entry *entry)
 	if (snd_BUG_ON(!entry))
 		return -ENXIO;
 	root = entry->parent == NULL ? snd_proc_root->p : entry->parent->p;
-	guard(mutex)(&info_mutex);
 	if (entry->p || !root)
 		return 0;
 	if (S_ISDIR(entry->mode)) {
@@ -801,16 +805,7 @@ static int __snd_info_register(struct snd_info_entry *entry)
 	return 0;
 }
 
-/**
- * snd_info_register - register the info entry
- * @entry: the info entry
- *
- * Registers the proc info entry.
- * The all children entries are registered recursively.
- *
- * Return: Zero if successful, or a negative error code on failure.
- */
-int snd_info_register(struct snd_info_entry *entry)
+static int snd_info_register_recursive(struct snd_info_entry *entry)
 {
 	struct snd_info_entry *p;
 	int err;
@@ -822,13 +817,28 @@ int snd_info_register(struct snd_info_entry *entry)
 	}
 
 	list_for_each_entry(p, &entry->children, list) {
-		err = snd_info_register(p);
+		err = snd_info_register_recursive(p);
 		if (err < 0)
 			return err;
 	}
 
 	return 0;
 }
+
+/**
+ * snd_info_register - register the info entry
+ * @entry: the info entry
+ *
+ * Registers the proc info entry.
+ * The all children entries are registered recursively.
+ *
+ * Return: Zero if successful, or a negative error code on failure.
+ */
+int snd_info_register(struct snd_info_entry *entry)
+{
+	guard(mutex)(&info_mutex);
+	return snd_info_register_recursive(entry);
+}
 EXPORT_SYMBOL(snd_info_register);
 
 /**
