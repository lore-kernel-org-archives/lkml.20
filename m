Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A655033C1AD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929366; cv=none; b=egaOTosr0sGXDBVPjBrb+CHEiRtZXvhwuFML2w/gfSWy2C2W2FktvJN0rgkW9f1cgEB7Otg8qGbhxS7Bb8OAv0v3c++5jrpPWU03xEOGCFytAXT+rlPj4vmUFD8T9iJ9YVAXQT0JSzdLkiIjIlmr7VafcMYrp82hU3G4ZvjK98I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929366; c=relaxed/simple;
	bh=3PzgDiqiy1oNIWRe2oB+sNV62Q+Jw0+EhuWagGqurb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nSTfxBeepP6nO3aaVnPG+DOqoCJ9EcDjGwacoqOQ1YhvLUNP4zvvEH1ln+BDGOgCnB0qI0Q8pEq+YNbCogIAhd+EOylrPV/EJB2E7wOUneW6Fibi1nv/r0vXBlYkZihJOHLorGkaFQZRhx7LI/Uz7nlnArowIMSuAi8BUwHMilE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DC9l9AWh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DC9l9AWh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1064089a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787929364; x=1788534164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NOOUEhwDmB12LFQNSiGGCOAzSpgGLKnq2vsZHwr0Wgg=;
        b=DC9l9AWh2tEERohee0xTeMTX1jaMWPyFSqqJrgyAi+O+9AomXM4stMgrZu9EpZ0CO8
         VTzj7daDu4fZlkKT9QaSHlMk1GV8SFKrWMGlom+Meh9c8LNZiLCwTO//We/bpQtRTuZg
         QbCS3SoGX53dVqjo9abU/wkJL6qIIWVfLLLu40tru+akgdd+HW74MBiMyR/5R3if9LCN
         FUJeJNrQdUsCpW6gKcx3NBnkAESilUo+L6w83OTj/KokRL4vq4iOJ3sRjlD+/UPeJgxw
         6O7h2gRCxZkAHjax096yG5UQFrO95Oh1PPhqfwIHJR6KJvDPZbvyYVCHZ9BN35vDI2XZ
         OkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929364; x=1788534164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOOUEhwDmB12LFQNSiGGCOAzSpgGLKnq2vsZHwr0Wgg=;
        b=TL0bWE+unB+PkuL8ZsUkLSieb4q7etPS0lEKbM+gn7+eGIrDgHvGMlyE56eAsQiUt+
         JiDIdgGITW49majGsxwxNsHerWZ/V+qCD3bKAIvUJUxCvSmdiGpg9i1Fj+3ql2Rc8Sb2
         yy7KKhF4YP9GI+6qo29EG4GxTfyDOwQJup2weYaXuAPb4pgfby/GPTovadFd87iAwruF
         bq1ixDYt04Io3RRUhdpt6nTZynBeJ+XOEfk04HuPI1YWYg6LNY+Fo9KGfv2dSgkcSmjy
         whNM51vkwrckHJ7LYu86IvPHyxU4aZc83ZZ8BOiZD8/bRGvALDI0jfzJMuurC9z4ZLw3
         0kdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxcKgDopPq3wARFOrFkrbvGnD4AKs3CioFd+g4ttmmddciNi/rm608S0j5r1Jxfp1EwcP/QHVj6KMH1b4=@vger.kernel.org
X-Gm-Message-State: AFuF++kb4l5xAxTyOLx0LxRySstWnAb5FIkfWsH2xAbUKlFOn09bgcdP
	dPwmlntIprreM1O80pl9i+9lI6DzdBbIlRPj3q6d9Y9km29FbBv2jPAMQcbHhEkmS5vKjg==
X-Gm-Gg: AR+sD12q3XISKOVJglm3Pd8wJsIgcrFFzi2l7ldModIi5jgFzF4xwCFEW3kLfUnxXnN
	Ox8UEszccg3PxavRAU6LxX3NpMGt3XGPlu2kb8aY5igGDmYknWAO4qU34u/JNpqz1kXlCSbf7gV
	YHIjwrrJD+uHa4vv2yT0hLLOb03njHZqTLgt4ANFMfFUpG37CtExrQsVU7pgPcBlyaqcIQITLGn
	phRywo6hCBxRCoHqrCmBaF0LJXF0l3Ci01MkqjkLuCWJ1CIzzuKrTbfM7ew0jYDs9daHT3rcc6r
	P7Kcyx/ucKe2UMQ9WbfqHjK05fPTSpbQSm/yliZKIUQaqR8Pl6gQJF91gYmTzW6sZ/5hDKiTk++
	HF1OO1ngy8NXNigaDBDwg4PPML07/FegZcat3XkGriYHpVYJmNseoaHRFRtTOK0I6F6I3wIsFwN
	4/XCJC4q3RF8FXnRzBhDMzxSCoEk3ZLOiA6Gu72TnovX17SukU8ogilHMaXx/RLzkPfLAGlYRvh
	+2jiAqFug==
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr17557004a91.4.1787929360339;
        Fri, 28 Aug 2026 08:02:40 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396db196903sm2911068a91.0.2026.08.28.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:02:39 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7915: validate default EEPROM firmware size
Date: Fri, 28 Aug 2026 15:02:22 +0000
Message-ID: <20260828150227.1062217-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt7915_eeprom_load_default() checks that the default EEPROM firmware was
loaded, but not how big it is. It then copies mt7915_eeprom_size() bytes
out of it, which is 3584 on MT7915 and 4096 on MT7916.

If the file is smaller than that, the copy reads past the end of the
firmware buffer. The extra bytes are whatever happens to follow it in
memory, and they end up in the EEPROM buffer that is later used for band
configuration, chainmask and TX power.

Check the size before copying, the same way
mt7996_eeprom_check_or_use_default() already does.

Fixes: bbc1d4154ec1 ("mt76: mt7915: add default calibrated data support")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Based on next-20260828; applies cleanly to v7.2.

 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index fe7b29ebc0bf..145d14a1012d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -111,6 +111,12 @@ mt7915_eeprom_load_default(struct mt7915_dev *dev)
 		goto out;
 	}
 
+	if (fw->size < mt7915_eeprom_size(dev)) {
+		dev_err(dev->mt76.dev, "Invalid default bin size\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
 	memcpy(eeprom, fw->data, mt7915_eeprom_size(dev));
 	dev->flash_mode = true;
 
-- 
2.47.3

