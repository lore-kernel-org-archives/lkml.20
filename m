Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF24E343886
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 03:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790999477; cv=none; b=Opvbs4dOc0G0pMBfN5+zAPp2KQVs95wBUu5sD8Ep06XKUq/J9vSd0bc6s7tvGUI5Q1EQ9bCgoo/RQWfI4t82v+3qXKIE3zDOguti1eLx3umpMKoPYIIRE73b5FgaYN30dRmg1RHGsPE65GLwpDHgtRLcR65f9SKPO6UkKmSkyoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790999477; c=relaxed/simple;
	bh=nFPh/SooiX1Ij77A7+V7rRaVFG9Og6s5MZ/sUtM08lI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3y48tx1i6SBNLz8UTzkQTPdh4jzM+TqU9j2l7MlXfyoraSVXLLQk6OTFvnUHPa5uPNfTq62CVLfQvzBQ5OcwSlNw8gGCvUJV6+9z8lOqxgS7okd+SXA0L8Gz01YI/I9ElVkFNP5RGrpcZ4Af+76WP2+6BBBPCMVDZG8oeLgDwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJO3oB6j; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJO3oB6j"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e50170ba7so14580385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 20:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790999475; x=1791604275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rSMgkrHgKMhAn63kmMLC4e7ZpQOwQj9HhDjCLOUzBMU=;
        b=lJO3oB6jZOpto1KQyC86PDZ3OG8yWPNejawVqMR64YADUp0cOX95l3b/eHBVDwCmVU
         6UaHnp5htz8f/JSLpALc4TMZuyIJQRcoFYrngtK87z/QVlEjFaN8Wk5AmBub61RU227p
         0yH5U08gIgbA836bcZW3IzOo0N866CRNzV6XEhF+DesKfPEt2JmaG013XvIdzyJ91kHU
         /Uz1M2VovJbKy1RBb0bKDud8SrYoNIgNQPJaU94SEJo3GPPmjZzY1lGqp9VX2z7PMJ+O
         ttZuHwOaNn0xql2+oA+++Cr2bhoQkvldBiplwdAe3bEo48PpbGpLY5lE4htcw03wznvZ
         B3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790999475; x=1791604275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSMgkrHgKMhAn63kmMLC4e7ZpQOwQj9HhDjCLOUzBMU=;
        b=dW999OZHbYMAoFJRvUs4MsSvSVyxOKhDr5HV/eHVsREamZC2KgGDMbEgwtWyVyrO+E
         MZVLclAkUEZXn0zMvWNLsF0HG2bM9dMqRqK+zO3qFMeUIFNDizH3RnPOjqFIRVRpUI6p
         uQdJ9uYMVcZte+vGs5mFUbQaoQCQDz2FZfEs+cjJJJ8RLl1En9rF1wno0DwGfMHFZMBY
         H17ok0Vpz2oW+hIw1wxYlJXT66mW68o2SksmY/LubxgVUFeXnwFsU//MbUr4pSRpwSMI
         7bxKYTNwdZxTgMirMfWIcSW4Le/Eyvf9mqjVcAIq3YWs+XXlBVyW9jNET4wMXebAUIo9
         gQ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzACnBDrQ/pYZE/v/JyWYEEJXapQzoY+WTlTceorZjgdQdo0YR5oXaBw1fWefkYF8rOQh6w3LTEJWytzBA=@vger.kernel.org
X-Gm-Message-State: AFuF++mmhTcGrQH1ma+hkzETnXnIwaeZCS/Mva2ds3N2dH902ukD9nV+
	HQU1PkYdlkVyHP8UH+YGkvuvJiXtkcsuc6+o559Fxud4QN6YPlOsqVQ=
X-Gm-Gg: AYBFou3zYMr50aduEQXGs0n2lfKBeHa+EBZ6WGzlao+hXx8mNkhrk0bNzu9JMTbM7pB
	E3lY4SxClpjRkkbI8EVSiYDgxXv90qMYlSrpY/eyQg+G/HhY0kqXakYcyDF36tNAafRhFKPKAqP
	IIJs9+ISCOOK0KjTvOHlohQ4QV5lHGqVjpc/kVHM9s1Ct6aJgtQ57BmtvwlS8ZcCPcbfxfWFsSi
	459Jtcg8z8DtyaF/H4Pt2mJ5lL5GgJHFO8UmPc+pDYNE1NfO+NsIwslEiVxV+k+tBmMfyYONO8W
	LXrxpoTRiJAl04Cbt8sw+QQuPRk1aKj3uQkkKFlYGrbXedB18k+plcVWZwdDW/oRGB2A3m0WFuu
	UPQ1T3Uvj2UhxxTZ2UL4TiX9/vBoLkh6oqqDBAs2GT9FjRJu8wrg+GKD+mrbBnVAaetHnGQxKnU
	JjcOzAUJtQEpB7K3eH1qJUNizTD3neQqtZiX3rzFRCN8iLLaC47g5B0Ams8SJ8gfbhkwWECidrT
	Op1p7H1pV+fKNQWQPtKuK/l/oQopgbEQROOKTXqruZbrMeLEHhXdHuSMvwKCjGv0q9dIncq9+Go
	fcGuSqxt0V/Uoxs9H2E1WE8oAy5p
X-Received: by 2002:a05:620a:bd5:b0:939:feee:630 with SMTP id af79cd13be357-93e50ffc710mr247623185a.30.1790999474877;
        Fri, 02 Oct 2026 20:51:14 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e472b24e1sm240755085a.24.2026.10.02.20.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 20:51:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] phy: ti: twl4030-usb: free the IRQ before canceling work
Date: Fri,  2 Oct 2026 23:51:11 -0400
Message-ID: <20261003035111.623790-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded IRQ handler can schedule id_workaround_work while the PHY
is runtime active. The remove callback cancels that work, but leaves
the managed IRQ registered until devres cleanup after remove returns.
An interrupt after the cancellation can therefore queue work that
accesses the freed twl4030_usb allocation.

The same work can be queued after IRQ registration if phy_create_lookup()
fails during probe. Failed probe cleanup releases the managed IRQ and
allocation without canceling the delayed work, and does not call remove.

Free the managed IRQ before canceling the delayed work on remove and on
the post-IRQ probe failure path. This waits for the threaded IRQ producer
to finish before canceling any work it queued. The synchronous work
cancellation also handles the worker's own requeueing. Generic PHY
consumer callbacks have separate lifetime requirements.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 85601b8d81e2 ("usb: phy: twl4030-usb: Fix lost interrupts after ID pin goes down")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/phy/ti/phy-twl4030-usb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/ti/phy-twl4030-usb.c b/drivers/phy/ti/phy-twl4030-usb.c
index a26aec3ab29e..37c326cd1d85 100644
--- a/drivers/phy/ti/phy-twl4030-usb.c
+++ b/drivers/phy/ti/phy-twl4030-usb.c
@@ -779,12 +779,17 @@ static int twl4030_usb_probe(struct platform_device *pdev)
 	if (pdata)
 		err = phy_create_lookup(phy, "usb", "musb-hdrc.0");
 	if (err)
-		return err;
+		goto err_free_irq;
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(twl->dev);
 
 	return 0;
+
+err_free_irq:
+	devm_free_irq(twl->dev, twl->irq, twl);
+	cancel_delayed_work_sync(&twl->id_workaround_work);
+	return err;
 }
 
 static void twl4030_usb_remove(struct platform_device *pdev)
@@ -794,6 +799,7 @@ static void twl4030_usb_remove(struct platform_device *pdev)
 
 	usb_remove_phy(&twl->phy);
 	pm_runtime_get_sync(twl->dev);
+	devm_free_irq(twl->dev, twl->irq, twl);
 	cancel_delayed_work_sync(&twl->id_workaround_work);
 	device_remove_file(twl->dev, &dev_attr_vbus);
 
-- 
2.53.0

