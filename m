Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567420;
	b=Ci4+3wR8TNH3z/sCzuT51iqrS7sNKu4YqomthxFThraQfK9lafPeuCmQdLlnL8PIN+O6
	 OtPPoQsHpdhvOkmknvzoAWXDQ/zH6gWRr145AY5gCrnqIyplBRbCrhkduB6XSeT1KQM6T
	 iRjwemRk50ZYgpgTSCqpHI+usmZnlXpX53x/aizMfNsWUXhkmvbd4RJy5rZgPYLp6cx8Y
	 SUXL9Tx6p/crHzKcPo9LucuzP8veOx/0j4NxWaIsrr+h4T4JofZ+KVzTY1Cf1YjadAXz3
	 ON7IZryu5TxBn+txPsplQT33S0vrjB5znpovXcuuGWBGCC26Mw2tngg0gEuwIPPBuTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=h148AzK7ulcLWc0NU3jZpboHW5vO/KJ9aeMyUmTns1k=;
	b=iSxsUDJAtrjYqazWItTlOaId2G8odptCpFmmx+8WL2hLC/Hk32GpHlewDdcV4t1Q5S9l
	 N9+WsFoDoO9/ix38RdDFHGpGmFE8AZNU0lxE1/WQT7nRVYDDRdjy78ihvJ/trcn/EZ8Iu
	 iJ4g+4Y83bB6iYf+fmHbyj2tEFZfachEdM7+JfvWih3TteM3kbvVY+TIo5kQq4idmzQ/b
	 EPmIEJERUM51+C9ANyrrQQQkf64SxjwL6ta+P8KBdRND+iTnL79yWN3pHRdv0njbk37jF
	 S0xk2mXRq8+gDp8mSXEGSLHDaQP4WNfsw+CYXqsvp9gaJZpAWPJ8pIC/2LFNekxUM3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oSSMMszi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E53606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E53606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oSSMMszi
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc758830601so1290795a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:57:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567419; cv=none;
        d=google.com; s=arc-20260327;
        b=GfANee6Il896eyxhTDm1Z9AhhUcUwEc0/QJvRFV3Nu+GvxCJNUP60OlzAjbfYqSwcT
         tP5b+z0hsI3VPMtb88wxUVAmikrjd4CizBBHRwto4rmdWTRoPr2czXqimj4egCfa0KKL
         KgMT9dFf/yMU90GNMfwfAka/8oj8SAF6FhOOFpwYfC3B3Wx0MGxeNYSmAmgMMqSGe7RC
         TQ/ETu5x/M+2KuDyFwjDUxvxRqEmqydfJrID0dNA1dKdlxhBs8LpHaDpVOKcH+UanlVO
         MeqfiZyh29tq9IL/YbRQsAu2wjXLDk+e5q61tbaZrhx5ruYG14DhhKH5NG7U9NNTxRbM
         BMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h148AzK7ulcLWc0NU3jZpboHW5vO/KJ9aeMyUmTns1k=;
        fh=hTYSl3mjJqlcq0jSWyWPVYruADdbiKU/Ogt/VO+ho+I=;
        b=W4OI4wVqeYH0rfZU7zeYdAIr7gcPRo6PIHB3M/hQs2TY9UeTiMqiVMCMQGt5uPmily
         MWU50+ncJa7nQ4RThwqRXKvcXcyiYk4InyLcRu7hnoNUK84yUbKvakOqsq6X4fNFrbGm
         LmB0osGnfEreyqK/Ku1upUU9M+zfcGdS2KFnNcG+1roCsTfkv6gPvPc3wISOOPOyaNow
         O2uBTO8vWzAXGdP7cg+DCAAmTljDhkAe+udJdfwOfyMVGdaVuj486a9MP4G8z6OdVPdh
         gxGFJlLzGyZZUb6PYJFNmLB/gUkULCh5VKu7xoL5NIT7RsZD6KvY4uzAwavL3CgC239V
         Vukw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794567419; x=1795172219; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h148AzK7ulcLWc0NU3jZpboHW5vO/KJ9aeMyUmTns1k=;
        b=oSSMMsziL7w6nW47/r8iQSeinVJ38aAA1LMs3FVdDbSdFpg/klmLvVGMa2XNtc/L++
         qk+1oI4pOmoNAM2Sp+wJp6f1GzvqwIvaSPVHsRXkDEDmi0H/nyYKqQ5+xTUkwN/XJ1aB
         lhIBS8TnoviuNl3qZk6EyysgPOPl1pH4Wefyh1koiZ0i5FTHW1jyvr5iBVxcRqCHFW0N
         uN5FQLfq4Qc+wBBGzRMVFoydK7pIBrWo87Y3Ja9x0PV7XfOgqPtUwsSp/PkVZR1sU1cY
         a0wVy4gycR3P98dRB726mwhv3llAloTH5tKnfwCYXAgxzrNSd6x7O+FrYd1nB4eNJsYs
         Qgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567419; x=1795172219;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h148AzK7ulcLWc0NU3jZpboHW5vO/KJ9aeMyUmTns1k=;
        b=qJpjim4B4y+zyDalZSnAS4krdfTf4QATLmVdNjHe+Hr/alKcqMkfqvYJfYAPVY2wlP
         +j08k63OMKNe0+Ldk9uj0RlexlOAJKCV7WlQoDYNq+deOu1WMsYrbm6qOATjeWIH9vaM
         hyEhfCKntN5vLcL5tLxfFV+EqOw1IpQrKOfuDanA+dA7pPzFgkYPPmzZQazsA36qnABF
         OAizwLLStefXtuFxPXL3GSn0RxIdHt6XA8AhEsRDkjG3BcBMP8d2Ijt0nPWPrLc03VZq
         c+V9mLRT4BcmTbKsnfWrYU3Qca/9ceBVypzeD6rNp9jP9fUmryAINX9u0/aNcKgipW91
         r7lQ==
X-Forwarded-Encrypted: i=1; AL+hErFWo2ZZUbR7bwOpNIn84l6DXJrDUtPhuOLRdNNL+xwrQyg2v2qhEGZA2Vf0RgY/5lvoRDOW8HhvKZfP5wM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oUM5H/oZpppIlxzaYXTMSgCPDxhFNWQ+jxoqHSY9EunMYvWeP
	znCKUHyj3MIve8F7irCUHbIWABAvFWwSDFBMqSgkrsdB+71g/NdFVOXRfcPjsRye2pYtjTOGTJK
	tK6UGAVshXPW9wY4DsKjvDKoQo4RBXaLnXkTUkjmC
X-Gm-Gg: AYBFou2ZQtKN+EhrY/ExbeVlVEmddRs6U1ikx4gvhSi5IYtlzvcFutGNctr+OB300Az
	bWF05SVUhkC+Q0c+ceZlH3y1fVMd6eXzRRVCXS5FJEvHa85kObQwb1hEGt0e2pywxPnXckcmnoZ
	c7B6ninBtY5/W5XlegtBY0klDrfHDvi/ITP71ZVJesOJ3qfFEHJJF/sUUiKBfUW7Zw9mMb7S1Xr
	KeanHkvRsi3xJQQ33P4BEeUtBu5igeioGaSPHP4UEJNu4YJK8KbmCALGIJk1P8E6Ilx9aV+F4xt
	2uaHHsONXIko3GeuPR/t3vtvcCXmF8/YaVa3OKjhVDUl0PlcktSrq1o9pwfPmoPys24y8SgyKLw
	5vmNbNkGADduygQuFPfVD5SKmsZw3KMjOHERvbdhFFdK2UjVs4k6SW5MAJBLYoXoI/HNd
X-Received: by 2002:a05:701b:2810:b0:1af:2ba7:e44b with SMTP id
 a92af1059eb24-1b503068de7mr2114022c88.3.1794567418689; Fri, 13 Nov 2026
 02:56:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
From: Marco Elver <elver@google.com>
Date: Fri, 13 Nov 2026 11:56:20 +0100
X-Gm-Features: AclHuK8EymS8R4ke35k_Ts4zDwGVpBzqd0W1daXPPjdA8aiWj2M9LBxfbR3z3Fk
Message-ID: <CANpmjNP0cWB_670hYj7p+Dd=do1qEu4XHeW+c7sTv-MXi0UBTg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] mm/slab: Support selecting slab hardening features
 at boot
To: Chris Down <chris@chrisdown.name>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 09:51, Chris Down <chris@chrisdown.name> wrote:
>
> Slab hardening settings are currently all build time choices. This means
> that, unfortunately, hosts with different requirements end up needing
> separate kernel images. At Meta, for example, some hosts are built with
> these options and the rest of the fleet isn't, and that's one of the
> things that keeps those kernels apart.
>
> This series does two things:
>
> - SLAB_FREELIST_HARDENED and SLAB_FREELIST_RANDOM are cheap enough with
>   sheaves that it makes more sense to just enable them by default than
>   to make them switchable. With both on, system level benchmarks didn't
>   change measurably, only slowpath heavy microbenchmarks did [1].
>
> - SLAB_BUCKETS and KMALLOC_PARTITION_CACHES cost memory (Harry measured
>   about 1 MiB and 18 MiB respectively after boot on a 64 CPU VM [2]), so
>   they get slab_buckets= and kmalloc_partition= boot parameters, which
>   default to on when the option is built in.
>
> Whether those two should be folded into a single slab_hardening= is
> still open [3].

A coarse slab_hardening= option can easily be replaced by
documentation. While less knobs is better, an intransparent coarse
variant of slab_hardening= just makes the admin wonder "what does that
actually to, and do I want it?". They still have to go and look up
what it actually does, and at that point it doesn't add much value
(alternative suggestion below).

> > > light: "I'm willying to sacrifice _some_ memory and CPU for security"
> > > full: "I'm willying to sacrifice more overhead for security

Who will decide what is light and full? I think there just won't be
any consensus reached.

One thing that users may want is an "all off" option, similar to
mitigations=off, should they wish to get max performance back with a
single option. So you could consider slab_hardening=off. But at that
point it may be more consistent to drop slab_buckets= and
kmalloc_partition= in favor of arguments to slab_hardening=, such as
slab_hardening=nobuckets,partition. This would mirror mitigations=,
and should cater to the usecase of slab_hardening=off to get max
performance with a single option.

But I would not add options such as 'light', 'full'.

Thanks,
-- Marco
