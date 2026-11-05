Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872757;
	b=UfrCu3wppF7oZlnEVCu2bye/WAC4am0dzYzwJ4at6/D8PoUdEy/5Pf63JW6LZC6wZoj4
	 jJVHZ1C3cmxQ2b24XEewgCR6b2Z/OWSdPMEsTdOCvQbIOQ2kzBDGiHKpRfPh337wmgktM
	 98V6eCn5RLhy2sjbL49JCqmP37fIXJJ7IjPXe0f0B0krfhrDsmFWMiz4EvsYbx495wXQK
	 Cr2Hqc0iFsmDOtZ+R1OaK4b76gR5tuGiXVorMtuhdu3ryH7QiXkPmVt/HhhegsZT+T7P1
	 zxlhDCBKjXNmP/wrKGxwsYbWzi46GrFPlVFAeyw8sr5DrPzu7r1T3eout1y1bYe1FDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=72hF0zaijNyHtswxhUEwhT+OMs8ScZ0feIrG+Lm2KOU=;
	b=otdR4/Pt90lh6cTYe5Z8U1xOoH7t4pgRHt9f4MT/EfkOIbhq4K50SrRa0dgRXQzZzpVB
	 5AXKY7gF3h11nN8tCjQuRCfb3f8zsji+8fTu6AtzAA4RyWyNBYy6pEkeE9IJkmkakJsd6
	 aCSAeD/NM2Syg3+lwwW42gHv9HYJ1U+NrPI9gAwl/ZMYwt7gKcLw2LFVfmqDn1PpwA0AQ
	 0U4Jc/64h1I/v8zugxgbDhgjtp+SSIgJS0xya9ntQxHrOZ5eLnVLMGS0HohpCAJQsNObJ
	 0c7gmvZjjqI6iODDtD+QTeZdiZycD59VBlkyZ3Sr0hdqSEii8nK+UOavOFWGeD6c15w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bOsLWi3y;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A83E606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A83E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bOsLWi3y
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso11034335e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872755; x=1794477555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=72hF0zaijNyHtswxhUEwhT+OMs8ScZ0feIrG+Lm2KOU=;
        b=bOsLWi3yDV2SwlL808R2GcqEQVSxTvrL2oD7ob3OjAAj6tc3AbRZuHB9WpYAvZbY10
         D6CIX5o7pS2ybUuf9EOUZIHcOKf13g7OUQP2bG7nXOCQgB4/gJ5St+I4C4dnbGG4ja2w
         TX2WQIAOxwA25adjgPV111iGrBu3uyctFICYclZcFy+OVEwEWY9Z/SqdvWHuNlVSMPuW
         XvW7fkWFFCEAfBIcFSjcLlbSlyotblLpMJcUhSVJ7DCcbP4GYxoPIfPVkZheVRG5p3Hv
         WZAZRidihq0S+ndsMpq6Y1wlZwoHVhs8tXQCEqn9HZmgQyjzKuJuCf8rB0hxpj52nNfA
         L31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872755; x=1794477555;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72hF0zaijNyHtswxhUEwhT+OMs8ScZ0feIrG+Lm2KOU=;
        b=UxPBh4UL4gJRbPl9ra92vI9T/1oJIDt2hPWf455QPgDE1IfZJBZLS0Z6M0BEhbclGz
         0LC5NG5wGiOvXHMCBYlsWaqD8e1s+7Gg057lEwFX2APKu6UbcxZS2nHGiZ5KfoyN85Yv
         icX5hQ4Q9Cqc3iwa0hQZTDH6LMDR/XxytFhIV+ZJxTSwkAzBs12ZidunVUBYIO30BrV9
         QmIP0geamWG+ukegM0jhgwwiKguL+93SYMv4gWVt7aT2wkQhJPZsxFF+u2OKVQzxw+yr
         8K8KpZa/UuPSrdH/ZSZiZ/POIPiPoHu5qAmyCnoLSw8+ATG4yWwzGl2m/zOjqHNZBsyJ
         PGFg==
X-Forwarded-Encrypted: i=1; AKwUvBygqsp2APuxKoYsrqJsxWxnylKaGdCFgu9WEqHzig9Ov2gOCSCREix+z9qWsVWMZ1RRg4jRqT3nDSHp15Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K4liwxUrKCXos+B5rdWtGgAuxBFHdmTuYO67hJTLr0HM6yDfS
	5RdRn9ofiIuucSTMBsBAa+UXga6ZUXwIPXsSKvD55BdTa0SYyzhiz15nphJFKD1LwK4=
X-Gm-Gg: AYBFou3OKNTLqZGUJXZnGsDd4aMpDCpkWRatqkY/XAlEnn1K7IiFBWEUraQy8F3Xwb6
	Q5YJoVW72FTgLEjdaD8OVf9JXrl0t0i3fxQlTXeibbC4yrNUA+CSfDOBwihglZtiGTWXDHmjGxp
	x7cpmTuTjTkPFqABGE4njAWZVkGWqkE6PULRSEsVOyru8IXqA/alBArPC+SZRTNlYiZ/ehY1Dwp
	C8AC+V1v6T0p6E05DBSEWYiy5ytN4+NFcoi52Df4lP6SrpQk6M7k4DwVtnHMZWiUnveGtiSuEUM
	9EprNGxVbxjwaq4Vj56oGBHRAWG/NLv/bQiezIUPuyu9UKuI2uNiAR/mYMGYtosdGdhriJP7BvA
	6zTgIthUDFNd2l/x90dJcohEpF9Tb7aps0Xe8T4Bu2L1jQlCgHk7fIde//4h34wStwxO2PX2B8L
	Iv043CxkIEVRXo4vqRi462vYf+GugSl+nKfh15JW7fRjogfkavYCNWfs8DzXcu+/LSRDTdGd1fO
	qwKzks9spR+fXRTdHrJWSbIwHEMXxFvEb9mf5c6bh1Q/D4BjB082bOB32P/mZCsNRNkjyxYBDE1
	2Py33vY7DBIOrY1rnNxUJ0ImdmjsgrAdV0xptk7iTEp+DtnJuNOFleKrBPe+Bw==
X-Received: by 2002:a05:600c:848c:b0:4a1:efd3:9862 with SMTP id 5b1f17b1804b1-4ac1765d977mr384989555e9.21.1793872755037;
        Thu, 05 Nov 2026 01:59:15 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b432a883ffsm54957825e9.3.2026.11.05.01.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:59:14 -0800 (PST)
Message-ID: <f46f0d98-5756-4b2d-a8b6-ca68a1a071bb@linaro.org>
Date: Thu, 5 Nov 2026 09:59:13 +0000
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
Subject: Re: [PATCH 1/4] media: qcom: camss: use contiguous buffers when there
 is no IOMMU
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
 <20261104202313.72494-2-allan@fatecpompeia.edu.br>
 <8824d3fd-4b39-4355-a4ab-5f7e711aceb9@linaro.org>
Content-Language: en-GB
In-Reply-To: <8824d3fd-4b39-4355-a4ab-5f7e711aceb9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/11/2026 09:57, Bryan O'Donoghue wrote:
> On 04/11/2026 20:23, Allan Siriani wrote:
>> +static int video_buf_plane_addr(struct camss_video *video,
>> +                struct vb2_buffer *vb, unsigned int plane,
>> +                dma_addr_t *addr)
>> +{
>> +    struct scatterlist *sg;
>> +    struct sg_table *sgt;
>> +    dma_addr_t next;
>> +    unsigned int i;
>> +
>> +    if (video->vb2_q.mem_ops == &vb2_dma_contig_memops) {
>> +        *addr = vb2_dma_contig_plane_dma_addr(vb, plane);
>> +        return 0;
>> +    }
>> +
>> +    sgt = vb2_dma_sg_plane_desc(vb, plane);
>> +    if (!sgt || !sgt->nents)
>> +        return -EFAULT;
>> +
>> +    next = sg_dma_address(sgt->sgl);
>> +    for_each_sgtable_dma_sg(sgt, sg, i) {
>> +        if (sg_dma_address(sg) != next) {
>> +            dev_err(video->camss->dev,
>> +                "Plane %u is not contiguous in DMA space\n",
>> +                plane);
>> +            return -EINVAL;
>> +        }
>> +        next += sg_dma_len(sg);
>> +    }
>> +
>> +    *addr = sg_dma_address(sgt->sgl);
>> +
>> +    return 0;
>> +}
> 
> STOP SENDING THIS SLOP !
> 
> ---
> bod

Oops - pardon me I thought you resent and NAK'd patch.

My mistake :)

---
bod
