Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455964;
	b=2+Tc3DwFzDQSgFqWbsBO3znfcDwl9jszmr84USURPM2c23knnP6U0nN0+LoBS1N1MgHt
	 d61Cfb1c0BxW9GZ6mUM76uhobDRGyP/tIf6yk4f7tV5DL7gsLYs0uKqILfbeOruasqXVI
	 RLsB8uVQuLwYS4kJ9O1lIikuDtzqdghSUsj99N+gJHLJ29pHpnDKMPesSURQsqWkwc8bD
	 vzHiG5K+QM0RiCiGS4ChsHV/EW0L2CZMW75TtWQcu3JNqLHKRUPjP1xH8Zl4C1YOJwzwd
	 YCYd2Dwisc3598lOurloNrbwVPdSuUcbPG8BpAyQCAhAIYfszYCuTgTD32D4rGhybhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=COFaY0fjD4W5B9+uIoGdB1sae14RtC5HEU1O3nW/9+Q=;
	b=jfdAxTxJXsaRs3hBzw6EPBj6URY2x8QTvm+gjh6mjd4S1mpcpsNY80ch9Fb/t8NdcNcO
	 oOz7het+2KaexnQuUHPBuUgUG6EHbkgU55vOTGpDU0VFYvpTVN+8aF5gshOIlVSdIlUty
	 iEP118akrbxRrxhrVk7SjWPaMmVB/EsUZEwCshSOREZbEDoULgoEwMaQseG6vpEpe6Ip7
	 lrNDLIrQ58XvsDkiG12/crw1c0ZypQXt+CeK8XdvL89Jjv7djYas1ZPNGvReDwQ8Bcpeo
	 XsrQi/yt447Gus4IYz0SgsDEAtYi3B/5iAFcJxs2VOyMYjWA0X89GhKhfNp6ywIKOHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=yCPDq68v;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC4606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DC4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=yCPDq68v
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso5084965eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1792455963; x=1793060763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COFaY0fjD4W5B9+uIoGdB1sae14RtC5HEU1O3nW/9+Q=;
        b=yCPDq68vGPY3eIFms5XrKyECmnNkPXdH6G2WNwH+KbulONfq+8oO+E5/oRUdbOPDOW
         +VcBGcmu64SGSi9GH8o5D2U//87V3zgF0zoQkDZmlu8gp38/GQ5wnZ8inD6fMmQZFYKu
         H8NbO1KlMiloc94MOGzsp9GjcJvi1xOqNMySzMZdb7h/AjKdIEuOlcfad9YhRSvX7hO6
         OgTvai5Rg66fjNG0XMyAmeNPobh41ypnTqlLgJ5549lVnyVUMhBD8hrlE2H4aQFGKgqu
         BP2oKnVVYGWloxjj4uFrJxmv1/VcSwU1qjEQyCRixrC0P62CcGq1XMzX4CQro6ZA1ez4
         zmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455963; x=1793060763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COFaY0fjD4W5B9+uIoGdB1sae14RtC5HEU1O3nW/9+Q=;
        b=fHCpBNN0DM5aiRTfURyyxbLviEwL+MrXH+exEOiGCdTse7HPBQv+UcUqadxXM1LI2B
         LGUidQiRiLKFsFZIFkZ5dH0iqWquC9y2Z743tiYVR8MyMqXgc+M+auE7NMF6dsVrtpez
         8tRWgvSJFza06nAScJnTvQgRgy86MOnqdVQ+LH53i6crH5dVLX4yBmD9xcUqvJYOBRSR
         i9rsWKrrl30/IBys7qkXoXrbenZeMS46Jw20RHEGX3oABQQTjS2Wr4eo4wbuGQAIMR1l
         XmoUIPfpQvs4D3ZM7z9qM6+FCaVs+BMFafmnuCBGx0ShHxEHEGV3PxRRQsr/ZaneVGK7
         9ENA==
X-Forwarded-Encrypted: i=1; AKwUvBxhg5mXIJLV2DdWMwZGmclDrHgaZnPSfuzrxzMY+wNaqu68JBqwnxdBxmHGxSk3vKwKMg5OeoxCYQViQME=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYfZHDx0Mwq2BS+XRpgSWTiHf0erT720Xjto5jcQzT5SaD7Wgw
	Fsjc/N2Gi4jEUnY+f96aKLC3fedVZmkpmhldr1SyfL1DFRTGhro1dXjCgOMq2EwTC/8=
X-Gm-Gg: AYBFou2V+gf5PLgrHWw9FMIKuWu/Ui+eWySm3hM2VnLkVnUAJfK18Np12M3OH1Vu+3m
	GWoMaXVWbEZQFxjUGz9uxm+MFlX4juhKXOOUyyo9YB4x0p7ewyV2IS9Yj2xB1W7gmPIHIcwaO3M
	YAh5xYZAbfkw0XZ7b6sn4HecSkGT0kfhlZVc6WgtcKIRTz4kAOQKjRZyAje+HUMOZE1n8boeiwM
	VWyC6No1BzBdWrrALxP9W0uhqS6LrSqKuQjROdyjear6PnAIuxcK8FStFvk1b0A5JAJZZAxjxna
	3pRlzjfUirxzysBq1nxXqdN2yD9lbHcULdlBjMuEpmQqMBWDL0WhFhsewsjMQCziTCeb2RA+q2j
	yO/JyOlJMeWSAWw8ZGGz6Q80tY05HRmbfX8IE4oYEoPOzL+iY3R69lEGMCHzJnXyXk/z0CXOrlJ
	ZVs0kgnJfb9rxMTH/fcihhk1V1FwjIgcXvibcYLNqplpQC6srg+orfjHAxlb9J+AhlO3mxz9n9E
	pmuNxbSHJlhrjU5HBYMh00v7z0+94RInranA++Va5ga1wf3SQ1r1onh6STA/isI
X-Received: by 2002:a05:693c:88c9:10b0:35b:fe88:d053 with SMTP id 5a478bee46e88-361a2052c21mr13014070eec.23.1792455963030;
        Mon, 19 Oct 2026 17:26:03 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm44748072eec.20.2026.10.19.17.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:26:02 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v4 2/5] amt: reject a gateway Query or Data from 0.0.0.0 before a relay is learned
Date: Tue, 20 Oct 2026 00:25:54 +0000
Message-ID: <20261020002557.3984927-3-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020002557.3984927-1-omar@blockcast.net>
References: <20261020002557.3984927-1-omar@blockcast.net>
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

A gateway's amt_rcv() admits a Membership Query or Multicast Data message
when "saddr != remote_ip" is false. remote_ip is 0 before discovery has
learned a relay (and is reset to 0 by amt_dev_open() and when discovery
gives up), so a packet whose source is 0.0.0.0 would otherwise pass the
equality check and could spoof a Query or inject multicast data.

Reject both when no relay is learned: a 0 remote_ip must match nothing, so
guard the check with !remote_ip. A Query is queued before its event worker
processes it, so the relay address can also change in that window. Recheck
the packet source against the current remote_ip in the handler and discard
stale Queries. Discovery is unaffected because Relay Advertisements are
validated against discovery_ip, not remote_ip.

Fixes: b9022b53adad ("amt: add control plane of amt interface")
Assisted-by: LLM
---
 drivers/net/amt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

Signed-off-by: Omar Ramadan <omar@blockcast.net>
diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 478bd85..c19e67a 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2472,6 +2472,10 @@ static bool amt_membership_query_handler(struct amt_dev *amt,
 	if (amtmq->reserved || amtmq->version)
 		return true;
 
+	/* A deferred query may outlive a relay address change. */
+	if (ip_hdr(skb)->saddr != READ_ONCE(amt->remote_ip))
+		return true;
+
 	if (amtmq->nonce != amt->nonce)
 		return true;
 
@@ -2948,7 +2952,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			}
 			goto out;
 		case AMT_MSG_MULTICAST_DATA:
-			if (saddr != remote_ip) {
+			if (!remote_ip || saddr != remote_ip) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
@@ -2959,7 +2963,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			else
 				goto out;
 		case AMT_MSG_MEMBERSHIP_QUERY:
-			if (saddr != remote_ip) {
+			if (!remote_ip || saddr != remote_ip) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
