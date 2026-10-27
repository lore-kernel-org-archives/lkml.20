Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109978;
	b=yBc9hHn9KI8833owqG2N2yTC1JrsYsJHxKEZk1FpfLhiJx3sTuxIaQe+7QK7xiA0YrUP
	 hCpJsG7yyC56yKkgpoFSHPgeJxsJhEbYY5j8BFSR6/1V13B34qUQIOy5GwSAzpYWooOse
	 Fyscu727UcfzsD23Ma7Z+C1oZLpXJQj/HRu2TD5k0UobAkSuPsrzUfcD2XtSmcFVIQAcj
	 AZ/to9Cdli7XPJHOk2g7OQ0PG5Km0aQB4iInmr38gmb0Jo7v8PBG/BbrrlNf6u6B2FI8P
	 Tmz1zkcko/JkVQYdkDQ/6gKsOLQfXWADMB9A+zZ2cX2RGGEDGMgOH0UColNqFSjRNpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=CcioC45MmLY3DkNK9gmi2R+KmuN+SF2m/a7+FcEpEKk=;
	b=SIka+aWNwifOLjb9U/faVHlz2+TiSOwRTemoIiN8AuQxfuDheg10gldsYQ6DjyRpC2o7
	 2mzLzIJifpQZw5xA5bG4Y5fTKvB2WLF1GhizzWkqkEEySh6e5O7TFPqKqzufQe3BYR11o
	 Ft8IUSJ8HSygb9Kca5KCyxFbk1J5SGmosRm2XOvmq9PHzTKo/WROG9thxIUeabqrMyNNK
	 DsBYixJbdU7SrrPCnmbywvbpno1Arc7h2qV2rXksvAG+Zv5lUVlASNAQ65GUTzOKoEHux
	 OIDDRNnievtRwGgQoiVCZETWLDUcn3Z6lmYzwRzpGX0wtK2MJdVldVy0XwTCKRY/GxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=WocpRbPS;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1129606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1129606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=WocpRbPS
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cc013095d4so1295475137.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793109977; x=1793714777; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CcioC45MmLY3DkNK9gmi2R+KmuN+SF2m/a7+FcEpEKk=;
        b=WocpRbPSqHP+BacSU/D7X3AgNcwBTyKCSmQa1WiDzaZeb/i/7127ANs4AQKkrhDpj8
         sre2xom8UwklJb0Fuuk+38Ac1aNbTkJEwpaMNjuw/lRn49lXI9yAJuDIvoBzbQXkq+69
         BDfcgpBufrlBxtepqsCgYCDXFgsZqNVIKQG2cofamkjfl1KVq9n6ZJaSrL7qbhwz+J4M
         gO/E3ecD6ph1V1pFV/pybEZvGUxvw8tQj5nBIFB9zsljg19A4tN4oPRpKDjrTwAJBRHl
         ARuZ7aYO0XD8h13N67wpXKHOa2Efgjnc9yytKyWBmunOKcWT1TbMIDAbh/AQZIUTthuA
         LCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109977; x=1793714777;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcioC45MmLY3DkNK9gmi2R+KmuN+SF2m/a7+FcEpEKk=;
        b=uZ5XbTuFI9kYrwBQQ0xfe7NpwiCRWCkbaFUrm5AFWjv9qXu2sezdd2A9nSJ7cHwUM2
         HrHc/ACmVwIjf7wGJCrXZuq5KM8BkaS9QCCoaBz5bdK7OMS3FV+BP8A0fEFtmELBoU54
         y/OYNNtyCV8mf7ojanff18PQRyYP/Tk1mEiXRzGxNJSTIdiRd7Eiadh2QyaImdVPt3tT
         PrPMzwBXVn6GEEyuSiZ3Nk1f5OfGL4qpDSrBOeaN/cbbtmV87226FNR3C/IHwFA26KRm
         rRQYx8UTBTeylB6iZChNYDXtNbW+C1fzGhKlzUbeEFWyb4H1HXjtiOgGZHpExb+W8DBL
         7y+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAlJwoGD79PeoXPfPhxZKVs77P3LzdH7fx+QTj4emENzQasCsoCV5Fg9a3YEGWxTphXPD+h52C2H0CNzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9tdIA97Tmx/3Ap433bbj42iITYbH9aLNyGXtvWcw3n57ugjPY
	TQqiqA1Y8Go2bGeh/2SF7l6EiAxlssexWE6IPkwzVvMBF/XgOBgKF2/fu/Wlu0i6tHg=
X-Gm-Gg: AYBFou1+PdgZopqUy2UJAuD45e7J3fr5nQxJrlrfVcN8zbvF1Ru3mkaotRa6A7ywQdz
	E+saybp5gjYzWXj630I34qPvgJxo/CgCuuCXSc9N7j+hbFcx9rh8GE4EIOdvcD/yaQJ9YscJQyI
	dFvS7eaqC//6xWjrWRhymx9txAns32P8QksLuSxGZ7+RLuucfQwt2sa9WxgCN/7IhlkILk30QQB
	XY0xWZv4Vi0B7P3WYC4h/V85aNYw7H3xsUyO81UGYsetfDj5d16QRjsZk1RSGBt+j55KWEAhYIW
	v32+h3LqEkSBNjzD3mafPNAM0vk27HEEQIWLyLjAN5xhs2oJsRi/UhN8W+KUMKXnAe46wMg2ZPr
	ZjgQFbjZZCoqzG3z4JLoSC0vu0lm1A3Q1FYz8epgWlqKunF6IzXVTC7G6Dyy5peqIqrbnz5Qrom
	EACA1O6LHmWgpMqPJxeiEifO9hPCq/mwqeKFzx4kStdR79R/Zub6+ihsIuNE8poODeHM/HdZpxo
	hRpJEZfhb3J/RoQRByZRgQ4H4/UyKzGfvps0vioVa/VUZ73XvqVefzXi0X7B7BHyT7GxliLmM0F
	9yL+BUALOjlMDgzyGqXE0MiIlvk=
X-Received: by 2002:a05:6102:14a3:b0:7cc:28a6:ee1c with SMTP id ada2fe7eead31-7ce5ca1e4bbmr3674778137.2.1793109976725;
        Tue, 27 Oct 2026 07:06:16 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bd2110sm103733996d6.13.2026.10.27.07.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:06:15 -0700 (PDT)
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
Subject: Re: [PATCH 4/6] mm/page_alloc: don't undo another isolation in
 alloc_contig_range
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, 
 kernel-team@meta.com, akpm@linux-foundation.org, vbabka@kernel.org, 
 surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
 hannes@cmpxchg.org, ziy@nvidia.com, linmiaohe@huawei.com, 
 nao.horiguchi@gmail.com, ljs@kernel.org, liam@infradead.org, 
 rppt@kernel.org, osalvador@suse.de, muchun.song@linux.dev, 
 iamjoonsoo.kim@lge.com, anshuman.khandual@arm.com, stable@vger.kernel.org
In-Reply-To: <a4fc92b5-7d99-49f4-94ac-89fdee699042@kernel.org>
References: <20261027042204.3741307-1-gourry@gourry.net>
 <20261027042204.3741307-5-gourry@gourry.net>
 <a4fc92b5-7d99-49f4-94ac-89fdee699042@kernel.org>
Date: Tue, 27 Oct 2026 10:06:14 -0400
Message-Id: <179310997463.2232644.3260379218896917308.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 14:37 +0100, David Hildenbrand (Arm) wrote:
> On 10/27/26 05:22, Gregory Price (Meta) wrote:
> 
> We have an existing AI fix for that as well already handled by Vlasta.
> 
> I think we'll have to establish some model of "ask David first before posting"
> because otherwise we just create duplicate work for everyone.
> 

Yeah, this is going to happen more.

I've been sitting in these patches for over a month while they soaked on
hardware getting performance tests.  

Maybe worth a private tree we can rebase on regularly for these kinds of
un-vetted/posted fixes to see what's coming?

-- 
~Gregory

