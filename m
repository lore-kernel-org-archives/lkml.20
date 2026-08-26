Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71F5443ABE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760560; cv=none; b=SHg9ZKEaJMEUXfKBupvWfQ4c2zryvQQER4fBAwWwksoiFy181sISnqN0ZO64GYvEjmAM6cXlh5F2oFpkhLZSK5LQawpyK+8wHNwdHd/ninbXN9iuHIAvqRZpAnj5YSG2vcRmp4BCSXWZo0heU44wsMkzwzgh82Jyg0+dvMOdkt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760560; c=relaxed/simple;
	bh=HQGlk2jl7ZC+13dfdxTEbZHJHqvV4i8jOzqjxsh4j6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAFBqfILtPPOjicNgYHQf/rypCLvp6j1x43+hVLkzX7Wl9cR1b8Qt+C3jZv/Y37kAyMbHgBBXDrP73l0TdyR9WA+i1avHG7qIQVywKyOr/omshcmlvSEwxPfYp/iaP2OOi9Yg1KL6mo5pfYh4R4FQr/t4baT4jxypcpaUujI5R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is+LowLx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is+LowLx"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c253358b121so35235866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760557; x=1788365357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SfMexikYcT8YK2CbCbuAPa/0r9Mzj0fUEaGXF70ERg=;
        b=is+LowLxfNBC1vEWkyp05SondawUdhpYxBQkovn09KvKpdir13f4o2qI7UaFYxNdOA
         7c9QrtQwIhuYIC4jijdwUKevvDLysplNZMdkHCoUZKTDS/r4Ud4+ckrM0iqa0NARGDP0
         6IRES4TnQvRlBBK8dmLpGbyHiSsec+JMfZhGl5UwUcyXB3aedZ/SUv3B/tmViJr0PiI4
         8Dwdc6s8Wu20MDrlDjwRCsWHry89MQNERBMHWFENA3mMXOqwjK/Ww4W19hymCos4xmEz
         Uzl5r+gJlBvMav3WruvkXbsMRV41pB5sxSdGQSJyS5siUXi/I7AMtLItJTnM3uSnisbF
         TA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760557; x=1788365357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SfMexikYcT8YK2CbCbuAPa/0r9Mzj0fUEaGXF70ERg=;
        b=blbA6d9WeWDSrFpANJgS4v0aEIH8DrMLDXO3+Av0d911qX/3lAQDPXpMbRTJ0awwSM
         kI+nerYg6NqBGbgBSvguSosn0QqcYh7soxZKk8gU7qERbxY5iObJV9R8lk2Mc6RU2MMT
         gMbptbnBMZGGA3SuFWQLjOFmunzRYCmTkwzx2t61HvTUGOr9DI+Tkw0xwsXSr3q5IBVs
         LpMOSshRzqmTmaGadV28hAdiPyR3KtqPhlA39h6j40p/CwhZFew010GeUf5EJSJQUj+8
         TK3YIrBFgqNdVkz0gcJmBzelbF/kwA+qsH4JNTBLq2ILxPdJCzb9lwQOO3Ybi9QtdcFW
         dKig==
X-Forwarded-Encrypted: i=1; AHgh+RoPa+S+pGXO/ppaCGThdXMx4UE3/hMX5hgEb0nrmk6xVU9gAr6G/Gh2Wm3oswK40htYaf3ETn78dyJxeo8=@vger.kernel.org
X-Gm-Message-State: AFuF++mjtZWYc2nE3ZRXIRADAikmFKWZiReh1PJUu+RwzpiBDRY8Wdi4
	yMmToUv4Z6N6e6m7wkaIdP83Or+NOabSdkpKNhUpuotbtfjui3SO3k22
X-Gm-Gg: AR+sD10cEyLgqV8kFB4mFCeHmG7o1CHNi6+iX0z2S2LRhSDzekGAQ7eMFFsCYCV52bJ
	X0IXH9jaNfy1qohC+yq2KMte6mwmGAxvOLZ8x+KFiRdTbN8JApfKFw4bXzX7QUs0mZPfy/gS/sO
	gUcniEpm3RoOdnSejJxoo8ZDRecLtk7hwpKwuWK+uXjgpGku15TRmAAc/GFkumzt9KxBQ/bLsb8
	6ir9JrQpX+UsEMewiBZjBMLUVHSqsdsNW+pzM5k6YmZ8Kk79+U9/VSu1W6XaNvkFM1hFXcTIJJG
	wl+v5NuJuW6Bnp8kYUEOj5sG0Od2fdi/akiHf80G9IAveXpwXEEOAfLRsrxSg8K/3zQXmARS/fc
	6/cfsh6BaUWML2+AC0AtntciH7kDrM9p/fJ50DCjisYHS5MWiXbSKZCzMNwS1bBbAwbsKOGK3ui
	HJwv+TYBZbrNSiqZZIwRgR+cZjUw+t7cgMydWx+R24Kp/hUnRYYLg4YlybAH1h/kfud28G9uX+m
	IDqnKvIhqcPQOkYzO8rBl45EnqCf/ViSIHgcGa+pLO0ZEoOq0r+ABV8Dg==
X-Received: by 2002:a17:907:e003:20b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c252d276b10mr421093966b.11.1787760556808;
        Wed, 26 Aug 2026 09:09:16 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:78ce:12f6:160d:28db])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b43absm558705766b.51.2026.08.26.09.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:09:15 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] m68k: defconfig: enable PATA_CSWARP
Date: Wed, 26 Aug 2026 18:09:11 +0200
Message-ID: <20260826160911.460165-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826160911.460165-1-p.pisati@gmail.com>
References: <20260826160911.460165-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the new CS-Lab Warp PATA driver in the Amiga and multi defconfigs.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Assisted-by: Claude_Code:claude-opus-5
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/configs/amiga_defconfig | 1 +
 arch/m68k/configs/multi_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 8b7efe20dd12..794bad30f5f0 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -284,6 +284,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_VERBOSE_ERROR is not set
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_GAYLE=y
+CONFIG_PATA_CSWARP=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_MD=y
 CONFIG_MD_LINEAR=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 2cbd6bf20a68..3a9aa52d00e4 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -310,6 +310,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_FALCON=y
 CONFIG_PATA_GAYLE=y
+CONFIG_PATA_CSWARP=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_PATA_PLATFORM=y
 CONFIG_MD=y
-- 
2.43.0

