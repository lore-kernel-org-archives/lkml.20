Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C276439F74
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427603; cv=none; b=EJeezSKTbQRIRm+92rlN8dzLkICSWXpEbYPrehiCN1GrAW4awE/rjAMuRP21AGz55ogmSOsyKNhUyKJjN4+6fQrYP+tTUbwQ1uTWiJKJEzDcKnbv4K1n0qIh/LjmxYTQpMfbLHAq4CwSgJ28wAU0GW1bScNhkEebkdWtbxxuz1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427603; c=relaxed/simple;
	bh=E3Lfkr3xrImZFSABQNFxau/Yja44Z9Ogq6/F/qSM8WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWjO2mKcETtTs0u1+/co9ypl33A/9WrOijuGVgD+W5CqmuwWESb3AvS/fSc1swv2B3LXHSBMxjGOb1iltXySNqR1vjtcijTMwFmSTtjAnPN7d8LlyIZXFxaxLCYxGGcs7su8/C4rIG25DpWZ5JIYVif2xX2pwgJhEA6JzmfVXmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXHg9RWY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXHg9RWY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so13508935e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790427600; x=1791032400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QVHZ0P3dYyoak6azvRs7KE33EPBoZDYqlIBWuemBV/Y=;
        b=AXHg9RWYuqf2PUSSID49olScW/6Kfhkj4Ik5nzqLNucvznejNdsBxuiiP2CV42lWg+
         J29LdwtWyyy2DkTstvqpJfFjh8NnAIGFBrmx+vhiaLLSDXXHSeCiSG15jhl/lbMJE+hO
         a/TB3FjIySYUnBKwxeYz7tZnOrrPHh2jBuNNFqm2LpbfOLtDE7XdN9pxDAdfACY5Grw1
         BrQ0n57+4fyzW4AJzkhRkTtyzmoxedkA92Kpwxi6HsFj+F3+94CpQu1gWeiJueoXT/9j
         0AefhW5sgolkCjpGN8AYRt9WMWLK9KJJKHewjhMvf/s9PC3QHg1kETroLCQMaoMxAjOo
         RvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790427600; x=1791032400;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVHZ0P3dYyoak6azvRs7KE33EPBoZDYqlIBWuemBV/Y=;
        b=kxyNNGp4aB64d4k0KhT+iY5cVM2zkYUehx5QYEjGSKQUJW4OiSMJw8gdFoN8V68KaY
         MJoW12Z2CCPWBL0b/icLqf/qhDhGZr6olrhJZuYDRIFM+vp9OpU4tIePhTyGmDhACJad
         /uHG1W2bH27fRF5zM0wZruJ4v1dm2dZy8FiVLv5rPtOQWU/lPhjXaq2s7y8mZPNgpc4v
         aBwrpEPxmUjVTAmpvaDvAkQc9D8sfOldpGhdtzlV8b0x4DqX+3QtcAfrx29Es26mhziw
         9Tr6A609OD0m+mIsPXFiFx07oWahlfUfFh9qzJm9/YZJmoWs3pyQmsljWv4Mr8PuEVn6
         jJ+w==
X-Forwarded-Encrypted: i=1; AKwUvBwdpUFqGLLO0tDLyvS5K5Y/aB3w89HE+ALuUrvjzEMvFjdktael6s0L9zEtH0KgfRxj5K7telPvEIexQRM=@vger.kernel.org
X-Gm-Message-State: AFuF++nQBT5Ou0Y7hdpQSvo67xqiftdGc/hhc22+ilFgBY7rE/PP77QU
	yplApvxeS5+VhuqhJi4Wy5SXMLfqeFwNMf51HJrhYYjL8DV4XLmJJv20
X-Gm-Gg: AYBFou2kGj4xwaUNB+L2OaF+WBbKOREfL4yaZFmGjMwvXK68Qoq2cDqi6tGQvfs5E7e
	sY4C/5chfI0nmN8rtEHuT5RjuOcBgx1iFBj/j7fcXEnQAUFEQp3eqnOYdwi28jUv5bzqFRWrSsf
	Q6cEbP+DPoLGesEJKiJvQ7imv9DYsoYTPSA4Zy2SwWSmwKZjGOZFU3+Q1s/w7+HjepVcUIbrsRN
	DXtFEhzFh8ANIwv/TspA4BD8qgxkGGU2ol7qwmmBrMmpJQMiJF3pLbH8yi+c0BIzVN0zWSFLkeQ
	H5+Tw42rCv/i6WoSmJ/BVrH2umlLJ02TP+84VTfKJ5TAXRR/hFAR/a1SefiKmqAjZkADBVe4A+y
	f4dN1lo+cHDtdYrRQJZtCBlvL446AysGTPMv/Z3b1So2Do7r+B7F4wYDyeS1lxrV4R3R7y1DxaL
	yXTjgaIRusAp5PamB8PlY0KpVMSy0b0llDLY8u7PmszKbu/WJ7r9oKeATYVMsQiV8eVLg=
X-Received: by 2002:a05:600c:1d29:b0:49d:797:83bf with SMTP id 5b1f17b1804b1-49fe66f3c7cmr169660015e9.21.1790427599583;
        Sat, 26 Sep 2026 05:59:59 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ffd66aa24sm29687885e9.14.2026.09.26.05.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:59:59 -0700 (PDT)
Date: Sat, 26 Sep 2026 15:59:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Artem Shelenko <artem.shelenko@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use unsigned int in HAL interface
Message-ID: <arfBy_n6FsDI39p-@stanley.mountain>
References: <20260926125150.161466-1-Artem.Shelenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926125150.161466-1-Artem.Shelenko@gmail.com>

On Sat, Sep 26, 2026 at 03:51:50PM +0300, Artem Shelenko wrote:
> The rtl8723bs TODO asks to convert remaining unusual variable types.
> 
> Replace uses of the uint typedef with unsigned int in rtw_hal_init()
> and rtw_hal_deinit(), including their local status variables and
> declarations. uint is a typedef for unsigned int, so this does not
> change behavior.
> 

This sort of patch isn't the correct thing.  These functions should
be changed to return zero on success and standard negative error codes
on failure.

It's actually a good thing when bad code looks bad because then there
are tools which complain about it and it motivates people to fix it
correctly.  That's the whole point of static checkers to complain about
bad code, so we're working against ourselves by silencing the checkers.

regards,
dan carpenter

