Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703999;
	b=W5moxiYlFphK9WiKFq0pCn8iUsMmoGuJaeCb9iXFscXJxfVZkZhLV3JVGfr51fgOFF/z
	 doqWHIRDzJcQJhcbX6zDA7fDC021mfGELP66BQCmYB6lQ1pK6EU5gFqtbMpS3EuumUMXY
	 fkiMHM8DqHTDTW7vSXHJnqY97STqfRvcRkyh/L9L67xB6ahdDue1FvC/4Fv3sdmgcaG8B
	 wET0xGROwhNyf2BbBYAR9lxsaFM7tGnti17I4cE/Quw8k3SuRVu/JAP0/J9g5sfy3na+t
	 nv39vhhpJ4Rm30optmWgcK9ki/iYAngiyLyODe+PmYdU6Qih9+3T05Z1GF+cNWdaNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703999;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=XQhCzGuGuWKlZnV5lWBoj/xYTnMTDH7dVw6lv1COzSw=;
	b=DUJW7EyXeAIkZlmzu/o5LSRbLdHj93Aa+G42mUgtaWqq/wYLLWRlTwT8y00hFo/8lyIM
	 bdrbR4PXejxnBMJC9LEET/vtiMvAOoyRlrVdyvfVs2BFgCO34X87TNh0+VWXF+088WPul
	 VOQHgnjjzy1slMrMHfBIiE0ul5EfEgwER38p16/8263+cDsetf5NDt3RYrQQreRUrrhzS
	 WX5NnljCK0bHCPMfq6LRrbz5qzMncuMbZwHvyemc5oT09KRYYnI2x+vVpwtEU5+guNaBu
	 dLFUn7Jrf0rni+kczVAQVBvuvLH7T1SZtJpaJ+vlAqxBaNfh/gzq1cc2Wlq7cuHin0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VKAt53GY;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC01606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC01606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VKAt53GY
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so67710a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703998; x=1793308798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XQhCzGuGuWKlZnV5lWBoj/xYTnMTDH7dVw6lv1COzSw=;
        b=dKZ1MTVG0ziXqIxHOlrpsphwgpNV4rojqJ3YAC/sTk51PmaTQQH35Xauuha4xX7m0j
         G5HZPKkA9J6so59tC4TKLLDSeXz44reDTX3/knRbf1aYFUag7WHFSPFQBWTM9hWmtMG1
         kRWylArf1oxu82Tk1k1Ez+jIcnkXKiiX0E4UlL5tt1Ry9HoUrrOkvvkPvEQzTRiHJ8+t
         ad2DcyCvUwJOTTr1CmgwW9APPDDqcUO3GXhaFTwf1JCbFaCe4wZ2Avu0UCeOZ4p5buim
         NGKtvDaeG+qkqzusGlrNrTuDejV4gDJvbCGDQoxlmXHxFDpyxLQ7MSVG/XtnXUBQBGn8
         sb2g==
X-Forwarded-Encrypted: i=1; AKwUvBzHeW8XcYD3VTYhILHTKAO/chDrv3LusiEwJw2q5Ue/UUY4V4VTqT3dSmskjXIbldvJKdaN8RY+2nya/I8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJewgasU1691rasCa1aqRT665xIG20bOp92uNYUiFjEuJTrcg69
	FHeJZ+tAKNccR24hDCt9exHWZIz3MaWHNd18V759/WsnTmbTAaCq5+k63ZsPrjTglJEqRBGrUZp
	gu0gE+E5nz7V+pZBmrO/D2/+UfXqosfnnPTBRLd+tvjMZk4Y+gRPrCS94L+T2fDaALocdK3acGQ
	w2yCE363huvJZ2vqj1yDev3vyasRSOy6YQ3AafT+EN6mTkQdSC7Pqyh1gSPQWd0kw4GWbP0Pa/J
	49b/XTZF5RPdmDYWRLPFA==
X-Gm-Gg: AYBFou3+KMMHxU1/M7ZsR6/IQAvDmX2ZIIgX/qwfZ5UeJ70qrMx8eJ8ajUwfJneJOLU
	QA4hJ6tuj184s6a328zaIJ9CkEUoHACXVlhtQuITqrv6jCWOLlxaInit51bzALjE3n2l05EC9R8
	shi/FEOvnqA72GfiJWF1t9quCjqH8BFwS6wI/MRiWsT7HMZYwFcpleiTykRQR3Ux8CEUwAk83gM
	oHT613zyOvDORMHz+tQNAtQHJB0JP8ziw3wCHk8SmdqpOZQS7D8Afgyk4N8ZZ1961q+IYcKFAF0
	I2cQda2VqbJB0JBQkmV6mmoRgIgbCYjQmTKcOOg9KhMrlWHdaE1WH8bVNCeBF0NvI1XC+C5Z3lZ
	LODH1IBsOEjz+DgK5blpBPXdXnSWzF3yRrU8n7JHVQphjx3w7PU/mIPibSCFe1DRMe3UEBrV5XK
	f8n+I6zbZCcdKW0fmkZdY7TFflyOWmcR0mxqxhvQ==
X-Received: by 2002:a17:90b:5105:b0:3a0:a912:e759 with SMTP id 98e67ed59e1d1-3adce02e024mr145374a91.25.1792703998077;
        Thu, 22 Oct 2026 14:19:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adcb1c92fdsm292322a91.6.2026.10.22.14.19.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:19:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so315477eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792703996; x=1793308796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XQhCzGuGuWKlZnV5lWBoj/xYTnMTDH7dVw6lv1COzSw=;
        b=VKAt53GYhSJL66AfhETfni3CumKq2S9E5Jmi+sa9L7CDSiKi9f/DMnZY1rQhyagqEZ
         NDvo6JFXpXz3/LU7qLB8RFcdR6leGc4tXkYgHWLuLH4JP4Yc7AT4ZsLpC72E8s5kS1Be
         AE0uBBoRnCTof5L9NodPY12kdSMpuYUM+FuKI=
X-Forwarded-Encrypted: i=1; AKwUvByyYh5YXjImf8yDHC4XzhEKY3L2IQbtal0WElFlZaqt9gQpSp+dv3q2MSPSxvn9QhDf/7+0PkRC7wBMLMo=@vger.kernel.org
X-Received: by 2002:a05:7300:8296:b0:369:5583:bf4c with SMTP id 5a478bee46e88-369d988fb27mr381393eec.28.1792703996184;
        Thu, 22 Oct 2026 14:19:56 -0700 (PDT)
X-Received: by 2002:a05:7300:8296:b0:369:5583:bf4c with SMTP id 5a478bee46e88-369d988fb27mr381372eec.28.1792703995464;
        Thu, 22 Oct 2026 14:19:55 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5e9edsm506039eec.9.2026.10.22.14.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:19:54 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
	id C89A6530; Thu, 22 Oct 2026 14:19:49 -0700 (PDT)
From: Markus Mayer <markus.mayer@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Chuck Lever <cel@kernel.org>,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Cc: Markus Mayer <markus.mayer@broadcom.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: update my e-mail address
Date: Thu, 22 Oct 2026 14:19:48 -0700
Message-ID: <20261022211949.42939-1-markus.mayer@broadcom.com>
X-Mailer: git-send-email 2.55.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Classic Broadcom e-mail addresses were recently phased out. Update
MAINTAINERS to the new format. Also add an entry to .mailmap for said
address.

Finally, since I am already touching .mailmap, I may as well map an
ancient Linaro address, as well.

Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>
---
 .mailmap    | 2 ++
 MAINTAINERS | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index abb09aab44c6..d1009c5f870b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -594,6 +594,8 @@ Marek Lindner <marek.lindner@mailbox.org> <lindner_marek@yahoo.de>
 Marek Lindner <marek.lindner@mailbox.org> <mareklindner@neomailbox.ch>
 Mark Brown <broonie@sirena.org.uk>
 Mark Starovoytov <mstarovo@pm.me> <mstarovoitov@marvell.com>
+Markus Mayer <markus.mayer@broadcom.com> <mmayer@broadcom.com>
+Markus Mayer <markus.mayer@broadcom.com> <markus.mayer@linaro.org>
 Markus Schneider-Pargmann <msp@baylibre.com> <mpa@pengutronix.de>
 Mark Yao <markyao0591@gmail.com> <mark.yao@rock-chips.com>
 Martin K. Petersen <mkp@kernel.org> <martin.petersen@oracle.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 0e9fe9c2a39b..e10340aec405 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5307,7 +5307,7 @@ F:	Documentation/devicetree/bindings/usb/brcm,bdc.yaml
 F:	drivers/usb/gadget/udc/bdc/
 
 BROADCOM BMIPS CPUFREQ DRIVER
-M:	Markus Mayer <mmayer@broadcom.com>
+M:	Markus Mayer <markus.mayer@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-pm@vger.kernel.org
 S:	Maintained
@@ -5582,7 +5582,7 @@ F:	drivers/spi/spi-brcmstb-qspi.c
 F:	drivers/spi/spi-iproc-qspi.c
 
 BROADCOM STB AVS CPUFREQ DRIVER
-M:	Markus Mayer <mmayer@broadcom.com>
+M:	Markus Mayer <markus.mayer@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-pm@vger.kernel.org
 S:	Maintained
@@ -5590,7 +5590,7 @@ F:	Documentation/devicetree/bindings/cpufreq/brcm,stb-avs-cpu-freq.txt
 F:	drivers/cpufreq/brcmstb*
 
 BROADCOM STB AVS TMON DRIVER
-M:	Markus Mayer <mmayer@broadcom.com>
+M:	Markus Mayer <markus.mayer@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-pm@vger.kernel.org
 S:	Maintained
@@ -5598,7 +5598,7 @@ F:	Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
 F:	drivers/thermal/broadcom/brcmstb*
 
 BROADCOM STB DPFE DRIVER
-M:	Markus Mayer <mmayer@broadcom.com>
+M:	Markus Mayer <markus.mayer@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.56.0

