Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA6C339383
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789865270; cv=none; b=iXZEzC0kO6zRDdR4hOqMreeNQ7SVdpdZgjP4+hoB9u58MvyxZc7DaqQLEmean1nhS3Eqf9qmE2+kyRdhiH8/Z9XpSHpl/9WZ/d5S6FmJH8WC8RSG7XAlHZ/F8NCSX0bP8VrF6Q7JtuwSMIx0p9vEs52CnEDGSjF3pdjnj4myvWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789865270; c=relaxed/simple;
	bh=i0mBiP1JkgHcESHm7CxWXeGEgOSmLAz/z/JCtwsAP8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFy1xw58yVwvcXg149v8GmDNwpnjAwPOcj/FOICD/oPEaOjAxOapfRcvey2bT3hp3kF0fOumM5wjtLalHrnAjdXON0lFLPBlgft5IbQtaImxU+EFKEdp/2SnB8LvS5GxotjFdmv1DcmIn0tgEWIJkXrbDuIkbyIULt7nQtaboxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeGX/b4/; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeGX/b4/"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91058dd77a2so21704506d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789865268; x=1790470068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNRwTnv6INwJTRG/2/luNN9rurp+iuSaljjyDm0JWe8=;
        b=NeGX/b4/PwWtI9F3DrsGjlaPrG9J3TBpyd5GcR7hqgCW7H5/CPj+rS//0CAtviCUQu
         Hl4/hL+8cApiR/9BDT+5rK8t0oXMI4IrHhmcW/BVXlhQ1jsPssDeDOMb+d4gKX/6+Fxq
         E/r77W2nTxUIkWgu8YMnw4jjE9HpXfHjpDPC45tyPlRk7RsCicyTxkJSXARzwqchxWk7
         KU4rvABJNfT2/cXGal5Xb9qLBaeRkCmcPqpDQhxdSBTWKQypigQtQ5Ag1P0M1SdU5iKX
         I3dJl9/YWLKL7b+JrFBDPSYbvJJUpajWWt+F8uZngK4FdTsiBsvyNaS1C1uIIqIGub/n
         0JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789865268; x=1790470068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xNRwTnv6INwJTRG/2/luNN9rurp+iuSaljjyDm0JWe8=;
        b=DvwlSHRIfpfTQXWPNqoF8lcwwFdR/A6/wdsY7VOQjfySBZYrvE2UzJ2gC3wnuLELci
         h7l9TxOtRbIfkPiTGxpkyVGwbvcYHVOTBEYZB/ygrUPXS2WHUaGIScYLjq5Rmb/o90q7
         tiNcbZ1chjSVbmtCQfGDFRvRZ+sTyvj1XrRnyxmIZvqyxbyoYTrxh51qDbtJw0J0mcMQ
         vupyXu33fpx63BVjn/+4FrHBuhV9Uv8nAYUPVa/TE7qeOFqNMtexHKbu3mvB5zJP7UiZ
         8RGiZXwHp7yaWrZ0rbIi1gMX1yA+xnI97FWKfoVNOMr146JoSQVbWmSn2y1gUUPWKF27
         FQ2g==
X-Forwarded-Encrypted: i=1; AKwUvBxF0NHHnNJFXbzts3OCiBwsW3fGBqFmjYuvy+pwiYMxG5+I4GAa0HCT9Xqecai8NmfpPAlb8p3vZ4JSO8s=@vger.kernel.org
X-Gm-Message-State: AFuF++kEbzHpi7TeYJnLc3XkGvjUowhVSNC+8aZ5oAf2pROhMrqpkw0H
	x2QBxif1hstCSajeBT+xZAWkQYA0bVZJHryd78feaLYwVJAyB3Hz3h6I
X-Gm-Gg: AYBFou2z1/5InDjA5yye+YJTlnV+FuyMx84IrbZvE7K/Rt7K85doWY2h2BYXRoS2NeR
	diyABaKnBUBTujIRT3F6UTzJrDzbS/yAoMwf8mGVwUk8cSnNGXEv+r4Lhq5Y+GtEIh1mTKYtASI
	UPUWZW3WUi9/juHOhWdJPwNxgEGBm52Uw/vH/6lY05ni5xgZOMUEuTDFRwzVNE98aRJEXSKUZff
	AnwaDn2NvFPcANhizpxcQWDY1gGVz6ytnG5iPyESw0dRK4JK9MJ0SmlqqIYXMliVGghx/eoMQiJ
	/9QVl6Cg87X75cbyCUO+bWgd5R3b3Lexa5XTKwg8ncflpJw8jJScM9+uHogmtP2encBgSGOdfBg
	etWImFGDU7Ej18DQLw680eizxKWCxrOUUjaNV5UeMdcJPNNI8PNJugDjVpPZLvRBHyt8DDJ5eI5
	fS6oeLYWry/A2f0y5XPxqg5mwDjTnmpUTwzeB6kEM9XYBn6Io2rL55vYlYsfQy3ccOdgMX5bCVH
	2hfVl//ws/Ol4xOJtjXIK5Ima0ec7Gy7Wv68YnjMwaTZ2t2/ipTlLnJcInUUFVhTrTDVE0p
X-Received: by 2002:a05:6214:e81:b0:912:517b:90d with SMTP id 6a1803df08f44-912a9b49deamr40829346d6.44.1789865268273;
        Sat, 19 Sep 2026 17:47:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:155:4200:2c80:c8b1:39dc:7ddc:dd0c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9126078cab2sm32122436d6.0.2026.09.19.17.47.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 17:47:47 -0700 (PDT)
From: Paulos Yibelo <habte.yibelo@gmail.com>
To: netdev@vger.kernel.org
Cc: mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	virtualization@lists.linux.dev,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	willemb@google.com,
	hannes@stressinduktion.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 1/2] net: validate virtio checksum start after network header
Date: Sat, 19 Sep 2026 20:47:32 -0400
Message-ID: <20260920004733.6473-2-habte.yibelo@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260920004733.6473-1-habte.yibelo@gmail.com>
References: <20260920004733.6473-1-habte.yibelo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__virtio_net_hdr_to_skb() rejects a CHECKSUM_PARTIAL start smaller than an
estimated minimum network-header length. The comparison currently uses the
offset from skb->data rather than the offset from skb_network_header().

For an AF_PACKET frame, skb->data can still point at the Ethernet header
while skb_network_header() points past nested link-layer headers. A
checksum start at the network header can therefore pass, then target byte
zero after those headers are removed.

This does not require a virtual-machine guest. A TUN device with
virtio-net header support can supply the same checksum metadata.

Keep the existing data-relative lower bound and also require checksum
start to follow the estimated minimum relative to skb_network_header().

Fixes: 49d14b54a527 ("net: test for not too small csum_start in virtio_net_hdr_to_skb()")
Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Paulos Yibelo <habte.yibelo@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
Changes in v4:
- State explicitly that a TUN device is sufficient and no guest is required,
  as noted by Michael S. Tsirkin. No code changes.

Changes in v3:
- Keep the network-relative comparison on one line for readability, as
  requested by David Ahern.

Changes in v2:
- Make nh_min_len an int and remove the casts, as suggested by Michael S.
  Tsirkin.

 include/linux/virtio_net.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
index c381b91..a95ad46 100644
--- a/include/linux/virtio_net.h
+++ b/include/linux/virtio_net.h
@@ -52,7 +52,7 @@ static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
 					  const struct virtio_net_hdr *hdr,
 					  bool little_endian, u8 hdr_gso_type)
 {
-	unsigned int nh_min_len = sizeof(struct iphdr);
+	int nh_min_len = sizeof(struct iphdr);
 	unsigned int gso_type = 0;
 	unsigned int thlen = 0;
 	unsigned int p_off = 0;
@@ -104,7 +104,8 @@ static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
 
 		if (!skb_partial_csum_set(skb, start, off))
 			return -EINVAL;
-		if (skb_transport_offset(skb) < nh_min_len)
+		if (skb_transport_offset(skb) < nh_min_len ||
+		    skb_transport_offset(skb) - skb_network_offset(skb) < nh_min_len)
 			return -EINVAL;
 
 		nh_min_len = skb_transport_offset(skb);
