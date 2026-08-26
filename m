Received: from sg-2-3.ptr.blmpb.com (sg-2-3.ptr.blmpb.com [71.18.227.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A9C3955CA
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787777114; cv=none; b=pIVXoUboLp5PkpJaBmgY3PV57wSOFxMUg41rysIrVd58Tc4AFpG0LCmFtB+3zPlnbpLQfOh7HM9JnEmOLIGAKqR3lWDldTOAyiiX+dmY3OhZWkGGK2lDSLNAuoDyElM5duEsc1KlugABvTcOESVFnCPCST51i2NZv7feIMs/lFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787777114; c=relaxed/simple;
	bh=zL2VEgszaG6F0BbU1dsgrDQEbFzp4owvVqDsSKeaH9Q=;
	h=Message-Id:Mime-Version:In-Reply-To:Content-Type:From:References:
	 To:Cc:Subject:Date; b=SGzS2kK/aEogHA4aK6G+wYA1sN5hUwgrXmxoX032Aot15NMXBVz1v7vwrBYqeEzeLT6BBEC7hSNWA5MPbA/oI5swwzuan/v8Q7Ft0ALiBU2fChweT7MyIvsTW0U8z/Qu9qRZ5izC30f78C0HZixBPMKnT/1yonS/n7dF1n/5Fkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev; dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b=tD8HLVET; arc=none smtp.client-ip=71.18.227.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b="tD8HLVET"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=lark2602131731; d=imm0nv1nhtv.is-a.dev; t=1787777106;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bQkE0sp1250wEmpHG0fFU1uyDKyKi32y1d4HaaoYnpE=;
 b=tD8HLVET4ZuqyWfqkhTP7joZUg5k6z5THi86/hEvhE4KKxCuk5QSjKwNQ0Cp0+TTevfl8W
 upAF2Lrq6k4vIGpD5uwGaWD2FSHzzXJoMtQIXK5UZykRy85pg2zDb8olBBtSOvwf72Fa1W
 tdmQbxpCLgcjrWURr4AjzjuHHZJ2ZujWPDf0lzTh5bcAS8eyHi+ZQoNZmX3oHp+S1WpwmA
 BF1UDXwjmbh7U5pRNztex61cT4vGZbSGD/IxnzjOMz1DPqQKMPPDgD07IPBwpo3IUHW1dL
 3fpncCP70fgMPXwAQyoF+mqmqHLq2h3ZLx5aBwDJnMPCCiZyWlkhB/6NR4gQUQ==
Message-Id: <20260826204457.4666-2-neptune@imm0nv1nhtv.is-a.dev>
Received: from Neptune-PC.kiko-royal.ts.net ([58.186.164.158]) by smtp.larksuite.com with ESMTPS; Wed, 26 Aug 2026 20:45:05 +0000
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
In-Reply-To: <20260826204457.4666-1-neptune@imm0nv1nhtv.is-a.dev>
Content-Type: text/plain; charset=UTF-8
From: "NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
References: <20260826170549.21985-1-neptune@imm0nv1nhtv.is-a.dev> <20260826204457.4666-1-neptune@imm0nv1nhtv.is-a.dev>
To: "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>, 
	"Alex Deucher" <alexander.deucher@amd.com>, 
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Rodrigo Siqueira" <siqueira@igalia.com>, 
	"David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, 
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, 
	<linux-kernel@vger.kernel.org>, 
	"NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
Subject: [PATCH v2 2/2] drm/amd/display: close DDC on I2C engine setup failure
Date: Thu, 27 Aug 2026 03:44:57 +0700
X-Lms-Return-Path: <lba+26a8f5052+867ed5+vger.kernel.org+neptune@imm0nv1nhtv.is-a.dev>
Content-Transfer-Encoding: 7bit

acquire_i2c_hw_engine() opens the DDC pins before setting up the
hardware engine. If setup_engine() fails, the error path releases the
engine but leaves the DDC pins open and the engine's DDC pointer set.

Subsequent attempts to open the pins then return
GPIO_RESULT_ALREADY_OPENED, preventing further I2C transfers, EDID
reads and hotplug detection on that port until reboot.

Mirror the normal teardown path by closing the DDC pins and clearing
the pointer after releasing the engine.

Assisted-by: Codex:gpt-5
Signed-off-by: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
index 05892ab4529f..e7a05494abab 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
@@ -485,6 +485,8 @@ struct dce_i2c_hw *acquire_i2c_hw_engine(
 
 	if (!setup_engine(dce_i2c_hw)) {
 		release_engine(dce_i2c_hw);
+		dal_ddc_close(dce_i2c_hw->ddc);
+		dce_i2c_hw->ddc = NULL;
 		return NULL;
 	}
 
-- 
2.47.3
