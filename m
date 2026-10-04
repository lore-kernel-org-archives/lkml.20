Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02356448BBB
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149899; cv=none; b=V++xNsvLplFeaI0jo/StqYfWhtMJ+vGeuR8E6eRurZTP3z+rkZCvCQ1IxNjB3ix4io0yZh0ETg9q0TuJksWI0yww8Qp1GsAJqamJULYyKSxThGHvq2MtJNvsr3RzfBsyARWSp3NeqLPEwcSVnSdzWoKLNgvXxKq5i05JqBcZchs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149899; c=relaxed/simple;
	bh=EIDKNMktdL0LGz2pcFHCC0gOYw/pv87lPZRCv+H+IMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k/bFemgmWpkTVjhLWk9u/c6g0aAF/0tmCq3Y4JHXxba/cM9U+zOOtoxazGSFir0CK5x/sKqEeREB2YAliO8Ld+N8PyBdJrcmdJcw4tC7LstNibZs1wAhC159Xx1nAHgpFY091+sVVjVuoZND7501k050t4ge16MQIO268P6MFBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKw8pJ/D; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKw8pJ/D"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so11226015e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 14:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791149894; x=1791754694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DG6Ijqzx5tZCBpjwT37tlUEZBO9Ju0fncZQV6F7YmY0=;
        b=VKw8pJ/DPhyxn2viHcWLxCwopNjffhs8RZV1/hULlU7iifHuNjQBoZhTPtjK0N4weW
         iD6FKRPOVaP3tUYwqP3ncjIWd3DEAAOKU4O12vux421ViBMSu1e7L23ijHRWDYiFMYz3
         QlqKmsbrOCxz7qrJ+0VEjIi1l1gS0WoF5PwDaOnfaqpcMwhiQ3iuD793H02auSVAG+jO
         BcVGTBM23uYz1lQ09yBeeiuw1gWeH6S+LeYjfQiDi5Rq7tWpbIH9/nhNOjOT8q4Ipnxz
         crGXvVYdh0vTHwKd8qsUMR13/uMgLx/A/g9n+hspwYT/tSaX2VY++uaS4zED7H8gchFD
         jHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791149894; x=1791754694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DG6Ijqzx5tZCBpjwT37tlUEZBO9Ju0fncZQV6F7YmY0=;
        b=m7p99kpH2h+I5muD0whGhMZjkMXONTLftkHtrlejW2trl3VZMS+DtCoyqLgiYBZGaw
         DdHq6JTIIFkXaR0NwmJwnuYOFzDrhLvsqgJiamw4v4EM90RCM3A/regqEVtIB9YAS2AY
         oD61Dm6dp+ZKhlLQbA/TDuQUlkQR01N2vw+f1oiAkwjUCOzMrkZq43iX/G3+d/AIKbvR
         an5Aj/oediVACq38zlX6JHEfASa32J48wG1NOocLtGJkZdP5GizlzWJ1qtqU5QSmdkM7
         VL7Rr4szHgz30xol4nonqin1KBOGSuqfpI1y9K2Zv8cd4gO+B4Fj/SmTENHeyjyj5Cwu
         JNvg==
X-Forwarded-Encrypted: i=1; AKwUvBy5he9E+LkonkIg4tcScU7ewpXJA2dVA3ra45PDYhqotR6+X2DhvspBS47h+IIayqHUM64x7JzC3H52iNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mUFO5Oh+poGG6FNFF69jmTPVO8JsLiQ2L3zWxhxQbEHLNWdOdo
	+9xQzzCnpDtvFUxHQE+a0IyG3EEx01G1xDHtiKwKIx+myDw+q68HgDL68/9sEV7jpsiQhw==
X-Gm-Gg: AYBFou0s215lc7Noh0BP/M5Bes3VG1l7IIl2NpLEO/2aDs5jRWc2c1SwOjl/KBTZ/gY
	dilUdCEgyH2LoTOxo/6WSxlcxKUO6BL8ZsBTovjvcUo9Cpor5EGtUeqxjmxpNhW6F+m8SGFPz6Z
	5Ijq5hdKK2GnSN6Fmjfa3X1iKSohpfSIzv7yiNcLWhP6h4+DCYgq+AhiyzNkqSWhwBmGfY5u9uK
	NgAZUVYE56hW81HLBi2fqy8cti1aIeVAj5e2qgoGMb942uAd8915uB1GHbgw7/eJgWzTK8YEnih
	4ca/2IdVrtv5L5JSpgtr5+dtJAn9rt6VW116XXREwKR3aUV+kO6nxWPBne/kbZuQy8NGfUZXZPt
	/T0k5Im1y933INzFA6ctm7VEkwi6kM8hmJOCUPLJ0Z4tjK9s8BMZnqKJIqWfY9/XNglGb4ra14+
	1iqNaLq3zXUOxFn0ZdB7LKoOJL7kgNxhzINSDCQ78nj5HSYcrQFPRF/XLPa3GZwvGjY9F7RNgga
	YMk/2wno1VkbvyEd7sX9ZEt0brsQkRGN4gp6lpNKHcTqAHnIVtKRPdkhYdXui/28030wNrIreSH
	+mH8c1w=
X-Received: by 2002:a05:600c:3b14:b0:4a0:1c10:12b9 with SMTP id 5b1f17b1804b1-4a1680fda81mr92920855e9.32.1791149894375;
        Sun, 04 Oct 2026 14:38:14 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd42:1800:7f8f:d400:b97d:31ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm22189320f8f.37.2026.10.04.14.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 14:38:13 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH] watchdog: allow WATCHDOG_PRETIMEOUT_GOV_SEL=y
Date: Sun,  4 Oct 2026 23:37:55 +0200
Message-ID: <20261004213755.554191-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the issue when WATCHDOG_PRETIMEOUT_GOV_SEL can't be set to =y,
and always is =m.

The issues can be reproduced with the following steps:
	make mrproper
	make defconfig
	./scripts/config \
	  -e WATCHDOG_CORE \
	  -e WATCHDOG_PRETIMEOUT_GOV \
	  -e WATCHDOG_PRETIMEOUT_GOV_SEL \
	  --refresh
	make olddefconfig
	make mod2yesconfig

	grep '=m$' .config
returns only CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL as module:
	CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m

"make menuconfig" doesn't let it to be switched from =m to =y either.

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f7d0a0c2c0ef..712ebfa1c99c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -92,7 +92,7 @@ config WATCHDOG_PRETIMEOUT_GOV
 config WATCHDOG_PRETIMEOUT_GOV_SEL
 	tristate
 	depends on WATCHDOG_PRETIMEOUT_GOV
-	default m
+	default WATCHDOG_CORE
 	select WATCHDOG_PRETIMEOUT_GOV_PANIC if \
 		WATCHDOG_PRETIMEOUT_GOV_NOOP=n && WATCHDOG_PRETIMEOUT_GOV_DUMP=n
 
-- 
2.55.0

