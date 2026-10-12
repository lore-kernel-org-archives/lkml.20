Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EB13955D3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773294; cv=none; b=XHj85aOkUKWo67Oy4ej4uytDSGdhiGGGxRP6Kh4sKvA4ghzsKBO29typWroChFged5G3fVveoCu3rIi0p0fVnFkSumjU6qr4jkzH9/RoHKHWMABSIhGx8q913LzwBwoYCY9IZ8iGE1tyeuFaLgUHAZ/YVfJqE5cjLRviWmRX/HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773294; c=relaxed/simple;
	bh=3OTy30U9zaA/EoJrB2LEVikw7T9erylLWW9kg7srSqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VpsxXa/JSBewdClj5Tb+N39u/EscxeMegUsMUVyHu7hTbHZKsc7J1OGz+TCi0zdVxWvKrcwoapVm6p+fyZ53BmGTDQO3WIbjD4vw1S1QC/neoQd7Z21ccp6bVYjyGlez17cGgCfrfW41/VSXyTWL8EJ2pSORv5Tu5yTSTNDZ6yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOqWgA/o; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOqWgA/o"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1773001eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791773293; x=1792378093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=gOqWgA/o7HnfLsPx1JPq52guD/SalD/nNjTYb0LpVx3DgMdynBcXcJbPpJd/GIVVO2
         SxrxMvblhHHp/9YVfz7Mwlltf1jUFw1jmnkpjUfrCcXxyP/0b4MLxeHTQPE8tJpqD7nG
         aVwlEqB5IWoyor1vLEbP2GYPvshUmfKPy0txQeQqT61SmrvDHc6linP8DI0DZ8cQ6CSd
         xLk91JyQ4QioHAp8b0eqsDFHK6bc+opnTfkszaTjph0WMClf6SDTWq3UT01Psf+H564O
         D0sU6/vrnKjSKhx0hckhMjcbCkjUGOJSWJLdkY7m/wNFsP1CCQWaqLlzm/KhHA2suEiD
         3Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773293; x=1792378093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=dLzqeh+vlVhcgNtlZZxki6xNhRUYVE9OnJDGvD86B+Q3lfw2qFrMuWJjB47bXQ+rFx
         dFUo1VIzpVr5DAfJTc7WAQXK5GxR8iw1TknD8gGh5iv+Jdu5vudwYFIeCIVCawzLNANN
         jdrEkwv1DCwwSqV1Kavdu+sskOvZgjMee1eSWiODiwWgtzCBpSqhuApJ8BcDEmYJQY+z
         QdvbJdIzVzh9qMf+3VJZi5CPV28rIn3hOkSzJe6s4iQ2jbr1d1iW/jFr/gmkiICXa/o9
         Gk5qn39Rb49Gv1Nk3pJlQPWDsMyc7+dk2OOrFg+bhZbwuKzqzgelwlxnvBFuaOwWIWY2
         KkCw==
X-Forwarded-Encrypted: i=1; AKwUvBwh9wzGHOJWbTf7/eNUApBj71x5Tz5SpaXi+B4NrM4FB7QDrYoW01qrojY7/0ySlxSXNeU96F5UpC+iHn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTF75E+AHL9f+ieYJCT9/bk3UETaNSlg4dYwlbZtpLWJMmWEFf
	64FUnIq65bZ82+bytcPmcU9/07jArxIGRU0l0UIDFknfITvk07UQmxsa
X-Gm-Gg: AYBFou1amCte+j6h3NtaVVu8Yv5hXSeqCSWGE0C1wRpbsnKKPZo6jfbBNpZcXvhYtrG
	irDKfqyxYVMt/s/nElG1v/8pQS2xFop+Vh27jfky6Lhcx8Q7KCpz7+nROvFv/TqwbIQQYDcomUA
	Emm9A1naGTnnv3uC52m84HoEEmPBRdM2IkjEDDK8wcHUEVTjqQz02pRGEYTkPBFI8AB6ruGVL/i
	kcleeL+iwG51aUdUREP2R5t/Cy2QfwOgoXQuh/sBevGHvPjBpekgrfDWCz6wKrEGBQcVd+lX31E
	c0wL8ynB55x7aSVIEMnaXqi3Ongs1te1ak+qik5NpasQk9fdYNJfxqkdn1npOQWYP5rfHkTe3GD
	xEauqcmIMuzhB6WWXNDbXaDzj1y2tskUN9NO/GMuX2EWcyMun+tVNrBKpXH1/7pQUb29/fwgQoB
	gS0Sy6/A3E3W1pXtAXT1QcpP8j4yqkYZMMggqlaZE0Fnmi6tslklwTZZM4bOAMAlFa2vnkJEZ2U
	esRAlSFISH/NVd4bnBEHr2Z3JH4aI1/P1TXBZi9rWwmOM4Lh+SrdiRxkoTzhqxGXPbGDuOhkP7G
	PXFDBC/FG79RyN0lGB064gMT7ujwdhoTM32XEUPse0A=
X-Received: by 2002:a05:7300:7aa2:b0:351:a9b1:73c with SMTP id 5a478bee46e88-3537deccaffmr11904799eec.2.1791773292401;
        Sun, 11 Oct 2026 19:48:12 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm26075299eec.6.2026.10.11.19.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 19:48:12 -0700 (PDT)
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
Subject: [PATCH net-next v5 1/3] gtp: set a valid genl command in PDP context get and dump replies
Date: Mon, 12 Oct 2026 02:47:58 +0000
Message-Id: <20261012024800.400616-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012024800.400616-1-anilkaushikwireless@gmail.com>
References: <20261012024800.400616-1-anilkaushikwireless@gmail.com>
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

