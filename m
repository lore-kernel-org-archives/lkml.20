Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907403;
	b=c8CqQfu03NMspKYpkrJEiNUFB17QdsAEfkeu6H2iPwU4gy3mj6akoRBVwxlGmffrLOGH
	 RCZ9QgGoc8Cn8BPCCdv6g1tF9n4scRU4b+7e3oF5m5d3D8ZrCQZJMvQeWeJE/nbdw9UPc
	 KZL1bNReaDLdRAe7h7rYWud5VHQg7UJzrFA8pCeWumcHUExnOqxqt6SeWxyVk9QB3D4k6
	 hbzX1YXF03rqs5I2Y8UatDCBN7nbNRe6GhILAtMgaLAIDBoE60ehqOl++J+ZY4T0qy0xC
	 JIRk6vDDyHXVvz3WLw9i8WdqJXGJSheCtXzwQ6wS5blE5UwVhvbHmzLi6Hbaj10MtOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907403;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=fWfrKyD7qtYJoq6JoJHvtsBLIpLUMiVYweeb50Qnupo=;
	b=JgwJkfhLZBRK4pCFp+DVyD2syDQqnugb5bzDqzJ873jrI4SXu37p1A6+kD+HAoeMdMmP
	 bvyGSURuZU16ruOdy3rfvd8M7XDYOsqhcvSZrK37/L6IwtcSeVTXSjv1iKuCavdj5y+J7
	 ftm6TRdQ+bFl4LHlo7E2yu7PV0Wlry85Ycc+VS3OuIfuAWDktMCTUEyiWOiuHB4hUgSfs
	 Y9G2E+Hq6isrMs3CDBUl6eouP4RPLfmSzAPH3/SEdaaXak1R/sGVIwaqH1YwMGwfuoHp6
	 S8FhD/C3AORiNIBDUuue56upiswAHoQ7k/7C1UvOWOAjsmyaPkwjBOASyIQz9/XUuTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=YMCVe05h;
	arc=none smtp.remote-ip=195.10.208.42
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87260606A31C;
	Tue, 17 Nov 2026 09:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87260606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=YMCVe05h
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4jTK5x0qmxz5x1P;
	Tue, 17 Nov 2026 10:23:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794907397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fWfrKyD7qtYJoq6JoJHvtsBLIpLUMiVYweeb50Qnupo=;
	b=YMCVe05hGlIf/wh1cR+3rQ3dHyMWbXz6W4bm8U4HGL4Wraj4M0Zl1ydGrdDQ2CsXz0Jode
	WGP4/fi88NuSKO9gwqrR/IZCQnlxXf8+n7lXLuhMUSrmwV6I1elkzQP8QIIGLEsM0n1TBv
	gLW38p0RLer1XelKamx3eisLnM/LajLFJwvwtLGcAhD8z02QvttqvbVY5jStWeHlhiAZ5g
	Eulnga6mXbPHF+TT3Ck35n+mLocdb6AAtDFt7UPbQocHCzMcBGmHeXapG1D31KRBGii0z9
	4w2oeb5IMFt0xftJM/agUlcDjNECllfxMxGH0MKFf20cuGZKh3XTShP2DqQvVw==
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
Subject: [PATCH net-next v3 0/3] ipv6: tie the dst cookie to the lookup that returned the dst
Date: Tue, 17 Nov 2026 10:21:23 +0100
Message-ID: <cover.1794906743.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
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
X-Rspamd-Queue-Id: 4jTK5x0qmxz5x1P

Hi,

This series implements a first part of the model proposed in [1] to
address the late cookie sampling race: a dst can be stored together with
a cookie read after a FIB change that its lookup did not see, and then
passes dst_check until the next change.

The case that made me post it as a series is xfrm. Adding a policy
restamps every fib6 node, so a socket whose lookup ran just before the
insertion keeps its plain dst and leaks plaintext although the policy
matches. I reproduced it for TCP connect and connected UDP, and the same
window lets a more specific blackhole route be bypassed for routes using
nexthop objects. The ovpn patch [2] hit the same pattern in
dst_cache_set_ip6.

The conversion is initially limited to tcp_v6_connect,
ip6_datagram_dst_update and ip6_sk_dst_lookup_flow. Other TCP TX cache
paths, including established-socket route refills, header rebuilds and
accepted-socket setup, still use late cookie sampling. This gives the
lookup-cookie API a small set of users and concrete fixes to review. If
the approach is accepted, I plan to follow up with a broader conversion
across the networking core and drivers.

Compared to [1], the fallback cookie is 0 instead of the pre-lookup
generation, so fib6_flush_trees is left alone, and nexthop-object dsts
are checked in ip6_dst_check instead of passing the generation down to
ip6_rt_pcpu_alloc. The other cache users (dst_cache, sctp, ipvs,
flowtable, sk_rx_dst, the xfrm bundle cookies) are not converted and
behave as before.

I tested it in a VM with lockdep, PROVE_RCU and DEBUG_ATOMIC_SLEEP,
using a debug-only delay after the lookup to hit the window: no
warnings, and the plaintext and blackhole bypass are gone in these test
cases.

I am targeting net-next to get feedback on the lookup-cookie API and its
incremental adoption before extending the conversion across the
remaining cache users. This series provides the writer-side
prerequisites and converts three socket-cache paths; it does not
complete the conversion. I am not requesting stable backports at this
stage. Backport scope and dependencies can be assessed separately once
the approach has been reviewed.

[1] https://lore.kernel.org/netdev/20260901122501.482920-1-ralf@mandelbit.com/
[2] https://lore.kernel.org/netdev/cover.1789639346.git.ralf@mandelbit.com/

Thanks,

Ralf Lici
Mandelbit Srl

---
Changes since v2 https://lore.kernel.org/all/cover.1794384146.git.ralf@mandelbit.com/
- Rebase onto current net-next, preserving the connected-only cache
  lookup introduced by f778e80b3daf ("ipv6: fix cached route reuse for
  control messages"). (Jakub)
- Move the serial update after rt6_multipath_rebalance in fib6_ifup and
  fib6_ifdown. (Sashiko)
- Add Fixes tags and improve wording. (Sashiko)
- Clarify that this is the groundwork for fixing the race and a partial
  conversion to the new API: other users will be covered in a follow-up
  series.

Changes since v1 https://lore.kernel.org/netdev/cover.1793806941.git.ralf@mandelbit.com/
- Fix kdoc return statements in patch 2/3. (NIPA)

Ralf Lici (3):
  ipv6: stamp the default route node with a fresh serial on link failure
  ipv6: add ip6_dst_lookup_flow_cookie
  ipv6: use lookup cookies in selected socket dst cache paths

 include/net/ip6_route.h | 18 +++++++++----
 include/net/ipv6.h      | 13 ++++++++++
 net/ipv6/datagram.c     |  6 +++--
 net/ipv6/ip6_output.c   | 57 ++++++++++++++++++++++++++++++++++++++---
 net/ipv6/route.c        | 30 +++++++++++-----------
 net/ipv6/tcp_ipv6.c     |  5 ++--
 6 files changed, 101 insertions(+), 28 deletions(-)


base-commit: 6ff4c5942a301675eb12e5b49d53a81e604624a1
-- 
2.56.0

