Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334FE48F83F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284901; cv=none; b=W0QhOh2U7fRmULJuPPIilk0yzI5JFT/hM+oUVuRcMu2Ki4OxwEcLi7v1VYkSn+2Kpfy8mUcwtLbRHYvPJlRDBkSkWtZLnf6l5+CWjsFWZbVtvl0nYG927o3my27Ra8+Nx/qzkeE4UvRtRxJxEJkfrn0jBH24jZSdY+IHZ1jo7NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284901; c=relaxed/simple;
	bh=2Ybla6Y62reZI1CmxWmKc144ZA3IjT4POIfUXQKsL2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dre7VfTbYdFoFYjGkEeG4icdPebtK37NambXh+Ci4azO78Xvl8rir3PzXnX7ygxAHX4+CmjL4rWDYhWJOD8plb3MjqAz8g7Ckhfgf+avs2I+lTVUUG8p0I3QC5RuwHDDdvOt9DKW3/eWdIbFmsU6aoyB66tFiWP9hDFYDVY232U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=jfMK/TqO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="jfMK/TqO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49954b88fffso480185e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1788284896; x=1788889696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ybla6Y62reZI1CmxWmKc144ZA3IjT4POIfUXQKsL2w=;
        b=jfMK/TqO2Gy8jVCaZGO6zzzIHtMXpYCU8aZyPg2hoUVh8K90PDjI44DpplArnwSORZ
         /7rsbUnf415ojs2IIswTHrEVDTidjI7MBS9SUr2BP1Vq407nvY94H4kTLOiWxTReO5F3
         qeg4nz5hXI71cGPEmh00Nf7KBD1o866Vz2xSv2l/I8y9gdVy4AOO27GOPMACDdASe7Q4
         myyH9f5z7diRwLcBP/oy/H1TGc0CLBnd40axOJmZ+MD8VQwH5YJ5JXo90nYKMVigwl3n
         H7A+nJNK4F3r5VZVjf4qlJ2dA+v7SLD98fZKT6eUK4xPa/zOvHqqT8UwnxV2Hi9if0Ky
         DUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284896; x=1788889696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ybla6Y62reZI1CmxWmKc144ZA3IjT4POIfUXQKsL2w=;
        b=EmraMTP0Hx1rbwS4JHwrPzAPiHO0h8Xgv+IjThS/rJiBAiIDCrO+a8dvuWxpJ1/WyY
         5/Y4aipHvkVemskiEuflOcs1IFdeE72R78rxAphgQtVuebTI4gZYpvwMhdAobYk4QsTY
         CZYXn8UoArDtz1O4RxNtIIFCb8dLMW1gMEaHN6TW6//eyTnPkVjhatmp4Jg1oMHFIDnJ
         CUhZt7V47BEByibyuu+yq9udqJiG8lcOW/fZWZbsQdOSlZ8yoBmUjiXapwsNjQFn50qa
         HVMVnhV1/DbCX0vOogQ46yeIW3hFiUmE+Jc7DRDPj110ciRe2My5aWpJgnT4EfGYKhio
         EMhw==
X-Gm-Message-State: AFuF++kei6o5vcZ2BHnJTxnvigjBORxSfAihyDxf8gcvAfP1YsdWen9t
	RH/3tRuP9BlACbYqfN7tF9o+jxKH0vMF5BYH8O+ilyy4qhRzcYvpgUHgBSFTJSpp+XGfcWgUr3p
	i22/CE1Ug
X-Gm-Gg: AR+sD11+mNOIcb5kbqijIxrZNmUzC0X6NrU9pUMgJS/VplDktF84z2CMUwdbTIF0bU+
	wuoQrXbp726GkACQ4QlsJCQPw7htqC0IzEY3UYscza+GM6EFEsd6uH70xMiJQ8QDDyiotNiq8s2
	ZKnSYWIIpJdAPxWjhp5yLMSEFk6+Np6OCCnx3pwPBZIVk1lXOLX3s0kzLle2DTNbVEhfZnVaLqw
	HisO2fg1jc1j9wi8QQE1G3ihrI/HQhXSZ1P8dLbwYVMyvl64vlNmDhBLuylhMT/lOaN8ePky0yB
	zTJfjbZ/aCRB1eiKhzv7nfBI2Jgtn8BExCnkcZVGUwtf7VW7pkxA3fHh+05il1dx4YcXNs1fUQn
	/XLGR8lBDm0m+u9yNKUEM/7/yTOG/5wSzYyUUQrwK/utm6nSRGHXLKxrhTl9CBY20dvChnEMh4l
	OQSe3D4ISskpaF1tkl+4vxL1grw1ZfeJZpHCk0KtOf47bph3n3b7obfZPjuMf1BtwB4Rmm19KdH
	uxq8N9jO89yguvOOEsDVVmYrg==
X-Received: by 2002:a05:600c:8107:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cd26ad005mr380287175e9.15.1788284896231;
        Tue, 01 Sep 2026 10:48:16 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47885b1sm2369225e9.14.2026.09.01.10.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:48:15 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Yidi Lin <yidilin@google.com>,
	Kees Cook <kees@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	chrome-platform@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: [PATCH v14 5/5] arm64: defconfig: Update coreboot firmware symbols
Date: Tue,  1 Sep 2026 18:48:06 +0100
Message-ID: <72952b598bd73ca282026139e4a1db7af89c30ba.1788284852.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788284852.git.sean@starlabs.systems>
References: <cover.1788284852.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic coreboot firmware Kconfig symbols were renamed from
CONFIG_GOOGLE_* to CONFIG_COREBOOT_* while keeping the old names as
transitional compatibility symbols.

Select the new names directly in the arm64 defconfig so the checked-in
defconfig follows the visible Kconfig symbols. Keep this separate from
the rename patch so the configuration churn is easy to review
independently.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 arch/arm64/configs/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..90a7b49d408b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -267,9 +267,9 @@ CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_MTK_ADSP_IPC=m
-CONFIG_GOOGLE_FIRMWARE=y
-CONFIG_GOOGLE_CBMEM=m
-CONFIG_GOOGLE_COREBOOT_TABLE=m
+CONFIG_COREBOOT_FIRMWARE=y
+CONFIG_COREBOOT_CBMEM=m
+CONFIG_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
