Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872169;
	b=v/tu+oY+hOuU16K+lVYjA+3BYr/tsBxoU+8dcF8Kg5pTspCfo3lhYR28jWI9xAVrZuQY
	 Nzwzw4zh/7H+4a6YGqquUo7vwLDHrNdfCscV9OODhnuxJQWV1ovsiDvrQEKjwzEzpL0aF
	 l/jukhqQdtsmK7UsHGgHmCIW7zJbGxF9aAWRUImvpd//YMGaUxhcoRmsrhVPaPp1SVyN0
	 5EurBChKogkTV4Hxo1o533cpeqN/6kcTMHwP09Ssfoytj2Naf10bKEfJxIr6pulp7GPmn
	 YIwu5gxMuKLcE+70DyqusuxB73GM5PXyl/LF7RV/FjKcw2+KhjkJY4VVr2pAaqgfCcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=ELsHsZ+7ho94iGmxovheRTc8jM9OxoUR6+5StKzNHo8=;
	b=tzj4QTePrT1fyW8iyR5eGmW9Mk3HVu9rVNQAWZAOrvwwTMpmKE6LM/wtZzTQ97KGz1A8
	 PFWHUPKDC0scBdqB7kSC/Lo+uiQs18ZnydNeT32ooHn5/1w35/IcSZ9xpr2d9I9OKz7/K
	 9QvwNiNv8BVkoATP4JqcvQuX3epxzaYKiGvCwNOD+0la3+TXga4Miunhkp1LgSVu5fi/a
	 0GWT50Zqs9jmHD8tVk/bFOG1dIS9AP2VX/qcWdmq2AnoLgfbaC2YsJMS7A8paQ92XBRdU
	 o50Z2WC0U016gzgrWxBK02ur+VvOZas7pM1hwtB+ADNT02hr0c+A1o7UTQqSsMLcMew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=a3a7xmLh;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A219606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A219606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=a3a7xmLh
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-949664ee41cso279057585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794872168; x=1795476968; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ELsHsZ+7ho94iGmxovheRTc8jM9OxoUR6+5StKzNHo8=;
        b=a3a7xmLhkllba4s+1Za4XuQfCXJ03Lk8ocSI+XrAD3u3ZTI3Xlzf+ik6t8CvSEHPlI
         S/MsHC6OC7NziCmOufKK26vsPmCR/9Ulp9yxnTYusarZMmHNoLmJFSs/o9X0xH5xINnm
         KvcYLl0UhiF2gEyYWzurmbtI4VoWzaxcl7hu665VFjpMkRcGXnfUYnVrszOq1TVf66uU
         wuCcrj6Hw4ay/SbrHlFL27kqdxo3G5S3kZo0SBmdBX9rG81P8xblBaVYT7MB5IR76Ql7
         9/a/2Algv2We0VQZcHAOmDrz8tD5k1Fh/UxlRKzDgZFN81IgAJrZ9erQgrT6gzmgeBAg
         UCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794872168; x=1795476968;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELsHsZ+7ho94iGmxovheRTc8jM9OxoUR6+5StKzNHo8=;
        b=H+6FYTtPJd9Evw+UpgRCblBQ8cbR4nzlNEfs0qdFlDcdp6nJMg5xn/P4ngHECGPIpl
         eSyQHUQZ2ArnwIyQUdMc59Kmagm4oqi71Hk9h+epNny8GUdsIq5N55LiQRuv4zTDIGY1
         JQ4v/IpTG/8LJ+BBVRZNpvIRQSFCSlEUJxL3fC7RVjWJFbW1QUnxWSYfKo6Ytg+i9Ymd
         73na0Jf1+Y2cEbuiILbwCqzz9BBwRejxwM5M4GVdEYy1QcZQbaYEVA5n4Lyxm4L1MZN+
         6yHRrK7lJSQIlzeeEyELmfPTGCU9d5OdC3VmXerVSeuRx/aMxSgg8wYM/0LphDKzVrLP
         svYQ==
X-Forwarded-Encrypted: i=1; AL+hErEKmQ/3a80QcLi79wq/5rrmPJxBLroSgsVteS/0LPguAs3j86A7Q0/42EhAT1TGGtnhZNEwp7yGnG0OFd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q2SMBlrVCz76Y7mAnYySMg52G7bGbh6zpM052nSrrz3bSXwxS
	oHFmeoe4zxbkBSPj6vlUZMHMhhgBqpmNjFXAVTcCX7ZANviUEf01L+MoNrG2L18dKOg=
X-Gm-Gg: AYBFou2/7bJ6tkT31Zkr3AbzZ9IR28X9JUgFJoq458bL2hL6u1H63iCZNvSGus8TNUP
	dSYEYDe/4Wo9fyIsQJEZywkxKtUcCw5E62eVAnFWHP8HLwsQkbnhzGN3GBhKoZJRqlrgqOYlQuI
	9UpueN20kdxQ0ufcWyO1VqBkv04Qn2Q7Ma0owxr9Ani5lB5/A+JMUdC28IWZ7UAIDM/SuEeZlbD
	W5eJKN8GLPTTiTmBVPOfnCsKz0XuLZgpvCFAxQQFmpXcB+hOQC96H2OmvvZTpNu/5GRLnATJZN7
	hbP5QykbApp9HhlaXqJOgtdJUYxVtUVHHRYpxCtjrX/a+W+NGYlQwqrlSiq3e4WGn+TvUrbRAjq
	Vl/5vq1e7pVlLqhQ+6HeckhrtSqS/VIjd+AT+rVH0VmmU7XWvX+G5hYbhVDuxhpQ1JFLIGIDYtj
	T++X0OqGuK8qnJ/b20pfei52i880AzDET4C36f0tAyjBx6/yAxgpZnghfzmIDZlpSu2SrwzgPxu
	iIDdFL3ka1TYjhU2sFHIvu+H6CTIC3gh1/jn/uP3HiVZIxu9nDhU0SyAhZIgJ9wQ0/y/JqYJGY4
	1tsDTrTOO+B9CODiMXKfuECH8zUfR+eEPvcexxFQuXVc4hgN/vX6NRiprzskhQCctDlubXg8iJX
	IdSPx4ws=
X-Received: by 2002:a05:620a:2616:b0:93e:c6ff:b787 with SMTP id af79cd13be357-9494baf6061mr1926781585a.13.1794872168008;
        Mon, 16 Nov 2026 15:36:08 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c439ea1sm956840385a.0.2026.11.16.15.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:36:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] mm/page_alloc: drop unused gfp_mask from
 zone_watermark_fast()
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
In-Reply-To: <20261113235238.3595412-2-joshua.hahnjy@gmail.com>
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
 <20261113235238.3595412-2-joshua.hahnjy@gmail.com>
Date: Mon, 16 Nov 2026 18:36:06 -0500
Message-Id: <179487216685.482102.5643322867540998114.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 15:52 -0800, Joshua Hahn wrote:
> zone_watermark_fast() has not used its gfp_mask argument since commit
> 2973d8229b78 ("mm: discard __GFP_ATOMIC") switched the watermark boost
> check from __GFP_ATOMIC to ALLOC_MIN_RESERVE.
> 
> Remove the argument, no functional changes intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

