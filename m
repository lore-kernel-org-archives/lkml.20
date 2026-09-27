Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEAA3EE1FD
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514640; cv=none; b=hA5cwW8fHYauiJQCuVYp7f56OxziX2c31FNvZYBogMPEpgoflAALOoV0FOLRL+2MI8UhNA+l8sHYpoNWZln1SNRjHr76P9fjtVcuesIFEj14mEohPv1tRsn1oleuAPy21eSMmhrU9Biuy4FV7Y2f3ox7x79nxyL6+6Ey345hFXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514640; c=relaxed/simple;
	bh=Fjrf0Jf6vbEcNCBWCWr5LoI5uxPLnNxDyMf05k6qlng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5vq34eWw5FQBOT4O/76fkLqicSISlObOC7Vy3oCfk45yBxqDaWUDRsXZ8BKBX6pcGU7fz37WOMQ1sT79Wr4Hpt766EJkIyLEs5rHnl2ZAGdRK6Lp8Op0pygCv9LEUt38Gi3WjPPvGF4yljURDRNvrr2i03NtjPZvZUsxgf+pTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0W+abng; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0W+abng"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so1174303a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790514637; x=1791119437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkbFBTkqFbcQemO3yfmHiiKUHaQQdpKBirEnurxA9EY=;
        b=p0W+abnggYLs4/d5ZI/q5OuJd8ePgjbbMr3hyzh+myGN1T7qDIVL1zE4FKdil9/Gx2
         YqmtuJPWdaPRREaHi12TJlPfHPpXgEGGQn0u1TiNn364HM57uu5EoR/+C3uhQZl8qyun
         GWtVHP1wyK5LwqjK+ZQFbciiadM1AD4cOCl1gMZRYJmYYJp0TkAHT24nXL8Xrf6epBo4
         zt8PhtIAaWouz6hT7oIdX+JnBI+fKu4+0Q7oMmTnuQNd3+O8MtGQE0vsN19+TI33dlXg
         4vRTatN+DXPrYh2rtYat/8UOGUJ4wOYZaOhh4lW8f8fHh44Gtj5OmEPFGb3ylY4Twll4
         /60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790514637; x=1791119437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkbFBTkqFbcQemO3yfmHiiKUHaQQdpKBirEnurxA9EY=;
        b=OoVQwWxhAqAbluKJ1YKxLlube5wGMz86Bmr84c4olyMm9c69DR3b68MEHwqkCny61g
         BFSv8XB4UPorAd21am0HPWw6vlk81n2a4Cu49RkkKsGV+fcnRQKiiKf4juYifH311uO9
         9+wZ7pcN2TgB7NuUrLiVY1LKX7HDiGUF0BCN0bwpjuNJwkbRbvuih9iThO6CjGPCUKwv
         M5CF95Q0lSIDDU0SK5t73jp/oKPSk5IPFbX+gtpNsNZPUsgCjKa/8MsY0Q/4+WK9otdf
         fSzlm2cxQMkYgs7u0k1AZnHr3UasH83Sv49WB1k2q8eePl3OipfKIth/2h7YNLgwjpxQ
         kDMQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/j27LeCaAQSvAWtBP/zM27A3z99DYo2qD7zKNk5TZUMfYvlCDglEYU/JasJU7GzJNJ82iuiVqR/M9oY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbKSf5dfoZblayba5S0Qg/S9ZJowhtfM0CJX/QhDNzlyJmV7nK
	jVcc4sNiG5SWM3F1ahDXKNare3Izjw1u7eSNJEvEVmYx5U89FiNx4cUw
X-Gm-Gg: AYBFou2S+ZdCmCFaHamPO4nP0bl4O/y94yPqfsnvUlp+Vs3TPLPdDIOx4bfGQmCm7s4
	MK9C4hPe0kMXGb6PbCF0GbCyicuXcT/TK16HjlttQN5mgBZvMsbL/pMehP/crj0yeukmKZiT+4C
	2AY0c52hboPHdP17WJ/q6RXwSeBQV/j2FR0l4vse9NoR7WXPGGLKVLJ7NPNJ2aEo6JblnqfKiL2
	ZuETZMb++za/ENy4b2zhCr8dyhARm6ZC2+Q21BEEF3lGJUlkJZVDwVVRjC5a3OD5eymKPucIb57
	UigWwD1dFzljm/5ag2dYc0Vz9jjjmJhgj12q//l+5OEQJKhgKUmVsJxA1dQ9JKQJc3vkZRo6+oP
	CCsMwHQ6XgmiBZ6phK/ZvbWj/2as3+xPSxrDMk4ZQ5P3GyspFLSLJEhcEQfdLSeQTB2mEKMixfL
	SS6BT8WMT3j9hg8bkk1CMStjgwAJlcFaoHzwUR146WLFvkKU2dGAFghg0/pReu2QtKFhVaqJVAB
	jwXtaYULn63KCk/YhNUjl258ZKeA4qZlw==
X-Received: by 2002:a17:90b:5107:b0:3a0:d823:c750 with SMTP id 98e67ed59e1d1-3a0d823cb37mr3627184a91.49.1790514637256;
        Sun, 27 Sep 2026 06:10:37 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:84a7:e3d7:8c7e:980a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9589f7esm14890506a91.10.2026.09.27.06.10.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 06:10:36 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	cake@lists.bufferbloat.net,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH net v3 1/2] net/sched: sch_cake: fix shaper stall on segs == 0 in cake_overhead()
Date: Sun, 27 Sep 2026 21:10:08 +0800
Message-ID: <20260927131009.24250-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260927131009.24250-1-ndaugoing@gmail.com>
References: <20260927131009.24250-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cake_overhead(), packets with a single segment bypass multi-segment
overhead calculations:

	if (segs == 1)
		return cake_calc_overhead(q, len, off);

Commit c5d34f4583ea ("net_sched: cake: use qdisc_pkt_segs()") switched
cake to retrieve the cached segmentation count via qdisc_pkt_segs(skb)
instead of calculating it locally for dodgy GSO packets. If an skb with
segs == 0 reaches cake_overhead(), it skips the segs == 1 early return
and enters the multi-segment arithmetic:

	len = shinfo->gso_size + hdr_len;
	last_len = skb->len - shinfo->gso_size * (segs - 1);

	return (cake_calc_overhead(q, len, off) * (segs - 1) +
		cake_calc_overhead(q, last_len, off));

Because segs is an unsigned 16-bit integer, (segs - 1) underflows to
65535 (and is promoted to 4294967295 in the 32-bit unsigned arithmetic
above). This multiplies the per-segment overhead by UINT32_MAX, so
cake_overhead() returns a length close to 4.29 GB. cake_advance_shaper()
then charges that length to the shaper, stalling the CAKE dequeue path
for tens of seconds at 1 Gbit/s, and for minutes to hours at lower rates.

Fix this by returning early with cake_calc_overhead(q, len, off) whenever
segs <= 1.

Fixes: c5d34f4583ea ("net_sched: cake: use qdisc_pkt_segs()")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
v3:
 - Split from v2 into a standalone patch with its own Fixes: tag
   (c5d34f4583ea) per Simon Horman and Sashiko review.
 - Link to v2: https://lore.kernel.org/netdev/20260922084124.36858-1-ndaugoing@gmail.com/
 - Link to v1: https://lore.kernel.org/netdev/20260917122153.62722-1-ndaugoing@gmail.com/

 net/sched/sch_cake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index dc93267029e7..b0d604a7052a 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1420,7 +1420,7 @@ static u32 cake_overhead(struct cake_sched_data *q, const struct sk_buff *skb)
 
 	WRITE_ONCE(q->avg_netoff, cake_ewma(q->avg_netoff, off << 16, 8));
 
-	if (segs == 1)
+	if (segs <= 1)
 		return cake_calc_overhead(q, len, off);
 
 	/* borrowed from qdisc_pkt_len_segs_init() */
-- 
2.53.0

