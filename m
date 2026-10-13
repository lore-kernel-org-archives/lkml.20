Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED452F29B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915273; cv=none; b=RTeyJllor56O7rGUVxS8gQFiiuU589FDaq4HlNu+nTprZBjYP6BFnFAa8Tle3JmC9ouJ8p7uSIgsZuzasdAaQseMsTl73FXDrpLSoz+fwTOhUSquFtt/Yh+N+yJERa7lpFro1dRo5TsxvRX6BPvR89ZwSmoJigmdTDeKKm/w9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915273; c=relaxed/simple;
	bh=VkS8/eN1CMkj+9VO0vpEM66MQdnGxIRtGFS8LIZEl80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L0PwYgO3stsAu2JqcjzoUfkWKEjWTvlmMG7Edi5caP83N4Bz6ro61F0XvXpzETrLnkP7/kKmq9CiYZTKf/U2rvlRckuP392I7ctzafQ8e2kIZsQzeWLCNZ9EJPRG6tp/ouVtcjFZl354hGqBRo6vzE2/ikonUPoaquNOqtz5B+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZameJJu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZameJJu"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so20321245e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915270; x=1792520070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pycBEIgejzDg3p5izsdhMn99CZxMwrY/YZ6UKG/0lpg=;
        b=GZameJJuyMht74Om9e7bAMLJ4a0PSqQvIDUFK6Jm24DnorqJMwTzACYIqEqy4rqs52
         JAZeVp5WUtEjAz+0F9sA6oX9vdZNHkUoB19x8PIkl0HgbJBTZ7eBeAyAGkQJYPW8Oo5M
         JDqgWPrJ2CG7v23E2JwqH4JARlOyYjRKwbwUpJ1lx5cyoMtC+/YHh/r3WsCGFeP9aH1e
         tphZJDGnByLc8cOUXLbVYlayAl2cV+X4tNGX/KeEbyLg4oRdRh5unwkLACvQKh7ZKcax
         axmEmbGnJI2ezfvSeP8SAu7xIYaLeLNud1b+tYiGhhKEQplR7lX9TkroquV4GjffYigW
         MNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915270; x=1792520070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pycBEIgejzDg3p5izsdhMn99CZxMwrY/YZ6UKG/0lpg=;
        b=E0+bzO1vHF6Q+kLtrDIpvai0jGIjXSkAJ7ZzQ25y1TeYI4bZYK5q2jvFgrBNdmCGCe
         fnkCG8WzabF9DRwQlrIYAg4n4mUD/u5CTc2AgC+vjH+xzejDclvktE0sF7KCs7ckRYrU
         wgDmunqRIRiyqqpjt7yG/h/9knR6XLQbT70drghBQMtCsq2sfT5rotNLAA012XJ+QWEi
         A8aMCsiwRRKKtjfplQasv+5TWM36xyvKkJ+Kj/a/KmR4COar6azPy3KfjMu+Ak/f9BZz
         u/cSLi8RshFvj7tmQir5+3ankUrfSuXArMx45Aoz7iiq36W4Xs1m1YIDyoqN7qgdoCkB
         64fQ==
X-Gm-Message-State: AFq9FYK/hyCRsXE+1PI0B2X42efP8LHJR8yD5XicuE3FTu/wh61qhs3V
	RIhpJe+LgPZNRPk/+Cil2zviXA2mSqVwOk2+QsUatIyH4sS7c+0r7Ysu
X-Gm-Gg: AYBFou04IG1qpwisswoPze+R3fTRchLs3+4tcn33KbqkALXUMluhXWivh/bZoy4Zncs
	tvA8syvAnq46rnHMd0uZWVon22Ghs62tjFe3GNVbFdzs74tF5YljIqiei8AkTzXGqyMQTdSMobE
	IUo7a65X6N074jkk+vV1XGtZnFVDCdAvUSwxpsWhE4WKGjgFHcUlm0kcEdb51NdzCgy56ZI4hfE
	3kHaS2crbUJClTFSa6TeTFEejUz9XaEwB84bxe2kfL1gmdjREjENihCUyxFHdHtWSEW5UxhCcKB
	VbDDy7u0/PpDDquoGS0ICELAVQs3OlctKFTfjW//JCkL98E7XQbSJqUsc+gJnZ5/68yD9KzurzF
	osZ1h/K2Z8ICTP9yD9FmX4bOGVMbHvdWh8j7EC1o6JaGdq5aDO+LAfF0VDrTQ/R0Reltm8I+7aR
	1NAnCCQi23j/z8YXxY9HANZEEsXAXstkdQVHX6if6+OJvBJALFR202KTTi3FmpWb/Efo2yAEjXM
	CFFbNvAh02Gd4CZxL4=
X-Received: by 2002:a05:600c:34c4:b0:4a1:b027:99dc with SMTP id 5b1f17b1804b1-4a1b027a161mr36768025e9.18.1791915270126;
        Tue, 13 Oct 2026 11:14:30 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm383933345e9.4.2026.10.13.11.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:14:29 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Milo Kim <milo.kim@ti.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] lp872x: remove platform_data based probing and adjustments
Date: Tue, 13 Oct 2026 21:14:10 +0300
Message-ID: <20261013181417.492252-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upgrade schema. Consolidate driver file, remove platform_data based
probing and add missing regulator/chip supplies.

---
Changes in v2:
- dt changes applied to new schema
- read dvs vsel and state into local values first
- use dev_err_probe in lp872x_init_dvs()
- rely on ti,general-config and remove ti,update-config prop
---

Svyatoslav Ryhel (7):
  regulator: dt-bindings: ti,lp872x: Deprecate ti,dvs-gpio and
    ti,update-config
  regulator: dt-bindings: ti,lp872x: Document input supplies
  regulator: lp872x: Fold driver header into driver file
  regulator: lp872x: Remove redundant regmap wrappers
  regulator: lp872x: Remove platform_data based probing
  regulator: lp872x: Add support for input and regulator power supplies
  regulator: lp872x: Use macro to fill regulator descriptor

 .../bindings/regulator/ti,lp872x.yaml         |  18 +
 drivers/regulator/lp872x.c                    | 672 ++++++------------
 include/linux/regulator/lp872x.h              |  86 ---
 3 files changed, 229 insertions(+), 547 deletions(-)
 delete mode 100644 include/linux/regulator/lp872x.h

-- 
2.53.0

