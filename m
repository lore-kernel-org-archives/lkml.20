Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800070;
	b=ZCL78wq0AnwptxSEx2lCzWxtcU+xPLY+FNRcylC2ILyTZiMoVj3zb5fSLyNvRm6v8r06
	 4TjktuXPBQaUFJJHRrvds4HLH96KSiuAzvv5IVV620bXXrgrK1CFenZni2lfjAhnOStEP
	 ePTgQUgm3EcorYuEDQrF4N8vjPdYCJz3CRglAu6u1j89kMYbwL44tHHTMMWgY0Zcd2ay+
	 HxVb12Ok6ufjtfJ+y1ewfNVB5N5lLKAv4L2YXbDAfcY6+xi2VNRf5XmEyYwgWnd4LJWC/
	 HSmkUzsZSw5iVSGWPtQemgN3mgXMpAaqWTtARdAt1Wc0smTk4sSQkBGhHNhEd3GAMAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=chOAKJyoAP1QGXXxzfUXTvuj5Kz+HpMI3in4etcGZ30=;
	b=3zIyXsJNUDxZBgaeDOJoGdF30LrWSZbbOb4cI1ijau6sVxcnP0AKLLspn2+sd1IZOdaN
	 v21dHmBaLoRyzv/A4vEBtm0X6n9ehZldYM2pD7r82jYTAEqrjVAZWU/t0svgVJW0KBWVk
	 ZuReDqKsUWZ6G09TaaC4YabgAhZtmq2APUpZHLEd56bIWLl9CabeWfUUkMkWmaGRk1Wk9
	 BAi0PaSt94NBvWcWNQCmbULLuPYS4lK58xHb8qLSzwB5lP4DpJyLoLf7e192SceBF1qU3
	 VJd/plCYxfLWyKycmj+k7K7uvizex9iQe9LuyQpEu47/9s6IBIDQZHaQs+EJJD+JeVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iG5iV8QQ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24022606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24022606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iG5iV8QQ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e00eee27dso407684f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800068; x=1794404868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=chOAKJyoAP1QGXXxzfUXTvuj5Kz+HpMI3in4etcGZ30=;
        b=iG5iV8QQXa4nmu/5hfkvaqQhHMcjoPpklYNl7Ok2zIR44a7kbK8mPYe2NEkp6VKqNP
         dUigybGgE1zY6j7oOs5W4QHKsjNC8gcNpdk1cZVQOaxvSrwLT6PcOwvpwrV85hukwDYX
         G6HPBBoWG1DwExLYWm3uRHnlogf91lKd1nATgGec/RRIQ0HtaGCAGmqXKpHNr/AWIa2S
         eMGIK7KW9XBvxGw24wbBcFJSGG2tE2EHrJyszw2dFfahAXo20uyG8CqYSP+L1yRBOv/3
         Z71rXtUGk0l/HtzUjX3qJL2ISXvSqlEQsmkG2Bzh1+bhuvP+S33d4DOdnppPcraMhMtp
         +FJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800068; x=1794404868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chOAKJyoAP1QGXXxzfUXTvuj5Kz+HpMI3in4etcGZ30=;
        b=hiMeDNkly4bwfX/M1a3nqyLLv8xl2R99c9xEn5ge0qFxVDxemwIM8t9xEvZwdr11/r
         4C7npQmS9v2AMEKuLXHlIK3kV4K/QHj9yPwSqpCtft5rXRN8qBTdFO67E7ooG+aSlAkw
         xqIEIpyiRSv0552e+ONY9fSAlYrOmOTjzfWkONuGdXs+jgLV4BTu0f98tCxPtXB/VhPy
         OFGtckka2y7M5OzqnT1elH2n2ttK9YUURDt0Wj7vwAyiK9jfzn5Gnu3o61bIx9mPg3ic
         E9SdG2ArdqMtqhwcVUXgWuESZFQKG6F8nd2jNAq+9wePvbhLxC173iLLEswNQezmCjhY
         so5A==
X-Forwarded-Encrypted: i=1; AKwUvBy222cRbKOnuHN7LWwdnaJEgn7b2gU5QUzeJu0mS1eV3xLyhcAE4gHv7RYPsTRd2B5repXz1SMY/1pCnpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nInbhqO9GrhOq048R34PRzy07U3qIaVZ+pbx5C79cR2DpMAp2
	Lb8Bp2wlkAfKJ2Ar6dV2tLtRvV5RrQRFObRSYWorpp5bAmfbdbyqVJ1E
X-Gm-Gg: AYBFou3YEjTpbRFPRNdJ8eGWvp1qKzZYRqlTzOij4705KNFuCrBQQ/xCeuwbgx6ekPI
	DbkMRhFDatXVmb+CrZHSHJxyN7Ee1mWsRtaJYgob8GwhZOX8PgSnSRsimecD16xKaAad6kQX4JP
	c98Rr2nn7ptzJpAt6JDraK3dQWUwj3P1WG5BL4RAbrO3qe3Li23mSauhoftKwG/wJnDDIW2k/gy
	9Q6iJ/FeLuBXO/5M9V/LHNZE2rjhO1oAWZfmzr1ur7CZs6sNKl/NXrHQl5yLMMce+esIMQ6V4wq
	KI/ZpppAKg16Rj3NPQh2plmIzTxo1it9Pqa7c/ogQKxXIxvrkVI7UiWbflI6Op+bCl/8x02kHWH
	Z94YZrPxC/ZX+XbSRfoSo2qKf8CfOmiY59z6mh7KaZ/KZYC45zfD8kQTX1Uu6w2eUraLoYEcBtL
	gWrCHgbGuCWzqfCH6akmacVjSf+L20KY7wagOWe5R95yKqOcxaoSzWFxLYdP6LAwxcu8zFKKrRQ
	evcwD5aFytXTrkZRjwm9XMTuVdGX8qGOAjJ1K/r6JbLymur0Z/ctGnileNeO4LAJ0J0yU8dKTLM
	mL7RRB859V/Q2ui68fuH5ql4CSmYwYwpczqxtfbFidJBcHkLmFIunsXDpUaxxMse8LIDlH6nAxP
	oyw==
X-Received: by 2002:a5d:5848:0:b0:48f:bb68:4e87 with SMTP id ffacd0b85a97d-48fbb6850famr8447369f8f.32.1793800068424;
        Wed, 04 Nov 2026 05:47:48 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99d67sm4033718f8f.24.2026.11.04.05.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:47:47 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] drm/xe: fix CONFIGFS_FS dependency
Date: Wed,  4 Nov 2026 14:47:28 +0100
Message-ID: <20261104134728.3723002-1-jude.gyimah87@gmail.com>
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

xe_configfs.o is pulled into the xe module only when configfs is enabled:

  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o

With CONFIG_DRM_XE=y and CONFIG_CONFIGFS_FS=m that line becomes xe-m,
which Kbuild ignores for a built-in module, so the object is left out
while the rest of xe still calls into it:

  xe_guc.c:(.text+0x217e): undefined reference to
    `xe_configfs_get_psmi_enabled'
  xe_guc_ads.c:(.text+0x1a28): undefined reference to
    `xe_configfs_get_enable_multi_queue'

Eleven xe_configfs_* symbols are undefined in all, referenced from
xe_module.o, xe_guc.o and xe_guc_ads.o.

Require configfs to be at least as available as xe, which is what the
stanza already does for KUNIT, INTEL_VSEC and X86_PLATFORM_DEVICES.

Reproduced on v7.3, x86_64, with:

  CONFIG_DRM_XE=y
  CONFIG_CONFIGFS_FS=m
  CONFIG_DRM=y
  CONFIG_PCI=y
  CONFIG_MODULES=y

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..fe3061f3b4ec 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -4,6 +4,7 @@ config DRM_XE
 	depends on DRM && PCI
 	depends on KUNIT || !KUNIT
 	depends on INTEL_VSEC || !INTEL_VSEC
+	depends on CONFIGFS_FS || !CONFIGFS_FS
 	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
 	depends on PAGE_SIZE_4KB || COMPILE_TEST || BROKEN
 	select INTERVAL_TREE
-- 
2.43.0

