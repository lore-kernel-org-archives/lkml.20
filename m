Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792805622;
	b=cYiLSW4M/wFi4TKZVHdSx2+HEfoJH5Bwj0tKMmE1UNNCGaRk81ahNdHa50SrmLIWihgS
	 qR4O3Qc03KUYX0Db2c/Wak8Gc2XVU/q8eDBbu3dCPhCe3ic2HOqeBNFsY9MmHuyFRga0W
	 C2uk+1asbrogPMcBw5GrIn3Ugtx0XRT5SjJp8VHvkOo44BBztcFgnVDj+raYYMrPp8uJJ
	 x57KArQisB8avDEo8DgcbUwQGm8eHp5JroSQyLgEsZT2rWA3pWJrdss6tAYSDSP47n84o
	 YHzp2wMIqAOkR0eXdXV6HWH8F9D5Qm9JZOfpGBPv9oloaxyuIdLaMelkOLqnZZB6KRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792805622;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=SfNKrYDUbhsFpG8WIg+D5PcDIxxVFiyLQ6Sahtn09yA=;
	b=PTBXthNAlfCkyDJHscPke1xLUZq6/rTU7s/KwPRlSiv+z1NX58ewVJrzwxnvdYuJr1xN
	 c86arbQ+JQuz9taG+EzZW3tXBiMZT8Tpy/4FtgJ9Dioghjvr09SMy87mgRPDEJcWJaTO4
	 e7//xAd+Gk6YpTzykhGT1LdSdphkknG0/5BNkI+d276WctbAvWHvvqLHNrM8h8mUls2LP
	 LdtkIV7wNgQxzSsa2IqoUvqf9oUE6oJj554G8H68+V5QLEOUSSpktxuGUi4yj5BMIJg74
	 P4rXd2bXbVq9PJJTs2EGpyWM180v/EcmDDhgEO6yR3dQ/NqtsTouV3yIMx+Iq/yXHtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=iPQViv3Z;
	arc=none smtp.remote-ip=185.70.43.97
Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBECF606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBECF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=iPQViv3Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1792805617; x=1793064817;
	bh=SfNKrYDUbhsFpG8WIg+D5PcDIxxVFiyLQ6Sahtn09yA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iPQViv3Z/WmMNdRwF4v9O7+u4RQHOKmjRDcObENmqcjHBSFnbzvrcxqzm5wjWxLYs
	 o3WHTIjc3Z6fPWAHFysuiGk8VCJCPxHQpvPbGLHuWeUHk2AyPbgU3FnSVJAWFwbfxX
	 2ifEQDHoXcr0/rtgco13KFCuNvLZX7b813v2wn9mjiI/khOPJbrSM3SKu4BWOoyYRm
	 yN5WExltMa6YHyBGtPzDAHrlRUa3WhPUg4eeUIxlBCZGvynrYAqjwExpHKecbWUgdb
	 xkv+5BOpBO65jR6kzYVHAIL5xDeL1O8jkvlljzv0nCvOklYijsO1vdk+bye492Kzom
	 PJKwGMp9YH2Ug==
Date: Sat, 24 Oct 2026 01:33:30 +0000
To: amd-gfx@lists.freedesktop.org
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, roman.li@amd.com, mario.limonciello@amd.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, chen-yu.chen@amd.com, ray.wu@amd.com
Subject: [PATCH v3 0/2] drm/amd/display: keep custom brightness curve in userspace domain
Message-ID: <cover.1792805565.git.arc@empyreal.works>
In-Reply-To: <cover.1788388049.git.arc@empyreal.works>
References: <20260902-brightness-cover-abf809f2@empyreal.works> <cover.1788388049.git.arc@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 80549977febd08307ff58ae2b25cb6300093e4c7
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

convert_custom_brightness() adds the firmware minimum before
convert_brightness_from_user() applies it again, so a zero request
through a custom curve never reaches the panel minimum. Patch 1 keeps
the curve output in the userspace domain. Patch 2 adds KUnit coverage
with a non-zero firmware minimum.

Changes in v3:

- rebase onto amd-staging-drm-next (77f548b12);
- drop v2 patches 3 and 4, which changed the PWM path to the power
  module; "drm/amd/display: map PWM brightness through custom backlight
  curve" has since reworked that path;
- describe which panels still reach the helper: AUX panels with a custom
  curve, and PWM panels on stable kernels before the power module.

The amdgpu_dm KUnit suites were run under UML on this base with and
without the series: 1897 and 1906 cases, all passing; the backlight
suite goes from 70 to 79 cases. The rebase and the test runs were
LLM-assisted.

v2: https://lore.kernel.org/r/cover.1788388049.git.arc@empyreal.works

Andrei Rusu de Castro (2):
  drm/amd/display: keep custom brightness curve in userspace domain
  drm/amd/display: test custom brightness with non-zero minimum

 .../display/amdgpu_dm/amdgpu_dm_backlight.c   |  13 +-
 .../display/amdgpu_dm/amdgpu_dm_backlight.h   |   3 +-
 .../tests/amdgpu_dm_backlight_test.c          | 294 +++++++++++++++++-
 3 files changed, 286 insertions(+), 24 deletions(-)


base-commit: 77f548b127c6de34ce271fa09ba270cb1ef9f2da
--=20
2.56.0


