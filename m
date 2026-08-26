Received: from sg-2-2.ptr.blmpb.com (sg-2-2.ptr.blmpb.com [71.18.227.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A439470EA7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772995; cv=none; b=TX8GWl7V6v6WeSpXdWH4YKscRui4xRIKlOlOwnVm8d/slnNLoJ9FnA9lB1I616JaSOM2D4PkfuWU7k9Me0MeiX/6iP+hxDc5sLxFM/nKxiKVi0KxrLZ/qjCMCT4fYca4F/o7SJCWlS2lC0nvdBH6zJSjZmWh410rEEokJSXs9ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772995; c=relaxed/simple;
	bh=zL2VEgszaG6F0BbU1dsgrDQEbFzp4owvVqDsSKeaH9Q=;
	h=To:Mime-Version:References:In-Reply-To:From:Content-Type:Subject:
	 Cc:Date:Message-Id; b=BhLHBn0ZhyJ8rPasLoepFQxX8f8iMnVHMtQe/57lMObIVlVdBNq3TZMcAmg8natv6MwiwfByfBDjnxA8g6euG1D6LUuXsqFSlFgA1NjKUTmq9jVDR7GpQmq0xi0syp0fcLg8nt0C9DZzRbBWxASUzdDia1d9i0VV+rfIELHlhPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev; dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b=wv2AFbYM; arc=none smtp.client-ip=71.18.227.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b="wv2AFbYM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=lark2602131731; d=imm0nv1nhtv.is-a.dev; t=1787772970;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bQkE0sp1250wEmpHG0fFU1uyDKyKi32y1d4HaaoYnpE=;
 b=wv2AFbYMoMoJVqSW+KbsBXLg7NgcwZbN3sZ8TN5/KjTSgqNE6Y1dzGFq3CjGRfwx5CkV3d
 pbOowrrQX0kgQkQL4QDaNozK5NSKmBF/IwTgCeZq1gRPADmPGPt2xf2wqwODkz3RThdyps
 5G4XM8BYowlE1i0vFCyYYcdT3Wq+18ZcYhOWu7GdxLR7hmdIaE2XkT609YxA7HrS3e0USl
 Txl3m2Jng0E68FJsW4qDqNSv5hmJyNI05avapthT6c4Vz0OGD71vgGcGJJma8Mr36ic8vu
 KPCO7MDrFGdHJdMm8DPQN2CiLTwWSiVjAZ1FiFFJdSCp7IXEtSpZUS1XdX8N1Q==
To: "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>, 
	"Alex Deucher" <alexander.deucher@amd.com>, 
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.3
References: <20260826170549.21985-1-neptune@imm0nv1nhtv.is-a.dev> <20260826193602.6441-1-neptune@imm0nv1nhtv.is-a.dev>
In-Reply-To: <20260826193602.6441-1-neptune@imm0nv1nhtv.is-a.dev>
From: "NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH 2/2] drm/amd/display: close DDC on I2C engine setup failure
Content-Transfer-Encoding: 7bit
X-Original-From: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
Cc: "Rodrigo Siqueira" <siqueira@igalia.com>, 
	"David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, 
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, 
	<linux-kernel@vger.kernel.org>, 
	"NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
Date: Thu, 27 Aug 2026 02:36:02 +0700
Message-Id: <20260826193602.6441-2-neptune@imm0nv1nhtv.is-a.dev>
X-Lms-Return-Path: <lba+26a8f4029+1ec4c9+vger.kernel.org+neptune@imm0nv1nhtv.is-a.dev>
Received: from Neptune-PC.kiko-royal.ts.net ([58.186.164.158]) by smtp.larksuite.com with ESMTPS; Wed, 26 Aug 2026 19:36:09 +0000

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
