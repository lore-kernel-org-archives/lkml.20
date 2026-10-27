Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106393;
	b=sj31wkMWLT/FxbMA6RbSFz2ZzLw/45NRVw5+Vt3LKj1GOhCD7Rsn6Jj+KMIokTftlu00
	 8x2f6Wszavk9EOFkGBdNfFAPPvek7qysWi7k202uJ6wELsy9A+DstUQCxGZTHi8b9LsFy
	 fvRlNl+vUF4SFXjVrT8CfjIGYnpPQ/uFd3PC+xQUfUmtEenCyC7SF3AiJDUhpv5tmiTjd
	 VVM5s6UkJDC7WI2mKaSr6gmw99irvyuyn25ot2b0qxy11IvoJBBiVzkzq645q7B/3CDHN
	 oLK+ICZRqZ+rv8pdM7UqAMV8QecHbS1mo2fN76dLG7IAFGoASZsjZ5T3XaSBH92sPXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vbRBu1C63eyTt9/fvNVaFYb4y1grLI4jAq2tU4V2p2Y=;
	b=jp4oy7/af3/jC/xLL3sOQVa061RN1EdJEKo74OJQMenmv3wQ7RVH6AKyZb1lehrmvbM/
	 /hd0+eP1CM1T6yrlapOC4zVnsSnvDDjL1Av2dws0hw5RRkBwl8owMB+T+cNKYHlKWNFvc
	 LKgZ66QxAvs4TDEHWcSppxitJvBrX2AWQyhnpkb7dSb8m4iFOJGS5fl8u/MOjwls/9kDi
	 okVZLy/NNvuh8N97yQXJ91kD0/1/W+lNr+zI4/Jm1pj/jghbzISyj3A1gvPTI//r+VWP/
	 nwU9ewIO3J7ow1rXJqy9D5NDHq6UVsfAZ9vxC3fxzkAfE+HJ66GAOJfB5gwkca6H7ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NxZEPCRJ;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4C6606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4C6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NxZEPCRJ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2211411c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793106392; x=1793711192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vbRBu1C63eyTt9/fvNVaFYb4y1grLI4jAq2tU4V2p2Y=;
        b=NxZEPCRJCuWSuIjHr9sX32vY5xca8UeAp8zS02zpjxZuupKF2Wr03nNTiMnOaobgU+
         nk/HvfNWbqchKO/ILksdwbokjN5pE7mA7Wr5XVCvyW9Qr6saAqqGl4ld81mkPl1rPGAf
         RvBBIvApClPbwydYLGHrSjnG3C9Mgf3IzhyhBbsT0h0fsmU+zgm/Uy3y9VyCUo63IBcw
         G87W+sq0G9giQIfQ9PM3ig7Ofyfe6g4KmmhYAcZHEsva/ibQvExv3vva+rPQ44uDJ5bU
         xjU7COUurAvyoUDkaSyIt0TrCSm268WBPMnoqkaFC5NDZH5cHq0EqbRNFKMKpeUqGNp4
         pOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106392; x=1793711192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbRBu1C63eyTt9/fvNVaFYb4y1grLI4jAq2tU4V2p2Y=;
        b=x9msdBEjZQ+18WlWTpi5rGMD0WrObaSaQdjgUcepNiAyyDAqP99bCbycTgIqkivQQu
         tgDvUyzhKTyfNlODjW468NbVb5lP6fdnRH6oe9X5veEPHPC2T6QG6S5R/pJC3m1THV+o
         xxBR/A8Y7jzGl22AhvWXudoDELUnOqhBiyWDTHAUMoTLVDJoaEtlatjWluh1l2Gl5fQs
         GRDmySVpCOMZyUA8gs5jZ3ZzTm1Sceq4UoArl9ALh/krgVZnrUOSiPAoZO87ty6VxARa
         ywKfPa4JCip14taEoeYlBEtSvSNElxaOmvW4RQu6RhQzILhm+oPjHiC8B4baYl2bEiB1
         5DzQ==
X-Forwarded-Encrypted: i=1; AKwUvByHy5rgqqJEqnU5JwDu8jEMHJx+gF4aSI1Za1HAyr0cXq3//QmVcz/T1ZzYK3KjCyltOc2yJp5pKf7ZF+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXo89VR4lbq8tS7aWsaqQyQXhpzfd5wECLkv+ZZlvnyo8LNyXa
	7nE4cGcspr6mWGMk9G0Z14Crab9PABsWGeBKXyFIBXeif7E4ELl9sx9f
X-Gm-Gg: AYBFou3n02Rrs0Rs9eYdL3guPgGy5ImDVC0cpFXuG28Jzqm9p1FkojjRg05nT+Ghim+
	00shb3pz8XP0kecQ3sOIObRviBV4UwESzw23PB4VAP5GK43uJwIc0h/vGR38KEwA697YwUadHgK
	CsvmGO/SYIyUKTs66KSoaCxYc5BriZZGpcUWhb7nrw6/D+p2zfZk3eu4gPy3ND7XfJKynyEH729
	01KJ7sReUgOxSSYFZP8XLpk2y0N5qQP3ZRN6vf7/qK7bu8dFNHvY8t92xOtpCN8GqrsrSupls5C
	CA+aEOCtE0Z2a2q6jUeMVQXoEBmo2duSAh1HGz8/5qxU0PUdSlleLMf/vTcCaJzD3dqpKdasG0V
	m1pDZ+UhrwgRB/cQhcpvMapCH2T/l7rcYHk9Y4xHyuhH4wKDnZK9p+THB7CzYnXWJ0Qs6anihyn
	V3R6TMTCaDUZbKQMkJK1TVFUh5KnRzmesBn40UcsRIY6Cp+8pn2FOOGEqZVV1XuT9p7eeBX86C5
	E0Bub9d1yp0CLVXyu3mdp3x8p1QyA2iXpkk2uxa9jRxuB/BMTZ6/S5khr1081qz86tnbX4lRBmt
	2J/yR5XCE7r/hp2gHA4bTa9ztdjYZ0Rw0XZbajXnJ3sRqgnpQbvX0qmxzzmyckdV4lU6caJaIYz
	NRomeFLOAuwWJ1miYLp5fC7Hr
X-Received: by 2002:a05:701b:4544:20b0:190:f24b:9491 with SMTP id a92af1059eb24-19b5804d78amr11537959c88.12.1793106391697;
        Tue, 27 Oct 2026 06:06:31 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm70137612c88.17.2026.10.27.06.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:06:30 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net v3] gtp: Require 'CAP_NET_ADMIN' when joining the gtp multicast group
Date: Tue, 27 Oct 2026 13:06:23 +0000
Message-Id: <20261027130623.3136658-1-anilkaushikwireless@gmail.com>
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

The gtp generic netlink family sends notifications on its "gtp"
multicast group when a PDP context is added or deleted, and for GTP-U
echo responses. They carry the same attributes as a GETPDP reply: the
MS and peer addresses, and the TEIDs, or the TID and the flow label.

GETPDP requires CAP_NET_ADMIN, but generic netlink lets any user join a
multicast group by default, so an unprivileged user in the network
namespace of the gtp device can read all of this. Found by code
inspection.

Fix by marking the group with GENL_MCAST_CAP_NET_ADMIN, like the psample
"packets" group, and with uns-admin-perm in the gtp netlink spec. Only
users with CAP_NET_ADMIN in the user namespace owning the network
namespace can then join it.

This is still weaker than the check on GETPDP, which needs
CAP_NET_ADMIN in the initial user namespace: in a network namespace
owned by another user namespace, its root can join the group, but not
use GETPDP. Genetlink has no multicast group flag for the initial user
namespace, and ioam6 pairs its ops and its group the same way. This fix
blocks the unprivileged users.

Tested by joining the group as root, as root without CAP_NET_ADMIN, and
as an unprivileged user:

Before:
  root: joined
  root without CAP_NET_ADMIN: joined
  nobody: joined

After:
  root: joined
  root without CAP_NET_ADMIN: EPERM
  nobody: EPERM

Fixes: 50aba46c234e ("gtp: add notification mechanism")
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---

Notes:
    v3:
     - mark the group in the gtp netlink spec too (Paolo)
     - v2: https://lore.kernel.org/netdev/20261023073738.2436362-1-anilkaushikwireless@gmail.com/
    
    v2:
     - say that the group check is still weaker than the one on GETPDP
       (Sashiko)
     - say how it was found
     - v1: https://lore.kernel.org/netdev/20261021065750.2069795-1-anilkaushikwireless@gmail.com/

 Documentation/netlink/specs/gtp.yaml | 1 +
 drivers/net/gtp.c                    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/gtp.yaml b/Documentation/netlink/specs/gtp.yaml
index 7871f5def054..b65e18ae5df2 100644
--- a/Documentation/netlink/specs/gtp.yaml
+++ b/Documentation/netlink/specs/gtp.yaml
@@ -194,3 +194,4 @@ mcast-groups:
   list:
     -
       name: gtp
+      flags: [uns-admin-perm]
diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index 15b5d845fc3b..8b29c35d7cdb 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -118,7 +118,8 @@ enum gtp_multicast_groups {
 };
 
 static const struct genl_multicast_group gtp_genl_mcgrps[] = {
-	[GTP_GENL_MCGRP] = { .name = GTP_GENL_MCGRP_NAME },
+	[GTP_GENL_MCGRP] = { .name = GTP_GENL_MCGRP_NAME,
+			     .flags = GENL_MCAST_CAP_NET_ADMIN, },
 };
 
 static void pdp_context_delete(struct pdp_ctx *pctx);
-- 
2.25.1

