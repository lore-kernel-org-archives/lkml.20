Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453408;
	b=W9iLRhUk89i7qxarW/0KGphF+QamOn4b68ldvCDI1TyGKTRrWSKUasaMPoy0hqZZZ7FU
	 UPXONh9wK/+itf/4wGpmEQCAoyY+93qP9g0QsKjvxlT8a0fXxXWUlYHGEWBqUdxG9q7eB
	 1aEA7Rh2XLyLwGxgpt9u7LXe4wmb886/tAehAvKCA0WhhHRv3cr52exvF5L0K8CDowFtZ
	 egJLVR7sb9ffC6gBtqm0gWr0PgrOPJEfe6X+9izMWB3huErB+1w3K0Ecolj+WRxunMqdK
	 E3v3UzcJ30LOPxgUh43CBaYkfr6FH/c7IDkENiwj+kZbudgwS1cCUU4hrp6Cz3iqLBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lZW+gmoGRsyxzo4WZhRv/r2tVUKs5H5gx3c1REXho3A=;
	b=43u/Q2MlX4Wx/6EXzB+cc+0PZHE5CJfsMixqamonBTjXf2AJqzMcDa0OD5iQCCMIT9uj
	 eLYNdpzCMvGOfdNrEnb8evQ5Uuy63TFP42xSU/9lkKOJw5ibf6OM73jw5pzJf7JraRFtm
	 YwxYevWuWmTehQt43GuNUF3EB7V6GLkNMjbfeYye/NVVRmHT1YPA+iCj4Ty93Rw8/1Y6x
	 4Q4+8QnmfpvVARhXIpxaVeBeDib27W4qls6V+G2kGsXkyrWGJJut7y2H3LRxF8o+sApxT
	 8m2NLm3TcwWnBAO2WQE5ZB3HfFX3+iyE4TlKsB/3UTvS6RbNiYEnA+GmE5R98Fo3Ctw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Igj2c8PD;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A0460A2636
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A0460A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Igj2c8PD
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so5276592eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794453407; x=1795058207; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZW+gmoGRsyxzo4WZhRv/r2tVUKs5H5gx3c1REXho3A=;
        b=Igj2c8PDGnbRQ8aKkyOza4Np51eZ1P5nFTI2410sbp5Wpp4Bl8cwoZesVfxexAUm15
         FEZdQnX8dk+v1HuPbhnD0hmIzATEhlqIWjZWEWA0RB03VQRuamkbUWcxY0b0+4d5rWXZ
         NdWHwucMlXp+NC5/iXiqwYkJrUHLd/N32DKxDTQvnpwHcLSZoTBGi5lQZ2sCmFlc0DFy
         unAhYSE7xF3t+PkmzejDx4YRsVXo6tfsw2CNryR9zbwqarP6jLxr6ICM8STNakp2peJ6
         vqkXNwe5M/EaEsZBjfyXbeHoQAY+ZSgAms2izP/zx7ltU0VuictFg3LKnhXnfsfBYhLV
         koug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453407; x=1795058207;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZW+gmoGRsyxzo4WZhRv/r2tVUKs5H5gx3c1REXho3A=;
        b=gLgSPOQhxrKDYUQPibsVkpB0UUsIbT3Ahl0Tq/3kS7pv1ONtBSnrIKDm8X9ov5hToX
         /Hg0m9lV8UkouWj8UcDQ8YBraJ92n5XuQbrQCn2ks0jAMe8w1tPq03AKoh7dK4cU0PcI
         m9H9MkhzKvFOZZpFctqA4HyqBCWLkrIEx9aTcUQF+CUm0Q/rV7He99QKTK8MrMUjmRgC
         s2oYK5ucSNlqPJKHS8Njhk12yW5Knm3QJYTwl03Ek7gDJL1oxXQKsJlbQRArWaGNkuEt
         LZFUzFITLNGEPTgTrdHoJHdjpMs0A3l16R+5sGTt0A/fO9TLMlnIOhkS3yKP1aM+F8Kd
         Zxqg==
X-Forwarded-Encrypted: i=1; AL+hErH6ABkx9EEhnoYt0L5/IsXEA2tDQAlPcpqczfIhL9Grf1vRKYJD2m2nb/Hixs9DVXjDr+4fAtUgilmudrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z885HUsENw+qgxrEzbrSpZEU0ZSg7rxbSgrxQVssB1xkje71rsd
	aNZ9l8DC1mhVydXjDS8iClQ3YKtYGjic7ximV2uRuFnqJzADfoRKtaygk7lEK3ARrmLaCYvGSKc
	DCfRGoREP8A==
X-Received: from dlbsn14.prod.google.com ([2002:a05:7022:b90e:b0:1b2:450f:bfdf])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a4c:b0:1b2:6d3f:6305
 with SMTP id a92af1059eb24-1b3c023d80dmr3948812c88.1.1794453406916; Wed, 11
 Nov 2026 19:16:46 -0800 (PST)
Date: Wed, 11 Nov 2026 19:16:29 -0800
In-Reply-To: <20261112031629.396819-1-mrungta@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261112031629.396819-8-mrungta@google.com>
Subject: [PATCH v4 7/7] watchdog: qcom: Register pretimeout interrupt as NMI
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Marc Zyngier <maz@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"

When a system is completely unresponsive due to an interrupt storm or
deadlocked CPU cores with standard interrupts disabled, a standard
watchdog pretimeout bark interrupt will fail to execute, preventing the
pretimeout governor from capturing CPU backtraces before the hardware
reset bite.

Attempt to request the Qualcomm watchdog pretimeout bark interrupt as an
NMI (or pseudo-NMI) using request_nmi(). If NMI registration is not
supported on the platform (e.g. pseudo-NMIs are disabled), gracefully
fall back to a standard interrupt via devm_request_irq().

When NMI is used, enable the NMI during probe to balance IRQF_NO_AUTOEN
and register a devres cleanup action to disable and free the NMI upon
driver unbind.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 drivers/watchdog/qcom-wdt.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 4eb1bf979012..4a99cf43c4e1 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -52,6 +52,7 @@ struct qcom_wdt {
 	unsigned long		rate;
 	void __iomem		*base;
 	const u32		*layout;
+	int			irq;
 };
 
 static void __iomem *wdt_addr(struct qcom_wdt *wdt, enum wdt_reg reg)
@@ -74,6 +75,14 @@ static irqreturn_t qcom_wdt_isr(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void qcom_wdt_free_nmi(void *arg)
+{
+	struct qcom_wdt *wdt = arg;
+
+	disable_nmi(wdt->irq);
+	free_nmi(wdt->irq, &wdt->wdd);
+}
+
 static int qcom_wdt_start(struct watchdog_device *wdd)
 {
 	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
@@ -311,10 +320,23 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 		if (irq < 0 && irq != -ENXIO)
 			return irq;
 		if (irq > 0) {
-			ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
-					       "wdt_bark", &wdt->wdd);
-			if (ret)
-				return ret;
+			wdt->irq = irq;
+
+			ret = request_nmi(irq, qcom_wdt_isr, IRQF_NO_AUTOEN,
+					  "wdt_bark", &wdt->wdd);
+			if (ret) {
+				/* Fallback to normal interrupt if NMI not supported */
+				ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
+						       "wdt_bark", &wdt->wdd);
+				if (ret)
+					return ret;
+			} else {
+				enable_nmi(irq);
+				ret = devm_add_action_or_reset(dev, qcom_wdt_free_nmi,
+							       wdt);
+				if (ret)
+					return ret;
+			}
 
 			wdt->wdd.info = &qcom_wdt_pt_info;
 			wdt->wdd.pretimeout = 1;
-- 
2.56.0.611.g1030f0b940-goog

