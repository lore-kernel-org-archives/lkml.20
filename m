Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF82C15BB
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791054111; cv=none; b=oZ1rJQ6pbxe41dBV/KU4zglI2l6afaDR1CyDdy/k7lCUlWbYjt+Seoq/Feo1ZjjCaMNJuISsc3KzkvTYZ29Nu2qccGwXb/9RpUO0LyQnH/C97pHfou1lvnLZNEPborf0/jt5fakhogTJxOGVFrcXqJmCWr2iYrnIlTvPEdsMcCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791054111; c=relaxed/simple;
	bh=48MhTw9wDTWEKEZw4bUxBTpp1TwSf7rxa59pL1W+mKg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=kn5QrZ4eQk8m8MhtUPMXBIhqc9VrzMP8hwmIr0fHbzxZDSEdeZ8zDswzDA6VRrjSZvGPjgFl6INdUHykOa7wYfElpzQvFMQ7fIFBvxvtu/En8kH8qAppWoXVy2h/EOODQVbGxnjXiAj+I9te9syYcHHUhsv6Q3XHpuSn9fXvr+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1hWPjWe; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1hWPjWe"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-671563fb8beso483453d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791054109; x=1791658909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sXTMSYgeBEoDskD3IWbphONoA+AtnWoFnnYeCTTaSZw=;
        b=r1hWPjWegVV4xj+/IzTFcfoEwodLN/AlnoV/WfRmbA4Q5/6QclO9YxhXJUtX8FtJzI
         ysKSEX+wCY2WN+0MD1q43RgVSJbXJV8NydVIVuT/Mfk5jw3iivnwIVPHBkbsO+iFxfbi
         D6UdepomsJAnRsb2qC23dboqum5I/hN/5CkrTfPtqAFdWL3h6st/BW79NNVYmhWGlte2
         +cl+q2kD7HzyBofED7DBTCurxhoQaL/twpdRpijPnYnBYGrqssKexs5ArRs5fF6nU8XK
         7w4s5KJmB7jmE+2AaB8J3mRhCXtv/OrQBOM5gXFK/fvsvn/VIbnGQr4NSZbPRypSVh92
         Om6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791054109; x=1791658909;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXTMSYgeBEoDskD3IWbphONoA+AtnWoFnnYeCTTaSZw=;
        b=U7FZIrXcX+oybwsuNxXCLWhsNWvvX+TG6fXb/h/6sNWySzAB+1pRSP2drmLuZwEB1M
         6TfxcLprHO+6dKsX56HLbf3P4X3Dy1ifjL3+es6o/cn2oGgPjLEdQdiQzBbqXKM5vO6i
         muBkVu5cxoEjuS+U/P4696zNl77vXbj7OijPLPcZBGFA08tLpRl5oUawTFIqvfif0DjZ
         e35zWcMku70eP3WgK1ovSPUdvlwbays6TZO7yZYtj/jJ0tGdhjNDtXRsyk8LH3N9yYep
         4x6iOgA3kw0jxVSRNmd2TVtMlkMtFT0tFnjAEVQAfVB8ayTkau/E3IQ1Di7LcckD6MXQ
         GD+A==
X-Forwarded-Encrypted: i=1; AKwUvBxeh3gQH9usMBBU4Lz89rJ+7gfcLkoJxFab2yN2xyCMADqzMupBf2FZUAcZajZuN6gV5zTMVmwjhyaMp6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+Kr9nnUhAzztYJ9TdZTnF4FGoPfdZcB7DCZNb7jw/gd+WR0RV
	lIlIIIuFlJGRppp3kxmrXIhVR+2UctjJy4AGQ9rcN526lDdlRJIi/W+W
X-Gm-Gg: AYBFou03wq01/ujraWvXxow+rqTU0ImtLc/dlYiqBQoCj06egni5Ew4X8es4zCLLm4t
	apLQjjvLW/ODIa7Vvhw9vQYxFJ6tmkEEaErRtZ7PulCss6W5pYI7kvZ7OrAOmydRGXe5QWjluii
	f9Wwvi8kgon2378FWzVEWj3z7Oa3kVtRniG6roIEkoP5uf/6XH6C48144R+c3BPnpfCdlTdcBLL
	VJf7SVow8xh4djq30CRwU98Stpu6OhD5/9hU/W0mXpyph0ANd2Vsngb9BuAi8iggCDbPH/oSzFN
	w55GAju9CJu+hhh8eS6okelb0PXXQDi3DT6MlQJ+u8ef8rS9ZGLrBe6pInqivNIZr8HnFaowOwt
	Zdixgf328eN2IQQxHp7qRif5vVvrMaYeGAjn5ROONYnHfXLTwaGldmIKbakr+bZZj0jDT0ULqd3
	IrDHLzHjr4izFUxsEALGTL/oL64k+/ttI9Wz1HchU7vZpum1gedycSOn3w96EdE/36vBdXwI4Sp
	2Hvn4z4paQMuikYNVFCFITnV/gg+nVNZu4kcejCIJw6nnFp0UKC
X-Received: by 2002:a53:ac8f:0:b0:677:ae5f:927f with SMTP id 956f58d0204a3-677ae5f941dmr2335560d50.106.1791054109124;
        Sat, 03 Oct 2026 12:01:49 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1bf368esm906480d50.20.2026.10.03.12.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:01:48 -0700 (PDT)
Date: Sat, 03 Oct 2026 15:01:48 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>, 
 netdev@vger.kernel.org
Cc: Martin Varghese <martin.varghese@nokia.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Alice Mikityanska <alice.kernel@fastmail.im>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 linux-kernel@vger.kernel.org, 
 Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Message-ID: <willemdebruijn.kernel.d7c5ac3be7fc@gmail.com>
In-Reply-To: <20261002153039.462663-1-yanhaishuang@cmss.chinamobile.com>
References: <20261002153039.462663-1-yanhaishuang@cmss.chinamobile.com>
Subject: Re: [PATCH net] bareudp: set the inner protocol to the protocol of
 the packet
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Haishuang Yan wrote:
> bareudp_xmit_skb() sets the inner protocol of the skb to the configured
> ethertype, and bareudp6_xmit_skb() does not set it at all. The inner
> protocol is used by skb_udp_tunnel_segment() to segment the inner packet
> when GSO has to be done in software, for instance when the lower device
> does not offload the checksum.
> 
> With multiproto, an IPv4 device also carries IPv6, so the IPv6 header
> is parsed as an IPv4 one. With IPv6 underlay, the inner protocol is
> whatever the skb had before. In both cases segmentation fails and the
> packets are dropped. With veth tx checksum offload disabled, iperf3 TCP
> over bareudp gets about 10 Mbit/s with thousands of retransmits instead
> of about 700 Mbit/s for IPv6 over IPv4 and for both families over IPv6,
> while IPv4 over IPv4 works.

(not for this fix patch)

optionally tools/testing/selftests/net/bareudp.sh could run a stream
test besides/alongside the ping test, to exercise this path (with
segmentation offload disabled).

> At this point skb->protocol is the protocol of the inner packet, which
> bareudp_xmit() has already checked against the configuration, so use it
> on both paths.
> 
> Fixes: 571912c69f0e ("net: UDP tunnel encapsulation module for tunnelling different protocols like MPLS, IP, NSH etc.")
> Fixes: 4b5f67232d95 ("net: Special handling for IP & MPLS.")
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
