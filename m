Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21664519905
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651349; cv=none; b=LESStPTJhqd9CKChYsJhLxsViGg5lmo0NeJU6vzjgmi95CNSBpofjHGxsJ/YWQL5dw9Ob9CSmUF72vJzU8Ed/w9wVJvtNT8YnhayG+cAuWLSKaMTKH63nOZK3aMPDRLR3RtL2zOUVK36a+yguGm7v4YnlUGuTMLB+yXCGjAiN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651349; c=relaxed/simple;
	bh=Per1jZ1d1Lf3zgdYxdHohCYxufw3TO312eIQjnr6DnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uYeyO4hT0ipysiLbWpgPi8mAaRJ1ZgrgWP9oSx65TowoMTwTP1uO0xzEAWxXL5pIxPvSeHHaoe+ZqeHygdQRM3YK6h2ZVpkYZHqbyjZ2wq1ceU7dTN2taQYXaHjDeKLvGXPdq0NLL0D5seFc3oPGdX/ShGPXPIE8o9GpwXbJP78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j0ba7R/v; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j0ba7R/v"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so4342555e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789651344; x=1790256144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5MKnFWN9qx9mGZRE5WM7kRDAqIAlnqtk7MFAHNTkMdg=;
        b=j0ba7R/vVrwGUNTSQjLWfLUVIIvvei+C54uoHqdEHhsKpgi8PatSkQn30rCxpQ/XFJ
         /3W5RxuuDrtDaHEwh7RH87qyydcoVYn2EfMA0pgs0Ws2rMu5iwzHdswjJhY3y0PntGQ1
         vyPiqHbryAewkheQ7TeaOX9vfcHPKMXE7z+wSqV7HAATz1KyK6cwnDL694tmVmns54lP
         MRnq3kJzUfnKMrzRVFWFMzlCrzT02uz2NuFyRYcbzWPV99V1mGSWFXcWGxjQacgnsVUm
         bSm20mD19H9Vcz6m6zHs5xd7UPl35hv2l2Fv+hdJc6QTXnyEwtQhRsNPeQCKCthcKQU+
         /ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651344; x=1790256144;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5MKnFWN9qx9mGZRE5WM7kRDAqIAlnqtk7MFAHNTkMdg=;
        b=wtw5vS/5mAcIYNd95hylkDOO5exKZ2R9dgDJghbDznRyjY0RWaScINN/APTxpcQrE3
         w2+vrI8IszKJwNA1rtHzZITajLMSML+sZrzGEmmO6hIr89uGE1VyGHbMUdDIipFEWrat
         QfBZ2FXsi0lKfjyXthfZU8oEOihld6syNaMdk8p28iUq+BcyHM/GYY1/GpiinJV3pSAW
         xQVp9pct7rhhhQExDC0JdOvRCTZehbxeXbP50tiwjBBPF3TqPW7IsdrpRpjmuKUGdrfv
         IdNOmH8XaMDGbEL3+rRZmIoh+w5YzvSz6wbXrYoYMpw14onKbXpJ8DpIN2ChyZJGcXyT
         jmog==
X-Forwarded-Encrypted: i=1; AKwUvBwNRJhRZF+INp0r61LntbRLn/p+aDPE0BnArc9m+1XzNhhkMwYImh4t/vgEC3+i0LIzOmlUKXmSHasUChk=@vger.kernel.org
X-Gm-Message-State: AFuF++lW2mjnimjN2/2g+w8kzudENJHbS5BlP4NwdfUoBkwijpvjAUcZ
	AhrywP7ZX2keARyeDPrZv7XhHRmlvlx/g+cevffNr/eEhpCJcar/Y+pm+aNXdgm6vwk=
X-Gm-Gg: AYBFou1Ir5mcWFRztbh8aTy5Xm1ZmoBkdq1UDel+BOKahBpOIaQaDV67qImZ7MzTswZ
	bYR2hFBSjXaPvZkjqcKG50CXoSl5zBgk7fC6beW+cGji5sCGrCiUfb5xdG8GCf9KjQdqBDBkoKb
	1SPM4vLByPSzozzwC5wP/go2L2L8QXKi8uguMT8QPqkujSZ+MBMRdxiY7oDNFqweN6W1xLovzz3
	wODymkpoUzsz3qMy2oz7/vPv3bG3vkF1t9GHROg7OkCMOdgHgSxSXcVQza/wdPcMPprLPMYnVNf
	Fzc1vOW2wnJlkIRlmUFeLweDlJt0/UZkbJ/Wf4+kghToaimJETDmGgzOCyfAVMYTsARNyxq356f
	yL6Q1OUEX0RbMmWIKdIfLEzGm9Qx/zKUGh1EoDgw/Nb9F+r/Xfp6vHIXEMcTYLhQ2TlX9fk9dpf
	MG+aY+cEfqSdA2SfOy7Mvvz2fZQxzKhCv10OSwchi5ki6C9bdsC/B3HV+rt4Mcr0nfs3iW+vMT4
	MAu0yBqfo8yJc/MwG6qVbB4pSXq0XWngKwhyjp+iWC+CYMf4doxbdGqh7P5xA==
X-Received: by 2002:a05:600c:1f96:b0:49e:69f8:e846 with SMTP id 5b1f17b1804b1-49eb72f24camr77387205e9.9.1789651344230;
        Thu, 17 Sep 2026 06:22:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904f3e33dc315acd8c5.dip0.t-ipconnect.de. [2003:f6:5f19:a904:f3e3:3dc3:15ac:d8c5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4870bf43511sm14694856f8f.33.2026.09.17.06.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:22:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: imx: ele: Fix build regression
Date: Thu, 17 Sep 2026 15:22:14 +0200
Message-ID: <20260917132214.730485-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Per1jZ1d1Lf3zgdYxdHohCYxufw3TO312eIQjnr6DnE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqq+mG46lHd7s4WQMlUWc+6papS+Jbf+ailCMHL 3GW5xO9x1aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaqvphgAKCRCPgPtYfRL+ TqzrCACUxM1NzLVAQkHJXl8Aov7WYS6BVYFamDV+o6sCbfb8nngTfIoLs5W8MwdPRcISJ0ueu5i icIkxSIkjbIsWrSGJhlRX7CmRFtrfZJjIjhuNTx3zYS444vTZuocabhds0Hcp0oV4lQZSDUxRpn P1EZxp1DLTKfuV4MNiAz+d6w1KBF0zSC1M++Io9ckYWGcdda9+5Pk5M4OZPu1gVtL+cRSj8Hfda wo+ausyLYH3sMnmi9ujtJqk5oxYLRyENZGILHyk6RYSfj4cnEeu/Kd6RZasjPdqyt4+3ekfcYp8 4353PLUliT1YjyZLh7V0Bz4OxuCX7nHmRR9T0ljKpI9+1xs1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

At least on alpha, arc, m68k, powerpc, parisc and sh the header defining
kzalloc isn't transitively included in the driver yielding a build
failure on these architectures. Fix it by including <linux/slab.h>
explicitly.

Fixes: 7560ad03bbf4 ("firmware: imx: adds miscdev")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

the referenced commit currently lives in next only via
https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git for-next
. If that tree isn't stable, the Fixes: line might need adaption.

Best regards
Uwe

 drivers/firmware/imx/ele_fw_api.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele_fw_api.c
index 42cda7de66e2..a3a68234bcb1 100644
--- a/drivers/firmware/imx/ele_fw_api.c
+++ b/drivers/firmware/imx/ele_fw_api.c
@@ -3,6 +3,8 @@
  * Copyright 2026 NXP
  */
 
+#include <linux/slab.h>
+
 #include "se_ctrl.h"
 #include "ele_common.h"
 #include "ele_fw_api.h"

base-commit: 7560ad03bbf40f5b89e210bee2dadb4be20efc1f
-- 
2.47.3

