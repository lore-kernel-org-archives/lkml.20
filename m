Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ADC45D5D0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981779; cv=none; b=Mr0AKQ6KEIv7Ohg1mE/UZFt7XygTFQhaJz98wYAslAiGT5swAiS2jpwnjf/cWDjDUjzAcChbuwBPt7SOgFAxcL3ZB5/9VOJh04+v3hrTLvjan/CBpgzOUMz3wk+w+VvJVm/IwRkG+GfzjkRUNCpDomYPTTv8kAkTIgO/aToLyRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981779; c=relaxed/simple;
	bh=s8AkDVUV7wZMIImsY9Hxb4sgyokPRn4KvSEgoN+FKPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AqAPdAYcifdrK/r789lbBOvMAu+c4nSSWhzxb2i/NnoXJOOzFiiziNdcGRvFOG3MFpq7aFzNn9oRlHbu4+l8BfgREPGQ6Az1H5sm8iuCRYuNdvvYz7bhTBvh3hBx2RYDWBgsVLXFzx0SiDLXKjBSGXHAaoCpKpTUxJShgkJwwIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cXz9wXrl; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cXz9wXrl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1926E1A0F78;
	Mon, 21 Sep 2026 09:09:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF36360339;
	Mon, 21 Sep 2026 09:09:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4AD01032918E;
	Mon, 21 Sep 2026 11:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789981770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gtewFrFoLI46IIrkL35plATPEcqBACBHV+ul81kZFSU=;
	b=cXz9wXrlOGUl3ndYbo+mmrZ0yX9qtyAQy2hzLflJbyzuK02fEsHXyfIg18KSJQQm0cS6B2
	UPREV+GDJVI0DIbKjz8VSluidzD+RnWMZvxhOCPszOg9+d0PsbsoQ49yT/knebrIZYTpH1
	0wWaslpyICzBgKYCq7xDrutvECbOtm06RqtV9zQNfgKb6/w7DZEohsD7bWb7PeVl1M5WLN
	WOR5EBUg34QMMTfhmjxWVfK9hm9QXDrbVz29tI/dgRP1+YG8R8k8rT6T7hyfkEOdjOZxVt
	OXBbdmcZV8+oBGlETjQbfdpRDzH03uo4WUntnaUdCNNoneSaY1Oqc/UXlYJK4A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: inki.dae@samsung.com, jagan@amarulasolutions.com, 
 m.szyprowski@samsung.com, Li Youhong <dayou5941@163.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Li Youhong <liyouhong@kylinos.cn>
In-Reply-To: <20260904014958.1572918-1-dayou5941@163.com>
References: <20260904014958.1572918-1-dayou5941@163.com>
Subject: Re: [PATCH v2] drm/bridge: samsung-dsim: fix TE GPIO lifetime for
 host attach
Message-Id: <178998176147.99293.14109429375573506716.b4-ty@b4>
Date: Mon, 21 Sep 2026 11:09:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Fri, 04 Sep 2026 09:49:58 +0800, Li Youhong wrote:
> When the Exynos DSI driver was generalized into samsung-dsim, the TE
> GPIO acquisition was switched from gpiod_get_optional() to
> devm_gpiod_get_optional() while keeping the matching gpiod_put() calls.
> That combination is wrong for a managed descriptor.
> 
> However, dropping the puts and keeping the managed get is also wrong:
> samsung_dsim_register_te_irq() runs from the DSI host attach callback,
> and host detach/reattach can happen without destroying the device that
> owns the managed action. A second attach would then request the GPIO
> again without having released it.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: samsung-dsim: fix TE GPIO lifetime for host attach
      commit: ada667890773e033d2f40dc94176e3beb930b516

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


