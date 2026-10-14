Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639607;
	b=EcBP5q3BHGMcBcmvGS2l3bEAmD9m6zvxxZPNta6Qoz30GbU5rkGCO6Bew2pMvxePnMPH
	 JPT+vitw/BdTjhYbD00RV7flfAs8Qpx23AVYXQuchFC28MgtmwO8DSZZFq7kwdQ9UD5+R
	 IUyOzTQ3QDgGamb1EsrPEAZS0ud1kJz3AtSH4m5+22ZP6eY+W2j7ZenQlHtVQJMbuzgY+
	 NcTkOo3lZ3jBEzrlneSA8Z2uqzpzjQ7VcdBvwWTYBedTlz0yZmB9NLeTcpMpD0g83zyyj
	 w8jPfRYFzAJptfe7oAE5qKCsaNDoDlPzyIdqlzsz48Ww1kBkey56VRE8IlakV+B2VyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 To:Cc:Message-ID:In-Reply-To:References:From:Date:Subject;
	bh=RTU0GqXO0v09/wvq3q/okf4+AOCgqZ21ovd0A51lLqA=;
	b=FbDhy5awx3uRznni3eexOu7uylHrHCF+O7v05yk984SfRZzs90XtEb9NUxnLJbNDao01
	 A5h42mx/WIHs90mJfvSHZ3vzcyp7N66vrXHtGKI4D1iclCav1whfgfOCfPO4nxP0wv4Lo
	 TspW9TBGH91D29IwFSJrSKOy3ODEGNcONhiaSXTJHKZhnQPBNMDS53l782tklVhvrPvro
	 G2q4iFVu0Y9EvWmHy86P0FycD76F/1x62MNqm904i2XgoljlaT/CuX00B9JXtegvyrlY1
	 ZGxnU6bDSlAIF6y6xG8eIM7ffItpsixP7H4g533HeRneEUznzCRueMEcQljUoknIzhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rWuQvC8M;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955EB606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 955EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rWuQvC8M
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e74a32a07fso1837075ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792639607; x=1793244407; darn=vger.kernel.org;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RTU0GqXO0v09/wvq3q/okf4+AOCgqZ21ovd0A51lLqA=;
        b=rWuQvC8M3vbhWL0gwShgWn64eK6HHwV7WO4raPHOcTNpPtHBSzlm8HZ7eaHZIGpKg9
         N+cv+LdHK0Are1PSv5VLBPTCuV4qTpg7k0NHKFj+3swK89uNg8KuCObV937eNoAh5dEa
         725mp7Ow03ThF6dI3YCxyGflDwVXh0+DTQi2sil4v00m/lwpfaLyiZhyhq2VshS41yP1
         laJE/1MMNkqRzqFgJ5FtL5X5dqjWzqUUACxjppjPjhZmTjoJdbESvHj09QkIbIUk5fTg
         jwIINxeJkwZXsBFAKzWbFDWOQ/+OMwniorKciuU/vMPMoS866NswpFzTuErYmwyhapur
         c4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639607; x=1793244407;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTU0GqXO0v09/wvq3q/okf4+AOCgqZ21ovd0A51lLqA=;
        b=DisH6Yw2Xbk07bmhPle9AlJR5VTbCp7Pvhhw5GSjuex5ofRCiFvXBJKPa8lGAPCMd1
         ep8bbcRpGMksJeVY/fnx32M/xiZ4ZoV5aJICcA3mMmYqlhBnylrGUUwADmckPnPDVNYd
         6MG4Yt6/3ZN3bdp5skYWVpW7WBi6WqAl0xgBcxl4MRet1NYeR8kfVmAZ60yRe2MiRGeI
         ZSPn/kpe3nJmMv0Gsx5i7HhPomx4fIyYWUPj+YCzaCeGGNyQN6mcHMX7hklIFJrH17xw
         BXzkxrRFE/+xoiqRK/vuDvd0eLAgyoxVt2EZW42Jv3rodJa1uT7iLmUjTqGy50+ij3oG
         Zl/A==
X-Forwarded-Encrypted: i=1; AKwUvBwvoJcHitIPeSpYFEuqNdCdtc/ZITMqE2TLas2no9+RHqXBMU0gCjqZz+GSGuD8tXEB5ADN3eW8fm9B4eA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+Fhbthekzat8aGVRckwpa8EA/YiVwgDI00U2FEMssF0IXSu8A
	IojYtFxRljK7CY0cOBVClKF9jqZzL0iPLXaW6qdlZKGwn39ZD86w/Wce
X-Gm-Gg: AYBFou0jtTNqngjo4DZfAserMGELdDReTwnN4Gj/MFmxo8wkwAQ9+PlDZmkFxWbO+kI
	Sg4fCwnWXQJrmdzSaqo1dc5IJcJC4eoWaqAOORRzi46HvMdQHlK8zd1J+oaYTKJ+prN3BH3XYES
	99GnD4c2YT3gb9wEBdzWGOK0hwMmweySj/oa4ZPzC5YdXK4GSRcRm3GPrSCtlFfK5xwngUHMnH0
	pMYGu7yaBbi2Yq7WY/qVwwwCDvIuzg3s/djE9tAQGSmzdIPZEIszpMBbb611/K3DS4wM8AaFsCx
	LKfG9oyE1TozBRpxvsCa42RGqrQf4LoiL9TOvNMrFiH6NewtFQUbGhroEHHqzZhKBNmBzVRmbeh
	dFGh3sxVoHSiz91ZeICkrChtvbA67U2NS+dtrNDIFhvLyuZjafRb1VfAEt4s5X0q7tUqpW+A55Y
	2vVUG7irDEJ4itmbLgmNAi0iMOoYi9kOKC2dYxk5NBFmdpqOfvHu60kaejB2G/GN1Uva3ZW6VVV
	t0QjpEP89j6DwEO58y3y0tjSJs1xVjqeaCIrPHpUSK5UF2fwQDevMjABCdJoNnLSxshcQ7wjA6C
	5pGPISNkygFeilZ8kdnADA==
X-Received: by 2002:a17:90b:3a50:b0:3a8:1759:2217 with SMTP id 98e67ed59e1d1-3ad86dc96d7mr5811919a91.2.1792639606844;
        Wed, 21 Oct 2026 20:26:46 -0700 (PDT)
Received: from msg ([188.253.120.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48bb6f1sm2001732a91.14.2026.10.21.20.26.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 20:26:46 -0700 (PDT)
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
Message-ID: <20261022032129.16118-2-q.h.hack.winter@gmail.com>
In-Reply-To: <20261022032129.16118-1-q.h.hack.winter@gmail.com>
References: <20261022032129.16118-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Wed, 14 Oct 2026 21:17:00 +0800
Subject: [PATCH net v6 1/3] xfrm: run the receive callback before dropping the
 skb->dev reference
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

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


