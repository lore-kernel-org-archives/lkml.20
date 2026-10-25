Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918864;
	b=ymNXBtT5MsyuRbt6RzbjC8uu8yslFbw3jJYLMSByQrU8H0yBIvV5eWoh+/pT5UbDP/6z
	 YeDCFbFPRYbBi6uGjwLstJnQs9HX7hxpfbMvQoFMqjoGJp3PBR0Dgnas6pkaK1W6gZAL5
	 CiM+IETKtLM9hnD7T05FGl96HMzXwcAy61l3RALsUeoIjmiVXBOkqDnif6XroKs1LJTqC
	 XjAWXEYZCzPqStov/Jn+tAs3ppaDph6AV0yQVaQsMxLq8M0gfh6dNcLpZHM5cl98nDmKS
	 /1NuvtYq5zx+JWQ4+yI3x+OsZW+wwJd4zyFR2+71S8sp2DzHpqyVtkxUcPCCi3jutlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XEX2cwRDGHHD+wX0VxTmiLBnol48kztc/aV72MB1mJ8=;
	b=VEIbYZ3Ru9OHYi9tPGKdMZNin3iORDksPyOFFbMhwVbqCf+U+f9cR1YPvtn2oMwCBFNr
	 /rg7y1BLoFkNQ4RnNL9R1LpkWeivHbYc82W9kXIqQ1WsctK8cj0tq0zMpRUav//GS4AeO
	 Opd22nqzlK2FYacn14qJoScSutfk/OH9xwOjBGOeap8fcQRQooDo0Uy/LSPK2aoGkG0VT
	 MgpQOUGSF8MrkfhE2vv7IiTCVwkFHkBhtU/awC5KV+1bherrOYpfEuQu6qc9n08ByIsZp
	 9jXy3hxElIbsB5BzGZihUg1vdMp+J9CgU9TOkZKTz+muAK8Fooy93SgY5TWKzgyOscA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wfnng+us;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AB6606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wfnng+us
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so16607595e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792918863; x=1793523663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEX2cwRDGHHD+wX0VxTmiLBnol48kztc/aV72MB1mJ8=;
        b=Wfnng+usL6f4cmzlGGXopxt7eGzGFSfKTkmHYy9cI4cCr7jvggfphRP1onvz1FXpyj
         AgxCGKw4uf1Mn8zrQUdVX9NhAzWTGLvkiWQrgBO3omI+OZBC/WgBa6CVPxJjflMA12xr
         KKUmc9f9G4chXmJaeN7/gTcMiwbnlht2pwoSfpch80gh/dMTsFYYqd+dGQ+kCAcV+UI5
         nnSuwjfnA1LF6TJ50zJBrQ0uQS88tXHDT4SVrKGY+x+ukecI9H615f6h3Lp9d6IkEElQ
         1GMESJ5pZt5xmyhN8Hvro/ryN3aSQNLGHJD+gbdqoTdEDtCyoogg7n6fVNHnt4nfWV/P
         Ut1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918863; x=1793523663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XEX2cwRDGHHD+wX0VxTmiLBnol48kztc/aV72MB1mJ8=;
        b=TLi7SqznyE1tY35+1+OcE2E59IagjSiWNiFEHR1NpLUcJSs9vOPafUvNG4bFHMC6Ns
         DB6u2M5QpSdo1TGrCilPHmSu8bLplkGsSa40f2haRg3YMrfg0SVtrO3L7U9NfgSZa/Mx
         J6YtfvmAwPyYIxRw+ji6fP93z7+oJz/JpA+iUbphX41PhN7qGLKpywAz6+K7gPRvexkd
         E2YmDvntrvWwoK/sLETXLSeI+GMTkz3qgWMWUPla4xee4GJmxVGMZHvrM3CxPp+n3ymj
         fLjSRHqT93qqUPQ61oPbBA5hcvlU6p3LqB2nGvjKBucvqpJLBknrAfa0CgU0DO3XYJSz
         S26A==
X-Forwarded-Encrypted: i=1; AKwUvBwDuDHrYaK2otWzpstsJnF+X4lUdSV0AQ5oX8GETXtIp370t7a2EeLwrb4l5L/h1TLvfJrdmaGmUBjMjbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD9hv+XDefQjHahEHFlsmOxuFAc5zIRoh3A/42c9CNb1N0Iz5/
	z3wPrF7PfXeoHHJnz1Qo9JapRSlfllrmeQ11dpDGPsPNf7+rOR68GIU1
X-Gm-Gg: AYBFou3I08QDuChq0gP9U7VH8qg6HuVi7Ahd9sGIisg1PUBXMiVTwINZpYFZj7U5tN3
	3yCIv0CWaxGOTdeqR+nujlXoyZnlnK6lNj3oH6Ulfjnu6Luv6prfnLnnriH4zml1tLjUGci3B9z
	IxFR/4cy1zXPd5uXgco6YedeGV4Z+csj3rsPJno2hUnGkuFIMrXIOOvGf3RxUczRGbOrIoh2iXk
	c6lOK+u5WC+cgWDDUVJ2DveRl4OixY1c5C12IJEBLmFoX66RIThrSQ8qFlrTDG8B2LpN7fqjvld
	7lDBqIdkbiOZ4596V7ePua8G6KHL+c5jTXHJQxdO08QCYbWc9n2hp0MRzu3xH4u90eZ+vhWtHIE
	eQP/aZ+w/uzbHqnTTKtoBza4aUlsm5BlYIzmDGnxYVSu+eXvPNJjJkbGbTlWXSiI6ORxFEXWYGs
	wTQ/hfivpqowmqbrIxl2HybhPhUJxC2szx24ykSLRdHPmgg7ljfSO1DSCkCpeEpU6flIN440hqw
	qz2Dkh/VqGRjZ7FWJIRvyevQaXMaAUDvju76MECf8cvoXrdFbXqnCCl42c1dBNwmg4mxGa3eRE=
X-Received: by 2002:a05:600c:4e87:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4a35acaa62cmr76173405e9.26.1792918862802;
        Sun, 25 Oct 2026 02:01:02 -0700 (PDT)
Received: from zheweiy-mac ([2a01:4b00:b60b:cb00:c67:3956:189c:b7c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm111588615e9.11.2026.10.25.02.01.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 02:01:01 -0700 (PDT)
From: Zhewei Yuan <yzwlhm@gmail.com>
To: netdev@vger.kernel.org
Cc: Zhewei Yuan <yzwlhm@gmail.com>,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net 1/2] tcp: Fix fastreuse cache initialization on first bind
Date: Sun, 25 Oct 2026 09:00:47 +0000
Message-ID: <20261025090048.27870-2-yzwlhm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025090048.27870-1-yzwlhm@gmail.com>
References: <20261025090048.27870-1-yzwlhm@gmail.com>
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

inet_csk_update_fastreuse() initializes the reuse caches only when
tb->bhash2 is empty. Both inet_csk_get_port() and __inet_inherit_port()
link tb2 before calling it, so this condition is never met.

Fresh buckets therefore miss fastreuse=1 for SO_REUSEADDR, forcing
repeated binds to scan existing owners. SO_REUSEPORT starts in STRICT
instead of ANY, causing repeated fast-path misses with alternating
addresses.

Initialize the caches when tb2 is the sole entry in tb->bhash2 and has
no owners. Both checks prevent reinitializing an already-used bucket.

On historical net f4377bf85887, 16000 SO_REUSEADDR binds to one IPv4
address/port take 4256.956 ms before and 20.004 ms after the fix in a
one-vCPU KVM guest (bind-only means of 3 boots x 3 rounds).

Found by manual inspection and GDB tracing. Codex assisted with
analysis, validation and wording; test/benchmark assistance is
described in the cover letter.

Fixes: 8002d44fe84d ("tcp: Check hlist_empty(&tb->bhash2) instead of hlist_empty(&tb->owners).")
Signed-off-by: Zhewei Yuan <yzwlhm@gmail.com>

---
 net/ipv4/inet_connection_sock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 8151c638a24..93b306d91b6 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -446,7 +446,8 @@ void inet_csk_update_fastreuse(const struct sock *sk,
 {
 	bool reuse = sk->sk_reuse && sk->sk_state != TCP_LISTEN;
 
-	if (hlist_empty(&tb->bhash2)) {
+	if (hlist_is_singular_node(&tb2->bhash_node, &tb->bhash2) &&
+	    hlist_empty(&tb2->owners)) {
 		tb->fastreuse = reuse;
 		if (sk->sk_reuseport) {
 			tb->fastreuseport = FASTREUSEPORT_ANY;
-- 
2.52.0

