Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E5F42669C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232932; cv=none; b=kmyzW3holWaG8L++Qf7EHutufx3uplYiEthqujKnpE3OcDhDmngB1HtzfN9pelijzNeN2NZLDotyk4Hfr0I0M3nQoZC3Klwy/yRYcMe19zOOsBzVkB/fCPbwlmR4Cx7ltAhCCW+zq7xYF+mEJZNVFVI7aTeFgg80A1fu7zVl40o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232932; c=relaxed/simple;
	bh=ni7djPGe551WBpsNjE4sIwjwAp2hHFtV/81edr309D4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqBBi942CcRS7N3SNkqemnP7et5cskVrQlhu/iJRlUoMUxd6hZivh3lGHgOm3VmZv/bkyHA/DTv8BqYpR9WeGeNfB20RvG2agRe6920DxL8qcDWli9NYIp0DvnAzz38Le2GJvu+tc2v0Cl7nylmlWQIv/uB0umx2LJClw7WYDjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BguYgDUC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BguYgDUC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so9928395e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232918; x=1790837718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j67H3MkII5VwRyrYUKsJD5OK0/J8mlXhxptg84+Njcc=;
        b=BguYgDUCbqI/cT7L5gArRygY87z5RES5QHM/eEq9954u9XL20kr6KFU+wA3I2ko6oO
         dwXcQrmbJ1ayF+E3xFgFJ4/moWQ7fWum8cELWLru4R3q4yAOfGL0s8yVRABlcwAtVppF
         JSCqvHo2DvpR5ir8yRAB6UJSbGifSG71+VJBiU/SO9MX4JgwApdt8KNksq9rqcKNPLYe
         bEjWQiopVboLHr1T1q1t/UYWEqYzG2/h7hYQD4AjL6WFneFsVpDwAYx7dPHAD3gA0+cB
         ekLmm1ySZMoxya9+5YotoXKU3sxqqh35yQNKCPTjaRZmSDtEhpT4fa4sNPaxvgLiFUdf
         mRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232918; x=1790837718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j67H3MkII5VwRyrYUKsJD5OK0/J8mlXhxptg84+Njcc=;
        b=alQMUnEw7kL+PrSsfHzRXc3rGqWEGiuDZwPGhlCPkrMg735nQjmbbaZhG0mbzr0Kyo
         cNatTM+4nMIrQVJgPVGlNPDETo941KqbvkDQzeoh07XXL6kFfZBtaWZlpCTEZFZvR5yQ
         llSzuUNYKMBwa9idzHsR73HyJ7kGSzkr0psA0QLRc5ZSS+v3PmYbKhLdSjH8RiNdXF8a
         poQe2MSpeMJGedRV+/Lh1t1dVu2NYgBHVUsUVWTxudHD46KY74lXOSbIOaaeZMbPBrOV
         VsR84oCVe49ZzR8E2cFxyVhHwl8/QlndIbYdzgY3QLKJhx8FmibcvnmdEXaYMHMFuDlA
         Svkw==
X-Forwarded-Encrypted: i=1; AKwUvByCxusCFmK/TYpnOD148/5xqjTGZkU5CkNWO8vBcQQp6az2Z3w3YOobWzLU6wa9h7hx3yVVitgp7dTm9r0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXAtPPgd64dOiScRKMEUecJLvoyIu7csAJld3RlKnvlUFX9EVm
	Mg4VCHkHRboLdMrywF4GyuY6a3PpVSrsR510bCOSGbdwZ+je2C6Kbr29
X-Gm-Gg: AYBFou22IhYi2ol+IHLFcnrlb3vUYJpYKUpaOKMYvVW/qLVI0djmwB9OY6XCGL4T0J8
	AQVKna6X9e7l0+z5YM0qyAprH9llDrDW85uV9zCFSblVgXiEYljDDGPzPTMLIJ9lmzTl1FK72UA
	gbKudeVxpVjog3+DuBLrXtM+0PcFZEonPqxM6Ih3AAiZDxAAXRIQ6htXw0Lymo7gYnqwuR52SLj
	2tMyVV/6H2LtuSbAMtFp7eamSJq3zHmkSK2gZLEiduP2mUIlGiIF8FdXiRbTG1SuPnBBaLb9SDp
	9pEK0tGKQftHz54j7XI4zvKV9tGfxql2yu2nhmYQWH7yoIKNTJfHdxakP75BQGz3EOWavbNfsVS
	bPKOphFLnCosN/Q7DVy1g3GRXBSnU4H0Jdg7gTtmkAeycILMl3yAw2rDnF7+v69C+tNsYpd01R5
	AZtQL4hSoi5g5jD2QIkBt6u6UEKGAhh8mxM39X0cWSoS6V5Kx9fyaGX9v7A7W9VVwquEOdpcCH1
	kZZ
X-Received: by 2002:a05:600c:8b71:b0:49f:e2fe:c362 with SMTP id 5b1f17b1804b1-49fe6707e26mr18932215e9.33.1790232917539;
        Wed, 23 Sep 2026 23:55:17 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae43dsm43552095e9.5.2026.09.23.23.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:55:15 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	kernel test robot <lkp@intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: include linux/errno.h in consumer.h for ENOTSUPP
Date: Thu, 24 Sep 2026 08:55:14 +0200
Message-ID: <20260924065514.3678640-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The CONFIG_PINCTRL=n stubs of pinctrl_gpio_get_config() and
pinctrl_gpio_set_config() return -ENOTSUPP, but the header only pulls in
linux/err.h, which provides asm/errno.h and not the kernel-internal
ENOTSUPP from linux/errno.h. A translation unit that includes
pinctrl/consumer.h before anything else fails to build:

  include/linux/pinctrl/consumer.h:110:10: error: use of undeclared identifier 'ENOTSUPP'

Include linux/errno.h explicitly.

Fixes: b44aec87658e ("pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609240855.U59akHDO-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202609241240.61Hz5rix-lkp@intel.com/
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 include/linux/pinctrl/consumer.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 7be49d447426..81e7866bd2e3 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -12,6 +12,7 @@
 #define __LINUX_PINCTRL_CONSUMER_H
 
 #include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/types.h>
 
 #include <linux/pinctrl/pinctrl-state.h>
-- 
2.55.0

