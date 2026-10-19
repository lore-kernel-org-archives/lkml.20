Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F38F3E49C8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411402; cv=none; b=qRToOB2HJbEW5MTsJUyGhglJN319veiJHBBdbb5u/p8TeV8tJ/S27bfXq6XrDfA7O5KLKolHeZt383mru+1TZs/7NIUuz3M4cb6B0hZmmskqvDMTmqAcKdqXEshm0jWFIT5G07hDT58CIarBsNGExXx9OrQaPzq0QNQ8Dpjt8NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411402; c=relaxed/simple;
	bh=IwhLYmjLCPlF0e5s5GUMXm2Cd+FkpD1UwImr2LvvCHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmaFsdV+2lS/XJYB7lGdMZiJgQ3Ip/UCWFYMxdL7iRDiFnhIXEY4arA0X6LuZ48+CxzpC7hFzDMQtlgKInz/VpVP8PPqgLWqTq9tmpVOlY28RYVZdBMR3JabghRfx3y6m+bhzNYwW+p68Ltv4vMKrrh1spsAUlLSpgZSoCEh2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wow8XLmp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U8OaNTUh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wow8XLmp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U8OaNTUh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792411400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/qcGh/+2dqUoiHJpUXvQbolm141eVal40N7yCBeiObo=;
	b=Wow8XLmpYtaYXdjbIFtcAuW5J+NNPGU3GARRQ7nw9SfEYaK3TrWdhWqOqpnckYsu3S4g1q
	nu05wsPaWqz1AvrS8jR8pcTnCI+HVqQULIoRsVhrU2wEKP10aaSHwncuxO+ku00LeFlj7F
	cizLyJ9nT0fMu29LOkloqkUgLq66PmY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-Ev4HWcdVMNSAzT44I6UoDA-1; Mon, 19 Oct 2026 12:03:18 +0000
X-MC-Unique: Ev4HWcdVMNSAzT44I6UoDA-1
X-Mimecast-MFC-AGG-ID: Ev4HWcdVMNSAzT44I6UoDA_1792411398
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48dea677afcso1594330f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792411398; x=1793016198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qcGh/+2dqUoiHJpUXvQbolm141eVal40N7yCBeiObo=;
        b=U8OaNTUhKf5Z4zXpPcdwxTf6lgqn/XByNHZaoc98ktaok+udXPDKF7jgtJp20eaCXh
         kCRDA7iZ9zFtlBkXXXFz2fjVkuKSRkEckmLYusBV0/lJmu6QDgO/YpspqvsA8GU4M6JT
         WlY4hHOxpD9DEb+eWDgJgjOpWbUndzZ5QHX9KlIdOpisdg+50Un0D0cD/9R9L1M9DPGl
         /L8lFoRIx3phMGrQ2O6Bw4ialq1eFoNrhpiMFYCwVM/AJKmTvEeqvkKk5DXSBi+SqKOk
         28BHIRnr2aAHKJlalDUE5RMhBXfTdS/or6b8okCKycLeVtJnwby7UMi165HUBcfEdAp4
         YDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411398; x=1793016198;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qcGh/+2dqUoiHJpUXvQbolm141eVal40N7yCBeiObo=;
        b=VE4hElyY4BYKnWbd3o+kqOAebz2A7iuedpXyYNYTpqFrxHs7hoA+DYMf8exzy9xp1k
         AlD23LWekmJVyx0UE5lV1ccuLnT1B+WqY7Z+yQkhEwAmegpX7qHpWVRYqtGeWG8hlNBK
         Je+SbS+/Fx9THOlKVmj64zrgz5ykScpg5s7zzcxPFx7q6N5IW/B7hvF884bViP/5uR91
         tOy7u44nsq3gzh2e/TU43uUd4R7dZr1M9KouBfxw0A/cEUhes8IVIZEmrqsoT4t9IgjP
         jp5urWYC33Zojxgj1jUBQPYfWgdJcDg65L1ToUKVplgZ5g0KlLNwPx8etutoeQDq6VER
         HhlA==
X-Gm-Message-State: AFq9FYJKfHutMIQcANK3ZMUKLQI9PPZNywDhyFdR4PItfrNDnCneGceE
	yHGzT6dlTWrXHZYqZMZCFpJK+qfYyJyMBRBaaa7+rQ8kkfbgHqhiQgSQMdcPWIhx3nIgsTIxuuP
	6AP1mJeRaZnjPfXRuhh1aj+pikfecHNLH3yMRWkDvyiljHYHX8g6jwEHheGwsubbziKyuRmsKyV
	McYP7mtzC6KRVGwF2jqezIiFLlEvC9fAxDt+jc7xp9nPc=
X-Gm-Gg: AYBFou2DNUb55leEIODIUI7+GpTVfmOkIj/emubtSSD1laBNHLLxjXa5zmepoSxKN6R
	01pxF42PtgTiDV0zIg/Row56dTcyg6wWCSWvHeHcQIwIHWPMaPY4Di8wFjmQNdvhQsYPF9Mo9dw
	ZgDLq2iuEvVddS0kUCdnCea6EdHZlom+Aek8w/zzLfFUHqVlucnAhKKhhscxJuUmWiZgzH5cULy
	6USyeKxsNuL5KCW/WySJ56tSH8cV0ezNgfx/ON7n4gQvwxntMQc7LxP5TsEp0wLpIMv7Jw9THje
	fXlJMLdFl2LnxsBYxiaP01boPCk/eKJoYPjY70uLC05ia+xQx3fsDiJhjwdn1yoDiUUlNA==
X-Received: by 2002:a05:6000:26c1:b0:48b:946:c1f7 with SMTP id ffacd0b85a97d-48dfaea3908mr25611979f8f.31.1792411396089;
        Mon, 19 Oct 2026 05:03:16 -0700 (PDT)
X-Received: by 2002:a05:6000:26c1:b0:48b:946:c1f7 with SMTP id ffacd0b85a97d-48dfaea3908mr25611747f8f.31.1792411394009;
        Mon, 19 Oct 2026 05:03:14 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4feb6bsm24515964f8f.41.2026.10.19.05.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:03:13 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:03:10 -0400
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
Subject: [PATCH net v3 3/8] um: vector: trim skbs before verifying the header
Message-ID: <372d22237412a8dee2f848660e76162f05c566cd.1792411304.git.mst@redhat.com>
References: <cover.1792411304.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1792411304.git.mst@redhat.com>
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

