Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0953DEAD6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176002; cv=none; b=tf3uh28+i7KWuXIdnaqPks+Nt8brFG12Uo74AvMrql5mUL+T2OLhVeyoF9lUhvXgq/OlFeqh8N+tSJkw0Kh/2XGOICu/UemPJhQ9PeVNC3ZdTcKBm7wpsF1qh1pfEl5b6sfTtf1PGy3rND3La39a74M4cCnA5/EBbtmpRSbArCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176002; c=relaxed/simple;
	bh=ZRo1GcG9w93sfzG7bw0j1Jl6KpqxxS3Chp+d8qV6No8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W07NFFH6DeD5BeGeMUqCWIOJe8HQifpErPlhyHjkTUCDJiRReYJNA2R6LJ9VpKQdwWMpUO3OXPXNPwR4YPejJonSzT9cG60HM+UD7J07kMeHVUWeCQgVVPK0pbikIh1Rp+8+EihvZlt5/LrnMw+tjR/8REwL7anLZUsUemV7mnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTlILffn; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTlILffn"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2759362a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788175999; x=1788780799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dS9uXLr3qezTsn5dVmuEZ66xzV07pi9cC42Sze/GMZE=;
        b=NTlILffnbDpnLMidxobJVvhLBrH23duW6ACu4RY5FeECbf8FLsT37CL0dx9AUABgWt
         WspEQYv8a0QFw/csU22QUbB/0EofD0mOemBl8SFF93fQin539wfQBEWJzw3CcCUVJCwU
         8kedMcMIGK8TmejIIaZa83D/YRm5QPTee0sFJYCYR9yk6FF7xbxunlqfpC6J6Iecv3pp
         3De8UnTysPUbiblAxW/k862Ez1g1y1c89+msKdGmg2QJOH9sU6pDTQTIbO0+NuDSLgOy
         WDvusx2ubM9GgLmUaWEEsW20Xjl2Og9I8430SaON5gz2g2oey83bmdy54n0p8Zdgu0me
         P1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175999; x=1788780799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dS9uXLr3qezTsn5dVmuEZ66xzV07pi9cC42Sze/GMZE=;
        b=Rbfw2NN4c7g37oztwIng+zFpTZa8Ov9rmbUAEqJAYE+En3fXiwrKOwGy6S1b5Ir9Mn
         H0qmVEymQDwlloxaw3Nd7Hzy3B7MzkXt/dVUBh7cjtiInhzrsMtHiTtFaOD6h0ze5Od6
         Sk4Iv+CL59UEEiABusH/P4TazVFfm56JVanZto24t3qdgOsde/96fdoCWYN0Eq0tjPWO
         rt5ird/aL8Dz6wrGkBAwr5otoS72zmATcNOMq8q+yGVKTHjgTg2Au0MQagWbjvpEK+a3
         Q5FQmkDgC5rP9K58OdiOIBqo6IgMTFlAryaFI0jfrPBzkZ+26gxk3Dl5HnWRbWMYIh1R
         Czng==
X-Forwarded-Encrypted: i=1; AKwUvBzQ+xnx6pdG5jJfEDz5Y8zJ9OcVq7WXt3B+Im6YBbZO5o25s5IL0ZN6AOBa829nOnrCZS64vJmcNnasvgA=@vger.kernel.org
X-Gm-Message-State: AFuF++lJOrz+mLsBvu7cj1M5GAnEk4Fewb8DS4jCZQm63YOcHjbdU7c5
	kaflhQHzNG+UplZVwbP1gGGYPhfyxwTmD/DI3AUYoyc4QPekKzjGkp2y
X-Gm-Gg: AYBFou1LLfyXUog9of0KaKbLsOExdi6XeE63nvSAhUVcsftA3N3Zz9f4ZcvooU3T5XX
	3mdip64PLq4MGNRyPlmuUy5UGfSl7xM0kv3ZTPQRQjFh9NtqMhzeXDLBAWWEoaLIvv2ZLGENz3b
	TQvsCQzkG5c0YjKqVakdxKf/criinOnpQeH0x0jKq4ZxsY7OJo6+rQhHn/NMGT4dfsHvA+eALmr
	EQQgHOY/1AGPyNov0C/4QskCJIZO9mF9TLptdmoXQ1JiW0oc10yoDKpuom0LHzxbUcQE7Bbgyug
	WPrFjGKZZ3KClZF2Wnsv3PL4wHlTjmFjL4TovUMslgdoucPoFqOnVUZP5SwiuoJ5lgqMFGQ2Gta
	drUw374yTlHhlGDDLptHNe/C3II/XPplQ3LQqgisH9CjgxuwYv4VgS4dHKU/8JZWkg5Rm5ySzcw
	2rlptHh5BzyZk5AEt36fNEgNQ9bmKH6YLgw2qXUlw32IrPh8phahdMweyhzpx/NB1m8FOx9f4ng
	AuHTRJbBPzChdrE14Gys7mMdpYDR0qxxf9+HZr8/PjmEycDwq+5gr91B+6w7XfV35mn0m1HYBUh
	La4ra33ZZ8LvUSPbsUs34oD4KOWaCOEFMds5cFQCNQyKneA=
X-Received: by 2002:a17:90b:564e:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-396d0ee7010mr36676598a91.6.1788175998887;
        Mon, 31 Aug 2026 04:33:18 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:39 +1000
Subject: [PATCH 1/3] arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple
 Silicon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-1-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZRo1GcG9w93sfzG7bw0j1Jl6KpqxxS3Chp+d8qV6No8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04oMJE42LXo8Wb8t2cF478qDHBbL2O8eXvXK6sppi
 xrf9ea7OiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOdVc/IsO+wxZql0dWHOg3v3+Zhf1SSpPpFdL3D47ja+qai5Xnyzxn+Fzp47bW
 +9UfwAfv7oB+f6lvnPa1f715rdE43Q2VuygRdFgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Silicon Macs use a shared GPIO line for all speaker codec
shutdown pins.

Select HAVE_SHARED_GPIOS for ARCH_APPLE so that we can use the
shared GPIO proxy infrastructure for this.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..76a6a0e6ae4f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,6 +37,7 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	select APPLE_PMGR_PWRSTATE if PM
+	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.

-- 
2.55.0

