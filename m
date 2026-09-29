Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F9331ED83
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672397; cv=none; b=HZm1fg3VVWli5myS5zrn8+Ql7hsrPiOm2xQuVLfkwOsIF49fpc8TJAAIL3oB5Z1K3oRIpWZKzOVm5OzI2cBk9sdVYx2k8ElRSFw/1hl70u7EU41gOomiex14u1m+0PHx1PRPXwmt7aRv5Rj4IswMg7rACmSl5mYgiF68gKNzkPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672397; c=relaxed/simple;
	bh=IyspYJuvnDQiFffor9pIZti6hii3F6jxoMPcS2SzFIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c21X+pqt6/9F2AyPt1007wiqi4kyFhCAJy4jIdZt+8+NvIa2GTIyjf+X7cS0BCIp5r6rOkIpl6JHA5mD3lH4+NaLSQ+/5w+DjhsM885lmLRgcotc8SQ2zIRpJlHwx2AHkqEFaWW2Hi3q7DmBzqe/Q35H7pWMnTjeKfa/xTuRJA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GAEVk6MU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZmgmQCe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GAEVk6MU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZmgmQCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790672395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Y/oFOa1oxhQ1GdKVJmuNjJ216LwSgeUy79De2Uv5lM=;
	b=GAEVk6MUdaHD+woVWLegCArPhmc6TU7XFHJSFRwb6Sm9MztxdCzguw66O+CnASyOJ/PPGv
	w38SD/4POIKlc0Ew6WLqclG3CTuGFBoJ3Ty5azM15bc3GHjsPAxeJm1u2y+AelZ17Zh+tu
	nHw6cPhRLu2trkcRV3InP5GOKMqat3M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-s-TBiegtNwObT1Dmno6LaQ-1; Tue, 29 Sep 2026 04:59:53 -0400
X-MC-Unique: s-TBiegtNwObT1Dmno6LaQ-1
X-Mimecast-MFC-AGG-ID: s-TBiegtNwObT1Dmno6LaQ_1790672393
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e6683d48fso42313075e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790672392; x=1791277192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Y/oFOa1oxhQ1GdKVJmuNjJ216LwSgeUy79De2Uv5lM=;
        b=IZmgmQCeFtm8hBMCzhd1u8jKfG2LubfFaxq+LRmLnOhkoCBczLZtRSn+Gj4YQg4ldv
         umvXBHWjYZFBW7JI5hbjKtgNdUzYYLscPdlAKNfHvLDy8scqAuAg3+SQFKojl7HJ3qOO
         nMVM6bPaXcZrpjQ3xftifPovQixQGVAmPZSj3pulwDC8ckHXd9hxKs1sw39ufmYddTvx
         jmoN5lFt5nuttTXRfzZ9MFdIchuTvpyRO3yUKFvjggXOoOfRkOdV7DDT7LlOnncA+86B
         DqrJD2R5PYDV85JHlYnpootF8/wF2J3ytevTLm+s9HZve+MyzE94d+WBfb3wJCQ4qlCI
         xqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672392; x=1791277192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Y/oFOa1oxhQ1GdKVJmuNjJ216LwSgeUy79De2Uv5lM=;
        b=hMMmX8BL2tw2t76o3PY5vf0CTkQywxPBYDHTokiu7mPvwi4Yqy+lMLTsDiC6cTgBoA
         IwcqOL28bmbffBlviDDWP5AaseWpx/w062kuuzcwkyo0wUhark6o88uJpuQ8W/m2Ptnv
         Tsd2RMMnLDPonkdhPSWBhisp25P1PUHjnNTlUnlp3uvZPBJnus/Emj/HyxdWkNQZk5S0
         AWuMmZQFoPUXYj8aKo7ouCnpvQnejFbDN6mKFqTMFtGCqP/ZQibl5tFY+j5jlmpHecme
         3/PXIZTWF4pM+aXizQa+ytWT8JTv3c0L5NvwzwfmnzdgbnEZBYH9XMCCv1k1NxBnPXng
         bqHg==
X-Forwarded-Encrypted: i=1; AKwUvBxC6795POQ8XtheABjGCAB6KZWkUfX+Q9AlYKT80yAam/0t5lND3JKNxbqZdCBK5/cJ9byM0uc3ImWBRuk=@vger.kernel.org
X-Gm-Message-State: AFuF++lwecR0usS7yhv7hbNQwk38tDzeIavVT00S+zVSC0x4+ZjdRPhS
	h7JilZQLDQT8oAP3jUpKf3HbzxnhbRiyUL/XAeHxdXpoGsLbZeo2qiu3AhWDAOONxO7HQkTJPFb
	ii2DsxKPXBCm+fNWmSZ2TiXPlJCoLDdQT0DsiIbY3C1zPyqVZyn9ZiV5gxjMMNxvRfQ==
X-Gm-Gg: AYBFou1rEv3GKsPVK6WfAVoOuFstjclOnp6y8OjkFJh40HHowYiJeYqtD9tuTPsl/ze
	YIMMHDZFq+39lIXfvhTn5EUlFlnpT93iJm6RZwcL9m47Ha9gphTnWALypn9Byk9bDvZjdCs9UKb
	4ZXcQFYNfEwygjQPBQDDkdcQDu1r/xoRIPekDXBf9+e2rjP/1Sld4wHu4cHe1pEnSfKY8smQi2E
	GzrT6wiNQMMVhH5I+S3r/xQPYDNhd1dE830qcg06mcmYnmvIm7HzCKkrgFwuGFF+kimZVeO22Po
	A6+RO5ZLOZMVImodw59DMui5GSkXM1RXFhx4keCRepUjkK13ZXb3C0TiE1s95v5kEucZUpo3jIL
	I7ph218dNrgRUakzzdWeImAIyMJcYMjoZ4PC2BjBBj3hK9ALCF3k/lxzyz3UcZzyPw8cDS7WvsA
	==
X-Received: by 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr148517505e9.13.1790672392639;
        Tue, 29 Sep 2026 01:59:52 -0700 (PDT)
X-Received: by 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr148516975e9.13.1790672392160;
        Tue, 29 Sep 2026 01:59:52 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm65459555e9.8.2026.09.29.01.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:59:51 -0700 (PDT)
Message-ID: <4f03112d-e5c5-486b-8317-1ecc1aeb6636@redhat.com>
Date: Tue, 29 Sep 2026 10:59:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] net: qrtr: Add support for using identical MHI
 endpoint devices
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Lew <christopher.lew@oss.qualcomm.com>,
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 15:41, Manivannan Sadhasivam wrote:
> This series reworks the QRTR driver to add support for using identical MHI
> endpoint devices at the same time. Currently, QRTR driver has a limitation on
> using more than one identical MHI endpoint devices like QCS6490 or any Qcom
> Endpoint device making use of QRTR at the same time. Because of the fact that
> these devices will have the identical QRTR node id, they cannot be used at the
> same time, on the same host machine.
> 
> This limitation is a blocker for running upstream kernel on devices like Qcom
> based routers as they often have multiple identical WLAN Endpoint devices
> connected to the Router SoC.
> 
> This series supersedes the following 2 series from Juha:
> https://lore.kernel.org/all/20260915054207.2513877-1-juha-matti.tilli@iki.fi
> https://lore.kernel.org/all/20260915074135.2567411-1-juha-matti.tilli@iki.fi
> 
> Compared to the series from Juha, this series simplifies the multi-endpoint
> support by computing a unique node id for each MHI endpoint and uses it for the
> internal QRTR book keeping. This ensures that even if the MHI endpoint devices
> have same node ids, the host QRTR will always use a unique node id for each one
> of them.
> 
> More details can be found in the individual patches.
> 
> Testing
> =======
> 
> Juha tested this series on multi ath11k/12k setup by backporting this series to
> 6.6 kernel.
> 
> Merge Strategy
> ==============
> 
> Since both QRTR and ath drivers are falling under the networking tree, the whole
> series can be merged through netdev tree.
IMHO doable, with Johannes/Jeff ack.

Anyhow the clashiko provided feedback looks relevant, please have a look.

Also please note you are supposed to react to such feedback proactively.

/P

