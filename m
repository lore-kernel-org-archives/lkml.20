Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546504;
	b=5gg6zimmg5Ga42kw4VIDDl6MnXyox760YU5vvajwm5am4OpMQQIu35fcjp9UJ7wgxosk
	 zbEu/tJZOuDnnUONezwjhxsedbqYQtf33tefFkE7tkqiTbOkKHajAyXS2tZ/WD4rZPYjC
	 dNIFS8a43EjvtQEueQBIB6JRIBMTuvbSF6wb3Go+6ofH+eVPuL3Y5busWv/3RDaZmQ7zL
	 UhzXC6D9DSmZOJHhk1LLvfkxeX1GqUs9ckpuPDTgzI5+/S9PciI0X7guY4SCXm7QigO1H
	 U87QUSu99kbpb284n07B3ASQlp1qmJdujg/z0EuoG5yEQ95rY5k7MFcKSk/bypGaTkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o09ualb3KCuGKClH06bXyCu2n7iDMp017ct6YIx2Da0=;
	b=TGIxlDEE0SlW4zt5VyCDQwjDZ6YtMXXsto+ZGhUuhy/dusFf8vpADFYbnlDsWXuCvmHZ
	 HqWVY9i5UASvn6jsL2V8G9oh2YmrFTEq02JNZvltnS6f7qTdHUHUGmZ/yMt6HSrLBjFHn
	 BYW0C+ihl6T4MCBGki2BuA/zaLtM2hOBRXAe1obhufioD+GdVBw9CV4WUQDWzn6KE2YXn
	 2afd1nHlkVBbs6vHJC8yWekhRYW8R2ngDlRF+PrQ1Gj6KRAoj7Z1jbfRdA8YLMqEioVek
	 9QNBvqN+Bqttlw0NFy9ORnHvOtqzHPRnVy7p3Vr9PEf0VRPdyEe34OzPD6JvE9SimBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T2oUnh0U;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B7D606A88F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B7D606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T2oUnh0U
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc147d86bebso261479a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546503; x=1795151303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o09ualb3KCuGKClH06bXyCu2n7iDMp017ct6YIx2Da0=;
        b=T2oUnh0Ua15UOdvW0arwD7YbBASYBCRIO25GpN6Kq/qpmWz/nrR8G0u7qa9AZlXnc5
         Q3BX8cWRjfkZ8Yn80x60CWinX0HSmk7MK/uXt2dxS8HuLkEwtv1XkwmJbF+nI54H/z+c
         ESjuRU+ytCajKSP1WrLy3eMD8sJt4HCDTyEq7NUZYT9zHf36ahJVokWn9b6H+/EvGNmv
         zgpOz49iXBy4AgS+/ratVOH5ZrDV2A7M7RHOzU8b+UkMfM3Ozq00WnrkNZccbtWAyjYl
         DOKavTWGRUs2RGpi1Q7g1qGIDs4l6yxmsTm/mZWVFnCFbKoSqR+eU3GeXhS+DzqkDh16
         NhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546503; x=1795151303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o09ualb3KCuGKClH06bXyCu2n7iDMp017ct6YIx2Da0=;
        b=udnBDeiIo2hHJ+9OsYDyqbkfXvo9BrzFvk09w+Dz8c/zmgPwNJS/tlRPfgwKDW5OcO
         3Ly28PrWORggh2aPZ5EE9ijUaCRNgJYvRdALuc3mWZfMDipmCL94b03rtbwaBQelVuQE
         Z1iz0Cb83IkRnm/kaWXJMbZdUSGsx46yTdF46IepeFRwELLAi4960+gYHXEQDZrWfEiD
         ZjTC0OMYe23VnwmzNoJKoS4XoFOa098SMhhbdV9EPwM2mOd4isMVpBiKXklCjT8WsxtE
         pzmk1/aHxJwXodhRB5Hga3EPMc36O2d1D9O1yumPgqTBC1K9DepJwjCbJ0awz1llH4aw
         y4lw==
X-Forwarded-Encrypted: i=1; AL+hErHhP7KGlNO1MXwd+You6tShrY+DeVqNncxEr+QXzyN1NYS6QeWc/ycVCNJxc8CxaY8dDNpCD6MS+Q5UjUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r07DI8dR3PxYnwN7xQ6ekTDaOBYJ1iu45cAFW3fMYCNIbHPOL
	LhIlE0ll+IEPI5mz+9kc6/TXs77bkPBM0Da+pTlv+hNcP3xtkc6yWDlZ
X-Gm-Gg: AYBFou33tvwXL0tOaOXV7S4hn3VHpLRMl8e+PJkP+Cdob+4m20FToZjVc3Oqu6Vev07
	+Si+lMkg5DRYBSRcN68QMu/u6HLwhkXnSIRCkztaRxRiKYvd43vNn88VAlagt3XjCNZWlGqKZaw
	VWTpX/faExIfkwBI43h4+LHkw6bucKBL78CuNj+arepe8237cBsoqOmMquaTPwV1Wck1Tj/S6rH
	RVuHG+W9KRfI5Y8IdUzrIX5oRwNP93BWrcO22JZeJXaxRwjkJB/czRchFFDT0bmoUeTjiKNBVsl
	Gmgn5g/vR8SLOeUdBdsa0GAaSpZQEQzXPxwlu2HV38I/d/Y4oGukZY3/bCsHgRgrBt373vV4VUQ
	OTeuW2eyb6u+GqrS/eJNk62LCK08HmtH7J4JVJVkJUNANQZC9zIek2pjoETr3pVnwmxjTMcuwGX
	pv2Ni22dLLvNKdkqE1uLFfLf4uMqjqlTqjAtlKxgZA3LaLXckYpB9cdV+GpANsHTAFECo2vlQTb
	sIXzcs8pilRPMfwKIWKVda1GW9Pnt+m/xAGRmp97WRI5tEHkMNUQj68J3mxAYi70EOIf6jK39ak
	UjJ3yzbfs7sAot2Mu9IyZN/oWSm0t2enn/bYefrqQqR74vTMFHQAnPbYUrj4B1dCxDpMTfBRz5i
	MztZs+FP40wbl+FnpxgFN+l5W+A6W+fUWa6LgERbz4opi
X-Received: by 2002:a17:90b:584b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b1b05b69damr839963a91.0.1794546503542;
        Thu, 12 Nov 2026 21:08:23 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:23 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 6/6] ASoC: fsl_asrc: Use devm for m2m cleanup
Date: Fri, 13 Nov 2026 12:07:27 +0700
Message-ID: <20261113050727.14053-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113050727.14053-1-phucduc.bui@gmail.com>
References: <20261113050727.14053-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Register fsl_asrc_m2m_exit() as a devm action and drop
fsl_asrc_remove(), which has nothing else left to do.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 317ce0a5c765..c8db02f16453 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1267,6 +1267,11 @@ static void fsl_asrc_runtime_suspend_action(void *data)
 		fsl_asrc_runtime_suspend(dev);
 }
 
+static void fsl_asrc_m2m_exit_action(void *data)
+{
+	fsl_asrc_m2m_exit(data);
+}
+
 static int fsl_asrc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1479,14 +1484,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return 0;
-}
-
-static void fsl_asrc_remove(struct platform_device *pdev)
-{
-	struct fsl_asrc *asrc = dev_get_drvdata(&pdev->dev);
-
-	fsl_asrc_m2m_exit(asrc);
+	return devm_add_action_or_reset(&pdev->dev, fsl_asrc_m2m_exit_action, asrc);
 }
 
 static int fsl_asrc_runtime_resume(struct device *dev)
@@ -1648,7 +1646,6 @@ MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
 
 static struct platform_driver fsl_asrc_driver = {
 	.probe = fsl_asrc_probe,
-	.remove = fsl_asrc_remove,
 	.driver = {
 		.name = "fsl-asrc",
 		.of_match_table = fsl_asrc_ids,
-- 
2.43.0

