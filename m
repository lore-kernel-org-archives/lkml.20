Received: from mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC1F43DEDF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122285; cv=none; b=u9COpUaLTcWutt6/PTEkH2I24XpTNNojelSGIqImlIBsWL84kCCSx0KBr725miz7vJ0gkIMg8a4Bdz6V0blt5Fi/lOiMiy86iGIwbC9f3oewW8Xg26XHlHwwI1UWjgAuCmNVy0UiFbTm6h1gdWBI/I6juQqDr6sdd6K3+zv+R0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122285; c=relaxed/simple;
	bh=l7+9c5zwjLVYxvhKf3ZRi1rGsctqjpbWc4slKLd1B+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkQSx4k/n7w1vjJd74amnYZFHllHfmjH7i3o19ReupCziA4p7hXT18UjbvY8c2vw2x5sICpXBw6kvLJfbn5bKl0rqj8RLEop57jmM7PrbjjkUG8J5dkwFrEU20+yIVlJHsDfLL96N9fwigkXV2LF+G24URNMnyfnD0rc2ILJ6T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sjn0Z6xw; arc=none smtp.client-ip=91.218.175.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sjn0Z6xw"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l7+9c5zwjLVYxvhKf3ZRi1rGsctqjpbWc4slKLd1B+8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789122280; v=1; x=1789727080;
 b=sjn0Z6xwF0sGlctjKRr3HULe6VEpERNVoeNMqOVyWKuh0HQ0Ku2SOW0ucv7EK6qKu8FNKlfC
 ElpaJL+Cb05NxsI3v1Ydf6iB7hkQ7CY/W5ux0jEdTYeMTtZcQTLkS8Z7N6j5meAb0Lb9X/GyR+Q
 3PyEXHHHK1K6M6IiN75PlXmA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 121f891faccde060;
	Fri, 11 Sep 2026 10:24:40 +0000
X-Mizu-Trace-ID: 121f891faccde060
X-Migadu-Flow: FLOW_OUT
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Subject: [PATCH net-next v1 1/2] ipv6: make IPV6_FREEBIND setsockopt lockless
Date: Fri, 11 Sep 2026 18:24:17 +0800
Message-ID: <20260911102418.157071-2-xuanqiang.luo@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911102418.157071-1-xuanqiang.luo@linux.dev>
References: <20260911102418.157071-1-xuanqiang.luo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

IPV6_FREEBIND still takes the socket lock despite using
inet_assign_bit() to update the flag shared with IP_FREEBIND.
IPv6 TCP and UDP sockets can already update this flag without the
lock through SOL_IP/IP_FREEBIND.

Move IPV6_FREEBIND to the lockless setsockopt path.

Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
---
 net/ipv6/ipv6_sockglue.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index 1f68fb64a43ef..4124084c3cd79 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -398,6 +398,12 @@ int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 
 	/* Handle options that can be set without locking the socket. */
 	switch (optname) {
+	case IPV6_FREEBIND:
+		if (optlen < sizeof(int))
+			return -EINVAL;
+		/* Shared with IP_FREEBIND. */
+		inet_assign_bit(FREEBIND, sk, valbool);
+		return 0;
 	case IPV6_UNICAST_HOPS:
 		if (optlen < sizeof(int))
 			return -EINVAL;
@@ -679,14 +685,6 @@ int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		retv = 0;
 		break;
 
-	case IPV6_FREEBIND:
-		if (optlen < sizeof(int))
-			goto e_inval;
-		/* we also don't have a separate freebind bit for IPV6 */
-		inet_assign_bit(FREEBIND, sk, valbool);
-		retv = 0;
-		break;
-
 	case IPV6_RECVORIGDSTADDR:
 		if (optlen < sizeof(int))
 			goto e_inval;
-- 
2.43.0

