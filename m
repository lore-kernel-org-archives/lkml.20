Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519ED388E55
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303902; cv=none; b=V0b5yHGIT561NYTgWI3X22FuGGxyd4JTKsq7lHgpFy5/ln9TPGGA2Bl5umkSxafvoG1Aik/ROvGhVexTBnr61BWcRaKpjo2mVOREbvg0CLjPQt2zPYttv2FwG7erWoKuynbpJO4USmLrbS3A2qi0O5MQqBpQQnnZFsh0O6OQ9Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303902; c=relaxed/simple;
	bh=ZYAobeaBlJleat+5l5nceo/cdwNEYU0y8usfyhJ/c64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXOprUhoIAdPsf8y2wYwOOH8RTuxwO1+zCJr1U2+fLGJfJiw4G5NcaNXEtJBwwZRQtAk/zkwhy/gu8RV2QxnYQJnyG246ln2YkU9MsByLRHwz2iYrjb4VPYj/RxFl5WExxdG1p56Ke3Akg6PsKMd49Xn9O6YThk7fiQ2BHs9Sn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2Npax0P; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2Npax0P"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso613674a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788303901; x=1788908701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tmOCGEePW4HCHBy9intmcc0xfKUaVb9xCHFv+Cs6LwY=;
        b=X2Npax0PRoi6XRK0cQa1Y6yqGK8RELCUaefRYNR+zdJbMcvLPiRji7OvCburefm5iw
         /bfpH413LZzN4Y67ssW0N0epWupx9/pDWE1pTX3vDyrIZHQbM/TcKhL5+aka3eYhaRKI
         xw31JjC3sYpbSRMgH3CyqRHW/VLdRkFA/hzbQHB1jAGvExPTIji/md+qoi2ARTqo2Oei
         JTyYQKGYV/gJSyBQRFsJ8oMzwkAAmaNBtQM/hEAGl+86H+JsGrJzPuW8+DPWxFNic6wR
         tpu8NOzMUHf4rZt92XwI16X42b7lhx8FIhX3t9yWaEA91BgJ8nxxILWGj41+HDhNX4Tq
         GkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788303901; x=1788908701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmOCGEePW4HCHBy9intmcc0xfKUaVb9xCHFv+Cs6LwY=;
        b=Z21h07/im8IVtvgVwkQfCrS4A5pyd5cZOtTeVhx/aQVakAYhNjzQQqr5qQqB+7ffdw
         16pi+OukE2TCTVKVi30kJqiPoVZAiVadVT1U12nHaMhytqi1suvMygkZ1fDu/HgMFrvT
         exDH25+KsRcu9FgOGGXuRajV67241iqLsD2zWhnneM3yKjNL5UenEyOJ+SVg6EiOzZ3t
         QtyrLQLQP+WePsVeeGwfkuT9+1+2hmS++4nDfidyTKP+dEfipIV9bUgWsr960OWBbP5X
         Sj1qxSaDQubyZVrUyWrDxorcAfoxXhg+czyTQv4cvYYWazBVVpo6dREdp41aoOJvnFhz
         vPoA==
X-Forwarded-Encrypted: i=1; AKwUvBzqL1T+16icAxegIWU2j4ewJxDaw/UhGZ93HmshJpeosNe9K/788GL572/H5/pfpRUghpWWKgFI5DbWhws=@vger.kernel.org
X-Gm-Message-State: AFuF++nDTv4RRP74HCALpWt91Pi0YoL/RaRjAc6R4H9m9BGQyK3X4VH6
	QO81P45v9PL87uZRZDITiN/aUxdMwWpxlq4ZQ07Se3pL4NP/MTzFOmy8
X-Gm-Gg: AYBFou3zFKK3wJ0wiaRMpZkbh+1sWdpTfJOfriOI/0cmi8lQ/KXi0cwLM0XFl3VnpMo
	uuyrEFRU8tfBedFsCBl9KAdEEgZRBVFU6WuSIiiAY1f0VbP2GwYnXpQDow4542CacJ8yZpYmLFe
	SJ4tUCaWrqpgQYyzguIfYCnG5ul1+UquOQafrMEs3etW+lFfMHLMeylCzyRt6AgCvdikVVMydnZ
	EBYnhzg6fyJuA8qN4A+CasdOzlV35HBMJ8PesR1f2Z5HRwlqD3yW94hGlM6owjAtRxZmbv+gs+u
	uWVMHoc8W+QvMLs9BLfRQLqpRS/BDRAkEUz96ZPnybr3sEGJZHeQaRN6hfBB//wH2gjyLR2R47e
	8ra9K8F14kvgtkilTP+er8iYtZCXxszLZ6R3X0s+n3XItd2Vqs2WFTAp/z36n0Gx6QmMLTzblkB
	pd+12V7M0cfGFpku3h1W3QhpRhCc2CGpYdyl8UsmrDXIKHzfcZ+P8jF357P7qNrBVCklaYweX5/
	A==
X-Received: by 2002:a17:90b:3d89:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-39aedf89b82mr567737a91.1.1788303900563;
        Tue, 01 Sep 2026 16:05:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07bdb15bsm1138117eec.26.2026.09.01.16.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:05:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 16:04:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: aspeed-pwm-tacho: propagate reset deassert errors
Message-ID: <e3e4ba55-9b54-41a6-9130-52981f83f106@roeck-us.net>
References: <20260830125044.97718-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830125044.97718-1-pengpeng@iscas.ac.cn>

On Sun, Aug 30, 2026 at 08:50:44PM +0800, Pengpeng Hou wrote:
> aspeed_pwm_tacho_probe() installs its reset cleanup action and configures
> the
> controller after an unchecked reset deassertion.
> 
> Stop probing when the reset controller rejects the transition, before the
> hwmon device becomes visible.
> 
> Fixes: 18c514cc0e02 ("hwmon: (aspeed-pwm-tacho) Deassert reset in probe")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Applied.

Thanks,
Guenter
