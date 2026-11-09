Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229193;
	b=yAuAcGo/2qoXWOzYZAS9NnpqbVuAs1ClZnuHULooEJzN142UTrhRrIf7mxUxZDuzRAiw
	 4YY3YPQJaUloxQQaizUmfjtdaxZJhkcebT2zvTJQ42SdRbO/FTaym/Qu64y4od9IOqtYh
	 A4/Onc0LAyL+JXkiq6tiAuq/ylmYTuWaJZLiKC9EGeBtn36VEoT/snndEJBWCOX8RdyL+
	 zvVtmxUYHONcATgpssP5RBrQNlJDJt3yIyXhuUfk7SeXbLGFYlbTOvluJ2GXsAH0JrleI
	 aqM0wCPvq2fDxJDVyHpZ7xZubMj/koFNTBl+wasKaBBR/jp/ldp4aKdgCXkpoV2MI3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XFLyLGgFG0Vde8F3up9OcQyEBIvxvgIL5mkoTy3kJfM=;
	b=KHCEKJHYcs320mKu7AmPaqL4hFXY0vnLc0e149+ewH9T1ugx60jpeyvWLJYXz+/rIeWC
	 +VXoN+xLVevN498UmYbwCKUB6GXyPOc0gWkeiIICaFyX+PiKlqXE/bTmrfOEr2KJn5zBG
	 7SlH4vTgAJsya45Ngby2kCjQHKhycw7Cp9xP4kq5lb0AXoxbSL7tAhSSlUwZA4qTXMhHO
	 MiAQtY6gqMhZB8d1SpRHELJox9uZITA45FBoOluX8kLWzWX1sMfU34Y128dv2wUSp77Pb
	 7LhpBPxUyRPKYQ8cBRmqV1aJ6r/yC7hWXwUOGf2RrokzgfVxPys7jlRSg+HwdHmEE/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OiWgrrZc;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA97606D801
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA97606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OiWgrrZc
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eac4936dfdso398865ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229192; x=1794833992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFLyLGgFG0Vde8F3up9OcQyEBIvxvgIL5mkoTy3kJfM=;
        b=OiWgrrZcSCUT+oz57GpP5Y249snmCYNuLHtvhWPBE0DpO1eqKsVJaSU5w+zQjhUQSk
         smNpba8SmvTqBHQv8io8d1rZOi96kSEbSNgSze2avh84VeiQg/hUWL9OMrEo/t+3M+05
         WBt2sJ9xHbAymz+DN/mvkcFki1pCwQEWcHQTB2npj94rjmTZ2MYp+FYLxn07YiQK49BR
         2yTmCLtjccZAsV4WzLqivMmqSlooGzT35ITt+YvHV5Pt+9jGJEIsn58MkyOFA9oCIrLy
         /VE13FqQVNbDL1G7vXK8O4+nrA3zw0UXUt4uCDyPlBHL9Hl/Rg2o8XSUa7p6bF97xFRd
         0LpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229192; x=1794833992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFLyLGgFG0Vde8F3up9OcQyEBIvxvgIL5mkoTy3kJfM=;
        b=GJ/dTey72mbYPgRh7ME2HxBPfx42dHnCmEbE4DwfCWD8UFRCwuPJrgUSwq0C9AZO2p
         eGqTo5MwmXLI/WyNbgDESL8/klcKR7geGy7YuAxActhkr+tn4yaV8VrwuJaagVnbIqGG
         HvkiSd1kEQuPTMT07mieuA1uI41DaM1OBV7QTwFSTiLNc7A3LPMVzO6EX6Xtct/3OKrH
         IZ5sbo961CK96EiQr58Y5hX21HRjB/TNVyZkW+r73f+Nm7HYvz+5k6SUVsjJB4AEUGZA
         m28yq87B0WzWuz7JEcHFaTPqpwI/LvSDvcyfMDDzY01W4G13qZx6pWWE1r3OGQwQcBiy
         Sm2Q==
X-Forwarded-Encrypted: i=1; AL+hErGvxQWpb7ukTNB5/zjATKCFqsRmeIn8l29OBOEWbT/D3YjVShYx1TsO2174oulbX6GIPl5esbT6+499vnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/326gSS1tz1LFk3+ggXHoe7SNFGzjTpqDNJaZVNovADoM1uFY/
	Zhf2vJrcfIm7L7QX0iJ8HQGd9tNtZ871H9hhqC6uZy+CFkJOZ9ZVlBDB
X-Gm-Gg: AYBFou3zr6Dm9rQMfJZR0rVHl1FeY1eghm1yIaoZw6zSaNbawN3biTrHqadtLRk+AJp
	5qTBrf3rfj5KkiTXwZYUXknb0zDBNASWSMrJGotlIV2dFdt8OOyV1cfs0NWnADs2rw14y781Vvl
	qdPDbiAzwcj2OHzNAXx1vZOHNkT8rDl7Y7psiVxWalZatzF2WlJz2agkDuc7FLIzjR9vFTw3znZ
	chJTdCbX+PmzQj/T1l9QUKA7FDH1yvb5JMBWgN3NOlocRxQjulQKwHHoe9IuxR1nq5HBBfmYQxa
	0ZKgBtq12SnLuKizEFXVm21yU/Fzs+kpXXypmebikEjvFzi4S+rFOTNxOBDVVmzah8vWxaY9nyI
	eC+lKu06AZtsZhYSb1gr2ESCLKqbkwRCF6Pt/QR+SfEasbBOPhHW8mhd86xYRAr89xm75DR7GbH
	wEauTboFfqk421QPjZ5bedwTuYb4dke0z347KdHeQGYG2/rhC3R15JP+uxTGfBjR4QEObU8HQsA
	Jzxj3+7E9hMitsk/f6wXm2tGQMGwTNosEphNwfqSuQRVxXPFjGz+jEPd9187LM43rWSEaHqEBur
	0Z7GAR/U+4SQzGEZMT6AAv1qE3dwu0+Bme/UcMP9oEjNagUUTHwTrYHX3ttGdctKShI=
X-Received: by 2002:a17:902:d990:b0:2ed:2a1d:e36a with SMTP id d9443c01a7336-2ed833c586emr61760975ad.1.1794229191555;
        Mon, 09 Nov 2026 04:59:51 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969694aasm1534153a12.25.2026.11.09.04.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:59:51 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Mon, 09 Nov 2026 20:59:30 +0800
Subject: [PATCH v2 2/3] mm: remove CONFIG_ZSMALLOC_STAT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-zsmalloc_stat-v2-2-caee41684aba@gmail.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
In-Reply-To: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
To: Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

The statistics interface now uses the debugfs API stubs directly, so
CONFIG_ZSMALLOC_STAT no longer controls any zsmalloc code.

Remove the Kconfig entry. Replace the remaining CONFIG_ZSMALLOC_STAT
settings with CONFIG_DEBUG_FS=y.

Suggested-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/s390/configs/debug_defconfig | 2 +-
 arch/s390/configs/defconfig       | 2 +-
 drivers/gpu/drm/ci/arm.config     | 2 +-
 drivers/gpu/drm/ci/arm64.config   | 2 +-
 drivers/gpu/drm/ci/x86_64.config  | 2 +-
 mm/Kconfig                        | 9 ---------
 6 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index d44674b63715..83193ef8efb9 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -100,7 +100,7 @@ CONFIG_UNIXWARE_DISKLABEL=y
 CONFIG_IOSCHED_BFQ=y
 CONFIG_BINFMT_MISC=m
 CONFIG_ZSWAP=y
-CONFIG_ZSMALLOC_STAT=y
+CONFIG_DEBUG_FS=y
 CONFIG_SLAB_BUCKETS=y
 CONFIG_SLUB_STATS=y
 # CONFIG_COMPAT_BRK is not set
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index e00e252d4694..694a309377d5 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -94,7 +94,7 @@ CONFIG_UNIXWARE_DISKLABEL=y
 CONFIG_IOSCHED_BFQ=y
 CONFIG_BINFMT_MISC=m
 CONFIG_ZSWAP=y
-CONFIG_ZSMALLOC_STAT=y
+CONFIG_DEBUG_FS=y
 CONFIG_SLAB_BUCKETS=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
diff --git a/drivers/gpu/drm/ci/arm.config b/drivers/gpu/drm/ci/arm.config
index d7c51670da2f..fc0a8a4bfb18 100644
--- a/drivers/gpu/drm/ci/arm.config
+++ b/drivers/gpu/drm/ci/arm.config
@@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
 CONFIG_ZRAM_MEMORY_TRACKING=y
 CONFIG_ZRAM_WRITEBACK=y
 CONFIG_ZRAM=y
-CONFIG_ZSMALLOC_STAT=y
+CONFIG_DEBUG_FS=y
 
 # abootimg with a 'dummy' rootfs fails with root=/dev/nfs
 CONFIG_BLK_DEV_INITRD=n
diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index c46125c1f80f..10b01b55a66d 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
 CONFIG_ZRAM_MEMORY_TRACKING=y
 CONFIG_ZRAM_WRITEBACK=y
 CONFIG_ZRAM=y
-CONFIG_ZSMALLOC_STAT=y
+CONFIG_DEBUG_FS=y
 
 # abootimg with a 'dummy' rootfs fails with root=/dev/nfs
 CONFIG_BLK_DEV_INITRD=n
diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
index 7ac98a78691e..8225b806dad8 100644
--- a/drivers/gpu/drm/ci/x86_64.config
+++ b/drivers/gpu/drm/ci/x86_64.config
@@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
 CONFIG_ZRAM_MEMORY_TRACKING=y
 CONFIG_ZRAM_WRITEBACK=y
 CONFIG_ZRAM=y
-CONFIG_ZSMALLOC_STAT=y
+CONFIG_DEBUG_FS=y
 
 CONFIG_PWM=y
 CONFIG_PM_DEVFREQ=y
diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..4a77cda7f1d7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -130,15 +130,6 @@ menu "Zsmalloc allocator options"
 
 comment "Zsmalloc is a common backend allocator for zswap & zram"
 
-config ZSMALLOC_STAT
-	bool "Export zsmalloc statistics"
-	select DEBUG_FS
-	help
-	  This option enables code in the zsmalloc to collect various
-	  statistics about what's happening in zsmalloc and exports that
-	  information to userspace via debugfs.
-	  If unsure, say N.
-
 config ZSMALLOC_CHAIN_SIZE
 	int "Maximum number of physical pages per-zspage"
 	default 8

-- 
2.47.3

