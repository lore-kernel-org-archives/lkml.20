Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725122;
	b=vTr8VF/Vj6XC8fVZoAX1gWzonrh/hamJvASAIgJS+Oh1JC91KTVQOfmOsAEoJB+IG0Ar
	 eObiJQEg6jmnYEAUg/Rc6BRxYDtUpzoyjK32WelVMkeF6u+o9tDdS2zMEJIu7QCUHJgJl
	 7S3Wee35KT++VDH2xcuYkVBKKNxe5E5dfPQcINY3bLmPsUmrDh0gyHSzXdFpA76gLn6QB
	 v9/cvisykB7ECNLFGX4pB3u1UlQdP8/Ltc51jLsz5Y3SL5wrnfzKX0LDbofgERt4brGju
	 BNC2E3Q/3ol1s6EQg0FIsd0+lRAqMGujXwdn2Z7AjBhKX10LZDDhwss4orQzKz8OSnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=hAZqS5tW0P8Kr9gtuBy9z3go+odNQ1jK4DHH70/QF0I=;
	b=MZeIfIWYPG+CywOdVfU7RFV/SAYwz0P5zSMCVGwKaT66KSWvqI4dLIRM6GXVz9vWfoKo
	 wL8Lwn5fZ20f/xwW10OTznBH51uY6pVw7442i9oG1VUCPH2YivDZB8LRo/QewRC6XlJI9
	 RQnsu9Yui0HYRNNcpzU1EwhbPRZJiF56r/TF0fq/uzKC5qktqrJVaUsdBBmy+jtHLLMpn
	 7oCw/rcE5BeRb40uIvnw41xlLGEs6GrkFc912PZuZYMcm5AkY3QByGYM9uSfpplEMfRXG
	 kOLcigbVl5ZdrQhfmBbBxZay/kEUR1hBrHmVn5A9WCtGT2GOwJoG9IM/f6mBKQ/x0lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYiKcB4D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4DB606A334
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F4DB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYiKcB4D
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-537548b811aso16013281cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794725121; cv=none;
        d=google.com; s=arc-20260327;
        b=HTZjuDM1E0sGNE9gzEWllsLV8wW8Aa0XxGxxsQxp4lsvBORpOKVzUQg0xlemaLuhVc
         x11OGfkmMP8kIwiprCHJLudGFWKA1ObIn+0kQvBO1qmDIk72WxDUwsKo8JN/DhNiQiu5
         Vb/3e2sSZPBN50ZQgxBOZ9Ja87OGqXVmIFfqJU+tq8ilnf1exJg/bY1BhKucFRf1y5U9
         a+wGoT4uO+wnosxLzoXjQDcs8fQUxxUAMBHHDLENFWHLvs4pG3d8m3gG0qa0Dr01VU2z
         FLPZmZczKdWrFo1RIlEL7TcmiygBfjYvhuaRxaT3mWSe7jCP+NVQW5EepXw8efLRgZeA
         lUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hAZqS5tW0P8Kr9gtuBy9z3go+odNQ1jK4DHH70/QF0I=;
        fh=TIfwnlT8BvU+f+su7opn0KTzFkvmI6MLXEz80FX38Gg=;
        b=QiB9xHqKpxbL3Au2DFbUetUdAuXHbww9jH1fey0hltrOXzZgTfiXdsbvDLAGHXQikC
         KjQtj+2ihMDhK3rkL3L6Y5+WzS2717Ug7fydSLyyGKJV0qwp9P6uAIIY4JLWvW0ATwHY
         bIN6Uuessffn9Cxhu19cv9648UFTcjb7AF9/34kvGm0bzTvD0LeqLNyYpmGJGs2+9H9S
         F7jghjAIobQbEOYYIbVGRyz4UWt/Ca5hE4E7M0ZMPNB0WwqDZtB4UcCTu4Opnw9GLvIG
         I4XF6IFy52LfSf5BET0ITRHgHaXLUT7CRdK9IR8NFWr1+FdGzD34fBkbTFSFiMEFBkeQ
         2p6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725121; x=1795329921; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hAZqS5tW0P8Kr9gtuBy9z3go+odNQ1jK4DHH70/QF0I=;
        b=pYiKcB4Dkw8p3OxL4Am4xaWjRSZUG5ivDuVKRm1HgQNSi82FSOcSmfvvCZOR9/Ymin
         SdnkieChYZBpdm2sEMzgk5XpIEuoUUbtFukA7FVTfRBF1fhFiHns/loNIp2aCkaRYylD
         y1PmoORLg9Hh3EhcKe/lI978mJuq+J07c1lxaoBEVKXTlmlEJcRY5WcDk8UkKp7S2YK4
         /a1kAeXh8aoc0opjOaoRzE6Pp5kNCvlTDnts5t3UUwIrSWX69OdGW8w1viYTJvYzHknV
         Y+0wio8bFpzNO5QWm4DxW8VeyaAR+nEQVy8RhxEHskg59zWLhYF/EnljdsrrosWSwcJl
         jLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725121; x=1795329921;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hAZqS5tW0P8Kr9gtuBy9z3go+odNQ1jK4DHH70/QF0I=;
        b=M+8enssuDFlGqzCaMK9SnfUqXz+f6gfIyoUMtx0c8FXXfgIaZDYOdSlXDO4LuV+RCb
         fD5G+ZCxK837LV3DGh1OiO+poyI/FCzEZOBCB9UfZzoJmm8ksePLt6uBPQFw8MLeXp9O
         pSsJ7ruZQcrulK0a/OTgBCnebkp4eBTC5hSuBl9WKxohVRtd/qqmK0yhNZPHqqX0Iq5D
         Qru2ZyE7V5D0NWouocHwTu7ZMn+6XSbolLuH9hChVTAPl3576QM1eA3QZ6oxrqKtxwvV
         ZhHom32e4rh5v7/eusHF3+FE+1B5mvWJxR2hmcegkebBJ9AV3UKaMvQ19jbuBrFhi0dR
         XHxw==
X-Forwarded-Encrypted: i=1; AL+hErHZDAJOc8AOLGbwWfoJsiWFQ66DyphLYw+PsCRWIsiYyRD9ViOgqAkIVaIGuuRUpPVSZc3VZ7hJB9qM5DY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mrjAqM5lMfOn0cEfeOT4+ncORmY2NMAW513MBnJK0w3wauTjL
	V6jD1gI/UR5DLTGBRZrYP200aKmtABF1acAuttNMWZD4U4vXbOKs7pdHbmxkDPeT4RkFnZOHTvb
	b5YMKx0EjXSW7+hhVmi1VjHMWmkAG41Q=
X-Gm-Gg: AYBFou0dqIhPqShDEndBqxRkcEJhc5ensd+5TLt8SVVvABYgXtPo03cqV0chD9cqACY
	4zIKckRbIj0Qd/mNO9tDHFRbQzN458OkZrI5b/2KNI1J73i1yNUuF9CHOCIVmTYXw5t9qv53lv3
	glerM8hDU3UTl97u+/ded3x210YjOfOWD4RXQfGhq9ccrJXsLkPLidPpllGi8XAj9MnRGkt51WY
	vHCfRhueR5zbhAnxKzcTlbJv9FVFcsDPly7hL0n516cinwYZc1PXFc9O8jya+WonfVvSLcqy9xD
	w2xw0o37BYw4P1uFs7rMN2VSFBskbtdzDjVDFU0iba8XLg+Co2vgJ0Y6xw78TQ3dxRlCRsKBORQ
	KYm9Tlk/p7CJ9BwZPZfK0ZECpnp20urpxtYWZClm7knFpT/wG5/HjVK6Z7QtlzyyGNManzdRGoJ
	Yy0JpkTHWvI6Aowg==
X-Received: by 2002:a05:622a:4185:b0:55d:3350:d270 with SMTP id
 d75a77b69052e-55d3350d4a9mr10965061cf.35.1794725121094; Sat, 14 Nov 2026
 22:45:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Alex Guo <alexguo1023@gmail.com>
Date: Sun, 15 Nov 2026 14:45:10 +0800
X-Gm-Features: AclHuK-jDDhL3mEMFmeo9aMUL7RpBVpjc6aGb81YPdfDwTLWZPEh7kzOxY3PHSo
Message-ID: <CAAi4Z-dOp+TvmvtJbkepcFWVA9jsbrq00yd5d+LV86cizsc9vQ@mail.gmail.com>
Subject: [PATCH] EDAC/altera: Check device IRQ lookup results
To: dinguyen@kernel.org, bp@alien8.de, tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

altr_edac_device_probe() passes the single-bit and double-bit IRQ lookup
results directly to devm_request_irq(). If either lookup fails, the
request can mask the original error, including -EPROBE_DEFER.

Check both results and preserve the lookup error when unwinding the
probe.

A similar issue was fixed in commit 47c3e06ed95a
("spi: tegra210-quad: Fix missin IRQ check in tegra_qspi_probe").

Fixes: c3eea1942a16 ("EDAC, altera: Add Altera L2 cache and OCRAM support")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Build-tested the affected driver object with Clang 18 for arm.
No hardware test was performed.

 drivers/edac/altera_edac.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 12175d0cbc43..b7f04cccb599 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -759,6 +759,11 @@ static int altr_edac_device_probe(struct
platform_device *pdev)
        }

        drvdata->sb_irq = platform_get_irq(pdev, 0);
+       if (drvdata->sb_irq < 0) {
+               res = drvdata->sb_irq;
+               goto fail1;
+       }
+
        res = devm_request_irq(&pdev->dev, drvdata->sb_irq,
                               altr_edac_device_handler,
                               0, dev_name(&pdev->dev), dci);
@@ -766,6 +771,11 @@ static int altr_edac_device_probe(struct
platform_device *pdev)
                goto fail1;

        drvdata->db_irq = platform_get_irq(pdev, 1);
+       if (drvdata->db_irq < 0) {
+               res = drvdata->db_irq;
+               goto fail1;
+       }
+
        res = devm_request_irq(&pdev->dev, drvdata->db_irq,
                               altr_edac_device_handler,
                               0, dev_name(&pdev->dev), dci);
--
2.43.0
