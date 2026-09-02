Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494A847DD50
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387436; cv=none; b=MCP5Xk8JOTliYRE1dVX6PnWclLJ8oRQ9/n734l1kHSwkekhJUR5oTCAuxUxNkV6DQjoVRB6so1ZsTB0BY5TBGGkwr58Rg4/YdjcPDX2rhvXTwO9USx6UC28Vooek0c0/MrwlfoF+RJVdy3InKxk2luyCwur9GyJEV5JmS1lazVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387436; c=relaxed/simple;
	bh=KBQhq/c+LMHJVVAXAOkUDjcq+u+ONWOcVbdfKT0tUFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O4lC1q8eNYpLLx+ytuMqyJmhKUJorLffEpLoFY39qGKKiAdP9b58vkPNqCkE2/Sm0Bj7W2rKVEbLv+0aq9HBYJPLlktMPuDcWSQwFavxZmBuu6xMUIpVm0EcIM7WCfbcxH8Kn79BPJ2TJHG3emGnSQkSw+ta7PGXwrDOogoU6c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6IwlNi5; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6IwlNi5"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8541875f596so780562b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788387432; x=1788992232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=68TMRCoJZibya560Gslbsv50pFJcZXRG1soThBLnF+s=;
        b=c6IwlNi5cup49XRgRPDIGqJMVAkJlo5Kj2oK6bX05opADhr3+2hGH519r3fJW+MkwZ
         BCSzfy4Hq7vW/ridA+DwwYyqJSf4zxEQuUlnaekndz0Pn/Mfup73S6eJ1FjCr+Q5x6kE
         N5+vgfzVKP1Ea4lw4XBvC+bTVgg6tX1UFl3csjwtItQcA843S4sKqrb5gDn+Egb+hnPA
         58zcwuMOB2p8xeucl41dRAVBE+A2LO2/WLhQ6nnpWcKryMcEV5DJ5MKO/H/YiCNBDMFA
         +bh7NqhurTvH1gMGUPw/fPNzYA3+33zM6IsNRLc/D7tLi6FmAoWfSBjc+TbfMSDk4fJN
         rq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387432; x=1788992232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68TMRCoJZibya560Gslbsv50pFJcZXRG1soThBLnF+s=;
        b=iCSa/pfBf7l2Z9p2kvm624lks+UhvSm4QtGXqQz4xCSLZu/qhYWonoGusO3i0Ft2mu
         FpYJMeOLuTMlUVHsO2aHHOPSD5h/6ZZU/vFH7Op/Dl22p42UC6JhAEmSiHpUx9MhnHQx
         i51C2k6YUU1IbfH+ovtKBivFBxAZNw1iSYvC59VORkVWcoVWo9vEMulegUn0DkfLa94y
         kzehMUbqGH32jCMgOxZ8gvNWaUn/eJhshH4IZ+46JWtyjs2uCKecOWCamHIreJPzJ0iK
         bOwu42cuILiKby2qVYK9RmjAPMLTbEnas9L6Z3YyklE0K9MzV8Wz74qYILsVB1dV1nrN
         QxQg==
X-Forwarded-Encrypted: i=1; AKwUvBwwWX5onRJp/HK/EUTWZEiyPHCepl4+Z5fgvW0rlID8ieBrcvq7rTTEkorqqKL2Bd729mFxymg2hcGdeL8=@vger.kernel.org
X-Gm-Message-State: AFuF++m9ZAKn16KOYGReD/NIkKR+FZupehFP5jY1FxGJGhwuKABQNGJt
	AfAIT0khJ2CoIw/ufNFoK02iIbFuRj/AAh8LiRQcS647kkHWQMxC9lkX
X-Gm-Gg: AYBFou0WQmyScnLqf88Y9hdegl6MFKD/zHz++GvEV6eZTmggjG2Svqfl+4xAuqyLeeQ
	ZPeEyeUntqaH7RoG6GQOwjf4H+SYcj6K0v5o+TCez554tg7UDMFxLp3cEu/hw+ZwipiHDWiNp3f
	/+p8KfV+lKkyXt0WNggLO5s5BVUo8y3T9XLPz3+UYULieVdJldZLW0ROpcGPrUMwcz1fHPDzFuJ
	efWnm/6siXNp0DDsvC+NFvsZ5XpJaUYyY+YGaglQ83MCjf5Bif+xl/gl/JkFFDzjReYSkxnmT/F
	aUg61DzbERreAI9twosXaXuwMzB6oCvwkGtqgdajnASnAVpuTQUci2PzH3jUO7XnpGMlra0JkE1
	sHCwM7LBHkrxR54SZIPnDIAt2D84rsjgdc2JGyZ/AdRSd1SJjNzXCZtphMJpkV9ZOrFaNzuJQlq
	2aZejry2uxGD/9LX3TDg8j7YIc7lCyjkw9Y5nyHMaVVdOuPCO5WN/H0Z+Y/dzOyc72oOuWnCUmq
	3LFGRXhXAjqCxO6nr70zJLnzWrl+ieaEkGcFph0RGCOs4VThP/R0Vequ6k64/7HM5CDtX29Zqto
	eIDGcns+7zKtPe/h5sI4RzZJezyVWU2GIoAzZg==
X-Received: by 2002:a05:6a00:4f92:b0:857:73e2:9105 with SMTP id d2e1a72fcca58-85ed94bb426mr10739539b3a.21.1788387431568;
        Wed, 02 Sep 2026 15:17:11 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003a8fbsm1881138b3a.35.2026.09.02.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:17:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Subject: [PATCH] serial: 8250: Add Armada 38x earlycon support
Date: Wed,  2 Sep 2026 15:17:09 -0700
Message-ID: <20260902221709.340393-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the Armada 38x UART compatible with the built-in 8250
earlycon implementation so stdout-path can enable an early console
without adding a generic ns16550a compatible to the device tree.

Keeping the vendor-specific compatible avoids exposing the UART to the
generic OF 8250 runtime driver while preserving the DesignWare driver
Armada-specific runtime handling.

Assisted-by: Codex:GPT-5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/8250/8250_early.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/8250/8250_early.c
index 44ec209f37c4..265d49850e15 100644
--- a/drivers/tty/serial/8250/8250_early.c
+++ b/drivers/tty/serial/8250/8250_early.c
@@ -175,6 +175,7 @@ EARLYCON_DECLARE(uart8250, early_serial8250_setup);
 EARLYCON_DECLARE(uart, early_serial8250_setup);
 OF_EARLYCON_DECLARE(ns16550, "ns16550", early_serial8250_setup);
 OF_EARLYCON_DECLARE(ns16550a, "ns16550a", early_serial8250_setup);
+OF_EARLYCON_DECLARE(uart, "marvell,armada-38x-uart", early_serial8250_setup);
 OF_EARLYCON_DECLARE(uart, "nvidia,tegra20-uart", early_serial8250_setup);
 OF_EARLYCON_DECLARE(uart, "snps,dw-apb-uart", early_serial8250_setup);
 
-- 
2.55.0

