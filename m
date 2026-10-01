Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1819E4949E0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873443; cv=none; b=Hr+7GZ2TpRAENgVH2MA6ULTqGH678cMpyFuTkFJmrAiil3pDq6IDTheMrzITsyrnjP3qWUH4tO+YivwANh28Ye3YO+8BP28Msy2Rn1zsIa6mLTsR2z+DqrAt0g4HP3POtxohhu001oXq6zeNgsU6nUBOkzfKii7OnbJN6GKdfVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873443; c=relaxed/simple;
	bh=X7yRM492Myb/CGOz9422592ZC3di3eL+p6g8TI6/5cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bED0k6yp/IfaMlE04j4FeOfByULYLjpUXzjkjXz/ypMUlq1aROMCJM9u3Z/x8R2Y6qa+7Q7D8EIstcnwLyQqxy5Za2uBnHbuO3aTjCtqEfrOwfdcgTaFrIhXIHcO1/8yEYLMhxncYzQu4f997oRNKG2IGI9c7FiQ9c+e9WD82QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxCMpLgp; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxCMpLgp"
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ac502960dcso19049387b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873432; x=1791478232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6K9PeKbBLz8bvD+V5s6A6I1nwOveAHnKglkwmhB6h4=;
        b=OxCMpLgpEdqzkT6cW4d14VUEyNRhYDD5mWm4BTTSzUDfwKHLYDHOBcv+vaaPolALO+
         Jze3sTcgNeGgh0/EdRLYVKJ9eft+NOhTlGDIlevXl/fz26a5exgN5ns6Xf0jx+j+uYeR
         P1TIstoX67XHeByH1wHvpxjPuhZ3P1HGU6kgPZ8FMt5VdDi37gqUU89LiN5VIETwGD4H
         gmG0uOM8kR0Ig69vg3B5CIpoXrj8V2sIarqpSuwXZMepnHpnehwbKIDpTsn2XSH99KQB
         CFVCAeJ/BMFCPVpkGA6QJN3D9bQuCiflA9K0XmPK+hcJZGTyDVgm10kVW16EfPrOlka9
         OiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873432; x=1791478232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d6K9PeKbBLz8bvD+V5s6A6I1nwOveAHnKglkwmhB6h4=;
        b=OAQWscVBz1xO2ah45jH+LpJGHyOfJ3z3c7HxEwU9lpUg1ETWp4pCrIcbj0vLT4zLjB
         wGsYlNidZfSYKqqD9Fou0kOg/v9DCNUAnPdxVg7DeyPHJGY+x8BHsjVV3vs+FdLft+P9
         DddxrgyTuW/f9vgiRdmjArBXKWLq1DOqpbVqZm0wmmc2MUJWXOuhlkyKQr0urod+brK8
         7CWAXfFKcFRZZvInArvOOtVzyFEmlgzYSYUxU7C1g0uv7cKSepWJmU+oBMPiqMJHG6FN
         bDdqAn0of03IyRKtky68c0noSQNQ3/py78sovGdYk+nuAf2ziRitaES8MVgTmT6rsh7M
         thJw==
X-Forwarded-Encrypted: i=1; AKwUvBwzR8WaFUDCHLeXXCJRjhF+b1Dn3DWNcbLHXkSyZpmX5Zc0tb9BirGOGHiKIOTotUGbH5Qs9N7/YV5FTpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjW8Q/P4u+9DZXHk42Vqp8517XlXtJyiTTCaRdHL789thxA40u
	NEJWDTjglxinl9ycamkFJy/dcEH14pgdT4/8ClfbNO+LkiozdYIcFwOO
X-Gm-Gg: AYBFou0ni91ckjAoBbhO+qiroP6mDwxO0uMx6XrKYn2RWA6X9U/bANlA7WmDDKV3305
	jY/Nm4Eybd1Ybi8MI8vBZc6lSlHbxBVjv6luD846YfPINYCtA/w5d8s4/MvE4tsbIzgwKBkAPKF
	9tq+S6kTOWkVtWnefw0/6VYhPBk0d3teYjvrnDZkG9A0f3yKu6s8W2L4IHDaspU2ZwWU2KRDumE
	8HJsq9xBI6cLJQ3g6VXjSR3I/uPAKwywUUjpm2QU8uLYlri4tkUdMuroyiWfgyUzttxETmb3VBM
	XVyJlyPXTuiQmAFR/Veo5kbJHrEE/U3szXu5NVQjRPHpmT/LP1+fHmELJwzyDmEZ7DeLtcxBR5H
	IcZNJxCsFJekhaq5uus4JRYGJPbWLeIvU2V41V4513W45sbDtV9c3pOQZBftH/cq7qCfgZ/nlgL
	asbrrzzk2Dppb/ZuZd+LnMWt1FM30aQ5wkMOdBS/mkrZjs1smXMcv97jc2Sj4qbm0hSvWVge0=
X-Received: by 2002:a05:690c:620b:b0:8ac:d426:105a with SMTP id 00721157ae682-8acd4262479mr17211917b3.39.1790873431602;
        Thu, 01 Oct 2026 09:50:31 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdad20683sm13782967b3.32.2026.10.01.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:50:30 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 3/4] alpha: link platform help text to the alphalinux.org wiki
Date: Thu,  1 Oct 2026 12:50:17 -0400
Message-ID: <20261001165018.415526-3-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001165018.415526-1-mattst88@gmail.com>
References: <20261001165018.415526-1-mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The alphalinux.org wiki has a page for each system and motherboard
covering its CPUs, firmware, Linux status and known issues. Link each
platform's help text to the pages for the systems it supports.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 47 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 920dd10e7df0..0fc61d986a7d 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -177,6 +177,8 @@ config ALPHA_ALCOR
 	  memory coherence when a PCI device DMAs into (or out of) memory.
 	  It is used by the AlphaStation 500 and the Alpha XL 366 and 433.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:alcor>.
+
 config ALPHA_DP264
 	bool "DP264"
 	help
@@ -184,23 +186,37 @@ config ALPHA_DP264
 	  API NetWorks: 264DP, UP2000(+);
 	  Compaq: DS10, DS10L, XP900, XP1000, DS20, DS20E, ES40.
 
+	  See:
+	  <https://alphalinux.org/wiki/hardware:systems:webbrick>
+	  <https://alphalinux.org/wiki/hardware:systems:goldrush>
+	  <https://alphalinux.org/wiki/hardware:systems:clipper>
+	  <https://alphalinux.org/wiki/hardware:systems:monet>
+	  <https://alphalinux.org/wiki/hardware:motherboards:pc264dp>
+	  <https://alphalinux.org/wiki/hardware:motherboards:up2000>
+
 config ALPHA_EIGER
 	bool "Eiger"
 	help
 	  Apparently an obscure OEM single-board computer based on the
 	  Typhoon/Tsunami chipset family. Information on it is scanty.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:eiger>.
+
 config ALPHA_LX164
 	bool "LX164"
 	help
 	  AlphaPC164-LX, a 21164A-based single-board computer using the
 	  Pyxis chipset.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:pc164lx>.
+
 config ALPHA_MARVEL
 	bool "Marvel"
 	help
 	  AlphaServer ES47 / ES80 / GS1280 based on EV7.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:marvel>.
+
 config ALPHA_MIATA
 	bool "Miata"
 	select HAVE_EISA
@@ -208,17 +224,26 @@ config ALPHA_MIATA
 	  The Digital Personal Workstation (PWS 433a, 433au, 500a, 500au,
 	  600a, or 600au).
 
+	  See <https://alphalinux.org/wiki/hardware:systems:miata>.
+
 config ALPHA_MIKASA
 	bool "Mikasa"
 	help
 	  AlphaServer 1000-based Alpha systems.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:mikasa>.
+
 config ALPHA_NAUTILUS
 	bool "Nautilus"
 	help
 	  UP1000, UP1100 and UP1500 systems based on the AMD 751 or 761
 	  chipset.
 
+	  See:
+	  <https://alphalinux.org/wiki/hardware:motherboards:up1000>
+	  <https://alphalinux.org/wiki/hardware:motherboards:up1100>
+	  <https://alphalinux.org/wiki/hardware:motherboards:up1500>
+
 config ALPHA_NORITAKE
 	bool "Noritake"
 	select HAVE_EISA
@@ -226,12 +251,16 @@ config ALPHA_NORITAKE
 	  AlphaServer 1000A, AlphaServer 800, AlphaStation 600A and
 	  Digital Server 3300 systems.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:noritake>.
+
 config ALPHA_PC164
 	bool "PC164"
 	help
 	  AlphaPC164, a 21164A-based single-board computer using the CIA
 	  chipset.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:pc164>.
+
 config ALPHA_RAWHIDE
 	bool "Rawhide"
 	select HAVE_EISA
@@ -239,12 +268,16 @@ config ALPHA_RAWHIDE
 	  AlphaServer 1200, 4000 and 4100 and Digital Server 5300 and 7300
 	  machines.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:rawhide>.
+
 config ALPHA_RUFFIAN
 	bool "Ruffian"
 	help
 	  DeskStation RPX164-2, AlphaPC164-UX and AlphaPC164-BX boards.
 	  They have no SRM console and can only boot Linux through MILO.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:pc164ux>.
+
 config ALPHA_RX164
 	bool "RX164"
 	help
@@ -252,41 +285,55 @@ config ALPHA_RX164
 	  Polaris chipset. It has no SRM console and can only boot Linux
 	  through MILO.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:pc164rx>.
+
 config ALPHA_SX164
 	bool "SX164"
 	help
 	  AlphaPC164-SX, a 21164PC-based single-board computer using the
 	  Pyxis chipset.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:pc164sx>.
+
 config ALPHA_SABLE
 	bool "Sable"
 	select HAVE_EISA
 	help
 	  Digital AlphaServer 2000 and 2100-based systems.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:sable>.
+
 config ALPHA_SHARK
 	bool "Shark"
 	help
 	  AlphaServer DS20L and API NetWorks CS20 systems based on the
 	  Tsunami chipset.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:shark>.
+
 config ALPHA_TAKARA
 	bool "Takara"
 	help
 	  Alpha 21164-based OEM single-board computer.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:takara>.
+
 config ALPHA_TITAN
 	bool "Titan"
 	help
 	  AlphaServer DS15, DS25, ES45 and TS202c based on EV68 and the
 	  Titan chipset.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:titan>.
+
 config ALPHA_WILDFIRE
 	bool "Wildfire"
 	help
 	  AlphaServer GS80, GS160 and GS320 SMP based on the EV67 or EV68
 	  core.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:wildfire>.
+
 endchoice
 
 # clear all implied options (don't want default values for those):
-- 
2.54.0

