Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D200548F02B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841453; cv=none; b=EElQcE07YhKoViDVsDQshXKt+RAvjPxfkH9QhoekY0VViOErHEHtU9UvKF64V7Tyt+bUXmPdDUy83Sti0sf7Xci923f9c41/oUNMlrXfCKn9pnoFkS0938UeYbdPKwkeldM57Px3BYGY7OKBTI0aOEFfaEYobOqM6orHJWFZZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841453; c=relaxed/simple;
	bh=q9gtPF2hDL/OuVu1BG1f1pT6Sj8g4QIlRciGT765Wmw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LIPy/135zlP5D2wfmEhWR9E8NKSAyqW1H6hW3KjqYAASwq1qBlui/ApoJG0lwvMdW0If1vjv/EEHqJjEq21NOqxxEyUQvN7ffx4nF3me1x00kAMX7rIGO/EXecoS0pdZT1co6xdSyRvE/+9L4Y8rAyGI3dre4aJSYsrzcUAcFNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xhGFSjFe; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xhGFSjFe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EDA9E4E410EC;
	Thu,  1 Oct 2026 07:57:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B57E660346;
	Thu,  1 Oct 2026 07:57:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4CB81032989B;
	Thu,  1 Oct 2026 09:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790841447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ea1fbe+c1Bj2VsRfvIM5hRTESNst+GdPGcpUsHtDn1s=;
	b=xhGFSjFeLsF3SZONrAZrzTJVCqVwIvWnYEHDHUlJoJmsYayI0bwZsvuZnf3d+LHraIYpd+
	dEiR+rfJfjqirMbA041CebIgW2HYLZ10HLWzAqOkI3JM3rgwn7LDAgXrqpEwHt9ivewXax
	it2Qv3MSBzzPJw2imwd32vLJzFZim3vFO1MEQETjsNaEkdfg/bbwBz42wyD2bMUxDZg1yE
	tJguCgn7hybaTONn2X7pzga6vrDtHbJkKNP3CNuDaTOnFNgSjqIb+7sS4rDKlfbWFhHtCJ
	/LE7fNMo1bPQzByQ7cL+9x01d5ryHIuqwb5CoI7hHoDnRIw37h47fUswcRb3mg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
In-Reply-To: <20260928210326.1526997-1-rdunlap@infradead.org>
References: <20260928210326.1526997-1-rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation/gpu: fix location of drm_panel
 kernel-doc
Message-Id: <179084144262.1017724.17529088161372803961.b4-ty@b4>
Date: Thu, 01 Oct 2026 09:57:22 +0200
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


On Mon, 28 Sep 2026 14:03:26 -0700, Randy Dunlap wrote:
> The source file location was changed, so update the documentation
> accordingly. Fixes these warnings:
> 
> ERROR: Cannot find file ../drivers/gpu/drm/bridge/panel.c
> ERROR: Cannot find file ../drivers/gpu/drm/bridge/panel.c
> WARNING: No kernel-doc for file ../drivers/gpu/drm/bridge/panel.c
> 
> [...]

Applied, thanks!

[1/1] Documentation/gpu: fix location of drm_panel kernel-doc
      commit: aefb99d4406ee2f3f22b1b4211717a194262e8c8

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


