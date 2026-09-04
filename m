Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC63490BEE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524527; cv=none; b=Ervk6lFbwk5Z8umJVsOZXsKm6vnCVKOIChEJCY4aXOhH/GgvWUEeg2EqpzpKHFuaLl/YRfTKL5fCc5gLfJiYxdJo2sp9UbGpcs9PDSTSHU96qhM8AdolFnqdSvXFLudpvxZfYdS71dDNnmR5FwxVsNpgh/fdKfxH/9Hb+1qlAgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524527; c=relaxed/simple;
	bh=SPanqEVaN3IgvDMJt3AE+/QAjR+ZhnRjJ6TnwhhAHFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e7EIiI6sVPGB7pXXQ1GbMB1m+0NeNp+4ZWAtksuUfmhpj3rC4kmDH2iC6IXACA+KIQkTEp9pfRGJHU15tQdL2MktYVwmifHNOLG8+TcEbQcUAhph/MWyiNowoB3PzjsROxXPd4jI9KeTObSTTSjMjqBCWWDSBPOgFklyEqW2rKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D80gPO8c; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D80gPO8c"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b1b9c3af5cso761343eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524524; x=1789129324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMyLx7ZGwyvU+g1cPFDlQXdQySr6WmMfAZQG5/qrTCI=;
        b=D80gPO8cY6Ojv29ucOkNdqJ40f58l/Uyf/9F5coYi3fvnNTSGPFAYIGLHfncLajKIT
         jNaTX+otw/AnZRGmsAbGIelbszQtKJzY7HlRjf09FZXklUzuPUPqw65lVMkP1g9IRYYc
         lYbU53JLK/5P77UmrYwrSbsijRqAwFplS+vQtdPB9LSwvNrw3Y8j4ayFPnQS2W28Aiso
         JGQoW+1zjqJR66RzJPPqZuEQkE9hBS5/97qroQ1Ay8cT9V2PlxO5lrk95n0IAkdNdzFT
         s62Pdum565ohtEoz0RQhqV9WpUFhBx8gbO4XlVCkb2Ck0OcJZD9tvXpwB2fXo4QzHPw7
         97BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524524; x=1789129324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMyLx7ZGwyvU+g1cPFDlQXdQySr6WmMfAZQG5/qrTCI=;
        b=mY8cTGUWtKEeCPeN2oOTRPgo3TfH0dS4fjuXKKqWMlRSy6eJP1btZuj/l6ZnStYC61
         wN7nQ0+d2uhE9OL2h6i6nrbHEl3uPebvIkehZVL2/2t2deGPIMkefheIXXxpid9fUbWI
         QJoDacjw7vbp5Npv66xz3ENpRnEtHjv8RoZg3Ytc2sl5osFXAl/sLjg14RvNU7FAh3Ag
         5mtbjT0X2kVG16bDjqmXHlJ5JYlimKcw+8IMdDgHww6vQgHNqIJ3ct6bL4F7OslF9GJI
         IcSmVP8l8GFfdodNxvgVRyukrtq/i00WTlXadqmRxzrD1OnoChA+eU6O3FYcNUWNvXMr
         VWdw==
X-Gm-Message-State: AFuF++lyZUMKtSjKY6cCKEdmTZSyi+a3oXXd7wh+UHJwGoUERkBPOq1b
	KOWIEuYP8H47kMD376uz6EIrKbfNb1DIVgrmjr++7S5qmCqDBbF9kfFF
X-Gm-Gg: AYBFou01lJU0redvr6QhIIYpC3BJLjaSnRoIsSkuOO9f3KKl/Tks8pYs+E4o0V2pFdn
	DkjdhKiIDrpQTu4pch404j0Te57sXqQ2dXRrH9m8IGPf3bckFGwYrk034ade4+bUCxBe/jCdPKD
	Mf2WirsrXTzFjwmavURL6z0HvzIwOP6kcjk4+Jy9/rGZVkjJpWQbUQxFiP4PPe2MHBmm5EquRNF
	80UdVK7AACHb287ucNmxPVzVo09CChDTp6wCxhW8wJpWEdmGlZAaaOvH+5FG/BeFDBWex3zTJx3
	Kzy7ej/Hj8by6w5RMfMHKhE/ZSVU4A7WqOlNYFYmDwKx/dJ5jt/15n9C6eGnVZpfiYI46fJgLkW
	PxYBGJ3kFW1vDZa0/hswpXos0/VPtvMrch3+SMWHf5HkNUIREX9G/wfgB9ZLjB7DG0p91g5FFoh
	6Y95yzPtMFsCJRDFmT5kCWReNNnRo6dRKU1ocmibemV16S4YC8s+LbuBA4EpxyLnHqn0Zsrm1B3
	B/vrXNy7U9OqXstFAx24udGLVM=
X-Received: by 2002:a05:6820:2912:b0:6b7:46fc:1c5 with SMTP id 006d021491bc7-6b746fc0332mr2392300eaf.36.1788524524068;
        Fri, 04 Sep 2026 05:22:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm6139397c88.1.2026.09.04.05.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:22:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH] net: ipv6: fix typos in comments
Date: Fri,  4 Sep 2026 17:51:56 +0530
Message-ID: <20260904122157.29281-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 net/ipv6/ah6.c     | 2 +-
 net/ipv6/ip6_vti.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/ah6.c b/net/ipv6/ah6.c
index c96f7e0d0a48..ec9aba2bc6e4 100644
--- a/net/ipv6/ah6.c
+++ b/net/ipv6/ah6.c
@@ -169,7 +169,7 @@ static bool zero_out_mutable_opts(struct ipv6_opt_hdr *opthdr)
 /**
  *	ipv6_rearrange_destopt - rearrange IPv6 destination options header
  *	@iph: IPv6 header
- *	@destopt: destionation options header
+ *	@destopt: destination options header
  */
 static void ipv6_rearrange_destopt(struct ipv6hdr *iph, struct ipv6_opt_hdr *destopt)
 {
diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
index ab94b3a4ba9c..c79027839151 100644
--- a/net/ipv6/ip6_vti.c
+++ b/net/ipv6/ip6_vti.c
@@ -437,7 +437,7 @@ static bool vti6_state_check(const struct xfrm_state *x,
  * vti6_xmit - send a packet
  *   @skb: the outgoing socket buffer
  *   @dev: the outgoing tunnel device
- *   @fl: the flow informations for the xfrm_lookup
+ *   @fl: the flow information for the xfrm_lookup
  **/
 static int
 vti6_xmit(struct sk_buff *skb, struct net_device *dev, struct flowi *fl)
-- 
2.48.1

