Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786124;
	b=q5onlwxbpOc0tYm/jLk9L2whO0/WaA0EnG/dIFTPcUet1+F1Z0fl2cfVMIzl+iZuVoIV
	 XV1+ZE+W+4YEMmTgvF0l/MgT+N0VboBpLS0qhKst4kKz2OkaYSZM0F0Sy7puGK4M4xBty
	 XM5GbOOl8YjxXRuRL4n6AtPo7nBG2aQW9rgjYp5GPBNj0+XCPzMJhDgFJT4ATeY8BY8tb
	 pmo1uu/2on1CHw0MktldtcAWzwRfhPsbEwErSdQWLbT9hLX+LnFm3oe7adTO93Qau8PX9
	 7TQtojXzyMf13R6Hc7eWvoZ3aT69FWHX3jJbMWzwZ7ebNzW+ypjse3BxA2AqjFITy6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786124;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:X-Change-ID:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=tTTrorNZwRFZQ3C5GMIr2j0fiftd0rO3TifOHjXOs+s=;
	b=0/I+aZ0UZBWUUBwVMDZojoW9TmKrpbMfa9u1gC8phPN7iL7n06yl16kqiF7DudJjBJqD
	 pteFmgRezudKhJq36RyeLOIQgKTyPJL/W94/GKQfugo7MqMHgH8c47AFNn4VjQTYJF8oL
	 F9G/awpIt9RN6qv8vlLYFz25jGQh7gFMVOnh/wP2jDKAypDhz2SPLPySltjUDvEnXl7IJ
	 sOcApqXniGi3e04UjY4ki9RP+qQgxTE1gEcDd+RNyUo/l32mek5M6kWBrerpbWu4/9UQ1
	 R0RmP7A/GZZW7CHOLgOwLwVmOwvxgBKGM1F2X1+QmLwZ21P83aoaFj8yhk2cReOfv8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=qG8csFas;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DDB606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DDB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=qG8csFas
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jKLQt4xXCz8scv;
	Wed, 04 Nov 2026 10:55:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793786118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tTTrorNZwRFZQ3C5GMIr2j0fiftd0rO3TifOHjXOs+s=;
	b=qG8csFasliUkjr6qLe1MZJQ0AKgWA8Hq+7uAnAky9SA/5QxEyTkfe2klIrFgjQnswbQHih
	g2BQ0aha6vbVFlVQQ6ugRYHYGcC7aooELddgR/mX7K9N5N87RCB0IsS8ha5WHoiQMWfe/C
	/ukb79PeE0eIli1RhIynoxAQTcB3I0e2nf5crOjjSyzmWGLgJpTmAb2gSaUbmZ6WQ4Axb4
	qvz4+P3h0TSGmFBsMbFdWgdP+xEZPTKNAj2h59gUfDlmoaq5cMbJ8efwDERRsWEmfThBPv
	Sd7QmBgVmRiLMGAQ2YmJdaBrHBrb0Bad3g/pUOp6t8hytMltlsiGwmdABkP8BQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: alexander.deucher@amd.com,
	sunpeng.li@amd.com,
	harry.wentland@amd.com,
	siqueira@igalia.com,
	amd-gfx@lists.freedesktop.org
Cc: Hugo Sales <hugo@hsal.es>,
	ray.wu@amd.com,
	simona@ffwll.ch,
	alex.hung@amd.com,
	mario.limonciello@amd.com,
	linux-kernel@vger.kernel.org,
	lohita.mudimela@amd.com,
	bhawanpreet.lakha@amd.com,
	dri-devel@lists.freedesktop.org,
	roman.li@amd.com,
	airlied@gmail.com,
	christian.koenig@amd.com
Subject: [PATCH RFC RFT 0/8] drm/amd/display: Stop rounding backlight levels to whole percents
Date: Wed,  4 Nov 2026 09:55:08 +0000
Message-ID: <20261103-backlight-curve-rfc-v1-0-6e4813a8f2eb@hsal.es>
X-Mailer: git-send-email 2.56.0
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
X-Change-ID: 20261102-backlight-curve-rfc-1bb4b6dee24c
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5393; i=hugo@hsal.es; h=from:subject:message-id; bh=PQsx1IGMpofUteuFxti+4cBxlJh3BV6RNADrUVGGk00=; b=kA0DAAoWfQx+r8nYNaAByyZiAGrqDFqiD1U5arqjNLF1t7Ag6L4243Zv09upUqhQQSay70qxM oh1BAAWCgAdFiEELdhJAASRk5lscuekfQx+r8nYNaAFAmrqDFoACgkQfQx+r8nYNaBOIgEA1pRf USzLduOXx5VknDn/4CGSTc9sUZOlqDQnnKXf6lIA/0RZnUq4WkKYzP/nuYMezgAXg3IrREZNWLK 7Ku3tMggO
X-Developer-Key: i=hugo@hsal.es; a=openpgp; fpr=193D095149CF7E8737B39064D912B0DB205A91C1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jKLQt4xXCz8scv

Both backlight paths in amdgpu_dm_backlight.c map the 16-bit user level
through the ATIF custom brightness curve, whose points pair an 8-bit
signal with a whole-percent luminance. Both round the level to one of
those signals and the luminance to a whole percent first. That hurts
most at the dim end, where one percent is a large share of the light.
With the curve of an ASUS ROG Flow X13 GV301QH, minimum 12 and 49
points:

- On PWM, the lowest level asks for 2% of full brightness, and the
  first 2% of the scale steps from there to 3%, 4% and 5%. Each step is
  50%, 33% and 25% brighter than the one before. The bottom 10% of the
  scale has 18 different brightness values
- On AUX, with amdgpu.backlight=1 to force the unsupported AUX path,
  the 1..512 nits fallback range stays at 1 nit for the bottom 6.1% of
  the scale, and the next steps go to 3, 5 and 7 nits. The bottom 10%
  of the scale has 4 different values, and the top stops at 496 nits

This series interpolates on the unrounded level and rounds once at the
end. On PWM, the power module also interpolates between its LUT entries
now, from millipercent to PWM and back. The bottom 10% of the scale then
has 6018 different values on PWM instead of 18, and 33311 on AUX instead
of 4. Level 0 still gives the panel's minimum and the top level gives
its maximum. On AUX only levels 0 and 1 now sit at the minimum, instead
of the bottom 6.1% of the scale

- Patch 1 renames the min and max of the user range to user_min and
  user_max, to avoid confusion with the curve's signal_max and the
  output_max that patch 4 adds. No functional change
- Patches 2 and 3 interpolate between the power module's LUT entries,
  from millipercent to PWM and back
- Patch 4 stops rounding the PWM path
- Patches 5 and 6 test the PWM path and the LUT with the GV301QH curve
- Patch 7 maps AUX through the same curve code as PWM, which reaches
  max at the top, and removes convert_custom_brightness()
- Patch 8 tests the AUX path

Patch 7 changes what an AUX panel gets. Until now an AUX level asked for
the curve's luminance percentage times the level, so the level went in
twice. Now it asks for min plus that percentage of the range above min,
the same luminance the PWM path asks the power module for. On the
fallback range, half the scale goes from 159 nits to 315 nits. I found
no reason for the old product, but I may be missing the intent. I also
can't test it meaningfully, as I don't have a panel with an AUX
backlight

The series applies on top of "drm/amd/display: Fix the doubled AUX
backlight minimum on the custom curve" [1]. That series fixes the
minimum going in twice on AUX, and asks whether the ATIF curve is meant
for AUX at all. Patch 7 keeps applying the curve on AUX, as the code
always has. Since it changes what AUX panels get, it has no Fixes: tags

One question for you: on PWM, above the last point the curve still runs
to 100% at max_input_signal, as backlight_signal_to_luminance() did,
while the level maps to the 0..255 signal scale over the whole user
range. With max_input_signal below 255 the top of the PWM scale is flat
at full brightness. AUX keeps ending the curve at 255, as it did
before. Should PWM end at 255 too?

This is also a request for testing. My laptop drives its panel over PWM,
and the panel ignores AMD's AUX brightness, so I tested the AUX path
only with KUnit and with the amdgpu_dm_brightness trace on a forced AUX
path. If you have a panel with an AUX backlight and an ATIF custom
curve, a Tested-by on patches 7 and 8 would help. The middle of the
scale should get brighter, the bottom should no longer sit at the
minimum and the top should reach full brightness. Patches 1 to 6 don't
depend on them, so they can go in without the AUX half

[1] https://lore.kernel.org/r/20261103-amdgpu-aux-curve-min-v1-0-62119efdcc6d@hsal.es

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
Hugo Sales (8):
      drm/amd/display: Rename the user brightness range to user_min and user_max
      drm/amd/display: Interpolate between backlight LUT entries
      drm/amd/display: Interpolate when reading PWM back as a percentage
      drm/amd/display: Stop rounding PWM brightness to whole percents
      drm/amd/display: Add KUnit tests for the custom brightness curve
      drm/amd/display: Add KUnit tests for backlight LUT interpolation
      drm/amd/display: Map AUX brightness through the custom curve like PWM
      drm/amd/display: Add KUnit tests for the AUX custom brightness curve

 .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    | 218 ++---
 .../amd/display/amdgpu_dm/amdgpu_dm_backlight.h    |   6 +-
 .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     | 923 +++++++++++++++------
 .../gpu/drm/amd/display/modules/power/power_abm.c  |  72 +-
 .../drm/amd/display/modules/power/power_helpers.h  |   4 +
 5 files changed, 784 insertions(+), 439 deletions(-)
---
base-commit: ba496bb837882eb1af58f41572fc289e46c77b8c
change-id: 20261102-backlight-curve-rfc-1bb4b6dee24c
prerequisite-message-id: <20261103-amdgpu-aux-curve-min-v1-0-62119efdcc6d@hsal.es>
prerequisite-patch-id: 0eefd25bf4ad8f6d779c7a0b0a63f84969b67fca
prerequisite-patch-id: 016515673f79f623de1e50dd513e5440587329b6
prerequisite-patch-id: ba453baf376b5410d66feacb1956eea933042ae8

Best regards,
--  
Hugo Sales <hugo@hsal.es>

