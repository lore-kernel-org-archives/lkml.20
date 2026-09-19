Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4E395ACA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853819; cv=none; b=JBIchmPB8wFXIrZ5WWsbu3eBgpRB58Tyif9yqEOu1duU6X68SceRgURq7ED6F/JnP68Bg4Swwie/vLRjiXi1JUXg2ROIH1FlUNH3NXAxJs1ppwP71smLRV1Qkz3sAH7wKAN5B2Gx+LIiIdZZsBwzB9sUzsUvAvqObzRmIaP0SW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853819; c=relaxed/simple;
	bh=zlIJhS2hXizRYUsCOr7wyRGRD5EByvZHR5ySwC4g5Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACn43iju3Q95N0bwQdXDRTRrkWf9R79LnYK5iroyyNtMeubF/BYnz9rLDBfB4j/MzHgaEPZ0LvEHWoTFKDva6MEGbJ9Hg9crhX3IzC87kSiZx97NPVlekrkZg3h+p9qpN/SV5W711dv6ELvep0SkO/HDKaqCnrwoABVtc4gK67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+At8Is0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+At8Is0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so1278128a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853811; x=1790458611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqlgYhk+BRvLe8JtTnk9ft+OC0dYtvMstWRb8cECWOA=;
        b=L+At8Is0Ty1zeE8fS9FDzIXZLOydGUDE2mhFcnSRK1Tp/n+OFkjejHFAVH56+E+bMl
         mXPeOMGQPT05+Llo6yIv0gsARO70WGflSIqgv5wz2SoadZD1wBu0chj/wsf/hh9BH4aI
         Ct3cKj0wgcFPo+yX+BmoDL5vfAQq5y8HKgZVodnloegn+jXFbksbogtV/NZfpLbEreGA
         Oha2v3UNVAR1hzCbvUS46WKcq09AMH3V1K0QUQ4PG+7wt1wovptOtheNFHcusuOawnG/
         xtaT21LmNe3FFhSLWhX5FLJonfHWDvNVTqQu2iPnYFOD23B1I1VjKaEN1du3cyaBr4NP
         HUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853811; x=1790458611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqlgYhk+BRvLe8JtTnk9ft+OC0dYtvMstWRb8cECWOA=;
        b=CRPhfjjx2Tz/G+qInWQ1nB+Gp5z7fVPp4aN25kTsARWOZZ2eSGOyeL9sCH5eLSxGGQ
         qYImRHogfnzGZOk6OUO2m80GmMR7z8Jdw+uyXCq28jTqL8lzWu1eWWhgZup86v6r6Rdm
         CAg19oxzsV1Sjev5qw6MQET8rRg/y78bsJ7iZKh442HTOTD3UxvYoR7Nq1w33zAucndt
         6v3GGA3+LcGHxK/xFhMvFNFRE5rm9awX03ztFzwUViA4+zDLMSKscWkvLFs5JdwpB4J+
         unSkdXbs9Q1lWCtufDD1Y/5Nu4FnQks+IPR7YXdsOFFjLYhXyv2A5HslC6dCU1PbiLue
         5QoQ==
X-Gm-Message-State: AFuF++khwWF0hgJPPG4B9wacWHTuvYIYYSgea+j2T8MXuWLlcO9Xm+Wg
	xGyQsBoM+MJgj3nFZ04l/YuEZiSSdJjQ0ichI8LZ28uR4oLiOl2dXhQO
X-Gm-Gg: AYBFou3slbXblx/0jbJZUAFksvuVmsLMHKE0c3UpJVcqomIaHK3d0hyAHwfJDuCsqX9
	WcXpk6LGjuvZgMX2K68EbYG0Jizi4OYysuYJF5CA+sGEr2UptDqLJINI36ua33av0CasAwCXwd8
	eugyWXRP9eYwP6WQYDHwFz4xJNiATZb6xnaRW3x/X8tzVJ1yz9Vz30qyM9N7s9LwB2qwGgU1S/x
	gFHc/iHIdqgMW66z5wtvL4mNIlhEwbZetuySnRKdHMw1a1IDpFbZqbHry7u8n6s9N2HqLJ7YOaj
	7f3lUUnGnGZ7RpBSSImn84IIohaYMH/NZhH3xLFpdC10yvB+2xa2aehlQv1ldjBkDYoWqxP7kwk
	gqgKSJHTQabqCoGpApwosJMLE38e0eDXOLIQRuRB2r7T3oEeha8jKOApyWAsp+NeiQBbevAKHiv
	T0JWquwhNX1rHreOF1TBZ3omWbCosbwIRRu0ITFyoV6BnbHM0hAmcgQaBKDRSmyP+BJlqawORwJ
	LiOvNrg0R3WtgIkZMPq95ROPyO9rKhThOKTJU5Skm4GuZwU4d+2qpjlFkcCTCBsN3i2Sy+4Yfre
	P9ArKwwPSqy0FEQ5BXlq
X-Received: by 2002:a17:90b:3a8e:b0:39e:14db:437b with SMTP id 98e67ed59e1d1-39e54afe89fmr10790094a91.7.1789853811032;
        Sat, 19 Sep 2026 14:36:51 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e563e3e3dsm3565698a91.3.2026.09.19.14.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:50 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	aliceryhl@google.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] binder: fix buffer/node leak and premature fd_install on read -EFAULT
Date: Sat, 19 Sep 2026 21:36:49 +0000
Message-ID: <20260919213650.3316812-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `binder_thread_read()`, `binder_apply_fd_fixups()` installs
translated file descriptors into `current->files` via `fd_install()`
BEFORE `put_user()` and `copy_to_user()` copy the `BR_TRANSACTION` /
`BR_REPLY` command and `binder_transaction_data` payload to userspace.

If `put_user()` or `copy_to_user()` returns `-EFAULT`:

1. Any file descriptors in `t->fd_fixups` have already been installed
   into the recipient process's file descriptor table and removed from
   `t->fd_fixups`, even though the transaction failed and the sender
   receives `BR_FAILED_REPLY`.
2. Unlike the `binder_apply_fd_fixups()` failure path immediately above
   it, the `put_user()` and `copy_to_user()` failure paths call
   `binder_cleanup_transaction()` without setting
   `t->buffer->transaction = NULL` or calling `binder_free_buf(proc,
   thread, buffer, true)`. Because `allow_user_free` is still `0`, the
   `binder_buffer` and all translated `binder_node`/`binder_ref`
   references inside it are permanently leaked, and for `TF_ONE_WAY`
   transactions `node->has_async_transaction` remains `true` forever,
   wedging all subsequent async transactions to that node.

Split `fd_install()` out of `binder_apply_fd_fixups()` into
`binder_fd_fixups_install(t)` called only after `put_user()` and
`copy_to_user()` succeed, and free `t->buffer` via
`binder_free_buf(proc, thread, buffer, true)` on `-EFAULT`.

Fixes: 44d8047f1d87 ("binder: use standard functions to allocate fds")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 drivers/android/binder.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index fb9ff072bd6c..efff59853752 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -4705,7 +4705,7 @@ static int binder_wait_for_work(struct binder_thread *thread,
 static int binder_apply_fd_fixups(struct binder_proc *proc,
 				  struct binder_transaction *t)
 {
-	struct binder_txn_fd_fixup *fixup, *tmp;
+	struct binder_txn_fd_fixup *fixup;
 	int ret = 0;
 
 	list_for_each_entry(fixup, &t->fd_fixups, fixup_entry) {
@@ -4730,19 +4730,25 @@ static int binder_apply_fd_fixups(struct binder_proc *proc,
 			goto err;
 		}
 	}
-	list_for_each_entry_safe(fixup, tmp, &t->fd_fixups, fixup_entry) {
-		fd_install(fixup->target_fd, fixup->file);
-		list_del(&fixup->fixup_entry);
-		kfree(fixup);
-	}
 
-	return ret;
+	return 0;
 
 err:
 	binder_free_txn_fixups(t);
 	return ret;
 }
 
+static void binder_fd_fixups_install(struct binder_transaction *t)
+{
+	struct binder_txn_fd_fixup *fixup, *tmp;
+
+	list_for_each_entry_safe(fixup, tmp, &t->fd_fixups, fixup_entry) {
+		fd_install(fixup->target_fd, fixup->file);
+		list_del(&fixup->fixup_entry);
+		kfree(fixup);
+	}
+}
+
 static int binder_thread_read(struct binder_proc *proc,
 			      struct binder_thread *thread,
 			      binder_uintptr_t binder_buffer, size_t size,
@@ -5121,26 +5127,36 @@ static int binder_thread_read(struct binder_proc *proc,
 			trsize = sizeof(tr);
 		}
 		if (put_user(cmd, (uint32_t __user *)ptr)) {
+			struct binder_buffer *buffer = t->buffer;
+
 			if (t_from)
 				binder_thread_dec_tmpref(t_from);
 
+			buffer->transaction = NULL;
 			binder_cleanup_transaction(t, "put_user failed",
 						   BR_FAILED_REPLY);
+			binder_free_buf(proc, thread, buffer, true);
 
 			return -EFAULT;
 		}
 		ptr += sizeof(uint32_t);
 		if (copy_to_user(ptr, &tr, trsize)) {
+			struct binder_buffer *buffer = t->buffer;
+
 			if (t_from)
 				binder_thread_dec_tmpref(t_from);
 
+			buffer->transaction = NULL;
 			binder_cleanup_transaction(t, "copy_to_user failed",
 						   BR_FAILED_REPLY);
+			binder_free_buf(proc, thread, buffer, true);
 
 			return -EFAULT;
 		}
 		ptr += trsize;
 
+		binder_fd_fixups_install(t);
+
 		trace_binder_transaction_received(t);
 		binder_stat_br(proc, thread, cmd);
 		binder_debug(BINDER_DEBUG_TRANSACTION,
-- 
2.55.0.1082.g2b9226bbc0-goog

