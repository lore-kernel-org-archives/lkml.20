Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB506471268
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762525; cv=none; b=JWL2IWe9Q1JsOvUUBmsIz9ultIyezUTDvaTSe8gdVJEWvZUhH/l9FbvoLVYLHhriWiPVtW2dxsCCgGCxLw/fwNpB4e8bMNR+iEAF5B4PQmuYjSm6wir/VIO4mxKWMx+SQ6/ylVLSXFoDrp5b8dOcd+WpHnE913+JyrgjXUZcmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762525; c=relaxed/simple;
	bh=GRh+ADm59DlQaArvAetjOKX+4NgwRUV/PdzCMvPtp1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvrZd9HqIFNmHLsigwpBRs+sg5fxU2FoAYKnURXixZ++zTBHbesITsQLFDd2SEq7o9INONnVp95fy4rd1bc9qDW7RWGAof3D77PjITO/Txf0oQBZ8YYSJN6gBqzfPLFOqQJNC8rUp4seymR+WhuD6j582o5Poj6xZ8wt74Ajbr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=WBJCX7eA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="WBJCX7eA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so555285e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762484; x=1788367284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64TYoztfjTxz6bZJgz8b/VUNCXdb2tzD8EdoWyK7qS4=;
        b=WBJCX7eAAePY+eZapTgVaP2/NcUE8/pA8Y1B7pl+Z9Hgoh+ai14AWliO0hNzL3QUVm
         cyExmL4elYyL2xIRPUhGR34/ckbWEq4i6PkWf4LixWwxneug2XGPx4ZWGDeBxINNxz6t
         NQotb2o3Noxf8XwuIpRGIE3bUm4VU62BfpVpOeNMHBCMNyDifW4MM1XjLcuxqv6fh7wd
         HRi9RvwCRykLAf1egczIWRc1SY59NZ/c1CUbKJ/LfREmD5RBYoQYc/q32XUx4fDtgSqc
         povBkIsKCVUdR16PfuqMdxfuwH/hB8tjyQWq1ohRXXyWnPZ2q+kOaEeJ3A2EnNf8mfQ/
         HxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762484; x=1788367284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=64TYoztfjTxz6bZJgz8b/VUNCXdb2tzD8EdoWyK7qS4=;
        b=RD3Nx0YgGml3pjmjTIT8z9a0zCGlsgflLxHsgrVSO4t+Gc3eqriRAeYyXZGms/0XB/
         xZ5j49sxeE8xTbWwF5HGtA3V/Vp1mRblA7XSC4lyDjoRLy55MsOnX6dCWc48bmihLtUO
         YrnOKNt3tjCOpQ4T1W8qyjEutwpdJCLaWxSgTDhFrHnSO0HqoLX8Ns1rVEtucGDhUU5a
         CHsnHtvylCC+dP3OWy7+AjPoTuCNjB3+NV8jcwop+ZXGAWBVfspwlBppid4IohrbM2lf
         JcVE+mgpg2uprXC4D5RMFv8uDM50uIQ7LZK8xT8axBA9WOciSUUq3syFgw4DVJn3Ssmw
         xvdw==
X-Forwarded-Encrypted: i=1; AHgh+RqpW9jfgPBxAq0ZRiex4dfvXjrK3pEgaRa27UxrR8PT1EHzYnW4exV+bhmBrYxMuh1QKP6Ry9qy61l3gdI=@vger.kernel.org
X-Gm-Message-State: AFuF++klwlhD7dHm4U5YfqBLd1ylkcFyVHlzG+IucVr7YXjFkikbrLGo
	JbfjMMoUPrzgNMLi8AnMkLcUUT7M4w5DVojAC7JkfWhFv5As4ypT636+00ETPKJvlg==
X-Gm-Gg: AR+sD13w3A/hWIOC6p9lPNVaBXgVhKGDafamzsE9ZWvhyoOmDA6vcE3set4Vx2ehPnN
	QboRKx0n0YRTFVirYMbY9UB5eDik07bTvc277EipywPxDuQ+lET6Dgtzl1bSxTCGnAxWYPyzUyC
	KpbE13RsQcVshrBZTQTL09sPiuztXtDdX3QbuIXl2sMCxfJ1Lu48LB3iFYpNGR47Ce+FJDz3l/K
	/+Ig8QXR+FUxVQbDI+PtTyppT3shb2VYL6+2WfD874njpUcrVo0ahRjEhDNkjCKyGHbIRS0/8KM
	zqZlDEEcj1bjFmsZ+M7xO1EpbV/JptEw5MJ9IHTX63ZosmRn2vKvMadtAIoZen7ynBXfrUISyEk
	edlfhKX3Nis/z718nUX/6Q4ujrVpDWNmdHVvTPxQz9XRH5+tjPbQPYJFooCGy4+U5YlN5JHP4L0
	suSWCQL8GXQfnElhhj1dVtTlORoqogjUzxZ4FJGlW26whJ+6bXsYNJp3sn8SfP0frA7mYZvNhu/
	22jDZDIxt8myl+036oWc45Gg5hcWlIbp7bPyPrV4EmBreU=
X-Received: by 2002:a05:600c:3e8e:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49b0dfd7d2cmr5041365e9.7.1787762484634;
        Wed, 26 Aug 2026 09:41:24 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5721a0sm21769715e9.4.2026.08.26.09.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:41:22 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 12/13] drm/vino: allow the driver to be built
Date: Wed, 26 Aug 2026 17:37:37 +0100
Message-ID: <20260826163913.7052-13-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163913.7052-1-mike@fireburn.co.uk>
References: <20260826163913.7052-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Kconfig entry, the Makefile rule and the MAINTAINERS record, so the
preceding commits become a module.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 MAINTAINERS                   |  6 +++++
 drivers/gpu/drm/Kconfig       |  1 +
 drivers/gpu/drm/Makefile      |  1 +
 drivers/gpu/drm/vino/Kconfig  | 42 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vino/Makefile |  2 ++
 5 files changed, 52 insertions(+)
 create mode 100644 drivers/gpu/drm/vino/Kconfig
 create mode 100644 drivers/gpu/drm/vino/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b548bba6525..79ccf112fabd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8537,6 +8537,12 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/udl/
 
+DRM DRIVER FOR VINO DISPLAYLINK DL3 DEVICES
+M:	Mike Lothian <mike@fireburn.co.uk>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	drivers/gpu/drm/vino/
+
 DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
 M:	Louis Chauvet <louis.chauvet@bootlin.com>
 R:	Haneen Mohammed <hamohammed.sa@gmail.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 323422861e8f..ac73fc425c59 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -358,6 +358,7 @@ source "drivers/gpu/drm/vboxvideo/Kconfig"
 source "drivers/gpu/drm/vc4/Kconfig"
 source "drivers/gpu/drm/verisilicon/Kconfig"
 source "drivers/gpu/drm/vgem/Kconfig"
+source "drivers/gpu/drm/vino/Kconfig"
 source "drivers/gpu/drm/virtio/Kconfig"
 source "drivers/gpu/drm/vkms/Kconfig"
 source "drivers/gpu/drm/vmwgfx/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e635fcffd379..29ab96f6e8de 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -185,6 +185,7 @@ obj-$(CONFIG_DRM_VC4)  += vc4/
 obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
+obj-$(CONFIG_DRM_VINO)	+= vino/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
 # nova-drm is built from drivers/gpu/Makefile together with nova-core.
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
diff --git a/drivers/gpu/drm/vino/Kconfig b/drivers/gpu/drm/vino/Kconfig
new file mode 100644
index 000000000000..fcc761b4654b
--- /dev/null
+++ b/drivers/gpu/drm/vino/Kconfig
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+config DRM_VINO
+	tristate "DisplayLink DL3 (Vino) open driver"
+	depends on USB
+	depends on DRM
+	depends on RUST
+	# RUST_DRM_GEM_SHMEM_HELPER depends on MMU; inherit that dependency here so the
+	# select below cannot generate an unmet-direct-dependency warning on nommu.
+	depends on MMU
+	select DRM_KMS_HELPER
+	select RUST_DRM_GEM_SHMEM_HELPER
+	select CRYPTO_RSA
+	select RUST_CRYPTO_AKCIPHER
+	select RUST_CRYPTO_LIB_AES
+	select RUST_CRYPTO_LIB_SHA256
+	select FW_LOADER
+	select RUST_FW_LOADER_ABSTRACTIONS
+	select FW_UPLOAD
+	help
+	  Open in-kernel Rust driver for DisplayLink DL3 docks: the DL-3x00
+	  port replicators, the Dell Universal Dock D6000 and other DL-6xxx
+	  docks, and the DL-7400 quad-display docks. A dock is matched on its
+	  USB function rather than on a product id, and identified from the
+	  vendor descriptor it carries.
+
+	  It binds the dock over USB, runs the HDCP 2.2 control plane, mode-set
+	  and the Vino codec, and registers a DRM/KMS sink that scans out to the
+	  dock's video endpoints.
+
+	  To compile this as a module, choose M here: the module is called vino.
+
+	  If unsure, say N.
+
+config DRM_VINO_KUNIT_TEST
+	bool "KUnit tests for the Vino driver"
+	depends on DRM_VINO && KUNIT
+	help
+	  Build Vino's protocol, crypto and codec unit tests into the driver.
+	  The tests run when the driver is loaded, so this option is intended
+	  for driver development and test kernels rather than normal use.
+
+	  If in doubt, say N.
diff --git a/drivers/gpu/drm/vino/Makefile b/drivers/gpu/drm/vino/Makefile
new file mode 100644
index 000000000000..6e39668040f3
--- /dev/null
+++ b/drivers/gpu/drm/vino/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_DRM_VINO) += vino.o
