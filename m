Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334065;
	b=Tgk0ClL5dsbIjPNlDTCbx6hvEd4lc40IIofCoXgt0EDJMcaot7D3Q361jDmjs1kf349k
	 ndysClksbJfIS6VYt9C51Zw8dRB5uQ8uNeeQhOMDTHsv/WMycQQfYMzdnEBTVWgLs1v/e
	 l1hcrO09H5VkI9H37AZulV4HN7UI/CrFTzFKg5XDNql/pYpsEeRQ1NSBvs+wucX3ghtZe
	 KsMRRYSPbXdmMjwGSXFyWfFmQqntnNJIq/qZhnrk/tEgwpaVIGAKrVC0BvT9q6ASz6xiv
	 hMzNTyWjWuJtrDCDnLbIY9xbeJ4Bs7Nu7sqGl9vUiex2Do+lMvZYBjdpRi+8ZWaikfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qZ0HEHSSnJ62DFFfvad+4V9OpH4w50W8/K1tySVDK+A=;
	b=tMSQYppoBnbfCeHnoWwgNFG3hklSgdFmbTOtQ4EEKJD/i+qLIF3BNw4g1fO5TIUJkQ7t
	 NF13JRN1lNoBbvreEzWROuVkrWG5Wem7O4/En/fF4aWJgrhx4nusj/dPJigsYrz7K6aqP
	 Hs4IwXECTM//Hfi+U/GS7S8Vj/H7NAAbC/PEPxgAGO9NHBdcRqCb/Phf5GFFBmRkW06v0
	 wX+TEaNv+b2RNccqGkHxEAT2ugvh2lkv8EBz1p3CYI6MFjCm/rwSYw4XWwtYMat+POPi0
	 b0E0HibTTXRkRJt/RhldZuMlTrvLqUJLPryaoW3bniN7MjnTuwPe94QVVGUCOVVGHxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=XjS0H6aE;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D5A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D5A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=XjS0H6aE
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4a6f2825dd6so59834fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334063; x=1793938863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZ0HEHSSnJ62DFFfvad+4V9OpH4w50W8/K1tySVDK+A=;
        b=XjS0H6aEzIPpb1+pzOo2LNNGgqlyIQfmi4OlZjOB3OcgfWKXur/unvW7LyUML86H6j
         1mhl2PktMNSsruuGNYX2X+NPkELNx/nGdB29yXQqWNIMOi3x0TJPi3L2XNi0zOGInzTj
         fWQ4A+/KyQ3EjrKT88OJW3LVp2NHKU9meeH+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334063; x=1793938863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZ0HEHSSnJ62DFFfvad+4V9OpH4w50W8/K1tySVDK+A=;
        b=deZ7yHsT9nBundpon2QkUjFPJSXC7aTcs4upZ1p8ZalNtQLvBkyxWPiOqhH99apjbS
         KkoKrypiem7jV6lo4c4au84IcGA6sXLiARH0XhA9Q3qMMM5ITw3Mz9VKa3LyCywPm/71
         Hvea+ZOw96h5Z2U3bujD35ZK8YMzxerK7qyuiMqaOvQ7c6VhpSACUZzcON3es5VIOKCb
         QQh3DGP4Y2PErf/ekZS6IYrl8kAeawbhvf3O17KR5Zb6yuozbEd8M71HSEyvzAW/1CN7
         Jgqskql5MlJvXlUWOVKuq++/c8DM6nOf6+AyVC0W6tI/PCJzVDuNBa+d+heb7ZKZ/sKs
         ernQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAghW2KXxBFYoA3aks9OYEWj4hDDo9P7ygptq5pHg7To0IjhY78gfxqwk/k4Atory/kDxdL3ksDkVRdBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5LF78txmup+sQwREsnX0x0XULNpvJrgJxS7yHrfpbE5mvli14
	Rn2UjfE2o9Z8XoOuc3P0juR8rrqSiw+elsERAGyMcWNG//BAwtgCrnhujCrrugFyX7g=
X-Gm-Gg: AYBFou3V0CR3YQpaeXcecr4CQEWRxBlkyfLLHAx3b4xvkvLEfv+rVyZ2qAELZXxUVqe
	PnYfATAlawuF8Vld8Da/MJaYuvVyXDshwzjZeZ85uSEe11wr22pu9CHeO69UlrLlpstuH7x5Jcy
	bdtrpGokmT7BbUUXTZOaRtx1uL3oogL2pvtT8UTIiMQVNcB1eYU8WjqWwlvWO6+cKrKW75w7Vie
	7JG6PZHfBrDEN2kVQNooXwdXHzAB/biRAL7edT58Njz7IC0RlGJBRMy358Gq1kCTNofVG5Q4fg4
	7EBNEtGAaqgNnAlC+SKCNnFW3DHBnRW8HPFRQ7fcoQL8IbOPEfvubL/RpndUkt7d0NFf6GJgXs+
	PMbkr8Qzk24Dsv1UFoYKB55IFk38AMNH81M1gADsP6RU3YL1pejqPVq003QMGtvvFwVtLx50Nbl
	z7UA89ml5STY4oqHSEkWPQEqKbjx5QQvCBKerMeW3o7d0d8hb3jfGC/UO1JkZfOPyfiUEG/tMG1
	VZkk+6Hx1VdW7hoYckUsH4T5eKO+Bh2umYzSJXHtZgQj55CptBN4Kh8vtx/MO6A1qJ6NRccfNvt
	ceekiMUz6JaWGfOg4jEtcXOPa+BrA6GIUQx8Q69Yn1ia5Moogk5qQYIOpz8kpWPHiv7h87JniKb
	UKYAH2lYDOJMn/GylxRZXd1VwX7WM+w==
X-Received: by 2002:a05:6870:16f6:b0:46a:c217:c56d with SMTP id 586e51a60fabf-4a9072f137dmr728856fac.2.1793334063494;
        Thu, 29 Oct 2026 21:21:03 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a90ae4e9absm830912fac.4.2026.10.29.21.21.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:21:03 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] io_uring/io-wq: save worker type before dropping its reference
Date: Thu, 29 Oct 2026 21:21:01 -0700
Message-ID: <20261030042101.73491-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

io_wq_cancel_tw_create() inspects cb->func after calling
io_worker_cancel_cb(). For an existing worker, that call can drop the
last worker reference and wake io_worker_exit(). If the canceling task
is preempted, the worker can be unlinked and freed by kfree_rcu() before
the callback function is inspected. KASAN reports a slab-use-after-free
read in this path.

Save whether the callback belongs to an unpublished continuation worker
while its reference is still held, then use the saved result for the
conditional free. This preserves the existing accounting and frees only
the worker allocated for the canceled continuation.

Fixes: e6db6f9398da ("io_uring/io-wq: only free worker if it was allocated for creation")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 io_uring/io-wq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index e93cfa82b850..b6c857544421 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -1428,14 +1428,16 @@ static void io_wq_cancel_tw_create(struct io_wq *wq)
 
 	while ((cb = task_work_cancel_match(wq->task, io_task_work_match, wq)) != NULL) {
 		struct io_worker *worker;
+		bool free_worker;
 
 		worker = container_of(cb, struct io_worker, create_work);
-		io_worker_cancel_cb(worker);
 		/*
 		 * Only the worker continuation helper has worker allocated and
-		 * hence needs freeing.
+		 * hence needs freeing. Save this before dropping its reference.
 		 */
-		if (cb->func == create_worker_cont)
+		free_worker = cb->func == create_worker_cont;
+		io_worker_cancel_cb(worker);
+		if (free_worker)
 			kfree(worker);
 	}
 }

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
