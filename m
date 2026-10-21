Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562374;
	b=Y3lBgajiMGFKmvCWheE4k+vmDR9raq/jl9ql0pX5gcTqz5mVnxdbvxAIbRjpW7cxic41
	 a5Z5X2qC+c88Usm5Nqf3o8r0mk2/XgEz96XpdKhIiJ+1eXb7Ct09R7+ShsnDFljiUBzEf
	 b1jtRtJdArGls+6zgsXNfl+rUrMnFa1JIktVZASkvlelLY110UUJQJMiJmHKlaH6hX+wv
	 ksnF8A/T84N1whNsJv6LeFQNf6tqaRLhd+5/EMhfUMYClirLeU0VF9koBsKicWKzS1S0k
	 tjxVzOQ+EPx30+T4sX/dNBA5kzm9geh/ebR8rfw+JCg/zqUCHh9AR4THMr0ae98iIDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7wvxYM7tnszHbpN8YPIatF2rX8H2hfZfH08DLyoi0hs=;
	b=RdHg0V8tsnc3sARqzyrNv1wwRaOWwEy2rizLJIqnihS3UAh3vxX9QQf/EymuP+wFPswB
	 JQGJ3DnAJUfSsndf6+EokVE2FUy7l/R5qge66Bv/ZTIlC5m8VaAT396W18qSD1hrgtMcG
	 PSjPuTcz8hIt8W9p54DWzauDKVpTjdr2qtKs0v+oklIVj3iwVPS2AvRMYDoLhMlnAVzPX
	 oKClh994X+L5lebekExyE0mhx+baz/+QjGZ7yyDclYTcYZD5DAPY7xn3tU/ZudNdzE0hR
	 8bqb7z2xNQ/0jahCCbsnhjLqjSER3VFvZ6lYIXsQ6D0/YAs6biThaBmsenktafHRX2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FC0606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FC0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48bbb06e746so118456f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562372; x=1793167172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7wvxYM7tnszHbpN8YPIatF2rX8H2hfZfH08DLyoi0hs=;
        b=mrLOs0Rpv9fxgu2Jd7PX8MJDia5wKQtpIQdDOF2qFbADuLm36VGWwWE0HDxIh9JRig
         w32Epcbwxa+m56SqCIKKjSl3/kB+LEXsLOLUONXC9szsW8tBGOeXNEZcoKcYpoeSzDhG
         1tAkPF0DhGm2Vip3PdkectSRzedcDY90XKAZOVqjhcRGvmo2BdGcLyUfoCL6OA97eE+I
         55kwVh0usiWzUec3VsTCCBFlvI0bwsiDMSLtPjbuyo3rOn9dBUIxC7n1HWh2r0SStKVH
         lYvuJbIGwYPY9pkor9fYMzY80u9PDl/ZdEVnfpK3xbHVpHn6YJXzBPjsy+8i6Tac9MXF
         kYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562372; x=1793167172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7wvxYM7tnszHbpN8YPIatF2rX8H2hfZfH08DLyoi0hs=;
        b=Z820iOEJwzUEQMdv5IDXdPyO9G3VOii72v7CZWAA3b83ZTJKVQaEqjcp7TWofUzzBn
         Nprc/0CKY7ST6JknwJPo7B0rebnJ6ilX92KkpQEKRszxBWCAbtxGwSaqCZo2kTB1/Jx0
         42LJ9WEUfDAPNKf1vb15Iy7/CA4BnYcBYmqfjWtPCljJMzL/t6O/9PUp7hVNI6W5+V/o
         nM/LY4XQo7F/6Zj4OWkM7wAFYwViKSPLGeWabdI+WrgFoUQWbejN4vVSSXgG330SLasM
         At8v1IoAYBBMWnzztaQWehjwz19iFSbltEZqJVVz+vCA8PUEg7t1EnjolUNXeIOeen2V
         9NOw==
X-Forwarded-Encrypted: i=1; AKwUvBzKFpixwVUgkgvIIn8OC/thxBrT6athIqm6GOFgqDuXReJqScUyHc6MwIumdMjiiER8DuWgt0U3m94s2Bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6sB8EPBcM2grscr1hqe2zTS46c90PhJsJP/qv4De0XLA6wsTo
	ctTZUW4AkeGDYB4UmZ1pz3Cfx0TGdIAMdsxZQFd1nW69mAtVji1Scvit
X-Gm-Gg: AYBFou2rLcVqJAig8X5c7/Fn423kIuRIZwRetpR8XlUe0asYsdiyADB3JgOn3SC5VhM
	uZ1gQzC1e0qa2VhnIlaJMd/x6HeC9CIyAj4SyAbzojdSue5LrWpG3Ee9Ut/3hXcR/c7ReUjXOl+
	MGO4ry1IRclIsqnagDnawMA1TH/SltbtcAWKoT77sztLByoBYqCBJlk6IlA13o1Rpi75rQukMl4
	o84zxpyjpCWL+BbCS8w6jTArWtxu+33k7DQMrESmVAFXscNUoNu9P+Nx2sgN+AX3X9r5JyUCXjZ
	l/fwJ0ctqj3uL3qEy5jL4JevlsOcr0LivdoaT6WdWJd+VSaDArdV+Lhiwc/qErKlvMd9bfk2hd+
	U5DeEKAAfod20HsH1rCnd0DumeyaMTRoGD/Hi/CbmkafBKO/a8t8k5YFpSZUFy2nL0HviaSN6Lp
	HJ7QJma5J10PJ4O+LSN38FBGNIU/q5/ad1Mmo2mN7hVwlXUpdGm4raoiRnGWGNx0/Jlrb7JZQ6b
	k0/BebbOYCWHB5hAFPXdebR9yWcD6u1KPsd20B9aV3iivtwt7BOYE8o94SJKaracruHekTPFg==
X-Received: by 2002:a05:600c:c8c:b0:4a1:e489:f8a1 with SMTP id 5b1f17b1804b1-4a1fd89d90cmr15704905e9.2.1792562372261;
        Tue, 20 Oct 2026 22:59:32 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm134642305e9.13.2026.10.20.22.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:59:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:59:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: use scnprintf for fixed-size text buffers
Message-ID: <athUwPFnbEJ0p-0s@stanley.mountain>
References: <tencent_FFC8FA1142CEF600BDEBE1EDF4EC27C39005@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_FFC8FA1142CEF600BDEBE1EDF4EC27C39005@qq.com>

On Wed, Oct 21, 2026 at 11:22:08AM +0800, LiuJunyuan wrote:
> Replace sprintf() with scnprintf() when formatting the framebuffer
> description strings into fixed-size buffers.

In commits like this, I want some analysis of if this change matters
or not.  I would still support a change like this even if it didn't
fix a bug but the commit message needs to say if it's a cleanup or
a fix.

regards,
dan carpenter

