Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878089;
	b=sOW0BpHruB2AjYPqWzKHlnEkILuw/iOES9bk6SUgMRU2LzVBUXmeO8V11JOPoUv992HM
	 TzvpwXZtys8pNNIEUYOuT5t+cJRJpRexXfqg821OFUEU4QMRN6wrNxNPA26OYrbOW0ZDj
	 XOx1J+alP/g8UF9pjbIUMTNiFbRaqiENVBET47d/ZFGGQw3kVH08kO96EqO4PcymBJO7x
	 2TRmgbjZ5V2LA/T6vf4nVIt5qVBjAuv0covhYT2kg/M8Wo48Ky3oPGJesYGgXlyHSOg3m
	 hJS7SkuKl1xkr4vXMGs7QdY4gKwuDM51COdg/Osa6CZjqS6byAQcvoDcPKhKooQ7B+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1uORwWZ1lMFhwuvqvOoHtu8XYv8QFSZmfwB9UbsnnNY=;
	b=ULK/U27kBj2Tw8zZWCU5YwjebbiK33fakYaIikyXp7qVUyvNUkF1b7kWWTOZqMMiT5rD
	 +7Tsqr0iehU2ywRAgv7cPXbjhUy5oupo/5Y6BExdx9bBr/ktfr+w8sIjTvaiyDf1hGLXZ
	 uI49ofQfVS0snbfCPfawsBUps8ijF88pf30m7dhLt2w/f3CmitCYxFNupUU6SdfT0yide
	 bqpbhK/8ISFLOmkaMmNeC48bIo2/jvuPiSPB30LLWFM8NiYfm0YeOmWwPRWjIGoOvqRHh
	 l88ZxJ/2WcwKxBLn4NMnY0MzWLJEZT+6UMmPNbARFccDv6o8KAwdVSTZRoAY4S8bX8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=meY0Mgew;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EA2606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60EA2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=meY0Mgew
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so5857165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878088; x=1794482888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uORwWZ1lMFhwuvqvOoHtu8XYv8QFSZmfwB9UbsnnNY=;
        b=meY0MgewWJuwjMDz5SeVpgfIXy0MfhR+jC26nr6Efi9GE8lzn5EI4anT+K5SCVxxR0
         5igU13C+exswLJk8gD8dH8D7/o/RmlU9CTbx3fOP4wrFx6CRBaOJRPt0jtFQhFrM5GI3
         J1RQJnNZp0a0BqTmaVKrSbjr2wjIvEYIKRZZ81gYcb6o/AaXuDs546MbFs175ZYpyAui
         gtHOh8jmc5USMrpzHu6a6/GG6nYY2fWJMfsDa10ZpZcLY1JLMEUg0JeF3mWHPwQvikVN
         c55WFvdzqDX9HHDHCgcl6U3UZDO3HDYztYnPNQ4jxCkG8nLS0wdoyQilq6HXuQJQ8UU7
         PpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878088; x=1794482888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uORwWZ1lMFhwuvqvOoHtu8XYv8QFSZmfwB9UbsnnNY=;
        b=C2CGEgK0Ik67/PS+7TfStIhWJLKHsMlh8H8y35+wginr3K6Mus2822DA3TkCEM6idt
         rdoVnDozEy5uH01or7QsnhoNpx5bO1aV7ry/EWeDzR0Na03IIToS0BUz4IhQ0sixzVQn
         kQji+JCpKCMH5RHpmIIqp6hBOPpN+nPgPOo0iG/kJP4M2OE78EifOuI0znIfPYG/ucg+
         R9WLwzqo7FKkp9zXztmGL+avKmMgARf52YHyz4hMWmgsLfQSWf8xEV+OvbkS+6cnDjGA
         NKCmmBH2RK0QSETHluyhOlF6ndWxUP03yQAajD2XdV5ZHN5ZPsMq7LcPE5YfF4PolrE0
         W++w==
X-Gm-Message-State: APuU4Z9Rfmwi//s3Ljk7MIdrVo3pntFHfcM+BA58E0lX61B9nxGeqxjw
	wj6HO1h5dHxH1u/29SuCtp0icojRpJ68gipq/BIMXzyiROR8rrvqiLlY
X-Gm-Gg: AYBFou2vUDJlpMYUKLn4p7aZ/D0fAaVYDM8kR1/5xlIjHf8cDQ8qc1MIFtnqCmqK2DH
	buLamP4l+HOlKu9G+Aue1VNBa6dXG5vVcBoyeMiMAa5aV51dNbT/adW/3Yvmb7PIt8FM4wop/Bb
	A1zSq2OqyN2bCVfRdTTbJh7Cyrfh663JON1aq5X4456lzeb3O3zB7C5hSoZKDdlqJaQkaw1mfri
	H2C1y7YHnHqW4+1vcn/PROgqU+LdWS1Y4qAXzOUwX2B8Kf2pSi3iJ9Qdk/t7P4cWVGnN7HoCyqu
	zSXcrNzWCZaY1oOxpe56osJ+rvP/MyVHWEG0EpSoxWPFtBsnhFC32VXJHfKTJngmRZsu8lSTkX2
	lkGZtJ9vcTYE7KecsE2lYIL7uzg2k9LGVJvZcc0uR+J9/Lerv83Tp3wdwVXGRZ4iUKo/Qi6mQbb
	cnsbXjTWWY662UxtVzyK9epuA5b6RCGBNs/uGAWQTm9O63M/znI5XCRlPgwJLZ6sqGwXD43S9XT
	8QQwikWG61bujZD9xTdmFPMBjGmFLeFWaK5viiaIBqk88YM2tVX4kxQviKhpjE3sGvUo7b876zw
	Dn1sY7m9b1zZ3qttACyT0tc=
X-Received: by 2002:a05:600c:1989:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4b55dbb09dfmr41331955e9.13.1793878087546;
        Thu, 05 Nov 2026 03:28:07 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm64368315e9.10.2026.11.05.03.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:28:06 -0800 (PST)
Message-ID: <a6b65236-24d9-4e2f-aac5-d90bc4b6a357@gmail.com>
Date: Thu, 5 Nov 2026 12:28:05 +0100
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
Subject: Re: [PATCH v2 2/4] mm: gup: allow long-term pins of CMA-allocated
 HugeTLB folios
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, akpm@linux-foundation.org, lance.yang@linux.dev
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, stable@vger.kernel.org
References: <cover.1793850539.git.zhengqi.arch@bytedance.com>
 <818fb0b4bbb234e4a2bd0552d61634f1a8431616.1793850539.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <818fb0b4bbb234e4a2bd0552d61634f1a8431616.1793850539.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 5:07 AM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Long-term pinning treats explicitly CMA-allocated HugeTLB folios as
> unpinnable, causing unnecessary migration or pinning failures.
> 
> These folios already own their CMA bitmap ranges, and memory blocks
> overlapping CMA areas cannot be offlined. Allow HugeTLB folios with
> HPG_cma to be pinned directly, including in ZONE_MOVABLE.
> 
> Fixes: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic hugepages using cma")
> Cc: stable@vger.kernel.org
> Suggested-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>


LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
