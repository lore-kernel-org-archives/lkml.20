Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F638342510
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789865272; cv=none; b=dQ40I9Zjbq2DFhF1DI14LJ1RPZMvbg+DmraK+ZS4ql9SGtMER8SfI4Usn7ha6ayw/Q4BWmJQYI+ZnYXal5Y1N3lwAx4nKCuSTt/qCApssJt19KZwucHH/Kze5P2dS5zR1EiRPxDfU165VZ62vfxXSyE4XEF4Do+w4lXokzbA14Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789865272; c=relaxed/simple;
	bh=wZF2qGAioUkITwtAve0FSWVizpc8AkxtsGOY0RjV8bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxW66eqe9z50TKTcVjDuh42zR/yQFdGK4PbDJX1iZIzZDGvp8oIvwooKUEt/BMVtjAn3T8aP9PwgL5TbTqBuDurMroqZW1i03fPHCOMkE5Zok4AgPCYRAYMc+5cTKRKd1ilYlkggUQ5+wIvXb8cxDmv9uk0QJhHtF4NPHyqcGLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVPHD8BS; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVPHD8BS"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910a0cb7cso151705985a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789865269; x=1790470069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spIPE+evKRjnl976ChlZC7wECJM7DIX26kp/xsswnVs=;
        b=dVPHD8BSr5KzXjpJnfHK55PdQG/+ZXxp2Oxvd4CO8pg3l8PO21irhpRFEYKndeAfmD
         O12JHfVwGkwtHpm3dYl4ZgJ+k8GYsUFI2XmQ/40UIMSajJI1RoulB6lnqeWweu1gcJey
         UVt4JeL0phtSzEkbhCnWSLk+Z2XLEWkhD4Rfap6eLXAn7HvbLMk4jNwQoJyMgPAQQBzS
         MExho8VqwgF5/FCit7aJiwwrfBMs6Qb013mXxhspNP+yRI4KGuafOIZy/1xwUAI24oXw
         xKRuS4xZl5Aw9Kt2D6dhJnjOJBig1c8a2FU09WfdFksrZXYJoI6Jr/EjjJCWrk0wAolV
         ZT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789865269; x=1790470069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=spIPE+evKRjnl976ChlZC7wECJM7DIX26kp/xsswnVs=;
        b=yBIG7JQ52F80EEBcd0UUe0xmlAFRXJtwreSNKva2p3pdKPY6NFOFJjkHnGXnI8Mpjy
         +0fMSmh/Ue6l+y1S2AMHic1VbuRgqHzSYyCoFIFGITixfs9sq1mU5T5KMbKCVGVTg5CM
         g8f+2CtYcmmu7m1jX3JAO/lSom3cqI1m0+nmn2lHJNzhjNiAvgg1aBBwMuv1BcAcuvLn
         xzkaDus7lGcBJsXxXDQ5tE+v9nwDUQafEcs6YccbiO32A5xpm+ljfF785V0AEQAHYdzB
         Lbvjcv1/PxWTFuImVUznvl6ty77CAo4wd8K0d6jx9D1xkFp/5KDDh5bOoSonbZZPb2u7
         2bHw==
X-Forwarded-Encrypted: i=1; AKwUvBwdPSTJDi7B7a1GHzx7chW9OAWHvq5c0TNK4lDlRVgrQChqxT86vdRepo6iUapLEbM+omi519g9ZDmqvRU=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ9dgbOTeJc2dxM33zoOuAEuN6wLFszVShIGtd0EWPJaYiYuJG
	vzYoWNB8PqwhABA5mZoepztkE537qQAJq+XPTw+xxKXs3dJSghVlOd3/
X-Gm-Gg: AYBFou2sVr/f4OWWK0zMLRL5SnRDIAvKVNxsdIt56YxTx4MMFjDJ8VbgNQYiT5Nc2kh
	QoK595rgtiuAm6jRzZWeVCGeLEYLR+BDqMsL8Qo011RX17bXHfqWqJG5hE0GCRNPieeQ3iA8mQW
	VLtfkxF4xpdMrcKmXb4Xgyxl73l8AnT0l+tyGYllqJINiSy+K9eakjXeG77tIvjB9URUrFepIko
	WLAedmwGxEl/Y6iPIoS7bNVGCQ3Tfbw1sqjjzpiKRniTYswMJLDUKFoa57F7ybfbiiKvkLM7We6
	cBDOd1pXJIqruEz+CQ3hAvQpCPlPeMp0TyDHvxpfGa0W2+5clZa6xkILeVihSgyj79heP9A0eEu
	VvnadQqiDNlO1Ugx0cM/69HDKgCI76pgj5bF4evcLWmzRzC6Vw8yZ9QaqVYOheLfdR3ONgmO+Zd
	Oj2JnaaKCahAxROIT0U5Che2QoDPbMbFoeqTJMuQ2wIbKuvf0SZ4lF57me66+5K8IS20FsfBtUm
	dF5l+0otnOfqhh5b3ainbkgs5f2keAoNWS7w4o9ing6hjyaMKP9GXKAhJPP7LRm3wKi5h9h
X-Received: by 2002:a05:620a:bca:b0:939:1483:55c with SMTP id af79cd13be357-93bf552c2e3mr403046385a.19.1789865269267;
        Sat, 19 Sep 2026 17:47:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:155:4200:2c80:c8b1:39dc:7ddc:dd0c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9126078cab2sm32122436d6.0.2026.09.19.17.47.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 17:47:48 -0700 (PDT)
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
Subject: [PATCH net v4 2/2] ipv4: reject partial checksums covering the IP header
Date: Sat, 19 Sep 2026 20:47:33 -0400
Message-ID: <20260920004733.6473-3-habte.yibelo@gmail.com>
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

ip_do_fragment() completes a CHECKSUM_PARTIAL skb before reading the IPv4
header length. A virtualization interface can supply a checksum start that
still points inside the IPv4 header after link-layer removal.

This does not require a virtual-machine guest. A TUN device with
virtio-net header support is sufficient to reach this path.

skb_checksum_help() can then change iph->ihl after the packet was parsed
and routed. Fragmentation trusts the changed IHL and can copy beyond the
skb's logical linear head into transmitted IPv4 options.

Read and validate IHL before checksum completion, reject a checksum start
inside that header, retain the validated length, and reacquire iph after
skb_checksum_help().

Fixes: dbd3393c56a8 ("ipv4: add defensive check for CHECKSUM_PARTIAL skbs in ip_fragment")
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
- No code changes.

Changes in v2:
- No code changes.

 net/ipv4/ip_output.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index a24cc8e..ff902a2 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -770,17 +770,29 @@ int ip_do_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
 	struct ip_frag_state state;
 	int err = 0;
 
-	/* for offloaded checksums cleanup checksum before fragmentation */
-	if (skb->ip_summed == CHECKSUM_PARTIAL &&
-	    (err = skb_checksum_help(skb)))
-		goto fail;
-
 	/*
 	 *	Point into the IP datagram header.
 	 */
 
 	iph = ip_hdr(skb);
+	hlen = iph->ihl * 4;
+	if (unlikely(hlen < sizeof(*iph) || hlen > skb_headlen(skb))) {
+		err = -EINVAL;
+		goto fail;
+	}
 
+	/* Complete offloaded checksums only after the validated IP header. */
+	if (skb->ip_summed == CHECKSUM_PARTIAL) {
+		if (unlikely(skb_checksum_start_offset(skb) < hlen)) {
+			err = -EINVAL;
+			goto fail;
+		}
+		err = skb_checksum_help(skb);
+		if (err)
+			goto fail;
+		iph = ip_hdr(skb);
+	}
+
 	mtu = ip_skb_dst_mtu(sk, skb);
 	if (IPCB(skb)->frag_max_size && IPCB(skb)->frag_max_size < mtu)
 		mtu = IPCB(skb)->frag_max_size;
@@ -789,7 +801,6 @@ int ip_do_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
 	 *	Setup starting values.
 	 */
 
-	hlen = iph->ihl * 4;
 	if (mtu < hlen + 8) {
 		err = -EMSGSIZE;
 		goto fail;
