Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203512;
	b=gFzQIAO4HP2z4Xa0uqtopH99WVuvZ6fS8osGvKP9nAQqRJsd2+u3XGJ5nbWRUR0Yy1Of
	 gQuk0Py5mObvihNYVdVuOGJT8z5IESWvjx4A3jO8D/TSEzowZKmY5QHC+3UgIpCgFfM0o
	 H9PKgJucmWCtIknNfQNGWSK21AofsrrdNDd2XDlmszT9O6UcZYY1716HPwbF/YMGXZpft
	 IV5zIneGzX3Ar/O3EFgfAPRiSGLvolNHuaVSLccp0d/rFvMxqWnNigAlZl1wYICv6vxdk
	 e1ASmn3ZgdUxC7kJ2axQXyWWEKhOjtWXha2Uo5emyXnt71bTlQRSFbSUNTqvFZyf5Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203512;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YtfKJ5smTPEd7Q0Qixx+mEQWcN1MH560AR84LPRGl7g=;
	b=Ib+AgZ7kt0+7iWADC9MdebcCTstpRh2hGDwg7YKdibbc1Gh4vaDok22AVioWBubbsy+c
	 wXRvRfwtqlYDKYzmaLFKLXTxcfGlalCx75SKwRRTGYabHtfuu16xr0Rlii6pqlEkDYj3b
	 O9eBbQjL4oMFndnRed8ij4kIX75Dl6q6RTQmLL2cwAoWleLv8RURcGmQcebxhKdRCUiCC
	 ii02vtu6SGbRXnl6SdoDesZGecypNwiiGxmWpBpkhbHz81e0x2OncXb174Ckc3hT/2kC0
	 kYpKgaUpEKWKopXeuxy8tUlvu4Elfr/08wPapVI0PIwAw7NMdIoL7mr02xEfHhuKRNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TGS5ubzZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=N+Tvm0zI;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F9B60A260D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65F9B60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TGS5ubzZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=N+Tvm0zI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793203510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtfKJ5smTPEd7Q0Qixx+mEQWcN1MH560AR84LPRGl7g=;
	b=TGS5ubzZereOfk5hEh+NIrKWDeXEyYivtv6vkHHJMDOwyf+a+O7+QnuJBVNEMl4OepcDq3
	sRP5Lj0+zoM5qyq9MStVzo4qowB9yNwinRRgzpHeMqpi3nWAUIStIroSfjLIZgSK7HIqqr
	0af5miaHdJdykKY9afncVq+H4TL6jek=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-TlGhFeuTPZWjNs0J1aYLJw-1; Wed, 28 Oct 2026 12:05:09 -0400
X-MC-Unique: TlGhFeuTPZWjNs0J1aYLJw-1
X-Mimecast-MFC-AGG-ID: TlGhFeuTPZWjNs0J1aYLJw_1793203508
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso10733405e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793203508; x=1793808308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtfKJ5smTPEd7Q0Qixx+mEQWcN1MH560AR84LPRGl7g=;
        b=N+Tvm0zIYeviAXZCwqVKBH+To14HcH6IsH0j1tbSwybyZJjz8JYfLIfn6jV63Fbgx4
         O/+0BEkMBhG3bGVCw5ACEss3a64DFyAYiwMGPWRoMOEgZoQQ0yBdVyTQ0R8SceHMs374
         8FcGb4/RXi1e1XAkaqqgviQ5OBZajIGpxVsBfXzf//+E81iX5gqHrmKSmFFVbuIjk3Bw
         cOTFWgj/U/qIKVA+uEcgHYiaZZdYcMgYa7qaqqjgkTxgE1FR+XBN3URsu7j+RKZLBHnU
         jfPYF4W1siP46fkxZSYqHVWgsdh9Hip2uL9ybUr0cnm7RfJfyYsPC0tOxhYFJWpF19B/
         uhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203508; x=1793808308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtfKJ5smTPEd7Q0Qixx+mEQWcN1MH560AR84LPRGl7g=;
        b=asm1XOVCbNKrTAjcHWTWIN1xLQQEyR/952lWrTlsCaQHP2m+kSqE0xs/H++/L5JXyB
         alaHKmsMjv37rKwvQu2L0otgT8rmqm7mG4v+pAw5wvc+oyrN/lQF31y9ZfkEh4n75rXY
         tPBozBTxEUixsVWCV8DwvPdLd9oxZVPgt9rPhSKEzyBEc+uHy50OFWyNmmGrXH0VJ8Aj
         F4M9oyJ+Y+DOdaEJLogrMnayw5SaFr0+GFU7v6ap9OlpBugAF27yD5DCmOwAc18ZG10x
         TY4CXnU2dY997xOt1lA1/4cptBfflCaCYk3r6CcNCT2AiPTexxOmErOi3V+sqitGvcUA
         aMIw==
X-Forwarded-Encrypted: i=1; AKwUvBzrQloG3b47TDJARhMAIC29XNxeTiDTVZtvMq9vVKpwkil6/mFuUl8WdeWb9qKX3lspXiPDyPJeLQEckUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWqrnAhkEUADZtrxFgsyRQpiorYrNmOA+ysDDRmFSkuTPNmo1G
	auXu3HqqEBQOj+7POUQ4i/plfI/jMLZJC1fLUEOy+5ssHvecgks5abLrjs8KZ7J7u278hn7PGr9
	Dmxh39IgB5gvVS/N6DaDGuxLBxw6AW82OUybjcVpxexVq6ooClBSkGgRiBcHTmGh9wA==
X-Gm-Gg: AYBFou13/huQUg3EPxPC8CCbnjhGuyyI3rNVapPa914dA0xPa85wckaVbGiDXWZDxLS
	t4PN0Um57tFkbHtaqk4Tiw9S4DS8Pa8HdC2TuWpHTBTjzNktXaz2ykIWXWKLsmMNR2kWyHFl8+C
	TFKIR0QbgDycGazZhbxNzbCT05u2+v2HzRsE/UkXO7riuA2hgbp5WuUcMj5XzY3+WKrijZmIt2h
	LHm/nJmh6fUyGtB2pNk2gnU0ZG+un9Np8ZEplLcelF194RLWT9UYlfEedxSXoDV8nvwVVanb+N4
	VybRk0FNhf5CGtPG8KBZRcDnRZFpej1xM6V+C4ZBw578omg/enenvGx8gwcA5/wahRyT7AEQJpm
	smb6F0l9Xyu/WppTPmPK/4oc5ZvzIvkrQY5ZVRlTa5cAVeqIFDmi/QgjSf/Ip32TWRgHReW4Vrf
	OUWJ42OSfwU4I=
X-Received: by 2002:a05:600c:609b:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4a965ec941cmr60523305e9.7.1793203507940;
        Wed, 28 Oct 2026 09:05:07 -0700 (PDT)
X-Received: by 2002:a05:600c:609b:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4a965ec941cmr60522705e9.7.1793203507543;
        Wed, 28 Oct 2026 09:05:07 -0700 (PDT)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd47basm31898410f8f.32.2026.10.28.09.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:05:06 -0700 (PDT)
From: Sergio Lopez <slp@redhat.com>
Date: Wed, 28 Oct 2026 17:04:36 +0100
Subject: [PATCH RFC 7/8] vsock: preserve host-to-guest datagram boundaries
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-vsock-dgram-support-v1-7-e457cf7cee78@sinrega.org>
References: <20261028-vsock-dgram-support-v1-0-e457cf7cee78@sinrega.org>
In-Reply-To: <20261028-vsock-dgram-support-v1-0-e457cf7cee78@sinrega.org>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3900; i=slp@sinrega.org;
 h=from:subject:message-id; bh=4yF4YwYXhJyfqFVguB7oywq9sCkoPH4reQEwysg7Bog=;
 b=owEBbQKS/ZANAwAKAfRpJ40vDAI1AcsmYgBq4h0gVCYKpVa4qPhSd89rumb1XTU9cHiort5EO
 b5NigxxS0mJAjMEAAEKAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCauIdIAAKCRD0aSeNLwwC
 Nd8GD/9iQKzHn/RNxoXN9++58trhcsjD8zFM6qH1MRysGP+vUuYHoymb8Jlgn5oXMXdT7oNfsQn
 N9da3iLDU7hW84aCAqHbIbOTRcnvSh4+j5C2IVqlVP/5CpN368oBFv7BJzys3Okfr6lLYTyAS+Y
 6p4fFyH0UGCrmH0YV+3O896oIUW+nNAyM6xzyX9M/5tmLaWkgYvzgFRt7hzkrdLwOoaK2BG9xs/
 4e4iWDYwANnecgR1nq+EpQcmyepFjSmZnJ4R7c672g/Cw20wAlP9siTTvmVHL0l3b9Is6OAIZUo
 gc7TPuXwJq5fKKT38TrYqzK2xD+NN/Mq/LRx0GeDhTY3oIaUGIteRWk9R3cil00JX+a4zeDUXL8
 PtRueKQpb+81iaSNzxYNpampoO1D+SvPXVyVdqned4jpw66fhKcOPBQVupPYCxYq2o1/jIavoVG
 x5wTlE2rbCnN6lprqFIb+4OfSDJJwldrsnKC/i7MIg6QI4C7HobEhKyYPdNQK7L/ZQudXKPSB7o
 ObBlIJat7uzbXqBktXH/VcX4/tE+0ccR4XNA3455FrDtxxvGkz6pGSuZwYC+HaMCKHpt8CYaAha
 KakRTglFxJ1PA0yp8LaXhdypyvRmNzZo8W1d7Alb9UK0jzPTjKp/9h5eMBgwIrlk/3ZPF+W0t/l
 Mer1DyJvIPMsbdA==
X-Developer-Key: i=slp@sinrega.org; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

Vhost splits large datagrams across guest RX buffers, delivering each
fragment as a separate message. Allocate full-size RX buffers with
page fragments when datagrams are negotiated, and drop whole datagrams
if a guest buffer is too small. Refill empty RX queues even when only
one full-size buffer fits in the ring.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/vhost/vsock.c            |  8 ++++++++
 net/vmw_vsock/virtio_transport.c | 28 +++++++++++++++++++---------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index 79ffdb28f4d9..2294ed8d30a8 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -185,6 +185,14 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
 		 * buffer, we split it using multiple buffers.
 		 */
 		if (payload_len > iov_len - sizeof(*hdr)) {
+			/* Datagrams must fit in a single descriptor chain. */
+			if (le16_to_cpu(hdr->type) == VIRTIO_VSOCK_TYPE_DGRAM) {
+				kfree_skb(skb);
+				vhost_add_used(vq, head, 0);
+				added = true;
+				continue;
+			}
+
 			payload_len = iov_len - sizeof(*hdr);
 
 			/* As we are copying pieces of large packet's buffer to
diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index 14ce0836bc39..d256274088b3 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -54,6 +54,7 @@ struct virtio_vsock {
 	bool rx_run;
 	int rx_buf_nr;
 	int rx_buf_max_nr;
+	struct scatterlist in_bufs[MAX_SKB_FRAGS + 1];
 
 	u32 guest_cid;
 	bool seqpacket_allow;
@@ -312,22 +313,31 @@ virtio_transport_cancel_pkt(struct vsock_sock *vsk)
 static void virtio_vsock_rx_fill(struct virtio_vsock *vsock)
 {
 	int total_len = VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE;
-	struct scatterlist pkt, *p;
 	struct virtqueue *vq;
 	struct sk_buff *skb;
 	int ret;
 
 	vq = vsock->vqs[VSOCK_VQ_RX];
+	/* A datagram must fit in one RX buffer, including its header. */
+	if (vsock->dgram_allow)
+		total_len = VIRTIO_VSOCK_SKB_HEADROOM +
+			    VIRTIO_VSOCK_MAX_PKT_BUF_SIZE;
 
 	do {
-		skb = virtio_vsock_alloc_linear_skb(total_len, GFP_KERNEL);
+		skb = virtio_vsock_alloc_skb(total_len, GFP_KERNEL);
 		if (!skb)
 			break;
 
 		memset(skb->head, 0, VIRTIO_VSOCK_SKB_HEADROOM);
-		sg_init_one(&pkt, virtio_vsock_hdr(skb), total_len);
-		p = &pkt;
-		ret = virtqueue_add_sgs(vq, &p, 0, 1, skb, GFP_KERNEL);
+		/* Post the header and the entire payload as one RX buffer. */
+		virtio_vsock_skb_put(skb, total_len - VIRTIO_VSOCK_SKB_HEADROOM);
+		skb_push(skb, VIRTIO_VSOCK_SKB_HEADROOM);
+		sg_init_table(vsock->in_bufs, ARRAY_SIZE(vsock->in_bufs));
+		ret = skb_to_sgvec(skb, vsock->in_bufs, 0, total_len);
+		skb_pull(skb, VIRTIO_VSOCK_SKB_HEADROOM);
+		if (ret >= 0)
+			ret = virtqueue_add_inbuf(vq, vsock->in_bufs, ret, skb,
+						  GFP_KERNEL);
 		if (ret < 0) {
 			kfree_skb(skb);
 			break;
@@ -698,7 +708,7 @@ static void virtio_transport_rx_work(struct work_struct *work)
 
 			/* Drop short/long packets */
 			if (unlikely(len < sizeof(*hdr) ||
-				     len > virtio_vsock_skb_len(skb))) {
+				     len > sizeof(*hdr) + skb->len)) {
 				kfree_skb(skb);
 				continue;
 			}
@@ -710,8 +720,7 @@ static void virtio_transport_rx_work(struct work_struct *work)
 				continue;
 			}
 
-			if (payload_len)
-				virtio_vsock_skb_put(skb, payload_len);
+			pskb_trim_unique(skb, payload_len);
 
 			virtio_transport_deliver_tap_pkt(skb);
 
@@ -723,7 +732,8 @@ static void virtio_transport_rx_work(struct work_struct *work)
 	} while (!virtqueue_enable_cb(vq));
 
 out:
-	if (vsock->rx_buf_nr < vsock->rx_buf_max_nr / 2)
+	if (!vsock->rx_buf_nr ||
+	    vsock->rx_buf_nr < vsock->rx_buf_max_nr / 2)
 		virtio_vsock_rx_fill(vsock);
 out_nofill:
 	mutex_unlock(&vsock->rx_lock);

-- 
2.56.0

