Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFE438F95E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161473; cv=none; b=TDqEsZrlTlhSKeNM0KvaqIT7gcKzZQYUG0t6pK0fmajXp/hVnB0+IXP2RPC8kWydVnUnUqfKkmtzI/V/d/V206W2WZJxzgjgHvLs0Ys+s66i/DKeOFYMtl2TDv9q5cMd07VTJUM0a9H6j/SMV0zTLmHtBmYZfZZqIZblO23KVos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161473; c=relaxed/simple;
	bh=wAp7afOfTC8HUwyazn0LOftlGcbyrbQpAQhvKDn+ea4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D6vxfsrGeCSVgbDbrXV3eUcka+gEwTvpTmiwcgwsImdWN/oN6NL/0usKR/GTlphPRoGQkH61YfXxw/0pJN/Nz+6jd0vJ5/ZeCGncrLHcbLQb4/PwDqQL2UGMUZJI7/MFGI9b6wR5Ybv/G94a/CDuP0bErdbGE4S6PalEbQ/E20k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UL3b9nrb; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UL3b9nrb"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9906034086cso6212241.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792161469; x=1792766269; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvFMfxSzYVJ2lOTMgtJEulD+6aZKmETG2qDahrWDVzI=;
        b=UL3b9nrbT8FhDYiBNNTYMQ0g2P11ovzC/D+iI3qA4y96nANAG1iq0ojqMX+/39b0y/
         9yPzrDqw4LCorPMdnBZ9IQyzBRf37IGvuAMPhixVqu2Cf6AIYaM6N6yi4mLyNHM+9VMI
         JlQ+rI+YpN66ADhcxVN2SK+ONvAoPnuE0mHLJ76SUoSfQm0k4m4zpOwb0C6uNhN9RzQF
         K7CINHUyZFay7mfeADRsrvzs6YwLdwPYcdN5/dc+C9jet4vXdYSPXG3w91NqCgmUXFFV
         lnnwxThvbmRG12eP9WCBod6Xn1fTqDS4F2wmXoJ25pvJMvj0PmO3kyXsdJMVzaTTOvOm
         a4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161469; x=1792766269;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OvFMfxSzYVJ2lOTMgtJEulD+6aZKmETG2qDahrWDVzI=;
        b=mtI2AYEte7y+I82FMoVSCurlkkCNoEaumvoQSmp/p2ti0qdvpApORiNv2jn8XCRiZM
         w0nTjxDvK+RWpCbhbZ7RWkD40afAW0LElOLKm+BCTqforUgBdNgFFKSA+m9YWimIR7XS
         SeZFHBq724tXQjDMWV9oVrrWg4NKbZpw/8h01NPAYhahyg+33v6E+fqGzAGfSJ59MBOu
         eSjiiCigVsL2UihXkuqgcUuWni4hl73CUP58sQkqeoiC8Ois7JBDZzK1L6j4YS632IKX
         FXTNlxbdy40cggGySo8Xw8NEoX8KA4YhcQD74qyN/FX8faUWZS1iVV7Z5g5Tle3kW9BR
         xvoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+SwjzLcDhOEArfAvF3wcZCh1kxu+s2pyTT6zhn0tGKM90K9FJAGv9B0fvkp9tmUlrcDmAGp1Y/9qVTkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYICTag9Qb4t17k378HilLoN/GrAS8g445IkygKAFIBT0/Rw4ooR
	TlhkI9ixY3zIAE28YLn3MpXHSk+9o9jd8ecKkUW2ov5cBHAB+8f2yflA
X-Gm-Gg: AYBFou0wqh1uhP1gqUSzhkfUU6/c31V5Xn5qaLJzygkbWPF7+62MLBbCJxBJ8a6gARb
	iKa8lp2VIhLiFlRjm6YfNTONzZ6yCfMLjePVW6S62QaWFPqq4Drm8fkfgWdtEimNGGKr5RGGqWH
	BhItMwRE2VznSMfel9uGEjrzr7uEq1fea/DU3UURn6KP5xUDes63mVCXRto+FHM0JUzKDOZOkZX
	jNW+eRdn97vhl1nBRRat5tcaUYxy7oaeoRQIEFNSGa6SPbbF72iNw3PGUbHOkCV3jef1Pq9GKpM
	RVHCD3AcIuS5Ed4q86UPEP0kV48hnK2BIhPJ45b+qPWmM//wDkRcWbW2zBsojOGkF299nUkzOca
	faIKNhmzhAVkRvgp9qNEoOtFCLja60XrFl0dg2sf+6hSgQv5wD+8kLCKpQkUaPpat2b/SDHPmJc
	ddvsb4Xbe14kELRdu3uZvLUsHlWTJEuGm2Kx7HIpyvh/vy57ONRe/oI7jLvEUrnxWsztUCsqTCa
	+Ud/VHoaKVsKZaarnTo2xSwA4T6zSTbqimAZP1GaPyHdDf53vVrTqCpmUHqQGwfqko9rYd7DF5h
	WZy5pTuvzo1be+u0BCFs+i8yZ8BMp7Dc8+YR2XmYMYlmOsCr4tErEjlk
X-Received: by 2002:a05:6102:c48:b0:7c8:3b8c:82ba with SMTP id ada2fe7eead31-7cb373de301mr5673762137.32.1792161468460;
        Fri, 16 Oct 2026 07:37:48 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2804:7f0:b100:ece0:b5:bb23:a54:ce61])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc1983af93sm2248453137.8.2026.10.16.07.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:37:47 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Ondrej Mosnacek <omosnacek@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>,
 Phil Sutter <phil@nwl.cc>, selinux@vger.kernel.org,
 linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] selinux: don't label bridged packets in selinux_ip_forward()
Date: Fri, 16 Oct 2026 11:37:41 -0300
Message-ID: <179216146138.25460.7866279004288174372@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

With br_netfilter and bridge-nf-call-ip{,6}tables enabled, bridged IP
packets go through the NF_INET_FORWARD hook, where selinux_ip_forward()
calls selinux_netlbl_skbuff_setsid() and NetLabel may add or remove a
CIPSO or CALIPSO option.  cipso_v4_skbuff_setattr(),
calipso_skbuff_setattr() and calipso_skbuff_delattr() move the IP
header and reset the network header, but the Ethernet header stays
where it was; when the bridge pushes it back in front of the packet it
picks up stale bytes and the frame goes out with a garbage destination
MAC and EtherType.

Labeling a bridged packet based on its IP addresses is not what we want
here anyway, so leave bridged packets alone.  Add a stub of
nf_bridge_info_exists() for CONFIG_BRIDGE_NETFILTER=n.

Tested with QEMU, two veths enslaved to a bridge with br_netfilter in
the middle, SELinux and a NetLabel DOI 16 configuration, 5 UDP packets
per case:

  case                                        before        after
  CALIPSO packet, unlabeled destination       MAC garbage   5/5
  unlabeled IPv6, CALIPSO destination         MAC garbage   5/5
  unlabeled IPv4, CIPSO destination           MAC garbage   5/5

Routed packets are still labeled (an unlabeled packet forwarded towards
a CALIPSO destination gets the option, 5/5).

Fixes: 948bf85c1bc9 ("netlabel: Add functionality to set the security attributes of a packet")
Link: https://lore.kernel.org/netdev/CAHC9VhS+bdL_YnLQtd0sPmKKfy9BvS-LWV_6EhAuu4qfUFe_mw@mail.gmail.com/
Suggested-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 include/linux/netfilter_bridge.h |  5 +++++
 security/selinux/hooks.c         | 13 ++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/linux/netfilter_bridge.h b/include/linux/netfilter_bridge.h
index 743475ca7..c1f7c3cb2 100644
--- a/include/linux/netfilter_bridge.h
+++ b/include/linux/netfilter_bridge.h
@@ -79,6 +79,11 @@ static inline bool nf_bridge_in_prerouting(const struct sk_buff *skb)
 }
 #else
 #define br_drop_fake_rtable(skb)	        do { } while (0)
+static inline bool nf_bridge_info_exists(const struct sk_buff *skb)
+{
+	return false;
+}
+
 static inline bool nf_bridge_in_prerouting(const struct sk_buff *skb)
 {
 	return false;
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 30776b010..1e4f02f99 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -49,6 +49,7 @@
 #include <linux/fs_parser.h>
 #include <linux/netfilter_ipv4.h>
 #include <linux/netfilter_ipv6.h>
+#include <linux/netfilter_bridge.h>
 #include <linux/tty.h>
 #include <net/icmp.h>
 #include <net/ip.h>		/* for local_port_range[] */
@@ -6145,11 +6146,13 @@ static unsigned int selinux_ip_forward(void *priv, struct sk_buff *skb,
 				 SECCLASS_PACKET, PACKET__FORWARD_IN, &ad))
 			return NF_DROP;
 
-	if (netlbl_enabled())
-		/* we do this in the FORWARD path and not the POST_ROUTING
-		 * path because we want to make sure we apply the necessary
-		 * labeling before IPsec is applied so we can leverage AH
-		 * protection */
+	/* we do this in the FORWARD path and not the POST_ROUTING path
+	 * because we want to make sure we apply the necessary labeling
+	 * before IPsec is applied so we can leverage AH protection; bridged
+	 * packets are skipped as changing their IP options would leave the
+	 * Ethernet header behind
+	 */
+	if (netlbl_enabled() && !nf_bridge_info_exists(skb))
 		if (selinux_netlbl_skbuff_setsid(skb, family, peer_sid) != 0)
 			return NF_DROP;
 
-- 
2.43.0

