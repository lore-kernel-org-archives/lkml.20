Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B933A7F68
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536253; cv=none; b=jK75kt2sWk7SiI1TJpIAZh1GJwkotatC58x0+QAnuFgb0zGdaSIBmTSO9zgEERozQPDECsLt/LVNbnZecWi0d7yJ0ca5//YqWJr00qsKhYhfdCspgkDEix7/qztqDxCmkgT9cKjpYatO8/FXI+nI86VfYRE5SCVSoBw/19l0z5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536253; c=relaxed/simple;
	bh=hpjXRGa4viZcbFnNO5KBT0ICAECMSKtgFaKjk3ZUers=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pq4M1EohYw70I1fYP06hmHb3wupJdfS3czsQXPmHd7EaMoU1LVKMJdx5ZAAW40OtQS6b+Ruue14GJHOG9PyEAZ2EICPDNd0l5ZQafccTLAqoDCF+s59YBRd7tgammK3k5yK+2+trkrH2A7r0c7xJjgLNDlPVEj0ZWaCKCe1Huxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGwsDUWf; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGwsDUWf"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-7f4ddb9adf4so2127394a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789536250; x=1790141050; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zSwtxaUSQ7K0oB62qUITKeVKiPbi0vng9/BLzWTtzOE=;
        b=aGwsDUWfMP/SZ4Xh3vDRKBWC2mBxUbNhBgZpQUe9J+2dBvkzstxVH4qlkTc32gD59V
         cHxEAi+Kfe2dT9nppRWHNbzkdsZlMr8p2InxR6xDBCkoxtJ6FBP4UkvCfDN4Hpgr5hcf
         7xKdWr6xZmaOWrRcKDU3aVfab6ltc7cvUVB9wecQmqPKkuID8lY7O1EiGswdWIyNZZ1y
         NKCwHLVdj/6NilfNU07SGlk/J0SxGDryByKSNiGORKpKt1QTTrbbWSziGqq7B3zpVNSY
         AToNRGaTjDuiCiRUduYkj/vtwc7JluC4X8bAJV546DfEEqrmHcp63FD1c62nhthtlpwt
         /A1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789536250; x=1790141050;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zSwtxaUSQ7K0oB62qUITKeVKiPbi0vng9/BLzWTtzOE=;
        b=I8mu7NW+1cEkIvJQqz4P5TRfPIUTyRJ3IDB0tpTN5Bo3eOT7N0hqF88XoxEOUUJEiq
         IQc5lzzIEXKYBCBNxFv77h2rkV0dm1oqVSx/BFbjFBI3ZHFkci6qPwpq4/t/h0mfCXkR
         9YCPNEGGF1KhGKs7wRrt3DvWcZuawAm2GNTgDyaaWZfnxUlmt00HVZgxh0+Q5pmO0h5u
         QrQKydZ4gAD7r3x8OnoI4BqNGrtXYtJsi4a2YPR0HSYVx1LqUWACG+Lr5sH0dXYkyYw1
         nmF39p5hp67Gp7gPnd7RblU7l1+ysBqXJkqI0qYyhN+usUiLOWr1wmlVmXZMzrsqw6E8
         1LiQ==
X-Forwarded-Encrypted: i=1; AKwUvByS8Vfebs8OFzuV63wRaeayw5ndgrl++7xqwpwcBw2uSPsuIgeZll3+17Md0prQkhj2poymt3By73gN968=@vger.kernel.org
X-Gm-Message-State: AFuF++kkaypyOhSoZRz1sOuCiZKk6znzkXHFz3ys9OUYgMl5gn6DwS6j
	RXA1SMGCrQT+cEW6zpKFBPSWetCiJ+5r0idRdwyCQsLLE/iYRsgyq9Gd
X-Gm-Gg: AYBFou2UDZlyoRoAhgbxfnMjeEEtZZjfStjv+HZ5/b0xOiDB2+5GOwewCLHTUI4vpzM
	vj+qL5HzdN7gtwTjn2rZUSCjdAd37Cknb7MDnyjU/IoBwqSRoKBykvbE7anf4iKZ6tpiGc9e6zQ
	XiIprkaJ1EaLAA93fPyVAzQA58ZmAFIyCAhiLE0NDq4d4ebe0ZUN5DyClvcKpNpj6+RbFnl30Rs
	+vn3NTAvmmo6ZarFhXy0iiAmYb1HxCT8X8t7Rvo0F+NLQsw3xRUvqYBTN/94INGFp6SMjBtsM2k
	n239yABRShYKMG72ayUcsxxAdOeyQkWvVWSrHnGlBelJxdOAQ5JA1oubQicvf4imackZ4Wk/IeJ
	+NKly5XjYk5zqnjJaR5sXymVRUSwAtda/3bAGOZ+lr+Gxnbno1+7TblHYvk3cM/Tjk2pxztQC2R
	PE+1WafZKIy22bbf0Xz5j7ptbx32IDyBV95oI7sqR2GULvRLi0JrpZaRJodu3VljdTB8g=
X-Received: by 2002:a05:6830:6d2e:b0:80a:45e1:7677 with SMTP id 46e09a7af769-80b2f3ac500mr1403318a34.23.1789536250381;
        Tue, 15 Sep 2026 22:24:10 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0294sm1562819a34.24.2026.09.15.22.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:24:09 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 16 Sep 2026 00:24:00 -0500
Subject: [PATCH] drm/mediatek: dsi: force command mode in mtk_dsi_poweron()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-b37f167e25cb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQqDMAyA4VeRnBeonYjuVcYO2kQXRqskdoyJ7
 27x+F3+fwdjFTZ4VDsof8VkSQX1rYLwHtLMKFQM3vnW9XWLOmpmtMx/zKttykOUNGPcPkgmGCJ
 hXIiRunsTnO+nZuyg1FblSX7X6fk6jhM0/FZ9eQAAAA==
X-Change-ID: 20260916-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-d834c029f4b8
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789536248; l=2721;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=hpjXRGa4viZcbFnNO5KBT0ICAECMSKtgFaKjk3ZUers=;
 b=YGYtnMBV27PnM1edrgMETUOi3yg7VZTGrzPFHJou4Uz1zxAGKN1TiUeZkDDsyt2+fjf5MWWPb
 W6IpgB8c/lLB0mGPpb7e2KK71MSkVE3pVyuDUNsENUDYOqVIuiy9cDh
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

mtk_dsi_reset_engine() does not touch DSI_MODE_CTRL, so whatever the
bootloader left there survives power-on. On boards where the bootloader
lights the panel for a boot logo and hands the DSI over still running, the
leftover value is a video mode, and the first mtk_dsi_host_transfer() then
takes the "already streaming" path: it stops the stream and waits for
VM_DONE, which never arrives, because the engine reset has already stopped
the stream. The panel's very first command fails and it is never
initialised:

  [drm] Wait DSI IRQ(0x00000008) Timeout
  *ERROR* failed to switch cmd mode
  sending dcs data 8f a5 failed: -62

Set command mode right after the engine reset, so DSI_MODE_CTRL describes
the state the reset leaves the engine in. The video mode is programmed by
mtk_dsi_set_mode() when the stream is actually started, exactly as today.

Seen on the Amazon Fire HD 10 (2017), whose LK bootloader draws its logo
over DSI in video mode and never stops the stream before jumping to the
kernel.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The board this was found on, an Amazon Fire HD 10 (2017), is not upstream
yet, so no in-tree board regresses without this. It is a state-consistency
fix either way: mtk_dsi_reset_engine() stops the stream but leaves
DSI_MODE_CTRL still describing the mode the bootloader was driving, and
nothing writes that register again until mtk_dsi_set_mode() at stream start.

This touches the same lines as "drm/mediatek: mtk_dsi: Transfer register
offsets to per-SoC const" from the MT8196 series; I will rebase on top of
that if it lands first.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7961139333ad..4cb486f54653 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -737,6 +737,15 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 		       dsi->regs + dsi->driver_data->reg_shadow_dbg_off);
 
 	mtk_dsi_reset_engine(dsi);
+
+	/*
+	 * mtk_dsi_reset_engine() leaves DSI_MODE_CTRL alone, so a video mode
+	 * left there by a bootloader that handed the panel over still running
+	 * would make the first command wait for a VM_DONE that never arrives.
+	 * mtk_dsi_set_mode() programs the real mode when the stream starts.
+	 */
+	mtk_dsi_set_cmd_mode(dsi);
+
 	mtk_dsi_phy_timconfig(dsi);
 
 	mtk_dsi_ps_control(dsi, true);

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260916-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-d834c029f4b8

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

