Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C22481FCF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522573; cv=none; b=l9/aLLeODv2bJrytCXcCcTcRVj1YMUAKeEwzypP5omtdmyZ3G0SrsrBz9zxBFw8u+gAqNao4lXYtsmtLmQiZOBI1lghCrPI7hi/DKTJqOF0Kubccvf9xL4xsIiiZSAqkFeyT3+E1AxWWPxa8PUae+P8EI600xvfoGh4JHMoNRkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522573; c=relaxed/simple;
	bh=5nTjrxW57IdkIRPU+UEstMk3obJo2VZuD5Vqdw3PKD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OM5veY/Js591VthlyGkTuWUf8hIJtvdmiwVqJ5BONPFfMo3djDU8XM5no0F2AKWGcIjJ38+F2nrG8ceV3rtSWAajHb6NxMV7mZmipHfsaegCYJDTUAQjEpYeSfwJe3QYmyYC/H+o7avHJuK18OKhNN8w1/e+3FdF9n4W2qBgVuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+lzDKpJ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+lzDKpJ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so742931a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522572; x=1789127372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjCLIyzePlNTkK1yiS5FCzuzSQtJtiHE3r3cJxDUeOM=;
        b=T+lzDKpJIsfZj1K9feQz5qejwoxa6JXMK7PakGx92rD66JufmmvuVagM7zZLauFJ9u
         e8wblqzfAqwRARGW3GYs4cfCQwFeYYCNbyGD9FSvZEvlD9FEmHUJGQLhwht7tTA5Xa3D
         jWpSG5xcei9od8MCKDacoe8vPPFQeSqSFgwBywM3pwUizDY5PDH//d6zYbFG4MA/XF8C
         R1ELpf2aD1p8Cj3mnMRhzQBzBxVUPBYCs00vCjHvS6Qn/LkvAsRFXWRLT7T8wZVtTleW
         2E5W+jsfS/MQelzrwytEx/gKCrGw9SgNLTO0DTdlLvN3W4HOnJsGm/NOA6NJGxw3Wv1L
         poxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522572; x=1789127372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjCLIyzePlNTkK1yiS5FCzuzSQtJtiHE3r3cJxDUeOM=;
        b=RyuAKujS1ASiRYGwogRxIDbFnf3T/MxlJ6E8g7gxbK5wJ3r3eQjqG1ePjijFxVgPKd
         L3DtztGPpoMDfPMUG76tw1q0CRXQThR/USr52TEVPTu5+7pkhzY2J+ahKfmpK5Hswwh0
         RtAdRwCkEGEUMALP4WvsRAo9mVxwoE5+3yKFg5n3GcjfyaTjhRhnE6Qi1ZOzMEnnxxdd
         5IZ4JW+Q5vTBDNvN+Izy+h6vcAJ9+CKXvxY4TyXxX6zaSRa1Wo2ZRGZAu0/DZvoK4hP+
         P0BQ445IPPgjVNSlYewIOCDIJP/NGqrub89BRD2VENKsyL3c292SW40IvbgQfxXqjazH
         xQZQ==
X-Gm-Message-State: AFuF++nwHGKDeLQMrxq6/XaU+mK7uOTJkEx3e4bgdioA7Uar1kE7MF8/
	igdJ9fdqzL8FLbhrlwE1vSNtrw4Bkuh4Wklm65qm+23A9lcXsibfgv6v
X-Gm-Gg: AYBFou0HyDXuvTsf+sBWnaobanJPEwRGjq1gztsJ8oZPGj7UB9+z4VZKV398SvxoPyN
	nvWI9Ff0qW2I4XlWxeyrM8i1L2KOBxiuxml96YDx0Bd+Losv66BRK72usocA0k0C60g1oevnCkg
	fhD3lkRPxv5NgnBnsrBFQ+mwx9fODee/J4GQAbC7zc88jnI1Kx8OfsGWNevbokQcW8T2wWwesME
	F0qbCUxPgNG5FzRDjzIa+V3uI9MXX9l0So0pw4mFA3dpq7dazGmPnfGtv0edfLLLlOHtOzwR+ML
	WqCVmcTl42wlIqUO+5MQCbwZqPZsW/36fkoOOMAqOnVuruDs1JroiObB7rXm0iFJv5LCfb1tCit
	WLCfPZlLZWtBFEqkih83GzITSDecBo/EmX4Cdxyl/QN8DozI8xl0QI+trMnwXbzjgOgj/irVnpF
	gN5DVIRjXYcV+5t0fYlkOsAAzqtJ7dkJ0Ci3FGmaRie0aAQGLVlXf2Ksf9+uo3UyW+eq8ByOcTy
	gNBx4HG0TcJq8tesBEEJPA/5w==
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr7429499a91.10.1788522571824;
        Fri, 04 Sep 2026 04:49:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm6723317eec.20.2026.09.04.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:49:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	mfd@lists.linux.dev
Subject: [PATCH 3/3] mfd: fix typo "convertor" in comment
Date: Fri,  4 Sep 2026 17:19:14 +0530
Message-ID: <20260904114917.28603-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904114917.28603-1-hemanth.selam@gmail.com>
References: <20260904114917.28603-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "convertor" to "converter", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/wm831x-auxadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm831x-auxadc.c b/drivers/mfd/wm831x-auxadc.c
index 744e1d161c5a..6280d4f38981 100644
--- a/drivers/mfd/wm831x-auxadc.c
+++ b/drivers/mfd/wm831x-auxadc.c
@@ -132,7 +132,7 @@ static irqreturn_t wm831x_auxadc_irq(int irq, void *irq_data)
 			1 << input, 0);
 	wm831x->auxadc_active &= ~(1 << input);
 
-	/* Turn off the entire convertor if idle */
+	/* Turn off the entire converter if idle */
 	if (!wm831x->auxadc_active)
 		wm831x_reg_write(wm831x, WM831X_AUXADC_CONTROL, 0);
 
-- 
2.48.1

