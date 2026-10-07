Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897AD380FD8
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401625; cv=none; b=Ldb3hc+HrCqTA4y8OaUshXdkWsTOd3r3tENrWizFE2TeFWqh9dqeBas2+3mICbLATwO4kWKQiAvUe18TcyK8gOp9/AVeK2HqnLEMJ3e7byIlhdsrvInc0+OsjT316aDTShe/cKrqrTtKm3CJA+Fq5PES5mjreeYFVH/+9xarsEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401625; c=relaxed/simple;
	bh=zvG0AcLHm3S6xLDDAlwG5qp12elfTSdVRrVLvyddeZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptyssukaGOWCn2zeZDFC42P0r/gwiIinRPEwdjA2qJskPM1GJx0bRUNpU+tjUgAq/TDnJj6Ro/Mh/a2aUnaLu9sh0i9v0P0qP0GTPfDGQQ06OlotzEY8dHWHvFjpdaaVWHxobWFzhDscP3rrFeUf9/EW3lGONr4f56n96oejvio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRQ2o7PM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRQ2o7PM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so44515455e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791401622; x=1792006422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtWe9hd0RKevyGWq3yzE4CGMfhYNg0L6UN+xscZ5jJc=;
        b=pRQ2o7PMNDwfXd/Oqt4X4AJWOezA30hupSSavox9Bx/bGYLYljKj4rA37/G7z4iNZd
         qlcsMZkKEjt4VA71zEvPz+JVKe5xtNoiCBUVF5l/rfsmQL9SJwOn/KvwfYjY9ElHBqG5
         dvjK10SK6q0ks/XecgdmQfN2/JeXdx9V+PmFhTYzw/dBztO+917nN4wtEN7a/RdyXS1j
         AhmNFzOcYLFln+VYN2qeXxvngwh8dZTCxsGTFnfa6MjhO3Hml5Pf9lzgeFO0sCkcpbHu
         9zSLp8EhK2ION6WnrPFaxO/wdmoNQ5xZiA7VgSj13Tz1/2G7IU5gmlNVFu6+wq9lRqk6
         tdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791401622; x=1792006422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtWe9hd0RKevyGWq3yzE4CGMfhYNg0L6UN+xscZ5jJc=;
        b=sHfaChJn1wFs4D1bFOpjgCQqnBM30brZ4T55dqPyONMGiUiNqhkcqpxvCTDyZWkkG/
         QNCtuOp7xzQfTPPa95lytHpLJxHsAACw0SWNznIJUOQXdeY1eei3iRerfEKQrAx0JXMr
         FJ6bV1DI9L7Zm1iVHNYmr3OCrFvptf0j7yJRs+twbEkoX3HBQDWY2G+s8ShQ1sHSctRd
         j0zBSA0dxQ4tb0Ob7aWm3gdV07ie4hcEKIMOVM1qaS//4H3ZXwhuphc7kBVBj/Aj2i9x
         iMfU5Ybb8IJckGqmmTAHDelKAHH8sSNuYd6sqPNudDTymTGeEgbfIkgKMZ12ZlTMtL99
         s3MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJEE8jOm6EJkc1Xo1ocEYYwZtflEcSW3a07Du2w+F0xLLL1Gj+156XoDgq6dJUlqvzQJfw6L3Tw/Nh8tU=@vger.kernel.org
X-Gm-Message-State: AFuF++kEXG3P27gwZyCSV6JnU8QD344ysDAsYbp4LdwWwlz1SWk0qKDC
	PhU+doh3J927EpEngk+0BaY8bglZ5ZEjDEyL/M+bHLNYIf5vnJcq56y3
X-Gm-Gg: AYBFou3kjthXoi+Oitu0fPvI4Xavw+BXnlilBG9w/KNyZZm9W15bwD6kASm/TUi8wxx
	pXAUJoFkXDymFEjUrmnCZrDOk71B+hdM6bFOj3Rj4/2CsDKYTM7Kl93luotrvwl6+klCQmUmDH+
	PzCIZpkoml7481i+P6yb5w5aOpYsB6J8Xsqj0NAV8aV/1q3jwF+hV5OgPLtxbAcR6ps4ZbXbIES
	FZhUh6nMyY9WJPd1PJx87hG70wdsNtLC2bx2SnQMCwDIqPTOwIE2qFQBypnzzNVuqmDdljq83oD
	kPBQ259OEcREJobs/LV0dsKQxgwIy/utHWo3ru3JSXYmYuMe576AhajsbIeSXthxPqgrf3QH21G
	KUZmW5m8et2i4Ki1vreq9aVVHBo5DMEhsC5Lw51CdAfQ4ppwBIfAfXJ7Mm8C0QXU0xBd5HSVqoq
	6ME2OUgl5NcT3eisB1YGMgpMbNxYZrt1os9LE7eP/NbLZAkbxmqLtLdEpGnmdcY5IWujT1U2VB5
	da1SP0XUZOBuAD/VSic
X-Received: by 2002:a05:600c:154c:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a18043c080mr60892295e9.23.1791401621545;
        Wed, 07 Oct 2026 12:33:41 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.178])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843b5a2esm12427595e9.11.2026.10.07.12.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:33:41 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleg Keri <okerixx@gmail.com>
Subject: [PATCH] soundwire: qcom: wait for the interrupt thread before gating the clock
Date: Wed,  7 Oct 2026 21:33:32 +0200
Message-ID: <20261007193332.5270-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A broadcast write returns as soon as the interrupt thread signals
SPECIAL_CMD_ID_FINISHED, while the thread still has to clear and re-read
the interrupt status. swrm_runtime_suspend() gates hclk right after the
ClockStopNow broadcast, so those accesses race against the clock being
removed; on x1e80100 and glymur hclk is the SoundWire clock itself. The
next clock-stop exit then fails at random: bus clash, parity errors
reported by the peripherals or AUTO_ENUM_FAILED, each leaving one side of
the speakers detached until reboot.

Wait for the interrupt thread to finish before gating the clock.

Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/soundwire/qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6e0c5fb10efa..76f940f4eb31 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1887,6 +1887,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 		}
 	}
 
+	synchronize_irq(ctrl->irq);
 	clk_disable_unprepare(ctrl->hclk);
 
 	usleep_range(300, 305);
-- 
2.55.0

