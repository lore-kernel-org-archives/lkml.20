Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CDA30C147
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861438; cv=none; b=jbJCAUHuGNk2OfJQDRp0k3aeSl4eRFdftZWK5/fYIFG+eV0Qnfo2z7/tTsZSa5Jv+3j3osWHwi9Ch7cX+78/wOM1SJD1HABhDtdpV96ZQwW5gcUFQxEku9sgtauVHn2uf0Us+1QCMndoWdCXVEeE7XfbSIxANVHKUQ32HeVrKOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861438; c=relaxed/simple;
	bh=LZvJdoqMiLFE1kDgHxNdu2ZkOJ6v87aLJyP7tgfMseo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IXsc7bZ0aGxi5oQYlOmavId43YT0LNTkYACSSuE8Xn0R8AQKQ8yDV180/WyukfC8EKD4Fg4v99e7bW+HwdWZduq9AC6sILrQsv/6ECyX0/jQWlD7aW2vLXR8Ob8y4JSwPbi7l7qo6lSAveleJGFqgwS+j9115NXi2YkvBVBbKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=udp5xLZ5; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="udp5xLZ5"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so232541f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790861432; x=1791466232; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qVy4e5OGZI4MlIMiZQzW05oIlOjQRJp2AkRb/z+b38k=;
        b=udp5xLZ5idx/RlGmp0Kq+91EjxG8f8uSpqp8BJM5/bPxl6g1Y8DMhOMCXnG2jU4VJO
         nIAiP1+mD5eMGx7Q6hbjONA+7RcyePNx5M5Js8kQmREXRiek0wC8gAmx2WGFQwWPuTAh
         al7ZSlA9w35Zrt8lTbY2AjbeMq+jo0ZDkqWZwF/mjswq9voA6+GVw9rSdA88P0fOqp4r
         ShEbAw/XeafaOENRAYlOjwptX0PYYqErQ/iv+z7riGzmLl8XYBGZ/MoA91TUN3cFMMnE
         fWavtvgEtuqookb5EXYiPkpoIq1G6TTpdirLCKbt17xTT/DbyIUWXoPraW/8ulGjjhBX
         odBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861432; x=1791466232;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qVy4e5OGZI4MlIMiZQzW05oIlOjQRJp2AkRb/z+b38k=;
        b=gcnf2/EsCC73CPY55m/r9JcdI7weilVNi44CfxooXWAmGY19DEG+Cbh3O0+AXIJuy7
         5yJcsgkhDyeD3OAQD47bF4IkD5B8UyID6GxEeEkPi/nuLpQ2qgjlPzLoSqfCZkDwLHfy
         Yh9LR4yy+FonbVcL9YroYPL0fu/3SXq2QC9HDzvdatqEr0i6lT0Szxr4NSOHuxDlcLQy
         bMM3GoIDEEAwaFCvTvA2mlk25TGdppqi2otoa7nuN5xg5fkJzrpNxbc996y4ipts60zt
         j2Brg/f1DoPY7s87qDSIU+7T3VGqCrbnWkPYERve1Vi+OQEKjTfqwDN+i0u+jDHmiMRs
         FiwQ==
X-Forwarded-Encrypted: i=1; AKwUvByhFJJUTXadT809GHuyIsKFV8/SzxSlpfKQPGN2tR/hqENKr22b54Ri737PzghhXf4Xvx9vo0xswfth/gE=@vger.kernel.org
X-Gm-Message-State: AFuF++llZvCQS8xvX7S3QQxYXFy6DRF5EcilCKxC4/Fs8WaL807gTfDi
	slQq2ictfc1kvuTwuG9EITpXfoNJnYqxXfrXNQKzvVTcjVYcgJCmEVEh3CtfhoPRz8Cwx4CEB7U
	csTuxELBWqA==
X-Gm-Gg: AYBFou3AMiRu3IrQWo2DgQrb2bkwgamv44NmEj440ftOQJ0ZKoeolli1U99ZK9kE3jX
	uPmt8ulff5qWvaHYmnZ5WoHaEbRs2xptpjFbtBetEYZ4dyjn9y71+4j/orWrWoWKC8SEfGHlfOJ
	NSI+4PozxPPua/ShQ8fHulTJRZ53+3RQrlJFpiT6PnBMcSvImEiWCp02LuIT397m+tnC65c9a43
	QJ1g/UTVQuWr56NBnf4hWoBRoeKs01F5E7boNKEkZelATn2tWgJrCKMCEZGYlfRWx0mchMNPswY
	hKcIEoEmwOaZ3i2tIqW0WUkBJIiQTitWu4x+hKmIXd/lm06KRAdhtjiiGck1aIGMjEUN3R6udGE
	SujOxOlcwEn5pW+311DPO+F3pPXttWY78cjh3MmMhPtZJGx8Hv9jEWf+1x4Ag3iU2qi+AU5LLou
	KSKB8hwwVnLYNYiC3abgNSjnov+K5aYcIwv2X9JZv4O8dtAnZqxhZnV0imCaNerwwk1Ge331q6x
	+F0NrXG+MCIKlk4
X-Received: by 2002:a05:600c:46d0:b0:4a0:1a18:b742 with SMTP id 5b1f17b1804b1-4a01ad909e9mr83128855e9.2.1790861432366;
        Thu, 01 Oct 2026 06:30:32 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0267ab7efsm1603395e9.2.2026.10.01.06.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:30:31 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 01 Oct 2026 17:30:23 +0400
Subject: [PATCH] mfd: bq257xx: Mark self-modifying BQ25792 registers
 volatile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bq25792-volatile-v1-1-cb3d4ec8a414@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1g5MUqZqryIuNEaNiD8zKgXx7
 p22y2/x3gVBvEqAV3KBl1ODLnMEpgnwUM+9GG2jgSw90Vo0zUYuK8icy1TvOomhll3+cJgxMsR
 s9dLp+7csq7/D0YzC+/cD9/0BwFAEBXQAAAA=
X-Change-ID: 20261001-bq25792-volatile-2dc583517c1c
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=alchark@flipper.net;
 h=from:subject:message-id; bh=LZvJdoqMiLFE1kDgHxNdu2ZkOJ6v87aLJyP7tgfMseo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtSyidG+MSuFVlk8ieF78spmwt3XHkQPAmS/0DSl9kI
 qWPnM6q75jIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqe9oZ/tnvSH0YLuSVvK1mllLKjcwi/kN/GZ/M32yvFzfp6crtxZKMDEvOf9O
 86KsXnPZwIcv5BLObHeuuTrOI1Duw5OO/aaHTDJgA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Some BQ25792 configuration registers change without being written: input
source detection sets VINDPM and IINDPM at plug-in, plug-in also clears
EN_HIZ, the FORCE_* bits clear once their operation starts or completes,
EN_ACDRV1/2 follow input path changes, and ADC_EN clears after a one-shot
conversion. Reading them from the cache returns stale values.

Mark these registers volatile, keeping the cache for the rest.

Cc: stable@vger.kernel.org
Fixes: 9adbe53e32cd ("mfd: bq257xx: Add BQ25792 support")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/mfd/bq257xx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mfd/bq257xx.c b/drivers/mfd/bq257xx.c
index 054342c60b73..01f5fc97f538 100644
--- a/drivers/mfd/bq257xx.c
+++ b/drivers/mfd/bq257xx.c
@@ -52,8 +52,18 @@ static const struct regmap_access_table bq25792_writeable_regs = {
 };
 
 static const struct regmap_range bq25792_volatile_reg_ranges[] = {
+	regmap_reg_range(BQ25792_REG05_INPUT_VOLTAGE_LIMIT,
+			 BQ25792_REG06_INPUT_CURRENT_LIMIT + 1),
+	regmap_reg_range(BQ25792_REG0F_CHARGER_CONTROL_0,
+			 BQ25792_REG0F_CHARGER_CONTROL_0),
+	regmap_reg_range(BQ25792_REG11_CHARGER_CONTROL_2,
+			 BQ25792_REG11_CHARGER_CONTROL_2),
+	regmap_reg_range(BQ25792_REG13_CHARGER_CONTROL_4,
+			 BQ25792_REG13_CHARGER_CONTROL_4),
 	regmap_reg_range(BQ25792_REG19_ICO_CURRENT_LIMIT,
 			 BQ25792_REG27_FAULT_FLAG_1),
+	regmap_reg_range(BQ25792_REG2E_ADC_CONTROL,
+			 BQ25792_REG2E_ADC_CONTROL),
 	regmap_reg_range(BQ25792_REG31_IBUS_ADC,
 			 BQ25792_REG47_DPDM_DRIVER),
 };

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20261001-bq25792-volatile-2dc583517c1c

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

