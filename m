Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841314;
	b=DP9kzsy6yeeXTQ1cjXRqgsujRwV2wZ5iQiSzAmJbGEbUAfIfk9kpqEGa257UwFFww0rV
	 WhwesZHJKuEF4wD4GsZF1MZjDpsxoIUwBXHjHYc8DoahS5VVIASZTR50eHf2Twp3Z5mJn
	 v53lR66n+xrNXDVt07p9YKWJfLGEdBlFScod91DjQwjBOSW874dk7IPGOeqRAJzBbAWQ+
	 CSBwKWGLxVYDgMnjxgb6+Nc1Ps1AgvV7mQ0j0s0HQbzHHrK18lQmmBaczKxQZrF225ZbI
	 YzogyBmuv1TjkuQhNgx9SFp9KnWfm2dMyR+Ahfnx3eaCcj0P53Iu8YpBgN7mfecpwQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841314;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:
	 DKIM-Signature;
	bh=Wo4nNIcoh0LXFWMtrIhyrynbD6vLJoBNHUpOAURFHxk=;
	b=WPsdjAWKFq6GeSKds5Q/Mjm0Z4dUYq3aEfZ8AH+ecPh1XRwgNjgdS+NaYWLkTs37wdS5
	 3VMXDG5IDwuIp6pIWEirFYqYYtLpYZoG88Scj2Yi3gnPQioMDKiEBzLJ7d9bKGLng5Csr
	 4fWNb7d08vVBUd5J8ysqe4JoNRscB+jj8tUN004lBwuzjK2ijulciwfz62XVxs0Inuv4h
	 eUumi7okgFI0rx7HUn2AoZ+/xypQUhs82tHMdZeoeikPfAouD/HXahfgeC1bvpuhl/N9b
	 7S1OSiyjI1p80PJ77cZVWtg1ji8zxlJRklV4eU83n/dE/aN39SAKzWigj9L15Lrdx4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=AyaU0cxX;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FDF606A897
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FDF606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=AyaU0cxX
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 1087761160
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:01:45 +0100 (CET)
Received: (qmail 22922 invoked by uid 990); 16 Nov 2026 15:01:44 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Mon, 16 Nov 2026 16:01:44 +0100
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
Subject: [PATCH net v3 2/3] ipv6: Honor suppress_prefixlength in fib6_lookup()
Date: Mon, 16 Nov 2026 15:01:29 +0000
Message-ID: <20261116150132.9594-3-leonard@lausen.nl>
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
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-2.999968) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.599968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=FdClypnVvZxUzIm2CqkbBUoQEUR5XIG05mWhickNlvY=;
	b=AyaU0cxXd6WpBcT1PB6zWYQe6hkqKxWn3HzBpNxgZz1md4X/h2Y8WNNtC9/pWgorclJngM/tue
	4sBBq9JPlaeGfmMhjCnwjGbFJ4PEHUmnva4OlF08bvLfBYNlROyKFLt2p3UfQ68uIEKJl8mGaUx+
	HaLtg7GMWOsu+xERGcphtiyaU8FEtnmt88kl25clK34ZQJPgjP214lGnHQaB8JmusgQDSM3JbnP6
	kkP64FLaSwyzZKuXAYXZ12iEYVFt4AqwJPZSiCI79l662GhglOAsPoC5dDBMxQ9ST8TDR2ucDjyx
	fk7hlfbmCrZvzUwZnS+G9HZ+iupx4p8dL7iM0IJPiD2C8zdPXhFpieJkGqvmRoi/uldLEZqjCOGw
	14UlaXFojx6NOrXyzz9E2iCTGZm1PKWlqg6qZbD0YMgDSXqcXTfatOof7vdlXDeHvZSN+10b1sIe
	+vLKTNoVRMdqtup/7Zk566qHh7CSR2ZjBMOLqVNrXr+BO73YhKnBxONPnLiHdfpFm4mwzs6cO4us
	vjFjOoWF58eFalKTwg0CmDAoSWG7Qv5CRcHgBIXn6K3dloz3L3ZLwxZW7sBa0OB4XfnJgvwckYO/
	in6WkEaFvAFZBTLe3sRuFDTkN3hMEL34ySWC0DdjUJ+8pSGcvjeyIxkywyTNY+OAnz3aHGzY143R
	Y=

When custom FIB rules are configured, fib6_lookup() performs the lookup
via fib6_rule_action_alt() which calls fib6_table_lookup() and only
populates the f6i, nh, fib6_flags and fib6_type fields of the FIB
result. However, fib6_rule_suppress() only examines the rt6 field, which
is only populated when the lookup is performed via one of the callers of
fib6_rule_lookup() such as ip6_route_output(). As a result,
fib6_lookup() ignores suppress_prefixlength.

This was not a problem for nftables until commit 1c32b24c234b
("netfilter: nft_fib_ipv6: switch to fib6_lookup") switched the FIB
expression from ip6_route_lookup() / nf_ip6_route() to fib6_lookup().
Since then, with a rule that suppresses the default route in the main
table before looking up a VPN table (as commonly configured for
WireGuard), the FIB expression returns the suppressed default route
instead of the VPN route. Strict reverse path filtering then drops
replies received over the VPN.

Fix by evaluating suppress_prefixlength against the prefix length of
the FIB entry when the lookup is performed via fib6_lookup().

fib_rules_lookup() only invokes the suppress callback when the rule
action returns 0. Unlike __fib6_rule_action(), fib6_rule_action_alt()
returns 0 for reject routes and instead sets RTF_REJECT in the result.
Do not suppress such routes so that they continue to terminate the
lookup, as with ip6_route_output() and IPv4. Check the flags in the
result rather than in the FIB entry so that blackhole nexthop objects
are also covered.

suppress_ifgroup is not handled since fib6_table_lookup() does not
perform multipath selection and the nexthop it returns might not be the
one that is eventually used.

Observed during WireGuard use and reproduced on unmodified v7.4-rc2,
without instrumentation or error injection. Verified with namespace
probes and nft_fib.sh on the rebuilt v7.4-rc2-based kernel.

Fixes: 1c32b24c234b ("netfilter: nft_fib_ipv6: switch to fib6_lookup")
Link: https://github.com/firewalld/firewalld/issues/1600
Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
v3:
- Use the suggested message and Fixes tag for the nftables regression.
- Remove Assisted-by, keep the original initializer, update the comment.
- The cached-exception issue is fixed independently in patch 1.

v2: https://lore.kernel.org/netdev/20261115114434.10343-2-leonard@lausen.nl/

 net/ipv6/fib6_rules.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ipv6/fib6_rules.c b/net/ipv6/fib6_rules.c
index 5e2a79a81bf3..2f43e4e48e0d 100644
--- a/net/ipv6/fib6_rules.c
+++ b/net/ipv6/fib6_rules.c
@@ -288,6 +288,12 @@ INDIRECT_CALLABLE_SCOPE bool fib6_rule_suppress(struct fib_rule *rule,
 	struct fib6_info *from;
 	int plen;
 
+	if (arg->lookup_ptr == fib6_table_lookup) {
+		/* fib6_table_lookup() returns 0 for reject routes. */
+		return !(res->fib6_flags & RTF_REJECT) &&
+		       res->f6i->fib6_dst.plen <= rule->suppress_prefixlen;
+	}
+
 	if (!rt)
 		return false;
 
-- 
2.55.0

