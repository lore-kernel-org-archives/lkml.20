Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907403;
	b=XkjsGN/kuqY/OUKo/AgMm5DJiHiSJTi7zbtEBVcTfHDUJJZFgyj/ETywbY6lmRKLI18x
	 y9BfYyE+F/lPZyzAaR1MwZXZy/QI53zOkWiNgDznCaF/C3FNwpkO5yrZlMbXj9qgsWcFX
	 ICMYax89GKEb+9rTwi8JqjtMvuujSZW6gMZ6W/LA7KMFlOA4a7JpZcMUAfwl/D4t+I4fs
	 g4BwEywdBinyEZ0v7U1VdAphjhUup8VmCHxm5NpIGnLB0LFHmy6UXuPHS+8cwqeEBIAyr
	 R6kzVYHDtbdDNUiM5aSkVPR/wcGcqYxF1N+DiU4D2KVzM2AFs+Hjk0lq5PWinPMwDgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907403;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=ycD+WqtVck2EPb3+9V4gC9pqmO9qQPx4RLdHVnNu3HM=;
	b=cxrbd4iKlicE/5k0KuPWvKlwyBj/9gu6OuJc5Cwd62HdPyjH23vFM3q2KsSi9p6bOICv
	 t82KjcAz6EswDX4/BOZ+cTz3FTF5M9lr3k226O1yOduQa+/VkKBmMR+U9PW03HgTV/nYj
	 oy7hM0XnT6ai4qZNZJrZN1bxwKuCpF3Cr6KhQhdA4pnNajyCdXm0wBDF0k9Bg6ZekKQx8
	 1/HKlhGIHFF3z7NGf+W6M2iF4RsSBp7wn91RVdQe9g9jqGhJgoPCOjkRZ6slcRrHVtVQw
	 Jrh35zh64ZtNqnbxcju/r881mQ97EYpN8s0zvxTRsfsTTLk+AkDHrefhPs9JBzsMnKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b="p7/LIrz2";
	arc=none smtp.remote-ip=195.10.208.46
Received: from mout-b-106.mailbox.org (mout-b-106.mailbox.org [195.10.208.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D8E606A323;
	Tue, 17 Nov 2026 09:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D8E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=p7/LIrz2
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-106.mailbox.org (Postfix) with ESMTPS id 4jTK5y24GYzNlqM;
	Tue, 17 Nov 2026 10:23:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794907398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycD+WqtVck2EPb3+9V4gC9pqmO9qQPx4RLdHVnNu3HM=;
	b=p7/LIrz2wirqRRCr7GhoyUYTEQkklzwPVQ+8X8vpISxVIyojW//d17s2JdUbdXFZnNcIcq
	7bqjZ5d+2lhvrlCSoF+cVLosWCjNwIVxm8GYljv3K2+ffk6bj7ZKqw+mKwOdROv1xwCQU4
	mJNU4/qpK4AiJHQIuTYYAH7AxixBHRBiXO4GMvMzhc6WXyQiylP+hnSptmf//fKsDlABr8
	HeXPi0Y/PqjNXYPF6/ahQnX+Ra/SKEVDzD+GSLMDiZShrFTp+tJxgfAJeWf7ICKWJwKv5J
	MJjgYoic7X0V6Iv/yFemlWz1Xsu0qMoIUAGkrUiEB4zfGMrfj7KuIJxPqKjx0A==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/3] ipv6: stamp the default route node with a fresh serial on link failure
Date: Tue, 17 Nov 2026 10:21:24 +0100
Message-ID: <5b59512a6c51c7a5d7c7b4e16728de3c522d9a1e.1794906743.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794906743.git.ralf@mandelbit.com>
References: <cover.1794906743.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jTK5y24GYzNlqM

ip6_link_failure invalidates the cached dsts of an RTF_DEFAULT route by
writing -1 into the node's fn_sernum. Once the node already holds -1,
another link failure leaves the serial unchanged, so dsts cached with
that cookie can survive subsequent failures.

The assignment also leaves net->ipv6.fib6_sernum unchanged, making the
invalidation invisible to lookups watching the namespace generation.

Use fib6_update_sernum under tb6_lock to allocate and stamp a fresh
serial. This makes repeated invalidations distinguishable and allows the
lookup-cookie generation checks introduced later in this series to
detect them.

Advancing the namespace generation also invalidates unrelated dsts using
nexthop objects, which are validated against that generation.

Found while reviewing the IPv6 routing code to address the dst-cache
race.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
---
Changes since v2 https://lore.kernel.org/all/143461e2c94a20060ff4c7d6e5eb46c47ac46aa0.1794384146.git.ralf@mandelbit.com/
- Add a Fixes tag referencing the initial git import. (Sashiko)
- Clarify that the nexthop-object invalidation is a harmless side
  effect, rather than a deficiency being fixed. (Sashiko)

No changes since v1 https://lore.kernel.org/netdev/5b039a5a24808f2678eedd283c29f8dae514ef5e.1793806941.git.ralf@mandelbit.com/

 net/ipv6/route.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 4a4c5ace63c5..cc505817399b 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2873,13 +2873,13 @@ static void ip6_link_failure(struct sk_buff *skb)
 			rt6_remove_exception_rt(rt);
 		} else {
 			struct fib6_info *from;
-			struct fib6_node *fn;
 
 			from = rcu_dereference(rt->from);
-			if (from) {
-				fn = rcu_dereference(from->fib6_node);
-				if (fn && (rt->rt6i_flags & RTF_DEFAULT))
-					WRITE_ONCE(fn->fn_sernum, -1);
+			if (from && from->fib6_table &&
+			    (rt->rt6i_flags & RTF_DEFAULT)) {
+				spin_lock_bh(&from->fib6_table->tb6_lock);
+				fib6_update_sernum(rt6_exception_net(rt), from);
+				spin_unlock_bh(&from->fib6_table->tb6_lock);
 			}
 		}
 		rcu_read_unlock();
-- 
2.56.0

