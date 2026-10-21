Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569003;
	b=dZfRoziPPL+OuvHf2DnOdUGeDd3XteF9aCfph1Lvrm28eYRPpgqHkztJRe4KEPbndiYv
	 phjJIgkuIAqsfI53Fk1UjeuzY23fVCa3aFSZnipXDAlAlFPQgokkNsorRpGbnGUp63tPa
	 /0YJEFLc7TFzTyfpsWaHDiLC4RQO3Nd1bTm3sN2d55e5tbwrrZUNuPCC+l/vZAh7GG+yA
	 TUdbPdOlpqTcK6FQ7CGS9TGWjI7I+QAJs/YikRWQcfEGhWt4EAq9D5X3ZrSCRr1FHOR0W
	 I9gty4oXtNUt5LkH5W/3zbbY4Fj1S5HG4x5DtmSoEtpIythNzRPKLAyVL/4nyCBJrgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569003;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=8bDfpp7sAel4FSdNGE9WjbJ8LMrLDJQ/k3zaoUEgNSo=;
	b=rkfgFfiYZE2MdgTk1O5OhEz/k6wi0P91uLurhIvyNKyi7fTwb4j0wBPLTgFKkYl7lKsm
	 j8sWCvDvIhtWfqokNZSOzx0Rdq0cB8XZs3dLNETayYYV5BTZNdNXf0jHHZRhWBo9IX1W8
	 SeOv7ly97kVRzDCh66andDyJ3PnShOcDSxlRy+FsBj9hpooWyZ8SwtXBpQdZ/QcwuklH6
	 pwDeK/bYup2rOftYK22o2kRF9NE6NTdwelklM8lHaQlpWR7jgVt2AuaFKTxHS6xwJHzOv
	 BAYS7G8iDI4H6KRhUn6xHhBM3k5+9T8I2HtpnaN6GMa3vlOBPtmLO55aTW1mU9M7M+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BklG6k+g;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BRQoEBNY;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAC2606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEAC2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BklG6k+g;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BRQoEBNY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792569000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8bDfpp7sAel4FSdNGE9WjbJ8LMrLDJQ/k3zaoUEgNSo=;
	b=BklG6k+govS8Ik+bEgRDu5xZFrJNgwLPoeu0umg4KdkPm+osJAxa0l86Ug0tKl10Zi3/CB
	9uG30Iq/yrej8xP7MLSZRSkD5d9iBll3torNCQYWGKY1HePSa5KcICY9pIBsO66SwYiH5L
	Qrxd/DsJ+jULZWVcGm1CWxyMx0ec1yU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-66G5HzAUMEKqrp8Q4ZoZwQ-1; Wed, 21 Oct 2026 03:49:59 -0400
X-MC-Unique: 66G5HzAUMEKqrp8Q4ZoZwQ-1
X-Mimecast-MFC-AGG-ID: 66G5HzAUMEKqrp8Q4ZoZwQ_1792568998
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e00f3929bso1080090f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792568998; x=1793173798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8bDfpp7sAel4FSdNGE9WjbJ8LMrLDJQ/k3zaoUEgNSo=;
        b=BRQoEBNYKFpU8aToIoApwGJeaLTpKV1ju9zqRtxOrRTEDQ8lJ5Nj9xh1+N9Csd0J4K
         isq8sjuiYEvbLx/vqtlJphsyYUryg02eo65px7ME9Ki07YToVZb1m25jsv9U1hSbnh0w
         /vcWSvuf9iAyWvJUOIFVpuI76bi81MInhBDYrbigWTEFkMTbftUCLiv3boopFVXwgn4H
         1ftXrVx5KGqpurtAwD6bAaJzWh1AXWOJQUWwzRSS+MgEByRA83gQZYukurYosRMOCeTU
         S7e6cMXloqgWr0eMzzFF5Lt05CGVhMb19Rc+Myr0uJjd00or6yQNBZ1esie3zm+u1Vg3
         j1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568998; x=1793173798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bDfpp7sAel4FSdNGE9WjbJ8LMrLDJQ/k3zaoUEgNSo=;
        b=Sg9k4ROjslmk4wS2j/IRqon34din+PPiAsp55vtL2F+WeN9djQDlZMQcwYe3tqoAWi
         RPc3yCxHadb7GTVuLDpr1DsKacrv3W4Q+tHJWChR7+fMCQzLUU2xS7SVybQWvBcn2vd+
         pUQMQZV5YGrRgz0J70devT7qNutvAHATWEK9cA3bU0tcdSe/zwUpwQGaGHlcblfF5qPk
         u+p+mj5Ie7oTUmCvjpAnMKA7rbwEqvgODs2V2EHYxM/QuASLK8qwsmod3WP8U2vZIkhk
         69DvLNk1Xx6RkI9zuEyWoI43mfyW92c5uS4+6FHt52V+6dUNfMLwoJPNSW19mEexQyCD
         vNNA==
X-Gm-Message-State: AFq9FYLZhXtlLB1Keo32gW7mjb5yCcE/VDIcnpm6B0XA13DuXGY5zhnn
	k+ELvBU9LWoGchiEKIfwNqNfw2rpgRaGxudu/nUvcCWlKODTS2gCwuOUCHaC2Oxs1bg0ZIUasjG
	VST/z6mgfGWItu/XTXvJJMfE6IyGs7lNoou0Y72obNZ6JiaUkEJFuxxxdCU+sy6udZGy4LzGgTv
	K7UwGI5l8IVUhBIONkRAaom6V8I3JGoSd4MB/bNmwFTmA=
X-Gm-Gg: AYBFou2FrD9ORnLm5YfZCdIegMEcn5u4RKZypfNtr3h44H7V5Gfm/yW7dN36QHqPJcD
	mR2mx7F5Czxbbx/yLEekOcpIN2t/KFWRK4rRzcJFlX4LgpmNzLO2/vD1XiM6ta97yvK52KNNwn9
	OqwpHeQnTia+WZqJv3VGhvpdkqQ3xoOqMdQ/3yfSMIFg5AYPgIfdxkNs6FIO8bjlLdwmiLH4dqk
	B2a4ftM8iEr3WPpJkerW+8fIAvBtlPX4QdraXiKmfm4jukyb8SJIj6ZETQccfeZFSS4BmvNqR3r
	K2A/UVt5e8tjD3qmG8+P5EudIyruOJ2qm+UIZnvbA9ZsFQN4JqYsQsx5TbSy6bIQYQhjmA==
X-Received: by 2002:a05:600c:3f0d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1fdd29c19mr24760835e9.14.1792568998330;
        Wed, 21 Oct 2026 00:49:58 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1fdd29c19mr24759945e9.14.1792568997732;
        Wed, 21 Oct 2026 00:49:57 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1060f3sm34363505e9.1.2026.10.21.00.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:49:49 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:49:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Chris Arges <carges@cloudflare.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Subject: [PATCH net v4 2/7] um: vector: trim skbs before verifying the header
Message-ID: <26741a9a64c28e8de6d13e04972d296d89e1c95d.1792565282.git.mst@redhat.com>
References: <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

The vector receive path over-allocates the skb and only trims it
to the received length after the transport header is verified.

A follow up patch will complete the packet checksum in software within
virtio_net_hdr_to_skb so we need the packet trimmed (otherwise the
checksum would be computed incorrectly over the unreceived tail of the
buffer).

Trim first, so the import sees the packet as it was received.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 arch/um/drivers/vector_kern.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index 8a70b3a62553..1afbef78df72 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -865,6 +865,7 @@ static int vector_legacy_rx(struct vector_private *vp)
 
 	if (skb != NULL) {
 		if (pkt_len > vp->header_size) {
+			pskb_trim(skb, pkt_len - vp->rx_header_size);
 			if (vp->header_size > 0) {
 				header_check = vp->verify_header(
 					vp->header_rxbuffer, skb, vp);
@@ -879,7 +880,6 @@ static int vector_legacy_rx(struct vector_private *vp)
 					skb->ip_summed = CHECKSUM_UNNECESSARY;
 				}
 			}
-			pskb_trim(skb, pkt_len - vp->rx_header_size);
 			skb->protocol = eth_type_trans(skb, skb->dev);
 			vp->dev->stats.rx_bytes += skb->len;
 			vp->dev->stats.rx_packets++;
@@ -981,6 +981,8 @@ static int vector_mmsg_rx(struct vector_private *vp, int budget)
 	for (i = 0; i < packet_count; i++) {
 		skb = (*skbuff_vector);
 		if (mmsg_vector->msg_len > vp->header_size) {
+			pskb_trim(skb,
+				mmsg_vector->msg_len - vp->rx_header_size);
 			if (vp->header_size > 0) {
 				header_check = vp->verify_header(
 					mmsg_vector->msg_hdr.msg_iov->iov_base,
@@ -1005,8 +1007,6 @@ static int vector_mmsg_rx(struct vector_private *vp, int budget)
 					skb->ip_summed = CHECKSUM_UNNECESSARY;
 				}
 			}
-			pskb_trim(skb,
-				mmsg_vector->msg_len - vp->rx_header_size);
 			skb->protocol = eth_type_trans(skb, skb->dev);
 			/*
 			 * We do not need to lock on updating stats here
-- 
MST

