Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8768406269
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271571; cv=none; b=rsOumdniTsGyEINmoicg+4Jv8gTdIZA0Qkov7cTJK51Lhlqx6iD4oHfrjmP09wEuilV3DAq3bTRDXy76SkTfrsXSshL8h6/lMZMdFRXMOv/jS63u6RBvtjkMkNOm8dabbCJlOcIfGc3k6mCf6iZHPzVLjHLSf3pZiqhmly2BKvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271571; c=relaxed/simple;
	bh=SgwD3wWY96UMdD/fOd5W3tOGifSkfDvuwVKz8MZDNjQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=UhTQDiynWi2J9jhw+Vdn7+m4WqXbzuOneGtj1NvyiMBX47ndNpi1gu2W3BJCc9ZYYDwJQOyBt3CIXiQcU61GgMTNAP+70EcxcZen/0RwaOrrP+KzGhN5pQQKyGWpDmLKOqwfEqQQVnmhRnyIuEXVY7rNwqnl9x3nt84bUaylAqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9uQRAn+; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9uQRAn+"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81f3b227a4aso12056177b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271569; x=1788876369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5lSbV3WqhosfQnjNgDrl2jnEdo6wDJR4cvwjRytfZyc=;
        b=K9uQRAn+k71QtZNvSzsBKx7/DCfdJCKMWGVIWixYKN+FmYxGQJn1oamJ6mbUQVcNKN
         DozhuVA2pm80fKADaD2BEk93PRLCCLfwnSRCoreU8dOde9BcJaPWH0wWRIrrqnwX0sNW
         qNtb7yt3/lfCcmdznN7y7rXgC86kz7TID5MKpCih8KALdeA8/Fbr9Kn0BW5GWI4iDOy6
         oqvd0Sd+qVYUxLY28SEA0xn9rWmIkZ97a18ybuXWqy+1RNxM/6VWz5qgqxv4AYNLPUFJ
         TroAbKUuWLryMnvh4/t/Dccf62saFgQtih+xs4+KsFDlkxQn7ARYmwQ9bAUWQKuP5dP6
         3vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271569; x=1788876369;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lSbV3WqhosfQnjNgDrl2jnEdo6wDJR4cvwjRytfZyc=;
        b=Ri+EgflMROSnK8SD6P9CKGRrVNFFsc5u0jxzu4yWds+zm1thuXNV87IF6Fby0rjYzg
         qFe059IcIyMD8cu9q8vXZY1v+vQCrvmZAv7w9c/6YRzZke+MaiXYyEUbpKF3uaoEYua+
         WJ862aeb+iv10k4+6SEEt3sCeWMwDBflZNw5S/0KkSMP6hNTlOIYGHlN4aaiWY8okz+q
         ZTiiakgV+tJAI+hn4Iz0+Jfjz2H2p/A5OQof/1CMe94d68aQ4WyBBEAhw3jDZr/Onxm7
         yvg3NoAdl6lNdFuIH1PIfKUSWphRve//ZfYYrcbjBIgmrjqFQSqejqcc4lA0Jyxv/eCx
         wDbQ==
X-Forwarded-Encrypted: i=1; AKwUvByvxEnew5KAVbtJmmu0m6GdCPoio5BDj6sKQdc0xCwnKb00Z/MKml/6gBN6hhM6GJEKqfrBkLj+uenbpd0=@vger.kernel.org
X-Gm-Message-State: AFuF++n9ejiWKCgy7swf3OQOuyB+exwY7Kabj9WMf5s+wpGE0RU03YzQ
	tjXaATmWG4DRIKFSSh6cizUtK4JeJ6aiRdADE+R9n8QREGqzibpF+C7q
X-Gm-Gg: AYBFou3D8dSfi1NpCHKq+hUeeNVBQyYllJZ140wXuyarypEo6Xb1Kta56jv/HmC56hp
	3F7ruKntuyPLFFSKrayH3POLd5UFz0hut9pmLZzOqnBvNLbnjkxiVUQco4arhXSwetvJ/5y07x1
	2Liwjc4zjb+T6aq2YM0z9x0kkpiDo8SYkXIDo/Cyj7KTVmGj70e/LikxtPt3P5Mpyl+Wtowng60
	LLd7C6mVMsaNBW0KPnar7IDMYVOC4PVroS3diUOR9RcoEIRw9yfYuxMgLbBdK/GhLSjVlnVNqQS
	WUxXr/m1UCOAlUJmK2RO4psOuxg01/5WNqNySKj6UIv8x+I14Z2Tq3ZrMIkCstoe7cZR2R+uEzK
	qUxZ01AdjcecSgJRXDSqUc1co4FeE8lKmUKNMdHe5eEbJXoAy2BEWZSRUNYmzi379l2xbpIxJ1o
	TncUXtL09CxRFUzE2u2QsY+yFC38vInS8D3Ybh0oEtKSrPX5KIAt7Mu0y2yARm8zzcTPTgcE7km
	MRU7lvrqm81rRILKmEHeV1tLZ5iygFBgyXEdG/1gw==
X-Received: by 2002:a05:690c:e3c4:b0:854:5db3:4ed0 with SMTP id 00721157ae682-85d6f3dd5aamr124890337b3.31.1788271568230;
        Tue, 01 Sep 2026 07:06:08 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e679512easm74673717b3.48.2026.09.01.07.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:06:07 -0700 (PDT)
Date: Tue, 01 Sep 2026 10:06:06 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junnan Zhang <zhangjn_dev@163.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Hangbin Liu <liuhangbin@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 zhangjn_dev@163.com, 
 Junnan Zhang <zhangjn11@chinatelecom.cn>, 
 Shouxin Sun <sunshx@chinatelecom.cn>
Message-ID: <willemdebruijn.kernel.2ca4f939269a3@gmail.com>
In-Reply-To: <20260901074214.57717-1-zhangjn_dev@163.com>
References: <20260901074214.57717-1-zhangjn_dev@163.com>
Subject: Re: [PATCH net v3] net/packet: fix network header offset for non-VLAN
 raw packets on VLAN subinterfaces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junnan Zhang wrote:
> AF_PACKET SOCK_RAW sets skb network_header to dev->hard_header_len in
> packet_snd(). On VLAN subinterfaces with software tag insertion,
> hard_header_len includes space for the VLAN tag (ETH_HLEN + VLAN_HLEN =
> 18) while min_header_len is the on-wire Ethernet header length
> (ETH_HLEN = 14). A non-VLAN SOCK_RAW frame carries a standard 14-byte
> Ethernet header, so its L3 header sits at min_header_len, not
> hard_header_len.
> 
> packet_parse_headers() only corrects network_header for VLAN-tagged
> frames. For non-VLAN frames it leaves network_header at hard_header_len,
> so the IP header is found VLAN_HLEN bytes too late and
> inet_gso_segment() fails with -EINVAL.
> 
> Observed on a virtio_net NIC (KVM guest) that advertises
> NETIF_F_HW_VLAN_CTAG_FILTER but not NETIF_F_HW_VLAN_CTAG_TX, so VLAN
> subinterfaces use software tag insertion (hard_header_len = 18). An
> AF_PACKET SOCK_RAW socket bound to the VLAN subinterface with
> PACKET_VNET_HDR enabled sends a large IPv4/TCP frame exceeding the path
> MTU, with gso_type set in the virtio-net header. The user frame is a
> plain [ethhdr][IP...] layout without a VLAN tag;
> vlan_dev_hard_start_xmit() only attaches the tag metadata via
> __vlan_hwaccel_put_tag(), and validate_xmit_vlan() on the physical
> device later inserts the actual tag bytes via
> __vlan_hwaccel_push_inside(). With network_header stuck at 18 while the
> real IP header is at ETH_HLEN (14), inet_gso_segment() reads a
> misaligned ip_hdr(skb) and returns -EINVAL.
> 
> For non-VLAN SOCK_RAW frames on VLAN subinterfaces, set network_header
> to min_header_len so that the L3/L4 header positions match the actual
> on-the-wire frame.
> 
> This fix is placed before skb_probe_transport_header() so that both the
> transport header probe (which uses skb_network_offset() as nhoff) and
> subsequent GSO see the right L3/L4 offsets. It complements
> commit 01fdecc0480d ("net: packet: fix wrong transport_header when sending VLAN-tagged frame")
> which only covers VLAN-tagged frames.
> 
> Fixes: dfed913e8b55 ("net/af_packet: add VLAN support for AF_PACKET SOCK_RAW GSO")
> Signed-off-by: Junnan Zhang <zhangjn11@chinatelecom.cn>
> Signed-off-by: Shouxin Sun <sunshx@chinatelecom.cn>
> Signed-off-by: Junnan Zhang <zhangjn_dev@163.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
