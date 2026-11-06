Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985287;
	b=jmy0aZPp9lQc/2/2ut639BTNTwcfIgH90qDy1LIQGkB1/J0Cqb2aacLJBR3EVx4cHSV3
	 uZpXQOM2zneaETSRrslDmaB+NHSVEVybCfYBbbFSV8Xo2sWhs+NM1rmuWHoU41lZU08PF
	 v68VrrX4g7r8qexRiDZTv+N8eRPfy/D6RG4JF//vdgL7pLhFQ6KuwYl0uNUPUBpygs9wi
	 p7nf6ztUgUw6hfXn/7gJi20pXMJ6iPiBJkhSMT6UDJSnYWTFPV1hwuUx7nCAoJpWW2bV7
	 bRkQTtEnLV8/RsKHlXhCrPcxFk7bi1orpELNwPP4VZTHH9GsqJK5QJfKRWiA0cUFWEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=npSSNgqjeDjy8yeV7j2uv0PIl6Tg9TTaL41tLSP/LLk=;
	b=k4Wk7CxdwQQSm2TrIIDho9IfBtYfSPA4qbu5FBs5m4wEx4iqjPW33aQEvm4VXdAkvQzl
	 FmOFCyFjGEZa1Sjhoh4tdFuuFhc4L/huNHd9M638jQ/EsQeNKH6EHw83EqPCmVPpLmrV3
	 kDzNl3G1E3pccwBrmKqGnTa4LzAK3o6YQVP/SdMhxRYYRWijQv558yvQj0pcAvOgDOA33
	 HKqJBPoGhIzs5+41LE3Ggk8lygZ73x9p2efyqJEg3tFQExdjKXVzTImpwwM9t8uwJqPYo
	 2yTmQjnl5QlbN7pusu5n2tn+Zh5MOk73X4sB2+/3ojWu6soCQrv3VqHWFgLu2TT4r/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzybGRN7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B08B606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B08B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzybGRN7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8195355e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985286; x=1794590086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npSSNgqjeDjy8yeV7j2uv0PIl6Tg9TTaL41tLSP/LLk=;
        b=fzybGRN7Vrij7P5ZSgvy+kjz2qjkPQLHTUD+avlpUTUi+3GXQwFtpab7vPsfLxMvY/
         7G/t5jTCVR6KSoLIERkw6KsBaX5X1B017xkHIFQBVTi9QwVMS6d4O/GJE8WjL0w8fQyN
         F6lpO994JG1Saksrnbk0vIO01qesDJ1IK2z4astuNkvPORb7ElXGnXztH0yt9DiD7DNL
         HajcbBhwT53x0XMnEfNWA0uzRagFhJR+bXvl3QUoUD7RpAPMrRyHGLF4fesvG3AaHIAw
         IJHdHsAWxj80QNhhZ5VxyoqSS+LrZBMsjhhc0SQ/Y8bYjyxAi31m9TsdllbkzSolTel0
         YSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985286; x=1794590086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=npSSNgqjeDjy8yeV7j2uv0PIl6Tg9TTaL41tLSP/LLk=;
        b=urQCAtW5zEdfto2dL9+RoIdGIluSl3ia+UI9cPXmm2GazTRba3l4rKKNTTKZHyUamp
         0SdP5vROlNeSob1rKd5GyYHMwCTF0fD/HaSxBfP1Kp8ebeSEVf1iVO2wm/o7++O+0ZVh
         +s/a2c1QBmGkNsL6p0xFnXKxmRMYyZ5ijMyVHRWCY5gPkn0otPUNj0KztZSrtnvs+Dg6
         lTzJ1Rjjz2qw/qW9G6+wmnUrUxuioIVS7nywyiORzRw+3G41kGGyqKafqRMpUf8fRvit
         e9k8jyb17GrKlGESkFnKrlk2/s45nkii02oJNoOv0v1ww2zN51hQMGlJQtOjivpePxoF
         eqig==
X-Forwarded-Encrypted: i=1; AKwUvBxERpj5mNn6HwLkj5fmKFinYGEOh3FYGle1YfFRq+cRXFAwZtFntDA7hCFYNPWsTl6r8WXklLpaTKnyPrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YsHhFqDvSP7Xclr48wCZ7w+HYb36SORn1leIyY3WYze0k04NL
	k/ZVVXsZ38HZnpya0IaAhexjBjW4YXeBkNko+DL/QSOGvejswNRZEoDh
X-Gm-Gg: AYBFou3t1IA3du3cCCNzxiorPc6an1P8uTLfNtwh/flPkcl2ZqbZPutiqmxHLNfgNCt
	ISLU0ciufBMvbRpgR60HnCBkNpDx0QANirqaJDL48E+UK89xNsLtNpQQQWEPYT0DgwWbFAQM3QX
	RtGTbvkVMoZ1agrYaOgDGOVvTVyXCKE7ko0Ef9Pbu58MQUpPYkTb+G47srQmU7jqKaqPJeZlSiA
	11EjlLWZf1xP56s+iYJn10Sky3iE494M1G4zvYHICq/Ramh0yMpHA+gh3MuybTGW4yyXE09bAVD
	BINCovHGip8ZkLiwRmHLjj+ZIhHKNY9tmr7O9xRUYZlXGfosNu1vNF0nrzcEQh/GLcZG28wrLZS
	7v2PkE9Ypv4p8z3pDlwWn43MiLI42nug0d8SX93h0TOjJ2y0nltMWMptagZPjTjFXUNG7VN//yl
	41V+RF50JIT+5KiJw6aOSMhIC9EVanvuqGBWIB85CbHw0uTN/dTVApusnd/Hvs8dck3dfC9E9eF
	OXE9ia/DYh+heltr0ummr8dL8jfGwdl+kMXsMPAdNBtQ8HRLNUzc0iFbeP3i5lwWTGAibLbYghx
	jVscYCRoU1f6i80TptdT6SNrvfZRsebciTUg1oWqhsAixtqbVjqRWXjIUjLP+GiUwkx52n+Kqq2
	T2BaVe3ftgKiMRBQCCYiKdmsHCLtI7IBWlBMfZw7Ln9DOvge8RGzCzeW/gxVSHMcnjQtSx6zPKG
	j4z5CZar3slQ1C1Y4St1wfzwRExDwl7U+2vNysZDcam1TnX4PNOu6vJu2VYAwkEg==
X-Received: by 2002:a05:600c:c172:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4b6df5e88admr49637345e9.17.1793985285709;
        Fri, 06 Nov 2026 09:14:45 -0800 (PST)
Received: from localhost.localdomain ([90.95.39.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46489sm148071985e9.3.2026.11.06.09.14.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 09:14:45 -0800 (PST)
From: Florin Badita-Nistor <baditaflorin@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 1/2] tcp: avoid false bind exhaustion with odd-sized port ranges
Date: Fri,  6 Nov 2026 19:14:41 +0200
Message-ID: <20261106171442.31811-2-baditaflorin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261106171442.31811-1-baditaflorin@gmail.com>
References: <20261106171442.31811-1-baditaflorin@gmail.com>
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

inet_csk_find_open_port() rounds the range length down to an even
number but keeps the original exclusive upper bound for wrapping.
For an odd-sized range, the two scans can therefore miss a valid port
and return EADDRINUSE while an eligible port remains free.

For example, restrict a TCP socket to IP_LOCAL_PORT_RANGE [40000, 40002]
and hold explicit binds on 40000 and 40001. bind(..., 0) always fails,
although an explicit bind to 40002 succeeds. Both IPv4 and IPv6 TCP and
MPTCP are affected. A namespace-wide odd-sized ip_local_port_range can
also trigger the failure without a per-socket range setting.

Keep the full length for the scan bound and wrapping. The two scans
then cover every candidate in an odd-sized range, with at most one
repeated candidate when exhausted. Even-sized candidate sequences
remain unchanged.

For odd-sized ranges, subtracting an odd remaining value when wrapping
flips parity. The first scan can therefore also select offsets of the
parity preferred by __inet_hash_connect(). Namespace-wide ranges with
same-parity endpoints already trigger a sysctl warning, while connect()
uses step 1 for a per-socket IP_LOCAL_PORT_RANGE.

This only fixes bind() allocation. The rounding in __inet_hash_connect()
for namespace-wide ranges is unchanged, so connect() can still miss a
port in an odd-sized namespace range.

The issue was triggered while developing port-range selftests with
Codex assistance, then confirmed using userspace reproducers on
unmodified kernels. No kernel instrumentation or fault injection was
needed. Booted x86-64 KVM kernels were tested against the regression
selftest, the full ip_local_port_range suite, and a Go net.Listen
reproducer. The Go reproducer fails 100/100 times per IP version before
the fix and 0/100 afterwards with a three-port namespace range and two
listeners occupying its first two ports.

Fixes: ea8add2b1903 ("tcp/dccp: better use of ephemeral ports in bind()")
Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
---
 net/ipv4/inet_connection_sock.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index e56beec43..755fcea35 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -343,8 +343,6 @@ inet_csk_find_open_port(const struct sock *sk, struct inet_bind_bucket **tb_ret,
 			low = half;
 	}
 	remaining = high - low;
-	if (likely(remaining > 1))
-		remaining &= ~1U;
 
 	offset = get_random_u32_below(remaining);
 	/* __inet_hash_connect() favors ports having @low parity
-- 
2.51.0

