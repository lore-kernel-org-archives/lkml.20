Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80383B8D7B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792293435; cv=none; b=KS3D1GG055zm7oHD+1aTAc4WMIRkrTPmleC4G9umh9JAwY7MxKpCyT2lAWwW3h1dWA7Up0yArSSCGDTVysJRscFf3dd2KRSca/wn09+TBBQJ720KA7fJIgqflhvBCMq0q+u9j2gsk1s+XRcg90Bsc4+8wF5VZVZbNRQp73eJpKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792293435; c=relaxed/simple;
	bh=Dqx7bjnJ9ljoxyRAQVnpEUe+0UkIBf/9p0mvgs9N0O4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=numnKlUmTgcdIFTrg86ILnQ2A7EQo3HChDVZHA9bCw/sI22TZok99/4IVNhVpwLLGDnKvd9UKrAGpPXvIDpGzYU792jOzBW5YlJiEHPC4w3LKdUT3WbRn/tW1Bcx4q8GW4I83cWo7LgYFNeI/b7+kCEtgZGqz1+Ao0fT6DQLkbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQ6GSPMq; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQ6GSPMq"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f1e5d7450so111198185a.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792293432; x=1792898232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gw9rUTlrYem7cQv596Vt7Cu3AvgaFkq7BPIa8azNfUM=;
        b=fQ6GSPMqDoX/tmCPchJRPG7ST6C5dNUmthZnTJ7WQJ0v/YNr8xdO40r9ujacGz4LK3
         V11V7U39s/QLeQ8P23Etr8fFJidCX3Oz4tNTiHtZvRVRAggXFkiv4DtGEJ4ar4VijU+p
         KV53XZqif3KiveG7Dziji1gMqLyfEVvNbV1Pknb2gJxo/vb8Mg+UB25fLXwmIjhntaaM
         s0u1QGK8D8Zc2z1hmsB6SNZPzTl8KY0ZVPT7fAq4vBS5vDqc9w0a7IfWQ8YlVOYB2EIr
         XVAbhaOKo8cybM9NAMOPYXGnk4habannJno2Fzf1dZs3HvKdnB516+bEsOH2a7laVCbq
         hWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792293432; x=1792898232;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gw9rUTlrYem7cQv596Vt7Cu3AvgaFkq7BPIa8azNfUM=;
        b=y8D1gecImv+D6mxtzKA80IqMzBJ4fH+WSRLGdMt+nFDEPOnwe1JJsZljavpBpU1mA0
         6a6Hild77zHcaKqV51WiOi+4xmPEN37Rln99gaHM/jZEtFS7nfsEv2GVx4Hx4H3RfExk
         w5JfzijchBgbH5bJi+b1iDYCoIYOZ727MPZ58hOKZFOAA80olRr99AaIuvM9aBZ6gOBW
         zPBXPtKx6bwfFIh1fKg6vMbH+PIgDKsyXlgZvxDJt2/szzN6RjdFyzUnv2CBkTaot7wQ
         khqJM5VsqIDVfInojI5eub+DYzOhh31TaryKArRAjmtOkKJflkUzdzKKKstpQELJf2bd
         /+gg==
X-Forwarded-Encrypted: i=1; AKwUvBzjh+LFueio1IMOP7XibIKpVRz2m+rd+wcjgL2uNJT4CbREHJ5uaQu9DOGDs6A6TboFMlWrhBGpyzucZcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd3xbHdCYk4EEnUmbmpx+acmSh89l2ogZlmoYVxfLnA/fKTOTT
	LCNmH5kg7Z4btkGnELwWKjxdpHBO3EbCqw3zOcHu+jU34JRQOl+LIpo=
X-Gm-Gg: AYBFou3AXo+rYebs/6mqbd7O1LLetXmqiNdImvj59NelrHC+Jr9LOV4Iy5fxONQDNC8
	1cYZqc3WCdu8/Fqgbgw0FaXi4/QzWAC93xMcSp20HEXf1erReKXmA9/gh7PRyOYF2FlULBTblaw
	jmV0hGhdtUw+6orO6HrUKwBLkUiEnfft5R7QhQnE+MMGSsM8KkTJ7D/riCqib66+jvuihcbGwn4
	TYGUH4YTAoELeZ7jyWmL+YUm7bRmOjRA+2wS+wQ1wCqZHTTmiZQQojEhuwDq18+GJtstpld5fW1
	ktLzuBSG1FKhaeiN4/G/iI3xFtIGoF0v5A+oD5UUnIcLH/hyu7NnY1PqGI3KKrZQPTRzB3FDgu4
	xoEXKWRG7OXuEnp7JQnSpf/vUj4SmLO6q8z6HANLobsEtu1idoSpkIKeFnPcHs6uJjy7vK9o0wf
	Ein9q2wlizaaFCt0IdRM9PCq+a6etowHivhKdSiNbfjMPidjGzS/Hq6/53y+BDfXthCn3TT66oH
	+/Cf09JD/Li2m4gEPKWg4InLF/OhEgnUxQEueN0gBV/4na7xz2s4Hb18xX5mgg38GHCcemKOCVf
	4lAefZ+bygM5icsC2umPfWLmTVjl
X-Received: by 2002:a05:620a:4109:b0:93f:35fc:5266 with SMTP id af79cd13be357-93f35fc586emr276156485a.44.1792293432462;
        Sat, 17 Oct 2026 20:17:12 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1688aesm602519385a.8.2026.10.17.20.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:17:11 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Rui Miguel Silva <rui.silva@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: isp1760: shut down the VBUS timer before unregistering the UDC
Date: Sat, 17 Oct 2026 23:17:09 -0400
Message-ID: <179229341115.3942822.5484449075463010207.isp1760@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VBUS interrupt handler can arm vbus_timer until its IRQ is freed.
Although isp1760_udc_stop() deletes the timer synchronously, it does so
before disabling the controller. An interrupt in that window can rearm
the timer, leaving it pending after usb_del_gadget_udc() and free_irq().
The timer then accesses the devm-allocated controller state after
removal.

Shut down the timer before unregistering the gadget so that pending
callbacks are drained while the gadget is still registered and further
IRQ-driven rearming is ignored. Also shut it down on registration
failure after releasing the IRQ. Keep the temporary stop operation
unchanged so that a gadget driver can subsequently be bound again.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 0316ca6319b9 ("usb: isp1760: Add device controller support")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index e45a54c..7b60bd9 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -1581,6 +1581,7 @@ int isp1760_udc_register(struct isp1760_device *isp, int irq,
 error:
 	if (udc->irq >= 0)
 		free_irq(udc->irq, udc);
+	timer_shutdown_sync(&udc->vbus_timer);
 	kfree(udc->irqname);
 
 	return ret;
@@ -1593,6 +1594,9 @@ void isp1760_udc_unregister(struct isp1760_device *isp)
 	if (!udc->isp)
 		return;
 
+	/* The IRQ handler can rearm the timer until free_irq() below. */
+	timer_shutdown_sync(&udc->vbus_timer);
+
 	usb_del_gadget_udc(&udc->gadget);
 
 	free_irq(udc->irq, udc);
