Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891989;
	b=1PImNQxkscqcryFKLEuZYd26XRLO5aMh7eL0W29o7tLs8G1FseMABob2vR2G8cMF1Jg0
	 nfhCSvsr6co37yFl3IurrWSockqoe1pa4oVfNcPAU6dZqfd5uQNeaqN6WGdJER3quPspD
	 oMy3+/irOy81sWr33ZHseCk7dlUDJf++yDd0U062DZAslsbqTlWI0mDrlp2HEhZLCbC6t
	 h7ruOf93ZUMaGYsY510wg5H+JvpBvU5pWqEHZTOPF+ZO/aC7bnsISSAL0hHif1B3on8yC
	 ZEn4MoQmc3Y2zgc8r+yLtfAFtdIAILoEwonRy0nEtVHkT5BGEw3wMhAACLXosyulgNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iqKgCijpj9ab+BkBIEugALnlDmONm52bKTuzp4FLzzU=;
	b=uoykL2IvZFfe51DKlUNwy9wLcslRTYAGQ9JBZABwGcxHaWBbDep5wFguxZg2ZGW1CEPG
	 juGwxwt7XJOxtEI65FXlk4j8/cBiol4wH5m+1YKoZNabQlliEQXwNdOVm4rmlq3KO2LJq
	 iWStVSDjvzBLUx8BAbptX1zM3khB+LEUmd9CAwC/5SRrGjR+WRaIHLZ2CIM+Lv4Bbdbsh
	 tSpXlrkqFikF2MC4jVg6yee9qfpDq7gA0V/VyxOg4ML4Kd8/VrR5CKoOPCq5pkt9cb6fG
	 DTuTD1w6829oS4o/LcNTI1IPS46uRnqiIus5by4srBpcrklSf+VVTh79W5bfeHpbWUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ms4pqF23;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7BD6082BE0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC7BD6082BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ms4pqF23
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so15560945e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891987; x=1794496787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iqKgCijpj9ab+BkBIEugALnlDmONm52bKTuzp4FLzzU=;
        b=ms4pqF233nqWrjgmJEtwt+z25wy1UCKh9vFFfYLj/Si/kmHESiFTsNoOFZVmPsmEtD
         F6L08K1a542ic++SLs/FeFcUKBoPCOczUrHqV/Gi2fa84dob9nCqyVm2OsZgmZncQs2U
         VUawwXtqSdfVGnhpvLvWzEwOyDl1N6i2cMLZWqyZwCFhqzjhAi3PFMYEpzjLYFu4nCEB
         HntE4C/ZsQGlfZ36PxfGMXWOq3XmFfrCliIHhEr/PpazuyDZ/3uTcRHsQwbbMmbMEY2i
         /H4DoBREF35VxDIsMjQ2Eyn037A1olR6IFo4UlZKQrnDdhfBAz2O8lCadvPOswNi+K5p
         bRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891987; x=1794496787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqKgCijpj9ab+BkBIEugALnlDmONm52bKTuzp4FLzzU=;
        b=xjh1XI+Dr9GspHpijoV6yha7+hTM3PbzHMth3wXfLYUq3tnYHRB37r8RMLJvYeXLi4
         js5WVEAk2dB1nS19I1iXOHi10YDivGnhdegne9e9lvAOhQdiTXPEeKchwiqcLHFXIqbn
         PmKUFg5m72aU/+yfsxq8K0847BAow2rNqztYwb0Du8B4JPtUtQvYzQC/TFxkhBgG/IVq
         UwJR++TBlWdcnC5kfCaC7LJrKIys9PDSniKDwuNearXjUM0szfVRpxMdgx5P06lDYNRW
         xtwBsgjCiqTuFIVaMTtgOh4zZJ3ZbNNYbUlNmQQItMOPJVtlhNmmh0BNwkUjqZFPKMxj
         AUbg==
X-Forwarded-Encrypted: i=1; AKwUvBwRkLxGtt0Zlq0sknPu3jeECsvPY/8LnHcHpfkp1XVan2yhcERWkPXx97jfZ4Uc2If30pfNO5O6IUWMmy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fN1L3CAyXspC3ad9WIYI/7AA/oFQTec4rvCToYUpa/HjHibI6
	epa5L8wFR5PfMtzk0gHBFZpslOcNFKc/7GpBuElceXDi1qpO0XB6zR4X
X-Gm-Gg: AYBFou3dcHsN6LLwcgWtF5LpL+MR1SrQY486Qkste+Mcy3evRqPPR/ONcq23JNt1aF/
	84jYODFrrlRyAQfL3Uy53YjlIJOmewmrngyx3aKN6sY70ONmjqUn1qwatfmXT2J/tOm9W/74WLH
	e4dTbn2e6G3tYRviIDmtiaQC+RVG3qoUByZsrPxJutW0fweMRbQygI+4Zs+jk//uAUH0UJYuLpH
	aMX1FsppkC9IHJIEnVdZRaRdtA1q+a/PyQZvus7zhnBjEGY8rdxmzfKChPgLrQCDbVUq8iRG2UF
	7KUIsm+kk87iTrqIqauTWk05agAmfruZRf12N0u9c/tkGlcjsTDRSi9ax17Jn5yNtkaNEsob1zp
	LuPeKGQGOA37TLBrrjAwCSZBeA0WgrbpF7hZQz82FbepFjpc+90CvwKjDbhuG+UrSxDXAY+No7G
	s657Pn1Cr/eKeSUk528Xlb9BZf+lq/XoG2gaJL2dvgDlGwGVx6xvsGQxmYxy2oQ4Mb9QiqadP31
	ujr/EEgfApuNOO5DankS3zHSggTKjRv+vBdkgxV1/0Q5do7SmZk+0ar38e1qw0BH5qX36Mqs6CD
	lDyA169fK8Gl81HwCg3gKuRIxuCg
X-Received: by 2002:a05:600c:4ece:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4ac185bca52mr419437475e9.12.1793891986984;
        Thu, 05 Nov 2026 07:19:46 -0800 (PST)
Received: from slavik-laptop.. ([2a12:26c0:3205:5301::1baa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180eaesm12372226f8f.2.2026.11.05.07.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:19:46 -0800 (PST)
From: Viacheslav-Illia Detsyk <detsykvyacheslav@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for Acer Nitro AN16-41
Date: Thu,  5 Nov 2026 15:18:37 +0000
Message-ID: <20261105151839.13524-1-detsykvyacheslav@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The built-in digital microphone on the Acer Nitro AN16-41 does not work
with the stock driver on the tested system. Adding a DMI override enables
the ACP6x microphone card and allows recording.

Add the board vendor and product name to yc_acp_quirk_table so the existing
ACP6x driver can register the microphone card on this model.

Signed-off-by: Viacheslav-Illia Detsyk <detsykvyacheslav@gmail.com>
---
Tested on Acer Nitro AN16-41 using upstream machine-driver sources built
against Ubuntu 7.0.0-38-generic headers, retaining Ubuntu PCI/DMA drivers.
Without the entry, the card is absent; with it, the card registers and a
ten-second PipeWire recording captures clear speech, verified by listening.
Native x86-32 driver objects and minimal x86-64 vmlinux/modules also built
with W=1 without compiler warnings or errors.

With the installed Ubuntu driver and the same quirk, recording passed after
suspend/resume, and the microphone also worked after shutdown/startup.
A full upstream kernel was not booted; boot and suspend/resume were not
tested with the newly built module.

AI assistance: Codex helped prepare the patch and message and validate the
results. I performed the hardware tests and listening review.

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4908f4cc1..c1fdda668 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -416,6 +416,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-41"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN16-41"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {

base-commit: 68e9934bd17af558b62cac8a444de28d4d5cdb9f
-- 
2.43.0

