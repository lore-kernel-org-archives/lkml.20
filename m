Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344748;
	b=sThwKBX6Bd8OMS9R5xBoSSOe5ZZ8ai6THQpXdzWHuXr0GY5oLFWfjbDuM87HmEFB/poI
	 exJyxeUE4/yy2q9Kp05G1AFw/uo0hX31jKJGKP1xyUXRi5TyqYOarP29DqCKVXf9+oqHC
	 xJIfZAOo8HLe5wb/Xxt36Ny3DxoWqNJ0kYcAq4k7rC/eSmHIrjEs9meEFA13ByoRG6JYa
	 s5LO7I51fZDN9bakSoPAPbEU2WTPfI7YQhJsn4cgFRnuyi3m34opH1tbO9iqGj2J3Xd13
	 0qZcj3zooZ1P+VS8PdmshfF8SfuwufJ6WsyV1trtV8jGw8H2Uhu7gv4kjtBHb/a18ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tlTA7sqBysXN+F6fe4TMgN82A274aSjTjJDiigwKkzo=;
	b=lttlYDxiI8X4QkjR0kCgoLGJnLsEW/rPQ+N2mEsqP5TaIhOPVkSgqz889W/N5J959ckE
	 8Faq0WLBYtAP5XziBtVeJ0aOupf0pzDIweXwUTsYreOo8SCeUJbFv2ss3tZrNqoeyKVF8
	 NlmOAPV35eXFkcghyVSuwzLWR+3iOKt6l1fZp3qSOVbnUgPaCj+KNK9pEus8qBIITVPx1
	 AFC3hhlhPMq76qzO2Xv1Hu33vkvujWGWjGCpnOzYJHJHYbAVjjBx7LlxsuwREvrfBo0Cr
	 xdGK2o9CRQbU2j4GfFAEMEjHbejJrCnBlQryo3Ru4EScMqDTdJ3H9aWCZ059auz0KaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=PjZAvCXD;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30EB60A262F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30EB60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=PjZAvCXD
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so1782288eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794344747; x=1794949547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlTA7sqBysXN+F6fe4TMgN82A274aSjTjJDiigwKkzo=;
        b=PjZAvCXDMrTNut+6hDPeDPP8whf8WAVkjVIU0/3wwXOzeObjjQwPkhZh1CdFvfAggg
         BJu1GFt43cJFfR3RTeUp6wIn4ogBztRny8R3fNGBc+mEYVA2zeRtXphG0GXa2hEg2yEN
         hmZHyCJCtGUgsSd/l/uQM6zupSfA1wKPdy/Br6xxy3ShRRklzVRC12SaP6DANWS08Rd5
         M4ONgjwRnQs6V2xZa85PI6sITqKfkm7g9UDENeFiyJZjV7msYx+i+4rSfR5gVzZfc3Q6
         0foJQI5OpIxMNR6Tzh/683oT9qpSFNc8Bo332TYt2cdrdyCo4UJCYcTo/QQDLFj8coDP
         El2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344747; x=1794949547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tlTA7sqBysXN+F6fe4TMgN82A274aSjTjJDiigwKkzo=;
        b=uX0P8pjYSrM/gIHjeevMGOCE/BtjVMshZoi+d1Os3N3c8ZuOZY3xMfE6WOpBPyq73U
         xjISY4M7R0U9Pzg0Bz7sm3/jC8czYlwVjzMbeSFM+yPetejJ7qPQWancjDaXeSz6aWMk
         Vl8RPW95Ghu205/6M0NYOc5Z6+poOGxm9zHJpfZ/DO55cDzGfqy1edWvwz0EcJr2pDds
         iNnVAU20+cQxYK6ADjZYScfzwLgWEKlQe3IXPqRm/6wDUKla+DEkjcTKuRO1fNSHswbz
         TTa7JEWqwlVjVpO+vfp27qCBZyAEkVmLuR2A7Lr8bc3PXc9eqgWSrSBj9G4dq4xzJ1M1
         1Skg==
X-Forwarded-Encrypted: i=1; AL+hErHAMMqrtBMsvXf365WxHwV5u/m9NpBleKOkbuYKRfUj59h8Nz5sVllJiAor+Lq+zmaCEbaFDu5d7xtSnsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H5xf2D7kSIT/2/apegglaU1fhvHOXFjZcz8EbNMmyUjHeIuzm
	t/pC0e56TJ+cScHYumMSQtghtvV3Oj6Oxprbyy07az0HCmEgUMlN7CQTEIjqNM3yS/g=
X-Gm-Gg: AYBFou3hdXSMu9m8uOKoclZy6oaYFfxX8NxtHBk9rSVgp6IqkZIJrq3NAxgcr3G/eUW
	XZB5jEofOdeVzt5RAePqF0+Cfa22/nI3SM4ncw2WU46pulGrPfe+PjMgzrJSvN//uayC2a5z4BZ
	rKxbK4zwAZ1+NaQCkcK1/Kec+KZ6FyvBnMSnCHN8HQM/JVv5aoWJ2F4ObOyvYKlnhW+wPKuUKis
	BQY08MOVY3v3dsLxeyDsfgaNOvacovd+qkptUp3rxlrYFl/wejm21zSseVnKUpaJ/IOWT6Nm+tH
	7OhX8u0904c9qjjex61saQi3PYq2iLJ0OzTLaEN0qyuzM1UCCtuZS3UtXi5vY63IYj/pZvEFocX
	rHljWZTYm5E9ylcflFhzTdVeC8VVSh1YlQ6owyAQbpb1aeJg9S1NvtwPlzUZNI/lraggbW2mMCz
	UPfLJTnS7ddHK8wU3BwDuJB1ZisZBBFaStiPDgH70VonjTn3zxfQftZ9/LvP7fvZQ6bAlCJ4egw
	yZPOoiPRbwFftTslOnebOOqDCK2M9Gh8mFxDbyn5Ci/s4Ws3zb35wmOtNjUGk633NrH8gnujedG
	E7lVLuhozpxozAjNIVaRnhmUyDHJuiJudMjdDHTvqd910Rnxy0F3NbeQ0/2Or3vt8kY2MA8=
X-Received: by 2002:a05:7300:d211:b0:372:eab:d700 with SMTP id 5a478bee46e88-376831886c3mr635514eec.1.1794344746875;
        Tue, 10 Nov 2026 13:05:46 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm10464097eec.17.2026.11.10.13.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:05:45 -0800 (PST)
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
	linux-rt-devel@lists.linux.dev,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net v7 3/6] amt: reject a gateway Query or Data from 0.0.0.0 before a relay is learned
Date: Tue, 10 Nov 2026 21:05:34 +0000
Message-ID: <20261110210538.217936-4-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110210538.217936-1-omar@blockcast.net>
References: <20261110210538.217936-1-omar@blockcast.net>
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
IPv4 input accepts a 0.0.0.0 source only on a limited broadcast or a
link-local (224.0.0.0/24) multicast destination, so the sender has to be
on the gateway's link.

A forged Query must also carry the gateway's nonce. That is 0 until the
next discovery tick re-randomizes it, because amt_dev_open() and the
give-up path in amt_event_send_request() zero amt->nonce along with
remote_ip. The Query handler then sets ready4 or ready6, mac and qi, and
moves the gateway to AMT_STATUS_RECEIVED_QUERY. From there
amt_event_send_discovery() returns early and amt_advertisement_handler()
rejects every Advertisement, so discovery stays blocked until the
Request retries run out and the device is back in AMT_STATUS_INIT with
nonce 0. The Data check is defense in depth: amt_multicast_data_handler()
already requires AMT_STATUS_SENT_UPDATE, which a gateway with no relay
reaches only after such a forged Query, or in the short window in which
the give-up path has cleared remote_ip but not yet reset the status.

Reject both when no relay is learned: a 0 remote_ip must match nothing, so
guard the check with !remote_ip. A Query is queued before its event worker
processes it, so the relay address can also change in that window. Recheck
the packet source against the current remote_ip in the handler and discard
stale Queries. Discovery is unaffected because Relay Advertisements are
validated against discovery_ip, not remote_ip.

Found by code inspection while writing the IPv6 receive path for the
AMT IPv6 outer transport; not triggered at runtime. The Sashiko AI
review of an earlier posting pointed out the nonce condition, the
blocked discovery and that the Data check is defense in depth.

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Fixes: 30e22a6ebca0 ("amt: use workqueue for gateway side message handling")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index fc3900e25..9f59ec6c4 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2527,6 +2527,10 @@ static bool amt_membership_query_handler(struct amt_dev *amt,
 	if (amtmq->reserved || amtmq->version)
 		return true;
 
+	/* A deferred query may outlive a relay address change. */
+	if (ip_hdr(skb)->saddr != READ_ONCE(amt->remote_ip))
+		return true;
+
 	if (amtmq->nonce != amt->nonce)
 		return true;
 
@@ -3005,7 +3009,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			}
 			goto out;
 		case AMT_MSG_MULTICAST_DATA:
-			if (saddr != remote_ip) {
+			if (!remote_ip || saddr != remote_ip) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
@@ -3016,7 +3020,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
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

