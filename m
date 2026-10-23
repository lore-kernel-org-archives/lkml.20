Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768191;
	b=huP5jjq+vfx7s0pdJi3j92pQU8AGvnJkL68rBe285bzMM2djqQfFULPa5UvtTzyxVlPb
	 Ph4ZcsaZNOusSHRA+jvGv9K2wcoZxVaVRHFiTvDeUoQzsCxK0l7FRiHTd0urSd4JvP78/
	 wVa20U9ZZLNz/ekxtCQKtWr3nWqQ/fei2VziTfToACvd2QWPIH5JQXyhO7CGmcfoXiIg6
	 vBaJFg9erzNg4ak2r1TsOAzisMZi/+CENxYKSZZdtM4SVRUXwodm9PaO9hh0snO1WXNz0
	 d3OXajeltpAh0HpBQiyJMzf5966q2yXL53emc6E1qEpipvGypPPwdtU3A7dQAisRJXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768191;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=tgpP8ntgb1IS0cEJ3QYg5i8QakFDo2yC2w4u+PGohBk=;
	b=N9l7K0uQ+2i+9S0UX0tXZERNCoqFxVUy0AayIUrp2P4GNZjXEz8FlLP06Y6lQ2CWBwY2
	 N0H6zY3x05hhOqR+YZmh59qpHe+SosXOJUcZDV5QZ47uOYrCwbmCpCiGy3eXPWRTpGkF+
	 Cr28B42Frwlc6u5p4xdYavZlaNTPQue6+y5y602G+4r8y0qj9DcS5vAQBq1EinL8olF/x
	 FNz6i2Nk1HxBt2QVCRYBqMEyhzwfP7tE70DZpj66OyWicaRLNQhUjWbUWQrY2Xm5pY5aQ
	 2sAeUM6debf8GEPGFfqV2MQ4HD2dAZjrvPpPQFrsyvg73lsNEyjCiXdf+A4E7lP04Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="PLV/HGc/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ftPMqzyS;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF47606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF47606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLV/HGc/;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ftPMqzyS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792768177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgpP8ntgb1IS0cEJ3QYg5i8QakFDo2yC2w4u+PGohBk=;
	b=PLV/HGc/y0rLo7xsMH3w65aZtwNrlZK4QBbeq49ry9pLeASFAaPuprCgZOf66aKiVXSdLb
	riy/jtRtWxXIETXk2OeyiCmjuyql6DvES9Pt8FkxaQ35DOSPRByU9v2pXuA0ZUO7jraFsA
	MUREaohp9blCWC0GwteBzXyDgYJZbRo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-YHUvennDMJeC5d2NwHB7FA-1; Fri, 23 Oct 2026 11:09:36 -0400
X-MC-Unique: YHUvennDMJeC5d2NwHB7FA-1
X-Mimecast-MFC-AGG-ID: YHUvennDMJeC5d2NwHB7FA_1792768175
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso651583f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792768175; x=1793372975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tgpP8ntgb1IS0cEJ3QYg5i8QakFDo2yC2w4u+PGohBk=;
        b=ftPMqzySDw4nPGyHuzAqxupTAz9ssGKvfIFE4OADodvZ8rkYVkQZ9KqZ7feG+jVScP
         iscr83gUJk6/D3POTfpJBksURLfGHrnLNJpiuEtXGL7iFymEuRu5PeOABJGF7U+oLqQ3
         EpB81FHtumPOrb622NZdBhESBEZClZZj1Cs/gaKPyewE+m5H7ZNMMbVe1H4oLs1/Ejda
         lB1yWJgu4IhF1590b/R20RKif9Qk/Z0MCij0N0wffSsNeB1U3Edn5CGa5v6grw55lbJW
         M7lexB+h4OAlRHcKfRvAfap/SVoZ3gZMCrwUDuyVt6KP3+HusixUsk82hYmnTRvh/wBe
         X4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768175; x=1793372975;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgpP8ntgb1IS0cEJ3QYg5i8QakFDo2yC2w4u+PGohBk=;
        b=gwMF5qy5kHoNp58AqxqTwkKR5JbnO0yWAwc351OkFRoSzAMxjYYWFboewVFI+ToDCx
         5LzWsN3zrHH70DUeecfdUqlRUUuHZynpeleF9uTY1zwCX87raCedML09qn8P8HdB8gFS
         riqE2mAUM/wij0XEqqne26qiNViyxrsr0BsWhu2g4AvNALlH79hct9ZsE2HelWJgEf8s
         al/mzCKpWi2CQd7s3fJnUGWAGuJdk0mqF1Z6IY1TWemx6eAbckZcI/dU1h275DcDi8Y+
         f77f8RWreJMDX4+EQK0SY5kZ8IjyHZ8t2G1G9zjoAm5EZcvx7gN68ID9J7gYy+y4GCna
         88Hw==
X-Gm-Message-State: AFq9FYJi/dOdZbJ8ln5I7FDOAy92tuNldnwMUhanxQAfCrHHPy8TlXHz
	qaPmcQb3QvwX0E9aBum5YnTzzdQCHnwugjJRKj3crr0A8I4UEy8acLY6qh2+8tamV/tZb227Upz
	PnOGmUxNMsnxKXOD533ycE7TpPJ+yTgTjWLq9HpwQ1rqhxzHhY0HgW0mV7Qpz/EboxRnlST1kn9
	wtX1ZiMa+oJDmUtHJu9PvnuwaJQj8myb4SSaaEWdlu7N8=
X-Gm-Gg: AYBFou3xYInIV1beMkt9f87XaV6+Xj3QQro6I8RA+MPZ1/z74YTGPuXhieH7RFtTXs7
	idwBlFrrNFiFPiEvF7eX+/OmI/EnuRYwrzhBiWoNeikVJvHfULhT4K1Xywu5Tv8OGThEWVX5oQ+
	HIQtGFSCymdLCaNtoNY+YKs7E6HDKxU2jwUvkzX45aDUZtrV7RisVmqFKO9raWN9B7BPaVzgv4s
	9WcE+aDXpCIBIDe9DlyGB3hpfwNljTOnRphpNbN94DozyGvZ9Aq9o4nsqTu/6a1oHv2v14BpUr4
	KUlw83dUH7E3QFozipMiYa1YBJ2IihARHqqGUEwiy42GfoMaWNsF/PA1jXrIM8eRpK4u9tM=
X-Received: by 2002:a05:6000:4024:b0:488:79d6:a4a6 with SMTP id ffacd0b85a97d-48e38594e74mr3887757f8f.8.1792768175164;
        Fri, 23 Oct 2026 08:09:35 -0700 (PDT)
X-Received: by 2002:a05:6000:4024:b0:488:79d6:a4a6 with SMTP id ffacd0b85a97d-48e38594e74mr3887682f8f.8.1792768174508;
        Fri, 23 Oct 2026 08:09:34 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d400365sm339853f8f.25.2026.10.23.08.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:26 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:09:22 -0400
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
Subject: [PATCH net v6 2/5] um: vector: trim skbs before verifying the header
Message-ID: <dbbe73d2ce720e333aa8fa7c58b7bd01994a4216.1792768096.git.mst@redhat.com>
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

