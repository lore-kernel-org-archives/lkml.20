Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740241;
	b=s+lfr4auLAiYcAVRX1qigaqmy57T5DZGY6nv4VagI+cVDt7Yvyvp/mK+cmjpZeKC6dUB
	 3sVLoJo7bNh947fiMLwUlQiF4NtVcW2Sk51BBDs36g4O1guWxT0arprAg4q94eQ9yrIJV
	 ws7heQV83lotA7AtKQYc0/xRPjDE6LoVxEtg8ev66mwxU67+fK2Eheez+XKzqRiARXf1R
	 il//BuI/uuOO7FnqjYzYa2XaR+68OoEw/0ErHnn+JG2OIGYAAGWiowbMBrN0on8/P4XR3
	 P7zu0+SVaZwV/SgvRh/lBL1fJ/PCKO3iV12g3IvZbcFXP6fGXmBxA/qVjU1RKgCO8wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kzzs5voJ/2XMZZYDH2tlAPLtXKMaRp+mqcY1ScX0xYg=;
	b=zixgOndznMfW4S33uAlIPHm5KXuM2kcYaA4zKVGU60R0CKkh4jlNacuZVtuOPQC6CdEG
	 J0P+4mPWtlXONX3u7ylLMi5gzb5/v5AcnZ/1FbXkvnTG6A+AvjiKMdZQuHvidGgrVTaIC
	 72V/A9ASQKWbDhjA/5cMKVlGthglEsiI60EqkCidb4iJrj8084YO/qIXfDxJf0zjcRLt2
	 DFYt8LvZoy9x6J8mo4cDi0ByWNXKtry69UfKfNwsZGdvUrZtROp4pRq72eEOTCPhQMvRM
	 o/yBUi3Qu8fTEV9SE8WzqaeMpeR39x6t1SU5ruBs55e6+S7Mno8835SiAqp/wDsJglg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eOTWrUhF;
	arc=none smtp.remote-ip=209.85.128.99
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com [209.85.128.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409B606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6409B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eOTWrUhF
Received: by mail-wm1-f99.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so6726265e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793740239; x=1794345039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzzs5voJ/2XMZZYDH2tlAPLtXKMaRp+mqcY1ScX0xYg=;
        b=eOTWrUhFUtjRWxeqL3PaSxcNBti0f689lXJbcyGVFEy10UyO5mfPtwGmCEy8x6eK5Y
         Dj+8Zie0klgzeXObU77zrgUM7qMz23kkN9cg5lUCm/v/fwANokl4XYsNY0cCgUZ/NFJi
         scOJdL5JUGzWK4Y4zuop4RIqvXO62GgBIuGeHRsHnru1zLVdv0erMBgd8OY3lu1va35k
         pBNNkeYe7ac+eUq2cz7lp4hpEa7FP0LreaCfNxgdN0USMGyoGxIxVDwPdtcOnovJvUzH
         uc6qs65OXBD7NmRDDuRkW+83VVJs4+LaeQod78Op8qe9kdvw6Ur/utCnHqaKzDcKfogm
         tdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740239; x=1794345039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzzs5voJ/2XMZZYDH2tlAPLtXKMaRp+mqcY1ScX0xYg=;
        b=bbrftVGJyQCrlbBO5tPaVGxYiedp7HhdFDSmQ7b7UB5k2ZszyWsxBHrKxIhqmISpk4
         fEQmhi0Q0iEvorrN+DuDV3gQfQXs5B0uTFFgVImd045k00KLYNCuO7EcK0ayTS0bvXq7
         GTf80WjJHySQZ2xq10fhS9J4rz5YyD8oGwxvV8af+eQtwX7Ya6aPwwzmanICFqOaKee5
         iTNAWjs84WcJEgySy3YhpKgxAa3uhdC0fyPcoVJlPVSIMMOseqOaMguiBzAXD207XKvH
         QXhGOjKGdIctlXIEwGZtcQVeuyrjLh9IFvXJehVe9ITXhuxJ/76yVVAjH1GuP9TFcjNw
         QnZw==
X-Forwarded-Encrypted: i=1; AKwUvBzd3cc8a5N93kVAM4D+QyTcnb5nEG/q6BdH2tKMPR2iegTrxkvtqHsfMYGbitvKRQJy3Jen7sh+X8EmCGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yYX4vH632EWtDun84VhFVSOxD10gT48VELBYx8mJuUQJO2WEd
	zFydLw0rkCLkieqaChUGu+lzFSmz1juhJ8MDj2NZNiugtS0zzOMbefb1e04DvprcN1iGrHOxw2C
	MefPO1dqE+drs7Xfa99hQWkgWEjHlsOuZqJKZ
X-Gm-Gg: AYBFou03QG8yR1oeSpqcLYxtx0U812CB9igSThFQwrWn/ZxuhFbhkM/wWVgAY4lLtJm
	0RkvYt1sIGq2ydq3t7dFqlDmJ3zCGkdt9/2GOR3zh0iLhDkybrd7gtaVsAV3Xfh2R++xK+gcLrz
	ucSOKqVeTShz06PxfvaeJ50LbSOdsy5RVR3ejAzDLWhdDgR9fr0nNrGFFlhsQe6iA/V6l3rQp5Q
	HhcZKo+NHV29ZJmQxPneoe0LF3PSenvzVBPYhrC1/9j+vcz+/LtP0zRSAbdnOVifP2gup23g8kl
	FguXvlaWAsJXt0LD49Ucnce1pCLDsYQZjyZjSbVzJVj6wAc5yQPjmrm6vGZZFuEa6ipktElKkTh
	i6AEfpAqjmU7SK8HBKIhb+VWSVPsuymQx
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr250973555e9.1.1793740238772;
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4b2b00ce407sm7997295e9.0.2026.11.03.13.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 5BF554395A;
	Tue,  3 Nov 2026 14:10:37 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 59A8AE40437; Tue,  3 Nov 2026 14:10:37 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 4/4] io_uring/futex: avoid ifd NULL check in io_futex_wait()
Date: Tue,  3 Nov 2026 14:10:31 -0700
Message-ID: <20261103211031.592745-5-csander@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103211031.592745-1-csander@purestorage.com>
References: <20261103211031.592745-1-csander@purestorage.com>
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

There are two paths that hit the done_unlock label in io_futex_wait():
the ENOMEM error path allocating ifd (via goto done_unlock) and the
futex_wait_setup() error path (via a fallthrough). In the ENOMEM path,
ifd is always NULL; in the futex_wait_setup() error path, it's always
non-NULL. Move the done_unlock label so the goto skips the ifd freeing
and the success path can free it unconditionally. This also avoids the
need to initialize ifd before the io_cache_alloc() call, as it's only
used if io_cache_alloc() succeeds.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/futex.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/io_uring/futex.c b/io_uring/futex.c
index 9c7d384bab9b..e0cb815fd37a 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -317,11 +317,11 @@ int io_futexv_wait(struct io_kiocb *req, unsigned int issue_flags)
 
 int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 {
 	struct io_futex *iof = io_kiocb_to_cmd(req, struct io_futex);
 	struct io_ring_ctx *ctx = req->ctx;
-	struct io_futex_data *ifd = NULL;
+	struct io_futex_data *ifd;
 	int ret;
 
 	if (!iof->futex_mask) {
 		ret = -EINVAL;
 		goto done;
@@ -349,16 +349,14 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 		io_ring_submit_unlock(ctx, issue_flags);
 
 		return IOU_ISSUE_SKIP_COMPLETE;
 	}
 
+	/* As in io_futex_complete(), or failed arms would drain it. */
+	io_cache_free(&ctx->futex_cache, ifd);
+	io_req_async_data_clear(req, 0);
 done_unlock:
-	if (ifd) {
-		/* As in io_futex_complete(), or failed arms would drain it. */
-		io_cache_free(&ctx->futex_cache, ifd);
-		io_req_async_data_clear(req, 0);
-	}
 	io_ring_submit_unlock(ctx, issue_flags);
 done:
 	if (ret < 0)
 		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
-- 
2.56.0

