Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746147;
	b=vC3qRloO8x10iaKtQlZl6o72sNLZSRkAnZ/fQwuULaSWnuhnHPKUQ9ivhs8dwrJYOxtS
	 6jB3omthG6gQ4A437wqgMxjRIZpFV53TTofTKFehSRtJZddtHE9VSV0guoGHeV0j02UMf
	 T852m/RAVby27mbB3uS3sPF8YwrkUqUQMMCHP0/3fx0vumbQeqJJUepOoGd6gnaTPMf4e
	 ddwwsPo+hHjQHHX9elxAMk8H+IOEME2jrzC61PmkjFZrot5+hg5eTXRqWv+kA3ft/7FXg
	 sr/lW3DRCo5M0xUQ8ThIYg2qvJ7CjASUPltQJ+4trbVV3SWZoYFJVOU9TnsK98M9wdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LErop/DGERkB7CZZF2w1mWsEqhlGZfF07HpoQtKJxU0=;
	b=Wd/TaZWxKXkXVEN7KFJgsDJWKXHKu8eZvvg/jlI2XwRh97oRas+re2+w+K96pBAjNesF
	 vGLZBWzNonC/9Do8L7P9u98fu5yj1TlE0JBU1G/59IKMISYwayZa9QyR2ts7fvlT98wKU
	 alWAge0Kw0d4xcD4D8Wlw9O5bCWIQq6SrfodDQaxY0fXKkdcZFnvkyoTVnvZj6LiRprWL
	 nK6B99Mw+gPRlLItl8XlFni+kTG5VQ6ACYJp95Stjfvs5EMg2VeBEDwhSSaOK2WpMEHbr
	 jb2l24AT93ZOJPpgB/xcobSn+9ohl5mhZJn2aSrCUakV58OLjXOclYsVfKp1aoPF3JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l2CWUfq1;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86BF606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C86BF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l2CWUfq1
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so354423a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746146; x=1793350946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LErop/DGERkB7CZZF2w1mWsEqhlGZfF07HpoQtKJxU0=;
        b=l2CWUfq1fk1jutMPZY0NtIMBO0oj/buWV8SNHZt7MQ/pCBMu4YTGb+zhf8S2YiU+bS
         fBxTsGXULrYIhzXds+FxxzFomQpXha4yYpt7RuXeVJl7KXP/9wadaTEJ3WWYFvEmpoGf
         9ab7yJncXv1PEs636+dW4NSc8lRMBIKjwksSo5L5Ho62yLIjEX9Ykh9rK/pqQgeHXHYf
         FuAY/3SdxZZY9tCbRQjIdnpYoiW+RBxi1TxeA2mVu6iivNlq2Oc9ofyj5CyG0yMcA6gC
         opX3FiAiAj0o+4foBB6tR3Ljn4DUNBpVn4lQr7brmwjSkbh56yiO1tca2dHr4OEckaBF
         x5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746146; x=1793350946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LErop/DGERkB7CZZF2w1mWsEqhlGZfF07HpoQtKJxU0=;
        b=v8l5K3Yjbdyc8plSAU29ZalUOSiXfj7x1Pequ/obuWOY75Md+Ee2xVfOQgdzGF7ZRa
         jtAEpUIZ0z3tbycKBKHZuCe16jJlpEwXFhHNrZwCgJQmtof0pLVE278SBu+Br8AyuPxL
         muej8euuasWnAhkVbqCD042lkaVd02ZM9aATcaOlujXFWeFCrBDoZi64wHTO4/xWUCsr
         Z3iap2iYLAy2A8GACP4QelyOgiaGHsJcOxHjFRgBaFBAkweWoH90hWVoI5RvNa76lEPp
         +h34Y5QYFCPNCZiCeJGXL/aZ8p1FYQoYy1E4AQ19H1qrphemOzgOH+lpWu7Jf14hXlWM
         sUGg==
X-Forwarded-Encrypted: i=1; AKwUvBxMI7q+OS537KOUJ5NyUUnE3eZfDukZSsXjRkyvHiGr35dsUsVstdSYuaOIvS4dBt1NyDJWvnsii/PgrfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGDwfu19hRyopJxS0/PvA5lY4Qi53nyDgQB06kcO9D0JHSDvUr
	eXqWxFrFZnhIF5oLeVo0maxKjacYo+fHsaOz8S7/mRjyIXby/BpPsOtw
X-Gm-Gg: AYBFou0MHd5rtnEjz0u+8UA8DY8bcxhofB77w05Vr7WjdZ4nIodYioRa+a5Cue8SV78
	PACU+ucDCX4QI/Grztc1Ywi18g9d4ENEf4y2Lm/0jaGLoqdDU1S5WoTcSQG1Wl/eXcMnrxACs00
	EM6Gqn/+85/LUGWx0f8zTYKcGU0mfR3vM+fx//wiO/1Gipfg2pTrkNWpRayd4DPaFOc8p0inde3
	Kq/d8ivHXRqj0f35sHz462eaPgiXHzLCA/L9EoOJdxRpuGAq2tRRtYsN+d7dzLsLHHuZQc9oX0n
	f8mdZKj998xXFnMQ5it8QvGiM6E57uAUM091dFHs4Eg9GVEkQbddoATFgjjP4ksv0hNGMVUlYEZ
	0YqIsIMoaR8dimvPV1OLQ5ET2ODDjoVXQSEtDTPHD0Y6nJTsug8YXhnvfyu9RpNwFfB37vuYk5j
	XoVXVIujpls6GBxc5piwTzaoosN3A4F5kceC5VBKTWyzECkXymGUZ4J1ma0MFMGtUHroPVMXTKV
	4OgeKkMt5TRLqLOEKRrSd3D9k411r3BgNeOd2GtsirAta1bb9m/H/ZjJ1F/dHIPJMM=
X-Received: by 2002:a17:90b:5108:b0:3aa:fc22:8aac with SMTP id 98e67ed59e1d1-3adce0cda23mr1334868a91.51.1792746145878;
        Fri, 23 Oct 2026 02:02:25 -0700 (PDT)
Received: from LYF-imac ([120.235.89.223])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49314besm7842720a91.11.2026.10.23.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:25 -0700 (PDT)
From: fausten <yunfeng.li.nb@gmail.com>
X-Google-Original-From: fausten <fausten@ebizmis.com>
To: Zack Rusin <zack.rusin@broadcom.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: fausten <yunfeng.li.nb@gmail.com>,
	dri-devel@lists.freedesktop.org,
	bcm-kernel-feedback-list@broadcom.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/vmwgfx: Treat zero SVGA_REG_CURSOR_MAX_DIMENSION as unset
Date: Fri, 23 Oct 2026 17:01:20 +0800
Message-ID: <20261023090121.5031-1-fausten@ebizmis.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e84774ae-b49d-4df5-923d-ae2cde480aaf@broadcom.com>
References: <e84774ae-b49d-4df5-923d-ae2cde480aaf@broadcom.com>
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

From: fausten <yunfeng.li.nb@gmail.com>

On Tue, Sep 2, 2026 at 8:44 PM, Maaz Mombasawala
<maaz.mombasawala@broadcom.com> wrote:
> This patch bricked my testing VM, investigating..

Hi Maaz, hi Zack,

Just a gentle ping on this one. Maaz, did the investigation into your
bricked testing VM turn up anything in the meantime?

Meanwhile I've done more testing on my side. I applied this fix on
top of mainline 7.3 and the cursor works correctly again:

  Host:   VMware Fusion 26.0.1 on macOS 26.7.1 (x86_64)
  Guest:  Kylin Linux Advanced Server V10 (Halberd)
  Kernel: 7.3 + this patch

Before the patch, every cursor update was rejected with -EINVAL
because SVGA_REG_CURSOR_MAX_DIMENSION reads back 0 on this setup;
with the patch applied, cursor updates go through normally again.
3D acceleration is disabled in the VM settings.

So far I haven't been able to reproduce the failure you reported.
If you can share your test environment (hypervisor product and
version, host OS, guest kernel, 3D acceleration on/off) and the
failure symptoms (boot hang vs. cursor path only), I'd like to
narrow down what's different between our setups.

And if the conclusion is that treating 0 as "unset" with the current
fallback isn't the right fix, I'm happy to rework it as a v5.

Thanks,
fausten
