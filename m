Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764126;
	b=pJliPYmMg0Jy9WG5hZrxJbBR8tVVrCvqVAxpaEt3+yN1Ml9/RgW9U4GizwqMpU0kUzS3
	 n0oRNgxsb7V37TG1yqdmQbIC6WSUkJNosAq8+AmeSSfvVr2oxKwDumdj95KZhSKztvknk
	 ZvfnwhiZcQ2tA0G4OmRv542HmvSlXRA6R6a5OVoLgEGm1A+CEkPUSFY7TYDPDT6bRpTPE
	 H7zcRALUoVGC2xpKHTa0Z8EwoqM7Mr3ix+c3leTs7JAbTeg2GRWJmcClz7gXOHb77T2oE
	 tevDR0U+i7YVbDGDJpwc247HO02+ZPFCWTL7DXTHfK4jZ7UdX9Ztc/woyJKaOMtVYzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RsXck5C1Oq8QlWVkBn7h9k73lLLAidhPDlnADc/FGEE=;
	b=pBtqFijw2PiLP7wjAS+zPlCMILn7ElgwwGSSB4G3ZTQlY3DFr9iPqzJW9NiGgZZ6XgZr
	 AkXKRnWQ9Z5Rk3AYgKo6STBvVoDUFHv2mTaVKWxM8RriNEf82LdQpTlNVpWEmYpMYSZP3
	 tClgzq7HDxuh0oV2CQ4IH6hsdR6zQNoJov4u9KKULuSlPbT2erwPzJGM2CPIELqq9ijNI
	 GCoGwPgEkXSczvvFu+uYNYF8F9Spgv3ZYn27a1wB+fnhwHHRWoVe0SyVG3qWJJVCOmBig
	 c4vQXOaeo+IFN2LIKA+ZsgoiUjEW8qJYrHyPDhb+O56ENqdR9S7k9tz2ATCnTWFwYdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FOjRiG8l;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E2E606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E2E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FOjRiG8l
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so28074385e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794764124; x=1795368924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RsXck5C1Oq8QlWVkBn7h9k73lLLAidhPDlnADc/FGEE=;
        b=FOjRiG8lDO+3zQiLUKeL3CykWWqHXjih51rg0EggYGBNrho3qCQ+9QQP62nTSR4URF
         AGwy1MjaDybNsOP/MaENuMzkocep9Ax1HxAdqVZ4Xb4fEqbBIwLkTlRTOYKlqKDFlLJL
         3kSkI9mkkvKFSmQxck15WDQyILQt8SPuS6DpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764124; x=1795368924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsXck5C1Oq8QlWVkBn7h9k73lLLAidhPDlnADc/FGEE=;
        b=yC+HyqVEA+DmyeDf/yYKRUKjXO6Ko1obP+GWFv9d7s6Yn2UWXaIl6chIh9phhxAxVz
         zaJk3vGomwFEot8c2MdSLYbN75fbNULpBHAeQcNzuKKMlRsLjXlrvfGZqc6MJ0cuOv0h
         FmfDFH1PJGPz7ihwNBoTx9DHdhZxTJ/UdM6MMmlcYMtmoSLxjYoyupTGgBBh/hLdMuV2
         apR8zFjJt0ZNTvxgh6kBkmLH9o61YM/SXovFrsysatMnBERyQ0iSz5KhZVvxG+eyBGRA
         FkiYZ6E+zMoB4X6xq9mlS+GV+0gU2O+dMfBr4fLPcznHEfyWL/Cu3ZHSNDjrE7oWnqoS
         20Mg==
X-Gm-Message-State: APuU4Z8ESxEQOrF2yupwID2KpT87edWDt+PgCYSuCsleKeavK6ay/Glx
	rsoSHug7bfzbdB5o1na786GW39AVPvkPdFz1RveSYaNaPQ8W1az9i5B4CPK3JwHP2OE6PwsnXFF
	Wl0oR
X-Gm-Gg: AYBFou2L1PK5HAM9Moy7b5c9DNFVEEaxOxL5ajfjBlgYikJYS6gX37nk5Wq1fVWFycO
	jLx6sZkPZlBB6aJUAZdPtoWGCkAUkXPAaDf1WWV2BvHQVSzXk6l6HKM3ZnpDl9aOlvlz6zv36t0
	TYhxLJnDGRifvz6WbdpTFfSNR8DMvG9FxWq/WQsFFiyRq15VMYigBN77TBc9uIAUkR7zFtsE9WC
	5QyKplm0PAJlcFcporSaM5iXQvHi/kPc3PMwFif9ZZtRgFGHa0v2wOprEtMQ2+5ko1DqQvPnWFS
	LLsLt7tyWToiow5Q1x28YH1Q25OC5SwrI4Nou6aXpQVommTTr3dvey5IO6w2AMeChEwlCZ9036J
	jsz1wc/s/05QkbKNxjDA8jyAFdY++U3mJKJxhCSCfOESiCFtTRWpzLf5AJl4tNqa5hvVoUfx5Lk
	IJS3GMwPa1ME/2bxbDUkXFGa8Ussi+LAQvATHrvkQy96FFc5JjX6Fl5cPVFUeRhn5tuIr4jcJH9
	IZP8s/SpeFq+aSfdOf9qvySML9jj7OiZS66fdt4LlpGqZFlRFlHokIpEjz468W2769vzdRWpDes
	fTyXQjMcBttkD5JLsHmDZogY6aTbZfrL4WYnSYDG/pjELRC4yjxnc0CQzDGwCRMhqyQplRalQv2
	ejtJ/ATUvTJkSJYcA8I83U5gs1c+yoxo0yGZliqgMxITf3zvqF5nKJjq3hAFCsJ+dOd0R5UrmyQ
	WeMcotaUZe9dncQ4d+G3fbrOAGkA==
X-Received: by 2002:a05:600c:8909:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb55a83e95mr130670915e9.24.1794764124318;
        Sun, 15 Nov 2026 09:35:24 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb679b7e1asm186568415e9.6.2026.11.15.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:35:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>
Subject: [PATCH] arm64: defconfig: enable STM32 RTC driver
Date: Sun, 15 Nov 2026 18:35:15 +0100
Message-ID: <20261115173519.2708975-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the STM32 RTC driver as module. It is used on the
STM32MP257F-EV1 board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..40b5c4990c4e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1389,6 +1389,7 @@ CONFIG_RTC_DRV_BBNSM=m
 CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
+CONFIG_RTC_DRV_STM32=m
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
 CONFIG_RTC_DRV_MACSMC=m
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
branch: arm64-defconfig-stm32-rtc

-- 
2.43.0

