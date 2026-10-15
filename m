Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EE64078F6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102020; cv=none; b=LlrJJoG7wRuZND0b3GOPY0LkykIEGj+LUiMk7nx1fqat4vt0jq/hBjO+7kqYq0fwbqdLG7E0fSAjWn33KK3YwrguO7UTialANGyYas0rS0XXEealDpqTu+GoGH+4x3PUob+F8HI5NQZmzaRlYGYxUJDxaljg90Y0bHWS8yO8pP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102020; c=relaxed/simple;
	bh=Azw93W5LouKOQF8JpXhIcNf5+UvjaFLj3tuNLsH4WZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmquFjgw9svJNXSs+OG4votp6PZ7r+GD8fTwlsWCS1RUXIuOmgfMUZUsmS95mNE5WZkvtk3DpKBkU1lVr0Wu5PuZuvnutdymAtF5rw0m0Hp9b8eH8et05SqCbZstW/UGXnxw5eEW/x8x5JdaefZCy3KcMVOh9j+YSpQo2D9ABE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=U6+PQSMK; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="U6+PQSMK"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35ef6b49813so2888889eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1792102018; x=1792706818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIFTXiEgfyipQXWXKZGZ+c1QJxdn42XQfQ0D2G8qiXQ=;
        b=U6+PQSMKki8LoS6lT+CcUwp2qIiXKmD0bFsBDTdqVP7g2pdme1Lrl3vuDgvTp3T0Sy
         vAv/+zmQGpmt/091/FxR3RtXomeUVNeCUQfy+IC3tagYLZajJbyJaA5emepKk2OOfa+t
         KfYYwq08oHBvaolSmH++YeRZZKJ4MGmcEm/t0G0zBEadyAoq11YSbCzXXcyTpl4QmKTB
         DUJofMEfqIJDLG9DsAAoqh3g/UooWojmcsxr+Hm9RF8jr4hwH0kdRtjt3TIqLehv2DZ8
         Bx+XUEhr7An63/zXdsa3FabGi824CnT30bhaSANldENcDgyPm4vYQ4CZ1MnZB5pKDsRE
         cBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102018; x=1792706818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIFTXiEgfyipQXWXKZGZ+c1QJxdn42XQfQ0D2G8qiXQ=;
        b=ZhjbUzydd+LSMhQi5bHjUS6LxXGvT8dLO6QbmyXXKd91ooVtQXDeTZZC+T9LfppfsX
         ReUyUSbopHtv+haTm5GP0Y+TXcbNiwe8nEhYk4LzxpQK3GEHmWIvOnJYFxwjNN7nwmoF
         FypEr0poAOmjV1gfN6TKoMtPK9qHUakFf4vuLs6ZfzOPpXmkfzmjKFeUyjulvelOG78J
         7RY0+cmODNI8go+D0Ie20Vm01p7MSG+mkP9eyj90Mt+3OBZL3+4AXHQcqDo1gSoUg058
         nx+Cc5FYVQ81JSLpK1ZbZQz9/pmmalrtdFBsE7Cswt4MJtovPWsejDnZz+y0H3ZTuDzd
         IBfQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+DaJH7zd4VwFvT0wL+InpRYM410/cLBDlXuF116MA99nJXypiroZ3/ZMh+poMyKObfPayLEu8OsoSOAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLk7zBgR7jAHlAmsxpDMRG6GSleGIH6GnJD08izGIL+Kqb1Lzd
	tJVd58UWTnx5z2lDzL01jCCTTQRK0WbkbKgz321Y+W2jWGhUc0nuNX8JLicURcRDk5w=
X-Gm-Gg: AYBFou0Ww+/hMaH/LR6Dps2q2kFYke7lVjI5kInafc1V7BSAu69U3YrNmX2mqb2WSrf
	QhHEkZS8Ezz7CFUO/P5/rkON0zst9XaM35kSKQSbX/lLiT+YREQuSHty3Ine6Hh9vDO5606UOP4
	zj0spQZCsb27TkXJs15Mc1n7Ocadr9kpL4Q7E7kmvNy4OFyj7eobSUuwzkbOf7pSxzMSCfWzgXB
	QGpHOjHu74fFcHAbvDlFATS4FONM4ydxXe3jpWK6L4s8SVKfgiVo3rz+lSsXqG7PzRan+IxwfJT
	jsc+AobubdoWd/MlEsgFYV4FjHlcOzhh9aIRBg/tjDP3VruLhbhDuxMht0XzZM65NcB6Q/BBNDs
	QM1QFFFnFvlAY69Xjr270PwQ59I3MUHZ+6tsrcH54vQ1m9gv7o29CxVvM6ntmpi0wujCvZ5nYtg
	ytO4FsEeA+mHamwGJLMhN3ErOHy/r+HtV/NPVjEdoW2oBLdANxQR8mSVRKtlIfF+ldY8HUgZaSs
	HYjlBS9VufQkSwcSl4dQUHbh3O8jGKRXUqTSbeI
X-Received: by 2002:a05:693c:415b:20b0:360:51af:3146 with SMTP id 5a478bee46e88-36051af330amr1189211eec.14.1792102017512;
        Thu, 15 Oct 2026 15:06:57 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm1016445eec.3.2026.10.15.15.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 15:06:56 -0700 (PDT)
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
Date: Thu, 15 Oct 2026 22:06:45 +0000
Message-ID: <20261015220648.1545576-3-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015220648.1545576-1-omar@blockcast.net>
References: <20261015220648.1545576-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A gateway's amt_rcv() admits a Membership Query or Multicast Data message
when "saddr != remote_ip" is false.  remote_ip is 0 before discovery has
learned a relay (and is reset to 0 by amt_dev_open() and when discovery
gives up), so a packet whose source is 0.0.0.0 -- for example a
0.0.0.0 -> 255.255.255.255 broadcast delivered to the socket -- satisfies
0 != 0 and is accepted.  With the nonce freshly reset to 0, a spoofed
Query is then taken as genuine: it sets ready4/qi and the response MAC and
suppresses rediscovery until the discovery timeout, and a spoofed Data
message is injected the same way.

Reject both when no relay is learned: a 0 remote_ip must match nothing, so
guard the check with !remote_ip.  Discovery is unaffected -- Relay
Advertisements are validated against discovery_ip, not remote_ip.

Fixes: b9022b53adad ("amt: add control plane of amt interface")
Assisted-by: LLM

Signed-off-by: Omar Ramadan <omar@blockcast.net>
diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index b06916c..2e0d3aa 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2413,6 +2413,10 @@ static bool amt_membership_query_handler(struct amt_dev *amt,
 	if (amtmq->reserved || amtmq->version)
 		return true;
 
+	/* A deferred query may outlive a relay address change. */
+	if (ip_hdr(skb)->saddr != READ_ONCE(amt->remote_ip))
+		return true;
+
 	if (amtmq->nonce != amt->nonce)
 		return true;
 
@@ -2882,7 +2886,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			}
 			goto out;
 		case AMT_MSG_MULTICAST_DATA:
-			if (saddr != remote_ip) {
+			if (!remote_ip || saddr != remote_ip) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
@@ -2893,7 +2897,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
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

