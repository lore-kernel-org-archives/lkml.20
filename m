Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA151EE0F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068100; cv=none; b=thVUdt8OGLjRJB+7kW2jFhhI0kxmELrTcFlsuLoXelE+FUnToWJhciYXOez055xxXJO6yIiD1qShBx5dt1r1i4XDZpMg2/it2np8Zdkqs2mYvtbr1kMSdkN3J3UoSh5SRM8Dtvz1iWh/lB869XCQA90ztQwMKMxMxoIs5TPWj6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068100; c=relaxed/simple;
	bh=IwhLYmjLCPlF0e5s5GUMXm2Cd+FkpD1UwImr2LvvCHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHHnEOkVYrdDPsiDD9u2CNgV6zZZ0wUzsR/zO+pQZsVuKlMqvpCVwy2Mn+SO/ywrIFWOgtP2pvfNzqLzubVY+GnmdNlF836j+J0P002H24zYAF+e1RqG/sb2DACcFFo8Y8XJrT1UHUZ8BO1gBbjJxtrk/2/i+HrmqrEpmw6M0dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cdwinpGg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hNSMnl7u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cdwinpGg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hNSMnl7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792068098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/qcGh/+2dqUoiHJpUXvQbolm141eVal40N7yCBeiObo=;
	b=cdwinpGgKCUZUoUbV+nV4RUa1XXx8hjDVtGlKZx5qdtEwLuw1ZRV1oPEQbpy8s5z9NU7D3
	Z8sO0a1h+ic6hnv6L8MXfk1IcucnfU9WNxFDoLY9Ls7SCHt6gBOFAO70jajj//n0Pegv8c
	3PfsuwPR67CHx91hdLol0S4nZ8D9H/E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-A47bSyKBNgeZfBJXN9jWdQ-1; Thu, 15 Oct 2026 12:41:36 +0000
X-MC-Unique: A47bSyKBNgeZfBJXN9jWdQ-1
X-Mimecast-MFC-AGG-ID: A47bSyKBNgeZfBJXN9jWdQ_1792068096
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48df02e6b40so921767f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792068095; x=1792672895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qcGh/+2dqUoiHJpUXvQbolm141eVal40N7yCBeiObo=;
        b=hNSMnl7uNOSqrGBFYU3QwFUu3hkZRxdkEwz8bcqeZJS+UpKv4IkVG2RPRTXcGBlLgd
         bo/+OLmda8fGCIdIS9v6GQQr4lL/4yQCpiuoEUaTjw7G+gBR3er40h+XmQzYB0ZxEiHn
         eDXZoEuZ+cPdxqSI0WFbfEA87C1XuZQ4RgF92sLTgV1Wy+GvWL3yJOcD2chN6AEl8G5U
         lC5V2tV1eptqYcUK3qQkbUp8Vdk6VQhGLMg2XUiT5IIr6kF2JEcQIQvBi03MlSl5kW72
         vnhS0o7vdYPnzKR61LJw0yfgPD8MwqeZWNxsHqEGVEsz1f+/spe/8ewaFLTOyuYQsr6/
         OikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068095; x=1792672895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qcGh/+2dqUoiHJpUXvQbolm141eVal40N7yCBeiObo=;
        b=ApqhypUi1t+6kw+N1BOFgi6wUbwqYOaUj+FQrM4LkF99QWsSbsD95ouWWZucrY/DEg
         q88sUTZ5C6iqJj0pB4gmYh1jCHD+FzYzm6Z4Sn8x0ih2PbzpNZVdRVVa7Rv031O/C77A
         QIuCWQ4H8j55SmuRiVygfExyFtNySzEZ1dXiR/PGMiyeYHa9IB6f4UP9NdkzFoK3RPQW
         k385RGuARoraPZ23FEes9mFBio/JdONwXdQHXqkCkqevmnRFrKRGUTrOWfKydrXN0g9N
         5w1jdVTkRGqXG4c59Z/nes7Rvf7q7ZAgH9ryWOC8K5rjPtj/vMzuhU9W8sInMXdXnRdd
         yizg==
X-Gm-Message-State: AFq9FYLb5njJqQHT2+WB0joL9iUDTSez51ATKkrDWlVOV2UZttJnDQSQ
	6nbmclfRyK1aJRT2u7zk16YCjRW5at2yzhRl/QKEum7wYWDGwdThpDdzGkV0urnkJXHYKnVKDTw
	uH3rAfvwINrRaWK8yViZvqYDP8q1jL9++QAQyiUpSK7JDovIbWyh9NX8Glt1GQL7A8+ajwXafId
	U9lkiUSd3LaiY8jjXctr5NpNZlJqzQvWwu7XZ6EwyYhqs=
X-Gm-Gg: AYBFou24FwS/BnTJrqqohDskA6j9XJAcMzEgIhN+nnrONiE+cmunsfByamfzOks3U1S
	NjX7D3zm9tUd1QAPguWE4C7KydVlENb4Ahtm6FdKkRR2zJgBgHDMCVM/oE5B4IstjJ81YvBfosO
	VfG7YYF6e3UjMKe4snX8yDDBIDjogTTgAqu1koa2t/1gU8ZnwUDruzMWmehlBlcYqToYog/I4FG
	3lnhu5mPM4aIMXbKRupfvyEa0tCO5BZSdSLNDOICN8snYsu1ZmNQdgORYhvxVO7n4EhtVffbNyp
	V2AlOTt5wfp/bpyim6pEzPMDDtGJZb18pIWcVD65IMOOrv05Y/ieevdAP1FVEHvwDKUtBw==
X-Received: by 2002:a05:6000:468a:b0:48d:c162:571a with SMTP id ffacd0b85a97d-48dc1625761mr21924087f8f.4.1792068095523;
        Thu, 15 Oct 2026 05:41:35 -0700 (PDT)
X-Received: by 2002:a05:6000:468a:b0:48d:c162:571a with SMTP id ffacd0b85a97d-48dc1625761mr21924037f8f.4.1792068094949;
        Thu, 15 Oct 2026 05:41:34 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48defca4013sm8758247f8f.9.2026.10.15.05.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:41:27 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:41:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Subject: [PATCH net-next v2 3/7] um: vector: trim skbs before verifying the
 header
Message-ID: <d9ac3420f95c5953227d80c71ebc3cd7e3c5fd9c.1792067836.git.mst@redhat.com>
References: <cover.1792067836.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1792067836.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

The vector receive path over-allocates the skb and only trims it
to the received length after the transport header is verified.

A follow up patch will complete the packet checksum in software within
virtio_net_hdr_to_skb so we need the packet trimmed (otherwise the
checksum would be computed incorrectly over the unreceived tail of the
buffer).

Trim first, so the import sees the packet as it was received.

Assisted-by: LLM
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

