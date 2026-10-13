Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8744F30CB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897363; cv=none; b=ugoFZQd0d3V8cfHHgPmkqahpDl11S+sXxnF28UbKfwqf6xYhLfo1noVdryi28iSFM8jyn6DL3ffRIOfJ2cEnnfDU4GIEa7deeYYtkuq42sOvq1/yIu+iKEIrBC+MCtdodgzZW1sFBp4CAz1rnWkQodoHsLBTU1ppH6r+VVdpj7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897363; c=relaxed/simple;
	bh=KYNq+5UASvVLUUueo5+fWrGKvfr+e6x8JGly1DJBrfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T40hNX0Gr396ArclxmkmGVy66cPUoKIjH6XlwnW+7EvBekZzyNgvgkb8x9/ph9ctzTde5B9H9eH4mwHa6UyNx3bYbfaYsCy7tmUQP+/9pConPhkcZ75ZBKcjx9Pi5re49W6oaGpl/GrHtN3d4izrLYlmKqxMuQMsR/LJLUJksDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=ksmVfJ1z; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="ksmVfJ1z"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso38502405e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791897359; x=1792502159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ig0Y0bs9FN6Dhfi95iv4Xq2tV5MXRKRrxHG4lzB5XTM=;
        b=ksmVfJ1zjB6zXhKuC+/0i6d7SbEyktn0rIojJakhLr+MFNNLwdmdXMA7+h4jDix60l
         3z04vOak3Pc387gjBE7eZOcueAw3dGs/gqq4RtRf64n/jB/6Jq8PF5j/BdzenWAOjH/8
         ROht4/qeKV/aoz4pcDaluzEdGZ/DTE4Y72baTMFy7tXG7h6eDtiV2oxWrIkW8Bi7Fq4n
         0Ecn9Lzrs5qraNo+e3H/8a5R4equDFwH/QtlwSMFcgLn5vuD18220fgRKQ11NpXxt94u
         a4Gs0+UwwSAK2hSI1UlT/I9QpIhJPsOSDcbMyFaHUoCsDFcetMxTbL5AFuQrsUaHApao
         9jjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897359; x=1792502159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ig0Y0bs9FN6Dhfi95iv4Xq2tV5MXRKRrxHG4lzB5XTM=;
        b=qUCoV2Mg6s+ug+rYuIvCovbDX8Dvyh3uJoTcTzkAvsiJvSr3HXnXn/K7wuCRwhtjFX
         DYjacho35+/z070yYwC+PSoXq2shdS+FmWQPVe52IZYTEylkPv2WiU6VsNe477kxeyoK
         rfHQBIozkUy6UHF7lkv49TwL2sZynim4QTcIQv8RmKUa5Gi3+FIxFTUXy6CoBQRqi7Vd
         gicMXB2xul6kNHC3+sIq3KnJOcqjFxC6c8bmyVRwIZMDcm/Asy/dOH/HguX4GchqNlK3
         E10HKp0s2/S1WTei6jcug9JhcMlIgGwtLYE9nKm9mWic5+2mEcFZkXX083Mo3FCwdS5o
         XgHw==
X-Forwarded-Encrypted: i=1; AKwUvBw1Y6MK+Wd9yFhEc40DoTFac4uwl+NCCyg9yRa4WoxAXcHz1100N/vlqaLtSavqXE1zGDU0e6eljmoxyag=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2j7lQ1iDiAXBUhCgfnrm3ZAJGpvweTMcNsC5mayk+yvWuoHzx
	/0EWFE+brnMl2Wch8GUNcr5LLFdOKyySWXDDfYh+zJzXK9R0nLbmjCSnOtPRGdbPWs8=
X-Gm-Gg: AYBFou0kAe50IZcFYXbPxrhW9Q60Ac7Jtpjk08sh3bMXhtBcyglXzwQju/p6U7kOFhl
	mKO07dVD9db+wOKuBRBV53AE+YNHaJCmbrx92d4vF3t+BYHau7CHsJY09HoLpsioSSonKR+Qfca
	egk6invzJ3ZMbZEYvD7NBHzTVJtEqD8RdnfzK/wSIAmAHGFLuRMmaJr/RVKc3zS5pNu+wWCChpV
	M8n6kjKj0rfjsKbqArQ7oPwNMjoob3CEc9AfW/pVpJ43sVmFvBHnGam4fSqPNQhwofV7ZhJejfr
	27ZS6lj4IZEk05/g5P5sTeSYenqsl0D2Vek03FB4A63cJ/+d7CfpMeUhboH1fBWZf1aACHEdgfd
	jMmi36HE+y0mb2kGOuKopamHiN8rGr3JNNLgGNQA2XTP3lvBG1iVe0VCA+Cum+DjuA2oTTSPxmT
	08cSmZyEwTJ7u6VA35tdR76/yXkwSNd9ioSrf71upumvACXgnorXRdL4LYZg839DV4Mw==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr213743705e9.8.1791897359239;
        Tue, 13 Oct 2026 06:15:59 -0700 (PDT)
Received: from Halley ([2a01:e0a:dcd:52a0:bf8b:5759:6fe4:3105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm520141515e9.6.2026.10.13.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:15:58 -0700 (PDT)
From: Martin Wetterwald <martin@wetterwald.eu>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Martin Wetterwald <martin@wetterwald.eu>
Subject: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Tue, 13 Oct 2026 15:14:35 +0200
Message-ID: <20261013131435.1454019-1-martin@wetterwald.eu>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the VCHIQ interface was moved out of staging, its bus is no longer
guaranteed to be registered before its client drivers. bcm2835-audio,
still in drivers/staging, registers at device_initcall level and now
runs first:

  Driver 'bcm2835-audio' was unable to register with bus_type
  'vchiq-bus' because the bus was not initialized.

Register the bus and the platform driver at subsys_initcall so the bus
exists before any client driver, independently of link order. The
platform driver probe already returns -EPROBE_DEFER while the firmware
is not ready, so probing earlier is safe. When built as modules, this is
equivalent to module_init() and nothing changes.

Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
bcm2835-audio both builtin and both as modules.

Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
Reported-by: Martin Wetterwald <martin@wetterwald.eu>
Link: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..d35f5ac5c2e2 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
 
 	return ret;
 }
-module_init(vchiq_driver_init);
+subsys_initcall(vchiq_driver_init);
 
 static void __exit vchiq_driver_exit(void)
 {
-- 
2.55.0

