Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872670;
	b=3bRtGm9RcvSJg1ahxRHSrz17yYjr3DNXbMN9y2i3EbdPShq/2lrYEeiHlYdZLfBdnO3e
	 nVsT1QKdNOwYuVSQ2LALGiTlcy3Pm6tnD3Wy9Wk91Wca8c5Eeuav2He067it2OUS6p8bV
	 xtjAgk6OMdvxLHD0A2pna4XvmFLBMqfU4quFcQQgG9aVnBmUGOlqIxKenpuirtyqBmLPS
	 NxxlaHGe7tSYmNanKVxVvsQsWW/Js5AdHJL1x/3hAVwEhvokdSyiGjb8uk1iolW8AAM6p
	 e/eQvKpLmINKRD0QWgsLIe1OHHsIe+3h6KyUBjkbRjgK9aq4NsedDZgWg8ZesCfnMfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hTUCOSNrg5qxLH3FnfcYfQ51wYo8dyBSWxreUtwDliQ=;
	b=DR+aTGiW/KjeunSc/W9vTlilodeR+UHgQbiHg7ZaL8VtYXZBhy0YA3ZoqS1BAaLAcjD1
	 RYCsGrB92a6XVabcDpttHMO22zVHof9Rk+PxX/dpij3pj31oMu3H/JTJR8RGD1q0JcGFx
	 1k4MooQk3PdudJ2iPFPlJF+x5t3h+kILcT5Zyr4sH9lMRB0bdrUDlHGhdsAGAVKefQoOh
	 6b2Llrdfzr0ntPXQJvIMtF/Q2yKhSsZ/qHSgawAKR8Re+EkpeHieJVYP/6TdWHL8CAIml
	 S9To1YQ3WaNu+Ijv3XAys1LnV6aQxcGDTgRG/zVzHUnsOsDXVRbIwCg3599CqdqAzOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oDxVwy4Q;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF95606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF95606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oDxVwy4Q
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso14618585e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872668; x=1794477468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTUCOSNrg5qxLH3FnfcYfQ51wYo8dyBSWxreUtwDliQ=;
        b=oDxVwy4QjautS5UcbeppFUfZvhwy5qT5Jv1UH4ghJVU/8virZccbyxZ4fjXAJNCGLS
         esvAzFkveT02dJ2kpQOpbE0amiqcPFMSdi8ynCoZOHwVo8gOOvlbUSHRbi2fmWty+hmz
         SF/qPukCL3iwBiS47562s4lLr5ovhjElVybA4VQuy5zC1jNUg1/4IJHEVTR35ZLvtEkb
         VOcKToXIEgN+pARuf43SKAEh1ygFy3fmRuZq81JESr80ic+c/6Tz9seths4MLJfP1ec+
         VjBmDYILLJ6RZ2wc++GgtqHXVqPtrLbf49LkOTiHY7cXw2h9UNYfyiVuAPQIPlGQ7lFE
         kHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872668; x=1794477468;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTUCOSNrg5qxLH3FnfcYfQ51wYo8dyBSWxreUtwDliQ=;
        b=yDXjqzTSW8eWytOeIOzW27M5VVEuUD89NPdDshg+KHVrWIfBnynmVN2WuyPp05ZAG9
         dqzgPjpGmrPpeHHbE9YdKmpvZR10gJORjnUNtlViX65vngRx6y5w5KdavI+rjhpIwYbM
         begnq74VGhmOLKobpL5sxa4wCzCDfNh0ILKmngvwf3xDuVxuTB4GCSFBRroar5V8QXeW
         hcqmzS521hFila3O4Cz/t9AMHZwiVLTygKsn1wgnuFWSezjkUfYAPDqRkhBPpTecmQ5a
         QzVVO2zP9wF7k/ekMr+S4sjGTVxxIp45499W9XGHR6ypia4RfnMd+vSBPKh3LRA1z01A
         HbPA==
X-Forwarded-Encrypted: i=1; AKwUvBzfNQC9GdPrhJnDNi5+CSEXiHcKAL19qoUWLnNGTVLlczDH90lxOtnvzbdAViqKVWilK6EkkAMRTNK7DkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jr5y3PPn4RM5DFr3HoB12AbnMQjx2KAqborHNwPtF9/8S75my
	T0RhImCRYLVlyOteoCpQupN/ypX/GbN542frkEy6YlNZAvtjMlPbuLam2YW3zMBhiyI=
X-Gm-Gg: AYBFou0lqgmtmkFBhnbDsefhjpF0QUoWNppsh3x9izNOzr3x002CrvQMKilxOmxgIH3
	iwialCR5GKH3zdGai2AM6HdzWwxRLCBkBezSI3V6Qz2xgQ7iGNJ3886cYhj/YfUfvbPn3ptuNa3
	PjFE/5Z5/13+MT347tDJo9Gz6oAK0pTgAH+SP9q90o3o4ZWPl5W4egZMlUD6GuGgyxC5szG3n1a
	JK916AAWqtHopvwZ0zrQ3q6xlOCWU8r2dOYnSPJlng+RzZajvSQ5a6JE20uYOaPFm00ej4Q9BW3
	n+aZbPDZijDFx1qxtdD7WrcH597+VVy7AHhyC1GuLphRnXLzjSGhAO5IdKdc1MjWmFDZpLqA0Rt
	vwTC51Mh2nrSipllhCPhwLI4BChCNQA8/B0HyH29smY6lOEuFWAJt6G78Ll9oJ/sCsSAyRoBo+4
	ANsv3JrCr3tapWVWkLsA1VDBzcjTKGWisUuJgvwz/qDRzowGARzfEGPmtBqn3FvcBwvFj0w5tkH
	QLxpd9DHeZqGJ9Z92EtYv3ilLWrNN4Zbjj9jJMVu+m6cLT455WloFzfs1Fdk/Pj/k/cCo2cGXHc
	v3ggACgoQjctmxFFZJHO06EwQBtDW/k1iQsADqt2
X-Received: by 2002:a05:600c:848c:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ac17471091mr428132765e9.6.1793872668197;
        Thu, 05 Nov 2026 01:57:48 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba207sm49867725e9.10.2026.11.05.01.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:57:47 -0800 (PST)
Message-ID: <8824d3fd-4b39-4355-a4ab-5f7e711aceb9@linaro.org>
Date: Thu, 5 Nov 2026 09:57:46 +0000
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
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
 <20261104202313.72494-2-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104202313.72494-2-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:23, Allan Siriani wrote:
> +static int video_buf_plane_addr(struct camss_video *video,
> +				struct vb2_buffer *vb, unsigned int plane,
> +				dma_addr_t *addr)
> +{
> +	struct scatterlist *sg;
> +	struct sg_table *sgt;
> +	dma_addr_t next;
> +	unsigned int i;
> +
> +	if (video->vb2_q.mem_ops == &vb2_dma_contig_memops) {
> +		*addr = vb2_dma_contig_plane_dma_addr(vb, plane);
> +		return 0;
> +	}
> +
> +	sgt = vb2_dma_sg_plane_desc(vb, plane);
> +	if (!sgt || !sgt->nents)
> +		return -EFAULT;
> +
> +	next = sg_dma_address(sgt->sgl);
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
> +		if (sg_dma_address(sg) != next) {
> +			dev_err(video->camss->dev,
> +				"Plane %u is not contiguous in DMA space\n",
> +				plane);
> +			return -EINVAL;
> +		}
> +		next += sg_dma_len(sg);
> +	}
> +
> +	*addr = sg_dma_address(sgt->sgl);
> +
> +	return 0;
> +}

STOP SENDING THIS SLOP !

---
bod
