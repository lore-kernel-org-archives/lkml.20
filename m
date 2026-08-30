Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6365D3BE630
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788109821; cv=none; b=XBDNv5D7GJtfFLbRnpqXvXXsEmkXxeqfmPj3OSoCdEjGN5Y2wxN2oAuKEmnD2kafljos57nVlZtss4qos5oSzvX2HoTmW9QMT3L94TatZR1d66ywNOv6c1K6u9U5AhmlaJRT+F0XVBMC6oQ+jVQT96u3iZCFSZMETc3f9QOhrEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788109821; c=relaxed/simple;
	bh=N0Wz03t8OH8ZGlAavGHko236gzmCzIVjxaLhAbD+UYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIe2s1IWv7Ce+kUsFxUJ/4umeYfRrVmT1cPTJ5fAb1FfJyQ2Wq8SVyQQ2TFYZK0qt04QVexMkLV9DecdEPxUbzTXg4Gvl09UIgZ8MWHwbC32LfMLdT4cUHU7R/b9Sfu1zAWJ4J0vFotiIqFJMCRFH1xv3wsppsSJs2yxf7NyvHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDczzemD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDczzemD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso761993a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788109820; x=1788714620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSXd07nmgAz6SThzdSSun0e/bFs1/0gaIblRruN5ApQ=;
        b=XDczzemDI8Q7T/ApymBR2tnf3jdTPR0jT1BQkUjmJLEfZqtE5oSq1Z2vkrFT7xh06W
         YVlsB+WWY0ftCNFzseYKtl3Lrd+4VtWkcnMd5EzFZ+LoQdxWyoRFKr7MNWar+PlmGORE
         +R33xsjBiTp/rwXaA6/JZvI87h7zWjMTs4Su2uejFu2b3Zqh8UW2MboVouQMEBFYXhjq
         H2V61LSLXfiE9ef+LbpwSwt/8sToV49+X0y6aN7J6jt353ef6fYRQ7c4p6T1ebbkS2a1
         b2TZTzd/gmorJdF9mBKsMgzmH8G1cuT3U5/wxDasIAStzu8u3Wqq0pnFqOzP4B/7iNwk
         +yBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109820; x=1788714620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSXd07nmgAz6SThzdSSun0e/bFs1/0gaIblRruN5ApQ=;
        b=TghrxsNE1sB0NTZGn1wTzJjCuVLsR3swU8MYwQ8luc98y1zSQOO3rEG4B73y1RiHf0
         F63x1Ja3mATKmBiGV0fIXGy5cREmbhdUQjcA+4xsRmG2qsHga5Eq24f6oJkItSNwGEfx
         +1EfIMgaC10PhIVbFl0K3gQnt+4VWZepIWmvOdtHtmlBSRetG73VmeOWpNGXsqKEB5N8
         dOJYf3pCVKMzpV6kVqjfQIYSXGVDoSco+31mXj63y+kHvAzv5r/S8IidRjdVrJ7nZr5Q
         4wWeiWK9VT1lgkAtdgc3g/LOJzCEoCV0EEgCdb76kcXEyMR3afej3n27sJ3SDVGDlrj7
         3a1A==
X-Forwarded-Encrypted: i=1; AKwUvByZfKcOvKipVq96avS5DQJFcuMyPoLXmN/QXiIBrz7SkShm58bjHSW29icry8HlOYMzz/YGsuO8r7xmECk=@vger.kernel.org
X-Gm-Message-State: AFuF++mswVGTyEUi3RkGs50ehKMZVqkhuB3xPSGEtFmZZINfMR0Tpqfx
	yt6Dy8e2O/X/xNZxfF7MbRy+ZzpV4IzrtSMnzteoLx0eiX6hlk5QTOdX
X-Gm-Gg: AYBFou32CK/6s1j7SN3qaj0oYVP6V54fgEw5d3A3ptsemgUwCJqdri1BeiXfzLT3ba4
	WeD+QoxK8IG5aWm5hwelj3eeVCah8Zx1xmraU//ezfoatEsr89hiOuBz84EPCgWwAsndgJylF/2
	OAKWbB6fZAHo2hrLPnkLXN4o1N0LmWcU1tiLZxDFGLWWraxPScz4GNqdbMVHQG7GboMTHSUZ1O6
	WfdmDImB+XB2oXWQftNATh3r8spji1q3XUVPndhoprnIiyFbakJe3/9G9EO0wPyHm0EP0eNdeWp
	mxPRcezaAOwUmF9OG4ilgJu/YSti32XOtzFEXn0Ia29eaTXUVvzXm73pkgidn3Pr7oVMiJ6mTpY
	rllI1AVjjkI67fVko7h1yHfkPvZorhoGxWwq52AC+ugz/+o0LaSVlQ/kZV3AIiGZQcmCYZwLd41
	coVtJbMmM+0rf6AUmlK0/sHwnNIijrj2iaxKS7d2zaFeau1eOg7jBZ0nRNsg==
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr35517294a91.2.1788109819698;
        Sun, 30 Aug 2026 10:10:19 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:88d5:45ce:40e:490f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm17047101a91.6.2026.08.30.10.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:10:19 -0700 (PDT)
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
Subject: [PATCH v2 2/5] iio: adc: bcm_iproc_adc: fix include dependencies
Date: Sun, 30 Aug 2026 22:39:15 +0530
Message-ID: <20260830170919.470974-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830170919.470974-1-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Add the headers required directly by the driver for completion and
mutex APIs.

Remove the unused `linux/io.h` header now that register access is
handled through regmap APIs.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index e46e3761993a..2b59819c4ca4 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -4,11 +4,12 @@
  */
 
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
 
-- 
2.43.0

