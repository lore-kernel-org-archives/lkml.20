Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C347669E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248959; cv=none; b=QWbfKmAgbvoVC+fNqanL3Np4jkwJWvSg1jgPmZRzhNeGJTl06DDzIEGnUNcg1aHHUKh2kTm3zwzYEuRLnhySR33ek1/ypTp5NrLud8aJgsfNNCq+pfCvXDR6qPnXFTeR/cOdwp3bMbbg3P0ZwLqHCO0e8THeOUgwqBzW9Tf+Sec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248959; c=relaxed/simple;
	bh=F4dCyYi/FtwgrncQW5XSrTpQkmCQZWz0zvM6wVNpeuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOR3sKvZWElJ5L5hG9iSVVZpFys/LP960FvX6qXjHImC5GMVu8dDSoaqffxVvVDfKl+ORDwK2sSbMdSqQvrdSPae7G89uYOeBcln/GMXAhLo4o0qVo6xFNKBY3VcgyyUcrFgrYnurokvOs9AOlo9w0h3BBLbtOUSk3DFHxpKRoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoICp6+2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoICp6+2"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso872248a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248957; x=1790853757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXjS0UafrfQCypTmZOrJ1CPsA/C8kLkUtfgDDuLmlBY=;
        b=BoICp6+2Htcn1v4h7jMTQLOQxkwaxGgojRYX9MpASz0tTZ3iVCWnmrKPYqQVG7omzD
         jBmkDQPEbSVrSEhJkmPSNFvCFtJAZUQIWaFUQY+tNuW9ZEcfKniXfzBydIdSFdSXxKj2
         KhPiPdIkY2fiEq3wPG3oWy8mQuR5D7nVOHOm+nmAVkrqbhcs6p1v72/ADSS93rDLmVZk
         KZC2/oLkJrKheLXJ8wjNBJk72OPH3HHsGFkWVmLSakA0hHqT1zCIEW+bLmzz5DK/ZBpG
         rIDWirZhtAoenid6+YFCGPq7joCWm4QaRSyV5bu+cHCjNoMgviQU0/iUIla1M+S8wsxz
         j2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248957; x=1790853757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IXjS0UafrfQCypTmZOrJ1CPsA/C8kLkUtfgDDuLmlBY=;
        b=L2n0f2RmSWGnDUHZh/6BQmEvaxWtmx26WdGi4FZLaX8kZIvDHoSuSt0vyeSmEPSksh
         zxvQTqJfB5YkBcDHIap042MkJtbQrGfwWts1D52Jv+bNHcXcrCXhig6iA8UFS+eUeC9Y
         f+CFZR7NJZ/qqr18TPJw45Q9pgQ3hJ4Q9Vx+wu1iCGiFlPKKPxVKM3v6GX26dNiFiD34
         mSOCWOjdH344PWRj85T3QdAIoGQ1CyZQGr5WDsQuSbFr+Ocx0v/RREO7R93X0VeW1q3q
         4tHcc9L7gMi5yIS56C6dfnjP7dqVMPEqK254F/MIUp9bkCoMR1jq2E7vO4R7e18qXPBd
         6Wfw==
X-Forwarded-Encrypted: i=1; AKwUvBwVcVJrSHHsEVd3pgoyKpUotKbNNod+vqGVoVcAPv/X2E0qs5T4/vyHUc39uWLMDvHFAKj7cXfu/i2cD3g=@vger.kernel.org
X-Gm-Message-State: AFuF++mXnsytqAB1WViYglF8Ahitmo3oqy92pqn7RpLlEnO9a2f7pCiW
	kEMBHCKYxFlfOiR+jfEKplSb4HG2UkjNFVgDVcpMovCsmKCdBQzWw47p
X-Gm-Gg: AYBFou1UD1nS/k0If6qvw9U2/lLVn5irRhWVM11hkx38PSrkmC9UOGOgbpKwe70RJLM
	Zq1vjn+TA14ctP1Id63UBhi/MSPESpAttkfEdTCTDv1h5ltajQALnZ6aeSJIkxG4QWPYog4SPSy
	CKSxM4p7ijuwaVcw0Pixz+LpKiVuegxD1r8KxQ6mIPUPHcRGlo/8aidfby5lL9lNxDwjMNjKD2M
	Frhu6O7B2WVZRMRMVbP2rJ9QDGg0Ish1HW/7I34t5hZA2ewS5r5mdlEr/QDlHpLDUSlIslPOYQ2
	/mvUi49F9nmtsadlBH3rGH3UYIXczCRF76evdwoLGCV7gxz1ON89D8FO/RHVRAtRAPn/ChI2iPa
	O7LpTyixREzE3QuN0fHhUoweJNAln9jwsuCAzdA3uJENwgLRrBSagqDJA5D9Uqi+KSYAZfaoJR5
	2EsuvtPMbV9ciTEjKSRXrh28wR/TT7euCYWV0dYrB/zO0oWbpLEU7t6Le/SqonXpDM
X-Received: by 2002:a05:6a20:2450:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3de0e6fde8fmr2226919637.2.1790248957445;
        Thu, 24 Sep 2026 04:22:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm2569713a12.9.2026.09.24.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:22:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	kees@kernel.org,
	lgs201920130244@gmail.com,
	avorontsov@ru.mvista.com,
	linux-tegra@vger.kernel.org,
	jckuo@nvidia.com,
	eeodqql09@gmail.com,
	stern@rowland.harvard.edu,
	davidm@egauge.net
Subject: [PATCH 3/3] usb: max3421: Free transfer buffers on remove
Date: Thu, 24 Sep 2026 19:21:56 +0800
Message-ID: <20260924112156.1564208-4-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112156.1564208-1-lgs201920130244@gmail.com>
References: <20260924112156.1564208-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max3421_probe() allocates max3421_hcd->tx and max3421_hcd->rx, but
max3421_remove() does not perform the matching kfree() calls after a
successful probe. The probe error path already releases both buffers.

Free the TX and RX buffers in max3421_remove() after stopping the SPI
thread and releasing the IRQ, before dropping the HCD reference.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/host/max3421-hcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 73e76d0e6973..994e8a07538d 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1950,6 +1950,8 @@ max3421_remove(struct spi_device *spi)
 	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
 
 	free_irq(spi->irq, hcd);
+	kfree(max3421_hcd->tx);
+	kfree(max3421_hcd->rx);
 
 	usb_put_hcd(hcd);
 }
-- 
2.43.0

