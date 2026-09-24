Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7167938AC9A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244036; cv=none; b=gaIoKCsTX7FM4tJap/DpULIvET1xOAWmRb+R33Que7KfkoqJ46DxQ9kI7FHToWkZHbsXoEbgP/+JAAS6Y7mqwysm+kNiYK6KdZUwadwY/GPi/OsaZTg7fr2sbLq1v5tH6umsxV0a6VfPcy8gXYiSi4kKNx5U64Ip+c8NNQmHgl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244036; c=relaxed/simple;
	bh=dszis8Niv47E42Xdhjmyu9YfEidDCYxTVb5wGh2KKns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+4PrIgyNpHbC4KUrDemIOxPQKrWoXHqyAAma1AK7EQOAUrUPS5CCOpaA6XgJ2n7NcTjtQnI7xwarPK0foJFrYoct4XUTOpl5v6VPfkFkNt//e+DnHaafE8xzZ1lk5jvpnGR0hLfSptfpSAfuQAvV24x1V1h5WdWorFaFvjTbTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8/nNUg6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8/nNUg6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2db710396ffso3570365ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790244023; x=1790848823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDu5V8VFjj7o7vcgGcrsEHmG2L9tByu/suT9MpcaWQ8=;
        b=n8/nNUg6XPe6Nc69cIIizAbF9mdxa4Aso/uQUJpn383E0KwExDIa9qM7ZUjRsmWJPZ
         px4jr3pGQZRuBi/ICZTpFSTGnO8JoPe2qH/jqfTBte+hRKWjfZFu0eG0Pkig6rvXkVYM
         GVL3JVvnBGIekV9jSEzORi+nIlRBxtyw06yAz3s8KMy5L4cYkdPSA3VutElaFu4hv8dv
         oSOo49J4TggNGgWy3PkOjOD/s1Pb3MdrqUpdcxaggYum5y7Alb+m5vaOVp70uzhGpXmU
         sAEi4nJDSOHv/x+JB+gHWfU/aFNA+CvBdVdgYmKLFTbVhAM1QsZ+1Sp+NpLO9dJMLs6k
         0EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244023; x=1790848823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDu5V8VFjj7o7vcgGcrsEHmG2L9tByu/suT9MpcaWQ8=;
        b=Towd+ETfm/ijCAQwv/evHC3dbnM2prg1sgX2DKXdxBDNlrEKtbwW3gPaTgeQbtHn7f
         SJ6A5toKoq/FwYg79DAxWCeVzDb0SY4XcJzkVH0c3kZbOchUS94rHUT1OcwharY6DYzW
         Wp8+nfDwO+v3tynhgCfZ3JibesqBctALqR7ZcOCW6iCnYGN9LoIB2WCoNFNXy7FjUQ0w
         M6TYwNKBGc2Ib80B5nMGfrbleN39oBsWQEtPYD4Lt+NyPnmVxz8Ao7++06B9iN4oFZBV
         PvjdCzbeT6qo5Hze1BdyKuol29ANgNnQOCzpji05zOZjlMsXhV6qQFPuiWbWUfu+zRZk
         Eb5A==
X-Forwarded-Encrypted: i=1; AKwUvBwnvkYajHjiBKLThpNvgzcGa8aRd+U2yG8d8tDDWMUkq7w6beU+PuBj7yMKqdt8Fktb3t1h0B3LsGWJ7No=@vger.kernel.org
X-Gm-Message-State: AFuF++l+cnRYEKebd8UW1cHcUmJ4dC9THntvCs/XHXMspxScThoCgvHd
	eFJa2PqP95yYhzYAyMRwO35cu9XOT4Rs32+o+45U22IWC5qsd9u3GHQt
X-Gm-Gg: AYBFou1y0oYVR2TuLH14srig3m3U6tE6WLZJgEewyCcA806XZO/tGsbQVi6oth58CRt
	kWc/XYisw9ASZ3XLoga9ZFwSpliU/z2fxXRITUthVNse6dispN78xfUjsZToMtCwBq7WvtSLtHZ
	1gHtxADU7NUr/QS19KE3CsqgSxsevfSy+/7FmNxjnn8xgk5k5fECReSg9Ad6PMoorW/Lm3rIDWE
	DEUIgTT2xaaX2NonZqmzaxeOR/ILRQ9dsSez5lc6f7yEeWadR6+LbUpHdblO4Nzswq6mlLEiFei
	hSbPWNAVUZlZ8KsVlk53o7RjD8r+onsI4XoJ5XqytDwwxsIMh6f2kF1Q961WVwAVFeyOk5SpKzM
	k8IbelhxbG6rnpE+vzfDBGt2J2IETIM0HOSAHWKgutaWKwtf0jqfdavbd6bVXIi64SlFoYbQql7
	2Z8FnvcP7Ubl6ZfaZ5CDjj62DJoqe4Acu8YqBRh4XQOm3xu0WijlUnnWqzZbWsJX1M+i47aSSfu
	Y1CobdSCAkyfVtCdTSCWt23dfrRx4oWNlnfQ5/WHtOYV9PLJ0nRHd/y8OL6hvAi2Ff7Hp9ZgLUg
	AAfzWq7/SQ==
X-Received: by 2002:a17:903:17c7:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2df7e251f68mr11229755ad.20.1790244022862;
        Thu, 24 Sep 2026 03:00:22 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d58sm24409255ad.11.2026.09.24.03.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:00:22 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	brauner@kernel.org,
	cmllamas@google.com
Cc: maco@google.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 2/2] binder: free transaction buffer via binder_free_buf() on read -EFAULT
Date: Thu, 24 Sep 2026 10:00:19 +0000
Message-ID: <20260924100019.3389555-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260919213650.3316812-1-benquike@gmail.com>
References: <20260919213650.3316812-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In binder_thread_read(), if put_user() or copy_to_user() returns -EFAULT,
the failure paths call binder_cleanup_transaction() without setting
t->buffer->transaction = NULL or calling binder_free_buf(proc, thread,
buffer, true).

Because allow_user_free remains 0, the binder_buffer and all translated
binder_node / binder_ref references inside it are permanently leaked. For
oneway transactions (TF_ONE_WAY), node->has_async_transaction remains true
forever, wedging all subsequent async transactions to that node.

Fix this by setting buffer->transaction = NULL and calling
binder_free_buf(proc, thread, buffer, true) on put_user() / copy_to_user()
-EFAULT errors in binder_thread_read().

Tested in QEMU against Linux 7.3.0-rc3 using a multi-process C reproducer:
triggering copy_to_user() failure on a one-way transaction: on the unfixed
kernel, binder_cleanup_transaction() leaked the transaction buffer and
left node->has_async_transaction set to true (wedging subsequent async
transactions); whereas with this fix applied, binder_free_buf() is called
on -EFAULT, clearing buffer->transaction and freeing the allocation cleanly.

Fixes: 44d8047f1d87 ("binder: use standard functions to allocate fds")
Cc: stable@vger.kernel.org
Reviewed-by: Carlos Llamas <cmllamas@google.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split out as patch 2/2 as requested by Greg Kroah-Hartman and Carlos
  Llamas.
- Added QEMU test procedure details in commit message body.
- Added Reviewed-by tag from Carlos Llamas.

 drivers/android/binder.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index ee01e6a06631..efff59853752 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -5127,24 +5128,32 @@ static int binder_thread_read(struct binder_proc *proc,
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
