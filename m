Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A24C525A69
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070067; cv=none; b=PsVLzOMw9EhWtRkkgXyqdQL6Gk/xs7tmSYLs6Q/+qQ6LZdDTdsX02dryUDhzk0TRAdqmqMQ0D3ZOvvLSOhOyhlFtYmcQvMX0IGmGT/YTUBDxh1J0NuM5IlrX13kvyPI7lFeGHJl+5eNGqdPESCxkex2bzhRqc0rR1jKSPGxSV3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070067; c=relaxed/simple;
	bh=vmh2K7iDtyJxcr4e+vs2mwwAuQGJXmiU3OYpnbP5Chs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCSSFS6ufp5OHWUqRlgRTEagYS9Ragbuma8MjWb1cYpjY8jT4VCDl4g9bxPxIjQplbdz8qfQaiO5OeqT4QsyQ3KwM3uI2Bu6SJtTT2PfDZV8kTOs/J3Of5gB6y57whC7j9QdAO98Vdf2rqqsjm+idF+dM8gSyhI+cqslf8w957Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJtumqmD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJtumqmD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956869750eso34949195e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792070064; x=1792674864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DKGlkemdch/mOvhFiOVD3G7PX9cRJidAty9RrIvsrsk=;
        b=HJtumqmD9S7QmMzDvYc/V4LbLJ5aDxgUJMykfEARGhq9PHJrlt7Z73uPiMOAWb5Ahs
         4Nzm48TtBhjRHAO9BSwtOXHW8ADrtazaeVuT7dY/MI9mZJ58SYDQJ8EN1UyVf5lMUNHY
         oh4kf/wTMBhAruSvk1GatYvZvUcRgoVoil/foT+qSs+9fs51kcahPfgCohPS91KOfFD0
         pm6fbtaUdpNQF4Zp+4DibRIAanIvgSU/RhQW+lmlbv7976R5PQMj3TBiY+dG2qbQvsEy
         k1qGHNMSVlzdyQfdsasyMs0p0s4l9ksSXPw4O2OcxQZEbjvOVePXixdjeMdBInLkca/3
         d+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070064; x=1792674864;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKGlkemdch/mOvhFiOVD3G7PX9cRJidAty9RrIvsrsk=;
        b=UAXAbUvnb2DQAxw5jf1gIEVL+pWqhizBeUa4bC3nbLeha775n2ilccgCg9CPEcAeyk
         iDJkvEWsU9MBMUR07cutIQpEgwwmrdkkgVm9ryWB6WD89Cxc+FVMQkq5r7a12fV1G4OJ
         gJfWGB8n+qX9X+L/WCQTlgaqWHh9vJ2iKtaLru/ycq60vvO7fNEGUEuI7VZ7lxW4rj4s
         4pt1nBn1J1b3DnN3wgAXbx7IGfihzFPYH3oPriA2KIqNpCLC90CPjB+5kJHQX7yrzZMK
         NwoG/8kOGSo2vj0ep0DPMKBcifg3eXA6SYWZZBp3COpqTzoaGXAFHAuYYs3iTtCTyGjy
         H8UA==
X-Forwarded-Encrypted: i=1; AKwUvBwKS94p46g3s2jH+ukS3EhoFx7ASKf8XndttVJSVzc7rHdo6bTVMQ1rhUVjpCjGsrNC9/1PzrgNq3iRQbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvCVaEWIReArzBVwphA+bp7PGyVoCYzkJfQJxSRZ62yVnCTKqv
	PQ8V9l2USaWr/7h5h49wkYUAvEgX0jCWBshQUWDqXxrcYH1ACbZMzKl9
X-Gm-Gg: AYBFou3VhYDzQECZJHgZH6cJIccJl/fhN+MHmpUay6H0f0PcS87vsNACBoTA1FA71Uw
	mtD5o2KrATPx+yHm+FPtmoNG2rxx/8J+3nnSg8sxdly7ZFaO+PoN4dizbQStZOcmJwKkFPiBTk8
	bQwiGMpZ/0qYF+EmQfKc21YEb7eDFCOhxp65moCqhj4b8nV7a5pZppFjCJappwHaXGaRnxFMFyL
	j37yp5wT719qg+bl2l4JYvpbbwTfhg4TqMzGQuqqUjl6UPJ0dpi104XAA+bINDG1o2uxperH1jW
	w4qqqYFMw0eIAAFOjH6nUjSo7xhrMCkSUdCiB+3kogFEh7PUz3xiT+OwYhLTTYUDioD/pZLlrbZ
	qFNg0xzkTYzv1kfU+Qnd0O/CDLANrXmO+iUYNtzNqRiIzyvhTaRw160Nwk+RNqeNyaLreDlEh9/
	YABYd5sga3jovOEJNy0a/AnEln1hvN0B+A/wGraFIy4GHjQ5LBmagj5fd/S8qOgRmvK7IyTTAKw
	Owi2KUQAmHOmXw3b7xXwJke16xbA/CH8UtYvh+h5r/s3fNvYnVtHVn2y9Q7wOIRvaWr+crXnVGT
	7YbSqVmED1/J/5V3XMQcFA3MtuMMO0a8VsS6UEF2sa4xxdAhzTaGEnsqYUE9EO8GIHtnay7RU1h
	CTksODlwVCYZe8m5q2NWbD/N+bl8lMEdNcDs21FETrNhUKEDrKneSVNEMBM+2sg56ouAYRe5n7q
	T8btle
X-Received: by 2002:a05:600c:8b58:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a18e4ca287mr353914885e9.24.1792070064296;
        Thu, 15 Oct 2026 06:14:24 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a8a15sm70210175e9.4.2026.10.15.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:14:24 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:14:17 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Eddie
 James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rupesh
 Majhi <zoone.rupert@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] iio: pressure: dps310: add an OF match table
Message-ID: <20261015151417.00001171@gmail.com>
In-Reply-To: <20261015104945.2687162-5-paulius.zaleckas@gmail.com>
References: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
	<20261015104945.2687162-5-paulius.zaleckas@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 13:49:44 +0300
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> Devicetree nodes match the driver only through the I2C ID table fallback.
> Add an OF match table, so the chip data comes from the compatible and the
> module autoloads from the of: modalias the I2C core reports for
> devicetree devices.
> 
> Assisted-by: LLM
> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
