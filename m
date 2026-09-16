Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2C4908DB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595839; cv=none; b=nEWmUID/oYC7T4yffeZ2otL8Z7MKNcfO53W495rYLsEgs0UBtjiVjlQMHXXUqFoH4wbh0Z9poyGHGGUM5DzLoVlQscZfS5augK+y0mFoVOr/l7WMCY9Xcq3L2nYF1gRyu436TvrOS61jkBKZ7FmDvLKt+hRGWaaJv1IYoTD2LC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595839; c=relaxed/simple;
	bh=r2huojaIA0LnZu4Tl80T3zwgfYPivrD9nPSDp+67hkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFCeJYTTXwMYmbH6HIg31bvXU5jyVQUX/vUMsZNfiK3Y1aNH7/Ia4BX8B+SFOOxR+i6t7r2oL/t2pRCLrFz2Cqm7ihptvJMCSHEO7GFlgOtJajpdVk2iYK0nJ92zVq6VkeI5cDW9tmfk8wprJV9itq9/SD+uXmYSQoCj8zvt+TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWUNV5Nx; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWUNV5Nx"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fbca514f8so451555e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789595829; x=1790200629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mpm+rXQ1nRbGhGlarYrHhDYEJtHCvYuH4SNSCHxwBYg=;
        b=IWUNV5Nxlbcs8aA7X5OjQ2vQad3/VDLyoPXltbPPFo8IoA3BbLuO8UQ6d5N9MnD/i0
         6WvGBwOmiNZOBOsl5z4ypzAsPtr5OVaE3VTss70oegwJgjuHlJTmNCVg2OQoIydbyYKC
         KNHt0EiPOOpD5agUGw44EHmX2NAtGeOov6MuDp0T53nQAY/BV681j/IofRzgH047Y00t
         j//FcJDnJOIkvjW8aoVssTL3pX3lKI9IEGUNydyU2hJogAqGXdcSnsBDjaNFDs6LGHxJ
         b1yIix9/JYMLp99YDKFBsZ/LFIauNlCjZvWeTJRDzIGwScyOv6uho/5uo2k4/DAifXiZ
         bMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595829; x=1790200629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mpm+rXQ1nRbGhGlarYrHhDYEJtHCvYuH4SNSCHxwBYg=;
        b=NjYTAlvqj5FI2GayPeh2Bk+FhM0Ic1NPFVb7YF4kbGX6kLndxKg+yp88k2mqBYU2J7
         Ku12piUTy0ae/OXHJ3ZbRVjoIN9Cib9qgfjYmassN8V0HNCnGWodA7Bmbrs7FAg+byYz
         lzy14UixqY6DlzwsIxUOuWeORotljurbfMyDBb8q/wVYlCk5PoVzFWzcnFRglUK6CzAL
         xgg0qVIDDZACDilagLlBXR/YiqXlLbSYdjDhj9EkPVt/f1xyTs+OQQy0fAggwhubds2g
         ImHzvRYyuVW6G4M+bycPwvjHOjmAf2VO1aQfES1f1qBfjUQz7J3ZKr7col1lKNdKTpDx
         oTjw==
X-Forwarded-Encrypted: i=1; AKwUvBwMyREtGUYt2p2JIvUo7WXAmFiyoD7u8iD1wJkqdoO2mIhSZXXnEKqPyCznzek5B9WaZ0WChbQvmzZSpxw=@vger.kernel.org
X-Gm-Message-State: AFuF++nzWv/+mRWcti37JPwchjNGQNf+qe1yLK8A7MV68LleEuQ7a0BS
	B4tUmqPhK+auVFMNsXhRb0lSx2ci8sg1PZf/2QG94LMWFKHpaT6rV5UX
X-Gm-Gg: AYBFou1q65M5dBPffD0NI/JF5/o03BPGWQ/J7gCqo+xX6tQiBTCPMYjRPmSnkNHfuow
	CfVd0GBF56n85DPZnpputmCnW0C8jJK2zBaykYroKzfBMXIQKajyAZxynTsxRPv77icAtjrqRWx
	5MVWaW+vq2SXwMMbhLXvtaaztp9cKh6v3c1C9H0Fcvi+w8+ZxC2QsOVaLRCC9XaBcjbqSHZS60P
	pMwoFRz8AqYqRZkxgLb3ipWQPGLJ+H7i++AoCQT2sZyublV1VzCo68QXxruUVnggEVnFCza5iFu
	OMg1Wbzx1Sz33RS/ZUBRIUt/NrDBqV9mG0txJ256Fn0qBtFCqHTprcMlG11iJm2p3DcPMV2dNOU
	SiobZTCy/sqnxXFnx70Jkgm+2/gkY73N6V/egy3h7dEPORTX7DL0npoazX9lqCpylPUFkIhEJFm
	izRn7FzwCA3cLiwaBMzvycZMfWCquXsnvLgYr19DqFtvpeCn+xYFnTWq6vJfTuhgGFe+sDrqmwZ
	aK0B7J2fxGVcckDPPE=
X-Received: by 2002:a05:600c:3492:b0:49e:7c8b:fdef with SMTP id 5b1f17b1804b1-49eb7329b2emr42924465e9.2.1789595828416;
        Wed, 16 Sep 2026 14:57:08 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.73.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm35546005e9.11.2026.09.16.14.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:57:07 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: rdunlap@infradead.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	mchehab@kernel.org,
	aleksander.lobakin@intel.com,
	aleksandr.loktionov@intel.com,
	tudor.ambarus@linaro.org,
	bvanassche@acm.org,
	emmaonana18@gmail.com
Subject: Re: [PATCH v2] docs: kdoc: fix struct_group_tagged() parsing regression
Date: Wed, 16 Sep 2026 22:56:46 +0100
Message-ID: <20260916215646.23185-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f0591ce9-2e8f-4777-90ab-b9159b7d8f20@infradead.org>
References: <f0591ce9-2e8f-4777-90ab-b9159b7d8f20@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Randy,

Yes, that was a mistake. 

I have now sent a corrected v2.

Thanks,
Onana
