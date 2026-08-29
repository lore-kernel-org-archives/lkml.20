Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD795418355
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020780; cv=none; b=REMmZs4MOHlBhNQiIYxii/lvcMCM1r8R8JnBK5acuNdB5UDGbJBFbDlZHTWdVcVrcYsNVXuJtHKeU+GNXcKxqWsOwnhEjW0iTxrNErMbGzcVfEiyHOCBR4luGy+xGVQa/cItGPcg+vNQcUH6Xka+WMSy73r/RG3B/WUjY24khGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020780; c=relaxed/simple;
	bh=HXABlvbovapo8X5ULjVoUp05rLGCvcH7Hwv2idfGruc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVWpVGEiu7S5iI+vWjdf8Ac/mCIQ3++WdDs9U62muzSXp3uWufX5/osVxYo6JYKfLzc/fyIgQY1HnUGyvIg3YCbcCfUzqU8kRgDZOLZtxF+8R6k+IdWPHfpWaWYBp+I+OCtnbC7liszxNfZcIwaoo4nISVCUA6UGnbdWnQoyRNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQ+2THhC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQ+2THhC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48433f36a21so211062f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020771; x=1788625571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkSPzkNePAAObmivPyMjVU/afPEpN4pzFimu9a853YI=;
        b=GQ+2THhCw2/8jDwj9Acy6LyPiCNTRZKWaY/gsDicqjjW9zEZy6p/Z83C2CUvWJSMa1
         24YlOcoft5+zaRYPjl6yG7ozuqyP3klcBff/ofgxMV9Wnsajv1nZd9jX4W6hnBEcG45e
         fhTOZ0SRwe2DTclUjCb2nQDKgXSa4nGwwyzsGjxrnmAaV5REdnqI4VInjgmw2hKf68dO
         5dNGtXVBOqfQmmOk5FKC7ymOxk7Vd3K0Y0zaQN/8jQUGODxz1DIsoDIoIhj0bWC4fJFb
         9UmXziyWfrbwdTNxCEm6y5+bg5RwZ4k6jMmBFlVYi3AcpEgjKXQ6zY0rSSbGF08XTRGu
         2IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020771; x=1788625571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkSPzkNePAAObmivPyMjVU/afPEpN4pzFimu9a853YI=;
        b=P3BcOD13AiKAnVRritzzWfIN1bOx6o16O1gjn8aUpRFGeIOd/6FPil3STiZLZfQVes
         v8kVjxXc4JZXvNdbF5sSHRO/2WSBLL+MHwer56Ap5eUuimP+m8Um4nbHR5xR78Tx1QA/
         8x+YH2QW1befOtGF32YaEtGdTc0NSfO4nRLnfZENIIuff3XRY2A4qAGImxDZlXubyAVd
         5I1jMf6HCpQoSO+X78zKcqolfTwdOxBvX8keR6GfNXurp4sFcr5coXw/rDzoZ92/4eUu
         rjdDRpDewNmleg6yN+BAN+yBzpOjBfn7O8uZdD2XjnL66bbSUh/0gCPLim3oSY98O5rk
         NI8g==
X-Forwarded-Encrypted: i=1; AHgh+Rqqikv2/pVneIKqXwogiXeNGyyUbJeE0g9EUXoEzI+PF3shez+vA7Ea1pWU/k4gf9ms1mv1iJDgxAqmmCE=@vger.kernel.org
X-Gm-Message-State: AFuF++nxdazPfTn82wuObMPAtPr1JDQATzpOKSZzuw3u25nI3CJRNaRA
	42OdbUjLUVAVnocT1lvs/LBeJ664+sx3BcXQxE8pDezD2ft/J/PyK/1HP7TRiJIk
X-Gm-Gg: AR+sD13gAIQO2SnxbLF6CUrCWA994YPDUOAWeCjGJSXqc+6Ll8LQQvoU8hxKDo3dbiW
	UTgBvtifBalypqRJXZ5foDlUoAGhME7DoiIzp/h8O9WHI9sC2mbpuJWm1Ugh0Kfgf9GpNJa05EA
	pCVxiQeJuyM0cdcWxYb30R11g9ImVltJ+fAHl/+5+GINtneTOUf5khdrctHEU6a6ifczjEMJmDe
	DQCJzkV+qpWfRQh5drgJkfN2oxoBL64FP/fEq3OVkQTPhta1CO9ABRydDALVYkI2r+lNdBHN35f
	FPvQDRI7t24HQy7ocvwsiSpEQk3jvfuX/L4+kyUmcLdtIlfRIBuAhRiEgOghL5tysH5rSY7LMiw
	ZatA/mU+SRMOyvzhEUboJeIpVmNxb/svWbAjRlpbraYWCY+XFx0Hx4/upznjYG+CldEVqC8YuCe
	2+s77N6QwzFJ0gwn229XkGIEJo/jcpZ/OJIhuNuKe1qAoSM08T7G/gbPhRg8P7sBkZxTh04Umxz
	EYzDyHyytGbad0gGZgUx4ScEdY+u1l99Jdp0bK3hY2aKPz1/Bg9z0vwSdMESsP+7erLyGA5TDCY
	ItxHoXnnji89FXCWmLPH/rTpXoKZypZlneV5kWzdkKKP/GhuhKDScaZMtCAsXVhq/+Kbs5aSVVB
	ITmBiyw333BXJEbWLndzdVZBn
X-Received: by 2002:a05:600c:4ecc:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cced9abb7mr51496135e9.8.1788020770940;
        Sat, 29 Aug 2026 09:26:10 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:10 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 18:26:05 +0200
Subject: [PATCH v2 08/11] iio: temperature: tsys01: reorder headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-kernel-header-removal-v2-8-c67739d5dedf@gmail.com>
References: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
In-Reply-To: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=1038;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=HXABlvbovapo8X5ULjVoUp05rLGCvcH7Hwv2idfGruc=;
 b=OUcNmJXttKCBXh93LUFXqZBO3BpdQ8MEdMvSLIQiMYHIyg00ljkRND5HimopHWvwTUm26w9Mf
 p1xZ78XkxJCDlNHulKplqUv/yOSde5KSTmUx9ds6Zr6wbo+gbY9XM0e
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Sort the headers alphabetically and group the IIO headers and vendor
specific header separately.

No functional change.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/temperature/tsys01.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/temperature/tsys01.c b/drivers/iio/temperature/tsys01.c
index 28b3ce022ce7..14de67ee8be7 100644
--- a/drivers/iio/temperature/tsys01.c
+++ b/drivers/iio/temperature/tsys01.c
@@ -8,14 +8,16 @@
  *  http://www.meas-spec.com/downloads/TSYS01_Digital_Temperature_Sensor.pdf
  */
 
-#include <linux/iio/iio.h>
-#include <linux/iio/sysfs.h>
 #include <linux/device.h>
-#include <linux/mutex.h>
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/stat.h>
+
+#include <linux/iio/iio.h>
+#include <linux/iio/sysfs.h>
+
 #include "../common/ms_sensors/ms_sensors_i2c.h"
 
 /* TSYS01 Commands */

-- 
2.55.0

