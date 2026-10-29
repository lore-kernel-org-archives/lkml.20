Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283248;
	b=oVIjHPpygBkWTUv8D+NF+tr0c2CqsXA3hP8yKljykIGeYHwF0iQ3xCqgnMDyULZgVfyk
	 GNxMvoZA6p5t0P4q0ld1Oirw0HtR7TqMW7k+0PzvvatLtGbeuuYEezccBpNx40USob6rK
	 S9fzc3GFDbrVq+sS6M/krQiZA/cVtnjpnosnS5ZzM5WfZOLrDOKeUXkYxLaVOO4chfpbW
	 6SPLOpvcI8qyY4pCsQ8tSxPKlqSRjZbNSTAvooZR9dIBlfrNKQg8j3nSc+3HJ82wMoXHp
	 Qly2QIeOPNJY/2yLOnbNO8KQi9sS/r9R1AhN94zUb97O1bqTuWujok0woPKLSc3pdPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wneFayV8k/HtNzsfaZR2kxbDT08YnIr1bVGtS9YLVJY=;
	b=Et7kDm2EecN+bPzDQMpM+qOz5jbgWJrNREOGH5M26NBebmwAHr1Cc/zTCYViVJ28HN9B
	 3rlrFpoXhZWxD8WKNGGMZ7LFEu4hGy/HqLGN5o4rO/B+kSmaFEyJXHkc0tDCtj6ydwu/a
	 pwPZIl7ZSpy7/HQ1/K2sPjgmGtb5VfVK1c+wx8KqYIq8eT9qLGg0FB4lGRhMl9wzOIkKy
	 pRe4QCIZ2QgV0uJkbeE3vYIpaTlZ8daUYqK+c1AWtC5W1pDFiYfxCCjBFOoXcxJXleGZG
	 XgdEK3HxRXKG43dzT+IpaYxbYZvBCn41o+/dCm8XEdez6ouZALyOYfGL6DXm2XaA5mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tt4jl6du;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F192B606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F192B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tt4jl6du
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2953855c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283247; x=1793888047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wneFayV8k/HtNzsfaZR2kxbDT08YnIr1bVGtS9YLVJY=;
        b=tt4jl6dutspAaYqtKRMFA/8QObZsHgQVcl6Pf3GKtvE/+dIEuOjFjCoqphIEANyVY0
         e+R+3dovah4+8y4IFaoWQfLyPuCI+RbZwSFyAtdQJSWuCM7eVOUYyPGMDMeIV2/cHkrF
         wSpyC8s4VwcTOtANA9hwXwdj46DmpVHR11nfLyheB+qvWiGFdofxR0Lq4iG8yvBiqvQI
         BDc2ZAeksSLjZJwZWjwWWevMmPcjHtpmhVmDlbYJBK+RPsfgP661UXCr7eiH7bCM1cn1
         6hFrzG5X8XaZUCskcj7tP+QeQr/c/nlA7vwpF1e7V8TuFo08C5kIrnYd+xtBzRBHXCx/
         J0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283247; x=1793888047;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wneFayV8k/HtNzsfaZR2kxbDT08YnIr1bVGtS9YLVJY=;
        b=GDkNnphNq2hRgQhQYz7OUtVeNx1BbJPag4MA1wH4B/clgIJ/3aBhIYX9qJkAM3njXJ
         Oqg8tRgH3GREnQCKbzd8zMzCCMeh8sYCXx8kA64ZxRmAGxKPDLsvurQ1emh8KsviAuhz
         fynDMRnFQLvNif3mSVhVjKG03dLFHHzfgOyBCWFtFVcEafP9+TQEArCzyUXCthxMd9JQ
         RjoBvtmn5h0M+RvXn/uxxpCOXcyn/K2MmM9E/33lOV0qFJIzpls8N1NfACd2VhJEQfqr
         wliCjGGqm0Bpa56MP50l6CG008ns06J3czeFJ9ICqEDuynBewIKtX8nkeDRJ4y/GtmUs
         AGKA==
X-Forwarded-Encrypted: i=1; AKwUvBx4gwzkDuklqGIXEpLSq8paSXXRtBlBgOrBTghNIKOh9cjAu95JtrHN8N7JPZwEQweTK0vlQUAIBFsIBBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYItzyHLJIJMjPz51WQKV81gSRxkCveEJThLngIH4Kba/OmTnwQS
	cMWYNCiXm3ZwPuB9JpZpvoywcKDopAzo48av5dsYvAuby3DodTx/dAU0
X-Gm-Gg: AYBFou3Ia8gD7CljyjQGEf6c+z4OEztK27Q8BMBA/mlbPYZncz4w8zpCvPsLyJxrv18
	agfyp6PlA3T28DU/AaS6QI5K4Tdy/uZfUWNZeNYlw632NqgacDXJhD9ysc7KA2z7qjaZWo22OF/
	Fc6QBvw09AGhDrKwN8Znw1qft7YYT6XvFn2rj3CKZmHe3uHNibfwM9/kR7BuevT6oZv8c2UkekZ
	GsWNhB/kxl+Il7fQnZbJ6Q6cZfrk5SZkEG+KqEp7FtlvBWVZv5oYaoHY8hQlm1DR0Ixsyvxg8Oj
	pSeumoQQeX1VBcSU9Fw3321PYELsnFX2605Mw9KjVRtfNH18FwQp6qmwvEoAnaFKFHscoknhJnj
	DOiIx2Uu5/1XDVVia7JS4on+qDVp1nSHd8xa0Mm7tiA+aFo/Y2sWnDsXfg2rxqHnVwnKLsAfnhx
	MdolWl5llyKYcRmel2scj7zD8Jmg9gw/+v93FGuBLXL8OJ4JwPtHDLGCMfLgiGR0bM6lLdwAhX9
	F/QXzZeL4ZPCMEaQWQBqWUtOILI9Kefz+9HM6kcwgiFSVYgA1kdQCC+/GoE57bCIkVQYKqzyP05
	zLo0b279bOVAWILNRpOFAwLheY4gQeQNm2WJKNxEJnkPbB57dkzyIg==
X-Received: by 2002:a05:701b:2511:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1a6c7d2c428mr7145915c88.4.1793283246851;
        Thu, 29 Oct 2026 07:14:06 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:14:06 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] tty: n_hdlc: fix duplicated prefix on partial writes
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314077.648427.13745367584859897488@gmail.com>
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

n_hdlc_send_frames() passes the whole queued frame to tty->ops->write().
When the driver accepts only a prefix and returns a positive short count,
the current code puts the whole buffer back at the head of tx_buf_list
without adjusting its length.  The wakeup callback later sends the frame
again from byte 0, so the prefix already committed to the peer's flip
buffer is transmitted twice:

  DUPLICATED PREFIX: magic occurrence 5 at offset 19968, frame index 4
  drained 36864 bytes, target 28672

n_hdlc_tty_write() still returns the full count because the ldisc owns
the queued frame; the short write is an internal transport event.  Drop
the written prefix from the buffer and requeue only the remaining bytes,
so the next wakeup continues where the driver stopped.  Full writes, the
-ERESTARTSYS rollback, other errors, and a zero-byte write keep their
existing behavior.  Clamp a driver report larger than the frame to the
frame length.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 drivers/tty/n_hdlc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/n_hdlc.c b/drivers/tty/n_hdlc.c
index 895b850..db2103f 100644
--- a/drivers/tty/n_hdlc.c
+++ b/drivers/tty/n_hdlc.c
@@ -288,6 +288,9 @@ check_again:
 		/* pretending it was accepted by driver */
 		if (actual < 0)
 			actual = tbuf->count;
+		/* a driver cannot have accepted more than the frame */
+		if (actual > tbuf->count)
+			actual = tbuf->count;
 
 		if (actual == tbuf->count) {
 			pr_debug("frame %p completed\n", tbuf);
@@ -304,9 +307,17 @@ check_again:
 			pr_debug("frame %p pending\n", tbuf);
 
 			/*
-			 * the buffer was not accepted by driver,
-			 * return it back into tx queue
+			 * The frame was not accepted in full: return it back
+			 * into tx queue. A positive count means the driver
+			 * took that many bytes of the frame, so drop that
+			 * prefix and retry only the unsent remainder instead
+			 * of transmitting the prefix a second time.
 			 */
+			if (actual > 0) {
+				memmove(tbuf->buf, tbuf->buf + actual,
+					tbuf->count - actual);
+				tbuf->count -= actual;
+			}
 			n_hdlc_buf_return(&n_hdlc->tx_buf_list, tbuf);
 			break;
 		}
-- 
2.34.1

