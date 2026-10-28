Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166945;
	b=mQlzivMo6ULCagMJ1KCIHLDcV2xnyyzYmFnHvVhk/Y2Mf7UOr/59GcUmNTgm/6UyvKnI
	 uRFVKSLJvXYzm9rB9F9cEphBssyZoBu5DyLmhTyh9WsTBuoJdpKrekaYLMj3TP6mZW526
	 2z0JsM8Vbladl1EeKfXqiVLT598hiTHHGpVuesNtcH2ibq9NTNfZCgqB4GLNRdMeBMq7d
	 gRU39kEMXKKUAiTKBZI63ph2afo4wccRg4Gc/ZedHlnHI8Kcf0nInbn8sKOwVWCowlQVN
	 83Z2186e8lfZ0SXKS3tqzlyZ8gclhpqJpTsallwr+kZdRuHUyEhLRg0DpAEKAPmmF8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=hLkqAi8ctPqSRIwXUevfGPv3vaKrwbjwbnl9pr4s97k=;
	b=J6LidCApKjNotcJb6FHtBPAfuLBDKVYNUdbfxe6OTvJTaDWA/ycgzewCJ9zhrelxX+md
	 wVnaYXY7pjFODeypOovtRHwlZdm2uVQKAWT/mf59oQnTr+4d+v3OYSXcSeXFmDsbG1vZT
	 Kazyrr96NQCjaMK5flgy4qndZ/K8DDs1t8vxUhykmQJon05dNpMwB015upRfQ2FSdX0Y1
	 5Fz5jAWl0erWTUteQst+Lb2Nt3484FyjKsnDyTREij4UXE10oMQOAS3eqkP9m8bqpx++p
	 r4TH+LRHQpUeELUVhXcZ4/crgWe9azONb80HuBsk32CZLGC09CH1MSg7mrCR6fH2qcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=S1bmZhe5;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A1606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF3A1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=S1bmZhe5
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9d7791b00so3719755ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793166944; x=1793771744; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hLkqAi8ctPqSRIwXUevfGPv3vaKrwbjwbnl9pr4s97k=;
        b=S1bmZhe5omygstKNn+fR4XNnXR8jlOAug6FHViW62htHZqlaaV3C+husILnE2vlUDF
         qUlYJF3FxNHUTl83dYgzukZI/bHzvwRlNtWH7gR8fWpMpq/83wx9L/j3lJilHpU9YOHo
         cfLpDdCxwOCvGatK4hqkL/OtX/o2+WygsNxRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166944; x=1793771744;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLkqAi8ctPqSRIwXUevfGPv3vaKrwbjwbnl9pr4s97k=;
        b=WmEN4dUhGDhn8VklthoIYcPoK3rPH4gGZoacwF1ikIefqWDBUYSFNLVcyuTSUZUTxE
         f3uZZO+SQ1V9HpIqTlpw8vn2ZB19fbHR+j4DEybQtlaNegG9ljfleM2HiO1bHxiAR8/S
         BH9d5Gm5k+W7ANx5raHVV2ixPLMwL0I9EfBfhDjs8b/cmZ1bjm5YHTV36TDANaWva7q2
         2+W4z+EzJnY2qfKYVNhMYKYHZFi+NxAEV7XWnd0RiBZFt1TRB8rPSDN5MdyQ2V+eZouI
         D1wMhCcLM93a1XFJaKqcXAH/33k4MTQW6Uj0XWN1gE+XxdR9lC4alFIiLR8t+SVodTVz
         Q52g==
X-Forwarded-Encrypted: i=1; AKwUvBzZKmsOl89RVwCw8dWtiIifGETJSXka57RGq46Shcxj6FsNbOT9F1IN79EqIs+oair/mCN2Ci6Bmc+4hY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUGpQNdIwpORhrJM7THxK7od0xL/rvJmMn0c/UA6pN63eBceeo
	8cSxO+OM9hq/7m2fqEYV/vtaUswM/LFKbZOyItUlbbKsvywKtbJBnYxJOeJ0YHDavXY=
X-Gm-Gg: AYBFou37avLu+qo8iy+PvY0otvezoMNgbWSiSCL0/nMjYdxkvVM4sbduiFmN6A4GWEN
	6LypF7XZ5fX/2l8tQcNxL4czuNHWZMPTBuGWMpTPipUVyxIF9Qia2RXGdzXDef5oafTy7wNg4NP
	K9Y0NLQ4+m9Lg+O9liSRUhbhlU6kBtaNHGmps3sG1+EL2ZKjYisY2gMfUoY//opWOWEhnYb4vu8
	kzrco0z8T2lnoZyocf3rlLBpTFmh3gkc/hehA8/X7Z+kUu393MFgX6A62aWmorzDaAz3m7g+mrQ
	HWzE5vJhJGAEQTLu2zBs7hDRzJowq7HuesHA3oISPyMEzqEQxBXKEmIl126psOw1R0iajaSiCFq
	Luf1XsveKrsNkGm/ArrqxDXIJN/FkiU2h3ON2b0e73hPBFo+I7qFFTRUYM2T3c6CyHsoHxr2fQO
	7LpJl+1dmkX9jftxjo+jPbneX5soE+0lzYtTe9HOu4rFMxiAGngxBUtnJNV3Ot9JEubprIQJPIT
	czIva18TErQE60cfaHasmC1gihEXAlkCGS9zqL9DTg0txKiEOXfRbbK5ud6WFcIQ18dN6IP+opN
	PnFj3vpaVcpPFvHHOOAAi1Yi1uTuOTvgTmTu+HdJ9NuKg4jzrZItQ4xJhMvPgkllzmYpPr3eYco
	e6NejAeNHWAKtp3QKodxWAtVXvl3UU1nSouvRrDTVKe06tZ9amvgZjImzgv7tQmLe/eQxRvsF
X-Received: by 2002:a17:90b:4c47:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ae5811b551mr920591a91.33.1793166944108;
        Tue, 27 Oct 2026 22:55:44 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9019a4sm1368356a91.1.2026.10.27.22.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:55:43 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:55:40 +0800
From: Chris Down <chris@chrisdown.name>
To: Jeff Xu <jeffxu@google.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] mseal sysmap: Add mseal_system_mappings= boot
 parameter
Message-ID: <auGOXLB1XZFWcTfX@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <5bd3c89d733ad22224f296dfa8900769de937de0.1793094611.git.chris@chrisdown.name>
 <auCxjbvY3qPv1sV6@gremlin>
 <auDTMb6WMFUpxeZy@chrisdown.name>
 <auDTptDQsB4xBcz7@gremlin>
 <18e2972cb8520c2e.3137322e32382e342e3434.279dd1.0000sendgmr@google.com>
 <auGNkhSHpBRd2U_5@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auGNkhSHpBRd2U_5@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Chris Down writes:
>- run_vmtests runs with -T expect_sealed when CONFIG_MSEAL_SYSTEM_MAPPINGS=y

Er, the other way around. I meant vm_runtests passes -T expect_sealed _unless_ 
CONFIG_MSEAL_SYSTEM_MAPPINGS=y.
