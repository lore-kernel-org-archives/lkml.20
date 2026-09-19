Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EE7395ACE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853819; cv=none; b=mo6YCloE/5GrQYb2rlAWNfSEToZOv8fxfVqFkrqJWU5X5LXtKqPgZPAfCmiYW0niakFnbX7gfVxAMi8xhMrZEeinFYinqVJsmCO3iCf883cKyPplG3jY0MsHgThOsk9CSwk8XydefKKo9V+9sNBEkW+2wzCHuZa+Cwk9NL4yQeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853819; c=relaxed/simple;
	bh=tdByLpmAJzkYrRxrFXFC/SVaeB4mrft9rMk+/QEKVAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C+39q6L4R5UqXhOUofF4a0zMk5EK8yTTJ/3hKUYtbrRIstuAlgJwHRKdzYviyJy0uxiiHCu2lwEjEQN8uCfIGyV5zCgwg5UN/aaUpwPdHwPd+HW4nH7P/bGBhcB0akOg9IuTOvuWCoyuU8JmNpqGBe6uu4SHAjdq/E8Md6utn4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsF9LOE1; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsF9LOE1"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so18070245ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853810; x=1790458610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyxi6Nwbm9gMg+DeB+2dIO4nTh3gDmip6r7BOAerE60=;
        b=RsF9LOE1Q+iJcQ/hfeJ7YHUpUBiR1ZvKDWdGxEolTJDBCbZ1nqknNfZ4u/Yy93jdso
         IW30aDQGcbGoGDKxuHOEmqY8w/UB49tDPs3+Jml2IHrRcSDKEeiy9ubJJE9EO5S4oAgu
         kTfruQp+4C2263K1bTECeNOm15Dou4vKvGHPCIrigUbOAivzuwJvXy8GBAUXUd9JAetv
         +ZMJJPOaFHHenizRhybkSj2yn1Ocq5JNy+n6IO7JeN8V6jj1RxzgNZxZxCH7+V8rk6w9
         DqsJVObfpIxvV4aZfhkS+wELZJSOZCxkTc8S+9yBgIkNgvY4UtzWSc/QXrR00FQFhJYT
         dgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853810; x=1790458610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyxi6Nwbm9gMg+DeB+2dIO4nTh3gDmip6r7BOAerE60=;
        b=KRMa3xBY2F27YdAJ3HKcMMhGwhQDnsKOClsVK11mf4BQr1c3utijlB3BVRpLfPXtOy
         jBhmoF7gjkze97Aoi2cATS3PB6MCRAkLzH1slvV7GgQqGKRbda8PAGFyWi79EHheku6y
         MMDVfCOJ3gOhIApMhsJa2oOtL/L3KNZsK2T5owioOy/urGwrz67kUHXlhAM1UexIsu/4
         oeOqQtDvDfwJa05skjSPQ004ATEogd54oln6de4Mz+K/WzoZSXk//Qe9WW79qVAnJn2y
         xfRihbhofHL6BoeInbFVKePazbVarakeoNhhXflvX34tFgxPxECmKzueVJ8AwoMOczQ4
         ZLbw==
X-Gm-Message-State: AFuF++nl0ylyz5HPzEBWpvo8CYxTMYLMn7kZy4+dTfmfoPhAgxyRcaXt
	PgfbyHJR03IOq9+gBQEyT1UCZ5Rj0qoHtMRp9PsAdLrm5aPt0w5T7WQDl3Dh7T8M
X-Gm-Gg: AYBFou2OV0t0/Fhpt/VIN3yjzBw3XCDtENQ6LsiS3FLgAWfthJt/tuId+HeJI4AAFjA
	hB2nXGSjv+sHKNKTZw0CqHbOqHjuVHlrCXPSVwoga216hjdjiCZfkcfnOgU5XWgA169V30nCcis
	WfZ1Fcgp5eGchxQBUrBakQewBPferMGffs4OxpWgdFBmslNFQiUJUAYw62yk/x90+KqRwFoTjME
	ljMDVrrWK08iT0tnd+mN354N+G1CD5198t7Zl+xfpNyfwaFGP9wUuW3qnt8ShWAAUD8M89QbZhw
	dfIeZDWbsc6NHyUyUFIoFnid1cHDiBH/I46fnC0CDiyZvRJ3z8nPkkLW/+nC2Y+reqHqkDeS6as
	J5OBEij6iXRCj5yUnFxu4rAutF1LDy7RsLqn+N1FS+a5eLlYO8+Y1+IV9GPQshbdtVG9CS+UyyJ
	8Bh+5GVtr9ROBMxSSoGYd5eevzW1bEgGhdqi/I6eGBYWsqKehO8KtJ34lx5WYhcRXol2lNf2lq5
	MXunogFjS0Jth4ToxXUIY7aNR+1P6rTxUG/1cY+urHphW48aotZub7uqEYQf3dV9k+gL2iiwYoz
	PDM7dzr9Yw==
X-Received: by 2002:a17:903:2c0d:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2ddb1b9a1famr102282105ad.14.1789853809645;
        Sat, 19 Sep 2026 14:36:49 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df37b8c8basm6762195ad.61.2026.09.19.14.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:49 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	aliceryhl@google.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] binder: fix sender fd 0 close and file refcount leak on TF_UPDATE_TXN
Date: Sat, 19 Sep 2026 21:36:48 +0000
Message-ID: <20260919213648.3316566-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `binder_proc_transaction()`, when a oneway transaction with
`TF_UPDATE_TXN` supersedes an outdated pending transaction
(`t_outdated`), the driver calls `binder_release_entire_buffer(proc,
NULL, buffer, false)` and `kfree(t_outdated)`.

Passing `is_failure = false` while `buffer->transaction` has already
been set to `NULL` causes two bugs when `t_outdated` contained
`BINDER_TYPE_FDA` or `BINDER_TYPE_FD` objects:

1. For `BINDER_TYPE_FDA`, `binder_translate_fd_array()` never wrote
   recipient file descriptors into the buffer (it only appended `struct
   file *` entries to `t_outdated->fd_fixups`), so the FD array in
   `buffer` still contains zeros (or sender-supplied offsets). Because
   `is_failure` is `false`, `binder_transaction_buffer_release()`
   executes the `!is_failure` branch on `BINDER_TYPE_FDA` and calls
   `binder_deferred_fd_close(fd)` (closing `fd 0` in `current->files`,
   which is the **sender** process!).
2. `t_outdated` is freed via `kfree(t_outdated)` without calling
   `binder_free_txn_fixups(t_outdated)`, permanently leaking every
   translated `struct file` reference in `t_outdated->fd_fixups`.

Pass `is_failure = true` to `binder_release_entire_buffer()` and call
`binder_free_txn_fixups(t_outdated)` before freeing `t_outdated`.

Fixes: 9864bb480133 ("Binder: add TF_UPDATE_TXN to replace outdated txn")
Fixes: bdc1c5fac982 ("binder: fix UAF caused by faulty buffer cleanup")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 drivers/android/binder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 8f2ef1bd539f..bc8bc9ee43a5 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -2930,8 +2930,9 @@ static int binder_proc_transaction(struct binder_transaction *t,
 		t_outdated->buffer = NULL;
 		buffer->transaction = NULL;
 		trace_binder_transaction_update_buffer_release(buffer);
-		binder_release_entire_buffer(proc, NULL, buffer, false);
+		binder_release_entire_buffer(proc, NULL, buffer, true);
 		binder_alloc_free_buf(&proc->alloc, buffer);
+		binder_free_txn_fixups(t_outdated);
 		kfree(t_outdated);
 		binder_stats_deleted(BINDER_STAT_TRANSACTION);
 	}
-- 
2.55.0.1082.g2b9226bbc0-goog

