Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AB647B422
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913698; cv=none; b=UH/HC2KVN8tw5aymI2+IZuZymcr7yt9T3bhhuh5FSKD2y1tSt3BpRt6+J3IA219bj7PEt1ttNeHuaOT0YGZ8Gfmv6Sl+u5lcMUN1wPMO3E5DqvATH8oyAqeozIVgNjfEXfK85hADNoW4fZ1ousLRcokUiLQbEAhktLdpDp4kQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913698; c=relaxed/simple;
	bh=KwVyc+UZxSyPulalJiIfQDSpW5VWlWPkX8fI9nD9/6I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NKxMhuuX/mF9eOqcW3DmL/5MXqwt9Tz5caIQ9xJnHt+MHGXzzQdiKQxahE9ziPqcQbdk2789KRwDYy4VRIeFSNy2BsV/xoH2y+JWxQUlQJN+XzlDFMueRykxlXcS6Zhw5vhN8qAwhWfaPLGPbtUaaIaYK5QZFkOE13A4bdsO+LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KZ8ei7+/; dkim=fail (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xtIvgHpX reason="signature verification failed"; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KZ8ei7+/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xtIvgHpX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0D111A1218
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:48:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A594A60362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:48:12 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 2067711D70C37; Tue, 13 Oct 2026 19:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=OsSk6fybrLW7h+SuC2ZBYJe33YpZ++JFMz5eFq2VUKg=;
	b=KZ8ei7+/CDhCgrldfcEE2+usDBH2HOp2QeE2WuJ+Q1BjsbFJWxjfwFQx/W7e0dWG+c3owO
	mU0zRcUryMG4FTTMrT5maxLEHYGIi4WgEJHU4VLP+vLNUf+1G7/mV6kaLywoOgn8Wow+6T
	6VEZW8Lt2cNMHaNGRF8MxoZ40Le7xaiyhYLM8UKtOY5wC2OWIeUGxxspwraDNCcHcshLVN
	m/A8zn8H8r/8QnpQFta85UHLc+kdpkYEJ0sCgIZQvAs0jTncSz6cuRg73Jshkfb5NlaJP+
	406aUqJoS5475HU3pbPj9DXnEZWFJkowGKZKCs1OLBqFwnoaL7yGrhhzxhhKsw==
Authentication-Results: mail.galae.net;
	none
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id aFjoM/XuzGpsHhEAtaWaaQ
	(envelope-from <luca.ceresoli@bootlin.com>)
	for <luca.ceresoli@bootlin.com>; Mon, 12 Oct 2026 16:30:13 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 888F911D70CC0;
	Mon, 12 Oct 2026 16:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791815408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fHD6zSsrxg7Ukx1n42kcY5qUaVBs+GhRS0EahN2FxFA=;
	b=xtIvgHpXYfpGGsRXyeI0tHz7zvmhiVQ9R3X41/ulmzClKScwiaOrzCOg3qyRTKnkavQr8A
	9/HLZtBNs12hkVPqh5251D4NU7YlBnG6/TpDHuSJjBACiCZK+xQs3ckyfgGirasopK+Yqh
	XrKenCO0HbUSQkEh93WRwcGT63m8W75o9zeTINXObRQIpDeSsDlx1j/kdOzjl1HxlmduoP
	BwepzRpfbTUkNhAXmkOqQRv1hSWuTKW9mlkzZsm7HshZqysdlZ0q76yQ0MhUtRkmvZRK77
	J8OBVo2KIEADkLH78ALqnw6bNakQ4aVDRZdVdNuRZQczC6j7nslIltR2KpK3fg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/3] drm: docs: mention currently recommended API instead
 of deprecated ones
Date: Mon, 12 Oct 2026 16:29:50 +0200
Message-Id: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAyF4VcZuTawFtTpq4gXbZpqZNaSuKGMv
 btVLz8O/GcBYxU2OHYLKM9i8igNbtMBXUO5MEpqBt/7neudx6R3jCqpLTyzvrGGwiPSyKFM1TA
 ftj7mwQ97ImiVqpzl9Xs4nf+2Kd6Ynt8srOsH0wM+aIMAAAA=
X-Change-ID: 20261012-drm-bridge-every-panel-cleanups-f952bf8287cc
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-TUID: eSJyxltFBzko
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 2067711D70C37
X-Spamd-Result: default: False [2.50 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[27];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[40.79%];
	BCC(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORWARDED(0.00)[luca.ceresoli@bootlin.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[luca.ceresoli@bootlin.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[gehealthcare.com:email,localhost:rdns,localhost:helo,suse.de:email,ffwll.ch:email,ideasonboard.com:email,intel.com:email,linaro.org:email,iscas.ac.cn:email,lists.freedesktop.org:email,kwiboo.se:email,galae.net:url,bootlin.com:email,bootlin.com:mid,bootlin.com:url];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[]

This series replaces references to deprecated functions in the docs with
the current recommended API.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (3):
      drm/bridge: stop mentioning deprecated devm_drm_of_get_bridge() in docs
      drm/panel: stop mentioning deprecated devm_drm_of_get_bridge() in docs
      drm/drv: stop mentioning deprecated drm_of_find_panel_or_bridge() in docs

 drivers/gpu/drm/drm_bridge.c | 5 +++--
 drivers/gpu/drm/drm_drv.c    | 8 ++++----
 drivers/gpu/drm/drm_panel.c  | 3 +--
 3 files changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 73df79cceb8c01f311055a61794e229dc81546cb
change-id: 20261012-drm-bridge-every-panel-cleanups-f952bf8287cc

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

text:
Return-Path: <luca.ceresoli@bootlin.com>
Delivered-To: luca.ceresoli@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id aFjoM/XuzGpsHhEAtaWaaQ
	(envelope-from <luca.ceresoli@bootlin.com>)
	for <luca.ceresoli@bootlin.com>; Mon, 12 Oct 2026 16:30:13 +0200
X-Original-To: luca.ceresoli@bootlin.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 888F911D70CC0;
	Mon, 12 Oct 2026 16:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791815408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fHD6zSsrxg7Ukx1n42kcY5qUaVBs+GhRS0EahN2FxFA=;
	b=xtIvgHpXYfpGGsRXyeI0tHz7zvmhiVQ9R3X41/ulmzClKScwiaOrzCOg3qyRTKnkavQr8A
	9/HLZtBNs12hkVPqh5251D4NU7YlBnG6/TpDHuSJjBACiCZK+xQs3ckyfgGirasopK+Yqh
	XrKenCO0HbUSQkEh93WRwcGT63m8W75o9zeTINXObRQIpDeSsDlx1j/kdOzjl1HxlmduoP
	BwepzRpfbTUkNhAXmkOqQRv1hSWuTKW9mlkzZsm7HshZqysdlZ0q76yQ0MhUtRkmvZRK77
	J8OBVo2KIEADkLH78ALqnw6bNakQ4aVDRZdVdNuRZQczC6j7nslIltR2KpK3fg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/3] drm: docs: mention currently recommended API instead
 of deprecated ones
Date: Mon, 12 Oct 2026 16:29:50 +0200
Message-Id: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAyF4VcZuTawFtTpq4gXbZpqZNaSuKGMv
 btVLz8O/GcBYxU2OHYLKM9i8igNbtMBXUO5MEpqBt/7neudx6R3jCqpLTyzvrGGwiPSyKFM1TA
 ftj7mwQ97ImiVqpzl9Xs4nf+2Kd6Ynt8srOsH0wM+aIMAAAA=
X-Change-ID: 20261012-drm-bridge-every-panel-cleanups-f952bf8287cc
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This series replaces references to deprecated functions in the docs with
the current recommended API.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (3):
      drm/bridge: stop mentioning deprecated devm_drm_of_get_bridge() in docs
      drm/panel: stop mentioning deprecated devm_drm_of_get_bridge() in docs
      drm/drv: stop mentioning deprecated drm_of_find_panel_or_bridge() in docs

 drivers/gpu/drm/drm_bridge.c | 5 +++--
 drivers/gpu/drm/drm_drv.c    | 8 ++++----
 drivers/gpu/drm/drm_panel.c  | 3 +--
 3 files changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 73df79cceb8c01f311055a61794e229dc81546cb
change-id: 20261012-drm-bridge-every-panel-cleanups-f952bf8287cc

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

