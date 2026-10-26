Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004927;
	b=K6S37EMPwm7O+MnJzHfj90zbYiVTq2S1UBzUurVoQ+3A4apnxFrASLGLLMGIwOzP/82s
	 3l6CxyFpUMkJGUfLvkwiBaDTSV2aC3HNNW5za0O/CDIWNeZ3E2A3jr5Nnwgtv8liepSFw
	 vX4fwMuA6xkX3tQT7oZtKEuGUzBLch1kjHiyVuCYGblEafhoQE4GAVCHQVsGRi73uHrp6
	 5Ro3ZNU1nADUHv3cZfnB5o2lSkwJkGbAksSQei3lNSMa+yJfpHkA339z64/uwVsQsnota
	 oPOmuSIKOunMrjRf2gqwdptbQDg4ggOdMkyENbCVEDKIuhmGawSkgR3rlQJq+DUaRfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7uWmG7opjqY1CLT2aRtMPjlXwAFlsI+vF8Hp0fkUZZI=;
	b=aPZja4fD2/8t1M7RUmMRIfio7AN8ZSQUMADUt3dl3COm3eHCFUpTMv3H5/1yPAnz3pez
	 ABLV9VvrTEOjrRxJYr98/EuKCtAaVaUsfER54fxOBn+qimeZ32MpYPg+kBmN2xtUfIw6m
	 v0tDqST3/smRpCEOOT73v5O/Iob63KSY4PYiV/CTEuRDoMJ0bQ+PiB6BFaUDdoPKYjAG8
	 rUGu2QUdQhIeuYg1OVmnq7cs2XC8ZNFbMa+pPGdjrjMlImc/BUzddgjWR/NlCQ9fpNNZ7
	 RD+s6yORGZrl2XbYEhuZohWxiDdJ422SW0n+FruoayNt24AqunYGtHXawiUI94sdV5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CqfNjM+8;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62C1606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E62C1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CqfNjM+8
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so2004864f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004925; x=1793609725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7uWmG7opjqY1CLT2aRtMPjlXwAFlsI+vF8Hp0fkUZZI=;
        b=CqfNjM+8C89bgkGlsM4+XoeauRFaGUstDgQmv4Dji7ej8YT+OQ8qiXadrk7QpMoJMz
         9TQ68alGc7yI51WQJEpyAfPH+ve+64y9D5tkWt8yqjMJnrDpropJ4SMFgDXTH3rMGXsc
         BTucVGdZncp8jIrbuyGAQXTLAZxGXQbu0LyQ0HW5ChyjbXxtKbYnV8Xi1uqK79wywByL
         d6+vF7ey7tf/XBXevxDakMwrIBIeQjPV4QyA/x3bxo1MDu0dizScD72tkq8F48kSIUpE
         9EQTHut+PAi5ZKFiFr2nkULCLCo9soJFS0AqSiwft0OSg1eDxLUvtBQkyg38qOAdgtBo
         AoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004925; x=1793609725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7uWmG7opjqY1CLT2aRtMPjlXwAFlsI+vF8Hp0fkUZZI=;
        b=HVNCEmrqDA4MNwlGkkb+o1QmpMYtjXDHrXsfxW9dEpmm0itV/LwU+F21wYutyAFRgW
         Hzf6VS+sdSCJrfQiADbedFPIIPc6/l57vX8rj9kG7nwx+Z9677miN3SUvgWa54HNnknk
         GhK9baInHbrsSve0zqj1LOMDKtcm0wCgoOoZWc3YJuiP/tHFtOrbQ3EPpYdrPKLQbb6R
         6P6iSHMzn4hYjFhaT7UD7mIsgYn1AjCi4bE0gJ4KqbLXaImirzlp4gtzp01hg/HOo670
         0ZT8gncR5cfQOqMRv3nOkNsen4FLgsTysrbKWdGRPWH5uZ19gDyl/u518teHeii3W/qG
         VXLA==
X-Forwarded-Encrypted: i=1; AKwUvBz2bqrabdiXKVcpaEK9ZOVeyyyizJASjDuYl25NfsGzMQvt6aQCrPTTKnDY7fYtklpdQrWN2C8zs9rV7RQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV3949T4yzGARi+E1//EFKCwHEDNnIf6SN3ReMkRbsH1sYpqxD
	x86sgkB14fLflUVcXP0wBchBXncVRnns+ECjGvXLg+7lkodgHxgqmqpt
X-Gm-Gg: AYBFou3FEHzjIc0z9ZMIzpdBp6iBMhgZTcF3tUlQJPObrZA5GiGeneShtgzCwB/Zjm9
	OdxlWJEIO9IKjvQL1PFHS+z97K9ABUpoaFeuYa1y/U3FhO+W0rpsUzdgB7etXiIdxvePw+3BMxd
	IWdpAcIytBHPWIPZSZawFqcLLVDrC4dcJoXC8qI6lQSfNFxxLA78RPm7/EVhkEV4sayqNvI5N/c
	zYL1AwWYF3KHuzvFui3ogZXa+ST8lf6uWQLlb68ZPL11MxHdpLXo/zWnXtUUTLt74U8XLt7h7y7
	N6wezBPfnHb5/0GYN4+EdAhREdPFvmCNfRJnar1dGqXnF4FHEJ5lJJIOtJ3GPNwT99rwC55wiO2
	cBjaSjVrqBZbRfnYhYQe6rELotOZfGMXnXE4CoI0bVOuAop/IQ9tIikPTsI9dSfTkclqrVsSCZn
	uhVxISpjZYdyvjMdfVN0g5VQnJ2uyIGksl48uRQqzKM88E9dNWbb3s3q3XVG4qyiZtbC+eIntCS
	4LtsVFQBvqt9bht2R7tXtvWq0b6U/v/7PwgtlkO2duV4PuCUpKXTTPNTP2Adep8MDEtYx8M
X-Received: by 2002:a05:6000:4908:b0:48d:cb76:548f with SMTP id ffacd0b85a97d-48e3eb92448mr11162750f8f.38.1793004925077;
        Mon, 26 Oct 2026 01:55:25 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm17884912f8f.44.2026.10.26.01.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 01:55:24 -0700 (PDT)
Message-ID: <f2dfd241-a664-46b7-881d-13c3b974b557@gmail.com>
Date: Mon, 26 Oct 2026 09:55:23 +0100
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
Subject: Re: [PATCH] RDMA/uverbs: Don't return the shared zero page from
 rdma_umap_fault()
To: Zi Yan <ziy@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>
Cc: linux-mm@kvack.org, Lorenzo Stoakes <ljs@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261025-fix-rdma_umap_fault-zero-page-v1-1-186255624f1f@nvidia.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261025-fix-rdma_umap_fault-zero-page-v1-1-186255624f1f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 3:04 AM, Zi Yan wrote:
> After disassociation, rdma_umap_fault() returns the shared zero page from
> ->fault for VMAs without VM_WRITE and VM_MAYWRITE. Such VMAs come from
> rdma_user_mmap_io() in drivers that clear VM_MAYWRITE and they are shared
> VM_PFNMAP. A page returned from ->fault is mapped as a normal page and goes
> through rmap code. Two issues:

[snip]

the code LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
