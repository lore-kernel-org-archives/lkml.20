Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768183;
	b=DXvcP23P26Wp3S51YW1xM0ZQz5YHRhDbLfyqJmXl19iV0/sFRb4dQg/sBZOVbFzkVZVP
	 xXmPBHdX5seLFoJWvO+0glBsFF3v+9QeZfn3+OrEytlHIphSvyxO/LM2m20KCylx8EHAg
	 ovMRV8kSL4cludhj8WVRgLzEmt7JQmGlpdr1WYF3+yBXJCf3kUwaqkwgU7Wvj3JpIao6K
	 uwoWiMbdA9UYVIYB8yy+4YH1P1zDm3Ft6muX9gROeAiHaA0Xzve6joTCsFaLzrHMIDibS
	 84qf51bVt5aQHorPVSxcwc/j7xRgLVb4JPF59Fih/K6SZ9S/BGqQl0Tm7JUQpDtG+vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768183;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
	b=GHnyhwZdRPBdMho0sZQJWzkjN6e9/ubhQnIEa2EHFeut+QHuNMBc75KDYrDTFevEvvL5
	 6G4w4lfU6oetMxhalFhB50eudBwkacz7I992Fw+kB9qtFolTucbPDYvlXSGNr9pUAOf6b
	 Z3kCwDj/UojD16XxyumSu0h9AY7PtFrEPJIfw9wyS8ozIYfKrJ0bfkBCDEVYsfDx7PZB9
	 ijRfM0Ij839rZuTlJDz8BOTrcNx7S73g7hVH3/g2AETRy56oF/BH552ulMSGkVKMEFT2a
	 o+wwDgEOEatBxsYwjSqrJta7Wg35hw9Ql9u5qsDDByL8EPwgueFCZsuuSmcTfBhWSGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XY6f6aHk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FGR7K1hh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE98160A260A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE98160A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XY6f6aHk;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FGR7K1hh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792768181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
	b=XY6f6aHkeA9N6HGwv9DaMkIEv/SdDj/qEk8zhiTbanILVoCzWpgyemgnPRi11qTPX0X8b5
	1qXqwutAZk7Bbdb5Mu9OzNGlTkrAGGdbUgygLO8ICaaB48xqXjlWooJHRKzJ8qNNXi0Anu
	IoieuriFRk4ujmhJ1Ez4re1T2BkDTIY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-YDS62-xSMniLW-vg-g1LOQ-1; Fri, 23 Oct 2026 11:09:39 -0400
X-MC-Unique: YDS62-xSMniLW-vg-g1LOQ-1
X-Mimecast-MFC-AGG-ID: YDS62-xSMniLW-vg-g1LOQ_1792768178
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e00f3929bso1441656f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792768178; x=1793372978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
        b=FGR7K1hhqDwfWdw1XOiNYypgy5PLwSUIzqlabeV2ydOVxzOyYpxe33Qaq0ppnuNaF5
         I/Wv1A6RVOwYNLYXx7f01zj5/5Fd/uRBqDgSxWELqrQVycQBKmS1JwGBgCAGo6yQvgkA
         WsANXIgkWNH49H2KG4TYw6bV6JNaPZNvIItKBE7luXo4e2KySrrpsL+STQClza45zWvM
         kJDpkF5McSprEnc0pareOKh/q1TSgkSYVeCygFHLVuAmackUCCSC8izlTUxBQ2oFebEe
         zoJQttxFo7bhBilw4jGrhwYDemCS/R/Ac6YpPsezRJ5SeCuMyjM9piRthWVuqeoJ0NWo
         6xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768178; x=1793372978;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
        b=sVlzhRcaY7gbpJna7PVC6IAZVN5VwGx5VBsu3R19p5F7cm1tP0v226z6I7fWLJACxg
         iO9tAN2WVpO5YZyCwxdvM/jtS0hBiIvS25MYj2w5zIkytvwVMI+H5+3hrwcn4ecumdrV
         kC4JpqZd6DIWiRyi4EHs5e/PSHNGY/f2VQaqTOHYgVUTjipW44Rqx9m95G5bmQd9hBqz
         wyf66g6mAB6fIf/CqkdlvF55t+x0uZ/O/LJhEynfIkJpy95ddyG2t84Y+FeV2Nco0GD+
         HWZ31+OZLomBa5dFIj6m2MQZVetP2Lmda8qRpirJTyCUOX+5khwjGTM8hB+gD8CrgpkB
         w5Pw==
X-Gm-Message-State: AFq9FYKD9KuJsGtma2XCsdOw0CIadvLEVEfHDfdeEUhGQAUGk4cfGbyu
	47IXfVxA4QZBZMtjqOSaycEIXPV1ArLovQX9zOtmzH0KxElrjGeAG1tctluEesBlqif689wHuc8
	lOQpu5EQKyACQ0WnipDKamhXyaYYFtRaiRjlOEmya5Kbme3BbpmizHW6ATRvNrkzWRnEMeUGPO4
	Fan/8Ud2HuIuyrc5t+z0VKtc3Dahbd+dDDrS3kXj6Gmxs=
X-Gm-Gg: AYBFou04DACmXdtyWmMwFwCqS3GBp571m7xL7jnA6vloyI6hXq7g6YnuxgKEMiQeTWC
	5wFxBoTaRJ9ed+ykrHFnbhSZzIkHi96SjEhvnw6h11exdE4956LFWsOgM/9kIItC0OA9MdYHWGm
	rTC0xLstG8FkTDgF53qzN8PQwxDtvcpAKoOwJedkMQYyGugi6iOCt2ciATc9NU07vgCZAmW5H++
	2VfGsGuHgsaGe1nDG2fH02ReGPFy/Zsf0IpBmHbfo9RjN5M34mGKg6h795Ow1iNRBM1H6bqeVSY
	V+pvMIUq8hPaqhUq0xNRr4vr1ZduPNNHTuZYXSn5QrZwFvVPYl3XJFTu8cBI+vsfxXeE1A0=
X-Received: by 2002:a5d:64c3:0:b0:48d:faa4:af9a with SMTP id ffacd0b85a97d-48e385937f2mr4148545f8f.9.1792768178118;
        Fri, 23 Oct 2026 08:09:38 -0700 (PDT)
X-Received: by 2002:a5d:64c3:0:b0:48d:faa4:af9a with SMTP id ffacd0b85a97d-48e385937f2mr4148486f8f.9.1792768177564;
        Fri, 23 Oct 2026 08:09:37 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d408f15sm343026f8f.33.2026.10.23.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:36 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:09:34 -0400
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
	Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH net v6 3/5] virtio_net: parse tunnel csum_start little-endian
Message-ID: <ac2b7e8b635da611f7f2bb0b42436a8155edc7ed.1792768096.git.mst@redhat.com>
References: <cover.1792768096.git.mst@redhat.com>
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
In-Reply-To: <cover.1792768096.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

All tunnel related virtio features are > 32, so none of this
functionality can be enabled on legacy mixed-endian device.

Accordingly, all tunnel header fields, csum_start included, are
little-endian.

The nested virtio net header import parses csum_start that way, but the
inner transport offset is parsed with the endianness specified by the
interface.

If tun is misconfigured to legacy big-endian mode while the tunnel
features are enabled, the two parses of this field disagree, and the
value stored in skb->inner_transport_header - which is only
bounds-checked from below - can point past the end of the packet, where
GSO segmentation later dereferences it.

To fix, parse the field little-endian in both places.

Fixes: a2fb4bc4e2a6 ("net: implement virtio helpers to handle UDP GSO tunneling.")
Cc: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/virtio_net.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
index d6466f96cdd0..013c6c7e2dea 100644
--- a/include/linux/virtio_net.h
+++ b/include/linux/virtio_net.h
@@ -324,7 +324,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
 	inner_l3min = virtio_l3min(inner_isv6);
 	outer_l3min = ETH_HLEN + virtio_l3min(outer_isv6);
 
-	inner_th = __virtio16_to_cpu(little_endian, hdr->csum_start);
+	inner_th = __virtio16_to_cpu(true, hdr->csum_start);
 	inner_nh = le16_to_cpu(vhdr->inner_nh_offset);
 	outer_th = le16_to_cpu(vhdr->outer_th_offset);
 	if (outer_th < outer_l3min ||
-- 
MST

