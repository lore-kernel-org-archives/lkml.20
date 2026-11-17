Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888633;
	b=N1KbRdsV8w4/4PLtKksQjhQ4qgQvaifB1lT6rGU5u8ZYeuq/TsPeCig3OqV9SEt/tJp8
	 xQTYS0XQTx28tzsaIC0srWsCAV+Ulq1rOQs9iSSiVETAzfZize8PSoenqbtjBKJSgmJMR
	 osbaQAyl6qqCLinWcrua4hdfHO01mCZX5XqhqBvFOT9rUhRd1E+WJXujq9u5qyouoQ3qi
	 chS++8n+rqwDbQIwXkRfRX4syBciUmGmXhd6nKq2srwFhnaFN010Bo4bA6qgSz8u0q7Ob
	 XAkk12S6l52oYyETQvuLY1z/h3KXflOeXiika+LbaBzJidMH384wnZwSQNilHjywTjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=if6TDOPB4GDhRNlp84c9OQo0eTdPYoer26tyCt21+Yw=;
	b=Udc8Ltw8F5amJWvlJio+ECwOnKuJQVR9WZBMbPlUKI26kZW3+jvzA21fWMCr8FlEqyNb
	 nb5s7nfcmgf4fRuqybL9Jkv7GKv9nESOBkUxz1GYrUSHxcNzAnnaccjByhP+u6lcM8etJ
	 WOHoENAgex5p/Hjw7HR5spbrNZK8r+Pe4FE1NKjEJOTM2d3ddt4r6f/ii+cYNakTd6iRu
	 1NgT5geWOTTcVb0ZFEhsn/nzaKlnr/2INTobo1+QozJ47QU8WKoNYGf4elGkSTCQBpXDV
	 bJe88oNE8C8dl9Ns1pt2G/dG2217Bk4H/KCO28pcuYhItnZO939Y3acJS08W381xxsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zugq01SQ;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D06C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D06C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zugq01SQ
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-99e0b348a05so584096241.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794888632; x=1795493432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=if6TDOPB4GDhRNlp84c9OQo0eTdPYoer26tyCt21+Yw=;
        b=zugq01SQ0C0o4IWmkS1Phe0Mlc91P9HUo7vOtM08DORL/7teCbZm+3O/Tn1oeN1U7V
         WdiA/D3RdscIirK0rPpjNNaM2Bfsd85kFTTBg8brL6Yk3Ypj6al8WkYnxMtA1c5/Nq+n
         5lomE+61XPDRz3VoVnXZvRc6LAl9kcTB62lbjuTjRGQwLLUrO407NKp4XxkSwlC1rq37
         fDJs26jywgY8bEjrctTD+JQxTKbVBTH6agD/TRhNQI1kmb8VaG+OduDKTUZi9zfBzDFB
         plvbxP5r/3X8+rD2LWF2ap75A3+Cslt8dHdnZA0Z9E7UmYbFsRfgcMOG3PpsvdQN1abd
         qR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794888632; x=1795493432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=if6TDOPB4GDhRNlp84c9OQo0eTdPYoer26tyCt21+Yw=;
        b=EUflx+/OUxGUQp9LeQxh28RMRPI9xhWhekq2G42tMzrLRBkGFh8ev7olECkUkP4Pk2
         V7drTZBkPGC3e0weszu0osDe0EMLIcHYwZ+D1W05x+fyH6X4EZbk9IGxTCxha3mWdQtB
         pgCS34tTmwJzA6SR9ThU3jKNTlEFNzxCfIHoQr1M1u7CC+13iIQ4s9SMJD78iHpqbPRQ
         z7kgce4rdw3WFtrBrP5U5zMPzDgZLycRDcm7F+90+keMgaQ9ZgSUkOjw0wy9v66mRdrG
         FDKzmkLf+qj76z1tmMSfgxaFvyj/rPSzlKtQiSWI7Lg5gqYE6dI+1R1riTgTTvd/sqzf
         6ieA==
X-Forwarded-Encrypted: i=1; AL+hErHwwV4U9/pCaoawY48Szq2INZVHExTRmkGduT/rJOccCtqYXxUz0jb/SW664Gx50Erh5kH2bSZq9hm2n6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8cSJcbgztAdVOlYloSzsQ+rntmDoG8TTkVVGE5nQsNk4oNh5q
	mhj/eY9ygPJU5pLq+YoyolSdfNudjCaRtSAEkBPhVrJjlp34V7kzamcl
X-Gm-Gg: AYBFou3KK2VY6sNwqgU8vksKOQb74/aFW8WeNo1Nrw2bN8NTmpsx9ORr49XKwFpWUmi
	idiv9cQda/PxuZKZIwsd8dnVtxnB33m553uPm3OKJCxXGrAItLPvLKBp7bC9bIe8mrZfCxFT+d8
	Fr/MNwhbbKP/cKU3wm9odhqCsKqnBy3Hi0gpL/WczK6bzN6whK6ihFSktc8NIq8fsfvJZ+GllVC
	nE3cJGaJS0qphNj4fbNlLsc8Ss6rvVUCNp9t3/fiZ38jomYLuuLYerTX0PI0hM4Zr0Z385KdeCa
	RcxF02OfKUrIHD4OwodzuMwY9mm6eQ3l6V8AwIeaqL3eTCdDXsz5sFup5DqTfmn+rGni2aCpN7f
	c6ylwjsM3yuq92uyYTmHIsTK/bV4mo6Jw0GEJ8oWzvy54z/ILDddWC1k/Ug93BY8emr18K1rokp
	+e1t8In452nwWBWG2+1nFUSvUcFd0PTBRvJqxmq1nU2Me//pjV/1Q0L5jGfMiCAmq50LEyrR1MB
	iht28ZWej5FeDvkHSmU94yxr5THVATCJLzeHa98Yy8K3kSzkEnoZBRFaIpDsVQsbUEdubI/UbqE
	EKIbpHh89UDR7ycUQ7k5ZNCX+YX18UV85cd4ijxDeTUAxOdqzpJLAQ0SH+mv78dLdCtqq3XlccE
	xbSIPHadhn5LT
X-Received: by 2002:a05:6102:c46:b0:7d2:da5c:6f73 with SMTP id ada2fe7eead31-7d64d81ec2cmr4025026137.26.1794888631829;
        Mon, 16 Nov 2026 20:10:31 -0800 (PST)
Received: from MacBook-Air-91.lan ([2603:9000:d440:53a:79ff:d196:f709:1b3d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e33989bb3sm1401452241.11.2026.11.16.20.10.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 20:10:31 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] tcp_metrics: hash the destination address with SipHash
Date: Mon, 16 Nov 2026 23:10:29 -0500
Message-ID: <20261117041029.80543-1-juanagusnicco@gmail.com>
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

The tcp_metrics bucket is derived from a fold of the peer address.
For IPv4 the fold is ipv4_addr_hash(), which returns the address
unchanged. For IPv6 it is ipv6_addr_hash(), which XORs the four
32-bit words of the address. net_hash_mix() is only XORed in after
that fold, so two addresses of either family with the same fold share
a bucket in every netns.

A remote attacker with an IPv6 /64 can thus compute, without knowing
net_hash_mix(), addresses that collide with a chosen IPv4 or IPv6 address:

  w3 = w2 ^ p0 ^ p1 ^ target    /* p0, p1: prefix, w2: free */

A bucket holds six entries and the seventh insert replaces the oldest.
tcp_init_metrics() seeds the initial RTO from the cached RTT, so the
attacker can tell whether an entry it planted was evicted. Filling the
bucket of a chosen address with such entries reveals whether that
address, or another one in the same bucket, connected in the meantime.

The same test, with six entries of one fold and a seventh of another,
shows whether two folds share a bucket. Each answer rules out values
of net_hash_mix(), the only unknown, and since XOR and multiply is not
a PRF a few hundred answers recover it. The attacker can then fill
every bucket and see which one any client's connection evicts from.
The multiplication in hash_32() is invertible, so that bucket leaks
about 14 bits of the client's address, depending on the number of
buckets.

Hash the address with SipHash and a random key instead, as commit
2ee66e948717 ("inetpeer: randomize RB-tree node comparison using SipHash")
did for inet_peer. net_hash_mix() and hash_32() are kept, to separate
namespaces and to reduce the result to the table size.

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
v2: - use siphash_1u32() for IPv4, a4.vif is always zero in tcp_metrics
      (Kuniyuki)
    - call tcpm_addr_hash() once after the address family branches
    - changelog: explain more clearly why net_hash_mix() and addresses
      are recoverable
v1: https://lore.kernel.org/netdev/20261112064624.15245-1-juanagusnicco@gmail.com/

Comments below are the same as on v1.

This can be exploited remotely to recover a client's IPv4 address.
A single host narrows the address to about 262 thousand candidates,
and because each netns keys the hash differently, intersecting buckets
extracted from multiple hosts converges quickly into one candidate;
3-5 are enough. The net_hash_mix() value only needs to be extracted
once per boot per host.

Many common cases facilitate this. For instance, a browser loading
one page connects to several hosts within the same second. That
supplies the buckets needed to converge, and the shared timing shows
they belong to the same client.

I reproduced the bug on a QEMU guest running mainline (2a500a04d6f9) and
against Ubuntu 24.04 over the internet. With the patch applied, the
reproducer no longer finds addresses that share a bucket. The
reproducer is available on request.

For stable: 5.10 and 5.15 lack siphash_aligned_key_t;
"static siphash_key_t tcpm_hash_key __read_mostly __aligned(16);" can
be used there.

This bug was discovered during an LLM-based code review.

 net/ipv4/tcp_metrics.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/tcp.h>
 #include <linux/hash.h>
+#include <linux/siphash.h>
 #include <linux/tcp_metrics.h>
 #include <linux/vmalloc.h>
 
@@ -94,6 +95,22 @@
 
 static DEFINE_SPINLOCK(tcp_metrics_lock);
 static DEFINE_SEQLOCK(fastopen_seqlock);
+
+static siphash_aligned_key_t tcpm_hash_key __read_mostly;
+
+static u32 tcpm_addr_hash(const struct inetpeer_addr *a)
+{
+	net_get_random_once(&tcpm_hash_key, sizeof(tcpm_hash_key));
+
+	if (a->family == AF_INET)
+		return siphash_1u32((__force u32)a->a4.addr, &tcpm_hash_key);
+
+	return siphash_4u32((__force u32)a->a6.s6_addr32[0],
+			    (__force u32)a->a6.s6_addr32[1],
+			    (__force u32)a->a6.s6_addr32[2],
+			    (__force u32)a->a6.s6_addr32[3],
+			    &tcpm_hash_key);
+}
 
 static void tcpm_suck_dst(struct tcp_metrics_block *tm,
 			  const struct dst_entry *dst,
@@ -270,13 +287,11 @@
 	case AF_INET:
 		inetpeer_set_addr_v4(&saddr, inet_rsk(req)->ir_loc_addr);
 		inetpeer_set_addr_v4(&daddr, inet_rsk(req)->ir_rmt_addr);
-		hash = ipv4_addr_hash(inet_rsk(req)->ir_rmt_addr);
 		break;
 #if IS_ENABLED(CONFIG_IPV6)
 	case AF_INET6:
 		inetpeer_set_addr_v6(&saddr, &inet_rsk(req)->ir_v6_loc_addr);
 		inetpeer_set_addr_v6(&daddr, &inet_rsk(req)->ir_v6_rmt_addr);
-		hash = ipv6_addr_hash(&inet_rsk(req)->ir_v6_rmt_addr);
 		break;
 #endif
 	default:
@@ -284,6 +299,7 @@
 	}
 
 	net = sock_net(req_to_sk(req));
+	hash = tcpm_addr_hash(&daddr);
 	hash ^= net_hash_mix(net);
 	hash = hash_32(hash, tcp_metrics_hash_log);
 
@@ -310,18 +326,15 @@
 	if (sk->sk_family == AF_INET) {
 		inetpeer_set_addr_v4(&saddr, inet_sk(sk)->inet_saddr);
 		inetpeer_set_addr_v4(&daddr, inet_sk(sk)->inet_daddr);
-		hash = ipv4_addr_hash(inet_sk(sk)->inet_daddr);
 	}
 #if IS_ENABLED(CONFIG_IPV6)
 	else if (sk->sk_family == AF_INET6) {
 		if (ipv6_addr_v4mapped(&sk->sk_v6_daddr)) {
 			inetpeer_set_addr_v4(&saddr, inet_sk(sk)->inet_saddr);
 			inetpeer_set_addr_v4(&daddr, inet_sk(sk)->inet_daddr);
-			hash = ipv4_addr_hash(inet_sk(sk)->inet_daddr);
 		} else {
 			inetpeer_set_addr_v6(&saddr, &sk->sk_v6_rcv_saddr);
 			inetpeer_set_addr_v6(&daddr, &sk->sk_v6_daddr);
-			hash = ipv6_addr_hash(&sk->sk_v6_daddr);
 		}
 	}
 #endif
@@ -329,6 +342,7 @@
 		return NULL;
 
 	net = sock_net(sk);
+	hash = tcpm_addr_hash(&daddr);
 	hash ^= net_hash_mix(net);
 	hash = hash_32(hash, tcp_metrics_hash_log);
 
@@ -819,7 +833,7 @@
 	if (a) {
 		inetpeer_set_addr_v4(addr, nla_get_in_addr(a));
 		if (hash)
-			*hash = ipv4_addr_hash(inetpeer_get_addr_v4(addr));
+			*hash = tcpm_addr_hash(addr);
 		return 0;
 	}
 	a = info->attrs[v6];
@@ -829,7 +843,7 @@
 		in6 = nla_get_in6_addr(a);
 		inetpeer_set_addr_v6(addr, &in6);
 		if (hash)
-			*hash = ipv6_addr_hash(inetpeer_get_addr_v6(addr));
+			*hash = tcpm_addr_hash(addr);
 		return 0;
 	}
 	return optional ? 1 : -EAFNOSUPPORT;
