Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E220529414
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689152; cv=none; b=Z2HUF4+tNYBW1Jkn+xxRGzRvqjFi/DXcsOOXmuFiIPe91+Dx9vCY+BMa7vDULi6Bx5iGsTVYsAJDGE7PSfUAl4lSA8s1Lt3qHlOjPBIXlT+lOJ6CHsWG646AzPJ9CnLWurqUJ48zP4uke8tSGeOlUj2sp+4oLAa5PP/Vfc5lswc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689152; c=relaxed/simple;
	bh=bX0vghnpJNEcep57BRAwSFZ8AVgRzOA1zDESa2UhD8k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nax2UpBxmLi1rVRJBbJm98SoqLw1KvKMtUsMgpWpsIC0CyDRC1ctApjpk0iBKsnVVAOCIlOId09th16ZgE6Ohe1nZI7SPuU8yNGuzzYZAoIRJKlbLlrggvHMUspP6s4uTCwwlkPW/dNwnSJaIo5/gbEKyNZm7Y8Xre8IXSGXM58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I32QXSeZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CM/BjlSY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I32QXSeZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CM/BjlSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790689150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bX0vghnpJNEcep57BRAwSFZ8AVgRzOA1zDESa2UhD8k=;
	b=I32QXSeZ1IuK0I+ZxjCqDQYedHOfKhQdRhwCS3IiKSJhvrlSojzV5Lq4wohhDX8EPLK4nt
	FsbVtsgFZATtFwmIGq9o+bBsHxUmMQ4ARRCS9TMpp31pCubsdukFxB1IlWM0W0+0kDfSsd
	TOvSked5wGPdHN4oxRj+C7hQABdvpK0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-HAeGeOm-PICk8ISj7yU9KA-1; Tue, 29 Sep 2026 09:39:07 -0400
X-MC-Unique: HAeGeOm-PICk8ISj7yU9KA-1
X-Mimecast-MFC-AGG-ID: HAeGeOm-PICk8ISj7yU9KA_1790689146
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a0037a1c05so21254985e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790689146; x=1791293946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bX0vghnpJNEcep57BRAwSFZ8AVgRzOA1zDESa2UhD8k=;
        b=CM/BjlSYOvRZITxz4Uedg0Tk/wr1Qki3VlajsP9tUltRN7Yr9vgrni0ttA060wJ+jm
         z7jJ0k106D0aYEvyGQAjGzlRw0VVss1ulM1xlrEtnRT61EeqnQR39v+6xCdI6iLvVWKP
         XzL1NomPtkiZRvSTPi7ZcVNfvHbfS+TMmBNSpXsG8Ki6+0izL1ffiASYYlCDvQXYwX8F
         nE7qqGEzwwCVrLNOpzNHKoiznPUte8+MStS7Ghu/VQ3D9f7n/DoaT2UqcF27ltsUpy7/
         iLIaCxulSHebxCfRsoEhHKLWwvUq3QARxXQ8yVQmojINemHDTjOlrCzQR7/T1+mjElUc
         vwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689146; x=1791293946;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bX0vghnpJNEcep57BRAwSFZ8AVgRzOA1zDESa2UhD8k=;
        b=LiVY28xgQ6V5+rYRi5xGMwsHzM05ADZctIJc0RuQME4sTipBV1bMEKe/5hVDiHkdzm
         un+d+9zMZRrsnIW2FgnZ/llQqKvFGD1i73i3oGDTx8JLb5Q73QLRnx2mfU7VyQg4LwJI
         hFwuv1+iugR/mtsBGyrfT8QkS+4J5EOvJcU5XX4kvO8Tpu8seP1EbjsyAfpfp5+xWGj4
         S5mESL/8y3hC+JkkH2BMtYrDXRaePRoGyxesqYksgtKqeAMm+fjUUeqrG16ZO9vWR0VD
         yzsVxK28VR16yy3y2+IV5l2Rb1mX5Vs4P/PipRozQWr7gnlq7iuY67q8JnO1ApqUvpeS
         wN+A==
X-Forwarded-Encrypted: i=1; AKwUvBzTWYpLT4pxqU+drf6lT9SqzabZWd1kxpI3gGrZ33ypVzRykPnYsEOJ8/xaEP+ZNSp3lEsqR65F7JYYkF0=@vger.kernel.org
X-Gm-Message-State: AFuF++mt7zVC/Jtv/gm/TeykkO074E7ANIVqnncDNf6o1u3739+TCACy
	/t04861ZzJYAjdKHJfBZI0Q5oXtlCkCigCgJ7S6i2iFhokVfmaEu7Iwdzfbde2XszXKE0OZrMMA
	AvXLM2lecrvtOz9OQ2X6FYk711OgrWPA7zVvgv73T/XEV1+1HPBaiYP9Kof66U2EDGw==
X-Gm-Gg: AYBFou0b6qRhR8/bvr6gwuF+q+vSP5vntggLU4COQ3hs9uBCseygjq3smunxf8EDU4/
	3Up7g3rYyn7azDCNBlXDIjTZVg9oIsStyf0yuRw8kA3fie6/5Vcol98ucrAaRqO2+n/Il3Hdjse
	5BuBx/Mm1CatEjIvaRNmb5/Y2KKxLYQyBVzVUJFNV+7A4vFbfwVHhJjG40GDDHuucvm75aaZiS7
	2w3VuuTHnI4lMrQap07yru94MOm7ng8LE4/Mw3R6N33PzHDGrRRGFfvhfOWNG9Zs5Rd4aHzeF/d
	XtWGMDgKM3zpRqSmMrScBR7ngiMpUFxDorKyFd2czBUg8QxM78GoNfDCzc5lYqyfRBHDY6rsOaQ
	In5s4guH3bTdyVy9d8gKWM47Y6/OOxXqDwvi/SMxdpvszxk2+5gBkQFFslPe4AC3AvTufrFnTBw
	==
X-Received: by 2002:a05:600c:1912:b0:49c:fc6e:8cb1 with SMTP id 5b1f17b1804b1-49fe66d811dmr276298165e9.21.1790689145770;
        Tue, 29 Sep 2026 06:39:05 -0700 (PDT)
X-Received: by 2002:a05:600c:1912:b0:49c:fc6e:8cb1 with SMTP id 5b1f17b1804b1-49fe66d811dmr276297645e9.21.1790689145324;
        Tue, 29 Sep 2026 06:39:05 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f442dsm75545855e9.13.2026.09.29.06.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:39:04 -0700 (PDT)
Message-ID: <97f2fdff-3954-4d53-aa55-156672658ee5@redhat.com>
Date: Tue, 29 Sep 2026 15:39:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/3] net: devmem: decode DMA addresses for TX
From: Paolo Abeni <pabeni@redhat.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, hawk@kernel.org, ilias.apalodimas@linaro.org,
 sdf@fomichev.me, bobbyeshleman@meta.com, almasrymina@google.com,
 kaiyuanz@google.com, linux-kernel@vger.kernel.org
References: <20260925201522.254717-1-sdf@fomichev.me>
 <20260925201522.254717-4-sdf@fomichev.me>
 <85ddcc36-7e31-42d7-8e78-a3e456e13944@redhat.com>
Content-Language: en-US
In-Reply-To: <85ddcc36-7e31-42d7-8e78-a3e456e13944@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/26 11:43, Paolo Abeni wrote:
> On 9/25/26 22:15, Stanislav Fomichev wrote:
>> On 32-bit architectures where dma_addr_t is wider than unsigned long,
>> page_pool_set_dma_addr_netmem() stores page-aligned DMA addresses shifted
>> by PAGE_SHIFT. The net_iov branch of __skb_frag_dma_map() adds byte offsets
>> to the encoded value, so the NIC is programmed with an invalid DMA address.
>> This can trigger an IOMMU fault or DMA from unintended memory.
>>
>> Consolidate DMA address encoding, decoding, and representability checks in
>> netmem helpers. Use the common decoder from the page pool and net_iov TX
>> paths so both interpret stored addresses consistently.
>>
>> Fixes: bd61848900bf ("net: devmem: Implement TX path")
>> Reviewed-by: Mina Almasry <almasrymina@google.com>
>> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> Fixes tag for net-next patches pointing to old code are highly discouraged.
> My understanding is that netem on 32 bits is mostly a theoretical thing,
> i.e. no actual usage.
> Would you be ok to strip the tag? No need to repost, just reply here.
Actually the above is more FYI than a real request. I'll apply the
series stripping the tag.

/P

