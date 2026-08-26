Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85783FD139
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747137; cv=none; b=G3iHhARYaQrrd0ziq2Ihhh/ygHWGHNUskugkBIcMvvCAnt2FXd1EPJGNCASZH8BgZH4mBF83qV0kXfsyaBBDRiaQ8yZTC2VM68vy2Q2cCNd0U+QZDuZnS/E0jhSULYQRsQ6VnRDRE0vREqZ1RY+bhHVrblh1KrUkaD6hjJm1T7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747137; c=relaxed/simple;
	bh=G/4pYCI+p6biU0oob2SAOB3uONa8AVChe5krxzG7DZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqsGeBZ5qe/rvdXIfYWsPMt6ml4VYtJNyZzFC6g5YdLamN5njIpDH/JmR7Eqi5Qi/Dnew2DKpXvZ12X95Rege98Yd7+fryiVmPKthrgDVcTUVfcDdyLlpO1JAWELVXMTU6yu+QhicceRigxB4fCYYeCH3aPWUkNjFIXXF4V1S6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhUMNIPi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhUMNIPi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc891373e0so12011495ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747134; x=1788351934; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QLB1RbqXq7v7CNRa3wJukW4z5hiwan9Z3mACetA9txg=;
        b=HhUMNIPiTSQVpBDqwuYr1bDNISgpuMItOcXrP8pRE91ZF2A1Kz6ESIQ9nndGokElNp
         61Nv3Mlz2+BCWHw6ga38qZHnQR1hd6hba7qAFyQB4Wq+eQX1ZYa3X2E8qCEljS/B2v7R
         auFYK8/B3vBhgBgOhDQhgiaOgIehTTNf1QYW5E8Ya4UfKmicEn/xdluepOMRoN78KvOl
         ukDq7CEomaNwUfDkNKrF5IgODpG/RCs5J5ehaJUWOSe8UeJsz1sSMZD0mmuJTlLLBxo1
         TgRc3X/ilTb5y8+QGHmu/R7oqlCI0f6h8jL3lQEZOXTHMISfPV4o6Shkfq3YFCr0HEN5
         ffwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747134; x=1788351934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QLB1RbqXq7v7CNRa3wJukW4z5hiwan9Z3mACetA9txg=;
        b=qhvUYgvlRy1t8WMoOEi5dWUoXdS/fPAPeHj0M6YBCu7qdtY60hdxAb5pJUqjL8jwQw
         WPZIkqXqLX86r5/yQhx/7wthrpR1ymwqv5DWW98n9nO4ls1+NVBgWfzrgO47l1AejJf2
         i2KO4iR5e7RCC9BC0o78D/Z3Jowc3h63yraMQOjWFvAfyxnFfsR9KzNVkZVpiVSb6IKn
         /0Rz+2Vf4g/Cz4XQDO3RKaOk8Dn5Sc1VaxKsYGinaVllLLenNhcfvRDhoY10SQtpit5O
         ITwrexG3rC5QB5VgED9cs+cn9Zo/WN0HaCbGbQIIfP7VLE/w/ch+3QDIXchguldoNKm0
         z8Dw==
X-Forwarded-Encrypted: i=1; AHgh+RqXtM/3CZtz18V7wQ+jojSGfNj9T7OUVBqSSZKaEL2pMWpsZXCSVDCfYK0q/e1TfoFO9Pyx+T2m89nAzgc=@vger.kernel.org
X-Gm-Message-State: AFuF++l8Y4AHv/pjpdd4FqT1u5T8a2HvTaNVJmYLm+Pwq+KyvP01WmUm
	VYWO7atlZ6Nvuqsv9AzsXY490KP3X+7zFaL4WN0BVLb5pTevbsSro3Rr
X-Gm-Gg: AR+sD11nuOGG2HQB5Mw503/MHYgcn7vA2JboVOWM1abtkeQBs15+U767c3kRcHyNixD
	fIJ2w4ToIVScn3U7fQyErYeJKeG9dwbooVT6/xf+SW4y2k2CSdMQyMXPJm0BCik61m+dWP1YvuX
	eo2twOh6x56aVJskf/OM3T2lThbBaQrm/pft7vuFs49Fql54/4o/1J7193o0wfWcybydQKDADD3
	E8htNQLrthrMGJOh4esFAYODxXjl1GjZq9J1Eav2oLw0Ef8BbYGUcm9r98j2XV8FBI20i8ozbVG
	m5cIfi68JI7yJGpy4nlr+p5hMBoEsxyN8xDklOEc7JrSssO8+yf601x8L3EEiZPspDka8LSH2y3
	p29r4VxkLIlBHypwb4WyCFW1oAtVCP3lt914XnhYAFh1H4aD3V7dVOoL0HalCtlUBj3AR0Rym17
	p2gyHxJsN4JP+3N6lYylb3gDSKi5W8N3+kipLMO/kacIdKlDOdY4BDimBva3ecHwzJt7bKLpfvB
	+EnPZz88/oEOXMS5u7hCi9wvSPW
X-Received: by 2002:a17:90b:1dce:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-3966d3e1cfdmr13717327a91.10.1787747133812;
        Wed, 26 Aug 2026 05:25:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5877:641:857b:1318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905c18bsm8457963c88.14.2026.08.26.05.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:25:32 -0700 (PDT)
Date: Wed, 26 Aug 2026 05:25:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Xiaolong Chen <xiaolong.chen@gmail.com>, Yuanbo Ye <yuan-bo.ye@motorola.com>, Tao Hu <taohu@motorola.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: adp5588-keys - cache GPIO state before
 registering the gpiochip
Message-ID: <ao7bNPVKN1q4dWOS@google.com>
References: <20260818-adp5588-gpio-cache-v1-1-650a2674fc0d@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260818-adp5588-gpio-cache-v1-1-650a2674fc0d@analog.com>

On Tue, Aug 18, 2026 at 06:00:02PM +0200, Alvin Šipraga wrote:
> So as not to clobber any pre-programmed GPIO state in the execution
> of its gpiochip ops, the driver caches things during probe time.
> However, since those ops can be called both during and immediately after
> the call to devm_gpiochip_add_data(), it is imperative that things are
> cached before that. That's not the case right now, so reorder the two
> steps to prevent any clobbering.
> 
> In a conrete example which motivated this change, a bootloader was
> preconfiguring an important GPIO output to HIGH before booting the
> kernel. Linux would then inadvertently set that output to LOW while
> configuring a GPIO hog on a discrete GPIO line within the same 8-bit
> bank (because the cached value was 0=LOW).
> 
> Fixes: ba9f507a1bea ("Input: adp5588-keys - export unused GPIO pins")
> Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>

Applied, thank you.

-- 
Dmitry
