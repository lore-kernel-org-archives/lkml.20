Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551356;
	b=MQme2epo+70v4CGGUUPSVM+vq2Z9m1Dnm00fZdw9Ej1yTMkr0sZBnAKmKjZALZZ93LEo
	 MB2fGTPN+Z/56tb9NzPCKpuYBWNJCndPIFQcWhA1QV7sC07u5i3INGOOAJWmeCB2TKpP+
	 2df3Qkv1ZdA9Agebo0MFEtpFaQ1mPBCA+Xoag58tuAYaggW20R/kaDXUeQwkbwO8EkAWm
	 KcJaHKysJPQ+R7uKmOvs2ecRH0h7OxfKY5vL1yD/0cVXZlMaGK9yyxm2lMbEUXLiJKgGX
	 O7XIzIKDQtx4hOlotvIHcUs+WQRA5GUa9U+TtK8IpCG1MnRREfqcKq/YIRE/84d9jAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zFknrQwTtU94FjTBr40UiM+o/CoWSePUgix/JQMPxhs=;
	b=BqZ5UmXeWueziQOeZs14OHOnpurBU++v3bbXRIZorVVC588V8PoJA/NYjziTnH7orqvG
	 b55gmpYPvUbPN7wiqBH4+utG/FjMxNrdeK5QhQMLZp55J370wkXf00lAZad42xnCBNaW1
	 1IqwahRkzYrbZT4gh9O5pMqiK9r6pwBrWCnEsPfz2N3AX5hcOEfvNYIOqd2Olb4Mh1+FB
	 l20A2cRo2gxXv5/VoW4D/9VjH0jeed+/L8z5mn7I1ixXmfHoEvGmpdtpowLaE9Ml3WdkV
	 RjEMWXJLM9D2X2y61gYt830gZ6cY5uUH3QNP0/8HK5PjSBevrAIUVGJhrmlkbagVJmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ehy7AFGT;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE3606A335
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFE3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ehy7AFGT
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c43373ae89aso335887266b.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551355; x=1794156155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFknrQwTtU94FjTBr40UiM+o/CoWSePUgix/JQMPxhs=;
        b=ehy7AFGTtpw3Ci6pLL9b3lH8UKYlZNnc11/XL5xOsbSKtC7Cyiv2VrgpaoYAVdDIi3
         ulXFWDcltWvvUiKNHFD4dE02YlxwvWyIm8lxlFHaK2GTvDm9Q5TYXYbRP2TwV5WlBf+L
         sOop2LYiwthCy5WQc+9vQ5elYnGx9yXWK1b57OdlEOSh6wwE0ZwgZbc21eEeo3MIE8MK
         l6JYh5vWFWyyWrMATH4jXOC0WVCXrPlP6SWMPpWchFDcElVscfbD2gQg3S6ti8NvWuo4
         JWjzJfpRChUtRDzBBTosN8J/xkIc12KyyYvbE7G3KI/oGeKlpsf1eYzIigWbqG4X6yAz
         4v9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551355; x=1794156155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFknrQwTtU94FjTBr40UiM+o/CoWSePUgix/JQMPxhs=;
        b=hnYylGy2ztHxUBQCP5VcaW5BvOr98CKZqo+phDx93mj8rw5KcTheMlaykGBVRygW4x
         gK/zvEOvC+siZS/HdsM0jwz5q0RQgzUW+hJutB23xnCdYZm8kkuiyB0BrJP8zNyM/K3s
         wmZatOIO8S3kuEWKGG1SZqDbJtNrvFzK/Li1KWx+NF72IY9cZdBYLWKpljJIp2jWNVCg
         RiF5vUMN4jVFVyImWouF0drSNZMrTD2NswqV5oPuc+MeVY9zP38iTO/jL4Y+jXCY1RO9
         v6E+5LiEuA7OSWRHu59wipHxyNZ9AqsBncEyC2Fc7zRhDsp8SHd8cQ9yXQhRN1fGO71y
         THrA==
X-Forwarded-Encrypted: i=1; AKwUvBym96QZ35Ejy1r93Ipp/QDaYZ+qeAmMuShumgtBwOTUaNYQgvRiLGlkjoF4CzIwwS6sh0YskouF8ak5eqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5xKh1qW/+nwq2iaaOk041xTPrXMEFDeuqGXkZsEvet6nxShuS
	9fT1ZIIozg4gAy2rCeDvWIFpSakkj7y4XEkZ3GVvArZsHGo45PzbMHyAnH6phij8dw==
X-Gm-Gg: AYBFou2EUMJ1qfJc7Q0w1+JoRrtNBXO6C2h/EkP0mACgp1hipTOJmSJIDTo9WGJSIa/
	AFWvrR4/SH/rX2ak3HgnvZAkzAL2Eck+FojMmvubInIzyFx7IO4Y1o7oSXnXi29/DfJhOpKAc2f
	DVe5XFuqTSgRfCaW7YP8OiMCtvfgAHfsKGw1nk7WLlCTv8DKrS6PiPaUAjyc5w5xjZdigYu1tK5
	ykbQohhK63FR2f+zLkhphhL72O7Kd8CZRfB8YFull2v69y8rUE7AI3dzIJ2p0ZZd/6Wey5V5lw3
	CrRLe+CZvjRAt3DBKVvUz6zrqlSDPXZkCr4zpJRzruhBcv4HRyynslyl4vpPa274T3ZZFbIC7BW
	pdFqyqR7059Q5oJ4NjBSP6DrL1qDFtMFb33xXSPXWbStEHuHHXdcJem8hUb4X/337/dFdXAqUMY
	2GpOhpNOj11zXbkZ2yEXuJBPFtqwx4dc6Ly2B9sYXpL4PsjaAcN/SGAPxzhvY0eaAlsuO150Znp
	gupr8KW4ysfXnytVohuWXJKjkAjGMiiK6FpwDOjzOVqO17iOYCEiojr0eQXoOS+V6oiYdljOKBP
	ES+ZgeNxyYqB0zppk6RBVuaDId47fdDnNuEXb/pYLSVJxHuwY8otiWoJOgFArGmqXyD5lRt+bv3
	BgZ0X96tDOgEpTO2cvN7j1iIoh7hXCykXbJOEIQqSh3xeENkY1Iw0miAmL7qR4/+va2V0BxGxq3
	R9auKDxfD4WVkZhrui+AgHcLmWBl4pLJtOieTIGJM/bSlqxu00Cbok3j+FGr82KmZd8+eSo96sK
	330OEoSP8bPK3iLwjMbg7YvEePK4v7r6VyAQA0yt/3IaZX5wn92IAaOKsZ2cOQiCzwuWzQzSt9Q
	4Q7bOR5JH25zgInh3YNKfz4Mi7zAY5oTZ1jGDgIe
X-Received: by 2002:a17:907:1c91:b0:c46:645f:cedc with SMTP id a640c23a62f3a-c4ca7b804b8mr628806666b.46.1793551354982;
        Sun, 01 Nov 2026 08:42:34 -0800 (PST)
Received: from Desktop (p54aff88b.dip0.t-ipconnect.de. [84.175.248.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f37esm296622966b.33.2026.11.01.08.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:42:34 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 1/4] net: make room for the tunnel header in skb_segment_list()
Date: Sun,  1 Nov 2026 17:42:29 +0100
Message-ID: <b27640960edcb8e072fdd2e8d282c1deee747b8a.1792838740.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792838740.git.julius@bairaktaris.de>
References: <cover.1792838740.git.julius@bairaktaris.de>
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

skb_segment_list() pushes each frag_list member back to the outer MAC
header and copies the tunnel headers in front of it, but never checks
that the member has the headroom. A fraglist GRO packet forwarded into
a tunnel and segmented in software then hits skb_under_panic() on IPIP,
and on VXLAN the copy writes before the member's head (KASAN:
slab-out-of-bounds write in skb_segment_list()).

Call skb_cow_head() on each member before pushing it.

Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/core/skbuff.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48f6764117243..48291a2d21241 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4777,6 +4777,10 @@ struct sk_buff *skb_segment_list(struct sk_buff *skb,
 			}
 		}
 
+		if (!err)
+			err = skb_cow_head(nskb, offset + tnl_hlen -
+					   skb_network_offset(nskb));
+
 		if (!tail)
 			skb->next = nskb;
 		else
-- 
2.53.0

