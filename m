Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D64275870
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923267; cv=none; b=o7ueL/wTcrSD4eiXg9K2yGjYf9Yws3y7vH4qbW0OlrIP3At/qawc2ELhPWNVFJaWwJSyNzLVpRragOc87qshBNJBZifgekM3NHR6QtAz7Fj/ME5E83/INDVhc2LSGr0gK9pgIrIWKx01IGu6uMTuHqVT7/YNJhaYQ7DaemOBjWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923267; c=relaxed/simple;
	bh=ns6vabdA+KzCPnmZGWFA6+vVuPjYuLmrqN9pTxWPMAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQu9W2D4Br0BaywI9TWhHt2K6rn8YLWkEFZa5zDo+ZkCkdXctO8j+tSeAx75jLUKIvQ7xLlRMoKfRwkSLlIBMceyfgUWBu1IlJv7nnghrkrbAIlOnxX/ocGnuc1e2Xxhq39bU0EZ6ukLVRg35BRA2wiOqlvWEdGvTJZ0SvqSlP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=irF2wzFl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VIq/Ae9/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="irF2wzFl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VIq/Ae9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787923264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V2F7fOxUu4V0dP2Sv1iyT3HhBi0Yf+rjtTWsb6sJWmE=;
	b=irF2wzFlIJWYm/XsFRjwKh2wJ7Av9bTqWrEU+3nEbBW0Lx6vls6iGHfCe7AgIyYmrtkkpf
	+5v3QlaMlJu42m4SVYQNR14URMY/Ei7bQwlYwl2ofpy+yFGKDsmny9r+74hbeErWmE/FNx
	hv5vPpkErX8jeLvINbziymHbz93qSLo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-XrFYXHhCMuakLBPj7FqtBw-1; Fri, 28 Aug 2026 09:21:02 -0400
X-MC-Unique: XrFYXHhCMuakLBPj7FqtBw-1
X-Mimecast-MFC-AGG-ID: XrFYXHhCMuakLBPj7FqtBw_1787923261
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so12738385ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787923261; x=1788528061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2F7fOxUu4V0dP2Sv1iyT3HhBi0Yf+rjtTWsb6sJWmE=;
        b=VIq/Ae9/XD0nHaVfK1nVFgP9A+x2tUU51isuMeCmuRevIuSb7oHlFQuA6c6e/NHHe2
         DVu0AqYmYux9GTm0Pdhw3Q/VkJ2GfNAgPtRrZE8lUdW0z/vOXpkDxUIVBV99zvUVA/69
         igcgbmXT6CVDXJp9GMGT7HKY3xv02QjPkuSYXyy5Q5QPB1+Hxm3ypWw+yLKeutl/E1En
         6QqqNPxQVuh6UUTReRNRE7phDOYgzAiXcBbxiQo45Mw9PRi0FTj4NT4I3riNO7OzsFvL
         qQx0Ctj4tsJAJaVcxpAH89/Z1p+JW/wQ93QpfXnHiRYElPs+lIywdxq+oJrhXg8nqMqz
         3Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923261; x=1788528061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2F7fOxUu4V0dP2Sv1iyT3HhBi0Yf+rjtTWsb6sJWmE=;
        b=gj9ClICAEt7CnePG7ydY/iuwzLTU7HxqGBdUYUSPKJxA/940kET045eBo4eSGK/k3b
         ebMwZ+s3jrYFI/m7SU/+OFBmRZkTg2U8DrXSnbVTeMnFfzC1GDsWt/pCaRJsHovBdFcD
         EkIhOS5AQUtifMVWoIb6H8R1K05IkdDcxV577li1qzSLocfLAkgUSsZVSkSFmLK5bKT8
         wh5sk+HouGQYg7wiNseBLq/FRr9KEUUGXhRwjurmkQgQ9Un4tJKP1SY5UXO+q9VbNVng
         UXg0oPVeYFxJMkpuwyHaSlJZeD6j3TeDFV0rTWyR79ywTh1t7so/EUwoKxMoDEYZmicK
         4Arw==
X-Forwarded-Encrypted: i=1; AHgh+RpyJUDTeaBtfPUQ7PiwNOyaZOpekNzQI8hoGT6EzntWMpG+35f9vnZbZSmncvTXXaikCLWUiztdOwF2iGc=@vger.kernel.org
X-Gm-Message-State: AFuF++nRgChchUh2vvvtxCyxrFqf1EHv1NoEzWSj3F9+uQYfVYVoE0sb
	N3YMNzUk9G8jNsdE4R4ldhcACjQpY3utINSjZ7BOz2Q71QlwlSYqgT4uYq5uIq+33ALO2u2iA27
	Ibh10CNpxSwaLd5Oej5jzFerIbLV04JIlbJjmpgRJRrxYkrs2xbtQ0RNCDl3kykrH/Q==
X-Gm-Gg: AR+sD13RZZFQW7ZOc5IjzqY0aNFfrP7zkx+XY0nwm7CFoA3GAxb6RhRFyaNZYMr9w01
	J7E46j6L+E5BDHe2CWSNIR04ToKrNLtok8DSdGtKXesOc+zdksZXgeQ3iuTBUAQYU+HpGPBUnld
	EJAk3ZXG9LVdyHkY1MgE+sjyVmeU+JicJ2HG1QqoXfTxpXIThScRfJCvIcPaKpEAaapfZ8oT+fR
	gph6eqNe2m3FozefmCOQFlbekzI4kM0ugo2+w+ieDrOGqkiu5WMpCd7IYUe7UyCgD/ZH5z/sEuU
	HNqC43m+WkXmrxnuGwlL0iqaMYLGTOPAze7bvO16TQZ4WmcY34Qcojyowq/pWVNQqrdeniRKonn
	wS1vbQk9BJDl9L7NM
X-Received: by 2002:a17:902:ca13:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d74deed25dmr102923925ad.11.1787923261362;
        Fri, 28 Aug 2026 06:21:01 -0700 (PDT)
X-Received: by 2002:a17:902:ca13:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d74deed25dmr102923095ad.11.1787923260879;
        Fri, 28 Aug 2026 06:21:00 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b6c7sm5149255ad.60.2026.08.28.06.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:21:00 -0700 (PDT)
Message-ID: <d16164ef-7211-4272-bc74-bc38efd8623e@redhat.com>
Date: Fri, 28 Aug 2026 18:50:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec_file: remove unused arch_kexec_locate_mem_hole hook
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He
 <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Paul Walmsley <pjw@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260827144452.508328-1-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20260827144452.508328-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sourabh,

The patch touches three files across three subsystems so kexec: would be
a more accurate prefix than kexec_file, for e.g.:

kexec: remove unused arch_kexec_locate_mem_hole hook

On 27/08/26 8:14 pm, Sourabh Jain wrote:
> No architecture provides an implementation of
> arch_kexec_locate_mem_hole(). Use kexec_locate_mem_hole() directly
> and remove the unused fallback wrapper from the kexec header.
> 
> This simplifies the kexec memory allocation path without changing
> its behavior.
> 
Also, it might be worth mentioning in the commit message that this hook
was originally introduced by commit f891f19736bd and that the last arch
override was removed in commit 6e5250eaa665; making it safe to remove now.

Otherwise, the change looks good to me. Feel free to add:
Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan He <baoquan.he@linux.dev>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: kexec@lists.infradead.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/riscv/kernel/kexec_elf.c |  2 +-
>  include/linux/kexec.h         | 15 ---------------
>  kernel/kexec_file.c           |  2 +-
>  3 files changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
> index 3e9a32acb8f2..ca5abbad59e5 100644
> --- a/arch/riscv/kernel/kexec_elf.c
> +++ b/arch/riscv/kernel/kexec_elf.c
> @@ -91,7 +91,7 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
>  	kbuf.memsz = ALIGN(kernel_len, PAGE_SIZE);
>  	kbuf.cma = NULL;
>  	kbuf.top_down = false;
> -	ret = arch_kexec_locate_mem_hole(&kbuf);
> +	ret = kexec_locate_mem_hole(&kbuf);
>  	if (!ret) {
>  		*old_pbase = lowest_paddr;
>  		*new_pbase = kbuf.mem;
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 0af8ae4fdd08..e5f1cfc11fef 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -259,21 +259,6 @@ int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len);
>  extern int kexec_add_buffer(struct kexec_buf *kbuf);
>  int kexec_locate_mem_hole(struct kexec_buf *kbuf);
>  
> -#ifndef arch_kexec_locate_mem_hole
> -/**
> - * arch_kexec_locate_mem_hole - Find free memory to place the segments.
> - * @kbuf:                       Parameters for the memory search.
> - *
> - * On success, kbuf->mem will have the start address of the memory region found.
> - *
> - * Return: 0 on success, negative errno on error.
> - */
> -static inline int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
> -{
> -	return kexec_locate_mem_hole(kbuf);
> -}
> -#endif
> -
>  #ifndef arch_kexec_apply_relocations_add
>  /*
>   * arch_kexec_apply_relocations_add - apply relocations of type RELA
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 59fb9d71e9d8..9a981359addd 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -784,7 +784,7 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>  	kbuf->cma = NULL;
>  
>  	/* Walk the RAM ranges and allocate a suitable range for the buffer */
> -	ret = arch_kexec_locate_mem_hole(kbuf);
> +	ret = kexec_locate_mem_hole(kbuf);
>  	if (ret)
>  		return ret;
>  

-- 
Regards,
Mukesh Pilaniya

