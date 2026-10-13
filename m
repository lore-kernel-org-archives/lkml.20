Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9934531638
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914065; cv=none; b=SowKAV6gdGY6DAhjEEvB6UlGRcTPEY0W5ICJEKfqaMW/eoVpsB6kfT5KE3q5LeRmbh0qf5CTPd8cnJMsKvXp+LrdR+QqW3Vd5DbsgDmsoKoJmbORdxErZp8Q0WSUwuN8l7sJUYjV1vWfVEgVsuv4BDzF5Bd8WLO2/hINFPGuEC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914065; c=relaxed/simple;
	bh=DICuuSQsL9cW0882yat84ZKiXS42C1gmUGcVBN9M/2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CqZbo5cu3vAi0ykVqwfGYLEwtq4Un2VNf6/dAp0u0cemiRbRSmbqBYCskOLrnABpTrWdgpM/lKYP4ML/63OCzqn9R8qfc/BJSmKKbZ2C+OYFHC+dzj6zT2uRbXJrMOgoFVsXktsHuv84Svj3M7zAk4CIwl/8LZdPbCTDZi5yGHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=J2cPlOLz; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="J2cPlOLz"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso5566887eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791914063; x=1792518863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBU1EIfeJzr2PDW5mmgopthXhZxcqsKna3lW0pjw7nk=;
        b=J2cPlOLza8Isw/sO/iyLNE1HUJof13aNtMlNDBYq/ZG5E5ETNXGwav3oPaaoM/ALGD
         DTJFu2oLBI/NQ+1+cRCbQPC7Qj4HnFxre6Phj7BemoJ+RbYEW3VZHOXrKmUuG/XH+dsM
         aFrlKRTDILqAXW7y0ZYVNqMM1wXEPY+LoJklPvdDcfKG9TikV3R8s39/HEaDcRxVEoAo
         Ad9hDCysz400rUsvlTgAsOjvivmRYosJfqvi7uEjFBv4u0vc9njTsogO9aAv1jnNb3f2
         TfTVK/GindYvRY33XmWhlg1xZSILAFgz5MsL46wz2qRg9EfjEAMo8QThTSHId/0HZdHB
         RA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914063; x=1792518863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nBU1EIfeJzr2PDW5mmgopthXhZxcqsKna3lW0pjw7nk=;
        b=2EIYc1fi8/m/8kRMa3POpW8OUONc6/vS8uCqbOFGN98c3eZE9wHMpKHliIVesH9r9n
         6z40sVqzacG1CJFj5HVldWDemWN2V8w4dae84AOAuHL/60jdRuz6REMaR3qu5TC4RDll
         r4O5VDk+cC8kOCV4oDtVmV9rRrRyV0JEbDFWnJfPPUxGBg4fjKKpcyphA/I6ergK2NC7
         r5mvzl4S3wEolmeLIjaBKNRsS1frFrGcBbdE9gCckrm7NhiOQPZWlmLLxNRmVierIiVg
         PLH81JBLMMppNNjPMT2nVU9pCLRKUW+koezuIXBPKf3YErh+buvA/0gQdTjJSYZxtUwn
         taoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYQNMCqYIJY9vkcHLmf/x3uWjURmmVRYP+k/nUTMSJ6tgzjbYk4OwfYKLVS2LTDh0ReQVgZ8KAu4kqvKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqXApyPhSkDft8teAq0NYAFOQgDUOAXPAsGUE4caj0e7XtyGBx
	JO03i6McpQelbIg6cWzZ5flHeOUyqIVsbGioKrQB/8g9PzXpXD51EO2qESuEykofbQc=
X-Gm-Gg: AYBFou0/gsdfouV2DNdmsTsNHt8i7OdtcMP5voWpHnm3OFPom1orBZGOJSlPuaVMNMk
	U+qD+XgBUeCep4hwro5Q3sWOOzqbXY5wHOnT4XHQwB/Cc+R7dSweaW6uByAxr3T0wNCPh20bjNG
	YPwy/AWe50FbVSSjoFOMzYlDTe1EmQthcabWYoCcG2rv5ACV+KIceZHSYZcmSc8uzuqhJt36urp
	Gh8WmUEqYuVt+F4E2b6buLHldfmC0BPn0d4qJLHc5PDRSGIo7rr7IOWi6BrGOaQqRakpRraNE2j
	2XXDSdK+kSgT24JSGS0tGSt4zRahghjxUEiGL3brWDVMiVuP2XpuPfO/gjRBdShMRiLcY0E/ns/
	0+1NOoxxywAvQPU4MTWkZP9AFMsPD+6muSM6TKgq1tA3sAWtflWKx0LvWpiPgsgL+pduWylruId
	2u4Rd881jHhQ2sVEZ2p08ic8YjcUttsgDQSIko5Y6bY7eQUcLQy7yOQWuGoOEPaPapnC9YzicDe
	6oqwRFWwgrtAYbGBXB/X5iY/eNp+KiLf4RAroIPBMxO7uhvISOh2e/6cM/XpQdd
X-Received: by 2002:a05:7300:d084:b0:35d:8c3a:38a8 with SMTP id 5a478bee46e88-35d8c3a3c06mr327290eec.39.1791914062710;
        Tue, 13 Oct 2026 10:54:22 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm50183362eec.17.2026.10.13.10.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:54:22 -0700 (PDT)
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
Subject: [PATCH net v4 4/5] amt: make pre-query report drops visible
Date: Tue, 13 Oct 2026 17:54:06 +0000
Message-ID: <20261013175407.947606-5-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013175407.947606-1-omar@blockcast.net>
References: <20261013175407.947606-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A gateway cannot forward an IGMP or MLD report until it has received the
relay's Membership Query for that family.  The Query supplies the
response MAC the Update echoes, so dropping an early report is required,
but doing so silently leaves operators with a dark multicast path and no
indication why the join never happened.

Emit a family-specific debug message before taking the drop path.

tx_dropped could not show these drops either: amt_dev_xmit() reaches the
same tx_dropped increment after amt_send_membership_update() has handed
the report to the tunnel, so in gateway mode every forwarded report was
also counted as a drop.  Return NETDEV_TX_OK directly once the report has
been sent, so tx_dropped counts only reports that were discarded.

The device is LLTX, so amt_dev_xmit() can run on several CPUs at once;
use DEV_STATS_INC() for its tx_dropped and tx_errors updates so
concurrent increments are not lost.

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index e466cf8..884f27f 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1236,7 +1236,7 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 		group.ip6 = ipv6_hdr(skb)->daddr;
 #endif
 	} else {
-		dev->stats.tx_errors++;
+		DEV_STATS_INC(dev, tx_errors);
 		goto free;
 	}
 
@@ -1249,12 +1249,21 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 		/* Gateway only passes IGMP/MLD packets */
 		if (!report)
 			goto free;
+		/* A validated report can only be forwarded after the relay's
+		 * family-specific Membership Query supplies the state echoed
+		 * by the Membership Update. Log this readiness failure before
+		 * the shared drop path accounts it.
+		 */
 		if ((!v6 && !READ_ONCE(amt->ready4)) ||
-		    (v6 && !READ_ONCE(amt->ready6)))
+		    (v6 && !READ_ONCE(amt->ready6))) {
+			netdev_dbg(dev, "drop %s report: waiting for Membership Query\n",
+				   v6 ? "MLD" : "IGMP");
 			goto free;
+		}
 		if (amt_send_membership_update(amt, skb,  v6))
 			goto free;
-		goto unlock;
+		/* Sent: the tunnel consumed the skb.  Not a drop. */
+		return NETDEV_TX_OK;
 	} else if (amt->mode == AMT_MODE_RELAY) {
 		if (!data)
 			goto free;
@@ -1283,8 +1292,7 @@ found:
 	return NETDEV_TX_OK;
 free:
 	dev_kfree_skb(skb);
-unlock:
-	dev->stats.tx_dropped++;
+	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
 
