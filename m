Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156563;
	b=jfCx4va11H5R9JwinAZYWxQ6cgDMgWmNjPo1ZTOzGkRg5LArhvHmmS78Y8FSpXPC9VkV
	 8r5WYUUF7z9JWGcaRmX9ah/yLyAjr59VsDP83C6u4TfFM59pUqqyrwOLha2l8F1DioN+1
	 MqrURgOTAbZcJK4TTHkos12Ait71+44QLi5Xqr3AYu2I4uB4Q25oVTYNDBfZ2zxiA+0HZ
	 qa6+ccrP+kJ4DC4q7K44VDs1xPyHXqr+CSQ9IRmtZcldji2PL8obg60KM5W0oc1vUcyjJ
	 3+KjAxLY1C4AfedIkGlmzknYYWz3O56y03l8Amxv7uR9uwLfviuEg7ZoEE71q8h6BQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156563;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qcEzChDALBrZBXlc8c36RbFS5xKsTCpeOz2BY/FdvFU=;
	b=n7zK9bax8l/qyJS5664aOOE8BgOwKrnshZGjeTvSIKNjNY2PrLNmbYFrgPXekz6wtmYv
	 kUi8XIsgBI1NFoSFh/JsH0mjytNzlFCxPK+pRo8mM1T8SbrvlJM9OPC0tcu3XHZFd0IED
	 ZvrzZeSnY1+SMTU2PCTB1y0Sb3fmghcVuk+DypGA9ydX7y9M1x88YrD3Fb10iorqCTl7v
	 /vZYQVCI0KzIoMZ20eRhu4qsrX020rzeVnVDnMj6utXg04LNJrazFur1oyoOLRk/QjMOL
	 BObsx51SPLucmGBnxSiuN2kRD3yL0J+wOH9A724ekNT6XYDT84NnR5M4rJSpGot+Sig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JMBHqRmr;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B595606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B595606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JMBHqRmr
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793156554; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=qcEzChDALBrZBXlc8c36RbFS5xKsTCpeOz2BY/FdvFU=;
	b=JMBHqRmr9A+Kags7qAn7W5taqDFaVNDsf6V8YIRb0Izwp2/jGzioBhbKjm/LlX7lf8ErhdfWp4EI4KTUUHzhCEWVndcJ9mWkX0WE+S+3r4I2EdKofqBzma0K4YeHtzZLtxkUbJQv/eBQQxl2b2FBJRyW7dQ9GY4VsfKDefV7wi8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R311e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XDfWWsR_1793156553;
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDfWWsR_1793156553 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 28 Oct 2026 11:02:33 +0800
Message-ID: <4d32bebe-1a00-475c-8320-b303693603fd@linux.alibaba.com>
Date: Wed, 28 Oct 2026 11:02:32 +0800
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
Subject: Re: [PATCH] shmem: skip empty unmap ranges when punching holes
To: Hungyu Lin <dennylin0707@gmail.com>, hughd@google.com
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261027171753.1485-1-dennylin0707@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261027171753.1485-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/28/26 1:17 AM, Hungyu Lin wrote:
> When a hole ends within the first page, shmem_fallocate() calculates
> unmap_end as -1. Casting it to u64 makes the range check succeed even
> though the hole contains no complete pages.
> 
> For example, punching one byte at offset zero calls unmap_mapping_range()
> with a zero length, which means unmap to the end of the file. The file
> contents are preserved outside the hole, but unrelated mappings are
> removed and must fault back in. This can be reproduced with fallocate -p
> -o 0 -l 1 on a mapped tmpfs file.
> 
> Compare the exclusive rounded end against the rounded start to skip
> empty ranges. Keep the unsigned comparison so rounding the start near
> the maximum file offset continues to be handled correctly.
> 
> Fixes: 83e4fa9c16e4 ("tmpfs: support fallocate FALLOC_FL_PUNCH_HOLE")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
