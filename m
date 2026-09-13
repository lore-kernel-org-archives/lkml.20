Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C473AEF5F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281376; cv=none; b=S+jj1ZGnsYvxkhLAwz3yfJBM8BnHNCda9INPEcD3dV3AeUfz/Bybp1pXF5CE0BNj7NEro9HoCeqhBbfnhk/PgqRNAnN58yqekQNfFFzvu96IN9b3DczXrvii3rCtLRuDZlNoAUHwaqsGmbZAJW8xXPEpApuy/rkKGHv2eFgMvMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281376; c=relaxed/simple;
	bh=AuFaBted7/ybu6Z97TCANitruKWhIXrZTsYS1kpRTBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehWxGtCQMDDL26U6pGVx7lGjQCXQEXl8bodZpDC41Wlh3Jzy0IL+NimFvdnHlA/0Wi3Ry5GziMnxGlJKfO+OWqvSOa1ZGwAJF6zvNs5ierb85hR2So7INkRJUXgTrWhNleEs/BLQcWmSu0km8nkC7i/JRljCLpw+1QHit75AM3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWVVc0d7; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWVVc0d7"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91c22d27dso4073485ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 23:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789281374; x=1789886174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFP3Vj8KSIBbfPKyIBbQZMT08Gt8pVUubEOX0me+VXU=;
        b=UWVVc0d7G4sGBlPEeWNYM1sJDTtN1xDmI5zlhxSCwkDtl0TGceCvWh0QZsl1q+qwp6
         CnQGtxmRxjMHtPxlxhfACtBop6YWuhrOpPulVuFvDizMQ2SzWhHck53CxHJ0Ng6sniCj
         1DaPPhdWJnQ1EXvJj1eA1ofO2ae46Fxsg6VRDq4YDJ6LK9nKdsQfbzQCRBZDmXllJtqH
         ID/Znci18kS0VuFbuO9TmEzc+Ckr1ew6jiHLVYJmjB/ZiXLrcddqx6kJDsfLy3OXJ8nr
         I35Z2U3cH4Fv6OCXBaCS9HNBwYCSfsWKJQl9boYKV4xAtVBn70zkh3jIXwsSnt7Zsrjr
         /b8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789281374; x=1789886174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFP3Vj8KSIBbfPKyIBbQZMT08Gt8pVUubEOX0me+VXU=;
        b=UYQTyV8cXsYaJD+H+t5YmcA4nagkNWVUPQnMtazwbR6ZFjb2dyqpe97iLArVu0YuVD
         JPCrWCXa3c/+aWjsK0I2Xv8OQIMmoL8+LAMSMgqr1bK7umowHH4DZ/1yukSuuyWdj0KM
         q19+BNtrYP1BPf5BnXzZlyoM7tb/3zyT8oh/7a9JfkYiRFDVNDThS9H1Y6GX2QQJvr5N
         OhvNJIIeeQ3oUxziqM27Mye+ht+HN1WTNxIPni5OSUoQ5b3F1TG0Nc1qXnUKTdTCj0Ua
         F3wEYTsa4h9PIi467+YmTfkiNnJlXFfu6yQv6r0ZeRw9VqvYozfB/kwqpoRsTs5gXUQT
         YWvA==
X-Forwarded-Encrypted: i=1; AKwUvBwv9ndJbDbqplNkuFrjVBy2LdAjgvRXK6W9aYiwWBWoabKD4fCSC7vlH6rkQt219p13XEyxDh4oidrvEqA=@vger.kernel.org
X-Gm-Message-State: AFuF++kLFkEK8rJQKa9EvLm39wHOieuFFouErbWy2/NVTKov5uf+Xqjj
	C0xW5vE3YNze1GHFzb1bCpojohOhNz1P7k9z5AnFQoKytzaDkbKY+Q0u
X-Gm-Gg: AYBFou2zNIW+slMh6p8Gz8sKiGJSQgza60DAiLd30DiBUq6/Fe7ZatMRW4fX9nuZQfe
	8sME5ear75OiAKC69Kj9hlhX6fk5RIplAKDphfnW0t+UCLh1r4eXxntBwqJLpj/rzvfHWyA5Ew8
	43VNU5UgdA1PYNs00gvGhETljs98T3M80ZTgnHK7onECSE0rZzB5qmCxUbREuOSelyKL6Nfizu5
	t56GFYRX4+LMFUFP9R6DpffI5/z5Ug7LULQQjZzmVdZlvMo6lQibFozAO1jCNOJF9oM4+A+kCSZ
	SJpQjlEtk7fvTr7RyXwDGh7TxcoKI5bnqh5FlFCcd/7OXJRwDVIceXJdgepa9N9xf/PHGxLDCbB
	Ij1iJkJKVg26bbnOjAtvT3x4csDK+N2q/81Fz0SswtYYqmTr/KP4afMMNzeIMHlXWEDa9D3gwCQ
	lHrnEVQTZpN10s3gcw9pVhinx+3JatY79k4bNBSstkQhkV7EIR4AYMxQ==
X-Received: by 2002:a17:903:2c50:b0:2dd:3ddf:b876 with SMTP id d9443c01a7336-2dd4ba9301bmr99485275ad.0.1789281374229;
        Sat, 12 Sep 2026 23:36:14 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc56b1sm30770505ad.54.2026.09.12.23.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 23:36:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] gpib: tnt4882: fix memory leak on probe failure
Date: Sun, 13 Sep 2026 14:36:03 +0800
Message-ID: <20260913063603.1443403-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ni_gpib_probe() allocates a local_info_t structure and stores it in
link->priv before calling ni_gpib_config().

If ni_gpib_config() fails, it calls ni_gpib_release(), which only
disables the PCMCIA device and does not free the local_info_t
structure. Since probe then returns an error, the remove callback is
not called and the allocation is leaked.

Handle the configuration failure in ni_gpib_probe() by freeing the
local_info_t structure and clearing link->priv before returning the
error.

This issue was found by manual code inspection.

Fixes: 0cd5b05551e02 ("staging: gpib: Add TNT4882 chip based GPIB driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpib/tnt4882/tnt4882_gpib.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpib/tnt4882/tnt4882_gpib.c b/drivers/gpib/tnt4882/tnt4882_gpib.c
index 3cd13f637ed4..fc201ad17e30 100644
--- a/drivers/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/gpib/tnt4882/tnt4882_gpib.c
@@ -1585,7 +1585,13 @@ static int ni_gpib_probe(struct pcmcia_device *link)
 
 	/* Register with Card Services */
 	curr_dev = link;
-	return ni_gpib_config(link);
+	ret = ni_gpib_config(link);
+	if (ret) {
+		kfree(info);
+		link->priv = NULL;
+	}
+
+	return ret;
 }
 
 /*
-- 
2.43.0

