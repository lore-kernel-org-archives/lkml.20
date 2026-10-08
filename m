Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955325524C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 00:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791419783; cv=none; b=cqG2EceA6uIr1EtPFqB7IMX5fa8pe8AU4KbRZJs6PWGJeM4MAtZkV/6fSJ8LPByuG6Ka4r1lqPgF0QBt0XGx7/7aWYqb/EVmJtgyLvuRGwbBeeutZWA/aGiByiuKguNquoYgbPzLDL2p82gGRrgroPT3FRT7WNcBkLMVMvLnMio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791419783; c=relaxed/simple;
	bh=wzs1F01/ow7OULZpLgFM/8mSLAaxGtAlahSetko60uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pimVWmV0ZP/r3iqmEhpI95WMEyHvABepkHTkZNphjXvCqi9DQRhMlvPLx09uyrgRXZtTAhjg9ANnbpx7ByyXzVCDDULfQMnuJEhkdhBRtSNFxjFNnF2Qw7y39BS8mjsdyvbrR3Q6MjyWRJdjrTNuy6TaV91sClExw4v+XSEZiMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=onJUJpbG; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="onJUJpbG"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3517d4e49ceso47714eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 17:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791419774; x=1792024574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUlJazWzaxUjjRKpYw+lQ6eU3z1EAi0CxgyA80J73rM=;
        b=onJUJpbG3veUk/8p0+9q0NHp2qPFBjXZQiu1L8Utf4YcVevcrgd1Hq0EmiQtjKbrpS
         2vc75hQxouOOKNZSGUIM9p1MnWsurjNQ7Cdx+5O3toEHS18GMRze4wkkqcawHbmxTokN
         CGqxyezLhU5nJMMflivSsToDhS1dpkaT4SDo3apTTMr7OGgWVAAmKDeR0GpAtswLRXYe
         NSt8KlJVDUHBMJrec2y8xWRc1zvu6F25YVnnGuzZT8LiBmyF//R3UBEJKDt/tqQZi9g9
         pZ9BmCW8YsDn0wWx1I5+AxibjX54hgy0LpIMqNvRnFzVcS/GmFLTzU69R7E7ZgFN+tDT
         5HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791419774; x=1792024574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUlJazWzaxUjjRKpYw+lQ6eU3z1EAi0CxgyA80J73rM=;
        b=I6b3PTpsU1DXkkHd060Z8RKOEBbUfZRF9omTV82idlImnHwDNjUy5z0XyyFNUioeKT
         YsR2Wm3dtdAtrY9AgdtrF/sdEAx07LA4U/hL9yIOE4N9dazIatgGx6QzFgQkbArjeo/k
         r7WQIJqPyN8+YYCCpGPi+rAJv85qKsQHvGaCqDi3lTREZXUTyC1iEo9UHJyxn7p4G77A
         qNvIvMQ72E0kj9XGQRiSVXZFQqTlniwF/Fi5X/+p5yW19/OvLfX3/mlc68ZgBzyoMUv3
         l5dxZf01sj4gnttv7uOFR8Dhj9zftdFZ8iVbTdDrZS4w2sURFTBDbdKbrXR/NHvwf3Sm
         d02A==
X-Forwarded-Encrypted: i=1; AKwUvByerxHg5n7ZWsFl73sVXTt/Di0WRheQjD5LFGQNWc31WuxoG9V9Uuhi7HOnYRhBpD/vYTCrQ2Kkh1hE9Cc=@vger.kernel.org
X-Gm-Message-State: AFuF++mvHvFc5BmzegpMWYdBfGWRyklhtZa2kcb87yZgWdj1uidfsbwL
	ydOfyexFYEhtNqxy/+CV1crj3jp4PnaU/XN5LalinvM9vfh+vyCTk0S7HycO12z4T/0=
X-Gm-Gg: AYBFou1sCG6+LEIfwW6qN+emwoe8lx3xjb3yVi/Lr9NJyZlnXhOw1hpdK0SELX/ISFV
	0NWxSkE6idRt27wblGr85ORnJ9mYb7DleDpALNkCev/Q59tUh1+esUw/Tni15MjHVjSc04oDtfX
	Yw+KcpLQKB3LomBQnLgLvcQ/ZQykWqecsJ8WPbtinbTS7a0tBxG+ZBsDbi71UJmn+dGOFraMWyX
	E4IIRZGhbSo4t1ci+Qp3CXrT7P0mVnTYeSc9F3p/bQr+aej4Kqm28T4/QdHMwBKTfLDIf22XJCr
	cOBu/cAykpxnCRtLR8iFgt2uDhkUUx25FSuvcf2V9oEqDg6p42qvgZFbSN23qCUGJGGWvmtMRPM
	k7171VnH94JpYuK8AJptFxLQX09g3arkirXbnkEjzLQGswgI+XNQQ3thY4SyDHvizYkl8Ja/L7C
	Q89NEoMJlCm9G6O4mvBnaj+f3VmkykHfLEES/slK1hZ8mco8Es3NdIysRZxXk8LvFGsRiKjLGd+
	gk3CLVYNz1tVH5mkq98oVb+Rn+foldIQLY3yipS
X-Received: by 2002:a05:7300:601e:b0:351:2200:1cde with SMTP id 5a478bee46e88-35177712b66mr954708eec.8.1791419773980;
        Wed, 07 Oct 2026 17:36:13 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351735e316fsm3496694eec.11.2026.10.07.17.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 17:36:13 -0700 (PDT)
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
Subject: [PATCH net 3/4] amt: make pre-query report drops visible
Date: Thu,  8 Oct 2026 00:36:04 +0000
Message-ID: <20261008003606.3666617-4-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008003606.3666617-1-omar@blockcast.net>
References: <20261008003606.3666617-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A gateway cannot forward an IGMP or MLD report until it has received the
relay's Membership Query for that family. The query supplies the nonce and
interval echoed by the Membership Update, so dropping an early report is
required, but doing so silently leaves operators with a dark multicast path
and no indication why the join never happened.

Emit a family-specific debug message before taking the existing drop path.
That path already increments tx_dropped, so each discarded report is
accounted exactly once.

Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 17dceeaa1..79f2f59bf 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1251,9 +1251,17 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
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
+			netdev_dbg(dev, "drop %s report: no Membership Query for this family yet\n",
+				   v6 ? "MLD" : "IGMP");
 			goto free;
+		}
 		if (amt_send_membership_update(amt, skb,  v6))
 			goto free;
 		goto unlock;
-- 
2.43.0

