Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB19E3BED2D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818237; cv=none; b=DB96ezF0dkHFvFgw8qb4pvI+TxKsJxwmw8pz37DCBvUk/cuc+7YNfNjhI7pUhypqC47f75mJ9ysPRu4CRyDQ4SDkPX++Fh90vlqXbCvSItep5K4Krd4UZlSHthPO3xZDe8Lq9s0GoOSljknT9y5VGTMAkYDC37YnvvGSA5y/y8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818237; c=relaxed/simple;
	bh=v8DlLY7ma2LyAtWyVwiNsJ5k6Cb0yYYgQsJlQMG0xg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPm3Nnx5cAfHJ5OT/FzCMYs7JHsHfM34yocGaHzX2jfanQWVVqlGqri5StvCRrBYdGR6wjeWsFZywklvfOyfn+K3Ey1JOHCYhrbO9qh7Cm2YdW/OE5JR6H010FL5D97u4bv/FYcjx8REWMLoU5RPbrS++ngrXVJIMOi00VzWcEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KBIcBuTL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BqJjMqYU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KBIcBuTL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BqJjMqYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787818234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjEuQn0GyYN4mR6spCUyGj8pF4DNE5yUhyvyjSUBEAA=;
	b=KBIcBuTLFmfvETNuNjm+YClnbWyh1iNU6VfyNlhMHyy7ravDB7HxtGFqe9GXwa1/LwRVwr
	eHnsFAmubfN6QM2WooHwg4Y7SVNyf12dys+Yzcn4cHT0OxTX0ppqVfrzMeYbXEOP4lGJdq
	AT3xq+tDiXIwXywRNdRSSC+eEAwb5eE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-wzf5o6J6NQ-XR-uPLugY1Q-1; Thu, 27 Aug 2026 04:10:32 -0400
X-MC-Unique: wzf5o6J6NQ-XR-uPLugY1Q-1
X-Mimecast-MFC-AGG-ID: wzf5o6J6NQ-XR-uPLugY1Q_1787818232
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so3442095e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787818232; x=1788423032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjEuQn0GyYN4mR6spCUyGj8pF4DNE5yUhyvyjSUBEAA=;
        b=BqJjMqYU2/36jLSx9+Pe5fLck42enSGzdoE3bcUpcSOMU6JRdMp44mSRRpmT0uFfVH
         dCgA5t53caeWMUgQfzMGj2/asBf3zuCVwV/cAYzWDU02VTQ13Bdipl2hVMmEUCAF0q2k
         Of4ujqOg8/+pL3Ttb8OeOeG6i2GPCnoYPsAw+nEa/oBd9YQA+LSH1jPNzz/mZRijQ0tn
         Q0s9mKhETN82aAP3KVbzt1r0bQvRqyBY2EcEpQvKxm9sR8uU4VhorUaeFYyvt1jyDKAm
         /ZmcO3hs4hfxrXX6GuXsDNpffE41w3qkBLtnmkmZmfbDiSTLvl2natsjjnEnyP6gxZB5
         HyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818232; x=1788423032;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjEuQn0GyYN4mR6spCUyGj8pF4DNE5yUhyvyjSUBEAA=;
        b=KwYKFiRqm1d4E9+KeVr5a3KU3Rf0K9pQr1qWHqnaMNECFMIRs4XjqvQ46C+PDUvcvB
         VZaVawntQyZf8sYb7KNvh53ZoJe8OcBm7OfjKJHluMWDznMVNpavSgXWngY8j1+M1AyZ
         mirCPwRHc7G9jC1u/NnAjF18KQa9MqgpAS+QP3tq8wbYVwXUoyjYiYwi46uVFZmAjM6A
         JcqUeGOc9ogTudKrsYhNt8Aq05sZBPWany6eRmYpUAn/Df13pS24qmTwwDKt+GksBFkC
         rZ2AK93jwnQxKIU08ceMBSRFYRfD8eA9/o4+QLLgMfen6Qe/iNJcZAv6dj2QG9exNR82
         MTTA==
X-Forwarded-Encrypted: i=1; AHgh+RqjN0BnSwXKMxhVadB4ThbdeNFgEwSaNuRUhT9mnITTd7Jn3qTh5gc7T9eUElhSw59E9m/1slCE6eZDGck=@vger.kernel.org
X-Gm-Message-State: AFuF++kQrqGitYLFv8YUjKylPfV3P5s3bFlXaXqNd4TFa3NRDYnxoAMc
	G+1PcI4fqR67zPlF5s+3q2Fquv0r1jVt+usGJG0dM6u5SsNu2mg2YAUUshCSepWu6MBP9Bn+DhJ
	XbSP0NHYuemXkwdtV8goMh70tufNCPqXAdJ6XSxkMyjklPk/8uiBDxf1PmCt0jojoyA==
X-Gm-Gg: AR+sD12dlMIBlewOBu39FJGRLbwa9/bHE2YhceAys1BvXaVPYEk+5eIlz6EwhodsGpw
	vLyFQlF0hwGUIxwdvOaCulpCBKqR5jnWjfWSVdYOmi5MZr6lUSlJdeI3FrsAIOjsEHb7jUw53Dy
	0Rkzdj7k07nE5s3VIPIKtcIAEg7F68UW+t5IiQPMqfjFeYPJRsziqPpF4+w1c4sDfHYzjMAV4tD
	AW0JjuonXrvmS9CJzj88/0hmRJV47UzPqWQJAwYOUXzRe2aSgQyQd8Lk5hjCKFos1gnE9u5QqeD
	rS2Bi1o8vMyee8tRL2JaMmc41ZRxPNvI2a4NKJkW//6hMykRZ9zYhBL9B4bYM2M8JqOUkUdlyxx
	geP35KMBVDVJKZ6doSYXvZI5pm63mNP54miTrqu1yngf1hvfp5cFMVscH8iHdmxIIusV4oJA=
X-Received: by 2002:a05:600c:a43:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-499dc717e27mr129887165e9.9.1787818231666;
        Thu, 27 Aug 2026 01:10:31 -0700 (PDT)
X-Received: by 2002:a05:600c:a43:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-499dc717e27mr129885015e9.9.1787818230497;
        Thu, 27 Aug 2026 01:10:30 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56acedsm61647295e9.3.2026.08.27.01.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:10:29 -0700 (PDT)
Message-ID: <69d874a2-dc5e-45c5-8f94-418d5a73e738@redhat.com>
Date: Thu, 27 Aug 2026 10:10:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: fec: support RX flushing via an ethtool
 private flag
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, netdev@vger.kernel.org
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260825091908.1362677-1-alexander.sverdlin@siemens.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260825091908.1362677-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/25/26 11:19 AM, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> The FEC controller can flush the RX FIFO of an individual receive queue
> through the RX_FLUSHn bits of the FEC_QOS_SCHEME (ENET_QOS) register.
> 
> RX flushing prevents frames in the RX FIFO from being blocked. Blocking
> can occur when the frame at the head of the RX FIFO cannot be forwarded
> because the ring it is associated with cannot accept it, i.e. when the
> ring's RxBD[EMPTY] is not set or ENET_RDARn is not set. When RX flushing
> is enabled for a ring, such a blocking frame is flushed (discarded)
> instead of stalling the FIFO and holding up the other rings.
> 
> Expose this per-queue capability as a runtime ethtool private flag
> ("rx-flush-qN").
> 
> Due to erratum ERR050395 (observed e.g. on i.MX8QXP), enabling RX flushing
> on more than one queue at a time can lock up the receive path, so only a
> single queue may have flushing enabled.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

