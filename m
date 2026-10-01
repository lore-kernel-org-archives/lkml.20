Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C52E42C500
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841964; cv=none; b=DDfg8TVqI23WSPrzO0TvVWn+H/x5Zlshdb1qyHP3L6Rqrzp2eG9dsRdflMhgVZaf6eFaTqEhNg2CCtfCsrbdsrqpfRIVogGQlP7Un6s83X+FI1Xawp17jWNclCdfrEF0YFPvGO+e/I2zaI7/gZFltGYmkEhiVK0K4JBBn64aeUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841964; c=relaxed/simple;
	bh=HFACzAThRwF4HNWhXY+Az/0bPEtPTupok3k1g20gs/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dyPf8iZ1UUuaWnWyZ9TxkhR9tS34gDmf9MwsuCqLptipWkI6OrGZBb3UcLATp+dizWuthJT2B/NFP4kVXb1BixnPEDVqYTOA+DVPf0XdenzUbWHwN5ULaZnl4T6vY3Hr7b7rtynC13z4c1H/JRW4g3KQGzxo0EXPfJVMXYlizHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UUQVNnuk; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UUQVNnuk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D68B24E410F0;
	Thu,  1 Oct 2026 08:06:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2CAE60341;
	Thu,  1 Oct 2026 08:06:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A162A103292AE;
	Thu,  1 Oct 2026 10:05:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790841960; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7LxKkS3OIA86iEfYPpkA2C4DKR5gB3TTQi/gBFlt+qA=;
	b=UUQVNnukjjn8j6yk9Pplw+4ty1+2fd0IMaaKfWBl1Y2oucBOl5kGU5f3wzVPu4n6wRt0MO
	RpQMiVmRZPx6DFBpgMMiMnhm05WRQzsEn1OsuNhLntEWMZWsxkk53tg4aolZJSWq3Q4V7Q
	e7u5wOj8vIKqIQsG3gi0RwaUosB0I0qRdVDGHxfxGMe/u2Cd0afmkNyLuN12KwukNyHv93
	6yZVl7QLQf1H2YoQ9a/NE7+OyHAPBlFT+AzF5jJef1RxcT70aiFvh/RHKf3MBuFpx/4F9j
	ol73MgsyWlLh7AwUpX0r2cuXF2Vztj6zKYV+oqL3+82k0Lrj3a2QCtnPKjjjJQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sasha Levin <sashal@kernel.org>
Cc: "kernelci.org bot" <bot@kernelci.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260929114828.3260345-1-sashal@kernel.org>
References: <20260929114828.3260345-1-sashal@kernel.org>
Subject: Re: [PATCH] drm/panel: select DRM_KMS_HELPER
Message-Id: <179084195736.1090687.3586500502136676199.b4-ty@b4>
Date: Thu, 01 Oct 2026 10:05:57 +0200
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


On Tue, 29 Sep 2026 07:48:28 -0400, Sasha Levin wrote:
> Since the panel_bridge code moved into drm_panel.c, any config with
> DRM built in but without the KMS helpers fails to link, for example
> arc haps_hs_smp_defconfig with allnoconfig and the kselftest fragment:
> 
>   arc-elf32-ld: drivers/gpu/drm/drm_panel.o:(.rodata+0x28): undefined
>   reference to `drm_atomic_helper_bridge_duplicate_state'
>   arc-elf32-ld: drivers/gpu/drm/drm_panel.o:(.rodata+0x2c): undefined
>   reference to `drm_atomic_helper_bridge_destroy_state'
>   ...
> 
> [...]

Applied, thanks!

[1/1] drm/panel: select DRM_KMS_HELPER
      commit: 82e81301ef3b2c7345702c9d5e7374492680df20

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


