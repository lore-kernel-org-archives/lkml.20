Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419280;
	b=Dr3e4fi15p4HTYZ8/NZrpW8uyjMgJkgV2U/M+px6iOfKrXegGB7GHXGbffDiTPA401uS
	 ldQrAaGjRIfaVWfOg66bVrcXFoTmMl4evz3QwK7yPmZXy8q8Kc8vvFR8+idgOkFjvborm
	 K/P74eLTMc4rXuGIcHcXoLy2LwfmKwUIQu+pwWUor3f9pMSL8kvzwEoUJVRvIFaTmFK4z
	 a+vhneqO4I+O/5nlRaQ3X7heTSItGDyFJFhJuhZE/z65WS6p2hTip9zhakseOzx5qtECz
	 mXurzUscuoiGF3f2eei2uciJI+LOVF2vJHODrKNNYV2d/TGX193XN0j+ICDhHcX5mkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wGzKPyIc6e0sQq1pu1RR+JZZd6ZgGrGLpyyYyUORI+Y=;
	b=ufi11cdG7hO0V9w32IarTdIuFTNNs83gvXKM2laV263PXOna265aboYpaYzlBwrWqnMy
	 LumcsdrE9cbZGFKDFuiC0ZOURFAav2EzaqxEBUE/dajr5bvbtN6DhxcXT1zJCsK2y6Aom
	 TcaBDm3/gEA8b7TuEskAcgxLLnr70Bogm6fCLdXdHlSgCUy06Qeh396em169N1EUXfRgw
	 71kpzmihwP+X9hskJ6fmNBVlhcvCKGMDexa7P1uhnthISqQUZpqq350U598hBYBmaeq4M
	 auzmlIw5c5Tse4cGWXTnUBQM/Qy9gocgIR7CfqmcWcHBMU7Qm3ImlZ+ndI2Lv3thLjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mzPpOiav;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F79F606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F79F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mzPpOiav
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67be1e468a8so2732432d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794419279; x=1795024079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGzKPyIc6e0sQq1pu1RR+JZZd6ZgGrGLpyyYyUORI+Y=;
        b=mzPpOiavZjWGC0VpKLXkiQTk7jWoAOSjROcU2NNkp2/udg76bL0g9eUJdQkMGbxkTh
         Zc1kPkeMv9ZBOMw3G0+h+HnDlcBf7fNY/o1IivdREn+um+JymdJNJjuawplssP7xEmut
         V1RdxnoNpCuXOQ0QiEMH/XtC88DYUNQEY2urQo1lZaKPhyova0/mEOOD7YPh7hip+wdC
         z26uYPMFc9Mx4FRiiz1kH6t//38s2+72XwfBgsD2OEO7PH6hb9MhdXHjumzrhWMYCetr
         gnYbnLlqcHlyfQsAdqqAmP5VUhrOTF6DwWFBnjKREsXg7+OVprhfoJxzjdQa9KepzYXt
         ZWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419279; x=1795024079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGzKPyIc6e0sQq1pu1RR+JZZd6ZgGrGLpyyYyUORI+Y=;
        b=kknv0QpF93UONOFHoQZDI0lTvuZVytTzAOnuzRqvalzH5ZkOI8hwULLhFtnsSZbbtN
         2INT+93BxZCjdQPUK9eYSpNdy2Z9tM5H2KIkL8xQXsO16X9vXvbD/nyS0BmINP42epZF
         6fUbXJy6e3Fbbk1uI3m5nBHt9VOJiZw0A2JiRY0/btrgHpuRD9xG9x0k3gZAMqHrYvDR
         CDPXtWcgXImdYNokwN6TnIyuXrE+q5+T/LnKbgbeA3ENI53cH4Y0KSnDaIwdlEM205Gn
         LKOXFoDBrP2udWdQJ2LHvmvtMYE3SAMYwIdNNzxEsfUXe2PPB0zH3Oi32Oi8BeioGye3
         W5ig==
X-Forwarded-Encrypted: i=1; AL+hErFyAHhRbzZtaW+lyYV1qxDIUfDR/ASy1z4cwM++VLmTPCUMDBplvV6Gf6OUIfNUHDG94jZ0q2k+5p1zliI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ld8jJ7nJ0Yrodzzc5ybGsCOQAigRq6Hrxtm1dlgWVslHknZfN
	ywxNgUcWFdxkgDYKxb4F7LgrLUBaWZE9fF15EGljOlZ5srqbyJq5PAW3
X-Gm-Gg: AYBFou0rhcyrFu3ydEmkVVVsv3iFkdFCZmJ0x4oAQLY8GfAMIow7etiKyh9sh1axfpx
	5Jp2uUpa6xS/pQuRzDjwqIQ3rhte+QnCi+XnR3Oz8QvFu2KZASR1Nzlxck5ECFT7TDDohjz5jYs
	qDgULpqER3+fuz/SWSB+wxsfcyyirQocjMM1hANdqdkyjB5EKzvnApnezyfob+tjGy1uYVNG7lR
	L7L3Us3LjnxFS0zIAI58QiM8ryqFq2PfJ0Mn8wwo73S9ywxBrJdUj7GZYPq1jVyROakvIwcHdjv
	hXKjqF+23c2+HaazBJhzBduhRSIAfbq5Uv9jGKXijT5heXSzsV62vqGCRyC6c+OihI23iKW7JDr
	1nVZJV7EtngjQajLhx/v9v3d7ZUawHjVXiQTUGeX97x4TRENtUE0/Aq1JnOiRyQGLbqxJKvPrw8
	/QAX6QUmaUY6/hV17BL10x2Fvj6yTjmePIhvc11dR0AsETPlgvlMpFruWBUuPKn0t+11liQMDPW
	NdCUILa2nLwK4itXYEynRqsE8e74sPx/6ZkmYYgu4eGOk1P6C1hojPRHesNGfcd0UqN9dxWilDn
	UCREm8hgezrw2ye1w79frtgsw0005u1IzceT8YNosVg/1GOcNp11Zg==
X-Received: by 2002:a53:c7c2:0:b0:679:9afd:c0de with SMTP id 956f58d0204a3-67c6805a592mr1606256d50.97.1794419279142;
        Wed, 11 Nov 2026 09:47:59 -0800 (PST)
Received: from VPN-156-197.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c6f24sm5077708d50.12.2026.11.11.09.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 09:47:58 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	josef@toxicpanda.com,
	jbacik@fb.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
Date: Wed, 11 Nov 2026 12:47:03 -0500
Message-ID: <20261111174704.24312-2-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111174704.24312-1-juanagusnicco@gmail.com>
References: <20261111174704.24312-1-juanagusnicco@gmail.com>
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

When the port is in the FASTREUSEPORT_STRICT state, inet_csk_get_port()
skips the bind conflict check if sk_reuseport_match() finds the new
socket's address covered by the socket cached in tb->fast_*.

This is only safe if both sockets match on everything
inet_bind_conflict() reads. The cache misses some of it:

- It does not record sk_bound_dev_if or sk_reuse.
- It records the family and IPV6_V6ONLY but never compares them with
  the new socket, so a cached v6only [::] (or 0.0.0.0) socket covers
  a dual-stack [::] socket.

As a result, an unprivileged user can bind and listen on a port that
another user is listening on, for example a dual-stack [::] socket on
top of a 0.0.0.0 listener:

  victim:   bind(0.0.0.0:P), listen()
  attacker: SO_REUSEPORT + IPV6_V6ONLY, bind([::]:P)   /* fills cache */
  attacker: SO_REUSEPORT, bind([::]:P), listen()       /* should fail */

Only take the fast path when the new socket matches the cached one in
family, IPV6_V6ONLY, bound device and SO_REUSEADDR. Identical
SO_REUSEPORT listeners, the workload this cache was added for, still
skip the scan (binding 16384 of them: 9.80 ms before, 9.86 ms after,
5874 ms with the full check every time).

Fixes: 637bc8bbe6c0 ("inet: reset tb->fastreuseport when adding a reuseport sk")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
 include/net/inet_hashtables.h   |  2 ++
 net/ipv4/inet_connection_sock.c | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.h
index 6e2fe186d0dc..44b7e39a1245 100644
--- a/include/net/inet_hashtables.h
+++ b/include/net/inet_hashtables.h
@@ -87,6 +87,8 @@ struct inet_bind_bucket {
 	__be32			fast_rcv_saddr;
 	unsigned short		fast_sk_family;
 	bool			fast_ipv6_only;
+	unsigned char		fast_sk_reuse;
+	int			fast_bound_dev_if;
 	struct hlist_node	node;
 	struct hlist_head	bhash2;
 	struct rcu_head		rcu;
diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index e56beec43877..70b8662b3004 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -420,13 +420,18 @@ static inline int sk_reuseport_match(struct inet_bind_bucket *tb,
 		return 0;
 	if (!uid_eq(tb->fastuid, sk_uid(sk)))
 		return 0;
-	/* We only need to check the rcv_saddr if this tb was once marked
+	/* We only need to check the fast_* fields if this tb was once marked
 	 * without fastreuseport and then was reset, as we can only know that
-	 * the fast_*rcv_saddr doesn't have any conflicts with the socks on the
-	 * owners list.
+	 * the socket they describe doesn't have any conflicts with the socks
+	 * on the owners list.
 	 */
 	if (tb->fastreuseport == FASTREUSEPORT_ANY)
 		return 1;
+	if (tb->fast_sk_family != sk->sk_family ||
+	    tb->fast_ipv6_only != ipv6_only_sock(sk) ||
+	    tb->fast_bound_dev_if != sk->sk_bound_dev_if ||
+	    tb->fast_sk_reuse != sk->sk_reuse)
+		return 0;
 #if IS_ENABLED(CONFIG_IPV6)
 	if (tb->fast_sk_family == AF_INET6)
 		return ipv6_rcv_saddr_equal(&tb->fast_v6_rcv_saddr,
@@ -455,6 +460,8 @@ void inet_csk_update_fastreuse(const struct sock *sk,
 			tb->fast_rcv_saddr = sk->sk_rcv_saddr;
 			tb->fast_ipv6_only = ipv6_only_sock(sk);
 			tb->fast_sk_family = sk->sk_family;
+			tb->fast_sk_reuse = sk->sk_reuse;
+			tb->fast_bound_dev_if = sk->sk_bound_dev_if;
 #if IS_ENABLED(CONFIG_IPV6)
 			tb->fast_v6_rcv_saddr = sk->sk_v6_rcv_saddr;
 #endif
@@ -482,6 +489,8 @@ void inet_csk_update_fastreuse(const struct sock *sk,
 				tb->fast_rcv_saddr = sk->sk_rcv_saddr;
 				tb->fast_ipv6_only = ipv6_only_sock(sk);
 				tb->fast_sk_family = sk->sk_family;
+				tb->fast_sk_reuse = sk->sk_reuse;
+				tb->fast_bound_dev_if = sk->sk_bound_dev_if;
 #if IS_ENABLED(CONFIG_IPV6)
 				tb->fast_v6_rcv_saddr = sk->sk_v6_rcv_saddr;
 #endif
-- 
2.43.0

