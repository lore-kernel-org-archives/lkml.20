Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598618;
	b=oOQJxMt36KsEXRrcfXwAIjwhEq1gGwo6dO4PkCxcDwjeqe7oF/qDv4TXUASVLz9E93/B
	 CaLuhs1x/aZxxkttttOnas/7hvciol0Q/5IDeKjIUuaFDpwXy8lNiMinFOCUGkOM10h+y
	 gn7pdyF+Ll8XMTt4BmsJbTsbGYMwXn3PYwCZ9CUe/UxjdhJQslgUeeuSOJ//CP8UFTpa7
	 FVEc32EiPdbXXPZF+PPlH8eK8eXPpkjAOxLfNYQ9HeOm8DUCtctlBfLyySf+bmWnH+UFi
	 usb8fhPBD+eg8Y2Dq+1PcKGHGCiOa6aB3oL849UxPx+uPwSPc7DuK5hea8Y2kZwAf+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8ItVvwZvGG+Kdi9d+txCXAOFgDEf2Km9Gecmc5ltb+I=;
	b=bLR76G30/zRMucCeTjVQiFHWFHz8GGdXgfAtRddWKfqPhWJgKkLjkEm/75zon6Sg5lW2
	 2FIJqIz6jrWncnEQvx56sdzsgnxopYZUsSsEkQqbKgiHr3Lrksa+KgPkxb9GXizZIq6mS
	 Tl3+0d9XMBpx0RhxjuB1adUhFsdJIiFQWi3X8cUypo3WmVkQK9Zk7DC8vazbE7EkuFlH1
	 A1NohweTizsRZn6+9rkovIPTmrzJ/rLJHYYQiydBPME9nzcU7EmxoGMK4ZwMAqz1CO046
	 vw3v+FAbjs6/agEEMT8zpDbi80rS7WEWI2pLr3qX5t0LHiK0gHqrZbs4JRymjFQnrog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=a6XZ0mbD;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A6606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA2A6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=a6XZ0mbD
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67bec5dc8d4so914983d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794598617; x=1795203417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ItVvwZvGG+Kdi9d+txCXAOFgDEf2Km9Gecmc5ltb+I=;
        b=a6XZ0mbDy0pgWyfRlQvkVd+DzgenIvgbq6yL1LHALdWgeL+295hESdQZlopkRG42Lt
         0Pu15Sqs+b/6IT1wCo+dtPvB13ZvLdHsmAdQz8S09rwv3edtSC/LYENdEsT1sHPfIhB4
         xia7L/H5nkYwvFM+fih6j7iCMMA/S0c8jLU0GJb7WY0HKoWJrh70w+QbsTXhTjpBOmkT
         rfrTpPNlbfp5Z9jfzdya0+ugEcq4a21OlGLJjQTC+ECWMbL0yJcnx0JpPNX3AhTWsp+e
         8HoSytjaNSKF+NqPBhekVyu6Ys9tU7P5xjeAvPjfxlV1U3PJFaidZwIwx/+Nh0+LAspL
         Iasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598617; x=1795203417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ItVvwZvGG+Kdi9d+txCXAOFgDEf2Km9Gecmc5ltb+I=;
        b=iePkb8iDVk0r7fBMTOkGe8b/JhSOkYikTKiBJ5YVst0TXAXrrTlbi9M6DYYU5PXLMq
         Iixs9uoKg76DLytuS42mKDPsmihiAY7JuY/mbGinZXp0v67dshZ0Q7NDhbNeg+3evySV
         ZVNl6Wah0osakwdLQcpGnvAAcxyEKxJlZio3Tk4OfFEiQR+XsVyRDCvXpHeUdBdj7dS4
         3+yObixlSXD3WpgXmOZR5dV0z18QTvtYV7LAXuk1yBVIZDg8Q6qUJjT6fElondyqhwBk
         0UkGsRJJ5uaimjjyNJVehFSL62cxAD4S/258DPwm59Q35cP+Z0iabjU9onr1lEaqguOB
         qwXA==
X-Forwarded-Encrypted: i=1; AL+hErH/to5Jsn03TikPXAmizlOQK0090+hnAZZ87vmHYNkjs8E4J4JJvvZGnIL4j6CI0tdJ9T/UNpBNXPPoKhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u5RvIX7lfQd0QTDfk2TT3BkenJjSf5gvznL98ex51dPboc7b9
	c8a8Db9pv0cG23T/BTuzkbAgBUuhV3cPzYAEjxFWulXWLeKuitHq3ym41g0rdPJM2g==
X-Gm-Gg: AYBFou2xOB2f+fnXj0QiPb3VvkJqbzQEsO/2nkcRyzC0JgQWVkXOpzmJkZtdqSmX5wo
	as2e3CeQgAq2GBWXfK8iCdlWh2XfmDv++BSPAZmq91o/0yEYOOin7/9XZwuDjcA1/BzGsTprdGO
	2LDhnmV37Xmcb7tbSW1xm+aiaRxWXgZzpq9Upwj5XVr4T9HTcvFoCV8zVx9SJfLRtcyqxSzO7Xq
	CWpIVmitwGN1jTW4w12156PCRXfq8vjYqpFzmFaKfNdgXaHj0BJcE+vJfl33QuRwFO8vNaR5hSQ
	Rvfhwdagk67G0hKbwvDJxcqXcWJSu7tWEbwkdVJPpI/6OHZ4Y5Eo+vUK0xdCbSkA/KDhuaOafHy
	jk+0OZHhD3CgMcdrSiRYVwiDhxsGcghY6BBRphB8olUe1ImuK6VWdas47USwWtyHgNrILoo+hJ3
	xC9z3Vd74ZzQ7eP67zM0O+CxC/ekmRtJqQKxCiyoOqmoMz3ttNYWhF7LxYzv94SW5caFeyy/NeM
	+/XVKzfYALOpUoxqvr5Qa5+1jtiavYy/vB47u05bXEw5BeT5Z3fHYEDM1a156GHL127lAO1Olho
	yBicP8W85v2hPeq7jL8QAe6xgtZz+66Eht9BmnA/YIV1TZU5pqQ=
X-Received: by 2002:a05:690e:140b:b0:67c:175c:df7a with SMTP id 956f58d0204a3-67d895a7c36mr2662489d50.37.1794598616814;
        Fri, 13 Nov 2026 11:36:56 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a5ea356sm2845680d50.17.2026.11.13.11.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:36:55 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Benjamin Coddington <bcodding@hammerspace.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tls: fix send() returning success after the TCP send failed
Date: Fri, 13 Nov 2026 14:36:48 -0500
Message-ID: <20261113193649.3822306-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit b341ca51d267 ("tls: Fix tls_sw_sendmsg error handling") made
tls_tx_records() pass the error of the TCP send to tls_err_abort()
instead of -EBADMSG.

However, bpf_exec_tx_verdict() still looks for EBADMSG in sk_err to
tell that the record was not sent. With any other error, the record
stays counted. As of now, send() on a kTLS socket returns success after
the TCP connection can no longer send, for example after
shutdown(SHUT_WR) or after a reset. Nothing reaches the peer, and the
caller is not told.

The issue can be reproduced with:

    python3 - <<'EOF'
    import socket, struct
    l = socket.create_server(("127.0.0.1", 0))
    c = socket.create_connection(l.getsockname())
    c.setsockopt(socket.SOL_TCP, 31, b"tls")
    c.setsockopt(282, 1, struct.pack("HH", 0x0303, 51) + bytes(36))
    c.shutdown(socket.SHUT_WR)
    print(c.send(b"hello"))
    EOF

Before commit b341ca51d267 ("tls: Fix tls_sw_sendmsg error handling"),
the result is:

    OSError: [Errno 74] Bad message

After that commit, the result is:

    5

This patch will make bpf_exec_tx_verdict() check for any error in
sk_err. The send() above then fails with EPIPE, as it does on a plain
TCP socket.

Fixes: b341ca51d267 ("tls: Fix tls_sw_sendmsg error handling")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Tested on net: with this patch, the send() above and a send() after a
reset fail with EPIPE, and a send() on a TCP_REPAIR socket fails with
EINVAL, as they do on a plain TCP socket. The tls selftests pass.

Not addressed here: a caller that ignores the error and sends again
still gets one more record queued per send(), because
sk_stream_error() clears sk_err for EPIPE. Before commit b341ca51d267
the EBADMSG stayed set and later sends failed early.

 net/tls/tls_sw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 226e0f176fdc..f3e496fa47ae 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -711,7 +711,7 @@ static int bpf_exec_tx_verdict(struct sk_msg *msg, struct sock *sk,
 	int err;
 
 	err = tls_push_record(sk, flags, record_type);
-	if (err && err != -EINPROGRESS && sk->sk_err == EBADMSG) {
+	if (err && err != -EINPROGRESS && sk->sk_err) {
 		*copied -= sk_msg_free(sk, msg);
 		tls_free_open_rec(sk);
 		err = -sk->sk_err;

base-commit: ead6fa9a0ab194f02a2f36d634b193e9c5f9a1c6
-- 
2.53.0

