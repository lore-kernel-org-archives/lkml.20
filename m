Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB5B4749DD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781958; cv=none; b=IuPfmZj1qqNLRFJ4SiJlpC0o82Gz6ItfZG72Hd9XGLrFcCsuBLm2a/CKBxdSMSqu+PRxybWrwSPYwswpDxAN3pV0OyG5RJmx+84qgfbPDminZsZ6vtlRm1BmJuFLMSCv08BWEr+HeTDY6VsQqEGMP+B45l/o/9Xvv9/nF2MuV9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781958; c=relaxed/simple;
	bh=q69YEzhTEBkji3Anf67azf9FUm9z1KB4pZFc1XEnZ5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUg447s/JiZLU/UdiZWpLkBUO1clRN+r30E9k4UGcP1eD7XuMk0kCS7m2gMyn6uJ7r0XX5xJawDpS8hCbaGVPPUmm3z5E26Rh0/z+G94tpcmLar43hVMSBo2hp0k2eBWZWzR+0y/a6JiMQXeyogzKm9Bui475QSks5vU/hNNhcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9CUiKD1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9CUiKD1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so29114855e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781954; x=1789386754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vgAaxOdJ37XQvKZXxM7LpSpiTxD4plNlhS9nHZF19I=;
        b=d9CUiKD1Dhh4raXqYeqCCv4ZA6hupSZ6ffiMX59fYoeAITe6T3bVh80hcUFOu8di+m
         XV/yQg4ivOK4Zx00eoaW/XEnljL7znOfXsspOCqEQw6OarxbMnfshSZsFyRdyphZcXDc
         xO2uvoIJNNwffk+FW9YQJMXyCbSUXmPoNeGFdq1yxmgjU0fdX4KsZIYafcl5A3wfb9pP
         p3Peuhr3TbtzAJcDDWurT1+jOroTjVxpGFiLpvFNauetfRAuhZMNQzZ57Gni0TqEZ0vn
         9uOWya/RktoI87XMBPJ9HEmxADEJWuDj1zY7UA8XERBxYU6RjNItO1v117aJ6WpaSLNt
         5qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781954; x=1789386754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vgAaxOdJ37XQvKZXxM7LpSpiTxD4plNlhS9nHZF19I=;
        b=keDQ/Usmjx9E3sBd5wmEsHiIXYmiQC7KMWGZUS6jQ28NdykNjeZS5bZuNnkU6Dvji8
         XRgv9JWq+7Ojb51WPIiwhEDs96ibPqE9kMOxFzE36UHdZORGc5kz9lVg/fIVJRSwHyPy
         Ey4FXHbgSAjkEn8OPRVBc2n2xVes9GMt8NIrDm6JTtSNSCgvJXBFrFngn3wJ9Z1JQoz4
         J5Dp0ZlQK8V39YeotLN4Pf1B0rcrdgq/CNgRYShmdQ9ZrYqjMFgkjo/z5NxmCLr/6k9v
         LitNLK/ywBjsdHqTgky8bXciPSuHAxfQABwSm5Z0Be6xxRwXETeOanZ+EbSTISm8aKpI
         kUSw==
X-Forwarded-Encrypted: i=1; AKwUvBwitqC2ixDzMceTq20axQWc3qQEtsksdnCOWSV8JOLuPPscUpdpiEryJqkZ4CChQJOlZQnX9x8C+H23tW4=@vger.kernel.org
X-Gm-Message-State: AFuF++nDMlIPr3uZiN19azcFrrUeZHxTkeDkU3LEQhFfM3A55OkPbAoU
	a1HB18FlS5oSlSXIdWqjQpqniKq2s1Y5gp4eZZCiWxZsvJnTkc7Ofd89
X-Gm-Gg: AYBFou3t1SV83pI/GgB9EJuH/9//uP1Jtk/wHE7HtWevJxpnY+JXGnJ50Us3+VtlwUo
	jEcaNBpZtnnNHXKXcsDeZjepfIjQEJKBdjyBOeSnVGgbLDsZw60KWv+c+eG912SOwcr/8JTSgwi
	ZBJJzsyq05eaQ39vVCcjD37sG0dWa7vzSduzTBMQOuSzoLr1iQ68ZSWJUmOMd+qhe3o9QVwpkTd
	l94wjQAEou/bb+TsKTB+0+bUYd8dWhNKmTIeCva1EjFz3MeaBAoni3d9zqBpX02Trh07BCeXsdu
	6qn4Mfv1fTw7T4+G15UF1GW0Z1ozScT8ZP6i+T3oBS25Oa9CiFterUEI+0Q2BgBcsbwGpednW5K
	zCUhfV4jD7zWUpli7TEe+3I2yiRt7NfWJJZ7oPpmGTcMG4abzw/j+450PbvPUI8sNZXEsc12zgv
	rvrBRBlJgmJ3pCDScoHWYdbaF/ZfZRVOlpY70oryBJL9SKQOqzFNWJrvbtsubFOZ2k
X-Received: by 2002:a05:600d:8497:10b0:49d:daa:af6e with SMTP id 5b1f17b1804b1-49d0daab034mr51583285e9.16.1788781954505;
        Mon, 07 Sep 2026 04:52:34 -0700 (PDT)
Received: from Empers0n ([193.23.219.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26830718f8f.3.2026.09.07.04.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:52:34 -0700 (PDT)
From: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
To: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: jesszhan0024@gmail.com,
	conor+dt@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Subject: [PATCH 0/2] drm/panel: Add support for Samsung AMS662ZS01 panel
Date: Mon,  7 Sep 2026 18:51:28 +0700
Message-ID: <20260907115130.95394-1-sevanevorotov29@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Device Tree bindings and a DRM panel driver for the
Samsung AMS662ZS01 FHD+ AMOLED panel found in the OnePlus 9RT (martini).

Vsevolod Nevorotov (2):
  dt-bindings: display: panel: Add Samsung AMS662ZS01
  drm/panel: Add Samsung AMS662ZS01 panel driver

 .../display/panel/samsung,ams662zs01.yaml     |  75 ++++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams662zs01.c  | 398 ++++++++++++++++++
 4 files changed, 487 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams662zs01.c

-- 
2.55.0

