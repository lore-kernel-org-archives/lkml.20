Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351053;
	b=RF0GNKHgeEvv00zQ08bJc1ZL81/n2pUA+L6V/ER2ox8kD2M2jHVQzT7uO0nbF0i/tNi5
	 ZP/7yHEr5C+oikzLaH7IWlQTDI08Z1xWYwFHryn3Q2cGAzUwE59mumCepYjZtva+PE0nz
	 heBQc1iVWwKUmIWdZJLp31fOQ4w6aFyZJrvqUwSXXKh09gjchXUCzivLEXQiKnbxYrVTe
	 1bxWmpnLbEP1uFe91AX75jAL3W0J5TU/xa3XmGJg1Gqzg7OcsxH7YdYhbts4s04KcgIWz
	 CkzLLqbrG2LBwLzc4FqSLLB9usdvfBBhrnR5V4WjFBWBifkfEwPQUglFvu1AcTGkQlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=;
	b=oeIiGK25jHgy/mdXhBsDTO0asG9TzWbBj+0sMwiZoAuYGBPZZUp50Eo8VHX0efszByBn
	 cq9lg+GzQ4JO/DcTufryVLuxhm5/rmKBiXr1rkWbx0jW6cPGnW8ig31RcnJ93vPWolK0G
	 bBKwXZLtdJQZOpRvWmZigp4oLXbQwfkeHxZlaAn5CwG5LAzG/13zQK5J29b45vJxfXRR6
	 1YnC48g/hH3ZQu/WhOVeq4nM1pn8hdQ8ymSOTK3kbLzN+dzsOs6BBmqFPm3TLZ3u3F+wv
	 aTifiZNaY67l3meAilWBX+4CvnTgGX7+svh+qxqGUHiDrgTcNF4RoaBKh5V0l944Zyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LC9JeVje;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8490C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LC9JeVje
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso279871f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793351051; x=1793955851; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=;
        b=LC9JeVjenZNzVagJ7qdBUAr3xSCrKK2xX+ErDqBCM/hOyfSUQl5TWUguX2FSPITYo9
         sSuq93hv1facKhQXVoP3MXZl9vMca+axhzyi9/7WZPeM4isafJjESW9sVGDzCIMY+5fF
         /h3cXUAmJOss9y0aaG9X4AQazR2VC/IpM87oIiDdcrm3djsTez5JPKf/dc7UeG878zcz
         nbSkYJxxXn0f88w/MP40qXVYmU4m3Y6pemUZ8UChvLMxi7w7j7QkTDV2vJ1qdLegpad0
         xIr9VJIGmCww8GPz2tEwD5Bgs6MuzZriwh0RtJ0iJxtA1WKb00IgDLvl6LiQpm9mIq1c
         CEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351051; x=1793955851;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=;
        b=LR5x/XCQeYau9CLAi1wOfL4y0ThDodrQE9FRNjqfiLQHxxyzBO0cJ5InVZ++/t/cxV
         31Hwi/rsIKFHlXnPq5tm/M5eFDpbq1iVYt49R00fb/wrXhuVdUB5EttO269RQyMbjXIO
         33uJDH76wjN9nECflUWW8v+kZuj1tvV6Juzne83FsDm76t4CFNtTCU1SvmXAcLru+KtH
         yUIwpELvtsIKEBMDlK6CTn6OAEFVq7tf6hxpFHHSQhjwE0QDM9rKNMsHYFCnDyOT1Njc
         VfivtZ9wvdg6qxYuN9IUJ339954imA9IKF+CH6sZwJrv3hQT56Fs77tC6zdrmiE10QxS
         eiZg==
X-Forwarded-Encrypted: i=1; AKwUvByt2gmmnEEphwzyzz5cylzFOnnWioP13vh0VLUW5OYnkkhgCYyPFa0hT1u+CtlH86gDbHwqW2tUXjS4dLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSCVGDo508xaFHFZZ3o9iT9m75E359luQjNdynOgMk6v36EnAQ
	7fk5fNV/PMzYvOua3ZMvVjLOSFXPtassbhKW/fbFsOx0HXKH+kUF2oZcMRHw0FAQpXk=
X-Gm-Gg: AYBFou3yqGXfCPbcGVsebjK3kLD/mGtSvuPoFvsZRR0znx0pp8TWmUHmIGJEvTb3r+M
	0b9Yv9a4KqH8czJ/TnxRKfnV/Ka3ikPz+Zig0J7Z1Ag/zHFykd55dxMC5mILm8P5GWVt9Ovo16W
	+U2/TJhRxjTBgpt+Wr605YwmBYHSwfAFRxJ/zPk7gaYYIlaX/TUSIObzdhExqYfPZxVcrL2HORh
	GrskQm6job2PiaSo4TKanUCvCRGeB3qJD2Z9QhuCRWZlel8QQVcSkG3f88KE86Glt5iwRIkFRkd
	1n42p0HOY/dBz8lI6zovyrSky4iCaEdesb3JAP3Jl4nGsv9HdZhuAzwd1FJ//5WwknFcmfdp5JH
	15hJvkm3gZOa5fCkEbOctIsXp/t86cdtHe040TjdVR8RddxBUpVhy0hmr0XtyMHSB+hTtF9ZRiA
	tGeWmBok+OBXISlaklh9G95XAAQDTmQjrGLAlsxBR/QX7KK30vP20CENhuBIJWbLsK0S63C64B+
	SjxH70HA9sbJkSOnEe8D/imQwLDwt+21hVobFm/DsF6jlZ1SKLuxCHv7SZxz2ccQGEPyL+dRRu7
	1c+sLiWmUtBMuvG+27SjJcSB9HjmUSJHp/m4r9MDNJVXKpF0JA==
X-Received: by 2002:a05:6000:29d3:b0:48e:5df2:a011 with SMTP id ffacd0b85a97d-48e6e2c14a0mr2402572f8f.5.1793351050905;
        Fri, 30 Oct 2026 02:04:10 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm1977127f8f.42.2026.10.30.02.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:04:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: meson: Fix PLL enable timing
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
References: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
Date: Fri, 30 Oct 2026 10:04:05 +0100
Message-Id: <179335104535.2573818.8004160070280286355.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Xx/eVbgodhm0RN6K7j9bFweBrB1LQw7pZ6RJPufC9Ko=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPYjsvLvb60dNYISrD82ePdkjGlu8bu59yTpnJIHckl
 d9Fel5hRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACaiIcfwP+H5ve7nf765rXFe
 3Xhp8cE/jpN2ld5xm75PWd5+WuaClckM/zRXCy/+OTWaq/BGwcM/q6vN/z03MD/MvFqk3Sg99NV
 zCT4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The hardware requires a 50us delay after setting the PLL enable
> bit to meet its timing requirements.
> 
> Without this delay, GP0 and HIFI PLLs on Amlogic T7, SM1 and C3
> may fail to lock under stress testing.
> 
> For example, enabling the GP0 PLL at 1512MHz may lose lock and
> result in an output I/O error:
> 
> echo 1512000000 > /sys/kernel/debug/clk/gp0_pll/clk_rate
> echo 1 > /sys/kernel/debug/clk/gp0_pll/clk_prepare_enable
> sh: write error: I/O error

This is something for the cover letter or bellow the --- for a single change series.

> 
> Add the required 50us delay after enabling the PLL.
> 
> Testing on GXL shows that the PLL works correctly without the
> additional delay and continues to lock successfully after the
> 50us delay is added.
> 
> On A1, remove the redundant 10us delay before enabling the
> self-adaption current module, as the new PLL enable delay already
> covers this timing requirement.
> 
> Tested on: T7, C3, S4, AXG, GXL, SM1 and A1.
> 
> Fixes: e40c7e3cda07 ("clk: meson: clk-pll: add enable bit")

This is the commit which introduced the enable bit and it is not really
what you are fixing here

A more likely candidate is b6ec400aa153 which introduced the delay
sequence you are modifying here.

I've got this other patch addressing PLL delays in my queue:

https://lore.kernel.org/all/20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com/

Which one is it ? both ?

Please consolidate and resubmit.

-- 
Jerome

