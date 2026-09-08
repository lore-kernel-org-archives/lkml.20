Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C9B351C25
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788840054; cv=none; b=b9v+zOOQCtIlBUCi+ODXO+JoFQNioZK/8yeKDLXjQNDZKd036aYdpE5mnivJcgnob8ux2af+CGRpjqoJGKTecbg+uZw1ZhS51SM5soJ8t89XFBhJhTmzE0gscgHqLDXRIwSKq0INpqA41nT0+FXnS7kyJJT7LJs7V2CcQZ/VPtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788840054; c=relaxed/simple;
	bh=uAS9OkpwLPHeJlMQ/U1vOU2QbffPJ/SKe3md6NOYc4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=unsh0lSUoTQ8yOMok49CCNNpkpC7joR7eZ6n9JSqfccVUudUe5p72HuS1LKDiyOxHX1sR/XFgzFhTcATv0niGU6WX3IGHzhDRXZxB+8Oet06yMoB8B7CUx00ajB2buENeOTUiQ1LbsrEoNUoJ4q076ZUtCi6gp9jf/S3vNem6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIKDT0CP; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIKDT0CP"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso5004916a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788840052; x=1789444852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L4jnmKHloU+sKl+iuw0i8Qcd5hz/Yqk3n6VoYdv2FXk=;
        b=QIKDT0CPvWcdirpmx7+9djnRtuZMGYHHIFJW36w4+Pcq5O/jllnL7izIhj0qQFqG+H
         y8yEQ43z9ncxSo9ysxG2PP8CUn0TXDGcIG3OJldpCrdtisCELqKvCV1iMGfb8nDEtUPc
         ZQVrxiA2v8k6hXg4K8M/DXWky1w59Un2p9l8hg3OacAC6mzfqcR3PSrEqEw/CC/7rT6b
         CHSG5/CG6VMjsfeQpsQD6CjiLZI06IQLETMsJLzziJSVYVCT9wDBOyLDoLyvU1zQdHc2
         3sHW0CHoBBf9hRBk+qN0q/knSxpMCQQF2/UMDfJpSVCB+KenF07CMkkdOl7i7aaoZ9wH
         dlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788840052; x=1789444852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L4jnmKHloU+sKl+iuw0i8Qcd5hz/Yqk3n6VoYdv2FXk=;
        b=QvSGOb4q/XDlhfOtbUUmizyzvuLe3sljIHOxQBiRtT/PXv4O/ZcoLqFiqdKypUnxly
         rMc3YBRD+d8a7RCN92wB1/D9pEnshrvx62w/obrS4z/Rp7aXDWOdeM6/PWkJ1Tra7XPv
         5uuQUxURzaGmUqvjuoeNAysAf15cevazDY+hp5CHHP+8qdsawlNIhYq2+Q5Nd5wDNJ2v
         lqbFdidrPG/zGiZJ4bZoeQouX9KDCeYazmHq92Ul+PtWCAvBUhdClhB99Zzjhpk7xfyl
         lzk3vuZM7VNQ7YHejO1/l73Q2Og1L/rcKRrrD4B+/JH/HzjrFKJX7n3W2/0AOuC7yb9w
         vUeA==
X-Gm-Message-State: AFuF++npee04Y9p+JgCmYic13iSLWAssdvCojtVxxud5jmu+dT5U+FSY
	K4wIYLvb94iOSuUUORo9vUXfyrJN77CxrkeVELdWYDExzZPSLAAYfd2q
X-Gm-Gg: AYBFou2bVNsDESD9STkQOzUBKsl5mhmiURW7cPs/fOQ9OK9JxVvw+VCzDUCmz0FwYQV
	+uLVlbtublTFITgwBItLI+3YOTb6+ycGYS/jfPeRx6z8ZbwROsZ6X+T8rKJ20tSdGgXR75Ga2BF
	2xEqSu4qPDLua4w5ZE5bUkNOH2jhM8A6S+PQHT/FtxVV6/0OiBDx9OInDkZ2xK1PbVtYdw0yILo
	bsjoz5Emh5HyXOE89lqZtLL+M2JICjXo9/Wu3wgQmnDKy1jYcOHMXk0d9dl8D7kWTt0xNr3Ssr8
	m3i6ZmFrxsvIpXzAHLeDzCogswD4UvPi0UBa3XcqXfbpEVAtLBbUcLW/IhBMhvjZfIa3t5zIQ3m
	2D0R1aUuNXK7WDVe76Vb6IMAAlqo/xJzCg3oVUMgMXC+z/ry0oH7ULoXb9/H/+3QVKy/VwNZkTY
	JAYy0GTbaZux66kEZFoDDaVrEA1Z3qWBNH52g/zZUedQlodN8YtsjumkKJ6037e5vUJ9U9qwuNa
	IfzdYDASfA3gVH7/K/cWCDQR4y2yaO9n0U5ZRDA9xweHRdZdyK0SZm7iBuCxWkAduTvRuB75x40
X-Received: by 2002:a17:90b:2542:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39b26101402mr37347669a91.5.1788840052012;
        Mon, 07 Sep 2026 21:00:52 -0700 (PDT)
Received: from CP-IN-7ZMK5M3.. ([2402:e280:411f:685:1aaf:dd1e:6319:ef96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b813fb4ddsm6042860a91.10.2026.09.07.21.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 21:00:50 -0700 (PDT)
From: Amitesh Singh <singh.amitesh@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	kuba@kernel.org,
	davem@davemloft.net,
	Amitesh Singh <singh.amitesh@gmail.com>
Subject: [PATCH] net: dsa: tag_rtl8_4: push VLAN tag into payload before DSA CPU tag
Date: Tue,  8 Sep 2026 09:30:41 +0530
Message-ID: <20260908040041.124640-1-singh.amitesh@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a socket buffer has a hardware-accelerated VLAN tag (skb->vlan_tci
set), the upstream NIC (e.g. imx-dwmac with tx-vlan-offload fixed:on)
inserts the 802.1Q header after the DSA CPU tag, producing:

  [8100 VID][8899 CPU tag]

on the wire instead of the correct ordering:

  [8899 CPU tag][8100 VID]

The switch reads 0x8100 as the EtherType, does not recognise a valid
CPU tag, and fails to strip it on egress. The raw 0x8899 tag then leaks
to the peer port, breaking any protocol (e.g. batman-adv over a VLAN
subinterface) that relies on seeing clean 802.1Q frames.

Fix this by calling __vlan_hwaccel_push_inside() to move the VLAN tag
into the skb payload before prepending the RTL8_4 DSA CPU tag in
rtl8_4_tag_xmit(). The helper frees the skb internally on allocation
failure, so returning NULL directly is correct and consistent with how
tag_sja1105.c handles the same pattern.

Signed-off-by: Amitesh Singh <singh.amitesh@gmail.com>
---
 net/dsa/tag_rtl8_4.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/dsa/tag_rtl8_4.c b/net/dsa/tag_rtl8_4.c
index 4da3beebef75..bc11ddc4e178 100644
--- a/net/dsa/tag_rtl8_4.c
+++ b/net/dsa/tag_rtl8_4.c
@@ -128,6 +128,19 @@ static void rtl8_4_write_tag(struct sk_buff *skb, struct net_device *dev,
 static struct sk_buff *rtl8_4_tag_xmit(struct sk_buff *skb,
 				       struct net_device *dev)
 {
+	/* If the skb has a hardware-accelerated VLAN tag (skb->vlan_tci set),
+	 * push it into the payload before prepending the DSA CPU tag.
+	 * Otherwise the upstream NIC (e.g. imx-dwmac with tx-vlan-offload
+	 * fixed:on) will insert the 802.1Q header *after* the CPU tag,
+	 * producing [8100 VID][8899 CPU tag] on the wire instead of the
+	 * correct [8899 CPU tag][8100 VID].
+	 */
+	if (skb_vlan_tag_present(skb)) {
+		skb = __vlan_hwaccel_push_inside(skb);
+		if (!skb)
+			return NULL;
+	}
+
 	skb_push(skb, RTL8_4_TAG_LEN);
 
 	dsa_alloc_etype_header(skb, RTL8_4_TAG_LEN);
-- 
2.43.0

