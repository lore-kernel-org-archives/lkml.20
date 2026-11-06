Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985292;
	b=EG1xQeU5Hll78m3TNi5PdzWszRwD+T2fbKZCjPFS37/WL1vopPx4IE+FVh3R1UCC2Kzw
	 b37AT6JZHRIicnFf5ZezOLAnk5F6IVmxT1s+R11Dh7ykwFg6jkn8jNzLoLwHqPWam9/RV
	 Ha3VAWp46PSSeP7VXGThkdcoobIHXfMpWqMw4jOP2GVfW10fPE1IjYsGPKPRr3+Aj42Du
	 xFaCBCTMA4HYAegnIAOgS91cZHxKm+1PITix7OoMFkC9s39+HufvL9UqDswuI65Hg78YP
	 tQ5hYMLvWKFZei4xpD+jsS6v/5/fRuxYAP6zapAnYzVUfsRlbjPRvng98bKJWJPQgCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1S4mR0QPoC6nO8yYpDVgFwSwnBHCQTPEsHvUyW429Rc=;
	b=Kl+h7FGDu5k91eGIuxKu97EBPLZLY/Z4tAg7DZcOlyl6nW6tQJsk7m9UcyXRoUueKY94
	 a2GGA9y8QO9V8raFumeN+zL1tmYF8jZlh5kS9oibudTdWEALojJq1vwsFJc0juRvVua56
	 IQl5EWRI0Fb+BwPoqRRT8JbnVQvSx0VnHrfCRQZpBgJBzwDehmobgYm7tnDjC4JldlpaC
	 NipvWrEOdADFxtq+LA9haaIyY9eyKc9I/abiRv+czxA/fcZmBn5zCwcVA2vOJ5jCkO2GN
	 4Jl9g7qGowKF81fR6xZGHUAsPig9GSJzkNBPr1WBUgK7JuEND4OFfd9oJHhf3SNQWlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCX3loN9;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF63A606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF63A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCX3loN9
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a215e64962so10269395e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985287; x=1794590087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1S4mR0QPoC6nO8yYpDVgFwSwnBHCQTPEsHvUyW429Rc=;
        b=WCX3loN9CbTwZTJ3fT8dhK2OpMhEDhmrTp2p+I4v9aNr8BkWSbNAPaDAUFis2zb37H
         dAg0nJlkO8mtwFqgAobQdD1+1LDKdkMmwY2Xy2kyV1wrMDBaSyTWnaV12noKRyXcayzM
         WoKEEMwtX6aHJa8pQJiw7uM2lxsuZdxDwtS8OaFod3k1RtJsOtNq5Hr3jmcFL3Ldkp9j
         Kqyryy0Vy2FSm0KC5CJ3PdExVN+4OSRHdWUtAAILX+McR+hr1Wrxw1xAXGR1wDY9x9aW
         xLYnyP8RhwYUD4/tepKFDph2R7AAzbhsiND64uLFXv1mUCOMIOgc5fcPD/HooHX+68o0
         KR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985287; x=1794590087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1S4mR0QPoC6nO8yYpDVgFwSwnBHCQTPEsHvUyW429Rc=;
        b=tRLxD+GBhpsJKIjpfKPi4aHPwMHtMD7JyvPyoTlmre+HmOiqHx1+edXdm7HjzfhU9W
         GSDVnTQ+rqqR+6aKg5pD5SNKSFmyP26ErfKN9Lq/udT9tZ9rrY7C2ifdEnd3eNh577x3
         T92WmEqGbRyl8yxxw1n9N5Lk02YctDv3E/rASB1wIlM1eFleqwBx+GGeaFEjh+8Q9Q/v
         lc3tiLH9Tl+Yf37FQgv2z67mugWuPAS91dyth16DA4hLAikC46aCefG86QsQhIKFfDIq
         zKEsq0mDr8lL3O7Vaof1UbGfJy8yYKtq2cY5iN/sQLG4w6cq9fxEJx3W+ts9o5Fddwti
         f+yw==
X-Forwarded-Encrypted: i=1; AKwUvByoTgXOOXJe6CpuuSeTRniqJkhxOsOrBkSKLspbFujtRZnPc0AjTR+dcPb8drHC5wYEAtXG52G71/cY69U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0eUDONK9MsoWNag8R1m8qorqkMs6vLXfPx6xBQzfoOUc0i5Pz
	IqkUtF5Bw9KjtMzsUG8H0ja3ZIkFgkN2Gu31s26iDfg03tuDJVfEWapO
X-Gm-Gg: AYBFou3ISiloyR45H3I5ZlCTnttBDkxJe1L6hBMIrk31FzIIilgjOrDsD0PXYUJVdWl
	w2rQZVtxgqI1olpDEJY8kigMT0kxF/tjFt3DMWfeX+VEwOc7qNJ6mfDw/3Az6pmdO3XOpUqgnfD
	W7Uff4eHY0y9JhDoFcFKTfLlJrAFo+H5rdG7wIo10lmeU/12oGRihsHJgLaSY0+DhVlTPOjPmi+
	pXTqYjd6eb4Hbg0gEotwtCmdLYc2Jt1aHhaf89DMd+J+d6TweLeZ5px/PxByaZm2Klp0IBQR4dZ
	opS88ms8KPnoKLMYMGIU6lptU3mSDnUqu8GzwfIHjMazJFaEgriZHgr4L5/10nYbIkpK1BfQ0Sz
	LPINdCtKgY30w/3NrKgGtp2v3Hwl949UwO0SAnMSo7iNCc9A76YzAQ8pqXTE/+202xYM1tpng/s
	I497kS5FRQuMjF8vbA9RVCpRa4iYx9dHWznLLzGp5MWWiAzshIll9bh+0+VK3hhdj1aIf5B8KZF
	JhOjEd+Anm2B9xRiF6mOb8u4b04KoqHVKPRgC25rMxUU4KlvxLMosjCand3sHBC89XnVPzni5OM
	fV5NSmPmRXzzn5UQbCcmqUjhjZvYAKP8hzMiLlBVXOPEd/8gadAIZoTiymWiA/SwsXkFzLqdm8g
	tDxKHCFPMyfo1j0n0FZPuUaUBTyvBNtQrr5TqwQCEFMmUmn886qQPmIxiNfePzZwTB1RtXcPO2u
	+m0e7Zd7HYOp0jR3/r0frUxOB70qppw83yCJpWujFH
X-Received: by 2002:a05:600c:818e:b0:4b3:9540:47a6 with SMTP id 5b1f17b1804b1-4b6dff86e38mr52698025e9.28.1793985287188;
        Fri, 06 Nov 2026 09:14:47 -0800 (PST)
Received: from localhost.localdomain ([90.95.39.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46489sm148071985e9.3.2026.11.06.09.14.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 09:14:46 -0800 (PST)
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
Subject: [PATCH net-next v2 2/2] selftests/net: cover odd-sized local port ranges with one free port
Date: Fri,  6 Nov 2026 19:14:42 +0200
Message-ID: <20261106171442.31811-3-baditaflorin@gmail.com>
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

Leave each port in three- and five-port socket-local ranges as the only
available candidate and verify that bind(..., 0) can allocate it. Cover
both lower-bound parities and repeat allocation to vary the random
starting offset. Use the existing IPv4/IPv6 TCP, UDP, SCTP and MPTCP
fixture variants.

This catches the false EADDRINUSE caused by rounding an odd-sized range
down during TCP port allocation. Without the preceding fix, the TCP
and MPTCP variants fail on both IP versions when the last port in a
three-port range is the only free one. With the fix, all eight variants
pass.

Allow the loopback bind helper to take a port so the test can hold
explicit binds on every other candidate. Retain the existing helper for
automatic binding and run under the existing isolated-network-namespace
wrapper.

The regression test was developed with Codex assistance and exercised
on booted x86-64 KVM kernels before and after the fix.

Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
---
 .../selftests/net/ip_local_port_range.c       | 67 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/ip_local_port_range.c b/tools/testing/selftests/net/ip_local_port_range.c
index 3d32b33cb..c17d95045 100644
--- a/tools/testing/selftests/net/ip_local_port_range.c
+++ b/tools/testing/selftests/net/ip_local_port_range.c
@@ -44,7 +44,7 @@ static int get_so_domain(int fd)
 	return domain;
 }
 
-static int bind_to_loopback_any_port(int fd)
+static int bind_to_loopback_port(int fd, __u16 port)
 {
 	union {
 		struct sockaddr sa;
@@ -57,13 +57,13 @@ static int bind_to_loopback_any_port(int fd)
 	switch (get_so_domain(fd)) {
 	case AF_INET:
 		addr.v4.sin_family = AF_INET;
-		addr.v4.sin_port = htons(0);
+		addr.v4.sin_port = htons(port);
 		addr.v4.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
 		addr_len = sizeof(addr.v4);
 		break;
 	case AF_INET6:
 		addr.v6.sin6_family = AF_INET6;
-		addr.v6.sin6_port = htons(0);
+		addr.v6.sin6_port = htons(port);
 		addr.v6.sin6_addr = in6addr_loopback;
 		addr_len = sizeof(addr.v6);
 		break;
@@ -74,6 +74,11 @@ static int bind_to_loopback_any_port(int fd)
 	return bind(fd, &addr.sa, addr_len);
 }
 
+static int bind_to_loopback_any_port(int fd)
+{
+	return bind_to_loopback_port(fd, 0);
+}
+
 static int get_sock_port(int fd)
 {
 	union {
@@ -301,6 +306,62 @@ TEST_F(ip_local_port_range, single_port_range)
 	}
 }
 
+/* Leave each port in turn as the only available one. An odd-sized range
+ * must not report exhaustion while a port at either end is still free.
+ */
+TEST_F(ip_local_port_range, odd_port_range)
+{
+	const struct {
+		__u16 low;
+		__u16 high;
+	} ranges[] = {
+		{ 40000, 40002 },
+		{ 40001, 40003 },
+		{ 40000, 40004 },
+		{ 40001, 40005 },
+	};
+	int i, j, port, free_port, fd, err;
+	__u32 range;
+	int fds[5];
+
+	for (i = 0; i < ARRAY_SIZE(ranges); i++) {
+		range = pack_port_range(ranges[i].low, ranges[i].high);
+		for (free_port = ranges[i].low; free_port <= ranges[i].high; free_port++) {
+			for (port = ranges[i].low; port <= ranges[i].high; port++) {
+				j = port - ranges[i].low;
+				fds[j] = -1;
+				if (port == free_port)
+					continue;
+				fd = socket(variant->so_domain, variant->so_type,
+					    variant->so_protocol);
+				ASSERT_GE(fd, 0) TH_LOG("socket failed");
+				fds[j] = fd;
+				err = bind_to_loopback_port(fd, port);
+				ASSERT_EQ(err, 0) TH_LOG("bind(%d) failed", port);
+			}
+
+			/* Exercise different random starting offsets. */
+			for (j = 0; j < 16; j++) {
+				fd = socket(variant->so_domain, variant->so_type,
+					    variant->so_protocol);
+				ASSERT_GE(fd, 0) TH_LOG("socket failed");
+				err = setsockopt(fd, SOL_IP, IP_LOCAL_PORT_RANGE,
+						 &range, sizeof(range));
+				ASSERT_EQ(err, 0) TH_LOG("setsockopt(IP_LOCAL_PORT_RANGE) failed");
+				err = bind_to_loopback_any_port(fd);
+				ASSERT_EQ(err, 0) TH_LOG("range %d-%d, free port %d",
+						       ranges[i].low, ranges[i].high, free_port);
+				ASSERT_EQ(get_sock_port(fd), free_port);
+				ASSERT_EQ(close(fd), 0);
+			}
+
+			for (j = 0; j <= ranges[i].high - ranges[i].low; j++)
+				if (fds[j] >= 0)
+					ASSERT_EQ(close(fds[j]), 0);
+		}
+	}
+}
+
 #define REUSEADDR	0x1
 #define REUSEPORT	0x2
 
-- 
2.51.0

