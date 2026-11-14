Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626070;
	b=BOng9c1teoGFPRrprbrSfj6Ft2gRt4L+KV3AOV+IbUzLCCxfyvasPmV16xTNTbUq3iDU
	 XCM7UisnkHzM3P9s4aQy3M1hFqeBO4ya1PkD8ky+dIvbcrj9LWJqKlqFkFKaZSmsoja7A
	 ik6u7KOC9QMehaJ0eZo58Fgt5rMcm3//3wFrvt7JeciT6zokmrDMoD1mz9TXDNia4vRJg
	 kaAN7POB3qJ3iK7wXicbFukotzPwfstrADCAjOWVRqXcW8p8LVbcnD02E43SKgNQ7yGVf
	 bF9CxdKohG7qa41oxq+6y17Er8GoSe92qv7pZmFYskDx91BsD1BRxps7a7iO37OXuJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626070;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QQLPGC+GOI2NLww48mMh5/LqiV5CVnIpMnhORWOOWe8=;
	b=UzOuMeiUe/dPrklPI6GxjWQ42LNyeDMPYEH6MA3OF/pKJ6qDNxfECFpTFIvdnTs9nQNX
	 bYRAyg1FnE2PP9RwHPTvd24CtNQMChnPEdMC/WBFFvaTVgMomoDL9dc8EBUqyH7ytjrQQ
	 z1I34TG3cQe8xEh7BwdfnRGHUH+2SBr0Otb6H9J96KRlJAoNxQe5w9KHV7uhp9w76EMYV
	 VC332c2/cnJQJPlpeXSI411yLc9YTCf5I1T3kSHwAWcv/sQqeYKtFhP+ndzriW2rcP7zn
	 FHfC0lNqQQVAlxjeOaG1wHmW/qwi1GDvJkwp7f01z0w9nV2qqk8boMX53MdvFkSncbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=c0yB7hpH;
	arc=none smtp.remote-ip=209.85.161.98
Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DA0606A89B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25DA0606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=c0yB7hpH
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-702fd86d674so1921506eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626067; x=1795230867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQLPGC+GOI2NLww48mMh5/LqiV5CVnIpMnhORWOOWe8=;
        b=aHSnZmtceO8B411HTloxqT19UDBR/K80WTJrxGvHiraqwBGXTdNKTkhXqrgc0OxRtZ
         rKLxc528iWoovHwcn7GWdahWskdT2WzQfooz1XLio9zWw12mgWUt6AcciXqnbNYYvi5u
         9+jGUeau3DACwZ/OwIU/jK/b3s1dvPb+6P/DNww8Aa2oZU1U3OKKUSbdQPQ3Geekj1R8
         VYTpMllje6SuFOJQeQmo1JL+0+au8KrlNLtr+28+LC5OyIaTtU17Vve2NgJZ4ixyn4jh
         /tvBMulVh2d3w0hVxT+jKUGrm4X4bVlMCNy63iQkb4B16HY+MRQQ+jFBjqCJUZlXhDgd
         JYMQ==
X-Forwarded-Encrypted: i=1; AL+hErEuVzGIAiJ7w6lVHCa9VRcCE2tLAKt3MXY5xMhzbB/RUVn9Kkl1FE0KUnDBqqrwbQG+Sor1ilrCl90bplA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QwcueJbxPP7ac3lqYNOTy8PSEQ1rgBuNgRhFKE/26fR4BL3ey
	ZWBVqj6/omqfRccRGwa0PyPUHxdTZijNaLkX3g0zu9x1O/6epYExAunGZhpVf7Tzponx0ToTRh6
	fsrBs2SDdWqp4juBG22ap30eIfKwXYhME2YYfREd0nyO1fEnFa1afjOMvbkngCs6MbCtFw9LXhQ
	ox05Mjon4pauShfLvw0AffyO5Fe0YYjw2Sx9FjhegMe88FEqcHsOo4gPE0UxJ5ee/71brFfK2XJ
	w7kQVELiwPN5F9FbyvhKXmt
X-Gm-Gg: AYBFou0cnlxdkJhbg2G9Mco6iDcvsR823vIzg8NPe/haPgoCqOXtEeMUIrseQHbfvyK
	B6BJN3A549x4EMapQl2Ljuvvbg9M2hAujeGzNEVVftWiFwXLeHoHhU/4TT/YjJ4sNPxgdFV4Itj
	OhtSWNUPMAFCh7fuWx3iTN2JN8XsKbAhmH05Ly1ZspBtnCKMBRHZuUtn/ypyiK10t3xKlNmnQRF
	b8PDxj2kexNoJ8+xScIrk5TCcjZ/GR5vQlLDkBaR42bw7KTLkZdc6LFpzCITPjvUC8/tMGm3iCf
	dT6eut2DswR/R55jZIMrZCU/xVoy2z4Rf2DTCOU0iNaiOvbKcMWQwS70Q6z9kNYIq3FmmHDRJvz
	/5Wf9tSVH4AOANBG1oN0V+I9GGdOfFKjZ2bpG+W0e3dBa+bwuJU5tnVicbWyvS59fgSPrDJqkI8
	ySRbD3K+hoyIlwPRpEiLL7ClOAwsVZPnyI+h0jiM2VggI=
X-Received: by 2002:a05:6820:c3d5:b0:6e7:9606:6c07 with SMTP id 006d021491bc7-71ab520ed65mr2032606eaf.74.1794626066916;
        Fri, 13 Nov 2026 19:14:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4afe225821asm70691fac.25.2026.11.13.19.14.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:14:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-947a607ec40so162065385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626065; x=1795230865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQLPGC+GOI2NLww48mMh5/LqiV5CVnIpMnhORWOOWe8=;
        b=c0yB7hpHaN+iaW+mjurMsp1hn2SoGk2h3xLPt/r8EtqdB/z/gjEdNkKX37MDsCFGzN
         dDLoTAlmJTL7N1I1hWnSzQpj4ewYe5eiv/PQqna37Srt8Mx6JMjC9ZihM1KOuzcujfPS
         XKEju1CwPX5EG8Kfl9Y1GsPpnz+VCcb06xYoE=
X-Forwarded-Encrypted: i=1; AL+hErEUruPRFlwTrOS69Uta9tJ5pJFm8PGtUY1BWtpzxqCD9gwAHyONPMI/9z4YqzPPrUsW6+fG4m8dOYcnDCc=@vger.kernel.org
X-Received: by 2002:a05:620a:4106:b0:93f:34c9:9252 with SMTP id af79cd13be357-9494bc3df7amr779587985a.55.1794626065113;
        Fri, 13 Nov 2026 19:14:25 -0800 (PST)
X-Received: by 2002:a05:620a:4106:b0:93f:34c9:9252 with SMTP id af79cd13be357-9494bc3df7amr779586485a.55.1794626064675;
        Fri, 13 Nov 2026 19:14:24 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d94190sm33936366d6.31.2026.11.13.19.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:14:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] firmware: raspberrypi: Fix indentation of return statement
Date: Fri, 13 Nov 2026 19:14:22 -0800
Message-ID: <20261114031422.870934-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-2-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-2-5bfe605a5cc5@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 07 Nov 2026 19:21:32 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> The return was over-indented; statements should start on a tab stop.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
