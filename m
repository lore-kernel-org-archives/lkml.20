Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275476;
	b=Z/3qkTkgTb1ea/vLeCxoEcKxR1cun0ji5AH8erCraNj3syfIxOFwIedRjTSeUN3FB8kT
	 IBpir+eixe3gKXlKWl0gOGN4AjUQs8ijC0qWLwlcD1oQEk7AQbi2FWONbrarcYqpYCm88
	 mH7TAeRKn9Ap0MPV4iWgVMt2slQGU/VTG+Frbv5jrzo79YEOug114LqD4TxK7Or1Udc11
	 ijYxFs7DtomJsjqUq0yd74Eo2LQXaIwQG/9BKBNMUqqjzskYhxZ3/kGfLsqXBJgOLREeC
	 NnKeVWBdEAjM9acXCd0mxlFuwvjFC3LZCuW3g7ccSCYrwN8SbBPkU5qdFI6htwqaunw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bJSH14qka21Pa4IF7UBG6kGZapW9mNIllQsE6kiy4uo=;
	b=hRXU7VcOIsReM0S6s5mYyOyiaZqZxt7cJD4kwgONOJHgLxqfjb3cpkzKG0kIISzP9sw5
	 8M5qC4s8VFurQ2Z1ChWPrX3bYr1KtYc3iiV+Zyp+XFnq9svn09KM9mY+X2ZF73DQQLeC6
	 WFEBye56CxuKovgWB+XtjJIYS9aw3GjEUS9Yr4+Wl9Qt2DrZnOkyHWLr1nohWoA+u9LKW
	 9pll7D8rfi6ExOJg4FjrkD+IfqjwOhUuDWhMwNyWUvxfCzq/c68Sey3X1km1SGHO0F2fh
	 DpgAQVHBfga9zksKzQCFOzQQ4z7c6AB4P1e0LY5M4HSq3NcZaF2Zrq48e3ViSrPJ4dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wez99prv;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B388D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B388D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wez99prv
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1597018f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793275474; x=1793880274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJSH14qka21Pa4IF7UBG6kGZapW9mNIllQsE6kiy4uo=;
        b=Wez99prvPOIeWP7QYgwDmN/X/bT3LHMNRLiI5VOU9zwCzFi9L93cWCPDFHI6QjYfts
         Yw3pzYKzz8difIZaKuuRx+lIiz3lhjoWoG118rWiMt8BtrVC5a4GIoJEJU2PgOPUVaks
         MLdKYLCXmv4n8f0fVD4LbkBu1wUV650afFKkZvxPFkwqYkGIzMkqeLKOLqp3whcZ09+D
         8sY4DkcrMiC8BnQ8AQeWLlf3nruX4AtqyPOxjgXu8biKfleGdDJPG3g1GVijaNuZIxLw
         Pywe0223saI5Bw1aL5JOgl5c/OjniYCyJyxbmuZsiU+cSnxhwuU+VAMPt9C6UwB3DoKd
         NgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275474; x=1793880274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJSH14qka21Pa4IF7UBG6kGZapW9mNIllQsE6kiy4uo=;
        b=UYygAZ6Z1YfT6HTP7s36j1BTddfzOFnhZ8NBUiK45WkGkaC2tO0jP++uMTUsSFRuIH
         x/AQi90w+KBiZaBI+BMGm+F5VOXrLp+Tq7tzqLfCnDdtye9JXeuVOtyyzFs6NIAtUGSs
         jX8m0nq22bysAXS0ACN2wd4OjUtYe8M1Flkk5Lr02l15HBVpu2q9QDOPeY4w6sHoWema
         mig53EwI6loJmCTZNm1sxeizLulSZjF2kYPM5QL9uJR+RsrjZ3Vy/+zZ1aV90K3spNaQ
         EmCyrmCT4Ii+CXbAQJiwolFvV0WyNj7jxEWJCGP/2nw477Huou/awdRbwKWhQxDVTVQU
         2VUw==
X-Forwarded-Encrypted: i=1; AKwUvBxLYx2fKVowRyVRkAztx0Pe9+FubSxC7GWH6weBpkSAZZ55o3yxWAvqrOXJrnGQTpce4qDh0/lY6l4szUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdL8kliGBgsnDuKoGm7gQ0iz0DEHDSBkxrQyRMYJj90solP0u2
	D/DP4OAT8S8hJVb4LCeG/hhVx/5KiZeK7g6PBRymPUaY2us3x5eiHRlzV//kwRxl604=
X-Gm-Gg: AYBFou06Ps/3Sz9GFfP6L9O9NaIECYmY3dVB6tuRi7lSJlts9x9zscflw1muRCvnSW4
	4eAmLhJlIDizhXC3zIFiAif2ISYCS8816RvCBMBE3WXy+aqTMmiTWUrFqOSpqQW15TaogV2v7Yq
	uSFrstUsSwsOpsPsdjOhgcThuNnLBLPYVU4zzZ9AjnJeDIY2oU0KMokO5kgz4N5pSOe8Hwzwc+Z
	ZyDch9OxvdpOMOOHnmlru6luSXKZ0rzx5Ye3Ex9ZPaTxBepcjAaS6hSljCU9LDSqoLJGHlHbFQK
	NWB+MzZz5SPdP1HbSQ+3OWCzG7P0OhFGpoPQ4IvIZ0eJAww67uif2rS8Yyi0upPLkAbVaCWGi7h
	ZW3CBo5PUtHYFX6lirMrkwjP/Ageu60bp6sChYSW7wUThO0y2mdexNuX2peYpzbvUwrlJTEf8lO
	uQv6aezIdikflOhxTjz4RbRb7mOqmRkG961f28SHXiI6F0ZfYHVlt2YyVC1Ya+0kAA3MmM6PsOc
	/hq+dprEV9gG5t2t0W7f4LNL3pAbk2Pc3MzlrXnUAqU5dh2jLXEUJZIWeQMazCFuQKbF+RsKZr7
	8lw3ytjhb12QCg8EFSLnLVQGJWZL95pfc65CqUh/M2Qnfw==
X-Received: by 2002:a5d:5f85:0:b0:48e:bf0:35c with SMTP id ffacd0b85a97d-48e5d2e749cmr13206928f8f.13.1793275473988;
        Thu, 29 Oct 2026 05:04:33 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm34237059f8f.25.2026.10.29.05.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 05:04:33 -0700 (PDT)
Message-ID: <ad048090-431a-4343-a08c-d8e139d52005@gmail.com>
Date: Thu, 29 Oct 2026 13:04:32 +0100
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
Subject: Re: [PATCH v2 2/2] mm/vmalloc: reject NULL pages in
 remap_vmalloc_range_partial
To: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ye Liu <liuye@kylinos.cn>
References: <20261029-vmalloc_remap-v2-0-c4705cbf26c2@linux.dev>
 <20261029-vmalloc_remap-v2-2-c4705cbf26c2@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261029-vmalloc_remap-v2-2-c4705cbf26c2@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 10:19 AM, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> remap_vmalloc_range_partial() passes vmalloc_to_page()'s result to
> vm_insert_page() unchecked, oopsing via page_folio() on a NULL page.
> The NULL case cannot happen today because VM_USERMAP areas keep every
> page mapped, but nothing enforces that invariant. Warn once and fail
> the mapping with -EINVAL instead of oopsing if it is ever broken.
> 
> Suggested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a888eca016a8..dabef40ea88b 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4906,6 +4906,9 @@ int remap_vmalloc_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
>  		struct page *page = vmalloc_to_page(kaddr);
>  		int ret;
>  
> +		if (WARN_ON_ONCE(!page))
> +			return -EINVAL;
> +

thanks for picking this up :)

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
