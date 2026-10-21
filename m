Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569012;
	b=SAtz5Huy4+S12MO1bUOGy/VMNAbxNsdU6CnmHbuPBgt9ouFx2wXnccMKCmqIOQORsaDE
	 Ekqhvsw7V+eC8AnqC39wZUuRqW7I32aP7uwCVActVqbKYKnr9S4x1kqY+Njyu+wfuCRhO
	 zQfiZKY8ZE1c7Jla/ALODBau0MByylzW/MnP23E5nRs/5wrwm8X0AGSY93oTBzLpT7YdU
	 RCtgGty/v1dVVYEhB5g2QRlCAJUtqj9C8J4+9IH/11Na0BkWmadNd0+Z1Ea3GVQVxjGV9
	 mmTPZRui7X5jr9pJTWIrnGO+DtujAM7hyCSmS2prEmfVijKGvrPHLOHW1K6+hR09IUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569012;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
	b=kK5bQaiLSUIfZkKVX4hp9UphBHiGuCv8iRvM91S5Yg4PiQ/s8qRTOVpM/Qetic1fAwEl
	 5V9XOocqod4RUMn0eWqEkxaFVv3cuBY96x84EgjdlQ3or+YxOUzlN027ikL2d6bysIcum
	 GPwQXyIFRDuuFE17i4oODvtS/Pz1q9OrISyOOS20t7/5f4y2T8BY+b+SMTDclAXiho19Y
	 7VptH95mMSf0pKICg6TziajeG253SriXGYs1Z9QZUyTlhFqtVleRdwk17iArPQpyNDpEh
	 9jIEcMbR2Cjgi2Z0VCEv/x1fI3EnjBh6+YlocYT458Dsf8dgRyrlIkouG1tWqcuLiXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="gt1dA/gb";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pG9wsWgs;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A110606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A110606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gt1dA/gb;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pG9wsWgs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792569010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
	b=gt1dA/gbG02dgdIaA1cKa0AaLWWCiq3rqpR8gwNr1X7UtXg+qnc3ou9zt6soRvfqA7k8b7
	E99StKDgpOALukaCRP9wOo1EvtH5HrgU7glS1tbxQGfxm2rI9M+TY9rLt7vEBzi85uSp8u
	pi4gghNQSFLUKrKgX5+QgfrhzwZUX8M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-ZKTzhB0XN3GguM2spjDFDg-1; Wed, 21 Oct 2026 07:50:03 +0000
X-MC-Unique: ZKTzhB0XN3GguM2spjDFDg-1
X-Mimecast-MFC-AGG-ID: ZKTzhB0XN3GguM2spjDFDg_1792569002
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso5104335e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792569002; x=1793173802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
        b=pG9wsWgsOOyDxU+Prd75YNi5z9L+VKeAjS0l7E9ioSIaYWNWpq8IvzsFc3+oTUbCA+
         /hQ9lbBFfMDvvYvS5okDmqz/aY62OiNzJMX2uzfa8ifWYR0En9Qr38RGQkqOqCaMFcXQ
         mRtRTbkRrB7Oi50GF8eZ5Qc1mucnufP1AjzqcknLCvYKJIRWtd7X26niNpwvDd0FDQvk
         m8PSU3J5PT6AVPTM0FII9lvzWRyd5WvIJ7E4mMqFC+jxk/38bHrzh1lQmm6bFSrd3TfL
         PXt+0mE4JbL2++HIRngn0t4P5X5JHjGKE1UT3j1xPNU83cZyqvck6ssKwOjfHuXhvhiE
         eKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569002; x=1793173802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrgZwsKhKHkmEbVDierK3hRSfuUB2Tabjw1XdPoU1r8=;
        b=2uLxzJ3JVCZ2MBcDkcgIBITEoteNrzNQ6brB8TdQ6H7lYgdiBGxKWNUj9JVc1NwErC
         +ofAHucUBiyxDVdy5hKqwiVvJYufq3Mya2AV9xdPrKUPWicrEpqiphSGDPv2ODKyVNhx
         xzr8lhrh1oCprv9alamZgmkNt8adI2gMGyMGhoRVWxkInY37D7TmHIq+7km2dUVMEApO
         MCIe6Lb3BzWGwVXmMFCVet8R59kRRZOhjEQ5Qe3U3UGN4rswtERp9V0iySsTZ9ZF4tkD
         2kze3yEyNulMVULCHr5008YyTaserks2HeVgvX0x3s/Bij/EyCi5QXyALsccxRzGxkiY
         1ogQ==
X-Gm-Message-State: AFq9FYL18iHZV1LSKU997R1LHG4zmxryMIxQQshXp6xfmWpsl47lYHbY
	kQ9IGgBJH1erauqeL6HPh0cLruHe5sCXBm6D2wf3eD1naX7WecBp2Guo8iX9byFAm7w4BkiHq2j
	jsnuMxLFUoUmASygvbWdZOvC4kAk6he1I1hCC+GIMmL/d7dJWeVZ//zUTexXF+J6GNJpkmmTbWG
	4bt2oYD/+5sdkUbUduWCu5KgdiXRcLHaADxrguLu9zn7w=
X-Gm-Gg: AYBFou3orAMbX8k8y6+BvsL+jlCCYCTPjqDqF/oWPq5I0I+KgZ8u/8zvMoy1GiE67YL
	kZ2L5wDeeYK9yDFKuEXQ05jSIvPGn6dWtslX3iPpDP7ZLibCq2WBhN2nNLGm4vcAlA7qzvcgBdB
	pXTSyFJfsdm12rrntvfq2s35qZJda2Om8my271difK3UhZe0/JzWB8OzE9XJqQqatpMlZMlwjsB
	8YAgsQ2QK9t6YZiRi0J5AkogKRFCGwGhAch3e/SS+yu1dHvLRtroqkW82klQHQDL4jDPK1TAe6G
	jAo8Tn3T5ADY9DWdYJgruwmtYnfTUK6PLoF+9BOhtIcIFSJMwo47hd3xH5FMwu3VEBntMQ==
X-Received: by 2002:a05:6000:400e:b0:48e:b62:d134 with SMTP id ffacd0b85a97d-48e2642cde6mr2376576f8f.6.1792569002010;
        Wed, 21 Oct 2026 00:50:02 -0700 (PDT)
X-Received: by 2002:a05:6000:400e:b0:48e:b62:d134 with SMTP id ffacd0b85a97d-48e2642cde6mr2376500f8f.6.1792569001336;
        Wed, 21 Oct 2026 00:50:01 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e54sm3949620f8f.27.2026.10.21.00.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:50:00 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:49:57 -0400
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
Subject: [PATCH net v4 3/7] virtio_net: parse tunnel csum_start little-endian
Message-ID: <421e7ebb8173ab919c2b90b945aaed462145583d.1792565282.git.mst@redhat.com>
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

