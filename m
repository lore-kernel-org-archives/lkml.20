Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDFC36BCDE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821490; cv=none; b=WVOwK04S8INLkHC6aV2Na3ODrj1sA//vfUndDgmWxIWZvMIJvFfbGd0fm4GPqNa5LVBFi8gPyzDcTPkkbE1b5VXrtH8yjURoyirZr+aIqe0BmxZbMXkOH3WIIz89//U5G+Farv7ZpKF4BQpq1xDlIPyhubvneThO9UTpKUmUwAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821490; c=relaxed/simple;
	bh=OeSqZmhX2GeSBAZfyEhqUQJiD0Vs3BGdCEj0RuH2KlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7BQPBQlh2OHOLIN0SulQUTgOTvBCefDdQd09txNpGr0sSaCQklrQ2XWq6ekF4xnfzP0rlA6XamSAdxw+/JgJ8YwwSt2KTAobrL0IbeMENQJ5I0f+RBrTeNrj7mkbrLSkr+ODRskJiSZK8piasYjxvrwqh0zhYrQTvQ/pngckNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FD2KcB3N; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD2KcB3N"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so1847032a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821488; x=1791426288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7mGoZW6rOuJjzujzCIVEJDchDchUE3FU7yafH4ekeM=;
        b=FD2KcB3NQ+lRhEVmGOZbw3jraKzfVnlLCTwyoh0LMQXma0DqPHn+GWjDv5y2wqL9rO
         jJsJjGNTMrv3LBnyLjCHkYMhz5Qu8aqUqykIPPuWWiYovfzUlwCxFsCg3xECUTajReyJ
         /7Gj1BFLGX+9FteXMHqKYPRIOaTlV6Ausou4OwORc1I1qpKn60tnUL+DVhH8MX3YEmTS
         NBAI1McJnFZ3zOQSwjfV70VBHsSYrlCeNA64aPP7X/NwxOZupEYJ/d7xj7vKtTZ3J17z
         mw73FtJqb2j1V79D4P3cvPvosM3f11y03jyv7jivDvr6rMTjBdHbxUcDT5AVY9fAmUDc
         B7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821488; x=1791426288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7mGoZW6rOuJjzujzCIVEJDchDchUE3FU7yafH4ekeM=;
        b=njsv1OOlJRHEqwD9s7jh2cgx8Y1i0MofIiCeKtmsO2Yx28Ix+eFcdGc0eOe/peIBVD
         Bn6iZGXEB/WiRChw1YGZ8qpbV4KAkhiKUfjfkS+sVr0/maDsdjj18BNjlV+YjeQr50fj
         7IP6IL/eugNNiCqG7dfG4MOYuRcpxtOQw+0MG1ImCZZJZCKhEUqXE0QhChf6WSFwup4n
         gNyk1nIsx3cjkg9aJWDMmQyA3KOyCl8hRUP9ah70r5v3T5SUAO6RK4c3xTWGIPU5zzou
         zeWthi+DBZ9OWi4p2G14ioayxOoH2p8/STFV9pVqtt2o2FpFiuUYo1KYfAPWdooasLlV
         tyQg==
X-Forwarded-Encrypted: i=1; AKwUvBzypXc2uitlMAuBIGxjf+tKCC+AsxnpTusyuR5oEuYU35UPSnBknvaTwp018j5plEs/5v1ZtfJPkzWIlE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZnHkzN9Ixggs5opybYT99YOryPsugjo3yAyQlOqUHjCWgaTIu
	1rwMw8ycrVVkKUduQFFYh5SN3Ap80EIPebi5zaX5+Q3J/nFFNZvELZ/P
X-Gm-Gg: AYBFou3zvtamyeVKUFnLpUNlSwPYgmdI/9GFX8djbYG7CS1kRSpwf4PGw19u5kZlPEz
	kHawWnXwwkowzTxMGWw5DLCMhaJ1b3i+C4a4uNklt/AUExm/Y5SLD1VGn06Y5YCahOnY67TdJz8
	R+rRYBcV5SI2I0geK8gsIifjVCakcGF059Fs7BZyDh7JlR/GRbut6bNvvD0yccZLkwClh6RE7/g
	BaodMx57lChlthf9EJv/cNRrFIV+XEwDMQBZGTJiNpuJEPhqmldJIhL6jtJV1mY4eCG1KhvQ3ll
	UezJGN0uofeO8A+GCjxalWOItCRNxVaAFotNmq8i9J33nxCwdCwo2OWXE4ztyKWiJHlBUI6eW9H
	7ej5X9RNUyJoDNR1w+3epMiHzKUYcL7PYtk6R71Qbwzb0W3+gkK2+qokDKXROjqsMvNvpK6f7YV
	1HUT+2sSzYX4xxn/zyI6J7K1YWctFmMKZeR/+9NLZwzTISiGyxmnkPHiW00GG2yyU3EdVMSomO
X-Received: by 2002:a17:90b:3c4c:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3a4f2afacd2mr752019a91.2.1790821488332;
        Wed, 30 Sep 2026 19:24:48 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:47 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
Date: Thu,  1 Oct 2026 10:24:14 +0800
Message-ID: <20261001022415.913959-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
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
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
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

