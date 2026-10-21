Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550180;
	b=wplFhn+7PpvyhFwDp6eFwZhLqApzbTVTJ4IeDa5SL9SFZJUUHugLPr/mWE6Rbfbpm5DQ
	 0qkxZy5u9nfmvJH/5VdQYkJtV+vCUeAMjxRvHhfNMgT0/SWqTOF2+rQ5JrOwYgLJVVu3z
	 gEe/zG1oMT+jRV4evjeFFuFDcf1NeDxJ3xJEPOWx4L2jnG/I2LozS48UYHtOpkXXbX4RD
	 aQ6akLWGVjUC7zx2umxhkPwSgHwxlL/NFyB6lWqbd3kujY+xAdLHTdLtv8Yku0FopMztd
	 0WzoK55y4H8sV+oXhevmAnexxLQdcEWEIIcql15iMFOC9Sm2SqLDai3tcdJEjiVD2Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550180;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GR124ABTP8hVFzVqn+1Ol538eubHOFABWIZhnPlfz1s=;
	b=qELn0GnMzIGaT+87wtysA5Zht/Wdw+FW5/1yFS4zeziDftVuZjQj8jXmYcODwg8Sq1iH
	 0gAQJrKB8opTJV6BJQkqukk41KlQzaW5mzBPANWoX4XpYIi8FBlVjVl8zljwC14ZP3eDJ
	 r9ezXum1lO9cvdyf9myIkmxJ4lGSNqXlSuek2BmjXbTIfAXNbY+btaRBCnkZdgIeLzSZz
	 o19dq63iPZrzsZ8N/tXPoQQZvbKJR86JbUYaNMVS17e97uls/Rx9SVjJufcsQD0jd28Ru
	 LOd8TgdOl2G/6jSEz+HMo51ExbUwT9qkshtdAZC0BzYValxNVGsIU5TNYuL8RsyzucQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K5HXAtfv;
	arc=none smtp.remote-ip=95.215.58.79
Received: from mta1.migadu.com (out-79.mta1.migadu.com [95.215.58.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8AE606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K5HXAtfv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sSx8B/MoT7F+YR3WxVCNi4OfBeJXfUbzIEWDqSFIibo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792550176; v=1; x=1793154976;
 b=K5HXAtfvFriKmutRRMVtanU08/Z/OMNmgxf+kb1ufISeHSY8qPLy6q+8FKvsMFUJrPD4IYJw
 F+jBEeMiDNjq2BbQ5oZixahqS/Kkf5KKpJAK4JDTPWGUU0XSTsOaOy8RO7k05tlDVByWKrxVkB+
 bXwWqnP/wJKQ+hnV7bqxlWsA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 65086cd44d755d15;
	Wed, 21 Oct 2026 02:36:16 +0000
X-Mizu-Trace-ID: 65086cd44d755d15
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	Kees Cook <kees@kernel.org>,
	Taegu Ha <hataegu0826@gmail.com>,
	Tom Parkin <tparkin@katalix.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: James Chapman <jchapman@katalix.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net] ppp: linearize bridged packets when required
Date: Wed, 21 Oct 2026 10:36:06 +0800
Message-ID: <20261021023608.55867-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
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

PPP channel bridging is commonly used for PPPoE relaying or forwarding
from PPPoE to PPPoL2TP. Both destination channel types handle non-linear
packets, but other channels, such as PPP Async, require linear packets.

Ethernet drivers can pass non-linear packets to PPPoE. If one is bridged
to PPP Async, ppp_async_encode() accesses the entire packet through
skb->data, assuming that it is linear. This can read beyond the linear
buffer and transmit unrelated memory over the serial interface.

The normal PPP transmit path in ppp_push() linearizes packets before
passing them to channels without direct_xmit. Apply the same rule in
ppp_channel_bridge_input(), and drop the packet if linearization fails.

Fixes: 4cf476ced45d ("ppp: add PPPIOCBRIDGECHAN and PPPIOCUNBRIDGECHAN ioctls")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260908072135.877364-1-qingfang.deng@linux.dev
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/net/ppp/ppp_generic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 1a610a18893b..a84618e24d61 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2299,6 +2299,11 @@ static bool ppp_channel_bridge_input(struct channel *pch, struct sk_buff *skb)
 		goto outl;
 	}
 
+	if (!pchb->chan->direct_xmit && skb_linearize(skb)) {
+		kfree_skb(skb);
+		goto outl;
+	}
+
 	skb_scrub_packet(skb, !net_eq(pch->chan_net, pchb->chan_net));
 	if (!pchb->chan->ops->start_xmit(pchb->chan, skb))
 		kfree_skb(skb);
-- 
2.43.0

