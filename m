Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915240;
	b=3o++3dUqCpQyiqrL6gl9HQO5mHrFNzTmZmEAhjBfLv56drM+MNrXu8ns+SzOSvfUlC3L
	 6mhPDosNsmy1gk+4x1PUmOLJ5QAZQzGBeetaWhFXVRgKejXHA2EyIYBdUxrlSATTjk8ko
	 r809GHBvYflYp00bUIZigEFDPllzLjULI+sR1t6OuBb+laH8huI29hr1YIJoyS0QWkq22
	 MmOL0ZLe2Atpr6R5nGgP1s/J6p593EhB1YrOEA6SVOFmSTZU4ghgm0vjG0O5GkRKqRvzx
	 gslLuj8rn94zZr+/hWa4UeWhF40QskLjz4XRGcUN9gFsNtw2B/eYwS92jG8dtdOsfKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FJ/A2e5X07rBRQBUzH+eXJYmu5j343R3rSFT2KqYV2g=;
	b=ln+xQCxOHeVwAE5ad8gL00DBNGLPGdfwe6f5pGxyVdKyKiR8HxNCrmxns9Uo6rzYjhSQ
	 4EhGXeuXkZMGYmtXCeDGraQxQEGjQln3/iheOZmsFljKeNEk0seg1vKFoGFZifwkjByc1
	 5wcBVs9Gya1nnlnOPV0OrLsny92DCEUoo0KqQFadMY4ahljdw8FjGK4g/m3v4dga65Wyk
	 fs3kxdZ9diHxH4TPzTK9cZ0jpnuI6WEF9zrdRHf1IBNKrf7Vg0t6OTi1NTjhG7dyUvvU2
	 0ibh9TEo0PKcZJYQpNL9iPLphFSxpiVhSG3zCSO+g7CdzhI+rOLT1i0D826kIIY/OaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0l2n+KzY;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BEF606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BEF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0l2n+KzY
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so84435e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793915238; x=1794520038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJ/A2e5X07rBRQBUzH+eXJYmu5j343R3rSFT2KqYV2g=;
        b=0l2n+KzY94eboSRzWacBCMJwG0Uzxb2guvbz9PWFQN9VezkyrIhAu6sI88lRllkTru
         DaMBxBtiEWpGbE4H1p+BfTFGOVViysx+SPeeKqXb9Nh7jJTJvMO0V68wlprhJWijgPQg
         CITBeayTVVWFK8Sl/KZRNFccZx+Fb3b4+/dsf1YtP05IF18+W9OkVinDERqrK7vz2nJY
         ZlhxpTcfDgZurpkfM9zcnCJRCYc+f6H1345oIa2uuwzDAw+g+5L/TqhQuwKcVbtojRg6
         IfqO3nKUXbyFFEAZRLsDxX7pf48cQVKDrawfqAJzVvfZfMYptxMyit8Pvj/1AVz2FCji
         L4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915238; x=1794520038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJ/A2e5X07rBRQBUzH+eXJYmu5j343R3rSFT2KqYV2g=;
        b=E5trBdMMyfJPHJCQBTMC677Uatl13dYFO4HW5HhhjLJZJ126hJy3JIKzEyQrG1jav8
         XeeDl0UQRtUmwpb50ApNx56pp0dDFnqfMe+PZNLSia5NbWbBSN3IyW8uHsE+iaz4KOZM
         iIMsFAitRkSWcMKMN1zNMMpfmuATijgPWI9/seapDs2oamv6nBjFmTehlM19zCmlIDCZ
         eGnIQs4dqzijkKl9ugJVj8RfpCJnY8B2xqtSqKwCQHoBLaFBwGt2ASZf9RbOixePLxoW
         7fOXPvLcvMO5+oYUlstu2zZv3c7V9/yELHsrcVQ8bMJt9o+t/ApQa6funIwoRnLhVOcI
         5UgA==
X-Forwarded-Encrypted: i=1; AKwUvBxx6GmG6EQPVF2hwvyUOnlicNl+Re65X/Sacny8YKJssJNqbQxzLieozdBLshEnW48yjvN5+5eW5XvzRa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z//lG9i2J9ZMtH0W+/WP1ePyMaOndIQbGHc9829bpABknvhg9wm
	/bEI80GkMiRF9TVlZWcbODNdcstZwV3eaM+sAnldzdpyq13o5f+wChjC
X-Gm-Gg: AYBFou0zNonNuAjPkFrd5deqTVUmvszHBMuUjmlwTPsfF6DpvqK+bc+7qOCCBQ1c84X
	lNuD7lgpFrr0a870ZtTKlaeaZPMT5aIIu6fmrLNZiTj5/7TfRPfVqfjlyP0QiDtBdbByuvuqLBV
	55ZuLKQEgzWIwcBNbUktk7DGL+K7+kYMZfAwe7+B7Rltp7mbzYkoFTOukY6+7TFbbzMxacQIEvA
	lLXGfmy1gopWGZdvKpVU3KOXauOYtUBIYTF6Z61B7mLaNGrx05/gc8Ig7oSbF1e2A328KKyjaID
	VdBhbOnfzoD2Rr3dsUBSYivdeIgMnT0bHa7U7R48tRB1BhWjqRuBnvZwi5UeF8CPkBohvC6+eEc
	JP3PGyqvCIoAOyhHE9zDZON4XlgBlauJRKEsRiNVpREy3zL+eoUQMJMTXgi8WjwsptjyOh5RI0p
	YA8GDbO1/Rc7Y+280SYicDzkJbi8sqrwWRBYbRPt1oZO+WHNmSL7V4lb0ePFqkG598upVeqyRx4
	VyTsdWediqDDl1jII/cGsn+SMwdZmRirCYHf9BckP/YmTshuorhzcRrKaJzzmwvVl6Wlx+dBtcX
	HmVGD+nMTPvA/rUI2Aykl1qr
X-Received: by 2002:a05:600c:64c5:b0:4b0:a7aa:843 with SMTP id 5b1f17b1804b1-4b6df4f1dfdmr6194255e9.25.1793915237988;
        Thu, 05 Nov 2026 13:47:17 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6c776c90asm8123125e9.4.2026.11.05.13.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:47:17 -0800 (PST)
Message-ID: <0076d3d4-465a-4dcd-b789-aa11c112b74f@gmail.com>
Date: Thu, 5 Nov 2026 22:47:16 +0100
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
Subject: Re: [PATCH v2 1/3] Revert "mm/khugepaged: remove definition of struct
 khugepaged_mm_slot"
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-1-4384bbfe4606@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261105-khugepaged-latency-fix-v2-1-4384bbfe4606@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 9:57 PM, Lorenzo Stoakes (ARM) wrote:
> This partially reverts commit b4c9ffb54b32 ("mm/khugepaged: remove
> definition of struct khugepaged_mm_slot"), as a subsequent commit needs to
> resurrect this type to store additional data alongside the mm_slot.
> 
> The stated intent of the commit was to address a NULL check in
> __khugepaged_exit():
> 
> 	mm_slot = mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
> 
> slot can be NULL and mm_slot_entry() is an alias for container_of(), so
> this is container_of() a NULL value.
> 
> This was benign as there was only 1 field in khugepaged_mm_slot (offsetting
> NULL at 0 results in NULL), however it was right to fix this, so retain the
> fix.
> 
> It also unwrapped KMEM_CACHE() in khugepaged_init(). This was a mistake,
> and was itself reverted in commit c14bdcc9f274 ("mm/khugepaged: use
> KMEM_CACHE()"). Therefore, retain the KMEM_CACHE() form in this revert.
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>


LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
