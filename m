Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06C743BDA4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428778; cv=none; b=VwzMT+DLNdiEQM6BO9MSTyB+8RMtehXRKGs41M5vzzmxrQI3g0xQx9aFSJdf/pQWmOMYsKMT6dAqIrNC9NEs5/MvCVfsAOWS2hCWMjc0O6+gJbzUiPNOI3vqzxAKd5UOb6fy0RNeSiqheh4CAbjnfz4XDsfbRqx+90YBz7Bs8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428778; c=relaxed/simple;
	bh=Tu8/XjJPAf8frBzLxxmgtLeodZdofII8mNDvbAAqs2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DR/xk7dB/C0xd3/YN9jOqOCBVMCs3WrsDv1w7uzcCW2HFkAvRdfj0fI+O7MpVeamPKRaBZeAkzc/J/tsEEMEPa4yZoxZwvQiSHDEWQy4qb3XiU+affI0GjBjrxe6cdhBFldGCZSXE91IHuK+0FwTyF5Jj4BFaybf62DHhgt8c1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYRKvTz/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYRKvTz/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 459AEC2BCC7;
	Sat, 26 Sep 2026 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790428778;
	bh=Tu8/XjJPAf8frBzLxxmgtLeodZdofII8mNDvbAAqs2U=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SYRKvTz/YZyO8qwNitkt2wsmQiBHkyuX6j2e/ixgBULuUWQq5X/DuCnlw4+xKhbYF
	 /fuYN8bffE+wJunL74Iq9w6OxHkpInDP8di0oVhn61bqHwZJkRNlK0/ewLZwdfjdx0
	 lT9kGDlMGZQ7EFm4xaJf447BpMvQ5/4It/esDV2taT4sMtv/l7UCnBai3pj7A1o9JF
	 gIDSY6mrs6eHreM2ZHUdVDiVjCa6xMLiMZw+amPS2/h7ZzeA/bQYUGCVcH53ctiIK0
	 gfCMHM38oxkL0nB0N/p6cR5Y5r2Fc5l0awi9tVMukhhlRO/XkC6NZNsjx8qLy254SR
	 9sCjTLPvt57oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E07C98338;
	Sat, 26 Sep 2026 13:19:38 +0000 (UTC)
From: Adam Azuddin via B4 Relay <devnull+azuddinadam.gmail.com@kernel.org>
Date: Sat, 26 Sep 2026 21:18:11 +0800
Subject: [PATCH] drm/appletbdrm: Fix incorrect error message on encoder
 attach failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-fix-err-msg-appletbdrm-v1-1-bb578a7dbdda@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QrCMAyG4VsZOV6gy7DY3YrsYD9ZjbhZkinC6
 L1b9fCB73sPMFZhg646QPklJo+toKkrmK7DFhllLgZy5F0gj4u8kVVxtYhDSnfex1lX9O3ZnxY
 KLQUH5ZyUy/IXvvR/23O88bR/a5DzByRmf756AAAA
X-Change-ID: 20260926-fix-err-msg-appletbdrm-63865f293290
To: Aun-Ali Zaidi <admin@kodeit.net>, Aditya Garg <aditya.garg@linux.dev>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Atharva Tiwari <evepolonium@gmail.com>, Kerem Karabay <kekrby@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Adam Azuddin <azuddinadam@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790428776; l=1145;
 i=azuddinadam@gmail.com; s=20260926; h=from:subject:message-id;
 bh=7QDII02ehFVK+b+s6cXociss9QRFT9PtnypaxLiG1UI=;
 b=eehGGRf63XYAZCL1BZESAk49qgPoTAXmb+GEmbTUA3+r2sU32mtzxtvdtOw8Bp4nZ8e4aw9Lh
 EJyO9ShXV9OAfCArGh8/VXYVtMMqSX6zCNh/AkOEaHxs/PpkpnZ31gN
X-Developer-Key: i=azuddinadam@gmail.com; a=ed25519;
 pk=ncFYTl3bFc1mmBvcpoYe65cGkYmui+zk5C3ufOQqR9s=
X-Endpoint-Received: by B4 Relay for azuddinadam@gmail.com/20260926 with
 auth_id=1066
X-Original-From: Adam Azuddin <azuddinadam@gmail.com>
Reply-To: azuddinadam@gmail.com

From: Adam Azuddin <azuddinadam@gmail.com>

drm_connector_attach_encoder() replaced an earlier call to
drm_simple_display_pipe_init() during review, but the error message
logged on failure was not updated to match and still refers to the
old call.

Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Macs")
Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 drivers/gpu/drm/tiny/appletbdrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
index 4297d9c1125e..91a51b513911 100644
--- a/drivers/gpu/drm/tiny/appletbdrm.c
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -724,7 +724,7 @@ static int appletbdrm_setup_mode_config(struct appletbdrm_device *adev)
 	ret = drm_connector_attach_encoder(connector, encoder);
 
 	if (ret) {
-		drm_err(drm, "Failed to initialize simple display pipe\n");
+		drm_err(drm, "Failed to attach connector to encoder\n");
 		return ret;
 	}
 

---
base-commit: 98c7fc4219b93f953ee85c07fb6c8256046aba73
change-id: 20260926-fix-err-msg-appletbdrm-63865f293290

Best regards,
--  
Adam Azuddin <azuddinadam@gmail.com>


