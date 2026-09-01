Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005AF47CA68
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254796; cv=none; b=Yp05XiGIm4fQz7Islw4en0T0wkrFUZ0Q/EwJfLmGobWZwx4c8vf0adKKn7K6OliQOFbPIQYapKCV71D8A+VDTnU4sOB2NzBGAQldvef0pq8PE0LJcfGf1EmHoLGCFco0dKu+FVRwiTAfJJfjMcMZbvdo3DZaWIbnV62uY+5mu+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254796; c=relaxed/simple;
	bh=19eTCqrrjDDqZcwZomzp1yeRhX84hOOWpMarqsBgp58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9mWd01tnAfs0A0FMFRYNH6JC2ffBF3dwgT+p1vb7HhjpzSBaBC9MqXfO5hWmHKReL+4B6tISJCq96AhywDSf88/BgCWDwQIQCvRfPCsIPYmFisAuI1zHmf2/FiGMN3f/qaRHhQzM+JrMG3s7DoD1kri4QIoN+VaBkcz8IsRNtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=yP5l1lLf; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="yP5l1lLf"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a61910369bso4498188a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788254793; x=1788859593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Klhk2PrFgiXUCk6rP4JbpGXhbQzfUnpa3kBBA5F/UDI=;
        b=yP5l1lLf646V4OmcS3y/kAr+oJfP57xBn+ax7xnQ3JoXdq6kOTmJxtjCIK0rOzrSwF
         TUD5SvDlrduQST3BL/Asf6vIF2NiDvYXIT0Zk3K9wBQNvsSRB7dc+4Hm4vZ0rkhvpKQF
         XDj5DVTEuNo4H+fKinSvIQTFesqaOiKtAjpH5ck/4pDL3na0HJnJk9oV5o+b6pMKNm8V
         2Q2bgb6ssm1G9JG1+n6sjBXYMeNPIpjamKKnxO7bGFa3uAuBJgDorLg08aYs83xzq0tI
         Z7quOLpUGF6Gj5lpJ4ByO9yYi4Cq0Y0nBNqfjAtzA9EPYV9XrMYW1p/HajnphQDWAeXH
         67sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254793; x=1788859593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Klhk2PrFgiXUCk6rP4JbpGXhbQzfUnpa3kBBA5F/UDI=;
        b=JypCcCtbZgYgZQa6v26ZtHW0kOQWtJrc5EQD4co/c8IThAeg0UCLAkv2A5qJ/nFBk+
         iEAcXQqG4qilm9bbUakgr52v6vi7V15Nw/5CDw5jZUb1RC14JjLJkzSUiRROEBA8xuQk
         PQ1CXMLGEvsWBwxCHd/5tUx98q1pR+7v8lL5wOcnq8D+tlqWZWZqVtAnVmy5LU5Yhvc8
         dsZ9bZmTkIObGA8IhUjdya28GGrwEkd2RX9pnh1s+FxzsYy1vScbTmw9tCOkUpshf0dG
         vt6xdX3U2MNCOcs1dBofTth+UKKwd08mEIbRzq5vinQPY1rdx+JPelrwy9NrkhjG7g8o
         Q/xA==
X-Forwarded-Encrypted: i=1; AHgh+RoGsp4i3+QQmfIJQBk/AdCG2aWIWzC0OiBCXNq6m7mLZXMahDedVyuRZ3OrurpchR0uk2ndfqENOUWkERo=@vger.kernel.org
X-Gm-Message-State: AFuF++m2fF5zsrpPsT1A/F2x+LyCq2HuWUBl/1sY1y5Y6Hn95wKyLa8i
	+a85HHiSjXMSseM4t4UyPjS2XuuZwdpakSUbiYZKlqxlVm+cW7H8ORAWKoajUiJu+w==
X-Gm-Gg: AR+sD12Bv+9NJ3w2teEWd7m5pDKK+boOySnWIryhz6lUo9oiORQrxpm2fwJUWPGUppX
	5Q9tepvdv7ui4fQF4kfnffh9mQfC96S5KOjM+fVXCZiSR6poKO/Ob9WuHTPgLb47UnldLYUAFjI
	rkOAWGq/b4QEaFAQ5I69u5E+ETgvNCWQPtQd+8+mCXcu9pu4hevpb0hJN2i/ydKbCXqOKG8wcgE
	SAnrwYgCFBRUAb+XXpOWjP+jIasDemfKJMvIgfoRy6i8NEPWHKBrbUkPhmzGY5zsvuBpO6qZR+r
	TYN27pOcjY0H19Sb44K2bGfAqRKdpCHdsYFbV2BaBki5PIsZSDr6CGCruf7/m9eK0qDNl6GbIO6
	LI37HCI0tYcgiW6ZoDX+88i2y3AQvvLIIOmfyj5XeZCh7FakzojSDAgfQHsSk1oaP5gjHjT3MDv
	ciEIXbvyVwp61ou9NKa2p9dc1vnehJPLzxRI9u9oq8GvI/7w4L75o86SMUXMqAwuXF2SX171XHl
	iduRqexowUMUvLyvHEB86qxiE1Ijj5/lbHUsgbVYDLofNbJoq+D+pdSfaHUatccGLgn7dwV8pwi
	QLA5WnCy3uVCEDYoc1D0+mb1ns78Zv3rtwSqGRDyd/nNmE/ehzhM0LieVbsaJ9PDxhA5BHQM472
	SH8EH6INIGlNoB6WVpPz+7l9p2w6Nup6FDc47CksKth7qRiusv3lHLPmvK6eYeu+HmEG3yGzv+9
	FYgV+f90E=
X-Received: by 2002:a17:907:73cd:b0:c24:b11a:470f with SMTP id a640c23a62f3a-c25b39d698cmr465856366b.0.1788254792938;
        Tue, 01 Sep 2026 02:26:32 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.129.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b5a4esm549163566b.32.2026.09.01.02.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:32 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: dsa: offer a flowtable to the switch before the conduit
Date: Tue,  1 Sep 2026 11:25:46 +0200
Message-ID: <20260901092546.369232-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A netfilter flowtable bound to a DSA user port reaches hardware through
dsa_user_setup_ft_block(), which forwards the block to the conduit
netdev. That route serves a flow engine that sits on the conduit, as
mtk_eth's does. TC_SETUP_FT is the only tc setup type handled this way:
every other type falls through to ds->ops->port_setup_tc, so a switch
that owns its flow engine is never offered the flowtable at all.

Reaching back from the conduit's ndo_setup_tc through conduit->dsa_ptr
is not a substitute: dsa_tree_teardown() tears down the conduit before
the ports, so a block unbound while the tree goes down can no longer be
resolved to the port it was bound on.

Offer TC_SETUP_FT to the switch first and keep the conduit forward as
the fallback. Every driver implementing .port_setup_tc returns
-EOPNOTSUPP for a setup type it does not handle, so a conduit-side flow
engine is reached exactly as before.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
The switch-side consumer is a DSA driver for the IPQ8074 PPE, maintained
in OpenWrt; a flowtable bound to its user ports is exercised there on
IPQ8074 hardware, against a live PPPoE uplink. The conduit path is
unchanged by inspection: every in-tree .port_setup_tc implementation
returns -EOPNOTSUPP for a setup type it does not handle, so mtk_eth
behind mt7530 keeps receiving the forward exactly as before.

 net/dsa/user.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/dsa/user.c b/net/dsa/user.c
index 041f9060c8ef..c5adb557056f 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -1734,11 +1734,22 @@ static int dsa_user_setup_tc(struct net_device *dev, enum tc_setup_type type,
 {
 	struct dsa_port *dp = dsa_user_to_port(dev);
 	struct dsa_switch *ds = dp->ds;
+	int err;
 
 	switch (type) {
 	case TC_SETUP_BLOCK:
 		return dsa_user_setup_tc_block(dev, type_data);
 	case TC_SETUP_FT:
+		/* A switch that owns the flow tables answers for itself; only
+		 * a conduit-side flow engine needs the block forwarded, and
+		 * that forward is gone by the time the port is torn down.
+		 */
+		if (ds->ops->port_setup_tc) {
+			err = ds->ops->port_setup_tc(ds, dp->index, type,
+						     type_data);
+			if (err != -EOPNOTSUPP)
+				return err;
+		}
 		return dsa_user_setup_ft_block(ds, dp->index, type_data);
 	default:
 		break;

base-commit: 25c1f6111034aef7fc06cfbdcf1e4f0d6e5ee74b
-- 
2.53.0

