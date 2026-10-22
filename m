Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687944;
	b=IlH22RFNB6uLWECWFl7YX/Tsr3wC2p2U9hVYPy5a9rXQh42twCINBkZiwcw2+KNidNNh
	 ddWUA94acUehAplGb2Vm0SwjDsS0cNce5nJSS528xPHGrR2m9oWuQXlx6xCZ8L1K8+kq+
	 pqu/o2qeOUY+UBM3HG3UTqhpVpC/BcpFhKpDgpYygYDhKatXXEgLEWUwNtRBOHwCjKXJU
	 fJmJXsI5lq6OBhF/G47OyoYjqNsrSK3bCIiBZAxh60vJz72y+uXC0u9kg5Kue/DgX/091
	 AegESJHHQP4r54bkCHqGBV+lfvAs7U0FQr4qdfNvMbQHBneYqsVy3DACLiwglNN0YvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jMHX9wN/BHCrbGnqRhP4+R8W0f/fc00EEaOQLsHpHDs=;
	b=V6OgBJP62oE88CpfG5XDu9Ti8+g60SlG/5j+z68HJ46b+Ck4MpUyejcZbsHUMQypyQl7
	 cp6RYeAOkfHedPEpvyJAJefQvQOqovMu4ZqJl1/l8V8YPBJ/gK2fuO5ri/HU3JUocOWth
	 yDbOrPLKSDC2akE4qdtDr1yvdCtR8E7Wp3nxuN5XK8JjnHMAWbVPtLBbQqw0JrHKhSoJA
	 iPr3axJeGqTPGVWgq36h9bD3hNinhoPObM9KPk/9wjkm6xMvZ/i1cmL82DZ2HZycWhly/
	 8WC3rSVNXaqBXoINfAkcZBEkzgaJZOErBuGig+j8aKmafrD8Qmfyf9KijEhbzLVbmPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNtXLkbq;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5A6606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5A6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNtXLkbq
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35829219da8so1273071eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687943; x=1793292743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMHX9wN/BHCrbGnqRhP4+R8W0f/fc00EEaOQLsHpHDs=;
        b=ZNtXLkbqxXKhm9LkyYZ3wmwXyLpGV4IAMBJmnHcSAGUODvO78X7nykOabEjPuQR/6f
         UJjQ8pmf1efreQGhE1YwaQaViWz9q249jdFTEIfmWX3XBPj9z7s3XwzGFgcOfczn++gz
         NTBj4IxQauJoxjGBa8VKbnSRin1Tj8KjOLKJnsiHfg1j0l9sr8diNw0TxgMjHAR7HgNc
         uIaNm7r872/J7oPO8pOrqw6J7nz6ImCe5V2GcLsmylQOAZ+YrlhGBCnZ90Xk2O740Tj9
         z7Rn/idIEICZqAckbDNFdfzo8OktNwoYo579qWKB0A8UfmKffQi12opciVzkXFjGV/F0
         gTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687943; x=1793292743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMHX9wN/BHCrbGnqRhP4+R8W0f/fc00EEaOQLsHpHDs=;
        b=gLgXeRIwV8pzhkiTnGEEY2ftgQjwbsesLQ/kc3LWpveffSR50o0nBMqN4R0VbSHz8X
         gxWfXoBEqFSlW042+348NsOnXN+2VfvSGywuCP6A3xC38VJWyui6j3fjq6sfbtrzu0gt
         4defkyUrIlt/e1muNb33C4TL8D8G6xKH7X9J+C2t92ocCkCfzBTs1vKwo7H+qavO5ZR3
         sZja2FEbOe/P28pxeJM3y8cguS7TUCLSVQJOOAz81FoO5deoRIv0Z73tsRBvzoYzxoM6
         IeZAwUNWkfWpZHAU9glDCdH4dMWHWGg3TBRm1GKseRO62klqm0UMFXOMuHttZ8SI3y8C
         4Z0g==
X-Forwarded-Encrypted: i=1; AKwUvBxDyaXV8JRH13/WlsTkGjgVIBNrmJSsU5HAxlF7cSOorE4TaGzkjOEfg21LSX/6e47lVFjtKH0EYZVmAU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7dpmBWu9KfYCkOYKlu0NwqvVLlpnJuGiptL4qRPlItZMVgc8p
	zeqikgnE7IbWtdEGSDcvu54HtcdKLVbD3ZH046yCg2Tz8unyqIDHvvaa
X-Gm-Gg: AYBFou1aoD60LyUfjU0JyatYcBLJfjba7DN/1xTiQpoYRE+gWCKH5uiGT2ux4TdX8EI
	USxvH0G7gE2aZntbsBqfUQjvZQtwhzgwA1QoCcALJPHOcNqSPUQFFLs98bWaRADevjq9/niBkyw
	DBNjRoup9xH5CXVcvwiVda7nZLVPW8UJ9QZ28LY9TDDBU1ULSiGx70Ji2f2KRgmeB/qwuow/cDo
	/A5oib6TMbGstppd92En/Zrj7+kc+nQS5m7xN5rOv9UzStmgiXqScERzoJ+bYtQTGrqGmHmhwdG
	yL7wRvaXALT6+cEurgy3jnOXNiP/v49JhYzeDHL4ygAL8KUwhBOPXt6FcBuDoOk7jmvaCWO4eb1
	f88xZbPTmcEMsyCuTib2bgrUwsk9vHnwzDI5nm/ejIXRH9SMJNlTiTMDU6g/zqa+f6BOAOej5Zr
	QLnSJjlLSRy+p1Mu0GG7/HZVN5b+SGx8s1/pxlUhTUgACJWWRwbYNRSlukbYI5XvWtrZ9u/Z+l5
	cz2jy1uqNfDSStECE9ZrfMJgg40jo0nPrlaQu1k/Rl00/ZZaUf9hTgSTI81AiOlbMFBz0Y=
X-Received: by 2002:a05:701b:4250:10b0:184:40db:6bb9 with SMTP id a92af1059eb24-192f2d2204cmr3620614c88.8.1792687942800;
        Thu, 22 Oct 2026 09:52:22 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm25263741c88.12.2026.10.22.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:52:21 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Fri, 23 Oct 2026 01:52:19 +0900
Message-ID: <20261022165219.1368-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

In DP-only mode (DisplayPort pin assignments C and E) all four lanes
belong to the DisplayPort PHY and the USB PCS stays powered down. The
USB controller can still exit and re-init its PHY in this state, e.g.
across a system suspend that loses power. qmp_combo_usb_init() then
programs the USB serdes, lane and PCS tables over the DisplayPort
configuration and times out waiting for PHYSTATUS, and
qmp_combo_usb_exit() resets and powers down a PCS that is not in use.

In DP-only mode only take and drop the common reference, but keep
counting the USB user, so that qmp_combo_reconfigure_phy() powers the
USB PCS up when the port leaves DP-only mode.

On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
in pin assignment C, resume from s2idle failed with "phy initialization
timed-out", the dwc3 resume returned -110 and the following xHCI resume
hung the system.

Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a 7.3-rc4 based tree, where the mux switch itself still drops
usb_init_count when it enters DP-only mode, so the tested change skipped
the count as well. This version follows the reworked mux path in
phy-next and is build-tested only.

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..6e3406d519d2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4459,10 +4459,12 @@ static int qmp_combo_usb_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = qmp_combo_usb_power_on(phy);
-	if (ret) {
-		qmp_combo_com_exit(qmp, false);
-		return ret;
+	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
+		ret = qmp_combo_usb_power_on(phy);
+		if (ret) {
+			qmp_combo_com_exit(qmp, false);
+			return ret;
+		}
 	}
 
 	qmp->usb_init_count++;
@@ -4484,9 +4486,11 @@ static int qmp_combo_usb_exit(struct phy *phy)
 		return 0;
 	}
 
-	ret = qmp_combo_usb_power_off(phy);
-	if (ret)
-		return ret;
+	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
+		ret = qmp_combo_usb_power_off(phy);
+		if (ret)
+			return ret;
+	}
 
 	ret = qmp_combo_com_exit(qmp, false);
 	if (ret)

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.43.0

