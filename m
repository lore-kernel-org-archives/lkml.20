Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E41351A75D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750496; cv=none; b=Siu3/X1fq4CdzT3E8LN2q5N40H5r3EDjUxTU9tV93zimkYjCCbOaf8gckr6HkVcsJ3AV9fWqg3Up9bYSgkZONRUmTxR5DWSx3+hyhP0nxWvtPTnn8+BwC3G+kb0juBeYUkob+OLnxQ0fh/LCIaa1ZJGFzzfubxkO7wyyXd/hfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750496; c=relaxed/simple;
	bh=QBrUOsRZe10rMUp1TXePAvpVVpwDarhSFSq4iF1D2Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQV+dmLaDrJwB78rEIjcwBQx5xvNUR2a4ylXXBqvj+7IITksBjz2JuBsUx6GJs9cfjP1TX6OTHkxDrdXvCMCAl5ZIe6arsGgnWVO4/Bi4hy+iRqyu7XnG72YDZpyaKpLY2Z5eB+mxkrVGKfe59HV7rds56wnYrhiAkCblzixKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bh0CWQKy; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bh0CWQKy"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso670382a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750493; x=1790355293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0V52zqrzqSXOjtcPE4YmALB+veTpIXrkLmMEtjpOEI=;
        b=Bh0CWQKyvheAwGb8oGfMpm0enrdKR25bcqW15Jl5H5yXioBXcrUsSD5upvRHKwGq8A
         Uf9VmneIc5QyUcUxjubScI/RHygfXmSXO2izZhVEcweqw7KMGd7eftklx+shOGX6f7R4
         W2Tmghn6vw3UFGuH2qihM+80B0yki0QIoZ/XFeuc9rq2F1u9Etdua5KUqsxEW1gzxOlc
         yVsgrn4/3PU5V7u+FXGxLWN2qXPNRQu95rVo0FpaHx2xpIjambFICN0EjQ1HUXtBmr4J
         S5qqZRRkoz6DVpKUED1NvUyFz2JPs10lvaBYe36UjSk8wS2TivU0ybBinTITk+yq83ks
         medQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750493; x=1790355293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0V52zqrzqSXOjtcPE4YmALB+veTpIXrkLmMEtjpOEI=;
        b=w0D+1ANhJrchw2RfrVuBGDjY9j4bFQBW7zdMhpPbMY9KncfTQU/atE/XwxslawiqRK
         5tTSuFkc2XMf9yDdffrdp5v9+alv6AEUzI83+6ATYQ8eed6o5V/MyycbWNmUgBrGhlrN
         FN0APxugT6+oqgjW13e620DSa2hRvB+QsJQelJLtuE6S+o/My49893ygXOYMNJ88I/pd
         CEmq9q/+J++zeGlplulr2Y6EeBkIhZy2Bmt7fzVT3kKWgfn1nTIipA7odS8yckv1XIOC
         FDOJg9CpbU3ZonoYM6b19lvG60jeU02/PQtLF3jDMiMh95xDImUpUTnsIJ2Fuiv47oRF
         Hetw==
X-Forwarded-Encrypted: i=1; AKwUvBxDhK69iCY1Sj8kZ3il7cJPh5b3o8MQYJObd2TzHJRnTmH4/aix65YjyCXYmoW13SjDU9WjkS98rE9yHPM=@vger.kernel.org
X-Gm-Message-State: AFuF++lfdpX4YMQdk0weap/J4Wq/C/gSqxfbVxmAD4ljVIO9uhejRNsJ
	1Sse0TN3qXj2cJa91L3MQ23PvbDWpKjnSAfGBvL4U0uut5ckOBWXMt4g
X-Gm-Gg: AYBFou1xUOqoI16Wg5bEcHvo7Vv0XlX/UxKSrY5Pq43LOSIo9fqit9UenRiE9NZwbDN
	LneUm0eI1e0RG7KxQ8ZLx5RDXV2aRXUQyfUmnBw+FFEWUeLnx2biQHfUypXfIoO3593aR4ODpC9
	mNXj2ewv8C3Gx4efksHqt1HrnJzuTqjp4EczA8o84cXUdUYQ+m/NIOm3UbDyik2+uJAAalVM92p
	oBO/w6aOB6NT5IsT+T+rWUxLlzt1T3YG5wOSeiiaSsEEDTHNbdCDSUXyVWib7rC26gWVDf7GA4D
	X7+RC0oz7CGkNaN4JKZ00q1lo7Q+RaQassEEufjCm8l3J2w+tpk1zEtUFHYqTtnzPDuSy59rqp6
	95EAGNPNviiiN3Yv2TH4zkHJ+sLDZoOt8CyCJW24lDb9tXQ41IJeEWnIIwYlH6+AYSmDlPLX83D
	vW57IxMMx4O9EKBP5b7/nxvTYJDuq+JlK6F95Dc4BQm9hsIzI4kPfFpC3tgDsM+m8fmKW2bqd00
	g==
X-Received: by 2002:a17:90b:4403:b0:39e:6a81:f34b with SMTP id 98e67ed59e1d1-39e6a81fd03mr775333a91.37.1789750492700;
        Fri, 18 Sep 2026 09:54:52 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:52 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 3/4] arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
Date: Sat, 19 Sep 2026 00:54:13 +0800
Message-ID: <20260918165414.1129076-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pin groups for the I2C0 (PH0/PH1) and I2C1 (PH2/PH3) controllers
that used on some A523 boards.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ff..0ec5d19f7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -147,6 +147,24 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			i2c0_pins: i2c0-pins {
+				pins = "PH0", "PH1";
+				function = "i2c0";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
+			/omit-if-no-ref/
+			i2c1_pins: i2c1-pins {
+				pins = "PH2", "PH3";
+				function = "i2c1";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
 			/omit-if-no-ref/
 			i2s2_pi_pins: i2s2-pi-pins {
 				pins = "PI2", "PI3", "PI4", "PI5";
-- 
2.55.0

