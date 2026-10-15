Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A9856E05A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087669; cv=none; b=f3SS4RSC/oZjA8xewfk7l5UTSqhI1movxzFr/Ov7M//IcEmUktdNxAeE0+mISbJ6tbTUwxrluUiUFDgeeCwW2X4T4UfyaXl8qrZbkyAXCBeuWK5uXIRDe6lLJhgp5YlAXl4N1XaAwcWV3sPJDIDeyx+DF6UMfo6yLSDy1+PpVlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087669; c=relaxed/simple;
	bh=xAk9jUZ4tHEIPjhowarDu1pLkojlKzRtPIaVJYJ41As=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=aHw5jAvz014MgWYN59NcczEEloInyUnnpLq1PRIYiiqAD6+lzfJoe/Clr75XldS47oWsVeAWpCLIcf8HQ4ityM5DjAko77I/Bu3qEWBRxrQZlGv26lbSp4Iy5nkaX8e/e78R2KUVMmAr1KMKqMge1Qq8HIjhEzRVjE7ji/jJKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4z1QMg3; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4z1QMg3"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5e94120191cso3559052e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792087659; x=1792692459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nq2p8yOce4bNMEA6ygRhHxutRNrExZqu0Cd/fcqSm44=;
        b=a4z1QMg3lpDADkHZ0FctIrivV63CKx3EReOyWjA5oQvTVEfkTbINiZ0ckZZLvlXeD3
         SU0Iy5oiPGh4EP+3rxENFq1QGaz5JQjhi3fscWCJhcN5UzhtNFAQvH6mJbvzFa6feFUI
         PS4HZKyROvXdIGQ98gwjmL17bfLtiXCG7iqnc17e5zBBGQ9P3DGRUR6mvz0frntzWF2E
         u8NjnM175NdKh4jhI0Ss/32vLg2bMJBImwVa4Mem0eu83UDTuc3A12iiWy2uKqG82muf
         ZQIIFxHAjdmihHYPgvT1Sykr/GKoKvLGXkFFTf49z3fl4R2ScO9KLUE1HGeUIB6+KoEA
         keow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792087659; x=1792692459;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nq2p8yOce4bNMEA6ygRhHxutRNrExZqu0Cd/fcqSm44=;
        b=t8Rnz9ZZZhqJ0I77LtRZXi3ff/PzzgEkdJNI92eoEWeONUGYcjkBpzCg59oCpzXFlr
         OAbv8FZfNGRmItJ04cpUbBg2Y2y0QGWruM94cmUGKNp2YCFz5Y/6X15phXvhKXfMlVBP
         UbArylWtceQkBoCoo51yiR5TBhY/c2275rkIId3TiH9AfMeKpqCcpNmGXqcl+YJSxG7W
         chzQ47hloY8nsBeAy+7yP4Z6WMuy1BbLHtmOjf4vMKjycFMpUL4l0C7nTvriV1eGGDSd
         GTBvf0GXcqxG+BNRdMK7OwNiNwQet3gQkaNEQC8Ayj/3/9C/YnzwET073dnpZ0DMGOq9
         H/RA==
X-Forwarded-Encrypted: i=1; AKwUvBxdetW6ZeLZ6huIknAz4M0K2sPcY9j4EHeAP2OySZVAG3UcpIDpTN7xMEIini2ZBW8H7ClhOuR7cEIJfNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+BhGdxRV4m4Opeuw+YNFnbRZcdgvU3zP3clYtwei2DNsRPmnk
	cIVQCUNAlF/wX2sTtWUoJTmuBYObLdwg19NUrfjAOtAsCg/2n90EMZSJ
X-Gm-Gg: AYBFou1J/c+Ft9Bshd6AJ3JtwwmZIdwkBPym1GM2M+9FV4Q86T87pcLoU1v6hXgZDPf
	TH9DAbU0mH09HodD2UeXlpwOc08Z9lwAul9h6P1WWIzOidZKa9EDjuQNsKXL/Rg+D2HH44mJ7Xt
	es0/xNU95VakyU+CNAl1ix1P0QkiIYmU8jjUbxEm9DF9epj0J0l8GkWqrcyGfJlxH22L/wVdN+7
	25JPlsdPUT4iBD1XwVQ2sAzu5NcN/6VznYxY8f3PbJ8AiMGa5e7jcUPuf9AXtgDZnL2DdUXVCBm
	A4yu+4DI2c76RdA43J2B9tjuBz+P9II+g73rjlAVkfR7cXZiP8AQs3qiBy+y3/cbq+s832BdnnZ
	vMLn4mLUHQiDKqgwUk8vfnFXKFObyUcROVb4gbAJV2Miis++JzBMM5UtGA4wvudxVLMOwW1URVX
	iDjgWJqGlcXEmVdB8DAyrBbUlo5bwk31NuzNPd3m3u7MsEUfNYk5mtKEV951o21CobRAJyqLmqB
	+iFB/5yt92raRxMg6uQ/B9FIRWbdn5sxV83B6mC94+6UNtNfXx5nEpQQ9Wi7qlIvlNbb/4BRrzF
	132/OGN7wDZTwvlnq3vcruRppN/Wpuda2XIzfA==
X-Received: by 2002:a05:6122:8b83:b0:5ea:389c:51e4 with SMTP id 71dfb90a1353d-5ea389c5604mr1033114e0c.2.1792087659373;
        Thu, 15 Oct 2026 11:07:39 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea99491db7sm304799e0c.10.2026.10.15.11.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:07:38 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:07:38 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
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
 Rusty Russell <rusty@rustcorp.com.au>, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Paulos Yibelo <habte.yibelo@gmail.com>, 
 Chris Arges <carges@cloudflare.com>
Message-ID: <willemdebruijn.kernel.18c52b086550a@gmail.com>
In-Reply-To: <e66f7984fdeb8168e07fd7d0dad3deb8c30ead0a.1792067836.git.mst@redhat.com>
References: <cover.1792067836.git.mst@redhat.com>
 <e66f7984fdeb8168e07fd7d0dad3deb8c30ead0a.1792067836.git.mst@redhat.com>
Subject: Re: [PATCH net-next v2 4/7] net: resolve uncommon partial checksums
 at ingress
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> As reported first by Paulos Yibelo <habte.yibelo@gmail.com> (after which
> others, credited below, found more ways the bug can affect users) a
> virtio net header can place CHECKSUM_PARTIAL at any in-packet offset.
> If that state is retained, later checksum completion can modify the
> packet after protocol processing has made decisions from it.
> 
> Let's fix that: let's validate csum_start and csum_offset and only keep
> CHECKSUM_PARTIAL when csum_start and csum_offset match a parsed TCP or
> UDP header, while handling VLAN headers, IPv4 options and IPv6 extension
> headers.  Complete other non-GSO checksums immediately, before any
> protocol processing runs.
> 
> We can't easily "complete the checksum" for GSO we don't recognize - GSO
> assumes knowledge of the protocol. We could segment ignoring the
> checksum then do whatever csum_start and csum_offset say, but that
> seems like an overkill for something that shouldn't happen.
> 
> There's some risk here:
> - non-gso packets which can't be parsed get checksum calculated in
>   software, adding performance overhead
> - gso packets which can't be parsed get dropped

The biggest risk I see of valid packets reaching this path is packet
sockets that are not bound to a specific protocol (ETH_P_ALL) over a
non Ethernet device.

Iff proto is 0 we could try to infer from the first nibble at the
network header:

+	iph = (const void *)(skb->data + nhoff);
+	if (!proto) {
+		if (iph->version == 4)
+			proto = htons(ETH_P_IP);
+		else if (iph->version == 6)
+			proto = htons(ETH_P_IPV6);
+	}

