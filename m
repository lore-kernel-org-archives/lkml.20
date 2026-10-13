Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA2747208B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861015; cv=none; b=Iv184+30gf0SxDYuD3z8I/nBWAXqT/FPweuW24/teqmnnpFHuSy+tId8mWDpBN6mOD+TX2L3s7sXO4JEcGXnBGCO/AxK4mJzMH/EuqOvq77FEAxMtdIh0adAab4jUcM3/fqAlKebWhVgAzDaZqshog1ae0fZRVd5Hxfps7GC2s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861015; c=relaxed/simple;
	bh=3OTy30U9zaA/EoJrB2LEVikw7T9erylLWW9kg7srSqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OTOepXq/OP76ru3YrA/bZMf1hhPlnuwPZZ7ps5+O1VwFmAThnH/KOxObN4vrstomcIul7SA3IkmrHnNv8y/Rwq4VBzZnVFy5EWpfbMWDzKzIycdWPJe15urD9Np1oq+zPDbYMBwBpUPnTavukwmBH56L6dNinGsDEdHFHWVz0BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CW9LDfkx; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CW9LDfkx"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1743861eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791861013; x=1792465813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=CW9LDfkx5ST+t9PXJuJ6WeI66c5rw//HS97b7Oc9iAXK0jIOsoqUC+XSWLoUp2nQ45
         Dj7E+ZPDm69HHJumLbEQlIu+RgI978X0G2oAawC8x2TQKa2ZLS7G0jUzFgp+8QVeW51D
         9OaHl745qs0y6WaIaPcdg/pQg9L0TtGjC3eRSOAoFSuEbl+ixZt1K4DOvsaXkC/T9ZXK
         5lIQL4sBpaLCjCzPp5AOSzOqYiOQrePcF+KQbQkzBqEcFdwt1mo0qphEcPz+VD2pAypQ
         Uz20usOE2hqDLjtQmBV1gO12pq8rh1sx0kiXRTsjq/dtltvi463Dg4bwHlhwsbJiM+Np
         VdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791861013; x=1792465813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=GP6lHO/Oy0TO2LAtOci+gKyL7sbb7fozj7hIuFOvhAzvC5Vabrb1L53Aa04xbb2Of7
         dJ+RtJnSUV/1dCqZUpGY98yXFoMbsfhO1btgzmfjQkSgraA1RDVG0zeMxOCpJ6LpgImE
         pUXhe6f5RPUbABPeqhPANN9En8tuTnFjAJGfHROEVEV7aPcq4qWbyrswxMsf6zadR5Y9
         Mpt7R1M70LddfxbRoNfpW6xuDhFP6uzUBqkeyzEu1suBE1OEZ0YwXCN8gBg0hld9bK6e
         Is/c8Ri3vbAJi9VJxlrq9yjTWmlVOuaET2hzEXn5OnbbFTBAicQ4ZgP4HqaMdfGwDdgX
         CUug==
X-Forwarded-Encrypted: i=1; AKwUvBxfrE/zI5Q5Bnt2UNF1NWHN1wC2tq0b+jEDxQDjnAJ605lb9jRYyc+g82N3y3DKNuqFoCi8Wc/9KThv6Nw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEAyw4mLntBMxABd7X7iabinJInnw6mlUNfuGCrq5NRg0N/Z2y
	NLQiVJHmsHHajQHfFuLMJwmp2VOGeavjqTT6NZSPtYQYI2ZyC3LdMgEW
X-Gm-Gg: AYBFou2EoEWfvjXZtHoKonf3wpCKDhDy9HT4+vIWMn+x4DbBCIludLj68AmkO8OpEVV
	F5zz7IVQQjmleMLXQ6BixlPMAXE7JAkfwMn+fwJfX78uTwdNuJJi/RZveCuPCxUbUTlqdNlpL1O
	rORO2oC17dbfqdefy8/yZIPYlfnzum76jSoDMRqV+2atVUpY0vMQmgzQdHJHE8VEcTDGThKGmMm
	ZnDRyXHiHgb76rxJYAWPDATNFJ1dj9TpRRfw+mncJ6fpLZOasf8vZNMR9Cb4uyFva33hRzm4iS7
	49fsPp3RKqaBmM1lbm3lKQgxAWYbVYAhqwQLmbsBK88/FUKIanXk+E/5iceOCs7e5VQ4Js+yihf
	IVtFEZ9sJHYm0R83aqRndAGWYHTNj3mENA3VaxodwQfLOAQigEwlnSnALRaymNrE76jEj/ASfPI
	moCgGbVX4snGoVT7rNLiqWgMQVF4ufXgbMoQdv0yJkpD6gpm2DdJqkrGXPTNPB4B4qAxk0rJHO7
	B7A1VA5fncpHZ8dxJGIzDTmM6Y0XjvBGnCT/4SJrMC1CGp6ETwbmXQhUTeqlIuSHNfpG4UiQV2Q
	pclwT7SOU7xRZIvKxY+U/fl1DWZVlgum6ycTYRepICh4gtGY5XXB1w==
X-Received: by 2002:a05:7300:aca5:b0:358:1f59:48c9 with SMTP id 5a478bee46e88-3581f594a27mr17419754eec.24.1791861012821;
        Mon, 12 Oct 2026 20:10:12 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm41129053eec.27.2026.10.12.20.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:10:12 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v6 1/3] gtp: set a valid genl command in PDP context get and dump replies
Date: Tue, 13 Oct 2026 03:09:58 +0000
Message-Id: <20261013031000.528393-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013031000.528393-1-anilkaushikwireless@gmail.com>
References: <20261013031000.528393-1-anilkaushikwireless@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gtp_genl_fill_info() stamps the reply with the command its callers pass
in. gtp_genl_get_pdp() and gtp_genl_dump_pdp() pass nlmsg_type, which in
a genl message is the dynamically assigned family id rather than a
GTP_CMD_* value, so replies to a PDP context get or dump carry a
meaningless command number.

libgtpnl ignores the command and is unaffected, but parsers that check
it (for example the ynl tooling) treat the reply as an unknown command
and discard it. Pass GTP_CMD_GETPDP, as gtp_tunnel_notify() already
passes a real command on the notification path. No uapi change.

Fixes: 459aa660eb1d ("gtp: add initial driver for datapath of GPRS Tunneling Protocol (GTP-U)")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 drivers/net/gtp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index 4aff23bcfdd1..99836b773e5c 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -2279,7 +2279,7 @@ static int gtp_genl_get_pdp(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	err = gtp_genl_fill_info(skb2, NETLINK_CB(skb).portid, info->snd_seq,
-				 0, info->nlhdr->nlmsg_type, pctx);
+				 0, GTP_CMD_GETPDP, pctx);
 	if (err < 0)
 		goto err_unlock_free;
 
@@ -2326,7 +2326,7 @@ static int gtp_genl_dump_pdp(struct sk_buff *skb,
 					    NETLINK_CB(cb->skb).portid,
 					    cb->nlh->nlmsg_seq,
 					    NLM_F_MULTI,
-					    cb->nlh->nlmsg_type, pctx)) {
+					    GTP_CMD_GETPDP, pctx)) {
 					cb->args[0] = i;
 					cb->args[1] = j;
 					cb->args[2] = (unsigned long)gtp;
-- 
2.25.1

