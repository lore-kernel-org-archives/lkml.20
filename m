Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AACB3FF1B7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511355; cv=none; b=P5et0Bf5FTdyt+pt2/gANaJ+73ukUqy8IooKlAA5IYRSm0U9ryFBNZ3nTLzb6uHKzvHaXOaZqYAfuIqHRlOh28Fjqc1n4Z5h4QR4YMJDJMk2ge776R4U+63cdjPr8wP0DwVWCiQpYJMgXhfG+Fahy3AbDY9eRhdHoMzo8GIeXe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511355; c=relaxed/simple;
	bh=B7Lu+PyhQKrwbSeiWnA/FCibSLvQ75jT0I67pSzcZQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9dzpKyHUIVX20j+Y5cr+eyu5VU7sc+3WGwR5zqUxpc9urW4ssLHgYLqtGdCUSBfcoPPlKC26MkbrzBC2B3Kx2Cs1R7O4dG04MOHDxh4RiVNezJ70pGaSBhKpyJ1HlWkw6v6GxW3CABb6Lmo+JSYUgh5UYwUD9Crpok9vEIkd5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h+g1pKBE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h+g1pKBE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964e480f76so935090a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511352; x=1789116152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=h+g1pKBEmSf20QLY5llg49jgQylsjtbjFvxfP/fbBHy4rESg23r/liAcIo5ecMNYYA
         Z/FSNmOWFnd01kkoitWsqbWItWzuQgyEUEmMNTsvksJdk2SVFDLxWPkXZ+D4kfaIxFtC
         nRNKUdCW0bNipWdS7AzycmJwEy0AxLgkBTVzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511352; x=1789116152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=AesD1i9F1M7+J+IZ/+UnesPNfL7iHD44UK7531+fyNNnp64EvXKX7wDMcJhE0XJP4v
         WgYbfscOchJIz++r823F6rwa6r026Uz10OqrhNCHwj+RiBOeWYedeVxzK7jgk82Afe+9
         5oHWGna+KkbKphjI0bs1fWkdhbUz6T/elmy9hW7Ho4TCnSuaGs4ihH2YeXeVRbRxD94d
         iv9gljzHeIDmHirFKIoO7DpW0hEAhMi1C+0V9o9BoDd9FGWi0iRO74JqF53EB7k7+zkA
         T027A4YwMhs+wSmZONiBjJRSFLPI95ZHxjIL4eWaqIz4dJlszFUYGtpdIXl8Yv4N7lkk
         5R1w==
X-Forwarded-Encrypted: i=1; AKwUvBx4N9OKIxG9VgA7ahDn65AsuzwgTKZKTqgnm9/0j/ivY/69GC7KME7mg5aV6unicYN/Ts5QVAi8Cfo8/SE=@vger.kernel.org
X-Gm-Message-State: AFuF++m6EHB6e2CEBV/YIv8HFgOvYARQrHjQ/J/PQwRHuBDflxsH1i9g
	jPSf5aWpYsVWR3eh6eUeFLkuzxgnEBy71hSzyGYwTW3orxJhHP5cY0QZCmolqL46rA==
X-Gm-Gg: AYBFou0nkN2h4CIKDWXohCR+zHFUhMONFCtwJR6bQtyUznqpKGsH3DzeTDPOSiqW4SV
	Xi5D3TW6EslskfKMRBU6OKbfGfUeLNVdOtBXcDrAHS6BYwS4IvH9hXadSsK3DxVscj12nvWMY7d
	t+ORjo/oVyaCR2uCmY0h0g173Y8Hi7ktSz0QWECSRxvil2JVzPow1mZEb1ZRLx/o8O3wgvSXiyJ
	0TI7/G+TcwwQwWRwIEY1nz5GjQZ0BFD/tMU/Aj71I/g6kjsHijfSaGJpBmsKorwcBzBhBLECpae
	C1MTCgbks4v8UselJbGtlYl/pbL/RV7kMiXmj4kDr6p/JT8XYJgETNNDGPIxuiW2+0wyGVl705N
	wrFnMNkdGqKetLu3Vzc7pndFfsdPu4IOlc3ReVIVFpvgDqFWeOmkf+rMu+Ixxn2BdORzkaARJ3E
	4NlQnZkXDor2EQMmtqssQxJMKc/c3GzuCjfgicuM0F6ukI4GQcAEynuhmwwGE2EhkEzCyz+g31v
	qRIkQ++ltyMH9d8XLJdHYHybvoccu3vxFlA8F+8VBtB
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr7387796a91.18.1788511351714;
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Fri,  4 Sep 2026 16:41:43 +0800
Message-ID: <20260904084158.1341550-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..16e03ec8d1ab 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.979.g7e5102b832-goog

