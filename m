Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680825;
	b=4vJKRUUhmQsCvVSJrrVylV/TxINXrxMquxIClSPy4m6GPmqDSybZOT+W4oeh5/6ZRAbY
	 Vm0KQKpvqIXATmtipOZBVlTDyuS0SSLsN53/76OXXrtEFPh7mvj4ZJ6BUdxoYp2J7QC4c
	 9b0cdt833acfqqPM0H0ouBy8946HumK0Ui7BBZnEsJK34er/4yuA/syuftEC3OoArsL3o
	 qRmaiDca9fHLTSMjp1gmmVSjGTaZvBauf8SlAHyLmi4OxDw7HMEFe/ATbMQyGPKXe1gig
	 gXQkZQDUTYCuKw2y7bDughYWMyvbw4rB4cM2UphziziOBiVVlnDW68fce1inzCn851A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wY251A2gFBhubMWNcVXXbFAamvehgaQIQBtTEHgzYqU=;
	b=I0k/yEQ8pGbuMY442EwHI+dKj8h+x1A/KC7yXx6ZmrdvMKZhjKIaDqmNYnVGsERDPO+i
	 5Y9l5YetZg3Ml9WrVHhNuCj0j7F/n4IroQ2gSKOAnAe46fgcg9KnOO9kKAd6s6UjNconn
	 GZ5MdGIMI8prsW6MRY+eJ0mjRRhGmTUli8GcjHOt/wJtfq2KAAuqa3w4qzzkEve363Kii
	 vRvB+KXK866A2yijxIDoHHtVYKE/oU7V5mU4zxYbsZL10cGpg/SrKGuo0lFaAdU2TTOw9
	 o+Nn0MmIN9xN6gfhniG1oKOx8lVMgCuj9QCLaUUym4YG1e/hwIcZf8DZPbmrTjh7uTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=yvlMw+ep;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30209606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30209606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=yvlMw+ep
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d581da0aaso281983666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680823; x=1795285623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wY251A2gFBhubMWNcVXXbFAamvehgaQIQBtTEHgzYqU=;
        b=yvlMw+epLBcR6QPndiDvtu/DP36Vb1I9QUbTpIKuK/eSaFrz4hPKBYlodY7mB/paEV
         SyqADJQf0UKEg794rHyYAWFgMnBH6Onb5c/YWmVNAZw5VX6t0kGEe76aTEQfHXyDsdB3
         4MQP8Vc/IOgP3UobSvoliqaH33yhxFsuUiKqp7frIuhMwFBHBs0e8IvOYP6ElvA9mTRM
         KuxJyAGnldcYP20eUad9KQsjFKzpKBj/thMk7nYmDGlD13IIsgQinFazt4+vSrPJhzRX
         q3vtBtLudd3jfkos86P+JehBMq8Wuo+XrSxzo5aBjR4CvPIKCXq91ooexdfg7y4I45re
         /Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680823; x=1795285623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wY251A2gFBhubMWNcVXXbFAamvehgaQIQBtTEHgzYqU=;
        b=BFBjumy04B8ynVdEnnvEL2+B9nQ40w0cYF1qRnChQMo6ZA102Aa88E93DCXSX3vpAc
         mQcmVDYrHcd6BQ5ofrGIhh+ECggXejSFnNmP3XMopSaxvQUL5PKSmmSZ2QefcwI2D/Qn
         agC6XmvoevIfE8iwTyStedYWYCeuD1GjrpcKifumjWwFbM8/pyUofIZD1lqW125Z/pan
         qWDkfXnwIBwYQumMKtiZsk5MS0Lh3aucWAt9+4KnfcoIIFj4noBJ/J+7s3NZDBipr/4s
         t4yrik7Kb3PRhlpo6zN931CH4JSuRMfMsWpZx8a1WHWEda0aWxzVwEvA9UZoY0fAkhBR
         g6/w==
X-Forwarded-Encrypted: i=1; AL+hErFihIYz5VI7oRAkhfQbRpv69mJ528Ff8BsfXG/lnf5dPlTQOHM9lzbmBtQBSvr3pCUgTiirvWU34SKqyfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QFGjGD+FMcs0jUbmFDKrt8QGN+mXEOdPG6HCjFx1q5QZv01Ee
	kVB4bIqjLcvUoYgCAQeIp3zcq58TMVcX7Ku4IuNHSP6z3YTpp0ZaMpFqj2ACl2SXFw==
X-Gm-Gg: AYBFou3gQ2gGccgL8kNTjWaCPjLufbD1ilViObLjNU/cHKE3EXI92Dtg8PPJ53Waw42
	+aTX7dLZ4Py2p5uENqhTBePhky+LcfPt6SpjttcURsuWD464Pcp3X4MGMudNeZl2i21JQYtikHo
	PlkM5M2E1t4M7qtP/4wCwJmykvTy0Iuo/626Du0bKGziyzQNT5ApaLQeXHdcxJdw3s1nVb+E9uV
	pjalotRzeMsPlcC5ToCadS+p35wyhK9/fHMkYTknDMGdKUMP1+Mes5NqlMWppxcA+GYKyaKHXXN
	h3qqWXJwQKQjByctg42sUZZW+I3fxXOc2Z/Nq9RIjgnF8I6FVUE8BcGrq3TIxhl6JMQvjdP57e2
	PuVIjJ858oUoOHbSKiVjQnYwqNvB6DenpXuU+rs6XyQIhMuHXR424bV8jfyUAHJk7XdSmfOJR0K
	Jmi262ZjuUyVkNNnJASskKooTDJ2McZ7aNmn8DFJgnYJZOCIVc1w40q+A4otjjwNL0ssBpGtmx5
	BqQITWMra11B0Ptbt+w+ffKqIYmNvi5bj3e5ikLo27y9c1U2dn11FSSZrWEK02B90g0wS0vF0Cs
	G5DRDxm6Wud5+twFSgLXOsDVQ4RWztpY8BlVMA5Z2RUm61OH+mrvCbHXkJNLhvpxd2sEgR3lL2h
	QFGA4LVTbltHOAcDCPWbeAASkLYCm7Stu+acSOKksR6cfoqUN6xYc3YVdRBDBrAerLZURAnwshZ
	an7zJT7+zbPTV6ReOtn2isEMbmCyNE8Shvx3AWTqsIkJhylRnrZmT91SvPReCOHzhuldJ2sApno
	750cdgGoPUYRoKCwN5VdXuiFdRa98KrcioqBv26HesEqBIjwk0v8hzRdYlzNruRBi3XizTp/nj0
	eLU=
X-Received: by 2002:a17:907:86ab:b0:c40:f89f:d91d with SMTP id a640c23a62f3a-c50963b451dmr480473366b.28.1794680823528;
        Sat, 14 Nov 2026 10:27:03 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm240086066b.4.2026.11.14.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:03 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	steffen.klassert@secunet.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 1/4] net: make room for the tunnel header in skb_segment_list()
Date: Sat, 14 Nov 2026 19:26:57 +0100
Message-ID: <c976a72586cda383b3e42486ee3d0176033b973c.1794151759.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794151759.git.julius@bairaktaris.de>
References: <cover.1794151759.git.julius@bairaktaris.de>
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
Tested-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/core/skbuff.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 8da53d5b76fc2..054983616f3e1 100644
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

