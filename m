Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186352;
	b=n/lXl5R4k4a+tpUG+e4s60PVT8D1yZ0zRdKxdy7cBa6dfasGQ8kktIPY9M+7u8XauNJR
	 wlpxTTLe3U//o1ev0d7YwY6lqYWuOuSFXgMWH6qngJqWrXHmdZ2CumcqSkg8OKTvdykGT
	 c3ec4aRklUnudYyIPUsr4DQXtKHxoDE6fp5ZM0WH3hNPvifG7Lei2iMmDzDZYuLMX6VdM
	 Xd1NWqWhvqQd1u+0u23CBPXAFYOGmZAUeT+NgqXU/G20/3WCOfG8nGVm/FbImpsS1RoG2
	 ohKwz5sE94NHmki+W2DiiGrGtCZUc4Q1lTPn1Go9lXHScYJJxF8stM/S5lSJGUef5Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1I4GJ/t9JYlWVGVqPwODuflgYivcSDfBTv789oiYGeM=;
	b=1ACU9+iYAa24yvSBYMTeLhtXoJ4oVWkewubtLbmqsPK2zUpbqe8UJ7EhpMszYGj6fbXl
	 WcDgCwK0W4h6sxftSFXC5OItRe8nLIKR419b5R4nG+kyYTlgyFzkMb49XhufFq65yq/fn
	 f1yBaWsrwEKjk9j2fRlHl3CbC5JynIFUik8JPXfkQLMIwsg8OIzRPeXYETUWvpgIfQLc5
	 pQBG5wgasV2sN3kkewdJ6rA6ARDmvAI5CX1m9k2egvwaj63gG7BDwqPJDv3OFcQN9mFld
	 7bqnYeYCiNHJd7mPNmJTzVK9msOZFnYUrOP/b4r0oEQD39x7/hfezg0t2qy5tgE4KAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZjJdMLh;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA73606A332
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA73606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZjJdMLh
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so6723505e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186346; x=1793791146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1I4GJ/t9JYlWVGVqPwODuflgYivcSDfBTv789oiYGeM=;
        b=VZjJdMLhSHjPrNYipDLBUEPscvtSW3G3K+KFGMElwqECKTEU7BLoyN5bjaKkCsi3x0
         ZIAaX8PyflZv6DL0tfgqg0Hg3B2ZcmhpXNhl8kKgzsJ1EZD4lyNgD681a1+jMGXzqMbp
         UhjQmhASeWXsuymqrM5nBnbnlX1EPRJPv3v9djsVfW7Wc70j/YxMB9DIXBjGgJO7+DwC
         0ujnLWiohLvKcci0EDmqisDTIKl4gvmztcEdNQegKjd+AFF/AFYmJT+5XBgMzFSGA7F+
         wVxFpM3OLeyD86UPtVemDt53gMvUWnpR1ECBLUzQj73qfrPS8zgjLDcRjVwkmPdpsQqT
         1cSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186346; x=1793791146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1I4GJ/t9JYlWVGVqPwODuflgYivcSDfBTv789oiYGeM=;
        b=1+2uMKiiXs01w4Fn3otQrPX14X3KGw91lhkoB9bTRi/ri9DbNRH4aquJ2yi47wbLL8
         2hZaxDfi3UgDunlDQSUFK/pjoSNqr/kkbPPSvR4pKXOOoIN55RrJzRPtXj3GegyxGzuv
         E6Vgf17ZvQZjxM6DVjkr1ghjtj68Te1d4J2ObbOYZk8MqQAPHLZUKrF6V/1j6qgnBLOr
         Vj2aozkE9YqMavR/Bx0nKbL/3vIOIwNmIJimSmi3A2S8XG7Sig/pCe3zwGZWLQ/w/Thw
         r7SkhOJT9ulp2nr9ZvjL+ApZQfVd+T/jTR2SALz4vl7YFcVlj58YZytW8N4FF7g2oJMS
         EnMg==
X-Forwarded-Encrypted: i=1; AKwUvByztakHGlmWkjL3reqDrLQs8R7/ISHxWlNITJYh5i9CbW9Gg51e5sUaRxUaFwSD8kONUI9PZjzZtqxz9aE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1PLlhXn3k8FGuMayikaue1xkNY+WBLTg90F62si6ogLuIWbr7
	3ZHeGybFtr6vJCQMWhjUS0fFloPvUTspO1ISqLMkmnHYXa1hKDCV/ltI6v8MHw==
X-Gm-Gg: AYBFou1fiSmgzmN+1FKSuAxwB0JvRSL2VHX4IfEA5tzBrrQMQ9X17Wj50PqqD3zDyWq
	4jqEl+IPbw/XwDLWXEJCkEDECNb6oTb98pFCAMWzCpMwYiL//QmFUch87x0NWwDZHH7cotATOcp
	I8Y25fp2ZhLXB8jISTDslM6GEIK5FpzedOJnTWIU455zM/ps4nKQlDAMJHIoK2oiJDtWzahZ0n2
	fyxBcdr7RAwtDn4VUaHK0aEyJ7MCF6qi2lc5+QUS8WrRMaV9d+yzSXJvvvr+wkTn51cqnDKsc1D
	V5T733sGAyRrEzec0paPjboAFrOANcuyRqvXd2kJx70+o/TbT2hMmLK8bMVeXceYlM8/F9bsGq1
	1/wSS1oUcFybV53HCZabBjCH/IUQ/6RhXnVlRT0KXrc8M+9IRwzpMQzfBvPMO5jRnZYlIHeLOig
	mPQRMFK4XR1RKZeVF0tq5am6XGvDQQPcbzfNNWQk9tj/TdOtxWmZpnJKFqmUhfJQBwoa71tk/oW
	crI6YKKxzQXpQf6mG+I5GY4XR4dw7Inz8cuWbbdsT7SQeh1Lcwpf3M+jMRz3a2DAm02BIWCxbGl
	i3B9+QAF5n4vIaEpzA==
X-Received: by 2002:a05:600c:198d:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4a9610e1028mr42232795e9.0.1793186345891;
        Wed, 28 Oct 2026 04:19:05 -0700 (PDT)
Received: from fedora ([2a02:587:85d1:a500:5135:1deb:a9ab:fb3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978d57b39sm64197635e9.10.2026.10.28.04.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:19:05 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH 3/3] HID: logitech-hidpp: Replace create_singlethread_workqueue with alloc_ordered_workqueue
Date: Wed, 28 Oct 2026 13:18:53 +0200
Message-ID: <20261028111853.22429-4-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028111853.22429-1-mail@taterr.org>
References: <20261028111853.22429-1-mail@taterr.org>
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

create_singlethread_workqueue() is deprecated. Replace it with

alloc_ordered_workqueue() for the force feedback sendqueue.

WQ_MEM_RECLAIM is added to ensure hardware events can be processed

under memory pressure.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 27d83b8bbaaf..4efd26450539 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2875,7 +2875,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 		error = -ENOMEM;
 		goto err_free_data;
 	}
-	data->wq = create_singlethread_workqueue("hidpp-ff-sendqueue");
+	data->wq = alloc_ordered_workqueue("hidpp-ff-sendqueue", WQ_MEM_RECLAIM);
 	if (!data->wq) {
 		error = -ENOMEM;
 		goto err_free_effect_ids;
-- 
2.56.0

