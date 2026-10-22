Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659105;
	b=DqVxHUXDkUeg8HQbkio2W+BDMmVkV9hzjmOlp1ZQ+KAE05fm1XdrjbXyLzrRaQS7BHB5
	 pyCDXFNeNaVqFMx0dFBZW23QahXNPHPrIdJJpr9KYjJ2UgLBfAAtu78ERukPtdgXmETIa
	 umUTn7coB8LQoHw58WZ6cseDDTnl/0NteS0pHtlAnUAGz+rAlzcIU0M+SgHa0wckJZ1iO
	 Xe9JaF4BlIGhiUGzw019SQJyhtlZmyidROFDdK1MnTx5iy6iab0DNOU6ewXvhYM8aHhet
	 gO3IF5/NfD1TKkE6bvJIOKyzXkdth6a65sIwQSs1v39CJAIE3pU4OIN9YYY7a6J29Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qcPKKex8SUB7M7x/WtM3wT/+W+o+Q7epNmz/1RG6sOA=;
	b=PWyNUHXFtmCo9DgnFPWbPNNjtw1hBrPNQR+Jc/4C3NEw8ujBEnVGcgth0i4tlnS+Ss0a
	 LDhc9ys6tAjfGVCfLqyCxSTXAbFvtTUCNnlgc2bVlr5Y8HqisIYkO1acoJGA6XreqsWEw
	 /LkpCBs1wtvMYpq7t3jOj3xAocKU+WIhha1xwdUemnnz5iX65KnPv1YX5Cw988rh6AjqD
	 Hm5aqzZ5B/ntgNWuAwEL5S4RdWdO4ZxiJEqD6ofDheXWkBpwl/Rr6KNsvOvvkqzPgNLmx
	 d55S3d+vnkZxtOGIDNNCa0kR3zW4y5pEtWirGqiooKfprV5sH+BZpY5Po/FGkFGds8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CwvSxhhc;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9F3606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F9F3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CwvSxhhc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so3851335e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659104; x=1793263904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcPKKex8SUB7M7x/WtM3wT/+W+o+Q7epNmz/1RG6sOA=;
        b=CwvSxhhcFZpnUiqf44vMlY1WGiHhx178OdVAUCO/oRz5FKMsGnDikOmuSAjL6yUq7m
         E8oEjQbq343xCOIcAI23uKbTD3Ytv3kdVmExGb3KSL8NP4Kv88LE5l0Bmo/F/2QsjImQ
         DGU9o14l7RY/2B2aLPn3aDfSOveNt/KsGJ70RKJ/Z+iIcX9Qushkt76tEZWlAGWFFij2
         6txizyL5JDAhvRFDaVOTfHjOLLLRFq9Y4CjYuuESNnq7s9CsRNSsXWf0j3Ai9HKc2udo
         ml8u2yKwPzQW5Oawv2wWrw6BIoZhWC+6drRuJwXw0vvPhDnrTWYXT9nVUms84jCh7b6x
         tlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659104; x=1793263904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcPKKex8SUB7M7x/WtM3wT/+W+o+Q7epNmz/1RG6sOA=;
        b=YMpZBnGJ2i2fd6F0KjctxHeLO1xLNV8OK0aKT/RF8czMckshIPj3Clfa0AdEXT/ivZ
         ntbFROFIkj8QKELeOxW+tZ8eP9STPpyh3RJ31AtpFQVbAzjmIwEAl6Xge5iKjRhpg9kq
         seqWS4auTfHIlnV6HRRINN6ojybZj5bBoakmuG8LyA6XQ0neZan2kovjWs6b7USDnq5o
         2Mwhp5so0gIvQFfnupYKaLSnuWQf24R3fmpfga+CzOo+7JvCsgLK49MIBqLAN6o4AKCG
         geTUT4/zfOaoGerWz0r6n9GDiPqF7qLD7d0F8UL5grXqbTJm3RNnYOBn4OIaAR2o8/6p
         7/eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYRVmmVDK3+OQbFF5oIjYEpFKBYv1K+0yWE1LKYuEv0nv/eJx3XjCV6GaXf1w+j/QF5+rUPHcx7qRaQWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1v3Xr9SxeD5o0Qu3U2nkXit4TVeIZYg3hnAxKC8IzqMQHumb2
	lc/iVk+AefYx/FIwtEWc7+liH/TVfJ8mnnlZCZhMNXdRmdRogKlLXlz6
X-Gm-Gg: AYBFou2ccfcqFh8ZQWJfxktJKVq1UoX7A380BRvG7DiekxajTF/z71wAY6BO5DOr1TW
	DCPBoJO6iQbxzu7DK6IAuUoIon1OH3qS+QOyLKtR/E+XLgrsd/pT5gOLRi2UAZRiG6KGZmOfQ5H
	l1K/LYJeuDLICRT6ajKyIC9qay6PU0v8MqT15+xKwevi5uuvUAYti9r4bH0Vvuor6Ckmq2LeLFj
	fAUbwj0e8iWZdgXuY0IhXTTrgkuEGq+BJgDTJsRp6BGQ984kWINbCjcC0hoC9ehliydf64YC6jN
	UkQ5A9J1/1mYdEru74l3WHzA+edQR5RUUWK28pAWPFo5MAzHW0UA0sqUglQhhvn2IGGkgX1oswr
	5tX/wtKb+pz9sYgH1JsrPEjQiK3MiQBqH7z3vNPVRoH+T5AzENqGZpsQbFDfxWb1HFopW668pI2
	Saiv3PVMSC4RSVIvF6mG/z2dZrDN+aHtjVwlsyC/UyUwgjHj/dDLXsx31sIfKiXbXdNulXgI+2D
	QU950qQsod0M6DfU+Og2H1r73iRqRYH5LcbMIlFmEjsiwt6zVY=
X-Received: by 2002:a05:600c:1c1f:b0:4a2:b73:d15c with SMTP id 5b1f17b1804b1-4a20b73d260mr7139465e9.3.1792659103854;
        Thu, 22 Oct 2026 01:51:43 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm101767255e9.3.2026.10.22.01.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:51:43 -0700 (PDT)
Message-ID: <5b17b4ae-0db0-4998-bbfa-51bbeefeb551@gmail.com>
Date: Thu, 22 Oct 2026 10:51:42 +0200
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
Subject: Re: [PATCH v2 4/5] mm: hugetlb: avoid recursive CMA allocation during
 migration
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, david@kernel.org,
 osalvador@suse.de, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
 <35120f1e65b135ebc7885a85bb39baab90882820.1792651104.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <35120f1e65b135ebc7885a85bb39baab90882820.1792651104.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/26 9:31 AM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Contiguous allocation can migrate allocated HugeTLB folios or replace free
> HugeTLB folios while holding a CMA allocation mutex. Allocating a
> replacement through CMA would recurse into that allocation path once
> non-gigantic HugeTLB pages can use CMA.
> 
> Pass allow_cma through the migration and fresh allocation helpers, and
> disable it for MR_CONTIG_RANGE and free folio replacement. Move the CMA
> attempt into the common allocation path, retaining the gigantic size
> restriction. Honor hugetlb_cma_only even when allow_cma is false.
> 
> The existing gigantic migration restriction is unchanged.
> 
> Assisted-by: LLM
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
