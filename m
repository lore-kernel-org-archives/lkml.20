Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B254483AC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145789; cv=none; b=YWGQS09rmTbMxmMWeN/HQFyOXDWBMLN9CFRmaOPhHTlkquAqVktSvTbUQC3rUn5nYgg3xLe0X3sz0Cl/u0AzwU2S8qXqW1r2jLzeYpy1JauL15c/jKIqWBqbT15JtqVEr7VYzSOXqWA1efJXMMclw56ZZ5Hegis8slX+FiZqSWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145789; c=relaxed/simple;
	bh=onJ3LfZHXM5TccZdOtCipqT84Y/YNc95VAbG1f9eJAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWrejilHIOKUsLdvgQPqHJQR18xRwYhgtEG/XXJmTSn8cU4OxLtbOVYSgBljgj6aUk4gUfMCN+0Gv7MWXp/ThKG5XkvxQ59OCbYaR8uQrFYaqbRU9cZ5K5fAyVt+G2XTjaE10w3YxAYb50oFZihQIqnP3hkufxxm5ScUMevrFNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZHQ9Muo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZHQ9Muo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so5871165e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790145784; x=1790750584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lddRRedq6bhlZyqKs7quxCdrfUc0s1t4+2l/QqC+sc=;
        b=lZHQ9Muot/5qm1KmYGRJdz611H0rNXQ5Q+7x/em9fl2+UJat2BcdeV0u8RQXROkJri
         e7Xlzs194V1VWI9uES2/nU7pWH5S5/klzEO5F9KC2ptCFnd/9GtefqD9WyQLzJ2Orav7
         /qkqYy3Nyw2EolEoxW3pXwsta7OXk9MA9DyBvVAOhiHr+8Sh4W3/FevptDQMkzcjOWQm
         sBKhR7A7X5jBHVIhQHDtiKB8jv2AFfgUjbAKIHkr3kcgWGx/g/F06EUj1Yv1XX4tiPNP
         jRzlGj/ec0TNwV8hOFWcINLA5kTs57dnhyWhimiUF37rgikGPYoC1Kg4pdBC6OXZiVok
         6pyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790145784; x=1790750584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lddRRedq6bhlZyqKs7quxCdrfUc0s1t4+2l/QqC+sc=;
        b=oeWYC11e89yO3+MYzGGht/Pljf3pU6z8EJKbB8OCGhELvsW0hOzi7EnYi4Nna6fyh9
         GY3AFByaeDuup1ePXdRIgMsL/Hmah/1mm7t/99FK4zFaJ3k/8XBetfmTF5OFpyVZ2mfc
         dUINKN54vORZz+DPs10GtZ+dgz+ouP1Brva6aZVePRcgg5m3BBrEJVrFnTBWIqoGSsvv
         xFtUlO6Luc75CXGbNywNmZ33BQ1zmW9ONmqRiEEHEHshnL0XLNld353/hXQ1zT2IW1eo
         BJ4H5pmI5ljpSsTS2Mdh/SvjxMclp2CEHVXAeL3J3xrMwhZ7btHMKPH1DQfG+Ww4Rnry
         ee3g==
X-Forwarded-Encrypted: i=1; AKwUvBza99z+/X9jvef7Ifh0RS9TPNa6Zq2DYpCxY0gmlDGg+dwqoaAqQHuKMFED3YYQuvg2UWpDu3r1lr4bCZk=@vger.kernel.org
X-Gm-Message-State: AFuF++mgZeeKwjrvMki7ErKnEjgjfQowRYKWB4dk+jYlSbchPl7Y0uiY
	CgHOEbeP1fjTmMVOQqCUZpQvGRUQ0MghQuD7udMlKe6//uewWFDx4ia7
X-Gm-Gg: AYBFou2Cd4FdmZXDDtKqjsWxzJdA8GuYagzeNsgB3ZE8qOKCwc5ETql1UMnzQo7lciu
	3s9Ajo2IwofF8kPe8sOK7AniPBiBumb8lJlsjBEFgZN4O8VKW5rARYe49IZBMESt1VJqtNVGAM9
	kw3WoeHaMFyCrExbf0s4fDYdsYyHSieowvuh+wQoWKD5fMGBFOEejYAKxrn9PFDoXossatYPOEu
	tBz2VozspY2bQJTGFcJ0WamuYgLgtHYNKbZTGV35nxP4IEfNRE6Mm3uLWPHATfmDi10Y4ZOMaj3
	WMBhS17RvMUBO+dRHP2ouOJrnMkJnOwSawTbT/NaFFZG2k8bjuTTuNB8aXMWu1dHEb79T+6X3nH
	Ek+I6sOOhPH5a3/Y8yLIHjsk7eL0/G9mOXR8+Oc1nOYLkUz8UQ/MKlna90NrVmpa5sz0EUh0M+b
	YK2MqywzUFm5equjAVReVB8JsRz4WguzmTuqEjW58qAaHLIQPoQk7K6GepUzuyDcD0t0eWUYI4d
	ylJ2Q==
X-Received: by 2002:a05:600c:4e93:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49fdee0a952mr18172255e9.3.1790145783894;
        Tue, 22 Sep 2026 23:43:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm37103685e9.2.2026.09.22.23.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:43:02 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:42:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vladan Kalaba <vladan.kalaba@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva2102@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix integer underflow in
 tx_fifo_depth
Message-ID: <arN08yVxjhAAyZ4S@stanley.mountain>
References: <20260922215849.16739-1-vladan.kalaba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922215849.16739-1-vladan.kalaba@gmail.com>

On Tue, Sep 22, 2026 at 11:58:48PM +0200, Vladan Kalaba wrote:
> Fix integer underflow if tx_fifo_depth < 4 in axis-fifo.c due
> to check in axis_fifo_write() subtracting 4.
> 
> Fixes: 52ff2b840bc7 ("staging: axis-fifo: fix maximum TX packet length check")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vladan Kalaba <vladan.kalaba@gmail.com>
> ---

This has been sent a number of times before.  The information comes
from device tree and we trust the device tree.

regards,
dan carpenter

