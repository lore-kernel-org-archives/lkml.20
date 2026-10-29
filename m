Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254943;
	b=VU1YwLwRjffkjXyVIGmSii39ERLHs5lZ012i8+2vzN/E+j4jUkSIxOEUP9c8M7qBJpsZ
	 g4XxD4d6MEvUq1zU5I7QMjfZktt9d/xV/phJWuAQCGD8OU+F+xFf5ri4zUjHYsoM5Mdsl
	 4uRQw88wCAGuSrHgPkmnTm8Dnr6me9gDBLHxArwPENjwROuaoHFekskDBX+izulDh/8dI
	 Rx5mtpctm9QYHQl9tTiRaAmntyi7mBy8rZgtBuljw0L4od/FAgz0b19tLPAiYAJDh+DtY
	 1KfkymT9fBUEozbUhBHuj8V+msp7DCbSeM1ioqVGOxD1Nr9gROFn1cu319XZbFuJMiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hbo7nQaUa/EkkUfMTIBslWqezjGArgpu55P/FDSfP00=;
	b=kS6TGHtOoVPDe0aYvSznZISd0k+2eqF3MPCwKIL75GANc5SFRSNhwk+MaGGYHESx/YMF
	 whUFw6XkRrv+Nci5I8DJWOIsP8L+eYxBX3xGAGt74nrH1A9OtmPvCnMpqn8NzqPZ7Bxlu
	 W0OmmjTfZs/4dLu793MTHw8eG98VIKgHNxCvo2q2fJuT1KGvaxm/s4QoGIJecb6iLa5Av
	 Wl2suVuF53rntNk/gLVyHK1Si0jjq7lPXRSraQoDO1l/RWGa0iwAYcxzH8Qm7CARz3pf+
	 DNI3LQzD7sqpekRB1gMXpGz9sCPZ1yzJLWwXrpvGK0Wtr8IJQ0Ln6lT6iQHVhv38y7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czW06I39;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CD8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38CD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czW06I39
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so561710eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793254942; x=1793859742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbo7nQaUa/EkkUfMTIBslWqezjGArgpu55P/FDSfP00=;
        b=czW06I39WAaqRuUvXHBaDZL79RltalM9VPne66lA88RZcj4wz9qay+eXxG2bV4U9mf
         teWcrAk62lbFCH7KXzgikY8jcFx86EYSmprQa6qR8nFzPp7glA/nNS70Z7T74i52Kw5D
         +cpE4qPgXg0VOLxX3KLMrOIqoJLYqZEVdYU965A6PkTa4p9O9MgJ5a/fZWGlG446Iw6Z
         PvRzDrgpJD4hx44HEXUggRzYNk8BVaqrr0bDCPNaPByYAvAvcrk5rXK5GCSU1y+vh2o7
         G76IQvg3vu3LTCxdYFBcXqllljOXtL7P8406NMQvvD+BDWd3Nf3t90ERIsxYzs8+fsYq
         paTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254942; x=1793859742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbo7nQaUa/EkkUfMTIBslWqezjGArgpu55P/FDSfP00=;
        b=OvYLQELfJiHl5ouaOIpRyC10TGbTfUaRhvqHSlaJLZaHzk/dRKP1SZcy7S0fD+kUEd
         fbh3pVTvV3SOPdujPJRdZWNeQ9Mrhnhb3DY0XQnAFyl8QnaAd+CvcPUpYe8pKrt84S7P
         YJdiBTMsPjRkcAnxtJPahSrVlPM6JmbIlIY5zTXT7p+0fGrSfk3zi6BkADXP+xQM3Ls5
         5VIKUWUjIukTJ+gw3re5HnPmH73RTE7Xt6IYWfyZHvCsbLE4alXK5BhgIHukTcGN9Kud
         Z2vb2EtqqxwReb33mq7/oP+dsR+916kpqgcu+UZsaICktt3XzisIR3Z2xvr+SxuFZU1r
         OTSg==
X-Forwarded-Encrypted: i=1; AKwUvBzyaiXwQl65Gv2yalzF32MGWMeww1VwgmeFcXZQcrrhgnqjXUV1xtzBikzd1We7oLh162EvOw6nhf4HfYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdMszLSK+C/2wlgO39b2e9jMUSPystmpBAV9SRKTS0gKBnibqR
	eU646qBBhQ2jAiNYmlDr/t557ZftHr4Dab9ceAQw6S2KCIrRam7Mom0t
X-Gm-Gg: AYBFou1YjlTm8JmlwHdrQND3HKcIDRfTLi8W5iXd1zfgXpdd7KCMOCZxlT7UdIlPdwL
	+8wzhF2AtLO8Wb+RTdxRZnSj36utjineF0GRD2t4cNrczGnIsIM7t401V+/EsSgBbywEtjSehlV
	ziQRfSNjEQvFAE/Q2Flsx6mAzNSwWdCuMQxNCO+eZGHYGpo9YzD0/VIgqKGaCjn+zo9p2uirXMY
	2PXnOXflg7qvuxmpxGrM+YAJVrow4O9niAvv/2D9KtVGfmzmjaXkGGnqAEV/pK1YVULBXJpQai7
	iu6M1h6zDwaDFZ4FRU0PWj91hWmAYapbwDfoI7UME/fBPX/XWYyjXnhBjj2OrrYu3ApnxC2Xakb
	66vVoInxbX4Rxo+R50lB1v5vy16DfOUKDyYhI7zml+EVGTZhxThGIN3qoZrwP/Rg1L0OZL6AWgA
	nTS4Y5eLVlCj6zLqA8W+QaHS8uNvpw3HwED37gZGeBUVrhYK2QSTVdYa/08TjZuUaGMnv8TBbfl
	CZxBqj+3WNtaeE3PR3T7fR86xFzy8YC75yxlyfBclBsKl2YXk8fYeYyz6ON4nRjs5DT8CjWtxE+
	w15c9+EzUJ2H2YeKwxNbAlp8SSD+Qg5FOqwYVfjp6d2T9k0ehgzaym1ryTBeSUv9A7kmebHzT+c
	WWKJ980LLDgqYqR/z8v08TsmarXpf4YFzlVJ8zP6GlQwgOMMtWIhizHExcwNHWnu9TTqdGSJ2nw
	==
X-Received: by 2002:a05:693c:864c:20b0:36a:1819:4d0c with SMTP id 5a478bee46e88-36a2046c99amr7459938eec.41.1793254942061;
        Wed, 28 Oct 2026 23:22:22 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm13608255eec.27.2026.10.28.23.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:22:21 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net] genetlink: Reject joining multicast groups no family owns
Date: Thu, 29 Oct 2026 06:22:14 +0000
Message-Id: <20261029062214.3407223-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
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

genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
family owns it. For a group ID that no family owns, it returns 0, so any
user can join it.

A family registered later can get that ID, and the socket stays a member:
nothing checks it again. An unprivileged user can join the free IDs, load
a family module with CTRL_CMD_GETFAMILY, which calls request_module(),
and then receive the notifications of a group with
GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN. For example the
drop_monitor "events" group always gets ID 1, and is free until the
drop_monitor module is loaded.

Fix by returning -ENOENT from genl_bind() when no family owns the group.
Nothing is ever sent to such a group, so joining it has no use.

Found by the Sashiko review of the gtp multicast group fix. Tested as an
unprivileged user who joins all free IDs, then loads gtp and
drop_monitor:

Before:
  joins: ok=62 EPERM=2
  gtp/gtp (ID 15): member
  NET_DM/events (ID 1): member

After:
  joins: ok=19 ENOENT=43 EPERM=2
  gtp/gtp (ID 15): not member
  NET_DM/events (ID 1): not member

Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/
Fixes: e03781879a0d ("drop_monitor: Require 'CAP_SYS_ADMIN' when joining "events" group")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---

Notes:
    The gtp patch: https://lore.kernel.org/netdev/20261027130623.3136658-1-anilkaushikwireless@gmail.com/

 net/netlink/genetlink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 5cc1037d4917..f038f04ef4ea 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -1825,7 +1825,7 @@ static int genl_bind(struct net *net, int group)
 {
 	const struct genl_family *family;
 	unsigned int id;
-	int ret = 0;
+	int ret = -ENOENT;
 
 	down_read(&cb_lock);
 
@@ -1841,6 +1841,7 @@ static int genl_bind(struct net *net, int group)
 			continue;
 
 		grp = &family->mcgrps[i];
+		ret = 0;
 		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
 		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
 			ret = -EPERM;
-- 
2.25.1

