Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804327;
	b=HsDYdokcv7JIHi1ZuQ8Oi2eANHKK8Fpb4tJGKUaWFfZW2jEglNkhOCAMFRPG0LZv4JOf
	 xUa4gZl5eM8n5t1wHbSrRPhTYW3hHmpKH3TnEfv4J4PdqP+sq6xWe/LUpnLaiI/8Fd5Vx
	 NwzEX17B6t59m5B7thQzeBiG0ui/ELSvg5HYUHQWk7uwyrOyl0rv3LxnWDeezEbXuu/ap
	 FLHCei+yiheriYIaCLUzu6QeavbxnPp1Lh8NFjAHx6IOh7yttE0zckFEcMSQIDg0URFtu
	 Xhq5D67mE0MRMnBQatSr6GwKh2WUF2MFxDV9oAtvVdvO7+yygYdSKKjgQKXsqrKpBLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0HbxzpoKVbzRpjQoVSFAE079JjbQp+u9Wan9S/2jnpo=;
	b=4713X8SPPhyEvg0IuyebsyTI0PuCKg89MUEp2P+tog8WROcm0iJKPKpltM3/CEVxs1c8
	 QwZmek6R33lLH7inJ5VifAbnTcFJlbddaN9OKBnI6tzxNanDfhTG5jp2U4jk76KdXrkdX
	 troGZ3onXMV1jQ8uY1lS9v88r7L9EH/hquViZeht/F96yhNo/IzQb3Num3pzupdeVXtaz
	 w66Yc/XMwjBOOxHJPHdgpfvwQvpLYegrKLg1b3WWU5LzbvI9BNFbWVxHfAQPOK1Ytr3M6
	 8D3ygpGJx9PU0Mu7PzQqFJTYB4WcBH/H2XceQBE22LpKkHBjNF/xcQgP9bw/dRo15+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGYEWpVP;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A289606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A289606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGYEWpVP
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37198ed3727so4582962eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804326; x=1795409126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0HbxzpoKVbzRpjQoVSFAE079JjbQp+u9Wan9S/2jnpo=;
        b=qGYEWpVPOlxL6NnC30g2FM/x5cSBORzLxYHfNvXjaV1qzl/VGbrE+R+y82xWMU/UOr
         yf6stfreQCgMCW7USIoqa5YX2Qh4uym/Kq0k3aCxL/J77Gw7p9UrecXVAQNvCYMsbypm
         FH1lLgraQw3ejEjZa0MfN8aLMx/e0tcOjZEtJc5UV89JSGlxJZmBPqCLeYuOBpKMYnli
         DkcoqUJJlV2MiDh0JnPmS83f8mlLI4X+Ux3BAKmj0oYloJaDq0triFaVL1/Qo+sWG3NR
         jh9lW+T10seGQvoNyycQeS1t82rFcwPyIlIgc0glh9FaDIbhgYpOtgG0IKEbM6xMspM+
         1AzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804326; x=1795409126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HbxzpoKVbzRpjQoVSFAE079JjbQp+u9Wan9S/2jnpo=;
        b=A0l/yVdM8ezHKQCvAXFtcLFx9q5EHcV8NwaouLpQHv2GOd/x2hI3G77lhAFaIbgcwS
         gMkSdprQUGUyjs+zVB/BFzu8LzOLmLYzywD9BZl2iuC7fn7qBFIASR46TSlJasHacqSR
         j/kUw7oQ2nGa+PKNUPwq8IXjRetOg1umuZsx1ph6SyceiCscM8EEYXF4kBwnsal1H0KX
         ti2mkVv6VDbMBWRzGj+ZpqnuVbIYLK39Zuw0uVud9kgBhpGI5Bcft80Aygt9z0qoAGvR
         hKU42d5nC2SdIHwfUB/SOuXUXqbZlTT7z1Yf+IzKED+2VoqoeW1sYxF0EJB0C9kB7s4K
         cz3w==
X-Forwarded-Encrypted: i=1; AL+hErGpcolXkEWJqEoVupc82qpmCyqwho1dSA4ruNMGrCohC/ROlYI17obiclFI1t3Ux+QyaK7jG2PxHUaoBIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KGNqh/wTxYlUz3GVKeDRJLmuEi02XX1PFvtGwLKcmWgPLbK4C
	+eXuX7WErAo930umWW+6dCAW1JPHEILEs5xy7PymYnJeGrr1WQyaPNuY
X-Gm-Gg: AYBFou1RvU2hsFsBEHRPPl76Z4nB9t1OUv6AzAkVhY8aQ72m9a9TLQ7/SMsjKxVSyP5
	6OhoX2TJ6OaTMxIy4d1OqMw5uC0cmTlixDuZRvj8QjbQ/vOf5t6xz6jhjx50S/R4r0jo1CCfqyr
	XfIXyFEJY/WIEE4WQcjCq8FcR2D+58SRKpBIyP55JNc1/oq8jQKCHKV8Trl2W7astHnmtsJgja3
	00baKtI+DHAwyx8OZFgkNRa3ykQdR+0EhGm6Lzv9cCnEV+yEOspdXF7gABrT8RLDUdSDLCN093C
	gnccAIYGyZHwr2FESGQ0kGzVB2zp+mPi3BMiJI/iG6KR2vm9Hl2yxn79t8F7pM+K1wet5n2rOsf
	S5kPkZOH65vlbVxJmfnlHO1aFUeZbdIBs8ZvuM6Iwzliq//K2bpnYW4SjmBciX5imgQXCU1xdmi
	ieVoCgAlJyrc5zxNbwah8nE9Fq8zwaqIrHpy8C6/y7UdKHR9/AX/4l9CI22wb/7XoowS5B4K2Jr
	jx56shZp7dYrcpZgTD4VGCe/zVRfzdhtjKUdJofXWeaLWAGuTtIa3jUnY7vQGTM8TDchrguYNHY
	YB6TuZ5W6KHLlj+ZxlB0ikaIhXBRlxwYM6+2o1WGmFCUuOGKX2GucOG20/RuylomPn3D
X-Received: by 2002:a05:693c:60c1:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-377e1af6414mr12491596eec.23.1794804325957;
        Sun, 15 Nov 2026 20:45:25 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm28626640eec.6.2026.11.15.20.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:45:25 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: David Wei <davidhwei@meta.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/timeout: don't rearm a multishot timeout on cancel
Date: Sun, 15 Nov 2026 20:45:19 -0800
Message-Id: <20261116044519.281756-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

io_timeout_complete() does not check tw.cancel. When it runs from
io_cancel_local_task_work(), a multishot timeout that has not reached
its count still posts an IORING_CQE_F_MORE completion and rearms its
timer. With a zero interval the timer expires again right away and
queues new task work, so the drain keeps running it until posting a
CQE fails.

Normally the CQ fills up quickly and the request then completes. But
if userspace moves the CQ head far ahead of the tail, for example to
cq.tail + 0x7fffffff, posting keeps succeeding and ring teardown is
delayed for a long time.

Don't post another CQE or rearm the timer when tw.cancel is set, so
the request completes through io_req_task_complete(), like the poll and
linked timeout task work does when cancelled.

Fixes: ea97f6c8558e ("io_uring: add support for multishot timeouts")
Cc: stable@vger.kernel.org
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Report: https://lore.kernel.org/io-uring/20261115163547.225149-1-teel4res@gmail.com/

Runtime-tested on v7.3 with the reproducer from the report.
io_timeout_complete() is the same in io_uring-7.4, where it is only
build-tested.

 io_uring/timeout.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index fa7b0d9a81d6..db78059cfeab 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -115,7 +115,8 @@ static void io_timeout_complete(struct io_tw_req tw_req, io_tw_token_t tw)
 	struct io_ring_ctx *ctx = req->ctx;
 
 	if (!io_timeout_finish(timeout, data)) {
-		if (io_req_post_cqe(req, -ETIME, IORING_CQE_F_MORE)) {
+		if (!tw.cancel &&
+		    io_req_post_cqe(req, -ETIME, IORING_CQE_F_MORE)) {
 			/* re-arm timer */
 			raw_spin_lock_irq(&ctx->timeout_lock);
 			list_add(&timeout->list, ctx->timeout_list.prev);
-- 
2.34.1

