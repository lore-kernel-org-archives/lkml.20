Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404375;
	b=uiNy4J65dMbK6HbN+RSgCRUOUrgoDwtaoUWY/DoZ1BcgEX7DGmZf/LVKFGP6zCYNEM6D
	 c9uL40bZkkYQo/EUXU8Od60vA2wMDEi/P5ATfOgPppy0+gDpslpBbkEQED7RpO5eNBI9/
	 kSkIfZp0yblW13j3wQ0JSLSwJqrVGPYTpaLXq8If//pPJiDN78YHcVTL08C4TRJ2nhrt3
	 tdmDjiEi0dmClsrEGnuamLlTuVqbC9gQIXn7LWK1bN5xkR7fxOIIg2hczFWCgtzBCS2QV
	 vnLnnZVYrdfqeprIXmCoW/wkcZ/nJ/hIrd9tiIF+5LlZ/QilNzCY7Lfv5u/4rWWN2LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a90TSHLYo3ufI2Ap4R5Yr5uKZJ9gis2VXsyUzLmZH4s=;
	b=R0hhQQ4aXXbVyvXY+vGNdNfk+j1IiUZ9quX8+bK3SNHZ4X0Dh9BFw5WItc2Oolry/FCZ
	 4s7lYff4MogX+Cfs1sl4Fx0xV/eh8rJgOgEtuTj+3jRBRPTqacHAZ787TYAQV5WRWitVI
	 XvbMHyFlggSRt5lzRvUnZ7KQkFC9GTOsaInd1gEpG7kNDvqcVD7pRYjB8zInn26sDMi1A
	 ASbF0Y1MpB10Rf4c1KSj3MPPBMx6DoJ9R8v/yK5BNBnlwOQs/zPCrcbB7ZXoySv0rG2B/
	 wtvAOKhxMM3mvjPP7Mmf94hqWb/TKYIiNB4z326RtcyRbslsUUlfvOi29Ej7yJPXkMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=adBNghs0;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0BC606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0BC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=adBNghs0
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so18544595e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404373; x=1795009173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a90TSHLYo3ufI2Ap4R5Yr5uKZJ9gis2VXsyUzLmZH4s=;
        b=adBNghs0Dn91E1Kvu/DtTmKNR4ihrbC8itA+9BHzZeHLBgmlo2FURAsJ/QLaJywqm8
         t2sK5saIh3wE4mHrv5gM7cEl8UDtAevV/2YRRr8m3TiiKSK5yrr/NDhWbFG5wzKeYdHx
         M76wq50/B95EPJB6tW7jV9YT/1XvoU65q0dXPrb1rjvWn7BqUjDXrS+5ZXbqV97sJBj6
         wcdi2+NRXHsYjLgBQzPlKtwlYkwZmlj1U4zwAwu3NY/hqw79+DKBUPlmFO1SuSDSLlIN
         Pe0YlWI9xK+IImsjwtxC8475LCNHGwhwzdsIwj8xm1SOZcXI4YVz1QpLHSkc5AmJ+aCM
         V84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404373; x=1795009173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a90TSHLYo3ufI2Ap4R5Yr5uKZJ9gis2VXsyUzLmZH4s=;
        b=fsiwwEQ+sMaciRbpaIqg18ABRzaxK165EIgUc1EGnfylYjVKgTfJ5axFtVF/vMuz+t
         sOH6SOAP6b5YvOx1S/qF8dRhACpzyUCjvwqEpvKsPQi9bLuT7Wp1S/QDjU6vYaEOzKea
         ectWQJJ2f49Z1F8200JEUGrT0SaG6aQLCk7ORnWSyWpsB/cdkeiye1UA0+w8inFAz+hu
         DoWsQjLzDqomloUYEfeY0vg93tKtwfiV99Pk8NLEdbR70XfkuF4pOpBO9FJFRwGdWEWI
         bhYZCGrAxiwO+zmbgZGgRzqbKh5XQtfWMV3NVy9G4v6juI6WqUBCPhGUlm0ZBnvJv0tG
         BClw==
X-Forwarded-Encrypted: i=1; AL+hErHPoM4SDMBdjlPyruFLQUx8qwT9eDQC4jCRyEy8qPlPJno6K2xjWpeoXfeXzx+xf/TfMZhjzCtbmnOEaZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OKmPqwn7W4pjOGwo3jGKA1AxboHT83xYU/pt4VcndRRjA/i3e
	3U03R/iaWYW7hsbHEjLYEgr72m35w4xXNxf9mX0OzMP+6PrZsZHfL5iA
X-Gm-Gg: AYBFou3zjAubb9jZlk0GpPVz2WaiYdVIZK6xOFId8P+27YneTVR24Q0Cu/O3u8eFdSu
	Q+Y2qxWCbi2umGiU1LwGLhgYSu14TC68m2imuuq6NZ05WWfA9qDqk2DQHUOjMRz7aDdd+/gJ6uw
	92J5IdWE0duHKKVVCSjOw/ROd8mgTjxUHgRl5bP5eUejMkJ8bwjB0j85FsUJKK3ekZqmbHHdOGl
	XLg3PzDtvG8foEoebHiFVrolk7OVsM8BVbOg0G2N8Gx+qmYic3ILoLm//nxVHUWWTNaWVkT6JR/
	6wVHZMpVSJWWMz8lntZxEy1oCGMkoOIICI1WUMuERZZADu7n46M4+PhP/rtvcEX4frZTITaBPOZ
	6KrOHtl+34e0BC/3u41UCHSAVCb7zr9hU5kPNkc1VArFBiXovl2jEWo6HbvFJBSPjTlhKqbTomb
	nm5FBerKaUeFmhaYvksH7DWlSfRKVb+xnPJ4XS0nWLszdyuZ/oeBXvj5QxCFMylKozo+uGXWoKg
	AfpHcdcjB01AzZ1MbtkLY+/2sSc24eZ8fR5lWfRQu9BtGx3n38TKwjSYbZXSUCwgHHWaAFoVdbO
	cse2s5zqGf+AVOMCSTg6nh2zH/7DYew7Vr0GOHIyN5xs1KGideFOTKjF
X-Received: by 2002:a05:600c:34d4:b0:4ba:cd:f45a with SMTP id 5b1f17b1804b1-4ba09376eb2mr47955805e9.14.1794404372781;
        Wed, 11 Nov 2026 05:39:32 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm136757365e9.10.2026.11.11.05.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:39:32 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Wed, 11 Nov 2026 14:39:28 +0100
Message-Id: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
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

Hi Russell,

l2x0_of_init() finds the L2 cache node by compatible and never looks at
its status property, so a device tree cannot keep the L2 cache off.
Patch 2 makes it honour status = "disabled", as the newer cache
controller drivers in drivers/cache/ already do.  If the firmware left
the cache enabled it cannot just be ignored, since nothing would
maintain it, so it is cleaned, invalidated and disabled instead.  Patch 1 moves
the number-of-ways computation out of the per-part init code so that
the disable path can reuse it.

The user is the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3), where a
PCIe read on one CPU deadlocks against an L2C-310 line operation by
physical address or a Cache Sync on the other CPU, and the board hangs
within seconds of WiFi traffic.  Running with the L2 cache off avoids
it, and that was suggested as the fallback for the platform when a
lock-based workaround was found too invasive for generic code:

  https://lore.kernel.org/r/20261110153522.1620088-1-isasmendi.agus@gmail.com

Whether the ZX279128S device tree disables the cache is a decision for
that thread; this series only makes the property work.

No in-tree L2 cache node is disabled, so existing device trees are not
affected.  Tested on the ZTE ZXHN H3600 (not in mainline yet, on top of
Navid Ghahremani's v2 platform series): with the node disabled the cache
stays off (control register 0) and the system runs normally; with it
enabled the cache comes up as before; the firmware-enabled path was
exercised with a test-only change that enables the cache before the
check.  Builds without warnings with W=1 (board config and
multi_v7_defconfig); checkpatch --strict is clean.

Agustin Santiago Isasmendi (2):
  ARM: l2c: factor out the number of ways
  ARM: l2c: honour status = "disabled" on the L2 cache node

 arch/arm/mm/cache-l2x0.c | 85 ++++++++++++++++++++++++++++------------
 1 file changed, 59 insertions(+), 26 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.30.2

