Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596487;
	b=EPxF+LpcmAg4MvTm4qKVrmmescAuxpADYULLSg7aajj+XC8SrdUxOdZTtABRre3ZJoi+
	 JrcdA5OOhv5kWxCtMfi22cJscVSqtF9ZEDmTxUFVhkqubhupNsFIeMDd1UJfGaFvkO/Zt
	 dEEY0p2GKbL/NGYDju0rWDR8NcuIKtIGDmU6fcm6xOMVVp7AMFdmwuwsulo75MNWOabfA
	 z1AjW3Vm2Ngqgd1RiPAMXLz2K+UvqZ8RzTQZ0xD260yTLaPRjs1GrahQKrzxnJvTRltap
	 9a/VM6IENJVZWDn8GF0hresi+atnHTBmbZ6TEZalKvPN3hD8FlCC2eGOYoowFLDkEQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J7iM+yhWKMhlaRTv9Dtyn+iVYrKHxFutAHJMBB4EGzM=;
	b=hkzHhgo5TSYenNOc2d+M4fUY6EBEAa8lQIqZ8qN8veklQCdgbBFLO/xggoqTrkrF13ol
	 qWZJ0BQ0SnL5D2DzSSm6ntBMt032HCVBP+suWdLMmMgmva+KJ43a7ciRipJnnt0Eu/6Ua
	 JKUp/8Q91gTPnqcI3klIDZ7gwHWvwgD3L1PBn8GY8wrcq58r5R1D6f17vxYbyH2/jAt/u
	 tPaX7NXBThuf0R3XPsqw4wDY6KjSQyzQoYrbU0j7RejJdjhVbjJhUws/BX/GvJV8TzRb1
	 N6JTfW9oEN84XhuwG+jyDo9fya6IvLmLXZ4hV6JI4D61FuhZV0aLE7UTHl0d9N3afxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=NjkSxdlR;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C7D606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C7D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=NjkSxdlR
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9179bfa9e9cso12367436d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792596485; x=1793201285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J7iM+yhWKMhlaRTv9Dtyn+iVYrKHxFutAHJMBB4EGzM=;
        b=NjkSxdlRV0YeVz9c7b6C/ObSO3CV0F/hk+ur2ybp4U3aMmAsWcP+bU7/dNr90v16f4
         lzE1t8ilfOMbXED2Faep7Yp5B95D2uUr/qMIEx5Oyw95DKLXGoh3caabdUt2LHq+Fi0j
         vSya0ZD3VKvWY/eLMka4vEoMzAqmA7visb1VKBind7HuYq2Q86IXrdGSvBvLC4hjJMO4
         aZXCGMpGcQKicHLpdJvPEmLzWgdSH16GK3pwIzAwfObU1r7I4EGPOadc8keV1VdF0i4+
         KqPkYtVuJ9RYGRLHuNTHl+cgUIe3yW4bKzYvltjnytDJ3oAKPykNIzKqUiWhpgU+lh6v
         376w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596485; x=1793201285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7iM+yhWKMhlaRTv9Dtyn+iVYrKHxFutAHJMBB4EGzM=;
        b=V28ATB32Brvn8rTEt30Q1zDtT8RzOBIT01E8Vrdl3CfZiEttmbrvzvhsL+oia9819A
         jA7Ku8c+wazrNIgxXLgPvJPJLOtFfHUna/NaGbMAuEKnw8uNmqXnHeJ52NRZjnKZ10oS
         pm/DTDnO6A9XMKONsMVVCfVkjWxaO2aVUvjrq8BLNPEZMy1zbf3hccdTeligVo0JOxLT
         LutQFDdqr58YQUtpbC7OWCheEL7fGIX339BXB49wmDgk7xefnQuN3tVoAi5LDqsf3hjh
         K/wLsfgYgyg395ReMlDbGgKMrQquJjupp/NaHCx/YxRC0v0ka5QxQLwrJVcXju8FHcoj
         gZWQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7TnlOGfjjqKzMG/FCr/Efai+FH5JMFUHARCHQG8RLglgc0AOP9khbEWhahuerNyl0uvR8kNlaCLGL56E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDUD/vqTthsh443szEo4y4dFPsDEfJJ+iuZkWf/WHq094jeeOB
	FJmwMW4J03y1GMdkKmhq9hvrE1r3U7wUfx7Jv7FM51pKdLh7hlK+fmtFkr4kjlHuiaU=
X-Gm-Gg: AYBFou1WWvczFiermkspsq1WIHPwLEYly1ESoxwqx+aRQlxxjqqtj3rmTfIJo3PMxzR
	bBU7IX+0vfeGt1EigrOIuWh7tYQ7q12MFP/wlcA1YPDbfLNwqNo8RtHL5h+j7Zw2MkIRl8PkKkr
	dOOaXLV4a9OyIdmdIk2pcnITjDPkw7UdQgDW7GBP4kK+GHQRN7DNRcclJG61i4yA5fXTlPYebXr
	kY7/QIrBb8D9nKYr6QKReWbUINKbb8doUssIBhQEE5RpADWtSNjDl6WJoM9ZjgrykyheoZirYPb
	qUBdqDNMScZLn8aWzTl+1jXPNeppt1+mVRn5cNbTUIbhZR9ra9/9XJNGDIhkQHxOQt2l4Vsdxmq
	TVGR4OKm1+YVxKzG90KRmtIZdsJ6mKRkEGyH9ababLFCcQAxOQl/U0L8QSuoTRUgUy5TwxLzXi1
	rOlH8OePoxhlyuoNUnbb8LfoBo9qcsGbHKShYKgbPEUItjYC38MaCvMjRuKigxwy33HnTIHApZt
	0vE81yn8eR+sKew+GlOIbAOFwYWbjrGHTWZLdb8W9oHWbdMW3JUFe5WvyDnOqkZpmQW/YX+8/p/
	d/JqAhCBv5rGvyeF187a9TmZ/F0W7WcO9xKs
X-Received: by 2002:a05:6214:3a8c:b0:91b:d5d7:8c85 with SMTP id 6a1803df08f44-91c12eff3e3mr44319236d6.33.1792596485317;
        Wed, 21 Oct 2026 08:28:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c3b500sm27151986d6.35.2026.10.21.08.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:28:04 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:28:03 -0400
From: Gregory Price <gourry@gourry.net>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, jack@suse.cz, 
	shr@devkernel.io, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/page-writeback: avoid 32-bit overflow in dirty
 threshold shares
Message-ID: <atjZ6yadzSeqjozA@gourry-fedora-PF4VCD3F>
References: <20261021060654.27855-1-dennylin0707@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021060654.27855-1-dennylin0707@gmail.com>

On Wed, Oct 21, 2026 at 06:06:54AM +0000, Hungyu Lin wrote:
> The ratios used by __wb_calc_thresh() are scaled to parts per million,
> but the threshold and ratio operands are unsigned long. On 32-bit
> kernels, their multiplication can wrap before the result is assigned
> to u64.
> 
> For example, with a threshold of 25600 pages and the default maximum
> ratio of 1000000, wb_max_thresh becomes 4125 pages instead of 25600.
> The shared threshold and minimum share calculations can overflow in
> the same way, producing incorrect per-writeback dirty limits.
> 
> Use a u64 threshold for the three ratio multiplications and div_u64()
> to retain the existing division order and rounding.
> 
> Fixes: ae82291e9ca4 ("mm: use part per 1000000 for bdi ratios")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

