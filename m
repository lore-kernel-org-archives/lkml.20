Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793337109;
	b=o7GgeEfUsktn4DchqWpkieR5rSI97XyYZP8YiK1rdmC5BDQAgbFyPs+kqbXG911Q8nGW
	 ErcgF5vDFDLrSFWKQeOYQxM70jkU4REFHeB9NjYw0pcWC/e/96OPN0VxiXyl7IibavQcM
	 w9acd8XKx+dXSvqKDu8AwdUgzijvmUaIO5uWyEnXhuK8WE7DISlsBPYAOy0Yz0K23LnJ4
	 DDh0j0wmV0TR7wCS8FZ52kQAoOcH4Bum2lD4KWTeu5uqr1qHaN2utaKmxF3QYv0AfPJ5f
	 arMEjGk+KgM0Iw7n+DGUHNWQJ3bf6ppSBFj7R/OfLdy9I7eKR27pXpq11RclPOIwrnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793337109;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FQn8AMTtavP6P181h0fXU4D+4WY7Po1HblFZ/HaZCWU=;
	b=LKcoFg8VgsleAlscKMCbKeyzpON1kQielMQCx8S+Dd9Nf5vHHiPZ94OGeBoOOuXtVOEv
	 y3wWQa7UiyUC1VCMbN2D75wNvi6jBNxEZ/SXkbhSXM2fZUm+vHUYST+TWPRdXZbBXIAg+
	 bDvovo/ybXeueIKEaKvEo50ZsQ1f7wPcYTG8YInjwsg0ehrcZO81w1GMdxSZqXrT4+Z5A
	 rrDeyhv6TKhOkAOzcRvp+LJFUfjJlzxVHqleK0rG3X/JIIdLEfAeJk3qxZREC41PjdkxT
	 ijIqsuJdrwpWXF1DNA2fZHufOpcW5UuVV6bldulwQXrAKYeszyhPLXozod2oYlHUp1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XW8WCvWg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="bd/UzTjD";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65074606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65074606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XW8WCvWg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bd/UzTjD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793337107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQn8AMTtavP6P181h0fXU4D+4WY7Po1HblFZ/HaZCWU=;
	b=XW8WCvWgJGCrtcAiWgfwcMqLGT72FVAcK/GzlDsd6fHEmEbd6l6zZFb3uH/wrtcJ0HheHO
	vnqnD92aikMqBn4DJIU/Ip7/zTrT/bDhA206ONZV8gdRH649FRiiA83ES31JDaHRyozVSr
	BVXxzf3sGvPaaGd4aBDRPZwRsyZbgKo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-_IKQpSDJOT24eawsary4vQ-1; Fri, 30 Oct 2026 01:11:45 -0400
X-MC-Unique: _IKQpSDJOT24eawsary4vQ-1
X-Mimecast-MFC-AGG-ID: _IKQpSDJOT24eawsary4vQ_1793337105
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso502951a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793337105; x=1793941905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQn8AMTtavP6P181h0fXU4D+4WY7Po1HblFZ/HaZCWU=;
        b=bd/UzTjD4ClTsAddZbCLcewvZlGvpbw68jhujs6M2SJeDJyv64KhXmDibMuR4mxFyj
         hspLJnSTBR4PqQE/Q4yoVUpdkbSsp+t1EzyhRNxhAkIG2byrhPZNlya1UFVHgvJ7hHNl
         VsyV0uyiuhvaJYMdIXttT/vMfWAYc4ynba9DeqZRe4KdSAtxO5v5BHFrrvA4tnbvSkQt
         3ytkfciUQx0VhS4jjqgZQiz5MJ1qRcfmVXU1uyYX8/aoUradrL0Qrja7EWQTSKlDZH3y
         3e9agj17/WTEU1T+DvMf32bTM+9GN9Q5CezutUqWZHosJNZeVapIFesjIaDOgMlI4R8I
         FF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793337105; x=1793941905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQn8AMTtavP6P181h0fXU4D+4WY7Po1HblFZ/HaZCWU=;
        b=g8/OpIhBA/wG6PUqT9MqziZlNS7Oh5QxJbfxc5Io6e5s0a2pSAXxGy07A1dB4BHh2r
         UlXeHAebrjhVygffb7382wZNm3+DVyiK1fpPIVsKlTvm/kIaFaoVnUXKzo8DhbkGVURy
         8Rx6Jas1o2cDu6XyyGr9Akg+Rz3g+I+r+qnCUZ2MaomK0ly+sUGPCCMkSeG2vNfx/68v
         tGZOZsemFMnZcLuV8iSKnqh9ky1TdN8nkjorqJ08ddx12acZD5LQ/MZzNyS5odjyfyM6
         pEeAqvkei1rVJpsGApZXDrdq/bRNLPyShUqZTJBPoSLZ+x8lOBAA8S6s6TNwFBEBhUaO
         KiCw==
X-Forwarded-Encrypted: i=1; AKwUvByOkvPIeSEBMFN+GtdaX7ygkBw7d8Yc/yBH5L/ZHA1CEWWfs6tiBEGM0cqTahutrvDiqWh0iuxGhY8Jgmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzWykMjr9J6vx60P4orHz6cy07j5JHeu8oQgENK+T/l75v4AHE
	o5zXagOc0YLBvr/6RaavGn+9fvYBtjLn1MXKqsS5vcCoXgxanVwnMsc1hi2pkLipl71t0bgPSF8
	Sw4+bB4lYx/Z3RWC8ZvdsxgxdyubGl9qp9FWdz2wHXXArUhvSH9LwX4hYagzR2D/haUmDESk+3w
	==
X-Gm-Gg: AYBFou10+0ULaRy5jg89sBgYWkMTjLbgcDcWJ0xQz17Ddl8AJQSKZ0pYXtCpHggkjg/
	cGi2APsq0Vyj8bfPhsZiSf2QjKjlvd1JC9Xs+ekiNvu5oSD9Hca6wNRXGp4xpw9BxArH3UwE/3o
	mrsBbioEhdAh9vEzXLsL6OEHg5OitjNndMMvDb/9Y5dSeKdVgp1meMQ0twikxh3X62cu5JMXoRC
	d7NdlNzf8Txq3DMIBYqwASh2RaqoyojWClsw/oCvNUAIzhM1Ep6Z4wTdc7N+5AxGgn/2HqNu8fC
	IJLGme8OiMSDyb6FANkpcZ1qk3fVRvRlyivcZGpNL2qryfc6S36pgaOOqaWcUxUsZ8rKF0qsZl8
	dUxeS4jd97Ae6wzumdp6h+4laMtUvzbT1q2hNQd8pEx3NX1xPZTAoa7iszYVWu3A63hq7AKO/XU
	9vutiqmK2U/BTrtfQ=
X-Received: by 2002:a17:90b:55c5:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3ae8987e75dmr994577a91.67.1793337104532;
        Thu, 29 Oct 2026 22:11:44 -0700 (PDT)
X-Received: by 2002:a17:90b:55c5:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3ae8987e75dmr994554a91.67.1793337104101;
        Thu, 29 Oct 2026 22:11:44 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm6728517a91.15.2026.10.29.22.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 22:11:43 -0700 (PDT)
Message-ID: <6c683dbf-45e7-4a19-968e-5acab3290090@redhat.com>
Date: Fri, 30 Oct 2026 15:11:35 +1000
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
Subject: Re: [PATCH v2 1/2] KVM: arm64: Fix dirty logging detection in
 ring-only mode
To: Wei-Lin Chang <weilin.chang@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Leonardo Bras <leo.bras@arm.com>, stable@vger.kernel.org
References: <20261029175238.3214788-1-weilin.chang@arm.com>
 <20261029175238.3214788-2-weilin.chang@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261029175238.3214788-2-weilin.chang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 3:52 AM, Wei-Lin Chang wrote:
> When checking whether a memslot has dirty logging enabled, the
> KVM_MEM_LOG_DIRTY_PAGES flag is the source of truth. Previously in
> memslot_is_logging() we were testing the dirty bitmap only and did not
> consider dirty ring.
> 
> With the ring and no bitmap, a logged memslot can still get block
> mappings, so guest writes to most of a block are never logged and a
> migration can copy stale memory.
> 
> Fix this by using kvm_slot_dirty_track_enabled() instead which checks
> KVM_MEM_LOG_DIRTY_PAGES, within memslot_is_logging().
> 
> Fixes: 9cb1096f8590 ("KVM: arm64: Enable ring-based dirty memory tracking")
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> Cc: stable@vger.kernel.org
> ---
>   arch/arm64/kvm/mmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

