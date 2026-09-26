Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E929448384
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432978; cv=none; b=lu78WRuZIiHu5ix6vCS+KKfw3KnPb31bCAx0/0tj2R6tk9qXATtwyToIQ9SaSBLR5TSUX6xQ/82EHc02EDdPy4SQdS63Ml157OuTPzfjPSLz0RDJYYIu5D9FZ9uPRR7d7h5kU504A3jAprxESWAwFY2FGI3p0FNnbfUaOvTl+rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432978; c=relaxed/simple;
	bh=lCM8EQsBst0/957ZeT7Tb/NPB18E0n8pF89y5rHIWKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fvhmOLaqp0/uk6+vXr0dJaW1kDfXPivmgI2RGfAOULuDf6h+PtsJGhmcX3oawQJ13aeJArLj8Bd5ohwfOJIEkAJ3R8fKSCi2E4SIJ6t+o+o/MObDv2YKMOGbXHMnV8l5TMxRRsZYxWB6LNUmnu/fZgTs+MhOYNsGkP6zEIoOWAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjC75jVT; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjC75jVT"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so9448505e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790432975; x=1791037775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49roW1ruXbW44fjndJnGBTTIlml58m6uMeiJnFp92as=;
        b=kjC75jVTkIO0pZ4u9gjex3h7Nh6bypmxH//U1UAivot2ORQkj0+oqtXf41OdNK1qRc
         WiSYMoWfEntdF8K3bvc6ihvmDnSYbqAVmpCqOApDNYpzlcULfEozQdYCM48S4WG1OApP
         s/WmFLJL4eBya7rF8WgYj8ngXxESDvHYT7s8dymWHEgp1O1Y70FPhmCz7x8rATKB9Fvs
         bfYedg2fyg/1L3S6pCSVDsK71sdjqK52IGu5sHaN8OAXwxUt4BVBizL/Fgp7vIESHTHQ
         N+/dtgN8tmkLehBYA5DXiXyvNTrz2shP4JObT13CRe8f+rvwvvYxFBgIy4uolc7aQuSE
         nq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432975; x=1791037775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=49roW1ruXbW44fjndJnGBTTIlml58m6uMeiJnFp92as=;
        b=2nBfhSRGYNi7yAJdj/rQhn5E36O9cRvui6H9ceoGEDIydJ7AHHC/XZADo8ZnYsKyMP
         vLACS+kET4E7hEs2FnxRN7UeppyI+uAvgfYmXgJ75d5e4CJrdX6yQ3sBPIP6SaIkn4D2
         NVZrgFFESIGBRsDMpkURH6szemSglC3VOZ6ahyt0xJpo5xmLcBroIuxcPxw8ualFTAxd
         tbZvyvCfdb8yv3ZPbPILhfC6tcWPqUGpYpsTs1x+aotCN5Bievls4RiGLOYQ7PjNbgTL
         ICCgdJEbB3BiCdnV7eLseNm0O7YHNkoFzkE1cKpMfBiNy8sEGrKxZaCpHCQCJUKWUZQo
         w6lw==
X-Forwarded-Encrypted: i=1; AKwUvByG/E2RP+0qzc+/Ckdj6/W7Gmbw05jaw89xS5qUyRQKPcO83Wc2Xq4aligECikYGOuBs+OgKtUtQCxRKCg=@vger.kernel.org
X-Gm-Message-State: AFuF++mMfGlf63nX6wqHgOKreLCfi9mwBbVv+LKRXGqeKvnroiix5PAP
	icbMZpNCmHhXmCJN0ymhqHblNchPbEi6abOdoDiAjhCNPxxdp373icF5nvvmGg==
X-Gm-Gg: AYBFou08gYzikNP2eCZssvHBwq3EWUgAOvS9b9kXVY0N5XhbMkCToA1reJmGa39PBk/
	ctWtmRyJn2D7rqUjNaouFD7pJFwdLKcfsvrMyh/ij4uhOhO215hFEfvJoBhMaAk9wAE5pdcH0s4
	ZC2gcjRYkobmzzCZW9Z0EQV/ZkMc1jwLH7xkJV//PbZPBFR0ucT/jM9az8OdEWMMmoz/mWlLsBc
	QMisWPHX7snlnxjYD1P9gxz539nDJJy10UqPP0ypwBT16uHOAYJXZsoiH6gNc67sZYY2lw74SGc
	G5yB/MS+e0pc9OKVf8pgj/FyMHUdT47nZiPO2ADRcyzhns4FylY/tVikJtxNIKxTqYr6lfBcUT1
	LmBPuiwoBZH1jL+ZjzXghzaANsfOSDMsFXnPlpAtMH34ZUdRmmBTvZEUURWnAl6yprPgcH0anBG
	S5U1Rv+t32pbKtUACjVKlMGQp7Yh3Slcd6J+U0w59tThWQz0w7GV7tVVv2IRGMcQqA4DkDX940r
	u3QNFGFzCQzwsSJ+aM=
X-Received: by 2002:a05:600c:3ba9:b0:49f:fe48:d177 with SMTP id 5b1f17b1804b1-49ffe48d294mr24981565e9.32.1790432975572;
        Sat, 26 Sep 2026 07:29:35 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm98116395e9.4.2026.09.26.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:29:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] power: supply: generic-adc-battery: Fix temperature IIO channel conversion
Date: Sat, 26 Sep 2026 17:29:05 +0300
Message-ID: <20260926142905.206215-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260926142905.206215-1-clamor95@gmail.com>
References: <20260926142905.206215-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Temperature IIO channel data is provided in milli-degrees, while
POWER_SUPPLY_PROP_TEMP is expected to be in deci-degrees. Adjust the
existing logic to reflect this conversion properly.

Fixes: 33088c0513818 ("power: supply: generic-adc-battery: add temperature support")
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/power/supply/generic-adc-battery.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/generic-adc-battery.c b/drivers/power/supply/generic-adc-battery.c
index 185f55d2fd709..f11a5c794e7e8 100644
--- a/drivers/power/supply/generic-adc-battery.c
+++ b/drivers/power/supply/generic-adc-battery.c
@@ -90,12 +90,17 @@ static int gab_read_channel(struct gab *adc_bat, enum gab_chan_type channel,
 	int ret;
 
 	ret = iio_read_channel_processed(adc_bat->channel[channel], result);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(&adc_bat->psy->dev, "read channel error: %d\n", ret);
+		return ret;
+	}
+
+	if (channel == GAB_TEMP)
+		*result /= 100; /* Convert from milli- to deci-degree */
 	else
 		*result *= 1000;
 
-	return ret;
+	return 0;
 }
 
 static int gab_get_property(struct power_supply *psy,
-- 
2.53.0

