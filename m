Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506660;
	b=cJqaYkwdR/ktW67/X55AsnjYzZpkZngQ9QUKdmjYIyjgX3NrZQfv1HVpZc7GGqz2Z4sj
	 TH34v3QbAYFg9rZ3ZdKwUaZJRpxsalyQbt6BTmzC7beKOpE6v09V51i6BJQKS0rMKuJGw
	 tTePlB9KMtQCh9YfiG3Q/CkrqBluIGZH2WNJyFzLTGGkV2qbtCOi74SvIlWpuZjUYxh5V
	 ctbfWs+nRURXmOaDds2bdiu1/OXIWuzgc6ORjmoXDL8qG7ypwVf6SMkSaIhgRDeeFedP3
	 GmXdCaCRG4tURCyfWEqKx9vP9VOi2Rce56WksFIHXmsrHYOtpc7NgtCOSEBStT5iSdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506660;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Kjv9P6jh7n80KmQTVviZB7f96Of0OPau+dzZLCspckQ=;
	b=aKRsgn+7/l7LKyQNy9obtCA52+ogby58ISKKEROGPLJauKb7yKcCciLM0z7B2eo9u9P3
	 uC3aWs82IzxJUQ9bUOFe9qGBKchP8voiMZcv88jRsXCoYFtFN3mDJk2F+170HnxZborp1
	 M7ac6RmdQT8vKWCS//aDKNtHcsL6yU8T7ApIX6c9N4XiYCTC3PPlRB7CIYh9HSQChvPSY
	 EaqulJvxB0fIRfVKXEp/Piybr8LdR1qlEt6y/YsrJULyaCE69qkWHY0wbdM1pclb9SPo3
	 8ayU0tPBDiVw7AwY+3A9MUJ2L/WJA4MHx5+463im/x5eEhI7RLuwsJMP7kspCpAVMWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=StcAVyWr;
	arc=none smtp.remote-ip=95.215.58.40
Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8AD606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8AD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=StcAVyWr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ym7fuUE5bda8YR8vTMQIuvc+NuQU+bNetmk10VNyjek=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792506652; v=1; x=1793111452;
 b=StcAVyWru1Cm518qBqaf4AJSxcrV6acWxLmqVoK1hMOaghLpnYpAU9V+uIYaiQybvxmLF1HC
 nZAFboqwHxfnibSD33GyD4kZwNOHD0X5m/MyOGBBHArWyhvD1dziooULOIoDgqRoNxeJFtk8HsM
 VD3NyKijJOd6Hzgw4kAWVGy4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7487264007fe2945;
	Tue, 20 Oct 2026 14:30:38 +0000
X-Mizu-Trace-ID: 7487264007fe2945
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [RFC net] net: force software segmentation of PPPoE packets
Date: Tue, 20 Oct 2026 22:30:30 +0800
Message-Id: <20261020143031.1829-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.34.1
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

Ordinary TSO does not update the PPPoE payload length. A PPPoE GRO packet
forwarded by a bridge can retain hardware GSO features and reach the
driver without software segmentation, if the egress Ethernet interface
advertises TSO.

To force software segmentation, clear the GSO feature mask for
ETH_P_PPP_SES in harmonize_features().

Fixes: 55a5d8fca836 ("net: pppoe: implement GRO/GSO support")
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 net/core/dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index a6951ea08961..27483a2ad747 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3831,6 +3831,10 @@ static netdev_features_t harmonize_features(struct sk_buff *skb,
 	type = skb_network_protocol(skb, NULL);
 	features = net_mpls_features(skb, features, type);
 
+	/* Ordinary TSO does not update the PPPoE payload length. */
+	if (IS_ENABLED(CONFIG_PPPOE) && type == htons(ETH_P_PPP_SES))
+		features &= ~NETIF_F_GSO_MASK;
+
 	if (skb->ip_summed != CHECKSUM_NONE &&
 	    !can_checksum_protocol(features, type)) {
 		features &= ~(NETIF_F_CSUM_MASK | NETIF_F_GSO_MASK);
-- 
2.34.1

