Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347786;
	b=F8rlfd8J7gJDHn7p4Ga4N+OeQ/MvStYzbseUme/wLbgw5X7zOUPKcMWsf2htBmH0XCRf
	 1WrGkhXe888UmtExJW6uRHO6kHT1kNd2tX7CyHLdvcHcyPhacfHQzMC7Rkfa/dw23rju+
	 yRTdHjRX+ar0V41EBKQ9ChXtk9B1LSZqZ5WUiyhB/cOeDAZwbE0J7jCs8XmfuotMvzhg7
	 hCqqd2c5cztGuzPjaxnZBNZTk1OdK81cC/R4vsNLgmcGpEF/qfauj9nRSuiG9XybFTB35
	 9TpRmyEHw6EfJHz8yI0H1xsMlvsLvFJPF3ApofduaOJ7f9kyoU5xuYI739uSCZD4oDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=5nCrufOHdC0otKoL4oDb1v5VvTPC6lNZya3g3L1E/9c=;
	b=tI0XxpmzOZnvEvJ+eV/2pR2zzVvep3VYhanyioEraL/uxBUdzxUPgl8ZddTc+z7419G9
	 XR3DFx4EyUzGuwu9RpyzOELSbY2Ye/qdPSGaDdta9xdeJv0DGV4LGLxH1gPWtLJPO1W/r
	 feyGgrqrdgVshO+j2dLXvoRvqPwYJl0Y/tl5LBRh1OcaZHmiJORFiMOcjUniCITpmkX8m
	 ocXg5qnCX2Bit6sGy6NBDDrsiMUIH30fKn3vrmE33zSi1T2BvPsB/mYj6VWf+7pu8P0Z5
	 yUKSKu710xyBPLIZbBxuXSdcOsqIiDkDyPjr8WaAE9RBS1g12YoGjHC82ip4h0QZ3qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nA1lFUI4;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3612060A6F79
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3612060A6F79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nA1lFUI4
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1746044f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347784; x=1794952584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5nCrufOHdC0otKoL4oDb1v5VvTPC6lNZya3g3L1E/9c=;
        b=nA1lFUI4PtScRTVhDY8qQRz3vNd2dC+411dcunswJ5rT617Ewkl1bssGHj4Orm4Tqi
         Lg3GHvr+GIfI8nVkm5XNRqMcJh5/lNXxMS4IaPnNuokob6YD1GEUCUMH/zFouCx7VjYs
         wkTEItC/xUEtjWEqZTV49613lpEY2D2GVluqszHCFve0KAYt+eQynzfA4nHFssShy4oj
         v6n9LJo9XPiUmjl9CvWHqyw0LnMz/XXSUvmVMGvM/Dwk2kpfJlLQm0slFvp3TxoOq2y3
         sNB1HqidLm1wmcVOF1aS3G3ZhhYaUpkczU3mFxqPeFxZnLW0Fv3BrlX/m9dT0DJXSthV
         AQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347784; x=1794952584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5nCrufOHdC0otKoL4oDb1v5VvTPC6lNZya3g3L1E/9c=;
        b=pTQFkbZC4FcmwyIH0CgGslvpoiHQWyVwWeKOiXd7KajO7UEkF749QU341lMTVJbYfA
         A9XlIp00wgGlLKO9wlYrFzI1mV+jAQ4KYom0I3r6sSKjSqM+nYLkMe1G9bl+bI8sf5kE
         EP/m3MRNgiZguon74lzkyn2W0u0TYdyBa2u0kKeEzk5+27PvoooK/aGzxvq2sFnDuq7x
         8TnRBJc9mVNOiaSfqgOGJeYguXOZEoIoQEoRhSBVuxVptatV17Ii6w0UJHZtc8vW1/7z
         IAH1R1G8kXfzJJOUVaUkjLSFHBn25yX2Z88F/1COZRmefQizFWe2V4VWn4IosbGvvWwM
         C8wQ==
X-Forwarded-Encrypted: i=1; AL+hErFMf8w4E5WV4SE7ZLIsC0R1p6WVuCCXWRnEqGXl7ieMYI/qf3vWPXpCH+36G7TkACu6nPffPV0k+SfnG14=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uPAMGxLyeIt9hXHyAh+VXy6FbACKFBxiCJUwjA1aVCQd3757L
	pdd6XiVbOHZ+FJ+qYcF5AK8LDxl/ttxuqh4RW4vJhreRwbe1S7oy2xp++jGYrLC75Wc=
X-Gm-Gg: AYBFou0ZKCAvPlgZyiduNiNtKjjJ1vCX8464CYF/oHoBCqU87jfbt0KIkFa7Ulcl/Tx
	O7np1ueVI0g7TwWjrObI0IdiagX3lugJu/OEv6K+6CT1nPc7hbEAAycgiD7SWONz5nlgCa6VsS+
	cnYsUI0pZxvJAI2TtPJMWeSSQkhn5bCaCWaRmP54IToKxoG5SRW7eD/xsCZFJcoLIrdPZpoEvU8
	jx4GlNEwopxFRHlTS8iQiczo9ZMVnFdZ6Zq/br3zFclNjW8DbS/oHUYJNm1A97GVTV5il4yUj7u
	IpcGKDzvuIYaMa5zfpk/PDXjjBXOtiJn/4kQ4A3kDF06Rpmre2cAmWmOQLGEQeEyyUVPoleoenD
	JANNyuxHnRBiUGGbFC+A1548rViIQSx8p35Q+6UMQcitQhcjs1VxWRmjQcdXFFTaMpjQjXLi7NX
	2DgQw+e3lFjX4V8+VJkM8yGpMqnh7Dklv8h5qSpWD6URYdOMtl9JWFuRtlUYZQ6yGqTCl9ZBAKS
	TDPDsRoYQan7Q8nByRjX9t90GyfZ9oN9CcwQzOvsnDNDk/jhGYygFzvnQ4p50BbAIKGnFkchQ8Q
	jfh7q2/LhHWC0dlZ27+3tAmuS0EhUOXayEI=
X-Received: by 2002:a05:600c:8b78:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ba0939162dmr6430805e9.32.1794347784604;
        Tue, 10 Nov 2026 13:56:24 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4983600bd6esm7059540f8f.28.2026.11.10.13.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:23 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 14/20] mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
Date: Tue, 10 Nov 2026 22:54:39 +0100
Message-ID:  <416bd01a3b26dccb675614634f3150175b754bef.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Yt+7UEGDrCJb+BIynF/E91ZmXLZ0sqzooDjclRxhvN0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LFQrzzid/YWaj5O3c8VRgc7VwiNZn3Fxjrj gw4Aw6lhuiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSxQAKCRCPgPtYfRL+ ThBOB/9kBZN6cA2Pt8f3JhNFXDWhqb32kM+MWOdUKDTDwVaRi0u7X9Xqb3qbvBL8m0z6c96TaAW w/4x3K1hGnNmTAgTVvqDymBeIZsk1HmbDAZXOI/IoslA9bSalAADjlDsQF0Frt/FO7LR5bG+tnl vgnNzeCf681/Ww1+s/bdHgTvyKPsA97qH7b3Xp5arY9l8pf/7/QEEfQiUUN7SeDIV5amRBhCXAe cJDKmYzorM8AMt7vHsLO/WBL9Y/y0e/p8eu4BmSpkJ1n5KqVfcN+LecR57e7aW28rCACXsG+x4I SikqoOfR/GXWnVWXcf0X+s8umgV0Xha86y/38ThLItGvoK0F
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

pci_device_id entries are usually initialized using these PCI_DEVICE*
macros. Adapt to this more usual style.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ioc3.c        |  2 +-
 drivers/mfd/janz-cmodio.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index 5f8ac364b610..bf2be3bc8602 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -654,7 +654,7 @@ static void ioc3_mfd_remove(struct pci_dev *pdev)
 }
 
 static struct pci_device_id ioc3_mfd_id_table[] = {
-	{ PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3, PCI_ANY_ID, PCI_ANY_ID },
+	{ PCI_DEVICE(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3) },
 	{ 0, },
 };
 MODULE_DEVICE_TABLE(pci, ioc3_mfd_id_table);
diff --git a/drivers/mfd/janz-cmodio.c b/drivers/mfd/janz-cmodio.c
index add3bc04185b..93e1c04bddd6 100644
--- a/drivers/mfd/janz-cmodio.c
+++ b/drivers/mfd/janz-cmodio.c
@@ -259,12 +259,12 @@ static void cmodio_pci_remove(struct pci_dev *dev)
 
 /* The list of devices that this module will support */
 static const struct pci_device_id cmodio_pci_ids[] = {
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0101 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0100 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0201 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202 },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0101) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0100) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0201) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, cmodio_pci_ids);
-- 
2.56.0.rc1

