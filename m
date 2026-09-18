Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C98041441F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753789; cv=none; b=OsdW/13dCLsearxJ1ZjnBIdHGoImsny053nVbgNYsmEJ9mYk8RPRsgnO9rQrQINKusfjjVbN060gRVv+tThnqN18jRtOifEInP3eGss/Yn8DwzeYl+n2vjuD/fVTNgP3jXRN/aT05UGzOADBziBIPgTPMc6tpvo4ItGKeoqnxgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753789; c=relaxed/simple;
	bh=ZBofP36J7JzFXh6ydHqvGErLUl1QN3O1mSZZFjUfVaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CeNjhhCBBe4WSz0U7vn5UG05yNntY5x5+kChLmY1csj01wswXR3qgJQ0qLznEpMhsoiPOt79MYX5ZIUeVGUPe+0MjITrqHgf8nZIq2w12BdDJu1eqdV1Zfn+Gbiyv1PC7OcnuXSA2FHLS+i861tIR6ns2voYkcRT1MIVm+1CC5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYiFknvM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYiFknvM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso8972585e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753783; x=1790358583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElMdFDi2NONXJb5bv3y4m1vT42e9NSOKKUzun9eTuWQ=;
        b=eYiFknvMWayePJas52zRW2j2UkO1YN3erLlQE7wsfzwsPDuR+r+ouUMk7N5CUf8r7m
         XSV/IjcE58iiQ/Bn12cJChPvVBJ9EHdZzWDCI1H5NlYZUErIxq+uBm6glpKraJ2SCXXC
         +RLondrZV5HLIwdTa72YtGN8Hdbu0fiJcTysl1cMbqIdS+mU0elyJbwFxedErnXetcwU
         3mQ3WwZVafFKLXlwcjlU+ggEjkwSy+9FJi+7KOPrgpuczLOv/MVqGba03iJwdfUGsrVc
         iq8zsPXPBATMGtQxw9bfe/gcVSPcZb2qAgczuKctrDlhVcHuVKHZoS+PGz6mF8GEQTns
         chXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753783; x=1790358583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElMdFDi2NONXJb5bv3y4m1vT42e9NSOKKUzun9eTuWQ=;
        b=NYJi8sJmgVrkhFxPqVocLdyteoWqRSiPrvQyLHjGijMDHeLiJKmEwUlTZmwRebx6e+
         kiOa25q5Z0c3Pg5h/yTowqI4uGzpFHDU93vElhCRlIfeOz/psLSEolgDhx9xgcX0f310
         drWfNYUp8B86AxZAYSlcfU90F9AT53YQOzwIwTO/wWWFBKL81UFRp1CIbbU334tHQoia
         EkEbWplG+1VSOf7dGGJObnak2zQCmj6njQlq8KEvYdQJ+lqxZ11xFB4KErbz5PJlrTNn
         OtwIUdpiE7ZXJ7j4CylfaPIB3/8cpAF0cxCGw9SDbKyRDKZA6/yiUUmn09M3FIFJJdB4
         +YUg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ0E1NFm3lf3IM1Rj32uVr/LLMbJQqn2iRlqVQBjNk+xez3gFPuroRZtrg7qXUHw3O5hE38dRCNWadHX4=@vger.kernel.org
X-Gm-Message-State: AFuF++mPSD83uJCueZWkAFuKsbsVzSWNGSIJkfmix1qartqtzOtBCUTB
	DC+p4YvXEBA/x+xV5zaPeNgey8x0ZJJb2E8TK/XXVk+rXDGaftymyH73
X-Gm-Gg: AYBFou0FKzylt5O8IcwAu2bx2PFMH/zmMu5poROuGH46le5cXW0Ed8eY8OBjY4ObMTB
	1GJ9kQpXw19laWH/uBJTcP88+BczUPJqQdNBXx6ZiLd2qol9vYNJ8IgsgtQql9ytKebAzeHjx9Z
	R/1/Gly8m07e8nLYQ4chwjnehIHQbfN5V2Bzt35XA8xJq5xNABHbcISAmpukakYNFiJu9NAYP69
	I6XDEcyU0NwBXsI5RICaZ6C8AcX5bKNld7vY2zWoWRuQujMFwr+GgC06ChVRw24pS+DIHP76bL6
	meq+AdR0Us3N1PDzHWAosM93jh9NZHkom463YrGMoA0Xaf0jBI/84C8qLcxJjlLmWN7kXPqbs/N
	jYpC3uc3LqwybLyekVyZvhqPsQFjOCSew/ZbaJrPhwlNoRaB/4Ez8KLPvfdb8kd+WMakbB0bD34
	0WIEDgyKTnFl/LQB2F1TgMgHpSiYCQhKyR1SrM9BWjD/nr0qXGADBkKz5anhzrLs5u1n+azi3Xp
	C4OdpdZ7DtCZsvgj1a2y28Y5vmf57OiJ7L9oKY=
X-Received: by 2002:a05:600c:6995:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49fc56873a2mr41408465e9.10.1789753783231;
        Fri, 18 Sep 2026 10:49:43 -0700 (PDT)
Received: from [192.168.1.7] ([185.69.144.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm9867425e9.9.2026.09.18.10.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:49:42 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Fri, 18 Sep 2026 18:49:30 +0100
Subject: [PATCH v2 2/3] platform/surface: aggregator_registry: Fix
 tablet-mode detection on Surface Pro 11
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-surface-pro-11-aggregator-registry-fixes-v2-2-c4ed9335814a@gmail.com>
References: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
In-Reply-To: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789753778; l=1322;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=ZBofP36J7JzFXh6ydHqvGErLUl1QN3O1mSZZFjUfVaQ=;
 b=TUcm1kD2BXosfEyJdlHYx4eFuXQ8I0KdTLHsxcbfOXRzsJqgJqgy+UWBE3vn2ALBo+VeSd6Y2
 d/DbsLOmN7jCccaAZ3qIrd1uNdTTwr5V57DPJLuNFPXQqCiAP8tkOgL
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Replace ssam_node_kip_tablet_switch with ssam_node_pos_tablet_switch, as
Surface Pro 11 reports tablet-mode via the POS ('posture') subsystem and
not the KIP subsystem.

The KIP-based driver would remain stuck in a 'folded-back' state after
suspend/resume, whereas the POS-based device reports its state correctly
even after suspend/resume.

This fixes the type cover keyboard/mouse being ignored by desktop
environments after resume from sleep due to the erroneous 'folded-back'
state.

Fixes: c4a069095395 ("platform/surface: aggregator_registry: Add Surface Pro 11 (QCOM)")
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 82c2144e10ec..2cb8278d98ea 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -415,7 +415,7 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	&ssam_node_hid_kip_penstash,
 	&ssam_node_hid_kip_touchpad,
 	&ssam_node_hid_kip_fwupd,
-	&ssam_node_kip_tablet_switch,
+	&ssam_node_pos_tablet_switch,
 	NULL,
 };
 

-- 
2.55.0

