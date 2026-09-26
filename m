Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A8C37E5E1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439905; cv=none; b=DLRvYQtXmRXeUPeXofqK1XOO5Kz/uCcq6YGa55jofAlaW2nYpeRNfrjxGk2DWWQ657M3ItlbUawyGg8p5eWROCJj/NhhTSvhqYHWjWUIgKMdjABO2Qo/0xV+d3e4J59uVPV6OX91EDCj3n2uInzOHyWBYUYVoaDOeoqGHIHWmmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439905; c=relaxed/simple;
	bh=yEAjJLLW2mUFewhC7K8QsWCSw5B9UcetRCPCEY9zmDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bWTrJcGqLhwzTm2wWWo1sueFmgWXPtowINUUBEE91k0HfyVmSve+JI7Yaom5mI53FhIeqm+dyK7E8a/foXNJ5XhXpf/ZTBCvRhxF866KfK52gOGtK1RO/76XyTjR26lnWyLVbdUefMqcKdMLubbyryFhD3s3H43XBaXHOy/Hq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FD2vFnm0; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD2vFnm0"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910ad20d4so222148785a.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439898; x=1791044698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcedmEUDuhdephxMCHT6cYbYrSuUGs6yxAq+AhOHg5Y=;
        b=FD2vFnm0dh13lq36yhbZcJkxuZpHykvICWazMvo8dOYu/KPrvNJW2UJ73CsPtrdAhG
         Y7SFkDzkIJoz2AxLLgGJJ81sog1bQqp3jFilNlbwxQuxl0LRWMN89EGe4gnsEi4uhRku
         TyVzrLG/qhpIB/p2ilOFx6C13CjK78Mw711+9dyWstrQ5842aJAsHcsKD4QfpPrPpC5O
         gscdDvik4Ck/qfmQ0li9rKHW3VSNDD5MVkUfPpSNqFaSz8hJbdGDjnOhdDD2+QZWafmh
         rjhlqMv1/x4zYA49Y6Hz+vt3Mth2Q55NxGZTIfdnU0tHzYXMN5p5ZsN/JyOk+D7Ngt5X
         eGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439898; x=1791044698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcedmEUDuhdephxMCHT6cYbYrSuUGs6yxAq+AhOHg5Y=;
        b=goInxrXjaCbnH3QVbzY1mkojSaYjEVIMML6zFWvhPDzSZOCMVKhM7ivyftRYeOR2Cw
         o94v5vXBrOZZr+F8TAGPGHEnE6hhCYGWJchr1Gmq01bP459SymugqSmRxusJR4AZ2sFC
         CZlCzOMEn/A0pGqqtOkMNopbxXhGLGztYh2arIMB6LipDFhZJnaUDfUG7Y+5QDtXkvGY
         JDp9kZbXqH/vafJh/2LYjqYdGYiLtDx6haBnie/HzdlyG6CyWxBMtV3Ty/1/YGSAZHk3
         Z3XnK3/baB1esxEDdPe09IOe/dt0rlKwCZdOkPlsmLKoOtpZfMvMjyEUTWG+qFhmRTdz
         JAwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuynsIbxtlxhvRI5C+hWdb4xYYTjU791vUSwNJx3e/bXdsg9PjP4AV+T2yU3S8QLAYIwtMrFzi08J54ZM=@vger.kernel.org
X-Gm-Message-State: AFuF++lF4Xz0lhTUuakZTaqPudCmZN9Ryi4gM4xfmrPcAJDbeV6aL8TM
	eH85fwtR68diNGu/aRWQxGN6I4dxLr2N2lyxplvurKtO5pMFxwkQGDNp
X-Gm-Gg: AYBFou3yvYlHgHSioONU2AVkqY82svXPOXc2mEgkbntcHbF/oVpLqCZFUP9oqR4U5z1
	MfCIH0yu6HuFxoJksoAgntyYXRTe/CKhD1GAwU4P6nxnyAIaOLd6kbQGmQpMJqL0FLscipXttxW
	mjJNGaAN1+04XfOQGBSM70ijtTmx+Rp3UkJJkCQaSq54W3QqOUjXdBWTfcjp99DEkMNBRtFzzfZ
	nCiVxPsdZWCfhIEDBZ7kJ62u0TdkOd/xFjCQ+B9DipNyjurFoyU+2AUwuTL+rLgPX/SoJpesVae
	WNsxIJQ2dWR8lU44DUxr+X5Mr+UBFTpHzNA3oVJDOC3B7PiwygGhW7XOHeQTDcP6xywO2ZoFPcO
	miaygzqjzshCCgZEnFUoLv2mbbhstO/LW0sjL3S7ayc9QNhK4moBWZdkPBDDJJgucknj7QWovJn
	2GTmyDVOeKDN0/aFUI+OMsSftvRGv1l96N2dBv2lNJBKoPN/5moRQlARkVY1jFwSLSCA/R8bRL2
	j3cyxZ2vPSv52SPfV1XYt42idrUMXgtaOMcjGfZEvm49vYh
X-Received: by 2002:a05:620a:4809:b0:939:6de8:43dd with SMTP id af79cd13be357-93c47511ed9mr943179885a.49.1790439898560;
        Sat, 26 Sep 2026 09:24:58 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448f57b1sm448507385a.22.2026.09.26.09.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:24:58 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7146: remove unused dump_registers() debug helper
Date: Sat, 26 Sep 2026 12:24:45 -0400
Message-ID: <20260926162445.25173-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dump_registers() is compiled out with #if 0 and has no callers.
Remove the dead code.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/media/common/saa7146/saa7146_core.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_core.c b/drivers/media/common/saa7146/saa7146_core.c
index b705c4bcaffa..92b5be153613 100644
--- a/drivers/media/common/saa7146/saa7146_core.c
+++ b/drivers/media/common/saa7146/saa7146_core.c
@@ -18,17 +18,6 @@ unsigned int saa7146_debug;
 module_param(saa7146_debug, uint, 0644);
 MODULE_PARM_DESC(saa7146_debug, "debug level (default: 0)");
 
-#if 0
-static void dump_registers(struct saa7146_dev* dev)
-{
-	int i = 0;
-
-	pr_info(" @ %li jiffies:\n", jiffies);
-	for (i = 0; i <= 0x148; i += 4)
-		pr_info("0x%03x: 0x%08x\n", i, saa7146_read(dev, i));
-}
-#endif
-
 /****************************************************************************
  * gpio and debi helper functions
  ****************************************************************************/

base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
-- 
2.53.0

