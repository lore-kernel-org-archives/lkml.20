Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300018;
	b=2OkCnHttRPQOgARCrCFnJ8VFX05GPhGAxzauiCEKdzEOO9SkppsavgOReIVgGdiwA4rT
	 GPfIUFEljDupq4J5XOZKTds+4H0HQ1Ml5R06a52Rr3NmBJT485ZPq0Eo9YXZz9OTpvYQk
	 BjHhX6YGqq8GN4JHPah2Le4luMpZXOhpG9y9eKuJp4qBGqKxQXgcXWm7XgwIpFcR9KYGF
	 sh6JykQp9L85hNnAiVWeTIxxOJzcXBQp/JvVFLWBwAd7Ra+uCbCrh3CJSNzIMCqhCCEPj
	 A3aA/PxbipBBZj6HtpC4k575ucAh9RxZNa7KyeiBoy8/ZroJd5kXjkQf3OqBOZPEo2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300018;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
	b=QSTnFkYW/3h6rs0nYU/T8zk08EXb3A1VsfMz+ypahicT/TkSBj/nXtuAyQ5nirlq9HKY
	 wMbwAED34RXqJWwGfsh1sFuurZXiPvcODrUTM6kWCtwt1gj8QdKYWg6WqgXZUvAkJ5nxc
	 j7x2q/NStP70D+3vTfkBg2NiJNyszVvBlmDCzl/eo10wBi9hpdcRe5Epu96u2uKDQyK8Z
	 tSdq9loa/6BwndJkNzylbwuRTvONK7oVQ2CNHvUwKMYmZANC3CsbIO/NU047B5IBVLqfH
	 j3/R2dEjpz2ZwjT78LdMWUL2eeIPZH//qSfoueXbdB0csfHYljucrKhKbemoSDdegrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CO3r6yuz;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tkMw10wp;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292B3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CO3r6yuz;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tkMw10wp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793300017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
	b=CO3r6yuzlv+e08TjKgtaxur04jZs7uZNq8t5ZjYw//6DW6cdr7dw+/SMJ0XyLvZCsIyw3u
	q335Kh02+azPuvZYVbqx7hqK0L11xEMWvUjtouDD5PcPjVsIUqox340neCvctzQwUYQkYY
	EZ9q2PtQq/7yoFib5UtCVS43qHbyqLY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-6JkGob5KMTiGfbisDjv6rg-1; Thu, 29 Oct 2026 14:53:36 -0400
X-MC-Unique: 6JkGob5KMTiGfbisDjv6rg-1
X-Mimecast-MFC-AGG-ID: 6JkGob5KMTiGfbisDjv6rg_1793300015
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e00f3929bso649546f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793300015; x=1793904815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
        b=tkMw10wpVbPgHYRYFq8YSQPkCgiZCFUOTbvcM+YXZ2yU99ZJ9zvJ6s3+vEybsGNBId
         a8B/t9IugEOEqAnwZsE6XH7DoSUQ9nI6v3GPJNCmyqlnN8ZZCQdUyTprKED89ZmTLSlE
         ps+Eob/Rew5pQMSbv8AeMEsgwGcFu8ylf5h10dlJsjIRR4vXLOh4TPFh7qluEla/YyXq
         /M2b1sC+4c5M0u2UnFuML4mVuc+cP1FDX2R6S+QInsajPFv9EgoBssmQrCmsEbdVv+dh
         0i4Hq4DLX6+D56ByIi3od3ifoxK875HpH2ys7UOU8uBTpkiMCWgL1RurDsfAJmiY7kxY
         1KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300015; x=1793904815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
        b=sj3YxtuMdRUmrJxFbrFRXDKiUD9MceY7BbILIT2J9dHr5eXWtJE1oW8OmQae2W286I
         BvPQeauEcQ8apZot0q/of4Jw7GvQanGzOR2MuxN39HfIquBc0mp3vUkDzZkhlmtOJb6k
         MZF3P2zbUlwChR0yMKKua0ELHOw4DGPrixnosTkCCRAkj9IJJSwcDvGRkPgw0lPsI+Fi
         syXnqMDD4J5oBXRu5QIWoQ7uBD0MbAGIJLOzw6EPxKhMZLyniZgEizU0jGLr6BgDnwPT
         ECl+6ZrW8kgd0KLJRsTHhg/X/rCIQW0KVeKFLCOzFoknUIYB2T4hv1nLSzJHBwYVRkPT
         mudA==
X-Gm-Message-State: AFq9FYJzhmOdTexVev/c7H+DHHqsBUZhlnDO8VCqyI2yeCMYLqC+1fGa
	6pvhNIoM9cx0sAtMT2lB9gT+ctDJlcLSCqiUFY2/5Wyxxsmfj8amXYA9RYeL48kM9h12//GdGXN
	4AorBfPFdyjtkVIXE8c/3WJLYfqCIUMrQR13fNBTp+AA7BamYgrwGTuZEITbdOn1uSXNanzy2E3
	JL39plqNZl2I3b4nVZ87+k417Nxa++YEP1iqLJqrjBmX4=
X-Gm-Gg: AYBFou1+Ee4Hd4Z2c29hYbAZ9MasGzHHjGZ1AGGdw9J/w6Zgtg72qsFRIogAej5SGCP
	CP8fg17okrb5xkYdyJbEDtEiVHpf+i3gMikrU8HAHUza3u8v+WSwajCBcC0KKRp+GAchddXIwF+
	wqITSXmCu0Kbd4kKeP1MHuwJ7zo0f7g4G47YAfamwOIgm/ZPqUmAVZtnsjtojuBg/3SwD+AmeLX
	N6KJRaTxT8qvAd6dpgf9pfTV7RQ8kco8UlZ2jo/btQFXs/P9UTkXqBXZyN6frys/6yv6Vgbs0+1
	vuCRLRuV2WATBEVVQmznnXv8TkZmtvSOKcjQd+66o+3FefgiRZfyqqoOQW/yMJQCqq9ngfojex3
	ylc5U4sEQxkCA7vYOd5ukXxGoMgB+jnf2mL4f0P5iYfCx
X-Received: by 2002:a05:600c:a301:b0:4a3:5d64:e063 with SMTP id 5b1f17b1804b1-4aa8a7ac897mr77300235e9.9.1793300014680;
        Thu, 29 Oct 2026 11:53:34 -0700 (PDT)
X-Received: by 2002:a05:600c:a301:b0:4a3:5d64:e063 with SMTP id 5b1f17b1804b1-4aa8a7ac897mr77299645e9.9.1793300014037;
        Thu, 29 Oct 2026 11:53:34 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73c1:fd00:6c8e:5a61:f533:519d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb75bd4sm222321f8f.10.2026.10.29.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:53:33 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:53:31 -0400
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
Subject: [PATCH RFC v7 3/5] virtio_net: parse tunnel csum_start little-endian
Message-ID: <0817358e459a9056af2055a8e2f466c4807ac83b.1793276116.git.mst@redhat.com>
References: <cover.1793276116.git.mst@redhat.com>
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
In-Reply-To: <cover.1793276116.git.mst@redhat.com>
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

