Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794126243;
	b=T9WOeLrM9qWNRyBWfl3n7eOxGhYcBWlBmhHpI67c7Lkh3JftDqaYjoln8inKDLdoTHo6
	 i+1sSc/eGF/uqKv6rBTZSbKJ+cQmJDyMKHsi6JfImG6IwAtKn8LhnD4ranfMc2uX/70W0
	 YkcnxadxUE4zvOVHjwahR5MdkoWZ0FxyOFtm+AbdfsmtB1xe14XozYgvza3Q7yU7T06Jm
	 dxwtDA/l1Eh6eMrfqD3Sgttyq+rOiVbhs0hiAkGxTi5/02KDbq3Tq16w8S1W7oyRFxLgh
	 EcZ7lux29a9StoLHcvb78s5glbbMY9wCgB+EMJ8Fw/X95OvDCUtAisyQYWjH+G6slCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794126243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qHVWSqA22IRi0IWfM3WN+vs5MdfzayNNwpdec0UidNM=;
	b=TbAcKSL0xi4mgRLnprPQwVC+kicGdRguYTCIbRdsPL8l936aBWvxP04mmBQbc8NsngRF
	 rgIaghFfrDjqfahrBxT+oXj9BqSCl54C0kHOfNjPBIsEmLLO0DmDnRYOlGLGSwk8U/ETs
	 kjzlZ3HrD6YAkvEzqnl7PKNmqZeRwHqW0VCSm3z4jtGUSAOtK8IctUefZCsTL/i6WhcJc
	 BN9zVVM6vVWnU6FmCbrNq7tbzBMljJ06refYtSj74oHyoi/i3CIUz2IyLPXDHBEfFd6Ly
	 VrcewF5gcV+2np6COr0qO4woQBIaqozZN9yNEwVRU+xAHTpr8jkZDPJ5TwuZch4JqpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Pg/txO38";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AA6606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AA6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pg/txO38
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14fc585291cso84767c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794126242; x=1794731042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qHVWSqA22IRi0IWfM3WN+vs5MdfzayNNwpdec0UidNM=;
        b=Pg/txO38QDBLU/kPMmr0doFaKJhLaG0yfEYjP5FcS60APBa1d9UfSoGEaxKhDhWGb+
         ZBzTOOtubBCVZ88C2475nlvpkl89C9dYbsVr0xCqzbv5i5RN86X0ld0KCQ/kIajDNym2
         F0IvTqAEx5FDPP9iZr/xBZf2jtcxWyycBhiNAGhfTC89lbaUjwT49mKjqtguLwuiVCO7
         g1x2+wiHuA1e1ObRrE3qyPKbpMCQx3zuOAYeeVfJ5P9HlISecgd+3GfbI0H20uJA3Iuf
         WdGQinPOhtMOqaLDZHfS/FOjRqAWseeAfJ60GNeTIYu8iCDn7VVXqscbU7JTkhWJVeaU
         9KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794126242; x=1794731042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHVWSqA22IRi0IWfM3WN+vs5MdfzayNNwpdec0UidNM=;
        b=FpV6qWfD2FQ7BVLA3ZsTPwHe4UJkppSDaBiHbW9HNu9c4C7k848hq51Zxu77NOZCU1
         XkNZcbUFT7xTqQY0o8hgKOXr//QrLYnwZSR9usCp6Ffapj4EaK88zb3LyNh36FDGRg7I
         MejyTtTO3J4WDwkPF1vH0+1Z10CAGvqnt4RX4By3RCDhUjMP4KEnZiuw8Ru9OfVFxztj
         AZhynHk2qKWs48mHYKsm3vlyuCAcZA0K36Is4R9AtNHzD3wmkYvhK4T/ob0CGx9lXcv+
         fPAcbI6S6yZ6oj1Nyn4OF07hp4HumoeBg7xHU48XzRYR6P+VBnDclTpd8z2RwBfXdwg2
         sdOg==
X-Forwarded-Encrypted: i=1; AL+hErFwDmf/jdiRvNRj6SUvhrgAn4OQIts7hlhOAyeDUgxudCaDX02aUjxbp9zKjh6lXV8WAE+n60N7QGTxrpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LKpeweNX+042U+wrd3GA+ykl5lOlukg2XB0JMIfzP+/zd4tka
	9HB32FlEN1iNUMXmcE4/En9d+izOb+6Nc1jr6YiIF/4LZHpX1Qbb9bku
X-Gm-Gg: AYBFou0JoGhW3GBVtDsV+77OfGIHFn/FuvghupcEVKHyKBdF+ZonWQp3f58naZPAAQe
	v3ZfrZxkEDfNw8XKsyqSWKBaxbQeYbCHx+mleX2Wu2zGuILbxaG4p7V/qhc6EzuGNpbauZXH10v
	p+r5WgxS6luqdUlDX3CGe1rm0yHeGqFmhYue06Gr+EuQOpfodsT+M7ODtERLuXHhYwYJMs3R3Sj
	+RMp9ceM8wnTWdOtgiHy8md+LFwCTve0PjIKutbMbzwWl2TFy62YoC1ttdPoJ405fDPbE+/zib+
	zabdbEzq4GucC9TgySrnexGSXiOkXpyQ4mAIlL2x1CxqZGsAoh24TM9ZDz8GT2Ot1tloRW1+8bq
	I7SRgXNHj1DCh5sz6lBQFHFyHLxYPFveKog1NbveY/ZR7E2Q4Hk1z4yO68JXln63Y8DUs89P/uG
	9Z73a0+QKZ6nwgg/z15vVRP1DCbFlkpfWwlrOuYp8o019froBemxrm1CkbFqNpk3Z3tXFTwE8OS
	vAoJwBC2zR1ra7Uhj4MRkDMUUZn3bZMP1NKGRqu0vXO+MWTk+eDITlDZHzZ9fLEpWCiG+nwzYiI
	iBqsiNET5GthfVLKvJUr+8hawQQJ
X-Received: by 2002:a05:701b:260d:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b39feb35dcmr1247987c88.27.1794126242051;
        Sun, 08 Nov 2026 00:24:02 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:66::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3731487edsm4577292c88.2.2026.11.08.00.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:24:01 -0800 (PST)
Date: Sun, 8 Nov 2026 00:24:00 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	willemb@google.com, mst@redhat.com, jasowangio@gmail.com,
	eperezma@redhat.com, willemdebruijn.kernel@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: add a KUnit test for the
 alloc_skb_with_frags() tail split
Message-ID: <avAxoDhRA/qgo7oM@gmail.com>
References: <20261108100617.23840-1-yanhaishuang@cmss.chinamobile.com>
 <20261108100617.23840-3-yanhaishuang@cmss.chinamobile.com>
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
In-Reply-To: <20261108100617.23840-3-yanhaishuang@cmss.chinamobile.com>

On Sun, Nov 08, 2026 at 07:06:17PM +0900, Haishuang Yan wrote:
> Allocate MAX_SKB_FRAGS - 2 full chunks of PAGE_ALLOC_COSTLY_ORDER plus
> a 7 page tail. Rounding the tail down to 4 + 2 + 1 pages would need
> one frag more than MAX_SKB_FRAGS, which made the allocation fail with
> -ENOBUFS before the previous patch.
> 
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  net/core/net_test.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/net/core/net_test.c b/net/core/net_test.c

Thanks, I tried it locally.
Reviewed-by: Narcisa Vasile <narcisav.kernel@gmail.com>
