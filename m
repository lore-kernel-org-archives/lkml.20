Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17DD4A5ED8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411409; cv=none; b=RYxeEu1sXzsS6UA5SznLyS5nmbawxFeDDj3AQ/R977LjBlvXPzLbTSTjWN4e+aTcRgAdv3VRa6S9Panmlit3LIXxVyJu8xwGucGqOPtpZ/kPbOUvOjSBNwOReiVTKbolL4cM8TsG74KCzmst95KzHsnmOFCYiKycjqdEZOxeJm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411409; c=relaxed/simple;
	bh=eqoVPoCIcKD9k93jD8GU7ZX3x1Cv6cnc9YQOa29tXGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaP68TcRNroz0ueW8D49gp1vAAtH3Vr+KNJyyqbaiY9adk6DjWK8wo3fZgjPGOgdfPy35Wv5NJdJp7K2OxTiQ0H43h8bKZ71Wn89JL1ctcW4GgEA2MoAarF0Yc+xll4lQV3NrWBMxnBsi5Sl94gbXP5r4RVUgD3+VfFMNCgwnh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XVL46xBq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KssEQQ2h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XVL46xBq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KssEQQ2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792411407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E0652/Ynsgn6p09c6VX24pbfJywD9ROD3CSNdUJjWbo=;
	b=XVL46xBqa5NkoU6nfFLkSBxTaXXq8VsLMexi3ulT2PwGkyxgr8HBnsKkPBcVmGuFpaI5Ep
	j0tRqHN0yiXtNnFYnrE/RvhIOQx3fJOZROzOglIFTSZ7oR4J8Cr/f/TQ73WXj7kGgrZyPX
	eNz0hGKv2BhcPfDfWtXecsWVaSh3vas=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-Am-cNt_bORavr4aboSstUw-1; Mon, 19 Oct 2026 12:03:19 +0000
X-MC-Unique: Am-cNt_bORavr4aboSstUw-1
X-Mimecast-MFC-AGG-ID: Am-cNt_bORavr4aboSstUw_1792411398
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so14525445e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792411398; x=1793016198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0652/Ynsgn6p09c6VX24pbfJywD9ROD3CSNdUJjWbo=;
        b=KssEQQ2htFAh+i7RoIK5NvoimtB2WIcv0KR4dlNxwiqma4+z8jYpZXXiaCG5b7KEX8
         VwjOtPCAhK+w/hJPPLDUsoWA/88nJBDlPTkKg/yKud0UAX9Pugm+2O0bhcoHJFWVY9gh
         BCTMvtyNomGFxZICCjdgJLXy2Lg8TR7qXtDnN2t5GGU97A8RNDa21P1IYnglfhoqs2Mn
         PtHZMe1tPLySNHJ+y58V0WEDh16InunLrsl1BpFT9pQwljAu0BTXSYsQHY4/U4jKf7xG
         KQFR0FtWsxdtSLqJG1qP4gElBU54lIlVwstdAb7vM0rwZNX+Re8A5j8Yk7neNFwnDzBi
         wlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411398; x=1793016198;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0652/Ynsgn6p09c6VX24pbfJywD9ROD3CSNdUJjWbo=;
        b=G/kOk3dGQ+BbaQjjylGR7r3vUHXK46C3YrN2r+w4JX4eVYgBme6OVoHzqw20xXhZYu
         LyDohefDmXszF/LKXZmWDe4Eq1su1SqbC70jpzho5j3bht0vaeOzoq4FvQvEXPwp4QrS
         5DwsuzN930LoFig3h+KJjCZCxwMiG5RhuOXactIlgZ6XgcuubcCqq6xpHu6WKuzqvwfu
         eQmofyC5uXcjWe7MGi7WussZ4OBgAY/0RMU8lew7BvRiaGWF3ohkNiOEuDydN9FWTjsK
         zLxZeoHxqKYngKzqdRlF4/4LcnHpm99LSxNA9cvIZp2HJ+EbEp+xkV39N5oatnoQhxDt
         Ctug==
X-Gm-Message-State: AFq9FYL4s2x+IrFjn8QHMhDzQgJtsn6OfWTBas2Q/Mr/FIjbPrN9Ebs8
	/XMbMrJ/OffbFvlrr+ed5D+56+3MAlgBY+nQLFCssuqgh/QjJge32mcBbMCpiqjIxuAH0wyPoFu
	3S9j4gt2vYW7mS/LmkU36Hc5yrdtb+3mWpKEPZabwlh8/vJeWcimKsRq+GmJ5JuNC+WHXrd+b/t
	F3y3x7CpyHbzf8b87la4N7/praF4z2ko0KFSX9lHR+rXE=
X-Gm-Gg: AYBFou2lOJSSso2gHPkW3Z+mpya405F7TCyu9z+t2pBQC0k2PdMCtFUaUQ+1iwtS0Rm
	qdzOdGHsV99b/qMvcbZ2/U/8P8Qim//faxAUTqSc+kxf37RSRsRQOiwuIXy/vINBl4EU9cuiVCO
	RAM4EXD3TUzAt19bM0nIRQWjdePH0DcFB9RB+YV2O6jLOya59ypi2P7Ln2xUQH5ni9BqKyFgDVK
	luDRj1z56NEVLXtBlfVjEjWGIdas0NRmUknfBCfvhVqBfXDR4EwpyWx8ejQNFOZvHE0ln4zVzAu
	dw777lEv8mFU/KwjuM8wbSvka8sRYNzL7RSyTITHKZLvYhERSUhCu1xq6bDqYeu5a+XZfA==
X-Received: by 2002:a05:600c:8b43:b0:4a1:83f0:7c8a with SMTP id 5b1f17b1804b1-4a1d75ad072mr151102685e9.1.1792411397957;
        Mon, 19 Oct 2026 05:03:17 -0700 (PDT)
X-Received: by 2002:a05:600c:8b43:b0:4a1:83f0:7c8a with SMTP id 5b1f17b1804b1-4a1d75ad072mr151101675e9.1.1792411397200;
        Mon, 19 Oct 2026 05:03:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm187486045e9.4.2026.10.19.05.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:03:16 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:03:14 -0400
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
Subject: [PATCH net v3 4/8] virtio_net: parse tunnel csum_start little-endian
Message-ID: <fa2c17b9871d1d858cc9e109e1bfc61b3ffdbd69.1792411304.git.mst@redhat.com>
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

<glm>
The tunnel header format is only produced by standard-compliant
devices, so all of its fields, csum_start included, are
little-endian.  The nested virtio net header import already
parsed csum_start that way, but the inner transport offset was
parsed with the endianness specified by the interface.

On an interface in legacy big-endian mode the two parses of the
same field disagreed, and the value stored in
skb->inner_transport_header - which is only bounds-checked from
below - could point past the end of the packet, where GSO
segmentation later dereferences it.
</glm>

Parse the field little-endian in both places.

Fixes: a2fb4bc4e2a6 ("net: implement virtio helpers to handle UDP GSO tunneling.")
Cc: Paolo Abeni <pabeni@redhat.com>
Assisted-by: LLM
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

