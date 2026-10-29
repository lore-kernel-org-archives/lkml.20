Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793300064;
	b=q9NCtr7kizH1UQHsf0GIvD0qY9iU2uwy5kSqYdBMeWpPWtsPrrHva96gQnFAKpCkAECG
	 hKCPso3+LZjMv0BWbq+m9f6F/kw5YBcmLj1vsSJYGpGH45TqknM/BUiaHcVM4inliAKwB
	 WU6tsrWjur8CuB//E9LBNaH/OZq8nYSNOjOhbCDW01WwoiIJIM3WxkQAzOkKo/3goj3Az
	 xzY0AW3p57dZDwZGqOgOeAb8rTBlgOc+23uq4vLXrmo0kxk4G6K5zR/Nzerw+XamyEFds
	 e8Edsfd2hTbRNqNMkH6KqCLvG1z97CreV0HWi++MxDay2vLc58SP4jrW5MTwU7reHxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
	b=rI7MQawscrAsckB+VRkmwz/RI5ZrZ9nrotGHMaL9nQ59Wiu+jB9+Pf3yrflNY0R/U9Cr
	 cIo9+eZDrW2IpajHxn0OoHr+ufsHj7wAXs40jobigvDXTQcR/s9BGRBIF703qFr5ENeBo
	 4QRDBMLprKaZ4dnFHkKMA/GnQ89KMAWBmu3gAJs14c4j5L+URJTdSRcFr2Rjo9LUT0way
	 SVJOr+LeTN0RJNBcPVlmBui+BZPqbIHfJXk3LIB6LoKrBrDCy96oM9WCgn4guCvs67p13
	 Jw31pdSsh9jN7m65bAFlLv8eb3G8wVllvEpNjN8G4QZ37G/1mcwT6vQ/X2/ONlhCf9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rKenpn3u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D085D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rKenpn3u
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so974467a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793300062; cv=none;
        d=google.com; s=arc-20260327;
        b=gifRDYATRxZgP5mQbKSypc0ySS64VeJemL+qDmWXPkRL9jEabXcVR0nvL7IcsyFQ03
         WZ5GkkYDMFHa/aKaHyMvK6cJ4+vnJotYR1HMsDoEYNdGSRLVFh2/jFt/bXuMNf7blQn7
         Ym/LjD3r+kKvqPyXlmAYNTyir6A/41yhCPFb7Bwkk0UcFjG1cm1Yks7A65Cu1L7OVaCx
         NgrnYESNz6860PHrIc1YPAfPKMWpIs08Q5aaH1+pH5tmRIZuFGYoJvIG2fr+bfgZgF3P
         iBEfdQBJNz1mA5HtAi8AQIG4PzrrI3YuA0zXoQ76/gONgdDbpbPUGPp+XzGQE92Am6jt
         PcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
        fh=5DQITrmrK8aOBTrT0yp3y0n9zGO1/+gaaBixBS6pqCI=;
        b=EPeQ6O1NRhYVKZNgyWQXfCwG4mfFKhjWJ8y9w5hnPNSgdPYIlKcfOUstiYXo49WdJs
         b2hF+dXO2Y6RgwvyDQ1m9HFn1b+K1uUMXByqaiKlFXWGqlYalPOWw2nWiU2qpjp6vyWE
         T9djoeM85/5SNvj9sSLZSWq+b2haM0FRXwnR0hGwwSXFeWcWXvrNBQbjg9a4Zl90V0jP
         h1AnXR+R/Stf2NFscW91voZ4BHviLdjmsW00+i68/esxIIEkM1ie27fgRFPgYSd2JivJ
         S0KrdWZFFsMzBoYBy8NPzBbHicXcIxRNEdCYEw0ikCF9p4abbVyFkiC1jkO0qgJfImwd
         6+MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300062; x=1793904862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
        b=rKenpn3u3W5zKJbnW3CoC607+JsEJKji0/fLXoiEGhyrKiWhUcRzMah1FLvrOBub9R
         NE7klN8UQCsws7AsQCS4k1+24Rejt3G5tZYzWR/FbbgOhPM/rpD43EEYTrXFvmUa9Ekq
         xr/NjXtwkh3YwCt5T4Fkhl+MYv/B8abG+MrzcLf/NxuIrxmqDgxuFt5IVVK0/hBaiJkZ
         vxcIWCbEYmOv3hwJLFb1h1k2hH9IaLaUDPvX780If4auSqGXxwoiZp85/eNoDjV6+TJ8
         F5GI6x/QkuyeN+bD9PAbt+JyEdRP1ACV8NKb1q00pE5uaQmYqp4ZOggV6DsjCXKsGpdj
         7LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300062; x=1793904862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
        b=X2q38advT2v1gkLAEZ6/FrRzykQ2jTVsMTjG2vs4plVTYKtNn3Ib3f1WDhZzovCo+D
         iHFXZIhSFH6GaEVdm8xQMjR8UOn8HWboeh30ravmLdbWGFVqVz1j6oQafQLl3pYHBboQ
         3mUKvCRGu5OwZv/6sIYATaglreYqc+tlschw3wlU1eJIL14lBC3Bv4ftP4pIpyLLuKgJ
         T1Okzu659ZrNV4tvmvtg47G/QXeZPMcVHpOrp6cx3vvj2a5p34WNXZww72DWxqrpwnD1
         bjI0VhJbdCl9k15Bn742DHb2QkQWfLmm7I5L8CoVe2X4jYkDfLORvrUdF81bcBzrKuNx
         rpow==
X-Forwarded-Encrypted: i=1; AKwUvBzGCo8PilY8U9vUCAxysBJlzqdQSByc7bqyRZ90tMxlWwc8i2X54vHJvlxhIVoxVAB9VxpYZAgdrGxm4yE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuXAwXvARE4YBHy//C927R6E69jhSFnDIfvM6TVTY4B/qiH28t
	nQAFkNAzTirknwQ7Hdnpj0EfJTLgq13f/g4BSLE8OJplg/6zYHL85A8oWIGw6PEeGqbHr2zLbcW
	7PUtnmXNg68tkHulyplBO1/5ISUnSET0=
X-Gm-Gg: AYBFou2/ThTeQmeDlmY4GWeXYatQgD2WRemDhOXY9c1DmdNobHLPYKqgqxDqfefxoxZ
	IY9GXpWp2ya4RibAnZCbD3zTlg/4Rtzx2t4aU6/uG+2NGFcNQ+74nSkkjJrE5ast+OtlOYkBOH0
	AUhw7fOZ7NgRIqixW64gpSNoVxzyQKuMv2mTIe8DLxnAmQtuvbCiornYKXsHN5+LhOAtyEWVa3Q
	Zs8+VDShlZB0vSvZYz9tEkTzK9nM98hi4sO3Mzl7OKpOU1TuM4cMSeaL4GZoLNwPo4G09vm73OL
	MkcrSFuSclHNS/91L2LuU7E70NwU2Q/me8ujL8xRTMVS7IVH5/li09YOSs5vhZe04R3GRT1rUAU
	nGlXLlXaraajwH2R5WZHk6bzGIZ7tx3V0Q+M=
X-Received: by 2002:a05:6402:a6c1:10b0:6ac:a862:d8ce with SMTP id
 4fb4d7f45d1cf-6b49cbd6ba0mr3412953a12.7.1793300062077; Thu, 29 Oct 2026
 11:54:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202610290223.iOEGeDs2-lkp@intel.com> <20261028202400.GA835963@ax162>
In-Reply-To: <20261028202400.GA835963@ax162>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 29 Oct 2026 19:54:10 +0100
X-Gm-Features: AclHuK-nQVrYwHXIPfeZqhaOMYDdttYG7QvDfwRoqznKlouAeTSr_3BHeahpDrs
Message-ID: <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>
Subject: Re: vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi
 indirect call!
To: Nathan Chancellor <nathan@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you Nathan for the analysis and suggested fix. I agree your
patch would be useful even if the warning wasn't there, to make the
device probe more robust.

Being a new contributor I'm not quite sure what the process is now -
should I send out a patch with the correction, just as I did for the
initial contribution? Or is it going to be fixed by the maintainers
autonomously? (Obviously adding a Suggested-by tag with the rest of
the bots' tags).

Thank you for your help
-- 
Luca
