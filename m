Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EA7437846
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143162; cv=none; b=SU+QfmuNyE5KJEiW7It7vUh+oMSWz4n5JVqaEnuZ/gDsYC5jib4DhGQgnKgGdT5qMjeRbJrQptoLdlm7M8Pd/QKXXjMqKFOcrCpK9DvOwzAl3zbbcmsU7U6ni6h3MbIRm26G3fWvWfO8jfcT72DrTDWTCQZwOz5c1Ebvs0cpQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143162; c=relaxed/simple;
	bh=3OTy30U9zaA/EoJrB2LEVikw7T9erylLWW9kg7srSqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dqBxObygSmvMXvsiA+rZe8qtrV5iDR47IeTgfBG2zMJtAWwgmfg3HL00NHN9V+hBSPbxIA7KkCaVzhEmK46miqfCxpAIhU0nSpEwpfLH/AAIrrY07VaR0EMOz5yrP2G6LkZp7at+uhvCtF3N4rhUe+90xnWhMTGHwhm2EN6wBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lG9eWanX; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lG9eWanX"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30b6dad2382so15001553eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143159; x=1792747959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=lG9eWanXp6F34VL+5KABtmaUD/FqjI/9F1aRT5KoeQsWikE7x4YtnSIg5F2/ZPg8Dq
         PePTpdsCVU4ZWXqstpXLsySY4u9tBu1lrbUykdf9yk2JO2fxO17cX5IdogM+kq2ndZS1
         BPQOv9MrXmSaMx+HIg/c5JAGEO3bBQakipVu8VcRIxEFe+4dWirEnWCvlp8hdOkOaDhT
         CI0ThqY8xcgrcQmTG+scdgYqjTixt3eJGCbZRX2h3CThnRuwmRjoSC/6mu0nHH23ElF6
         azoxe8JwGb031mFgckOWiSzV3psUNE8eWaLFLrqN8yseVA5GtEJoTOd1I5UAMYBKGtFL
         +gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143159; x=1792747959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=RzWUcs3M1opPx7CPvt3KoxlOuK2ga7I3OeOZbcpiZCvGBnhtcKycKtxzBqs3A7HX/U
         MTeTuFa/V+WhWqjMqCmEgGQYb4MWiZJZTwPd1ZYEKAz2IZq3L/bbAPq4G+qpoXD7fe8S
         06cQ8z2DdCzZGpsfbSUEDQW5l7GFIic7kK2TMeyDMxifiAQj4MszV3fYiY5dy4wLvywO
         GbMNf/tBrL2PXfpcc9B8kJfp5R35E+ihCzkBEJT16VIeKsdg0BVLeuvGjJsYzay6G+A3
         9vTYuonZ0AVh42lkbNN6M2C4hbI+RHklNvY+puhh6JmX6PllMioSg24wrIqD1nD7IVsO
         50CA==
X-Forwarded-Encrypted: i=1; AKwUvBx/ofploFxKioJZIxOwgZGm5xYhIt6AdvAnywg4+rvY+YmPnBUgqlM3/+fPrqPxJgmeO68n1/j6kBoAot0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWGN/eMWqWCpimsGWuxN4wM0YFQw659vjjLv/DkFGpyStKJGGq
	brAokICB3n7hIp7+042opk/w/yD/XKahY4u4WgyfauklnYZE1pM88P4Z
X-Gm-Gg: AYBFou3xIRKhV867UIXnbVJGk7kwr84PJlnmE1R23g8CvtteBJZw3qE/fnqRGwHed7Z
	yEF6DPAuT0AubismvoUtJ/sWhJswe4CK7YN93lVJsclqB0loOF/zkN+XdE56uTbxjCDSUBr7Ga+
	cjfipH6GEddWXxj9FsnAF7r51IWQoue0j1hE9bJDNUsyl06KSM92hQ7Syug7NdTyQlMrWEJpG4a
	wnya3BIjd+ou1eyOmphil6mGTr+ZlkeQGR1vhM2jGTM70dyEcies2ocAyZ+T0xQyr5RqRRLic2I
	qmRhsD9rnGJ43Wxs6jiTL76AcOlkuZZZWu0yI3o7ySSs39+jThQgNt5fBZ3EFICAgP2OpQUe4bX
	DS47Jn76i2L4YWO2rgJQ4BUXQlAPGJ0cVGZIGQoTAojAIfedelmDurSUyV5/IuX+uSUxUKar5K2
	vfzvhcgkjy9fNBxOI+9y56KRQJbr2NmkcOjYh7A9L+egQGM39qRo7yYA+1Wt0TgFKQO5WhQ4qpn
	nwfdqUOABrU/E6bFSp6DANkMf0psT5vR2PNkX4pXTEM/mxdK0c971Outd/qkt2xv3RA6EMXL0UX
	l47fjcueAN82jeHnLX3aTF0Ukl/0ojGFVYwH0sNvLSo=
X-Received: by 2002:a05:7300:87:b0:360:c266:cddf with SMTP id 5a478bee46e88-360c266d46amr1747387eec.5.1792143158891;
        Fri, 16 Oct 2026 02:32:38 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm5157172eec.18.2026.10.16.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:32:38 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v7 1/4] gtp: set a valid genl command in PDP context get and dump replies
Date: Fri, 16 Oct 2026 09:32:22 +0000
Message-Id: <20261016093225.1036375-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
References: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
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

