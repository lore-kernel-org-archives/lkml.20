Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741067;
	b=z+HIoQayk5GgSK6TBt7Fxy4kxohLyso0hHYDtLmVVIBKJykpkybVBX4UDXNd12PR5Qol
	 x+CSrcKg4IvIvYfnkvDi+U1HoMdWBPKcjQtnSwJiJXEm/mxqKrgKkrYno4uoIBG+LbIah
	 t/jqCtCo7n2/aQClPzX2tWPfLRQIeRA4nM9kVfUjWeo9S86AaMqcMWYrI2K4rRp4ZD8sG
	 HhEbB7+2juDo5fT4Dr3wKuur6EOAwEw2cO+VemNUcN2ftaYhOyqZUEgLAV54gvDrQYHno
	 mSLTmUNmNRMIRl2w4JbVkHhPK0brgdjznpTFGGrmbvNNN12PajAlZ3VyCz8cd2iXLyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xbXgUfMO4n6ZI7asv7ecgxhoVtqoa3gH59XiTCl2s+Y=;
	b=g9Bo3pVFc+se1pEiGOfK3KTlHYQ9HR3hNP8AktAMMEaKqqTUUpe7li5HJsmw3VD1n52x
	 ttPeW7NJwkYj4MiMvv3fcz7z8puJyxubseFbLeozBo+ol2vsKzzchQCj7xSb7gH5cH9Y6
	 2UshMuM4kLXxxQgOkdCGiIU5rp9dV4z2j1+sYA7Z1wdZv9rzMyLnVJVGxSEj3g4GmwlBJ
	 7cnie5U4HKXhHsGWSP6l9tS+tH20LC4cjYGHJEghHrqEI++bTM/xp/kkGrqvfzG1NFj78
	 N7hSiMKOiZuf7StJSDleqQl2d+7EKGsMODacqce2z44E1jRFxZd1/INESNmN750eu7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PPfpCORT;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7AF606A336
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA7AF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PPfpCORT
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-18cdcfc05ffso682614c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741066; x=1793345866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbXgUfMO4n6ZI7asv7ecgxhoVtqoa3gH59XiTCl2s+Y=;
        b=PPfpCORTQJGDfKOe8LJGU9ZM3fMRYZ5CUqlGPImpPiiV+Jc+25baBnEmpNoU/rA+O+
         N0F4/vCFFrcO4kbRLGO9KX9b5vqzp4r83LxiV8M3RjtPkOheII1pRa5nGjH0fS0mgsVq
         Ze7IYxnr+E5Q+63JwOrpHQxd/oMxaNs8IdOsSica3zSyO48Ti0kNLbR8IIy6401iGI0D
         8aVuxARf74NmmFPuvWIowent4++ra6dN8j3lYJ4pmyykCbUmt4E58LN848ebbyBVm1d0
         XkdOJURfCitUYsSbPq5XipHfv2czJ1bmjn+r24dI1Bcs/o8yRwg2VAk6biNmi//Vhv8q
         j+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741066; x=1793345866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbXgUfMO4n6ZI7asv7ecgxhoVtqoa3gH59XiTCl2s+Y=;
        b=FHmu4GuaDQBYIPS5+IUCDCeuVrmv3ziySKsbBrxsvHxi6HCgFkXJuom1QxBo3dC4FV
         GzGUVkZt3tWr4UwGFiC7Y2Y4LQlsxtDaO0KYXmiF53mt4IEFUQQo0ptBb0XvaeiB9KGx
         JNnMGVH90ZoJtb8DXRU7O+Npgl6G6SxHZfT5/Sg7NwDeAV/sa6z7wfti+Ie5l0PrAAyz
         djqgyQqQLHxIbjuWYXT2/aiJjM7apquknwtUiV4+WveScVutn7p2HW8QViTOPf2sUpuA
         skgI/6zWeDgDbLm5AKO9+18P8iE15AO3Gjytzf+w+dJCOL5RanqYsbJR5xJs4SYHkYfL
         JVNA==
X-Forwarded-Encrypted: i=1; AKwUvBzrJi/pxfGG6g+UFCexK/WYM/htal+GfTrYphXQTKBoOWVjA77oA++YQBYkEanq77CWYdFeUWZD/Ct1AsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuZJ5fFJevEbPPika7GYsqaII8GpZ4hhssFwcTLPn5krV+iDLP
	mWt4i/FjdD9o/gHDxm1RLBW6VEKdFRTdHDiXIbl3BgMwZpZuK/qVjutS
X-Gm-Gg: AYBFou2QB4dfxeZNxkf4TNxvanNgJ68eW6hZ/OChUYoLA+4dY+SlAAfLSckS88Q1EYU
	/jgIgF6AWaqimjmS3coc/EydagpXPzQ8kjjb8CxKZ2RnKaPcjOkRYmVuyN8Er1zGHZyAO/BWuDj
	T4e4+kCTZQEQRITM/Jx/cGL58qqhuQdj5WlTrWOUkg6rEgHqf8Y3PUwdlBbaBuaZ6wRCP8NoqR8
	6rbyyA1cRqlCD3Wb8Y8ROxHZlSZHOwLRaPqX1QylLPz+asaNLuvcSxDJt840cvrlRC5WEIXNiqF
	21LVf06vZeoZlMoPVsFEbkerB3aLrbxTAPtRNRGy9VdES1ZuAbV86Oel1bWeAOThMlCoDzt+jUn
	V6U4MNTdHHuoyg3DHFpyi/Xe+ZSqk+vU1BuVFXD2Wr557Pchq8lOV7iiocz1lkv4hcFy3G2AQ2T
	ObrqpZuR/bPgXkHNh7I5SIUiZsDh7Fhff4Mx/ncI52bBaCewRCDiRefvudrqEg17G3IOk/inzxA
	C4Vxj7ED5ZSFHsKqiD+xYyrXDiAtuSfrcpCavpVmJdzkrZWLU6Wt/gV02EW/+d3qR05wDGIzvxl
	28vZKp9OG3jjDeo344nftO+WU831LsVGtvuPmkBXh2FyQwRIG6VGm6ZItZ1I6PRGNVuTJnLzjbZ
	kmz7OEM+dor6cCsivir1GTpA2yUWvMdb7BmG8Krx1A/878A==
X-Received: by 2002:a05:7022:4081:b0:148:bc4a:8356 with SMTP id a92af1059eb24-195c5bc77c4mr1616415c88.28.1792741065536;
        Fri, 23 Oct 2026 00:37:45 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e9e9cbf6sm4413627c88.6.2026.10.23.00.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:37:45 -0700 (PDT)
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
Subject: [PATCH net v2] gtp: Require 'CAP_NET_ADMIN' when joining the gtp multicast group
Date: Fri, 23 Oct 2026 07:37:38 +0000
Message-Id: <20261023073738.2436362-1-anilkaushikwireless@gmail.com>
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
"packets" group. Only users with CAP_NET_ADMIN in the user namespace
owning the network namespace can then join it.

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
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---

Notes:
    v2:
     - say that the group check is still weaker than the one on GETPDP
       (Sashiko)
     - say how it was found
    
    v1: https://lore.kernel.org/netdev/20261021065750.2069795-1-anilkaushikwireless@gmail.com/

 drivers/net/gtp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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

