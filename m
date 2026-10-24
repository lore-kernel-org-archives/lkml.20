Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792860841;
	b=yMUygnKN41BhIu3YH0EfGsYo72hoB2JuYK+Hv2GHo5wRgR0xte/klMDVKoIZaiyg34gk
	 AVS7hKcNyx9WAdqiQKax34Vu63IvH1SnFmVtNBPC6mo3I3SleHNCKxUAAyUOwrIWocNsn
	 BjcrBYA2t5ZhUebkJSGilFwZzqSZgnthdG8HVc8aQYnxq9KbEGkcsm37AVjdDadsckvDF
	 RtK0/rUk0ioU3tN99mx3rZ2SR2Mivgd5vW3C2392nFBNAhpx7jaBdXq7WPYw46ouqkoiN
	 mnrBgusWLZpDZG8sul8CWu3cHgrLtY/5+88kp+yy4g4Izej4O9x9dNHF3W4LPGoXSSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860841;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=xJOdXAoONoUMO2eVbHGOOuuM5yFrNx3ef+Kio9IwuqY=;
	b=TcKMk3/7PFDHmFLPbNr6SosQDRRS4KnHy/e/pMxW8l3VEYoklfp+O8uF0cLB3j9Ja5JX
	 TstuD1k8dwYdjy2ys5LmD4T7gYO0tV4J5mTA+rIX0f7sGYAz7g0RVL7wUg0gsiXwrszAW
	 1NZJBiR4qO++AgTFc4Dnhu01KSCvB7vX2wr2NNeOl0PFBKi1luQZWDSanL/6pPRZqNHsi
	 Y2Y2GZImIcOV6fYP9QQuIEqSNgx3C+8qjrEwclnOXtwizWrYK2bWOWj/pBeGbTYvVV9AY
	 sw3W/GqdC25lX1PilcmZt1bkRlslLzL9UJ6De4OD2FybKLWpxB57MZOOEY1aZMZnykg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b="I3jt/+R8";
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36265606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36265606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=I3jt/+R8
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jBmF14ZRQzKmy7;
	Sat, 24 Oct 2026 18:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1792860837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJOdXAoONoUMO2eVbHGOOuuM5yFrNx3ef+Kio9IwuqY=;
	b=I3jt/+R835HPi269yYQlQYE/skyg3vQcvIcpwW7WL/0CdXKaRTTMomC2xPMPJXgBbgE9kz
	3J8gqH1B1qDgTdLSR1J6lgG05p5GAMQgjl1EfWYDBhGAw/8uJCUiTSevqgl+8nL493a3KC
	tRZh0EvsOjHkrlx5+ydob3LqHnmxYcALxE4RHFYY4FhDCoydg3hZ34DF6JMft99Sy5uR8L
	M/Qd9PpHxwrN+25NSE+AzShT9aB6aALz9k4SJN97Y1K4AWXDrkqJ+ZussVL+ses866n8o3
	4zZJgeo8IUGXTsgNtT8gt1fh9ItBbSorn/34rg+eMyVX9VrpqEhXNi8g9aPp9Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	ville.syrjala@linux.intel.com,
	jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH v2 0/2] drm/client: Keep larger modes in connector->modes on fbdev hotplug
Date: Sat, 24 Oct 2026 17:53:53 +0100
Message-ID: <20261024165355.2782145-1-hugo@hsal.es>
X-Mailer: git-send-email 2.55.0
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
X-Rspamd-Queue-Id: 4jBmF14ZRQzKmy7

On an ASUS ROG Flow X13 with a 3840x2400 eDP panel, booted with
video=eDP-1:1920x1200@60, an HDMI hotplug makes fbdev reprobe every
connector with its 1920x1200 framebuffer as the limit. connector->modes
loses the panel's 3840x2400 mode, and after suspend/resume amdgpu drives
the panel with the 1920x1200 timing. The image ends up squeezed into the
top-left corner. Details are in
https://gitlab.freedesktop.org/drm/amd/-/issues/5983

Patch 1 makes drm_client_modeset_probe() probe with the device's
limits and moves the framebuffer size check into the fbdev mode
pickers. Patch 2 adds KUnit tests for it

fbdev's hotplug probe has passed the framebuffer size since 2010
(4abe35204af8). The pickers didn't check mode sizes then, so leaving
larger modes out of the list was what kept fbdev from picking one. They
check the size themselves now, so the probe can use the device's limits
like initial setup, drm_log and GETCONNECTOR already do

The HiBMC thread "[RFC] drm/client: Relax clone mode selection in
drm_client_target_cloned" runs into the same pruning: its 640x480
framebuffer removes 1024x768 from both connectors' lists. With this
series userspace sees that mode again, but fbdev still can't use it, so
this doesn't replace that RFC:
https://lore.kernel.org/r/a48e0b33-7eab-478e-a396-b6e76b7a066f@huawei.com

I sent an amdgpu fix for the same symptom separately. On eDP and LVDS
it makes amdgpu fall back to a mode of the native size, or to the
encoder's native mode if the list has none:
https://lore.kernel.org/r/20261024163347.2413649-1-hugo@hsal.es
This series fixes the shared mode list for every driver instead. Either
one alone fixes the reported bug, from my testing

On amd-staging-drm-next with only this series applied, with an HDMI
hotplug and suspend/resume (pm_test=platform) in a loop, 255 of 255
resumes kept the native timing. Without it, 28 of 29 came back with the
wrong timing, and the same loop on unpatched v7.2.8 got it wrong in 103
of 103. The drm KUnit tests pass, also under KASAN, which reports
nothing in the code this series touches

Ville, you said the approach should be fine. If this matches what you
had in mind, I'd appreciate an Acked-by or Reviewed-by

Changes in v2:
- Tests: free the picked modes through a KUnit cleanup action, so a
  failed assert no longer leaks them, and assert only after dropping
  mode_config.mutex. Both came from Sashiko's review of v1
- Tests: add a firmware config test for a tiled connector with missing
  tiles, with and without a non-tiled mode that fits
- Check the size of the CRTC's current mode before
  drm_client_firmware_config() falls back to it. Without the 640x480
  modes, a DisplayPort sink with no mode that fits could reach that
  fallback with a mode larger than the framebuffer. Sashiko found this
  on a local run over v2, and a new test covers it
- Don't use the firmware config when a lit connector ends up with no
  mode. Accepting it would also skip the fallback, which may light up
  other connectors on that CRTC. Sashiko found this on a later local run
- Sashiko also found a NULL modes[i]->name print in
  drm_client_firmware_config(). It predates this series, so the fix
  went out on its own:
  https://lore.kernel.org/r/20261022114356.669988-1-hugo@hsal.es
- Rebased onto drm-misc-next at cf5d8e390e2a
- v1: https://lore.kernel.org/r/20261015212545.1989962-1-hugo@hsal.es

Hugo Sales (2):
  drm/client: Probe connectors with the device's mode size limits
  drm/tests: Add KUnit tests for the client mode size limits

 drivers/gpu/drm/drm_client_modeset.c          |  72 ++-
 .../gpu/drm/tests/drm_client_modeset_test.c   | 498 +++++++++++++++++-
 2 files changed, 550 insertions(+), 20 deletions(-)


base-commit: cf5d8e390e2ac2cfa24a50645efdbb9f0eebe65f
-- 
2.55.0

