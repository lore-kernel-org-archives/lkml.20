Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184965;
	b=SFv0jsY810mXNKR30BZ2U2AIPr6yN/7Bu5Ehxavd/TOVAvgdEeDGgHchGUruYuIHlPQW
	 t97NhvHE1sPM7kQs74SpzbkrUYmqmVP07+eVfjyxJ9I5Z9VVNwMlrMWvez9WWnveG4rIG
	 2oczSTXg0TYlY+CFMsTlwYPPL0OeCopNs5oUuPDnW1bRUOL+DE5dl7xZAvgfu+QOJFTm9
	 PmVZlMJJPS98uO2gDzjn2hxAggrG2/LbBJt71JqCdpzS9UtBeU+8YaVr0GhcpNfZ7a8Zn
	 dgD0Uj0URgn1oVMQv8lNtRSnZ52lFUofo+OussXUUXSFDDfRNNMXFyvMAh9V6BNb4nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=42fUzzG0W2qYfbl++Ffgg89HqosiKQlRzn2fAEw0aa4=;
	b=hW4Y5+J5qOIckKVo+qbwjngDCm9ytlw8mMybauGofozBYISBIgBDKordUp+9f1kAUqr5
	 dSXuu/TtyLjpucAM2+5UOy5WD2IQxH+louG47RrrUhTTwcHi8/2qLSb13W/Om7q5+XKW3
	 My6QNtupS+F/ff89kaRzLGXrRO/j7cHf31XngmApo9OTmavfXqUNOQqNq6OyOQCubvM2R
	 PfnCN/612IWJ0OwGgRDEVQYM9PM4UCeL0DxmD/1EAx10KBMbI6lhfbvNphNSe+bd93BG2
	 XxyxTPaWGh9maDZjcfZSEkC9K9xa4qPQSN6oTxfSRzWxTNa6VFtc+gV/QudLHBZn4Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yrOzTqZw;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDC6606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yrOzTqZw
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so6307435e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184963; x=1793789763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42fUzzG0W2qYfbl++Ffgg89HqosiKQlRzn2fAEw0aa4=;
        b=yrOzTqZw8SYzbY3Ef+agz3OeCI1d/AxZzNWF6GcOYHGVjFSFhSsBM07zLMq7VhOVsh
         UkRtfNhAZVWU3Sd2QWHRvyCnskj11yZ0ytpTdtu5GRLOj5hnEdQExya7zxFpX7SQPWmB
         M8eAXxH6cCb3xHB9aO5wRVwQzJ0Rn0/HFqX3urCcRVWyaXLfCCoH64TY6my5wNKg0d2U
         +OGKqo8Lsl6+m0coAILVviccG+BJ3xqaQitKCe8Qm/XQ39sw2xDEPXbxYCob95UUkFGO
         r2BxoeSBXkVGAbjoajqdtNtuVKsa8VR9fs8PLsF25Dxd9Bosg44jwmESvvYJdpJnNlZZ
         PPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184963; x=1793789763;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42fUzzG0W2qYfbl++Ffgg89HqosiKQlRzn2fAEw0aa4=;
        b=sw1aVpow/adTvtJo1kG6xjhh6W6QNT38jVeK+MeEl2xXfH7gFu+3zAng7o+zGtKQvd
         mDXymlS0o0Un2fSbDiRDqr8YQ2gf0ejGt/LXzC4uYtHG9C8smiVb3m8zDyMcG8qO+rsl
         U96rudCLygyzxoKVKUmXaqTToBRTOukFUzB83HMx3Ix746D1gDVmFIm+MSlELGvoHlez
         1HaoNd9HruhuNy7P7JL5qhl+xqm2//lwq6mh+pu4Bgv0V9GyKxHFW1e7wevVOWhaxe67
         Uq2wQYWU3ls94tnYS6FElwnRVMpri7b1QPe3ZvgLxyCZajRVuZIm+TPmWubQd3v6KUGG
         MA1Q==
X-Forwarded-Encrypted: i=1; AKwUvByZ7SrlXJ7nXsWUlhkHPSQG0qhalJ1VyAWO4y8CiZMNm8X9WneDQh6MaSiFGhTBhwZhVUdsKH4t4hUnAL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD2uoyDXwj1+EAN2PK+vMw5M6xwHtzSEZCTH2SGdgE6F9w/S/i
	ND24cSjE5NcvRnK0sXX5o0HdyHdwD8z5D/c+Gi7LbuHWtV1cqTrJL74tN1zH08FX
X-Gm-Gg: AYBFou2zVQYvRByp2uCiuQHRhw6w24lKhe8F+g2W0saYKws15cYirPd0h8dPViGaZ88
	ukVhlTe1bpH4nX1fNZYpKqa/cQaFmeMc7pi+DO0iLNJTSe0JEd9Vc0fUnCEd5a+IO5NkLHfxW4x
	fah6hyevtAHHdmE2PSV6CF9GxaH31jVsyxE7B3GqT6hI4CBZlzqTZbTD/IyvLIbVEQuIcYuOhsU
	Efa6nJT/oM5Yfr1176iA+8CBLNKNg5Qd5SNC00Hj9isjKv/xZmAAncVDvXKG03FAZL1z8EQ+aln
	mxfrp5seIg7+HdC6GiN5+s8CLfGYE1HHhBiHr3LQXbOVl06oZ+maFRvM0ilGwF4NyIH3IXLM9uj
	6QrhT/qdYkhLG7yf9tOAFYuq7iWRVCSbXL5ZF2bqb0UoW1G2JsaBlbQ2222pZMsvstMIAwRXZhw
	TiAVFenqYL3wkpSAi7K4IN05aqKGPGcOacLOGTOR+EfWakpGHlUMjT1LeIM8HGbF3C05zLwXqkY
	JAkxjHWeu0uC6JoxoYzKFL761KhVL+t1t1oIGcZ3M0OjdCdg9f5BGCbumA6xADIGDXmerPaZr+s
	aVMyHRROZ3xc5tvRjqCA7PNc
X-Received: by 2002:a05:600c:a11:b0:4a1:e11f:b2e1 with SMTP id 5b1f17b1804b1-4a966773233mr39854085e9.15.1793184962863;
        Wed, 28 Oct 2026 03:56:02 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978795f4dsm33227565e9.9.2026.10.28.03.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:56:01 -0700 (PDT)
Message-ID: <599fe237-0a05-4e95-b377-7186cb0d761a@gmail.com>
Date: Wed, 28 Oct 2026 11:56:00 +0100
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
Subject: Re: [PATCH 2/2] mm/vmalloc: warn on NULL page in
 remap_vmalloc_range_partial
To: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ye Liu <liuye@kylinos.cn>
References: <20261026-vmalloc_remap-v1-0-b7a907814e90@linux.dev>
 <20261026-vmalloc_remap-v1-2-b7a907814e90@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261026-vmalloc_remap-v1-2-b7a907814e90@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 7:09 AM, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> remap_vmalloc_range_partial() oopses if vmalloc_to_page() returns
> NULL, which never happens today because VM_USERMAP areas keep every
> page mapped. Add a WARN_ON(!page) to flag a break before the oops.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a888eca016a8..59ba203a4eff 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4906,6 +4906,7 @@ int remap_vmalloc_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
>  		struct page *page = vmalloc_to_page(kaddr);
>  		int ret;
>  
> +		WARN_ON(!page);
>  		ret = vm_insert_page(vma, uaddr, page);

doesn't this still hand the NULL page to vm_insert_page() right after,
so we warn and then oops anyway? wouldn't something like this be what
you want here?

		if (WARN_ON_ONCE(!page))
			return -EINVAL;

-- 
cheers,
jose a. p-a
