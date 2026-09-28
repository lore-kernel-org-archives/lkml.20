Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88DB4BF955
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601913; cv=none; b=pYwfTdYoUEyw9aSQ33XjPdA+LgDrnzBMEzX/bL35oZG/ZXSJ3m+kHT4V2NJ8EVvMFwKwWbriUftdlUH4/pvqnZnxAPmtJfHCIhpXJs7KM+x2epC/p2JhAEXZU8r1G2t8AfpNZYBfv2SyB7p6kJhhAXC23Dm4dE8IxzSj83qyL6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601913; c=relaxed/simple;
	bh=hMARLGXAcDtyi7/ghv8YnrqnZ0zG7q6e+5JguN4tTyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ea9PgL8B7q4ljD1sjG/KAxY+Wa4mfoA6NpgbGLIRniyrbUu4gmoO85/ZsDgc4QBN54MfVhz+tnAI86DqqKY0VpbhY91ndrK8rJ0Ynjd67MLObEjj/U8PGkzoEhn3/62fCRGtv8402KubclBvd/X58d0KYl4AkmW9oCzoGWCr3BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeNr1oGs; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeNr1oGs"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895fd505824so23675837b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601911; x=1791206711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZeRErcG1oGOMZVEvs5q13I33GHS43HVOMHGEPpqKWQ=;
        b=YeNr1oGsGb4TuutZWdsY4n/+3ACjLa6sLGTR349hWay37rMFgkC9GsyTwBIkeXvGJ8
         hYWjIUvy3zxHxWHsW3gQepvq/bgzmVKOZgTSSpYE6L7tTk14m9JWdq7hVq6QEE1Crwp/
         nkXny8tYMViFMPwoD5fmiM0+xOwTyICg9lhLD3/7e3g5KEubxWkhsIwHqjeGNHLhFmpD
         nJjbOBfUYCp0hiVNmePhL9JayOfybfh7GLuVH0vpEJmFbczC4VxcQAAoO5LzoY7+5lw7
         YPazct1efgNVmQTWlI3bBWHdXAtt2eg5yanznBxMFTiPv0s4c3+9U9uYG2HINk+OyMrP
         S/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601911; x=1791206711;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZeRErcG1oGOMZVEvs5q13I33GHS43HVOMHGEPpqKWQ=;
        b=2asx+nqrcWh8PEc7Gx2w0dd8lvQ1goFilU8ZNBDfGtnzxTDnnw1/min6W9ZmmmNfu+
         WpDF8zSjFJ6yJrb+/5k6Jo9YjyljltwdC2DRjla0Za0g3dKDp9FxG+oYoma2IKorNfze
         Lu4jHjY5oOrcsjlUYlNjEocDZC5JBX3UJfSIEZ2sZv3WLWtxJ3VYl69Z0Y8juyvKHuxG
         LxqktAHy0QKe9+6lrXBMXtQEYnRoGjeA7jidRyNL9VUjl0p1/RzvtpdMnVUQlLHKF1+e
         QMmF8jahu/yERx/I05nuG2cUQ49fVRnpVnnqvpSplJVogEOWz8zAD7tX/Twc8spnktYg
         N6kw==
X-Forwarded-Encrypted: i=1; AKwUvBwtPs8juODpdJT0H/DiPo3pJh5y+vpEe98KbyQ7/HUO4InZ409ms5gYvpGO8qmy14+/be/h+DCIYAyjdGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx8C2f0c3ZCizmRTJ1L9h+qBUU3adSYNNve8KqCL2ilPYCYuah
	ZSNHitJLQxSt4oQJcwLXNsg2mEW7Cln2KuirOVvY/U7ATxTQKfGT4Lj6
X-Gm-Gg: AYBFou0EDNCNZxfHWywSLVphCtbg8e8NP1J0/VnsBMfoRifQ12ILMH7LblLmSVSZwhJ
	iJHFEyp3Xd3J+SsqlUD8agaJyOdOxy8epHaCgOdOLa/+E/Bdpsni26WEPQruzVYFGqmRx39NZ9M
	cTGbkT4n2ewb45akYqX/80JK/b75uepvitaIvbJtmW54xoesXLvGnA3/Mjfcmnm4Iv78NU1JC2T
	+odMcLEZEVN95XWlZCsRo7kbKhKjJfpE9wBt5h0Gcl7CCZs3lnmoN2rWTu68LaRieNBQ8RlwP18
	THONO1E65RmyxuyzZsIMZdnLU+54qEgglLoPb/opiPr0DGC7wp/7d4aMbRnBHgwnwG7+/S/zU0/
	HuFEKl52KZ492CmCyg3N9NniEmaq4LsEo0UUHWvmNXU7Nki//gbIAi93gbUQVrKvVXnMC7ofooe
	OS11aoegYG6NacrECRhCTabfVlrhAuX0pciBLnuXuI50g7qDBRRoH7nOOWSAzxnKjb5cJwgCF8u
	nXgN7rW92MVl+p/kJXzZXJ+J/CVOpk+y/43GjI=
X-Received: by 2002:a05:690c:6e87:b0:8ab:3246:4abd with SMTP id 00721157ae682-8ab32464ca8mr4432007b3.57.1790601910699;
        Mon, 28 Sep 2026 06:25:10 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:94d6:8f64:6f66:fcd2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ab391acfb0sm298087b3.48.2026.09.28.06.25.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 06:25:10 -0700 (PDT)
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
Subject: [PATCH net v4 1/2] net/sched: sch_cake: fix shaper stall on segs == 0 in cake_overhead()
Date: Mon, 28 Sep 2026 21:24:51 +0800
Message-ID: <20260928132452.59996-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260928132452.59996-1-ndaugoing@gmail.com>
References: <20260928132452.59996-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
v4:
 - Add Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>.
 - Link to v3: https://lore.kernel.org/netdev/20260927131009.24250-1-ndaugoing@gmail.com/

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

