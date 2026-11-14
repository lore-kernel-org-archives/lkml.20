Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647566;
	b=YrpHn+R9IWpNmVz7BAnTkXDlj1GTOwEEziTvv3/Dauf/kkycndRZMInvWIXYg4FDUrMm
	 nRH4Y8jNtQOgcA6QG5HDv07Ke7j6Nd/26t33pAldXa8B9go5aegTMuTdAevrkzhL6ET7T
	 HFffIBl/wShhPxjgeQxT184heLKTOLdsGCnYFzlGwbejzHr6fH69Tp5CX6mAOJvd/6+eR
	 8VmrYTLFX6jk3Cjb0tlZRAiXlXqOSa+u/EUcGouNPyHo+knPXBp8CxPeFeD2rtMiZogMD
	 igOSTDDh6FS82avIHibfMnoRCAqFdJ3ed6J0qX3K7PWg/r7d/uy9KuXTc4un6pRq7aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QTbQToynBqwf3n1SZSg1pf/eN+ziaT5I0ox1EckFMS8=;
	b=OSaTdLae1xbDb4+uKN+auZzDVwR/jhx24YKWhkdgmNEx+QpBq2TdWYBgCmP9EP83Ht/9
	 HmV8nxKNED9UHIIeEenUQatBx+SJnKy+EBEbdig0fFCDmUuJFtLj0u2F7cAGaATZAapgA
	 XYbP3H9q21z8uC9PAqr4ddUWfrJvRQ+ksVtR4NCuHdQ5AXjliKY0CckFBcxMlxTlP9np4
	 WNcMly9GMCDMeMDiBmx+KPpwxDeTiDmuoVKkuyC4e893nFZVHNpDEVT0v+XMRMUjIGSIM
	 Q17KB3T3xdUKGpMp5Q2gkRkfimdgn2+RSB1At0ciqWA30yiQXhrQgvxJTZRrFRujihA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV6mQUGj;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BFC60A380C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BFC60A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV6mQUGj
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada6c66964so427222a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647565; x=1795252365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QTbQToynBqwf3n1SZSg1pf/eN+ziaT5I0ox1EckFMS8=;
        b=RV6mQUGj7+F93NrSqCxxKeUED01cOhim5hASqZ3AYiS1YT0y21Kl3GdKHKu1t9l44t
         GSQ37UxZasL+fHnTpBsopAbYWA903/H4/llyno2eMbaCzFwjioBAJ3jm5EseGU8Oud3r
         OwE5LQPoW2sTjoOPLTS7t5z6j/aTatIHwVuOjyFblgKtjfE8HVpYYHYcljsWeUC0zB2z
         38H8L4C31ZV5BOP2BiGXW58+M7b1OgIt0VnoSK2dzT4vepwOIeVumpezx1CXurFoWicV
         0bApP5+CmlF1jpQmgBpMhJUlu0DqVwao0lCMUtf3vwZ1iSNCAXUlGQ7ugD/V0VNLSluF
         HHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647565; x=1795252365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QTbQToynBqwf3n1SZSg1pf/eN+ziaT5I0ox1EckFMS8=;
        b=f3LPTUd2dWrTsVRSVWWK1ryBJZIs1Vh5WfNwoeLE044gwKkg5dyT9xTiysUlKpZEsG
         /zxEYL1aHdQjFPYakNjQjkKUrhEnC4JD5v77Qi6tNgaxSRqUUWXbCuv+5Wrj84NopmU+
         cz8K9NjZ1juRVqaxYHoRoOtGkbmYZXo+ye3XOki/uL8F2j1JPSoyn2V5gPL4zK8zjtRN
         NQB3ZmZJ4RfJtqyMv0iGOIAq4ti5n/0SiOJ3oNzFVjiI+VeZ5fgXnxQspiM6XV4EQJuB
         +U6vqUIGh+8TwBWAK3o3XjXJrPpv2exyeYMxxK/xUGZUv6DDp7W9XsIVqk+y5RnnP83l
         /b0A==
X-Forwarded-Encrypted: i=1; AL+hErGHjREhZ8EnKXb+VneqS1P+ms5viALKCtzvqc2ao+/zsin5gsphN3bZOy9fRhQo2vN77uXUqpsZyMbAsm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wxx40p+VBreC7DyoVnEIF8qs56OjMlbgjmwRDORXURoWYivXr
	JC7fKrgX/9sXH+vg2kmKbpnYFUV2h/BzOgq6v1t21Bs0ye3B0RrhfUzS
X-Gm-Gg: AYBFou2TA9pboFEZzkXYnFZ6UY1Chu5MmyAhOAl7OgjP2havduYZF68M/UlJRLXSLEk
	euo2wHevJ5cXwg0e3D8NveOYQiFJ2S/ObrZucYPVXs1pmEIsjHHnX2a6WB50WZbpq9Eid+zfUUx
	xypbCTZSAjmh/lzjrrV63swBcAfvrW2Hq6VfzRv3bShByKBrdes4oeMOAhhPP1Cfg6amD+HBItX
	ziMdfNURZc1nYDznASwFuCWeRM/IHAoH4s9tGajwHtRUqA9iygZ+fUuZykcFwTSToorb3B6WT0S
	Xm0huMyoDY6T2wzpjNBPYa8g8XOgJTwDsL/SumOjGvLUFvmOhoUHZPjTdV0n6DE26HbUkVSuFVY
	p7AxGRoGlp6a461arrEJggWcOpkozRyHsTn2CrAqri5LTkyv9DkuXNYr26ggUFy9C1PI3pj8W6R
	lO3c2Rjh0AhVxTQaMibVt0mI4jx2b9at5/PckYHwhY74UBjgdhlI5ECOE/8qhrAnswdBzTdLd5w
	Niag3fefsebbPC0vt2ypTyJtNkiWhGXy0lB7EXSgkAlUo5jwXhOmhmCB/qNNCKTlrtISiXlaOKW
	tpOkNw6Tg16S85kJJeaclK9/zweXM6xpHYMJROODBWSA/XHYKItp
X-Received: by 2002:a17:90a:c88b:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b1b0b6049emr4722150a91.43.1794647565057;
        Sat, 14 Nov 2026 01:12:45 -0800 (PST)
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:2b6e:fd48:7485:9720])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm8311897a91.4.2026.11.14.01.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:12:44 -0800 (PST)
From: Yingjie Wang <flashhhhha@gmail.com>
To: steffen.klassert@secunet.com
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm: avoid wrapping AEVENT timer thresholds
Date: Sat, 14 Nov 2026 17:12:39 +0800
Message-ID: <20261114091239.780633-1-flashhhhha@gmail.com>
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

net->xfrm.sysctl_aevent_etime is stored in 100ms units, but the
conversion in xfrm_state_construct() multiplies it by HZ while it is
still a u32. Large values can wrap before the division by
XFRM_AE_ETH_M, disabling the replay timer or turning a long threshold
into a short delay.

Do the conversion in u64 and clamp the resulting jiffies value to the
range representable by replay_maxage and safe for jiffies comparisons.
Use div_u64() so 32-bit builds do not require compiler runtime helpers
for the u64 division. Use widened arithmetic when reporting
XFRMA_ETIMER_THRESH as well, so large stored values do not wrap during
readback.

On x86-64 with HZ=1000, setting xfrm_aevent_etime to 536870912 made
XFRMA_ETIMER_THRESH read back as 0 on the base kernel and 42949672 with
this fix. A normal value of 8 read back as 8 on both kernels.

Fixes: d51d081d6504 ("[IPSEC]: Sync series - user")
Cc: stable@vger.kernel.org
Signed-off-by: Yingjie Wang <flashhhhha@gmail.com>
---
 net/xfrm/xfrm_user.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index a5fbe38839c4..4a676a6aa53e 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -924,6 +924,14 @@ static void xfrm_smark_init(struct nlattr **attrs, struct xfrm_mark *m)
 	}
 }
 
+static u32 xfrm_aevent_etime_to_jiffies(u32 etime)
+{
+	u64 maxage = min_t(u64, U32_MAX, MAX_JIFFY_OFFSET);
+	u64 j = div_u64((u64)etime * HZ, XFRM_AE_ETH_M);
+
+	return min_t(u64, j, maxage);
+}
+
 static struct xfrm_state *xfrm_state_construct(struct net *net,
 					       struct xfrm_usersa_info *p,
 					       struct nlattr **attrs,
@@ -1022,7 +1030,8 @@ static struct xfrm_state *xfrm_state_construct(struct net *net,
 	x->km.seq = p->seq;
 	x->replay_maxdiff = net->xfrm.sysctl_aevent_rseqth;
 	/* sysctl_xfrm_aevent_etime is in 100ms units */
-	x->replay_maxage = (net->xfrm.sysctl_aevent_etime*HZ)/XFRM_AE_ETH_M;
+	x->replay_maxage =
+		xfrm_aevent_etime_to_jiffies(net->xfrm.sysctl_aevent_etime);
 
 	if ((err = xfrm_init_replay(x, extack)))
 		goto error;
@@ -2782,8 +2791,10 @@ static int build_aevent(struct sk_buff *skb, struct xfrm_state *x, const struct
 			goto out_cancel;
 	}
 	if (id->flags & XFRM_AE_ETHR) {
+		u64 etime = div_u64((u64)x->replay_maxage * XFRM_AE_ETH_M, HZ);
+
 		err = nla_put_u32(skb, XFRMA_ETIMER_THRESH,
-				  x->replay_maxage * 10 / HZ);
+				  min_t(u64, etime, U32_MAX));
 		if (err)
 			goto out_cancel;
 	}
-- 
2.43.0

