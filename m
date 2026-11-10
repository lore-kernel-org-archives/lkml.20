Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269624;
	b=vBG/uSWDjFq2TcKFhPCcGXEI3J9XQA0aYpmxFaIsPKElO7mjJ6yfyXY/6XxQxh6lYO6q
	 4ZIOe/R4O/hF23xiXwjZzzVceFK6RpHVKAvs12vcRXUrf6Mb7LRdMujbVD43aqi4TEU+1
	 fsy6pd917uSc6+Q47Rwyin9yrBTN/3+1FEhTQzQpncP887VRIEvVYw+ITr1YXUn4WYKMG
	 EjeKpIn6nQtUa565rknXm13J+6eos/Z2Dw95xbC19AGweZ3qPriw0DlApGb+5ZDwNwsE1
	 p9vK4HT4dza73Ms106cWwFDviSsmUZIA5QIWD91Ld74jPjg1BGz5Sb7wJsTHwvE+1mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269624;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=OXa5/UKu9bV1pH9rBxFIUKgVI+VX9kHNn8PgmbSFrB0=;
	b=OwNqzmgC6y7rd0GNoNaYscSU0qFdlD/YtnY1XmAIVXSRfNaN7NgSEi5EL6XEFU6UBkfx
	 3Xz9wx8tT/WAS5jAfhgqcsVUP8iE1AJI0KBh+fBH2VLPmPYWlXs6CCC7p97xlOXR3BQo0
	 xAekNKnkhb0mDtYo/mF6HG4lwHn9w/3xpJyLiFAmCAZWXSweXufQ6kHpcR2a4t4QaGlAM
	 xoCBlbcIuDI7jmOYYReP14CeGEtjULvXOp5iT88/Uqa/iQunjSRUn23ejBY5FuyZ7F8IW
	 2ONe0aO8lSOgw9+STeAmpqNdIIep+BDz0Zoj8FJdshcvOT14fhyFTKKs5I4SuipzDVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pgNpWKMt;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E860A2602
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433E860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pgNpWKMt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794269622;
	bh=lBPDHF8wdBDwsVL887cDE4x8O4Wx0EXPzrfwpuq2uns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pgNpWKMtU8OjT9a8diBf4CIBZ2lAXkIUO8WlhJylnzwi+o7gHCSauVHH1BPYANFcH
	 tDXcuWqDtv7DjcbNeiyXbYneGTRdQ8d6/myFP8Dx3Na9g4Nm/Ytio4fD1rqggVJvtV
	 whC3ZYLyBC74MHBmtgF43urToJhcMf16MQMIrJmbkaLR0pPaBQ08IOpyDTPxj0N88J
	 HLc4Penu9sScHfAFgDnFBl/fB2hMKpf5UmPILHrOba6JTcta+92FcLFSEakbysRVoK
	 vJ8rh0ma2z6jzepe46g7XV7/PoB81aauE+lGrSM21B5t2cX+d7Rbp1kYrSAuSoprfs
	 xbVG2+nYynNuw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 88ECC17E066C;
	Tue, 10 Nov 2026 01:13:42 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 10 Nov 2026 02:13:40 +0200
Subject: [PATCH v4 3/9] drm/vc4: hdmi: Switch to .force_ctx() connector
 helper
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-vc4-common-scramb-v4-3-eaa141a0da0f@collabora.com>
References: <20261110-vc4-common-scramb-v4-0-eaa141a0da0f@collabora.com>
In-Reply-To: <20261110-vc4-common-scramb-v4-0-eaa141a0da0f@collabora.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Lucas Tanure <lucas.tanure@neat.no>
X-Mailer: b4 0.15.2

Use drm_atomic_helper_connector_hdmi_force_ctx() as the .force_ctx()
implementation, so that the acquire context created by the probe helper
reaches the HDMI connector framework.

This is a prerequisite for converting the driver to the common HDMI 2.0
scrambling infrastructure, which implicitly handles SCDC state recovery
through a CRTC reset when the sink reconnects while the display pipeline
is active.  Note that this does not interfere with the local SCDC
state-management implementation, since the driver's scrambler capability
has not yet been exposed through the common helpers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d9383af60906..0e6696644687 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -514,7 +514,6 @@ vc4_hdmi_connector_create_state(struct drm_connector *connector)
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.debugfs_init = drm_hdmi_connector_debugfs_init,
-	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_create_state = vc4_hdmi_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -523,6 +522,7 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
 	.detect_ctx = vc4_hdmi_connector_detect_ctx,
+	.force_ctx = drm_atomic_helper_connector_hdmi_force_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
 	.mode_valid = drm_hdmi_connector_mode_valid,

-- 
2.55.0

