Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300021;
	b=4GpSHwFY01YtX/UdL9FgxQWhinsNiqBSxgTACXf1y0rQSxQqIqj5jWlLuRDsO41bDGo5
	 hevNmbUX//Ek073uXHGP+KCGeSLD54TTIDyvcQZd98qL/ifhgwypFwV82goePUG0gqP/A
	 D8kILXYIJ/86fGExXhMipJNYHN2RyULVBfjkfHbpabVVDk7t6E0vjePbVIZ/sVfCnJ8Ux
	 rN5eGeBakONtUMBe/OLE/ZYQ00cvwyQ3mEIJp26MNVjkmJgBfad7deqQpruJing4aJfEm
	 Br3WbbGYTofBCH9t0ftoIntRJRz8k3YT6jjm/NnpOSZMSQ4MPV/QbQtSRWCqsKbUHrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300021;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=YKSPCbeY/OQI++t0FoyUVDRUKnMhMVlO33rtvFKUKas=;
	b=5S05YZdwYf3g4mchGpypOMsLDzmux4usyZbUNDX3KmL7cRQPTlnAPGxcQ2lXzRgTv49s
	 w01ckiOqLduS4bnx66MTJ5YSUi96SSwjQxrWqVsjuiQX+PAUH4gC6p73xq/Dd6o3evBnz
	 alVmLhWa7sAUedrHaqKUlAoR352BgNlYI8o0UWqfOdr2YSaX5nxK9dpM1b3lolGCqTA6t
	 VR8FLzYLjOSQNg46DQRpN/u1MR4Rhgqgrz+vB5PF+mMd1zkyGB/3HLnl07oJOMi9ZM7Z4
	 Y6fddmefpbpgzZTEebtWSWteM/673NnZpSphLh7YuV700G7bCwZho7gVB8mnuFXPJ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YlJAnAkx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=CQhtA8ce;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C31460A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C31460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YlJAnAkx;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=CQhtA8ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793300020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YKSPCbeY/OQI++t0FoyUVDRUKnMhMVlO33rtvFKUKas=;
	b=YlJAnAkxwJ+kqnHGTw7OOfRmBCTLFLkHQwPwdUPLA13mvof1syA7Mox5Jr7a7RyOZRUn9o
	T4PEVcAuLnGWwfN6QKTg5fhJF491rZMaI6wQYTtj6BCq3xWPpkKYY66QyetjnJ5kpNoVEj
	EFzBO4EOnfI7m/4C+jsunLRzfphcRv8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-QF6dlv0ONl-IlFRgATwcKQ-1; Thu, 29 Oct 2026 14:53:33 -0400
X-MC-Unique: QF6dlv0ONl-IlFRgATwcKQ-1
X-Mimecast-MFC-AGG-ID: QF6dlv0ONl-IlFRgATwcKQ_1793300012
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so21018085e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793300012; x=1793904812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YKSPCbeY/OQI++t0FoyUVDRUKnMhMVlO33rtvFKUKas=;
        b=CQhtA8cenj9DFWldAvta+VRsknvyPr/fUKTX3B51t+uGSTSg78q5Ad69qyTHPvlvrF
         g7mhixHKbKK5jn+dCFRXWWGT/i4A67q6t92OFD9k3maCA9FBGucvjcfQYs/nPASU+Psw
         8g3ebobr4ShBlv7Gm7cBZdAtRbHILArFgH1Fgb/FgJ1jMOdDSfH294B+ekTn1P17Abtn
         YxI3key2ULpmZp32Yi4wrw1C6I8/ocUEKku+2RocVktmMXfCY1l/9fZ1xIX8kZ/4jJno
         uJ1OSEqFyvaOY8zy7wqUT7ke0TcNIF5agYdOgL7tlrdTG6OcJwVYY3/bnamBI22pwm5j
         icFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300012; x=1793904812;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKSPCbeY/OQI++t0FoyUVDRUKnMhMVlO33rtvFKUKas=;
        b=P0WCMf31Aiy3SLL8nG6/LsDIn3yJS0v+BLZFb7R62UCFG+JBPr2oyJw0HtqmG2wfAb
         u8c5CWI4F9JuDxQXAX6suebwCAhEFUui5V6OsElx4SaZ8bkEd8V07CUhJDrU20lyhAje
         iCaTfaev6XMbu+9Z6CKiaxKeG1NuzMLY1qll68OyJ4gXDD9HEbgR2E4+60of7P1jIOz8
         /NAwLJFojeqrKZca4J12cpQFxmaQ/d1aZzuWdh+FXOhVUhSeW2/bVhfUUr6PpCySfrlF
         J5xrUoCSMfqi1bZCU/GmU5VqXYRKj6/qtylWhfoqXq6I3N0btNCXgKR3jWDPwhHyOnoa
         1Pkw==
X-Gm-Message-State: AFq9FYI4DYEJf2RRwP2Fo38CBVZq+gg2gX9bIvZjUXykcBHaDjO0h+qG
	nEwS6+qRb0UCjCAxLqhL6V1zxOG4nypsBzjbNXBKT6llb0k/1l8WjCCWIw1W9Yq81D3ND02BjfH
	a4hiSWYwiOO5Oglp3hanqyT83O3M5TcbhLq4wYc5kZf2TZ3AWAzNuhXw1K5jpKzP+zJcCxlcJdH
	rwjlTenurSrtIbwFaXQPCOQU4GNN3BiocQL5A+oGU3M7o=
X-Gm-Gg: AYBFou3lZhHU7MQWn8fWReACSoov+lMCnSxBeRmO69meYXGrB4zwFS+mscWgeH8yUoZ
	Uq2as/T/yqs6pwR7R8cnad/dvRPn7KOqbHCypYKNBbzQiEL0gYNBqJVWHulXCD1H3An6O3ixlFP
	cK8DqZ7bSyYG7xDWcCTUACcm4edXkvdgLu/L4bCxoYvJbpMGEVX3GpuxAuYMtxnarWvJZz5Q3JL
	D6UyVawe1H2VoGyKF0EPhYgHEWO/F/hn1nDOS8wDb17GxObDpfCVblDrshfsaxzkdrdn9nkIwbW
	q+z2OmXMkPsoVD7bqfRV5tH0DM3xTIIjGgsWmkzlfO8O03sjQJEMLujnfJKFNCO79ejjPaxuub1
	3Vb36CGQ4REyD8/tlvH9PeKvi+JMQuRrOCz6AI9f+TIq6
X-Received: by 2002:a05:600c:1909:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a9675dc5cfmr142984745e9.28.1793300011647;
        Thu, 29 Oct 2026 11:53:31 -0700 (PDT)
X-Received: by 2002:a05:600c:1909:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a9675dc5cfmr142984155e9.28.1793300011057;
        Thu, 29 Oct 2026 11:53:31 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73c1:fd00:6c8e:5a61:f533:519d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b289f7sm4241265e9.5.2026.10.29.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:53:22 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:53:19 -0400
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
	Willem de Bruijn <willemb@google.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Subject: [PATCH RFC v7 2/5] um: vector: trim skbs before verifying the header
Message-ID: <d5a36cae5997d36ae6b4bb192a251194e61a8a2f.1793276116.git.mst@redhat.com>
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

The vector receive path over-allocates the skb and only trims it
to the received length after the transport header is verified.

A follow up patch will complete the packet checksum in software within
virtio_net_hdr_to_skb so we need the packet trimmed (otherwise the
checksum would be computed incorrectly over the unreceived tail of the
buffer).

Trim first, so the import sees the packet as it was received.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 arch/um/drivers/vector_kern.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index e902e78c5ff6..828bd61995b8 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -873,6 +873,7 @@ static int vector_legacy_rx(struct vector_private *vp)
 
 	if (skb != NULL) {
 		if (pkt_len > vp->header_size) {
+			pskb_trim(skb, pkt_len - vp->rx_header_size);
 			if (vp->header_size > 0) {
 				header_check = vp->verify_header(
 					vp->header_rxbuffer, skb, vp);
@@ -887,7 +888,6 @@ static int vector_legacy_rx(struct vector_private *vp)
 					skb->ip_summed = CHECKSUM_UNNECESSARY;
 				}
 			}
-			pskb_trim(skb, pkt_len - vp->rx_header_size);
 			skb->protocol = eth_type_trans(skb, skb->dev);
 			vp->dev->stats.rx_bytes += skb->len;
 			vp->dev->stats.rx_packets++;
@@ -989,6 +989,8 @@ static int vector_mmsg_rx(struct vector_private *vp, int budget)
 	for (i = 0; i < packet_count; i++) {
 		skb = (*skbuff_vector);
 		if (mmsg_vector->msg_len > vp->header_size) {
+			pskb_trim(skb,
+				mmsg_vector->msg_len - vp->rx_header_size);
 			if (vp->header_size > 0) {
 				header_check = vp->verify_header(
 					mmsg_vector->msg_hdr.msg_iov->iov_base,
@@ -1013,8 +1015,6 @@ static int vector_mmsg_rx(struct vector_private *vp, int budget)
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

