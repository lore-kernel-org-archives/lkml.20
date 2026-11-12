Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794465992;
	b=kSdv8kRlx7aLhZrh8v0TWvK/SO/xBjwH9eUR0+cBm7dZvTba2FbUTQXIGwuMtrchwFc5
	 hPdiRBQ9cb5htpaBNLCasE3nCzZvFoVDbKH8bmr6uOK3Pf9j6Ukfpbn2mv2gsluxYikyW
	 jJ+wxudFbcekBj7whDsF19NHmlwSDMi4FGKHrpp6YVGQ7548GXnLmNoEUCRxq+xr9S7gR
	 xBCZAwDurpLkepc7NDPYpsvqHzZNkO5DQu4iYOsHCvC3eaTatufGs3afQ6R7lhj+PO5DG
	 iQy0OiwMCV3Dc2HRXW2VHRkcaoG2KMwX+ijDw4eb4mW34oZloAG01G11ncx6yAjBdIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ntDd/S6L1RCmt2oOT/IfmwbQKnfoI4o0MqE17OZVDwQ=;
	b=2MZ40fqQjPucL1NCr0nTxCu0NMgkc/T6CrVRJHagF9GZK+c0pT9KNL9ij6rV4CFSxmZA
	 9wDm3hY5rsLV1gMH+RbCcevMJ3MyeWLClxn71ayOUSEzqmADT+05CojGhU3sEIXFiG5Od
	 GBdqP2Gv3UQZZKPe/KHvPdmiZM9D/Gsp0kWcKJzb8TJOK5eErSvkZYTduTLAIkvzlN9XC
	 4uN5rXe4xntT/YbY9TPcko55ssbifD90r8vIohzStCWpprIjoT5jUCQoO4WTcXGt+V3eu
	 KdI41kr6cAggRTlescLZC4cL4OB0DMjjqF5Ab5QxFm2U+ykK+ho5dCrtrTgDSvH4HLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNBm4s88;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F244606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F244606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNBm4s88
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-677bc4704cbso4606162d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465991; x=1795070791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntDd/S6L1RCmt2oOT/IfmwbQKnfoI4o0MqE17OZVDwQ=;
        b=yNBm4s88C2IB7zlunIssuy+UbsDs1TkX1LT/9Hh5TZhuYv60Zj3fmnJq1AoJJ24JgZ
         AfxQTGrYe9+A8dvjyw7mTXTA23j6RrML62LVYxOKiYAZdLhhxlyOmXmqqRYYM0NIbCVP
         qteyyNE3qmAfeCqZOQDx4O1mKifh8jYEFeH2XX+ck7VmBYmuIPLV85J/SVuA7CbEgnzk
         PJPaedCgd0w1yeXIAOqcbyCbiLyvPB9L/R5xV3TBzcgMNeWKY1j0jfvVzae0nOjFmH/s
         Eg4cSvAWCdoi8qXrog36Y8JaCMNfIVrEUu6b8dD16C7h8gA5tH2f+kGxOAA0nt0X8nDt
         JW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465991; x=1795070791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntDd/S6L1RCmt2oOT/IfmwbQKnfoI4o0MqE17OZVDwQ=;
        b=i9lUodZR9KJ3xW3OU3i+B2GY2xYoJuJ1dpu0SdzaYYUx9Qi+gjOJYxCwuReyGKdKM6
         9Y18nB0odv/J4dyQZPfVWaNXd0YSNuPwCNPWgGJNovQznmUpHXzOfESbNvZnqW+je700
         HewRS5qjD0aUqGKvSfdk4ohSIZg7LqigirEPVvTGYgv7iQH078Uy2LX2qKosqtip1g93
         u6YyQG7I+MO3adSOrsNYm0OSk9P4+DN0WflIf3PmNhedP8yCIoCvOiOyQPWkF7pH5Stc
         qOyJ9XJyPQ3Ktq6vTVnO7gLkgdy1iP7Ngcbsczwp5s/31l0t9fNyCgzV/O4ei0jj6XJM
         pTbQ==
X-Forwarded-Encrypted: i=1; AL+hErH99yx1vtR6CprIk6QzMpfpbpcvx/ApRyFU5ttn2xOT0IUQhZ81bctygHsU8dlnw/V2tGy6Qr5A00aydyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yNna50KTnyX99U4iL7Ezw8D9H65PFeZ4qmBm6l63nA+/dSuhD
	TyAVVms0AfxpvbTtZVnjO+4jfCszRpWpTdPZwvaKwmZQg895XfsVu2P7
X-Gm-Gg: AYBFou1oAd0xW9EfnIbGEpGVsu8xRK0xeoPMCZAY2i4tOaqTLWF/8l8CMHhs+yDxejN
	vAiOs9/VNCxS/nuxZdZ19dSvP/20AvJCpR5irrtMti16zTq/NKSIIJ9y5NnXQWpN9lbbSjiL1v9
	AkJ3+3UXKnMmVei+FK9lubSSiPasbSFEC/wT8zVsdebqxI4mt5YFFz81peLM4S5wrz//8TwntOt
	xddlsCJXD20xcd6FXbsq3Ibg6i6VXgrwk8afpE3YhE+hgd2Rh0/wd9Z97EMAkh6sTlJdRSF4qYO
	WyjFPo1E+Js8pcpZtL7J/Bu59QdhhhnMP5P/o+bzANvjYMDBEjUwWJVNb/imI+owDDCciuU9i/T
	GrtHjfCeyO3uInp4+40x1RgEHb2FE19YHpese3rCDwvskPGxh4Erf249lCHxbWid9z7XF/bU/eM
	6xhVzBmQtLPO5nU7mt+zKwvL6hxvhfE3IEl4aSlBt5F0lDDzRjUo714BDof/8e405jtZ+phg0pG
	Krv2qlkzzKDQQ5AomQtYOf1isJzMtpMD2HstmG+9sMlBuYNRV3cxKW689KmbV8GPlIt8De7DFDD
	w8qz8EVYfsjDuIwzd5I/8dgfPyI5xxGtLtKAJrr+zz5D+A72Egf27g==
X-Received: by 2002:a05:690e:140d:b0:67c:2350:5b8c with SMTP id 956f58d0204a3-67c67fd76acmr2791998d50.26.1794465989718;
        Wed, 11 Nov 2026 22:46:29 -0800 (PST)
Received: from VPN-156-197.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a3450sm6629012d50.4.2026.11.11.22.46.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:46:28 -0800 (PST)
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
Subject: [PATCH net] tcp_metrics: hash the destination address with SipHash
Date: Thu, 12 Nov 2026 01:46:24 -0500
Message-ID: <20261112064624.15245-1-juanagusnicco@gmail.com>
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

A host owning an IPv6 /64 can thus compute, without knowing
net_hash_mix(), addresses that collide with a chosen IPv4 or IPv6 peer:

  w3 = w2 ^ p0 ^ p1 ^ target    /* p0, p1: prefix, w2: free */

A bucket holds six entries and the seventh insert replaces the oldest.
An off-path host can fill a peer's bucket with its own entries and
later tell whether one was evicted, because tcp_init_metrics() seeds
the initial RTO from the cached RTT. This reveals whether that peer,
or another address in the same bucket, connected in the meantime.
XOR and multiply is not a PRF, so net_hash_mix() can be recovered the
same way, after which evictions leak about 14 bits of any client's
address, depending on the number of buckets.

Hash the address with SipHash and a random key instead, as commit
2ee66e948717 ("inetpeer: randomize RB-tree node comparison using SipHash")
did for inet_peer. net_hash_mix() and hash_32() are kept, to separate
namespaces and to reduce the result to the table size.

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
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

 net/ipv4/tcp_metrics.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/tcp.h>
 #include <linux/hash.h>
+#include <linux/siphash.h>
 #include <linux/tcp_metrics.h>
 #include <linux/vmalloc.h>
 
@@ -94,6 +95,23 @@
 
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
+		return siphash_2u32((__force u32)a->a4.addr, a->a4.vif,
+				    &tcpm_hash_key);
+
+	return siphash_4u32((__force u32)a->a6.s6_addr32[0],
+			    (__force u32)a->a6.s6_addr32[1],
+			    (__force u32)a->a6.s6_addr32[2],
+			    (__force u32)a->a6.s6_addr32[3],
+			    &tcpm_hash_key);
+}
 
 static void tcpm_suck_dst(struct tcp_metrics_block *tm,
 			  const struct dst_entry *dst,
@@ -270,13 +288,13 @@
 	case AF_INET:
 		inetpeer_set_addr_v4(&saddr, inet_rsk(req)->ir_loc_addr);
 		inetpeer_set_addr_v4(&daddr, inet_rsk(req)->ir_rmt_addr);
-		hash = ipv4_addr_hash(inet_rsk(req)->ir_rmt_addr);
+		hash = tcpm_addr_hash(&daddr);
 		break;
 #if IS_ENABLED(CONFIG_IPV6)
 	case AF_INET6:
 		inetpeer_set_addr_v6(&saddr, &inet_rsk(req)->ir_v6_loc_addr);
 		inetpeer_set_addr_v6(&daddr, &inet_rsk(req)->ir_v6_rmt_addr);
-		hash = ipv6_addr_hash(&inet_rsk(req)->ir_v6_rmt_addr);
+		hash = tcpm_addr_hash(&daddr);
 		break;
 #endif
 	default:
@@ -310,18 +328,18 @@
 	if (sk->sk_family == AF_INET) {
 		inetpeer_set_addr_v4(&saddr, inet_sk(sk)->inet_saddr);
 		inetpeer_set_addr_v4(&daddr, inet_sk(sk)->inet_daddr);
-		hash = ipv4_addr_hash(inet_sk(sk)->inet_daddr);
+		hash = tcpm_addr_hash(&daddr);
 	}
 #if IS_ENABLED(CONFIG_IPV6)
 	else if (sk->sk_family == AF_INET6) {
 		if (ipv6_addr_v4mapped(&sk->sk_v6_daddr)) {
 			inetpeer_set_addr_v4(&saddr, inet_sk(sk)->inet_saddr);
 			inetpeer_set_addr_v4(&daddr, inet_sk(sk)->inet_daddr);
-			hash = ipv4_addr_hash(inet_sk(sk)->inet_daddr);
+			hash = tcpm_addr_hash(&daddr);
 		} else {
 			inetpeer_set_addr_v6(&saddr, &sk->sk_v6_rcv_saddr);
 			inetpeer_set_addr_v6(&daddr, &sk->sk_v6_daddr);
-			hash = ipv6_addr_hash(&sk->sk_v6_daddr);
+			hash = tcpm_addr_hash(&daddr);
 		}
 	}
 #endif
@@ -818,7 +836,7 @@
 	if (a) {
 		inetpeer_set_addr_v4(addr, nla_get_in_addr(a));
 		if (hash)
-			*hash = ipv4_addr_hash(inetpeer_get_addr_v4(addr));
+			*hash = tcpm_addr_hash(addr);
 		return 0;
 	}
 	a = info->attrs[v6];
@@ -828,7 +846,7 @@
 		in6 = nla_get_in6_addr(a);
 		inetpeer_set_addr_v6(addr, &in6);
 		if (hash)
-			*hash = ipv6_addr_hash(inetpeer_get_addr_v6(addr));
+			*hash = tcpm_addr_hash(addr);
 		return 0;
 	}
 	return optional ? 1 : -EAFNOSUPPORT;
