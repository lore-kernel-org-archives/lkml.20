Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4895130649C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311062; cv=none; b=tHKJucjVBq8Yd7rlmYZEEdNLkUWGLfFuWYLXdEOpazulENHexVHgVOjhbVdVVj4Z0jSj/141vydGitQNoRi1/CoGUoNzksFPehI9mSfgAmSE6edMKI290Eoa3Pai7SHBOY/m05keeFGiH+++xDUl3OEF/5QRaRGaPKyFKf0xCq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311062; c=relaxed/simple;
	bh=Dq5UyI2XGKVEHYLJ4tWPWAEkFCi3pSgRDI2MzuRchnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=InOnJdG5Zo6gmGKivGZHNDh5LgnUMEcxgF4ZuR+xYHQVLsdPoEU8LUCBotyDyDPs52aRSDEO/kmDgtZ+a67mqRcIKyDJqYAQ1wTO3NPwJ9MJrrzNNwj3WlKGqDDKHUStJkYcPJVW+FJkuFh1zkwdgeu6iMBeLFWG8sTgl8EmyDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnntFiMD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnntFiMD"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8525efa7274so411034b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788311060; x=1788915860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eI2Ohe4pJEhqiz6K2k0vJtzHDraEJV/HJp7zS58ORf4=;
        b=nnntFiMDaLKc4Cq0GkNsKBdy3Um3BzEN/NREGLuybTGQq/2fA8veFgqHMJd45O0y4g
         Ne+Wlx48IpXDSbyUeyCoHC8qrGKQskKEIVtOdl24x+xg3SW64YjmnNNVQ89cXfLJszWM
         cMH+mjwwyU/97Llj6j4oCysg+8AsItxb8YE4MAXEUUxJkjyLWqRDWRIuRY0MlUYXttAS
         J1IqhZu293QNSCLk1D4PEgCWWNo98+mWuIlLMHCe1yj6D1GfZJUzNPQmhsraZudh+6uX
         yeZxb69aD3Xxp02CYtegT4VpqP/X4BDmP+l8W8MBC3Kj2bo4EmHlHfbpkQk32koJqroM
         FYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788311060; x=1788915860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eI2Ohe4pJEhqiz6K2k0vJtzHDraEJV/HJp7zS58ORf4=;
        b=qyaOazCctr9lYWVh5waugF4ygqxG8KPDiOOLLxF0so0jS2XPG2iUJPg3J8RIq7enSZ
         NQKQoGbSEBpG4e/SVZ+iuuCQq57VyaWvM9+D88y71gc3s7MzS6z+A1qXMgJMlVvCFeQb
         bM6TBDrzEhj70B5CE+283A+rG+6BnB2NsZW0Sys+/tFzE3A89t9+IORpl9C6G/kdw+/a
         2i/rQ2Q0u+wQ7bSkVkGDTShNozuL0Gzw3Pb4jCWen662LztRUPgi4NKPC/a5cI5bYpjb
         sJGbiRAWElm73M4oi0j4b5zCDkG087J7lSQRzZynHcQ/76J0fBwHgP5DE4RcBzQMwAhc
         8cEw==
X-Forwarded-Encrypted: i=1; AHgh+RpWZuH1K0Saf1qlO8pkggzwiSuInDRblL6wMf70VJ5jFLtJXA28ygPNACF7wqsskNCTmeU2zUKRXmzeoDE=@vger.kernel.org
X-Gm-Message-State: AFuF++nkQm8yh3yXHFAfCSDjIOqDk8R9XAcn98LuzUTpEpnI8gQj+5Yb
	r/JDpbBByQE2J9M4altNRohmGLHe2OWjLPC7FpKnRjZsofoueL2gVuZ9
X-Gm-Gg: AR+sD11c5S0wgyU0WrIQHMzDD9hjL9EsjHBENGviv+g5XYlNkfc/jaesD3iKYfQcu88
	VrH1PNBC+roR5OKXwXAW+6jOGq8iZL/Rx24A4WN3J0w7/PKEc4vkNJUcKq0T/iGElHnFrbPYo7M
	2tPDMer1af0nFUYqvYYHR75nYbKTl40zOKEWxmqtjdafcEpl7UkdlEGe24C2u+xD9B48x9RS8Q4
	OHs9Er7OJYSyeEc3X3yavxHLwoSVF0OdXHlkPK/rzsRAo/50VwqwjMHOKC/O8n7USL9patc/9vc
	Sz0+zZan6b4XhK7U6jrdmkvONUnGme/ACos3d706JUCd9l5RIs5XrZdgL7sfIxbsEPwD4ugrFk3
	4JnOJTA2+sLTbwiRckAC3tDNu6BluvLUep114/Yyu2zAomZtnlXPKDh5wqgzXRqd0P5RzIpGDJJ
	Gq6QUdToXHKIJZoP3mSpUXyJtVk9mI3Vb2yPlnU1Im1N8IUMQEYQJU2JRN+o3qqRaXb77SLxALv
	oTIO/CBvr5w
X-Received: by 2002:a05:6a20:7283:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3d9ac94bb04mr1352340637.8.1788311060538;
        Tue, 01 Sep 2026 18:04:20 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d036d0asm252394a12.27.2026.09.01.18.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:04:19 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Vladislav Yasevich <vyasevic@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] udp: revalidate socket family before publishing an IPv6 cork
Date: Wed,  2 Sep 2026 10:04:05 +0900
Message-ID: <20260902010408.1057857-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udpv6_sendmsg() prepares IPv6 flow and route state before taking the socket
lock when a datagram is corked.  IPV6_ADDRFORM takes the same lock, but it
can convert the socket to AF_INET during that lockless preparation because
no cork has been published yet.

If the conversion wins, udpv6_sendmsg() can publish an AF_INET6 cork on an
AF_INET socket.  Uncorking through the IPv4 operations then writes a
20-byte IPv4 header into the 40-byte IPv6 reservation while the retained
IPv6 dst routes the skb through ip6_output().  ip6_finish_output2()
consequently consumes the unwritten 20-byte tail.

An unprivileged reproducer triggered the mixed state on 12 of 10,000
sockets.  KMSAN reported an uninitialized-value read in
ip6_finish_output2() on three fresh boots, with the allocation origin in
__alloc_skb() through __ip6_append_data().  The same process recovered the
20-byte region from the TX timestamp error queue on all three boots; one
contained recognizable nonzero stale heap data.

There is also socket state to handle before cork publication.  A sendto()
with an AF_UNSPEC address clears its explicit destination and later selects
the stored peer with connected set.  On an ADDRFORM-eligible socket with a
mapped peer and a suitable IPv6 route, ip6_sk_dst_lookup_flow() can
therefore publish an IPv6 dst in the socket cache.  A native connected send
racing a new mapped connect can reach the same store.  Revalidating only
after lock_sock() prevents the mixed cork, but does not cover the non-cork
path or undo a dst stored before conversion.

Close both orderings.  After a connected IPv6 lookup, reject a socket which
has already been converted and reset any dst the lookup may have stored.
When UDP ADDRFORM publishes the AF_INET family, reset the socket dst after
the family write.  Thus, if the send stores and checks first, the later
conversion clears the cache; if conversion and its reset happen first, the
send observes AF_INET after its store and clears it.  Keep the locked
family check before cork publication to prevent the original mixed cork.

With a mapped loopback route supplied before dropping to uid 65534 with no
capabilities, an unpatched KASAN control reached ip6_sk_dst_store_flow()
from the AF_UNSPEC send.  On patched current net, the sequential conversion
released that dst from do_ipv6_setsockopt().  Corked and non-corked races
both reached the dst store, then returned EAFNOSUPPORT when conversion won;
the converted socket's follow-up send used only udp_sendmsg().  No KASAN,
Oops, warning, or panic followed.  The concurrent mapped-connect variant
was validated from the same source ordering, but was not forced in a
dedicated runtime interleaving.

Fixes: 03485f2adcde ("udpv6: Add lockless sendmsg() support")
Closes: https://lore.kernel.org/netdev/20260825160630.1888866-1-4ncienth@gmail.com/
Link: https://lore.kernel.org/netdev/a86aa34a-8bea-46d2-a785-6c423ac00b1d@redhat.com/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
Changes in v3:
- Address Paolo and Sashiko's finding that AF_UNSPEC and a concurrent mapped
  connect can publish an IPv6 socket dst before the family revalidation.
- Revalidate after a connected route lookup and reset a dst stored after an
  already completed conversion.
- Reset the UDP socket dst after ADDRFORM publishes AF_INET, covering the
  opposite store-before-convert ordering and the non-cork path.
- Retain the post-lock family check which prevents late AF_INET6 cork
  publication.
- Add route-enabled, zero-capability KASAN matrix and cork/non-cork race
  validation. The separate privileged sockmap mismatch remains out of scope.
- State that the concurrent mapped-connect variant was source-validated but
  was not forced in a dedicated runtime interleaving.

v2: https://lore.kernel.org/netdev/20260829132125.1160893-1-4ncienth@gmail.com/
v1: https://lore.kernel.org/netdev/20260825160630.1888866-1-4ncienth@gmail.com/

Testing notes:
- Build and runtime validation used x86_64. Sparse was unavailable;
  allmodconfig and multi-architecture builds were not run.
- The tested reproducer is available privately on request and is not included
  in this public AI-assisted security-fix submission.
---
 net/ipv6/ipv6_sockglue.c |  1 +
 net/ipv6/udp.c           | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index b4c977434c2e..59ca446d3156 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -611,6 +611,7 @@ int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 				WRITE_ONCE(sk->sk_prot, &udp_prot);
 				WRITE_ONCE(sk->sk_socket->ops, &inet_dgram_ops);
 				WRITE_ONCE(sk->sk_family, PF_INET);
+				sk_dst_reset(sk);
 			}
 
 			/* Disable all options not to allocate memory anymore,
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index 93478d1ad576..8ba552f1a6b2 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -1705,6 +1705,12 @@ int udpv6_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
 		dst = NULL;
 		goto out;
 	}
+	if (unlikely(connected &&
+		     READ_ONCE(sk->sk_family) != AF_INET6)) {
+		sk_dst_reset(sk);
+		err = -EAFNOSUPPORT;
+		goto out;
+	}
 
 	if (ipc6.hlimit < 0)
 		ipc6.hlimit = ip6_sk_dst_hoplimit(np, fl6, dst);
@@ -1729,6 +1735,11 @@ int udpv6_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
 	}
 
 	lock_sock(sk);
+	if (unlikely(sk->sk_family != AF_INET6)) {
+		release_sock(sk);
+		err = -EAFNOSUPPORT;
+		goto out;
+	}
 	if (unlikely(up->pending)) {
 		/* The socket is already corked while preparing it. */
 		/* ... which is an evident application bug. --ANK */

base-commit: 70f3995830d3f1e79faa14eb0605914f778feca9
-- 
2.55.0
