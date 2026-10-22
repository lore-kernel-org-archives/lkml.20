Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673904;
	b=db6OzG6MGx1qDKu7GD2XvwVtQDzgym4rTmsnLXizOw+EuljlEhY5Kj7ux3yNKU37Vj0S
	 LnNpTJX1sItVuGtVpWrCQ1XFpu0F6LjRalBPEDUqDt3Y9F7ePyfmcqfIJ3EY56SnbdSV5
	 unaB490dcIaum5Yx5C6XzmNhotZJdl10mK1RamRQ2E4uY8RKpi6uA66WlIRJe5s7XRTtH
	 YSsUnDT18yegVLLHZum7H5Qd3X6l/og7q14aIhNB87/RlwGnJossy0hUkOV+BK+HJxZ0p
	 uEK4avWhzso+K7X7273frYOxLQBD9W92B/o/5sM+9kU8EUPg4RxZayp1cs+4rfI+JVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673904;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
	b=dA/SSszYMMnJhM0Q9HdRLI7OflROVoaulFUBNmZo4e0H8HgQ9r00UROctU+wHgyWeIkX
	 60orYRCRhW7uW17s+PHkTITIZXd4Z4/8MKW3p4Iw0msMAIzwmZCGGrWX+hJDvBGmugkyg
	 BWulClgfAMI2wJOaTUOqmtj3Sq0tlnwvG4FooVIpkNH6+VCZQwm2eSAsvd3zcUZDyCs4E
	 aShb2k/YNv4/pFbg4BeoJEC0SVS/MdMV17LLuRfv2j1lizHYTYqB82ReNVo/3bQQ9Y/Tn
	 6UYEo0cvCm4su6zSEjlnV6QaIGh6g4Nb7DevHMlYdrDZ2tumNHwYs43355U+HMtsD1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJRgqxpE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Iiz/Z/nE";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C3060A2608
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C3060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJRgqxpE;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Iiz/Z/nE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792673901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
	b=NJRgqxpE/T/kE1Bx0JRlQey94S+plvzFSmS4pm4qPBecCvSD0BqcUf1yFBfTJBrMN60ckS
	/RlN39QYmfCS+YqvVwArCX28CJgx2VLZPF8O6wM1qLCRuTGCOK/5Ss68fBZTGDH0e8V41y
	eURehqf3CvcNbKNpXJHmDtT8bSRs4uk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-tStzzuEFNpqFezUX80GFqw-1; Thu, 22 Oct 2026 08:58:20 -0400
X-MC-Unique: tStzzuEFNpqFezUX80GFqw-1
X-Mimecast-MFC-AGG-ID: tStzzuEFNpqFezUX80GFqw_1792673899
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a16faefac0so11475175e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792673899; x=1793278699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
        b=Iiz/Z/nEwH+UuHp58dowtNajoOUR+oG4R1ELWDDyIlwiDLMonD4UJqYGxYvZQFr1/X
         TfWMCRQYef1X5n7ZOq0FZpdfsCBFUIXMvEETukQ+joFImbS1lZS0PvoDONZP1h9RhiFC
         PqLVujq3J7EuIJHZhwct1BEQPe7Ba3NPV+VPtFyCkkuToZ4vI2HwwEqmaZ3cshFWasyg
         Bxf1fVhQ3czaHOCjJsTgdUWsAcn6qhp+8lzq7O9yzm7dAvUuELlR1gsvpqwRU9NaQpcX
         wRuWqOMI2Os+ZyoheOdaC2ohUQDH3uIkDSxg1I2HJf5sfP84g2F9NLbPGNMqC5ZWYJWv
         UkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673899; x=1793278699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
        b=D98TKslT/WeI/HBW49Dec0Ft7GE8dl8H3VePkIO/FswfLkkR8sYBTOM+oOUIMR02VY
         /vpruojvss260XZqC+ija5EsE1EyChi4dns5dxqM3xJoJwH2qTEgjrATVqxofq+d1DuM
         OQT+fKc2x4Rx1tLNcnE7bYhcH7uumdQEQ3gUjya8HJ7wqUbpnSIMhkxiD74wdU4ktFJz
         zGiOisjPh0B6hZW0DenRAxTLQA4vIkDHgK7uTvpoM8S1HnsC3sJ2wCh3xsyF+HnwGiPQ
         z+Nxt+WSsehcUjWAiZhdD0Vx4f3YHoVo3JLohMArpvupOYKHYZMm16pNOE6cUCjdm7u1
         0NBw==
X-Gm-Message-State: AFq9FYKMoZslPooZSvA6ZGImPGI9un72yXejeqEirjZMP1AxGnD0w4fJ
	1gDgRzIafzsiTeXGcHDk2HDFS4niPyQNffAB6u0HUPn6+IEtXNHaP+UomNgJaSaczEZmm1JF+kW
	5hz5soOqt9NnnhM/7qbAzBoJFLE6QMVFepU9xPzdfdIJ3FCiBgVKiV/cPZtp3AvQjj+QAT0xw1c
	Zoo8Rzit+Nu80Nfj/2E0z9Ero7Qmq61Tow5dwK7/FKG5g=
X-Gm-Gg: AYBFou3ifVL0dDL3Tf8Uwnn9U40v+mNUcsGG+3hdWRsSKKMmp28PAuvJPgyJOv7K+p6
	U06xsFozZi3Ra8rDQJ7n/ugzKTRRRKk9rMnPA/Ml4pP8W18pkXhh0VNx4jdIvgumxcL5byqjTJo
	aSRe/soFsgYp2wy3MaComNFjjyiPqd2AriJ3o1gSTeDpn8qbkNz8B5/raHpV7itqycl48d458LN
	3UbFcwCE5TexASr6h3JZLs42IZfTVZ00FeDrcsucKGhsORGh2FBb9tSrxGcJoQI/KSOg4iod2J5
	xD08r64i8ux+LIoIOuYoDh/dbEEo5pr5tOhOjrt+7xoW4DpBnJypjn/uDk+O775Rn1U=
X-Received: by 2002:a05:600c:3513:b0:4a1:cedc:ab49 with SMTP id 5b1f17b1804b1-4a1fdd1e97emr110652395e9.31.1792673899305;
        Thu, 22 Oct 2026 05:58:19 -0700 (PDT)
X-Received: by 2002:a05:600c:3513:b0:4a1:cedc:ab49 with SMTP id 5b1f17b1804b1-4a1fdd1e97emr110651585e9.31.1792673898550;
        Thu, 22 Oct 2026 05:58:18 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583522esm12561180f8f.35.2026.10.22.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:58:16 -0700 (PDT)
Date: Thu, 22 Oct 2026 08:58:14 -0400
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
Subject: [PATCH net v5 3/7] virtio_net: parse tunnel csum_start little-endian
Message-ID: <dfcede18b8d54519bf586b8e5099e89ec63bf014.1792668082.git.mst@redhat.com>
References: <cover.v5.git.mst@redhat.com>
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
In-Reply-To: <cover.v5.git.mst@redhat.com>
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

