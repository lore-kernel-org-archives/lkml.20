Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075733;
	b=09LGgNdZZVNPXCyT5hD6yRenP+n73mmRDocqCF8qsKdCpOG3qXV+9yXTGwyE6WIGKj1x
	 vptIf87c5l6p0ZiFKdwhBZVSGKrd3hzyxOifhoA/SqW1Cmu7zaKMcJ7kHp8ct8cX8z/HZ
	 EkKAx/0RAOodJO0cCmPdlQZzPRTjICBjENggGrve0AMwrMOMQGXYQHe43KvB4apLjCJKv
	 BhOtc+OHzhzNcdRjzBNTUC1hgLpTpw5zHdLoaOe2emF/JGJPSwfPPDo5B7Q2TNleDFFXR
	 IggbTPbLjxG4VfD9U+aBLIclLGxDgNnRLasy0N2JVAxE0KZmMWXiH1MBQBNqPnvz+0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lvPUnqN8PL1OAu56QIuIdIBU70pIUAL/ta7uRi0Zh7A=;
	b=4ECwf2u0ubbh83/er+r9btWBVM4NCkIa6UTsj/L4lLqnMojJ8RY2Oe4NKPJuhtcLPpof
	 Ffn3eR5q2b8T3NUWlECaclnwJidPDlU4tylwsUtV4K96Np6eJZGNNcBXHFmNWRRbK23Mk
	 xoHbFwdl6i/I1lfhAFftmPnFbpVKwsONbjKv3zAW6u/e2uU7wtAVc2qS33uU/RUng9lnX
	 n9hkobwbtcpTPTclvC6s0YMD7oDv8XL8wT9p1UIYo2yzUmmX9zT4y6+nZHwJBoBDDww4f
	 iZBVlmk1YTcAIQDg5yhCI8CzzM/G0mynIhk/68WGFBhYfD4BHShsmqcW612YyrSQFfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UPYhloo7;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B533606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B533606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UPYhloo7
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so28387925e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793075731; x=1793680531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvPUnqN8PL1OAu56QIuIdIBU70pIUAL/ta7uRi0Zh7A=;
        b=UPYhloo7tHG4yZGHxqzd+x+NKrxSO+DSvv+Bm8VcwLxU9FRWaGJZJieK1GNVo+FxCa
         FTpi9gVYw+ZVi2M1q6BSPNxQ655nZIYeIZSTwRVvDsZhnu5x/6whUAIma9SW6XsXUEyt
         5i0h5/sREW2SMBMS3jfwj3kb8Hoij8ghjMNedezW2bNUbfAmMVTKSwVi/PcrR3IyBsVU
         nvd2wHpk/gAvW0/TsqcVDZRdK8GWHE8eKFmfiwdcgEx0kU8i69veEZ/ScUbqxwemvCVy
         spGqVA8dILNTpaY+A1SiCRGmtB7E2IMGtxWJdXbD7DfY4s/UvO6FlThz92F0uDAXGUVP
         o0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075731; x=1793680531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvPUnqN8PL1OAu56QIuIdIBU70pIUAL/ta7uRi0Zh7A=;
        b=EBZrV2G9VdgUv/+hZBwPas/UplRhd2w6pVzx5mh2FN+TQGGYpI9/H4verRDJW5hwHv
         81ee1t2bK+Wuku+LqM0z4pXTG181fqWtdvTlBWNJ+UTVY1DXGo9N8wjdowil57srbDOT
         eZuWycEe6srnP1DI5n7/jaxQbVuw11d4xv75ogJ7kP6DzVwb/Xm2OZJThDZJFHBERDec
         KZBmGyRaiKQQNtXWTD5GpC9qPH4SjINYnJuT+bkgOPLirR6l6s6wJlvFrkpcMWqX1X6A
         FtUbGlE0BbB7brw1nqkbcNp+kfslVkK8s9ZP8wdv0mjKQKqFiUdveEgm7Irf3ZCVmTaY
         dAPg==
X-Forwarded-Encrypted: i=1; AKwUvBwG4Z0xIwk/uMXnlV/Su/sRUntV6MSa3W1cMV39GVDm5VJ0ycXpc5v1KvAW1klwnskCYmbut4xmYuZk/Jc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKvJYRJ3EGI//tFcamiIUUjBOziTbJGSjlpgtbasvpW7X1JL0E
	FAVduqExzUEA4UZZVe625ukCgjD7vt1AJ7/B/3yWUB9/D5E/Jl6CKM+V
X-Gm-Gg: AYBFou3s2pMzZIiJ4f4IBkFWaxFMNfF26BD4c6y6kWWTdQm9vi43dNUBBFq1GfSN9cc
	ViYtTJiggFictEFbCoubaEYKVU2k1gYlhyRDymZry6RZduTK393KL46AK97ckrH3eLsDYz3iLc2
	HBypdBBCLQDu5rOnW+dnf7m82wQe21hcClg7d6YoUhcVjZjqij7UspUlbowyclp+kZdBpfV++wS
	KaxQfILLPzJrlsGc4QnhMEI/kSKgQRfQqX4jqK3wT4Hgi/F/tLd9+hxdu+Zb9ZfHario5wjHboQ
	/B8ORGj5s0RFPsijRvl2t9OLiOrQn5P3CeWGG2nYwP33w7kvr8QP6hly1r8oUokHYymh4/bNBsN
	NyZ1Sn6ThS6cs9eu0fd4CwdPBj9fh9aWXni6EM07LFNTbj64nc/bkU0odFsEYcpNutepdKtpXcl
	mc2o0N3B6gaCK9ijWTOPYaAoNVqzm7c6t+7OWyYfz0qToOwffAl9bXoVUC8Ej+98nPxKXcLS8bn
	qUnB27lLyLV/cM7CArkLFUCYM65dMYJ7RQXlonN52iMTrZZQGbcoYFpVujEl68+D5aXnzx2MMLA
	hxUeA47tTDGWUTeiv2N3f6xIkPO9TpQlW0XWFoXqil7/1oMU2TfNcpRFzW4C0/AGs8/3FBZYMol
	QevT/+hs6T1Sjj5qZR2X6Xhe6hLLwPI3omdLBYZMlfIN6Puorfmxv9JQlv5h1JJFox1Enk9P8Fx
	qvjpmwtf6ocw==
X-Received: by 2002:a05:600c:5307:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a35acc41a6mr147390645e9.35.1793075731463;
        Mon, 26 Oct 2026 21:35:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm246720855e9.4.2026.10.26.21.35.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 21:35:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	io-uring@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION] io_uring: final close can hang on a stopped submitter
Date: Tue, 27 Oct 2026 05:35:21 +0100
Message-Id: <20261027043521.99446-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 13d3783a55b7 ("io_uring: wait for in-flight requests on ring
release") can make the final close of a shared ring wait for task_work
owned by a stopped submitter. The close does not return until that task
resumes.

An LLM helped with the review and reproducer.

#regzbot introduced: 13d3783a55b758a9fa05b67835afa7e216476c61

Last good: v7.3, c03c1a14507dfaf8b856c2608f9ac216021fc222
Tested bad: d135ab453a7400a34930bdda1ef4bdc8acfac80e
            (master as of 2026-10-27)

The reproducer uses a default ring and three processes:

  1. Submitter B creates the ring and submits POLL_ADD on an empty pipe.
  2. B forks closer A. A inherits the ring fd but starts without an
     io_uring task context.
  3. A unmaps the ring but keeps its fd. B drops its fd and mappings,
     then stops itself with SIGSTOP.
  4. After confirming that B is stopped, controller P tells A to close
     the final ring fd.
  5. P resumes B after two seconds so the test can finish.

B keeps both pipe ends open and remains alive until close returns. This
excludes pipe HUP and process exit as completion sources.

Tested with QEMU 11.0.2, arm64 virt/cortex-a57, two vCPUs,
CONFIG_IO_URING=y, and CONFIG_PREEMPT=y:

  v7.3: close returned in 0 ms
  d135ab453a74: close returned after 2005 ms, immediately after B resumed

Regards,
Karl
