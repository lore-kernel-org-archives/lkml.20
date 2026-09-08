Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9617F5921E5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888303; cv=none; b=gWOmcyxIlrqwUTLiu42HCoHSNlyqbqRBHVjonMIrzndZxvn4liBwMbI1aAlqHz875427N1jIbv742q2mRtuJ2vDTPcnFP9UfWDSRlPZXcD609HZEk1CxgLfVAHfyyzWZEg7gh9SbUjfiVu5UyUTXOssNvil4Dg5wOyhVUoc847E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888303; c=relaxed/simple;
	bh=HGcGydyDeZTeqtOr6+V26MAEuex+3SFEV+2bHwgn6gU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCwzZ62Kz4zB3xihD82r6SBS7QYO8D4BTjpY3Nc9JldEg6YPaGaT6tZG3WX2MVvTOh3s8EwJJicOws0a8+dkXzTJbBeZz0CVrIqpEQTYCtj19/XwPzc1YmYZkp2N5GHSkmMEU49+NvhIqjhAjSUnw9UsQJbH6h8gmLmL1COtnno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHKDcZTY; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHKDcZTY"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so170943a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888300; x=1789493100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8FraEq/yUb0r8EupXB8EQKm5xu56D8kJQlL77fVqVg=;
        b=lHKDcZTY75XgjqwrBA7iYcT6wCkkjfOsiVvsrHGjG59qAKE8vuh7DGwhxh8/YcUhYU
         6C9xwfdFUpM1Evwgy164d5QWO06/srMEgN4pp8eI0bSam7+FYjh+wolP/iE2Dzk3Bsd3
         iVmh3vWK6FjNcYqAcjtL7iLxPtOwAQMB/19M5xe3ZhMcsou3/SEqKhmSAFZPBqtrsbgV
         OmpYzOykbi1Bu8ubjsIKNrVnTHDng6CJ7Bmj4yuHm2YPMTzhPvduk1gdVmFrn8E0uRCg
         FJQUMcCCxjK7q/BPer3Y2dmPAKmah9r+QnIz+2dSJaNTg7PhkKvL1yUIvP8bNYPYS9P8
         SrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888300; x=1789493100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8FraEq/yUb0r8EupXB8EQKm5xu56D8kJQlL77fVqVg=;
        b=pqeTYT5SVqdoPrQfoQL/NMD/iHErqsy7E84L61Z/mPMCv/4htTw2/A5LUtso00CnC3
         22h5VnDtxbc0CoZFixsew3GZsAdwZDnb1f6pyIU2n7srBYkP4TsSnyqcuYSSThPTp9bf
         bORU7HpY6XcDuo3kX+kyKNoe0rB+2C/uV4xHctY1zSPoBV5WApVKO54PKrEcLKS7lK+V
         kBkcWp2ZxYWmOjw+9LO5MLRzO6afRM+QVmaWxlv+fcGwKCRMoN4GE4yCYwrIQY6cHgMy
         qWFRazdaFCf1EuJSrii2Kz0i4a1PthveS6aDWOw6wtlTlrsvg5umeQakDhGEiWjdGqe0
         Yh9A==
X-Forwarded-Encrypted: i=1; AKwUvByUmO2YCuZLPRXu+R5OT43rk8qPnRieGv2cAkoNNgN3PHC8+hW0DJNlqHkCE0NjrgFjkijlTeG2uPiGRFw=@vger.kernel.org
X-Gm-Message-State: AFuF++kWaUdsrmatSMck4KRlbYgyafanv4evuC/VL9cjVXBtz8qapKKL
	NtEnzJ+VE2rsbXGLWIQad2gMNwCS48fvaa/xt7fZT1Vkl/ekkDg+3wPi
X-Gm-Gg: AYBFou189BHY6LofNyRsk/2asL2pQ22X5JA9HhedoPHNcwCEexuwjtTd3DHlnQbkGHl
	7GYKIKvpmJOdruJJ08iCqNoUm4X1RDo/Cwmd6dFyOZFSUTGRkCjYsFbH8I2g5btOJzrryEaLk8l
	kvW86iy8KIreEtuif7MzR/ZNKpkEOMk7pEb60Qq+N+7hSh2hf/NbhrkqIbSiAOSLQciEr/3yyQp
	oZkftSKY0oIZlq1zOSIcdi4IPNwBcedZpCtqcG/VRofuusNlma7Qu96nSEMizHy49O/Vhk4J8LS
	kwAQFlMXcKAM4Fm1oYc+AZR1FzSLZbsXrK8Z1aA2Hd514nyFzAOZc1U9whQqFnmR0PZ/QNDfJf6
	DGoCoT9StSsbFjwWPZgWpnqXsklaPSorgltQyAm39Pp75cLxCbfpyZJLSfDe7vBRHE++D5muCEB
	3uYlSB0hACVfMO9UE3EaZNGd+vC8m+A+qzn07svqhpgqXecJLGeL1MB3Y3D/w=
X-Received: by 2002:a17:90b:270b:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39bac13b38dmr1363341a91.2.1788888299767;
        Tue, 08 Sep 2026 10:24:59 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:24:59 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 2/6] iio: adc: bcm_iproc_adc: fix include dependencies
Date: Tue,  8 Sep 2026 22:53:55 +0530
Message-ID: <20260908172359.30003-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Add the headers required directly by the driver for the APIs and
types it uses.

Remove the unused linux/io.h header now that register access is
handled through regmap APIs.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index e46e3761993a..21bd51da9cd6 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -3,14 +3,18 @@
  * Copyright 2016 Broadcom
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 
-- 
2.43.0

