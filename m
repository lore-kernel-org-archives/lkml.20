Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45063F3262
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629875; cv=none; b=mFso7s8wVtBJ9Nb+TdGMkLTtlCa2I6dBSm/aCGakVa5WrFXzRDdcGxRYdDNOoSJAqxLXnGBVCDfQp5bOWpH+iOu+OgY8aIWquKLQsoDfWgB/ddNIFL2bONDt3h0LpF4026Aip9nWtnyzFhk+Uxpl2EiM7HIxvXpDnXqnhkgy/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629875; c=relaxed/simple;
	bh=3OTy30U9zaA/EoJrB2LEVikw7T9erylLWW9kg7srSqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kEPnT96G+6Z6YWldUWGI9NaradZfqsVGIu3DmSwHel+YKi6Slw6bnTiec/KctV04pQqGjUcnQJhmAOtCc2R9LI69KmYaStbGlW57+wq0xbGmCObd9uplMiO5F/2w+FitU+bh6EIm9vbPA4zps+u0kooq6+G7fzlUoEBI0tZEz20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0ygltE1; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0ygltE1"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-353804b591eso903679eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629874; x=1792234674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=b0ygltE1Y1ZWbF4NPe3ThZemZnbNZwUd/lMTmMxkwUo7FOvDi+Hq392Qx7FpKWaBkB
         jolMA7uSnyE62/zfyBLTmLtinIHhAajliGepGkeCe+iZ/GCkdl+Jk5iD1wRriUU9Hvwo
         I9Sw/tp0bPC2dACMFkEC+qdklDrMuusmHsemncgrF3CBqIWf2u6uB8Odx8GViGhHrU1f
         VSdoSAhz6aLXvaxWTBVit/IeyE6kbytP0+m8yYH+fxSSApQ8Tb/5AmsDpZAjhdwmVPD3
         SJJZ7XJKjIZuqR9opsSP4eGt5gso5zR2tZC+vdXU4xy/DyoLRfQYFdUw+GUlosJSpLdL
         fltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629874; x=1792234674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=NwvPGPZVeXtmUQIeAfWtGsOKVlVACxoMUPw6/OLSlcr19RZxFiJdX6MsDo5mE82DGN
         xxwmkIrE+ws6tIGAXkUJQTeqp7HCa98ysVOV8svOw3HGbVczTmkJCMKxdzXTFP1xCF0K
         9EbNGQkqk6vfTP4oPCqTdCh5O2HaRKrBIPVwyK3wm1d0U8Cx0YO1LJtncJHl/NIKt6Wd
         GaybWR3q51LnmdLvUwox182DOBr1QqD2/YpN7ZicUwjlSnoTWO4y7ArKUROtuDtVxSsg
         2ku6Mbb377HgYC5prKHvWZPndZHj19+tBxRJl/qxLW16LI5tZ58N9BhLZNAZMWEBjLgw
         FKTw==
X-Forwarded-Encrypted: i=1; AKwUvByE1+OvlBarzI4tpzjr4s8D9m/A+vykZQ+ZOmpPs0rb8ozR9hmjQu/83fFyw1bYftMIPSzufnOsuE8kbM0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJv7V2i63LCgWU49uCM7s0HNKpfc/4DrM0ds1ib2Tg2oe06SjOi
	dkYn6aljBhjjjkxou1NeGBONn6bZHARl7xpxGUBWddAttiQ7+dfzctAT
X-Gm-Gg: AYBFou1raa2zIJ//ba5FcHBtJ4WU4Bb2UuXdiNgPLVCggFfwdIa3fzetikll+A/7Hki
	CtLPsccXwgoMKhvNGxvfR1ioVDgqzlSPauzYNJWy2sYRFzoSlM0sHkEpVdAU7wlbc5v7oXG39Vv
	J9QIJFSp2VfTVDX4pZA98OEcDcLcoJEaqFzz9nkr8ezm9sO0jMxMvef8X3T1pjj8+U7MqI4fdO5
	zYkhBoleYtiYUashVPCUtvnfb7DBplI9j0cHPBLyZdosyrHM7SMsXZ975Vr2DjPn5g5H1zj7nWV
	NYdNWoy3LYmc2Zp06zbonxcOhpMApt7km9Zz58KyBvZNX1VRlJMKAJ9BQlxoDcd2VbgKCgDguQW
	LaN6sESz58bzyYRHHzEO/aOt7WrHvCeTwnyrW/MehxAKAQ5cqFuj43ye2AnXFFuypy7L8GE+/aG
	PaeBUK/EvaIeJA6CX4oc+ONxXySOgxbk9b0qzoqRMZa88D/Nb1VJAn3vS1aBkMShIIWooVmQH5R
	672lBO59AwsVxH/b17T6moQjrk/h5nWko+IqkP76DmTvZauTuTqXYv0uTKYuUdHSMueNEOpA0o9
	9NN8AcEyU6rbjNprD3RZMzR1Uc1P1UQXTjZNl5ScysTNp1YoJrgW2A==
X-Received: by 2002:a05:7301:dd83:b0:358:ae07:138e with SMTP id 5a478bee46e88-358ae071798mr1145061eec.8.1791629873704;
        Sat, 10 Oct 2026 03:57:53 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353810403e9sm13577784eec.2.2026.10.10.03.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:57:53 -0700 (PDT)
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
Subject: [PATCH net-next v4 1/3] gtp: set a valid genl command in PDP context get and dump replies
Date: Sat, 10 Oct 2026 10:57:38 +0000
Message-Id: <20261010105740.223992-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261010105740.223992-1-anilkaushikwireless@gmail.com>
References: <20261010105740.223992-1-anilkaushikwireless@gmail.com>
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

