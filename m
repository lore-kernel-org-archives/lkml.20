Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441296;
	b=CIQWyuxex4POhUMeWbM+MG/8JQNGM37xNfgdnSKt8bq5jnSUqZjxnMacMHokwgTCRT8T
	 zYTtbI6C9KVadNYYs6kwMHD/rRFqOYCiwHAY1KwwobbWxV0rTOt+3Mo1VU6b6D12M1SA4
	 qZiwPx1vmFAzcxFtv7bmU0kX+jGjcYCaeDd5PpjIRjspb0Ni8rl02MQlG8wXRUcAla+ge
	 FWkM2GdgNvluTVxVZAeOSz6Dz6u+2YT4IaI1xgLh8mV7sH7Q7X1qPuBSlRTIDVa/QPb6V
	 AoxACPe+imEcghTxYVCWraxktixmD4vNpIEaEnp3TLF7Kww3RH4oMnvd3Zb7S3lM3SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=lxY+bUlnXkp9HLTP6VBDyo9xmYaSPEc8yORJWUbNihU=;
	b=FS6c6fUcdmVmiq5x9Z2FbuTQLngZKJrVhPg5AgX6JxUq8wAvQzP6Z9X7c9GeUYKkPvyb
	 6w2sFmUJ56WFIHgQBKha9dtMXugshW9fNV/b9RstfYqxoPVFUe0beZnn0Y0WotyWePDP5
	 eqkmlzzCrqqJQWJ9oNvfFzlytlXsuxLho68jxCu78VuNd8+I/Ce3dXKiYVbjAotU47ZqA
	 IdQpuA3nFC+Nttvadp8SzSC7QY/GaAAlvzguHLUzVcnjwsH/lXxRaPoLjNaTTggDWNBV+
	 UJ9PfdLiEZQsuqhJVCZxT4K7nA7LEbLVh8Wu/7/DBr8AXWVAmOebFBuHG77UrrGqfQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XiBEVISy;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40716606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40716606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XiBEVISy
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c4818e4165so50530137.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441295; x=1793046095; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxY+bUlnXkp9HLTP6VBDyo9xmYaSPEc8yORJWUbNihU=;
        b=XiBEVISyRUSaKTM2KkccmpCYmSCxtkzIT9pO0e1ILZqqpIDrCarUcKeRKwEiqGqFjs
         eTQ9qd8be3XLJSDCMiafjEnEUjd8zt1HB16T6EqvAo0fhnwhTkEWS0MStUFlZOm49U5t
         jcW42PITAbU6s1v6JmqyMJCwYN0hkuXsoj2oP6T+Iv97KQ7gA7ICDvzCgsYE5TjxO6wn
         UYYeAgUoeOlxW/2tqeR/V3WkNnyeZVHXii+Q/vMNkX7r+pROjGz2tKzAzWPwkxey7DAJ
         SvlyEv1Olggw8DwwpfLuv77Ht85Lvi9uB8DN4EZzuwSYDA/hnvDofsVInA4wxHL0UUwy
         g8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441295; x=1793046095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lxY+bUlnXkp9HLTP6VBDyo9xmYaSPEc8yORJWUbNihU=;
        b=AznJsqEO8+AMBdomZIwSld3dl2vgY8Ro0tpZOLIdaOKV/KTVHJ62u506Z5OBFhUGwF
         AgjLGuks/zs8Vmx3a/02VdMTCkBBOYaCsK+D4zVNC+VL4jEk2JX8vuWSMiSEq9XVRoVx
         EPi57gmamzaqp13GwDAIfhVeMwaDd2lWXlVyNvV9PrMZ9fq6Goq9UvHjIIDTyiPgMqIV
         88Gyd95RN0NO0eb7VKiLLWvoPVWmcrasY/yvGpTA4v2GxXxTMLjWSwkoB1Ejf9g6SUzQ
         13XzC8VD4xknU3J5pX+jSc4+ngsrmNUmdlBP+tir0oON8I4lHLjmW+myNCmc/nbuz64R
         OZsA==
X-Forwarded-Encrypted: i=1; AKwUvBzwcIK10wppfFRy/J0drzERGut89DMy95k9+WtJNBDp75Gzb7IOXWYms107EnsLFUBkBfeyl9qFq4Xgc2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQqFbGyZmX2zJOmiw4IMFtWPTBEh32dmhqy5mIB6MYW0ZmD+17
	3CRs20FhWQC3D3pfmsJn0ys+uiWDr5Oo3HUz/eGj99eTUiTG/716WKwq
X-Gm-Gg: AYBFou0kZQTvoMx0y9AN0qgARWz+lCOpK4dA3XZPYVddLhgeXJjgo8bYLvfQrFyh8bO
	3JW+ALW6zJ+ByXbpv/9o30a3sKuptMAtjoA9OOwn5LCTrWW4IqOGihx1UIklQa12P1YcpCf7o14
	QCd0+RN3FNnEurA7H5eN0KrrvsVdFEZYEhsiHFb8Yrw/n0AdACoxt1AcHEfSED93aSNMxKVRtyz
	HEzEPEq+MmeMRdKjTvPIQyBhlTFm3aP07pfpNVTaqs+PrV9v4w3gp/4PRM20hd/wQ7xkz/XNaCE
	RgWmEsqlGcYvmWe3mhV8B7Um5tY1yCIcHbWPps6pYmGRaBla5IZFSMV10LuRcrs6Mp57/xAxx+r
	MP4AdyIhXfbCddEFQNRD+u/u1Q8O3RbCA3qA3Sk5KOuvyBlvxP5xEpoVMhFSez82D66maqiCMKZ
	LEc6px54OCpBzObpUHWQhPqsw1C8oXej7mA0TsTsJWlWpa2MluXyPlU0RZX1qrfCXRnYb8lRGpS
	ZXq9tFa5RbwYfxWKQ==
X-Received: by 2002:a05:6102:4410:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7cc7bac38f4mr58992137.6.1792441295093;
        Mon, 19 Oct 2026 13:21:35 -0700 (PDT)
Received: from localhost ([2804:30c:4067:b00:a68b:4892:7af1:b51d])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc77264634sm1081672137.9.2026.10.19.13.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:21:33 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:22:36 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@analog.com, nuno.sa@analog.com, dlechner@baylibre.com,
	andy@kernel.org, Michael.Hennerich@analog.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v5 05/15] iio: adc: ad4134: Serialize single-read
 operations
Message-ID: <atZ8DPLg1Zqzhba0@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
 <fadebc9f9fd6fe3924d086bdd7f549555dc069bb.1792200021.git.marcelo.schmitt@analog.com>
 <20261017193929.12ce61bc@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261017193929.12ce61bc@jic23-hlaptop>

On 10/17, Jonathan Cameron wrote:
> On Fri, 16 Oct 2026 22:57:47 -0300
> Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> 
> > Protect single-sample read operations from going wrong if two or more of
> > them run concurrently. Serialize the data read operation so to avoid
> > single-sample read requests disrupting each other.
> 
> Why isn't this a fix (with appropriate fixes tag)?
> If nothing else comes up and you agree it should have one just
> reply to this email with it.

I seem to have forgotten to add that.

Fixes: e0bc6d7e2584 ("iio: adc: Initial support for AD4134")

> 
> Otherwise LGTM
> 
> > 
> > Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>

Thanks,
Marcelo
