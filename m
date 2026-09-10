Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2052737F9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788999171; cv=none; b=D4JDCsF/oGxoWR+h1h+eu14OdwymUdtvywOnZOhV2xsKMqyUS4cFVzv+pR+N7PeN52uj3RBY4fPXmr/csaI64PHtk74Lftc6VaDWVD6/zkpEOKDox/uRhGGOX9c9FqAo+QiG4e4Cn7fR3wcDqbXA0ugzJG9QaSVykbobykKAAMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788999171; c=relaxed/simple;
	bh=4/+FgrDMVhQs1sOv5YhKEz6pdUR6l6NGsbz3wEAFfU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T1uEgMO6q2e2YSQboe0AHn2z1mJ83tqfvMvDZZdKGk4lfmYp++6jPUpPM2YbvK7OmrSMNYp9wuQnTwVA6El5V/78fd3hEhSL4V9FWixM1bTjxJACkBrmBYzv5in++1aaS9zjiI+IlzOYjnx3LZtgu/4ycIsmIv6bkvl94rKCcu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfVuqB+N; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfVuqB+N"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso5012073a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788999169; x=1789603969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pU/m9vvbGa2axfz6RcaE2ZySRx/aotu9RVJ6XHh13XQ=;
        b=FfVuqB+NFat+0ddMYgThejlxb+ph+7YdrWKzN1kWxTAB7B1TeOCdvIE7qAWrwuDKEP
         brFnNyOKfywRHtsEUEy8O60iIkIinCInNlmskve4czcnqzewpBKTILSC3p1nfryBvwOv
         M4k3rFFS62nTzgu8LKWZThedzQ+OkCd/MRhoMV6KSBre4PRdOzVTVgZADttqedUmfylB
         dpWODVL2TmueBc6gTLN6t2qs3fY7DW4rkP8sd5Odu4olDvNgNf1XpS6WKxkEu6JjUkWp
         hWQPq7uo8aH4+XCLlWZE21eFe4bewpJYzxaPapqLV8BIGilZw8FR24t+1mRT6g1MiqOi
         T7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788999169; x=1789603969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pU/m9vvbGa2axfz6RcaE2ZySRx/aotu9RVJ6XHh13XQ=;
        b=iBSznRQ7rJIqcy8qOT99skkhhrbgWYc4pSN7SaOeFAZdoi/LdJJ77YNuWOA6A4vpZ8
         ns1ZOKtkC5GLuRe6dbMzTzPL+BL+cxnoMoKzApnyOPa727St38uwDS1qQbEdfJTI47iL
         qk3nCIptPIoI/8ssCM9XVkAOaC0BpemGzubPCKEFtQkG67Km0+EwCHCf7NVdT/RLV/8d
         9Z23P1wTA+wdllOjMYC5x/ZSNICdKLmmUDx/Q2T5zCcsY5dnaFn6bkQoxJl/2g9zUSFc
         scK34z/BHYxYRlxa9nvSOAi2yDle5Wmrdladcb0zfmu6AGR4tKIQPlBM7RYzWIVL6mBD
         8seQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTh4vT80TmL5YrSnN0VTKtj+gyo+MUdgU+/FHOT7PwCRmqyP5OmyY4dm3RObgEvc2NlhKF7M5vpu/5tAU=@vger.kernel.org
X-Gm-Message-State: AFuF++nVwP9tn+n7jXaKDLjO77NvSiLE50QTDt3rgavy9akUyE6RwEVU
	K54eC+JkTBiZt1vNiKTj3NoiQd2sZYFQopR/sBZelA4m7HWkQVSxnGei
X-Gm-Gg: AYBFou1YRDCJyVw8CuNW63y3TtkpRJ2SrJU7Rbj+aJxOlpSEfFF5V3cIrnfBp1DL8B0
	TGZEnsYl2h2edR64yoyq+VWytClVBzWNEYpM5MTId6dyQ18+yaYSGN5YOuU9rx5l3Vvmz0G/eQS
	2qxgD2COzqrprJRhesyDHY2mOKiUtMmylsSQQKus7OxZi8DQKsmVEYVtkhTxNcWfDM7uxwg/l8U
	MM9sxk3xjw6fO4v8lrO42/bLX2sXgcFc5JqnNvtB0qR6U8iX57lLF3Hp/54gp9kuWv+I2jxuVIs
	oHe3Ja24TI6qlGUu7SKjPgJQUq2WZyisJw1TqlrtisrJWtWraCO2uv5zVwuDb7KxSZvoPKFviLB
	YqRbBBbMpuGJNE0nGQjRhIeW8f5Q22g5XAzXzwaP+1NhZ/t198+mNQqosOv+rxJi+ZIcE1rmj48
	/guQwYk0NTPAdyT63HYlOr4ALfGkZT97EPX4oL+0DbC95AfLGALadZPp869nq9beAjKoPn7Kg0n
	Bu795LJFvxDSXWhL2ErtBPuLVTFOv2Psn0JoRs9BQd2sTTAa3cPVFvwVFtsTaTUIATJZKxhHnlR
	oxU5H8/m5cs7ozXHlomnk7MA7pURTn4ikpiHwDPKFBPBc0W6
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39b262ab182mr54698067a91.18.1788999169434;
        Wed, 09 Sep 2026 17:12:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d76aba5d6sm2104566a91.0.2026.09.09.17.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:12:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: N18U: add nvram node
Date: Wed,  9 Sep 2026 17:12:47 -0700
Message-ID: <20260910001247.116893-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47081-asus-rt-n18u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 3854db0118a9..82f9fb431a92 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -77,3 +86,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

