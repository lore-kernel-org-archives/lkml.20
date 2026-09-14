Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FE048C41F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403579; cv=none; b=h0Kt0gg7/rWTi8+eUW5MupKXhpBJR5PM62ZnhjFU52GYaK9r30zNClFr+R820v3WOfBlJxPHHddVsgwsQzMulfAVgAJoPilSYxZA3RVFg/HMfuDOPnQDD99tT193l931XoPF0SMdLPxfw3nLSs+jKmPQVMQZ19r25ya7I70Pgac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403579; c=relaxed/simple;
	bh=u3ip+RRXt4HMU6c7yGbkOPs35P2CelDhQnnshfbNVW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W6cwWTMIwBkv8LVqkT0Q32y9gJzPshw18/L03YUj3v1knLQogEAKdY7SRX9c+L+o5WbpHkjbZLnbhSioT62C7zA7sEz/zU8rEMece2svA17dbxvS6QeSC3U/4UGRHYQT5eXHZ2z31NR4goofdt8hEyz3YWn+m0vr+VUfNk0L3Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xSrOcZcL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSrOcZcL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so26017025e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789403576; x=1790008376; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GVoptFjQoPJzZR3oa46rPkqQ9t2mgiZ9r55mFPnK2Qs=;
        b=xSrOcZcLQ3MJJgmmv6k2ziMsycCZHwzbN0QTjzQc6ebO/m+9SShRaov3wVnWIA5KPz
         5+CXNMQTQ7Nd4OxcNl/I7kKPZWlRV8KNYz/D9Ig0Bv4ZdFrckswpvDpn2TGFACydAwzv
         QqlSo766z3CzZ9qiebVJA0G/UswqejvyshFG2/wWrf/yCdOwjcFhc2eTNRujN8vh/Rs+
         /g16BLdSTjTdmNu8+gkCGdajo/sbiJvtaRRjZsp1DGCV8dTsJK2ZXnuFmR9EWCJ38A/t
         vQH2hkbMWaJayivFk3/0kzcXyLlyGdSWO/Kp/aI/gxKk7iianH+DibSDwLbM+DHoND9G
         ADvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789403576; x=1790008376;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GVoptFjQoPJzZR3oa46rPkqQ9t2mgiZ9r55mFPnK2Qs=;
        b=CUGtzIdib8Ec5om2H7zCZrQJsUZNJZmfSJCRDDT6EhYhu94Y8eBd9cAtzM9VFF0Bmc
         YqpzSSQWGT5sN4dgM2QdaFWgruWw+rByHso/4ugFxUvoV9Fy7sVuYk727Ew2t97FW+nj
         V5i9kPpsnNhl/qA/CYpcRoqAx+BNHiNx+m6xjulwMKXuKqCzfmnMXtsuO3zDTBOkWKpQ
         k4C0KJtFj5szTrEogKY3BA80chR4RGmnuwo2umloAJjacycp28mVqPynT6+kMUkgo2OJ
         Mk8SILFB5f3J9NvFAiG5r/dKveR4Xu4K/wEGI/T2NBRc2kJQ6ePBnyhf234PbsfST1JL
         XRzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkY6mMpDJJgqAuOTrFvT9tZF7m7OXVFl4dGinGuqUinelO8b9gzawzD8nu5N7mPTAnKqnun351jru4E1U=@vger.kernel.org
X-Gm-Message-State: AFuF++nKezOruyg19Qg3P7XqC/p1/MHDa3oeRiOpvTp8g3fDG0GM2wD+
	CTIpaiBK15YIfXabfnB8htm92yggftgZ79QHlNd4IuBEPOo4+tWtyoYMQXsjsVlErr4tzCyfsqX
	GmXDDsMA=
X-Gm-Gg: AYBFou2N4nPRTw7xhEr1jOhY35tDjOzMfRBLk7gBVe31iOecRV+XQMnJckzoWQFahVH
	iEBveWcPlQEjUsTGhd3/cU0LmLUYucdVRgD2BpUWpz2qSM3MbTLG0T4mRPWAl6U6hqf8wKx+1Tc
	z0uMKiVF2FET9v/GG5x5mipO33vDleBZJ3E2g3nXQYX9WR6NrWBugP+2zVdKJPmn3Y69o3ZXl2I
	mjkBz1g9j1eF+jXb/tXsOQsi+Nxx98KMjTK5ftFiD6gXjNhBLiWHWHiZilvMsWE7+2ENy/GVUpK
	lbpoPfrOlX1pCxgg/1J26x+/D93JMj5cLZdGKCTsduIgaAyydcCfo56fWRTC0R0rrTJIS/8f7vy
	5mzbA9a3jc47IFBgH95mh2JfHlPK0rg3lwD7Z9SRK4jp85kdVcshYT29sNB9ZksPrhbMDPjvbON
	I27j//11st+vmrte+gXKy58MVXBLZwhLXe1dDCH9J1aHHD9Lny7s3CchjfCdoMKUJa1dOGAYB+U
	kKTzARhtYCHIu6KVRG9/DXVu85mqn9Mi5Hwia0YoOFCZvUtwuOnfbHvc7LO3OU=
X-Received: by 2002:a05:600c:6383:b0:49e:74c6:d973 with SMTP id 5b1f17b1804b1-49e7a67e2d4mr40537305e9.31.1789403575710;
        Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm25431815e9.3.2026.09.14.09.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:32:45 +0100
Subject: [PATCH RESEND v2] arm64: dts: exynos850: Add ap2apm mailbox
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850-mbox-dts-v2-1-798585c8f1ba@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK0hqGoC/32OMQ+CMBSE/4p5s8+0pYI4OcjqoKNhAPqAJtpqi
 wRC+O9W2B3vLt/dTeDJafJw3EzgqNdeWxOE2G6gagvTEGoVNAgmYiZFijSMxvrDnuGztAOqzmO
 VliklURRzySCAL0e1HpbSO1yzW3Y5Q776jt6fsNGt4c9ste+sG5cDPV+Qf1s9R45JHRVKJKRkL
 U8PbQpnd9Y1kM/z/AVG1q3P0gAAAA==
X-Change-ID: 20260429-exynos850-mbox-dts-c9b9e7336140
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- basically no updates, dependencies were merged so just re-sending;
- Link to v1: https://lore.kernel.org/r/20260429-exynos850-mbox-dts-v1-1-7f3ad27ed4f4@linaro.org
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..bdf177d08ea2 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -319,6 +319,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260429-exynos850-mbox-dts-c9b9e7336140

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

