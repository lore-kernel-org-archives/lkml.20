Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367355;
	b=0kOnEcE754QrSEnOvMclLzmaChFRnEJ4hNryaxj0TFtoIh5pnEkQ+sn9f/lrIAumrhHh
	 5GboevK8d3s+URlEp3Qfb52GDMeSm9yR0dCcATQyz4fRMWEpLJE6wr4b7l5ZlB4OhaGVK
	 q2b8MaqxAyLFsyaRJ2V3726H4WicvMo+HlQWRon75o98+3Didumx4HhxRxaic8azLp7OK
	 TGnhyU5yIi2ds51AsAupKrUvYkw68eClzA9zlw786gWvkGUD14tpcLELMQT2KeT4W7OX7
	 1DpFBI9zAhYaW1xZT25DQsAep9dGtYNWrYAafz1FWdaIWs+/rysLF0gQPnj13iZ69lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367355;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NKmp+ui2Bo98qe07VUZSa+u7FLoONy+lMEEgOv7rH+E=;
	b=U86y50nSmaXtH3vnnjnPy8zt10PzY63qt2Fe2RwuALqYTvrNjoPyT0m8SD3K+CUtVN/2
	 rPJja9p1h3a715n2tJfaVsfoWfyTB+C2xQykudVeUHn7dpchDFxupDFmkflAb6F2P5/uA
	 pel7TLKKz7cESnSHeyvAb/gjEvkW+UyHadwZZpPxiikXCP1wzXBdW+nZWwUnTV8GJ9S0t
	 Ywa6e36U5j/ppuKjziYytYhByOqU7yR7m+ezFOovytmsy1O1pJzo++glrsGndZ29dmMvT
	 FZdvdV35lQHqiMwd8vM8c/G5JthB6vV3ZmZeSyZGa+ZIC4yovwcZh5MZKRhLae08nEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=a8sqbx3o;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AD7606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61AD7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=a8sqbx3o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=a8sqbx3oNNhXt0lqJ1Oxjxjwozq8dO9yMt7Z2eHUcN5GhpHTZGfVKfN2BUaOgM11ES27bKPL8uAYx
	 SIRIMgLuWtZ+MZeX7q7s1GSV7tlfLvQ/I04QNVltqxYIsn64Vww7MvseqcqvZAm9UDkFPo8mRkX9rV
	 VAdEBgeocndfTbUI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56ae49d338d7-7381f;
	Fri, 30 Oct 2026 21:35:49 +0800 (CST)
X-RM-TRANSID:2ee56ae49d338d7-7381f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[112.22.250.195])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6ae49d33695-0d785;
	Fri, 30 Oct 2026 21:35:49 +0800 (CST)
X-RM-TRANSID:2eea6ae49d33695-0d785
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: laixiangwu <laixiangwu@cmss.chinamobile.com>,
	dri-devel@lists.freedesktop.org,
	Lucas Stach <l.stach@pengutronix.de>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Fri, 30 Oct 2026 21:31:30 +0800
Message-ID: <20261030133355.1938-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <auRgElrEh0YlUaKc@vm>
References: <auRgElrEh0YlUaKc@vm>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,=0D
=0D
Thank you for the review!=0D
=0D
I've renamed the error labels as you suggested and sent a v2, which=0D
threads below this mail. Please take a look.=0D
=0D
Best regards,=0D
laixiangwu=0D


