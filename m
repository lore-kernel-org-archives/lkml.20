Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283273;
	b=JG4UYDfkBdKvbq5zYbaQ8RPhaPv+KLc6fZueRN1tgaN4EpC+4LWZOIP2V18duvfJ0hIm
	 FaPFktodZoncqN6ZxpfvzRxrnRKVjTy+FQ7vb+HzM4ZcVx92xyJmKECIIOZjn/+6dlzHC
	 bMgLFWoZiqkzPL9W8LlWQICRedC+x8Ww3nTlm/IkjmZ0N6vYaLSlSWlGT8S7RC+qZw5wU
	 tu2xbD4I5STJx6xOYcEIQ/p3OlYqVflDG47dPumUhfP/HLzM6Co0gD10y6jsreXXwlkWO
	 0C9LMFPgOkORxO/P1kQEn57vWEzNx1IDJuDyx+PeWEVtw7CfP6ftiXO6Ahro/bSYkxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=00lZgsWW0CT6Uykh+WSJbmsT91YueScgXuLixivUJzA=;
	b=ywMeQIz+L5Ta3vJXxvQq27f/Pzq6MkO5RGo8RznPo23W0yS8T2zTw00GgpZc/KnBkJvP
	 0QJEyG8nx2x5U7ErpoKCZB+ld9d+Knue8clh3uwFdBAd4WsVuL5Ic6+JVg5iyJGfnfRPo
	 zcOTmPqJKxPmfWqcEL7OqW9YUbIFm8vRpcMNbB2wUMq3DcxtsMx6NqQjJRcjf2T+KhpsE
	 fkkvS6Ikt2V9XTbGgWUILeohpOo6SClYIieyAvzpNBRb1g9/vBm1fjPUIdAffWo3vybQB
	 LbvdlMVDC0VeBFpFQ/gJIAp1J1fTFDURAY2qwuJPRtBxPrAw1yieX1uK/N6DrXcjwCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uf9Bfqyn;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0931606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0931606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uf9Bfqyn
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so2906494c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283272; x=1793888072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=00lZgsWW0CT6Uykh+WSJbmsT91YueScgXuLixivUJzA=;
        b=uf9BfqynQkU+wiqJVzlGfJjl5YteHO5oj8ASqeDQ6IC12ermeFKj9c8hWsbcd4+P7z
         Y3vO6lfEVerrSdq9CAulTAn+i6sQeRptE2yiUYHJlzwDS9DSZuKRi40CPal9AiadRpwQ
         IiAGsSZQRyABq+4Sw/SsIsz2pxfA4zj/IgwK03Av2x27WhvwR86eGQ1LKwoXCTZbMZsx
         Eda3HYx0Fcaj1Yh3KeKtF6ECDyw/k9AZBWEWg0RNAza7UrXDD0Uq1IhOwmvgKPuy6zxO
         4qnfr9UiOmkCg9YudsR9TuB7J5cTMHQrw8E7EyJ+gMkasXWvaKNHgpjNwLP7glWZ3G3w
         kwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283272; x=1793888072;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=00lZgsWW0CT6Uykh+WSJbmsT91YueScgXuLixivUJzA=;
        b=lw03tboL2uWS3l7lNBFf2aPY+M5f+aonfjvHwvfwiHo77PJ95F56ZUL2D9B0yFlEFo
         y4MKNsxE8QjYs0ZA5kAa0G7gtQ/7J998Te7XDZ3m6bYwMF536+uPZXSdJRpCz4Imk7v0
         aC0HgzY/u0f9VovOWGz8Cf1N/SlWNZJYZHhxbztTQNxGYNC6IhyJTLI+HIsThgPgHkYX
         6Sqvi2/qv45r3QSKXDKLr+b0BDa+hWZ/RNh6g4ta76KzNm+0NQ4fk0rhiyL3XxTvjExt
         cbHfhd1CK5zZI14XbnlF775GJW9Fof/FYyRTbK3iRuLgC6IMMYnx3FHZ76/FveCf14bc
         oJBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzC85dqntp7Hl5Gl4D/fHauPVSLOSvwomtBX3BbnSrb3aa2rsjNY3UncGJ7J18BZ2m/TeTDpn1u0SDVVB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoWR09uonq+Y2AHqd+4OABQv1DHxch8K0qpyjNcn58M6vqKdrL
	8RfutPB4hK3jxqlaiW5fFAS7q7Ow4MEHfGUVLHDnGQqg1Sq346Hw+a7uQ4uFyKDk
X-Gm-Gg: AYBFou3LSoI6paNJ8zgF8lI3mDkP8B7/LMQlj7yff77SakoNMTA3yriMxFp85aqF0n+
	D7mXXUPcU6wChMogODqUtbaamgvDi9Fbs5v6BE0iWA4P/qnFl1/gR5lnMz5Nj+8PwkBX6JAoG7f
	8AQV82whohhm5D2LHul0P9llvP4JJBx3WQBNV2AZ/GzUR/SIvC56n+TTZ7dsybLfueKr32m6sMS
	uKy7EqZzUcCgHW9bLgO+1p2HF+eh3FDtQggnQy2njyr23CKM10YJLXAOoe4bBzXCX4QsXCh+EPT
	MFomnVrMxIVk3YJQ2E+R/KtBdOumg6V/mg+lalBMIXywAA/Ox/MIpNSrHAhxtkFvaExiTjacOyX
	3e1Z1cBIH5mBUKwueNxLa2hwOI4HTqE4ACyQ5GRqBrOH00Fjd1kfbkY83T3j5kIPsQ/QrP4Evzm
	vmOucHd6kjuCm1XJl0LaVet6sAASLyvBxh10pNraJdTCHp3qgF9IbIpAsPfU9vBpUKFsqBUnZZ2
	WKKjvXX/gzKRIvDacg5WKxolwETWthA48sx4FPxiHOTZuUvVtehiqucqMVBrhNltcyakc/kuwX/
	YiV2556fW7mutR2Y4anlz0bNHwXu5Ye8WrML8MeGahk7b9D2+uTz6g==
X-Received: by 2002:a05:701b:2616:b0:151:2e62:fe4b with SMTP id a92af1059eb24-1a6ce4ebf97mr6501352c88.23.1793283271761;
        Thu, 29 Oct 2026 07:14:31 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:14:30 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/net: fix multishot recv length limit accounting
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314078.648427.10086632105828535293@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

io_recv_finish() debits sr->mshot_total_len with min_t(int, sel->val,
sr->mshot_total_len).  sel->val is the cumulative byte count of the
request: on a bundle retry the receive path adds sr->done_io back to the
return value, and the bundle branch in io_recv_finish() recovers the new
bytes with this_ret = sel->val - sr->done_io.  The debit therefore uses
the wrong value after a bundle retry, and the int cast truncates a limit
above INT_MAX.

For an IORING_OP_RECV multishot request with optlen above INT_MAX, the
limit becomes negative when cast to int, so the first completion debits
the entire limit and ends the multishot with IORING_RECV_MSHOT_DONE
while the socket still holds data that covers the limit.  With 120 bytes
queued, a 64-byte buffer and optlen 0x80000000, the first 64-byte CQE
lacks IORING_CQE_F_MORE and 56 bytes remain unread; the same setup with
optlen 0x7fffffff posts 64 and 56 bytes with F_MORE.

After a bundle retry, the bytes already debited for the previous
attempts are debited again, so the limit is exhausted early.  With 1400
bytes queued, optlen 1000 and buffers of 600, 100, 100, 50, 50 and 200
bytes, the first attempt delivers 700 bytes and retries; the second
delivers 200 more, but the debit accounts for 900 and finishes the
request with a terminal 900-byte CQE while 500 bytes remain unread.  The
limit could have been reached.

Debit only the bytes received by this invocation, sel->val - sr->done_io,
and compare as unsigned so a limit above INT_MAX is accounted correctly.
Non-bundle multishot requests keep sr->done_io at zero, so their
accounting is unchanged.

Fixes: 0ebc9a7ecf6a ("io_uring/net: Support multishot receive len cap")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 io_uring/net.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 66e637a..79af1f1 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -881,12 +881,15 @@ static inline bool io_recv_finish(struct io_kiocb *req,
 		cflags |= IORING_CQE_F_SOCK_NONEMPTY;
 
 	if (sel->val > 0 && sr->flags & IORING_RECV_MSHOT_LIM) {
+		unsigned int this_len = sel->val - sr->done_io;
+
 		/*
 		 * If sr->len hits zero, the limit has been reached. Mark
 		 * mshot as finished, and flag MSHOT_DONE as well to prevent
 		 * a potential bundle from being retried.
 		 */
-		sr->mshot_total_len -= min_t(int, sel->val, sr->mshot_total_len);
+		sr->mshot_total_len -= min_t(unsigned int, this_len,
+					     sr->mshot_total_len);
 		if (!sr->mshot_total_len) {
 			sr->flags |= IORING_RECV_MSHOT_DONE;
 			mshot_finished = true;
-- 
2.34.1

