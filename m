Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568001;
	b=4kFyrfuFtZjOX9k645NLgEwasCEv/hpJKJind5qJoZjj7xOZLyrujaRk8ZjEF48U+35B
	 PRrpW2+YBNHYRMAfnIPgo/l2js3gjqb1VQbMWqPBNm5Ktisyd80P2F9cjjGIr3jD1L9Py
	 Of9yn10te/KnH8qw2/jXUfh5WVjRiJ1YZY7u+EzFyWASM5JyoXhiu+/ZaeT+84TGyZHAV
	 YwBIjd66KnRkk056f2ewRsKqL8qBtUqDkvvRtVlgcmF+Wgesh5ypScKs4aMtUxjqVYdgD
	 AebFTiOpPKINyYYtfax25FFk16/2qdr9pkW05Y3lGxG65niYJKn1Zomd9bB5272fmcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=epyalV53Yd1ayP1dh9BRgh3jBqUbmF5KVHB1Kw/mzLk=;
	b=1HKshBeL2Vhqg53ZQ8clJGQ8AGglxjYqg2OXuDm7sIvQvA5rfSiCgg8ID7v06a1k+g5O
	 icDemafeqegvHhz3DzCN2uPVLVNkhPrE3Dr6IBqGu7PfONhM09uKi87QHz1WYTBBenLJf
	 Nb6BqHa2dzkCbNRzUKs0TaxfhYQnw1Due/GhiiRVRl/Bq7mR1fxSl0P8mPfS4qxIf9l1k
	 hK+ClREj31F/BsI8D3RlNeFtlAdeqXNuKlDCkpL1tY104Oa3ZicOEfIvbBM1im8gVAmJZ
	 LkAIwwNqgf9h+SXHHjxRqCjcid4rtwqzm6tYPsK0H4m8k/V2fUAsSASoObWSdkstQlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riptides.io;
	spf=pass smtp.mailfrom=riptides.io;
	dkim=pass header.d=riptides.io header.i=@riptides.io header.a=rsa-sha256 header.s=google header.b=bdLL6PKS;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62919606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62919606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riptides.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riptides.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riptides.io header.i=@riptides.io header.a=rsa-sha256 header.s=google header.b=bdLL6PKS
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso2915905e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riptides.io; s=google; t=1792567999; x=1793172799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=epyalV53Yd1ayP1dh9BRgh3jBqUbmF5KVHB1Kw/mzLk=;
        b=bdLL6PKSPa3VeSTm1ePhiSezv41ffNVfJB2j/PAj/vaHy2gQmfZIIRUI6eaY8aIQPV
         qF1G3RWUSxq0513CVEkBRnkxAyrdNXbNMAU9OvTNrqpU3QhmPk3s+cpkxLZ2xycepDIE
         ufUU/TrUzfJxQG7XqN2Jwc2B01oCZmh9oLqLGxsaf+SaXniEFbKY8sgCx6o8+qE55r6t
         AzvwXi4zJqUUMeZ55ncwQ+fgvyy/I422DQGviTqDMafERRv+BExm573DzW8ZKkBGqMY1
         F+HpKU5TiYdCBwzDzOdQtlfSSlOir1OIOJXx9EUcm4fBo36mFcuOU6UX7/dcOLY5G7fb
         bhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567999; x=1793172799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epyalV53Yd1ayP1dh9BRgh3jBqUbmF5KVHB1Kw/mzLk=;
        b=FHTW2KKSrOncIfpnzyyZv7uWMXLWDitsUJkC2WRWge86AIeML4e/2VG4L/yvPeRJTr
         0MMQKwT7aolNPUuLADgnzOMk/wUj6KHWBgVrSmhfbG8YPmGuVs3pMll/k0e6mnjRgj0w
         SoJbBcIKan1aXLLf37+S3RVrv7Nzb72dWHO6bPwHBM3AslNKKVUJ2OyYWTAYJw9UBwRK
         CnYxmJUw3dQzwJ7CzGNQQWnYx9okTPeA8JHsuTgWpcYceRKMhceCjcQiw7FxQeQN+NFf
         QG2zoMaxfyHvBHVjejr2NE7kYgZRkkTtZiA29u+50oKBhWbWeafP9jspL3whfIUDqXi0
         4Vwg==
X-Forwarded-Encrypted: i=1; AKwUvBwEnlWMGgBed4jErMyKwrSnrdM0PUEOD16dVfd0EHrrC/Yf18gTtiAtSkGvAtkHdh+bJwO6c+KALZTBxqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7rZu+g1xHTX8A+PkjqQsvp3+Le4ULyG0vy81D513ULVgvV6e8
	v3Ir82nHSA704knHgzFfuaCGeD4U65A6ZrXBnwo0OlPOVwsDh2IKUy059PStyU1IRvQOBg4AW0c
	G2uMyN1xn4w==
X-Gm-Gg: AYBFou2WMzQi6BMIQdqQ5q5GXJInNN2lkae2HFEAI6Vsrqb8L8UD1/ilR7t29CBjxLH
	9fydEsEL20o7k3vql2S/xKAGen+aVnPgYbjVZSPKjmngegMD41ntxDZTCV81Ng1Aaj6m2Cz4ljr
	XYX25So/DUzIxRgj7gL6E+JXey+LXw1/PNIkCp71WjvbY+J1qf344G+yBtGwvJ43kkH0NaI7yya
	5zl60BSUgQg7NFR8r7XWELN3jAlyqRhtJYkQrbw5WRW4UlV9j1AFDcX9BwFAme5v0fr0j8nhH7o
	TRDE1mIGP3Jj0ZupYuMNDyYCJaU1WtTX/Wc1bKiMjiZt7RQX70tHud9xlgmOoVlkUeWsp08sdAY
	gj0l7vCvYoMMpv3+5CnFE+3KUSJABER21/aJr7SysnT2Q9wAFHMBD4escI+FCWBeuf1F7sZ4sK1
	d/7PuZFTYBpCsKN3PzTtZA5k+jMPlbVorprPgrxJWzHUZtSMWg1waxb8EsE4U0O2QWgCCQbcFDo
	B/v+iz2Svr5yKLUFiHv/h0t6PJyDP9JfeHT5rIkr+6bATVyAoODBdO2wIN31FkBZWJ+qvRA36pS
	r9ZgaA1xX+R7+AKxaxghzVlLbcyjCPFhERVq0i9gMfg7MINd
X-Received: by 2002:a05:600c:524f:b0:4a1:9a97:c88 with SMTP id 5b1f17b1804b1-4a1fdaefaa8mr21401525e9.5.1792567998665;
        Wed, 21 Oct 2026 00:33:18 -0700 (PDT)
Received: from Nandors-Air.localdomain (catv-176-63-83-112.catv.fixed.one.hu. [176.63.83.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb95b390sm53230925e9.14.2026.10.21.00.33.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 00:33:17 -0700 (PDT)
From: Nandor Kracser <nandor@riptides.io>
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nandor Kracser <nandor@riptides.io>
Subject: [PATCH net] tls: avoid field-spanning write when copying crypto info
Date: Wed, 21 Oct 2026 09:32:33 +0200
Message-ID: <20261021073233.16720-1-nandor@riptides.io>
X-Mailer: git-send-email 2.54.0
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

do_tls_setsockopt_conf() copies the cipher-specific part of the crypto
info to crypto_info + 1, where crypto_info points at the 4-byte info
member of union tls_crypto_context. When optval is a kernel sockptr,
copy_from_sockptr_offset() is a memcpy(), and FORTIFY_SOURCE bounds the
destination by that member:

  [    6.948348] memcpy: detected field-spanning write (size 52) of single field "dst" at include/linux/sockptr.h:49 (size 0)
  [    6.948480] WARNING: include/linux/sockptr.h:49 at tls_setsockopt+0x9b2/0xa30, CPU#1: init/1
  [    7.001355] Call Trace:
  [    7.003146]  do_sock_setsockopt+0xb0/0x190
  [    7.003975]  __sys_setsockopt+0x76/0xc0
  [    7.005368]  do_syscall_64+0xda/0x4b0

tls_setsockopt() gets a kernel sockptr whenever a cgroup setsockopt BPF
program is attached, even one that leaves the option alone, because
__cgroup_bpf_run_filter_setsockopt() passes optval on in a kernel
buffer. With a no-op program on the root cgroup, a plain TLS_TX
setsockopt() with AES-GCM-256 triggers the warning above on an x86_64
build with CONFIG_FORTIFY_SOURCE.

Copy into the union at offset sizeof(struct tls_crypto_info) instead.
crypto_ctx already points at the right union for both the first set
and the TLS 1.3 rekey (tmp) case, and the address is unchanged.

Fixes: a7b75c5a8c41 ("net: pass a sockptr_t into ->setsockopt")
Signed-off-by: Nandor Kracser <nandor@riptides.io>
---
 net/tls/tls_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index fbb274287..9b07ef8cc 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -701,8 +701,8 @@ static int do_tls_setsockopt_conf(struct sock *sk, sockptr_t optval,
 		goto err_crypto_info;
 	}
 
-	rc = copy_from_sockptr_offset(crypto_info + 1, optval,
-				      sizeof(*crypto_info),
+	rc = copy_from_sockptr_offset((u8 *)crypto_ctx + sizeof(*crypto_info),
+				      optval, sizeof(*crypto_info),
 				      optlen - sizeof(*crypto_info));
 	if (rc) {
 		rc = -EFAULT;

base-commit: daac93975b8ff0a0a036a5e3562236c0b40c3e36
-- 
2.53.0

