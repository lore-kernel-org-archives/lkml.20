Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758905;
	b=1gNB4b5jhoONKQQxqgGgRv9NdjfhF//rR1A/93mr+oxM83Gj1NgrQEnJvmqOrlHxg2X2
	 tILxeifuYRdorDdDEAicp3uNyonrPmfcgghh01IqwZ1ASAKpFrH6hFZI6sfvFpWQFLxQw
	 qQIFEw3oJ/FTflGXcyhWop/53hyiF6kULcjmGEoTluHDWdWlC2zPSTCvROuLFRu7RHDOx
	 nkpjn1bZRnu6bmT/MWJWnd6LwGhVkaB7NSpNB0HODfSzON9qbw4aFz7uPlbdPrGAVXM+v
	 fAnplNfJL/xJsq3Ha+TmId7MO1OGtZqUnMnEssjXLq3TMw+CXN4wV60zTU85RflwzJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758905;
	h=DMARC-Filter:DKIM-Signature:Subject:Message-Id:User-Agent:
	 X-Original-From:X-Lms-Return-Path:Cc:Date:Mime-Version:To:From:
	 References:Content-Type:Content-Transfer-Encoding:In-Reply-To;
	bh=No6e7FX1QyMHXiq5uSkrdQU3PoMJKwFtYVvKfbAY2G0=;
	b=PM0OVJUK6c3O+7NkzC0crBkrftKYxY8uboPNIunq6YhlvXkdFMlEYMNfCcqpF9WVtDWb
	 MctMuj4GBjU6slGu7ecRcvVpIrCXjfBxRvTHtB3l/k+tYeS5K8SfyG4HIOEDcU9QsD1hD
	 SsLbWs3Oj5UUnOeg1EXVTMxx3GFE+hhKvKBW47QcJ2FSDXPspP2vDCRt0MQmSl4zJU2hG
	 Kem/sDIbCQMOMNb17poR0iw65QjOwo/UDbq2qEUKnhuCR7alUsGLYCKJBUhEjR6feaNLC
	 SCHLomYakezWkHwjQj30BVqLhTxqYd1LS6+mzIdKlxqteuTPgFqU5OsichMe9juP12w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=AfRgpS1b;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CC1606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67CC1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=AfRgpS1b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793758899; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=No6e7FX1QyMHXiq5uSkrdQU3PoMJKwFtYVvKfbAY2G0=;
 b=AfRgpS1bnIQW2x4jiAUjh8Zh2/fcYgU7xYeZpJKEwAQSOPhObCagEaIT4YK9SQ7NOmGOAJ
 88h2qDnnpwBcM4dltjgF/C0HZC3JPB3hfK+XKETsl6hakGuqJWHOF4kR94b1GIkwamrZOX
 fzgONbX9d/lCYkU49iwMh/e2jx/R91Auboh+Lb1arCz8d5vXLHGG7ecob0lkaFHAM9lRI+
 0Y8NwZnuo6o1Y68VxJ8WrG28nA32Lcz+h7syyi3z60dOp/i3n3denoYIW3UQpWLT1lKnLO
 +971rSQK608SCrI4HaI9k6ui6e0b1TSlSlGfwFzdI67DdsU8ayt/JRRqbZdJGA==
Subject: Re: [PATCH] arm64: mm: validate /dev/mem mmap ranges without overflow
Message-Id: <3d26a89a-7fa2-4daa-a919-82708410d104@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
X-Lms-Return-Path: <lba+26aea96b1+d22491+vger.kernel.org+zhaogongyi@bytedance.com>
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 4 Nov 2026 10:21:24 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
To: "Catalin Marinas" <catalin.marinas@arm.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
References: <20261101171030.87343-1-zhaogongyi@bytedance.com> <aun4-MXVMZNrmvGr@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
In-Reply-To: <aun4-MXVMZNrmvGr@arm.com>

Hi Catalin,

On 11/3/26 11:08 PM, Catalin Marinas wrote:
> 
> Can we write this as:
> 
> int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
> {
>          phys_addr_t limit = PHYS_MASK + 1;
> 
>          return size <= limit && pfn <= (limit - size) >> PAGE_SHIFT;
> }
> 
> It would resemble the generic __access_ok() better where we need to
> check for similar overflow. I find it easier to read.
> 
> (happy to make the change when applying)
> 

Thanks, your version is clearer. Please feel free to make the change 
when applying.

Thanks,
Gongyi
