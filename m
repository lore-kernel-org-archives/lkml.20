Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362B3BAD9A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790493884; cv=none; b=l/CqReVW8i5sg137G6acRE6krpmSdYoxv2vEUw38M6vXOzXkgpNnvxPoKhFMpyB3mYkL+D0btSjPJAhyA7WOJmvEkUkecuoM40z5THIdqPMSlFaU9BMx1+i51wNTmyhhKBliGxRlX6+G40YR82KmRZU+slGapuhdmtv2Ddf0+S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790493884; c=relaxed/simple;
	bh=vsp3lSI5OValGOowEuR4jODoEVpNGT3LSR1v5N/mUZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7/xjJ/y/HJOCeMd5EKIzw7fMio5i3PHNX9cXP79DteHlyBSivVkq7TknDdMw0Edc8H4LJKolSIsyFMUi8ekLATGxoxpdMVgDVsqT0czQp6DDGHLlrzhruw86GMpnR5yhd9vUCB95mHDISkecDTV/cdpNwKqJI4obU2no4O38d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMGnKkvC; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMGnKkvC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so682460f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790493881; x=1791098681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XlaV7UgTaVZy2ImXNivOnM8isWNc8kNX4SKcwgQcR50=;
        b=hMGnKkvCkJsfbXhYPrHIDUPazealjSvUGdBZRSlD1L5+qDjyvISGfscgsDxdg8DCpP
         wdpEV6pHuP2E0LBTKfpKS8YQZiLXEqlmSNpVlDjqRDI3f4rUZ7AL6FT3juDTx4REUeoa
         Q5zAcgq/7VbxI1LuFbDEUMegliu25peJiiXTjK3FuARW7RQwJftlaR2AMTJ1i0fYiN/7
         sQ8JQ1po06+yOs+3BK0c8HWEauZ6/tqazAagxaaTxDnsRa/Q18D2D/FfGgrYLEqbc9yB
         L84r25NzDyB5AympxQcQc3Ebbgrb553E+ecGS/WdZbrgtpM84pgS8LYWf6VPOLmSekHO
         JvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790493881; x=1791098681;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlaV7UgTaVZy2ImXNivOnM8isWNc8kNX4SKcwgQcR50=;
        b=Fk1MX2Uo0+iLjz75OPtTTy/hP2kawBW20KVTci5KabJCRomDqlHp1SG1/v3F5yWgiX
         8IgMnu1k3h2lxMhFpZ3DWsvMwzONsG0LYo+R//uSk7SKCx1ydy7yoz/eMkdZqaR0vx2J
         6q9P/lMnkbM0EY/+K7yE443U88UERh69GHfvKOMeiNKj10Bm7/ARVt14FDKr0fZTXP/2
         cZIQrRg/A3smv6B0+67RC3a7S2dBowxKq7rF89D5/sQ9kIUHMIlFwlFVaFnnOdL1PMxz
         08RSCQomXf+W1iNOOysXSgUH9ui6X2OY30RuS0ALBCvkty3iDvILRCud56bJTO17oF/D
         WMSA==
X-Forwarded-Encrypted: i=1; AKwUvBwc7ef6JUp5zmmvoq7ebdftqiynOzKavZnAeeYn3BChe++pg4CxCwlGq/0l5oIsymB3goGD2oNXb4m/v7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHWt84mZ0sxMlCU37j1jQEHQx+3LNfzIQ+XHLUCXM+fZvxEcif
	IP5BPbDlxnYjlMVNRGduzMgTYxbuEe55KrFmd31IH0C6U2bGekK4Zkw=
X-Gm-Gg: AYBFou3i/d1sT+WUGbbD7EYiJTqayDWTVz/R3UArMdvb7Emow856lfsmVFNCbCY37Ca
	hmK8Y7BPLSIIBl/Llf7YGgS6ho2QfNuXNtYxf89LqH/tgDeNdBFkuXmEwqeSThYu2DEHia9Ar3B
	l/cK8AoF91kTmOoGCG9KYrA0P27Tf8ez4X/ZqRorLqthHnLbPkmFHjtCORDdkK49o7qjKtjGda2
	GHQOwxnwvCIHWfXh5Ln336Ccml5WMoMgMd7nofXg+swIVFzKnRI6UKk7cyLlb4e4ACO9aqKG8pr
	0yC1mg0a6Klzc96HxBzrsuRd7/ABlWEmLd2xHj5a3rMSwZfsoYDI/Fara3R5Ne/WPdXcX6gSBy7
	YvkZkMvDS2aTTs0EDNow0IxilIsA22RZuCqoCo35HCpNq7G5r2ZW8vNYmpZ3INTn6g1CuJAiS0t
	OFkE3GMnR2fhtBqmfQQoFd0Ue7ncG3n7wogQUlRUdtFFaHgyJAo1UhXFIzbcGZsC+x1HEP0HA3P
	wsmPcnec2fDM+E6Bn3TXY3UnIv2i7iGodcOsEd6gMMfA4Q=
X-Received: by 2002:a05:6000:4b15:b0:488:80bb:d14c with SMTP id ffacd0b85a97d-48880bbd368mr11342988f8f.5.1790493881447;
        Sun, 27 Sep 2026 00:24:41 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm18263754f8f.34.2026.09.27.00.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:24:41 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH v3 1/2] docs: timers: hpet: Modernize file references
Date: Sun, 27 Sep 2026 10:23:15 +0300
Message-ID: <20260927072425.7892-2-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927072425.7892-1-habilerenturker@hotmail.com>
References: <87jyo74rbv.fsf@trenco.lwn.net>
 <20260927072425.7892-1-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current HPET documentation contains outdated 'file:' prefixes for
source tree references, which breaks proper rendering and hyperlink
generation under the modern Sphinx-based documentation ecosystem.

Fix this by modernizing the paths using the standard literal backticks
formatting.

Assisted-by: Google Gemini
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 Documentation/timers/hpet.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
index c9d05d3ca..8bb51d971 100644
--- a/Documentation/timers/hpet.rst
+++ b/Documentation/timers/hpet.rst
@@ -23,8 +23,8 @@ The driver supports detection of HPET driver allocation and initialization
 of the HPET before the driver module_init routine is called.  This enables
 platform code which uses timer 0 or 1 as the main timer to intercept HPET
 initialization.  An example of this initialization can be found in
-arch/x86/kernel/hpet.c.
+``arch/x86/kernel/hpet.c``.
 
 The driver provides a userspace API which resembles the API found in the
 RTC driver framework.  An example user space program is provided in
-file:samples/timers/hpet_example.c
+``samples/timers/hpet_example.c``
-- 
2.47.3

