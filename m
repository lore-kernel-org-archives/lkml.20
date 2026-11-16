Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793686;
	b=B+jOQsLorPVsTiZ/DInjDna/ytnenrsH1R3yDG1ipyo61/xVp6joF8u1xMQbKKc7+hGL
	 /GGhvOdBkTNXmjEva6/85k4tQNDIWN9R+uTg2cepaHFy7lPIZA/0N3OMDWgz4HTlJC2h4
	 saQYy4CTxNYQiFN6l56gD704mydSsO9EYQnj0M6FkqLu91dP32CWLMbttBT6nVKV8JEJv
	 5tIHi7DvfUpyIfh3775Nfha2B8loDHuOMDZK6fU6bkeqp5ZUXBKooE6lirrPkJts+4BfH
	 l/q2cuDCrVyFdnopzM2CnqnW9yHerF6KK1JWbkQc2Bbem7qYz2V2E8elHluU/BI7Cxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793686;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U16UHM6ExIa0np8Ym9kKv5Vd+LKnAL8EesghEHkEZLY=;
	b=c8hKsDtIJ9rd/mD7dQfSs+c6spDuzT0N+3SogARc96hjCj72DTS2UXZt6atEtvqBisEI
	 SDSzPLMZyMOzEO2KKVCFiY1Zq3XizCqdeA2xIyBYfYSiAq0yMVs/Lk1ieVuF5yabRDTGV
	 3D3Y6Ezgm4YPGohvxYaZOErgvMaXLAZKgA+mD9pb7wEvv21GfLJeQS3/VISf9AMZLyMQP
	 +ihBDEP52wLMmRcnYbUzUITI2OOvwHfPaXNSVMteuTwpqHiVoQJtZoqqz9FJLRs7V70/z
	 1MQ8KrtcqN6EJFdkxkMNcdQ3NfAhxVCA6rVdiONMCikzAFuU43hzh+gvpEDRIx2nXsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sYZgBawm;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6BD606A332;
	Mon, 16 Nov 2026 01:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6BD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sYZgBawm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=sYZgBawmzsxhoBZgFtn9MuS70kq5u3aa1Ai0gsxqaGKAvQn1+XRy2PnxLsnKLDvG01DhJF4qgzn+H
	 IHxTp+Jm390g4687nVmIdYh60tcR358aEoPXcqzRDGbZMmwbGq0VUAULnGtPq2s0w31x4JE0fZPTax
	 l9Z1SmLu+ozFQpDE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afa60d38ca-f7211;
	Mon, 16 Nov 2026 09:48:03 +0800 (CST)
X-RM-TRANSID:2ee56afa60d38ca-f7211
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.64.115.200])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afa60d087e-77830;
	Mon, 16 Nov 2026 09:48:03 +0800 (CST)
X-RM-TRANSID:2ee66afa60d087e-77830
From: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunwenbo@cmss.chinamobile.com,
	1342116488@qq.com
Subject: [PATCH net-next v3 1/2] ipv6: check mc_forwarding before calling ip6mr_get_route()
Date: Mon, 16 Nov 2026 09:47:43 +0800
Message-Id: <20261116014744.18223-2-sunwenbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261116014744.18223-1-sunwenbo@cmss.chinamobile.com>
References: <20261116014744.18223-1-sunwenbo@cmss.chinamobile.com>
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

When CONFIG_IPV6_MROUTE is enabled, rt6_fill_node() currently calls
ip6mr_get_route() whenever an input interface (RTA_IIF) is specified and
the route destination is multicast.

However, inet6_rtm_getroute() does not set skb->dev on the newly
allocated reply skb, and the looked-up rt6_info carries the matched FIB6
prefix (such as ff00::/8 from addrconf_add_mroute()) rather than the
queried (S,G) addresses. As a result, when multicast forwarding is
disabled (mc_forwarding is 0), ip6mr_get_route() falls into the
cache-miss check and returns -ENODEV, causing rt6_fill_node() to jump to
nla_put_failure and report -EMSGSIZE ("RTNETLINK answers: Message too
long") to userspace. Similarly, interface-local and link-local multicast
groups are never forwarded by ip6_mc_input(), so querying them with
mc_forwarding enabled also enters ip6mr_get_route() and fails instead of
reporting the local route.

In contrast, the IPv4 counterpart rt_fill_info() guards ipmr_get_route()
with !ipv4_is_local_multicast(dst) and IPV4_DEVCONF_ALL_RO(net,
MC_FORWARDING), falling back to emitting RTA_IIF and normal route
attributes.

To align IPv6 behavior with IPv4 and ip6_mc_input(), check that
mc_forwarding is non-zero and that the destination (dest when available,
otherwise rt6_dst->addr) is neither interface-local (IPV6_ADDR_LOOPBACK)
nor link-local (IPV6_ADDR_LINKLOCAL) multicast before calling
ip6mr_get_route().

This discrepancy was identified with the assistance of an LLM-based code
review comparing IPv4 and IPv6 multicast route get handling, confirmed
on a UML kernel where multicast route queries with an input interface
failed on an unpatched kernel, and verified in UML that routable
multicast queries with mc_forwarding disabled as well as link-local
(ff02::1) and interface-local (ff01::1) queries with mc_forwarding
enabled now succeed and report RTA_IIF.

Built with W=1 on UML, x86_64 allmodconfig, and x86_64 allyesconfig with
zero new warnings or errors.

Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
---
 net/ipv6/route.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 1b2dcc066e19..27597d149672 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -5868,7 +5868,12 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 #endif
 	if (iif) {
 #ifdef CONFIG_IPV6_MROUTE
-		if (ipv6_addr_is_multicast(&rt6_dst->addr)) {
+		const struct in6_addr *mc_dst = dest ? : &rt6_dst->addr;
+
+		if (ipv6_addr_is_multicast(mc_dst) &&
+		    !(ipv6_addr_type(mc_dst) &
+		      (IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)) &&
+		    atomic_read(&net->ipv6.devconf_all->mc_forwarding)) {
 			int err = ip6mr_get_route(net, skb, rtm, portid);
 
 			if (err == 0)
-- 
2.33.0



