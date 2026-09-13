Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529C31E824
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789313290; cv=none; b=oK/VLnq/1j5kdXQYHtpQqxfml0swPp6nrSC3WzZqry6PiitsDj3HgPmqM25GElZRUyGIBZvH92IuH8le2zBWjDF3W/bpM+6uaem4BTMcXNzK0EMDkULieyz/66jXvgGdJWAgn1xbCmFK4cq9OLgnv/dX4DC6uK5w6FHmRrhNAQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789313290; c=relaxed/simple;
	bh=bHQ5l798sqezizXE5HsuyyFe+ixcfQm/HgbjmsP9wq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uMCoYFkAmR/xPUQ0lzWOHoW3qSJ5RGRtc9VKCzPf7jP6nNc99BIMw7HO4SEst5JyiFwvBgnLeXIKh3BxnpFneTDzsXPpq+zzpvASFYAF1z8a0yEawjCV+vwcedcmEWMWMOmBAk3dnOBGh/GkLueXcW1jipvV2+hT3it0U5jEK6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsW9Yi3+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsW9Yi3+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so5254995e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789313287; x=1789918087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hv5wJEJwW/NHhugCpei+2makQ+3zrOmtS2wiUS3+qsY=;
        b=hsW9Yi3+gAc54kY9MstSjwCa/2LeUX6JOCgmMxIZ98p+nwJVeoOpFDAxbBeG70HdpV
         lekE9/iIjLMpR+ko0keC/1SSL2DByHWN2LqPXgCQ92v4TvOg+6bHPSXSGQmhBqfLOLNP
         O2MfXG0k28OSgVqPY0Yry9gtiUrj5xXjAbXHSbDaKxiT69DdYG7cESWjxRFZ910DfzHc
         UQrjdm5lFG5nf0jO768oCeyNucIBrrPMhwnLCHYVnPttLjRhfdvdaG8fHGLtt6c268nm
         N1DJUFfeH4GYUH1j9HWNVggZXJVTV2rCsisJUU0T40LvqSHPuovCPuCJxJ6CdqxL9C9O
         2JIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789313287; x=1789918087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hv5wJEJwW/NHhugCpei+2makQ+3zrOmtS2wiUS3+qsY=;
        b=G+ZFSropDYRwDmhhe6MthQlztN0U3yXlVHn6cBLxPiq1oQzSvvSfwd+xV7fjNgIlwl
         cmuHPbAktuv7MOLlvmPPeDy6r+3/TLtOxjwgTNbaRtzn5As7TgIUg2oDBHYORvPZkbPs
         FKxN+k4M0n3AkNmvYtj0EsKgJrr58tZX/hdK3Gca4q/GryKlN32GFLMnpg3dTySFw8pa
         7S/OfwNwo3TH+cg1Tdy0zsznvW9t5briZb7AQsiCLEyvtiX4eDwpXDx3FLtugG5TVUk3
         rJwbvIWil1LF7L8zsNM0fvwSd1BvUzVIOU/yoiGc1tx/b1otTEgKRMpRDXxohrA/6fy6
         8cLQ==
X-Forwarded-Encrypted: i=1; AKwUvBziN2x0bywKbBJI3J3SHwBzKcFaHqTPc9NbJVYsKWNcntNHK8Wsry5NLT0CGu4bnYpGEzZSuufdzrocO7A=@vger.kernel.org
X-Gm-Message-State: AFuF++nNHW9HOL/PvkofPcbICO6kNZMy00bRBKrwOZiea8cLsyUbbqi/
	UVI4nRjBg5Cs0RIU7qzb6HV31KeXRM4Q92TZtxxBPzzRdB5dZjtZvD3T
X-Gm-Gg: AYBFou1pYrKMbeSsloItxfao8r/CNaCB2ffJdhowCDV9pRJWeokd06kjUNZv+VZqmKl
	TIGMZ2Z6GqSooMvSCsPHmwTaCplBC2vbeBvPgi26ntxHs4/H9ng4yssa5OPu2BdJQfLOP3NlsrF
	XBG6SaocLn9EkzcE+7QcL1lOjYvaA6BFKKiKZuFn/+T416tuV1sfa2aCko1ZGyO6rgZNX/aWjxA
	eVDxK1dB1oeG47DgAU+79Nwo4we5Z19BC3E3QFR9ZlRuukdOp/lZV/GOq7n39/pWRIuoCWwxy4A
	/IZPaWEr1286PBhyuLOMrULsqwa3nEtd+X2k8OHuvY1ddIiv4Phj4ZkxKKqyd22ZoLEhzrfivgj
	twRwj1xYMibBKEb5ZOKxnSFg64/oukSS0xm8R6qQSFAFYt9L0Lho0FQIB/BHo9Hk9mL5x5Zw8kO
	oYf8F0lX8vWMC9DQVoyLyE4NczsoYP1/G5cs4olmKe/uAyq+EguQDycrqrE2HRF1PA3nHUcykwL
	YeDkCCrpjhD/T8hOdAN0i+/f6OdD6wv0M3coosMk8bbKw==
X-Received: by 2002:a05:600c:4e13:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49e6ca28d5emr64869905e9.0.1789313287145;
        Sun, 13 Sep 2026 08:28:07 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.97.0.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm15226206f8f.0.2026.09.13.08.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 08:28:06 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+7ff3adde89dd795ad4c4@syzkaller.appspotmail.com,
	kmsan-dev@googlegroups.com,
	glider@google.com,
	dvyukov@google.com,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH] dcache: fully initialize the inline name in __d_alloc()
Date: Sun, 13 Sep 2026 16:28:02 +0100
Message-ID: <20260913152802.13413-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported:

    BUG: KMSAN: uninit-value in dentry_string_cmp fs/dcache.c:291 [inline]
    BUG: KMSAN: uninit-value in dentry_cmp fs/dcache.c:322 [inline]
    BUG: KMSAN: uninit-value in __d_lookup_rcu+0x37d/0x5e0 fs/dcache.c:2522

     dentry_string_cmp fs/dcache.c:291 [inline]
     dentry_cmp fs/dcache.c:322 [inline]
     __d_lookup_rcu+0x37d/0x5e0 fs/dcache.c:2522
     lookup_fast+0x194/0xa40 fs/namei.c:1854
     lookup_fast_for_open fs/namei.c:4545 [inline]
     open_last_lookups fs/namei.c:4579 [inline]
     path_openat+0x9ef/0x6540 fs/namei.c:4856
     do_file_open+0x2aa/0x680 fs/namei.c:4888
     do_sys_openat2+0x17c/0x390 fs/open.c:1395
     do_sys_open fs/open.c:1401 [inline]
     __do_sys_openat fs/open.c:1417 [inline]
     __se_sys_openat fs/open.c:1412 [inline]
     __x64_sys_openat+0x240/0x300 fs/open.c:1412
     x64_sys_call+0x2445/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:258
     do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
     do_syscall_64+0x15d/0x3c0 arch/x86/entry/syscall_64.c:94
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
     copy_name fs/dcache.c:3031 [inline]
     __d_move+0xd29/0x21f0 fs/dcache.c:3099
     d_move+0x71/0xf0 fs/dcache.c:3147
     vfs_rename+0x2619/0x2770 fs/namei.c:6085
     filename_renameat2+0xa59/0x1230 fs/namei.c:6188
     __do_sys_rename fs/namei.c:6232 [inline]
     __se_sys_rename+0xc5/0x5c0 fs/namei.c:6228
     __x64_sys_rename+0x78/0xb0 fs/namei.c:6228
     x64_sys_call+0x329/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:83
     do_syscall_x64 arch/x86/entry/syscall_64.c:63
     do_syscall_64+0x15d/0x3c0 arch/x86/entry/syscall_64.c:94
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
     slab_post_alloc_hook mm/slub.c:4617 [inline]
     slab_alloc_node mm/slub.c:4939 [inline]
     kmem_cache_alloc_lru_noprof+0x376/0x1230 mm/s
     __d_alloc+0x52/0x9f0 fs/dcache.c:1902
     d_alloc+0x57/0x300 fs/dcache.c:1981
     lookup_one_qstr_excl+0x19d/0x7a0 fs/namei.c:1806
     __start_renaming+0x341/0x850 fs/namei.c:3888
     filename_renameat2+0x625/0x1230 fs/namei.c:6163
     __do_sys_rename fs/namei.c:6232 [inline]
     __se_sys_rename+0xc5/0x5c0 fs/namei.c:6228
     __x64_sys_rename+0x78/0xb0 fs/namei.c:6228
     x64_sys_call+0x329/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:83
     do_syscall_x64 arch/x86/entry/syscall_64.c:63
     do_syscall_64+0x15d/0x3c0 arch/x86/entry/syscall_64.c:94
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

The race happens between a concurrent open() and rename() of the same
path.  __d_alloc() initializes only the name itsel
of the inline buffer; the tail in between is left uninitialized.
copy_name(), called from rename(), copies the enti
including that uninitialized tail - into the moved dentry.  Meanwhile
__d_lookup_rcu(), called from open(), is an optimi
it checks d_name.hash_len first and leaves the seqcount retry to its
caller, so a lookup of the old (longer) name racin
compares with a stale length.  While copy_name() is rewriting the name
in place, the walker can transiently step past the
terminating NUL and read bytes from the uninitialized tail, which KMSAN
reports.

The race is benign by design - the read stays in bounds and the lookup
result is discarded by the seqcount retry - but th
is real.  Fix it by zeroing the entire inline buffer in __d_alloc(),
so every byte a racy walker can touch is defined;
past a mid-rewrite name now simply stops at a NUL.

Reported-by: syzbot+7ff3adde89dd795ad4c4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7ff3adde89dd795ad4c4
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 fs/dcache.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index 1b1a81f10da6..2de1bc76dc8e 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1910,12 +1910,17 @@ static struct dentry *__d_alloc(struct super_block *sb, const struct qstr *name)
 		return NULL;
 
 	/*
-	 * We guarantee that the inline name is always NUL-terminated.
-	 * This way the memcpy() done by the name switching in rename
-	 * will still always have a NUL at the end, even if we might
-	 * be overwriting an internal NUL character
+	 * Fully initialize the inline name buffer.  copy_name() and
+	 * swap_names() copy d_shortname in its entirety, so any
+	 * uninitialized tail would propagate to the other dentry, and
+	 * __d_lookup_rcu() may transiently read any byte of the inline
+	 * name while rename() rewrites it in place.
+	 *
+	 * This also keeps the inline name NUL-terminated: the name
+	 * switching in rename will still always have a NUL at the end,
+	 * even if we might be overwriting an internal NUL character.
 	 */
-	dentry->d_shortname.string[DNAME_INLINE_LEN-1] = 0;
+	memcpy(dentry->d_shortname.string, 0, DNAME_INLINE_LEN);
 	if (unlikely(!name)) {
 		name = &slash_name;
 		dname = dentry->d_shortname.string;
-- 
2.43.0

