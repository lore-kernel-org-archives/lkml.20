Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B331D390214
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369280; cv=none; b=lpEOc/0TWx1zn89ppa/xfd9NSp0wqzhh77s/GVvLNgIpuPtgBZscP5h4Y40tAN0ejetJg5GxEd+FHO+CmAbKzml/aF88VRkT3DgbWJfo+nNkhni9h6gV9z5JVb7mSk9A9R7Udn/F/Fz++RgQ6EcHYwDa+uhDeNX3SxX9pMuK0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369280; c=relaxed/simple;
	bh=wwUGcWCFuahBygmzbkfysBUMLQ+YC9HDc1ga3hpDpww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbErhXgl6YXA0vWOXLKbOZOS5qfWx5vbmgeRl2xZkElbG4qHK/tEvHz6yFfjYyrgsF48wpK23z/i+BV7B5bjaKun+G6/J3QfnROIopW/Ii6HJ0VZ5tJr7XnXKgSW29JDdLFjkH7hwBrsypKCb7XotIjVRbVpiibhwkmP2UfQQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=cylT00EK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="cylT00EK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so27883295e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1791369246; x=1791974046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I/KXhGwdziWuRf/43cGrmsybatU402LAkrsoiMqhVuw=;
        b=cylT00EK9DPYsGKd8owDDuH3UuIyk2Y2I9uAFQsrMPIiNm3NRnNVmFObaChyFH5lSI
         sNqp6OZIEAlbvX/M075P9zL9aPBKhfTJU6eIXppapQFh3qdToD6tHDQleqN1Aty30Dqt
         9NuN4ws2/bmSTsfXQJoYn3H726djCGe4rKQ5xhTGKy9k8Vgcrppwb1Mx6C2fLlPdWZy1
         /j1OUsM6A2e2dAXC5G0MWJT7TNmvUAr/ZA55AYdYGUUh78X5isSG+m8JfRQlJRMk9MN0
         o5ugtxkEbxQNhQQTMWPw0ollyxlwdCMLc1yXBK7kAq1s0bXLHVoq9S8FYQznrJjTgBvs
         WkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369246; x=1791974046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/KXhGwdziWuRf/43cGrmsybatU402LAkrsoiMqhVuw=;
        b=B/re2QHXQOiok9YG7Gf4eyprNb+JeEPDQrhYvd6gpspL9PSKsPV4F+gISJK59GnvuQ
         vb2S0dLoFn6oUc0vIeTQO1gM7ogTFGX10TZdyXfkxXIJdkRTOUqnl/nhNMItF334JmeP
         e+eVTRnofgT8VuK1C6vu7FTLM4tCWh1/Aarq3HpiG5LHDDLT7Ls+Q8SCdvjp/5Uenz1S
         +LP5hvXMGKC831RXN85NqY2I162EFvSdzKT5QVOFTEIuOCQK/8lII89LctjihkPhOp1w
         z1cER9azuoAdXzyeGgI0Z6ORhFPEXCBnVvF5pDqBgT81TxLtpRal7skvpAvWkYQ6JI/t
         qRGA==
X-Forwarded-Encrypted: i=1; AKwUvBzgFwEPyFlAUveYfzKENkJU/k8KfdVEndjCEVbSDyARQ1HWBq4Suy0c4w3oA6RWsubFbedULHYq/hzbBKU=@vger.kernel.org
X-Gm-Message-State: AFuF++mQXAzuoN5hTuut5OniAfGj6/ciLOUa6eeP0KHsQ1gF16GuW7mY
	zFPAQ+d6HRce3SMp5igo8cfoQaS7hxC2c/+hFdXXherhVwc61Ca52sGzKP4OZuaZNXs=
X-Gm-Gg: AYBFou3gvTHgNtFL4f2SXmx+F0b1c7Dvnd2S2knyvhCT+ccWrYCrdT0QVbqvKU/1Ind
	qlCw5RNADEIs0yHTdkWFS4RY7oBGIiPnCwC/I4oaTSXkw5JVZwrtr7xgyjk9EDDSdsePlIuSRCz
	Qo4AyZThonNickiJRm9MedGp4WjHEkkQ//F9oXV466shRG7IWmXv99v0w38L6XLtqliivBd0/Hr
	xTwi7W7i5GDsJFSUDKzk/D2dcwjZNC2hUAE1QqvmDyqOhNPVLimSwshNBThtQBjKE5suc6CTmZo
	6GLyTMYbNKO/yrJjwEKcqqr8bIpQAZmthZRdSrlVfLhA2S6CeIfSR/2pd+/1iRT+uJD0D0GdmkQ
	AFc0or2LZ4Y125y4UwQuRJ1/5SO+1En9Jfb4qCS8eSdrKuSuIMuOCjHYjeWeIUXrjSPiIuLJOhq
	wMO53xRq2Kl8AKQptTONODiyG/0jHeaP07tP6S5BkncXZf7jIO1J/l53QP4MM=
X-Received: by 2002:a05:600c:820f:b0:4a1:7367:5395 with SMTP id 5b1f17b1804b1-4a1802dc754mr27490115e9.2.1791369245576;
        Wed, 07 Oct 2026 03:34:05 -0700 (PDT)
Received: from localhost ([2a09:bac6:37a8:26d2::3de:3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53997sm204620105e9.12.2026.10.07.03.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:34:05 -0700 (PDT)
Date: Wed, 7 Oct 2026 11:34:04 +0100
From: Matt Fleming <mfleming@cloudflare.com>
To: Marco Elver <elver@google.com>, Caleb Kan <calebkan1106@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Caleb Kan <ckan@cloudflare.com>, kernel-team@cloudflare.com
Subject: Re: [PATCH RFC v2 00/11] stackdepot: reduce memory use for
 persistent stack records with a trie
Message-ID: <asYc-sRxG6kyu5yh@matt-Precision-5490>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>

On Tue, Sep 08, 2026 at 02:13:33PM +0100, Caleb Kan wrote:
> Hi,
> 
> This series reduces the memory used by persistent stack depot records by
> sharing common frame prefixes in a path-compressed trie.
> 
> Cloudflare runs KASAN on pre-production servers so allocation and free
> stack traces are available when diagnosing memory-safety bugs. On some of
> these servers, stack depot exhausted its pool budget even after we raised
> stack_depot_max_pools from 8,192 to 32,768. Once the depot is full, a new
> persistent trace returns no handle and a later KASAN report can lose the
> history needed to explain the bug.
> 
> With 4 KiB pages, 32,768 order-2 pools allow 512 MiB of stack storage.
> Doubling the limit again would allow 1 GiB, but it would not change the
> linear growth: the hash backend shares identical complete traces, while
> two traces that differ by one frame are still stored independently.
> 
> The trie is opt-in and disabled by default.

Hey Marco,

Do you have any more feedback on this series? Particularly the bug fix
in patch 1?

Thanks,
Matt
