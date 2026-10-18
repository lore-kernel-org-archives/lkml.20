Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A9E449B0B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314412; cv=none; b=i/jVy9kCdqwpd3mxjGh2HhXAk0ulUEwwP7YsA3I1Mbft9r21DFrI0adqMoUTG5dwOnpWTzHzME5dqXl2scVWrKA2Gb4Fk0xz7JZZttTcYdqNLNyt8mBbvOYVBQHO7XomtceErKZ0azFXezVi3agDgewTgZnyb2dZPh3591iy0J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314412; c=relaxed/simple;
	bh=WFtv6Y5pDmp33PeCK7vkQ2vxvhssR4O8VZV0BT2pZd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K40nZUqu9d48ynhxK3+f61ALEr0Q9NUPSRo52jkVEzwJLLqWxCnOA4/ljxHvKr3PXZ9lZZGxRriYEsCPN9JyzxRmGySkZgorEGsymspxCj2y2v0b2oj83EZ8764Kuc0wJMClYIXbcUgtaK4bDY0i1BOb/itCPF7Exv5FGszosBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEW2UUWk; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEW2UUWk"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4c78ee4d6so221731a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792314410; x=1792919210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTU0GqXO0v09/wvq3q/okf4+AOCgqZ21ovd0A51lLqA=;
        b=VEW2UUWk7P8P2gRfxyT7x2h7mDiqzK8qaXjBy88J0agAjDk/skx200dZzgyFU61XXo
         A/hMHH1NE5I/p0hVSikGoFsHbguMuNA0+K5r5AB5AWLgErcBqeerQiN/kx6dPX2rtjlw
         izrkz9/rz/r3UpzVXS8u46INoaBacch5dl7aM7WMi1mf28IgaNAdwR5Mx25LAZUGezhV
         eAdoIWpp6tL8d0ATxscrxnP0x4pLKM0V+RJ4n83EWSgVFTvh3/ht9xMF9ex7g1bvAZAZ
         h2GNmIpx6lxC1MEhL3CJjmZ6Wbyc4IovHG6BBzrFAVy9jtTVhvAhvpVyqwBQPxJK/0gE
         YojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792314410; x=1792919210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RTU0GqXO0v09/wvq3q/okf4+AOCgqZ21ovd0A51lLqA=;
        b=DCLYttuD3xj+r35+rc644XxuMxgF2brK0oNu98Fs56Y8apeWVimq2eANfOIQlef7Yt
         YuJ1G9IcJc1qRJi8wEkBUy5MoZWd9qY15CqMh7LX1M6/kU0xxr8h9XyxFHsBrH3vsWMy
         NqkF3m/HQwdOW8XsRK/Kxj3lZNIe+rAj+plgbYuXwa45pv/pXIXiiB+PnvZdskppPiDn
         Ipsdu324qmBBuKUCRFzkwdke1odKvnRVaRuczQKDsZ4r7fLH+7PervCldxS3I8TmEXSv
         3d2JoEZkluqyd9Et8AS5lZLpYsIbVp+fAO7qroSvXv3PhpnzU6o0/w2n4Sx4nObyvnKa
         d3Fw==
X-Forwarded-Encrypted: i=1; AKwUvBz3QyU9u2bA+iHCEQ+zcl9Hntq70G3FDUkErFf0ehdAorpIAm7W1WQo5K4ekPtmXrwTuXcG5B07BqlOjmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJFSSVR768i5sD9MKNBr8jfiHstssiEhcvLUB73yXnUhRXbGWt
	vkM6irvflmMZayMOGIgMVJD5ZuszRPHkHmFnAY9z+CFFhSlr0Pk60Hnc
X-Gm-Gg: AYBFou13GbG3QMipRfDfiASOf6Uw7LvfL5+84fEsE6VXNzrcvA2dKd8SN032rPSpi4A
	suR6OLp+LJuQattOZtRO/duLWx/KHHTZpgOAP6QTo1SRIu8apVByEhO0VPpusxRBI0yfU5wa+WE
	bIFkDRjpJZ8eA3co5JaEkHlnLgYDlymAOvJ7m0i7AJWMwLJbWL+8egjZ1uQG7HXLHqUpzeOznOD
	ZT8w5oVVS0RVyD0dr0OnkZLZ8eq1NzB5Fq7rnZzYruC6N3Hs2YXwFArj3Wkezs48sp4+J56h2n7
	caJl8OFmL0Qi0bZQRZ7voyHVCaaAd/HDNIM/kJHiU+sPOGSFayOMnXXFtw75eoDBWgmQhNWqle8
	vDdbTqtwnI5Q8Yn0M1uJjlwPEg7QcvexqAw/ig/ztk8f4oca5BvR/TMGFURU1NvfWwlJ7N6Pv/G
	J766WEPaVBzzUKWk04X5XQjsRR5fT6VCnpDCnVt5QIWUMUr4BDzud4JcTAWdP8iGH3T4jmrsQnm
	gSUNtdu8k5UIjAVz9VY9NlAF1OAWyI2PsNC9YDx5kUuDZycgoQMygvo+D8knoSZjCs=
X-Received: by 2002:a17:90b:5146:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3aced868018mr6487427a91.0.1792314410375;
        Sun, 18 Oct 2026 02:06:50 -0700 (PDT)
Received: from localhost.localdomain ([113.102.237.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947928b4sm15580675a91.11.2026.10.18.02.06.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 02:06:50 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
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
Subject: [PATCH net v4 1/3] xfrm: run the receive callback before dropping the skb->dev reference
Date: Sun, 18 Oct 2026 17:06:36 +0800
Message-ID: <20261018090638.55686-2-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018090638.55686-1-q.h.hack.winter@gmail.com>
References: <20261018090638.55686-1-q.h.hack.winter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drop path in xfrm_input() releases the skb->dev reference that is
held across an async resumption before it runs the receive callbacks.
The callbacks may still dereference skb->dev, xfrmi_rcv_cb() reads
skb->dev->ifindex, so they can race a concurrent teardown of the
device.  Run the callbacks first and drop the reference afterwards,
like the success path does.

The early drop for a state that is no longer valid releases the
reference on its own; let the drop label handle that reference too.

Fixes: 1c428b038400 ("xfrm: hold dev ref until after transport_finish NF_HOOK")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 net/xfrm/xfrm_input.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 5ed87d51392a..94de4f698c33 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -496,7 +496,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 					       LINUX_MIB_XFRMINSTATEINVALID);
 
 			if (encap_type == -1)
-				dev_put(dev);
+				async = 1;
 			goto drop;
 		}
 
@@ -779,9 +779,9 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
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

