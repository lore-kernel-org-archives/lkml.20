Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788280;
	b=hkNxqJRCJaD7uIlEyC3O/zCG9cyat03BK2Atroubx0nrHv4UWCQp1BRoW/kAxeHa9Hus
	 YHRLLmR28c1SWlv1vyigH+2Ils9sXiXHs5YcC+Tuy3r5WRuHDB6Q1XLQZpNka6jA2he8U
	 StrCjJOnzF8hDndHm9+pUR2UR0w+ri2WBVx3O94or5MIEff/rA8sT5hmwBkGk+s1BoUOk
	 U3Bjt6np5orJwvLns4JHp+f31JK+t4i4rQiGg4uYW7NOMCXOMMbNcS78GC/Zus9BoGyps
	 3aamzDKybmMjrtbV8cOIBwiSi9au/wN9LXFNQQ9fzOeCYjD9fIa30U6UvticMbUSDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788280;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:X-Change-ID:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=/oHaqrs+6mL//Lr3S33xyG+yOy4PlUWvV7uRNhgw0tM=;
	b=f6hKY9+ssbBYIkZIuL7zr6br/tzt8mnNuozB1IiWDTrNB0swiqbk8D+PvMzYIG0HvT01
	 UqN7ehNXWuk+7LTMUdXNQz9NR415mV2WpxWq+YxvFyCNlkDNGk/Jvo+BwKhv4ZHSzvsxc
	 PUn5lI3zVvC3mChHQJgzd6/aNGAx2x4Y/6kcayKHHF4BJpjadfKQXd1XXnG1Zqi4HCt0D
	 EDdFCw7PlLtKMGQZIRRsgB+BqldhcKyXXCbP+74iFnuhg3iR4qsnIhfShcWUlSX/ivwrY
	 kPDYJFRUUKUz/2eOjixll/h0vUhiHndDk0HYYDbAyV54XJq3FaKKwUo4fEfGyGlRuug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=V3Vb70Mh;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE17C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE17C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=V3Vb70Mh
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jKMDM5WFqzMlsc;
	Wed, 04 Nov 2026 11:31:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793788275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/oHaqrs+6mL//Lr3S33xyG+yOy4PlUWvV7uRNhgw0tM=;
	b=V3Vb70Mh+AiyBWs4q0uyCd1b/wlYj9C1WeEaLK9wQ3uq5Qwvs6PrN+EwVNUn+spBdJxDMj
	LoR3elEfJI4ygJUPB4jiKhGegFLBzcrKUBwibhNzEFghb4/dRe0aaA/hZ0UGmxMrlRn7TU
	imJZybBeGPWlCBl23Bie0P2qSUXG/a2UtR0vQbFZ2pAqgufy6O7HIknxE9jhO6tK06PILf
	gxgIUR3nxD9FRFp42N54Bc4wjtGbZ+K3gOSoT802ivTYPvUyLJGx+D7U9/zWrVQeHlWog/
	JPLFrlJIdtZdLJBGbkvjkVBboCor6/BwwuerAN/7em/DEufpPRDUGgLBYqiMZw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: harry.wentland@amd.com,
	siqueira@igalia.com,
	amd-gfx@lists.freedesktop.org,
	sunpeng.li@amd.com,
	alexander.deucher@amd.com
Cc: Hugo Sales <hugo@hsal.es>,
	mario.limonciello@amd.com,
	christian.koenig@amd.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	simona@ffwll.ch,
	alex.hung@amd.com,
	airlied@gmail.com
Subject: [PATCH RFC 0/3] drm/amd/display: Check the ATIF backlight curve
Date: Wed,  4 Nov 2026 10:31:09 +0000
Message-ID: <20261104-backlight-curve-validate-v1-0-10c688880e85@hsal.es>
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
X-Change-ID: 20261103-backlight-curve-validate-243c4ce9692c
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2806; i=hugo@hsal.es; h=from:subject:message-id; bh=DgXga9uZ9dc0KcIOEv1J7jSjIwiaCwQPIpM6EavLbME=; b=kA0DAAoWfQx+r8nYNaAByyZiAGrrCXCh0GXSuXFUKB+TlUbyCSLhGoy93JsjDEpGQgm2kDCUi Yh1BAAWCgAdFiEELdhJAASRk5lscuekfQx+r8nYNaAFAmrrCXAACgkQfQx+r8nYNaBCWQD+I1q3 z4vW/BKmFsG1rOqFBQ5Q1f0DjbPHYVX8/ATCXUoBAL0Oyk7GXjilJ/PwQHYPqoj2zfaFwdJ/Ff3 GYeLL0HoP
X-Developer-Key: i=hugo@hsal.es; a=openpgp; fpr=193D095149CF7E8737B39064D912B0DB205A91C1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jKMDM5WFqzMlsc

The ATIF custom brightness curve comes from firmware, and amdgpu uses it
without checking that its points rise. Patch 1 checks the curve once at
probe. It drops a curve whose signals fall, caps a luminance over 100%
at 100%, and raises a luminance that falls. When it changes the curve,
it warns about a firmware bug. Patch 2 adds KUnit tests. Patch 3
turns the debug message for an invalid signal range into a warning
too, so users have something to report

I haven't seen a curve this would change. My laptop's curve passes, and
so do 240 static curves I found in public ACPI dumps of 15 laptop
models. On many Ryzen laptops the firmware builds the curve at boot,
though, and a scan of the tables can't see those. The bug reports I
found of an ASUS curve over 100% turned out to be a different overflow
bug. Sashiko flagged a luminance over 100% while reviewing [1], and I
extended the check to falling points. So this is hardening. If you'd
rather not carry the check, I'm fine with dropping it

It applies on top of "drm/amd/display: Stop rounding backlight levels
to whole percents" [1]. Patch 2's brightness checks use the curve
mapping from that series

[1] https://lore.kernel.org/lkml/20261103-backlight-curve-rfc-v1-0-6e4813a8f2eb@hsal.es/

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
Hugo Sales (3):
      drm/amd/display: Repair or drop a bad ATIF backlight curve
      drm/amd/display: Add KUnit tests for the ATIF backlight curve check
      drm/amd/display: Warn about an invalid ATIF backlight signal range

 .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |  50 +++++-
 .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     | 184 +++++++++++++++++++++
 2 files changed, 232 insertions(+), 2 deletions(-)
---
base-commit: ba496bb837882eb1af58f41572fc289e46c77b8c
change-id: 20261103-backlight-curve-validate-243c4ce9692c
prerequisite-message-id: <20261103-amdgpu-aux-curve-min-v1-0-62119efdcc6d@hsal.es>
prerequisite-patch-id: 0eefd25bf4ad8f6d779c7a0b0a63f84969b67fca
prerequisite-patch-id: 016515673f79f623de1e50dd513e5440587329b6
prerequisite-patch-id: ba453baf376b5410d66feacb1956eea933042ae8
prerequisite-message-id: <20261103-backlight-curve-rfc-v1-0-6e4813a8f2eb@hsal.es>
prerequisite-patch-id: ab08642e6487dac872fecb986cee493826c90ca9
prerequisite-patch-id: 615ae71fc87a132500083a791977cedffb5c5535
prerequisite-patch-id: d5f11b9531761fbfd4103cebc6f0e9403cd53772
prerequisite-patch-id: 95660ed7df12918c00809bf09d9d979c597bcbb6
prerequisite-patch-id: 4bf24c99ce3da811000e96e67ca6b93df79eb964
prerequisite-patch-id: 33257e757b334f4a8cb44b4efc24a3f3cd000307
prerequisite-patch-id: dec6b61e59750a963d14cb6905cb76a4cb76f77c
prerequisite-patch-id: f1fe27995f1a36d9382674eb9951ea5fe5f18a91

Best regards,
--  
Hugo Sales <hugo@hsal.es>

