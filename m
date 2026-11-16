Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857511;
	b=u+UZuC+9IvfnUIkpBfqhiESfvgGQ6R5F0TUZpCvMRQdvAePNjKsKG/zh0OG18FktbWf0
	 W3V0B3ABYlZwtzbhu+igcG+lKbaBaShJ/NLMOgqXb45d779ZYJ3xrOs5dWecGagPxqDhg
	 7g5gQOasAGm4r7z+GKvbKwSBd+svtjhx9dc7NA5h1WAnGIj+sziT8QCTfsRoBvv1EMlFu
	 mQ4tubIJt3Z5+qYmnnTX0nNZ8bkdixSrscZuZpnzhSiqVtl1mEWJdFzKMs4IeKSLqlxFR
	 mjO6SLpnbvyKJOZjSDu31BLMm4WWJ+sbsyKpWstZo/AJ6hFBLa/yUIqFRVVDgygZEcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GRJhsAcI15idx0cLc3j7efy8qNOYnMelLH4aXWx29N4=;
	b=Z7wPH6z+0scTawZFG41XS+UtnOWVOMB+ljRRaM4aXXEKKnapQPXFu+2zqiKeuodHTa50
	 mtO9X0SYZ6kUY5UVQbdNjmz8ZOSu812FeSLrYuTjY6ZDhD+wYLTipv2qn9yvoSoYB6pK5
	 xBekZ6wMbwuchNfpH/UIgfV8NGUmjDmLaruvpJ2IzCEdL3QPc9sEpRtJMGS/9qYYQrLyv
	 y8vmTqLh3lYQjbWnmBaXl5D1OkFDqfNUErChfEvvhlrek5ENNORMM3kToMKSodigBehco
	 wawG/4JrcapP5SsNeYW30fpOJHqBWYgGXYTLYBUBmbSHUKhrEnTw9TowKVfj3iK85Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arYGXhR9;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06667606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06667606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arYGXhR9
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb9f760337so116910a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794857510; x=1795462310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRJhsAcI15idx0cLc3j7efy8qNOYnMelLH4aXWx29N4=;
        b=arYGXhR9kkD9xsAwOGi+AbeNo5o0hng0zmC2BWsww3vebBxrH2r5JnEaxgv4/uf6Sm
         1zh0imNKqytgTfMXAnsm/UBfXnn8y7p6jGQF1Gn41uZzqBTvBBdeHPWaVNfj2Hdga8N5
         v8aja3WNbGRXk5UIJNt9F9gLII6cvvEqQn/jiDP9abzvE0kEec3fAHTidodISySfQ8mA
         /8Y5JFL68CLBpyA/6g/53KuESnJGE2DfuAtylvGcpj+dBs5pgxvL43PeU5swMMzFCDfF
         xgDcDz8wP/AVdGyTl5c35f3h8xBSk2oKHuxKG+0E3oTRGHejWrx84ApdjzXfVd07NpdQ
         yU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857510; x=1795462310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRJhsAcI15idx0cLc3j7efy8qNOYnMelLH4aXWx29N4=;
        b=Vrq02K9hb5oLrpxj/+vhB53Y/qFhzko25jSOQX/ynk+y8qHVC5DQTLfbJU1vo0Ky2D
         zHpSp9z8gOUhiZLnvCgji9cWcOyumkISgcF/BsefCwkB616JlMLg94BlEKfECyzLxjvS
         yRMHfORjgIImMPnxB/eeaLYQqZGmok8cJiGE4jTN/Xb9HkvGbZ8AxNgXDAYTl2OzWF6w
         sK2njmGQI6sWSF8kY3rTyelIwPAmmtTP5Zw9qfq7NcDCMU/rOZ9H8Szb8CWu656DSJ8R
         RUcHE6KCYl/qWFrvnuif1UhD8eeMhaaQfO3GvZEsZQj2JaHKsx26DfJE9Uk+j+XGe7n/
         +Big==
X-Forwarded-Encrypted: i=1; AL+hErE5R0YSEMnOgO1bSQf/cgi50KoLlck9pHxjtZRjO1wQS5xJVuN47X7Tx200dLchulEM1I3Ejc9ri9Nuozo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SecYRTE6SvIVodL/nmwF14lsgF25YyZJvsT0sThvmj1nzu2FA
	OVHJE0CqC05oCsHtyCTlpni1CQEti6MarJU4B9JGdmybQm+WDH7ugaMB
X-Gm-Gg: AZFdTZeYNoIn/avb/UH6cqnlLpgmg6Nz02GTWm8W+NZ4B9fOzZ33iXt11uZU6B5qLpA
	8glbHVayJIHWmKI/A/25u1kCcPSAIUksdOcLDSY+qEnDRdv4tx8+69vdBNz7jMSNDwUib9x8kD9
	bPGh3iY7qOwuL4rVD7qL7RKrtPcUk+HZbfFbUXoOSJSRS2ehnPZLdKrDVPX6iX96q75mFYim0/W
	vu0NcFZgRbuNm9MQeO52gN9k+l+TSynhLTv7YV406JDRGCJ5dOWToW5gYrQqaaDfJZvwr1QTFGI
	TtLu3Iirs7vs6riLJnbdQZcAPpi/jh+2DbOv48wDoBcBorJNwvs8ynkaIWE7WLq8fx32cNfAvxl
	zpsdzmtv9TCUjKcXW9QJjlqOPo+duR0O/Cp0Wg4FW4qZ63hm8UZf+9NkgBW7l64eB6B6WZW55LU
	NGGOWFG3jKwtj4l4xRBkX/XA/yYxzZNTzppNjIQDhaEDOG6rmv15eOpM8tlTGsiSYboGavaZbKA
	KdGkZ1eMaWI2DK4wvoA8gnlmG5lQcKKR1mQaZB/UQQ+Tmx4EsX+3HJzGxdlSKnjCaNAlWbNTk25
	RK1NPrNAKN6jqn62E+M4nP1frgwnAPJid6pf4DtMsDLfAZ/mWxtjH9tzBmpb4Q+eDKLE6LO1ymV
	YpUNXYqrY8E7GQT4dosYBc3zaI8aa9Xonz4uz5mdJymCsyWFh8kTcOFB/pS4M2eaSW54sm2atcY
	lfIUmn/qJNUiSE/w6nx6J8froPi+g+0Zk6MvBiVRpV
X-Received: by 2002:a17:90b:4d06:b0:3b1:bd6d:fcc2 with SMTP id 98e67ed59e1d1-3b3abe7e796mr215871a91.40.1794857510114;
        Mon, 16 Nov 2026 11:31:50 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe77179sm539396a91.11.2026.11.16.11.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:31:49 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rachel Menge <rlmenge@gmail.com>,
	Hardik Garg <hargar@linux.microsoft.com>,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v1 1/1] io_uring/kbuf: initialize arg->out_len from arg->max_len in io_buffers_select()
Date: Mon, 16 Nov 2026 19:31:46 +0000
Message-ID: <20261116193146.65315-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
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

io_buffers_select() passes &arg->out_len to io_provided_buffers_select()
on the legacy provided-buffer path. Because callers initialize
arg->max_len (from sqe->len) while leaving arg->out_len as 0,
io_provided_buffers_select() sees *len == 0 and always selects the full
buffer size buf->len, ignoring the user-specified sqe->len limit.

Initialize arg->out_len = arg->max_len before calling
io_provided_buffers_select().

Fixes: 35c8711c8fc4 ("io_uring/kbuf: add helpers for getting/peeking multiple buffers")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 io_uring/kbuf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index abf44f5dba26..873d66a06b36 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -370,6 +370,7 @@ int io_buffers_select(struct io_kiocb *req, struct buf_sel_arg *arg,
 				req->flags |= REQ_F_BUF_MORE;
 		}
 	} else {
+		arg->out_len = arg->max_len;
 		ret = io_provided_buffers_select(req, &arg->out_len, sel->buf_list, arg->iovs);
 	}
 out_unlock:
-- 
2.43.0
