Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792954881;
	b=WodMPr+ZhB5U4OdMoIXa1aNhjV2w63lNlR3xKqISZwooUYAJOMFhqdsGiwZCwN2X+kYf
	 ZOcZAmTyJapF3+1ZiWUAVl0FlOm3Dw7ZqlkfMO2t8nh2ozSdz8RSdpuFanaMoC5rLPY26
	 BUrJ3o5oe7dKJvtkU9Usab4SKLnmCOK1kJ0CR3yPvQJmrMXKl5hhi0RluY4H3OzZ8tNvH
	 a0MJPJkQ71PFvmxU3bu2X1YI38hthj0+EzUwTbQ9UU4Yf8vBdhrB5Zb/rXQeQYhJZrqCH
	 86EsP+IwvMMvlLOfHbo8cqzC7J0T3CCnlk3O6Ccp4lftwM3RyY3CM84NTY/rftCIDiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792954881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=eep4GL9DCocomrU+bxRgX8heWYBDGizJAyovtrxi+A4=;
	b=TLe019ZFqQLztYlSWH+bmQWZ3fHBRRVt6R0TvcfzzqkcwzgXFmnT4lGEz6G8wJttnjcN
	 564G0iQ/T8kHpEcgVRgOJp/5NdTmvlFVci3oD+8OyV+S0niyHVU5XzmDyYEzlpSlQsADe
	 ImnFbZn1LKQAiyQldgHNCWSdH3NQDo/4S1FmlwlTDMJ9O/HxxhgdgEsnPVYON5+IpJyx2
	 lQA4M/Hf+GUuk2O5FAnbd8FAAHF2dHXg965dwKG5NRhg0GXa2v4jURH2JabZSmxNQcMRE
	 6LTnv4NWzOc9Tw5ag/G1Ekah/7DOq7iM1dRvs8j+tszMUcyrHnWjkFYQwawse0Rxc1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dgMd37vl;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA43B606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA43B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dgMd37vl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b060ec084so1382200f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792954879; x=1793559679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eep4GL9DCocomrU+bxRgX8heWYBDGizJAyovtrxi+A4=;
        b=dgMd37vlDpgRiIoYeaa8X5rQX7VWdgW3VUzIzDctagQ5lK23CkVWnctd50Zbyg2lNk
         KUjOU3cedefVLJU3ermhwNQlbmkvuJlFB10AYs2BDe6W4ngbANr3txO3gjaAW37Lf9h3
         yl6zlF2KgPsTeqFo9S7t4eWQdALhNFZDil85qXUhvsgrKvH1v6zMiCSUq3W6aksbgBiJ
         +sPbDrbE3q7+SibdYnjgF9B6yMPuerGvpyhChqrIWD3XxfeHSEPUQ99z+zTbYE+qBiGo
         Fia0jEdb96EH6x3+vPTVVdpfB5V7cJq7L8MnHuGswbBAORU5b3oInu0nPL2CX7KWc6a0
         VtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792954879; x=1793559679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eep4GL9DCocomrU+bxRgX8heWYBDGizJAyovtrxi+A4=;
        b=A9Q390hlF0jNjNdAboz3AvpjlJ4XbXyBN8rPQkaigfMQj0GC0AfPk35TMJKCi2pgWQ
         dy+Z2D/0NbSXkNoaYMkFrTVlkKKUQTHkQeI8OY9OLnVxyDM9rcWuXRpZgSv5JD8W9pWT
         eQGRwJPuUwUKoxRVeIZzM9E1YR3KmYoeeR4/k1zpaz6UREzOgl9foSuxCooUwIozHZ0/
         /WTWsIb/T6FMAuQQoJfTJCzoOItTR0DIAdWjLWNqQmDh1A3Qa4eVLpetExtBmVi+gLPp
         6fp1xPlk9tVmEjEX7U7rSZmz8hsOiccO9rut/H9KKY4StPVnMARjNyKt8uhZ87hk55xU
         AsYg==
X-Gm-Message-State: AFq9FYJCpzuV7623v80p/bUfdXGJ8MSd8JB4F+iegmX9QWz33E63o15I
	idyy+igrgGWC6+r0HJyqPdlFEWwUj/enjjSRwGSRNI6u1b6cKu+75v/b
X-Gm-Gg: AYBFou2/RGiy4iJGYWNNWX2LvdOdL473kRA3ms5QZN4fsrIPDPxTZTVvblRDfZx+7Rw
	zOrbxKCCZZ1SiHldpTOZ81hT6kr7HKYv4NLUtuz9qZ0HUh2z0aYQkPCVxpfqf/wb2UnCAE5kCGZ
	8Ki5wmzuZdSeiMLsLj7evFCRJ/1Rs/SPoJEYrhV5pVVfF8mDcp7X6rcjFICB/p+ypUpKcRIivx+
	XSo39Vo8AAw3/ZnA/PmNVizzf6Bp1B+ZxoOdFacIrpEuOCOjbLH8TziXJtx8HBbWhDFLBVwxYR+
	m8CSb5HGUURpwxWVirxuD2GjHLZaBqf+oSk7xa5AyoFyUYRFcMB+e1ntHAJbnoBYD/LygbC/yxb
	Xb2CaRDp0BG2jr7UC5fAmefKhJ0C4UmLh2wgyBoNdNJDQ3BrpAz+/bV9nPyZKy6Q6he1wM01zLU
	dseXpcL61qfo7XjPc2ck+EOvygIH7TwvDte3qcBW9ZMnGcDnIlckEJkVydirGCNbke/BlpudpIf
	eWeTkDQH2b2m4qCdtFT15YKy6shSStOdfyGANn3ULk4ah04YD8=
X-Received: by 2002:a05:6000:310e:b0:48e:4300:c6d8 with SMTP id ffacd0b85a97d-48e4300c7aamr8195528f8f.35.1792954878913;
        Sun, 25 Oct 2026 12:01:18 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm10026651f8f.13.2026.10.25.12.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 12:01:17 -0700 (PDT)
Message-ID: <533c4ef7-e008-4439-be40-1aa2a074dfd8@gmail.com>
Date: Sun, 25 Oct 2026 20:01:16 +0100
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
Subject: Re: [PATCH] fs/proc/task_mmu: fix missed VMAs when reading
 /proc/PID/maps and friends
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Suren Baghdasaryan <surenb@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
References: <20261025-per_vma_maps-v1-1-c4eec45b9387@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261025-per_vma_maps-v1-1-c4eec45b9387@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/26 11:43 AM, David Hildenbrand (Arm) wrote:
[snip]

> Fixes: 5631da56c9a8 ("fs/proc/task_mmu: read proc/pid/maps under per-vma lock")
> Fixes: ea3085dd7a4e ("fs/proc/task_mmu: read proc/pid/{smaps|numa_maps} under per-vma lock")
> Fixes: 0e985559d72a ("proc/task_mmu: read proc/pid/smaps_rollup under per-vma lock")

PROCMAP_QUERY does the same fresh lookup, shouldn't d9d1c2d81797
("fs/proc/task_mmu: execute PROCMAP_QUERY ioctl under per-vma locks") be
here as well? (commit tracked down by an LLM)

[snip]

> There is the issue with seqcount overflows that Lorenzo is tackling. It
> probably interacts here as well? Likely, but that's an independent issue
> to resolve.

the saved seq is reset on every m_start() and query, so a wrap would
need 2^31 write locks inside one read() or ioctl, I don't think it
matters in practice :)

I tested it on x86_64 in qemu with KASAN, lockdep and DEBUG_VM on top of
mm-unstable, the maps holes I hit there are gone. Also, the code LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
