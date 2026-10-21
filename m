Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569026;
	b=5XgelWmjClohXOvFId74GjJu+jnfWll/txYIBnYibruAbijemeeIEbFM/8m1DqjccEwS
	 jrlX5Qy6ugTnCzHfst0jWfLhPLh1410xq3IPLhPsAnhf6PtPKYZAFnyUgfuTGh4w5l8FS
	 Hw5wTkAuhwPcsEIA/QPMWaPcYaGGCR4aF5zmTZ+dDMuN47CgRZQ+TumvM/ASIb1Qlxtse
	 s35pc3lR+PALGsAt20wYG3sQXURLgtqBGDhYWTU3343+nyBFmTpkJYsVjbTvAWBhx5g8f
	 509EVGqTzZeuLayxHRsxpTVSk7JSk7Np+vfACJnBhcDoDsClcSegTcgttASfKrM3Dwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569026;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:X-Mailer:
	 X-Mutt-Fcc;
	bh=i70Xk4AYsgpu4E10zOgBKBV1usiM0hwOau4g7tIhYPk=;
	b=j2rE9dtzmMi78i6tNFYXD9+2XPJK8Z3IhdvdyHgI6geOpV2MTVcIKMb5n2qFP8IsLgey
	 JXF1my44PWoVTOtUa+R+NMJKxgoDjf/wXbYBqf45NGGpm9VZbuST3lTia/z+Nv7cz0/Bm
	 YUMWqCAAD0g5olmWWD1Y/3eM3UKWfs8A7Zpm7zqwrmGBlcOZdWw3pcgtFg35slZMDmIht
	 Ki0hLIC25898igMnYGDhrSaooDWPgl/pWEUU006FEhStc95qx+fWaD+431dDrY0kkAJjf
	 gDDDEndTqVVWq42khNTywPagmQ231yJuIoZlCxYTaa0yjpyveieGUpswbQ/xAMMizJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g2YqDLeX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pMJeK5E9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F369606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F369606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g2YqDLeX;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pMJeK5E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792569024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i70Xk4AYsgpu4E10zOgBKBV1usiM0hwOau4g7tIhYPk=;
	b=g2YqDLeXpmQQdSXJDheHKpWJiFjjdvh3mTWTlh7D4cA7rKruh6qYAYc0i7hWDK59bax9w4
	bzvr8hmAbIZLxMC/G1h8Mx7onlQUuFpFFw70S4J6fki/M1KaXlCHpMBZp6k9RoULQyT++R
	Nk4svhtNyOLo+Fnyd7jwKGVULNLAfqk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-C6N9lVOPMA28SwqMP90aaA-1; Wed, 21 Oct 2026 07:50:21 +0000
X-MC-Unique: C6N9lVOPMA28SwqMP90aaA-1
X-Mimecast-MFC-AGG-ID: C6N9lVOPMA28SwqMP90aaA_1792569021
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dfaaea30cso288128f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792569020; x=1793173820; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i70Xk4AYsgpu4E10zOgBKBV1usiM0hwOau4g7tIhYPk=;
        b=pMJeK5E9Ob8oRl+e7J/kzCU3ghBGX5LuI1w1ujEAE5gJISgEM57frZ12xAn7sSYC/a
         Kda77zJJzSHxRsni4Qe4IBd2rUTr1GMRJrlsTQyZ5My0Ku2Qm1f1TcyRhQIeYd3fSnCg
         JFpNLIsTjt1VvF4JDpOFmUHbT+O7xzLy8JprnmHXXJYtvTr+VihvBgz/vgV0v+V6vwCb
         ZDJP2rF+uGm/Tei0ZQ6VGmGqVc9CBbZfyDJ+zACv17VPdKy8zwZ0r95prryWm/d48qsB
         3TW4JaFQKcx1iBm/zflKtv8nc8gCisAKNnNlUxHXO7CQJnFn0Ffoi0dRbsCFp0SMS1e9
         STDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569020; x=1793173820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i70Xk4AYsgpu4E10zOgBKBV1usiM0hwOau4g7tIhYPk=;
        b=vcHE1pn4e5REoJqJDJ92DS8WW0MPKdlPPxylpmLaz3W+L5VIfglpSOxYTpV0l6weTl
         9jAy6MO+Kopb557InsYGzVLX8BRm/+imoaVcKSu8B0n9hIYy5yJmRaQ5cKazG7Ls5ABn
         Yv9/nMpLYPad97xhIkuZEg5OvBA5EFhTQpFcmTbH7+JAFMfe7zfu0LVFfYXHd7prR8wh
         yw1V+xVoniRH1YuaOc6GSFFDJ4rudK9DKMFmAX24ETv0/0NFr/OKdrRCMFqehBvE16oM
         0C2uFGwND/NGdXWFC5kZomQUQwTAVbLZSF4ZvtHtuoWMRoDa8DQlgXmBuv01zXIcbsOS
         a6yg==
X-Gm-Message-State: AFq9FYItsjfI3JhBCEoMDBMcdEjV2OZKpfmdCVSQ3/0twS58M0GoIRQy
	gJhCZO+ylyg6kQ3iCsfpXbVLAxSUKCwwTxXrdFDYBhfHzENdF3v1GKWiQ5H9g33A4LrnV5F2Wa/
	Yt0W+o/2OoEPaD0OhuqcNzGcbUBO9NsAik+L/mofT/THHX9+leaYcCNXLNks1nmddDV17LxVfpv
	B7Itl3mMV7iRlFK3goRFqL6DdcQSwnA32V7yhwkltf6lc=
X-Gm-Gg: AYBFou2i6qDxfLwYwdaSkW0wJR5pZYWQFNlM6VmnKobkhdMnz2q4mGHLEZgONUI0n3r
	4d5d0NoFcuvuPEfkxAk3HsazSOrPhBkzN+7LBkvnpUaFFgf++v91V1PQnktvUOW/vV2agDVPhFq
	SBpeAQzhLWvMI+00sil3x916ToZs/qbhTby2GnudpJEIugzJwVWbjN9wIRPLnueN6x9TGkhQv/c
	eBxY6gFKc9tGvfn+VAHKJHJd1YlqNeLWxTpBEculPgBr+mjDJ+mnFH7jHW+Wm995od6gg6hGXld
	A8BTugZaywV3JBniFNsg07QDbSiyCjZXVHssyuRpM6iB6n9UQ8gs2d5m2a9SI1tvi0XshQ==
X-Received: by 2002:a05:6000:4555:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-48e264a3c51mr1444655f8f.10.1792569020521;
        Wed, 21 Oct 2026 00:50:20 -0700 (PDT)
X-Received: by 2002:a05:6000:4555:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-48e264a3c51mr1444601f8f.10.1792569019847;
        Wed, 21 Oct 2026 00:50:19 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835b1dsm4032101f8f.40.2026.10.21.00.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:50:17 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:50:15 -0400
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
Subject: [PATCH net v4 7/7] virtio_net: cleanup protocol calculation
Message-ID: <07a96514a8ec131b50c91d18a7df5f0d41a488b3.1792565282.git.mst@redhat.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

A trivial cleanup removing a duplicated code line.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Björn Töpel <bjorn@kernel.org>
---
 include/linux/virtio_net.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
index 724ab8659501..13f76bc505f0 100644
--- a/include/linux/virtio_net.h
+++ b/include/linux/virtio_net.h
@@ -609,8 +609,8 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
 			return -EINVAL;
 	}
 
-	skb_set_inner_protocol(skb, inner_isv6 ? htons(ETH_P_IPV6) :
-			    htons(ETH_P_IP));
+	inner_proto = inner_isv6 ? htons(ETH_P_IPV6) : htons(ETH_P_IP);
+	skb_set_inner_protocol(skb, inner_proto);
 	if (hdr->flags & VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM) {
 		if (!tnl_csum_negotiated)
 			return -EINVAL;
@@ -630,7 +630,6 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
 	 * We know VIRTIO_NET_HDR_F_NEEDS_CSUM was set so __virtio_net_hdr_to_skb
 	 * set CHECKSUM_PARTIAL.
 	 */
-	inner_proto = inner_isv6 ? htons(ETH_P_IPV6) : htons(ETH_P_IP);
 	if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_type, inner_nh,
 						 inner_proto))
 		return 0;
-- 
MST

