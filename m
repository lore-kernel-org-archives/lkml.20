Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290AA48E0E9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726467; cv=none; b=fQj/bJTZxl4UiL2QMaPG3sUD42fp9os7DDcvUrjAh/ldz4JjLywpwaPNkhWrMYxIo4kGHatKoQ2Uu7fZiDzGIJMI58vFGYvh4+yfi5MoOypq2DMTFE8WdHoM+mbPYjjRuHB1tv4AV2BZmAYPik/VrTPzqWlGwHzV568Toxbh4F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726467; c=relaxed/simple;
	bh=s4NszV1LAjsfPGh2AYlQJm8DMiRBqi3Wr7v2mRKxub0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SwK7S0mMBRXNOjAwMd6d7vbJN+fuGfaschYdSXLwg9ir5a0V3xg3iHqEQx74TULm1Vs/MIAzSDqi6vq7IoMy+6p5n/KDvsirdYVKows0czVuk5pAUuZHCHtVfUOQWmyl1q2mhpGmiOJ7EcO0hDw2QBQe67pJ0hvxGyeTnGuPs2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wn/UYE70; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wn/UYE70"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so306857a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789726465; x=1790331265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcJ7z7pjuPgGZIi0pC2sSQMK73f03/U0vs3UawuRDsQ=;
        b=Wn/UYE70WGMC4XpRoc7ZZplGpk0P5bHPkmfS8gdtwZHXqIE/LNfzMkWerVa9WgZd9i
         jvpY3orYt/jA64AcpieOJe2Pv05uS0ZpZT9eAaOjh2MPQVuoXNR8tzTHNTHVVXh8XS/K
         0ZL0js29F+JiXmevjXhSbNOrvn4MB2+Uh63tLcMfXxEiHeyC29svRHKoH2Y6I3OvpvlZ
         pF4boTi8nS7aR3mk6Ohp3TmlIdFfQbulgxIxObHt5coCU5MM2j/rUIl8jAJ5ivflh5RT
         TuoJ/XU92AY9XSNsPisyJQtgAHrXNMSzzodJV6+shcJMUtK+P1MPY6CYwAeUKk6fB4M6
         6tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726465; x=1790331265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcJ7z7pjuPgGZIi0pC2sSQMK73f03/U0vs3UawuRDsQ=;
        b=FQxjz4vrMsqXLV+q8bkRYegRDarDoxWQ3kHLnW6KlDPNeB9zbjA42ibmY8jVHhklSe
         LIJexXQ9g4POzotFhVM7/ffOFBAgG0aAophcFJiaSaKJaDki+4fIIWGJDoDS5hgzgCbv
         pw7IidHOSLI1ScZXBbPPf6/gBogm28tSAJ4SkOqgY4Uxk/Pl6qyxlONjkj2YFtnjqkcQ
         UxFNBSPv4i9Sl9BnGxr/Jg2iPs+BGu7pltDuahb/I++BucAcXNmMAwNzOWpFFedxye01
         uPWigER2aTsM/ekaabevKttsMTf7l7ssiJwtnsxGhpicnjS/ZibDYJCkKfw/eqleqrWM
         32nQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0HU72hq4X220fCPEx4PUlYZxWDIcuL6+O7bx30qW2DRqTxyXnX6Ve+6m0bNvTTCZcYtf5N68PhNQMafA=@vger.kernel.org
X-Gm-Message-State: AFuF++mzY/vWfFbHivIWTzUB8RJhDOw7/PY1Msg1N67FtrVoVk/bu8a5
	zJ4ZeOCsFTN6PHPtdA6vDXrulhAEU3oQbUwRX4x1eBB/uHRnvPjiNPjq
X-Gm-Gg: AYBFou0FYlemEL6Mqbz6CP6RX0Mm3w5TiV4az1WEH9gHQ1JRZSm4QFJmlQSQxmo14u1
	KXPliRN8YPs3r4cuTw4MojXiAHqPrXXjfqGi9ab+ENUm3dtcfi4tnbZvyEFt+QWAgf67gOQZgqO
	DmNUwUaQarJCB8Oiikhn90to8pevfBnVc157nAM8C2xyxT4hdtQ7fKag3TFSTRFj9RG0tNevip+
	ejH9UOlAF+16+sbOw5AwnwWRm+5wVbllmF1lb8gEuk8ybyJKpoYOMugVlrBKfyfZkQlc4dfyku4
	y/f1uF3rAxSdyDvNs75fHcb041OVRvUCNPnZks/UP++CuS3JjGSjWB9//vLSux43b2tlRObX2BZ
	8qkECNRAKQbheFx0iE4ji76kapWOEQ4MZ8ZYX1SNT+6VQ6xt5S6EFK80P4WvidyaFwDENUsbf4l
	gUF25YdfEcjn6sro1R28yoR7ZY8QqYp2mV8iMmRMfDZbY1A9S1p7O6nKHZu+d3ODqcAPfloYN6L
	zLIZjsKvxyM/oeXNJgWsSrR7Rhf
X-Received: by 2002:a05:6a21:6e4c:b0:3dd:85aa:4528 with SMTP id adf61e73a8af0-3dd8c501970mr4608478637.35.1789726465018;
        Fri, 18 Sep 2026 03:14:25 -0700 (PDT)
Received: from drobotics-thinkpad-t14p-gen-1.. ([117.133.183.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e7433sm720513a12.28.2026.09.18.03.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:14:24 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH] dmaengine: dw-axi-dmac: demote apb_regs warning to debug
Date: Fri, 18 Sep 2026 18:14:14 +0800
Message-Id: <20260918101414.4104604-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dw_axi_dma_set_hw_channel() logs "apb_regs not initialized" at err
level when apb_regs is absent. However, only Intel KeemBay
("intel,kmb-axi-dma") carries apb_regs; all other supported SoCs
(snps,axi-dma-1.01a, sophgo,cv1800b, starfive,jh7110/jh8100) operate
without it. For those, reaching this path during slave/cyclic prep and
terminate is the normal no-op case, not an error, and the err log spams
dmesg on every transfer.

Demote it to dev_dbg to match the identical check in
dw_axi_dma_set_byte_halfword().

Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index bcefaff03b5c..d829b9af5491 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -574,7 +574,7 @@ static void dw_axi_dma_set_hw_channel(struct axi_dma_chan *chan, bool set)
 	unsigned long reg_value, val;
 
 	if (!chip->apb_regs) {
-		dev_err(chip->dev, "apb_regs not initialized\n");
+		dev_dbg(chip->dev, "apb_regs not initialized\n");
 		return;
 	}
 
-- 
2.34.1

