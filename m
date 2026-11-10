Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297636;
	b=3ulnTDmGEHQ23gudUX7T963sLp7LjdrKZg73qQmBYdAk4k3DTK8/Mh6gdoeZT0T+Tc/l
	 Ae03d3Lz6cqSILKyMz9ds5443WbhHoB6uRbCjXiZbLu1xmktUdmfkfSKwI54WmNbqTuXO
	 n0iFjkZ/825ycXg+OBLtURTo8jfbOW7A16VjOWTFAfXmMeKqXw8w28rYKf6xaiay47Pfw
	 Yb8yHgR8gXGuDXZ/Z948XFdZrh5ParfM4D6Arxu3MbywUs0+x68M9VQOEKf8dYCRhlRpr
	 DTtDXZVoZCEfuKpldTY71/PsJma+CLKfG9PAHeGVQ/f7kunl/Og6V8fQSpXOSkXkz7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8/yWk7su6asML4sCXXpIPGHzHAG4DJtHILTqcFE0aao=;
	b=M1kWhywAWRe2bU4REKZa5tNMwAdF/xBY6vNItJwjvhEEn076XWRSo1xHXyUdDc3hHJsR
	 3tPggluZqQd9EwJMam8uTmNSKw4NGwnzqHfCBDS9jsV9ZKriGUV4H0gDloD6usM+nQ9IQ
	 qmIzAR4cfZnTM3FlXDDzOERQn3YWVdP6g+s5JXSKw5en04SCIWiJwNdlv6dp0+JM++NRx
	 F4zswffrax6EEM1G/kfj1cFFzCxp5P4g3hWxAsDM2CnKWv/n8Cs7lwotuA54frvwFQ1w5
	 OOU+I3pF0PK1Ruz9HuOf6lbWy7Z760k/dXJ3RrOW55tle690rca9AGYuWNQJCSjph/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fX2tfH58;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A21606A703
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A21606A703
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fX2tfH58
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b308fca7c3so16080617b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297634; x=1794902434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/yWk7su6asML4sCXXpIPGHzHAG4DJtHILTqcFE0aao=;
        b=fX2tfH58cE8avbpoZ5uRcWsUzlCqS/nWsAJxcToHYqlK5pFfkSUPwx/Op9CqmZftSa
         RyK5Mzp9er/rqxO5XJUJuTE15NhIJJBqiSFxcXRVUm1GIKorD0feTQUq+IoCPt957vlF
         qxOnt7xKxS4dDxJ1PmaHnPTqje8N1QFkxg0UvnLVStaBdnrjGf3TExEwNH4SPGcp9HE/
         hSPleogPnUwwOWrqVeIDTcoPV8mUoJXdBK3OE3VCEI3X31+7Sfg945TR/+i0xfzQVZ23
         YPqUjWRVbY2xD7ziefHlBL/ZtUXuIug/Ec6ONdQ812h9qUDBie1imixTQ+gRxCMqeNrN
         jEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297634; x=1794902434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/yWk7su6asML4sCXXpIPGHzHAG4DJtHILTqcFE0aao=;
        b=bdNJBqbJwpRyYt4/yssrhV11yMJCK65vCiM0z/zzB7B4H1vvjnnpg4LxVhWN89piou
         OlxXiDXbbKL+XP/vPdMOPUvqZFJ6v4XZmZMyk4eMlydL3F6qYisJfaOUbNY2yKGVNZPA
         yBFk5KXPQmyLyrjIsp+Vu5pDBLkciEG1U//7gwU/xD7pXoVIjrRM9YjEQaDgfI3UBJES
         pjPiFnIDimvu/ZvFFfqZ1PJ5QnW9JDO9nQqF0mkCcpMEfrtNAqALNI3KBE19pBedFXOL
         aXtuioIxZhZC58h/JsuNjpKD2zAUuhQzaD4ltPa5ZHqmIClUlYs81UlLOcbxA4pjTL0G
         nEfg==
X-Forwarded-Encrypted: i=1; AL+hErFNpDR18zxbitB5BVCVmw6tmSTBMzEQIQPJAo+HkImiOVZg62ii3cw98+hYVZx+M0JavbcrojMSrtOspgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jQkCtQbyCHsLFtaWGWW0u59hhxHpDWCbR7n9Ta8s92ubC71Mt
	hVirwBKDWBSVFqqxV9PyOAEhWWCBCoa1aEMu4egl5vEjVgNHc5Qf2cGB
X-Gm-Gg: AYBFou372+rd1AhZzl8w3MPxp9OuZyc+MuZxt6l6ABjx80c86gvc0HNgTLI+KrtQGyV
	GnLNgwTzmc7XPoLHs45tiv+EmWyVtdR3o5YS07sOzi9FtHZR4YeLcAb4kb/f2VZNKInz2LA5jMa
	01rUymym/cIecmV21SSQtEuEmEAzZmcBoX8OTW7CO+1X6s2bKpK8eVWNV54zB883ixiMvqy/ean
	/i0YLzcJZiqSlOvJNnBRXLO0rB2c4IOE/cGZnLQNUs+iseNCcMSRdCpg/MoDjRRA7gDYcInjYg9
	d135WSG538q3vzSDdV0HUGF18UzknJDQ/UyPwngxFVPWIPL3zAntJIwtlcpX/dk9oy7Y/5FI8Bh
	tx5pk8TehFoP6X9gggFRzqaTVaLdySN4faAH2/YeFtCA4DBBEOn927NmgCl+6HEMwvw1N1vK+lX
	DtNL2pePwEhsGYbSSQTD9T+4FffxFWwskUsd5zv/SRtDwVphgqrtmdDZ/fBYb1KVgpaL1jatyWa
	j/YFJzj0Uue7oTO1vl94sbL5w+CiG01v/VTy1PYUwPaOMnB6HaxkzWy23ZJqkFFqpkovjBpd71x
	8cF0U+7+3vGsmphM6/8W2eV9Y8NfT49o6GcpwT2SCanvh/KcoZGU1g==
X-Received: by 2002:a05:690c:60c7:b0:8b3:814a:7c3 with SMTP id 00721157ae682-8b392bb1fedmr13183807b3.58.1794297634409;
        Tue, 10 Nov 2026 00:00:34 -0800 (PST)
Received: from VPN-156-197.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3934294aasm13660077b3.33.2026.11.10.00.00.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 00:00:33 -0800 (PST)
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
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
Date: Tue, 10 Nov 2026 03:00:08 -0500
Message-ID: <20261110080008.26112-1-juanagusnicco@gmail.com>
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

Since commit 637bc8bbe6c0 ("inet: reset tb->fastreuseport when adding a
reuseport sk"), inet_csk_get_port() skips the full bind conflict check
for an SO_REUSEPORT socket when sk_reuseport_match() finds its address
covered by the port's SO_REUSEPORT bind cache (tb->fastreuseport and
tb->fast*).

In the FASTREUSEPORT_STRICT state that cache holds the owner, family,
IPV6_V6ONLY and address of one socket on the port. The assumption is
that if the cached socket conflicts with nothing on the port, neither
does a new socket whose address it covers. That assumption is wrong and
it lets an unprivileged process bind to ports already in use by other
users and hijack their traffic.

The assumption would only hold if the two sockets agreed on everything
else the conflict check reads, and the cache falls short of that in two
ways.

First, it does not record, and hence does not compare, either the bound
device or the cached socket's SO_REUSEADDR. A socket bound to one device
passes the full check against another user's listener bound to a
different device, and becomes the cached socket; a later socket on the
same address with no device is covered by it, skips the check, and binds
and listens on that listener's address and port. This lets an
unprivileged process take over all the traffic of a service bound to a
device. The missing SO_REUSEADDR fails in the same way: two sockets with
SO_REUSEADDR do not conflict while the existing one is not listening, so
a socket with SO_REUSEADDR can pass the full check against another
user's bound, non-listening socket that also has SO_REUSEADDR, and
become the cached socket; a later socket without SO_REUSEADDR is then
covered by it and skips the check that would have refused it.

Second, it records the family and IPV6_V6ONLY but does not require the
new socket to match them. The address comparison in sk_reuseport_match()
lets a dual-stack wildcard socket match a cached IPv4 or IPv6-only
wildcard socket, although the dual-stack socket also accepts the other
family. A socket on the IPv6-only wildcard passes the full check against
another user's listener on the IPv4 wildcard, 0.0.0.0, and becomes the
cached socket; a later dual-stack wildcard socket is covered by it,
skips the check, and binds and listens on that listener's address and
port. This mistake lets unprivileged processes hijack traffic from
services that listen only on 0.0.0.0, which is very common.

Fix this by only using the cache for a socket that matches the cached
one in everything else the conflict check reads: family, IPV6_V6ONLY,
bound device and SO_REUSEADDR, besides the owner and SO_REUSEPORT, which
sk_reuseport_match() already checks. A cached wildcard still covers a
new socket on a specific address of the same family: once those
properties match, the conflict check treats the two sockets alike except
for the address, and every socket the specific address overlaps, the
wildcard overlaps too.

Note that, as this patch intends, bind() and listen() now fail with
EADDRINUSE in cases where the cache used to admit them, including for
sockets of a single user. For example, a user who binds an IPv6-only
wildcard socket without SO_REUSEPORT and then an IPv4 wildcard socket
with SO_REUSEPORT to a port previously could add a dual-stack wildcard
SO_REUSEPORT socket; that bind now fails, matching what the full check
would do.

The FASTREUSEPORT_STRICT state was added to speed up one workload: a
service binding many identical SO_REUSEPORT listeners to a port that
holds, or has held, a socket without SO_REUSEPORT, such as an earlier
instance of the same service that did not set the option. Without it
each of those binds compares the new socket with every socket on the
port, under the port's lock; it was added after a load balancer
restarted this way on a port holding about 100k TIME_WAIT sockets and
hit soft lockups. This patch keeps that workload on the fast path:

	     N     current   full check  this patch
	   256     0.13 ms      0.58 ms     0.15 ms
	  1024     0.63 ms      8.07 ms     0.69 ms
	  4096     2.63 ms    154.32 ms     2.83 ms
	 16384     9.80 ms   5874.11 ms     9.86 ms

N is the number of identical SO_REUSEPORT sockets, bound after one
socket without SO_REUSEPORT so that the port is in the
FASTREUSEPORT_STRICT state; the times are of their bind() and listen()
calls from a single thread, median of 5 runs on a build without KASAN.
"Full check" is the simplest alternative to this patch: never skipping
the checks. As N grows the full check slows down sharply, while this
patch stays as fast as the current kernel, so it keeps the benefit of
FASTREUSEPORT_STRICT.

Sockets that differ from the cached one in device, SO_REUSEADDR, family
or IPV6_V6ONLY now take the full check, so binding many such sockets in
alternation on one port is slower; the common mix of wildcard and
specific addresses stays on the fast path.

The two new fields, fast_bound_dev_if and fast_sk_reuse, fit in existing
padding: struct inet_bind_bucket stays 88 bytes on x86_64 and arm64.

Fixes: 637bc8bbe6c0 ("inet: reset tb->fastreuseport when adding a reuseport sk")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
Here is a minimal reproducer for the issue addressed by this patch. Line
10 should have failed with "OSError: [Errno 98] Address already in use"
but it succeeds. It works independently of what process or user created
the victim socket. An unprivileged process can exploit it to hijack
traffic on ports that are already in use by other processes.

import socket
P = 29341
v = socket.socket(); v.bind(("0.0.0.0", P)); v.listen(1)
s = socket.socket(socket.AF_INET6)
s.setsockopt(socket.IPPROTO_IPV6, socket.IPV6_V6ONLY, 1)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
s.bind(("::", P))
h = socket.socket(socket.AF_INET6)
h.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
h.bind(("::", P))
h.listen(1)

Skipping line 3 and setting P to the port of another process that
listens only on IPv4 (P >= 1024) works as well. With one such socket
the attacker answers the service's IPv6 clients; one copy per CPU
with SO_INCOMING_CPU also takes its IPv4 clients.

I conducted several tests on the patch to assess that it fixes the
vulnerability, that it keeps the workload the cache was added for fast,
and that it only changes the behaviour it intended to change. The tests
and results are available here:
https://github.com/AgusNicco/tcp-hijack-patch-testing

'1-attack' is the attack scenario where an unprivileged process exploits
the bug to hijack TCP traffic from other processes and users. It also
tests that the patch successfully stops the attack.

'2-reachability' tests how often the code modified by this patch runs,
to assess how much it could matter for performance. It runs during
startup and not during traffic.

'3-bind-behaviour' tests that the patch only changes the behaviour it
intended to change. It compares behaviour across 29.8 million tests
among 3 kernels: unpatched, patched, and one with an alternative patch
that always performs a full scan. The full scan kernel and the patched
kernel behaved identically in all 29.8 million tests. The unpatched one
behaved differently in 697,367 tests.

'4-performance' tests and confirms that the patch does not regress the
performance benefits of the commit that introduced the bug. That's where
the results shown on my commit message come from.

inet_csk_update_fastreuse() has filled the tb->fast_* fields in two
places since 637bc8bbe6c0, and this patch adds the two new fields to
both. A helper would remove the duplication, but I left it out to keep
this fix small for stable; the duplicated code is minimal and predates
this patch.

This bug was found by an LLM-based bug discovery pipeline.

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

base-commit: 19a227903e65c7a9c179156485660a4e017575fe
-- 
2.43.0
