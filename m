Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECCA4AB3C8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346244; cv=none; b=S2f+OeO27lZW7bjgdQTuvuGqluyYc/lLlW2yeAbu8n3WwkFkCdD07hWkCcDBodedY9zaQq8JrVLyRtZfVChYbiJKihuqEOLN6feotbdrHNqHzKNZqcIw2c/2Q62kVhxfkpyaQiY+lmZ1q5WCSRS4myZnZi8h+gi++LrIMZ5b89w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346244; c=relaxed/simple;
	bh=hnby5Ne/xYBp9U/09T9kv3WEIbUsqL+xI/HH6LFetjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQvmC9O4C8Fow+pWhLn9j7dHUhmVrfjEC4HIwpDsHH2S0YBBW3qwWhId37W0kEicPvE3KI6sxKb6PZTA9jwAP7A0afqLpiaiSDf8yxfk+OxKXSOY+cFAQ/rjnGPo2pcklIRLEdDZN25pXSsUabg5w0s1m4Ol2BRpyIFGYiLgmeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqXuNG2M; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqXuNG2M"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc791f087e3so218915a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790346241; x=1790951041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E0I0TIKEyiasgHy1ngA6HhdOkD8Gr+np1P2q8hO6FMM=;
        b=XqXuNG2McZuqUvqTs6YTyK+9nrDTQqNJTrvZaHU8p8/pp6Pcz0zkB4mNZBAWXo5lno
         UYzedwLYjyiZ2I2wNq0hcZfkkUAdxE9CIhp2/J2bWqZBW8Q46QeimNr4FaQVzzJeycKA
         4imV5nJci+/8sNrA9vP64DfrZmPszV/k/yNAmmZFkNEjGG7qKJg11zzMvkNZS3NDiK27
         k9Zs1dyF2tL0KA/7uAXRpOTBChtb4pXNNPdp5cFzWgywJESfHv3ETeqho0jCiNnXMsfT
         9xjUaq33ZLoiOcL54RElXkj2ME5Cj+MqtL34xgXmiYK9JO9U9ZUa3DNQBL9X9bJAdjus
         61Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790346241; x=1790951041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0I0TIKEyiasgHy1ngA6HhdOkD8Gr+np1P2q8hO6FMM=;
        b=xAZ2hiZN+BobTaTD19ti176qAc2d1Si4ZXwGtocmagdp0akkf6h1tIXWTYZPL5g8wH
         tmuVj3iSInOr48s1UwO1WdVR7cGOuyJbsa3PCegS0PFqJ7CTwF4eWBkUByGBVlgQS7zI
         VFyZN/EX28cPJfoavd28GBf2RbH0Quzp0+oC9EFR1WrI/JoDv1Q49TI2eDkvZIxPJyFo
         8IAvcp8jMalsrlSDs8yJGV8DetWIsXc0AmBqN/MrVgvxLIAkCl2v+L78xMRR9aaT7ydj
         cNNG3w5yf66AQNJxJsyf4kiiPXY/t2om8Ghn2ZmzxsC5otsWXVNfO2Lqv/Kh7KWmVrVl
         jQpg==
X-Forwarded-Encrypted: i=1; AKwUvBylXFG03hQZxDKe4PK54uJvMjf7Gal0k10YIL6/K9APrSQdhbrmj0t3DqeNXXUyoBOCvLZKmze78ls77iA=@vger.kernel.org
X-Gm-Message-State: AFuF++kuJu9icVrqnkICDdbeP3XlNbv4/ZaAfZA1CUZRSIYxVxbardjM
	HuQqT6JnjQ0V6ReoQ5bp+g2WyO3MI6wLTXEA2NFmN36PIc5EKbrYWEwDWLRQ89rr
X-Gm-Gg: AYBFou2YsBNo085j2Q9t5TgxbVyOTc09ZQq6tvw8ewAPve6KJO/sPnUzPzXUp2fFLLo
	RWYehTV1fp/hNEj5fSl5r0SLvQmMjIctD5716lyC+lrVe8SyU8j/6T+wPe0NK3avA/3w44rj/Ad
	BdoioUBP41nwdj3GfMbhz8KpEGkxxsS85m07MaR6NwdxJ3XHBxdziJUU4q91yaom/vQ3+BjyZMu
	zOwSQappI/kG4MeuXBsphW5Kc/kdp/9/tM2k3xA1t/VaF2+vG/x9vuIDCGvt4U1PS7VJTJCowZh
	4uiXwGvLRey5rfdkjYkydRRIh3v8Qu/HAQW7MBMhk5cwEdKcDxHj0v/9z37Bvf/2YmUhv7k9i8S
	nd9O5Iy997B7P5cMJPYT5GSdtnzfWCYUmGslDmTJruDARz0W05KSlJ8jg4+alRNa4E1C5DmktN4
	DK9rolJU+lcbjmsd1xl4R6wp4St2soGngQy+LMIyj+QxFykGpvWuoFizRkNMmmJRDcr/PuRemSA
	1f3pY65Eavv
X-Received: by 2002:a17:902:d481:b0:2dd:b83b:fe1e with SMTP id d9443c01a7336-2df7de9309fmr49802315ad.22.1790346241220;
        Fri, 25 Sep 2026 07:24:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e032bsm11754115ad.27.2026.09.25.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:24:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 07:23:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"freddy.hsin" <freddy.hsin@mediatek.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] watchdog: mediatek: Apply the driver's mode to a
 watchdog left running
Message-ID: <559c625b-8191-439b-b613-d35afe24c4b1@roeck-us.net>
References: <20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-v1-1-0970852315e4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-v1-1-0970852315e4@gmail.com>

On Wed, Sep 23, 2026 at 10:10:41PM -0500, Ryan Brue wrote:
> When the bootloader leaves the watchdog enabled, probe only marks it
> running and sets the timeout, so WDT_MODE keeps whatever the bootloader
> wrote. The Amazon Fire HD 10 (2017) bootloader leaves dual mode with the
> bark IRQ enabled, and no pretimeout is configured, so each timeout only
> raises the IRQ and restarts the count: with the 20 s timeout systemd
> sets, a hung system was reset after 37.95-39.76 s, and after 18.25-20.92 s
> once IRQ_EN was cleared by hand.
> 
> Program the mode as mtk_wdt_start() does, which also applies
> mediatek,disable-extrst and mediatek,reset-by-toprgu to a running
> watchdog; read those two properties first.
> 
> Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---

Applied.

Thanks,
Guenter
