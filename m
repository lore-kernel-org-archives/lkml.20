Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18FF5625E2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184064; cv=none; b=EFgQPcKmnKUf1q29Ucd++veYS9TIocsAkK8npykFA+bKNaI4XukSkHRKbg1U4LFhnzQxcQ8sUSVXdY6mo2OrfRi0HVBHiU69R+b5/NmDxrLLl4hW9dpopLgHgpwHv/Xd5mvFGQaskVQvc79vThrNkYS0AQF2a6+5gswvG1WCVZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184064; c=relaxed/simple;
	bh=wbzWufdH1+05XeIF2UprLNnPXLOsM98m2VskYJzVc3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Yg/yVzOgpS0PaFW0KGWP7MSMkpMeyTbMXkjnwyE1lTI4d4ujDCD4DmPl8gPoSCdsRWzWFnUHw1oyXqglEQDyq23MGvzgRG5rjQN8xMphWQFTFYjiy6OAWtympQeknz9GUNLhFoTTeaUJtJsxmHmixtPAvpBPQbXzChpWrmZnFHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCQbuKY1; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCQbuKY1"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso4103696a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184062; x=1788788862; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EZphEP1aVBZVI+sCUTh5FGIjIPbG+M3yCoLuytV4vxw=;
        b=bCQbuKY1fv4Coj+wORJliMtgE5QJIvAgCBXcNJrtdi/BaUYKnnLd/fxSONoBz3LKJv
         MoIhtXa56/zImuIuxEOoo/4uSVJuEb0nmsDKkCbuywlwlYPUTPpOcLMGWhbbkDmhFGzc
         VWZmsXQd28KdvPzN05/Arrdq+PdC2bcUO8P7KrciQObhspU6Ks8UCwBj5KA1zvYmXjfV
         HFU3YXq95Sv0S9BhK/UA9sV0DEmf30cWpXNF2QZBH17BK9fKNi7ZYzO3UIWLREDFQTwG
         GAWFiRYOnrp39kHu+lCqcl9SeU41I7iMrADNz/NLNiDF137MMxov/xvvluv42qfOxxUf
         uKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184062; x=1788788862;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EZphEP1aVBZVI+sCUTh5FGIjIPbG+M3yCoLuytV4vxw=;
        b=On8ElFT1MurZHD7udEcwYDpSuCRhJXuKx9CzJrE7+SXBiSiJeUL3halLQkPZTBTjKv
         K2xwKZORMwtMIqvg5CJdpy8+E69aNywG+4uIj3JoQwDra2HQzs1vqmn6LDZLxYgF40kB
         VguVquomlkgYZrKY015GIxVBshZcNTZoYsPk+JTcfdTP2Nl8ohRmjNCSijUEWJLg3fds
         +VSpQjWw1UutaB96+js6iI9cH89du85/ROqntm318iHJYF5Lc4wN6IQuEyoLUEM5G3y/
         +PBGm+7Of+NKXV4tGbcfVq/1/sQYK4YhHQHfU8+V5QNXZRYyi1LAf2jx/HbsKb/9qDx+
         R4aQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/IDQIv3oClds+jrGnJhnc4w4zGoHwfvb407K20rxgQ1SCfPRADPuR5LBCZkLlG9uyD07OMf9MtbMAy0c=@vger.kernel.org
X-Gm-Message-State: AFuF++nK+EPWI6frQuLDYKOWtuXDhabSPdkTklqzjS/cNVDirF9aUIJO
	f0GaklV5BSoSc0toYmNaj9hUGNf9ikilLawjhHTlK8HHJN/2yFYe1v9f
X-Gm-Gg: AYBFou2Ue44EfMzZYKv9ERCR2l0rKPsFxNCNpNhatMnmzam7y7kKXF0zzj4HzE7oatj
	nw4rlaHXAtytrO1UoxVjnKmtqfwtO1t79eyBt+Scrz+zzOn4B6Ja1qYgqstpvncycta2tOeEEt+
	XEm5Ia6VoF3bQbsw6lDEucZVsrTIvyGD6v5rNyzgUeyC/BOys3MYfDjwDitkvXMtlOlNZRysEuH
	klywwKEjJFDaymff4+DzMzffaZX+qLPBMOtG3GYTyZiLDWXBzazguHkZ+tnTqGGk9KLSrOm1Zkc
	VrCvhAhr0wJrdemj3J9MhDjhFJJNpKKJZwut3MLDE+zEEuC11wmYAvaY3RH4jFcq6EA4UHfOStk
	9NXoAWe0gW0GLNeesU9fc5R6+L+SkykwfaWrnLy8D0RS789f3qjjlclNw4RQdJrvfCIoNV29hCi
	TcMINh+IRE4XM1m2Fu5z5qwTcVJUD/S5t1OhtbcPRrnha+ujQYKfw4hVhL0SqggV7f5MQhOI5ul
	S8uqovFHeRkemeh6CvvYqQ1gOcL
X-Received: by 2002:a17:90b:1d0d:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-398da6f3ec3mr6720331a91.11.1788184062144;
        Mon, 31 Aug 2026 06:47:42 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm22051985a91.8.2026.08.31.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:47:41 -0700 (PDT)
From: Mike Hsieh <mike.quanta.115@gmail.com>
X-Google-Original-From: Mike Hsieh <mike_hsieh@quantatw.com>
Date: Mon, 31 Aug 2026 21:47:57 +0800
Subject: [PATCH] ARM: dts: aspeed: clemente: Remove nct3018y rtc node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-clemente-remove-rtc-v1-1-84fc5787a6bb@quantatw.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBQFrxJ/nWAKGV0lWtTvVR/KQiWC6O5Jq
 2EWMw9FBEGktngo4JIoh89SlQXxOvgFSqbsZLSpdWMrxRt2+AQVsB9XRmI1WTc7xw00j5TLM2C
 W+792/ft+WksGJmUAAAA=
X-Change-ID: 20260831-clemente-remove-rtc-d37f77c8e0cb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mik Lin <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mike Hsieh <mike_hsieh@quantatw.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788184083; l=1130;
 i=mike_hsieh@quantatw.com; s=20260522; h=from:subject:message-id;
 bh=wbzWufdH1+05XeIF2UprLNnPXLOsM98m2VskYJzVc3M=;
 b=2dMXHa9BYQMJWRIeFy9+pcKa28XMr7eWy8ya+OnqUgbtTebVuhdxMyXh+CIHfidxvK2Vo6CpH
 UpkwbQS4uMCB4BS0St4Z0vIHonO6AJfchblqTsk+pnKP61dsaihR+Be
X-Developer-Key: i=mike_hsieh@quantatw.com; a=ed25519;
 pk=DRIErV0xX0KMBlR/irAsbuN4L3egitHbC8FHruUH4HE=

The Clemente platform has a second source RTC chip (PCF85053A) that
shares the same I2C address (0x6f) with the existing NCT3018Y.

Remove the statically defined nct3018y RTC node from the device tree.
The correct RTC driver will be dynamically detected and instantiated
from userspace/early-init script at runtime.

Signed-off-by: Mike Hsieh <mike_hsieh@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 820d39a92974..51e90a4fba0e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -958,11 +958,6 @@ io_expander3: gpio@21 {
 			"",
 			"";
 	};
-
-	rtc@6f {
-		compatible = "nuvoton,nct3018y";
-		reg = <0x6f>;
-	};
 };
 
 &i2c7 {

---
base-commit: bd35c4d64a566319bb5a151384eb9dbdf4b44eb9
change-id: 20260831-clemente-remove-rtc-d37f77c8e0cb

Best regards,
-- 
Mike Hsieh <mike_hsieh@quantatw.com>

