Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841314;
	b=IfrVldIzUqbQs/IhSZ3MPNJb46e6QtXJTeiMiV35sLx3ibh8kX3gKewmzr1wkNoO+5Kt
	 J9BEW/NH77AGhjVm9LfQk1i8IZ4bgvvRmzyOj2UtBnA69GAKvwE4Hm5v0iQLFNfzrkW1Y
	 xB7IKSQekb9v1vW1zoOFElsNdLIwLTcWKbm8P2E6G0Gz129oHJ8Bby7rX92No+Nz4gWLi
	 3MU1oJ5upPRDhI/641PM84Ngf6xySI8biN/hgj4JV+DJvgMnGXWAhDnt106wvQoshV8m4
	 Y563BBsSCpfclpCCy7DEpn0PVcnp4+CYXaEB277IcvFlWJo1IICkopzqtBaCKTLE2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841314;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:
	 DKIM-Signature;
	bh=nWU2LRdDXJ4j/FgpkY7ig95ec8lJA/+RUw4fK2JInKI=;
	b=PPPIa9Smes5hks60CAabJtEuCbH+/xpSRiE8Y5AV2paSY1PHKG68wQfzfG5vndjx1dwM
	 F3zFIUQ9fG+lqI8LA2L1On1SOQxALnAVxuXdbbqTWaiGAOXhHLFh+gG7nde2bNVMlLHAI
	 rLQPbj2UDj1jWtPTIR+/igYnNG22XcRmGwsp6MxKD+xMF9kpnkhvjML6tL6WrrPH+uEWF
	 eNmYarUXDb1sFN5DBeoWsYngELGFRmeCFIfqJGTuwufzGVdgaysIEEPbSsjXjEVYEELOA
	 Sz6QkNirwySnTkA2Y5B+5U/CHjMr5s622cmvXqlyJU5V0+iMCk0VrEqsfBvEQPKzaDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=gJqaubhk;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD4606A893
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19CD4606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=gJqaubhk
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 8B5046112D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:01:43 +0100 (CET)
Received: (qmail 22837 invoked by uid 990); 16 Nov 2026 15:01:43 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Mon, 16 Nov 2026 16:01:43 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: netdev@vger.kernel.org
Cc: leonard@lausen.nl,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Shuah Khan <shuah@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/3] ipv6: Use the FIB prefix length when suppressing cached routes
Date: Mon, 16 Nov 2026 15:01:28 +0000
Message-ID: <20261116150132.9594-2-leonard@lausen.nl>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116150132.9594-1-leonard@lausen.nl>
References: <20261116150132.9594-1-leonard@lausen.nl>
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
X-Rspamd-Bar: -----
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.599999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=CmlnvftUOEkMRs1fyX9q9MoUVh+kXC35NtIDAenZtp8=;
	b=gJqaubhkrs1lbdL52HG6W8XLf2BZH79RIvzubuE1pqscgpY+hX2gFtRt8hr8LfFx2IqxSgUdIo
	rP00IO+kwdrDlvMPhcOM0vES2qkP/f2EfvPP23iTFC0oL31WrhAasjYMiWcWz1jH7LbofyYBFic5
	emheHuksHyrtug3yrE2sFwSTvlQnueHJgx89dWOKHyXZwTb30NR0AeRAfO7ouqRC2Pw+M1OLE00q
	4Qv1SJ74pjEt/sbRqh+fiM+cRBLf1ptjvB3DurlYijAmDn64jh7NW+5gqjtuG1ZpqetpXAfe4mDk
	7pAGIr38hOCh/8KqZPc4lOM9/NPI8KWnQf5ncU+nK5q//5PWghhw4anRqGy9Hd14Gm/z6zCkbG+V
	oVZG4IJ7ggtvakGr1f85OlqehU6bYWT9wgKxT/t93iiS97kgj8oTV12Hx1Qs0Al+lwMZCv9062xN
	/xLUn3+iKhiAD6x4z0nrHMza97Uj0lO2DaO4OCnHkAALiwHijVfpR6OJ7jFlHO7myybb/BW37m2E
	k70kb5XBT4M4lJ3JH1VB8W1fKnbLManfUutVw1f5aqPnufxmUBlKaxYbf2gyTjfAGTBRLOVb+agZ
	35zM7GbWEYsN05/ap2FMbp9Qm1VHcWDjicRWADsXYVsDW3cRInL+HS0a4n9pq9CXcs9WT2cH3Liu
	k=

fib6_rule_suppress() compares suppress_prefixlen with rt6i_dst.plen.
PMTU and redirect exceptions have a /128 destination prefix even when
their parent FIB route is a default route. Consequently, a cached
exception bypasses suppress_prefixlength 0 and stops the rule lookup
instead of continuing to a later table.

Use the parent FIB entry's destination prefix length when available.
The rule lookup already holds the RCU read lock needed to read rt->from.
Retain the existing prefix check if the destination has lost its parent.
Interface-group checks and destination reference handling are unchanged.

Reproduced with a PMTU exception created by an ICMPv6 Packet Too Big,
without kernel instrumentation. Verified with the namespace reproducer
and nft_fib.sh on the rebuilt v7.4-rc2-based kernel.

Fixes: 7764a45a8f1f ("fib_rules: add .suppress operation")
Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
v3:
- New separate fix for the cached-exception issue identified in review.
- Reproduced with ICMPv6 Packet Too Big and verified on the rebuilt
  kernel with the reproducer and all seven nft_fib.sh cases.

v2: https://lore.kernel.org/netdev/20261115114434.10343-2-leonard@lausen.nl/

 net/ipv6/fib6_rules.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/fib6_rules.c b/net/ipv6/fib6_rules.c
index 0ffd7b47a046..5e2a79a81bf3 100644
--- a/net/ipv6/fib6_rules.c
+++ b/net/ipv6/fib6_rules.c
@@ -285,6 +285,8 @@ INDIRECT_CALLABLE_SCOPE bool fib6_rule_suppress(struct fib_rule *rule,
 	struct fib6_result *res = arg->result;
 	struct rt6_info *rt = res->rt6;
 	struct net_device *dev = NULL;
+	struct fib6_info *from;
+	int plen;
 
 	if (!rt)
 		return false;
@@ -292,10 +294,13 @@ INDIRECT_CALLABLE_SCOPE bool fib6_rule_suppress(struct fib_rule *rule,
 	if (rt->rt6i_idev)
 		dev = rt->rt6i_idev->dev;
 
+	from = rcu_dereference(rt->from);
+	plen = from ? from->fib6_dst.plen : rt->rt6i_dst.plen;
+
 	/* do not accept result if the route does
 	 * not meet the required prefix length
 	 */
-	if (rt->rt6i_dst.plen <= rule->suppress_prefixlen)
+	if (plen <= rule->suppress_prefixlen)
 		goto suppress_route;
 
 	/* do not accept result if the route uses a device
-- 
2.55.0

