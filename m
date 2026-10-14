Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794021414;
	b=5pmeDr5fqglq+MDXTtVLXfDDEBbEynzJyUjWl7vWSOelkCCPMTpXVak8UyQzuxlQ7ieq
	 wGRtddZmTF7LrWdWJd66BnFg84++t6we3nQB4XIjAc8b81gLTRE9i4lbrYi4RyivhdqPM
	 D9mQcKmD6EO6St6kCOLF8Ap67xgsGgehWxrxLxuoJZj3zO6NtEC6nj/bvUJVa2BCTbQWb
	 HGpbsdIcJyCKwBTecTetn0OWUCESPm53rnJBwBrQl0YYtMXS3ZtHtZRNcYc6KqQvUXvX5
	 7LLEghUuZ66L1dmCuHWFNSTvJnCnV+CeVd2PhcW3UISvMPedrLSunMzIxxN9YXsiUJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794021414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 To:Cc:Message-ID:In-Reply-To:References:From:Date:Subject;
	bh=ni+esugfHha2YCL39AiafB18sWQsNLNY7mLIHezPVsk=;
	b=a2mcc6amvdmkNs5s6jFqsIhL2K2mEtVXz0vjjjt8wWcefNObE2i72BGq16jf7/n8bTOK
	 Xzniqahs0NDY/QjTdbL1S804AF2Rlh4VEPebFSQPiTDF2sOqRkNLkejr+jCDRWvZtQ6++
	 tCAVJnt+7twUpcQykbCMWT3lzTORsOovbAJ9KAvBLN9J7qwnFLbeml9ZXtbHaVkQ8V7Ed
	 LjOyuHNX8VSmLNo1C4rkGj8qiXj4/yD032wvW9zmFjX2lc2ErnTQ2E50i5eilurLxJP57
	 DyuYro2yuGPGl6+xMn8OdWd9d98RQ9jmh5BV1CyzVBax1F2tfOTZ4KYxeYPqSrkH4ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNUX1u3d;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DBB606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45DBB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNUX1u3d
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so32054eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794021413; x=1794626213; darn=vger.kernel.org;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ni+esugfHha2YCL39AiafB18sWQsNLNY7mLIHezPVsk=;
        b=sNUX1u3dJPrUcYPIH/DsxbltlZ2UJ+q9LiRWLxI702MvIZQu8PVQQUUdEezCWPwq3e
         ENOqUwLViri7S+tQIdqRAnitIC9hsXeaHKtKXV1Ji6CvA+WarUepAi1BqWzXTID8ABHe
         g79PJ4DbVG19eN+gK/tx6BcU9vDuXQKQGQO4GwAjCyXlNUoVEYllvTCsW7P/yWlJCLdR
         osQX4QDoCRAUV/SJoFjMeaPxSi9PQ3AMnqgQDsLVvhJ53yvqXq36lMOx6WyVLm87oHNO
         aGxngCZgUuNwr7rPc+Uj4q4UGzuh6Nh9PP2xed64SC6aWE7qn3hSSZlj+Gt2dSLRyg3R
         Sjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794021413; x=1794626213;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ni+esugfHha2YCL39AiafB18sWQsNLNY7mLIHezPVsk=;
        b=EpyFqiFiKEQFcGH+x6M2im993ITEFxVR2C1k+2JtLeAmSza6TTjtbD9uF4WOK80oiY
         cYM7wnjjq7dgYgEbweweY1jXLV4VuGEu5jH/9Sy1lp4fdDjGO5WH5+AfwkAzBmNuwlhB
         O1axuvMtVaAO4mnC7ER6qrKOzxIqhvMw8tcJp6sD/B/90b9lNTqIG5OEqZb7d+2CHq69
         qi6EntzTeU0C7fxKBMY/ymODUHktGhsCFsra+phlIrBdDoWY3+XOy7pcr8EG4As/Ei7U
         QtBXKQpVTk9/+LgJh3aCjwf6fTd2WgEeYU3yNhHc8DSGP/pQJbQL/QAUOKSqSgC0jgbC
         COqA==
X-Forwarded-Encrypted: i=1; AL+hErEHcoU2AcN3K1H/buq37kmc5OY9mAHrL6XWrDsGhqMNj5HjWX/HpZRSib5oC3o6GzPc3gfUj7zvHiSXC0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PVn3/9eIq0MUKL1su2vLNe4hWa5E4bLpZBjwsbpYnPWe127Np
	zC3adP4L0D2veTRd2INd7uWuc34Kt6CNEdY37Wo4p5ag2XkGvQNIwsMH
X-Gm-Gg: AYBFou102NcExC8kdD4ZbMG7Swr6mqUg2bV7WZ/tZ5hC/4bo9roM4dt9V3RsIeyTdWz
	dBsVfnit9rAv7zzaXhSJHPop4QewFYIYZOE8dic+rndv1YmO+9Nl5MesZj1jg2Uf9Sl5mTvwbgX
	EjJrS+sdIvtLGdqT7zfQZxmdOUPqVnWpWIFWX33WMVe7pdjO6wWDu3IvtSBpr9O/8PlLBsrGB9Z
	ud1wW/OWAHnTLqY3BFFyUhK7vMujTNcpnKmQYIvpME+zdePzL904sdkdxRgtzqDps3F6n0k5tuU
	g4MVojjgmTHpHEi7lNYaPLKz02s+BGWHnPDSjMW5BZDMdMdoSd738CRtICB8RO0z/yyubAfW19N
	g/S0TBUCKvUPEBnKgpOYDHz+LRZM9lq9ttrGS2ReJt9Xtg2QwBcQ/Rlb6uOcjMpWNwLhtzD9oqZ
	9dBmcufHs7jC+3Tqs9fNtztklRsCEFokreTvBGpxQzmQ+N5nzZiGMjwpD94nQhcZBtvnxrHnr1z
	Bqq69KyK91kJUffuXVyu/lXUIuGVuCGzSfDJkLREcHuDSg3JmczT/CD+YGodp3pm2gqZHielYgr
	k0FFDNxLlFMYaBQ5s9QQxKt234gXbSbBo0aeaaPpdJwEJbrWsDZ6anwJDvdqhPyZ3Bmj/s8=
X-Received: by 2002:a05:7301:d801:b0:36e:66d8:1424 with SMTP id 5a478bee46e88-36f6f991743mr9113710eec.0.1794021413134;
        Fri, 06 Nov 2026 19:16:53 -0800 (PST)
Received: from msg ([188.253.120.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651c57asm11453914eec.2.2026.11.06.19.16.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:16:52 -0800 (PST)
To: netdev@vger.kernel.org
Cc: steffen.klassert@secunet.com,
	chopps@labn.net,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	linux-kernel@vger.kernel.org
Message-ID: <20261107111617.21347-2-q.h.hack.winter@gmail.com>
In-Reply-To: <20261107111617.21347-1-q.h.hack.winter@gmail.com>
References: <20261107111617.21347-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Wed, 14 Oct 2026 21:17:00 +0800
Subject: [PATCH net v8 1/3] xfrm: use skb->dev before dropping the reference
 held across async
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The skb->dev reference that is held across an async resumption is
released before skb->dev is used, on two exits of xfrm_input():

  - the drop path runs the receive callbacks after the reference is
    dropped; xfrmi_rcv_cb() reads skb->dev->ifindex, so it can race a
    concurrent teardown of the device
  - the decaps success exit calls gro_cells_receive() after the
    reference is dropped; gro_cells_receive() reads skb->dev

Use skb->dev first and drop the reference afterwards in both cases,
matching what the transport exit already does.

The early drop for a state that is no longer valid releases the
reference on its own; let the drop label handle that reference too.

Fixes: 1c428b038400 ("xfrm: hold dev ref until after transport_finish NF_HOOK")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 net/xfrm/xfrm_input.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 5ed87d513..cfd5cea03 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -496,7 +496,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 					       LINUX_MIB_XFRMINSTATEINVALID);
 
 			if (encap_type == -1)
-				dev_put(dev);
+				async = 1;
 			goto drop;
 		}
 
@@ -747,9 +747,10 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			sp->olen = 0;
 		if (skb_valid_dst(skb))
 			skb_dst_drop(skb);
+		/* gro_cells_receive() reads skb->dev. */
+		gro_cells_receive(&gro_cells, skb);
 		if (async)
 			dev_put(dev);
-		gro_cells_receive(&gro_cells, skb);
 		rcu_read_unlock();
 		return 0;
 	} else {
@@ -779,9 +780,9 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 drop_unlock:
 	spin_unlock(&x->lock);
 drop:
+	xfrm_rcv_cb(skb, family, xfrm_proto, -1);
 	if (async)
 		dev_put(dev);
-	xfrm_rcv_cb(skb, family, xfrm_proto, -1);
 	kfree_skb(skb);
 	return 0;
 }
-- 
2.54.0 (Apple Git-157)


