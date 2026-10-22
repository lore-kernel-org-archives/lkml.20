Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658311;
	b=GxUYX+fOsZl+WbRJngBMwWhABKOqkUBhmx8ulwOqS4l+//ujhnpfA4wGP3t0AEsBjPLr
	 +vZyMF5oq6MX/w8rtduK2K4Y08KSNj3m3Rcb/y00gLtg0DPgKdO+60rT63McJS/N7ttBw
	 G61shSCoiE+8dx3Oexp3PauD6l4B+P5wLbSKQAm2hOIjYpSr45VgnngDrQs4UAqA27NkH
	 PWaXgdLXiKxZ6OAaEHvAfsq6/hUGIOYta8KGJ19tDcItB6XbsIaIgMpzSllxPwzb3mQcs
	 cGFo6bd05TMtZFiH49dvF6r02DgcSKwq74cjGVRkIEzXBOAzUarCGEV0wZK8fM4edBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dkcN82wBwExuVJyyVBnWtTmTYSL00fmUHuQKj+lYVsk=;
	b=uC7jhBlMlj/ClMaGmQnMWyECGgIIc6R3qygLQe/R2YQ/lzZmA1ZCdjF6xOKFF067cxzB
	 n+ba6X0LDctxALArxPWGsJrToohoGoQmtlJHLt13/vqEV/93EZ99BuMPpw3VUe3kBslyW
	 NU+CKRGyTxKG1NYuQElz4DSzXydODvCxfjhkP6/hjMKoLHHpW9pepopl43CPqxCSQdo7Q
	 XIhKWfr+6jWtqohk20oJcZu2U9veHW36FQ+2cc7YgRMCEvUuU3HOJDVfUn7Cqc5IO4be3
	 L2JgZsHOMWXbIusH1NonXTassnpYxA0dZtg865IOuxAID7TeIw26JPAd0vL33sJzGcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jag4po2f;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F7606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 801F7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jag4po2f
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1511945f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658310; x=1793263110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkcN82wBwExuVJyyVBnWtTmTYSL00fmUHuQKj+lYVsk=;
        b=jag4po2ftpZrQouNIZhLJ35ID9tZdJ9pWN1r3JvNS/k0g2garcvCJ5Tx3S2KTDhKvY
         baepFp54SG6AaUIULlQZ1XGnylH1dsZr41opRKEDdRqgqe4fILsieTAPnMYbTRJ7PBvB
         DNpFgFMD2ApVe8bKs8+HJ1oUZ5Z03iwUKDfwY5hPROfoM6mrxJoKhjxtM1xpBGNAViUB
         jLKiyT23dksDPK+l32ODkhcR6djqAJBWi9LWk+yJKmhzJCerBn/Fvj7ff/oCUYtXQ/zU
         /8BF7doxCc6E0v+pAIal8Fl1bn6LWqhfgabefxmmh0/0zwWV7LT9prZFuHK5/bhXLs4T
         U10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658310; x=1793263110;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkcN82wBwExuVJyyVBnWtTmTYSL00fmUHuQKj+lYVsk=;
        b=YXji8LUwU0Lb1n18uezepy0X8CASFaTzads6yj7aaG41vofMhFLqa7Be0Ox9JAWe1M
         w2S5rWn+2wjQ8WXVLEsLOi3HSdpeAmP1CU7O2/oT2QyoxD5pXR7FfSaS+eDzYUMiSyxU
         bSjEmrevpidbsP3BzMOFr5bGjKQSZHSBWwT9fgeTHhH3nMP6T6yd9VM8021wu4zoEOt4
         7YjcFEhOThrhIFgVoB8JJmbFwFlzifX/J8wSXt0mRLehC6SyorHu6a4gHsB5QrifOspU
         n/dUG4olkKsycICIGjh49rnz0Lyk40KskiCzLflfNOmItvfKLx+ieDU8DCAT9g2Y6MSW
         x5/A==
X-Forwarded-Encrypted: i=1; AKwUvBywzAV/+CkgJfOB3MfrsMuJxpJ0+Y1P/6oIvvf20s49sdleH71RCi6DuIMq9cN0K7YQjSuj4i2ImUmb2Sc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJewKCtLYC6NXeCwSihrCe3qfgAJoMuNeu2ADMgQajyXAYZ3ENm
	0Dh0QFckowkN/A44znQ3kOnI369aKwrtU9XAvRf3Jy6TLZXqMSyzUms74w04CuihqIU=
X-Gm-Gg: AYBFou0nu2F/+tRJetYORpgl4dtXAN8VTBx9zAlLtWJRcfM9QHQSNBJWuJLLGaIm2O4
	61FR89+6nlQBJvg3EibCvvO8Bsw53lshzzYukzpqoi8xDQnppTzBpqCKf7nZUdHAmEBmiso4jfi
	zIXc0HXn3OUjXXyI3EEtI0kStrkJBjk53JIk9QuY8JESh7qo8OtVqkStJKwLBxo0du+5UdMcOwm
	tEndqZ39TYnSsbk7eTarFZhyzaOMtCjLWhkP6BupsEMCLhSwxlinBTHfHLspG2ziQkNvAEecyte
	rTaB58/WSdTsIRKJnvyZEGUWRllTFISdNnUbhOjvlcxSzoGQpi3wzU01kGBZwV64+DPqLuMfOo1
	9CyH3BHjBN+6HICOH3kZA9Ho5mMfi4Q3sfXmTCYZn/wsppksM3hJ+KR/6tMIwcDCq5g1fRDwNPc
	KLWliM5b8yLhB8DOQWUSyTgEjTVGKSXL7lIpHua/5zUfC1S8PyB0jDk4Mz2Kjr/ayJfLwdlltho
	iShBDtxzsdYLm8tdNmWzMQemUYPj1jiSdBGk0ze6dSmI1yOaxtBeOY6AWeUVUkZkOnWcVoQ
X-Received: by 2002:a05:6000:2504:b0:489:bc38:9438 with SMTP id ffacd0b85a97d-48e26494161mr9445159f8f.29.1792658309636;
        Thu, 22 Oct 2026 01:38:29 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e72sm10155819f8f.26.2026.10.22.01.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:38:29 -0700 (PDT)
Message-ID: <2f3e24cf-a09a-4355-a342-5eba8573d78c@gmail.com>
Date: Thu, 22 Oct 2026 10:38:28 +0200
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
Subject: Re: [PATCH v2 3/5] mm: hugetlb: track CMA reservations by pool
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, david@kernel.org,
 osalvador@suse.de, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
 <29b35f7221c30f1dfa320a933f6095f37b612a37.1792651104.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <29b35f7221c30f1dfa320a933f6095f37b612a37.1792651104.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/26 9:31 AM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Introduce fixed default and PMD pool slots in preparation for PMD-sized
> HugeTLB CMA support. Continue accepting only the architecture's existing
> CMA page size and keep all gigantic sizes sharing the default pool.
> PMD-sized pool support will be added in a subsequent patch.
> 
> Select the pool for allocation, CMA-only checks and boot-time accounting.
> Release folios through the CMA area that owns their physical memory,
> including after demotion.
> 
> Record each pool's successfully reserved capacity and remove
> hugetlb_cma_validate_params(), since the per-pool CMA-only check handles
> missing or empty reservations.
> 
> Assisted-by: LLM
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
