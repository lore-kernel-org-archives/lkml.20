Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3533D7D6C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563543; cv=none; b=k8WToE39RyMAxEvBfQ8GTiZyeNSqSH5emAiEUZIAKxkFKiRjxDdMCu5sISvOG6Aj7/DFBpR4S7Ic68wssDjn44ox3/d3B6xSH8YdvrPmwp/5W6dJU8bcjCGlPHWnESTVqX2E7wzwmPG6Q856NnCAQj50gslBkLvNsAxPteWNxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563543; c=relaxed/simple;
	bh=Wym/t1G2LmbgCSs1bBeauEFr7SmUi6NjqWinScJBU64=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z5u/0wv8qDbDL3alod1ALXjus9ZdbyxGJzFKY99BCdzfm0bcxO9Wcj+pjnI16Gndo/PUdAr1Zer5hTkv4D97SO8/MKMUYISeHga7s6jmPm85mr2z9UyevVYrm6UGFAIIW/lxBn8tuc0HeMOfvVxnRwxZVoHi/a+tOUeKpxo+4fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pK3r9GXh; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pK3r9GXh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3C114C5CD58;
	Wed, 16 Sep 2026 12:59:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E34960337;
	Wed, 16 Sep 2026 12:58:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF91A11C7B026;
	Wed, 16 Sep 2026 14:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789563534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lAtwGYoWQXq96+JGmh19RpCOxihvyL82+P6fbhIjFa0=;
	b=pK3r9GXhKxqvNBh+uXILARiAUr9bhSEdv0vJJifmx/ebx+SuLs+bXIXjJy67VEPVdgnY1Q
	7AkcL2rt0Y/jStyrLfNUVtlBPHpGJgYBVSICCCf+NjobsPdCflSSuWXP3urs6IPIkzxjH0
	DQUtAWbfaBGfTCMmqH3LqypBrXnm+oWtWU13ywX7j4qapnCiJVfeYWsqy8QZnLeW/GiTJn
	9f89qVNrRoVk+uyxjhV8MC1TbpoE6KwvTXhPaLyOVVGyXZGmC7Wvo2c6e6HGScC4G2xxzU
	LDD91wzOvieAN+EQVb76w9XKzpZjBKCJLgg9KKhq3BeVvFbIBwcrc+xb3UdmOA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
Subject: Re: (subset) [PATCH RFC v2 00/19] drm/panel: embed a drm_bridge
 into every drm_panel
Message-Id: <178956352643.382952.1141486827113876827.b4-ty@b4>
Date: Wed, 16 Sep 2026 14:58:46 +0200
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


On Thu, 03 Sep 2026 10:11:03 +0200, Luca Ceresoli wrote:
> This series embeds a drm_bridge into every drm_panel, as previously
> discussed [1][2] and in v1.
> 
> This will allow bridges and encoders to interact with the next pipeline
> component always with the bridge API, not caring whether it is a panel or
> another device (e.g. a bridge from a bus to another bus).
> 
> [...]

Applied, thanks!

[15/19] drm/omap: dsi: remove unused includes
        commit: dd8950786bd24315d1a650b1b3c6ebe7ff026e76
[17/19] drm/tve200: remove unused includes
        commit: acb05c825e393b0584adb5472bfbb17c8033a99f

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


