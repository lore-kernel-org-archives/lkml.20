Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907723;
	b=1lPJ2frYrukMhS1TkNepqhR/anO0PKdfHnzTVFuunMpevI0yx9ZCbfaZai7Zk0ydYuND
	 FDEhdRigY3NB2zxdYeX6gDmisbIYYBuzFP+CZx5REQjPrHDpI7KPfDkPRLDGGU5d2BhL5
	 4s8DLTtnRsfBgGKcUka/qfWwFsuQjWOXiX7EQW034IAeuconDhOdAegaHVcGeM1qzC/eK
	 Y8Lyhz024kxOiD3W/vN1DaGcc4mylOabM9sCBK0EBUmknGGAWnJ/OAutIhiNpcJbIn4uS
	 5P3tuM8YAd0lrDTPQHIt/0EQ8QBzZupDtpvsZD9z8owjaBtTk9siMkEvKuQZF10fB0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=QoGYMt/eqdLbvqjmNO1up+ep+6dHW804fLUV0KHhNO4=;
	b=MXcgX7kwxkn8wcKqArKnnNiOlcCqu9ibEJobD9/qdhwQ4yEG7JMDowJUoN5wggH5syWe
	 jy2FS3MwAiEr0cEUa3Nj37F/U2nKrBhG9nseCmOQOwz9TEzzLiwHM7tVuRIR1Zt0jdnrn
	 zJdIUlW3b868gfkT+Pcq2e8YjF8/CydvKYVTdWeLIezEVJPIcPR6SYBw9xJTKO9O8svAg
	 K5abPukzhpckAadrvgshe3p26YE5TaP/qcifHefvmMDuvW6eAi7n3qRTTC4Rq/6Xed/Sy
	 A+sqU2vRWQwUge/ldakr221oS3a6tlx0QLG7FfqkFO2C3ptFi2agCHHDHJUl4OTbE4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Cxh525RH;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3A5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Cxh525RH
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91f0ab17747so50880826d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794907722; x=1795512522; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QoGYMt/eqdLbvqjmNO1up+ep+6dHW804fLUV0KHhNO4=;
        b=Cxh525RHet7OMrwNAKaFFOlJVISfo5iYZ1WUjCTpMndfOP8E7yoBFT6KQBL2GMkZ2r
         9zdH7gAiJadYfYMU5zosPuQSTKqYVmi8yMvxvmFylsATObejcCjqhEto9DjQ1kdEiERK
         U1dRskiuivnz+drDoLAfUmsPyRjfXGfIIwFNATIjVTAea9hn1tzMQmUns30BxXWXBADS
         as7Z8uqE/TCIO7V0OpWln6j+KBctcMEifGL9JQZii+lXMBBu7SKIR5C39zNoli25FA3c
         T3nQVbLhR+dWxGxbdxXdRtm89r2d1+r18HwmlTqAOOmEi0sgLYEAGlrN7gUcToByrfHI
         ncOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907722; x=1795512522;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoGYMt/eqdLbvqjmNO1up+ep+6dHW804fLUV0KHhNO4=;
        b=KsRFDz/1EM5YK+s2YC8x3ZyNK8Iiv31NTRuv4DyjJv7mqrDgi2tQHpg7DhwnRPAZKF
         BUoTGJlv1PMthIrSS51zT93ELGPYsw0EvxGbq4JPYkmqP+6EyVPvH6TCSGBF+ExJLuID
         BBIyKAlv+Uc7DOH+B4BEXoMQNtw4Tf+eW5T7Q40TGbpUmXvy/C4FSOBAkh7FxbsYxZZM
         efl1atR7fiYY5OfcBY1lXRQy8IhWNEXn5+5brtiA5TEH7aHASeGP8EdkTcPD1Q/r4Gbr
         aOXgIDC5LoTJQdqLsciba1/18+ZW34tWq8PZei9CSLpMNupHhmPyHJZkaQsFhiwJ2jNp
         TUuw==
X-Forwarded-Encrypted: i=1; AL+hErGxNg/wSzRaDoQoYrN9Aob0kQ4NxMrxghsoAo89PC88WqFYarnAk+mkJQK4B8B77DEUT75su39+/+ipZp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UK4bTeeG7DW/CUsM/Ma4ZduhUy90qWj3p+2UHsImwBCAn+OvZ
	+4I8UNzV8LTHUxGdsOk+REyp31P/pB8k0LijqfFJnbuplqe+Ro/Bv/M9anyPFTwybQE=
X-Gm-Gg: AYBFou2Tp97m1NNK04eEO/CjoBneC1uTgSXbHNu/oUk1FDY1TgobdEcwhTLwnSsh7Cp
	d3DHBKf2G4xSTnO8Ii2eFeo7xmf2ILQpTg5xKg4mEWV40Ydnoh+9AtKYp5+MxjJAkJo7aOvCUoi
	JQBYEDndRbWQtSbgLIns/7pyrSVDMsx8pr/WPnfqFZpHEDdQOyTXpqsoL51WTOM8kZAtZm26fM9
	+EL5Bj1Fhf19FjI2iQO5Ms5ErFPDT77QqLXIIbqYki/mWvZE4ydCSeGPyM0Bth6JIyZaQ4QCoRw
	9ddwSHhryepQ9HRy2a8VfVCarCydJMMBVQv6iBZGR9EnVF+FkqyUhq0vwoz2WDuYxysCEOI0wWm
	yv7N0VfSRr4DD2G5sNUk5WcPltIhXsfKjyjcLMMYj0dOh+WEEykuS+czV/1rfBaZ6xNFqAjx9kc
	+vXRa91wex+jMETf3wVtLJGo72CjK73XELsSYzW2zknus4LLKHIn4sDVZ/Z6PyHyEmFhvvjly6w
	OIotCsvCap+rM3bC2EAeH4u0Xp+ZG7bcYtDg/lduD7CXty+yf/r2YVgQlJMPYp9oe1YV19sCKSX
	FOyEVssDvyNZiQTMNLQ+doryEJziOQmtZ/lfWnFFMooStIIBhf+8aXK3itMw3Daz5lL02V9XhAa
	gyufGW8M=
X-Received: by 2002:a05:620a:1a12:b0:947:a247:6afb with SMTP id af79cd13be357-9494bb96cd0mr2258109085a.13.1794907722161;
        Tue, 17 Nov 2026 01:28:42 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c439ea1sm1046418085a.0.2026.11.17.01.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:28:41 -0800 (PST)
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
Subject: Re: [PATCH v2 1/3] mm/page_alloc: drop unused gfp_mask from
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
In-Reply-To: <20261116232346.788145-2-joshua.hahnjy@gmail.com>
References: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
 <20261116232346.788145-2-joshua.hahnjy@gmail.com>
Date: Tue, 17 Nov 2026 04:28:40 -0500
Message-Id: <179490772096.482102.9464218168628829649.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 15:23 -0800, Joshua Hahn wrote:
> zone_watermark_fast() has not used its gfp_mask argument since commit
> 2973d8229b78 ("mm: discard __GFP_ATOMIC") switched the watermark boost
> check from __GFP_ATOMIC to ALLOC_MIN_RESERVE.
> 
> Remove the argument, no functional changes intended.
> 
> Reviewed-by: SJ Park <sj@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

