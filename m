Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494651;
	b=zcBIXAcgXsePd4HvZQC5xWbDbZAHQY0LdeGWlcHTbYeJcXYMoAWkcjBmUj3Q2qwTimnA
	 7guMuQk7Xigy/reHyYQHU4LoYCO07BgKXq98qGdiRlkk0djHR+ULxugtrDChYZIUEvy00
	 eNTYKZ0CTk4TfK8kzRnQvqFvP2o1NBfgYu2rQN4Mq/mJCLboMSA0ctmRIuHO+o7WV6/Hk
	 QRMeiuV392MYlo2+Jdh1hzWh/vDetz9E7F82b6jB3elxrrYC7nPOpGKZaQeKa+o32kZRa
	 34uhF3hSFf0FvxdJmHsniRbDrlWZTWng/AjRmiiupgF6Xub34lpd+TRFyJvRc9BwDHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RdVdlZMnqwAaBg/AE1elJnERFjptDc12NUziXfH9GT0=;
	b=suT5fk5Ib3703w2kwAOR8YIPYuI/kpVPoWuUXBHQ1okPcLeRWl3g7nMb3iTJNiKxHD0r
	 hxa6qc2f9fK68El7CKBP/NyZijdNdgnmmeZhgau9q4aZw8DeDHSpW/XZX9smhKFBY7UgL
	 uNIqUJ+jzncksadZGKat6GuvZAN3M5EP0F78OKgPE5nyiA0Scs3ovLLzYNnZXexPQjyxq
	 cimFknx2ssGQ+O1/5qniKifoCvnp9dngApCURrPSsTVzk9zE8L3RWH4y5hp7D5WzMN4Ls
	 +AKVdEPzpcL+ZnHtgxaUBp4E1F8zoPAbZSIFZQshhM48d8tCiNm6xeqewuOE9Lujtzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KvdhDkyi;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95352606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95352606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KvdhDkyi
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso15203805ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792494651; x=1793099451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdVdlZMnqwAaBg/AE1elJnERFjptDc12NUziXfH9GT0=;
        b=KvdhDkyiKt24B89298Nv3o2nKb5PHR7YwyPPFoFuKwn8pG4lX4LsmZPG8ApGuokDT5
         IFsEeiCde2oGjC6spf/eRXzTupqC8N7+8DzxSn9tnYYoA6+jsAXe023MVhdyMRE4YM2l
         hrgzi/YWzNOMSfiJCZUzvJxyNUc8zftwiyFCCp4x072YwjIQynV0x2118FTszFIv4r8c
         O7Lt6UwxixNBaUHQSFRlu4U91mFAiAuvdiw2mCAW1OTvxvekgLkoPIBiaJfwHkX19euW
         mynHU5mhjnZhRi40uIU0vuQ0Arx5La2ECPaJquau56k8MtQpbrskiZIUqwD5xQUPCOpv
         AGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494651; x=1793099451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdVdlZMnqwAaBg/AE1elJnERFjptDc12NUziXfH9GT0=;
        b=USHC4HIgb9zQCRV0FsNFQeq+J7hQlRRhPBmY5b9tLHV9TLNKjT/AG6aMcM/E/fR4Su
         5IRX14FbQq97FE/Lckkph/L23Kqy71vdYGcOwtgkOrMGQGm1+dFQGHapcSKrLvSDu89J
         HHT159OZv3i6SXy/7RHwcAEidswkYy7JmB/W+Rx/24ouqzGdbY5MOe42A7OA2c/ZiEAj
         AqawN2fnuLp7f/bqzmsWkZzdqRvqPPidzkSoSSJHtzEW5sxNRPwvbm425DgTQeTJ/fAH
         7OTdt45EzaLiGggclaa3vPXKwU+EE+hPtRVC9QYUvtf11pd3eQ0o6m0iEJ3vAxwaaa4T
         H1wQ==
X-Forwarded-Encrypted: i=1; AKwUvByq6MLAd8/7auutUaJ8FI2PlR8MnZed/130fCGcbP6IEG6oddA9pmNefs8lcoTr5wExtArVQvolPL2YE3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ8MxMf+52vF0Wkjj0kX2eWW+2uCvIDnO1ekqutLoRdpY5zvVC
	ePMlQQGAK0FdOmqHciJO3SYIv1M6/PVVl7lJrPkAHjAvQtgVzrqUreMO
X-Gm-Gg: AYBFou3A4oI1e5gNGJrF9dVlVal3csQwTsi9F5DR+VnejzchcboXXF61GBWKXYbkQCE
	JET+exczK+QUXieDUrFIIfNWIvt9jH67NUYcuR7WVM+u0R4TF9ekhphtfWQPDnaq2YLafMnujep
	LLRlvCGlXAMBS9aAv8BGVDMluXqR4RIM4G5cTM7wuHEZ6/5aA7ikFmPzTUM6FI0KDx203r9flSY
	VUd2wiWROlDFXlxl4bgFluJAbTQYM5MLzoD8mA9MYveSmJmFab8EPvOVzy6UkCUWp8DsQ02hekG
	oDPwwqgvby2fW24Gbse84efEXf2P+b461N0V7Xp+y0XuRVot5CfUER/qIAeFZvfH42LZWvCJIX9
	nxpvLaN+ldMa7XQVa5d7urnXrQ6fSvUs6oitGb9jN93FRD1Jjeu7qEs0GQS2rzX516uFkVr9b4+
	q1tO2GUOITNlMyVDDpiXat3y9HVtlVLfhNZrgZ2ccR4vJ7ruJOlfXG3T1Y3JTAm7Bi8J4Gu7UFq
	laoqaSniUXpEzdylZU6JljXp6TuWLt/LlEkRCM099cNYDopVfiWBOuOXvrVmUIeCDdn/PYrIEtY
	q5C4oQtthcLzIL6yNr1f2uUAOraohtzveNE8zExeN0SFILQR4CsCoOjp0uIpdOZZyKj1a1ipOCe
	DsOzvB6wkJQQaFLVFGQwj
X-Received: by 2002:a17:902:d54a:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2e9a6e46983mr89263625ad.44.1792494650815;
        Tue, 20 Oct 2026 04:10:50 -0700 (PDT)
Received: from 7cf34ddc0813.ant.amazon.com ([54.222.46.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501e269sm10812285ad.46.2026.10.20.04.10.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 04:10:50 -0700 (PDT)
From: Jiazi Liu <jiazi.liu1984@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guanyulin@google.com,
	liujiazi@amazon.com
Subject: [PATCH 1/1] usb: xhci-plat: keep IRQ masked while HCD is inaccessible across system sleep
Date: Tue, 20 Oct 2026 19:10:35 +0800
Message-ID: <20261020111035.25365-1-jiazi.liu1984@gmail.com>
X-Mailer: git-send-email 2.54.0
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

From: Jiazi Liu <liujiazi@amazon.com>

xhci_suspend() clears HCD_FLAG_HW_ACCESSIBLE and halts the xHC, but
the interrupter stays enabled and a pending event is not
acknowledged. The PM core re-enables device IRQs in
dpm_resume_noirq(), before the resume callback runs xhci_resume().

In this window a halted xHC with a pending event keeps its
level-triggered IRQ asserted. usb_hcd_irq() returns IRQ_NONE because
the hardware is not accessible, so the IRQ is delivered again and
again until the IRQ core reports it as spurious and disables it:

  irq 121: nobody cared (try booting with the "irqpoll" option)
   dpm_resume_early+0x90/0x300
   dpm_resume_start+0x2c/0x50
   hibernation_snapshot+0x224/0x488
  handlers:
  [<...>] usb_hcd_irq
  Disabling IRQ #121

This was seen when a hibernation snapshot is taken right after a
restore, as the restore leaves a port status change event pending.

Disable the IRQ in xhci_plat_suspend_common() and enable it again in
xhci_plat_resume_common() after xhci_resume(). Skip this if the host
is a wakeup source, as it needs the IRQ during suspend.

Signed-off-by: Jiazi Liu <liujiazi@amazon.com>
---
 drivers/usb/host/xhci-plat.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 074d9c731639..74a56f18de3e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -478,13 +478,22 @@ static int xhci_plat_suspend_common(struct device *dev)
 	ret = xhci_priv_suspend_quirk(hcd);
 	if (ret)
 		return ret;
+
+	/*
+	 * Mask the IRQ while the HCD is not accessible. The PM core unmasks
+	 * it before xhci_resume() runs, and a pending event on the halted
+	 * xHC would cause an interrupt storm.
+	 */
+	if (!device_may_wakeup(dev))
+		disable_irq(hcd->irq);
+
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
 	 * to do wakeup during suspend.
 	 */
 	ret = xhci_suspend(xhci, device_may_wakeup(dev));
 	if (ret)
-		return ret;
+		goto err_enable_irq;
 
 	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
 		clk_disable_unprepare(xhci->clk);
@@ -492,6 +501,12 @@ static int xhci_plat_suspend_common(struct device *dev)
 	}
 
 	return 0;
+
+err_enable_irq:
+	if (!device_may_wakeup(dev))
+		enable_irq(hcd->irq);
+
+	return ret;
 }
 
 static int xhci_plat_suspend(struct device *dev)
@@ -523,12 +538,12 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
 		ret = clk_prepare_enable(xhci->clk);
 		if (ret)
-			return ret;
+			goto enable_irq;
 
 		ret = clk_prepare_enable(xhci->reg_clk);
 		if (ret) {
 			clk_disable_unprepare(xhci->clk);
-			return ret;
+			goto enable_irq;
 		}
 	}
 
@@ -544,6 +559,10 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 	if (ret)
 		goto disable_clks;
 
+	/* The HCD is accessible again, pair with disable_irq() in suspend. */
+	if (!device_may_wakeup(dev))
+		enable_irq(hcd->irq);
+
 	pm_runtime_disable(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -555,6 +574,9 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 		clk_disable_unprepare(xhci->clk);
 		clk_disable_unprepare(xhci->reg_clk);
 	}
+enable_irq:
+	if (!device_may_wakeup(dev))
+		enable_irq(hcd->irq);
 
 	return ret;
 }
-- 
2.54.0 (Apple Git-157)

