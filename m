Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D862E37C10C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850890; cv=none; b=DBqWaRqYpqFLasRnVyMsRSX2waR1uReBKRh/EkPWEGlt+ODs4F7OaFj0reaGXQhMUaqaTqyOmbYGiLhMffNG8jDmE8cktZ+VaoOvs+Ga9GgMKV9WqqetXnnvutk1JZquUBkJgNHbLpq+UCtFZSXltBur8tbFwQNYlPj0IDj2wxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850890; c=relaxed/simple;
	bh=Im9YkV+3OvVvwtDwAZcHgiksUaKgUurDHZ1wGhptx44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oEfF3iXG2JAOiYfkF1UTckKnb7wR03N/ijHZURCPZr7i8+3/1kQShIZXglSvK4bI0lfZ8Ds+XKCX7b367TcjN+YMtvH5/vfeX+eTLFCWG5Nea2Bxi4tA+Ahv97nQYEc2SaZj/FfdqWau02UJC/umd9DHNSJZM7lrHfTANP4fyA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSYzt7Oo; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSYzt7Oo"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df36461d63so3011995ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850888; x=1790455688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Tdip1HpG8zlB55k64vHDsYJWQp4eh/7aeSdWuHA2sY=;
        b=bSYzt7OolHS6CBVRxayRQB1ZPv1pDKpeRLjzGGti4ZcvvM6MeYNxVy6xdPEcbLfYn7
         FUnZ2wzQtSYfKY1LiSKzNAm3oPe/PtYGsnm/6erDOwLZHg51/FHJG1YgnAt9njaoMAup
         lszFdigFmtSSGjESA2ZQu3stoLMltZvNxLi6vSpCk1lGR6V/qf4XbLaFC4oNE3xDL3EF
         23/TGSIlJE28dEa06JLojrQ5P+dVZdma0gKzN8nDdCxQYuo13djCFMVzj2lhvusdGpH8
         KE11y9tEvpAjk7B7ucXXqcpLimAS0yng1XZVBL5Xvcu5derDhnvApKmHdyngidgUJKp2
         5esA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850888; x=1790455688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Tdip1HpG8zlB55k64vHDsYJWQp4eh/7aeSdWuHA2sY=;
        b=IuGvZtHEWvrIBD9ptPRLfqWzDNKZLPl4ebe56JdyN1Ks+ZZcEGn78KmVlLmwr611GE
         TLw4Sj4OqadRFaxKw5dYBh4iCNdddNILJDHMMOuou0QYKIGlkAzxD9sgWRzYn+P51Tfp
         alSUHRu2OyT1q+m34vRqWqg6zmmbsr593MtT4bPkiEz5fHC05u7C6QEoqNVFwS+u6m1p
         8MLVedSVFmGv7j6TBADZiiBUQ8ESGWgdUaw/6WMZ4OUiTTiHzBsRLoQZC4bBtpK9Vk4f
         TOTLZBGNbdK6YHjF7oVRXqiI2YyEJbiMPMYKexO1KDRZKc+lYK5rnCp3G96SnY09HXXv
         hHOA==
X-Forwarded-Encrypted: i=1; AKwUvBy7yR/oC1CC7IZqbT3QPTiZYNTRbmIJQH8uX/JY6qhsIos/GUNO+7PuL8oS6pVaXmMv4YdUKZQzFwjTCcs=@vger.kernel.org
X-Gm-Message-State: AFuF++lZgo+0wbWzMf8RnCCjmewF0Whc8rGWLsmO8zUwbrthQd/AOknq
	JiL6R4OXg4pO+pN3fHtLPQ3eQJ1Xx33GYRkXX9KGvNA2jcmPlxSIbEeH
X-Gm-Gg: AYBFou01p5R9djOHM0DhM6+77bJ4opC5iMy4/rrk/SrI8U7VVnKvuqDNZ49ecRobeaq
	iGqBAbv5lGvrKMri1NK9RSCr84wj+NzCQwCfS61cXhTMlFf91SVi3ZTUc69DLOQBU3Fg306tRN2
	NwPhTirOXqsrLVZguZR/ijY1KOaawbIqNiKHN65tYo0LFVjzSgLZvreVaiTuiJu706WsqafzSIE
	5axhYF10MU0mtoeNllem7Xcg/f0gkbXWpM8h77fN9ThGNnMmz80T+fkc3N6fhUxB6OLLK3fIzH8
	HOErVSgJV7it98qSev6H8adGNWiVa0LoMXup9+eHe7jfVnoDaIu18ykQHpnOmvWGKkbCfLoKuin
	1lkHPyW1EX8K21T3Xx+4nG/Hpsa2p3MPaFZrd50WGaxuDfpktVVbU5a3+yFveGrikLUoGKXXcOi
	5F9ctNrpKaOr6jAv7LutH3DLrl+z8kd8Ctjg44mLaUlFEwkjvnZ3h9hD16jcQNTmgOh8PFXGJaY
	ZN3cnkK1VEFkwK+RhBXjlbdRrY2t7HuEIR5M1GstsykyAM0TjxoXiXSRoUYT1TF4NpuahKHQjSK
	2+eoHD+lon2wh1kvkXTs
X-Received: by 2002:a17:903:903:b0:2dd:c0ff:e732 with SMTP id d9443c01a7336-2ddc0ffea16mr40495505ad.68.1789850888216;
        Sat, 19 Sep 2026 13:48:08 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17888b9sm12897385ad.23.2026.09.19.13.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:48:07 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ipv6: sr: fix 16-byte kernel heap leak in seg6_genl_set_tunsrc()
Date: Sat, 19 Sep 2026 20:48:06 +0000
Message-ID: <20260919204807.2812472-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

seg6_genl_policy[SEG6_ATTR_DST] uses NLA_BINARY with
.len = sizeof(struct in6_addr), which only caps the maximum attribute
length and allows 0-byte SEG6_ATTR_DST attributes.

seg6_genl_set_tunsrc() then unconditionally copies
sizeof(struct in6_addr) (16 bytes) from
nla_data(info->attrs[SEG6_ATTR_DST]) into sdata->tun_src via kmemdup(),
reading 16 bytes of uninitialized skb->head heap memory past skb->tail
and exposing it to userspace via SEG6_CMD_GET_TUNSRC.

Enforce NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)) in
seg6_genl_policy and validate nla_len(info->attrs[SEG6_ATTR_DST]) in
seg6_genl_set_tunsrc().

Fixes: 915d7e5e5930 ("ipv6: sr: add code base for control plane support of SR-IPv6")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/ipv6/seg6.c b/net/ipv6/seg6.c
--- a/net/ipv6/seg6.c
+++ b/net/ipv6/seg6.c
@@ -138,8 +138,8 @@ out:
 static struct genl_family seg6_genl_family;
 
 static const struct nla_policy seg6_genl_policy[SEG6_ATTR_MAX + 1] = {
-	[SEG6_ATTR_DST]				= { .type = NLA_BINARY,
-		.len = sizeof(struct in6_addr) },
+	[SEG6_ATTR_DST]				=
+		NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
 	[SEG6_ATTR_DSTLEN]			= { .type = NLA_S32, },
 	[SEG6_ATTR_HMACKEYID]		= { .type = NLA_U32, },
 	[SEG6_ATTR_SECRET]			= { .type = NLA_BINARY, },
@@ -242,7 +242,8 @@ static int seg6_genl_set_tunsrc(struct sk_buff *skb, struct genl_info *info)
 
 	sdata = seg6_pernet(net);
 
-	if (!info->attrs[SEG6_ATTR_DST])
+	if (!info->attrs[SEG6_ATTR_DST] ||
+	    nla_len(info->attrs[SEG6_ATTR_DST]) != sizeof(struct in6_addr))
 		return -EINVAL;
 
 	val = nla_data(info->attrs[SEG6_ATTR_DST]);
-- 
2.43.0
