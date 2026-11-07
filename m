Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794012586;
	b=Mhj15yWrObVGtIYfjbcMMfv5fKN5iaB5JQcq8Tvn0JaCcRMyscrLA6HX1QBmvVRcshrx
	 qmfCSgOqy7t4Wdto2bfLv4lkK0sdPjtXqElOfrJnKqc9g+vMHas5mMJpbzIfpv0emyq9U
	 0lqva/DBsdZR8LuZc12rPNEFjiNOb/tQHQDSqcwAYGxo1gBogXxnJFpKRsKkTYxZLtXVL
	 /cV/49kHVKxSP/AQ2ShLacKQI3HOnOIM6vA1isHAgp9gXWkKxyIEB9zZJu+sS4nrc0Ssn
	 s7+nzWfQ9fAkDmiQ0uIiGEUsdnZsCilIszWq0rfSkjKopoqJLNZd4PiABgK5KSuOVng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AU8Sh3UWwtf5Levg8kTCXNKh0yXFjsBlmyC03UOP2A0=;
	b=Bt9oJJlHDlyPh6DP/U3Ezfhnp4Q4BQojaYwrhweamQrPJ7mTTOIbGTzX4OBGDFQzdPEh
	 nUZtqurtqX+JIYvdvaCBfC5zUeOOMpUM4gVz8AYEkQ0dAzZUquVLuZwBcR1DvxZq/fQw7
	 Xnc2gf5+xTgHO7sMtvotMrWpSoydPCOGWWswu7RBgBow9rRvMcyEp2FhXa1HqqKps+YjA
	 DqwqR3grGWca7A8fVEwxhwwIThKkF976R/arPPB4keR/+sUUFFqrmut7prrB1DpkOJi4l
	 60UmHgWh4K024el1ILunETnDN/m3yB75EDaHJbaKidftqxLBFq+nzb9q80o1XyCbfCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=HC2AXskH;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB4E6070BA7
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB4E6070BA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=HC2AXskH
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1573855eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794012585; x=1794617385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AU8Sh3UWwtf5Levg8kTCXNKh0yXFjsBlmyC03UOP2A0=;
        b=HC2AXskHrEb9BhDcUHs1I7/T5DkoUZH7cBrg2/auih3ArgAjqL8gETA2iAJ0TWyGE9
         ZXCqsnWqW0gzun98sn8nAKzK059gD2A0N4Anzn3F+Syt44ZJ1esJaI2MM9N7DhiACpQY
         gjI975cZ5ka46TFyxRD4mV1uy/5dIkEHRbGM3CPNjW/yrCMhmzR6R9EapHzT9qvbsEF1
         O3kOpLoaciq9qI1sSBMFaqvxyDoYtKsWnH18bTmNZbBGyr9LNjfR/ZvjyrV8oDwlaTWz
         t1a7Jyks83T0WsQrNxCO/OjuHEDWt91XmMfDGLGBgMqENx+SYVD3XEE2N26eks68wqjQ
         E/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012585; x=1794617385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AU8Sh3UWwtf5Levg8kTCXNKh0yXFjsBlmyC03UOP2A0=;
        b=beLGTj8xSdEkqQ+Z57Awkt7+vLBgdRSTMf76fIKOYYy+uGXDTcqmW1NwbCr/Pj74kY
         HO7Yum5j7kQB2iAhDIQ2G+wFiEwwznaiUsTUzzIf+eg/8quAH+l5WjLogMR3jBbxydVx
         hq5MNSv1qHCgTEO2zTdNxZKv/TkJqt37aE+7krDrjyJP9+jS7vSbM5018sYYjp8+e/ce
         s5agEoGxTgVDO1M1jm6bTec1R0Ds6W3SrES0FAXVTqhyRB5ha3tY2YppSw6zBBEDtoTo
         uU0B0idAFe2lQRGJO0wOGeRLJK0nsi6xzyB3cNpYvLvwhRDz/tkO0A/PSysEOelYuBe8
         A8BQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFbDoWKnsnm3c9c7aUu1dqRCu9UIokNWSpkqXLi7fsPSmkJFMat6ZM3YnZMZd7OJuG2PDKEQrsoQJnFVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qpIWeV6dbHcSscK2+HWWPIIvFTsOT4O/bwjqar2SjknPUygjF
	pza9hAPwAej9WIBjpQzJpCarRY2gj/luLfOUZfZiz7yyDIlR4NF5HRjontwS+1zLle8=
X-Gm-Gg: AYBFou1urqSfd9oAcyTkrxuUvY/b7GD9ByDYX7aewsOwFsQ3hiBc1nv0oV2cFonedct
	ugU1+a3hj5Vu8JZsgHnKLRIlSbNcpLb3XsQOJKsNvS3ws3o5Fh/5Q8YkokxCd13BTb+qP0KynHS
	x+WwDFU6hle7dlZVzf/ZKnQobhp0klsMpqYdWc0fGVfkP4CJNP6rgIzHHWlQ2XFI6Uu0diTu3Sm
	wJnMuTQa+XGZN+lrx1b+sByiINckxFrgn/pYYl0JHWh0WzfAKVUJRYMA9k4P7j8Og/UGe4Dv4vQ
	jFdOzyDuC5SppXXkZYUtyM2ZWIE+DHkYUyyynRnDjJTLuPMb/v+MTaaltevQoUExAoeKRRsGgAe
	3aLZDXa/I7kTPuKJyp9DX8d9rmllmu5jY+MKhqLISNW5FYRVDBmxLafh0wu2dB+m4uudY8ODE49
	HvgGebvkCr37CO3wMkxB1yfJALowrxaPwZKtXJIbSJGx4XgJlxoW1pD9LZ00XM/EJosE2pXG+xd
	smUhe3Ds4oGhL+TleFEoD+vTpbKbM/lcs5xTsCJrxbP/+kb0XUf1iLDPPlwAMO92VPclCcS3ALf
	GwQPJX9aZFo0SUxfA+GiyGuN6i/TAYesOzbJqXCk801LBqw7+Q8FsqkLVFF9FUtlwIy18Yk=
X-Received: by 2002:a05:7300:50d9:b0:36f:350b:3838 with SMTP id 5a478bee46e88-36f76814c19mr5876815eec.31.1794012584361;
        Fri, 06 Nov 2026 16:49:44 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a718sm11021294eec.4.2026.11.06.16.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:49:43 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH net v6 3/6] amt: reject a gateway Query or Data from 0.0.0.0 before a relay is learned
Date: Sat,  7 Nov 2026 00:49:32 +0000
Message-ID: <20261107004935.2627329-4-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107004935.2627329-1-omar@blockcast.net>
References: <20261107004935.2627329-1-omar@blockcast.net>
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

A gateway's amt_rcv() admits a Membership Query or Multicast Data
message when "saddr != remote_ip" is false. remote_ip is 0 before
discovery has learned a relay (and is reset to 0 by amt_dev_open(), by
amt_dev_stop(), and when the gateway gives up after its Requests go
unanswered), so a packet whose source is 0.0.0.0 would otherwise pass
the equality check and could spoof a Query or inject multicast data.
IPv4 input accepts a 0.0.0.0 source only on a limited broadcast, so the
sender has to be on the gateway's link.

Reject both when no relay is learned: a 0 remote_ip must match nothing, so
guard the check with !remote_ip. A Query is queued before its event worker
processes it, so the relay address can also change in that window. Recheck
the packet source against the current remote_ip in the handler and discard
stale Queries. Discovery is unaffected because Relay Advertisements are
validated against discovery_ip, not remote_ip.

Found by code inspection while writing the IPv6 receive path for the
AMT IPv6 outer transport; not triggered at runtime.

Fixes: b9022b53adad ("amt: add control plane of amt interface")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index e4b8c02a0..c714994ef 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2499,6 +2499,10 @@ static bool amt_membership_query_handler(struct amt_dev *amt,
 	if (amtmq->reserved || amtmq->version)
 		return true;
 
+	/* A deferred query may outlive a relay address change. */
+	if (ip_hdr(skb)->saddr != READ_ONCE(amt->remote_ip))
+		return true;
+
 	if (amtmq->nonce != amt->nonce)
 		return true;
 
@@ -2977,7 +2981,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			}
 			goto out;
 		case AMT_MSG_MULTICAST_DATA:
-			if (saddr != remote_ip) {
+			if (!remote_ip || saddr != remote_ip) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
@@ -2988,7 +2992,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			else
 				goto out;
 		case AMT_MSG_MEMBERSHIP_QUERY:
-			if (saddr != remote_ip) {
+			if (!remote_ip || saddr != remote_ip) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
-- 
2.43.0

