Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551281;
	b=3kiB09ObT0TvOW9vNaSNtALmowqMoPkVBaZ3XHdM0gp6N1kEogB/SJeyZhCesD6QbrHD
	 Qz0Tpk2EDS58OjE1CUzUeF5iGhcD/Vh2G70rF7PBULuoNYBx9HOM9NEHlRpHoQuaOQ6mj
	 a7c3RTjzQadw1LY3+0y7jBK7CBIULYlgQ5M3Rk76wgG6EOM6l9ucbMxy0Y+SRkNLMmzMl
	 nhbYKnNIe8xECfUiTz4IzL5JRD0RMmUWfrcHCNW/Fqu3RixqUrhaNB8CrR6K30oqQnYSD
	 xvI+tm5JLMoYxXybBRMkrUbqXv+wU/+TwtbYJ10LTyDCoiUJEi/JDbL19XTHSBD7MyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=dSA8sP/l7jXaX7+Oajvaq7NlGy6nqeA0l/fafopK+Hk=;
	b=xcH57REZovffxlLS6n/9XKP6SMVUXaPpGn1M0Y6qRNCTtbgJRgYYqmAMpnpBZ63olJ5K
	 KFs+sUVZaw65qy4OdBBbWpY076tvAsJFHllyfWgrM0rBYp1T1jM+Gxf4+L0JMbh8b1qZ7
	 MbXvH2z8HHzamXOleWQ/0q9HO3Xb1hyVJlfDJUy5rUac3mPbpVSi8GflABDN4kMJBTi5e
	 k5qt665RkfYjBu6u1DLRSVjwDILH3VDbCFiVjRDgSmwBOMr4Vqwfxt74CRh6WbWxU8Xzv
	 wNCPXWizxTozMZyGPbAZoPgEAc719Tb8rGGko8+1yu1TjzVi0cMfbLrGi1WPs7sJiMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TPB7P4wT;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E39606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E39606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TPB7P4wT
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5367cc15121so4189221cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792551280; x=1793156080; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dSA8sP/l7jXaX7+Oajvaq7NlGy6nqeA0l/fafopK+Hk=;
        b=TPB7P4wT3ZpwzDc0H04y1xO6RW40hKiUdingtfVzBENRbJUby8lnyQDabNyMR9ryZb
         L6ryR7ZIQsu9H+R3Vi5l0CGRbA4/5DA0YJ7uLGiig0guGyBmFgIFx/kc1bje644633/H
         GioqQ5BmGmcy33d0lUUfqjyR5Opgnl7gQQRSOJaz3HA02O9hD8oLsE9zTtQAYgNnnfJg
         UkrKGKeR/Nwh+Kvr7jeACX6I9OoprwZ88EDhKPF3VZxiPIadPxqRkzbuaZz2zb+GvEBE
         RqCPDkjelW3nmag27k7NIfFh6E7B0+5WYqfNQknjejpqzqrBvmceLFo3n+8fvN1x4bLP
         v20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551280; x=1793156080;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSA8sP/l7jXaX7+Oajvaq7NlGy6nqeA0l/fafopK+Hk=;
        b=1siA5zT/i7oYmoGcs8AzlOE06TKx/eiUHqOKACmzlHfLLFfPjjzp1R9DnHtQGc6fMB
         tQ6mtOUbq/HGCruSdmkG6uyl7OZBiCQ90gXIQ9RJg0KGcmTi2UOer/loSadF6uan0MhN
         TV1QJ/hmqtbf04Q201XV5WNgvI0wUGFKC5bBcSRbZkh9uo3sPlthhBwisIvh1jCJ+bKb
         YTckhgGo/FFblKOWxArwAwjGXMrarVqs+4c3cOKJ5zoCN+/PMgnxI/McexvqR3ce6tcS
         VJNTF07zyqdMK0bwg9ELlST70lQa4NnooFoWF3Z7VrYKV+/mPyFvC+9eci4LlH6jviWP
         eZLw==
X-Forwarded-Encrypted: i=1; AKwUvBywepdQ4jqAD7TnNB32ILCM024ZHAaMtyaOD17N9nvLir41m9iHbpmO9G2kHytVXEQoBSSsbm6khzBr7H8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDUZiXPlR87Jp4kYATzLopThTacu/PjIjaMc+NB33ujgFx7lYi
	webGVQbYA0E/SrwgPjkpCSoU8ifaWQ+joEyab81IcAWWRlSn6ieJvizcF4r6GfycD9w=
X-Gm-Gg: AYBFou196mBFPxmXr1u4v984lsmgvqKSaFcb+BIUyig5MBx4iGdx+LH9CiaF1xOEbLq
	hxGn/t8V6tgL4PVJtfKkxb0LlW4sLaqX6a4D1u4u/RrSAPis1GZY83ZK6wuuFOnzLv42najp8oW
	7nmDnmrgM7LDWdJn2NuD82sH4mjgyZMaXxHDOfO+tQXptX5scbKmw2c506CBINy59KyKiUGXC6S
	xkPHKrGleQfa/2RCKWLPeUoutNQ+ZckUMDUhZUpuclli5Ai7AvyAWAAjj1Smcs87yZZCnkvD4wB
	JnpuFtfDrHuyuh4V1lIqm6JBzlBZi05D6Fp8Wl4PaIPW8/prwUgBEMrewBmfKSMzPscoMM8CsjI
	3w6tBT3FF8mArPVgvkiinS/UbHRist8H9f+HvlNispJH9BayjDBCwzd+kAoOYA2zf1keuwrXJKB
	uMWdR7TzyK02HY69eWvuzdDEhQs8KEQgY/MU6wNczugnT5gGQRAts7HRCXeSp6OpUX2HzSvWGta
	GNCXkp3MnP1//U3FOdnaEARgQ0X32bF/KkOpUqXSTFbxOgnG9vrT1DMqDl7obyhkI+usXHGYGOE
	PuTAi3Ci/8/BMkbKQ+bf/7CHc04=
X-Received: by 2002:a05:622a:a15:b0:535:a5fb:645b with SMTP id d75a77b69052e-5369b8fb767mr11805941cf.70.1792551280390;
        Tue, 20 Oct 2026 19:54:40 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698b290c4sm9952991cf.12.2026.10.20.19.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:54:40 -0700 (PDT)
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
Subject: Re: [PATCH] selftests/mm: merge: reserve the far mremap() targets
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261021011929.89150-1-danishkhateeb03@gmail.com>
References: <20261021011929.89150-1-danishkhateeb03@gmail.com>
Date: Tue, 20 Oct 2026 22:54:36 -0400
Message-Id: <179255127693.1919196.16421147648649712106.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-20 20:19 -0500, Danish Khateeb wrote:
> The merge tests map their areas at fixed addresses within a 30-page
> PROT_NONE carveout. Several mremap() tests move an area 1000 or 2000
> pages away to separate it from the others, but those targets are outside
> the carveout, and MREMAP_FIXED unmaps whatever is mapped there.
> 
> Under virtme-ng, the shared libraries are packed right above the
> carveout and the dynamic linker starts about 4 MiB above it. The moves
> then replace part of its text with an anonymous mapping, and the test
> crashes in its next lazily bound call:
> 
>   merge[6980]: segfault at 7f7ebb3c1e60 ip 00007f7ebb3c1e60 sp 00007ffd35fbaec8 error 14
> 
> Two to four of the mremap() tests then fail with "Test terminated
> unexpectedly by signal 11", depending on the exact layout. On a host
> where libc is mapped at a 2 MiB aligned address, the targets happen to
> land above the dynamic linker and the tests pass.
> 
> Make the carveout large enough to contain the targets.
> 
> Fixes: 4e25f85b9f85 ("tools/testing/selftests: add mremap() unfaulted/faulted test cases")
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

A better improvement would be to tweak the tests so they don't use
magic numbers like (page_size * 1000) and it matches more statically
to what the mmap'd region size is.  Otherwise it'll get copy/pasted
again later.

(e.g. please don't just update the mmap, please update the tests as
well)

~Gregory

-- 
Gregory Price (Meta) <gourry@gourry.net>
