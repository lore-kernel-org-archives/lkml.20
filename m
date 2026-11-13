Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599894;
	b=NxI36C02wzeqIY7ntXKDo/XnmnMlPVtA4qHHH8YMk8t5OJrJuMlKZ8K5x0rpqJbqBNJF
	 C1C3ARKCSw+EnC9ZMwb1PkqWn2xnCFkPQ0y/jRnoehfI3Xqc108bf/aZxoS7FF2sns+H2
	 VkRmetpJ5Ibs+f+pFuZOgbO2zEo39nRFD9UB8BgzhYxTAzR+RWCieRxH7l0FgizT4oo5v
	 U1mSJdT7PqijUV5sR3X42wfhpxmZPwrKFmfSUDLeTG4PI+zdMknU6zKywFyq89AGd6klD
	 z8eotH195/T1WN7O943ckgoPkOtndpN54P6v43MKELWgOkk/B3JyGyYPHl6vso23grg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=mK+snQ9Frl5VxzHZ6tx3RVh1smAcvo0rFgfFkfaD5gg=;
	b=VhfQSvDvMrxkUaAUnq5TPdJberlmQuuGFueb0uJ81/7habxPluToqBUKGATQk0r2y4h+
	 2ioe7Cx58ZHtEWuyeFpppNOejoDqOip28JuLgwk1VGbD7R37ceyfnc4Q6PQ1lsNmpDlVC
	 JeAYlDJZV4Z7ud3bIoRI0UUb/GhN/7sQhbdrQaja56ySnDfBHfBmDdDelx2SZeXhHeNFq
	 oTG+igRVAkO+gzrJbo5ZRVds6+Xlw+u3TJySv4rUR5ALklwaBgUU9Wuh0yqmLLtWUe43l
	 zpmTn1XVyiotpDfxTqFi3W0NcqPJqSwXpogt6gp07vUPTyQd3Q2ldyxiSkrb8wzoAVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=l9B4VepN;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51499606AEB9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51499606AEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=l9B4VepN
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso751649a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794599892; x=1795204692; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mK+snQ9Frl5VxzHZ6tx3RVh1smAcvo0rFgfFkfaD5gg=;
        b=l9B4VepNHDDm6p7etG6W2OI9MX7MHs0BT9Dcv7hbvUD7tcAi2HbicK6dgwH04x86LU
         mB074A2ftJreMTxnPiam/gA5VJS0HXmF3HXW8v9BYgVQIzHFoNoKLK0UxhkQ/Xl7qsvp
         paffvFH+tI/4E7XQmnlSg3kVXDrWI2OtKE+Y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599892; x=1795204692;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mK+snQ9Frl5VxzHZ6tx3RVh1smAcvo0rFgfFkfaD5gg=;
        b=PyInmjtq00QMUJf8WqfI2uHPuyNVphsEJcs2lF1nsHedZ/pUJBMgOOHpZ8iParxDD/
         uo4NedfBEubyoaAolcJT7FfnGgGWX7FWVipvCnv9fMf/2RSXixfczJ8w+kfzXVX6CIub
         PRBJg0gEn9ohbOXMMsU+55NRwk4iAoBSH8dz6+SBC3Nj/kf0Z43NYCUZtM/ZDE1D5gzR
         48katCybF+TCHOuPLN/kgdoLy3h9taJ1J8a7tFtNzEIGymejsDXH1jXB1wUHyTyaQOZn
         uTINWpiaYeyXEZ6AOgnUJ3Oc2+Tstw/GOdTSSwKpdaqfXMgCsvrCglmLLk+4SqpdSDsh
         iibQ==
X-Forwarded-Encrypted: i=1; AL+hErEIx3gm5zCYVokG0Z70Tj974sxYvEkZ8Z79SpVBeSTQR+5+7mXd5Iden6Ozf6OSyUdASmi2Njwv4uNynuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eUd4DayDpSbVosVYopGrDJ0kAPBMiGVssHgSgVncXycSMm0wj
	TZNZ9d/QMhhIl4hWRsf+woldo6qfeNCD18nig1bMfInY2dN2Q2P9aWDEmHtz0SrytBAwdyJpJAn
	9b1nViQE=
X-Gm-Gg: AYBFou17gr79jTiOzPpHvg5FNjca9XXGjceLUOKaE8naqNH9fKfw4JN6OrZeH8q8EmB
	JeoDVvxubfx1eW6c+VLiUEcba63eboYHmeyuviwUigM6f9BpMpyLwhnhKJ2Eqw6Lc6IH16q6Hzg
	rS6NZQep+sMGjIj8kES4XUbGC3pBTqiC4GyGVwjxMFEfvdzhZHQ0jEofZRNBCaLUfO8gDzGZv3s
	mY68xjChkluyoRcjWil1yFbUkLtCPhZ6ZRv5NrGCUKcKV827CRlrdXqNw5pP/1mOdJRflwG55u3
	+CwGGYsA4itM3WMQOhEEys1vNpTI7KkLvlVzhvgfxvX6/+isY08udIwwWOoQky9xlD13t8XU8cL
	10PFDs/qJuP5+IdRP50aR8r8V3+ehJOrfQYJ/QTm+aRb6WO5ATGYoXlfSn7qE4zDbC3eQYvxoUm
	NDcprvzWY103XG5JoFghFV1GkaHdcTtO7m7/C95g4wfdNJTULjHmu+JzCom47VKaBDXadhUIXPk
	+N/bj6i1I1v2UKE41CnVvBo+Mq8P8VuwtIpt3rYAxPrbE609FjMT6Rhsp75iSc33gZUDEvXaGHS
	mJ/cbeFczgfB5+eI9vHG8CYd00FFMonpnRxZzQMcmRWRBuVpL3h2avYijahZ0rf5w8RxKFZ+pzG
	V9B7QRibwKBGuMbDsMj88BAwSOTyIx0lIZN0bqT0ohzmuWa2cGBj/VurZ7ykakRPfWmf8hvyvc/
	QUCD5khjyUzoiIEbnS8xwWxQSGaovEK6G09IRxZKSyH19Zrph/BuM2bfE5qJM=
X-Received: by 2002:a17:90b:17c7:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3b1b0ba4fd8mr3495026a91.55.1794599891728;
        Fri, 13 Nov 2026 11:58:11 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e5055sm14868305ad.39.2026.11.13.11.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:58:11 -0800 (PST)
Date: Fri, 13 Nov 2026 11:58:08 -0800
From: Chris Down <chris@chrisdown.name>
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: dennis@kernel.org, tj@kernel.org, cl@gentwo.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org, boqun@kernel.org, longman@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org, daniel@iogearbox.net, acme@kernel.org, yonghong.song@linux.dev, eddyz87@gmail.com, martin.lau@linux.dev, nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] percpu: do not put btf_type_tag on per-cpu variable declarations
In-Reply-To: <20261110012235.1024461-2-vineet.gupta@linux.dev>
References: <20261110012235.1024461-1-vineet.gupta@linux.dev> <20261110012235.1024461-2-vineet.gupta@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113115808.87a52a7c74e293ce@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Vineet,

Vineet Gupta <vineet.gupta@linux.dev> writes:
>The message is confusing: this is a declaration, not a definition. But
>the compiler is right to object to a type tag on the aggregate, and the
>issue is fundamental: every variant of an aggregate shares one DIE, so
>there is nowhere to put it. clang drops it silently and GCC warns.

Not a big deal, but the definition in GCC's message is the definition of
struct cpuinfo_x86, not of cpu_info. It's saying the attribute is being
applied to the struct type after the struct was already defined, which is
accurate. So maybe just drop that first sentence?

I've tested this with clang 23 and GCC 16. With clang, the same 280 types
and 3360 bytes of BTF go away. Likewise, with GCC, the per-cpu
declarations no longer warn, and the non-enclosed address space errors
are gone.

Once the commit message nits are fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
