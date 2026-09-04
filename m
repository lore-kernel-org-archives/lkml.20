Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C141F50C2A5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540713; cv=none; b=i+7DdUPYWutyXUeD1cLMAaUGU4f3WSyMQqYK480JSLG9gjhP5dfnA4xcguDkrT+PnjTrf9QTVjvyeG8fQ0sJpFokOe7jCSkc/e77WqOpl8yXJrT7g9wpOdacJ3RCXCbLS5bRSK93dtnHz0vA9/hB46w2cmzvbZg4Tcd7MSZwgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540713; c=relaxed/simple;
	bh=wr06q1j6egQgLlwJ2GcTDS7dH7wTNEsRtN9Wo3hJNDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KbJJt6hk8xw/AlCHYwc+nyGFVYr1P9qF1ntQeFm2H+L55kWB0vHZiGK1g7jHdOOcU8Rz7zhgy00mtf1eDp2osgjHEoLL1rIMLNyTEeK2uMnoORjXKTOde3k1GAjSCPieELiUvEqwhZ5uMweYcKd1rZySIu3W/4q32joXVc8Okmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBMtbdre; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBMtbdre"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39266382df6so1049674a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788540711; x=1789145511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGHMxZ3rFuySAWzmDjUwEnKK4209RW925xasnyoZmGw=;
        b=NBMtbdrena5Kic+XrW1tI6FUkeEHVfc8f8pVOg5Yn+eLBw+wf2+eoRrMf8mH7MJtmF
         dYi2sSbiXbtay1fbPqQUnFcEhX1PPCHLKAbO0LcN3j/Y1qMMXe68Enp+T0SO8s06yCJb
         JAcZUv7LEQdTnalxdm5lUNBZr/NuDb4niwv3g1DY5LGoS8YJhpfpwnzZ3OFsOGP1c0BL
         TBVxugIg+5pulhayoMfC1Sc+ohNGER6o9FG9gbzPjVEMd8/EoMfGA7FcGGMTVMOmxbyt
         FSnghaZXBwDT8UsEYU2luDHjbh1gcs+u2gjDpRupQspHdHBZVDKlGQTCVT1EQ6wKLeBa
         XHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540711; x=1789145511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGHMxZ3rFuySAWzmDjUwEnKK4209RW925xasnyoZmGw=;
        b=H+2pNB0E0XvXIXMNnOEG50Nyj3epYZBhCoD1Uw+5Zt/VCfjrex48g0FWHmDtrpwzf+
         DNCRSr2s1+g0SZriyMDYl4NI1PsyZEsc9hklJ9t+BDFZKoIM+lRvOVRLkx6sBrdbVdkn
         y7xUETCTKdBYUxkJcE+e4G7123Spos8D2INR77iisCYH0g2KAAjbNAN8ZIEmVYJpnebM
         0nxpoRyGEVVaB0zAV5L0asLOLKU5PQRxD0qoU6R2qtoCFZi+8XMWCeNf1JS7hoRQyua8
         68ygxfnFcBmqUEO02hGWRswp0YpBcLLhoF0HMWlGmhHjl7Q/FZhTqvaUDJ/Fc8iBcJO8
         DECQ==
X-Forwarded-Encrypted: i=1; AKwUvByEqyeHDG4/EqdWvbvs21LoT0nshiIWYYmdQvoQf3DCmZTaFNU/s29pbqwdtlW2YHqFr7JK31O96mQ+qoo=@vger.kernel.org
X-Gm-Message-State: AFuF++k5oFWJg6c/fMxluk9UHtyp9DyPAlrggMUBUJ1ChGssFGfxTCCp
	F9sPl1nrIEocfLKpourocvjlgO8mQTxq50WV/xOX4L1TjJaxKM3pGBit
X-Gm-Gg: AYBFou2/wO2FyMcjBh56o6EsXhxsVK1lk9a5lqyXcmxVJLm+As71x5edvP5+wxkVCjY
	cLi4ADKJbM/lU0q5PRi3zTQ7x5MyXKD6zejFWrCdReZ+NmEseBOWaP4dhGlXOyruh3oefPsyr18
	NV2AFWUHNOPQ5SQrM2Hbt3cjSFRs2/AvT8ubDJjcfFUUa4sGAJfE09z6E72C5aYbzVjmC+q4AWs
	JVLTWjgNfNqe7IGDem5OG8eFSdLl6XaDjOr5mtdbsSs96aBnA73bOrXbdtSfQ2ZgVJ2dqDpJaEl
	uOhjFh3HcB0dWrTWWxke1cTI6gZqB7OAgDChlueQwjLrQmGGhpwN41R+dpjHF6GIN61u0u9c1ux
	z/2QA5qiIp+5645nXc4gdQSPV3dV2IIV5TY/ac+Xvt8MPGYLytTeyzelYItzeRqPNFIQogykbuv
	Xiy/p2n0m9gG/Mf0YOlki35JARlL71mG93W7Gntjj77tgfMMqQraiuQ2yK9CRTi3LLvMBFd5xNi
	krV/kr8Zlur2pbzgDbdlJv3GvoF2DvHIXGeNoHBalPkRXIl3LjHZBxUvoYzbNtElCxirV1DYGIa
	onYX5AwNNUc=
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr11436269a91.2.1788540710785;
        Fri, 04 Sep 2026 09:51:50 -0700 (PDT)
Received: from workstation ([2401:4900:8902:9774:f2e9:38cc:6b1d:1764])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm8463943eec.20.2026.09.04.09.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:51:50 -0700 (PDT)
From: Amiitesh TSP <tspamiitesh@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	tspamiitesh@gmail.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: fix typos in drivers/staging/iio
Date: Fri,  4 Sep 2026 22:21:15 +0530
Message-ID: <20260904165115.228990-1-tspamiitesh@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo error in iio staging documentation from none zero to non-zero

Signed-off-by: Amiitesh TSP <tspamiitesh@gmail.com>
---
 drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a b/drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a
index 863d3856718a..d19db00acd1d 100644
--- a/drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a
+++ b/drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a
@@ -4,7 +4,7 @@ Contact:	linux-iio@vger.kernel.org
 Description:
 		Writing 1 enables the cell balance output switch corresponding
 		to input Y. Writing 0 disables it. If the inY-inZ_balance_timer
-		is set to a none zero value, the corresponding switch will
+		is set to a non-zero value, the corresponding switch will
 		enable for the programmed amount of time, before it
 		automatically disables.
 
-- 
2.55.0

