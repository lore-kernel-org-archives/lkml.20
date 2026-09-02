Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51347FB1C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352278; cv=none; b=OVCMDjRQ6bL/heAhu9gcCTz6nQVhRGrfzptXmSN314ontKKjwA42Hm8WYi6kEZyeirbBUy0ZOiie+5PTxNBwey2IZ52IYqxFaLcplhbSEQmLmjqtBG+7guZhTCBmq3KYGxiUM8/gr2od9Wk/21H2LXxJTPtjIqB81uVwcVjeYHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352278; c=relaxed/simple;
	bh=vzQswhFxPN4EWJHWN1VVDXS4QWb3TXLwrlRGynd7pPM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IBcj0z78Q3EJKD6hJlrQNCxjOWwFV6/YwlTfAb1Q+M0YeE8rYUYRS3rhLe52E4ueesnmfuAK9x1Kx4A6n2YhE/a6+RfSP15kTNuCmLp2VDVkW2TXN20aOr5NooJpasJec2oW+RZ/BWv6iQ3EPnK6FVH6pqoGhu/Akdzr2XmMqDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works; spf=pass smtp.mailfrom=empyreal.works; dkim=pass (2048-bit key) header.d=empyreal.works header.i=@empyreal.works header.b=BGEGXopu; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=empyreal.works header.i=@empyreal.works header.b="BGEGXopu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1788352272; x=1788611472;
	bh=OKxNGCoL9yieoK3Ws2lDA86IF7zj6L6ly9tSa8jimQE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BGEGXopu67VBpaYnmqAVSucBFOZgRwPKzh1KMjIQqQUd9/0XoKfiWJof1ngxOhZMJ
	 J1VIwNjg9z+nsUM5jmjKSefRnn/yVzYjQHcyyhISrgoJBPOcNrqk2nltUk4UuJDfj+
	 KoN3u1BIowUCfyTHAJZJxCRAjS0R1rjHlbyubq7Sb5rhy+HtSSGk1zjZNMcgVvKz/7
	 CswyitX/tXuW9alxZKCyGUXWQOXoPi49DK0alBqBfmZJBFpxgETJPlvIm7Uxszh1nO
	 3g7dU35oS1I5z79bDg4ET9WGP80K5LhsVI6afIROzzusO1s8w+Gy0Ms2MOk1hDHVUD
	 iEzq3xSqtpx2g==
Date: Wed, 02 Sep 2026 12:31:05 +0000
To: amd-gfx@lists.freedesktop.org
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, roman.li@amd.com, mario.limonciello@amd.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, chen-yu.chen@amd.com, ray.wu@amd.com
Subject: [PATCH 0/4] drm/amd/display: fix brightness ownership through power module
Message-ID: <20260902-brightness-cover-abf809f2@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: e25d1b5c28e864151b6e2d411f4edd74bae9fadd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Linux passes PWM eDP brightness through two owners. The display manager
maps the request into the firmware range and applies the ATIF custom
curve. The power module then derives a percentage from that hardware
value and applies the same curve and range again. A non-zero firmware
minimum consequently prevents zero from reaching the panel minimum.
The split also leaves the custom-curve disable policy and final PWM mask
attached to the wrong owner.

Patch 1 keeps pre-power-module custom-curve output in the userspace
domain, which also fixes affected stable kernels. Patch 2 covers that
conversion with a non-zero firmware minimum. Patch 3 passes zero-anchored
millipercent into the power module and moves the panel policy, curve,
range, trace units, and final effective-PWM mask to that owner. Patch 4
covers ordinary PWM, forced PWM, AMD-AUX fallback, true AUX, multiple
panels, endpoints, interior values, clamping, and invalid ranges.

The complete series passed all 85 AMD backlight UML KUnit cases on the
current base and after clean application to Linux 7.3-rc1. It was built
into one kernel, booted on two Strix Halo systems, and produced the same
AMDGPU module on both. An instrumented physical panel test observed:

  request 0     -> 0 millipercent      -> PWM 3084  -> success
  request 65535 -> 100000 millipercent -> PWM 65535 -> success

The panel visibly reached minimum and maximum brightness, then returned
to its starting level. No fatal kernel event followed. The true AUX path
was covered by KUnit but was not available for a physical test. The
existing LUT-unaware hardware readback inverse is unchanged.

Andrei Rusu de Castro (4):
  drm/amd/display: keep custom brightness curve in userspace domain
  drm/amd/display: test custom brightness with non-zero minimum
  drm/amd/display: pass userspace brightness to power module
  drm/amd/display: test power module brightness input domain

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +-
 .../display/amdgpu_dm/amdgpu_dm_backlight.c   |  59 ++-
 .../display/amdgpu_dm/amdgpu_dm_backlight.h   |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   |   3 +-
 .../tests/amdgpu_dm_backlight_test.c          | 447 +++++++++++++++++-
 .../drm/amd/display/modules/inc/mod_power.h   |   1 +
 .../gpu/drm/amd/display/modules/power/power.c |   2 +
 .../drm/amd/display/modules/power/power_abm.c |   6 +-
 .../amd/display/modules/power/power_helpers.h |   1 +
 9 files changed, 494 insertions(+), 36 deletions(-)


