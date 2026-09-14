Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455CA37CD2C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375639; cv=none; b=om4ibYR6xjtKFGziG3GjE5CxPT5ZwmI6TXrs/nRNePm5Xpa3eyxcyZAAWKhZqxq4Ea2olRMUTqnz9yMWznZs7LzT0SyotZ94o2QjXthWyoUM1vlBf24D7husj775fB2pAF5H7zH4qUAOfYNcxtUJSK3RS9QX1Ukg+sAdGWewXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375639; c=relaxed/simple;
	bh=xSsTA1+Iig8rnrr46UdcEnmTqyfP4pnCIpRKT/lZv4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=htEsJhHYCgu9fBOHCGCdaaT90WRCUMQ5JzxTwfzaiKkreWWlO3ogfRWlp139fO/esbMr7+Qk419jTtbaYfhYktok78bgQCFWLzT1c3kl7ncP97SzC4V0wDwGZHFO1nAdm28PQuCLoMf+4iGlPH90oPTB2UbJBW9gMYp6waL8Lsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=DWhDb4yh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="DWhDb4yh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so10054075e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789375636; x=1789980436; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BiGb6WiQWJmFrzRKswfmgWeyhlzVvwsEuctPqCr7l7Q=;
        b=DWhDb4yhvopwPruP5Q5F7OZ55DAV/JpMAJOdPFaA24t6+9ac0cAKjYWxHgYAPhRgjj
         yVmNB6lJeldStVpTsV9FM4DdXcSYwFA8NRH6jrWEzWvuQcOhHKPUm0/uab/+lAyTQjmh
         N0B5HZd7SzlMxUvDfplwpTKwnyXwJspCFN3l8XZs8jqUhSwL2pgP338t2nmqLzF4eesJ
         7NeSQhjXIp7yk3y0coMmcg7uW5uSDlZa08N3oNLqgHEOzrm2x0qWtpazwLUTfaIRHnSF
         4M1UlyQUrsU+SyE047LTcUsXZPHpuVkBj+f88rRqHpAr4ODCmomaroxdZ890npZrpmP9
         tifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375636; x=1789980436;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BiGb6WiQWJmFrzRKswfmgWeyhlzVvwsEuctPqCr7l7Q=;
        b=aX8BwaQQoW59lG6Y4yfRGMKKVRzrVfV9jusAz6VeubS6hU5BwDQa4Bi+YEMhaOnHnr
         I9ggpx+q1FrOWBiEGsQ2a7TuxiIs4zj37Gci3IoRk3SYvLHvdKkxlSSRBRCVZWH77cBE
         cwYBayrf5uSMAxSwDLNqZTjyZKBBecLlHdgIKRA5EDpJc6Me3ajJ1DKTRu4abOWwRtxl
         2cVQCgWlvwBReYyKDd4s0GXqRWwDg4fBZDfkg8EGaEJoL9G63mtmIhEbehVBFay9BFdv
         UJj1T1Ikqg9bfJgVOw7WPJL7863rsT+D276dJPhWF70jPLi0nldUw1JFHoOyjgvt41L9
         nZ0A==
X-Forwarded-Encrypted: i=1; AKwUvBylgdSvW4ebwLU5hHIqz/Wmgf5u1dU1HdjuqkAujkp7CybK2uZk8y32yfgktJgqtBIEuWn9M0lSo5R+xAU=@vger.kernel.org
X-Gm-Message-State: AFuF++mA7+5iIW6gvyBbhUcVsLoXmPNGl2XKQT9JGHlz/561evWVAS/w
	JNUAkb9z6SGnjty0Cj/m8ncjxxGHGKZa2f3hwKICKBhnrpPO3eh21oQfwiJfdy3IN23qSDQMgrm
	itplFECc=
X-Gm-Gg: AYBFou1l+ZBfj+Efc9bCuB+CKJllHW+tMMUz45r2ZYSaIEEwreOOMh58uZ4eExUfgTQ
	t7JhvuIA/37xNAHI8C/e8yrDag6ZkVs/P1OfZuDLJsShBmyWCS7hXPZoPMVRavTAvMe3661JMEY
	AyfuRUnvla7/sfUMnZ06BqVqU/iva3EnQDxANno5JdMfd6z4/1rjfatZP+SPzrMl7MRtlRDybY1
	1a7aNFyT6OnLgYZBE7+NixcIYccQyS38RX00dk6apC3YuDbFg8n7c0Q0609EQd8bQ2cgbRnbcZn
	fbV8n23J5VkPUl2jTQPHWNXoOenLN6tiRcOQlgEl80R8UMx2veOyYHqOHwoYQOj2EsjK3SqMwCG
	RykntmkoaRyGy//FxCZNzEEri72bauyDQuAUiS2fMWNRpJetTkEX8PopIhUMvgJo8D4nXsIHegd
	W4MWO/5c9p2EQUygMJsTgfiQKEMBrryflUUVnHRT5ZS6qBk2PseegY6utWalbQ3qrQp2S5dK44F
	5+PtxgldmcL2jk0Igs0
X-Received: by 2002:a05:600c:19cf:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e7a663d35mr22293075e9.6.1789375636366;
        Mon, 14 Sep 2026 01:47:16 -0700 (PDT)
Received: from alchark-surface.localdomain ([146.70.184.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6cc11607sm199520805e9.12.2026.09.14.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:47:15 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 14 Sep 2026 12:47:15 +0400
Subject: [PATCH] arm64: dts: rockchip: Set gpioN aliases on RK3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-rk3576-gpio-aliases-v1-1-ce5f86f9ae0e@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IWqPxKuIipqOOLRoyKgXx7
 k3r8i3+P0EoMAk0yQmBDhZel4gsTcBNdhkJ+RkNucq1MtkDw6soK42j5xXtm62QoHHKalXXfWk
 GiKUPNPDnf22727L3M7ntt4Lr+gIIVSeBdwAAAA==
X-Change-ID: 20260914-rk3576-gpio-aliases-9c0a6088b59f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=alchark@flipper.net;
 h=from:subject:message-id; bh=xSsTA1+Iig8rnrr46UdcEnmTqyfP4pnCIpRKT/lZv4s=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQt3zKl493uJBmRTYsfxiasex+ntehC9OljXSWFERvsA
 mfd/1JyoWMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpblZkZPgc/9Zs9pLzqxY/nhGV8HvV+a4TP/0nLDXQdtWPW3FtodMhhv+lMQ1
 7JS9MP6Y6Ke9bbihns0MOn+PB0x+cbJRm7zq7/DcnAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

With no alias, the OS is free to number the GPIO chips arbitrarily, such
as in probe order, which is what Linux kernel's rockchip_gpio_probe() does
if its of_alias_get_id(np, "gpio") fails.

This results in GPIO chip numbers arbitrarily shuffled in userspace,
causing confusion and pain.

Set gpioN aliases in the SoC .dtsi, just like other SoC versions do.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index d418bfc04097..e87ace5d05e6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -21,6 +21,11 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &gpio4;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-rk3576-gpio-aliases-9c0a6088b59f

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

