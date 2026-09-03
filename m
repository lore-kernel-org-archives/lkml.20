Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35174A49BB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439022; cv=none; b=KVHURuFQaDebDaqz2KPVSbQSbtv11cXSZwcdCV38zyt47aKw2erOH6cK5/sG8im7ax1+rAoSwB86h5iAuL4tzNq/6sc6puX9J4HYoYrirojwFhJsIH6x9OyUN5KtEmItZgbF7WEXZ6llcY1j8tqazYy6jUNzpzwCiIoeetk5c10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439022; c=relaxed/simple;
	bh=JXRMCSTOVYqruevZDGOrAq0z24REEtuZW0GIiSGyGg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+LZa5TRH6x5WZrEWCDLgwx+RYgMEMoVddaF1c0kpvRrpEtCFk8EM/NemJ0MalRDZzWZ0FX1R4d+V8sRDJXLbzWZPVPqTlCtPuxR3INhbCYGQdrhp/rNQSUrC01QLuJ78gAlouNijK1rcBxoKYhdhKl7O0w6IHlH2eiJGoAWUEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=YTgFr+1d; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="YTgFr+1d"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482f9309813so2190105f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788439017; x=1789043817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=693kjaVs+p5BNOB1UBpXt643TYLBrm9lh0vgjjyHqkI=;
        b=YTgFr+1dgMKzRPQ/k6fkLNFTZUhG5N96++VhTPEwooh7nHxOxHH+qzbdWvf2rjsqyd
         V2sX60YTCDpdwkEQvqyTVCqEtiZsoLryOtTzsp/4GYmNRHnGWW6zgiiQeJVpOoiFuYcc
         0YLX9ATdf/0OMHlTNaDNq9F1JU8f45Ib/+W5htQec/pHc+GPMXVpZ1PcFWdgnOsNII8w
         EQaUsEZSRUKJvzGGTyilcVX7Ne00qM35WA/liBDoyppoyWE2pE88aLVjAEpPA09ExiAQ
         8Ng0Qna7I3Q4JnVEUJPMX0cowcPxTwpdYwWf+AS3ZaQSxi7jWfLTTm9acVyPaVVe3Z+Z
         kEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439017; x=1789043817;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=693kjaVs+p5BNOB1UBpXt643TYLBrm9lh0vgjjyHqkI=;
        b=KXeR5fqDuTY5WcEyZkzkOyJuLqMcFW1IFG5IgQsv2DYsdfDBL9cyhdaRJQIcawSaPj
         EkPJaI5HX/ImPLUj9hIXxJ4tQmKN+wldL0eaE9NnnXjbW+7gZihCf2MUa5NgJs/RPVUD
         XC/FJZtGddtrWmSuMDKGPn+u+LH622doQRNHZp2HpnJ/sQvXuXXUMLZi9v40hDCIHnxO
         uvAKLMildhXSyAactDi5K1S3sBUr1lL8UsmbLk9S201YmQLs+AAJ02Vb8cujAsXrlPNp
         8Jbh2ZrhXoSRT32DyVqMH8zRfhIkeD/1qblCSqUMCEcrqQwQvLIwSRFxGoEj+6fLdIv4
         eRMg==
X-Forwarded-Encrypted: i=1; AKwUvBwEzTQhbCfCbOOXPWaGr4H8J8GY++N19K287ID6Goq3X4nTaThoXLuCBSdPIKN7XHacPaE84mmWvyTmjTw=@vger.kernel.org
X-Gm-Message-State: AFuF++kjkUyoQZO41bKCrH7zZ8dpllFNGmxxZcQjbZWWirfi2upR+7pj
	qrCfaTKnTUHeo8TXoW46VD/ReGTg14qInwGiux8m4JfR1kdPLd8qRMBIKMbKBxatGdw=
X-Gm-Gg: AYBFou12hWRxjFN+rfpHHXMrGe4/QufjU4dbiNYDCOcVzqFQVV/N0q77jlJbKS4IrXH
	QCz6mYQiFMlDchS/PRJfw1T3MFLAZO8fPFppT/AftKueQa+vaTvWxRe5z3A1t7cJ8Re8/Thqg5c
	tCWa97HPST2+CYtmDnEQ0/nOOoaedQ6IINNGOJ/bcLsPgEckGjDCLFv6IZrYjWlNz36lFbdPyhT
	/zd1LLZi5mxtE0NJY/E5sSqrCP3cV+tSIkd8mYzD/DcvdP8bcMs2NI/S9mf+mnMLNXeOHEYLTfZ
	EFOjnmDDG522cH4lIhtCk7Bz7vJilk3LKvgoywsG1AydhRWEXY6wEYcEH8+wb4cE6FyVl29LjjG
	It6IyREY3BWZXbfLTRtRThAjITbYwXq92JaNbeSNWV/xRTFq0JGxpgnbd7K2YEeafZrdNMxNbK1
	CIbAiDEqdfAq/VlCx/5OrQA63HdGTHHyyL8r7brzQ=
X-Received: by 2002:a05:6000:40cb:b0:482:e1b0:8a1a with SMTP id ffacd0b85a97d-484913b80e8mr19057331f8f.15.1788439016781;
        Thu, 03 Sep 2026 05:36:56 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2edfsm13223248f8f.23.2026.09.03.05.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:36:56 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Th\u00e9o Lebrun" <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/2] net: macb: reject an unknown link speed in the taprio setup
Date: Thu,  3 Sep 2026 12:36:52 +0000
Message-ID: <20260903123652.23900-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903123652.23900-1-f@lex.la>
References: <20260903123652.23900-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

speed is a u32, so SPEED_UNKNOWN arrives as 0xffffffff and passes the
"speed <= 0" check, which only ever catches zero. That is what an
autonegotiating link reports while it is down: the limit derived from
the speed collapses to a nanosecond at most and the first entry fails
with a misleading "exceeds hardware limit". Zero stays covered, it is
what an interface that was never opened reports, and
enst_max_hw_interval() divides by it. Say which case it was in the
error.

Fixes: 89934dbf169e ("net: macb: Add TAPRIO traffic scheduling support")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
ethtool_validate_speed() accepts SPEED_UNKNOWN (and zero), so it cannot
replace this check.

v2: error text and message per Théo Lebrun.

 drivers/net/ethernet/cadence/macb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 61838084989a..202bc688978c 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4324,8 +4324,8 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 	}
 
 	speed = kset.base.speed;
-	if (unlikely(speed <= 0)) {
-		netdev_err(netdev, "Invalid speed: %d\n", speed);
+	if (unlikely(speed == SPEED_UNKNOWN || !speed)) {
+		netdev_err(netdev, "Invalid speed %d, link-down?\n", speed);
 		return -EINVAL;
 	}
 
-- 
2.53.0

