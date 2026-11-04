Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805550;
	b=Hp9f58Po1W8tUHGA8p/8Oyzht86XH6xL+k4Uw8mpE/LGz45inwKvbk+1tGDBzXUJvDT9
	 6qcTLly7+7r0lC35C7ltfpKUwMpsBk3O84WJasL4C6j3Lz/VVlpQuCdKIb0gVMX65GgqG
	 9di/BibECdhLNWVCv1J6qthZreLH9d1fy80ROOFNfiGrBpNFTicbcw+R4Q0gK9aE9/9Eb
	 gMcWACKbayIhhch0V094wMEGhxyaEjYNqVg3tvjtwW1MNRrwYSoHlyKnKCdkeF6e92Grm
	 dtNVcuuSVXatbf5mT0zqO0vLdOgVbN1w3yXUqOeYq2ceeYgd9iANeSstna62jmx6Fvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TXMNp6D6dnftjM/lgn3eHCYCFJRX9HjksHyNmOga4wg=;
	b=zuLwtWMuGfjJR1Nx6NL3fJMT34gP/X3uiH63oszgo7TiYlnjGScUv4dtOxkjs7ibzVMx
	 7lhSYOoZf5GpDk1g0S9sXHE/1MU/FctCFdXwfzvOvgAEd3c2nZPQ4ilakdZDzyKj9JdKE
	 iMaQckJcyrLf6bfrvdkttoIjTmEiKxVxYMOPuN6Aefn9TnSyxbyQ0FB13swXWzfOb0IuI
	 MvZS4s2OCbVEBjQ/gaBrILvGKxoCL2Im3nBguayeQjyf1OEQf4VsV0Tj0nqFj1Aq7PyTk
	 ofHMpIAh75btTA+6nak4q+tdRw7Wiux07ypdX36kMS2tw3Vm+dndXyQsa1aaG5qRKRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ooom6wzt;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9320606D823
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9320606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ooom6wzt
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc758830601so628222a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805549; x=1794410349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXMNp6D6dnftjM/lgn3eHCYCFJRX9HjksHyNmOga4wg=;
        b=ooom6wzta8+GNecXftrMMf4E5K8NNUF7dzFK7qiDaeL0fIcGFU2y8WgnrOhpXMFQlA
         Z7rHUBa7FT9BTHjf29alv55T3dq6ogwYtNE9bkpP++CZmLnKy8/osz2F8ZDK77WM2EQQ
         J8Lf4tE2xGLYvwkkLbNhCJz0XUtVbwYRe+46iu4P6YO+w1lJjkttFaWOGq/lIFjeIqwq
         89V/LVZMrBJomrRiW5wDS7I7n1vGRD6CCPZoRRUAOAwZx5AF98PD9vOozNbi0H5rjPQw
         GfEY7pUo8oAOwXr8oASxXEEkhN26bgbvtwYSZGx4cLrySldbTqxqwlQuQDg5OZ/Fo9Y9
         tt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805549; x=1794410349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TXMNp6D6dnftjM/lgn3eHCYCFJRX9HjksHyNmOga4wg=;
        b=UD9tn2RAPQ0yuSGAVF8mYuac6+HFdi4BcHKcFSP9yodPS5yHCMf+0+OGZBKc4Aveuj
         jrSpTZxZk430pu/qys6EuY1GbHOLeINZk8zD8XtmyK/GoH4uaz7uiOqPtxr0uTSmPKFC
         NdS8kUWzTW1NXV51TfSmPJ1LXQwU5ittVbilsvOv6R9BWV4rzMdDTg0SO/l5hA9GExsX
         EzQt03k4Sbr01Z8m0Yu9b9jYoXR5b1abyYxtjzDGibH7ay0F6xHkH2P1TuiBQKwhH2tP
         XGhYEkQYxNrhRBUMlOwqFtoewUcWzYObps+lkGS/DEvu7WROZ1JHb6sSeJyi35iNsuPB
         RUPw==
X-Forwarded-Encrypted: i=1; AKwUvByyXnbBzIyYsWWZhoS2bNJLQAQ28S1Gq4hSU6hCP7VThmw7CGX2JS/HqFTqyuPA+jKXOpSW/HvL8w0q8Rk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ky/k6rY9W8N47aqS9DGflfF8C8yEUdRvIGrQhiJy84rXsZcZQ
	Yf0ZvS0SSg64MX0XkGwVSiqrXi0cd8Xvg53ziUpWl5VO0EwF7EahP2v1GnxOMRSf
X-Gm-Gg: AYBFou0BAmq5vvWhQinn0tHI61foLuYYaQffw1o8PPBvs/SjmGY66JR+5/XfoqPSL5G
	WxPJe1igxrC+e1iv8ZGaip0YBtIZNDmNxK32BlrLA4p7xkIF28NNJOfJDkt4W67qZRX2M/+81NP
	vCslJX51fgFsnVOJsNw19hs3cEkWAXMBGMIcSKlkPGF3rf/wsVNPYdOGzpiv2nWCbrsJGZ+kJNy
	KzmGYF0b+tJvgCk/1m4Dcj0knjIh58/VNfXeHPOjSM39P9CE0LNv8oWHvnwWuu6yW16mO9M/g6X
	X3pIHSMYHybBvkv75zP6P+YboigRiMOspQUcVVZEdTMu9ljGMxtsRGeuTgPAVSJH//dEUUO5rPF
	wY1cwuBOU3PgvjZHBRTUUt5U7Un7z0H+nCa09rJBD1VoatzKNgbOyz6PO7ZXEkcVrYGnbCGpCMo
	TdblCPk6JHNmmXMgJcm/gAMFuJNJeHTsP9aSawWYRHDme9HXrEmY/T66i4SS4e2Mfh7lwypKOZG
	r4WjzyQmUTGLiC87QFnnFkgbUfSoCTati/DmhyU6V/XvWF0QbXnhmj4BnMjjfypAP7tEtYDAnVi
	DmJn3zIaBR7aF61/XBniQir19/cDr/PHIKHko336h+BuDDQrOxWqT/F1LREgik2hph5AKp/GXuB
	Nibbw
X-Received: by 2002:a05:6a20:1f28:b0:3e2:21c0:3dff with SMTP id adf61e73a8af0-3e928e20ceemr15901497637.65.1793805549214;
        Wed, 04 Nov 2026 07:19:09 -0800 (PST)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8b097fdf9bdsm1110555b3a.7.2026.11.04.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:19:08 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/ms91xx: Add Kconfig and Makefile integration
Date: Wed,  4 Nov 2026 23:16:50 +0800
Message-ID: <20261104151652.59135-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104151652.59135-1-hjf3108@gmail.com>
References: <20261104151652.59135-1-hjf3108@gmail.com>
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

Expose the MS91xx USB display driver in the DRM build and register its maintainer.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 MAINTAINERS                     |  7 +++++++
 drivers/gpu/drm/Kconfig         |  1 +
 drivers/gpu/drm/Makefile        |  1 +
 drivers/gpu/drm/ms91xx/Kconfig  | 13 +++++++++++++
 drivers/gpu/drm/ms91xx/Makefile |  9 +++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 drivers/gpu/drm/ms91xx/Kconfig
 create mode 100644 drivers/gpu/drm/ms91xx/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index 3951f85d2..85d4e7a3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16034,6 +16034,13 @@ F:	drivers/net/wireless/virtual/mac80211_hwsim*.[ch]
 F:	include/net/mac80211.h
 F:	net/mac80211/
 
+MACROSILICON MS91XX DRM DRIVER
+M:	Ho Jie Feng <hjf3108@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/ms91xx/
+
 MAILBOX API
 M:	Jassi Brar <jassisinghbrar@gmail.com>
 L:	linux-kernel@vger.kernel.org
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 61111d50b..93d73c7b9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -330,6 +330,7 @@ source "drivers/gpu/drm/mcde/Kconfig"
 source "drivers/gpu/drm/mediatek/Kconfig"
 source "drivers/gpu/drm/meson/Kconfig"
 source "drivers/gpu/drm/mgag200/Kconfig"
+source "drivers/gpu/drm/ms91xx/Kconfig"
 source "drivers/gpu/drm/msm/Kconfig"
 source "drivers/gpu/drm/mxsfb/Kconfig"
 source "drivers/gpu/drm/nouveau/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c6bc093a..cf83e3104 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -180,6 +180,7 @@ obj-$(CONFIG_DRM_I915)	+= i915/
 obj-$(CONFIG_DRM_XE)	+= xe/
 obj-$(CONFIG_DRM_KMB_DISPLAY)  += kmb/
 obj-$(CONFIG_DRM_MGAG200) += mgag200/
+obj-$(CONFIG_DRM_MS91XX) += ms91xx/
 obj-$(CONFIG_DRM_V3D)  += v3d/
 obj-$(CONFIG_DRM_VC4)  += vc4/
 obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
diff --git a/drivers/gpu/drm/ms91xx/Kconfig b/drivers/gpu/drm/ms91xx/Kconfig
new file mode 100644
index 000000000..526aaa2ee
--- /dev/null
+++ b/drivers/gpu/drm/ms91xx/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_MS91XX
+	tristate "MacroSilicon MS912x/MS913x USB display adapters"
+	depends on DRM && USB && MMU
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	help
+	  This is a KMS driver for MacroSilicon MS912x/MS913x USB display
+	  adapters with VGA or HDMI outputs.
+
+	  If M is selected the module will be called ms91xx.
diff --git a/drivers/gpu/drm/ms91xx/Makefile b/drivers/gpu/drm/ms91xx/Makefile
new file mode 100644
index 000000000..98dac2602
--- /dev/null
+++ b/drivers/gpu/drm/ms91xx/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+ms91xx-y := \
+	ms91xx_registers.o \
+	ms91xx_connector.o \
+	ms91xx_transfer.o \
+	ms91xx_drv.o
+
+obj-$(CONFIG_DRM_MS91XX) := ms91xx.o
-- 
2.55.0

