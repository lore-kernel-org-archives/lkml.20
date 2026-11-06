Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981864;
	b=yND+MLv6ASQ3dAXLSDLiZWb6v5gE1K4dMmCZfuuZM3cDBajSWkidqUVejo2sdRzqM/g9
	 veM74GtASVcZ6q/ccuBVYGYtruNhF1eZt9pNbSxo/uWIB62Vak4VK9ateOBoem3+KnPFt
	 yQq4LBpkJov3tIElvLytN8eDvgW/tDbWzHWfzNcOQoeiCxyGCMRMRzO1At5aIuRm/v76i
	 18PFrgs0Eew22cn20x/HMQSGHBc2NV2J62Ix3LWqkx2hrrjhEleIBT28brxhGGYoPVq7D
	 DN027dTPGa9PJkUrMiPCDilnaydp8LqYEufW54WabA+khsC5z/UhODTlbqBJncJ60Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981864;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=dzJFO/S+7wj28zkoa8OYMaOX0CGTMgtEm0abeBbxaag=;
	b=E1lCTWgnih3Q1eB4q36ZTwnL+mBhdt71HuAX3rBLNu6UoBg1OicRtVXNqXYzqrEKiu95
	 5zCBhPQvdFkGjlABFwROb/3v/ntB2Diy5ppyfw2tDrGcVXJ9B1wQjh86fBtQ2F+nMPmqq
	 mKyDMaQi0EgolWuUFHQ/q25HhCixyz8EXZkGngbmZXsjLQ+1Lec7sAVM/Sgy1aav+VIzW
	 lRaMYflv7J7JIo0CkmZE0UpP6U6NLOSVFdROE6zaQYGFlDDLPMMgZLO3ZcthwduvfjNQi
	 SZV5eIZCiYinSNxGtPcd58tHrQJQySvrNLKeh0YbLuLIWXR/MdUWi9ktjbI8wYw7COA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W9m7kDZV;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58708606A32D;
	Fri,  6 Nov 2026 16:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58708606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W9m7kDZV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DCEE8C69169;
	Fri,  6 Nov 2026 16:17:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 27FBE5FFBC;
	Fri,  6 Nov 2026 16:17:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0748103291BA;
	Fri,  6 Nov 2026 17:17:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793981854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dzJFO/S+7wj28zkoa8OYMaOX0CGTMgtEm0abeBbxaag=;
	b=W9m7kDZVuK5V/pTrifvzwAK7qqMYgQeVyTZNrHKeSIqBRzEgAj4Yr269jjOfHH18Alto5h
	H8o3HyPhrxQfQXYzZdS1HnNae/LM/L1OvKI2XNDu9fp0HBmTE6oi+JSExaVbatcn7uqntS
	hYA22kZnfDIyHctBc5qz4AcAdcelv96BzvLqkEZ+R3f39s1DPSpLHgEruianXC6GfIz510
	fddVSC3bobRurQmx4bRYU2nNWl2PAR3FEzJiXbM1zpfkV/1j5RgUbFuRr7tLd5DdMu1q8+
	3CN9eAzsJgHrxfgwvjcmg4c71GNqRLhwRkP18THra0Ig+Jbtrcx7EnpGjfFxoA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/3] drm: remove drmm_of_get_bridge()
Date: Fri, 06 Nov 2026 17:17:03 +0100
Message-Id: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-0-c0ea3382b798@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNQQqDMBBFryKzbiBxodirlBISZ2KnNIlMVAri3
 Rtbunz/wX87FBKmAtdmB6GNC+dUwVwaGB8uTaQYK0Or284Y3SmUqGaX6GW9MFYvFPNG5x5tDna
 i5W/6wXjUQTsceqiHs1Dg9zd2u/+4rP5J43IW4Dg+lAabPY4AAAA=
X-Change-ID: 20261106-drm-panel_bridge-remove-drmm_of_get_bridge-791bd0f0ad97
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

drmm_of_get_bridge() is deprecated. By now it is just a complicated wrapper
to of_drm_get_bridge_by_endpoint(), and it does not implement bridge
refcounting. Replace the only user and remove it.

== Grand plan

This is part of the work to support hotplug of DRM bridges.

Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. ✔ protect encoder bridge chain with a mutex (v7.2)
       7. ✔ of_drm_find_bridge
          a. ✔ add of_drm_get_bridge() (v7.0),
               convert basic direct users (v7.0-v7.1)
          b. ✔ convert direct of_drm_get_bridge() users, part 2 (v7.0)
          c. ✔ convert direct of_drm_get_bridge() users, part 3 (v7.0)
          d. ✔ convert direct of_drm_get_bridge() users, part 4 (v7.1-v7.2)
          e. ✔ bridge-only drm_of_find_panel_or_bridge() users (v7.2)
       8. ➜ panel_bridge lifetime
          a. ✔ cleanup DRM_PANEL in bridge drivers (v7.4)
	  b. ✔ embed a drm_bridge in every drm_panel (v7.4)
	  c. ✔ remove *_of_get_bridge(): non-OF drivers (v7.5)
	  d. ➜ remove drmm_of_get_bridge()
	  e.   remove devm_drm_of_get_bridge()
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. ✔ handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_bridge_enter/exit() to protect device resources (v7.0)
    B. ✔ Add drm_bridge_clear_and_put() (v7.1)
 3. ✕ DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. ✔ Migrate i.MX LCDIF driver to bridge-connector (v7.2)
 6. … DRM bridge hotplug
    A. … Bridge hotplug management in the DRM core
       1. ✔ bridge-connector: attach encoder to the connector (v7.2)
       2. … drm bridge hotplug
    B.   Device tree description

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (3):
      drm: adp: stop using deprecated drmm_of_get_bridge()
      drm/panel: remove drmm_of_get_bridge()
      drm/todo: remove drmm_of_get_bridge()

 Documentation/gpu/todo.rst    |  1 -
 drivers/gpu/drm/adp/adp_drv.c | 13 +++++++++----
 drivers/gpu/drm/drm_panel.c   | 40 ----------------------------------------
 include/drm/drm_panel.h       | 10 ----------
 4 files changed, 9 insertions(+), 55 deletions(-)
---
base-commit: 4524052b65a75166c1c557921c786bd82302de13
change-id: 20261106-drm-panel_bridge-remove-drmm_of_get_bridge-791bd0f0ad97

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

