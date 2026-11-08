Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171963;
	b=sKP1M1gjKzDb0LtkesweMtdC9ckZdNO95twFWcyou+zMX2Yf5vBupHcdx8BYkueF0lWm
	 xh3px9Z6f2DFLJVEuWh5/D7pkmAeFlnevDBGzh6zDdr5fXYgTtLuJ8xzSWQdirkgGx0hz
	 Tdy87P6aAHbEbInBeWPWjTuocxaWFhJlPUyUJpFqEsfXvU9xz3pzYcRF1sbv4rhadDtJY
	 3uq3i9pqbZFoAFkJ8WTsbbpXHOJ8UUl1v1xdmeEu+WfpS++syXdrQvae+PKwL8OOM/HZa
	 7RlJsJ08uqDzK0NLF/rWuN3U97ZXuaMCwdVul9ZbmX/qwa5BN0LBufbK7nbjITKpKzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=GNWXWN4JgZ7053uqaoeB99xmhmDCtwvTAn5dZkJ9Sik=;
	b=f+WRnhCp0PI6o19sQtwhhl2NN2HvSqSip3KnzjD+KiXWewY+NGgJcZktgQNVzV5yRs7w
	 6EISO8tf/EUFZJ94rR41ueXeOEQvlVKYzD0Shlb2clAGVRxWEdqPmrLy3mMv+ath59kfe
	 +YRL+0X0TNWxOj9KrRjg+h/5xkyXf2dOC6pl+S+34OcbADw2FhIu/iXHwd6FGtp4J8vcv
	 QoPXhKRF8gIsMqzs7AAcnwnD8uEczUHr8r0v23hQyFRd+I6xrlniErnvTrZbb877b+f/o
	 cVf0uLTAmPbZRLfrkCvMEGKJKTHhqJsBcynH51DmaERQgiOLCXvmPOPJ9uR/pSmOfzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEOmnNMk;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641E6606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641E6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEOmnNMk
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-825b40f8a26so101181a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171962; x=1794776762; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GNWXWN4JgZ7053uqaoeB99xmhmDCtwvTAn5dZkJ9Sik=;
        b=pEOmnNMkD8sFntj+FkOJGpjj8rcZAQMLRp/9VvuUb3AzT1pihw3SfSA61TPxtOUEGm
         GUX4v1V6qJWUWjzC7Hvb0FWsyBA8Ch9EZ87VthO/0eR9SJ0oDdX3CDZf0K6sOzeE0Fot
         kaYJ+xE09txht8kdIuA8zNWdlKagXEkqGEwb3iKZGFv+Di8zv94zFDZphOnH0Q+w16th
         73EOxV0NT0/ycAsVR9EOuvPddp0N6ASIopAqFHlOYJdz69r4xaLeiCRlItlvC9HWAcQw
         WCN62W3WMtcDViHj2vYEXVwI71BiAJoBQeNmDKMLVrzqvR7k4sw+29YdGbvAhhZNqL2X
         rciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171962; x=1794776762;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GNWXWN4JgZ7053uqaoeB99xmhmDCtwvTAn5dZkJ9Sik=;
        b=IB04LvNT5H23YF2Z34vqjM+AX7A0oB6pi3ZJL5a0I+CdYxGsshM9aT5fYJuZc2IL/f
         462lsambQsW/OB8JRPLtlNxSmGVg1z8QeZ94mTZa3ZMyEtOgt+s8A3LtCs/xOQQninUJ
         SKEjvZD/GPeDjIzCBTPzMZSfiv7Ws0LU4EL4IqOn7f/McD+f9RNqwCm+xahqUqgisIrX
         JQubUttLvcyt1IdTefx1BIIJEm84JwrXAwQ+fh3jFoSuWs8CRS0fFbtoH94nJ47GpGOe
         S3tO01rgpgcYDroycPz7lWjdeKDbq/IcQXo7c6pCXPqUtjirJd6yhQrT9EDPmJlgWTSv
         4gHg==
X-Forwarded-Encrypted: i=1; AL+hErEzRQyKJN5pUrhdNUohenK1dR6I9YwQwPaqI5wztsb0XszUfpRVcIcB2TCR1toQNeDOhg9539SI2/H8uVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mkxiJ2CUeApcSACKt6XFvuIRkl+VncLcp60UnGksvBjIhWu64
	7swJaePIoLwR27wnH75nzfKJWJnJrina7g/SaN3eCuwRxfaZTTQkHS2h
X-Gm-Gg: AYBFou01vx4kLAVg8IFWD7ZtBUOCswv6UxxjHaHKEj5OEex3ldJCrzFSBCukR4sUFno
	yICBGVJXHwDuvbP89+X4n3uRDdc+kzcVRonfDL+QAAA/XNfV7Ks6/DN8s9BhVEfdwzwvhy6O0Tv
	M1f40c03Rgz43rrzrnkyky3J9t7x1zanPEMpVzkafSoJBre9RaVxGfL+s7gtb/9AcNYUdPloVrc
	QdZfoiEC3EMZnmXaM97/K9QPXt6FQaOG90XF5HxOukVbV9xSQNmTUrlNKkY0KA3sXSBvQFRZ1q+
	LZyOeXSK0DlYUcmHqBJ+6y5LrqDBVVrzLQbjIKLflpbaxCKKDQTTpFvqAakBR4Vp631CW/qsdct
	NGwSRcc7eCJY7NWVDJBMtj8SXs5qfOAV0k3AhKkMKdPYWThYNHu0DA0IherCB1nKyI0vRMoQA9v
	8HM14DxsOsQvtVWpUdZOYy4hTHTuVcIboCbRYXU5XYgFgpxBnRWVRRLbvrVVFTI8tPD8v1qfpet
	YK47qfvfjy55lFYE5PBkzNEDKAmLoXRLejVWMsNN2bbyD0KVPfeZuagOjq614AFUbdY7/ad4f6X
	JH1lpdw6zjSMuwAfTZ8mKLHszPPSCvzhz+emMYtgIY4cTdNA0tiR1DFnQNfmU0/H1HQQ4sVCMni
	F5O6oGzIXCX+47iB9KWjALFWcx481oC/DwOwfC/PiWdNOcyLSFkrO0SuKZk1qutLaYMkhXAYFoo
	yypwlI62eaNeCDn+fFZfqygphBMdurb3bqvTXUBh4npJ0mCsSgtkyJaqPO4uwzVTrSAej76a2sd
	g==
X-Received: by 2002:a05:6830:2317:b0:804:ec69:3979 with SMTP id 46e09a7af769-85f50854422mr1625444a34.21.1794171962292;
        Sun, 08 Nov 2026 13:06:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fbcef97sm2275583a34.21.2026.11.08.13.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:06:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:05:55 -0700
Subject: [PATCH] mtd: rawnand: tegra: drain the IRQ before disabling the
 clock
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-tegra-nand-irq-teardown-v1-v1-1-2c570ad4a22c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3Q6CMAyG4VshPbZhA4M/t2I82E+BmVC0m0hCu
 Hc3PXy/NE83iCSBIlyrDYSWEMPMOfShAjcaHgiDzw2Najqt1Qnj204hYaJBDLJhj0FeOY34+cO
 4aOxU3x0vrWrt2UF2nkJ9WH8/bvd/Z+RBLhW4XFgTCa0YdmOZpuTrItdMa4J9/wI6p3S/pQAAA
 A==
X-Change-ID: 20261107-submit-tegra-nand-irq-teardown-v1-60f649303b8c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The managed IRQ handler remains installed until devres cleanup, after
removal or a late probe failure has suspended the controller and disabled
its clock. The handler can still be accessing registers at that point:
it signals the command and DMA completions before its final register
accesses, so waiting for a NAND operation does not drain the IRQ handler.

Mask controller interrupts and release the managed IRQ before dropping
the runtime PM reference. Apply the same ordering when chip initialization
fails after the IRQ has been requested.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 7f9eb5f042a7..1104d75b6cbe 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1212,10 +1212,13 @@ static int tegra_nand_probe(struct platform_device *pdev)
 
 	err = tegra_nand_chips_init(ctrl->dev, ctrl);
 	if (err)
-		goto err_put_pm;
+		goto err_free_irq;
 
 	return 0;
 
+err_free_irq:
+	writel_relaxed(0, ctrl->regs + IER);
+	devm_free_irq(ctrl->dev, ctrl->irq, ctrl);
 err_put_pm:
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
@@ -1234,6 +1237,9 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
 	nand_cleanup(chip);
 
+	writel_relaxed(0, ctrl->regs + IER);
+	devm_free_irq(ctrl->dev, ctrl->irq, ctrl);
+
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
 }

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-tegra-nand-irq-teardown-v1-60f649303b8c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

