Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFA54A3F08
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360497; cv=none; b=Oc2jBkgSNVxqkUK2bMGB3dId6RKoV0O/CtWGeevkMDpWu+O9+FxjnyL5AQGxUvCMj09sO2d4B5Iew3kI0lasu51DnAK1GhDQM/0d7KggiyZARN3vxFDmNNeVneoTMx9SMfhBExylPl6MQp93OfClad8z24+LLFEQ87Gt3k5XOz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360497; c=relaxed/simple;
	bh=KBvGyZndRFNH7A+aRyxm6OCUlXxf5CVdNPV3tEt7/zA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H0kWnBTnBUBYVUQLfaqZkzN+L6DZztiFTsgwStT7Rxv2lnMQ0DYC4FURIvqqCuKrC03Aa7QEqNfYylfSJy5HKDvMWFGvJJNL813/op3tAhGKEbAAPu48xyogMolQO463brDp6Ru0/kQsSe9Io/W5iqrIg8aSD2eNFtSNtAQfsi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk9/ioTh; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk9/ioTh"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca12086c06eso975605a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360496; x=1788965296; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=igrO6BmbZGa/2QiOILMtmo7WB0Pb5Pir6y+0YnlM150=;
        b=Tk9/ioThzceOrw92g8VPJy72PUOwz+x57e+N7oQ0hFI5ms8enJEb8qSbIISDBGTE4M
         f8iVcN6gBHcEZ+HZlAae3HmG2bKPVilR++U/nfoot0qBJXSRscKKilaL6xZioP32609S
         GeBhDaaOCKA6SKbh562trFNBOQ9Ngdb1OTrkchCZYvvJjKTv3hm1A3hKRL2Q94jmy+5D
         D5+VAvOear71VKLoOOzkPR7FqGe6NQgggP5Scwn4qHdTFEMCWheUxCpDlSj7Yu7xjJ6x
         nU/rc4WzAtUpnNFeIUB6nhGZB9uJ9enIujumfH148UNNNoqlGypySwBIBzRLI2Xu4Fcb
         AIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360496; x=1788965296;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=igrO6BmbZGa/2QiOILMtmo7WB0Pb5Pir6y+0YnlM150=;
        b=iIJwkA4DglpKuqvGqMPc2O2AYe8N97As/4B0+pNC8NpfXolcgQyxe76C58aQHiYb9O
         BR8OJeuuneEtliCuMO++sfehYnE12ZDbKA2LL68trKinlHY693lUPRBH6yJSLZs3ACXC
         JanBieK2rPTBf0LH9uu8OD/PzXBOuT3iuZUxMJdwhw6kJcYEDSe7lrqQLFKJG3EjRbqz
         bW8fIImUV9YbLOYsPndRitkSWHMogqUxajoWWrOtG1zuuErTJXc5u2V+a84OYqMcF2k8
         8/Qe3gZqQKWPDu7hEv0PWSVB2CK1fjTKZMsb2vxXo82MhxbBfR798B3SLjBGQKyp8MRl
         X5FA==
X-Forwarded-Encrypted: i=1; AHgh+RrcvYOxNvCDOGBt3v61YZhskQa4FVRMjrqUH992aa8TWo6FPT69Er2+6yp6fFZLKJH95gNNbS9ZoYkHONQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k/7GMFSHjow+0l7YgMhre2lgnMTC4FUynH+puM+wQb7JSgx96r
	OreNTONxf351f21TRAR6ebcSe1fyCWgChfVn13xAHbMWRMBHorzsGdgOYmBNtV1vOsM=
X-Gm-Gg: AR+sD11CVttjHZj+k5T2Z7bilcXft1A0T9uu3MERpNDxicUyfTEYgl0YVYKSJAiG36h
	ULSVvLgiRuU2cVDCy4O6sMgEqZhhewh7VRrbBvz0VrElu4dX5kOFotU3gx+WTOCFpvinhpt1W0g
	OBSfiRjxNUjQmbRKpWdOiLs+i5YOuUH1iNJCRJC2eLnDbzmxj4hIvLF5zPqkE+DlS00/+As3wxC
	+N63AQceF3qtD3s+pKEtTuRQayELqMYICTvm+/6nkaAHil6LCzwuvNkuSZmk2ZkI2AhfT5JmaKr
	2ZZJzuD8bwz995GrCVkCoIWOdP6/dZTnhVDGTTFxcjmL24gTmy5eTu0cGhZdJnv+4EQtepnymlV
	3BytIpS2L+O5E4oOeDtS/lTgGT530jgrls4vGT75LY6ZyAjTrnL9xFUaFmOrdfaamE/CQK0ArJo
	rAz8eiaFl0H+9ZKR82BXnD0ant3xac2gqH4oVRB04U6wL4VxBo69tyNcsJ62APOnjZ20eHldJmn
	BGxWAvV5SvmH1PEC6qG/JesLuJ+kHyI0RzsHGucE/u1a/M=
X-Received: by 2002:a05:6a20:d52b:b0:3d2:2011:d184 with SMTP id adf61e73a8af0-3d9afd1cf93mr9852517637.14.1788360495601;
        Wed, 02 Sep 2026 07:48:15 -0700 (PDT)
Received: from [127.0.0.1] ([2400:70e0:b000:0:be24:11ff:fe0b:281d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34cee275csm1169201a12.14.2026.09.02.07.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:48:15 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 02 Sep 2026 22:48:09 +0800
Subject: [PATCH] spi: mxic: fix ps_clk leak in runtime resume
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mxic-v1-1-76806325826d@gmail.com>
X-B4-Tracking: v=1; b=H4sIACg3mGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwND3dyKzGRdg2SDRPO0pOREIyNDJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tAEaPaCNoAAAA
X-Change-ID: 20260901-mxic-0c0a7fbca221
To: Mark Brown <broonie@kernel.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Mason Yang <masonccyang@mxic.com.tw>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788360492; l=1048;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=KBvGyZndRFNH7A+aRyxm6OCUlXxf5CVdNPV3tEt7/zA=;
 b=7szDc4NAg3wvG6W0sQN9j7/g27Sh9eKLAEhxAo1JXz1LxCXrzoEkK5pL8iCM7Z5IuSJOcTXHp
 8MODiqXnJK4C9OJiPfIZkpEXHuZlm9Qd1uTf4b+J/dUNcjd1PA9OTxG
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

mxic_spi_runtime_resume() enables ps_clk before calling
mxic_spi_clk_enable(). If the latter fails, ps_clk was not
disabled.

Unwind ps_clk with clk_disable_unprepare() before returning
the error.

Fixes: b942d80b0a39 ("spi: Add MXIC controller driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-mxic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index e3c85e5191e3..481edd4b35cb 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -744,7 +744,13 @@ static int mxic_spi_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	return mxic_spi_clk_enable(mxic);
+	ret = mxic_spi_clk_enable(mxic);
+	if (ret) {
+		clk_disable_unprepare(mxic->ps_clk);
+		return ret;
+	}
+
+	return 0;
 }
 
 static const struct dev_pm_ops mxic_spi_dev_pm_ops = {

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-mxic-0c0a7fbca221

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

