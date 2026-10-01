Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCF33C1D5C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872420; cv=none; b=eOk8nqHU2op2Jn23t0uwaxMjeeWaeMSUlGm+j50ZhIbVHuAor5dqrTrcl/tSuwpGAiGyJ7khLvHMvBk+ZpmWgm8z78InWSP98zIgHh5w3fbnjhO+FzhqkB1VivFZtN9ADugelaRS2/jLzdUY9QMqnKJ+9fGKmsthd30A4kZ40Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872420; c=relaxed/simple;
	bh=iP4ucZrwv6lusCaAsL/Sx7GE/+clUjYzv6O7XVMAV4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=apHbnEa6edI10S6Yc95jmVxMXJG8g1FRi6mG0OHOOcPeDKzGqaYgp7AcgzBZFPGop2Wy9IafqV6zBuE425ZY3O5dIT7dQAD/0aN2FGygQmS/HVAh4Hc5g8dPMF5pG1xkyK74Dc8hd2gx80VWi/q0XURvlpSO7vGZ9V2h0n7Pwnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhioyL4G; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhioyL4G"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso5231632c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790872418; x=1791477218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1RPYD0N0OhgGTStrwI9XEfjRHAB9yKnlVpEfCkGkP/E=;
        b=nhioyL4G6gOKd5vi2515bjBnH7U6lNHvRbxvR8UbYe5/F5CtCX/AXEPxdih3G4Kdfw
         7IkDp7rP10fi1ahyLEA3EnXwRjC1zfpYPRz9OMcYrHFMU3EOAr9rn3+DlHrX90JhKMAy
         76dWVuANqM0IJSwzaDsdr1Y4+SCw3/3wMG+UrL6JZYx9xkLXCXb/ZjjbgBDSLsi6cZF8
         LHx90YJzGWKz0oyXL8IV9VklBuYjcr52jyCaEnYWDCsr3soH1l1w0rBoIPxle0QCZG3g
         7vORZXC1ZgdVqfP6jr/N/zAOTEMA5DDylcsU1PpegTQ+ZelzkSgJS49WndhhHanfSvBs
         0J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872418; x=1791477218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1RPYD0N0OhgGTStrwI9XEfjRHAB9yKnlVpEfCkGkP/E=;
        b=i7qOxnbF4+NNiKgoli0UG/dGrFNzvsSesT+ScuwDwwn63wMpQjYhSI7GZr899cS/JF
         9Y8ZSHYwJjlDBPr3kLhDaBJvQRHbZ0VRxuYk4WBeUBNLnWicUNq6TcFpDoVSf3ccleGc
         ZB0U5dqMP0a8JjPolfhs7LEh931tw7JKNjyxg6EfMn6vKRJcVAkeoE7JCCnlcVvIy/VK
         vHqzS3cMetIljWIrgFYqlmf0bwBZKQHhtqWlC99vpFTKbiTbDKiUEPLsUWDkBYb/hX3w
         Ra6D7TYW0YSUGQpaZClzhQNBLz4c3dRYfZmQbdmpkFwZy3xm1/+2lKpdCLKT06hKhrES
         7VxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKvatLuZG5zukoab/aHHR4KgC+iuuCwAlq9KOzUkRx2S4YS3Q1JgDFCBElzBki2EfqFZEMOyt/+ovVJx8=@vger.kernel.org
X-Gm-Message-State: AFuF++mX93EtPs9w+/VTWIf6nghEzYW2pB7uImlwjR1EMidpGFrLFcAB
	YegMc65oDLnsvMYrOews0g0qCJeWQd2qla/+DQ7HI6LDNUzoSzaRX8hz
X-Gm-Gg: AYBFou2dCPk4xkv1cywdKQCClkk/EOBCy2Z484EyTaADsslZm/GaMahaq41yrmuQc4e
	ByvIecR2O0CA6HDusr9viKGaSWoCf6bKVzlqJTalRVo5L1mY31H1MB0emIfQJIYHrk1DLXK6Bhi
	h/0ubfmNAksIFGwnNAsm6iYqtpmlGfSMwrPF42Q0Ct9xtUk5H+SC5M1IdKYQXeeGuliU3yT/UZ2
	boUnrKGtb5zNgQSi7mWzc6Bgy4UuV/d0qqj3sTI4IPmh7nz8eP3o8VkhuSyboIa9xnGBfnm+tbE
	bzJUUiWRBoKA04hjyGWWwp7tnDlYdLykGaasGBsT1bZCv3WsaQ/wOORGIKVk/X2ONLEXbaI4TWc
	Y7RceOSN27VivxKkD+feaoVPGlFySBdrt39EJGhyWs4KUrPiy+Cp57Gs9i+U/THHvF4mO2ggqRk
	pZ6lQOMa7ruKeZeyWnn/61i4Jog3yHK8fMqWMfBMN8oJFl+E+BGlYafw2wWwOQtr0yw/cz/jgHO
	YyRXFcSkctSGVaKHolAYkQNjNpn8X5oW+WqnyJGb+/9V1WVDkS5BpLI7rFQO89BDPLpCh5twQ==
X-Received: by 2002:a05:701b:280d:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-14d2fbcad2fmr5218644c88.3.1790872418302;
        Thu, 01 Oct 2026 09:33:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:a4cd:e25d:fdef:4a3b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm385750c88.3.2026.10.01.09.33.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 09:33:37 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] drm/xe: use resource_size() in xe_pagemap_create()
Date: Thu,  1 Oct 2026 22:03:22 +0530
Message-ID: <20261001163328.51556-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The open coded res->end - res->start + 1 is what resource_size() does.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index b228a737c..e6ab5a5b3 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1848,7 +1848,7 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 out_no_pages:
 	drm_pagemap_release_owner(&xpagemap->peer);
 out_no_owner:
-	devm_release_mem_region(dev, res->start, res->end - res->start + 1);
+	devm_release_mem_region(dev, res->start, resource_size(res));
 out_err:
 	drm_pagemap_put(dpagemap);
 	return ERR_PTR(err);
-- 
2.46.0

