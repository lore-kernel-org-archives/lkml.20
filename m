Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB333EDADC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513183; cv=none; b=QVAVmsb1a8KYYAFlUJK8HSRGNzWH2+rQJQ8hVbyI4toW6JDuAUmD+I7be1vSLIae/kssKtp9uwUUko41pLl89d1NLwFjR5dYgY74pJpyTKee90UU6qJrGKjKxXVK80giV7szyXeFbA9zxAczTEsQhrViLoWaZBRjmBPOnIzMl7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513183; c=relaxed/simple;
	bh=UlKtSFgJbq4itWjVY4UghG+VhKebOP6CuaZQzBNuzME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LOolRLqkl/2ufOBCk0DMggFEQ0UjR6yNcnf3tznZDWjRg8B4zboS5/w/H4gGkcHNfSFTXv0Ab722ikFBgqFFw6l1QYdi9c7VEKOZ0cs+jYCRgIpNlWBeYIFzVr3vWCCwyOs7Bdm/XNzR7fvrJprsdr/YpoeDoJjQR0AytpCETKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSZtgP70; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSZtgP70"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so602367a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788513175; x=1789117975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2uDduOSprb24UTS5mMjO2bGXJg9YYeJ4jGweCvX+II=;
        b=GSZtgP70jCU/DHrqqoL+9YJEfIo0QLn+YCts6OD2xMSUQ6ahZUwdMo6lbNun1R84fK
         1edHF5c2sJV4qG1f2+CLFBeVqj984hIL9x784fN+Wx5Qex4dnyPscoYVCOXnzl4P8vsU
         UaJBkZon623OKBz8Ch/eETmrICss1SfYq0kZSuIBFcmlwKuKH28UOJ5ptSlb/KloshZq
         nG9aP0OYB64mHWKeeS9YudgtPdb8s7qKCHWGjEb/WZG+6HayJjWTo6s/q/f0HN7ZsGDD
         9+R46yJDbVAZ/hBaqj5/akMOq8coJPbxwjUaKaThf6M8SnY3RVUgbl7n705oKrEsas49
         d5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513175; x=1789117975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2uDduOSprb24UTS5mMjO2bGXJg9YYeJ4jGweCvX+II=;
        b=YXALoGPAtPEb2gRCt7VtuVdzmXUJR6m8mduoqvyHO42vBIcjdJx+LGgG1mYZplrllM
         NQfWXmYI11CzQhVJw+UAS2WFOlOySnPVWYWHTIM9Yj8Ed+FI+KAzbiJyPQh85e2yqe8x
         ugen52IjYpwq8y3oDZthRcvan04WaMCL6v2BYdth3j564iNXWHuSjLvUAq4NyHisYA65
         vHfge9nhm4Pkm6pXZK2gz3l3BCYimE+ItSW2pgFoRMN1YliRlehvHzOQ8yEFD8n4Y9U0
         zfqkZOgMTh+BDLezgnB04znCziP9FGsvRFFR2Jon5rXxaCrIPOelkx8XLfJY2WvlSZS3
         xGVg==
X-Forwarded-Encrypted: i=1; AKwUvBwXfxaXmhYo9OLcS6rpDX0X0GCavv9/+69CNKPBkEsc1fwYQGUf19MuzhLyDwdvPAZWw7lvp8ztoh4P9g8=@vger.kernel.org
X-Gm-Message-State: AFuF++kgx/QVZeMJsyaQggHjE5jCEcaXKZmpy7+FghNo6er/GQ7iAanR
	r+WZLQSR6mkT5JLSGKTn0CNuR2GLlfAQzWM6ZiyPteaCYM2SACj6gsWs
X-Gm-Gg: AYBFou1yM/kMvmZiyjTmolRJRAGr8Mav9ZPZU9L04WDiLt7D8/KthZ9qvurcbM3N742
	G03EsuzkIQTYudy73nZ0bB0otpHXKJukdWpEJlcnqqo8C4Yl0SLHSrBKh2ZrbbAKZIAlbrobM/M
	rFHsRi+UbgGnJuUrogPMIzUmGQhsoo7fkqWoROOJt4Qdr+AxQUVTEqkQXxZ2/aoYepCo2vUECYs
	vOsGLEDlNDdAt51Ilgh38vXaTXqHA2V0uBWaa3xP2Ehi74xxc9KmjONb83S6kJ6HTIyToxQ+nMW
	SsfpsXeMV4M6ULjZ3hmyj0JyY/cJEL4HO2yPORx9jrH/86QJcxnuhv5Rl2AhCVIkjZTxOTfHoUL
	ZGcpLU9go/Yvik0bjcfBLpuNyr3S0SzuwCjSgN2pf4kl/vPzPJ8sh9kR8W2mWRvl9re9NnnFYXD
	fmpOu9oEOZIMYPDnn7aWwhAtO3HJhlRYs2zGdCORJ41wtqy4G66NCmNSQwLg7EGOM4AKpyqdWNp
	pv1slP715cmP4H1pyyGMrEWjJ0X/q0AIpIOdkWyMPYCSh+dK+U3TqI0APrMQcVP/gv2rt0uIjHV
	XRTA
X-Received: by 2002:a17:90b:394e:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-39b26272d76mr7654274a91.12.1788513175260;
        Fri, 04 Sep 2026 02:12:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm3443708a91.13.2026.09.04.02.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:12:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] remoteproc: stm32_rproc: Propagate errors from optional IRQ lookup
Date: Fri,  4 Sep 2026 16:12:30 +0700
Message-ID: <20260904091230.58665-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Arnaud Pouliquen's Acked-by tag.

 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 1fe4cdc0a13a..a47e040c6db8 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -675,7 +675,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	int err, irq;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq == -EPROBE_DEFER)
+	if (irq < 0 && irq != -ENXIO)
 		return irq;
 
 	if (irq > 0) {
-- 
2.43.0

