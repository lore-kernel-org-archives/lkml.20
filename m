Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589604;
	b=MP0WQclxFrv98LDxYonj6udJOhIqNz0SqvUZrdFbOfPlDCgNvGB9ui1/9TmWbI3++/82
	 4YjgYaXotdJkigN97jOieHlPHkJnnkuO4uyIkLejrJCo2jqcdH5xdgCv31cZXFwQ71UHt
	 6na6DvkYkoMASooOSl0rFpzD50Pf60sNpjPmA2QnMJYUY93y6fVbR8n4YIWlQrQyFFjMF
	 HKS9AliDmKvhcQ/oINsncgzURG7x9F81YcO6YedMdzpWguWVXBDbG5alS13Vd3tyEjBEc
	 tLq4Q2c2mRzrxgM8if+Us0uOFulUHH1smyVHtkFKqULjYon2kmX5f60o+Sh95atd1VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589604;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TmmnV/ymSMAI2Dol5zCaEFZv43vlX+d7yneKTBH5aJI=;
	b=wY3oRj75A/5zaEXr7n3EBGlroNMPMpPC500hcvQo+hbANrSFjNmQCO4vYr40c2xF9Foc
	 CBWsHIhwHgPP4Iu/acCPYYywrd6MiaXJ4P+sdXAImu9jemkY6ySM9iv1lYSXZRtVnuV+M
	 kYnfLpTbgDAdrqmF/K/rslSkkpKpVsFoKcj9/pQG8IHd75uJf36XlYqTK2joLl556lvMv
	 0xOlq19jHYbEyuaoWFPU9c9HY04cEXNevYMOnZxgo5eyzPvuFJIyaBGnMBRbIahQ03q1J
	 mMhHcs9MBdUAd/v17aFMZD9hbk3X2Mm06NuBSB+S+/vAS8i7RFHwKn/DpeF3oakdDbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjMMwM1+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OOFjBJ7Y;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCC4606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFCC4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjMMwM1+;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OOFjBJ7Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794589602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TmmnV/ymSMAI2Dol5zCaEFZv43vlX+d7yneKTBH5aJI=;
	b=gjMMwM1+lvxXyUyfxrOR+GI6rSqaTtvwgQEkPqorLlHnGPhEy9B8DJRjAHODfrYSUf6gL1
	YR7RlU1xynaOl7++4BG4CVTm5TKeHz+K6xmLr5J8BHar+QXviSovI9/brsaRvk9Xo1Z+P2
	OGgGP/yBMTKgOG0K1QXCFWZ9Jo+6HD0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-lRRUw9hCMU27d-a_qiYQyA-1; Fri, 13 Nov 2026 12:06:39 -0500
X-MC-Unique: lRRUw9hCMU27d-a_qiYQyA-1
X-Mimecast-MFC-AGG-ID: lRRUw9hCMU27d-a_qiYQyA_1794589598
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so595025a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794589598; x=1795194398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmmnV/ymSMAI2Dol5zCaEFZv43vlX+d7yneKTBH5aJI=;
        b=OOFjBJ7YMq4qZZym2L56O8Gxc+U4X3QbgzGKfWibcMFiDZ0tfwPAUHnhQ4bO1SjIgu
         pOWhuvO/+1sCPnRjlJgdQlehL6SFyEI4lIDw0ruzHs/TKNWtmAkZJ+s9ptgbUQcQWs2O
         9sHSN1CnZR2YGhTIgcFRv7puOv44mvbAqxiZloxMpXbo3quJkU4dYC0FMSUjZ0evLBga
         C5w2UvIQ3qjq12X1iP8V0qrglQcDnS0ZNQOeHoRcG/okIALq1cowt5orZz5SpqVjiX7G
         NyOGKmReAP+rXuVUByoSx0skeYa6Dc9Rk6r17nzPgEX+dZPeB1j7iZsu+Ntsgt0iHMzP
         8/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589598; x=1795194398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmmnV/ymSMAI2Dol5zCaEFZv43vlX+d7yneKTBH5aJI=;
        b=IJBy1DLnkeQm1f5Rrq4M6hlrEHK4CtyYqJUYyhKnsKu8BCtfOnhk3GRImTdYWShaXR
         /FoTdKtFJJUdkWM9B1ZqNx/wUWQqdFu8A8lTHy1KOqUh2YaB0awzL2S+nZyTQgw4uuPm
         0bUf/xq0v7FvT6ewR9E7TD+hnczvM7anUFfYN786PrcE8JMvdZV9NPCNNbDaobpGRdX0
         elEBK+Bh0VwxyeI7WP/oRmLY0WstF6YeCkaAw+CPG2bwoZXvPuUdeDk5lf/u/lDF2kU5
         SyhTlcCs6nCG1JKTyB1qfcFFH+gY0djUWEu7Pvyu/FYM8CLn8YP+LFw9yohd8ilRH8hQ
         Z+8Q==
X-Forwarded-Encrypted: i=1; AL+hErG14+murK8DUed9UNy9wxizNFxD0yAmd4AqJAUokBk32NZi9bNvJFGiG18wR514PHJEXaVapgwdDhwndwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jOeGuSh57znfbx/ROoCoJgb4tflCiUBMUt2VqrF0p+7regiWm
	+cxEcwXDmZXHurZxpz2N4PMkkpumlAj7sM9xQAzfKlMz+Kme7bm5f1YM2I2q/JdD7matVAiqrL3
	Hc54x/8xycoYuzKuQu4h/lK8ou536D5rkL4HD82NrsdlQlohq5tXPFsIv0IHg0/m8rPjxh+8/aQ
	==
X-Gm-Gg: AYBFou2YxRrYPSAt0FtHmGtq14y+VOrjaKXKmI589aIX/YRbYLOXhVZmVi7cc/11HI3
	4M1GXDqi2ETFjkAk+voRPONBKppUgDmr2RK48S9+0Q1l4Tw6DXEbRyxRTaMrsbH2rUbJkQ3n0hd
	21oMJs1vmwSpgbI4y84a57nS9FmlvNdrDDXkPne0cbLfaAzckEKrjC+Egxw05Yj51paFfwNVLts
	SP35pVwVGzMPG7lZ0khAjX05HNo47p52lTcPEgTIIQaDnjwxvBlTiFoLeeZsXB9vh0SzJuKYQYl
	bJ5aAZgB9/cfsT6khoSt1fz3CdecooWCcR7wOwjzm54tkFBV++nYE3efDQdaOYEApW7VQOZYrP4
	OEgcDG0KRLj8X8V+aTj2T/2ySn7ImPeSzKZUADkLgChLyuILzCWpGiFRNDR3FUfO76PeWbOo=
X-Received: by 2002:a17:90a:dfcf:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3b1b0a1b56fmr2668133a91.26.1794589598112;
        Fri, 13 Nov 2026 09:06:38 -0800 (PST)
X-Received: by 2002:a17:90a:dfcf:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3b1b0a1b56fmr2668105a91.26.1794589597671;
        Fri, 13 Nov 2026 09:06:37 -0800 (PST)
Received: from [192.168.1.102] ([117.245.168.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm2247977a91.3.2026.11.13.09.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:06:37 -0800 (PST)
Message-ID: <2bae83be-bb44-4541-bf1c-5861f73a7394@redhat.com>
Date: Fri, 13 Nov 2026 22:36:30 +0530
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
Subject: Re: [PATCH v3 1/5] kho: reject zero bootmem scale
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
 <20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/11/26 4:08 pm, Mike Rapoport (Microsoft) wrote:
> kho_bootmem=0% sets bootmem_scale to 0, and then the bootmem areas are
> sized using the explicit sizes that default to 0. KHO remains enabled,
> but there is no usable bootmem to load the next kernel.
> 
> Reject zero scale the same way zero explicit sizes are rejected.
> 
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  kernel/liveupdate/kexec_handover.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe31819..b30ba686cb301 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -703,16 +703,22 @@ static int __init kho_parse_bootmem_size(char *p)
>  	if (p[len - 1] == '%') {
>  		/* unsigned int max is 4,294,967,295, 10 chars */
>  		char s_scale[11] = {};
> +		unsigned int scale;
>  		int ret = 0;
>  
>  		if (len > ARRAY_SIZE(s_scale))
>  			return -EINVAL;
>  
>  		memcpy(s_scale, p, len - 1);
> -		ret = kstrtouint(s_scale, 10, &bootmem_scale);
> -		if (!ret)
> -			pr_notice("bootmem scale is %d%%\n", bootmem_scale);
> -		return ret;
> +		ret = kstrtouint(s_scale, 10, &scale);
> +		if (ret)
> +			return ret;
> +		if (!scale)
> +			return -EINVAL;
Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

> +
> +		bootmem_scale = scale;
> +		pr_notice("bootmem scale is %d%%\n", bootmem_scale);
> +		return 0;
>  	}
>  
>  	/* parse ll[KMG],mm[KMG],nn[KMG] */
> 

-- 
Regards,
Mukesh Pilaniya

