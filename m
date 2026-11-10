Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279746;
	b=ZIef+7kImcNF7KLSw7bVWpi8K0DEIgAxmKkFqlXLuU6llbIuzMj7TY8xyN2jr6+1UFmf
	 Z92Z/JbpbQpIq39dSXmwp5bF1Jo28I/J/nuJYTa9Wpg8wqlGZG1+LwDjGZQZq54gJ7BqV
	 CipAvZTgCabiH/S/4EoMyAOcDEvkAuIpFaqRJwvt2plR9dTHRKRG5xHGwoxQ+adD0cKVA
	 l4WrQHjolX8W+ezGIyXL/JlaEjWdQuVeP67jYB9adatd2q260xTLSrb2b8TQfFTVB0fg8
	 8qfM3cCL1XKyIvdSbaRLioa4HfWk+vV91SkRzcAWONZXxGFYf0YNQambWuWwSjEyEyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lNlAAFeqvPs3+2DrLUisJfKXmiq6ODin2NN2Dn+TzsQ=;
	b=OJcHjBbMwD92spMy5Ac1oYUwk3nqrGP9BvzT25GYXNGnpeM7AKRHlC+ZEJC0dVUhKonQ
	 TIc/MAK0Uy/DXQ4ZvAoV9HCw0mVWrvtKF82pJMlhZ8OziuyscWiFd1l1kvqtuIiAFz1o0
	 y6KTxgJ7d+B/Xk1EVgsTP+eE1dGv+Z1OtHX38evQur5dtHNcPrl1YTBb4JIssyIXyI5WF
	 pi0hZ3dsLR0he4JgZ+b7pteWvv/QHwktoHa+lpmmxBWD2Z/XAV2GUl7YUXkPLMWnM26sL
	 y469ddEnY6o8lP3rajKQGKcCUIYQJz7omF0AQiHC9qG1dDCFSJ+w+WgBmpvtkN7IXbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFbBk4Zv;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47DA606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47DA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFbBk4Zv
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8439fe796ebso1022944a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279744; x=1794884544; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lNlAAFeqvPs3+2DrLUisJfKXmiq6ODin2NN2Dn+TzsQ=;
        b=gFbBk4Zv4HAt4Wxj+pKFz4aUR6pmLgUYtSl9v4+p5Qa2ZurJFBBsdjonxf6lmsYMGa
         fRBWiOb5lhEaD4kGO6T5Y5PQcoUS9XbE1F9vVPW29HUDvlIdrnfWwAyg01diShoK77C1
         MC9nGnbpBtO3NTY3NiIVQO01wk6HO4x7tc7yKdoFJx5/YohrMKb+E3NhgShT6d6yJlhE
         YVR4qxvny/1di+qAfMiizlOUuwMc4DTKh373Drz2wT9jq56bgrDHiQaWJWMLm1NQdJoG
         xSqZmPpqudZoM2duhXKvY4l2uJ6/wrDCaJjI8z/DpE41YpddAghl1/6zJ0RBMcC35kYD
         3luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279744; x=1794884544;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lNlAAFeqvPs3+2DrLUisJfKXmiq6ODin2NN2Dn+TzsQ=;
        b=bEUtQJ/j1Cr4Q+oh4ytaXNAcaAxcNZn+2bQEz45YvdggErgPLoWggsO/VqVSvJmwUG
         i8muMvNJmvLKUAT8naANCFHUR8x0b17rSZ72gEGAbVljNRIBYDRlF6M80Tgiq82GkHXQ
         /Tmo651sR4L1Zm1AS7+vRh1nsWjhI0UqueXePmfZ5zPANFIoo9hpkmZoj/6/ZvW5j7pE
         qVeuJdQoeDJsMIePi3qfu/80RHf/2YZZyM7KAM5ykWXhyX0ApBWFpqMK0sa16G1YMHZS
         DqR5/DbWuSY5xLirE1PIXgY28ix2NF1RD0IzsdlZ4iz/VP7KUrSpPZSgH8P/LwkK29qI
         skzg==
X-Forwarded-Encrypted: i=1; AL+hErH899ByRJk2OoHU5PNFwiQsB5twPzGfTdQnN8nRaChbuLENVBBE0xxVP3BJMGO8P47TyrKhlcMIPE5nSt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9I/0K0REcjIyUv96NO4+7VRWnUjcXbozKJxDpsrVf0a7rtM1LN
	YafkCf4evVgoRIUjq52sNqSpzWb8mXCmkOtebatQCAfOwSRHdXYI7k/C
X-Gm-Gg: AYBFou0gdf66J18YKmvHx3bic9LqQRhABUQO3/gIGSHciejbhISiO6mzYR1Epj9j0yY
	txOa00+anEEIQoDlkS0MGJKNvsebx0/1ldj75p1ONh18uj+sVtEqZ+UnP7yeegMhMPwFTyTUqF4
	MYXRR/wTS8Z93PqFBWXJYGzCXSi/ZArmEo98uKN9XUc70y7a88elJJTbbrg9emgsFCzQHbsyfdD
	aGpM4/tzo2dG6noXWgAFFf6QH5Dt0KvmuKmHcwjqP7zZ3TV9FeoImW33gQbMeO36m/cb+QtbmO9
	FiZ6m0xU2I016HFrNIdWCxBVqxCeJFu3Y7BcJScOnAg/F3DAjlyHYpc6+O3MiX4xI9j5BK6gjTS
	OijeVggH5s0Tvj5MxLvyBzU7FkJO40GzEhf3zokiZFmccyPv3o/W0H+7T9Gv3GmavGIeRiTpvnz
	C/b97LngX+/Ggey9m4XoFHuFP0VHFx9MGfL0Y0AH+t6w+KLlUPjIz+Ln+xMyfYRX16l1v5AZkX7
	vtyusjz2eSRA9Gy8Dpg5KyJoO5wLORUgpQpValjEicPmMSCHOb8zlQIUDcX2xlSMdZUsJ3N5qx+
	qNn2DeWRdoi3s/Cz4gbgCfSO+x2022kd1M49XTfch0KERpzqzruzAzkjbowUM5UK3eYemw2Jjjz
	42hJpdoSz81eGxz2kEQUygUnk5TfkMxvV/djXrlnUFeZ4viEMfVLcNzkqGq3zVHnc5fXg9jpvzZ
	95IvVzjdwoGipsigLWzWgRJHwRpzlLr2NlDosD69GC8C0ehz5UKcw=
X-Received: by 2002:a05:6830:913:b0:804:365a:bb82 with SMTP id 46e09a7af769-860dc818e73mr1351189a34.22.1794279744586;
        Mon, 09 Nov 2026 19:02:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbebfc6sm882545a34.18.2026.11.09.19.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:02:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:02:14 -0700
Subject: [PATCH v2] dmaengine: tegra: only advertise supported pause
 operations
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
Message-Id: <20261109-submit-tegra186-dma-pause-caps-v1-v2-1-accf568bf0cc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOwQ6CMBBEf4X07GpbFMGT/2E4LO0Ka6SQFoiG8
 O8W+AKTvcxm5s3MIpBnCuKWzMLTxIE7F4U+JMI06GoCtlELLXWmlMwhjFXLAwxUe1R5BrZF6HE
 MBAb7AJOCLDtblWppL1KLyOk9PfmzdTzKXUfIi8ywgldHhTFeeXSmWV8RSa5mR6c9Fx0Nh6Hz3
 23mpFbSP4viKSiMKSp1RZmm9l63yO+j6VpRLsvyA7Q7gp4GAQAA
X-Change-ID: 20261108-submit-tegra186-dma-pause-caps-v1-664d1320d502
To: Laxman Dewangan <ldewangan@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Pavan Kunapuli <pkunapuli@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Rajesh Gumasta <rgumasta@nvidia.com>, 
 Thierry Reding <treding@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, 
 dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Tegra186 does not support pausing a channel, but the driver installs
device_pause and device_resume for every variant. Both callbacks return
-ENOSYS on Tegra186.

dma_get_slave_caps() derives cmd_pause and cmd_resume from the presence
of these callbacks. Clients such as generic 8250 therefore accept RX DMA
channels that cannot satisfy their pause requirement. A receive timeout
then reaches an unsupported pause operation instead of being excluded
when the channel capabilities are checked.

Only install the pause and resume callbacks when the matched chip data
advertises hardware support. Keep them available on Tegra194 and later,
and remove their now-redundant checks for unsupported hardware.

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Remove the capability checks from the pause and resume callbacks now that
  they are registered only on hardware that supports them.
- Link to v1: https://patch.msgid.link/20261108-submit-tegra186-dma-pause-caps-v1-v1-1-9cc9b17a033d@gmail.com

To: Laxman Dewangan <ldewangan@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
To: Pavan Kunapuli <pkunapuli@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/dma/tegra186-gpc-dma.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index e76c58f213d8..bd606b71e714 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -419,9 +419,6 @@ static int tegra_dma_device_pause(struct dma_chan *dc)
 	unsigned long flags;
 	int ret;
 
-	if (!tdc->tdma->chip_data->hw_support_pause)
-		return -ENOSYS;
-
 	spin_lock_irqsave(&tdc->vc.lock, flags);
 	ret = tegra_dma_pause(tdc);
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
@@ -445,9 +442,6 @@ static int tegra_dma_device_resume(struct dma_chan *dc)
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	unsigned long flags;
 
-	if (!tdc->tdma->chip_data->hw_support_pause)
-		return -ENOSYS;
-
 	spin_lock_irqsave(&tdc->vc.lock, flags);
 	tegra_dma_resume(tdc);
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
@@ -1518,8 +1512,10 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
 	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
 	tdma->dma_dev.device_issue_pending = tegra_dma_issue_pending;
-	tdma->dma_dev.device_pause = tegra_dma_device_pause;
-	tdma->dma_dev.device_resume = tegra_dma_device_resume;
+	if (cdata->hw_support_pause) {
+		tdma->dma_dev.device_pause = tegra_dma_device_pause;
+		tdma->dma_dev.device_resume = tegra_dma_device_resume;
+	}
 	tdma->dma_dev.device_synchronize = tegra_dma_chan_synchronize;
 	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-tegra186-dma-pause-caps-v1-664d1320d502

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

