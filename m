Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D4C4F6491
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791576904; cv=none; b=G8ZiQIa3rkDdh7Zfzo7DnSUh29A4H/ZaDYYLafhqtf0ScLvJvGDTV1imOZwqT/X7dL/wjmBXsSPd46izsTLGB4OHovGGMHLo0L9apSDa8TXAyx6kVleJD7eJxCy3C2nC7joZFGWHFx1qB+Jj6AQDSKLnCN7GjbQLMR+aFvBmY1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791576904; c=relaxed/simple;
	bh=kNBf+ftP2Tqguds+Mgj0EosLQnLqkOf8LbI3dUWJaUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yq8R7mO540aLSt8yC0rK4+R1ajxBRtiTOSVAsIFchUpMdjTY1lq55G3guR760tkTTklfHAHGj4Z/rwUQP3mef+QKL8Sa4kIHsqmw/JJGzuuJAiHZe1xNmKRw5qcL9ClkLcQGK9cQpd5PT3jwpAjxZZxhAN9nO7+4YFEkOD0aYHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=rIDPfw3J; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="rIDPfw3J"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so180554eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791576902; x=1792181702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T66HUfdZ8C06QFjZdP+bRAcI+QSu4rBnjpUxu2GeV9U=;
        b=rIDPfw3J4AqoaErlK+QzDX9Ke61r6vfXdjIcEnByXjAlZmePKPMYj9yZikzCgy3xvU
         Y7AuNXcGzSm/U3OP1AeXPjRFqlzSKJYErXlYi9Ea74+gw9mkgwrbGuQnvOsZ8Uf9dmkd
         eeYhcCW1cd5MZzMC2nNMPia5cs0XCbvRB0QHRw1NvBTR0wq/VDT2us3ZURsq5K2NSJaI
         sKEiC/90KGgyXIOuaMfS701dEBGF8IY7UAWKE7OCZDSBUEI8Z/+mmwLyxAJ9snqJBwum
         M+7aczzBESffeneQHziwe2wkPSuHRFqkv59spbD+uh+oANDinj1UAX7REyWk03Vo/coQ
         XU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576902; x=1792181702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T66HUfdZ8C06QFjZdP+bRAcI+QSu4rBnjpUxu2GeV9U=;
        b=rQ6GlXylzdvfNi/bESVqfOuZEoyXwT1l8dNnecs6Im/duWcJgjmqTaqmocWSrN+L3i
         iaj0YxMvke+b8/2d6PKFshJ9w3y8UsFBDaRzE6yImmIxf6jxzMcGruzCSyCdnOPIs5am
         iJWATsu2AbBaYYvtyeQiGzdc5nXkXZU57cQVqpxkXEMvmG5oF71Wea5eF5n/DNi1gLTB
         6k8QrP5S2YJNvg4L1Dm9Jao+7j69iBh10LdpiWkdFBSAvXlxneiAVUw4B3IaWOXzozfo
         IB92Q855+z9dlGOJebAXUxTwX+V6d+dO4cK3eO1J1L2A8loTgl4ngNBRLC3w770c5QlQ
         AG9g==
X-Forwarded-Encrypted: i=1; AKwUvBzk/g65aynI6VV1b2a/Fq496ctiEHu/Li4KOD1FKbaTdevfSTp7DYm9Y4O3ceyq7dIlN08FdA3Dg5dOV6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrhDDtbcpzVoZtZEQIejTzfQwtrZw2t2u2GmOgFBkaPM2fFPPV
	NHyFOlw8FC3q53AXMSbaXTfiRt6GKi/6qunRwbyaoLW8AquJ+mt33+k669wiWnZ+PYY=
X-Gm-Gg: AYBFou12FNO6YwP76gBWwXfhmR4KaT99Ez60U69gHxA5kUUIgDK/WX+Ya1bdXP8fIXT
	6Qm48jgykN9YpVCXKWOxyj69vLwFmEX2sATp2qJn72FRAeBkqPg2ZcdmRz0glv8VOZkfWBk8uZn
	9qDD+kuitFNvHZc+6Q7Np8GWaO2gLDNgu/VnK0A+BS4Q8maYUGYLqkis2HbizNs1Xz/biZuLQRs
	C40w/ReV7Ju9bUx0kcrOXbqjJdmqXB+fwKOLBbZsRVebf+6RArzVbKH+ASsWk3HFy2yEJ/mFGzj
	7KmIfdk2TFz+LVulsJNsc/Nd1znlq3A+csPaT+DfILtld8sVVV3rFbLsi3S/5aV0Wh3j+FbunLZ
	nEDBD3zBLord1oXby7LdX/pnVhTMf2BezPhwJgso/DrS0nGVgetg+nvpguJhTXcox0DQCzGxaU5
	ZJzosrz8+mkraKWZxsfalA/S1GKcGd7Fyv8lGgcFpOvhkwloxChxK19DPGAkK3ggWlRVgPRkwf9
	Ckwgy2dyQzFPVXATvMTQWJtR6Dfuzmon2AeqBgXaYULa8kTAqM=
X-Received: by 2002:a05:693c:41cb:10b0:351:679e:ba2a with SMTP id 5a478bee46e88-3537e0065cemr4039475eec.23.1791576901810;
        Fri, 09 Oct 2026 13:15:01 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca329d9sm8994643eec.5.2026.10.09.13.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:15:00 -0700 (PDT)
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
Subject: [PATCH net v2 2/3] amt: make pre-query report drops visible
Date: Fri,  9 Oct 2026 20:14:53 +0000
Message-ID: <20261009201455.1904698-3-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009201455.1904698-1-omar@blockcast.net>
References: <20261009201455.1904698-1-omar@blockcast.net>
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
index ed82f8fac3f..492d450fdb5 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1249,9 +1249,17 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
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
2.47.3

