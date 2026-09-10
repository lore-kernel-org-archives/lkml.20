Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97103DB64B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054265; cv=none; b=gywS95hYdrCZJ4fymKnuQEM9AipogQgcuyGaHWRv+UzGVjisvQK/FKu+3l/RzqPdAb+aRrUaRKA8rJFIjnywCkxJou2tit0KgvHJfX1E3bVtiWzZu9aCzO1bs0aW1O7hswiAcleB9O0sJRP8x/yedUreIUvbKitYWTKS4GkUPqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054265; c=relaxed/simple;
	bh=FMHnlepWqkeA1WO3zWGVjn5CErzhzH93jlHtlDYDxvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qBvfYXr2Jr/e9R5JgKyYmRn75n1rhahPdub4vQEYXl8IMwdXmXhjs6aMpnO804qYpzgjewldEPnFO4b8W+cmtoTS8llUCOWTD4niBIUA33wsIBGPEsqxk8atIN4aAYRYzy1QXjo1cl6Z+XNibX3CSafHe279q9mIaCjcDUtNNzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ca0JJxB0; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ca0JJxB0"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4be6057c9c1so3271418b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789054261; x=1789659061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNXtzdTfuyw24dcBONWaDJipm3E8E6edNYMjDUcSm28=;
        b=ca0JJxB0nBscrqm0dnyACDdHPSPM4pLKOKKYzEl8M0FDXUdqHGunwXmwoh1PeGqQQR
         Re9sN32OUlz4/9haJ+tyhtM4NfQd0moJ8lDrqzHxuuPG2UHCkVSF0Ngs6aHTuSLLMBMX
         GswdLZTFv1tM0gNsyiaoqwtZTUYKr/iQqNqqPUO4k8fN+2KjKhrTd3iCzcQmapmvhO5A
         3kMYQdxT62c2WRO3JN6t07VdlKY0cbZPSe3FLMVeSf5VJLACZHhqDuNraiYvte+vtxUG
         9uRNfMPa5CC4P+6jmJ7gy7snPPDAmHri3GL6+cHD7reGedoXitaSl9SqfWIJYfGmbZMg
         v+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054261; x=1789659061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNXtzdTfuyw24dcBONWaDJipm3E8E6edNYMjDUcSm28=;
        b=KukQKnM9F7MuS3rg1tjPihB77Vi5QwumzpbedA7/6ZMOsv7mTDdfvweI7TjiwRFNxH
         9T1xXJfYhyRbhidwSf5hr7wBar3Ges4eQYAeuB0LvQzZePO6vsrMJfiGENC2SnMdAXgz
         fl41LD5bUHB8WLEu3MRcCV8gH+CWoDzwCmP0wtd99cdESoox0aWnfQBp1B27tb0i6OpD
         fkREPzYLRT0+64RuKUQMxJ2MN0B0/TSlJA1so9uwlfZcm3OwFYcODWpA9WOiU6DTzmCL
         cVUJwp01nR0Gl44onkiIoYxzdJdZYw7Adm7prgXzZdeZEKz8OG7SuzwM3bcROlL6RHgw
         Oa6w==
X-Forwarded-Encrypted: i=1; AKwUvBzoMEJxrxmqYWUh6FPf5LXdQtfzrgFSrH6ycnRv1EdNKHrvqd8Rx468DmJi3X9GX7Fycr0V54E2+2QA25I=@vger.kernel.org
X-Gm-Message-State: AFuF++k0vgRwHFG499oYHpVuS3qJjgbgQDcA/ZbUMXTZ+BrxiEWbQD2v
	C5SS9e1VW4nwvi57YOXu0mv+sB93B4EDVflGX9uocpXtrtN4NaEirjZVghc23sbNwFg=
X-Gm-Gg: AYBFou3aPjaLEzEZlvNgj8GSRN9SeEQdwFgPVTkcTPfSNmxR0FnEGRk3dwa5X6IDgGm
	sj6wknaIKV5IhM9dp8L+ZtKcIY6nuYXSKx0Kq57VfhHjeygkYdT326UgGHV/34/UsmO7GEvsCf4
	1nAmU03UCDScSxB1BKLxV2YQDtljbpBgtbJ2Sb1N+HjinL5M5AZmLelF8lZavcvXvYFRe+6AOpx
	XrIupKL7mOGKDrrEWzamXCors0BWTy6+BLut91SyqzD29vOS4aAIznshByURmJh7kU/5blgyQq4
	y1Y5vwx5TOvRjKod2ocNuswz9bubDOgV06C3i0XQK8Kvw4c9Wm9ePz2n9P9jyNzu58hZJqEfGI7
	EjhXHSUx6elCxb8l9VQXA72/96JkRh/1S3x5LPUxY2NHu8Ye/WBEkzI9MRZhe9GMaNw1OkaTzX9
	HTVFMtsaXfgVH5bcN0uOAwhqUACTKgf9gLCbz9aZjzN6FR0lAhI2G6lamaV6qc0a7ypjkKrs8E1
	MWmKp7MW8duGRt85bG2mTUSwko9Zfb/xnJqW/PtLBTq531p0Vztc2aF4iU=
X-Received: by 2002:a05:6808:c1b6:b0:4b1:b037:da8b with SMTP id 5614622812f47-4b9621b3457mr25643931b6e.11.1789054260657;
        Thu, 10 Sep 2026 08:31:00 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a8c5:6332:5ea:5b26? ([2600:8803:e7e4:500:a8c5:6332:5ea:5b26])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971675a96sm19552104b6e.11.2026.09.10.08.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 08:31:00 -0700 (PDT)
Message-ID: <dbe61875-4eed-4d8d-801b-af2e3daba752@baylibre.com>
Date: Thu, 10 Sep 2026 10:30:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: docs: Use the multi-lane mode constants in examples
To: Karl Mehltretter <kmehltretter@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260910033219.15996-1-kmehltretter@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260910033219.15996-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 10:32 PM, Karl Mehltretter wrote:
> The multi-lane documentation names SPI_MULTI_BUS_MODE_* constants,
> including in the transfer initializers. The interface introduced with
> the document uses SPI_MULTI_LANE_MODE_*, so the examples refer to
> undefined macros.
> 
> Use the interface's constants in the descriptions and examples.
> 
> Fixes: 05c3bd745bb0 ("spi: Documentation: add page on multi-lane support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
Thanks!

Reviewed-by: David Lechner <dlechner@baylibre.com>

