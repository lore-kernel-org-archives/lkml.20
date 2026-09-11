Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBD1231832
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789099349; cv=pass; b=f0V9e8hmJ2pb5M6x2RAbtar25lx2MM5k7aW5poIrNzBacY2qjQLAKIJbQ1YebZFQzY/4PB0ovEtXRAkW9TcQiLT0wE77VhK9EJ2wFig+RCiuyTh9vX7fEOAIvqrdOvyNxXQEiuxLBUAj0wm6P31EHj1aOyR3Q6PFnNg6KyTg0O4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789099349; c=relaxed/simple;
	bh=/unsMahU5AWxxZKqAdHfGOlD5WJuLIUU0biyoYkbP6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLND0nuN7iY+lRlxz+ocLa/w6Fe1wfhsnt1IIi+/KRpHTuwt+LE0n6BOS/M/D/+h9sfg0qfjzP6TR66nuiYMkUxbC6liOLPA787m4QN8/wokhBdwqncPCOMJSM0v64Re2QBDlWCpkZTQM5zPVBCcokz5fGAptqK7rTzXFBdgdYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLeUw4vd; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLeUw4vd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2dcff8f44f2so6623815ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789099347; cv=none;
        d=google.com; s=arc-20260327;
        b=DqXNp5nHI04RhOfgEiIE+nWZOxv5xCCVgNEeJqwX/5MLnNafqqXTjBptwF5XTRY9sM
         54e+KyzQlzrG9YrXBYt9FVXSv14YSAKKHXJZ74Yv/dbbzcwlsOkdOaOcgfYprpSNz7jQ
         bNfyAsn8AG5gsjsn7wFyt7T1Q9MHRNOMYVBE/6QGAEcfunMzlOhMhzvFwwjlJ51MqbJ0
         7fnbJLGqRXivs3XhzpnGo6Dlz/OeIrdDc3imeHKT7YKxXK5VTjodBPXGZOz8ECOF9eT/
         WC03PWHtsvF+d7ym0jyD9wX6oDUfAGgoeoovGTDIZdF76RxOoshBY0uEOovw7AKV1ahY
         ysvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/unsMahU5AWxxZKqAdHfGOlD5WJuLIUU0biyoYkbP6c=;
        fh=DbVAzQjkYjwN2reu2weXyftg6cA5AqhRk1z8G2UMNdw=;
        b=OJf+9oRTiw8esa+35xG8rkY3QW4cAVCtj6QDpwd7esyFLTExo3VBe7dQfhOvp+m+xv
         df8ZVymM522x18lrbEsH/XDTUlNicp2vnGJLq7cAUbbdwAeS/pnTGaX4SLcjS/bmcIxi
         yTc6eMO5IhSAq3ShxbqoDt9lQ5BrWm07oc3fxcH33xFqafInSIKZoLXgj0EWisvyDeQ4
         BZ04cgaPxrSCrGuxLxj0YLkYMKqhMKbkxFGnJV4uT0fQLj1PBhpJ6EAm6MPuRl5WnFqu
         IlWfNHPNK5u4hPcs7gq5Lx6m+dyWeeSBMHDlAMFqpEw157yJp0GzOUPJxL+Z93eB3urG
         CToQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789099347; x=1789704147; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/unsMahU5AWxxZKqAdHfGOlD5WJuLIUU0biyoYkbP6c=;
        b=BLeUw4vdjqqNSpEHvR+GPh8B7ESlVFw3WHIOz6jFGo20HHkk7RuC8cM/5yZiiqR+Ju
         j+B/2WkOn7mJTSB7DRTX+wf5LWv0O7dVy2fT84UqXbeIcely0L7AP11zq5qoJkgRF38X
         cBGpBhPlGqWsTG0VVHWU97A3u83LCnLzzWfnsKK+gD9EjWiU/ZV90jU579ulN+PrxfSu
         DETQXg9w23YilW56zWK95sQspCfjXNPO9hZaER3mIBjTnoGkUNnaAFZi00gOXImuYdQw
         xxPEA4qlytV+RWUpvtnJK7JwOB/U48OCY3VkhRF+9fo0hvdjWsi3ICqoJQYhj9xXcEFK
         qUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789099347; x=1789704147;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/unsMahU5AWxxZKqAdHfGOlD5WJuLIUU0biyoYkbP6c=;
        b=ioeBeb7bWYBU6+vk8K9ePmykRPvtLfLzzcNMnj/72XFAcSctFTTJ11eYOgZyla1ejI
         GisTXTcc4T2/a76KoNWZbQyby8LEwyMOJNiqP03GH03pTkg618Lqy4NQSzUVMx1qKVC4
         r2qOQtWvE6kZKceCQYJ7M0E+UV+3PAnn4dTO0VRtR/FQxvXEC4eUbwZTzjVS87eRl3FG
         QNxQtCSpxkU9ceIcvscyGwVL/jgMHKyVrXOQDEgqn/Ya9bIp5O4+8jUT4D/KhBB00vZB
         D/4GNLW57gK8nZQ2YodWv7HDr5w7OsFpr+CLrWCK/5ti8q+j5bNR4rL5qiNPF2X8W0k3
         Lc4Q==
X-Forwarded-Encrypted: i=1; AKwUvByupShS4RYxHwbpNXMfnPXUR5hPqUOTGTDWr2i/uTnuu2sk3mO017BsfDiYFnxZi02+dOACUylGDZ5QdtY=@vger.kernel.org
X-Gm-Message-State: AFuF++m1bQMdkZSawZ5Ng1X5zukAVPc5VkTB/4Q3txnqLhmPN4hISx7s
	U+M17fLvZweTLH6/EPMoWUnj3WPvfMS3ROHOQcRtAcq//0KbcLO0Xh/swdrAENsOyzJBK8qNAXd
	ExI/7RqSh/kerY9pfXPYoIiiUmnqvBNU=
X-Gm-Gg: AYBFou1N54Nougs71SVuHsHojiBuNvq0lTRpCk6H2UGBP9X0B63SFh4VqlujfTKwehj
	BaD7BC4dbK3o03hgGAyEoDAEt5bUnkjcJh6GtSDab1FvGPEeZANYhSs1Z+mCVW9QNEKU5hr8XBj
	PO1BZLOsk4GSrXASv05Amf9Dzhjx+DRf4sYVWuSY8P5OC6H75abA0/EeeSgkN5dpI8XL3dRjiP/
	uu5NNHo9kD6OSjZDvkyk4p9cxlQwr64ttpT1u4/eNH+/8vXuKVDlU7SD4uim4KmeTfKNANJjfl4
	hBmKC8GFc7+s3pO46yOpZ5YWoSIKzTlbMseG/FRS6vLpgMnvFMN6Rgv568/HK4lO47r5WY5sy/Z
	WraQQZuqCOMc5r55ElmSU5KU4wjHWogC3vxnNqEC5Cw6PLmoXtDV3x+5mks1Fxhucupc=
X-Received: by 2002:a17:903:124d:b0:2d9:3bee:4f32 with SMTP id
 d9443c01a7336-2dd2a45889cmr41780545ad.20.1789099347397; Thu, 10 Sep 2026
 21:02:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909064712.22539-1-phucduc.bui@gmail.com> <20260910180733.2d4d48e9@kernel.org>
In-Reply-To: <20260910180733.2d4d48e9@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 11:02:15 +0700
X-Gm-Features: AcwNN1XnERV3Y99vrub4Kb9Mq8NYZCHahFiWxUXpMZS4wj3JAmLqVaaCGWrPlw4
Message-ID: <CAABR9nERt4w_vKgnYRS5+fhTQ64yJW7=vfyBBi_C+PLmNVfzeQ@mail.gmail.com>
Subject: Re: [PATCH net v5 1/2] net: fec: Propagate PTP initialization errors
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Simon Horman <horms@kernel.org>, davem@davemloft.net, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
	Stephen Boyd <swboyd@chromium.org>, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

Thank you for your review.

> > -void fec_ptp_init(struct platform_device *pdev, int irq_idx)
> > +int fec_ptp_init(struct platform_device *pdev, int irq_idx)
>
> This function has a kdoc, you need to document the return value now.
>
> Please repost this for net-next without the Fixes tags.

I will update the KDoc and repost this for net-next without the Fixes:
tags soon.

Best regards,
Phuc
