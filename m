Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93F63955EC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523416; cv=none; b=WaSG5aVElp3aSsjwF87jcLX16sz7shYnb/8H64dqTvsf9rs9e5e/kDUw6iXjUbv0+qg8Z8FsDBfVtuAx57fNyOs+rYle3e793VD3294BVyqGt5t4WAry02fWaSVxbZ+sQLjUqeyTmdv0AGSBdv+tJAXcuIB+Th1P4oUpVNQNUow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523416; c=relaxed/simple;
	bh=IVL7/LGTHQnYy8e5aogCUQIkUCgM3bWG5IC+vAPUbDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rVdvUm8tEMC6RVxUS0BX/+G8/asHd1VTsLjfqAmHu6mw5K4pw0qd5a/mRBXRLK5kzoFN4kFsgWO8QrlngrUxlF7eW38mSvw9FGLQNjuS0lLh9vYgjRuAaBSVKvUGD20ppowG8VB49cjDF2mePuBI1GOG/t7Mj0ltZMiQS2fTx7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edT2Kwr2; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edT2Kwr2"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b0496f4bbcso599635eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523413; x=1789128213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0mmbVoRzhegDeL5+uzJksOxQmVqqe3qpVwymM+HUwZg=;
        b=edT2Kwr2mpcgStjykIuj/NOzgSajmF9379CAeSQyX6d2J68KaAzSa703W6cE9hobCy
         H378iLLMn2shBgBEJMB8/5HAIPdzX17e+N8fmpgnN7my1FbwVZD6zrwFp2OIVZR03x6N
         M8VwfyyOERQPUK++DqwktVzFYI0dO9UxtnbBzf8mQcOwvPmUfHlL+0xOm+x8UHqgGBQx
         06P+0u8vaZMqWP8XjpU5efUwzAJKi4FcIb7lVCxE3keGsCVDNX39YwBYDBOSzwRzbsce
         nUa3AhnLdiAq/Y4D9+lkW6nZS5OrL0PwBY7yV58wzZEVsxq2r1JMwkTXmELdBIn12Sb6
         hd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523413; x=1789128213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mmbVoRzhegDeL5+uzJksOxQmVqqe3qpVwymM+HUwZg=;
        b=OEMy2Due647QV2n9qoyR/RwYWybACYR4CKHHsq6gIOzIzf0ZsFbKWBQ4OCS5sdKnXq
         YaL71WVJFaRYQGEtt+EqK5Ct1F7MVLeBkvb2QlLZso8MK5TkzD4Ay3xnRFBwZFRpSJ+g
         Iac8+e1OQRmLCrJUS2ZiFks7nIilZvo0ooiNdvPigjXFaGUaOQ+ssYVs4y691PGhkr5J
         /eTbYd1Iwk2UOABJNVza4FZHwpoF49B3VLuypURZphXF6eV/hhBVd0+2NSxpTCs0H3NX
         dFhdLxIxJrKusnFufMGaqSVBkGj/XmHAhiQIfjVIVeKyInYjzHjmaScmVY/cQDDpvKp9
         ZrNA==
X-Gm-Message-State: AFuF++luptD531G3DhCywFqvv65SNm3GaLeZOd7vs7UzIv1BoUaWtK+k
	N/7PYenkBn3jfjvm7e0kXNGcbT3hBSs96ZRl3E96If9DB6/RHUldqjL5
X-Gm-Gg: AYBFou3BHr7kRYdsYNmvHLWXqEKRQKDA/mphghqu7foDRrJT3R6dz91Tt8lBqObrk/d
	HpLjUqQjkl34HF1VmtmN80on8E2XOWgv+72wMcJ2179KTAPw+I5j/44cmYlmAcG1f4W6+oAUt4P
	SuzwN4sHmSaaQzqPk+uph1PXULLh4ufTbdBceBYm77B1cdjXeFPgnBo5JkkkDrB/jcy0SFG2AyW
	TF3CAd7+JA5yUttdKSG0f7Hfp6gYxYQ4VEaHyWUTAeIclwPCNrj6gdqUs9muciMqi4YB2ZnTUX9
	hUrqUl/Z1ZpAmfvYEXzWdnEmy47eN8cR38kvcGd9EA/YKvR2gsTZ8aHfvM75I0qnjK11HIlwtys
	mJviOZL0XJQmH2YKcu2HpyqiSURu+JyiHU0L/4NolW5OWn6GWSRFwTVGkHX4h7atlKnVbvxZJ9n
	5KPj7WbhOFpDzbl4+Eh+NTYWi1Zptzrs/nrv/fqfp4VE6ceT06aEn3j0U70URGKzirANkQ7j5xa
	p2oe8/SwS1eRHw=
X-Received: by 2002:a05:6820:211:b0:6b7:83d6:2926 with SMTP id 006d021491bc7-6b783d62ecamr1256097eaf.41.1788523413265;
        Fri, 04 Sep 2026 05:03:33 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm6597952eec.24.2026.09.04.05.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:03:32 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: fix typos in comments
Date: Fri,  4 Sep 2026 17:33:25 +0530
Message-ID: <20260904120327.16622-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 +-
 include/drm/display/drm_dp_helper.h   | 2 +-
 include/drm/display/drm_dsc.h         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 5c23182f4d33..2aef96fdbd10 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1971,7 +1971,7 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 
 	/*
 	 * We treat the device as initially suspended.  The runtime PM
-	 * autosuspend delay is rather arbitary: no measurements have
+	 * autosuspend delay is rather arbitrary: no measurements have
 	 * yet been performed to determine an appropriate value.
 	 */
 	pm_runtime_use_autosuspend(dev);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ab16c1be3900..34bdd599383f 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -816,7 +816,7 @@ enum drm_dp_quirk {
 	 * @DP_DPCD_QUIRK_CONSTANT_N:
 	 *
 	 * The device requires main link attributes Mvid and Nvid to be limited
-	 * to 16 bits. So will give a constant value (0x8000) for compatability.
+	 * to 16 bits. So will give a constant value (0x8000) for compatibility.
 	 */
 	DP_DPCD_QUIRK_CONSTANT_N,
 	/**
diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
index bbbe7438473d..0682071d881d 100644
--- a/include/drm/display/drm_dsc.h
+++ b/include/drm/display/drm_dsc.h
@@ -322,7 +322,7 @@ struct drm_dsc_picture_parameter_set {
 	 * active.
 	 * PPS4[5] - blobk_pred_enable: Indicates if BP is used to code any
 	 * groups in picture
-	 * PPS4[7:6] - Reseved bits
+	 * PPS4[7:6] - Reserved bits
 	 */
 	u8 pps_4;
 	/**
-- 
2.48.1

