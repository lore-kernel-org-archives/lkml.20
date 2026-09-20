Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA710F0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888092; cv=none; b=Y5U+1aLaSLt03w7osIlNGQu9fJrYtw/qtwYPAN2tmE8WNbhpx2fAAsMBBVdykKOVcIfItChsi58bdOQco5yOzVzJ052XOjCEFP67G7gclANw9Qwg9f8lhRxvJrq7VU2gMQYArbic98bm4pZmwmYf9+SW/J0hAkRc/ofl2wXph3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888092; c=relaxed/simple;
	bh=1B0V8T4ktuc79cxDoRF6PqS6cRvCeIaed92X3FxIr9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NlKv2whjw+mi7T7dbudulxVOCaRiQGEEjTsQessXIRLqF1tMevQCpKhUiHw2xUuJ5dghFOX7KWONa9ZO/o3UBPslLT3YRz6u3BKFEUDIAsxXlI3kAhUHsgZin9tN8u4x6cflZ8T54JD+xM7tNM16uAMxO1c7tcWI1ixYiCnTMWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bl+pRrz7; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bl+pRrz7"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df36461d63so4392555ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789888090; x=1790492890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6a5bAZPuUCh9F1dtEQIfloO2fyihCQk+5QE8nkYOx1w=;
        b=Bl+pRrz7LCa6p1MbER5rebW1XLI+oOuSRU0XAX5oslTTtWgVeamVtS5NpVXvxzZyeN
         2fHcW9fQJRPe/+lFRk2hOBlsQVW9JyngG1wVwWAr940zCgB3B2s4S4HweSdwrch2ztmm
         muZN0O7hnfapw7hnsphqr0k//k6WihsX61V1bxNkn5FEhdZ+7UfoZpNv55BZtgey+WKK
         5HUvweBAtVrvdYoa+4eoZYGOI5v5wSQGKL7zOfLBf85oO38ErMBflMSdJ9mtgwNvnE7V
         AAlFAfhadbEe1//m7Dkqx0a9Ur3skt0WUmlpX67/ABgIOp5dcXigXkFT+aDs5tyAvY9W
         8+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888090; x=1790492890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6a5bAZPuUCh9F1dtEQIfloO2fyihCQk+5QE8nkYOx1w=;
        b=n6RJioxYFzgCnjeDbbJ47cW9364pJ2WxXiPmt3+AhKobTGNWWtHJlDlczs1r2idtJe
         dXjq7gW+5ac7mqHRlEe3EVE7oSNinM9dreRK0sG3kUWx+BhWIsoMnK73/5nT449NrHYC
         lIC2R8cOBf9xZhXh6J50XyxWX4gD4rcRYZl3QJJfAF5sB/sWLb85xb/FeyVkjZFjDqSj
         6E1GM0UC+Sz72qW0VX/29MHdjar7WVjuWeRPpcB2lbxhQkWXIMvn1du3YkjpOv+yMEmo
         VM4OKgzgxgDaceMKwJP5nskV0rq5kYaQ+QMJRWufT4hVZcU4mGNG6KXAFpu2cTzojrK1
         BrXQ==
X-Gm-Message-State: AFuF++lsjhzvFct2zOZkEhkjdoZBnu/HO94pHZeg5/5YyUwAWxOzmL6e
	x0fYSPw2ET5K69UGBJupnL1FLlhKrpBs/u7nEtELneLXwJ+A68YdL/OS
X-Gm-Gg: AYBFou2ZY30M95fSK80z10dn6VBnvb3crIkRQ2DaglT7ew6RW9f4AFkvRqLqG7nC63T
	bglSe2gDPIWWs8ZCKzGlSL6De7rQU1/mGSNRsCDKmZ4FpgZyhj22/WseL7GizimpVsLRxuyl5+S
	r54+vp/GhTPvONd8JlOI3NXM9xAmr8j5wF9yxx8DhnhBLN+MALKrGuYqXB1jdp2vNJW/SZOObpw
	/n2BgN6ZY+a9aZ/VDRXKR91khv9gdmlEVQVqsEbg/xuni8WMwGkN5Ldl0K9qAJeGUUw0CBcfCiB
	OuVWqRTdQZlCoHmO0GV0B/nspMY859TRBGbbVNecqjS5IKc0LznLVme2wY9Eihd34hZudoypk8E
	yBoOHylQPv4sjKhNWEDUbFiVUk0usjBs9NoXYFhqNUoHMbp4GbqPYDIrtb8D3isQSWDOW2pqxNB
	3hPq29tQjp885BG7YL5HNR6hNe0k1xaixF1IxnTROYeE5IZ7kb94B7T6Tav5RqRgWNrDmPQWK9W
	scl6CJ/VTXSx/Pj/GcSwRLsn6j9
X-Received: by 2002:a17:903:124b:b0:2dd:ad73:c981 with SMTP id d9443c01a7336-2ddb1ba2dcdmr102512425ad.25.1789888089877;
        Sun, 20 Sep 2026 00:08:09 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a6e5sm10517519eec.7.2026.09.20.00.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:08:09 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: frederic@kernel.org,
	longman@redhat.com,
	juri.lelli@redhat.com,
	peterz@infradead.org,
	kees+treewide@kernel.org,
	brauner@kernel.org
Cc: linux-kernel@vger.kernel.org,
	paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] kthread: Annotate lockless to_kthread() flags access
Date: Sun, 20 Sep 2026 15:07:50 +0800
Message-ID: <20260920070750.2871923-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_exit() calls synchronize_group_exit(), which modifies task->flags
under sighand->siglock:

	tsk->flags |= PF_POSTCOREDUMP;

The sanity check in to_kthread() reads the same flags word without
holding that lock:

	WARN_ON(!(k->flags & PF_KTHREAD));

PF_KTHREAD is set once when the task becomes a kthread and is never
cleared for the lifetime of the task.  Since PF_KTHREAD is immutable,
the check does not depend on synchronization with updates to other
bits in task->flags.

Use READ_ONCE() to annotate the intentional lockless access.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/kthread.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index a3f95c90456b..cc8cb5d3eab7 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -81,7 +81,7 @@ enum KTHREAD_BITS {
 
 static inline struct kthread *to_kthread(struct task_struct *k)
 {
-	WARN_ON(!(k->flags & PF_KTHREAD));
+	WARN_ON(!(READ_ONCE(k->flags) & PF_KTHREAD));
 	return k->worker_private;
 }
 
-- 
2.43.0

