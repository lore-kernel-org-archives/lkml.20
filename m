Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B3D4CA28C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448335; cv=none; b=tUEtAMrZAS2B6WuuGL/RVcGZfP82oBnbP3S64jaKbe4dLhNodJNLSzDzVLxgHa6B7CKk8sZ6kKH5GalTfDIRhoOrWk2y8Ne4O+CzQz+Sh2kSSSd1nUtMF7Qjs/WOHS9lrMD3rHaYPYlW0Gu9zptx/5KJothq1eKt/3r7PZB40As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448335; c=relaxed/simple;
	bh=AypfK/aOKqjDcv6x3JX0uwcWctZz8kqyktBW3Ip54EI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NsvfZ4XlEP04af6qLepgDJ/8HjL7hD3cTuPqPNXi0gZPxZdCZtS8xMIxAuay0bVz+wMv2ljqMj5F3Gbb4f6LJ03BcIEyoIDMW9AMUXRuvs7+HTm2VdrBRM3jsooR00QgL5IQ9sebfbMqs/gdoWb3DtZRLJsijdKgJaURePrGUiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzOUIIHR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzOUIIHR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba14so2294278f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788448331; x=1789053131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjlizrWboIfwnZS2oWukdlINpTQI4dn8vHdtaiT7QzA=;
        b=jzOUIIHR9sRjKRgnKc63T7QLTdWlKVM+F10nvxX+yoxmvPdpyJCVEuA8J3iOXwFxfE
         9qb7TBbXYnuSsfOyy4sCbtKFCWA56T924WUv8xM27urbD4Mse+e+gN9CpFsNRvDLdGO5
         tzs1B3cMvEfs+++r2T+4YOJQXSD6t5eWlgbvJCsyUplV24NyNDuAvbmiljrxk0SbjRpN
         2+rwThmPekNC3NgHcIJwE/DbHO+ZUcUeQgujDFd8WhBIgmFRXSd1FvXoAgyz3JwIT2Kr
         jjzLIGJ0QXCJfhYa6D9t2AmMDNjlT60zonbEQIMLd6Flio1RQdHnY+3PkJ8iom8W2xfr
         Muxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448331; x=1789053131;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjlizrWboIfwnZS2oWukdlINpTQI4dn8vHdtaiT7QzA=;
        b=jhV2LPoFsJBvfkdJwwBsSGCUkqTcPqHXcZD3sl8Y04g4Tmrv/04OETRUGfa2lqjsa7
         lgdi6iYniX5RlpnuuqbT2UIS3zBW+5TK/0yQypfDL5Ry66QuT1vuISgf3n6gLAZmG/dY
         yXGdOt59xyQTsGII5zoZIqkzI/WS1OyPLIXALxXrmW/6R+jALd6ELTzU+IwdZefBku36
         8J1b5nIsbzU1JHqRKdsQTQ6nLLM5llQRwsZiHbUQj9g+cKwfYg4eyWOPqWspD2eSv8Vt
         5iOEs/yn8TMTk3RJ+BhgYITkIhrh/h9uP1R9yNPYKI8coURDSXSXRTYQH0kaC1G4lPUP
         Xpww==
X-Forwarded-Encrypted: i=1; AKwUvByyZVCYMK7+lN2UKYggbaSG1Trt56gGV734hWU5pyqBciaga+vY4bH6sFIOY7Q/6FGXBsC2Mlv1INWFMjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nLoC6GqqUcmGPEQ83RnUtQwF4NNC0AtThcV9AGdhhKPY4qsaet
	u01+TrHBx1HghIRNFTrOV6/k0SSwClxdTnxiTLgx0VD7dihdeH2YVZAoFkPI4LIH
X-Gm-Gg: AYBFou14Z3myD3c4z7/PZQ8Qc51e7sUQsc3a5Gp906HdBZU0e+SeNfo2Aew/h3oqj2A
	fwuXFfVlhYE/9d4cr88FcC9W/kOVfU9xY6w9K2CUbjtwulO7jfWel+YamuzzszDrUtmUpzvvgp1
	IfMDSGbW+8n31V1gw1F0Shwdap+qVfwhrG9GHmBIUNPALPv9VGdHDdR+8Zwmp0ocA8lu6bG/vwq
	beOkw8egV/itwFXUUjGOLn7Li70Q67DeHhPYxJi26HNUyWha3tdzBygMPSZ56I1YnpEbX8+ksp7
	RtDxJhY1O+lpM64AweodzCWVUROPx81WLdbMQrz23xWBOmtWjTQF8Zf2KPCliLW8eHTCAn/qMI4
	sEMolCx9C+LAFU2lo+xVnFEdKieMdER9osOR5uAYDLvIUdKNwyT5rSpbpqnF/VOjiVsiBFDbGug
	1UAdHc0IaH9DfX52eGmIV1NcviqC0yt8dojL2rHuq845w73a0eKDkJ90n1Bc8=
X-Received: by 2002:a05:6000:2f8a:b0:482:e64d:a1f7 with SMTP id ffacd0b85a97d-48488e0371cmr21537891f8f.11.1788448331284;
        Thu, 03 Sep 2026 08:12:11 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm14396587f8f.2.2026.09.03.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:12:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: Fix spelling mistake "dowload" -> "download"
Date: Thu,  3 Sep 2026 16:10:07 +0100
Message-ID: <20260903151007.14832-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 2f925d22b9aa..9552fadbc17b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3130,7 +3130,7 @@ mt76_connac_mcu_send_phy_ram_firmware(struct mt76_dev *dev,
 		err = mt76_connac_mcu_init_download(dev, addr, len, mode);
 		if (err) {
 			dev_err(dev->dev,
-				"The request to dowload PHY firmware failed.\n");
+				"The request to download PHY firmware failed.\n");
 			return err;
 		}
 
-- 
2.55.0

