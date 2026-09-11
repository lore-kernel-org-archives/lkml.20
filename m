Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D93485954
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141326; cv=none; b=jnXlA8N3cgDMrF0maGLNGslOnfhtnIgKBDq6gWVrkIOzcMpcMfbPRg9PyXjfYrUw45nxO/If2hRLQWrutPlG2wZS0S3fcEp8kH2B7aV9Krg4Q33zIAd7ytKpCQQfTwZR2CvDx9s/o5uYNcivKbntoMYPMTH4/4Xmg7/C5K+7vLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141326; c=relaxed/simple;
	bh=KJRnZ7USBDtOxaI9oLCCZhPnMHJSo9U/cVcNXiZ7Jrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8YuXZj43/QA/KV8rM5kw4kG+iLy8QlY9GW1M1qycJoyj4I6GVbKe4BEqgv/2qB1yTHupvhBDlB2Li5FJ247Uh0W0pNPMOnbBjg8lIKqIU/hnA3ZdxMtYTjW2Fg7393OnrB5OWuJbtrnV8wPbDI194UZWQIrsZhPfNudNqhzYWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=XCPu4FNb; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="XCPu4FNb"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0cfb33cso13757a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141322; x=1789746122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xN5FMpx5BomrnwwRlZAaFF7UH1EwB4frjE8eycmnS4k=;
        b=XCPu4FNbY6WeYi1MpCfIjFhynJfGO6JxH/YNqvjIrRbksojK1QaTuf9RKdrOTdCgTn
         GymY3mqZFcj18u+h6+cgX36X3NaRkfX0NLQxRUMc/16bUbKaSm/vYWOYeF2K8tgqoKqn
         A2iP96F31aekg35+EE6m8PUKMktOD3W6lrIAbj0Tgi2FloGaWqcQej18oKFSJlpUHoX3
         n2sHhDT0d8D62XwjkoxN1FZDDxfK6+CgHUwrprRnhpIoRwgU1RRvw2fRYVUCwscE+EMu
         1vIhkM0VWZFZPMdEH4ltwPR/BV2sobr1kwxSpFdlIKLcYbUrSshQZYt2UjcFMHHWMlew
         2AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141322; x=1789746122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xN5FMpx5BomrnwwRlZAaFF7UH1EwB4frjE8eycmnS4k=;
        b=V86nQFG3V4cky4ZrTiVHqvg7kzUmYyvy0EfKOdurTnyipqW8kf7D8RXBBAtnXw7Q1/
         ekXH5T2tCmM2eyV9WGPfyV9PYTyZ5js6I/hcrzzxf97I/JeKbU4KXtrcUp+WfDoR6jNt
         mp2EvEyg2xseMne0hQXrlTWoQOli14emwBCnlFc+v6v64JgW80bJw2/PLxcxS7Ol7m6b
         wCR4wm9aS/iXlNsU/CG/KH7phPTnQUbJ7D/b0CnsrJf+AtDAARLYpGKRNnoFcnChoQUQ
         Bb7o5+LJTpyBfJDI6tYBFm/tYfmK08XGP2yQyNbBav3tP9lAM1WhvnTfQMeBiYPE7C8B
         1jmw==
X-Forwarded-Encrypted: i=1; AKwUvBy6WuzfBWNMVknnlxM5diIq7AGjwQTKxIck0t86rDSz16QllyNtemTs53be3STuOqGfOFgnLbVn6XAITB0=@vger.kernel.org
X-Gm-Message-State: AFuF++lbjiCcQsYOJva4tsoK4ZpuQ8lx1arOgIHJHTgQO15KcxUzXEMC
	AP5AbzUNhE1VBsuFetH8IbevZykNmzqV+PSRyzUjsnv3+GIX4c3LyTIQTYzdh8n3y2E=
X-Gm-Gg: AYBFou1OQpuiTYNvJrkRhLCQjGINHuJ6R1LW4pRs9uZJyNwXUJ3R04nDrBnjhi3RyAo
	jCo1HQsNOkd0ibXEjPD9uMh1LTSNchl6vyEsiucrVvxlmBDXbtzcGIjlMAjH757dhmvJwYbV3qU
	9ROfwUrGE/kJUdvGS8PBwzNDwzEGkv70K6Sn/eRNYh+rKL4V7d0fXhL4PnqCL4QmXrIwqV41s7L
	vo23VHAfvySKCXHbQW6d5DK6HE28m53QokeBZPzD2AHImyQv4ew691uuDMzCLQNC3ZKXdeM8kv4
	SnVSiGpM8xmhodRmnTRQykFx6ndHR1c4Kv6YvggTE8M315MV3INs2cPygzl7Eze7n7IxqIqQBAS
	dNEXrFqRIzqLAyEZwU2ncqHDWHtsbYTKQezFuon84Qvu5cyKyO5dLwzl6NW+Y1xor+dNRT3MnDM
	jIm8BQ3BIepVGxbK+q0ZIcx+KY+tfcy6tHfr1FKnA6BsT7I79QtX1+oEX0caNxU27e23ktGO5HK
	2t9txWn17HW/bYD/GdNMeYCP7MT8IzCNFrJZ5Fy4Lw=
X-Received: by 2002:a05:6820:208b:b0:6b3:50e5:c625 with SMTP id 006d021491bc7-6c0bde62624mr6480780eaf.32.1789141322172;
        Fri, 11 Sep 2026 08:42:02 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:00 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/15] io_uring/kbuf: use io_ring_submit_unlock() helper
Date: Fri, 11 Sep 2026 09:40:55 -0600
Message-ID: <20260911154148.644489-6-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_buffers_select() open-codes how it unlocks the ring based on the
issue_flags, use the generic helper instead.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/kbuf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index 7c309173dd19..8f04e6cc773b 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -371,10 +371,9 @@ int io_buffers_select(struct io_kiocb *req, struct buf_sel_arg *arg,
 		ret = io_provided_buffers_select(req, &arg->out_len, sel->buf_list, arg->iovs);
 	}
 out_unlock:
-	if (issue_flags & IO_URING_F_UNLOCKED) {
+	if (issue_flags & IO_URING_F_UNLOCKED)
 		sel->buf_list = NULL;
-		mutex_unlock(&ctx->uring_lock);
-	}
+	io_ring_submit_unlock(ctx, issue_flags);
 	return ret;
 }
 
-- 
2.55.0

