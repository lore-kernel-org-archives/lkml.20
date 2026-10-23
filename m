Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749733;
	b=u0qIkQ2l0gltThe3ghFGTv5X8ABLqHwkDEgAG9DEae+Txh6IgAB88oh7oWMpiDKtcuEw
	 cv7P/9xg7FJzl1AayW5Peyjas3+SVvhbU0yQKZPEoPPwdHcJlhfBzCv4wGCi9hz4JUcvX
	 M3teNeIAXEE+ZIOILFnSu90/ux20LyNRkXspIS2wJRopAJ0j29xqkWhE2sJT4xI6swcpK
	 KlPw2a43XvJjxf7bsLz/g5YOFWmpcjxbL/wnbe1/4TnjVVtafPSe3UreB+4N/qXmxKdrI
	 PJXCv7cYzB3/3bINxTsSTj+xUquI23WXlaawuqM7rfS5gOqu6BGyuwpSOLaKUJDatsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NSR56nnQnUR0d6l59Po8MuoMPblQ7AEGRUC1M2Gh/5A=;
	b=yCWKB0bKHiU2gec+bfN2ye3tJIVBlZ0IUKH6VXvO3O8S90tVZpRzBCBS+FLBM/ZRpswu
	 lFrGOqyaI48d99gb4qGJOaJlsRQ3fh8we7kVKPr7dWHndlRBmm0c1+ceRvDbeUbBSdo7Q
	 oO3NT1nSzKt4QNT6VbJKBPgckukQA0bB55unmQB2Zs6EzhChd+FGSoz4hPZIMf85W0mwF
	 mD8O7asYlaqiKMSqWp5MoSBJtFeDesYvxgP28La3IlhSxprgKv84cs6YC6gD8FdJufAAA
	 zJnYhPCmHSkpc33MfkNy/OQvt+1cQ/SxgRzUtJWQ4bnMLff9hz5mJxJ8ZSiL5cUmIiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="e/VonHDs";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F71606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F71606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e/VonHDs
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so554313f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792749731; x=1793354531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NSR56nnQnUR0d6l59Po8MuoMPblQ7AEGRUC1M2Gh/5A=;
        b=e/VonHDsRcN+yoJTQWlImqGswC0azS4maOfw8sqzWjYxI6m5YuadKrBI3wsSM3Kdol
         f33SjPRNQxiHbtG11cEW+zNdfA23IggN6VxfY3En5xqzUkNQjoLBFnxZrKC5c9d1F1V7
         86QW95Gbn9QaUG9ctmVajG+TWYF6O4wMl4E9wCXtM/ggiJy83O1M7KoOCEEZhmH6ktC8
         cKid5ORUaDulA4AP9ZuFDgZETyGdnxoMqBJ3o8/L/4TBRe0qbsDDA4MdnpjVbKJXg6rQ
         mYLzpj+FHbvk7j4suWqlh0SE8DUiQ6SOGeFjx11DANc0OWJsFUa+XYK05vE848HgShw5
         xciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749731; x=1793354531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSR56nnQnUR0d6l59Po8MuoMPblQ7AEGRUC1M2Gh/5A=;
        b=Nr2c2yCOxKXGF9R9cQUKiAKqaeETjJQvBA9NJ4ib4MPpfdrVverbSaaL5LGvg4c/U+
         +3xODf46/PmZyVW0GZfXIK8lrZ7IoKFXUlEMyCayD6kh3c8r0lw3TfN4C0SmMxeo6Cak
         JAk2u40/xxDHDED3nWITBTEZHi5wSJGn69IoAdQJU3RZ6SiG+NeQhW57n/m8nV7qWNcH
         5ETK2qHo3cZUhmoELyAVU1DdPV/V+37FNXVqEPRD+3rBLpnUjPdK/JoSgurLxP74roF1
         QE2hznCkzWZyzjCLbc1E4cIqbAI+ph88xVYe/2Rj67qMseGPwSdvN8NidZPdcF8NPu+8
         JDDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1+dOKDhs5jrf/P78f+daBNS/0XdvusVpF7JrSgOfeqqVREA9BjCLabsyFW26t7Ct/jbdUr8s5Hs/otTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPzpgmK8bJo/z/pwuNFmVlexkQdpnzzHV5gBgmnf8DcA9dZyw5
	zIHls5HY7DjS85KJoFGSH2zeL7Cg1oZ+D5HTOO8Xs96C1/vugfU9G+wT
X-Gm-Gg: AYBFou3Ewsx+hAXT8O7yGQ5He1JJvSYcHytP/HSnGLUkqwD10cFghZHJ56CyxZF7bww
	sPy8ArfCCk7DuswRmOWgUDCwVyQV6V1pYOedYdHpeKzKpC/DphryPIm/Zoie58ce6n61+x2aZeC
	N/xI1TvMe6DT8d/HIvihx/oRMkbd9noSGk+hP8o8ItqlO5pxuwMwHBB8yu2clCCOi6+fBBqiWPO
	w3Bg4UXyg3sY8/CSNtum1kgEg5GOd/JvaWIH8rvC498R25D9iCa3Gy7K0ZxmM0Y3pwngJ+K+hE1
	PV/N3DVz9ifiDri4U9VnBGCHu/ddUvskIB/fZjSaliLxDCPOiCnMfF1c5LquUOMT3+trMHJKhkL
	6FGjDIg+b/sjCGN2tm/93uHvxS51VnBndbZ9hnkha6qJ9EKYxBqCROeC8GkyzpPmJX+hTNzYTd5
	BeXF4C5lnsQhCJ2FVuinGQ1PqiWM9wNF9Qjl/GP/L7jVrgXSbWK3663u1qoOxB1+enWnHq+lMxJ
	X4vL7o/x4h/0gGn5eePCdF8W7TqSpCRyma0pejffKyuH7rYI6QyNJZd5A==
X-Received: by 2002:adf:e805:0:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-48e385c0cf9mr1868754f8f.57.1792749730555;
        Fri, 23 Oct 2026 03:02:10 -0700 (PDT)
Received: from localhost ([205.147.201.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38062dc6sm3902320f8f.55.2026.10.23.03.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:02:09 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: achender@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>,
	syzbot+221e213bf17f17e0d6cd@syzkaller.appspotmail.com
Subject: [PATCH] net/rds: hold IB device reference through deferred cleanup
Date: Fri, 23 Oct 2026 12:02:06 +0200
Message-ID: <20261023100206.126692-1-hackerowskiy@gmail.com>
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

RDS device teardown queues rds_ib_dev_free() on rds_wq. Hold a
reference to the underlying IB device until deferred cleanup releases
its resources. This prevents device removal from freeing it while the
work is running.

Reported-by: syzbot+221e213bf17f17e0d6cd@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=221e213bf17f17e0d6cd
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 net/rds/ib.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/rds/ib.c b/net/rds/ib.c
index 786f39169bc..597872e4fe9 100644
--- a/net/rds/ib.c
+++ b/net/rds/ib.c
@@ -115,6 +115,7 @@ static void rds_ib_dev_free(struct work_struct *work)
 
 	kfree(rds_ibdev->vector_load);
 
+	ib_device_put(rds_ibdev->dev);
 	kfree(rds_ibdev);
 }
 
@@ -142,6 +143,12 @@ static int rds_ib_add_one(struct ib_device *device)
 				 ibdev_to_node(device));
 	if (!rds_ibdev)
 		return -ENOMEM;
+	/* Keep the device registered until the deferred cleanup completes. */
+	if (!ib_device_try_get(device)) {
+		kfree(rds_ibdev);
+		return -ENODEV;
+	}
+	rds_ibdev->dev = device;
 
 	spin_lock_init(&rds_ibdev->spinlock);
 	refcount_set(&rds_ibdev->refcount, 1);
@@ -180,7 +187,6 @@ static int rds_ib_add_one(struct ib_device *device)
 		goto put_dev;
 	}
 
-	rds_ibdev->dev = device;
 	rds_ibdev->pd = ib_alloc_pd(device, 0);
 	if (IS_ERR(rds_ibdev->pd)) {
 		ret = PTR_ERR(rds_ibdev->pd);
-- 
2.55.0

