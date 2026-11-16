Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793686;
	b=XuvzPGtf3eh30TtiSBfVuRndHZQBRkZDpUmy2TtVeLLvEsZ/V57OPRTBc9MDQxy+yFoy
	 v7fGbiSNtQ1W6PfUuVk5kNl9uzyxx4uuW/ADa0IhZLbX2+iszZBaYNAEV4Y9sGz5t3fNx
	 f5gyugxxdaHS85YQlQeG6kY2u263KdWT1aU+IG9VjYBQvPH7YLjdO5jxdNavjDcAhH6mx
	 3+DruAbdjJ9Xq0FKnbw+vSfZju7f8HDn+FiuNZP6+97cfXmuERNPPRaNckk09GfU/Mbv2
	 afL71MIi+a+o5AYXqodW8r5Y28dvQaZuMYhziFwR8ie6XHzEQuA5Ayxxjrr2hSaDu9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793686;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SmMEGUJ3TmY5ehawL87dzihwEU8REbIyAh3hfr0asIM=;
	b=X+Ve98yvKMDTMQ3gKpwrr09Iw6QKNMCwD5eqkkckKtSsGaij47L9KRyAUehb+ckpcX6p
	 tAKOUivkI/k/RT8/O21vRKBiqVpxQsI1wi+HvwCz1/wD81QSobJqaRrh4E680n/LOM5bZ
	 yCnBVf+hAnjQaq5QHP+mIj2E2ecC7vQUKm/5hBA/zOrn3PgXenFZwqHyxJtDTd5wRnPjz
	 gQOsaTm7bVq9vIqidzFVjlPqtlnSDXq0zDvVVTovETslTFNXlQrPne8r73BAfeg9Sa/2n
	 5FHN2gW69Br5FQ9vvySOo8cmzMiIGQm9WsnQW1oegpmmEVQbCD0puEpIqQTNfjSighA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tGdMhjxn;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0057A606A321;
	Mon, 16 Nov 2026 01:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0057A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tGdMhjxn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=tGdMhjxnVgLWwoxU9tS6hZ/HgiNuzsHbxaqBoOMA+Czy6HBzl5auFw8zFadT/FqOSWHlIjXVs0IRv
	 qN6ookmK+outRRqXtvXCLgc0roZLlYzA6yoPLEh4L/zChPJaam14vq32OXIxvDWMYRahKOcNGUgZIY
	 R0JmowXfA8HULJS4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afa60d366d-99adc;
	Mon, 16 Nov 2026 09:48:04 +0800 (CST)
X-RM-TRANSID:2ee86afa60d366d-99adc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.64.115.200])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afa60d087e-77831;
	Mon, 16 Nov 2026 09:48:04 +0800 (CST)
X-RM-TRANSID:2ee66afa60d087e-77831
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
Subject: [PATCH net-next v3 2/2] ipv6: preserve ip6mr_get_route() error in rt6_fill_node()
Date: Mon, 16 Nov 2026 09:47:44 +0800
Message-Id: <20261116014744.18223-3-sunwenbo@cmss.chinamobile.com>
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

In rt6_fill_node(), when ip6mr_get_route() fails with a negative error
(for example -ENODEV, -ENOENT, -ENOMEM, or -ENOBUFS), the error path
currently jumps to nla_put_failure and unconditionally returns -EMSGSIZE
("RTNETLINK answers: Message too long").

Among all callers of rt6_fill_node(), only inet6_rtm_getroute() passes
a non-zero input interface (RTA_IIF) and propagates negative errors back
to userspace. Keeping -EMSGSIZE as the default return value for
attribute put failures while preserving the negative error returned by
ip6mr_get_route() lets userspace see the actual failure reason when
multicast forwarding is enabled.

This issue was pointed out during code review of rt6_fill_node() by
Hangbin Liu, confirmed on a UML kernel with MRT6_INIT enabled (where
querying a routable multicast route with an input interface reported
"Message too long" despite the failure in ip6mr_get_route() being
-ENODEV), and verified after the patch that it returns -ENODEV ("No such
device") instead while other rt6_fill_node() paths behave unchanged.

Built with W=1 on UML, x86_64 allmodconfig, and x86_64 allyesconfig with
zero new warnings or errors.

Suggested-by: Hangbin Liu <liuhangbin@kylinos.cn>
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
---
 net/ipv6/route.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 27597d149672..d59aa9272a44 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -5814,6 +5814,7 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 	struct nlmsghdr *nlh;
 	struct rtmsg *rtm;
 	long expires = 0;
+	int err = -EMSGSIZE;
 
 	nlh = nlmsg_put(skb, portid, seq, type, sizeof(*rtm), flags);
 	if (!nlh)
@@ -5874,12 +5875,14 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 		    !(ipv6_addr_type(mc_dst) &
 		      (IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)) &&
 		    atomic_read(&net->ipv6.devconf_all->mc_forwarding)) {
-			int err = ip6mr_get_route(net, skb, rtm, portid);
+			int ret = ip6mr_get_route(net, skb, rtm, portid);
 
-			if (err == 0)
+			if (ret == 0)
 				return 0;
-			if (err < 0)
+			if (ret < 0) {
+				err = ret;
 				goto nla_put_failure;
+			}
 		} else
 #endif
 			if (nla_put_u32(skb, RTA_IIF, iif))
@@ -6002,7 +6005,7 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 
 nla_put_failure:
 	nlmsg_cancel(skb, nlh);
-	return -EMSGSIZE;
+	return err;
 }
 
 static int fib6_info_nh_uses_dev(struct fib6_nh *nh, void *arg)
-- 
2.33.0



