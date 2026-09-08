Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB94492E23
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908388; cv=none; b=N5+x/3C3B/akbogYFRLVh+5XVefq62MkWwWnZzoT1DRfNlN7AcwiSN2C9VzRia8813HtRHQcMy3cFU+geUgU9X+kRXEpTAxsZQlNbKCV/9GwlO9/+mJ44Zthr2bRK/oxvKcICO7UihL/FDVP9jF1SGqljlm8QDa/MCE8K8W+rFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908388; c=relaxed/simple;
	bh=t+TOJ9eQ1Quf2t+eJx0wqvdgljwm7WcRyxNM1fEnmK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpOskihykPQDFk2mdIdIlv/P0kRsY3So2gl0uP1uTUQI5oQ482G9HMhpa2JsrFPDy9w7j/FYkHBaqnTuU4faB0BPXFM4rJw6GNlUl9+KITUEGaEFlqo3yKYwtdgh07gy7MKrz+x1MUe6MVoTydUd2vW8JsATGxlmbyYzxAkWqyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzT9SM13; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzT9SM13"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so4587712a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908387; x=1789513187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+TOJ9eQ1Quf2t+eJx0wqvdgljwm7WcRyxNM1fEnmK8=;
        b=GzT9SM13dskqKNzu7lKjtWeymEnjBxQUNdvin5ehZVNpMbJ7lHEwf0IwiGrSiFPhXg
         pyMPDcaSoyZC6MTDObtZKhmLnGkgccZjRU5OiK5NjRZVs/1XhNrdqlo4Bd8oEQVzwn6P
         mUbb/fbRo4opLWH0HIrCaJj7qnM1w6CThmzYnGoBrDFFTyZJvimtS60N0BorRR0HsmCz
         EPshzVP7MDMOvtc6KD3EyA6XIZWfIvAmIttxVHbZPmfg3B6SBaAgk4z00YpvyHYFLAqi
         rMUx7s/lZp8RbiYWEkVG+Qj5puk8NmhCZAGmHjCrpc8yOIibU4e8GSppBWsFEtL4rjNy
         9WDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908387; x=1789513187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+TOJ9eQ1Quf2t+eJx0wqvdgljwm7WcRyxNM1fEnmK8=;
        b=MfHS6YlOOfJfOGQhhy4I6UiWbmEUdQljwFqJBgMGjxSnGoOUxG9AqeJMXpKsEq5uXn
         jtgaw55qwlelCoH8xK/65QaoXCrNP6WGj50RV2cIq+FMR5W0b3j0tFe1z3yXxf51w5cv
         YxxNqFhrniu9sIxsVo/zY/FSwMGJc2dhm00Iuklq2BHrZXyeze6Q6fRCscBBxidlPgEJ
         1zmSbGEjm5/fe1b+hUJTekpp1aBIpTjntkOBSCAzkKzDiFwe+aKrXTMS9pUKF3/D8YxV
         s+ZMfu2VRkOBjugPxopomr/6wLyjjXO9Fcps5gvdtV0m6W6eg1ppT2qyQ1vTCxgsoJE6
         kTCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoUOcNkzwv0whL25zmKhdncUMByncCR2myEGpqXS6Pd/7sz7Fsh/B+xEMDQj2qLrRAe25xqu3a/1hiKII=@vger.kernel.org
X-Gm-Message-State: AFuF++n9QGpYRLtXxruCz1VnG2aBdQQGS71Vpjk7OheFKxWi0hY3qBKa
	A/ygFbC91gtZGjTyqzDUh2wFuPNthgiKTYsBgdeaD+FQ+O7m/jNKkN7jBw7U30Yhwg==
X-Gm-Gg: AYBFou17n5n9YGf0y9Dh9mqvRDbWfTwppoa/Ad7kb4xCJVv2GNLgho4sY17Jl3/SpGL
	wiJPh/ETC2s2By3ueAd2H+FobvQkAmaXOAgCt2+sUBRUal7rF7CncdArj5hsgkABhqcR/UK/PSe
	W6CVrHpumxawBUudV2zjUSyXMjcYKFURg75/YEqQQ+mPSkAIy2ltIvcJGYIdFo3dhhZ1rzUbrru
	WaAo/h/G0xzGCpxdQEa8pPCZGSfBeLnxEh+SjAdUA8qz3m/iuLg3UWybvno7rNEmf0oXUmvIJcg
	gZgGjJSPVJCaeRq5ZQAE0JPZobZV+YLY/JKXXpLG97jlPBJI33+9ajK1CYTt+Ne6OZEh8/f1yaQ
	/Qsqc/48KwcgULK4XSNKmrF6femFg1p+zT+Zltk4DzvsMWa/8b0Ym79zMU9oBuVs3b32GlAj1cV
	THEmIwLiFg0+HMEt3F2IGxeLUAa3TM69yAZBCVb8CE1cpXJWjEP8jLGzD6pYOUy32DeptlqeiB8
	lZWYiR4a2MkJBzd
X-Received: by 2002:a05:6a20:244a:b0:3cd:9f0b:f788 with SMTP id adf61e73a8af0-3da39d12327mr46169716637.12.1788908386855;
        Tue, 08 Sep 2026 15:59:46 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:f6ea:9d29:b387:9ed5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc464393760sm4897059a12.3.2026.09.08.15.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:59:46 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: andrew@lunn.ch
Cc: hkallweit1@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: phy: dp83867: restore the LED polarity after a soft reset
Date: Wed,  9 Sep 2026 07:59:41 +0900
Message-ID: <20260908225941.105431-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <252b331b-0ae8-4248-bcfb-5c63d8c2b7fa@lunn.ch>
References: <20260908114901.74637-1-donggeunyoo.kernel@gmail.com> <252b331b-0ae8-4248-bcfb-5c63d8c2b7fa@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 04:14:58PM +0200, Andrew Lunn wrote:
> What about the other bits in LEDCR2? dp83867_led_brightness_set()
> might of been used to turn the LED on/off in order to show the state
> of my caps lock key, etc.

You're right. LEDCR2 is cleared by SW_RESET -- v1 already showed the
polarity there is lost, and the DRV_EN/DRV_VAL on/off bits from
led_brightness_set() live in the same register, so a manually driven LED
loses its state too. Polarity-only was a partial fix.

For v2 I'll shadow what the driver programs into LEDCR2 (value plus a
written-bits mask, updated in the setters) and replay it from
config_init(), which runs right after the soft reset. That restores both
polarity and the software-driven on/off state. The runtime setters run
under phydev->lock but the resume-path phy_init_hw() does not, so v2 will
define how the shadow read is serialized against a concurrent setter
rather than leaving it racy.

The function nibble in LEDCR1 is lost the same way. The DP83867IR/CR
datasheet (Rev J) section 7.5.5.3 says the global software reset resets
all internal circuits including the IEEE-defined and extended registers
to defaults, and LEDCR1 (0x18) is an extended register, so SW_RESET
clears it too. The netdev trigger only re-issues the function on its next
set_baseline_state(), i.e. the next link or activity event, not on the
reset, so an offloaded LED whose link stays down after a resume would sit
at the reset-default function indefinitely -- the same failure this patch
fixes, one register up. So v2 shadows and replays LEDCR1 as well:
config_init() rewrites the last function the driver programmed, which is
the trigger's own last intent, and the trigger's next update writes the
identical value.

I did consider pushing this into phylib so every soft-resetting PHY would
benefit. The core could reapply the DT polarity, and that alone would let
aquantia drop its leds_active_low/high cache (61578f679378). But it can't
restore the software-driven on/off state -- the core has no way to tell a
software-driven LED from one offloaded to a hw trigger without reaching
into the trigger's private state -- so that half stays in the driver
regardless, and splitting the restore across two layers seemed worse than
keeping it in one. So I dropped the core route and kept it all in the
driver. I may well have missed a core mechanism that would change that; if
so, let me know and I'll rework it.

Thanks,
Donggeun
