Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269468;
	b=nxwQYOsiLaNgc/j1S1mbkcf+xgUqBqGVpbEP7SUillLw+hcGQehJgLk/26Fp+AenKR1Q
	 QC3PX55SCH3tFQfjFika1mcGt06QNEkShAHpgrGaD+v0q5Mv9DC0LKEJzokcm83ejwa7U
	 TIhEejmckNY/Vqcln96b7kz7dPXmvZh9e6zphKpPxSuUpchz4+HChW4rxgGHp/9elrHAD
	 mbRfzz1qaswg19joGpIRi+SGhZtXAhqzco/G7sJ5InXyMweoeK0xjhjkHRtm88+fLGEbb
	 UeA0mW877YC8qqoQ+LycjzOIfAPDE7HBoFrGvbphAiZzaPapKvLPzIT0XVHOWPsk23g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269468;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=foACqNTou6WaxjVswdP0rg9NJ/Jpun+aF/kRBHAU79E=;
	b=VPWhMj0IQ1D8JymhaKOqaOB98//hBW9wHq9biKP/JDWMyo7j0QqVpVQXuk512eQ57FTg
	 okPgoRf0cTL/JqfOmEj0ilnMg5L4TVGmEU7rr5zbYTIKWCX/n1u8VT/WIDrpsZKvpqo9P
	 TexXI0y46Umay9jYQGB9bIzz1sDAMHUxenzywKUZHC3/DNe2GKgrd2XJgVEILgyEgVLnL
	 lA+RtAwA1r24QGA6cdmsuE02YB7qB0Yee0ZXf1wEvNX0QIYOkWYQG3yQ4iB3HqwuHR52l
	 U9wPU8k6XhtGg+S/qp/sPZlXEyWsZz2GLhC9SCa8zXFdUItWtG2eClLItt3clOr0pcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fVHeQ5xu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U0QCF0NH;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D0606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7D0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fVHeQ5xu;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U0QCF0NH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793269464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foACqNTou6WaxjVswdP0rg9NJ/Jpun+aF/kRBHAU79E=;
	b=fVHeQ5xujY1im3YGkG724ck9iYIDYAeI3QwFTKAS7Uc0Oewq59NxnI+162yG2ZjnH0V4du
	QwMK5N+A28c/X+nN9fPORbwkr8iN8N5Tl/RTXBnYkbmV9PmCdGGl7ruzo5ZevZR2jaSGDc
	mK1OybVtbaiGnUfrY+ngPcpXDXZIm9Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-ZKGZw4zkMbS26YfKlKGing-1; Thu, 29 Oct 2026 06:24:21 -0400
X-MC-Unique: ZKGZw4zkMbS26YfKlKGing-1
X-Mimecast-MFC-AGG-ID: ZKGZw4zkMbS26YfKlKGing_1793269460
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c430f0f01so1627182f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793269460; x=1793874260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foACqNTou6WaxjVswdP0rg9NJ/Jpun+aF/kRBHAU79E=;
        b=U0QCF0NHNwmseoKO1ccCw6zFVqKtN3PwI0CAkdhsK0BSNj1JI5uNdJYsA5+toiZ4+I
         zABX4aRqZBmQY/O5CmgkeH9AsC11+DGchomCsMBt7qCxzmuL1Lmu9b95v4jGegtp3G+S
         mKmHvGmDk0s0/qPxB1g9lGh7YQ/bQwfwHmqjHKTAiLGrjHViQF5xd9e891tenpnVEYpw
         iafYXTNKIxDsCNtPZcLkCW34qr6qJej1kvrpNocTEVfbnG87g4Gx00adKSQCCamXaH9+
         mZNesZIXgWUEdJsIUzQA6yzWruXm8hHRgE8Bzr6GWr2PM+3P5stgDO6EalPNgOGGVZd8
         ck/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269460; x=1793874260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=foACqNTou6WaxjVswdP0rg9NJ/Jpun+aF/kRBHAU79E=;
        b=YsNwRizC+g7qu12Wxwuyxk6c/sxFBeBh1z73EOpBTWni4uXotkFs5SU2lPL8vF5LdN
         QpE8LPUqCQ290quVRWujRNx2SuyNU03zEPJL+h8H5eQlbRGCOfoNYisyJ3QAjNQLJs90
         FWqm93WvZkAXdKnB5GQYGT834SQPWBNZcjQfgJ67ISitCdUmYNKzBVv6fX5l9W8+IMyO
         4W8t6Eaj/WNUg/KYDnlzY6dun/UEN+rPaZsHq1V10DPdqWIK3/RfvGkhNJ+8r+vzc38h
         Zr5QOAbFHNkJcy/L+u8QoJchfOMn/cWoWKv88QbfeOc0ADAuqP0K5Njg431SzfbfS1+j
         pgJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrX6Yzx59ymj35aIQP8syDbMrkBDjUtId9FWZYYUAWivLBh0iclmxZ391OtLjwg5ZgdG5zfEE8/6yjFgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKFQx4a35W8heqKiCP7/kQQRgSpIPZXyLYNUUBaUw8B7hTOBhR
	iq6G7q6TQ87js0BTmPFA/seg4rjDkhrpL1t47T5QsXKDFjgwk53IoQJI+or/SqoYeh7BwdFajSv
	pL9KH4+InAPVz6LQB7SaBCwAJlc5Vq2v/87ZmolyE2M77qlIlIulFHkYRbOmbTdjAGQ==
X-Gm-Gg: AYBFou3yMRdEB4Ys3pfpQLRPZyDpQSxJM5Xf7NVPHZZofATjpLqNymaWlf/BD7VYcA0
	7UV6rkS/yNiXwHbqRUIAr0CQk1UnVEHBdijUosm9D6YgBiaKkauDCRyGL2DKGuMEmkjve/RaJSl
	trcSZ/vYTjX0LMSc3WMuop7x328fFTvlaXlbG93XrMTwApt0XTrSNDRzU9RPQfcI+pwfCqlR6Pd
	CmWL4HzYWpD0ug4CeVi8YaUisyPQSnYPqnaLiE5Rs2rACVs2bQd3RcLsKh9Ri3MdVRnaNb9fJJ7
	/1xpYTLlQhe3+J2ru0EbSKY5q5LITBmA06ktqTj1z7h2i4uU3n9G74svPIVmr37cLawOzNPPm5s
	8jZSX5Q0lUz/kZTr+6Xx4MN52VmBNMpJ9ylBdncX8Diam/Nn3RjEc64YNfkB1Cs3Gpf0nr6BELN
	JYAiPg99CFLZKNBOc2CtNuOUYShX04GCJt5YYvcj5NaPjgpDs=
X-Received: by 2002:a5d:5e8d:0:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-48e5d45a4edmr11994828f8f.27.1793269459750;
        Thu, 29 Oct 2026 03:24:19 -0700 (PDT)
X-Received: by 2002:a5d:5e8d:0:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-48e5d45a4edmr11994775f8f.27.1793269459257;
        Thu, 29 Oct 2026 03:24:19 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm40661159f8f.45.2026.10.29.03.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:24:18 -0700 (PDT)
Message-ID: <3fdea60e-abe8-4ecc-bce2-672f4e3d6b47@redhat.com>
Date: Thu, 29 Oct 2026 11:24:17 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/4] net: stmmac: fix DMA descriptor ring
 cleanup issues
To: Ding Hui <dinghui1111@163.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com
References: <20261024071319.875921-1-dinghui1111@163.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261024071319.875921-1-dinghui1111@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/26 09:13, Ding Hui wrote:
> From: Ding Hui <dinghui@lixiang.com>
> 
> Hello,
> 
> This series fixes the NULL pointer dereferences in the stmmac TX/RX
> DMA resource cleanup paths and the associated error path issues,
> found on a DWMAC platform whose descriptor ring allocation may fail
> under memory pressure.
> 
> Patch 1 adds NULL guards in the free helpers and makes them clear
> the pointers they free, so that a NULL pointer reliably means "not
> allocated" for the long-lived priv->dma_conf.
> 
> Patch 2 makes the per-queue allocation functions undo their own
> allocations on error, instead of leaving the cleanup to the outer
> error paths that would then walk partially-initialized queues.
> 
> Patch 3 releases the descriptor resources through priv->dma_conf
> when __stmmac_open() fails after copying the temporary dma_conf, so
> the long-lived configuration stays consistent with the resource
> cleanup.
> 
> Patch 4 holds RTNL around the descriptors_status debugfs reader and
> skips queues whose rings are not allocated.
## Form letter - net-next-closed

The merge window for Linux v7.4 has begun, and the net-next
tree is now closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens. There is some uncertainty
about how long this merge window will last, so please check
https://netdev.bots.linux.dev/net-next.html
before reposting. net-next _may_ reopen on Nov 2nd.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

