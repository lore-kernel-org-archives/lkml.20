Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EF041DDF2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233588; cv=none; b=MEvgwPFDicgE5ah0+b6dVQjG6dKuVyUQS5oLFkRX36BeEk/f1R+C0KDYvApb9q6rAEMR0QVuC/ShxOrfIP+oz+qavwZXWFYaAHkfiWjmexKIfkRviAHS7fsvnqdEyMmD0SELESV0uhnBT5S+2NNpAiO+qK1xYO0TxDWLM3cjNzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233588; c=relaxed/simple;
	bh=qF/GmJdDAJbhCt6NxR0IXt/ma6iHiqTNuALlBPxzgdg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k45ej0qxBFjVbzNgHBkUR1xjzF1uavDeu56DPlkLSqrA99NMdWErIfXuYRqx5HMqju8J1/F8RuuRFk9Ue23jnNSi8RbEYaIT5mS3s3u8Kc5yBQZ7J4DT4ISMNvu5zwnLRcErOZqPUEPuDZqsZRggUwuuAgEn7Kso4YN28OAPSJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+echMSk; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+echMSk"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so1327545f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790233579; x=1790838379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aNGRH9rZqGsSRMqbv+c8f/d7VbynsVVOoe5uGipRICI=;
        b=K+echMSkFK9Cg8+MpoQFFvLFuIprDqBh3s/DkKFIEoMv+9QAnLNnpHBI5HChGohXTa
         au7GsUflCH5v5gWxFNJ59F5JRjijqCWE1K9o865FJ3ElMJ+ZEDSLWU5S8jSfqM+dL661
         5NCvSMQuByDtKUdiqAX1W9H/LWH8pNH8WTPUfYAmhQQOC4RDM1zBq87fAdz1EPsMGGFQ
         2jxqle42qE/pe0SYoXA9mzURbzanIuaUTptKtL+EUAWCnSElVHidYyeS/Um9CcppRp45
         UgjX6rkchbqshxH+8M2UHCOZoyC9VvYPw/ZF5X4n9pIIzonesUnMAWyhBAv27r7ks1jy
         2kaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233579; x=1790838379;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNGRH9rZqGsSRMqbv+c8f/d7VbynsVVOoe5uGipRICI=;
        b=eJv6+tHoDOX0Q6ekCysIJWecjScENPSVC0dO/KiivKGeDHs4jUX7ZyFTBr0Sc3rXv2
         R0CeczHbO3aOpvnD1B3OZeqz0bs1dC7TsTYFreXQLuM3JwO7n9OB9T31OiuTrwI/kxhn
         NxrIyvifOm3BQS5TnQjw5E9GMxaDxBo6eSICR+HEcSqvjbefJ5QLHgUm3967KpUtyXqq
         bAF88hE6FaQJ42WdrNbqDMiAljhmPyZ5pFImZXFvvNckpMH5SGvWSnNZ0DWHZqBh9oxT
         3QZyCca1lV2MDnxAXj99THXsShS9z8PSoAVixCuKZq1lnEMNpwHJpdWysfuJGfAtYaGr
         0lZg==
X-Forwarded-Encrypted: i=1; AKwUvBxuQiPkAyOdC2qs/XUN9ChVoo/8xQehOWGvazr+UKGK4ccQR1fN9cA7EYr18LB99u9htN0yBC38JLTF74Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ngOQOgCpdRfRoHcP9m1FF2RAuNzF4r0211PpwVkZUJw9pySwF9
	VXIoaeAP8bsLhqbNW0KCFf3Szxevkg4JLefhxhqpO/6AyT9P+p+/cxWh
X-Gm-Gg: AYBFou1Coe07FCSiDtFrdmGTEFJ2/LVT+aXzohlsupscSXhVIYCXYkWS15nhMmYpOxH
	jRlK0fUO0RDjYXbAtUgI6HYH4y8XTE7K2lT0kfcIvhoyI8dnlFDOVGk+/SS+lRTS/jP4OZUouQX
	BXx22oaRof8wK1+ihaHYYEcvk55/AZjFSGchsi3mz08QzpR50TxdJ4wfac+Er6AvJmorfBVKnRJ
	qShTKIFw1/QMhQb60EQ1RUNq1cgKcl0+Uo4gRVcLcfZeHIkCk0smzZt8OvBtxw95WrYZPoyWhk9
	qnYaABbFPaeNoEutVwgTQmIv0AwKClnnba0C4khY6EPWrTC7ovSpdCSEwy2OyLYr9UlPtE5v+/P
	6Z9vXlpaJgif8Bcu4NZ4j25qEDhfhm11RL4PsRCh10WRqpfrJMQqcQHWGdPqCb+xevILjX1WRpP
	I0qOuRMTuQq/0r6IPILxx1Wvr+MqUL/dEp5PukG3e/CoCgUnCwWfZldmh5qO0r/Q0OeFcqqJ48T
	2qzFaVYTFtTAPAXfrfIY6o6fnAbE4efwsJZP2htedIkvnfQyKFghpQPlrQWoHDB6n6/qPXcozLx
	kskKo80T4Z2RDaz4ch/WNhZrxdr9ihssf8Uyp75R32KLl63fp48Mnv+qkP6IRMtVXVg6t0Iop61
	eG0/idYtNbqRwX4sk/C4u7Nuqn98a+SmSH1b7bdpZHzp8Hcwk7ekRbe7O4ma4VrUQJU8OZrEVdE
	ClUfix
X-Received: by 2002:a05:6000:220f:b0:485:8c16:5ee9 with SMTP id ffacd0b85a97d-4887175fceamr2133359f8f.35.1790233578647;
        Thu, 24 Sep 2026 00:06:18 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486408sm11108512f8f.9.2026.09.24.00.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:06:18 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:06:17 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Tsai
 <ktsai@capellamicro.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: iio: Add dedicated CM32181 schema
Message-ID: <20260924090617.00007d47@gmail.com>
In-Reply-To: <20260923191616.2217203-1-robh@kernel.org>
References: <20260923191616.2217203-1-robh@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 14:16:15 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Add a dedicated Capella CM32181 ambient light sensor schema. The device
> has optional vdd-supply and interrupt properties, so it no longer fits
> in trivial-devices. Include both optional properties in the binding
> example.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - use additionalProperties instead of unevaluatedProperties
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
