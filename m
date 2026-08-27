Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854AA29B78D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869656; cv=none; b=OzZW0LjcmMpBZ1qT0SlQsNjCjE70qevNhS6fQWgtA4kpKBuDfDbzPcqArrUSUVOwg9fTWyFAvSbXjjOcwLxiZSLqD+Ly1PAepAgxJo5z21z0N4zzMvHDd7pW4qyOJDflFyZhOPnJ3WbkvW/xS+psamM3bDid2So6M8+LJlNe/y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869656; c=relaxed/simple;
	bh=KK5wwKYdmpiqZuHKhQ/895QfuAy9l5rfkrVu6CKJNjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tadlnkVNmt82Fa/m6x2gMPTa+6CvFy9iK+DGIjFdZ/B3WM+WQphLqbpHaRU65MxQqci5ZH23Wkh0kHAm1kK3dxUIJmj5WW/+1Ktl27rPvDbW8hE+Xdod6PWQLg5NO6kFYH1aVT9wBdKAeXQfw0DsY7hLSLyTnt4YFG93MjBET4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Vm6OAapS; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Vm6OAapS"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-455ee8f529dso97827fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787869648; x=1788474448; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j3a4OCom4f4+u6zoLwVfnSDf3nEPs11dIFGC+l4WRG0=;
        b=Vm6OAapSZqUs3DEP/Y4+C9R+tHHp7iPrzslI5Eu7GFYuW4Cu6iV+3/b7ZoD+oX1WbM
         4+Gm5Y7mPozFG02rTB9M+QwhQAaaHIZHXY7ObYoqS9Agn1XVOwrh6MH5BycdI/0a0LI1
         Mi8bevsFNzSdXL6DldyrLkDJ3Vti+TfvHKXnL4pVEXpg2CnX/eoE5uLvIl7EW08Qe0EI
         kpqB3Gw9YAGQXcYYCjhhav38agpv7ug1uJeDD47Tjc2VM728CGWvQ7vLYx9jb7i2ocWE
         HMDswWB8qBDXFqgY4cyQYBgqzWju2q5B9A4s69H0P03eWhUo+Q37SRz7PHulcWgt9ROL
         VLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787869648; x=1788474448;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j3a4OCom4f4+u6zoLwVfnSDf3nEPs11dIFGC+l4WRG0=;
        b=G+UBEo9FgHJbqW0biI8p1qf06WXETKhaSm1+GDejN4lwFmYVz5NydKNfG7MxJVC39o
         /jKIseOkScx8bxBKOQmj066h80+pp0tXQhUVy3hQ0ig83zD8obz2eciqeaJNed4oa/Qd
         jn2cFrSDIXXOLwXcV7Z/CSURyheQXykpsHlJ+CaeQL2VdoglRY7PoQrhHUYoklJF5i29
         5ZgzIC/GfbJ2/yQEGHg/2spmX033xfExBgjbRkzpcqVR+ts5uHiBU7I2PqEmwVMlNmxd
         wGrbB+4X0MOXkgsEeh+Y0WPBeF3JBGkJDaqwWNl3it5beQSmeY6bbjxtmhE+vUDlj2um
         cUXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeOtPxVq7VlTxndakfM8rVaNCBPnxXeCGVeHPjiWQbPaJVean1l/MTD32xnNuQ+OWntfMt7bNI2MwG9H8=@vger.kernel.org
X-Gm-Message-State: AFuF++n2RAJ241esQdTxLsUwYxRwPEKqYnTTvOa0G6Va/WSrZpZx5NH4
	qVkLgN6/8r0gmByIYGXXFo3VuSZEPUxiAV5pgQISzh2X2WeE0MGsnip0NTLbxjRSnq8=
X-Gm-Gg: AR+sD13uWXmT2lKQAneCm2rvO0X2XfNOjbvJhboEYGRWeScxLB9ukVxGFwtoohy4dnx
	FW1xxogv41/qyCGHd7Dr6fShapiolSwPv8IvyF43nsENB2COdJTaWyyFcTUtwxbI0uzHIazyqIo
	OxY/W73IJ+rwY8BT1XV63dFlUDu7fQiSXpnyh6AdhFqtBCnp1naKD5Oss3/HFfwPqIy0ZnlSS4P
	V3JVobJ5aOA37wm2rWLs3h4Nb5unDXs6JYX2KUE2ziODfevdciYJaib7QiQ28IdFaxwFqfmZayL
	QN+TkPtS2DOrquK8gpct0+WTaLZ9EKxkhfEQ8Y/VmSeMniK8QCYuRApSLzdUxVko0NZpqGhZdvT
	EvTfdMaYHAPpjBTtrrg/r88A+dkjaGAXsmxQM9FYnJiul6S+Mb4CFgaPrtMHLrpCO9JUGdLlygF
	PoTCLHxFGeJ9zQ46AQiD7IHPSahw2PHatmGOcukCj/ur742HoxSFFTdWXBHd94DQjixFw164eIE
	gA6
X-Received: by 2002:a05:6870:e184:b0:45e:edc5:f464 with SMTP id 586e51a60fabf-468352c3460mr2950734fac.2.1787869648030;
        Thu, 27 Aug 2026 15:27:28 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:d288:6f77:e285:6925])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46736444b99sm3336392fac.3.2026.08.27.15.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 15:27:26 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Subject: [PATCH v2 0/2] iio: adc: ti-ads112c14: add burnout current support
Date: Thu, 27 Aug 2026 17:27:01 -0500
Message-Id: <20260827-iio-adc-ti-ads112c14-burnout-v2-0-00a1fab9e2d1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Qy2rDMBBFf8VoXdWSLDuJV/mPkIUek2RKLbV6m
 Ibgf+/YKXRXuhouXM650oNlSAiZjc2DJZgxYwwU1EvD3M2EK3D0lJkSahA7pTli5MY7XpBOllI
 5qbmtKcRauNzrTuhhOMihZ4T4SHDBrw1/Oj9zrvYNXFmZP40En5W85Vn71dKKP6UuhoKhxpr5F
 D1w72W/F7teD+Iwzt1KtyYD9aYJy9jQltwmmCKZWiK2dAlwZeuyG+YS0337h1luQ/735FlywS9
 CCe3AWejM0Zr7O9oEryRm52VZvgEKwJkgZQEAAA==
X-Change-ID: 20260724-iio-adc-ti-ads112c14-burnout-184304669165
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=KK5wwKYdmpiqZuHKhQ/895QfuAy9l5rfkrVu6CKJNjE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqkLm4Fz2mHtHyWQ0XBc2Qmj/qjJh3TPk1P8TtK
 miB43F87G2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCapC5uAAKCRDCzCAB/wGP
 wN8SB/9p+4CvlDjcxefSHjG+EDisTQf2XHYH+MGad2FjQNiA/7AUnbPHRbHFYtkRXRjDODYO8tE
 IdCXHESBTof23jrih1RstxGrO3ttvCpgk0YCF/56bpILOvSrVXbaED9T+i/9ZdeuXy5tgnyLpX3
 Tamt8RU1yF6F8gklEpzRYRD6vrgKMpl2AURQvkB7is/QT/VAJvpQ4PKRJkiok101zrg6CjHVftk
 t1NEKsUjcryUI4FJGUHwNf0JVpMMz6kug8l9b1Cava++6/4wizNfx4nlEz35suGDxpUpjsMCcyt
 D1ou8XsLYCBL2j9A0PWSUrkHG9gpZyVORbWHgssRYte/+6VO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

The TI ADS112C14 ADC has a feature to enable a "burnout" current when
taking a measurement. This can be used to detect open/short circuit
conditions of a connected sensor. However, enabling this affects the
accuracy of the reading. So we add a custom "burnoutraw" attribute for
this. This works like the standard raw attribute to do a direct read
but does so with the burnout current enabled.

If this sounds familiar, it is because we discussed this on a similar
chip recently [1]. And this is why I put the ABI docs in a common ADC
file rather than one specific to this chip.

[1]: https://lore.kernel.org/linux-iio/20260622110223.7e854dde@jic23-huawei/

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
Changes in v2:
- Rebased on "[PATCH v4 0/3] iio: adc: ti-ads112c14: continuous mode support"
- Link to v1: https://patch.msgid.link/20260724-iio-adc-ti-ads112c14-burnout-v1-0-f0204cecbe3a@baylibre.com

---
David Lechner (TI) (2):
      iio: adc: ti-ads112c14: add burnout current support
      iio: ABI: add sysfs attribute for _burnoutraw

 Documentation/ABI/testing/sysfs-bus-iio-adc |   9 ++
 drivers/iio/adc/ti-ads112c14.c              | 126 ++++++++++++++++++++++++++--
 2 files changed, 126 insertions(+), 9 deletions(-)
---
base-commit: 22359083a9e74d538ce383d5c0ee30cc20182187
change-id: 20260724-iio-adc-ti-ads112c14-burnout-184304669165
prerequisite-change-id: 20260724-iio-adc-ti-ads112c14-continuous-mode-dd1580754609:v3
prerequisite-patch-id: 0be96266a72458a63f7da7ca876d87cdf5769a8b
prerequisite-patch-id: 32ba48fd5eacaee60d50a0272557859cc9ea83ca
prerequisite-patch-id: c1eb09689bd5f259ea0110cbbfb3fa76689bdb04

Best regards,
--  
David Lechner (TI) <dlechner@baylibre.com>

