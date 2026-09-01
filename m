Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C8C45A285
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247802; cv=none; b=OyEGKmKy70/qtQtn0Ja03aPW3JwNyWrx0ohsXc0QQP8NQynLIHhepZm8E3sh8h/Sogz1k9/ObOHW4PLNnA8f7sMzOvRINHr1lxm/DbxNMzzuTNOiCt1LIO/8gNC1I5SwelpZtszGJvR+LvSj8tvVVpAkaW1CZ7F1GzXSHyWkq/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247802; c=relaxed/simple;
	bh=uf5Q4tVIO2l5Mn1F6h8itqY+9CISwYR9KzVRBogY1DM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nFeQYXJswarsVTwmX2tabeepqB7KxosIAa7gHuwLSkOot+AtcOEiOHAI6I94MhluOk6F+5j7bWC8JrL3XXRUw9W9vRmVcxzr44YOW6ajzT2KW6SSy9UnNu6zV3nZR+7Nth4BFKG47QzzHgjOAbAzWcxYFSSMyaWCATMN252zn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+vx2H64; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+vx2H64"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39675172593so3930524a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788247800; x=1788852600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+8A2LQ5vM3BigI+WhOB8dsA95qvFXB16HXhk64vkm4=;
        b=J+vx2H64AudZnoD+QI7/zXtlCSm9fzDIiecx0yZv6yKCBih+KZzoK8iDiHzbDN1tBg
         8b2OBlg87wQHVV8asbp5nzMysy9qbXwPoxBmudVTrklxvk2mjI55faOtx4cs5VZcvZp0
         ctyxeUgjUi+DZUJY3nD44cZAnxw3+bXu5TgtTh/YUf5UDfF5Ng1Iy6QQznkDXtbo4r1s
         NDt7fqzqQO2iNC3Ls86VGh5ux90XRHYk+00PeQ11pmihuZUhBYIxe4b8lCMjCaYeJLlQ
         xaQeNDH7bp8nDMrNT4pVV67f3MSi7QFqVEztFu9RX2tsaoJkT8muPHFV+VXLlXRh0Vl4
         0XgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247800; x=1788852600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+8A2LQ5vM3BigI+WhOB8dsA95qvFXB16HXhk64vkm4=;
        b=e4UfzJKfeMRZmw3bi6hAiDnebAcgQ3Iz92LBShsKRFgCKGxi94iKrB/Yvcm89OA7WF
         VBTdY1I4fQdRL4yyNkw4AREd3sjFDZT1++5lvKsWYZW0XNydOXK8GlXwsIs0JBBy1mfa
         Wv/YnX6HKiWcLO69/JanLYnM2IQHGAIacd7vrshXVMBtUxjG+6Cv90FErhN7CtFAnv4N
         yCXB5kBTIWkQ55ZNwhrAevx5Ntm+lwuGpO/WljAgRHcoR0ayZOb/TtKu3j5apwMcl0kn
         YPZjXFzaNykyXsRe33oK8k6vJkblM0HWuNpjQLnrESSg3U763UOThgltAkYPkgmB+Gxc
         txJg==
X-Forwarded-Encrypted: i=1; AKwUvBwWwAjOtKev2NCZiUblB4udX3grpc/389jT7BNKTaxyqSkJ0qG7OcRoBcW6kWHc7MufSpeXxgJGI0Aontk=@vger.kernel.org
X-Gm-Message-State: AFuF++mpRPgZiayrF+ThVTs7uf6y+fsjv7sidgJltlBCExE7oADW39Bx
	I4rgHo7M+NJX0Qw254i2F0YPYQEIIZxT+F0JWhqm38tbmRySXtlkIqd+
X-Gm-Gg: AYBFou0KZvuACQg2BwZ4fkVtS4DQPvHESzCsm8oEx/rhRyoAuOpC6pKCCOi4RniPBtX
	m0A3ynXXa3fGWCH6UOSU2mz8tkJ1XHMzAwlXxwkHV/AWaFW5zV4WNKdFMTGhQnytkfzmtcyraXx
	zssxJnJF2DBSjoDIbqS0GHIpbATNi4O1qmphn4swAcCHu6oqu4jSB3mUkGDT2uZmMQN28j/P9nR
	0TQH87EFvePcUhDneYXuiWGFpYBwdh1ZTEOPWU/Wkq5K/+vV0yuVFYuhAtxX4JDOlJUWSiYpWUE
	pyyRZUH2bz/0G8Zm1np9Nlm/C2w6IsskQRTKI9rLGGerXaraB+YpMSrG1HgqTA8Xy46vOKRn8xu
	uk5i/nJPPCPth3YyYdPJLc0OfadsDvf6okDycCvm648zvGVfg749Blb7Lyx4FigYIEqylKacOYS
	yxkLWolAnj795kKCwlyTmGi+h0i5j4+Nh6cs6xUGuxqqDuFkiBTb/ZJ5wBywsh+58mBPik
X-Received: by 2002:a17:90b:5284:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-396d0e5f5ffmr50882573a91.1.1788247800366;
        Tue, 01 Sep 2026 00:30:00 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm22117403eec.2.2026.09.01.00.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:29:59 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH] firmware: microchip: use kzalloc_objs() instead of kzalloc() with multiply
Date: Tue,  1 Sep 2026 12:59:50 +0530
Message-ID: <20260901072951.525569-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

response_msg is sized as
AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg) by hand in both
call sites. Use kzalloc_objs() instead, matching the kzalloc_obj()
already used elsewhere in this same file for the other allocations in
these functions, and getting the same overflow-checked size
computation kzalloc_obj() already benefits from.

No functional change.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/firmware/microchip/mpfs-auto-update.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 1211fd8d0463..b97d34bd2354 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -156,7 +156,7 @@ static int mpfs_auto_update_verify_image(struct fw_upload *fw_uploader)
 {
 	struct mpfs_auto_update_priv *priv = fw_uploader->dd_handle;
 	u32 *response_msg __free(kfree) =
-		kzalloc(AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg), GFP_KERNEL);
+		kzalloc_objs(*response_msg, AUTO_UPDATE_FEATURE_RESP_SIZE);
 	struct mpfs_mss_response *response __free(kfree) =
 		kzalloc_obj(struct mpfs_mss_response);
 	struct mpfs_mss_msg *message __free(kfree) =
@@ -358,7 +358,7 @@ static const struct fw_upload_ops mpfs_auto_update_ops = {
 static int mpfs_auto_update_available(struct mpfs_auto_update_priv *priv)
 {
 	u32 *response_msg __free(kfree) =
-		kzalloc(AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg), GFP_KERNEL);
+		kzalloc_objs(*response_msg, AUTO_UPDATE_FEATURE_RESP_SIZE);
 	struct mpfs_mss_response *response __free(kfree) =
 		kzalloc_obj(struct mpfs_mss_response);
 	struct mpfs_mss_msg *message __free(kfree) =
