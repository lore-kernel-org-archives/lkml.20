Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883017;
	b=st2wWd666CUNkgh/tIHhy3AznBBMNhnahQOGPOthgLgISZ3LOmNWHjwVbpQ3QhPcGwh7
	 lG10nDY6kqDnfPfd6WOUGtqX9WeIA+eDti/V0/5dsPB5nSk9wyWE3wQ9ayyRn7VrwGfwj
	 p95GIQ2ZkGFE4p9DrPru6CWekugSCm9K4WwrROInLBLOu0/bCVkcds7ijAFOncGctcw66
	 sPSGCjcR9NhzwLXJzB8k32a4YaK6ZOv8WgNHPIzD8X8oPl1mXanYo5Efk5CP8+AKPLyiz
	 uykYllgeOhBKIqKn9nLLxNPOHQIwpkh/8j2GcKDLfCI9J0OF5t57kfMLXaiu1IC/CdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uYX+jNZaRfs+bvHwVK4BRtfPAH5zcuBsc3jlvTfSl60=;
	b=rVn8HgTr/iEPR4CylMuFqyXOVRJdmcePgz51sMB2vJPQO9nh3fN1VfE2w+rs5tJPLsFT
	 BISErI2O7HgRRNqozrN+n0B/W3/ZzwuyWrEZa0wE413KipJNj9aYnQP8JCK9VGD9zN806
	 5tUXUWVmf67PlB7Aypo3KEycCQebrdtg4ytD451B6pNeXKpZtrjqgqtBQhF+lE+3ZOkqc
	 v5wo0lMzQno1+Ap4dsS0q/XJtPxnGlyRC/EEywk7VjRG0YiScaacyoQ2tQhMz80yW/oLR
	 vo8oJfGMcAhlJln2IppJ2Vh6D4XZMPoQbMFNbmxPIN/cvj0Osu2ECGGrYn9gAL4U8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=VnXjkUf5;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB6D606D811
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB6D606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=VnXjkUf5
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2673185eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1793883016; x=1794487816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYX+jNZaRfs+bvHwVK4BRtfPAH5zcuBsc3jlvTfSl60=;
        b=VnXjkUf577443xL2H0n/W9uqMxf5yWTTSk/N6wnyJk4NzVZ70b9uQapiwxZsRAx7WX
         zvki1RJKn9daM79FZRvy6FOrVLDgnmkeX5WqDL9+w9gjMFzYWxWwdQyfqM6CiD6PDrd7
         m3yu/C9Z6H6aatfwEinMA6YzhbReq8ZxWYA4hwStnZxllYZdmW+8o9OnLD5Fmf4O+M1y
         g/z2rDglpd0qbsMHNi7keNHpC/6cXAxxbLhmJ6TCTP+6Pbno3IZ3npEq7kXk5e5+aXmZ
         YJ1gcPjOmYAeNpFKLv5RN0XacDHq+Y73SbD2xnYH3jDFEj9AghnEuJoBckZ1oZDOjzpk
         MRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883016; x=1794487816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYX+jNZaRfs+bvHwVK4BRtfPAH5zcuBsc3jlvTfSl60=;
        b=V0UYKCsHUpIG5TDfIbuPQIO9v2CpPAdj9Tw6f0qerLvqrixWEVx6bcgnNbD4IY2q5l
         HJzhmaCy6yJ83CO+Kdht9k2UWUlxGelzZ0sMR9cR+Ice6/bepLXIVS7xXMw0Kq/W4EMF
         Fsk0iw53xnAP0v5CptHIyXGt2EABZpYwd95/dbvTF0QpKsjHkUgUvoHKZWXQSa8UXTjW
         g0Th53sYcZanHePdOSZa7GG0l+mhNvEI+1rnnlSOfrKds0FS+38b0lx5oINLclG06uH0
         2DCcRPmIc5kpHnALyXdlugkkVzPZ2FV9g1udqY4VPCjEOcR5Efn9kiaLyMdmaj7qR75n
         HUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdEtGj7QHOxFX2EzFDOdn0hGYrs1kT2ZeTjC9QVENAiZQBJgLcSs5zXsdiGBrOeutEct8k/k6NiS1cvnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qzj+dY3ERLWNv0pDpkSda4SL9xfvszBbtZurupu34eFvtoKE7
	li72oFQP2qe7uzVtzAXD1+eGK6TMrfwXgYzLlQwSOczA32L0akrd7Pih+6mi6YqcoWI=
X-Gm-Gg: AYBFou3ttdRfNF+oTEqblELVWJOdvqpqxse4PxNGBgdnwkPZjUkoKPrY6kyOMGBObkR
	ABU+Kzw5t/sers0h0BwMC46gsvp0g/fqHMQpUFgtDnTeXPLnKiXus9GmqaAD9EY8UKy5UFbVYB9
	zvKf1dgZ9zsP3wzw3wWyGBdYzsC3ldm5j6JExvhFGzIbGWy1c1bm+RW3Q8qeKz72/W08snAaC0g
	hqUAaAWgYb4Uu899D5jzA61cqbLLjxNKxoxzC5JOenf/bDQeK3wM8Iz8YbqrHe/8xIrWVMBSO+/
	+qNH77iwp2VGNsCNwmuZEgK3Z9i1Fd8iqeU5AS5VAQHiQvTSCOE0uwiwp9SC2eewTQyeG3FmwTL
	RgMw5mZXXpqW6Vc/SBaCW9mA9ljG09Ms4hURDkc/keabio51XLZKaNbaaqVy9Oyy2Bl5ZtkecX9
	a42plQzyHCVvmtqNu/gYnKlVHqjk94L3t3EKxY2qgAkxJUc/Hqwh83qOhn4odEFP1CgW3A99V54
	E7geg2Unph2juIXfbs5TN/bezxm8LqjEu9NF5RWc8EnveGkXxVVIJZz93O7OsslM3+lG4VQcVB4
	8X+1Hr61lhJ+sUvHl0mZ0uNHZQ03cyUVXeuuq0clVwG5dimQYfRssm2daVzWT8RQyvLF350=
X-Received: by 2002:a05:7300:3b0c:b0:36a:238:1485 with SMTP id 5a478bee46e88-36a4244276cmr39609834eec.37.1793883016164;
        Thu, 05 Nov 2026 04:50:16 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm22527257eec.27.2026.11.05.04.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:50:15 -0800 (PST)
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
Subject: [PATCH net v5 2/5] amt: reject a gateway Query or Data from 0.0.0.0 before a relay is learned
Date: Thu,  5 Nov 2026 12:50:07 +0000
Message-ID: <20261105125010.1107546-3-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105125010.1107546-1-omar@blockcast.net>
References: <20261105125010.1107546-1-omar@blockcast.net>
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

Found by code inspection while writing the IPv6 receive path for the
AMT IPv6 outer transport; not triggered at runtime.

Fixes: b9022b53adad ("amt: add control plane of amt interface")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index d8914d811..dacfd5524 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2482,6 +2482,10 @@ static bool amt_membership_query_handler(struct amt_dev *amt,
 	if (amtmq->reserved || amtmq->version)
 		return true;
 
+	/* A deferred query may outlive a relay address change. */
+	if (ip_hdr(skb)->saddr != READ_ONCE(amt->remote_ip))
+		return true;
+
 	if (amtmq->nonce != amt->nonce)
 		return true;
 
@@ -2958,7 +2962,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			}
 			goto out;
 		case AMT_MSG_MULTICAST_DATA:
-			if (saddr != remote_ip) {
+			if (!remote_ip || saddr != remote_ip) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
@@ -2969,7 +2973,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			else
 				goto out;
 		case AMT_MSG_MEMBERSHIP_QUERY:
-			if (saddr != remote_ip) {
+			if (!remote_ip || saddr != remote_ip) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
-- 
2.47.3

