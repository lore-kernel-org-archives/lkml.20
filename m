Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F387424642
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525998; cv=none; b=LnGT7zrQhf9N6t3NaviFGY+IxIgOfcsY0eQntDEIduD+4Y+9OKtpPoBNugfCrwTzGQsZlvhF2QHFvQ/l2dia5tsMpX3Pj8pyFZRLvll967ZsBlLOeh07jGgdadwb0qQbjCIdPVJfXOeTAIMP6MJ7x12C1evZKo3nX2Rev/jngro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525998; c=relaxed/simple;
	bh=3OTy30U9zaA/EoJrB2LEVikw7T9erylLWW9kg7srSqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XvnyZBqzh+aTVWfnM9uMeKua2r5jFLXWMIfWoQTLT3GZB2qgge0fNWBeiwv+vu7PsMFYW2iPYuT5Qmoj5JmF48hOi7yV+TKK/FL/BYGhhCBljVG0LC4tw9tjM2dxzrv06RPssN7Uxb5+W+g8rS7XC3vqVUKz6FOCUXaTVyFJuGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4MX8mbC; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4MX8mbC"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so5906639eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791525996; x=1792130796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=D4MX8mbC497vZEToxnEYBOpmZodZBfPnn9155EiMp+HLkzHkzg8BBdBrbFfM4z8Hmy
         QX+GU9JXQVDYTupdzxtyVp5BasbGUdppet9alRHAzTMNJIzpGaW4cdTO33KJxk1sqFxe
         1vccgtRQtUoUW7MwgXntBP4YszFCKi/bxO3puxQZh02/XpeVR409SI8cIvm19oRSnKP6
         Ws8M3hJBaPqPwI12h2pIKnAC8d31Ut5/ncyc4xQbfxX4jBwVQKfVsLDv007jNYlzzOdO
         6UDhxdFmEbuDr4kg1GwOlPgmlwmZIlXO0QCS+oBe8j73Dd1W06K/19HX3ij7pgtWM2de
         ysIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525996; x=1792130796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=HC/aSUJ1i5CONiprcgnI7kA4Cshn/fQ/fJ6Rv3nigpowzAt7V9W3DhEGmfF8mlRELN
         xDYwQazKpowiwEHdl1iTgkck+k9kZoDbLX4y/DZqfwcndlK/SPC/EDzLpiRFAf0GTZL0
         PL6aQOy46OOcZ5aoS3b7x+JWWRg3wrXmlESZAEN9L+ms2b5za653C+oI8RDSENaynHJu
         GqBLhrSukDVnvntczmifUgXHJ/t9D1siFXPC5RDv5SC0/oKuI2XzDMrZvSEnN5Pl58qS
         1HX+GVEMpC4azh/RnE+IWwu2WUV6NND3xlCsaCJYzCU7hHKkz40SViU/Ba0LeNE8z65n
         bx2A==
X-Forwarded-Encrypted: i=1; AKwUvBxaxEO5FZo3le4xgAPN/gj1WhOnL7KuHpxGQbaNk2I1Z7XDyM0Q+0gH9uKCGjVLz90R08GpjeZ3XU/nKPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGXBo0A0t6EkhhobdGgDwtDsU9B/xraNvmOL+zed4MuyukeHGY
	ePoGHZAF9rmKIgzHA/dJZksu/ytOGw3U2hiKPH3BshsoosLyMc0nsE9b
X-Gm-Gg: AYBFou3EfIGTq4nugjQU+I3YOk27T5f6jXWJolHxXY8h1EdvR+UV1cCjAlxmCtYeLAg
	yYcu942iC5VlYo1L1eL6a61AalRBp9MaI2yu4P2l9fLz2RBO54oLRxaF3r5GDPgvV7zynCXgXw/
	cyYUDrunkeHYukPQyUskXvY4MDPGK9RA29OTCDvxByVAYHivi7aiRzRHiwFqEzBHkCeIHnkuY1s
	QQuo+XNDbBPqH5uQxf2jBCyS8Bzgf5gSYUXqNJ0dAKZVNdl5qkgRGYzKZCMgQvO4NVOrVny1/Sl
	AjO+rcaLrQFyjbCeQRZ+agHo4mkhq1siBM1nVE7A+kRSkjAD2V0QQGUHXiwv7RIvPNWqXRpwpiO
	V8eXRWDnoH6xH710zYT4Q/IszH2Jja1/uyq20l/nXMUfM2whdUwS/dZt8eb5ahKQOE80IAREH03
	9C6IEofi7MyVINNJvalv5/AoMH1KuANLGvKfofkOUsKEClI8Oe+ahRxzj/5+TfQ/cOiQ7M5XUWV
	zoK2enW44FwxFlJaWvC+FEz9KMUbSHDuN7Y5RipMyGr6LryV1Z/6N6C1r5MgY2gC/0X3kDbUZxd
	oHuo57c6lNClBVi8/HNkYuVEQrW2+6B53A1oPz2d0JI=
X-Received: by 2002:a05:693c:4090:b0:351:1230:e379 with SMTP id 5a478bee46e88-3537df59719mr1717655eec.6.1791525996087;
        Thu, 08 Oct 2026 23:06:36 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a2afsm4185544eec.31.2026.10.08.23.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:06:35 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>
Cc: osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 1/3] gtp: set a valid genl command in PDP context get and dump replies
Date: Fri,  9 Oct 2026 06:06:13 +0000
Message-Id: <20261009060615.4177402-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261009060615.4177402-1-anilkaushikwireless@gmail.com>
References: <20261009060615.4177402-1-anilkaushikwireless@gmail.com>
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

