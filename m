Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626193;
	b=ogZoJYhET7QtsIls5fDkEkQnUKSvMi7KZuMZgm8nWwuqIRwIeojZWc7UZTU2MACVTb2M
	 gttZNXupNyeWQZR3RzfiAePsk/0x6ZLvo52L39jfPfN9Hf76UyIgOsNOYE/0txPkK8nOH
	 xc7ggzPmxLaeZrO+PTQ5J5QTv7C5aENkaXFkcyB0Zv6gFUYd1tpcx1XlmL4qE96pxIaHA
	 UkuXwHnaRNxIGfFuCHXBwMT4bChxkaQjNPx6afnVWh+L7k4KhWwfygFaQAm0x1VH4pTes
	 DqeMQ6wRUmXoX95FNWZjZ5sb+YbaA7TZ1pfzn4zCXvzBVXDHs5dsSle9HFaFcnuInAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VEL33wrZ6oTLFS70Xi76QGCdvLv0OeejiOglWoQk1dI=;
	b=MMRUqXarV3EMBVVR6Of+yZu5yDBfGXnoySFZxAXW1BWviJjrMyx0QMAscj7tTjGEV/Ic
	 9dl3xdd/fBoYExpy5H5RwZs3qr8+WfJBr7prUHQS2KJ+W18WpUt62XUugMClICJgPExxB
	 Pwgb1w+zWJ+TDKlQAJpYmFM5ElJM+Rkde6YmdghuMcE4YDNqqfqQw34zRJBV3ye2Q6DFY
	 RttPI25pLhZQDCda3H6miuvSYZWcHdX9aPCBnMl+WwIgWuW1sbTcgVMKJp9A4SuYZ4yYV
	 ebJZHNk5G0snDCR9XNvtYTyCJt3VTD+6xQQTzgNwcek8S5NKucbO8Jvi/PC/77e4Pdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=PAxkRSRI;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534AD606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 534AD606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=PAxkRSRI
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b0d0f38abdso306258a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794626189; x=1795230989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEL33wrZ6oTLFS70Xi76QGCdvLv0OeejiOglWoQk1dI=;
        b=PAxkRSRI9hINZJRUP/CNnlIlRx69IykmhPXo3sLpnIhW1b8c+0J+VXkIiYba8zI15q
         QURRbQEqS0TwhA72NPVnAK49hhcQRNs42jnTBPHeLkqKtCceuv30a59ujibmixhkaj84
         W2EuS9MMar8qi5YSDZLBzEGg7cnqyL9cwgnFx9o2nLH9mioASXjvKWkwwux6kMFpcfQ2
         G1rzZDHTPcWzSReZZhO2XZ8Y+gOzcAa9x7ZJ3cEXxDtFYkLOsi3fFZ0+C4ix1N8hb7WO
         ZmOh0S7yhNNWUXdZ3I8hEOrwGSt19UPjzm6NNcBHZ81dmrVtHYw5FaOG3KTW9jYInwQM
         im/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626189; x=1795230989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VEL33wrZ6oTLFS70Xi76QGCdvLv0OeejiOglWoQk1dI=;
        b=l0S4fEWRkFjHc0zlpBuXt07FOoBJdWVyRQN+JPtiz/E09XnqDt4Bhh2OLc0TEHq/bk
         dNizqI+lpJTHZjiUbNJ++YUAMKKn4QMqgVpyrE3Wf8yFcaLDonbCXijaSjB/YsSJ9PM0
         g6gs6qs+Ue9hCDFiFiMLF7sHvYAKJwJbFeiTHdnqYhQeT3hfXqLCzU/3MM2YmLhXqZmu
         iIrv92tguMpKwPMr7aoPdLvmdJhL3/8XpNk/VgEyxxncNQ8YizMAlZmIbqzY+a63K5rT
         tCxMoAQ/3dIqpLHfWOmOKFp3wtV+Be4355w9Sk7cRuSuf0e5rLdE8u2exoVRnv3SLqQT
         oeHQ==
X-Forwarded-Encrypted: i=1; AL+hErHxltXw6qp0n4qa5mO3N95TuaFVcTFr7wnDIkv+BYotom7/+xx/jocLPDENFCbneSjBwIeZNUMDtWalyww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AaYkzuR8jBhIompWfsTyQ+PwXUsKzL6KhB5hx543q/sGRvHZK
	bGVBdyzdPLcpesYmD0cC6fo2JGhsG9s6axAx72qQhE1CduDA+dCeW7YYxs8FRl6CKjYgmchjTZ4
	aSUD4eHFQQCoNtKi4kEXdhF/qTpUVKLOWaWrKRE7ZGBdfaeZ0Q0Ey
X-Gm-Gg: AYBFou0fqlAvRGEFHF5jcvHa08GMFNKEXRorVsdDx1jxtEiEqcjtCWHK49DrpWoLYyb
	RG+Yx2K6fCd8DZ8DwZC7vkI9AHul93wpSPyBgFVtf/G07KCncqLzst2f3tF1aeKHSqCnmXxhFgY
	5/8rob7n/4EdPflwLhWnN5ypz41I2kQlcLwv9tikeOpb5730QsNNlzxrQ3HvXgcf7b8BQCzNdvV
	xCyaOYgHT+u6eoxr0ewYvELo+wzzttRAMLVnkBw2EbiARZKDkQCx48WT3eImOVp4GG/sy/y7qHC
	5TTXlMCzbrOJh2IezQTB/yb1W9pQBVv7Yr/0eGZPAfox0Lwq8mVCtyPk5KA/e8TaoH24lDwZHgO
	FZ37cmWLX2aYD/g0D
X-Received: by 2002:a17:90b:574f:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3b1b0a2b57fmr6381951a91.4.1794626188548;
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1c3e09606sm1050084a91.3.2026.11.13.19.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.17.2.4])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 8C2F440228;
	Fri, 13 Nov 2026 20:16:27 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 89EBDE4049B; Fri, 13 Nov 2026 20:16:27 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 3/4] io_uring: add io_req_{set,clear,switch}_flags()
Date: Fri, 13 Nov 2026 20:16:20 -0700
Message-ID: <20261114031621.2924144-4-csander@purestorage.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114031621.2924144-1-csander@purestorage.com>
References: <20261114031621.2924144-1-csander@purestorage.com>
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

clang likes to set/clear flag bits using the narrowest possible or/and
instructions (e.g. an 8-bit or if all flag bits are in the same byte).
This causes store-to-load forwarding failures on subsequent wider loads
of req->flags.

Introduce helpers io_req_set_flags() and io_req_clear_flags() to set and
clear bits in req->flags. Use a volatile write to prevent clang from
emitting a narrower store to part of req->flags. The downside of
volatile writes is that consecutive req->flags updates must store to
req->flags multiple times. So provide io_req_switch_flags() as well,
which can both set and clear flags in a single volatile write.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/io_uring.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/io_uring.h b/include/linux/io_uring.h
index 505caa99c621..c70f7887ea72 100644
--- a/include/linux/io_uring.h
+++ b/include/linux/io_uring.h
@@ -5,10 +5,35 @@
 #include <linux/io_uring_types.h>
 #include <linux/sched.h>
 #include <linux/xarray.h>
 #include <uapi/linux/io_uring.h>
 
+/*
+ * clang likes to set/clear flag bits using the narrowest possible or/and
+ * instructions (e.g. an 8-bit or if all flag bits are in the same byte).
+ * This causes store-to-load forwarding failures on subsequent wider loads
+ * of req->flags.
+ * Store to req->flags using volatile writes to prevent this "optimization".
+ */
+static inline void io_req_switch_flags(struct io_kiocb *req,
+				       io_req_flags_t clear_flags,
+				       io_req_flags_t set_flags)
+{
+	WRITE_ONCE(req->flags, (req->flags | set_flags) & ~clear_flags);
+}
+
+static inline void io_req_set_flags(struct io_kiocb *req, io_req_flags_t flags)
+{
+	io_req_switch_flags(req, 0, flags);
+}
+
+static inline void io_req_clear_flags(struct io_kiocb *req,
+				      io_req_flags_t flags)
+{
+	io_req_switch_flags(req, flags, 0);
+}
+
 static inline void req_set_fail(struct io_kiocb *req)
 {
 	req->flags |= REQ_F_FAIL;
 	if (req->flags & REQ_F_CQE_SKIP) {
 		req->flags &= ~REQ_F_CQE_SKIP;
-- 
2.56.1

