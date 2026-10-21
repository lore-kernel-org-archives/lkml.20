Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598935;
	b=MS8TYY0lJaJ4K1UjvOwlhDm1vjJLxaI6gCvDtbgRq/2EzwjQR+D+6owcLAT8fiFCGsUQ
	 EblgJQDIkXtNFv88ZLGl6RXQ3YJMH1P74OlV3UnMWh2dg8A2RNEa6JsjVVOyLdNwZFBCh
	 JNw8wkpgfsbY9KLS+UONijaHQ98OpHBSW/wlxI7yL6Ej7/L/YPcs3JZjyxg9FxBrbP2cx
	 mPouvogR4MLP5uxDHPaj3B1vmwplW1RL6F7+PZqC8FKBXOohvzbcAe6FUnqPheFV6YDjs
	 uj0+oZR0+vHJOPeL82k94waGObOLIQEuD7HlOL1UW+IGlZ6OLvmgCyY3kXxIJkOVweQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xlUjPkBFZR5E69M180zZ7SvybteIZBcwvq7YyxzDeRI=;
	b=TzsMaHOQUbqr24OakkMsB0UwxLZ3Dv86w7KaW44/WYXS1d+dYYNWnSd/C91t4kSC0mDi
	 aU+QHA1Lo76GPlxkEzKVlXYchbOHgmUwPeaQ/B/IvRrqbjyXOFaCG37UGVyaz6GvQSJpB
	 YRzam80F6RqJTM1lMgwP46xnLuYw8qfChWSN+gLGzKvQANyt5fU0+OVJYl5iAS24n4EVE
	 NZ/GlcWhCTVJtFGx3Zop8T5mxdyj6+OlZsScv0iPPIldVKEgqZIItt9SN4+487KZOupCh
	 KkdwfV7rkWBRMVaY69vuT+Yticx6szLL+TxY3hIocKQJN0imugqGUBp6lqC0K/jF3hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HmkvCJ0v;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558B3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558B3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HmkvCJ0v
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9902a746546so29193241.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792598934; x=1793203734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xlUjPkBFZR5E69M180zZ7SvybteIZBcwvq7YyxzDeRI=;
        b=HmkvCJ0vaUoa3UQ9+bVmx9GYBeGHPBtlOLf0CTWX9WnMkwRafYNyOSLx/EqFn7xC0z
         FeBLtVw9Bz3lADjseMfn9oWHJIVBJFAk99ataSjSPJQ4In6UetErxE16KChScPekSOyw
         MjpI/XW4ARjyQ8uPN8cvX8u8hYvhwIw4umZj2dxBiVOtWqSaa9fwYG3a201xAy+AR3CY
         3AVX/nMuip49a0S77opD1Ad+JdBVu/RlOSXBN/Vb0/zuJ8lHgUed1jUyiMv492+qc6lw
         5BvuP1Yi5jTt7Y3apvAZncY2fEhGdxDTG0tcV24vI3so6jisVt42aq9HO4FLaNKopDfA
         kgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598934; x=1793203734;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlUjPkBFZR5E69M180zZ7SvybteIZBcwvq7YyxzDeRI=;
        b=o2XKG6qmINoaoBtLqmnWtL/kJgcx5TYJxn73RXhl5XGPGRdOXfCO0WVk3bJEkIC+9b
         o0ngGwgAMOWiWk2XNHlKyu2C4DEc4LaKRmTerrf76XBm/zk4G9sgqySI+1dQSZciAbRe
         HOiRSfNTYj0iVEA/fEC3Rnh0gw+/nw4rK85tEK3Wk8FWpKDJK9YEB+5rJG1+hkTIUWsd
         6W0B2MsPG/Q3O71roiMc3PHvNESZcI0McuHGel4aFo57RTMhdIu6DfEcvcvqimsNEn2A
         qI680LDpl+yZ2k8LDV9QTRxEr0vfz3bnV/FPILvgMfDeE7qa/4vye12oQlvQv2s/UV1A
         49hw==
X-Forwarded-Encrypted: i=1; AKwUvByziXjClYTdnLhPDuEZ71fw6dlRCDtmhaH+YQM5isgGXiR/u9enxCuldluOUZQTLIHTnZhhxSbNzB/oK90=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1rYIUr8KCc6cxZzOntvUo5CGpeNd9mpnB9LXxVVS1ceMWf1Rg
	aE1Er+5s5FVnH9japSSQPGj8HOUEP4z85asmNZYP941yFm8mwCfwOFc/
X-Gm-Gg: AYBFou2Vgw/SSnccCU0KjrNxYcyIlM/S2jgPIH+r1j8fFvHM6WvOus9ulnnA0ZF5dMZ
	MNX2R4fx8vqEffKxVGzXxISYTYX5t1wGvVKjGi95FwIieE/+C0jZflHNQHJDh4mquMmCvPNhLsk
	H+s/nCR+fmOCsH9hv6W/weKcSqND+1Prbcu1Hy63fhCE6lE5R0UUgoMg6oR3y8u7ZbV7Q0XvaRT
	baTxqRFX2kuBIgHpuJipStzXsRqBTvxfrG2gcV7tFgLPvc8uplGAqv/RDAfPTP84ZW1FQZV3VN7
	xqiD7Axiwz9NO8vct3nKMEOEIcK9hd/j+H5DGWB5aOKY9EZyZioEsB7vjH3ExxD4/gfM5AT71kq
	dlJZisNYg5ATJO19QQeU9YZcMqcKGGDCKfJDYZOzBS8frvCKf08ecg6KZKND0P31/yho1wxremz
	LMBGp0WDbA2ToZqK1DEjjsHyIzeTyTs79ERtHmPmBhszYM5yHYBRTnJRrVF1EYg+m69jRjl1UMF
	aeFAyvMg9ZZkIw0x1Y+F4HnjkNkn0FwdAK+x4VX3//pf+JIvllY7CHXo7hKF1HnJ2sVbuQHq17L
	RVSNjqbIlhLglXREjQv+o97gsIVmL47OL66PU/k+nTotj9To7JDJ3RIEDilOWuG0Wh8MG88z5JA
	+0cVQ/pvOrq/B6MUwQ64=
X-Received: by 2002:a05:6102:21cd:b0:7ca:9674:a58f with SMTP id ada2fe7eead31-7cc7bcdf51amr1136476137.32.1792598934205;
        Wed, 21 Oct 2026 09:08:54 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d0e0ba56sm3638029241.1.2026.10.21.09.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:08:52 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:08:52 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 linux-um@lists.infradead.org
Message-ID: <willemdebruijn.kernel.186235776c7fc@gmail.com>
In-Reply-To: <26741a9a64c28e8de6d13e04972d296d89e1c95d.1792565282.git.mst@redhat.com>
References: <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
 <26741a9a64c28e8de6d13e04972d296d89e1c95d.1792565282.git.mst@redhat.com>
Subject: Re: [PATCH net v4 2/7] um: vector: trim skbs before verifying the
 header
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> The vector receive path over-allocates the skb and only trims it
> to the received length after the transport header is verified.
> 
> A follow up patch will complete the packet checksum in software within
> virtio_net_hdr_to_skb so we need the packet trimmed (otherwise the
> checksum would be computed incorrectly over the unreceived tail of the
> buffer).
> 
> Trim first, so the import sees the packet as it was received.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
