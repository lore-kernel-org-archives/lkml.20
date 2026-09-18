Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9345450128A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744465; cv=none; b=JehdFdzzxR963t2bNfLh2WqUIx5Mx7AK7XcuQysxEAuoEkl8xjfHzXxVFMt+x21MQJlmVmG/39HiwoOXlotlt0uOI8wRVk1HSpO1iWTXeHCqrU+OHg/jpRt5D8N7oz6JfyLDDmS7fUfgc5AJ6sm0fLvNS+2HqO+so1F1G70VIX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744465; c=relaxed/simple;
	bh=jJE4cEcd1GtLTinrGqZMgva5Es9IXyN7+oqsZFI1ook=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E7YTALSLnExlwzI65Z3dFik/sQVQuD/1w3VLrUrvyNHZlSTi4mGxy/30FwcdH+U2kQ+zULqQqNLbjpkiN3OQSztUpuKUXWzx2rugrVKD+iHl6FqV6B0tlmDh91h6BfmOkK8g6utjuP7V79ff5k+cgVnoWoCpNZielAOBzl0hNTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Asb3i/fD; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Asb3i/fD"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fb93aee5eso920099d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789744462; x=1790349262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z81DXYBuDdl7dR9r8HWZJArZ7xtmY95h7fVoi6ikMuQ=;
        b=Asb3i/fDOXDNEZW479VzKhTgZlpPIZReRQ4VncmE6HMxhQBkJQh4UzWYuJyInw0v8j
         PdUETCGPvySkNWtB3TYsjP4yOgqJDUzprYakZhaelxD9tI8ljGPpUqABTG+lKFLDcAzn
         gI1k6/5pC8SzHZW5YYmgT9KUeN7fVYy0IUs2uYSoQCP2QGFWXDhgOiKkTyM6DkDQoWXa
         bS57aaI6vj9+C8xnLu7LuO9ou2jZRNdlaRHq3aBGonAD6sl+DkVlOY9TYZ6xUjBEN3rE
         OGB+tmGyDoNxbUBW1Q71gfdg0KNu1Wuvm4BVCpgIscGl9kygx0ULlR9IXoh25tr/S6Zj
         uHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744462; x=1790349262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z81DXYBuDdl7dR9r8HWZJArZ7xtmY95h7fVoi6ikMuQ=;
        b=nBW1oBsXHJVvFBvObhUyVIUrNX0s6ruF7LCOui1oSpFmpuk+e9woGJ5GQzjqJbDBU7
         BBsSpzuiPM96i2gRchO+2xTQJ1V4GdT3MEaBKbojMdIqEabdH4GT5rUEjj5mwvGy+3Yo
         oMDh6UQfGx4h2Pt/yTTVcOWliViXuY5u49FzLyzqxj53WH5k+cKcL2NBlHcbJna4VU93
         zQjgzf7ET3i5pMky6fF62wawi98DO/ex7HOLOoyXwLcyjDESLdBk+7eYVstzZEl0lY8l
         AWXHXO51lfGcQN6e5s2H3hTbleXrQNue9ZtsAsGMdfA6zHKosry1Lv5lU9aQrVTlhA5e
         XGeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjvj+LyDQU2Nfif62Eedt0J3Q7DjadpagLJDaZ9mks5+DHUDnLf7Pn76OqA0mbakwKQaYSr1tHmzWlYuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kXNZ1tTCf7JVrwlBwjCWND87bpbjGUNSLJPbuxlwksQnXWg+SM
	ecPIP5YBpxNaBuY9jypYv3SqW/jaWb+Fz3foyaUcxWtJVa56erArZSso
X-Gm-Gg: AYBFou2h2WhOMPkt4wkFGyCOXAOZhXjZKKge6gIPGlGuPlxVOBvXrEKIROx4VWTKacE
	Dss/IY0djptwGWfabJoZX9UPMcg5YVN2SGe76mlG9WYVJZPDxroxfOGuHZw4QlbeHTIhvf7JgHW
	RvYYzFnL/0Vfsn2+8oJ2kwcJaXH+TOec6BPYTI175L1djvXoEEfusd2w+VQcXOrks3XBYjCsSfg
	wSb61J1H4SOlwkc8qaRRIgzT0VJLEEVLpRaf7s6UyCmBwcWnJcMtzhKJxTuXwJRugzNwTSL16QJ
	pq+m48VZU61K0ladaj4YAEEwSlehWBj9TNkh0c5tLL1mLwqxSzrIvzV8a8NQuyOaL6E7+Y8obwT
	ENoxxtWruTEii7ZmQtYABe63DCHatGRE0/la5A5o+gP+J7bH5zE46yr1B7LPLls5UcbmfoKl8V/
	1ovmy1YPyBtrfEH+4I3CK3hlkKw8P12czzi39AcvNMUBeIwl741rA81hsiSzj8+n4=
X-Received: by 2002:a05:690e:4547:10b0:670:fe57:ff13 with SMTP id 956f58d0204a3-6717fcb6b16mr659597d50.24.1789744462429;
        Fri, 18 Sep 2026 08:14:22 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672990a8b6dsm8220d50.7.2026.09.18.08.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:14:21 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH] ipv6: check per-interface proxy_ndp in forwarding and NA paths
Date: Fri, 18 Sep 2026 12:14:05 -0300
Message-ID: <20260918151405.716075-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

proxy_ndp can be enabled per interface, with net.ipv6.conf.all.proxy_ndp
as a global default. ndisc_recv_ns() checks both, but ip6_forward() and
ndisc_recv_na() check only the global value. With the per-interface proxy
ndp set and the global one left at 0, the router answers proxy NS but
does not pass NDP messages to the proxied target.

Check both values at these two sites, as ndisc_recv_ns() already does.

Fixes: fbea49e1e240 ("[IPV6] NDISC: Add proxy_ndp sysctl.")
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 net/ipv6/ip6_output.c | 4 ++--
 net/ipv6/ndisc.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 550965058991..738fa46a892a 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -581,8 +581,8 @@ int ip6_forward(struct sk_buff *skb)
 		return -ETIMEDOUT;
 	}
 
-	/* XXX: idev->cnf.proxy_ndp? */
-	if (READ_ONCE(net->ipv6.devconf_all->proxy_ndp) &&
+	if ((READ_ONCE(net->ipv6.devconf_all->proxy_ndp) ||
+	     (idev && READ_ONCE(idev->cnf.proxy_ndp))) &&
 	    pneigh_lookup(&nd_tbl, net, &hdr->daddr, skb->dev)) {
 		int proxied = ip6_forward_proxy_check(skb);
 
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index 75515fd99383..f787082069b7 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1097,9 +1097,9 @@ static enum skb_drop_reason ndisc_recv_na(struct sk_buff *skb)
 		 */
 		if (lladdr && !memcmp(lladdr, dev->dev_addr, dev->addr_len) &&
 		    READ_ONCE(net->ipv6.devconf_all->forwarding) &&
-		    READ_ONCE(net->ipv6.devconf_all->proxy_ndp) &&
+		    (READ_ONCE(net->ipv6.devconf_all->proxy_ndp) ||
+		     (idev && READ_ONCE(idev->cnf.proxy_ndp))) &&
 		    pneigh_lookup(&nd_tbl, net, &msg->target, dev)) {
-			/* XXX: idev->cnf.proxy_ndp */
 			goto out;
 		}
 
-- 
2.51.0

