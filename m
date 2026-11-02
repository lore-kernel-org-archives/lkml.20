Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793614000;
	b=lTQaT+2MJcnhqmrb8SszsWHpQHpp7U2wYJ3bg6un3capJcR9JNU2PfXDsXIeFQ2b1ecA
	 o0s68k4OaRbiK36QJFwZZY5xHIRBBlMqBNURB4LT3EoksZWQxuls7XEFNbRy5RnC1ti38
	 IZqHciQlCUF5e7KXzwzdF+4HbHfeBgmYLzxN6HVPw7P/ORa6zEqlZlKCrcORD4XeP/IVA
	 6QmlUtkgnrrHrWlQx7WFu2bZGsTIZYsu73HHr186/s/5+N/+4AwX/dXo92eT1c6ZrX2Dw
	 A6ctK8BrWO/Oxn0umPaK6MoBSaN9Uh7dJ29ujiN0dh4Yzv6RJ9jVO+60IVYLpx2JVcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QBXIF/5l1vaGNDGQQ6+NMzJS9yRLOCUVrsHNtBN4ZVc=;
	b=YohVVD14cqFRHFyPaBeHaC2aytC9esxdC80xWpZiIE4CdiTzm/4hBUDsYVD0V7C2Ie0x
	 PDs8SsqYLuw3eS2cCpieIpV0+FqoAaqxkby4tBDcHwwpmgujZKodN5AZ5nj15fvZaM7Hs
	 ztPStpUN0Q/BPVHEDiLLGusUBHHPiTCRVDdg0M1ThP6/ObB7FIJJC7YfyHsKZSeHFCo8l
	 oFX9x1WdJMomg8pUAX3NvziSn/lEq7clq57KiKC0AyUY1XPaEMjnwRqp86MUCiJYiPauh
	 1/AVnH30a7UzgabJIDTmokgRbACuMSODDRq9Zwd9ai/CNXxI2HTrRcb9fX68iu0+/zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGLqt68E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49143606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49143606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGLqt68E
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso3563521a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793613999; cv=none;
        d=google.com; s=arc-20260327;
        b=s2bdLURY0vnThDtKUJACrf12wa8+cCQOISXsgThB+moaqQFkBJT96BBn8UmGoQlRKh
         DDnW9acsYPjTnsuhOomdb97jwNIUPS+OjnfDreOZdggGP4uknw9fR9ZjAxYWVt2XLb2y
         xjqckJ9cU8EVNZPjQQFqJB7RC7ebw0jusVS6l2NC5tEJDXBNCqx+geiFhb5/1KV0h1Im
         nCWvua1+l0A/HJO0pNy9L/w+ECSFsJx2VMnU/rHeQczzR1eyYzEF1HuT9/TfSBHncV8K
         j6DVoujqnA4yFmjgoXnBBMOcRcvnAZIUKrWP2G9SwAwfVQlZqg93hT3vlGnjGZ46mO9L
         9EKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QBXIF/5l1vaGNDGQQ6+NMzJS9yRLOCUVrsHNtBN4ZVc=;
        fh=JU2xNOakeh5FxnHCtN2e8AeZhrd7Gk2eJl5WxPGSgmg=;
        b=TH8zBV0a7u0x5es2NLpsRsS3lS7bf9oMWf7cO6G+N8eu+VcyoYsx+0X5S6lUpg4W6B
         lIl1Fr4L/QdEKNYyUdCoVRtiDdKfv99JJGemPoiLN/Sh9SbwgDihJaqoSy5cKfIBIUeK
         Rp1p15OK5fyxlJRuMV1uULuLIo7haVO4JB/Pm6EtI5/F6h+ryXbJzXatNjxuLDI3PH6B
         Dd87j9++fdHuXlEk2bJJS/b5mWtQG4lfsO6UzH3Vl5y3smYvQH1XMXDSPX+73/rKDaWd
         C7LdTUyWX4VIKqNfL6Viu/XJ9Lm35t4DrMjD7zOArGKcZZnXq1/sl80JXxRYe+ThN/Go
         JPZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793613999; x=1794218799; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBXIF/5l1vaGNDGQQ6+NMzJS9yRLOCUVrsHNtBN4ZVc=;
        b=qGLqt68Ezd5XxBY32qGuo49t6Kn5kUBfInvYJRbnFjqY/mMsHL1M1K8zQveYHuWrjg
         LrWtI3le5PEGd3N1uVOdCWOiPi/jYWG1RaVJ0jTFYn4DsoEPtY6ysq3xG8tdHb5De35g
         7EnHjfpU2ixRlbog/uDNxArK2Eaz+mI4Dej6yKGtk7HJPCDal1dJJNCjIm9ZcfKQQWbZ
         yTVzoAmfUZj4o95e/XXp3jzlIaLHeELkg95l+J0F+afRAxVxAVtQCfm6pFhumLOuitfi
         +8UT9WKUFTbGeLy65XpViBgfRHvtLDE/kHod38SwBBH7Dr0wZs/nodQMd32N8Jm0VPTX
         Sorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613999; x=1794218799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QBXIF/5l1vaGNDGQQ6+NMzJS9yRLOCUVrsHNtBN4ZVc=;
        b=N41FAAu2M7NknvlUvAvtAefgEv93cdOgXUyb7Ng7c2aJtHlpzij110Cn3Zhftc95T2
         42RkGO+d0eqYNneE8AhmFKT0+zYrEb9PRGRp2gRY7e89phxREAm/x4tEEEP2yg4i0x/3
         ovMe5PDgloQkvwsJvlU+CQ0iEaCbNZ+yDPSenCp0XZAV7Ac1muVuDLdyW9A2iwxd+Pc+
         0KqeCRaDJVX9mxkTLgUa0byEI+1nX9Sex9DhgOUnDOx65Pq0byDLXq50HYm+1dPihNhm
         yt8KloePlmclKgKq460+hoJFZtdFT058XC4SmZP/k9qa9gnVQeJVGi2mHnHtBcG3I4J1
         X8lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS3/KjQs1rwMfo3Zss8bLmQvFsnu2kX+shFDZa8tsfhgB+3ym+amfFjOVQtbzv5fizE99hSKCyrbXkWdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P+W9MdUP3eikO0/fMFWc0InRNjtgOlOj3rVvqPOo6Yozgn6VY
	PjmCZFj/8tYG05S1Vmd9p5LbRkKJ0tOX35t0ZHFFx57m65phCGo/qo1qUWAILgiv1EYJ2BeFupU
	OH+1dF5sIL/dRtLjDbbFhOniJuyKDnqo=
X-Gm-Gg: AYBFou0LedgBn9TViYafQqNHRu9KotgxUbujQ33IM6gRVy66ZPqPLWiiNT2EpMjlMGA
	8rTA5aCnSr1tmHscLgd1n6kopsijxQBVlGIccqpEA2Gg/NyRXJSvfPqauIBg7URSY/EErPpwE7N
	9IG6gWV2pGdoPROD9rvLdtUI9T7dnKvMGIPzsYeBt4BgrNGcxsvM5nBGdaP8GgQS10CASyXpYhf
	FrYRAHcC/nTRNrlM8gdnj6kQ+uD1hIS73FIqmQBJ/Lnl9eGhYDyKDG0kjJhFozlB30vjJWMC7xG
	jNAex/SSW94D3Aoomo/hGxfn9CUzJq988pRxBP8r0SfG/NBPBO3flZm06NkdTEY+Q98LBJh9BJe
	yyD0Rtv1FYYc418ET/mbb3/FVV0ZaqxqQBgcqsrgjdGP/waBTiJwbWWLeSrhInj19+1fgWATAVz
	ueHa7dne36VHghn4KIIbKQwiPSbv83vyTi0PowM04eXid+QcBy
X-Received: by 2002:a05:6402:c507:10b0:6b2:20b:aed4 with SMTP id
 4fb4d7f45d1cf-6b4d5ee7bcdmr4705913a12.38.1793613998493; Mon, 02 Nov 2026
 02:06:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260922032146.321006-1-phucduc.bui@gmail.com> <20261031164551.3637340-1-wbg@kernel.org>
In-Reply-To: <20261031164551.3637340-1-wbg@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 2 Nov 2026 17:06:22 +0700
X-Gm-Features: AclHuK_QeTWYAXcbe3lhxstd6x109xp5zr3EHNsU6jFdL3oMSf7I-uBHHjZQCHY
Message-ID: <CAABR9nFh32hZdWm2nsytyo3MKFtgfPp2kZkSzxvZv9rLeaNu9g@mail.gmail.com>
Subject: Re: [PATCH] counter: ti-eqep: Fix runtime PM error handling in probe
To: William Breathitt Gray <wbg@kernel.org>
Cc: David Lechner <david@lechnology.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi William,

> This patch looks similar to another we're considering for ti-eqep.[^1]
> Perhaps you can provide a review or comment in that discussion thread so
> we can address this issue together.
>
> William Breathitt Gray
>
> [^1]: https://lore.kernel.org/all/20260529095834.2561-1-sozdayvek@gmail.com/

Thanks for pointing that out.
I'll drop this patch and follow up in that thread.

Besst regards,
Phuc
