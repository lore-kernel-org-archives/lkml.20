Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD73998A6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853819; cv=none; b=gcs4FVtSJb3mimedibjj+1bf9CxjiY3hZ73eY7l1IeKM0xuMajtKoTY2tYdbkP8YYcNtxXp2XiYgnaDSrwwRFc1s4+fGq7UALnK/KmTYThT8gztUw7NnS7D81WR3AwlVy25oyvOgoeOM/hlb4k+MiSk3AryVcJMd2Dk+ZJmVZqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853819; c=relaxed/simple;
	bh=04bcizQSYTd4WjlKmx87Op+K99aB3PdgrB2rfwS4SjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQXywcjW5UoIoVYsk+eQoYZnysSsDtLI5QzjY/sZa2aeIUvOTAOWpADeS96fG71+aRKsHWChpxWhqBaf5ZHDu8HOrxH+iRBlj7KXqBBwjeS054vFYKHWxMGADTErOkhCZXCI0CiL57BxZiWkj4L7r8t7mQvMDmB4/qR/mBmDqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4/H92ya; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4/H92ya"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f38so18070435ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853812; x=1790458612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQiANk75WpCVAMkDXp4s1olnoK2EXkXcxJKpjMF5J58=;
        b=a4/H92yaFIv1123y3Kv4T6bYd15bIFLuHqCanVtpO8P6Md2RGtXwrngpIYj8IslmjF
         9x8S+TCZ0iQB8uYu2HkHxaMknyKK3XJAm2BkxSO+uPDIGPLENpyRkhBOIDvlUWsAff/H
         JaU5/3HCrSMFSfD0XdizttmSe9ZFFbNKbYtwvW6vjknKUBRiuHXE1+SoIePHzBArnsvy
         ctHDvdqq2hY6zZVRhte1UOTLCzEGhRzkYDE9wnCB/V9ZySWj1/sVU4M+Bc28a136xM5d
         xfYPKZvB7An6mGViHIXjOBCPDOeaDtaKKHFaoNBb2vt2qDCBpKeIY84bDMsezBLxuL7S
         5h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853812; x=1790458612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQiANk75WpCVAMkDXp4s1olnoK2EXkXcxJKpjMF5J58=;
        b=WEch1cSxfMCw2dEIFZskU6K5yHIyybqrOCDALwXi4Fo3mCZxf0FhTI+HpL62xf6WEO
         a5R1xAi3ECE4IAuyVspmsSku+pi1gdQ4HAS7CfrR6/6Pn2OzvG4haFXT8imQzBTfE1Gr
         Cd5ZhotoWTK6TxRTSdX4ZK+VILeVT4gEPce50B2sUApmaA4E7Q6Nz9XWB2/3WZrI70PF
         hazHHNX+gJC4ScDd3s/1EvvGxgbyj4U00gTg8bEaJMHPJGZjdP14zngsW/qBa7y4vs+v
         076d5QodqyZ4QZjtOmUTx+4GtmacgBVlU399Pp7kzP+eP1ZIaV3Y3EXadV6hEMBjp/hq
         XasA==
X-Gm-Message-State: AFuF++l+PZed+THQt3OzWfOVe9SW5NY3uHrd2tiCfWPWWNcsDBKxoRb2
	g4tuA9o+pnWhI+JXClNnI/1YpOo7XYewzcguQrLg+JwcyIR4smDkutt/
X-Gm-Gg: AYBFou1vV+68P724V8nXD+rWkWlU/B6Lk4wJt9bMI1/sqy0L7RpxBAawNMms5AvD1HV
	UKj2yQBcIAPhCntIUOn1//+WmuxahsQRjepAJWHGTyRKLtmQhUTIzgiwgMTZ9HaaxX4kqsprsST
	1LOh89WClUhvXJnNRgX6Wb8nNc7kaZHlYSIEU8fQOaugJlx1Jjuhc7mh75ULFqnEpVbJ86Eqywk
	Gxi2ws0KxcKSFmVvUkq3be60CDJH8trmjdafe7qPZb5/tiy9Ock6ERA5YrRwGOPkmnWNUsFZ2yI
	ACfQJ3lyY6ABeO87DUss8SJ3uazn8YTIxPtpf89p91SGdwlYl9bxCQDeNAGEgqSQW1XGPclphdF
	/xCLWAK8JM9ZgV/Q15BsJYArqfjderSks8hvEBxpVPxh1ualdn2JMSBoT7Lm1LFnZba1qChNuYM
	ivnZPPQ71seaUrY2C9mwOhyvjLryqoyYN92+gzAmBHmvrSYr9b0dK+npBOAQKSGQnlAX3DHSfGO
	//6QhqVdWJzHbTV/Etflw3WFFr8/Dz0eomj9hu/teTwBPfmDl+o5mKuJ+GxbBQJpFLEqAPsKdOf
	BA6mir1z3Q==
X-Received: by 2002:a17:902:f682:b0:2de:834b:b594 with SMTP id d9443c01a7336-2de834bb632mr36868885ad.74.1789853812258;
        Sat, 19 Sep 2026 14:36:52 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b4a99sm12958435ad.5.2026.09.19.14.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:51 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	aliceryhl@google.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] binder: free transaction buffer in binder_release_work() on BINDER_THREAD_EXIT
Date: Sat, 19 Sep 2026 21:36:51 +0000
Message-ID: <20260919213651.3316944-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a binder thread exits via `BINDER_THREAD_EXIT` (`binder_ioctl()` ->
`binder_thread_release()`) while the process itself is still alive
(`!proc->is_dead`), `binder_release_work(proc, &thread->todo)` drains
pending `BINDER_WORK_TRANSACTION` items queued specifically on
`thread->todo`.

For each `BINDER_WORK_TRANSACTION`, `binder_release_work()` calls
`binder_cleanup_transaction(t, "process died.", BR_DEAD_REPLY)` without
clearing `t->buffer->transaction` or calling `binder_free_buf(proc,
NULL, buffer, true)`. Because `allow_user_free` is still `0` (the
transaction was never read by userspace) and `proc` is still alive
(`binder_deferred_release()` will not run until the process exits),
`t->buffer` and all translated `binder_node`/`binder_ref` references
inside `t->buffer` are leaked in the active binder mmap pool, and
`t->buffer->transaction` is left as a dangling pointer to the freed `t`!

Clear `buffer->transaction = NULL` before
`binder_cleanup_transaction()`, and when `!proc->is_dead && buffer`,
free `buffer` via `binder_free_buf(proc, NULL, buffer, true)`.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 drivers/android/binder.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 8f2ef1bd539f..1c7218e599a1 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -5206,11 +5224,17 @@ static void binder_release_work(struct binder_proc *proc,
 		switch (wtype) {
 		case BINDER_WORK_TRANSACTION: {
 			struct binder_transaction *t;
+			struct binder_buffer *buffer;
 
 			t = container_of(w, struct binder_transaction, work);
+			buffer = t->buffer;
+			if (buffer)
+				buffer->transaction = NULL;
 
 			binder_cleanup_transaction(t, "process died.",
 						   BR_DEAD_REPLY);
+			if (!proc->is_dead && buffer)
+				binder_free_buf(proc, NULL, buffer, true);
 		} break;
 		case BINDER_WORK_RETURN_ERROR: {
 			struct binder_error *e = container_of(
