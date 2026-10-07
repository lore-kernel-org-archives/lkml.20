Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EFD481673
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791375605; cv=none; b=DwEVj2TWcE9jof5kO+v2end0A0FRgeIJU4d+8JOC+oSouE2e/bg6mwJqeOvJrFTEiG/37EpCcuqPROkMFDRxQWTfBOu20qbphNw3FPx05gGSv+x2iRdXTqktds3nsqakpIPL9lULwObo03CPzY43T5ZdrhwlrWOYGdyXPluyG3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791375605; c=relaxed/simple;
	bh=HO0LJWosym4H8VYn4T/vc1pik5WpsxqAeFM1v1UkD90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tDnfBJ5/Wx6GEo0FlkgCbWAIOUKJNH7ePK4Py6Rlyxbf7Y8CcWIh3J7Pzf5qCVd42V357R1ae4bXotDR6fgFX79e/tbv6CkkZiSI3aPavC5T5SR+lojgPNM1FJclbd8U7WZq+tWAECkY8jhTpDQ1jUADgDCRMDmYkY7DrwfPfg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDFK1RzY; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDFK1RzY"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1014030a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791375592; x=1791980392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJgd37GAAGOynCuOtDFQNEeNDITfTTm77Q1swyZehk0=;
        b=NDFK1RzYp4xTQxGdSDemhYDx9LD7ExjJ2qvx/Za02IRKz1ejkr6juKYpgH779tNnTD
         86F1wUEFJIFNINZXGFoFtUVtDlsG5iyogdxvVSjrXc53IEzahQNQGy8JNZ8L5a54fj1a
         SdEjYPCMaBwUS1376YAkwfN4P5JWJcXN7V2UnL90pcTf7d208NCxg/a18utoEh2gWFml
         XDOhaTqamZ+sf3yIVlhwpTgka6Tkch+Y/fKCIlLsjiJanxENOaj29jfapnoyfmS7tq5P
         ojGmRK6DBaxBcpva0F8HVJCRbKqHxVxaBogqNpsf+H0wWhS5jeCca6e0SxbeKAiBOVkn
         eMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791375592; x=1791980392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJgd37GAAGOynCuOtDFQNEeNDITfTTm77Q1swyZehk0=;
        b=HPIUKwvyF7A+qvnxmrY92kQDawFaHru3IHX2zjKEJPRfnFKyNvUrOZBzH7FoCnm+yH
         lEpgQg96W6qKaMeHpdZ9E5fa3KA1sKsWLsZeMG53KWsaaQZagE6tYNjfOh9IeIhskd43
         WjUv4qm1dcUojVk/2OcV8Vp+eimMAlOZaVeTcLYIH+6ISyG1/lLTCWWryA0kNwsJAv0B
         SwrT9JzvAovtz8ZuA2hF8RtI/RV8M+EMRQrH8uak+R0k/856KXKFD1Ptsr7Hrrf4ZmJU
         9ypn+dOecysv0YnAuJu7Qw2qEEZi3xMkZU0cCoBrs879RNWoGjp1UmMgXJfrXyTiTcd/
         stSA==
X-Forwarded-Encrypted: i=1; AKwUvBydKN+ZdLLVNUCcbT+FDZIQdT94CfSJZ4sMJokDZ4uSUDBuOkSL+NC1Paw5xkBhT9lHaTLGKwfTjeuQ/tQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNZTSDGkbUyDGlrnXgeZ/a4EM4czJ8AVZu9HKA4AQZr/Q9XIIy
	vUUHcbAQKoMm+Pw3yrIZAOPa08N8P8N4+hS0Q6XIHt62CLiq7orAdye1
X-Gm-Gg: AYBFou2s7qSMt+uYMSu/Dig1vNUuEOYoZLj1e+JcrvBmjnNSCUxstWTFKVvOQwSvfBI
	S6z9zc2/ewOn0fS6sl81HDa9upbLJO3ngVqNLsj5Np4iuR+dDRWLVMO2wyJ3A/xhN/YeggKJqE5
	iJTq96ZNBZqSm0Aodj9TRFVFci/3JchniIqn5C76QHdyz3aXeoCWGGx5xXcr9wHlN04SKqO5HBb
	rBn41SZbMMRRcrjnDs9ne3gt42OyGjuT31yqTFKomnr+O2il/DlLIEeIURNZ8XRpZBHl+nnNvnO
	HDDyB8Sd9+bVGrcmrZXGelBxcUpiDOs/issXPENjVLGC9ow4YcJfzUpEeLkPevVzXE9S8Y3EEo7
	C6hlrqN70irIIsRfNFHJGhhr88dDgL99mIraJS5lX0MMJdrb9KpRgEcETxN6itRd9h18Ah2AcIl
	MtZdtGDubDO6IlSEPwd+x/h7zu+Hz8LQwl8Lh+50TLjxV6UvyvXU326Q==
X-Received: by 2002:a17:90b:3c85:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a8a13e6bd1mr1312260a91.32.1791375591372;
        Wed, 07 Oct 2026 05:19:51 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d5e19c1sm1888589a91.0.2026.10.07.05.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:19:50 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Felix Gu <ustc.gu@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v2] soc: mpfs: use kref cleanup on probe failure
Date: Wed,  7 Oct 2026 20:17:43 +0800
Message-ID: <20261007121743.192486-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After kref_init(), the device_get_match_data() failure path frees the
mailbox channel and sys_controller directly, bypassing the matching
kref_put() for the initial reference.

Use mpfs_sys_controller_put() on this path so that the initial
reference established by kref_init() is released through the existing
kref release callback.

Rename the error label to reflect that cleanup is now performed
through the kref helper.

This issue was found by manual code inspection.

Fixes: 75ef23397558 ("soc: microchip: mpfs-sys-controller: fix resource leak on probe error")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Add the missing Signed-off-by tag.
  - Rename out_free_channel to out_put as suggested by Felix.

 drivers/soc/microchip/mpfs-sys-controller.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 0400a01b2338..ef27e1083f0f 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -159,7 +159,7 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	of_data = (struct mpfs_syscon_config *) device_get_match_data(dev);
 	if (!of_data) {
 		ret = dev_err_probe(dev, -EINVAL, "Error getting match data\n");
-		goto out_free_channel;
+		goto out_put;
 	}
 
 	for (i = 0; i < of_data->nb_subdevs; i++) {
@@ -173,8 +173,9 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_free_channel:
-	mbox_free_channel(sys_controller->chan);
+out_put:
+	mpfs_sys_controller_put(sys_controller);
+	return ret;
 out_free:
 	kfree(sys_controller);
 	return ret;
-- 
2.43.0

