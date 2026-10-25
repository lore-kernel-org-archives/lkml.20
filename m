Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956346;
	b=w993jk/AyZPKr32rolXmbuf1EQliwtqAmZNiT+MUSEC+MvFA8os4UNrrvLJ4SAXaWabt
	 WNfHvMm2AFK7/gaCbl1OYnyjH7VY7IahzwvKN9u8b813nFn7/oNbpPghO2d/YVKB1r0U9
	 yn3q/uJOOYIYAEWIlZIiP+ESY68nL7HFdXDWCxeqr8TRqctvDEBDzxOjlGDyfdDCEkW8q
	 gMOF8vM2vZL+U+BP4+GhAyKg0vg/UsCxi5jwp2A4tUMiN7T9jGIqxHUi3L4qEO8m0iY8i
	 ZUMbkq0Na87lCLs5LiN1G1JgzZcewK7XNhWijSqTldEw2LsHNnHFG92WSoPBhwnadCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956346;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=tMIdGuJDwAKs8ZFuLbWZtd9JIH4P5DnDZKcfdjqJhl0=;
	b=FkaPXUVugBTp3FEBGNZp+zy9j/+zip9KcxoGo6yuY6ASNYVcmDtWPbR5FuMw7iNb91HF
	 TdNA0GVRqC2RznVPxdqPfvNOXaceb4cWTReKvQcpuxZ9kUCdh8T6m+2RPTBy+Y6ORImuR
	 V/ygvvMNY4n2nkB1TfwhcFDGl+8Du6UEFiyraa78jBDZjLPp99tOVariF9nbX3bGx5rId
	 XTrDz3tqDVX6tUiax1jLctfmKFhUjRIKAEnQ4Sqg3dJ3pn56BVK9jdd6el8bg4BmQx1h/
	 SrKkdljVXb0E0km1y/bDejIBdfoTu+n+MDT2GvAxDEqWLHIqsLoQPHGUdH/XxGZJbHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=pUe3IBEY;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7E8606B881;
	Sun, 25 Oct 2026 19:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7E8606B881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=pUe3IBEY
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8Et519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:36 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8Et519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956337;
	bh=tMIdGuJDwAKs8ZFuLbWZtd9JIH4P5DnDZKcfdjqJhl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pUe3IBEYaZRg0V1Y+ivAEjQ9AF0Shr8Xp9/8tFVLHbiVw45vpFu5HKFtI9hcD11cj
	 ZoySrg4K8EbKZ5oOn17mVGXwVGdZfGjlKhR+RLzqm7fA1t0L9UnVwyiG98fu+bpIFP
	 pCOLz9jBxy85HBvsc6lWxfNANBTkOeWmOxb9HytU=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 11/11] media: amlogic: vdec: give the regmaps their own names
Date: Sun, 25 Oct 2026 20:25:07 +0100
Message-ID: <20261025192507.210058-12-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
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
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -14.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The DOS and DMC regmaps are both registered on the decoder device
without a name, so debugfs refuses the second one:

  debugfs: 'fe320000.video-codec' already exists in 'regmap'

Name them after the register blocks they cover.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/media/platform/amlogic/vdec/aml_vdec_hw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
index 935018ea96c6..50b867755771 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
@@ -555,6 +555,7 @@ struct aml_vdec_hw *vdec_get_hw(void *priv)
 }
 
 static const struct regmap_config dos_regmap_conf = {
+	.name = "dos",
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
@@ -562,6 +563,7 @@ static const struct regmap_config dos_regmap_conf = {
 };
 
 static const struct regmap_config dmc_regmap_conf = {
+	.name = "dmc",
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-- 
2.56.0

