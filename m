Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EAD1FF7C7
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791594782; cv=none; b=UIhtRVZABI/qRITr/lLvGuJ3gblN/qmw3Ko/rPvXC4sHxVGvaRM4H0mYGjXhUTjZHCoEPIdSrwKlmTt3ZqlI9GCetoFFM9AJsZcOsaP1RE0kyE+IsSSmgDOgcf35yPaaBknfLAjhmyOFqdzyxPcpV7ql9FlhXhkAU9gOffiKl3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791594782; c=relaxed/simple;
	bh=9XEP69e9AS1aJwPfVE0uTrVJO7fAgLNTiuKcJbwcmXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GjJey61/72aOLyka6+g2ExlfQ4WjtjpHtXdaeFQrv+pvkfMyhiGMPE295Mv9NcHkPqEiPaCeCOz0Imlacs9bxzi/X+sim8bAByufJC+OBA/4Bq3J1GONq88iwSL10gDY5J2lTWeg3JwHoN5li7+YwpFfGRxsLBBOMUCVVpReNcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOqQyVcr; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOqQyVcr"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-88b5f43cb8aso58649b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791594780; x=1792199580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IO1BNe26oBM4Wu77xirUP/cAXWt8h3ep4ZfstecuGpI=;
        b=WOqQyVcrzLiC1vZlsYAMwZNMjfDPoqAqG0/Y7u+r/eCATOhhnsECAGJ7TNPbuKqnes
         pJ6aa2UgL18CQswryfM9EDwW73Z4b4uze/ZKjH7tb1tk7BPzpW3B/2XB2JT/d443XQ0M
         BalK54gatxhh18lgxFOV2BOLXmj8d2X4rEueXd5WBiBh88+Ux2/w6nreAt2T1JFewj4N
         HGfvMlr84OhNlP26f16zByoeuiOM6l46mowJ9NI65I3fMVNlVnfIEfy11dU+iDmHmfAm
         7yn6gdnDeSyidZH56eAm7wra7fLk2xwjpSVgIRWP6yjB0gT4+7/oWj3irpvCub4rqVzz
         34dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791594780; x=1792199580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IO1BNe26oBM4Wu77xirUP/cAXWt8h3ep4ZfstecuGpI=;
        b=XA953T9hS2yOwD9+jql+YANBBKZtmQiEpD3CiDE1rSfBYunBJrke2XvpKQWYN9+0KZ
         FyRK+BYtJGdgWYz1c2MTVPTn7tGJrksHbK2bcLuYTF14vQjq/VB47q7790AjcEmmfcep
         x2zv26TTplC9Tmd24Nc26ucbAAiRmO6Y0lo90D4l3jjIzLNrJbbKLGiJtbNJ9Kt5NDEA
         gHqmgLT9yFiGRrA5eoivdiiBlGpmPFbKduSfDwMdxopsbr3UDXQCCn8x39kTGZmda6aD
         znEEUfHq4Wxpagg6UMr93z9NmTcRpF40t+iizsqDYdCnWsLP6mqGRGHCswsGeZ9XlARe
         ubgw==
X-Forwarded-Encrypted: i=1; AKwUvBwAAapTj0ZIGUi0THPMASxPz0v+f/GlgZwHDxfbzKo+uRcDrh6iUxWS/V+EjbQNs4LUR2Xvzt6lXf13PoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXclPfoqTKFJ3Rfzzcg5ZXAH6g3eySNkXzo1wrmB2j/OjxFOmG
	VrA25rSsTOtvDUlaNOBvClUNkVULDF6Eh+13VVm9OocsnxsSTukGOzdL
X-Gm-Gg: AYBFou2sW+LdLKWFRwbyFzjCg7wtGD5crr6zcbs9WmrQqdEvEJqTXSrECqzoT1F5Evm
	XTI5WObIkaEs36aPAx4QEPpf63hYmqAKnJIskHaBNydVv93LghFiUVgJ0oBJ/7TFIbVanpP9zCy
	js2flpHMAxQjxOH5e7utNpoiJrQbzN+kjgt7EWyLqPiFmgdFu8vdvUAjozsrRAgrWdfjR4w6xtx
	zDYIGf0P4HwcFnMs18V6K98zNPI0T2QA6gqYeLkSbhp+d6fxlTeL5MM5dD2VUtPICdHvmFKwK8D
	W6mBJkyzk8aE+ftXs7aQX92ZQRlAotRqP9Rgwqq8jXgozR+qt8VZE3Fz27uJ7XDCFm1qEwQfHp5
	BGqGMi5s5BQXEpu3BiOHO1/7I4Ik7FBw2j5TPtwMrbj+jWkcqPM2NvDy8X1k2dSSXbI/VhmypkU
	zQaso2tTlLA4TEN+ijnlShtXni+/LxZ26No5Ca49xAk+Og76ySEBmSg34MsK46HChdvOfa1qAas
	rAxVhud4rL6njHSAVMCbfB9bm09klDiFIhKdxgB+vUGFNj7n5IMAidHY6j5iSh6zdiWbjsfZNG6
	nAYQ01YtOOUNxSTOb8pQTZYNFNNUPawJOipzfHNK7v4M9IJF
X-Received: by 2002:a05:6a00:3306:b0:882:2195:5a72 with SMTP id d2e1a72fcca58-897c82b00b0mr3173996b3a.46.1791594780355;
        Fri, 09 Oct 2026 18:13:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8985a414614sm1139749b3a.51.2026.10.09.18.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 18:12:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] firmware: bcm47xx_nvram: don't warn when NVRAM is already copied
Date: Fri,  9 Oct 2026 18:12:58 -0700
Message-ID: <20261010011258.1059235-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On MIPS BCM47xx the arch code copies NVRAM very early, because the
board detection and several drivers need it before platform drivers
probe. With a device tree, the brcm_nvram nvmem driver then passes the
same NVRAM to bcm47xx_nvram_init_from_iomem(), which warns on every
boot:

  nvram already initialized

The same can happen on ARM when the MTD fallback reads NVRAM before
brcm_nvram probes. In both cases the existing copy is the right one,
so log this at debug level. bcm47xx_nvram_find_and_copy(), used by the
early init, keeps its warning.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index 0ea5206be4c9..3609e1356065 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -112,8 +112,12 @@ static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_siz
 
 int bcm47xx_nvram_init_from_iomem(void __iomem *nvram_start, size_t res_size)
 {
+	/*
+	 * The arch code on MIPS (and the MTD fallback) may have copied the
+	 * NVRAM before the nvmem driver probes. That copy is used.
+	 */
 	if (nvram_len) {
-		pr_warn("nvram already initialized\n");
+		pr_debug("nvram already initialized\n");
 		return -EEXIST;
 	}
 
-- 
2.56.0

